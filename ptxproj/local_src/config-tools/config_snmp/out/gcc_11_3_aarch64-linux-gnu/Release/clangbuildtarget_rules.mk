CPPFLAGS := $(CPPFLAGS)
CFLAGS := $(CFLAGS)
CXXFLAGS := $(CXXFLAGS)
LDFLAGS := $(LDFLAGS)
ARFLAGS := $(ARFLAGS)

config_snmp.elf_SOURCES := $(config_snmp.elf_SOURCES)
config_snmp.elf_GENHEADERS := $(config_snmp.elf_GENHEADERS)
config_snmp.elf_CPPFLAGS := $(config_snmp.elf_CPPFLAGS)
config_snmp.elf_CFLAGS := $(config_snmp.elf_CFLAGS)
config_snmp.elf_CXXFLAGS := $(config_snmp.elf_CXXFLAGS)
config_snmp.elf_LDFLAGS := $(config_snmp.elf_LDFLAGS)
config_snmp.elf_ARFLAGS := $(config_snmp.elf_ARFLAGS)

libsnmp-config.a_SOURCES := $(libsnmp-config.a_SOURCES)
libsnmp-config.a_GENHEADERS := $(libsnmp-config.a_GENHEADERS)
libsnmp-config.a_CPPFLAGS := $(libsnmp-config.a_CPPFLAGS)
libsnmp-config.a_CFLAGS := $(libsnmp-config.a_CFLAGS)
libsnmp-config.a_CXXFLAGS := $(libsnmp-config.a_CXXFLAGS)
libsnmp-config.a_LDFLAGS := $(libsnmp-config.a_LDFLAGS)
libsnmp-config.a_ARFLAGS := $(libsnmp-config.a_ARFLAGS)

alltests.elf_SOURCES := $(alltests.elf_SOURCES)
alltests.elf_GENHEADERS := $(alltests.elf_GENHEADERS)
alltests.elf_CPPFLAGS := $(alltests.elf_CPPFLAGS)
alltests.elf_CFLAGS := $(alltests.elf_CFLAGS)
alltests.elf_CXXFLAGS := $(alltests.elf_CXXFLAGS)
alltests.elf_LDFLAGS := $(alltests.elf_LDFLAGS)
alltests.elf_ARFLAGS := $(alltests.elf_ARFLAGS)

OBJECT_FILES := $(OBJECT_FILES)
DEP_FILES := $(DEP_FILES)
OUT_DIRS := $(call sort,$(OUT_DIR)/ $(dir $(OBJECT_FILES)) $(OUT_DIRS))
GEN_DIRS := $(call sort,$(BIN_DIR)/ $(OUT_DIRS) $(GEN_DIRS))

$(DEP_FILES) : | $(GEN_DIRS)

-include $(DEP_FILES)

$(if $(filter CLANG_TIDY_BASE_CHECKS CLANG_TIDY_CHECKS,$(CLANG_TIDY_RULESET)),$(error CLANG_TIDY_RULESET has "$(CLANG_TIDY_RULESET)" assigned to it. Instead, assign "$$($(CLANG_TIDY_RULESET))"))

config_snmp.elf_LINT_SOURCES ?= $(filter-out $(config_snmp.elf_NOLINT_SOURCES),$(config_snmp.elf_SOURCES))
OBJS_config_snmp.elf := $(call objs,$(config_snmp.elf_SOURCES),config_snmp.elf/)
DEPS_config_snmp.elf := $(call deps,$(config_snmp.elf_SOURCES),config_snmp.elf/)
GCNOS_NATIVE_config_snmp.elf = $(call gcnos,$(config_snmp.elf_SOURCES),config_snmp.elf/)
GCNOS_TRANSITIVE_config_snmp.elf = $(sort $(GCNOS_NATIVE_config_snmp.elf) $(GCNOS_TRANSITIVE_libsnmp-config.a))
GCNO_TARGETS_NATIVE_config_snmp.elf = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/config_snmp.elf/gcovr/gcda/%,$(GCNOS_NATIVE_config_snmp.elf))
GCNO_TARGETS_TRANSITIVE_config_snmp.elf = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/config_snmp.elf/gcovr/gcda/%,$(GCNOS_TRANSITIVE_config_snmp.elf))
.PRECIOUS: $(GCNO_TARGETS_TRANSITIVE_config_snmp.elf)
GCOV_TARGETS_NATIVE_config_snmp.elf = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_NATIVE_config_snmp.elf))
GCOV_TARGETS_TRANSITIVE_config_snmp.elf = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_TRANSITIVE_config_snmp.elf))
LOBS_config_snmp.elf := $(call lobs,$(config_snmp.elf_LINT_SOURCES),config_snmp.elf/)
TIDYS_config_snmp.elf := $(call tidys,$(config_snmp.elf_LINT_SOURCES),config_snmp.elf/)
$(TIDYS_config_snmp.elf): $(config_snmp.elf_PRECLANG_FILES)
PLINTS_config_snmp.elf := $(call plints,$(config_snmp.elf_LINT_SOURCES),config_snmp.elf/)
$(PLINTS_config_snmp.elf): $(config_snmp.elf_PRECLANG_FILES)

config_snmp.elf_OUT_OF_SOURCETREE = $(filter-out $(PROJECT_ROOT)/%,$(config_snmp.elf_SOURCES))
$(if $(strip $(config_snmp.elf_OUT_OF_SOURCETREE)),$(warning Source file lists need to start with $$(PROJECT_ROOT). config_snmp.elf_SOURCES -> $(config_snmp.elf_OUT_OF_SOURCETREE)),)

$(if $(filter CLANG_TIDY_BASE_CHECKS CLANG_TIDY_CHECKS,$(config_snmp.elf_CLANG_TIDY_RULESET)),$(error config_snmp.elf_CLANG_TIDY_RULESET has "$(config_snmp.elf_CLANG_TIDY_RULESET)" assigned to it. Instead, assign "$$($(config_snmp.elf_CLANG_TIDY_RULESET))"))

config_snmp.elf: $(BIN_DIR)/config_snmp.elf

$(DEPS_config_snmp.elf) $(OBJS_config_snmp.elf) $(LOBS_config_snmp.elf) $(TIDYS_config_snmp.elf) $(PLINTS_config_snmp.elf) ./out/gcc_11_3_aarch64-linux-gnu/Release/config_snmp.elf/lint_mac.h: BUILDTARGET_CPPFLAGS:=$(config_snmp.elf_CPPFLAGS)

$(DEPS_config_snmp.elf) $(OBJS_config_snmp.elf) $(TIDYS_config_snmp.elf) $(PLINTS_config_snmp.elf) ./out/gcc_11_3_aarch64-linux-gnu/Release/config_snmp.elf/lint_mac.h: BUILDTARGET_CXXFLAGS:=$(config_snmp.elf_CXXFLAGS)

$(DEPS_config_snmp.elf) $(OBJS_config_snmp.elf) $(TIDYS_config_snmp.elf) $(PLINTS_config_snmp.elf) ./out/gcc_11_3_aarch64-linux-gnu/Release/config_snmp.elf/lint_mac.h: BUILDTARGET_CFLAGS:=$(config_snmp.elf_CFLAGS)

lint-config_snmp.elf: flexelint-config_snmp.elf clang-tidy-config_snmp.elf

$(LOBS_config_snmp.elf): BUILDTARGET_LINTFLAGS:=$(config_snmp.elf_LINTFLAGS)

flexelint-config_snmp.elf: $($(config_snmp.elf_DISABLE_FLEXELINT)$(DISABLE_FLEXELINT)$(config_snmp.elf_DISABLE_LINT)$(DISABLE_LINT)LOBS_config_snmp.elf)

$(TIDYS_config_snmp.elf): BUILDTARGET_TIDYFLAGS:=$(config_snmp.elf_TIDYFLAGS) -isystem $(OUT_DIR)/config_snmp.elf -include lint_mac.h

$(TIDYS_config_snmp.elf): config_snmp.elf_CLANG_TIDY_RULESET ?= $(CLANG_TIDY_RULESET)

$(TIDYS_config_snmp.elf): CLANG_TIDY_CHECKS_OPTION:=$(subst $( ),$(,),$(strip $(config_snmp.elf_CLANG_TIDY_RULESET) $(config_snmp.elf_CLANG_TIDY_CHECKS)))

$(PLINTS_config_snmp.elf): BUILDTARGET_PLINTFLAGS:=$(config_snmp.elf_PLINTSFLAGS) -isystem $(OUT_DIR)/config_snmp.elf -include lint_mac.h

clang-tidy-config_snmp.elf: $($(config_snmp.elf_DISABLE_CLANG_TIDY)$(DISABLE_CLANG_TIDY)$(config_snmp.elf_DISABLE_LINT)$(DISABLE_LINT)TIDYS_config_snmp.elf)

clean-clang-tidy-config_snmp.elf:; $(SILENT)rm --force $(TIDYS_config_snmp.elf)

clangsa-config_snmp.elf: $(PLINTS_config_snmp.elf)

./out/gcc_11_3_aarch64-linux-gnu/Release/info/config_snmp.elf-info.txt: $(SCRIPT_DIR)/internal/clang/info_txt.template $(MK_FILES); $(SILENT)$(call clangbuild_subst_info_buildtarget,config_snmp.elf,$<) > $@

info-txt-config_snmp.elf: $(OUT_DIR)/info/config_snmp.elf-info.txt; $(SILENT)cat $<

$(OUT_DIR)/config_snmp.elf/%.o.d: $(PROJECT_ROOT)/% $(MK_FILES) $(MAKEDEP_SUPPORT_FILES) | $(config_snmp.elf_GENHEADERS); $(SILENT)$(call makedep,$@,$<,$(FLAGS))

$(OUT_DIR)/config_snmp.elf/%.o: $(PROJECT_ROOT)/% $(MK_FILES) $(CC_SUPPORT_FILES) | $(config_snmp.elf_GENHEADERS); $(SILENT)$(call cc,$@,$<,$(FLAGS))

$(OUT_DIR)/config_snmp.elf/%.lob: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) | $(config_snmp.elf_GENHEADERS); $(SILENT)$(call lint,$@,$<,$(FLAGS))

config_snmp.elf_PRECLANG_FILES=$(OUT_DIR)/config_snmp.elf/lint_mac.h

$(OUT_DIR)/config_snmp.elf/%.tidy: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(config_snmp.elf_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Release/config_snmp.elf/%.o.d $(wildcard .clang-tidy) | $(TIDY_SUPPORT_DIRS); $(SILENT)$(call clang-tidy,$@,$<,$(FLAGS))

$(OUT_DIR)/config_snmp.elf/%.plint: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(config_snmp.elf_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Release/config_snmp.elf/%.o.d; $(SILENT)$(call clang-sa,$@,$<,$(FLAGS))



$(OUT_DIR)/config_snmp.elf/gcovr/gcda/%.gcno: check-config_snmp.elf; $(SILENT)mkdir -p $(dir $@) && cp $(OUT_DIR)/$*.gcno $@

libsnmp-config.a_LINT_SOURCES ?= $(filter-out $(libsnmp-config.a_NOLINT_SOURCES),$(libsnmp-config.a_SOURCES))
OBJS_libsnmp-config.a := $(call objs,$(libsnmp-config.a_SOURCES),libsnmp-config.a/)
DEPS_libsnmp-config.a := $(call deps,$(libsnmp-config.a_SOURCES),libsnmp-config.a/)
GCNOS_NATIVE_libsnmp-config.a = $(call gcnos,$(libsnmp-config.a_SOURCES),libsnmp-config.a/)
GCNOS_TRANSITIVE_libsnmp-config.a = $(sort $(GCNOS_NATIVE_libsnmp-config.a) )
GCNO_TARGETS_NATIVE_libsnmp-config.a = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/libsnmp-config.a/gcovr/gcda/%,$(GCNOS_NATIVE_libsnmp-config.a))
GCNO_TARGETS_TRANSITIVE_libsnmp-config.a = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/libsnmp-config.a/gcovr/gcda/%,$(GCNOS_TRANSITIVE_libsnmp-config.a))
.PRECIOUS: $(GCNO_TARGETS_TRANSITIVE_libsnmp-config.a)
GCOV_TARGETS_NATIVE_libsnmp-config.a = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_NATIVE_libsnmp-config.a))
GCOV_TARGETS_TRANSITIVE_libsnmp-config.a = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_TRANSITIVE_libsnmp-config.a))
LOBS_libsnmp-config.a := $(call lobs,$(libsnmp-config.a_LINT_SOURCES),libsnmp-config.a/)
TIDYS_libsnmp-config.a := $(call tidys,$(libsnmp-config.a_LINT_SOURCES),libsnmp-config.a/)
$(TIDYS_libsnmp-config.a): $(libsnmp-config.a_PRECLANG_FILES)
PLINTS_libsnmp-config.a := $(call plints,$(libsnmp-config.a_LINT_SOURCES),libsnmp-config.a/)
$(PLINTS_libsnmp-config.a): $(libsnmp-config.a_PRECLANG_FILES)

libsnmp-config.a_OUT_OF_SOURCETREE = $(filter-out $(PROJECT_ROOT)/%,$(libsnmp-config.a_SOURCES))
$(if $(strip $(libsnmp-config.a_OUT_OF_SOURCETREE)),$(warning Source file lists need to start with $$(PROJECT_ROOT). libsnmp-config.a_SOURCES -> $(libsnmp-config.a_OUT_OF_SOURCETREE)),)

$(if $(filter CLANG_TIDY_BASE_CHECKS CLANG_TIDY_CHECKS,$(libsnmp-config.a_CLANG_TIDY_RULESET)),$(error libsnmp-config.a_CLANG_TIDY_RULESET has "$(libsnmp-config.a_CLANG_TIDY_RULESET)" assigned to it. Instead, assign "$$($(libsnmp-config.a_CLANG_TIDY_RULESET))"))

libsnmp-config.a: $(BIN_DIR)/libsnmp-config.a

$(DEPS_libsnmp-config.a) $(OBJS_libsnmp-config.a) $(LOBS_libsnmp-config.a) $(TIDYS_libsnmp-config.a) $(PLINTS_libsnmp-config.a) ./out/gcc_11_3_aarch64-linux-gnu/Release/libsnmp-config.a/lint_mac.h: BUILDTARGET_CPPFLAGS:=$(libsnmp-config.a_CPPFLAGS)

$(DEPS_libsnmp-config.a) $(OBJS_libsnmp-config.a) $(TIDYS_libsnmp-config.a) $(PLINTS_libsnmp-config.a) ./out/gcc_11_3_aarch64-linux-gnu/Release/libsnmp-config.a/lint_mac.h: BUILDTARGET_CXXFLAGS:=$(libsnmp-config.a_CXXFLAGS)

$(DEPS_libsnmp-config.a) $(OBJS_libsnmp-config.a) $(TIDYS_libsnmp-config.a) $(PLINTS_libsnmp-config.a) ./out/gcc_11_3_aarch64-linux-gnu/Release/libsnmp-config.a/lint_mac.h: BUILDTARGET_CFLAGS:=$(libsnmp-config.a_CFLAGS)

lint-libsnmp-config.a: flexelint-libsnmp-config.a clang-tidy-libsnmp-config.a

$(LOBS_libsnmp-config.a): BUILDTARGET_LINTFLAGS:=$(libsnmp-config.a_LINTFLAGS)

flexelint-libsnmp-config.a: $($(libsnmp-config.a_DISABLE_FLEXELINT)$(DISABLE_FLEXELINT)$(libsnmp-config.a_DISABLE_LINT)$(DISABLE_LINT)LOBS_libsnmp-config.a)

$(TIDYS_libsnmp-config.a): BUILDTARGET_TIDYFLAGS:=$(libsnmp-config.a_TIDYFLAGS) -isystem $(OUT_DIR)/libsnmp-config.a -include lint_mac.h

$(TIDYS_libsnmp-config.a): libsnmp-config.a_CLANG_TIDY_RULESET ?= $(CLANG_TIDY_RULESET)

$(TIDYS_libsnmp-config.a): CLANG_TIDY_CHECKS_OPTION:=$(subst $( ),$(,),$(strip $(libsnmp-config.a_CLANG_TIDY_RULESET) $(libsnmp-config.a_CLANG_TIDY_CHECKS)))

$(PLINTS_libsnmp-config.a): BUILDTARGET_PLINTFLAGS:=$(libsnmp-config.a_PLINTSFLAGS) -isystem $(OUT_DIR)/libsnmp-config.a -include lint_mac.h

clang-tidy-libsnmp-config.a: $($(libsnmp-config.a_DISABLE_CLANG_TIDY)$(DISABLE_CLANG_TIDY)$(libsnmp-config.a_DISABLE_LINT)$(DISABLE_LINT)TIDYS_libsnmp-config.a)

clean-clang-tidy-libsnmp-config.a:; $(SILENT)rm --force $(TIDYS_libsnmp-config.a)

clangsa-libsnmp-config.a: $(PLINTS_libsnmp-config.a)

./out/gcc_11_3_aarch64-linux-gnu/Release/info/libsnmp-config.a-info.txt: $(SCRIPT_DIR)/internal/clang/info_txt.template $(MK_FILES); $(SILENT)$(call clangbuild_subst_info_buildtarget,libsnmp-config.a,$<) > $@

info-txt-libsnmp-config.a: $(OUT_DIR)/info/libsnmp-config.a-info.txt; $(SILENT)cat $<

$(OUT_DIR)/libsnmp-config.a/%.o.d: $(PROJECT_ROOT)/% $(MK_FILES) $(MAKEDEP_SUPPORT_FILES) | $(libsnmp-config.a_GENHEADERS); $(SILENT)$(call makedep,$@,$<,$(FLAGS))

$(OUT_DIR)/libsnmp-config.a/%.o: $(PROJECT_ROOT)/% $(MK_FILES) $(CC_SUPPORT_FILES) | $(libsnmp-config.a_GENHEADERS); $(SILENT)$(call cc,$@,$<,$(FLAGS))

$(OUT_DIR)/libsnmp-config.a/%.lob: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) | $(libsnmp-config.a_GENHEADERS); $(SILENT)$(call lint,$@,$<,$(FLAGS))

libsnmp-config.a_PRECLANG_FILES=$(OUT_DIR)/libsnmp-config.a/lint_mac.h

$(OUT_DIR)/libsnmp-config.a/%.tidy: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(libsnmp-config.a_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Release/libsnmp-config.a/%.o.d $(wildcard .clang-tidy) | $(TIDY_SUPPORT_DIRS); $(SILENT)$(call clang-tidy,$@,$<,$(FLAGS))

$(OUT_DIR)/libsnmp-config.a/%.plint: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(libsnmp-config.a_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Release/libsnmp-config.a/%.o.d; $(SILENT)$(call clang-sa,$@,$<,$(FLAGS))



$(OUT_DIR)/libsnmp-config.a/gcovr/gcda/%.gcno: check-libsnmp-config.a; $(SILENT)mkdir -p $(dir $@) && cp $(OUT_DIR)/$*.gcno $@

alltests.elf_LINT_SOURCES ?= $(filter-out $(alltests.elf_NOLINT_SOURCES),$(alltests.elf_SOURCES))
OBJS_alltests.elf := $(call objs,$(alltests.elf_SOURCES),alltests.elf/)
DEPS_alltests.elf := $(call deps,$(alltests.elf_SOURCES),alltests.elf/)
GCNOS_NATIVE_alltests.elf = $(call gcnos,$(alltests.elf_SOURCES),alltests.elf/)
GCNOS_TRANSITIVE_alltests.elf = $(sort $(GCNOS_NATIVE_alltests.elf) $(GCNOS_TRANSITIVE_libsnmp-config.a))
GCNO_TARGETS_NATIVE_alltests.elf = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/alltests.elf/gcovr/gcda/%,$(GCNOS_NATIVE_alltests.elf))
GCNO_TARGETS_TRANSITIVE_alltests.elf = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/alltests.elf/gcovr/gcda/%,$(GCNOS_TRANSITIVE_alltests.elf))
.PRECIOUS: $(GCNO_TARGETS_TRANSITIVE_alltests.elf)
GCOV_TARGETS_NATIVE_alltests.elf = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_NATIVE_alltests.elf))
GCOV_TARGETS_TRANSITIVE_alltests.elf = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_TRANSITIVE_alltests.elf))
LOBS_alltests.elf := $(call lobs,$(alltests.elf_LINT_SOURCES),alltests.elf/)
TIDYS_alltests.elf := $(call tidys,$(alltests.elf_LINT_SOURCES),alltests.elf/)
$(TIDYS_alltests.elf): $(alltests.elf_PRECLANG_FILES)
PLINTS_alltests.elf := $(call plints,$(alltests.elf_LINT_SOURCES),alltests.elf/)
$(PLINTS_alltests.elf): $(alltests.elf_PRECLANG_FILES)

alltests.elf_OUT_OF_SOURCETREE = $(filter-out $(PROJECT_ROOT)/%,$(alltests.elf_SOURCES))
$(if $(strip $(alltests.elf_OUT_OF_SOURCETREE)),$(warning Source file lists need to start with $$(PROJECT_ROOT). alltests.elf_SOURCES -> $(alltests.elf_OUT_OF_SOURCETREE)),)

$(if $(filter CLANG_TIDY_BASE_CHECKS CLANG_TIDY_CHECKS,$(alltests.elf_CLANG_TIDY_RULESET)),$(error alltests.elf_CLANG_TIDY_RULESET has "$(alltests.elf_CLANG_TIDY_RULESET)" assigned to it. Instead, assign "$$($(alltests.elf_CLANG_TIDY_RULESET))"))

alltests.elf: $(BIN_DIR)/alltests.elf

$(DEPS_alltests.elf) $(OBJS_alltests.elf) $(LOBS_alltests.elf) $(TIDYS_alltests.elf) $(PLINTS_alltests.elf) ./out/gcc_11_3_aarch64-linux-gnu/Release/alltests.elf/lint_mac.h: BUILDTARGET_CPPFLAGS:=$(alltests.elf_CPPFLAGS)

$(DEPS_alltests.elf) $(OBJS_alltests.elf) $(TIDYS_alltests.elf) $(PLINTS_alltests.elf) ./out/gcc_11_3_aarch64-linux-gnu/Release/alltests.elf/lint_mac.h: BUILDTARGET_CXXFLAGS:=$(alltests.elf_CXXFLAGS)

$(DEPS_alltests.elf) $(OBJS_alltests.elf) $(TIDYS_alltests.elf) $(PLINTS_alltests.elf) ./out/gcc_11_3_aarch64-linux-gnu/Release/alltests.elf/lint_mac.h: BUILDTARGET_CFLAGS:=$(alltests.elf_CFLAGS)

lint-alltests.elf: flexelint-alltests.elf clang-tidy-alltests.elf

$(LOBS_alltests.elf): BUILDTARGET_LINTFLAGS:=$(alltests.elf_LINTFLAGS)

flexelint-alltests.elf: $($(alltests.elf_DISABLE_FLEXELINT)$(DISABLE_FLEXELINT)$(alltests.elf_DISABLE_LINT)$(DISABLE_LINT)LOBS_alltests.elf)

$(TIDYS_alltests.elf): BUILDTARGET_TIDYFLAGS:=$(alltests.elf_TIDYFLAGS) -isystem $(OUT_DIR)/alltests.elf -include lint_mac.h

$(TIDYS_alltests.elf): alltests.elf_CLANG_TIDY_RULESET ?= $(CLANG_TIDY_RULESET)

$(TIDYS_alltests.elf): CLANG_TIDY_CHECKS_OPTION:=$(subst $( ),$(,),$(strip $(alltests.elf_CLANG_TIDY_RULESET) $(alltests.elf_CLANG_TIDY_CHECKS)))

$(PLINTS_alltests.elf): BUILDTARGET_PLINTFLAGS:=$(alltests.elf_PLINTSFLAGS) -isystem $(OUT_DIR)/alltests.elf -include lint_mac.h

clang-tidy-alltests.elf: $($(alltests.elf_DISABLE_CLANG_TIDY)$(DISABLE_CLANG_TIDY)$(alltests.elf_DISABLE_LINT)$(DISABLE_LINT)TIDYS_alltests.elf)

clean-clang-tidy-alltests.elf:; $(SILENT)rm --force $(TIDYS_alltests.elf)

clangsa-alltests.elf: $(PLINTS_alltests.elf)

./out/gcc_11_3_aarch64-linux-gnu/Release/info/alltests.elf-info.txt: $(SCRIPT_DIR)/internal/clang/info_txt.template $(MK_FILES); $(SILENT)$(call clangbuild_subst_info_buildtarget,alltests.elf,$<) > $@

info-txt-alltests.elf: $(OUT_DIR)/info/alltests.elf-info.txt; $(SILENT)cat $<

$(OUT_DIR)/alltests.elf/%.o.d: $(PROJECT_ROOT)/% $(MK_FILES) $(MAKEDEP_SUPPORT_FILES) | $(alltests.elf_GENHEADERS); $(SILENT)$(call makedep,$@,$<,$(FLAGS))

$(OUT_DIR)/alltests.elf/%.o: $(PROJECT_ROOT)/% $(MK_FILES) $(CC_SUPPORT_FILES) | $(alltests.elf_GENHEADERS); $(SILENT)$(call cc,$@,$<,$(FLAGS))

$(OUT_DIR)/alltests.elf/%.lob: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) | $(alltests.elf_GENHEADERS); $(SILENT)$(call lint,$@,$<,$(FLAGS))

alltests.elf_PRECLANG_FILES=$(OUT_DIR)/alltests.elf/lint_mac.h

$(OUT_DIR)/alltests.elf/%.tidy: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(alltests.elf_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Release/alltests.elf/%.o.d $(wildcard .clang-tidy) | $(TIDY_SUPPORT_DIRS); $(SILENT)$(call clang-tidy,$@,$<,$(FLAGS))

$(OUT_DIR)/alltests.elf/%.plint: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(alltests.elf_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Release/alltests.elf/%.o.d; $(SILENT)$(call clang-sa,$@,$<,$(FLAGS))



$(OUT_DIR)/alltests.elf/gcovr/gcda/%.gcno: check-alltests.elf; $(SILENT)mkdir -p $(dir $@) && cp $(OUT_DIR)/$*.gcno $@

$(OUT_DIR)/config_snmp.elf.dbg: $(OBJS_config_snmp.elf) $(MK_FILES) $(config_snmp.elf_PREREQUISITES) $(LD_SUPPORT_FILES); $(SILENT)$(call ld$(ARTIFACT),config_snmp.elf,$@,$(OBJS_config_snmp.elf),$(LDFLAGS) $(config_snmp.elf_LDFLAGS))

$(OUT_DIR)/alltests.elf.dbg: $(OBJS_alltests.elf) $(MK_FILES) $(alltests.elf_PREREQUISITES) $(LD_SUPPORT_FILES); $(SILENT)$(call ld$(ARTIFACT),alltests.elf,$@,$(OBJS_alltests.elf),$(LDFLAGS) $(alltests.elf_LDFLAGS))

$(BIN_DIR)/libsnmp-config.a: $(OBJS_libsnmp-config.a) $(MK_FILES) $(libsnmp-config.a_PREREQUISITES) $(AR_SUPPORT_FILES); $(SILENT) rm --force $@; $(call ar,libsnmp-config.a,$@,$(OBJS_libsnmp-config.a),$(ARFLAGS) $(libsnmp-config.a_ARFLAGS))

check-alltests.elf: $(BIN_DIR)/alltests.elf cleanup_coverage-alltests.elf ; $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && (cd $(dir $<) && $(call clangbuild_check,alltests.elf,./$(notdir $<)))
$(GCNOS_NATIVE_alltests.elf): check-alltests.elf
cleanup_coverage-alltests.elf: $(BIN_DIR)/alltests.elf; $(SILENT)rm -rf $(OUT_DIR)/alltests.elf/gcovr/gcda 
Tcoverage-alltests.elf Tgcovr-alltests.elf: $(OUT_DIR)/alltests.elf/gcovr/coverage.html
$(OUT_DIR)/alltests.elf/gcovr/gcda/.gcovs: check-alltests.elf $(GCNO_TARGETS_TRANSITIVE_alltests.elf); $(SILENT) find $(OUT_DIR)/alltests.elf/gcovr/gcda \( -name gmock_main.dir -or -name gmock.dir \) -type d -exec rm -rf {} + ; $(foreach folder,$(shell ls -d $(OUT_DIR)/alltests.elf/gcovr/gcda/*/), $(call clangbuildtarget_gcov_folder,$(folder)); ) touch $@
$(OUT_DIR)/alltests.elf/gcovr/coverage.xml $(OUT_DIR)/alltests.elf/gcovr/coverage.html: $(OUT_DIR)/alltests.elf/gcovr/gcda/.gcovs ; $(SILENT) gcovr -r . -j $(NPROC) --xml-pretty --xml $(OUT_DIR)/alltests.elf/gcovr/coverage.xml --html --html-details $(OUT_DIR)/alltests.elf/gcovr/coverage.html --html-title alltests.elf --exclude-throw-branches  --use-gcov-files --keep $(addprefix --filter ',$(addsuffix ',$(alltests.elf_GCOVR_FILTER:./%=%) $(GCOVR_FILTER:./%=%))) $(addprefix --exclude ',$(addsuffix ',$(alltests.elf_GCOVR_EXCLUDE:./%=%) $(GCOVR_EXCLUDE:./%=%))) $(addprefix --exclude-directories '$(OUT_DIR:./%=%)/alltests.elf/gcovr/gcda/,$(addsuffix ',$(alltests.elf_GCOVR_EXCLUDE_DIRECTORIES) $(GCOVR_EXCLUDE_DIRECTORIES))) $(alltests.elf_GCOVR_ADDITIONAL_PARAMS) --print-summary $(addprefix $(OUT_DIR)/alltests.elf/gcovr/gcda/,$(or $(strip $(alltests.elf_GCOVR_SEARCH_PATH) $(GCOVR_SEARCH_PATH)),.)) && $(call clangbuildtarget_gcov_print_coverage_written,$(OUT_DIR)/alltests.elf/gcovr/coverage.xml) $(call clangbuildtarget_gcov_print_coverage_written,$(OUT_DIR)/alltests.elf/gcovr/coverage.html)
$(OUT_DIR)/alltests.elf/gcovr/coverage.json: $(OUT_DIR)/alltests.elf/gcovr/gcda/.gcovs check-alltests.elf ; $(SILENT) gcovr -r . -j $(NPROC) --json-pretty --json --output $(OUT_DIR)/alltests.elf/gcovr/coverage.json --exclude-throw-branches  --use-gcov-files --keep $(addprefix --filter ',$(addsuffix ',$(GCOVR_FILTER:./%=%))) $(addprefix --exclude ',$(addsuffix ',$(GCOVR_EXCLUDE:./%=%))) $(addprefix --exclude-directories '$(OUT_DIR:./%=%)/alltests.elf/gcovr/gcda/,$(addsuffix ',$(GCOVR_EXCLUDE_DIRECTORIES))) --print-summary $(addprefix $(OUT_DIR)/alltests.elf/gcovr/gcda/,$(or $(strip $(GCOVR_SEARCH_PATH)),.)) && $(call clangbuildtarget_gcov_print_coverage_written,$(OUT_DIR)/alltests.elf/gcovr/coverage.json)
$(if $(DISABLE_GCOV), coverage-alltests.elf gcovr-alltests.elf: ; @echo "make: *** [coverage-alltests.elf] DISABLE_GCOV needs to be empty!" >&2; false )

memcheck-config_snmp.elf: $(BIN_DIR)/config_snmp.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,config_snmp.elf,./$(notdir $<),MEMCHECK)
helgrind-config_snmp.elf: $(BIN_DIR)/config_snmp.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,config_snmp.elf,./$(notdir $<),HELGRIND)
callgrind-config_snmp.elf: $(BIN_DIR)/config_snmp.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,config_snmp.elf,./$(notdir $<),CALLGRIND)
massif-config_snmp.elf: $(BIN_DIR)/config_snmp.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,config_snmp.elf,./$(notdir $<),MASSIF)
nulgrind-config_snmp.elf: $(BIN_DIR)/config_snmp.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,config_snmp.elf,./$(notdir $<),NULGRIND)

memcheck-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,alltests.elf,./$(notdir $<),MEMCHECK)
helgrind-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,alltests.elf,./$(notdir $<),HELGRIND)
callgrind-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,alltests.elf,./$(notdir $<),CALLGRIND)
massif-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,alltests.elf,./$(notdir $<),MASSIF)
nulgrind-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,alltests.elf,./$(notdir $<),NULGRIND)
