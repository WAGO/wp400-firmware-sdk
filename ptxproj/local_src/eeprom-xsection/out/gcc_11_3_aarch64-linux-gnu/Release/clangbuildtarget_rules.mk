CPPFLAGS := $(CPPFLAGS)
CFLAGS := $(CFLAGS)
CXXFLAGS := $(CXXFLAGS)
LDFLAGS := $(LDFLAGS)
ARFLAGS := $(ARFLAGS)

eeprom-xsection.elf_SOURCES := $(eeprom-xsection.elf_SOURCES)
eeprom-xsection.elf_GENHEADERS := $(eeprom-xsection.elf_GENHEADERS)
eeprom-xsection.elf_CPPFLAGS := $(eeprom-xsection.elf_CPPFLAGS)
eeprom-xsection.elf_CFLAGS := $(eeprom-xsection.elf_CFLAGS)
eeprom-xsection.elf_CXXFLAGS := $(eeprom-xsection.elf_CXXFLAGS)
eeprom-xsection.elf_LDFLAGS := $(eeprom-xsection.elf_LDFLAGS)
eeprom-xsection.elf_ARFLAGS := $(eeprom-xsection.elf_ARFLAGS)

OBJECT_FILES := $(OBJECT_FILES)
DEP_FILES := $(DEP_FILES)
OUT_DIRS := $(call sort,$(OUT_DIR)/ $(dir $(OBJECT_FILES)) $(OUT_DIRS))
GEN_DIRS := $(call sort,$(BIN_DIR)/ $(OUT_DIRS) $(GEN_DIRS))

$(DEP_FILES) : | $(GEN_DIRS)

-include $(DEP_FILES)

$(if $(filter CLANG_TIDY_BASE_CHECKS CLANG_TIDY_CHECKS,$(CLANG_TIDY_RULESET)),$(error CLANG_TIDY_RULESET has "$(CLANG_TIDY_RULESET)" assigned to it. Instead, assign "$$($(CLANG_TIDY_RULESET))"))

eeprom-xsection.elf_LINT_SOURCES ?= $(filter-out $(eeprom-xsection.elf_NOLINT_SOURCES),$(eeprom-xsection.elf_SOURCES))
OBJS_eeprom-xsection.elf := $(call objs,$(eeprom-xsection.elf_SOURCES),eeprom-xsection.elf/)
DEPS_eeprom-xsection.elf := $(call deps,$(eeprom-xsection.elf_SOURCES),eeprom-xsection.elf/)
GCNOS_NATIVE_eeprom-xsection.elf = $(call gcnos,$(eeprom-xsection.elf_SOURCES),eeprom-xsection.elf/)
GCNOS_TRANSITIVE_eeprom-xsection.elf = $(sort $(GCNOS_NATIVE_eeprom-xsection.elf) )
GCNO_TARGETS_NATIVE_eeprom-xsection.elf = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/eeprom-xsection.elf/gcovr/gcda/%,$(GCNOS_NATIVE_eeprom-xsection.elf))
GCNO_TARGETS_TRANSITIVE_eeprom-xsection.elf = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/eeprom-xsection.elf/gcovr/gcda/%,$(GCNOS_TRANSITIVE_eeprom-xsection.elf))
.PRECIOUS: $(GCNO_TARGETS_TRANSITIVE_eeprom-xsection.elf)
GCOV_TARGETS_NATIVE_eeprom-xsection.elf = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_NATIVE_eeprom-xsection.elf))
GCOV_TARGETS_TRANSITIVE_eeprom-xsection.elf = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_TRANSITIVE_eeprom-xsection.elf))
LOBS_eeprom-xsection.elf := $(call lobs,$(eeprom-xsection.elf_LINT_SOURCES),eeprom-xsection.elf/)
TIDYS_eeprom-xsection.elf := $(call tidys,$(eeprom-xsection.elf_LINT_SOURCES),eeprom-xsection.elf/)
$(TIDYS_eeprom-xsection.elf): $(eeprom-xsection.elf_PRECLANG_FILES)
PLINTS_eeprom-xsection.elf := $(call plints,$(eeprom-xsection.elf_LINT_SOURCES),eeprom-xsection.elf/)
$(PLINTS_eeprom-xsection.elf): $(eeprom-xsection.elf_PRECLANG_FILES)

eeprom-xsection.elf_OUT_OF_SOURCETREE = $(filter-out $(PROJECT_ROOT)/%,$(eeprom-xsection.elf_SOURCES))
$(if $(strip $(eeprom-xsection.elf_OUT_OF_SOURCETREE)),$(warning Source file lists need to start with $$(PROJECT_ROOT). eeprom-xsection.elf_SOURCES -> $(eeprom-xsection.elf_OUT_OF_SOURCETREE)),)

$(if $(filter CLANG_TIDY_BASE_CHECKS CLANG_TIDY_CHECKS,$(eeprom-xsection.elf_CLANG_TIDY_RULESET)),$(error eeprom-xsection.elf_CLANG_TIDY_RULESET has "$(eeprom-xsection.elf_CLANG_TIDY_RULESET)" assigned to it. Instead, assign "$$($(eeprom-xsection.elf_CLANG_TIDY_RULESET))"))

eeprom-xsection.elf: $(BIN_DIR)/eeprom-xsection.elf

$(DEPS_eeprom-xsection.elf) $(OBJS_eeprom-xsection.elf) $(LOBS_eeprom-xsection.elf) $(TIDYS_eeprom-xsection.elf) $(PLINTS_eeprom-xsection.elf) ./out/gcc_11_3_aarch64-linux-gnu/Release/eeprom-xsection.elf/lint_mac.h: BUILDTARGET_CPPFLAGS:=$(eeprom-xsection.elf_CPPFLAGS)

$(DEPS_eeprom-xsection.elf) $(OBJS_eeprom-xsection.elf) $(TIDYS_eeprom-xsection.elf) $(PLINTS_eeprom-xsection.elf) ./out/gcc_11_3_aarch64-linux-gnu/Release/eeprom-xsection.elf/lint_mac.h: BUILDTARGET_CXXFLAGS:=$(eeprom-xsection.elf_CXXFLAGS)

$(DEPS_eeprom-xsection.elf) $(OBJS_eeprom-xsection.elf) $(TIDYS_eeprom-xsection.elf) $(PLINTS_eeprom-xsection.elf) ./out/gcc_11_3_aarch64-linux-gnu/Release/eeprom-xsection.elf/lint_mac.h: BUILDTARGET_CFLAGS:=$(eeprom-xsection.elf_CFLAGS)

lint-eeprom-xsection.elf: flexelint-eeprom-xsection.elf clang-tidy-eeprom-xsection.elf

$(LOBS_eeprom-xsection.elf): BUILDTARGET_LINTFLAGS:=$(eeprom-xsection.elf_LINTFLAGS)

flexelint-eeprom-xsection.elf: $($(eeprom-xsection.elf_DISABLE_FLEXELINT)$(DISABLE_FLEXELINT)$(eeprom-xsection.elf_DISABLE_LINT)$(DISABLE_LINT)LOBS_eeprom-xsection.elf)

$(TIDYS_eeprom-xsection.elf): BUILDTARGET_TIDYFLAGS:=$(eeprom-xsection.elf_TIDYFLAGS) -isystem $(OUT_DIR)/eeprom-xsection.elf -include lint_mac.h

$(TIDYS_eeprom-xsection.elf): eeprom-xsection.elf_CLANG_TIDY_RULESET ?= $(CLANG_TIDY_RULESET)

$(TIDYS_eeprom-xsection.elf): CLANG_TIDY_CHECKS_OPTION:=$(subst $( ),$(,),$(strip $(eeprom-xsection.elf_CLANG_TIDY_RULESET) $(eeprom-xsection.elf_CLANG_TIDY_CHECKS)))

$(PLINTS_eeprom-xsection.elf): BUILDTARGET_PLINTFLAGS:=$(eeprom-xsection.elf_PLINTSFLAGS) -isystem $(OUT_DIR)/eeprom-xsection.elf -include lint_mac.h

clang-tidy-eeprom-xsection.elf: $($(eeprom-xsection.elf_DISABLE_CLANG_TIDY)$(DISABLE_CLANG_TIDY)$(eeprom-xsection.elf_DISABLE_LINT)$(DISABLE_LINT)TIDYS_eeprom-xsection.elf)

clean-clang-tidy-eeprom-xsection.elf:; $(SILENT)rm --force $(TIDYS_eeprom-xsection.elf)

clangsa-eeprom-xsection.elf: $(PLINTS_eeprom-xsection.elf)

./out/gcc_11_3_aarch64-linux-gnu/Release/info/eeprom-xsection.elf-info.txt: $(SCRIPT_DIR)/internal/clang/info_txt.template $(MK_FILES); $(SILENT)$(call clangbuild_subst_info_buildtarget,eeprom-xsection.elf,$<) > $@

info-txt-eeprom-xsection.elf: $(OUT_DIR)/info/eeprom-xsection.elf-info.txt; $(SILENT)cat $<

$(OUT_DIR)/eeprom-xsection.elf/%.o.d: $(PROJECT_ROOT)/% $(MK_FILES) $(MAKEDEP_SUPPORT_FILES) | $(eeprom-xsection.elf_GENHEADERS); $(SILENT)$(call makedep,$@,$<,$(FLAGS))

$(OUT_DIR)/eeprom-xsection.elf/%.o: $(PROJECT_ROOT)/% $(MK_FILES) $(CC_SUPPORT_FILES) | $(eeprom-xsection.elf_GENHEADERS); $(SILENT)$(call cc,$@,$<,$(FLAGS))

$(OUT_DIR)/eeprom-xsection.elf/%.lob: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) | $(eeprom-xsection.elf_GENHEADERS); $(SILENT)$(call lint,$@,$<,$(FLAGS))

eeprom-xsection.elf_PRECLANG_FILES=$(OUT_DIR)/eeprom-xsection.elf/lint_mac.h

$(OUT_DIR)/eeprom-xsection.elf/%.tidy: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(eeprom-xsection.elf_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Release/eeprom-xsection.elf/%.o.d $(wildcard .clang-tidy) | $(TIDY_SUPPORT_DIRS); $(SILENT)$(call clang-tidy,$@,$<,$(FLAGS))

$(OUT_DIR)/eeprom-xsection.elf/%.plint: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(eeprom-xsection.elf_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Release/eeprom-xsection.elf/%.o.d; $(SILENT)$(call clang-sa,$@,$<,$(FLAGS))



$(OUT_DIR)/eeprom-xsection.elf/gcovr/gcda/%.gcno: check-eeprom-xsection.elf; $(SILENT)mkdir -p $(dir $@) && cp $(OUT_DIR)/$*.gcno $@

$(OUT_DIR)/eeprom-xsection.elf.dbg: $(OBJS_eeprom-xsection.elf) $(MK_FILES) $(eeprom-xsection.elf_PREREQUISITES) $(LD_SUPPORT_FILES); $(SILENT)$(call ld$(ARTIFACT),eeprom-xsection.elf,$@,$(OBJS_eeprom-xsection.elf),$(LDFLAGS) $(eeprom-xsection.elf_LDFLAGS))

memcheck-eeprom-xsection.elf: $(BIN_DIR)/eeprom-xsection.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,eeprom-xsection.elf,./$(notdir $<),MEMCHECK)
helgrind-eeprom-xsection.elf: $(BIN_DIR)/eeprom-xsection.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,eeprom-xsection.elf,./$(notdir $<),HELGRIND)
callgrind-eeprom-xsection.elf: $(BIN_DIR)/eeprom-xsection.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,eeprom-xsection.elf,./$(notdir $<),CALLGRIND)
massif-eeprom-xsection.elf: $(BIN_DIR)/eeprom-xsection.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,eeprom-xsection.elf,./$(notdir $<),MASSIF)
nulgrind-eeprom-xsection.elf: $(BIN_DIR)/eeprom-xsection.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,eeprom-xsection.elf,./$(notdir $<),NULGRIND)
