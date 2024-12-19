//------------------------------------------------------------------------------
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2019-2022 WAGO GmbH & Co. KG
//------------------------------------------------------------------------------
///------------------------------------------------------------------------------
///
/// \file    gesture_control_cap.c
///
/// \version $Id
///
/// \brief   gesture control capacitive, show toolbarmenu on swipe
///
/// \author  Wolfgang Rückl, elrest Automationssysteme GmbH
///------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// include files
//------------------------------------------------------------------------------

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <math.h>
#include <pthread.h>
#include <string.h>
#include <errno.h>
#include <fcntl.h>
#include <dirent.h>
#include <linux/input.h>
#include <linux/i2c.h>
#include <linux/i2c-dev.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/select.h>
#include <sys/file.h>
#include <sys/time.h>
#include <termios.h>
#include <signal.h>
#include <sys/poll.h>
#include <sys/ioctl.h>
#include <linux/fb.h>
#include <ctype.h>
#include <syslog.h>

#include "config_tool_lib.h"
#include "msgtool.h"

//------------------------------------------------------------------------------
// defines; structure, enumeration and type definitions
//------------------------------------------------------------------------------
#define GESTURE_ARRAY_SIZE     60
#define GESTURE_START_RANGE     4.50    //percent 
#define GESTURE_MOVE_LENGTH    10
#define MIN_START_RANGE        15

//DEBUG
//#define DEBUG_MSG

#define BITS_PER_LONG (sizeof(long) * 8)
#define NBITS(x) ((((x)-1)/BITS_PER_LONG)+1)
#define OFF(x)  ((x)%BITS_PER_LONG)
#define BIT(x)  (1UL<<OFF(x))
#define LONG(x) ((x)/BITS_PER_LONG)
#define test_bit(bit, array)	((array[LONG(bit)] >> OFF(bit)) & 1)

#define NAME_ELEMENT(element) [element] = #element

#define DISPLAY_ROTATION_ADDR   0x1F8

#define DEV_CAPTOUCH      "/dev/input/captouch"
#define DEV_TOOLBARMENU   "/dev/toolbarmenu"
#define PID_FILE          "/var/run/gesture_control.pid"

#define TEST_ABS_X    ABS_MT_POSITION_X
#define TEST_ABS_Y    ABS_MT_POSITION_Y

static const char * const absval[6] = { "Value", "Min  ", "Max  ", "Fuzz ", "Flat ", "Resolution "};

//#define MIN(a,b) (((a)<(b))?(a):(b))
//#define MAX(a,b) (((a)>(b))?(a):(b))

static const char EepromDevice[] = EEPROM_DEVICE;

static const char * const events[EV_MAX + 1] = {
	[0 ... EV_MAX] = NULL,
	NAME_ELEMENT(EV_SYN),			NAME_ELEMENT(EV_KEY),
	NAME_ELEMENT(EV_REL),			NAME_ELEMENT(EV_ABS),
	NAME_ELEMENT(EV_MSC),			NAME_ELEMENT(EV_LED),
	NAME_ELEMENT(EV_SND),			NAME_ELEMENT(EV_REP),
	NAME_ELEMENT(EV_FF),			NAME_ELEMENT(EV_PWR),
	NAME_ELEMENT(EV_FF_STATUS),		NAME_ELEMENT(EV_SW),
};


static struct timespec g_tLastOpenCmd;

/// data struct gesture recognizer
typedef struct GestureData
{
  int iGestureArraySize;
  int * px;
  int * py;
  int xindex, yindex;
  struct timespec timeLastEvent;
  int xMax, yMax;
  int iStartRange;
  int iMoveLength;
  int iOrientation;
  int xScreen, yScreen;
  unsigned char enabled;

} tGestureData;


/// axis
enum eAXIS
{
  AXIS_X,
  AXIS_Y,

  AXIS_END
};

//------------------------------------------------------------------------------
// function prototypes
//------------------------------------------------------------------------------

void AppendErrorText(int iStatusCode, char * pText);
int InitGestureData();

int SendOpenMenuCmd();
int CheckSwipePoints(int orientation);

int GetOrientationValue();
int ReadScreenSize();
int GetClearScreenActivity();

void EventListener();
int ReadInfoFromTouchDriver();

//------------------------------------------------------------------------------
// macros
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// variables’ and constants’ definitions
//------------------------------------------------------------------------------

static tGestureData g_gestureData;

//------------------------------------------------------------------------------
// function implementation
//------------------------------------------------------------------------------

/// \brief check if file exists
/// \param[in]  pFilename absolute file name
/// \retval -1 ERROR
/// \retval 0 SUCCESS
int fileexists(char * pFilename)
// Check if file is available
{
  struct stat sts;
  if (stat(pFilename, &sts) == -1 && errno == ENOENT)
  {
    return ERROR;
  }
  else
  {   
    return SUCCESS;
  }
}


/// \brief signal handler
///
/// \param[in]  sig  number
void handler (int sig)
{
#ifdef DEBUG_MSG
  printf ("\nexiting...(%d)\n", sig);
#endif
  exit (0);
}

/// \brief show perror text and exit program
///
/// \param[in]  error  text
void perror_exit (char *error)
{
  perror (error);
  handler (9);
}

/// \brief signal handler SIGTERM
///
/// \param[in]  foo  number
static inline void sig_handler_term(int foo)
{
  remove(PID_FILE);
#ifdef DEBUG_MSG
  printf("exit: sig_handler kill \n");
#endif
  exit(1);
}

/// \brief signal handler SIGINT
///
/// \param[in]  foo  number
static inline void sig_handler_int(int foo)
{
  remove(PID_FILE);
#ifdef DEBUG_MSG
  printf("exit: sig_handler ctrl-c \n");
#endif
  exit(1);
}

/// \brief Send cmd to webkit_browser
/// cmd: Open Menu
///
/// \retval -1 ERROR
/// \retval 0  SUCCESS
int SendOpenMenuCmd()
{
  int fd;
  struct timespec tsNow;
  int ret = -1;
  int iTimeDiffMs = 0;

  g_gestureData.xindex = 0;
  g_gestureData.yindex = 0;

#ifdef DEBUG_MSG
  printf("SendOpenMenuCmd\n");
#endif

  if (GetClearScreenActivity() == SUCCESS)
  {
    return ret;
  }

  clock_gettime(CLOCK_MONOTONIC, &tsNow);
  iTimeDiffMs = ((int)(tsNow.tv_sec * 1000) + (int)(tsNow.tv_nsec / 1000000)) - ((int)(
                           g_tLastOpenCmd.tv_sec * 1000) + (int)(g_tLastOpenCmd.tv_nsec / 1000000));

  if (iTimeDiffMs < 3000) {
    //do not open twice
    return ret;
  }

  if (fileexists(DEV_TOOLBARMENU) == SUCCESS)
  {
    fd = open(DEV_TOOLBARMENU, O_RDWR | O_NONBLOCK);
    if (fd >= 0)
    {
      char * pCmd = "open\n";
      write(fd, pCmd, strlen(pCmd));
      close(fd);
      clock_gettime(CLOCK_MONOTONIC, &g_tLastOpenCmd);
    }
  }
#ifdef DEBUG_MSG
  else
  {
    printf("%s not exists\n", DEV_TOOLBARMENU);    
  }
#endif  
  return ret;
}


/// \brief event listener
///
///
void EventListener()
{
  struct input_event ev[64];
  struct pollfd pollfds[8];
  char szName[256] = "Unknown";
  char szDevice[256] = "";
  int iRetVal, rd, size = sizeof (struct input_event);
  int fd;
  int i = 0, k, range;
  int timeDiffMs = 0;
  struct timespec timeNow;
  int n, num, pollincount;
  char updateDevices = 1;
  int iTouchDevice = -1;

  memset(&pollfds, 0x00, sizeof(pollfds));
  range = g_gestureData.iStartRange;
  unsigned char bListen = 1;

#ifdef DEBUG_MSG
  printf("range %d\n", range);
#endif

  //loop
  while (bListen)
  {
    //update input devices listening to
    if (updateDevices)
    {
      updateDevices = 0;
#ifdef DEBUG_MSG
      printf("UPDATE INPUT DEVICES\n");
#endif
      for (n=0; n < i; n++)
      {
        //close fd
        if (pollfds[n].fd > 0)
        {
          //printf("close pollfds[%d].fd %d\n", n, pollfds[n].fd);
          close(pollfds[n].fd);
          pollfds[n].fd = -1;
        }
      }

      i = 0;
      //Open Device
      strcpy(szDevice, DEV_CAPTOUCH);
      if ((fd = open (szDevice, O_RDONLY)) > 0)
      {
        //printf ("device %s open successful \n", device);
        pollfds[i].fd = fd;
        pollfds[i].events=POLL_IN;
        //Print Device Name
        ioctl (pollfds[i].fd, EVIOCGNAME (sizeof (szName)), szName);
        //printf ("Reading From : %s (%s)\n", device, name);
        iTouchDevice = i;
        i++;
      }
      else
      {
        char szErrorText[256];
        sprintf(szErrorText, "gesture_control: %s is not a vaild device", szDevice);
        setRgbLed(RGB_LED_STATE_RE_BLINK, szErrorText);
        SetLastError(szErrorText);
      }

      if (i == 0)
      {
        char szErrorText[256];
        sprintf(szErrorText, "gesture_control: no valid input device found");
        setRgbLed(RGB_LED_STATE_RE_BLINK, szErrorText);
        SetLastError(szErrorText);

        bListen = 0; //exit loop
      }

    }

    // wait for input
    iRetVal = poll(&pollfds, i, -1);
    //iRetVal = poll(&pollfds[0], i, 500); //timeout 500 [ms]
    if(iRetVal ==  -1)
    {
      //error
#ifdef DEBUG_MSG
      printf ("gesture_control poll error: errno %d \n", errno);
#endif
      usleep(500 * 1000);
      continue;
    }
    else if (iRetVal == 0)
    {
      //timeout
      usleep(100);
#ifdef DEBUG_MSG
      printf ("poll timeout\n");
#endif
      continue;
    }

    //printf("poll returns %d \n", iRetVal);
    //printf("->touch_thread_fkt wait \n");

    pollincount = 0;

    for (k=0; k < i; k++)
    {
      if(pollfds[k].revents & POLL_IN)
      {
        pollincount++;
        //printf("read (pollfds[%d]\n", k);
        if ((rd = read (pollfds[k].fd, ev, size * 64)) < size)
        {
          //data->thread_running = 0;
          //perror_exit ("read()");
          //printf ("listener thread poll read: rd %d errno %d \n", rd, errno);
          usleep(10);
        }
        else
        {
          num = rd / sizeof(struct input_event);
          if (num > 64)
            num = 64;

//#ifdef DEBUG_MSG
//          printf("%d ========= xindex: %d yindex: %d\n", num, g_gestureData.xindex, g_gestureData.yindex);
//#endif          

          

          //STARTPOINT
          //++++++++ gesture recognizing (swipe gesture) ++++++++
          if ((g_gestureData.enabled) && (k==iTouchDevice))
          {
            //#ifdef DEBUG_MSG
            //  printf("gesture recognizing %d\n", g_gestureData.iOrientation);
            //#endif

            clock_gettime(CLOCK_MONOTONIC, &timeNow);
            timeDiffMs = ((int)(timeNow.tv_sec * 1000) + (int)(timeNow.tv_nsec / 1000000)) - ((int)(
                           g_gestureData.timeLastEvent.tv_sec * 1000) + (int)(g_gestureData.timeLastEvent.tv_nsec / 1000000));
            if (timeDiffMs > 250)
            {
              //start point
              g_gestureData.xindex = 0;
              g_gestureData.yindex = 0;


              g_gestureData.px[g_gestureData.xindex] = ev[1].value;
              g_gestureData.py[g_gestureData.yindex] = ev[2].value;


              #ifdef DEBUG_MSG
                printf("STARTPOINT timediff: %d [ms], x: %d, y: %d\n", timeDiffMs, g_gestureData.px[g_gestureData.xindex], g_gestureData.py[g_gestureData.yindex]);
              #endif
            }


            for (n=0; n < num; n++)
            {

              if ( (ev[n].type == EV_ABS) && (ev[n].code == TEST_ABS_X) && (g_gestureData.xindex != -1) )
              {
                //#ifdef DEBUG_MSG
                //printf("X..... %d ev[%d].type  \t %04d\n", k, n, ev[n].type);
                //printf("X..... %d ev[%d].code  \t %04d\n", k, n, ev[n].code);
                //printf("X..... %d ev[%d].value \t %04d\n", g_gestureData.xindex, n, ev[n].value);
                //#endif

                if (g_gestureData.xindex < g_gestureData.iGestureArraySize -1)
                {
                  g_gestureData.xindex++;
                  g_gestureData.px[g_gestureData.xindex] = ev[n].value;
                }

              }
              else if ( (ev[n].type == EV_ABS) && (ev[n].code == TEST_ABS_Y) && (g_gestureData.yindex != -1) )
              {
                //printf("%d ========= xindex: %d yindex: %d value: %d\n", n, g_gestureData.xindex, g_gestureData.yindex, ev[n].value);
                //#ifdef DEBUG_MSG
                //printf("Y..... %d ev[%d].type  \t %04d\n", k, n, ev[n].type);
                //printf("Y..... %d ev[%d].code  \t %04d\n", k, n, ev[n].code);
                //printf("Y..... %d ev[%d].value \t %04d\n", g_gestureData.yindex, n, ev[n].value);
                //#endif

                if (g_gestureData.yindex < g_gestureData.iGestureArraySize -1)
                {
                  g_gestureData.yindex++;
                  g_gestureData.py[g_gestureData.yindex] = ev[n].value;
                }
              }
            }

            //#ifdef DEBUG_MSG
            //printf("%d ev[1].type  \t 0x%4x\n", k, ev[1].type);
            //printf("%d ev[1].code  \t 0x%4x\n", k, ev[1].code);
            //printf("%d ev[1].value \t 0x%4x\n", k, ev[1].value);
            
            //printf("%d ev[2].type  \t 0x%4x\n", k, ev[2].type);
            //printf("%d ev[2].code  \t 0x%4x\n", k, ev[2].code);
            //printf("%d ev[2].value \t 0x%4x\n", k, ev[2].value);
            //#endif

            //EV_KEY  1
            //BTN_TOUCH 0x14a
            if ((ev[0].code == BTN_TOUCH) && (ev[0].type == EV_KEY))
            {

              if (ev[0].value == 1)
              {
                //touch pressed
                #ifdef DEBUG_MSG
                  printf("===== touch pressed (start point) =====\n");
                #endif
              }
              else if (ev[0].value == 0)
              {
                //touch released
                #ifdef DEBUG_MSG
                  printf("----- touch released -----\n\n");
                #endif
              }
            }

            //event received
            clock_gettime(CLOCK_MONOTONIC, &g_gestureData.timeLastEvent);

            //EV_ABS  3
            //ABS_X   0
            //ABS_Y   1

            #ifdef DEBUG_MSG
            if (g_gestureData.yindex >= g_gestureData.iMoveLength) {
              printf("GESTURE recognizing %d\n", g_gestureData.iOrientation);
              int iii;
              for (iii=0; iii < g_gestureData.yindex; iii++)
              {
                printf("%02d x: %04d y: %04d\n", iii, g_gestureData.px[iii], g_gestureData.py[iii]);
              } 
            }
            #endif

            switch (g_gestureData.iOrientation)
            {
            case 0: //landscape
              
              if ((g_gestureData.yindex >= g_gestureData.iMoveLength) && (g_gestureData.py[1] <= range))
              {
                //if (g_gestureData.y[g_gestureData.index] >= g_gestureData.y[0] - (15))
                if (CheckSwipePoints(g_gestureData.iOrientation) == 0)
                {
                  //printf("break %d : %d \n", g_gestureData.y[g_gestureData.index], g_gestureData.y[0]);
                  break;
                }

                SendOpenMenuCmd();
              }


              break;

            case 1: //portrait
            
              if ((g_gestureData.xindex >= g_gestureData.iMoveLength) && ((g_gestureData.xMax - g_gestureData.px[1]) <= range))
              {
                //if (g_gestureData.x[g_gestureData.index] >= g_gestureData.x[0] - (15))
                if (CheckSwipePoints(g_gestureData.iOrientation) == 0)
                {
                  break;
                }

                SendOpenMenuCmd();
              }
              break;

            case 2: //landscape180
              if ((g_gestureData.yindex >= g_gestureData.iMoveLength) && (g_gestureData.yMax - g_gestureData.py[1] <= range))
              {

                //if (g_gestureData.y[g_gestureData.index] <= g_gestureData.y[0] + (15))
                if (CheckSwipePoints(g_gestureData.iOrientation) == 0)
                {
                  break;
                }

                SendOpenMenuCmd();
              }
              break;

            case 3: //portrait270
              if ((g_gestureData.xindex >= g_gestureData.iMoveLength) && (g_gestureData.px[1] <= range))
              {
                //if (g_gestureData.x[g_gestureData.index] <= g_gestureData.x[0] + (15))
                if (CheckSwipePoints(g_gestureData.iOrientation) == 0)
                {
                  //  printf("break %d : %d \n", g_gestureData.x[g_gestureData.index], g_gestureData.x[0]);
                  break;
                }

                SendOpenMenuCmd();
              }
              break;

            }
            
          }

          //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

        }
      }
    }

    if (pollincount == 0)
    {
      updateDevices = 1;
#ifdef DEBUG_MSG
      printf("poll input - update devices !\n");
#endif
    }

  } //while

  //cleanup
  for (n=0; n < i; n++)
  {
    //close fd
    if (pollfds[n].fd > 0)
    {
      //printf("close pollfds[%d].fd %d\n", n, pollfds[n].fd);
      close(pollfds[n].fd);
      pollfds[n].fd = -1;
    }
  }  

}


/// \brief main function
/// \param[in]  argc number of arguments
/// \param[in]  argv arguments
/// \retval 0  SUCCESS
int main(int argc, char *argv[])
{
  // Our process ID and Session ID
  pid_t pid, sid;

  int pid_file = open(PID_FILE, O_CREAT | O_RDWR, 0666);
  int rc = flock(pid_file, LOCK_EX | LOCK_NB);
  if(rc)
  {
    if(EWOULDBLOCK == errno)
    {
      printf("program is already running\n");
      exit(EXIT_FAILURE);
    }
  }
  else
  {
    //printf("this is the first instance\n");
  }


  // Fork off the parent process
  pid = fork();
  if (pid < 0)
  {
    exit(EXIT_FAILURE);
  }
  // If we got a good PID, then we can exit the parent process.
  if (pid > 0)
  {
    exit(EXIT_SUCCESS);
  }

  // Change the file mode mask
  umask(0);

  // Create a new SID for the child process
  sid = setsid();
  if (sid < 0)
  {
    exit(EXIT_FAILURE);
  }

  // Change the current working directory
  if ((chdir("/")) < 0)
  {
    exit(EXIT_FAILURE);
  }

  // Close out the standard file descriptors
  //#ifndef DEBUG_MSG
  //  close(STDIN_FILENO);
  //  close(STDOUT_FILENO);
  //  close(STDERR_FILENO);
  //#endif


  //int iServerId = -1;

  //hook in sighandler
  signal(SIGTERM, sig_handler_term); //killall
  signal(SIGINT, sig_handler_int);   //ctrl-c

  if ((getuid ()) != 0)
  {
    setRgbLed(RGB_LED_STATE_RE_BLINK, "Gesture control: You are not root! This may not work.");
    SetLastError("gesture_control: you are not root! This may not work.");
  }

  InitGestureData();

  // display orientation - rotation
  g_gestureData.iOrientation = GetOrientationValue();

  if ((g_gestureData.iOrientation < 0)||(g_gestureData.iOrientation > 3))
    g_gestureData.iOrientation = 0; 

  //loop listener
  EventListener();

  remove(PID_FILE);
  exit(EXIT_SUCCESS);
}

/// \brief Print error text to /tmp/last_error.txt
///
/// \param[in]  iStatusCode  code defined in eStatusCode config_tool_lib.h
/// \param[in]  pText        additional text
void AppendErrorText(int iStatusCode, char * pText)
{
  char szSub[128] = "";
  char szError[256] = "";
  GetErrorText(iStatusCode, szSub, sizeof(szSub));
  sprintf(szError, "error %s %s", szSub, pText);
  SetLastError(szError);
}

int ReplaceLine(tConfList * ptr, char * pNew)
{
  int state = ERROR;
  if (ptr->pStrLeft)
  {
    free(ptr->pStrLeft);
  }

  ptr->pStrLeft = (char*) malloc(strlen(pNew) + 1);
  if (ptr->pStrLeft)
  {
    strcpy(ptr->pStrLeft, pNew);
    state = SUCCESS;
  }

  return state;
}


/// \brief init gesture data
///
/// \retval  0 SUCCESS
/// \retval -1 ERROR
int InitGestureData()
{
  char szOut[256] = "";
  int arraysize, ret;

  tConfList * pListGesture = NULL;
  pListGesture = ConfCreateList();

  ret = ConfReadValues(pListGesture, GESTURE_CONF_FILE);
  if (ret != SUCCESS)
  {
    AppendErrorText(FILE_OPEN_ERROR, GESTURE_CONF_FILE);
    ConfDestroyList(pListGesture);
    return ERROR;
  }
  
  clock_gettime(CLOCK_MONOTONIC, &g_tLastOpenCmd);

  memset(&g_gestureData, 0x00, sizeof(g_gestureData));
  ReadScreenSize();

  //gesture data
  if (ConfGetValue(pListGesture, "state", szOut, sizeof(szOut)) == SUCCESS)
  {
    if (stricmp(szOut, "enabled") == 0)
    {
      if (ConfGetValue(pListGesture, "menu", szOut, sizeof(szOut)) == SUCCESS)
      {
        if (stricmp(szOut, "yes") == 0)
        {
          g_gestureData.enabled = 1;
          //printf("gesture enabled\n");
        }
      }
    }
  }
  
  g_gestureData.iMoveLength = GESTURE_MOVE_LENGTH;
  
  if (ConfGetValue(pListGesture, "movelength", szOut, sizeof(szOut)) == SUCCESS)
  {
    //Startpunkt der Wischgeste (in welchem Bereich der Startpunkt liegen muss - raw value)
    if (ConfIsNumber(szOut) == SUCCESS)
    {
      g_gestureData.iMoveLength = atoi(szOut);
    }
  }

  //printf("g_gestureData.iMoveLength %d\n", g_gestureData.iMoveLength);

  g_gestureData.iGestureArraySize = GESTURE_ARRAY_SIZE;
  if (ConfGetValue(pListGesture, "arraysize", szOut, sizeof(szOut)) == SUCCESS)
  {
    //Startpunkt der Wischgeste (in welchem Bereich der Startpunkt liegen muss - raw value)
    if (ConfIsNumber(szOut) == SUCCESS)
    {
      g_gestureData.iGestureArraySize = atoi(szOut);
      if (g_gestureData.iGestureArraySize > 1000)
      {
        g_gestureData.iGestureArraySize = 1000;
      }
      else if (g_gestureData.iGestureArraySize < 30)
      {
        g_gestureData.iGestureArraySize = 30;
      }
    }
  }

  //printf("g_gestureData.iGestureArraySize %d\n", g_gestureData.iGestureArraySize);

  arraysize = sizeof(int) * g_gestureData.iGestureArraySize;

  g_gestureData.px = (int*) malloc(arraysize);
  if (g_gestureData.px)
    memset(g_gestureData.px, 0x00, arraysize);

  g_gestureData.py = (int*) malloc(arraysize);
  if (g_gestureData.py)
    memset(g_gestureData.py, 0x00, arraysize);

  //defaults
  //g_gestureData.xMax = 4095;
  //g_gestureData.yMax = 4095;
  
  //7"
  g_gestureData.xMax = 1023;
  g_gestureData.yMax = 767;
  
  //read xMax and yMax from Touchdriver
  ReadInfoFromTouchDriver();
  
  //range from top downwards to detect the beginning of a swipe gesture
  if (ConfGetValue(pListGesture, "startrange_cap", szOut, sizeof(szOut)) == SUCCESS)
  {
    //Startpunkt der Wischgeste (in welchem Bereich der Startpunkt liegen muss - raw value)
    double dPercent = atof(szOut);
    g_gestureData.iStartRange = MAX(MIN_START_RANGE, g_gestureData.yMax * dPercent / 100); 
  }
  else
  {
    g_gestureData.iStartRange = MAX(MIN_START_RANGE, g_gestureData.yMax * GESTURE_START_RANGE / 100); 
  }
  
  openlog("gesture_control", LOG_NDELAY, LOG_DAEMON);
  syslog(LOG_INFO, "xMax %d yMax %d startrange %d\n", g_gestureData.xMax, g_gestureData.yMax, g_gestureData.iStartRange);
  closelog();

  ConfDestroyList(pListGesture);
  return SUCCESS;
}


/// \brief detect swipe gestures
///
/// \param[in] orientation  display orientation / rotation
/// \retval 1 swipe gesture detected
/// \retval 0 no swipe gesture detected
int CheckSwipePoints(int orientation)
{
  int nTrend = 0;
  int i;
  int iMin;
  int iMax;

  #ifdef DEBUG_MSG
    printf("CheckSwipePoints %d\n", orientation);
  #endif

  switch (orientation)
  {
  case 0: //landscape
    iMin = g_gestureData.py[1];
    for (i=1; i < g_gestureData.yindex; i++)
    {
      if (g_gestureData.py[i-1] < g_gestureData.py[i])
      {
        if (g_gestureData.py[i] > iMin)
        {
          iMin = g_gestureData.py[i];
          //printf(" %d ", iMin);
          nTrend++;
          //points += (g_gestureData.y[i-1] - g_gestureData.y[i]);
        }
      }
    }
    break;

  case 1: //portrait
    //if (g_gestureData.x[g_gestureData.index] >= g_gestureData.x[0] - (15))
    iMin = g_gestureData.xMax - g_gestureData.px[1];
    for (i=1; i < g_gestureData.xindex; i++)
    {
      if (g_gestureData.xMax - g_gestureData.px[i] > g_gestureData.xMax - g_gestureData.px[i-1])
      {
        if (g_gestureData.xMax - g_gestureData.px[i] > iMin)
        {
          iMin = g_gestureData.xMax - g_gestureData.px[i];
          nTrend++;
        }
      }
    }
    break;

  case 2: //landscape180
    //if (g_gestureData.y[g_gestureData.index] <= g_gestureData.y[0] + (15))
    iMax = g_gestureData.yMax - g_gestureData.py[1];
    for (i=1; i < g_gestureData.yindex; i++)
    {
      if (g_gestureData.yMax - g_gestureData.py[i] > g_gestureData.yMax - g_gestureData.py[i-1])
      {
        if (g_gestureData.yMax - g_gestureData.py[i] > iMax)
        {
          iMax = g_gestureData.yMax - g_gestureData.py[i];
          nTrend++;
        }
      }
    }
    break;

  case 3: //portrait270
    //if (g_gestureData.x[g_gestureData.index] <= g_gestureData.x[0] + (15))
    iMin = g_gestureData.px[1];
    for (i=1; i < g_gestureData.xindex; i++)
    {
      if (g_gestureData.px[i-1] < g_gestureData.px[i])
      {
        if (g_gestureData.px[i] > iMin)
        {
          iMin = g_gestureData.px[i];
          //printf(" %d ", iMin);
          nTrend++;
          //points += (g_gestureData.y[i-1] - g_gestureData.y[i]);
        }
      }
    }
    break;
  }

  if (nTrend > g_gestureData.iMoveLength)
  {
    //trend decreasing
    #ifdef DEBUG_MSG
      printf("SUCCESS -> nTrend %d\n", nTrend);
    #endif
    return 1;
  }
  else
  {
    //trend not decreasing
    #ifdef DEBUG_MSG
      printf("break -> nTrend %d\n", nTrend);
    #endif
    return 0;
  }

}

/// \brief Read if clear_screen is active at this moment
///
/// The function returns the current clear_screen activity
///
/// \retval  0 clear_screen is running
/// \retval -1 clear_screen is not running
int GetClearScreenActivity()
{
  int status = ERROR;
  if (system("/bin/pidof clear_screen > /dev/null 2>&1") == 0)
  {
    status = SUCCESS;
  }
  return status;
}

//------------------------------------------------------------------------------
/// Read data from EEPROM
///
/// \param fd           eeprom file descriptor
/// \param iMemAddress  eeprom memory address
/// \param cData        pointer to output data buffer
/// \param usDataCnt    count of data bytes to be read
///
/// \return  0 SUCCESS
/// \return -1 ERROR
//------------------------------------------------------------------------------
int ReadBlock(int fd, unsigned int iMemAddress, char *cData, unsigned short usDataCnt)
{
  if (lseek(fd, iMemAddress, SEEK_SET) < 0)
  {
    printf("lseek failed \n");
    return -1;
  }

  if( (read(fd, cData, usDataCnt)) < 0 )
  {
    printf("eeprom read block failed \n");
    return -1;
  }

  return 0;
}

/// open eeprom device
///
/// \param void
///
/// \return fd eeprom file descriptor
/// \return -1 ERROR
//------------------------------------------------------------------------------
int eeprom_open(void)
{
  int fd;

  fd = open(EepromDevice, O_RDWR);
  if(fd == -1)
  {
    printf("open device %s failed \n", EepromDevice);
  }

  return fd;
}

/// \brief read display orientation from EEPROM
///
/// \retval -1 ERROR
/// \retval 0  landscape
/// \retval 1  portrait
/// \retval 2  landscape 180°
/// \retval 3  portrait 270°
int GetOrientationValue()
{
  int ret = ERROR;
  int i2c_fd;
  char cTempBuf[6];

  char szErrorTxt[256] = "";

  i2c_fd = eeprom_open();
  if (i2c_fd >= 0)
  {
    if (ReadBlock(i2c_fd, (unsigned int) DISPLAY_ROTATION_ADDR, cTempBuf, 1) >= 0)
    {
      ret = cTempBuf[0];
    }
    else
    {
      sprintf(szErrorTxt, "Could not read EEPROM (display rotation)");
      setRgbLed(RGB_LED_STATE_RE_BLINK, szErrorTxt);
      SetLastError(szErrorTxt);
    }
    close(i2c_fd);
  }
  else
  {
    sprintf(szErrorTxt, "Could not open EEPROM (display rotation)");
    setRgbLed(RGB_LED_STATE_RE_BLINK, szErrorTxt);
    SetLastError(szErrorTxt);
  }
  
  #ifdef DEBUG_MSG
      printf("Orientation: %d\n", ret);
  #endif

  return ret;
}

int ReadScreenSize()
{
  struct fb_var_screeninfo var;
  int fb_fd=0;
  int iOrientation;

  char *defaultfbdevice = "/dev/fb0";
  char *fbdevice = NULL;

  if ((fbdevice = getenv ("TSLIB_FBDEVICE")) == NULL)
    fbdevice = defaultfbdevice;

  fb_fd = open(fbdevice, O_RDWR);
  if (fb_fd == -1)
  {
    perror("open fbdevice");
    return -1;
  }

  if (ioctl(fb_fd, FBIOGET_VSCREENINFO, &var) < 0)
  {
    perror("ioctl FBIOGET_VSCREENINFO");
    close(fb_fd);
    return -1;
  }

  iOrientation = GetOrientationValue();

  if ((iOrientation < 0)||(iOrientation > 3))
    iOrientation = 0;

  if (iOrientation != ERROR)
  {
    if ((iOrientation == 1) || (iOrientation == 3))
    {
      //portrait
      g_gestureData.xScreen = var.yres;
      g_gestureData.yScreen = var.xres;
    }
    else
    {
      //landscape
      g_gestureData.xScreen = var.xres;
      g_gestureData.yScreen = var.yres;
    }
  }

  #ifdef DEBUG_MSG
    printf("Screensize x: %d y: %d\n", g_gestureData.xScreen, g_gestureData.yScreen);
  #endif

  close(fb_fd);
  
  return SUCCESS;
}


/// \brief Read infos for absolute axes min/max
///
/// \retval -1 ERROR
/// \retval 0  SUCCESS
int ReadInfoFromTouchDriver()
{
  int retval = ERROR;
  unsigned long bit[EV_MAX][NBITS(KEY_MAX)];
  int abs[6] = {0};
  int i,j,k,fd;

  if ((fd = open(DEV_CAPTOUCH, O_RDONLY)) >= 0) 
  {
    
    memset(bit, 0, sizeof(bit));
    ioctl(fd, EVIOCGBIT(0, EV_MAX), bit[0]);
    //printf("Supported events:\n");

    for (i = 0; i < EV_MAX; i++)
    {
      if (test_bit(i, bit[0]) && i != EV_REP) 
      {
        //printf("  Event type %d (%s)\n", i, events[i] ? events[i] : "?");
        if (!i) continue;
        ioctl(fd, EVIOCGBIT(i, KEY_MAX), bit[i]);
        for (j = 0; j < KEY_MAX; j++)
        {
          if (test_bit(j, bit[i])) 
          {
            //printf("    Event code %d (%s)\n", j, names[i] ? (names[i][j] ? names[i][j] : "?") : "?");
            if (i == EV_ABS)
            {
              //print_absdata(fd, j);
              ioctl(fd, EVIOCGABS(j), abs);
              //get Max value
              k = 2;              
              
              if (j == ABS_MT_POSITION_X)
              {
                g_gestureData.xMax = abs[k];
                //printf("ABS_MT_POSITION_X === %s %6d\n", absval[k], abs[k]);
              }
              else if (j == ABS_MT_POSITION_Y)
              {
                g_gestureData.yMax = abs[k];
                //printf("ABS_MT_POSITION_Y === %s %6d\n", absval[k], abs[k]);
              }
              
              retval = SUCCESS;
            }
          }
        }
      }
    }

    close(fd);
  }
  
  return retval;
}
