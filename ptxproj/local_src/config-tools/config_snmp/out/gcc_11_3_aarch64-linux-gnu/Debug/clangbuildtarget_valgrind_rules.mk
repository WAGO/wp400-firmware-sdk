### generated targets ###
.PHONY: valgrind-target
.PHONY: valgrind-target-config_snmp.elf
.PHONY: valgrind-target-alltests.elf

.PHONY: nulgrind-target
.PHONY: nulgrind-target-config_snmp.elf
.PHONY: nulgrind-target-alltests.elf

.PHONY: memcheck-target
.PHONY: memcheck-target-config_snmp.elf
.PHONY: memcheck-target-alltests.elf

.PHONY: helgrind-target
.PHONY: helgrind-target-config_snmp.elf
.PHONY: helgrind-target-alltests.elf

.PHONY: callgrind-target
.PHONY: callgrind-target-config_snmp.elf
.PHONY: callgrind-target-alltests.elf

.PHONY: cachegrind-target
.PHONY: cachegrind-target-config_snmp.elf
.PHONY: cachegrind-target-alltests.elf

.PHONY: massif-target
.PHONY: massif-target-config_snmp.elf
.PHONY: massif-target-alltests.elf

.PHONY: drd-target
.PHONY: drd-target-config_snmp.elf
.PHONY: drd-target-alltests.elf

### valgrind-target ###
valgrind-target: $(VG_LOCAL_VALGRIND)
valgrind-target: memcheck-target helgrind-target
valgrind-target-config_snmp.elf: memcheck-target-config_snmp.elf helgrind-target-config_snmp.elf
valgrind-target-alltests.elf: memcheck-target-alltests.elf helgrind-target-alltests.elf

### nulgrind-target ###

NULGRIND_TARGET_TARGETS += nulgrind-target-alltests.elf

nulgrind-target-config_snmp.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(config_snmp.elf_VALGRIND_FLAGS)        $(NULGRIND_FLAGS)        $(config_snmp.elf_NULGRIND_FLAGS) $(call valgrind_xml_flags,config_snmp.elf,NULGRIND)
nulgrind-target-config_snmp.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(config_snmp.elf_VALGRIND_TARGET_FLAGS) $(NULGRIND_TARGET_FLAGS) $(config_snmp.elf_NULGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
nulgrind-target-config_snmp.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
nulgrind-target-config_snmp.elf: VALGRIND_TARGET_EXECUTABLE=config_snmp.elf
nulgrind-target-config_snmp.elf: VG_TOOL=nulgrind
nulgrind-target-config_snmp.elf: $(BIN_DIR)/config_snmp.elf $(VALGRIND)
nulgrind-target-config_snmp.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
nulgrind-target-config_snmp.elf:
	$(call vg-version)
	$(call vg-caller)

nulgrind-target-alltests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(alltests.elf_VALGRIND_FLAGS)        $(NULGRIND_FLAGS)        $(alltests.elf_NULGRIND_FLAGS) $(call valgrind_xml_flags,alltests.elf,NULGRIND)
nulgrind-target-alltests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(alltests.elf_VALGRIND_TARGET_FLAGS) $(NULGRIND_TARGET_FLAGS) $(alltests.elf_NULGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
nulgrind-target-alltests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
nulgrind-target-alltests.elf: VALGRIND_TARGET_EXECUTABLE=alltests.elf
nulgrind-target-alltests.elf: VG_TOOL=nulgrind
nulgrind-target-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND)
nulgrind-target-alltests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
nulgrind-target-alltests.elf:
	$(call vg-version)
	$(call vg-caller)


nulgrind-target: $(VG_LOCAL_VALGRIND) $(NULGRIND_TARGET_TARGETS)
$(NULGRIND_TARGET_TARGETS): $(SYNC_SETTINGS_MK_TMP)

### memcheck-target ###

MEMCHECK_TARGET_TARGETS += memcheck-target-alltests.elf

memcheck-target-config_snmp.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(config_snmp.elf_VALGRIND_FLAGS)        $(MEMCHECK_FLAGS)        $(config_snmp.elf_MEMCHECK_FLAGS) $(call valgrind_xml_flags,config_snmp.elf,MEMCHECK)
memcheck-target-config_snmp.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(config_snmp.elf_VALGRIND_TARGET_FLAGS) $(MEMCHECK_TARGET_FLAGS) $(config_snmp.elf_MEMCHECK_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
memcheck-target-config_snmp.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
memcheck-target-config_snmp.elf: VALGRIND_TARGET_EXECUTABLE=config_snmp.elf
memcheck-target-config_snmp.elf: VG_TOOL=memcheck
memcheck-target-config_snmp.elf: $(BIN_DIR)/config_snmp.elf $(VALGRIND)
memcheck-target-config_snmp.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
memcheck-target-config_snmp.elf:
	$(call vg-version)
	$(call vg-caller)

memcheck-target-alltests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(alltests.elf_VALGRIND_FLAGS)        $(MEMCHECK_FLAGS)        $(alltests.elf_MEMCHECK_FLAGS) $(call valgrind_xml_flags,alltests.elf,MEMCHECK)
memcheck-target-alltests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(alltests.elf_VALGRIND_TARGET_FLAGS) $(MEMCHECK_TARGET_FLAGS) $(alltests.elf_MEMCHECK_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
memcheck-target-alltests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
memcheck-target-alltests.elf: VALGRIND_TARGET_EXECUTABLE=alltests.elf
memcheck-target-alltests.elf: VG_TOOL=memcheck
memcheck-target-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND)
memcheck-target-alltests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
memcheck-target-alltests.elf:
	$(call vg-version)
	$(call vg-caller)


memcheck-target: $(VG_LOCAL_VALGRIND) $(MEMCHECK_TARGET_TARGETS)
$(MEMCHECK_TARGET_TARGETS): $(SYNC_SETTINGS_MK_TMP)

### helgrind-target ###

HELGRIND_TARGET_TARGETS += helgrind-target-alltests.elf

helgrind-target-config_snmp.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(config_snmp.elf_VALGRIND_FLAGS)        $(HELGRIND_FLAGS)        $(config_snmp.elf_HELGRIND_FLAGS) $(call valgrind_xml_flags,config_snmp.elf,HELGRIND)
helgrind-target-config_snmp.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(config_snmp.elf_VALGRIND_TARGET_FLAGS) $(HELGRIND_TARGET_FLAGS) $(config_snmp.elf_HELGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
helgrind-target-config_snmp.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
helgrind-target-config_snmp.elf: VALGRIND_TARGET_EXECUTABLE=config_snmp.elf
helgrind-target-config_snmp.elf: VG_TOOL=helgrind
helgrind-target-config_snmp.elf: $(BIN_DIR)/config_snmp.elf $(VALGRIND)
helgrind-target-config_snmp.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
helgrind-target-config_snmp.elf:
	$(call vg-version)
	$(call vg-caller)

helgrind-target-alltests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(alltests.elf_VALGRIND_FLAGS)        $(HELGRIND_FLAGS)        $(alltests.elf_HELGRIND_FLAGS) $(call valgrind_xml_flags,alltests.elf,HELGRIND)
helgrind-target-alltests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(alltests.elf_VALGRIND_TARGET_FLAGS) $(HELGRIND_TARGET_FLAGS) $(alltests.elf_HELGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
helgrind-target-alltests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
helgrind-target-alltests.elf: VALGRIND_TARGET_EXECUTABLE=alltests.elf
helgrind-target-alltests.elf: VG_TOOL=helgrind
helgrind-target-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND)
helgrind-target-alltests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
helgrind-target-alltests.elf:
	$(call vg-version)
	$(call vg-caller)


helgrind-target: $(VG_LOCAL_VALGRIND) $(HELGRIND_TARGET_TARGETS)
$(HELGRIND_TARGET_TARGETS): $(SYNC_SETTINGS_MK_TMP)

### callgrind-target ###

CALLGRIND_TARGET_TARGETS += callgrind-target-alltests.elf

callgrind-target-config_snmp.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(config_snmp.elf_VALGRIND_FLAGS)        $(CALLGRIND_FLAGS)        $(config_snmp.elf_CALLGRIND_FLAGS) $(call valgrind_xml_flags,config_snmp.elf,CALLGRIND)
callgrind-target-config_snmp.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(config_snmp.elf_VALGRIND_TARGET_FLAGS) $(CALLGRIND_TARGET_FLAGS) $(config_snmp.elf_CALLGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
callgrind-target-config_snmp.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
callgrind-target-config_snmp.elf: VALGRIND_TARGET_EXECUTABLE=config_snmp.elf
callgrind-target-config_snmp.elf: VG_TOOL=callgrind
callgrind-target-config_snmp.elf: $(BIN_DIR)/config_snmp.elf $(VALGRIND)
callgrind-target-config_snmp.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
callgrind-target-config_snmp.elf:
	$(call vg-version)
	$(call vg-caller)

callgrind-target-alltests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(alltests.elf_VALGRIND_FLAGS)        $(CALLGRIND_FLAGS)        $(alltests.elf_CALLGRIND_FLAGS) $(call valgrind_xml_flags,alltests.elf,CALLGRIND)
callgrind-target-alltests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(alltests.elf_VALGRIND_TARGET_FLAGS) $(CALLGRIND_TARGET_FLAGS) $(alltests.elf_CALLGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
callgrind-target-alltests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
callgrind-target-alltests.elf: VALGRIND_TARGET_EXECUTABLE=alltests.elf
callgrind-target-alltests.elf: VG_TOOL=callgrind
callgrind-target-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND)
callgrind-target-alltests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
callgrind-target-alltests.elf:
	$(call vg-version)
	$(call vg-caller)


callgrind-target: $(VG_LOCAL_VALGRIND) $(CALLGRIND_TARGET_TARGETS)
$(CALLGRIND_TARGET_TARGETS): $(SYNC_SETTINGS_MK_TMP)

### cachegrind-target ###

CACHEGRIND_TARGET_TARGETS += cachegrind-target-alltests.elf

cachegrind-target-config_snmp.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(config_snmp.elf_VALGRIND_FLAGS)        $(CACHEGRIND_FLAGS)        $(config_snmp.elf_CACHEGRIND_FLAGS) $(call valgrind_xml_flags,config_snmp.elf,CACHEGRIND)
cachegrind-target-config_snmp.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(config_snmp.elf_VALGRIND_TARGET_FLAGS) $(CACHEGRIND_TARGET_FLAGS) $(config_snmp.elf_CACHEGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
cachegrind-target-config_snmp.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
cachegrind-target-config_snmp.elf: VALGRIND_TARGET_EXECUTABLE=config_snmp.elf
cachegrind-target-config_snmp.elf: VG_TOOL=cachegrind
cachegrind-target-config_snmp.elf: $(BIN_DIR)/config_snmp.elf $(VALGRIND)
cachegrind-target-config_snmp.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
cachegrind-target-config_snmp.elf:
	$(call vg-version)
	$(call vg-caller)

cachegrind-target-alltests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(alltests.elf_VALGRIND_FLAGS)        $(CACHEGRIND_FLAGS)        $(alltests.elf_CACHEGRIND_FLAGS) $(call valgrind_xml_flags,alltests.elf,CACHEGRIND)
cachegrind-target-alltests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(alltests.elf_VALGRIND_TARGET_FLAGS) $(CACHEGRIND_TARGET_FLAGS) $(alltests.elf_CACHEGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
cachegrind-target-alltests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
cachegrind-target-alltests.elf: VALGRIND_TARGET_EXECUTABLE=alltests.elf
cachegrind-target-alltests.elf: VG_TOOL=cachegrind
cachegrind-target-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND)
cachegrind-target-alltests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
cachegrind-target-alltests.elf:
	$(call vg-version)
	$(call vg-caller)


cachegrind-target: $(VG_LOCAL_VALGRIND) $(CACHEGRIND_TARGET_TARGETS)
$(CACHEGRIND_TARGET_TARGETS): $(SYNC_SETTINGS_MK_TMP)

### massif-target ###

MASSIF_TARGET_TARGETS += massif-target-alltests.elf

massif-target-config_snmp.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(config_snmp.elf_VALGRIND_FLAGS)        $(MASSIF_FLAGS)        $(config_snmp.elf_MASSIF_FLAGS) $(call valgrind_xml_flags,config_snmp.elf,MASSIF)
massif-target-config_snmp.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(config_snmp.elf_VALGRIND_TARGET_FLAGS) $(MASSIF_TARGET_FLAGS) $(config_snmp.elf_MASSIF_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
massif-target-config_snmp.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
massif-target-config_snmp.elf: VALGRIND_TARGET_EXECUTABLE=config_snmp.elf
massif-target-config_snmp.elf: VG_TOOL=massif
massif-target-config_snmp.elf: $(BIN_DIR)/config_snmp.elf $(VALGRIND)
massif-target-config_snmp.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
massif-target-config_snmp.elf:
	$(call vg-version)
	$(call vg-caller)

massif-target-alltests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(alltests.elf_VALGRIND_FLAGS)        $(MASSIF_FLAGS)        $(alltests.elf_MASSIF_FLAGS) $(call valgrind_xml_flags,alltests.elf,MASSIF)
massif-target-alltests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(alltests.elf_VALGRIND_TARGET_FLAGS) $(MASSIF_TARGET_FLAGS) $(alltests.elf_MASSIF_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
massif-target-alltests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
massif-target-alltests.elf: VALGRIND_TARGET_EXECUTABLE=alltests.elf
massif-target-alltests.elf: VG_TOOL=massif
massif-target-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND)
massif-target-alltests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
massif-target-alltests.elf:
	$(call vg-version)
	$(call vg-caller)


massif-target: $(VG_LOCAL_VALGRIND) $(MASSIF_TARGET_TARGETS)
$(MASSIF_TARGET_TARGETS): $(SYNC_SETTINGS_MK_TMP)

### drd-target ###

DRD_TARGET_TARGETS += drd-target-alltests.elf

drd-target-config_snmp.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(config_snmp.elf_VALGRIND_FLAGS)        $(DRD_FLAGS)        $(config_snmp.elf_DRD_FLAGS) $(call valgrind_xml_flags,config_snmp.elf,DRD)
drd-target-config_snmp.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(config_snmp.elf_VALGRIND_TARGET_FLAGS) $(DRD_TARGET_FLAGS) $(config_snmp.elf_DRD_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
drd-target-config_snmp.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
drd-target-config_snmp.elf: VALGRIND_TARGET_EXECUTABLE=config_snmp.elf
drd-target-config_snmp.elf: VG_TOOL=drd
drd-target-config_snmp.elf: $(BIN_DIR)/config_snmp.elf $(VALGRIND)
drd-target-config_snmp.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
drd-target-config_snmp.elf:
	$(call vg-version)
	$(call vg-caller)

drd-target-alltests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(alltests.elf_VALGRIND_FLAGS)        $(DRD_FLAGS)        $(alltests.elf_DRD_FLAGS) $(call valgrind_xml_flags,alltests.elf,DRD)
drd-target-alltests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(alltests.elf_VALGRIND_TARGET_FLAGS) $(DRD_TARGET_FLAGS) $(alltests.elf_DRD_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
drd-target-alltests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
drd-target-alltests.elf: VALGRIND_TARGET_EXECUTABLE=alltests.elf
drd-target-alltests.elf: VG_TOOL=drd
drd-target-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND)
drd-target-alltests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
drd-target-alltests.elf:
	$(call vg-version)
	$(call vg-caller)


drd-target: $(VG_LOCAL_VALGRIND) $(DRD_TARGET_TARGETS)
$(DRD_TARGET_TARGETS): $(SYNC_SETTINGS_MK_TMP)

