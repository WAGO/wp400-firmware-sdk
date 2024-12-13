### generated targets ###
.PHONY: valgrind-target
.PHONY: valgrind-target-eeprom-xsection.elf

.PHONY: nulgrind-target
.PHONY: nulgrind-target-eeprom-xsection.elf

.PHONY: memcheck-target
.PHONY: memcheck-target-eeprom-xsection.elf

.PHONY: helgrind-target
.PHONY: helgrind-target-eeprom-xsection.elf

.PHONY: callgrind-target
.PHONY: callgrind-target-eeprom-xsection.elf

.PHONY: cachegrind-target
.PHONY: cachegrind-target-eeprom-xsection.elf

.PHONY: massif-target
.PHONY: massif-target-eeprom-xsection.elf

.PHONY: drd-target
.PHONY: drd-target-eeprom-xsection.elf

### valgrind-target ###
valgrind-target: $(VG_LOCAL_VALGRIND)
valgrind-target: memcheck-target helgrind-target
valgrind-target-eeprom-xsection.elf: memcheck-target-eeprom-xsection.elf helgrind-target-eeprom-xsection.elf

### nulgrind-target ###


nulgrind-target-eeprom-xsection.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(eeprom-xsection.elf_VALGRIND_FLAGS)        $(NULGRIND_FLAGS)        $(eeprom-xsection.elf_NULGRIND_FLAGS) $(call valgrind_xml_flags,eeprom-xsection.elf,NULGRIND)
nulgrind-target-eeprom-xsection.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(eeprom-xsection.elf_VALGRIND_TARGET_FLAGS) $(NULGRIND_TARGET_FLAGS) $(eeprom-xsection.elf_NULGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
nulgrind-target-eeprom-xsection.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
nulgrind-target-eeprom-xsection.elf: VALGRIND_TARGET_EXECUTABLE=eeprom-xsection.elf
nulgrind-target-eeprom-xsection.elf: VG_TOOL=nulgrind
nulgrind-target-eeprom-xsection.elf: $(BIN_DIR)/eeprom-xsection.elf $(VALGRIND)
nulgrind-target-eeprom-xsection.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
nulgrind-target-eeprom-xsection.elf:
	$(call vg-version)
	$(call vg-caller)


nulgrind-target: $(VG_LOCAL_VALGRIND) $(NULGRIND_TARGET_TARGETS)
$(NULGRIND_TARGET_TARGETS): $(SYNC_SETTINGS_MK_TMP)

### memcheck-target ###


memcheck-target-eeprom-xsection.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(eeprom-xsection.elf_VALGRIND_FLAGS)        $(MEMCHECK_FLAGS)        $(eeprom-xsection.elf_MEMCHECK_FLAGS) $(call valgrind_xml_flags,eeprom-xsection.elf,MEMCHECK)
memcheck-target-eeprom-xsection.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(eeprom-xsection.elf_VALGRIND_TARGET_FLAGS) $(MEMCHECK_TARGET_FLAGS) $(eeprom-xsection.elf_MEMCHECK_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
memcheck-target-eeprom-xsection.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
memcheck-target-eeprom-xsection.elf: VALGRIND_TARGET_EXECUTABLE=eeprom-xsection.elf
memcheck-target-eeprom-xsection.elf: VG_TOOL=memcheck
memcheck-target-eeprom-xsection.elf: $(BIN_DIR)/eeprom-xsection.elf $(VALGRIND)
memcheck-target-eeprom-xsection.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
memcheck-target-eeprom-xsection.elf:
	$(call vg-version)
	$(call vg-caller)


memcheck-target: $(VG_LOCAL_VALGRIND) $(MEMCHECK_TARGET_TARGETS)
$(MEMCHECK_TARGET_TARGETS): $(SYNC_SETTINGS_MK_TMP)

### helgrind-target ###


helgrind-target-eeprom-xsection.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(eeprom-xsection.elf_VALGRIND_FLAGS)        $(HELGRIND_FLAGS)        $(eeprom-xsection.elf_HELGRIND_FLAGS) $(call valgrind_xml_flags,eeprom-xsection.elf,HELGRIND)
helgrind-target-eeprom-xsection.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(eeprom-xsection.elf_VALGRIND_TARGET_FLAGS) $(HELGRIND_TARGET_FLAGS) $(eeprom-xsection.elf_HELGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
helgrind-target-eeprom-xsection.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
helgrind-target-eeprom-xsection.elf: VALGRIND_TARGET_EXECUTABLE=eeprom-xsection.elf
helgrind-target-eeprom-xsection.elf: VG_TOOL=helgrind
helgrind-target-eeprom-xsection.elf: $(BIN_DIR)/eeprom-xsection.elf $(VALGRIND)
helgrind-target-eeprom-xsection.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
helgrind-target-eeprom-xsection.elf:
	$(call vg-version)
	$(call vg-caller)


helgrind-target: $(VG_LOCAL_VALGRIND) $(HELGRIND_TARGET_TARGETS)
$(HELGRIND_TARGET_TARGETS): $(SYNC_SETTINGS_MK_TMP)

### callgrind-target ###


callgrind-target-eeprom-xsection.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(eeprom-xsection.elf_VALGRIND_FLAGS)        $(CALLGRIND_FLAGS)        $(eeprom-xsection.elf_CALLGRIND_FLAGS) $(call valgrind_xml_flags,eeprom-xsection.elf,CALLGRIND)
callgrind-target-eeprom-xsection.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(eeprom-xsection.elf_VALGRIND_TARGET_FLAGS) $(CALLGRIND_TARGET_FLAGS) $(eeprom-xsection.elf_CALLGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
callgrind-target-eeprom-xsection.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
callgrind-target-eeprom-xsection.elf: VALGRIND_TARGET_EXECUTABLE=eeprom-xsection.elf
callgrind-target-eeprom-xsection.elf: VG_TOOL=callgrind
callgrind-target-eeprom-xsection.elf: $(BIN_DIR)/eeprom-xsection.elf $(VALGRIND)
callgrind-target-eeprom-xsection.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
callgrind-target-eeprom-xsection.elf:
	$(call vg-version)
	$(call vg-caller)


callgrind-target: $(VG_LOCAL_VALGRIND) $(CALLGRIND_TARGET_TARGETS)
$(CALLGRIND_TARGET_TARGETS): $(SYNC_SETTINGS_MK_TMP)

### cachegrind-target ###


cachegrind-target-eeprom-xsection.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(eeprom-xsection.elf_VALGRIND_FLAGS)        $(CACHEGRIND_FLAGS)        $(eeprom-xsection.elf_CACHEGRIND_FLAGS) $(call valgrind_xml_flags,eeprom-xsection.elf,CACHEGRIND)
cachegrind-target-eeprom-xsection.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(eeprom-xsection.elf_VALGRIND_TARGET_FLAGS) $(CACHEGRIND_TARGET_FLAGS) $(eeprom-xsection.elf_CACHEGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
cachegrind-target-eeprom-xsection.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
cachegrind-target-eeprom-xsection.elf: VALGRIND_TARGET_EXECUTABLE=eeprom-xsection.elf
cachegrind-target-eeprom-xsection.elf: VG_TOOL=cachegrind
cachegrind-target-eeprom-xsection.elf: $(BIN_DIR)/eeprom-xsection.elf $(VALGRIND)
cachegrind-target-eeprom-xsection.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
cachegrind-target-eeprom-xsection.elf:
	$(call vg-version)
	$(call vg-caller)


cachegrind-target: $(VG_LOCAL_VALGRIND) $(CACHEGRIND_TARGET_TARGETS)
$(CACHEGRIND_TARGET_TARGETS): $(SYNC_SETTINGS_MK_TMP)

### massif-target ###


massif-target-eeprom-xsection.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(eeprom-xsection.elf_VALGRIND_FLAGS)        $(MASSIF_FLAGS)        $(eeprom-xsection.elf_MASSIF_FLAGS) $(call valgrind_xml_flags,eeprom-xsection.elf,MASSIF)
massif-target-eeprom-xsection.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(eeprom-xsection.elf_VALGRIND_TARGET_FLAGS) $(MASSIF_TARGET_FLAGS) $(eeprom-xsection.elf_MASSIF_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
massif-target-eeprom-xsection.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
massif-target-eeprom-xsection.elf: VALGRIND_TARGET_EXECUTABLE=eeprom-xsection.elf
massif-target-eeprom-xsection.elf: VG_TOOL=massif
massif-target-eeprom-xsection.elf: $(BIN_DIR)/eeprom-xsection.elf $(VALGRIND)
massif-target-eeprom-xsection.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
massif-target-eeprom-xsection.elf:
	$(call vg-version)
	$(call vg-caller)


massif-target: $(VG_LOCAL_VALGRIND) $(MASSIF_TARGET_TARGETS)
$(MASSIF_TARGET_TARGETS): $(SYNC_SETTINGS_MK_TMP)

### drd-target ###


drd-target-eeprom-xsection.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(eeprom-xsection.elf_VALGRIND_FLAGS)        $(DRD_FLAGS)        $(eeprom-xsection.elf_DRD_FLAGS) $(call valgrind_xml_flags,eeprom-xsection.elf,DRD)
drd-target-eeprom-xsection.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(eeprom-xsection.elf_VALGRIND_TARGET_FLAGS) $(DRD_TARGET_FLAGS) $(eeprom-xsection.elf_DRD_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
drd-target-eeprom-xsection.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
drd-target-eeprom-xsection.elf: VALGRIND_TARGET_EXECUTABLE=eeprom-xsection.elf
drd-target-eeprom-xsection.elf: VG_TOOL=drd
drd-target-eeprom-xsection.elf: $(BIN_DIR)/eeprom-xsection.elf $(VALGRIND)
drd-target-eeprom-xsection.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
drd-target-eeprom-xsection.elf:
	$(call vg-version)
	$(call vg-caller)


drd-target: $(VG_LOCAL_VALGRIND) $(DRD_TARGET_TARGETS)
$(DRD_TARGET_TARGETS): $(SYNC_SETTINGS_MK_TMP)

