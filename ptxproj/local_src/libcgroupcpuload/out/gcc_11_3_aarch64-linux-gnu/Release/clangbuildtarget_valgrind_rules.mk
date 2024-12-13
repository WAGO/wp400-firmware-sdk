### generated targets ###
.PHONY: valgrind-target
.PHONY: valgrind-target-loadcompare.elf
.PHONY: valgrind-target-checkcpu.elf
.PHONY: valgrind-target-cpuload.elf
.PHONY: valgrind-target-bellysmile.elf
.PHONY: valgrind-target-testapp.elf
.PHONY: valgrind-target-cpuloadmonitor.elf
.PHONY: valgrind-target-alltests_test.elf

.PHONY: nulgrind-target
.PHONY: nulgrind-target-loadcompare.elf
.PHONY: nulgrind-target-checkcpu.elf
.PHONY: nulgrind-target-cpuload.elf
.PHONY: nulgrind-target-bellysmile.elf
.PHONY: nulgrind-target-testapp.elf
.PHONY: nulgrind-target-cpuloadmonitor.elf
.PHONY: nulgrind-target-alltests_test.elf

.PHONY: memcheck-target
.PHONY: memcheck-target-loadcompare.elf
.PHONY: memcheck-target-checkcpu.elf
.PHONY: memcheck-target-cpuload.elf
.PHONY: memcheck-target-bellysmile.elf
.PHONY: memcheck-target-testapp.elf
.PHONY: memcheck-target-cpuloadmonitor.elf
.PHONY: memcheck-target-alltests_test.elf

.PHONY: helgrind-target
.PHONY: helgrind-target-loadcompare.elf
.PHONY: helgrind-target-checkcpu.elf
.PHONY: helgrind-target-cpuload.elf
.PHONY: helgrind-target-bellysmile.elf
.PHONY: helgrind-target-testapp.elf
.PHONY: helgrind-target-cpuloadmonitor.elf
.PHONY: helgrind-target-alltests_test.elf

.PHONY: callgrind-target
.PHONY: callgrind-target-loadcompare.elf
.PHONY: callgrind-target-checkcpu.elf
.PHONY: callgrind-target-cpuload.elf
.PHONY: callgrind-target-bellysmile.elf
.PHONY: callgrind-target-testapp.elf
.PHONY: callgrind-target-cpuloadmonitor.elf
.PHONY: callgrind-target-alltests_test.elf

.PHONY: cachegrind-target
.PHONY: cachegrind-target-loadcompare.elf
.PHONY: cachegrind-target-checkcpu.elf
.PHONY: cachegrind-target-cpuload.elf
.PHONY: cachegrind-target-bellysmile.elf
.PHONY: cachegrind-target-testapp.elf
.PHONY: cachegrind-target-cpuloadmonitor.elf
.PHONY: cachegrind-target-alltests_test.elf

.PHONY: massif-target
.PHONY: massif-target-loadcompare.elf
.PHONY: massif-target-checkcpu.elf
.PHONY: massif-target-cpuload.elf
.PHONY: massif-target-bellysmile.elf
.PHONY: massif-target-testapp.elf
.PHONY: massif-target-cpuloadmonitor.elf
.PHONY: massif-target-alltests_test.elf

.PHONY: drd-target
.PHONY: drd-target-loadcompare.elf
.PHONY: drd-target-checkcpu.elf
.PHONY: drd-target-cpuload.elf
.PHONY: drd-target-bellysmile.elf
.PHONY: drd-target-testapp.elf
.PHONY: drd-target-cpuloadmonitor.elf
.PHONY: drd-target-alltests_test.elf

### valgrind-target ###
valgrind-target: $(VG_LOCAL_VALGRIND)
valgrind-target: memcheck-target helgrind-target
valgrind-target-loadcompare.elf: memcheck-target-loadcompare.elf helgrind-target-loadcompare.elf
valgrind-target-checkcpu.elf: memcheck-target-checkcpu.elf helgrind-target-checkcpu.elf
valgrind-target-cpuload.elf: memcheck-target-cpuload.elf helgrind-target-cpuload.elf
valgrind-target-bellysmile.elf: memcheck-target-bellysmile.elf helgrind-target-bellysmile.elf
valgrind-target-testapp.elf: memcheck-target-testapp.elf helgrind-target-testapp.elf
valgrind-target-cpuloadmonitor.elf: memcheck-target-cpuloadmonitor.elf helgrind-target-cpuloadmonitor.elf
valgrind-target-alltests_test.elf: memcheck-target-alltests_test.elf helgrind-target-alltests_test.elf

### nulgrind-target ###

NULGRIND_TARGET_TARGETS += nulgrind-target-alltests_test.elf

nulgrind-target-loadcompare.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(loadcompare.elf_VALGRIND_FLAGS)        $(NULGRIND_FLAGS)        $(loadcompare.elf_NULGRIND_FLAGS) $(call valgrind_xml_flags,loadcompare.elf,NULGRIND)
nulgrind-target-loadcompare.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(loadcompare.elf_VALGRIND_TARGET_FLAGS) $(NULGRIND_TARGET_FLAGS) $(loadcompare.elf_NULGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
nulgrind-target-loadcompare.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
nulgrind-target-loadcompare.elf: VALGRIND_TARGET_EXECUTABLE=loadcompare.elf
nulgrind-target-loadcompare.elf: VG_TOOL=nulgrind
nulgrind-target-loadcompare.elf: $(BIN_DIR)/loadcompare.elf $(VALGRIND)
nulgrind-target-loadcompare.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
nulgrind-target-loadcompare.elf:
	$(call vg-version)
	$(call vg-caller)

nulgrind-target-checkcpu.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(checkcpu.elf_VALGRIND_FLAGS)        $(NULGRIND_FLAGS)        $(checkcpu.elf_NULGRIND_FLAGS) $(call valgrind_xml_flags,checkcpu.elf,NULGRIND)
nulgrind-target-checkcpu.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(checkcpu.elf_VALGRIND_TARGET_FLAGS) $(NULGRIND_TARGET_FLAGS) $(checkcpu.elf_NULGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
nulgrind-target-checkcpu.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
nulgrind-target-checkcpu.elf: VALGRIND_TARGET_EXECUTABLE=checkcpu.elf
nulgrind-target-checkcpu.elf: VG_TOOL=nulgrind
nulgrind-target-checkcpu.elf: $(BIN_DIR)/checkcpu.elf $(VALGRIND)
nulgrind-target-checkcpu.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
nulgrind-target-checkcpu.elf:
	$(call vg-version)
	$(call vg-caller)

nulgrind-target-cpuload.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(cpuload.elf_VALGRIND_FLAGS)        $(NULGRIND_FLAGS)        $(cpuload.elf_NULGRIND_FLAGS) $(call valgrind_xml_flags,cpuload.elf,NULGRIND)
nulgrind-target-cpuload.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(cpuload.elf_VALGRIND_TARGET_FLAGS) $(NULGRIND_TARGET_FLAGS) $(cpuload.elf_NULGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
nulgrind-target-cpuload.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
nulgrind-target-cpuload.elf: VALGRIND_TARGET_EXECUTABLE=cpuload.elf
nulgrind-target-cpuload.elf: VG_TOOL=nulgrind
nulgrind-target-cpuload.elf: $(BIN_DIR)/cpuload.elf $(VALGRIND)
nulgrind-target-cpuload.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
nulgrind-target-cpuload.elf:
	$(call vg-version)
	$(call vg-caller)

nulgrind-target-bellysmile.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(bellysmile.elf_VALGRIND_FLAGS)        $(NULGRIND_FLAGS)        $(bellysmile.elf_NULGRIND_FLAGS) $(call valgrind_xml_flags,bellysmile.elf,NULGRIND)
nulgrind-target-bellysmile.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(bellysmile.elf_VALGRIND_TARGET_FLAGS) $(NULGRIND_TARGET_FLAGS) $(bellysmile.elf_NULGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
nulgrind-target-bellysmile.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
nulgrind-target-bellysmile.elf: VALGRIND_TARGET_EXECUTABLE=bellysmile.elf
nulgrind-target-bellysmile.elf: VG_TOOL=nulgrind
nulgrind-target-bellysmile.elf: $(BIN_DIR)/bellysmile.elf $(VALGRIND)
nulgrind-target-bellysmile.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
nulgrind-target-bellysmile.elf:
	$(call vg-version)
	$(call vg-caller)

nulgrind-target-testapp.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(testapp.elf_VALGRIND_FLAGS)        $(NULGRIND_FLAGS)        $(testapp.elf_NULGRIND_FLAGS) $(call valgrind_xml_flags,testapp.elf,NULGRIND)
nulgrind-target-testapp.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(testapp.elf_VALGRIND_TARGET_FLAGS) $(NULGRIND_TARGET_FLAGS) $(testapp.elf_NULGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
nulgrind-target-testapp.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
nulgrind-target-testapp.elf: VALGRIND_TARGET_EXECUTABLE=testapp.elf
nulgrind-target-testapp.elf: VG_TOOL=nulgrind
nulgrind-target-testapp.elf: $(BIN_DIR)/testapp.elf $(VALGRIND)
nulgrind-target-testapp.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
nulgrind-target-testapp.elf:
	$(call vg-version)
	$(call vg-caller)

nulgrind-target-cpuloadmonitor.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(cpuloadmonitor.elf_VALGRIND_FLAGS)        $(NULGRIND_FLAGS)        $(cpuloadmonitor.elf_NULGRIND_FLAGS) $(call valgrind_xml_flags,cpuloadmonitor.elf,NULGRIND)
nulgrind-target-cpuloadmonitor.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(cpuloadmonitor.elf_VALGRIND_TARGET_FLAGS) $(NULGRIND_TARGET_FLAGS) $(cpuloadmonitor.elf_NULGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
nulgrind-target-cpuloadmonitor.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
nulgrind-target-cpuloadmonitor.elf: VALGRIND_TARGET_EXECUTABLE=cpuloadmonitor.elf
nulgrind-target-cpuloadmonitor.elf: VG_TOOL=nulgrind
nulgrind-target-cpuloadmonitor.elf: $(BIN_DIR)/cpuloadmonitor.elf $(VALGRIND)
nulgrind-target-cpuloadmonitor.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
nulgrind-target-cpuloadmonitor.elf:
	$(call vg-version)
	$(call vg-caller)

nulgrind-target-alltests_test.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(alltests_test.elf_VALGRIND_FLAGS)        $(NULGRIND_FLAGS)        $(alltests_test.elf_NULGRIND_FLAGS) $(call valgrind_xml_flags,alltests_test.elf,NULGRIND)
nulgrind-target-alltests_test.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(alltests_test.elf_VALGRIND_TARGET_FLAGS) $(NULGRIND_TARGET_FLAGS) $(alltests_test.elf_NULGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
nulgrind-target-alltests_test.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
nulgrind-target-alltests_test.elf: VALGRIND_TARGET_EXECUTABLE=alltests_test.elf
nulgrind-target-alltests_test.elf: VG_TOOL=nulgrind
nulgrind-target-alltests_test.elf: $(BIN_DIR)/alltests_test.elf $(VALGRIND)
nulgrind-target-alltests_test.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
nulgrind-target-alltests_test.elf:
	$(call vg-version)
	$(call vg-caller)


nulgrind-target: $(VG_LOCAL_VALGRIND) $(NULGRIND_TARGET_TARGETS)
$(NULGRIND_TARGET_TARGETS): $(SYNC_SETTINGS_MK_TMP)

### memcheck-target ###

MEMCHECK_TARGET_TARGETS += memcheck-target-alltests_test.elf

memcheck-target-loadcompare.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(loadcompare.elf_VALGRIND_FLAGS)        $(MEMCHECK_FLAGS)        $(loadcompare.elf_MEMCHECK_FLAGS) $(call valgrind_xml_flags,loadcompare.elf,MEMCHECK)
memcheck-target-loadcompare.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(loadcompare.elf_VALGRIND_TARGET_FLAGS) $(MEMCHECK_TARGET_FLAGS) $(loadcompare.elf_MEMCHECK_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
memcheck-target-loadcompare.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
memcheck-target-loadcompare.elf: VALGRIND_TARGET_EXECUTABLE=loadcompare.elf
memcheck-target-loadcompare.elf: VG_TOOL=memcheck
memcheck-target-loadcompare.elf: $(BIN_DIR)/loadcompare.elf $(VALGRIND)
memcheck-target-loadcompare.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
memcheck-target-loadcompare.elf:
	$(call vg-version)
	$(call vg-caller)

memcheck-target-checkcpu.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(checkcpu.elf_VALGRIND_FLAGS)        $(MEMCHECK_FLAGS)        $(checkcpu.elf_MEMCHECK_FLAGS) $(call valgrind_xml_flags,checkcpu.elf,MEMCHECK)
memcheck-target-checkcpu.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(checkcpu.elf_VALGRIND_TARGET_FLAGS) $(MEMCHECK_TARGET_FLAGS) $(checkcpu.elf_MEMCHECK_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
memcheck-target-checkcpu.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
memcheck-target-checkcpu.elf: VALGRIND_TARGET_EXECUTABLE=checkcpu.elf
memcheck-target-checkcpu.elf: VG_TOOL=memcheck
memcheck-target-checkcpu.elf: $(BIN_DIR)/checkcpu.elf $(VALGRIND)
memcheck-target-checkcpu.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
memcheck-target-checkcpu.elf:
	$(call vg-version)
	$(call vg-caller)

memcheck-target-cpuload.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(cpuload.elf_VALGRIND_FLAGS)        $(MEMCHECK_FLAGS)        $(cpuload.elf_MEMCHECK_FLAGS) $(call valgrind_xml_flags,cpuload.elf,MEMCHECK)
memcheck-target-cpuload.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(cpuload.elf_VALGRIND_TARGET_FLAGS) $(MEMCHECK_TARGET_FLAGS) $(cpuload.elf_MEMCHECK_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
memcheck-target-cpuload.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
memcheck-target-cpuload.elf: VALGRIND_TARGET_EXECUTABLE=cpuload.elf
memcheck-target-cpuload.elf: VG_TOOL=memcheck
memcheck-target-cpuload.elf: $(BIN_DIR)/cpuload.elf $(VALGRIND)
memcheck-target-cpuload.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
memcheck-target-cpuload.elf:
	$(call vg-version)
	$(call vg-caller)

memcheck-target-bellysmile.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(bellysmile.elf_VALGRIND_FLAGS)        $(MEMCHECK_FLAGS)        $(bellysmile.elf_MEMCHECK_FLAGS) $(call valgrind_xml_flags,bellysmile.elf,MEMCHECK)
memcheck-target-bellysmile.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(bellysmile.elf_VALGRIND_TARGET_FLAGS) $(MEMCHECK_TARGET_FLAGS) $(bellysmile.elf_MEMCHECK_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
memcheck-target-bellysmile.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
memcheck-target-bellysmile.elf: VALGRIND_TARGET_EXECUTABLE=bellysmile.elf
memcheck-target-bellysmile.elf: VG_TOOL=memcheck
memcheck-target-bellysmile.elf: $(BIN_DIR)/bellysmile.elf $(VALGRIND)
memcheck-target-bellysmile.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
memcheck-target-bellysmile.elf:
	$(call vg-version)
	$(call vg-caller)

memcheck-target-testapp.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(testapp.elf_VALGRIND_FLAGS)        $(MEMCHECK_FLAGS)        $(testapp.elf_MEMCHECK_FLAGS) $(call valgrind_xml_flags,testapp.elf,MEMCHECK)
memcheck-target-testapp.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(testapp.elf_VALGRIND_TARGET_FLAGS) $(MEMCHECK_TARGET_FLAGS) $(testapp.elf_MEMCHECK_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
memcheck-target-testapp.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
memcheck-target-testapp.elf: VALGRIND_TARGET_EXECUTABLE=testapp.elf
memcheck-target-testapp.elf: VG_TOOL=memcheck
memcheck-target-testapp.elf: $(BIN_DIR)/testapp.elf $(VALGRIND)
memcheck-target-testapp.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
memcheck-target-testapp.elf:
	$(call vg-version)
	$(call vg-caller)

memcheck-target-cpuloadmonitor.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(cpuloadmonitor.elf_VALGRIND_FLAGS)        $(MEMCHECK_FLAGS)        $(cpuloadmonitor.elf_MEMCHECK_FLAGS) $(call valgrind_xml_flags,cpuloadmonitor.elf,MEMCHECK)
memcheck-target-cpuloadmonitor.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(cpuloadmonitor.elf_VALGRIND_TARGET_FLAGS) $(MEMCHECK_TARGET_FLAGS) $(cpuloadmonitor.elf_MEMCHECK_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
memcheck-target-cpuloadmonitor.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
memcheck-target-cpuloadmonitor.elf: VALGRIND_TARGET_EXECUTABLE=cpuloadmonitor.elf
memcheck-target-cpuloadmonitor.elf: VG_TOOL=memcheck
memcheck-target-cpuloadmonitor.elf: $(BIN_DIR)/cpuloadmonitor.elf $(VALGRIND)
memcheck-target-cpuloadmonitor.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
memcheck-target-cpuloadmonitor.elf:
	$(call vg-version)
	$(call vg-caller)

memcheck-target-alltests_test.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(alltests_test.elf_VALGRIND_FLAGS)        $(MEMCHECK_FLAGS)        $(alltests_test.elf_MEMCHECK_FLAGS) $(call valgrind_xml_flags,alltests_test.elf,MEMCHECK)
memcheck-target-alltests_test.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(alltests_test.elf_VALGRIND_TARGET_FLAGS) $(MEMCHECK_TARGET_FLAGS) $(alltests_test.elf_MEMCHECK_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
memcheck-target-alltests_test.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
memcheck-target-alltests_test.elf: VALGRIND_TARGET_EXECUTABLE=alltests_test.elf
memcheck-target-alltests_test.elf: VG_TOOL=memcheck
memcheck-target-alltests_test.elf: $(BIN_DIR)/alltests_test.elf $(VALGRIND)
memcheck-target-alltests_test.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
memcheck-target-alltests_test.elf:
	$(call vg-version)
	$(call vg-caller)


memcheck-target: $(VG_LOCAL_VALGRIND) $(MEMCHECK_TARGET_TARGETS)
$(MEMCHECK_TARGET_TARGETS): $(SYNC_SETTINGS_MK_TMP)

### helgrind-target ###

HELGRIND_TARGET_TARGETS += helgrind-target-alltests_test.elf

helgrind-target-loadcompare.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(loadcompare.elf_VALGRIND_FLAGS)        $(HELGRIND_FLAGS)        $(loadcompare.elf_HELGRIND_FLAGS) $(call valgrind_xml_flags,loadcompare.elf,HELGRIND)
helgrind-target-loadcompare.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(loadcompare.elf_VALGRIND_TARGET_FLAGS) $(HELGRIND_TARGET_FLAGS) $(loadcompare.elf_HELGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
helgrind-target-loadcompare.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
helgrind-target-loadcompare.elf: VALGRIND_TARGET_EXECUTABLE=loadcompare.elf
helgrind-target-loadcompare.elf: VG_TOOL=helgrind
helgrind-target-loadcompare.elf: $(BIN_DIR)/loadcompare.elf $(VALGRIND)
helgrind-target-loadcompare.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
helgrind-target-loadcompare.elf:
	$(call vg-version)
	$(call vg-caller)

helgrind-target-checkcpu.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(checkcpu.elf_VALGRIND_FLAGS)        $(HELGRIND_FLAGS)        $(checkcpu.elf_HELGRIND_FLAGS) $(call valgrind_xml_flags,checkcpu.elf,HELGRIND)
helgrind-target-checkcpu.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(checkcpu.elf_VALGRIND_TARGET_FLAGS) $(HELGRIND_TARGET_FLAGS) $(checkcpu.elf_HELGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
helgrind-target-checkcpu.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
helgrind-target-checkcpu.elf: VALGRIND_TARGET_EXECUTABLE=checkcpu.elf
helgrind-target-checkcpu.elf: VG_TOOL=helgrind
helgrind-target-checkcpu.elf: $(BIN_DIR)/checkcpu.elf $(VALGRIND)
helgrind-target-checkcpu.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
helgrind-target-checkcpu.elf:
	$(call vg-version)
	$(call vg-caller)

helgrind-target-cpuload.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(cpuload.elf_VALGRIND_FLAGS)        $(HELGRIND_FLAGS)        $(cpuload.elf_HELGRIND_FLAGS) $(call valgrind_xml_flags,cpuload.elf,HELGRIND)
helgrind-target-cpuload.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(cpuload.elf_VALGRIND_TARGET_FLAGS) $(HELGRIND_TARGET_FLAGS) $(cpuload.elf_HELGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
helgrind-target-cpuload.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
helgrind-target-cpuload.elf: VALGRIND_TARGET_EXECUTABLE=cpuload.elf
helgrind-target-cpuload.elf: VG_TOOL=helgrind
helgrind-target-cpuload.elf: $(BIN_DIR)/cpuload.elf $(VALGRIND)
helgrind-target-cpuload.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
helgrind-target-cpuload.elf:
	$(call vg-version)
	$(call vg-caller)

helgrind-target-bellysmile.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(bellysmile.elf_VALGRIND_FLAGS)        $(HELGRIND_FLAGS)        $(bellysmile.elf_HELGRIND_FLAGS) $(call valgrind_xml_flags,bellysmile.elf,HELGRIND)
helgrind-target-bellysmile.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(bellysmile.elf_VALGRIND_TARGET_FLAGS) $(HELGRIND_TARGET_FLAGS) $(bellysmile.elf_HELGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
helgrind-target-bellysmile.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
helgrind-target-bellysmile.elf: VALGRIND_TARGET_EXECUTABLE=bellysmile.elf
helgrind-target-bellysmile.elf: VG_TOOL=helgrind
helgrind-target-bellysmile.elf: $(BIN_DIR)/bellysmile.elf $(VALGRIND)
helgrind-target-bellysmile.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
helgrind-target-bellysmile.elf:
	$(call vg-version)
	$(call vg-caller)

helgrind-target-testapp.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(testapp.elf_VALGRIND_FLAGS)        $(HELGRIND_FLAGS)        $(testapp.elf_HELGRIND_FLAGS) $(call valgrind_xml_flags,testapp.elf,HELGRIND)
helgrind-target-testapp.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(testapp.elf_VALGRIND_TARGET_FLAGS) $(HELGRIND_TARGET_FLAGS) $(testapp.elf_HELGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
helgrind-target-testapp.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
helgrind-target-testapp.elf: VALGRIND_TARGET_EXECUTABLE=testapp.elf
helgrind-target-testapp.elf: VG_TOOL=helgrind
helgrind-target-testapp.elf: $(BIN_DIR)/testapp.elf $(VALGRIND)
helgrind-target-testapp.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
helgrind-target-testapp.elf:
	$(call vg-version)
	$(call vg-caller)

helgrind-target-cpuloadmonitor.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(cpuloadmonitor.elf_VALGRIND_FLAGS)        $(HELGRIND_FLAGS)        $(cpuloadmonitor.elf_HELGRIND_FLAGS) $(call valgrind_xml_flags,cpuloadmonitor.elf,HELGRIND)
helgrind-target-cpuloadmonitor.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(cpuloadmonitor.elf_VALGRIND_TARGET_FLAGS) $(HELGRIND_TARGET_FLAGS) $(cpuloadmonitor.elf_HELGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
helgrind-target-cpuloadmonitor.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
helgrind-target-cpuloadmonitor.elf: VALGRIND_TARGET_EXECUTABLE=cpuloadmonitor.elf
helgrind-target-cpuloadmonitor.elf: VG_TOOL=helgrind
helgrind-target-cpuloadmonitor.elf: $(BIN_DIR)/cpuloadmonitor.elf $(VALGRIND)
helgrind-target-cpuloadmonitor.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
helgrind-target-cpuloadmonitor.elf:
	$(call vg-version)
	$(call vg-caller)

helgrind-target-alltests_test.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(alltests_test.elf_VALGRIND_FLAGS)        $(HELGRIND_FLAGS)        $(alltests_test.elf_HELGRIND_FLAGS) $(call valgrind_xml_flags,alltests_test.elf,HELGRIND)
helgrind-target-alltests_test.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(alltests_test.elf_VALGRIND_TARGET_FLAGS) $(HELGRIND_TARGET_FLAGS) $(alltests_test.elf_HELGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
helgrind-target-alltests_test.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
helgrind-target-alltests_test.elf: VALGRIND_TARGET_EXECUTABLE=alltests_test.elf
helgrind-target-alltests_test.elf: VG_TOOL=helgrind
helgrind-target-alltests_test.elf: $(BIN_DIR)/alltests_test.elf $(VALGRIND)
helgrind-target-alltests_test.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
helgrind-target-alltests_test.elf:
	$(call vg-version)
	$(call vg-caller)


helgrind-target: $(VG_LOCAL_VALGRIND) $(HELGRIND_TARGET_TARGETS)
$(HELGRIND_TARGET_TARGETS): $(SYNC_SETTINGS_MK_TMP)

### callgrind-target ###

CALLGRIND_TARGET_TARGETS += callgrind-target-alltests_test.elf

callgrind-target-loadcompare.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(loadcompare.elf_VALGRIND_FLAGS)        $(CALLGRIND_FLAGS)        $(loadcompare.elf_CALLGRIND_FLAGS) $(call valgrind_xml_flags,loadcompare.elf,CALLGRIND)
callgrind-target-loadcompare.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(loadcompare.elf_VALGRIND_TARGET_FLAGS) $(CALLGRIND_TARGET_FLAGS) $(loadcompare.elf_CALLGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
callgrind-target-loadcompare.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
callgrind-target-loadcompare.elf: VALGRIND_TARGET_EXECUTABLE=loadcompare.elf
callgrind-target-loadcompare.elf: VG_TOOL=callgrind
callgrind-target-loadcompare.elf: $(BIN_DIR)/loadcompare.elf $(VALGRIND)
callgrind-target-loadcompare.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
callgrind-target-loadcompare.elf:
	$(call vg-version)
	$(call vg-caller)

callgrind-target-checkcpu.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(checkcpu.elf_VALGRIND_FLAGS)        $(CALLGRIND_FLAGS)        $(checkcpu.elf_CALLGRIND_FLAGS) $(call valgrind_xml_flags,checkcpu.elf,CALLGRIND)
callgrind-target-checkcpu.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(checkcpu.elf_VALGRIND_TARGET_FLAGS) $(CALLGRIND_TARGET_FLAGS) $(checkcpu.elf_CALLGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
callgrind-target-checkcpu.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
callgrind-target-checkcpu.elf: VALGRIND_TARGET_EXECUTABLE=checkcpu.elf
callgrind-target-checkcpu.elf: VG_TOOL=callgrind
callgrind-target-checkcpu.elf: $(BIN_DIR)/checkcpu.elf $(VALGRIND)
callgrind-target-checkcpu.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
callgrind-target-checkcpu.elf:
	$(call vg-version)
	$(call vg-caller)

callgrind-target-cpuload.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(cpuload.elf_VALGRIND_FLAGS)        $(CALLGRIND_FLAGS)        $(cpuload.elf_CALLGRIND_FLAGS) $(call valgrind_xml_flags,cpuload.elf,CALLGRIND)
callgrind-target-cpuload.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(cpuload.elf_VALGRIND_TARGET_FLAGS) $(CALLGRIND_TARGET_FLAGS) $(cpuload.elf_CALLGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
callgrind-target-cpuload.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
callgrind-target-cpuload.elf: VALGRIND_TARGET_EXECUTABLE=cpuload.elf
callgrind-target-cpuload.elf: VG_TOOL=callgrind
callgrind-target-cpuload.elf: $(BIN_DIR)/cpuload.elf $(VALGRIND)
callgrind-target-cpuload.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
callgrind-target-cpuload.elf:
	$(call vg-version)
	$(call vg-caller)

callgrind-target-bellysmile.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(bellysmile.elf_VALGRIND_FLAGS)        $(CALLGRIND_FLAGS)        $(bellysmile.elf_CALLGRIND_FLAGS) $(call valgrind_xml_flags,bellysmile.elf,CALLGRIND)
callgrind-target-bellysmile.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(bellysmile.elf_VALGRIND_TARGET_FLAGS) $(CALLGRIND_TARGET_FLAGS) $(bellysmile.elf_CALLGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
callgrind-target-bellysmile.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
callgrind-target-bellysmile.elf: VALGRIND_TARGET_EXECUTABLE=bellysmile.elf
callgrind-target-bellysmile.elf: VG_TOOL=callgrind
callgrind-target-bellysmile.elf: $(BIN_DIR)/bellysmile.elf $(VALGRIND)
callgrind-target-bellysmile.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
callgrind-target-bellysmile.elf:
	$(call vg-version)
	$(call vg-caller)

callgrind-target-testapp.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(testapp.elf_VALGRIND_FLAGS)        $(CALLGRIND_FLAGS)        $(testapp.elf_CALLGRIND_FLAGS) $(call valgrind_xml_flags,testapp.elf,CALLGRIND)
callgrind-target-testapp.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(testapp.elf_VALGRIND_TARGET_FLAGS) $(CALLGRIND_TARGET_FLAGS) $(testapp.elf_CALLGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
callgrind-target-testapp.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
callgrind-target-testapp.elf: VALGRIND_TARGET_EXECUTABLE=testapp.elf
callgrind-target-testapp.elf: VG_TOOL=callgrind
callgrind-target-testapp.elf: $(BIN_DIR)/testapp.elf $(VALGRIND)
callgrind-target-testapp.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
callgrind-target-testapp.elf:
	$(call vg-version)
	$(call vg-caller)

callgrind-target-cpuloadmonitor.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(cpuloadmonitor.elf_VALGRIND_FLAGS)        $(CALLGRIND_FLAGS)        $(cpuloadmonitor.elf_CALLGRIND_FLAGS) $(call valgrind_xml_flags,cpuloadmonitor.elf,CALLGRIND)
callgrind-target-cpuloadmonitor.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(cpuloadmonitor.elf_VALGRIND_TARGET_FLAGS) $(CALLGRIND_TARGET_FLAGS) $(cpuloadmonitor.elf_CALLGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
callgrind-target-cpuloadmonitor.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
callgrind-target-cpuloadmonitor.elf: VALGRIND_TARGET_EXECUTABLE=cpuloadmonitor.elf
callgrind-target-cpuloadmonitor.elf: VG_TOOL=callgrind
callgrind-target-cpuloadmonitor.elf: $(BIN_DIR)/cpuloadmonitor.elf $(VALGRIND)
callgrind-target-cpuloadmonitor.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
callgrind-target-cpuloadmonitor.elf:
	$(call vg-version)
	$(call vg-caller)

callgrind-target-alltests_test.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(alltests_test.elf_VALGRIND_FLAGS)        $(CALLGRIND_FLAGS)        $(alltests_test.elf_CALLGRIND_FLAGS) $(call valgrind_xml_flags,alltests_test.elf,CALLGRIND)
callgrind-target-alltests_test.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(alltests_test.elf_VALGRIND_TARGET_FLAGS) $(CALLGRIND_TARGET_FLAGS) $(alltests_test.elf_CALLGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
callgrind-target-alltests_test.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
callgrind-target-alltests_test.elf: VALGRIND_TARGET_EXECUTABLE=alltests_test.elf
callgrind-target-alltests_test.elf: VG_TOOL=callgrind
callgrind-target-alltests_test.elf: $(BIN_DIR)/alltests_test.elf $(VALGRIND)
callgrind-target-alltests_test.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
callgrind-target-alltests_test.elf:
	$(call vg-version)
	$(call vg-caller)


callgrind-target: $(VG_LOCAL_VALGRIND) $(CALLGRIND_TARGET_TARGETS)
$(CALLGRIND_TARGET_TARGETS): $(SYNC_SETTINGS_MK_TMP)

### cachegrind-target ###

CACHEGRIND_TARGET_TARGETS += cachegrind-target-alltests_test.elf

cachegrind-target-loadcompare.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(loadcompare.elf_VALGRIND_FLAGS)        $(CACHEGRIND_FLAGS)        $(loadcompare.elf_CACHEGRIND_FLAGS) $(call valgrind_xml_flags,loadcompare.elf,CACHEGRIND)
cachegrind-target-loadcompare.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(loadcompare.elf_VALGRIND_TARGET_FLAGS) $(CACHEGRIND_TARGET_FLAGS) $(loadcompare.elf_CACHEGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
cachegrind-target-loadcompare.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
cachegrind-target-loadcompare.elf: VALGRIND_TARGET_EXECUTABLE=loadcompare.elf
cachegrind-target-loadcompare.elf: VG_TOOL=cachegrind
cachegrind-target-loadcompare.elf: $(BIN_DIR)/loadcompare.elf $(VALGRIND)
cachegrind-target-loadcompare.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
cachegrind-target-loadcompare.elf:
	$(call vg-version)
	$(call vg-caller)

cachegrind-target-checkcpu.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(checkcpu.elf_VALGRIND_FLAGS)        $(CACHEGRIND_FLAGS)        $(checkcpu.elf_CACHEGRIND_FLAGS) $(call valgrind_xml_flags,checkcpu.elf,CACHEGRIND)
cachegrind-target-checkcpu.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(checkcpu.elf_VALGRIND_TARGET_FLAGS) $(CACHEGRIND_TARGET_FLAGS) $(checkcpu.elf_CACHEGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
cachegrind-target-checkcpu.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
cachegrind-target-checkcpu.elf: VALGRIND_TARGET_EXECUTABLE=checkcpu.elf
cachegrind-target-checkcpu.elf: VG_TOOL=cachegrind
cachegrind-target-checkcpu.elf: $(BIN_DIR)/checkcpu.elf $(VALGRIND)
cachegrind-target-checkcpu.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
cachegrind-target-checkcpu.elf:
	$(call vg-version)
	$(call vg-caller)

cachegrind-target-cpuload.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(cpuload.elf_VALGRIND_FLAGS)        $(CACHEGRIND_FLAGS)        $(cpuload.elf_CACHEGRIND_FLAGS) $(call valgrind_xml_flags,cpuload.elf,CACHEGRIND)
cachegrind-target-cpuload.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(cpuload.elf_VALGRIND_TARGET_FLAGS) $(CACHEGRIND_TARGET_FLAGS) $(cpuload.elf_CACHEGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
cachegrind-target-cpuload.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
cachegrind-target-cpuload.elf: VALGRIND_TARGET_EXECUTABLE=cpuload.elf
cachegrind-target-cpuload.elf: VG_TOOL=cachegrind
cachegrind-target-cpuload.elf: $(BIN_DIR)/cpuload.elf $(VALGRIND)
cachegrind-target-cpuload.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
cachegrind-target-cpuload.elf:
	$(call vg-version)
	$(call vg-caller)

cachegrind-target-bellysmile.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(bellysmile.elf_VALGRIND_FLAGS)        $(CACHEGRIND_FLAGS)        $(bellysmile.elf_CACHEGRIND_FLAGS) $(call valgrind_xml_flags,bellysmile.elf,CACHEGRIND)
cachegrind-target-bellysmile.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(bellysmile.elf_VALGRIND_TARGET_FLAGS) $(CACHEGRIND_TARGET_FLAGS) $(bellysmile.elf_CACHEGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
cachegrind-target-bellysmile.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
cachegrind-target-bellysmile.elf: VALGRIND_TARGET_EXECUTABLE=bellysmile.elf
cachegrind-target-bellysmile.elf: VG_TOOL=cachegrind
cachegrind-target-bellysmile.elf: $(BIN_DIR)/bellysmile.elf $(VALGRIND)
cachegrind-target-bellysmile.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
cachegrind-target-bellysmile.elf:
	$(call vg-version)
	$(call vg-caller)

cachegrind-target-testapp.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(testapp.elf_VALGRIND_FLAGS)        $(CACHEGRIND_FLAGS)        $(testapp.elf_CACHEGRIND_FLAGS) $(call valgrind_xml_flags,testapp.elf,CACHEGRIND)
cachegrind-target-testapp.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(testapp.elf_VALGRIND_TARGET_FLAGS) $(CACHEGRIND_TARGET_FLAGS) $(testapp.elf_CACHEGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
cachegrind-target-testapp.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
cachegrind-target-testapp.elf: VALGRIND_TARGET_EXECUTABLE=testapp.elf
cachegrind-target-testapp.elf: VG_TOOL=cachegrind
cachegrind-target-testapp.elf: $(BIN_DIR)/testapp.elf $(VALGRIND)
cachegrind-target-testapp.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
cachegrind-target-testapp.elf:
	$(call vg-version)
	$(call vg-caller)

cachegrind-target-cpuloadmonitor.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(cpuloadmonitor.elf_VALGRIND_FLAGS)        $(CACHEGRIND_FLAGS)        $(cpuloadmonitor.elf_CACHEGRIND_FLAGS) $(call valgrind_xml_flags,cpuloadmonitor.elf,CACHEGRIND)
cachegrind-target-cpuloadmonitor.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(cpuloadmonitor.elf_VALGRIND_TARGET_FLAGS) $(CACHEGRIND_TARGET_FLAGS) $(cpuloadmonitor.elf_CACHEGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
cachegrind-target-cpuloadmonitor.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
cachegrind-target-cpuloadmonitor.elf: VALGRIND_TARGET_EXECUTABLE=cpuloadmonitor.elf
cachegrind-target-cpuloadmonitor.elf: VG_TOOL=cachegrind
cachegrind-target-cpuloadmonitor.elf: $(BIN_DIR)/cpuloadmonitor.elf $(VALGRIND)
cachegrind-target-cpuloadmonitor.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
cachegrind-target-cpuloadmonitor.elf:
	$(call vg-version)
	$(call vg-caller)

cachegrind-target-alltests_test.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(alltests_test.elf_VALGRIND_FLAGS)        $(CACHEGRIND_FLAGS)        $(alltests_test.elf_CACHEGRIND_FLAGS) $(call valgrind_xml_flags,alltests_test.elf,CACHEGRIND)
cachegrind-target-alltests_test.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(alltests_test.elf_VALGRIND_TARGET_FLAGS) $(CACHEGRIND_TARGET_FLAGS) $(alltests_test.elf_CACHEGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
cachegrind-target-alltests_test.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
cachegrind-target-alltests_test.elf: VALGRIND_TARGET_EXECUTABLE=alltests_test.elf
cachegrind-target-alltests_test.elf: VG_TOOL=cachegrind
cachegrind-target-alltests_test.elf: $(BIN_DIR)/alltests_test.elf $(VALGRIND)
cachegrind-target-alltests_test.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
cachegrind-target-alltests_test.elf:
	$(call vg-version)
	$(call vg-caller)


cachegrind-target: $(VG_LOCAL_VALGRIND) $(CACHEGRIND_TARGET_TARGETS)
$(CACHEGRIND_TARGET_TARGETS): $(SYNC_SETTINGS_MK_TMP)

### massif-target ###

MASSIF_TARGET_TARGETS += massif-target-alltests_test.elf

massif-target-loadcompare.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(loadcompare.elf_VALGRIND_FLAGS)        $(MASSIF_FLAGS)        $(loadcompare.elf_MASSIF_FLAGS) $(call valgrind_xml_flags,loadcompare.elf,MASSIF)
massif-target-loadcompare.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(loadcompare.elf_VALGRIND_TARGET_FLAGS) $(MASSIF_TARGET_FLAGS) $(loadcompare.elf_MASSIF_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
massif-target-loadcompare.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
massif-target-loadcompare.elf: VALGRIND_TARGET_EXECUTABLE=loadcompare.elf
massif-target-loadcompare.elf: VG_TOOL=massif
massif-target-loadcompare.elf: $(BIN_DIR)/loadcompare.elf $(VALGRIND)
massif-target-loadcompare.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
massif-target-loadcompare.elf:
	$(call vg-version)
	$(call vg-caller)

massif-target-checkcpu.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(checkcpu.elf_VALGRIND_FLAGS)        $(MASSIF_FLAGS)        $(checkcpu.elf_MASSIF_FLAGS) $(call valgrind_xml_flags,checkcpu.elf,MASSIF)
massif-target-checkcpu.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(checkcpu.elf_VALGRIND_TARGET_FLAGS) $(MASSIF_TARGET_FLAGS) $(checkcpu.elf_MASSIF_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
massif-target-checkcpu.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
massif-target-checkcpu.elf: VALGRIND_TARGET_EXECUTABLE=checkcpu.elf
massif-target-checkcpu.elf: VG_TOOL=massif
massif-target-checkcpu.elf: $(BIN_DIR)/checkcpu.elf $(VALGRIND)
massif-target-checkcpu.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
massif-target-checkcpu.elf:
	$(call vg-version)
	$(call vg-caller)

massif-target-cpuload.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(cpuload.elf_VALGRIND_FLAGS)        $(MASSIF_FLAGS)        $(cpuload.elf_MASSIF_FLAGS) $(call valgrind_xml_flags,cpuload.elf,MASSIF)
massif-target-cpuload.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(cpuload.elf_VALGRIND_TARGET_FLAGS) $(MASSIF_TARGET_FLAGS) $(cpuload.elf_MASSIF_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
massif-target-cpuload.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
massif-target-cpuload.elf: VALGRIND_TARGET_EXECUTABLE=cpuload.elf
massif-target-cpuload.elf: VG_TOOL=massif
massif-target-cpuload.elf: $(BIN_DIR)/cpuload.elf $(VALGRIND)
massif-target-cpuload.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
massif-target-cpuload.elf:
	$(call vg-version)
	$(call vg-caller)

massif-target-bellysmile.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(bellysmile.elf_VALGRIND_FLAGS)        $(MASSIF_FLAGS)        $(bellysmile.elf_MASSIF_FLAGS) $(call valgrind_xml_flags,bellysmile.elf,MASSIF)
massif-target-bellysmile.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(bellysmile.elf_VALGRIND_TARGET_FLAGS) $(MASSIF_TARGET_FLAGS) $(bellysmile.elf_MASSIF_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
massif-target-bellysmile.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
massif-target-bellysmile.elf: VALGRIND_TARGET_EXECUTABLE=bellysmile.elf
massif-target-bellysmile.elf: VG_TOOL=massif
massif-target-bellysmile.elf: $(BIN_DIR)/bellysmile.elf $(VALGRIND)
massif-target-bellysmile.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
massif-target-bellysmile.elf:
	$(call vg-version)
	$(call vg-caller)

massif-target-testapp.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(testapp.elf_VALGRIND_FLAGS)        $(MASSIF_FLAGS)        $(testapp.elf_MASSIF_FLAGS) $(call valgrind_xml_flags,testapp.elf,MASSIF)
massif-target-testapp.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(testapp.elf_VALGRIND_TARGET_FLAGS) $(MASSIF_TARGET_FLAGS) $(testapp.elf_MASSIF_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
massif-target-testapp.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
massif-target-testapp.elf: VALGRIND_TARGET_EXECUTABLE=testapp.elf
massif-target-testapp.elf: VG_TOOL=massif
massif-target-testapp.elf: $(BIN_DIR)/testapp.elf $(VALGRIND)
massif-target-testapp.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
massif-target-testapp.elf:
	$(call vg-version)
	$(call vg-caller)

massif-target-cpuloadmonitor.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(cpuloadmonitor.elf_VALGRIND_FLAGS)        $(MASSIF_FLAGS)        $(cpuloadmonitor.elf_MASSIF_FLAGS) $(call valgrind_xml_flags,cpuloadmonitor.elf,MASSIF)
massif-target-cpuloadmonitor.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(cpuloadmonitor.elf_VALGRIND_TARGET_FLAGS) $(MASSIF_TARGET_FLAGS) $(cpuloadmonitor.elf_MASSIF_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
massif-target-cpuloadmonitor.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
massif-target-cpuloadmonitor.elf: VALGRIND_TARGET_EXECUTABLE=cpuloadmonitor.elf
massif-target-cpuloadmonitor.elf: VG_TOOL=massif
massif-target-cpuloadmonitor.elf: $(BIN_DIR)/cpuloadmonitor.elf $(VALGRIND)
massif-target-cpuloadmonitor.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
massif-target-cpuloadmonitor.elf:
	$(call vg-version)
	$(call vg-caller)

massif-target-alltests_test.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(alltests_test.elf_VALGRIND_FLAGS)        $(MASSIF_FLAGS)        $(alltests_test.elf_MASSIF_FLAGS) $(call valgrind_xml_flags,alltests_test.elf,MASSIF)
massif-target-alltests_test.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(alltests_test.elf_VALGRIND_TARGET_FLAGS) $(MASSIF_TARGET_FLAGS) $(alltests_test.elf_MASSIF_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
massif-target-alltests_test.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
massif-target-alltests_test.elf: VALGRIND_TARGET_EXECUTABLE=alltests_test.elf
massif-target-alltests_test.elf: VG_TOOL=massif
massif-target-alltests_test.elf: $(BIN_DIR)/alltests_test.elf $(VALGRIND)
massif-target-alltests_test.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
massif-target-alltests_test.elf:
	$(call vg-version)
	$(call vg-caller)


massif-target: $(VG_LOCAL_VALGRIND) $(MASSIF_TARGET_TARGETS)
$(MASSIF_TARGET_TARGETS): $(SYNC_SETTINGS_MK_TMP)

### drd-target ###

DRD_TARGET_TARGETS += drd-target-alltests_test.elf

drd-target-loadcompare.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(loadcompare.elf_VALGRIND_FLAGS)        $(DRD_FLAGS)        $(loadcompare.elf_DRD_FLAGS) $(call valgrind_xml_flags,loadcompare.elf,DRD)
drd-target-loadcompare.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(loadcompare.elf_VALGRIND_TARGET_FLAGS) $(DRD_TARGET_FLAGS) $(loadcompare.elf_DRD_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
drd-target-loadcompare.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
drd-target-loadcompare.elf: VALGRIND_TARGET_EXECUTABLE=loadcompare.elf
drd-target-loadcompare.elf: VG_TOOL=drd
drd-target-loadcompare.elf: $(BIN_DIR)/loadcompare.elf $(VALGRIND)
drd-target-loadcompare.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
drd-target-loadcompare.elf:
	$(call vg-version)
	$(call vg-caller)

drd-target-checkcpu.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(checkcpu.elf_VALGRIND_FLAGS)        $(DRD_FLAGS)        $(checkcpu.elf_DRD_FLAGS) $(call valgrind_xml_flags,checkcpu.elf,DRD)
drd-target-checkcpu.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(checkcpu.elf_VALGRIND_TARGET_FLAGS) $(DRD_TARGET_FLAGS) $(checkcpu.elf_DRD_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
drd-target-checkcpu.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
drd-target-checkcpu.elf: VALGRIND_TARGET_EXECUTABLE=checkcpu.elf
drd-target-checkcpu.elf: VG_TOOL=drd
drd-target-checkcpu.elf: $(BIN_DIR)/checkcpu.elf $(VALGRIND)
drd-target-checkcpu.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
drd-target-checkcpu.elf:
	$(call vg-version)
	$(call vg-caller)

drd-target-cpuload.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(cpuload.elf_VALGRIND_FLAGS)        $(DRD_FLAGS)        $(cpuload.elf_DRD_FLAGS) $(call valgrind_xml_flags,cpuload.elf,DRD)
drd-target-cpuload.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(cpuload.elf_VALGRIND_TARGET_FLAGS) $(DRD_TARGET_FLAGS) $(cpuload.elf_DRD_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
drd-target-cpuload.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
drd-target-cpuload.elf: VALGRIND_TARGET_EXECUTABLE=cpuload.elf
drd-target-cpuload.elf: VG_TOOL=drd
drd-target-cpuload.elf: $(BIN_DIR)/cpuload.elf $(VALGRIND)
drd-target-cpuload.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
drd-target-cpuload.elf:
	$(call vg-version)
	$(call vg-caller)

drd-target-bellysmile.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(bellysmile.elf_VALGRIND_FLAGS)        $(DRD_FLAGS)        $(bellysmile.elf_DRD_FLAGS) $(call valgrind_xml_flags,bellysmile.elf,DRD)
drd-target-bellysmile.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(bellysmile.elf_VALGRIND_TARGET_FLAGS) $(DRD_TARGET_FLAGS) $(bellysmile.elf_DRD_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
drd-target-bellysmile.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
drd-target-bellysmile.elf: VALGRIND_TARGET_EXECUTABLE=bellysmile.elf
drd-target-bellysmile.elf: VG_TOOL=drd
drd-target-bellysmile.elf: $(BIN_DIR)/bellysmile.elf $(VALGRIND)
drd-target-bellysmile.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
drd-target-bellysmile.elf:
	$(call vg-version)
	$(call vg-caller)

drd-target-testapp.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(testapp.elf_VALGRIND_FLAGS)        $(DRD_FLAGS)        $(testapp.elf_DRD_FLAGS) $(call valgrind_xml_flags,testapp.elf,DRD)
drd-target-testapp.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(testapp.elf_VALGRIND_TARGET_FLAGS) $(DRD_TARGET_FLAGS) $(testapp.elf_DRD_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
drd-target-testapp.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
drd-target-testapp.elf: VALGRIND_TARGET_EXECUTABLE=testapp.elf
drd-target-testapp.elf: VG_TOOL=drd
drd-target-testapp.elf: $(BIN_DIR)/testapp.elf $(VALGRIND)
drd-target-testapp.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
drd-target-testapp.elf:
	$(call vg-version)
	$(call vg-caller)

drd-target-cpuloadmonitor.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(cpuloadmonitor.elf_VALGRIND_FLAGS)        $(DRD_FLAGS)        $(cpuloadmonitor.elf_DRD_FLAGS) $(call valgrind_xml_flags,cpuloadmonitor.elf,DRD)
drd-target-cpuloadmonitor.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(cpuloadmonitor.elf_VALGRIND_TARGET_FLAGS) $(DRD_TARGET_FLAGS) $(cpuloadmonitor.elf_DRD_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
drd-target-cpuloadmonitor.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
drd-target-cpuloadmonitor.elf: VALGRIND_TARGET_EXECUTABLE=cpuloadmonitor.elf
drd-target-cpuloadmonitor.elf: VG_TOOL=drd
drd-target-cpuloadmonitor.elf: $(BIN_DIR)/cpuloadmonitor.elf $(VALGRIND)
drd-target-cpuloadmonitor.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
drd-target-cpuloadmonitor.elf:
	$(call vg-version)
	$(call vg-caller)

drd-target-alltests_test.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(alltests_test.elf_VALGRIND_FLAGS)        $(DRD_FLAGS)        $(alltests_test.elf_DRD_FLAGS) $(call valgrind_xml_flags,alltests_test.elf,DRD)
drd-target-alltests_test.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(alltests_test.elf_VALGRIND_TARGET_FLAGS) $(DRD_TARGET_FLAGS) $(alltests_test.elf_DRD_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
drd-target-alltests_test.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
drd-target-alltests_test.elf: VALGRIND_TARGET_EXECUTABLE=alltests_test.elf
drd-target-alltests_test.elf: VG_TOOL=drd
drd-target-alltests_test.elf: $(BIN_DIR)/alltests_test.elf $(VALGRIND)
drd-target-alltests_test.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
drd-target-alltests_test.elf:
	$(call vg-version)
	$(call vg-caller)


drd-target: $(VG_LOCAL_VALGRIND) $(DRD_TARGET_TARGETS)
$(DRD_TARGET_TARGETS): $(SYNC_SETTINGS_MK_TMP)

