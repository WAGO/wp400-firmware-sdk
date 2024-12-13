### generated targets ###
.PHONY: valgrind-target
.PHONY: valgrind-target-helloworld.elf
.PHONY: valgrind-target-config_linux_user.elf
.PHONY: valgrind-target-reserved_area.elf
.PHONY: valgrind-target-detect_feature.elf
.PHONY: valgrind-target-libconfigtoolutils_tests.elf
.PHONY: valgrind-target-config_linux_user_tests.elf
.PHONY: valgrind-target-reserved_area_tests.elf
.PHONY: valgrind-target-detect_feature_tests.elf

.PHONY: nulgrind-target
.PHONY: nulgrind-target-helloworld.elf
.PHONY: nulgrind-target-config_linux_user.elf
.PHONY: nulgrind-target-reserved_area.elf
.PHONY: nulgrind-target-detect_feature.elf
.PHONY: nulgrind-target-libconfigtoolutils_tests.elf
.PHONY: nulgrind-target-config_linux_user_tests.elf
.PHONY: nulgrind-target-reserved_area_tests.elf
.PHONY: nulgrind-target-detect_feature_tests.elf

.PHONY: memcheck-target
.PHONY: memcheck-target-helloworld.elf
.PHONY: memcheck-target-config_linux_user.elf
.PHONY: memcheck-target-reserved_area.elf
.PHONY: memcheck-target-detect_feature.elf
.PHONY: memcheck-target-libconfigtoolutils_tests.elf
.PHONY: memcheck-target-config_linux_user_tests.elf
.PHONY: memcheck-target-reserved_area_tests.elf
.PHONY: memcheck-target-detect_feature_tests.elf

.PHONY: helgrind-target
.PHONY: helgrind-target-helloworld.elf
.PHONY: helgrind-target-config_linux_user.elf
.PHONY: helgrind-target-reserved_area.elf
.PHONY: helgrind-target-detect_feature.elf
.PHONY: helgrind-target-libconfigtoolutils_tests.elf
.PHONY: helgrind-target-config_linux_user_tests.elf
.PHONY: helgrind-target-reserved_area_tests.elf
.PHONY: helgrind-target-detect_feature_tests.elf

.PHONY: callgrind-target
.PHONY: callgrind-target-helloworld.elf
.PHONY: callgrind-target-config_linux_user.elf
.PHONY: callgrind-target-reserved_area.elf
.PHONY: callgrind-target-detect_feature.elf
.PHONY: callgrind-target-libconfigtoolutils_tests.elf
.PHONY: callgrind-target-config_linux_user_tests.elf
.PHONY: callgrind-target-reserved_area_tests.elf
.PHONY: callgrind-target-detect_feature_tests.elf

.PHONY: cachegrind-target
.PHONY: cachegrind-target-helloworld.elf
.PHONY: cachegrind-target-config_linux_user.elf
.PHONY: cachegrind-target-reserved_area.elf
.PHONY: cachegrind-target-detect_feature.elf
.PHONY: cachegrind-target-libconfigtoolutils_tests.elf
.PHONY: cachegrind-target-config_linux_user_tests.elf
.PHONY: cachegrind-target-reserved_area_tests.elf
.PHONY: cachegrind-target-detect_feature_tests.elf

.PHONY: massif-target
.PHONY: massif-target-helloworld.elf
.PHONY: massif-target-config_linux_user.elf
.PHONY: massif-target-reserved_area.elf
.PHONY: massif-target-detect_feature.elf
.PHONY: massif-target-libconfigtoolutils_tests.elf
.PHONY: massif-target-config_linux_user_tests.elf
.PHONY: massif-target-reserved_area_tests.elf
.PHONY: massif-target-detect_feature_tests.elf

.PHONY: drd-target
.PHONY: drd-target-helloworld.elf
.PHONY: drd-target-config_linux_user.elf
.PHONY: drd-target-reserved_area.elf
.PHONY: drd-target-detect_feature.elf
.PHONY: drd-target-libconfigtoolutils_tests.elf
.PHONY: drd-target-config_linux_user_tests.elf
.PHONY: drd-target-reserved_area_tests.elf
.PHONY: drd-target-detect_feature_tests.elf

### valgrind-target ###
valgrind-target: $(VG_LOCAL_VALGRIND)
valgrind-target: memcheck-target helgrind-target
valgrind-target-helloworld.elf: memcheck-target-helloworld.elf helgrind-target-helloworld.elf
valgrind-target-config_linux_user.elf: memcheck-target-config_linux_user.elf helgrind-target-config_linux_user.elf
valgrind-target-reserved_area.elf: memcheck-target-reserved_area.elf helgrind-target-reserved_area.elf
valgrind-target-detect_feature.elf: memcheck-target-detect_feature.elf helgrind-target-detect_feature.elf
valgrind-target-libconfigtoolutils_tests.elf: memcheck-target-libconfigtoolutils_tests.elf helgrind-target-libconfigtoolutils_tests.elf
valgrind-target-config_linux_user_tests.elf: memcheck-target-config_linux_user_tests.elf helgrind-target-config_linux_user_tests.elf
valgrind-target-reserved_area_tests.elf: memcheck-target-reserved_area_tests.elf helgrind-target-reserved_area_tests.elf
valgrind-target-detect_feature_tests.elf: memcheck-target-detect_feature_tests.elf helgrind-target-detect_feature_tests.elf

### nulgrind-target ###

NULGRIND_TARGET_TARGETS += nulgrind-target-libconfigtoolutils_tests.elf
NULGRIND_TARGET_TARGETS += nulgrind-target-config_linux_user_tests.elf
NULGRIND_TARGET_TARGETS += nulgrind-target-reserved_area_tests.elf
NULGRIND_TARGET_TARGETS += nulgrind-target-detect_feature_tests.elf

nulgrind-target-helloworld.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(helloworld.elf_VALGRIND_FLAGS)        $(NULGRIND_FLAGS)        $(helloworld.elf_NULGRIND_FLAGS) $(call valgrind_xml_flags,helloworld.elf,NULGRIND)
nulgrind-target-helloworld.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(helloworld.elf_VALGRIND_TARGET_FLAGS) $(NULGRIND_TARGET_FLAGS) $(helloworld.elf_NULGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
nulgrind-target-helloworld.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
nulgrind-target-helloworld.elf: VALGRIND_TARGET_EXECUTABLE=helloworld.elf
nulgrind-target-helloworld.elf: VG_TOOL=nulgrind
nulgrind-target-helloworld.elf: $(BIN_DIR)/helloworld.elf $(VALGRIND)
nulgrind-target-helloworld.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
nulgrind-target-helloworld.elf:
	$(call vg-version)
	$(call vg-caller)

nulgrind-target-config_linux_user.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(config_linux_user.elf_VALGRIND_FLAGS)        $(NULGRIND_FLAGS)        $(config_linux_user.elf_NULGRIND_FLAGS) $(call valgrind_xml_flags,config_linux_user.elf,NULGRIND)
nulgrind-target-config_linux_user.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(config_linux_user.elf_VALGRIND_TARGET_FLAGS) $(NULGRIND_TARGET_FLAGS) $(config_linux_user.elf_NULGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
nulgrind-target-config_linux_user.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
nulgrind-target-config_linux_user.elf: VALGRIND_TARGET_EXECUTABLE=config_linux_user.elf
nulgrind-target-config_linux_user.elf: VG_TOOL=nulgrind
nulgrind-target-config_linux_user.elf: $(BIN_DIR)/config_linux_user.elf $(VALGRIND)
nulgrind-target-config_linux_user.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
nulgrind-target-config_linux_user.elf:
	$(call vg-version)
	$(call vg-caller)

nulgrind-target-reserved_area.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(reserved_area.elf_VALGRIND_FLAGS)        $(NULGRIND_FLAGS)        $(reserved_area.elf_NULGRIND_FLAGS) $(call valgrind_xml_flags,reserved_area.elf,NULGRIND)
nulgrind-target-reserved_area.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(reserved_area.elf_VALGRIND_TARGET_FLAGS) $(NULGRIND_TARGET_FLAGS) $(reserved_area.elf_NULGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
nulgrind-target-reserved_area.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
nulgrind-target-reserved_area.elf: VALGRIND_TARGET_EXECUTABLE=reserved_area.elf
nulgrind-target-reserved_area.elf: VG_TOOL=nulgrind
nulgrind-target-reserved_area.elf: $(BIN_DIR)/reserved_area.elf $(VALGRIND)
nulgrind-target-reserved_area.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
nulgrind-target-reserved_area.elf:
	$(call vg-version)
	$(call vg-caller)

nulgrind-target-detect_feature.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(detect_feature.elf_VALGRIND_FLAGS)        $(NULGRIND_FLAGS)        $(detect_feature.elf_NULGRIND_FLAGS) $(call valgrind_xml_flags,detect_feature.elf,NULGRIND)
nulgrind-target-detect_feature.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(detect_feature.elf_VALGRIND_TARGET_FLAGS) $(NULGRIND_TARGET_FLAGS) $(detect_feature.elf_NULGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
nulgrind-target-detect_feature.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
nulgrind-target-detect_feature.elf: VALGRIND_TARGET_EXECUTABLE=detect_feature.elf
nulgrind-target-detect_feature.elf: VG_TOOL=nulgrind
nulgrind-target-detect_feature.elf: $(BIN_DIR)/detect_feature.elf $(VALGRIND)
nulgrind-target-detect_feature.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
nulgrind-target-detect_feature.elf:
	$(call vg-version)
	$(call vg-caller)

nulgrind-target-libconfigtoolutils_tests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(libconfigtoolutils_tests.elf_VALGRIND_FLAGS)        $(NULGRIND_FLAGS)        $(libconfigtoolutils_tests.elf_NULGRIND_FLAGS) $(call valgrind_xml_flags,libconfigtoolutils_tests.elf,NULGRIND)
nulgrind-target-libconfigtoolutils_tests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(libconfigtoolutils_tests.elf_VALGRIND_TARGET_FLAGS) $(NULGRIND_TARGET_FLAGS) $(libconfigtoolutils_tests.elf_NULGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
nulgrind-target-libconfigtoolutils_tests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
nulgrind-target-libconfigtoolutils_tests.elf: VALGRIND_TARGET_EXECUTABLE=libconfigtoolutils_tests.elf
nulgrind-target-libconfigtoolutils_tests.elf: VG_TOOL=nulgrind
nulgrind-target-libconfigtoolutils_tests.elf: $(BIN_DIR)/libconfigtoolutils_tests.elf $(VALGRIND)
nulgrind-target-libconfigtoolutils_tests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
nulgrind-target-libconfigtoolutils_tests.elf:
	$(call vg-version)
	$(call vg-caller)

nulgrind-target-config_linux_user_tests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(config_linux_user_tests.elf_VALGRIND_FLAGS)        $(NULGRIND_FLAGS)        $(config_linux_user_tests.elf_NULGRIND_FLAGS) $(call valgrind_xml_flags,config_linux_user_tests.elf,NULGRIND)
nulgrind-target-config_linux_user_tests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(config_linux_user_tests.elf_VALGRIND_TARGET_FLAGS) $(NULGRIND_TARGET_FLAGS) $(config_linux_user_tests.elf_NULGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
nulgrind-target-config_linux_user_tests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
nulgrind-target-config_linux_user_tests.elf: VALGRIND_TARGET_EXECUTABLE=config_linux_user_tests.elf
nulgrind-target-config_linux_user_tests.elf: VG_TOOL=nulgrind
nulgrind-target-config_linux_user_tests.elf: $(BIN_DIR)/config_linux_user_tests.elf $(VALGRIND)
nulgrind-target-config_linux_user_tests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
nulgrind-target-config_linux_user_tests.elf:
	$(call vg-version)
	$(call vg-caller)

nulgrind-target-reserved_area_tests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(reserved_area_tests.elf_VALGRIND_FLAGS)        $(NULGRIND_FLAGS)        $(reserved_area_tests.elf_NULGRIND_FLAGS) $(call valgrind_xml_flags,reserved_area_tests.elf,NULGRIND)
nulgrind-target-reserved_area_tests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(reserved_area_tests.elf_VALGRIND_TARGET_FLAGS) $(NULGRIND_TARGET_FLAGS) $(reserved_area_tests.elf_NULGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
nulgrind-target-reserved_area_tests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
nulgrind-target-reserved_area_tests.elf: VALGRIND_TARGET_EXECUTABLE=reserved_area_tests.elf
nulgrind-target-reserved_area_tests.elf: VG_TOOL=nulgrind
nulgrind-target-reserved_area_tests.elf: $(BIN_DIR)/reserved_area_tests.elf $(VALGRIND)
nulgrind-target-reserved_area_tests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
nulgrind-target-reserved_area_tests.elf:
	$(call vg-version)
	$(call vg-caller)

nulgrind-target-detect_feature_tests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(detect_feature_tests.elf_VALGRIND_FLAGS)        $(NULGRIND_FLAGS)        $(detect_feature_tests.elf_NULGRIND_FLAGS) $(call valgrind_xml_flags,detect_feature_tests.elf,NULGRIND)
nulgrind-target-detect_feature_tests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(detect_feature_tests.elf_VALGRIND_TARGET_FLAGS) $(NULGRIND_TARGET_FLAGS) $(detect_feature_tests.elf_NULGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
nulgrind-target-detect_feature_tests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
nulgrind-target-detect_feature_tests.elf: VALGRIND_TARGET_EXECUTABLE=detect_feature_tests.elf
nulgrind-target-detect_feature_tests.elf: VG_TOOL=nulgrind
nulgrind-target-detect_feature_tests.elf: $(BIN_DIR)/detect_feature_tests.elf $(VALGRIND)
nulgrind-target-detect_feature_tests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
nulgrind-target-detect_feature_tests.elf:
	$(call vg-version)
	$(call vg-caller)


nulgrind-target: $(VG_LOCAL_VALGRIND) $(NULGRIND_TARGET_TARGETS)
$(NULGRIND_TARGET_TARGETS): $(SYNC_SETTINGS_MK_TMP)

### memcheck-target ###

MEMCHECK_TARGET_TARGETS += memcheck-target-libconfigtoolutils_tests.elf
MEMCHECK_TARGET_TARGETS += memcheck-target-config_linux_user_tests.elf
MEMCHECK_TARGET_TARGETS += memcheck-target-reserved_area_tests.elf
MEMCHECK_TARGET_TARGETS += memcheck-target-detect_feature_tests.elf

memcheck-target-helloworld.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(helloworld.elf_VALGRIND_FLAGS)        $(MEMCHECK_FLAGS)        $(helloworld.elf_MEMCHECK_FLAGS) $(call valgrind_xml_flags,helloworld.elf,MEMCHECK)
memcheck-target-helloworld.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(helloworld.elf_VALGRIND_TARGET_FLAGS) $(MEMCHECK_TARGET_FLAGS) $(helloworld.elf_MEMCHECK_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
memcheck-target-helloworld.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
memcheck-target-helloworld.elf: VALGRIND_TARGET_EXECUTABLE=helloworld.elf
memcheck-target-helloworld.elf: VG_TOOL=memcheck
memcheck-target-helloworld.elf: $(BIN_DIR)/helloworld.elf $(VALGRIND)
memcheck-target-helloworld.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
memcheck-target-helloworld.elf:
	$(call vg-version)
	$(call vg-caller)

memcheck-target-config_linux_user.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(config_linux_user.elf_VALGRIND_FLAGS)        $(MEMCHECK_FLAGS)        $(config_linux_user.elf_MEMCHECK_FLAGS) $(call valgrind_xml_flags,config_linux_user.elf,MEMCHECK)
memcheck-target-config_linux_user.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(config_linux_user.elf_VALGRIND_TARGET_FLAGS) $(MEMCHECK_TARGET_FLAGS) $(config_linux_user.elf_MEMCHECK_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
memcheck-target-config_linux_user.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
memcheck-target-config_linux_user.elf: VALGRIND_TARGET_EXECUTABLE=config_linux_user.elf
memcheck-target-config_linux_user.elf: VG_TOOL=memcheck
memcheck-target-config_linux_user.elf: $(BIN_DIR)/config_linux_user.elf $(VALGRIND)
memcheck-target-config_linux_user.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
memcheck-target-config_linux_user.elf:
	$(call vg-version)
	$(call vg-caller)

memcheck-target-reserved_area.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(reserved_area.elf_VALGRIND_FLAGS)        $(MEMCHECK_FLAGS)        $(reserved_area.elf_MEMCHECK_FLAGS) $(call valgrind_xml_flags,reserved_area.elf,MEMCHECK)
memcheck-target-reserved_area.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(reserved_area.elf_VALGRIND_TARGET_FLAGS) $(MEMCHECK_TARGET_FLAGS) $(reserved_area.elf_MEMCHECK_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
memcheck-target-reserved_area.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
memcheck-target-reserved_area.elf: VALGRIND_TARGET_EXECUTABLE=reserved_area.elf
memcheck-target-reserved_area.elf: VG_TOOL=memcheck
memcheck-target-reserved_area.elf: $(BIN_DIR)/reserved_area.elf $(VALGRIND)
memcheck-target-reserved_area.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
memcheck-target-reserved_area.elf:
	$(call vg-version)
	$(call vg-caller)

memcheck-target-detect_feature.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(detect_feature.elf_VALGRIND_FLAGS)        $(MEMCHECK_FLAGS)        $(detect_feature.elf_MEMCHECK_FLAGS) $(call valgrind_xml_flags,detect_feature.elf,MEMCHECK)
memcheck-target-detect_feature.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(detect_feature.elf_VALGRIND_TARGET_FLAGS) $(MEMCHECK_TARGET_FLAGS) $(detect_feature.elf_MEMCHECK_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
memcheck-target-detect_feature.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
memcheck-target-detect_feature.elf: VALGRIND_TARGET_EXECUTABLE=detect_feature.elf
memcheck-target-detect_feature.elf: VG_TOOL=memcheck
memcheck-target-detect_feature.elf: $(BIN_DIR)/detect_feature.elf $(VALGRIND)
memcheck-target-detect_feature.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
memcheck-target-detect_feature.elf:
	$(call vg-version)
	$(call vg-caller)

memcheck-target-libconfigtoolutils_tests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(libconfigtoolutils_tests.elf_VALGRIND_FLAGS)        $(MEMCHECK_FLAGS)        $(libconfigtoolutils_tests.elf_MEMCHECK_FLAGS) $(call valgrind_xml_flags,libconfigtoolutils_tests.elf,MEMCHECK)
memcheck-target-libconfigtoolutils_tests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(libconfigtoolutils_tests.elf_VALGRIND_TARGET_FLAGS) $(MEMCHECK_TARGET_FLAGS) $(libconfigtoolutils_tests.elf_MEMCHECK_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
memcheck-target-libconfigtoolutils_tests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
memcheck-target-libconfigtoolutils_tests.elf: VALGRIND_TARGET_EXECUTABLE=libconfigtoolutils_tests.elf
memcheck-target-libconfigtoolutils_tests.elf: VG_TOOL=memcheck
memcheck-target-libconfigtoolutils_tests.elf: $(BIN_DIR)/libconfigtoolutils_tests.elf $(VALGRIND)
memcheck-target-libconfigtoolutils_tests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
memcheck-target-libconfigtoolutils_tests.elf:
	$(call vg-version)
	$(call vg-caller)

memcheck-target-config_linux_user_tests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(config_linux_user_tests.elf_VALGRIND_FLAGS)        $(MEMCHECK_FLAGS)        $(config_linux_user_tests.elf_MEMCHECK_FLAGS) $(call valgrind_xml_flags,config_linux_user_tests.elf,MEMCHECK)
memcheck-target-config_linux_user_tests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(config_linux_user_tests.elf_VALGRIND_TARGET_FLAGS) $(MEMCHECK_TARGET_FLAGS) $(config_linux_user_tests.elf_MEMCHECK_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
memcheck-target-config_linux_user_tests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
memcheck-target-config_linux_user_tests.elf: VALGRIND_TARGET_EXECUTABLE=config_linux_user_tests.elf
memcheck-target-config_linux_user_tests.elf: VG_TOOL=memcheck
memcheck-target-config_linux_user_tests.elf: $(BIN_DIR)/config_linux_user_tests.elf $(VALGRIND)
memcheck-target-config_linux_user_tests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
memcheck-target-config_linux_user_tests.elf:
	$(call vg-version)
	$(call vg-caller)

memcheck-target-reserved_area_tests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(reserved_area_tests.elf_VALGRIND_FLAGS)        $(MEMCHECK_FLAGS)        $(reserved_area_tests.elf_MEMCHECK_FLAGS) $(call valgrind_xml_flags,reserved_area_tests.elf,MEMCHECK)
memcheck-target-reserved_area_tests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(reserved_area_tests.elf_VALGRIND_TARGET_FLAGS) $(MEMCHECK_TARGET_FLAGS) $(reserved_area_tests.elf_MEMCHECK_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
memcheck-target-reserved_area_tests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
memcheck-target-reserved_area_tests.elf: VALGRIND_TARGET_EXECUTABLE=reserved_area_tests.elf
memcheck-target-reserved_area_tests.elf: VG_TOOL=memcheck
memcheck-target-reserved_area_tests.elf: $(BIN_DIR)/reserved_area_tests.elf $(VALGRIND)
memcheck-target-reserved_area_tests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
memcheck-target-reserved_area_tests.elf:
	$(call vg-version)
	$(call vg-caller)

memcheck-target-detect_feature_tests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(detect_feature_tests.elf_VALGRIND_FLAGS)        $(MEMCHECK_FLAGS)        $(detect_feature_tests.elf_MEMCHECK_FLAGS) $(call valgrind_xml_flags,detect_feature_tests.elf,MEMCHECK)
memcheck-target-detect_feature_tests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(detect_feature_tests.elf_VALGRIND_TARGET_FLAGS) $(MEMCHECK_TARGET_FLAGS) $(detect_feature_tests.elf_MEMCHECK_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
memcheck-target-detect_feature_tests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
memcheck-target-detect_feature_tests.elf: VALGRIND_TARGET_EXECUTABLE=detect_feature_tests.elf
memcheck-target-detect_feature_tests.elf: VG_TOOL=memcheck
memcheck-target-detect_feature_tests.elf: $(BIN_DIR)/detect_feature_tests.elf $(VALGRIND)
memcheck-target-detect_feature_tests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
memcheck-target-detect_feature_tests.elf:
	$(call vg-version)
	$(call vg-caller)


memcheck-target: $(VG_LOCAL_VALGRIND) $(MEMCHECK_TARGET_TARGETS)
$(MEMCHECK_TARGET_TARGETS): $(SYNC_SETTINGS_MK_TMP)

### helgrind-target ###

HELGRIND_TARGET_TARGETS += helgrind-target-libconfigtoolutils_tests.elf
HELGRIND_TARGET_TARGETS += helgrind-target-config_linux_user_tests.elf
HELGRIND_TARGET_TARGETS += helgrind-target-reserved_area_tests.elf
HELGRIND_TARGET_TARGETS += helgrind-target-detect_feature_tests.elf

helgrind-target-helloworld.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(helloworld.elf_VALGRIND_FLAGS)        $(HELGRIND_FLAGS)        $(helloworld.elf_HELGRIND_FLAGS) $(call valgrind_xml_flags,helloworld.elf,HELGRIND)
helgrind-target-helloworld.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(helloworld.elf_VALGRIND_TARGET_FLAGS) $(HELGRIND_TARGET_FLAGS) $(helloworld.elf_HELGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
helgrind-target-helloworld.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
helgrind-target-helloworld.elf: VALGRIND_TARGET_EXECUTABLE=helloworld.elf
helgrind-target-helloworld.elf: VG_TOOL=helgrind
helgrind-target-helloworld.elf: $(BIN_DIR)/helloworld.elf $(VALGRIND)
helgrind-target-helloworld.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
helgrind-target-helloworld.elf:
	$(call vg-version)
	$(call vg-caller)

helgrind-target-config_linux_user.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(config_linux_user.elf_VALGRIND_FLAGS)        $(HELGRIND_FLAGS)        $(config_linux_user.elf_HELGRIND_FLAGS) $(call valgrind_xml_flags,config_linux_user.elf,HELGRIND)
helgrind-target-config_linux_user.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(config_linux_user.elf_VALGRIND_TARGET_FLAGS) $(HELGRIND_TARGET_FLAGS) $(config_linux_user.elf_HELGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
helgrind-target-config_linux_user.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
helgrind-target-config_linux_user.elf: VALGRIND_TARGET_EXECUTABLE=config_linux_user.elf
helgrind-target-config_linux_user.elf: VG_TOOL=helgrind
helgrind-target-config_linux_user.elf: $(BIN_DIR)/config_linux_user.elf $(VALGRIND)
helgrind-target-config_linux_user.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
helgrind-target-config_linux_user.elf:
	$(call vg-version)
	$(call vg-caller)

helgrind-target-reserved_area.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(reserved_area.elf_VALGRIND_FLAGS)        $(HELGRIND_FLAGS)        $(reserved_area.elf_HELGRIND_FLAGS) $(call valgrind_xml_flags,reserved_area.elf,HELGRIND)
helgrind-target-reserved_area.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(reserved_area.elf_VALGRIND_TARGET_FLAGS) $(HELGRIND_TARGET_FLAGS) $(reserved_area.elf_HELGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
helgrind-target-reserved_area.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
helgrind-target-reserved_area.elf: VALGRIND_TARGET_EXECUTABLE=reserved_area.elf
helgrind-target-reserved_area.elf: VG_TOOL=helgrind
helgrind-target-reserved_area.elf: $(BIN_DIR)/reserved_area.elf $(VALGRIND)
helgrind-target-reserved_area.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
helgrind-target-reserved_area.elf:
	$(call vg-version)
	$(call vg-caller)

helgrind-target-detect_feature.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(detect_feature.elf_VALGRIND_FLAGS)        $(HELGRIND_FLAGS)        $(detect_feature.elf_HELGRIND_FLAGS) $(call valgrind_xml_flags,detect_feature.elf,HELGRIND)
helgrind-target-detect_feature.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(detect_feature.elf_VALGRIND_TARGET_FLAGS) $(HELGRIND_TARGET_FLAGS) $(detect_feature.elf_HELGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
helgrind-target-detect_feature.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
helgrind-target-detect_feature.elf: VALGRIND_TARGET_EXECUTABLE=detect_feature.elf
helgrind-target-detect_feature.elf: VG_TOOL=helgrind
helgrind-target-detect_feature.elf: $(BIN_DIR)/detect_feature.elf $(VALGRIND)
helgrind-target-detect_feature.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
helgrind-target-detect_feature.elf:
	$(call vg-version)
	$(call vg-caller)

helgrind-target-libconfigtoolutils_tests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(libconfigtoolutils_tests.elf_VALGRIND_FLAGS)        $(HELGRIND_FLAGS)        $(libconfigtoolutils_tests.elf_HELGRIND_FLAGS) $(call valgrind_xml_flags,libconfigtoolutils_tests.elf,HELGRIND)
helgrind-target-libconfigtoolutils_tests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(libconfigtoolutils_tests.elf_VALGRIND_TARGET_FLAGS) $(HELGRIND_TARGET_FLAGS) $(libconfigtoolutils_tests.elf_HELGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
helgrind-target-libconfigtoolutils_tests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
helgrind-target-libconfigtoolutils_tests.elf: VALGRIND_TARGET_EXECUTABLE=libconfigtoolutils_tests.elf
helgrind-target-libconfigtoolutils_tests.elf: VG_TOOL=helgrind
helgrind-target-libconfigtoolutils_tests.elf: $(BIN_DIR)/libconfigtoolutils_tests.elf $(VALGRIND)
helgrind-target-libconfigtoolutils_tests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
helgrind-target-libconfigtoolutils_tests.elf:
	$(call vg-version)
	$(call vg-caller)

helgrind-target-config_linux_user_tests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(config_linux_user_tests.elf_VALGRIND_FLAGS)        $(HELGRIND_FLAGS)        $(config_linux_user_tests.elf_HELGRIND_FLAGS) $(call valgrind_xml_flags,config_linux_user_tests.elf,HELGRIND)
helgrind-target-config_linux_user_tests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(config_linux_user_tests.elf_VALGRIND_TARGET_FLAGS) $(HELGRIND_TARGET_FLAGS) $(config_linux_user_tests.elf_HELGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
helgrind-target-config_linux_user_tests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
helgrind-target-config_linux_user_tests.elf: VALGRIND_TARGET_EXECUTABLE=config_linux_user_tests.elf
helgrind-target-config_linux_user_tests.elf: VG_TOOL=helgrind
helgrind-target-config_linux_user_tests.elf: $(BIN_DIR)/config_linux_user_tests.elf $(VALGRIND)
helgrind-target-config_linux_user_tests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
helgrind-target-config_linux_user_tests.elf:
	$(call vg-version)
	$(call vg-caller)

helgrind-target-reserved_area_tests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(reserved_area_tests.elf_VALGRIND_FLAGS)        $(HELGRIND_FLAGS)        $(reserved_area_tests.elf_HELGRIND_FLAGS) $(call valgrind_xml_flags,reserved_area_tests.elf,HELGRIND)
helgrind-target-reserved_area_tests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(reserved_area_tests.elf_VALGRIND_TARGET_FLAGS) $(HELGRIND_TARGET_FLAGS) $(reserved_area_tests.elf_HELGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
helgrind-target-reserved_area_tests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
helgrind-target-reserved_area_tests.elf: VALGRIND_TARGET_EXECUTABLE=reserved_area_tests.elf
helgrind-target-reserved_area_tests.elf: VG_TOOL=helgrind
helgrind-target-reserved_area_tests.elf: $(BIN_DIR)/reserved_area_tests.elf $(VALGRIND)
helgrind-target-reserved_area_tests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
helgrind-target-reserved_area_tests.elf:
	$(call vg-version)
	$(call vg-caller)

helgrind-target-detect_feature_tests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(detect_feature_tests.elf_VALGRIND_FLAGS)        $(HELGRIND_FLAGS)        $(detect_feature_tests.elf_HELGRIND_FLAGS) $(call valgrind_xml_flags,detect_feature_tests.elf,HELGRIND)
helgrind-target-detect_feature_tests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(detect_feature_tests.elf_VALGRIND_TARGET_FLAGS) $(HELGRIND_TARGET_FLAGS) $(detect_feature_tests.elf_HELGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
helgrind-target-detect_feature_tests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
helgrind-target-detect_feature_tests.elf: VALGRIND_TARGET_EXECUTABLE=detect_feature_tests.elf
helgrind-target-detect_feature_tests.elf: VG_TOOL=helgrind
helgrind-target-detect_feature_tests.elf: $(BIN_DIR)/detect_feature_tests.elf $(VALGRIND)
helgrind-target-detect_feature_tests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
helgrind-target-detect_feature_tests.elf:
	$(call vg-version)
	$(call vg-caller)


helgrind-target: $(VG_LOCAL_VALGRIND) $(HELGRIND_TARGET_TARGETS)
$(HELGRIND_TARGET_TARGETS): $(SYNC_SETTINGS_MK_TMP)

### callgrind-target ###

CALLGRIND_TARGET_TARGETS += callgrind-target-libconfigtoolutils_tests.elf
CALLGRIND_TARGET_TARGETS += callgrind-target-config_linux_user_tests.elf
CALLGRIND_TARGET_TARGETS += callgrind-target-reserved_area_tests.elf
CALLGRIND_TARGET_TARGETS += callgrind-target-detect_feature_tests.elf

callgrind-target-helloworld.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(helloworld.elf_VALGRIND_FLAGS)        $(CALLGRIND_FLAGS)        $(helloworld.elf_CALLGRIND_FLAGS) $(call valgrind_xml_flags,helloworld.elf,CALLGRIND)
callgrind-target-helloworld.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(helloworld.elf_VALGRIND_TARGET_FLAGS) $(CALLGRIND_TARGET_FLAGS) $(helloworld.elf_CALLGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
callgrind-target-helloworld.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
callgrind-target-helloworld.elf: VALGRIND_TARGET_EXECUTABLE=helloworld.elf
callgrind-target-helloworld.elf: VG_TOOL=callgrind
callgrind-target-helloworld.elf: $(BIN_DIR)/helloworld.elf $(VALGRIND)
callgrind-target-helloworld.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
callgrind-target-helloworld.elf:
	$(call vg-version)
	$(call vg-caller)

callgrind-target-config_linux_user.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(config_linux_user.elf_VALGRIND_FLAGS)        $(CALLGRIND_FLAGS)        $(config_linux_user.elf_CALLGRIND_FLAGS) $(call valgrind_xml_flags,config_linux_user.elf,CALLGRIND)
callgrind-target-config_linux_user.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(config_linux_user.elf_VALGRIND_TARGET_FLAGS) $(CALLGRIND_TARGET_FLAGS) $(config_linux_user.elf_CALLGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
callgrind-target-config_linux_user.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
callgrind-target-config_linux_user.elf: VALGRIND_TARGET_EXECUTABLE=config_linux_user.elf
callgrind-target-config_linux_user.elf: VG_TOOL=callgrind
callgrind-target-config_linux_user.elf: $(BIN_DIR)/config_linux_user.elf $(VALGRIND)
callgrind-target-config_linux_user.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
callgrind-target-config_linux_user.elf:
	$(call vg-version)
	$(call vg-caller)

callgrind-target-reserved_area.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(reserved_area.elf_VALGRIND_FLAGS)        $(CALLGRIND_FLAGS)        $(reserved_area.elf_CALLGRIND_FLAGS) $(call valgrind_xml_flags,reserved_area.elf,CALLGRIND)
callgrind-target-reserved_area.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(reserved_area.elf_VALGRIND_TARGET_FLAGS) $(CALLGRIND_TARGET_FLAGS) $(reserved_area.elf_CALLGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
callgrind-target-reserved_area.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
callgrind-target-reserved_area.elf: VALGRIND_TARGET_EXECUTABLE=reserved_area.elf
callgrind-target-reserved_area.elf: VG_TOOL=callgrind
callgrind-target-reserved_area.elf: $(BIN_DIR)/reserved_area.elf $(VALGRIND)
callgrind-target-reserved_area.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
callgrind-target-reserved_area.elf:
	$(call vg-version)
	$(call vg-caller)

callgrind-target-detect_feature.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(detect_feature.elf_VALGRIND_FLAGS)        $(CALLGRIND_FLAGS)        $(detect_feature.elf_CALLGRIND_FLAGS) $(call valgrind_xml_flags,detect_feature.elf,CALLGRIND)
callgrind-target-detect_feature.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(detect_feature.elf_VALGRIND_TARGET_FLAGS) $(CALLGRIND_TARGET_FLAGS) $(detect_feature.elf_CALLGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
callgrind-target-detect_feature.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
callgrind-target-detect_feature.elf: VALGRIND_TARGET_EXECUTABLE=detect_feature.elf
callgrind-target-detect_feature.elf: VG_TOOL=callgrind
callgrind-target-detect_feature.elf: $(BIN_DIR)/detect_feature.elf $(VALGRIND)
callgrind-target-detect_feature.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
callgrind-target-detect_feature.elf:
	$(call vg-version)
	$(call vg-caller)

callgrind-target-libconfigtoolutils_tests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(libconfigtoolutils_tests.elf_VALGRIND_FLAGS)        $(CALLGRIND_FLAGS)        $(libconfigtoolutils_tests.elf_CALLGRIND_FLAGS) $(call valgrind_xml_flags,libconfigtoolutils_tests.elf,CALLGRIND)
callgrind-target-libconfigtoolutils_tests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(libconfigtoolutils_tests.elf_VALGRIND_TARGET_FLAGS) $(CALLGRIND_TARGET_FLAGS) $(libconfigtoolutils_tests.elf_CALLGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
callgrind-target-libconfigtoolutils_tests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
callgrind-target-libconfigtoolutils_tests.elf: VALGRIND_TARGET_EXECUTABLE=libconfigtoolutils_tests.elf
callgrind-target-libconfigtoolutils_tests.elf: VG_TOOL=callgrind
callgrind-target-libconfigtoolutils_tests.elf: $(BIN_DIR)/libconfigtoolutils_tests.elf $(VALGRIND)
callgrind-target-libconfigtoolutils_tests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
callgrind-target-libconfigtoolutils_tests.elf:
	$(call vg-version)
	$(call vg-caller)

callgrind-target-config_linux_user_tests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(config_linux_user_tests.elf_VALGRIND_FLAGS)        $(CALLGRIND_FLAGS)        $(config_linux_user_tests.elf_CALLGRIND_FLAGS) $(call valgrind_xml_flags,config_linux_user_tests.elf,CALLGRIND)
callgrind-target-config_linux_user_tests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(config_linux_user_tests.elf_VALGRIND_TARGET_FLAGS) $(CALLGRIND_TARGET_FLAGS) $(config_linux_user_tests.elf_CALLGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
callgrind-target-config_linux_user_tests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
callgrind-target-config_linux_user_tests.elf: VALGRIND_TARGET_EXECUTABLE=config_linux_user_tests.elf
callgrind-target-config_linux_user_tests.elf: VG_TOOL=callgrind
callgrind-target-config_linux_user_tests.elf: $(BIN_DIR)/config_linux_user_tests.elf $(VALGRIND)
callgrind-target-config_linux_user_tests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
callgrind-target-config_linux_user_tests.elf:
	$(call vg-version)
	$(call vg-caller)

callgrind-target-reserved_area_tests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(reserved_area_tests.elf_VALGRIND_FLAGS)        $(CALLGRIND_FLAGS)        $(reserved_area_tests.elf_CALLGRIND_FLAGS) $(call valgrind_xml_flags,reserved_area_tests.elf,CALLGRIND)
callgrind-target-reserved_area_tests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(reserved_area_tests.elf_VALGRIND_TARGET_FLAGS) $(CALLGRIND_TARGET_FLAGS) $(reserved_area_tests.elf_CALLGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
callgrind-target-reserved_area_tests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
callgrind-target-reserved_area_tests.elf: VALGRIND_TARGET_EXECUTABLE=reserved_area_tests.elf
callgrind-target-reserved_area_tests.elf: VG_TOOL=callgrind
callgrind-target-reserved_area_tests.elf: $(BIN_DIR)/reserved_area_tests.elf $(VALGRIND)
callgrind-target-reserved_area_tests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
callgrind-target-reserved_area_tests.elf:
	$(call vg-version)
	$(call vg-caller)

callgrind-target-detect_feature_tests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(detect_feature_tests.elf_VALGRIND_FLAGS)        $(CALLGRIND_FLAGS)        $(detect_feature_tests.elf_CALLGRIND_FLAGS) $(call valgrind_xml_flags,detect_feature_tests.elf,CALLGRIND)
callgrind-target-detect_feature_tests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(detect_feature_tests.elf_VALGRIND_TARGET_FLAGS) $(CALLGRIND_TARGET_FLAGS) $(detect_feature_tests.elf_CALLGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
callgrind-target-detect_feature_tests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
callgrind-target-detect_feature_tests.elf: VALGRIND_TARGET_EXECUTABLE=detect_feature_tests.elf
callgrind-target-detect_feature_tests.elf: VG_TOOL=callgrind
callgrind-target-detect_feature_tests.elf: $(BIN_DIR)/detect_feature_tests.elf $(VALGRIND)
callgrind-target-detect_feature_tests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
callgrind-target-detect_feature_tests.elf:
	$(call vg-version)
	$(call vg-caller)


callgrind-target: $(VG_LOCAL_VALGRIND) $(CALLGRIND_TARGET_TARGETS)
$(CALLGRIND_TARGET_TARGETS): $(SYNC_SETTINGS_MK_TMP)

### cachegrind-target ###

CACHEGRIND_TARGET_TARGETS += cachegrind-target-libconfigtoolutils_tests.elf
CACHEGRIND_TARGET_TARGETS += cachegrind-target-config_linux_user_tests.elf
CACHEGRIND_TARGET_TARGETS += cachegrind-target-reserved_area_tests.elf
CACHEGRIND_TARGET_TARGETS += cachegrind-target-detect_feature_tests.elf

cachegrind-target-helloworld.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(helloworld.elf_VALGRIND_FLAGS)        $(CACHEGRIND_FLAGS)        $(helloworld.elf_CACHEGRIND_FLAGS) $(call valgrind_xml_flags,helloworld.elf,CACHEGRIND)
cachegrind-target-helloworld.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(helloworld.elf_VALGRIND_TARGET_FLAGS) $(CACHEGRIND_TARGET_FLAGS) $(helloworld.elf_CACHEGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
cachegrind-target-helloworld.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
cachegrind-target-helloworld.elf: VALGRIND_TARGET_EXECUTABLE=helloworld.elf
cachegrind-target-helloworld.elf: VG_TOOL=cachegrind
cachegrind-target-helloworld.elf: $(BIN_DIR)/helloworld.elf $(VALGRIND)
cachegrind-target-helloworld.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
cachegrind-target-helloworld.elf:
	$(call vg-version)
	$(call vg-caller)

cachegrind-target-config_linux_user.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(config_linux_user.elf_VALGRIND_FLAGS)        $(CACHEGRIND_FLAGS)        $(config_linux_user.elf_CACHEGRIND_FLAGS) $(call valgrind_xml_flags,config_linux_user.elf,CACHEGRIND)
cachegrind-target-config_linux_user.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(config_linux_user.elf_VALGRIND_TARGET_FLAGS) $(CACHEGRIND_TARGET_FLAGS) $(config_linux_user.elf_CACHEGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
cachegrind-target-config_linux_user.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
cachegrind-target-config_linux_user.elf: VALGRIND_TARGET_EXECUTABLE=config_linux_user.elf
cachegrind-target-config_linux_user.elf: VG_TOOL=cachegrind
cachegrind-target-config_linux_user.elf: $(BIN_DIR)/config_linux_user.elf $(VALGRIND)
cachegrind-target-config_linux_user.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
cachegrind-target-config_linux_user.elf:
	$(call vg-version)
	$(call vg-caller)

cachegrind-target-reserved_area.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(reserved_area.elf_VALGRIND_FLAGS)        $(CACHEGRIND_FLAGS)        $(reserved_area.elf_CACHEGRIND_FLAGS) $(call valgrind_xml_flags,reserved_area.elf,CACHEGRIND)
cachegrind-target-reserved_area.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(reserved_area.elf_VALGRIND_TARGET_FLAGS) $(CACHEGRIND_TARGET_FLAGS) $(reserved_area.elf_CACHEGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
cachegrind-target-reserved_area.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
cachegrind-target-reserved_area.elf: VALGRIND_TARGET_EXECUTABLE=reserved_area.elf
cachegrind-target-reserved_area.elf: VG_TOOL=cachegrind
cachegrind-target-reserved_area.elf: $(BIN_DIR)/reserved_area.elf $(VALGRIND)
cachegrind-target-reserved_area.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
cachegrind-target-reserved_area.elf:
	$(call vg-version)
	$(call vg-caller)

cachegrind-target-detect_feature.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(detect_feature.elf_VALGRIND_FLAGS)        $(CACHEGRIND_FLAGS)        $(detect_feature.elf_CACHEGRIND_FLAGS) $(call valgrind_xml_flags,detect_feature.elf,CACHEGRIND)
cachegrind-target-detect_feature.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(detect_feature.elf_VALGRIND_TARGET_FLAGS) $(CACHEGRIND_TARGET_FLAGS) $(detect_feature.elf_CACHEGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
cachegrind-target-detect_feature.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
cachegrind-target-detect_feature.elf: VALGRIND_TARGET_EXECUTABLE=detect_feature.elf
cachegrind-target-detect_feature.elf: VG_TOOL=cachegrind
cachegrind-target-detect_feature.elf: $(BIN_DIR)/detect_feature.elf $(VALGRIND)
cachegrind-target-detect_feature.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
cachegrind-target-detect_feature.elf:
	$(call vg-version)
	$(call vg-caller)

cachegrind-target-libconfigtoolutils_tests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(libconfigtoolutils_tests.elf_VALGRIND_FLAGS)        $(CACHEGRIND_FLAGS)        $(libconfigtoolutils_tests.elf_CACHEGRIND_FLAGS) $(call valgrind_xml_flags,libconfigtoolutils_tests.elf,CACHEGRIND)
cachegrind-target-libconfigtoolutils_tests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(libconfigtoolutils_tests.elf_VALGRIND_TARGET_FLAGS) $(CACHEGRIND_TARGET_FLAGS) $(libconfigtoolutils_tests.elf_CACHEGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
cachegrind-target-libconfigtoolutils_tests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
cachegrind-target-libconfigtoolutils_tests.elf: VALGRIND_TARGET_EXECUTABLE=libconfigtoolutils_tests.elf
cachegrind-target-libconfigtoolutils_tests.elf: VG_TOOL=cachegrind
cachegrind-target-libconfigtoolutils_tests.elf: $(BIN_DIR)/libconfigtoolutils_tests.elf $(VALGRIND)
cachegrind-target-libconfigtoolutils_tests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
cachegrind-target-libconfigtoolutils_tests.elf:
	$(call vg-version)
	$(call vg-caller)

cachegrind-target-config_linux_user_tests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(config_linux_user_tests.elf_VALGRIND_FLAGS)        $(CACHEGRIND_FLAGS)        $(config_linux_user_tests.elf_CACHEGRIND_FLAGS) $(call valgrind_xml_flags,config_linux_user_tests.elf,CACHEGRIND)
cachegrind-target-config_linux_user_tests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(config_linux_user_tests.elf_VALGRIND_TARGET_FLAGS) $(CACHEGRIND_TARGET_FLAGS) $(config_linux_user_tests.elf_CACHEGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
cachegrind-target-config_linux_user_tests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
cachegrind-target-config_linux_user_tests.elf: VALGRIND_TARGET_EXECUTABLE=config_linux_user_tests.elf
cachegrind-target-config_linux_user_tests.elf: VG_TOOL=cachegrind
cachegrind-target-config_linux_user_tests.elf: $(BIN_DIR)/config_linux_user_tests.elf $(VALGRIND)
cachegrind-target-config_linux_user_tests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
cachegrind-target-config_linux_user_tests.elf:
	$(call vg-version)
	$(call vg-caller)

cachegrind-target-reserved_area_tests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(reserved_area_tests.elf_VALGRIND_FLAGS)        $(CACHEGRIND_FLAGS)        $(reserved_area_tests.elf_CACHEGRIND_FLAGS) $(call valgrind_xml_flags,reserved_area_tests.elf,CACHEGRIND)
cachegrind-target-reserved_area_tests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(reserved_area_tests.elf_VALGRIND_TARGET_FLAGS) $(CACHEGRIND_TARGET_FLAGS) $(reserved_area_tests.elf_CACHEGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
cachegrind-target-reserved_area_tests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
cachegrind-target-reserved_area_tests.elf: VALGRIND_TARGET_EXECUTABLE=reserved_area_tests.elf
cachegrind-target-reserved_area_tests.elf: VG_TOOL=cachegrind
cachegrind-target-reserved_area_tests.elf: $(BIN_DIR)/reserved_area_tests.elf $(VALGRIND)
cachegrind-target-reserved_area_tests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
cachegrind-target-reserved_area_tests.elf:
	$(call vg-version)
	$(call vg-caller)

cachegrind-target-detect_feature_tests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(detect_feature_tests.elf_VALGRIND_FLAGS)        $(CACHEGRIND_FLAGS)        $(detect_feature_tests.elf_CACHEGRIND_FLAGS) $(call valgrind_xml_flags,detect_feature_tests.elf,CACHEGRIND)
cachegrind-target-detect_feature_tests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(detect_feature_tests.elf_VALGRIND_TARGET_FLAGS) $(CACHEGRIND_TARGET_FLAGS) $(detect_feature_tests.elf_CACHEGRIND_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
cachegrind-target-detect_feature_tests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
cachegrind-target-detect_feature_tests.elf: VALGRIND_TARGET_EXECUTABLE=detect_feature_tests.elf
cachegrind-target-detect_feature_tests.elf: VG_TOOL=cachegrind
cachegrind-target-detect_feature_tests.elf: $(BIN_DIR)/detect_feature_tests.elf $(VALGRIND)
cachegrind-target-detect_feature_tests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
cachegrind-target-detect_feature_tests.elf:
	$(call vg-version)
	$(call vg-caller)


cachegrind-target: $(VG_LOCAL_VALGRIND) $(CACHEGRIND_TARGET_TARGETS)
$(CACHEGRIND_TARGET_TARGETS): $(SYNC_SETTINGS_MK_TMP)

### massif-target ###

MASSIF_TARGET_TARGETS += massif-target-libconfigtoolutils_tests.elf
MASSIF_TARGET_TARGETS += massif-target-config_linux_user_tests.elf
MASSIF_TARGET_TARGETS += massif-target-reserved_area_tests.elf
MASSIF_TARGET_TARGETS += massif-target-detect_feature_tests.elf

massif-target-helloworld.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(helloworld.elf_VALGRIND_FLAGS)        $(MASSIF_FLAGS)        $(helloworld.elf_MASSIF_FLAGS) $(call valgrind_xml_flags,helloworld.elf,MASSIF)
massif-target-helloworld.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(helloworld.elf_VALGRIND_TARGET_FLAGS) $(MASSIF_TARGET_FLAGS) $(helloworld.elf_MASSIF_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
massif-target-helloworld.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
massif-target-helloworld.elf: VALGRIND_TARGET_EXECUTABLE=helloworld.elf
massif-target-helloworld.elf: VG_TOOL=massif
massif-target-helloworld.elf: $(BIN_DIR)/helloworld.elf $(VALGRIND)
massif-target-helloworld.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
massif-target-helloworld.elf:
	$(call vg-version)
	$(call vg-caller)

massif-target-config_linux_user.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(config_linux_user.elf_VALGRIND_FLAGS)        $(MASSIF_FLAGS)        $(config_linux_user.elf_MASSIF_FLAGS) $(call valgrind_xml_flags,config_linux_user.elf,MASSIF)
massif-target-config_linux_user.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(config_linux_user.elf_VALGRIND_TARGET_FLAGS) $(MASSIF_TARGET_FLAGS) $(config_linux_user.elf_MASSIF_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
massif-target-config_linux_user.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
massif-target-config_linux_user.elf: VALGRIND_TARGET_EXECUTABLE=config_linux_user.elf
massif-target-config_linux_user.elf: VG_TOOL=massif
massif-target-config_linux_user.elf: $(BIN_DIR)/config_linux_user.elf $(VALGRIND)
massif-target-config_linux_user.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
massif-target-config_linux_user.elf:
	$(call vg-version)
	$(call vg-caller)

massif-target-reserved_area.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(reserved_area.elf_VALGRIND_FLAGS)        $(MASSIF_FLAGS)        $(reserved_area.elf_MASSIF_FLAGS) $(call valgrind_xml_flags,reserved_area.elf,MASSIF)
massif-target-reserved_area.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(reserved_area.elf_VALGRIND_TARGET_FLAGS) $(MASSIF_TARGET_FLAGS) $(reserved_area.elf_MASSIF_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
massif-target-reserved_area.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
massif-target-reserved_area.elf: VALGRIND_TARGET_EXECUTABLE=reserved_area.elf
massif-target-reserved_area.elf: VG_TOOL=massif
massif-target-reserved_area.elf: $(BIN_DIR)/reserved_area.elf $(VALGRIND)
massif-target-reserved_area.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
massif-target-reserved_area.elf:
	$(call vg-version)
	$(call vg-caller)

massif-target-detect_feature.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(detect_feature.elf_VALGRIND_FLAGS)        $(MASSIF_FLAGS)        $(detect_feature.elf_MASSIF_FLAGS) $(call valgrind_xml_flags,detect_feature.elf,MASSIF)
massif-target-detect_feature.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(detect_feature.elf_VALGRIND_TARGET_FLAGS) $(MASSIF_TARGET_FLAGS) $(detect_feature.elf_MASSIF_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
massif-target-detect_feature.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
massif-target-detect_feature.elf: VALGRIND_TARGET_EXECUTABLE=detect_feature.elf
massif-target-detect_feature.elf: VG_TOOL=massif
massif-target-detect_feature.elf: $(BIN_DIR)/detect_feature.elf $(VALGRIND)
massif-target-detect_feature.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
massif-target-detect_feature.elf:
	$(call vg-version)
	$(call vg-caller)

massif-target-libconfigtoolutils_tests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(libconfigtoolutils_tests.elf_VALGRIND_FLAGS)        $(MASSIF_FLAGS)        $(libconfigtoolutils_tests.elf_MASSIF_FLAGS) $(call valgrind_xml_flags,libconfigtoolutils_tests.elf,MASSIF)
massif-target-libconfigtoolutils_tests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(libconfigtoolutils_tests.elf_VALGRIND_TARGET_FLAGS) $(MASSIF_TARGET_FLAGS) $(libconfigtoolutils_tests.elf_MASSIF_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
massif-target-libconfigtoolutils_tests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
massif-target-libconfigtoolutils_tests.elf: VALGRIND_TARGET_EXECUTABLE=libconfigtoolutils_tests.elf
massif-target-libconfigtoolutils_tests.elf: VG_TOOL=massif
massif-target-libconfigtoolutils_tests.elf: $(BIN_DIR)/libconfigtoolutils_tests.elf $(VALGRIND)
massif-target-libconfigtoolutils_tests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
massif-target-libconfigtoolutils_tests.elf:
	$(call vg-version)
	$(call vg-caller)

massif-target-config_linux_user_tests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(config_linux_user_tests.elf_VALGRIND_FLAGS)        $(MASSIF_FLAGS)        $(config_linux_user_tests.elf_MASSIF_FLAGS) $(call valgrind_xml_flags,config_linux_user_tests.elf,MASSIF)
massif-target-config_linux_user_tests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(config_linux_user_tests.elf_VALGRIND_TARGET_FLAGS) $(MASSIF_TARGET_FLAGS) $(config_linux_user_tests.elf_MASSIF_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
massif-target-config_linux_user_tests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
massif-target-config_linux_user_tests.elf: VALGRIND_TARGET_EXECUTABLE=config_linux_user_tests.elf
massif-target-config_linux_user_tests.elf: VG_TOOL=massif
massif-target-config_linux_user_tests.elf: $(BIN_DIR)/config_linux_user_tests.elf $(VALGRIND)
massif-target-config_linux_user_tests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
massif-target-config_linux_user_tests.elf:
	$(call vg-version)
	$(call vg-caller)

massif-target-reserved_area_tests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(reserved_area_tests.elf_VALGRIND_FLAGS)        $(MASSIF_FLAGS)        $(reserved_area_tests.elf_MASSIF_FLAGS) $(call valgrind_xml_flags,reserved_area_tests.elf,MASSIF)
massif-target-reserved_area_tests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(reserved_area_tests.elf_VALGRIND_TARGET_FLAGS) $(MASSIF_TARGET_FLAGS) $(reserved_area_tests.elf_MASSIF_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
massif-target-reserved_area_tests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
massif-target-reserved_area_tests.elf: VALGRIND_TARGET_EXECUTABLE=reserved_area_tests.elf
massif-target-reserved_area_tests.elf: VG_TOOL=massif
massif-target-reserved_area_tests.elf: $(BIN_DIR)/reserved_area_tests.elf $(VALGRIND)
massif-target-reserved_area_tests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
massif-target-reserved_area_tests.elf:
	$(call vg-version)
	$(call vg-caller)

massif-target-detect_feature_tests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(detect_feature_tests.elf_VALGRIND_FLAGS)        $(MASSIF_FLAGS)        $(detect_feature_tests.elf_MASSIF_FLAGS) $(call valgrind_xml_flags,detect_feature_tests.elf,MASSIF)
massif-target-detect_feature_tests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(detect_feature_tests.elf_VALGRIND_TARGET_FLAGS) $(MASSIF_TARGET_FLAGS) $(detect_feature_tests.elf_MASSIF_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
massif-target-detect_feature_tests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
massif-target-detect_feature_tests.elf: VALGRIND_TARGET_EXECUTABLE=detect_feature_tests.elf
massif-target-detect_feature_tests.elf: VG_TOOL=massif
massif-target-detect_feature_tests.elf: $(BIN_DIR)/detect_feature_tests.elf $(VALGRIND)
massif-target-detect_feature_tests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
massif-target-detect_feature_tests.elf:
	$(call vg-version)
	$(call vg-caller)


massif-target: $(VG_LOCAL_VALGRIND) $(MASSIF_TARGET_TARGETS)
$(MASSIF_TARGET_TARGETS): $(SYNC_SETTINGS_MK_TMP)

### drd-target ###

DRD_TARGET_TARGETS += drd-target-libconfigtoolutils_tests.elf
DRD_TARGET_TARGETS += drd-target-config_linux_user_tests.elf
DRD_TARGET_TARGETS += drd-target-reserved_area_tests.elf
DRD_TARGET_TARGETS += drd-target-detect_feature_tests.elf

drd-target-helloworld.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(helloworld.elf_VALGRIND_FLAGS)        $(DRD_FLAGS)        $(helloworld.elf_DRD_FLAGS) $(call valgrind_xml_flags,helloworld.elf,DRD)
drd-target-helloworld.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(helloworld.elf_VALGRIND_TARGET_FLAGS) $(DRD_TARGET_FLAGS) $(helloworld.elf_DRD_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
drd-target-helloworld.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
drd-target-helloworld.elf: VALGRIND_TARGET_EXECUTABLE=helloworld.elf
drd-target-helloworld.elf: VG_TOOL=drd
drd-target-helloworld.elf: $(BIN_DIR)/helloworld.elf $(VALGRIND)
drd-target-helloworld.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
drd-target-helloworld.elf:
	$(call vg-version)
	$(call vg-caller)

drd-target-config_linux_user.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(config_linux_user.elf_VALGRIND_FLAGS)        $(DRD_FLAGS)        $(config_linux_user.elf_DRD_FLAGS) $(call valgrind_xml_flags,config_linux_user.elf,DRD)
drd-target-config_linux_user.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(config_linux_user.elf_VALGRIND_TARGET_FLAGS) $(DRD_TARGET_FLAGS) $(config_linux_user.elf_DRD_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
drd-target-config_linux_user.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
drd-target-config_linux_user.elf: VALGRIND_TARGET_EXECUTABLE=config_linux_user.elf
drd-target-config_linux_user.elf: VG_TOOL=drd
drd-target-config_linux_user.elf: $(BIN_DIR)/config_linux_user.elf $(VALGRIND)
drd-target-config_linux_user.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
drd-target-config_linux_user.elf:
	$(call vg-version)
	$(call vg-caller)

drd-target-reserved_area.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(reserved_area.elf_VALGRIND_FLAGS)        $(DRD_FLAGS)        $(reserved_area.elf_DRD_FLAGS) $(call valgrind_xml_flags,reserved_area.elf,DRD)
drd-target-reserved_area.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(reserved_area.elf_VALGRIND_TARGET_FLAGS) $(DRD_TARGET_FLAGS) $(reserved_area.elf_DRD_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
drd-target-reserved_area.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
drd-target-reserved_area.elf: VALGRIND_TARGET_EXECUTABLE=reserved_area.elf
drd-target-reserved_area.elf: VG_TOOL=drd
drd-target-reserved_area.elf: $(BIN_DIR)/reserved_area.elf $(VALGRIND)
drd-target-reserved_area.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
drd-target-reserved_area.elf:
	$(call vg-version)
	$(call vg-caller)

drd-target-detect_feature.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(detect_feature.elf_VALGRIND_FLAGS)        $(DRD_FLAGS)        $(detect_feature.elf_DRD_FLAGS) $(call valgrind_xml_flags,detect_feature.elf,DRD)
drd-target-detect_feature.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(detect_feature.elf_VALGRIND_TARGET_FLAGS) $(DRD_TARGET_FLAGS) $(detect_feature.elf_DRD_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
drd-target-detect_feature.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
drd-target-detect_feature.elf: VALGRIND_TARGET_EXECUTABLE=detect_feature.elf
drd-target-detect_feature.elf: VG_TOOL=drd
drd-target-detect_feature.elf: $(BIN_DIR)/detect_feature.elf $(VALGRIND)
drd-target-detect_feature.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
drd-target-detect_feature.elf:
	$(call vg-version)
	$(call vg-caller)

drd-target-libconfigtoolutils_tests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(libconfigtoolutils_tests.elf_VALGRIND_FLAGS)        $(DRD_FLAGS)        $(libconfigtoolutils_tests.elf_DRD_FLAGS) $(call valgrind_xml_flags,libconfigtoolutils_tests.elf,DRD)
drd-target-libconfigtoolutils_tests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(libconfigtoolutils_tests.elf_VALGRIND_TARGET_FLAGS) $(DRD_TARGET_FLAGS) $(libconfigtoolutils_tests.elf_DRD_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
drd-target-libconfigtoolutils_tests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
drd-target-libconfigtoolutils_tests.elf: VALGRIND_TARGET_EXECUTABLE=libconfigtoolutils_tests.elf
drd-target-libconfigtoolutils_tests.elf: VG_TOOL=drd
drd-target-libconfigtoolutils_tests.elf: $(BIN_DIR)/libconfigtoolutils_tests.elf $(VALGRIND)
drd-target-libconfigtoolutils_tests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
drd-target-libconfigtoolutils_tests.elf:
	$(call vg-version)
	$(call vg-caller)

drd-target-config_linux_user_tests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(config_linux_user_tests.elf_VALGRIND_FLAGS)        $(DRD_FLAGS)        $(config_linux_user_tests.elf_DRD_FLAGS) $(call valgrind_xml_flags,config_linux_user_tests.elf,DRD)
drd-target-config_linux_user_tests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(config_linux_user_tests.elf_VALGRIND_TARGET_FLAGS) $(DRD_TARGET_FLAGS) $(config_linux_user_tests.elf_DRD_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
drd-target-config_linux_user_tests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
drd-target-config_linux_user_tests.elf: VALGRIND_TARGET_EXECUTABLE=config_linux_user_tests.elf
drd-target-config_linux_user_tests.elf: VG_TOOL=drd
drd-target-config_linux_user_tests.elf: $(BIN_DIR)/config_linux_user_tests.elf $(VALGRIND)
drd-target-config_linux_user_tests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
drd-target-config_linux_user_tests.elf:
	$(call vg-version)
	$(call vg-caller)

drd-target-reserved_area_tests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(reserved_area_tests.elf_VALGRIND_FLAGS)        $(DRD_FLAGS)        $(reserved_area_tests.elf_DRD_FLAGS) $(call valgrind_xml_flags,reserved_area_tests.elf,DRD)
drd-target-reserved_area_tests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(reserved_area_tests.elf_VALGRIND_TARGET_FLAGS) $(DRD_TARGET_FLAGS) $(reserved_area_tests.elf_DRD_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
drd-target-reserved_area_tests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
drd-target-reserved_area_tests.elf: VALGRIND_TARGET_EXECUTABLE=reserved_area_tests.elf
drd-target-reserved_area_tests.elf: VG_TOOL=drd
drd-target-reserved_area_tests.elf: $(BIN_DIR)/reserved_area_tests.elf $(VALGRIND)
drd-target-reserved_area_tests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
drd-target-reserved_area_tests.elf:
	$(call vg-version)
	$(call vg-caller)

drd-target-detect_feature_tests.elf: VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL = $(VALGRIND_FLAGS)        $(detect_feature_tests.elf_VALGRIND_FLAGS)        $(DRD_FLAGS)        $(detect_feature_tests.elf_DRD_FLAGS) $(call valgrind_xml_flags,detect_feature_tests.elf,DRD)
drd-target-detect_feature_tests.elf: VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL = $(VALGRIND_TARGET_FLAGS) $(detect_feature_tests.elf_VALGRIND_TARGET_FLAGS) $(DRD_TARGET_FLAGS) $(detect_feature_tests.elf_DRD_TARGET_FLAGS) $(VALGRIND_GTEST_FILTER_FLAGS)
drd-target-detect_feature_tests.elf: VALGRIND_GTEST_FILTER?=*:-*_Target*.*:*.*_Target*
drd-target-detect_feature_tests.elf: VALGRIND_TARGET_EXECUTABLE=detect_feature_tests.elf
drd-target-detect_feature_tests.elf: VG_TOOL=drd
drd-target-detect_feature_tests.elf: $(BIN_DIR)/detect_feature_tests.elf $(VALGRIND)
drd-target-detect_feature_tests.elf: VALGRIND_ARGS=$(VALGRIND_BUILDTARGET_TOOL_FLAGS_CALL) $(VG_ABS_DUT) $(VALGRIND_BUILDTARGET_TOOL_TARGET_FLAGS_CALL)
drd-target-detect_feature_tests.elf:
	$(call vg-version)
	$(call vg-caller)


drd-target: $(VG_LOCAL_VALGRIND) $(DRD_TARGET_TARGETS)
$(DRD_TARGET_TARGETS): $(SYNC_SETTINGS_MK_TMP)

