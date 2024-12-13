CPPFLAGS := $(CPPFLAGS)
CFLAGS := $(CFLAGS)
CXXFLAGS := $(CXXFLAGS)
LDFLAGS := $(LDFLAGS)
ARFLAGS := $(ARFLAGS)

config_dnsmasq_c.elf_SOURCES := $(config_dnsmasq_c.elf_SOURCES)
config_dnsmasq_c.elf_GENHEADERS := $(config_dnsmasq_c.elf_GENHEADERS)
config_dnsmasq_c.elf_CPPFLAGS := $(config_dnsmasq_c.elf_CPPFLAGS)
config_dnsmasq_c.elf_CFLAGS := $(config_dnsmasq_c.elf_CFLAGS)
config_dnsmasq_c.elf_CXXFLAGS := $(config_dnsmasq_c.elf_CXXFLAGS)
config_dnsmasq_c.elf_LDFLAGS := $(config_dnsmasq_c.elf_LDFLAGS)
config_dnsmasq_c.elf_ARFLAGS := $(config_dnsmasq_c.elf_ARFLAGS)

libconfig_dnsmasq.a_SOURCES := $(libconfig_dnsmasq.a_SOURCES)
libconfig_dnsmasq.a_GENHEADERS := $(libconfig_dnsmasq.a_GENHEADERS)
libconfig_dnsmasq.a_CPPFLAGS := $(libconfig_dnsmasq.a_CPPFLAGS)
libconfig_dnsmasq.a_CFLAGS := $(libconfig_dnsmasq.a_CFLAGS)
libconfig_dnsmasq.a_CXXFLAGS := $(libconfig_dnsmasq.a_CXXFLAGS)
libconfig_dnsmasq.a_LDFLAGS := $(libconfig_dnsmasq.a_LDFLAGS)
libconfig_dnsmasq.a_ARFLAGS := $(libconfig_dnsmasq.a_ARFLAGS)

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

config_dnsmasq_c.elf_LINT_SOURCES ?= $(filter-out $(config_dnsmasq_c.elf_NOLINT_SOURCES),$(config_dnsmasq_c.elf_SOURCES))
OBJS_config_dnsmasq_c.elf := $(call objs,$(config_dnsmasq_c.elf_SOURCES),config_dnsmasq_c.elf/)
DEPS_config_dnsmasq_c.elf := $(call deps,$(config_dnsmasq_c.elf_SOURCES),config_dnsmasq_c.elf/)
GCNOS_NATIVE_config_dnsmasq_c.elf = $(call gcnos,$(config_dnsmasq_c.elf_SOURCES),config_dnsmasq_c.elf/)
GCNOS_TRANSITIVE_config_dnsmasq_c.elf = $(sort $(GCNOS_NATIVE_config_dnsmasq_c.elf) $(GCNOS_TRANSITIVE_libconfig_dnsmasq.a))
GCNO_TARGETS_NATIVE_config_dnsmasq_c.elf = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/config_dnsmasq_c.elf/gcovr/gcda/%,$(GCNOS_NATIVE_config_dnsmasq_c.elf))
GCNO_TARGETS_TRANSITIVE_config_dnsmasq_c.elf = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/config_dnsmasq_c.elf/gcovr/gcda/%,$(GCNOS_TRANSITIVE_config_dnsmasq_c.elf))
.PRECIOUS: $(GCNO_TARGETS_TRANSITIVE_config_dnsmasq_c.elf)
GCOV_TARGETS_NATIVE_config_dnsmasq_c.elf = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_NATIVE_config_dnsmasq_c.elf))
GCOV_TARGETS_TRANSITIVE_config_dnsmasq_c.elf = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_TRANSITIVE_config_dnsmasq_c.elf))
LOBS_config_dnsmasq_c.elf := $(call lobs,$(config_dnsmasq_c.elf_LINT_SOURCES),config_dnsmasq_c.elf/)
TIDYS_config_dnsmasq_c.elf := $(call tidys,$(config_dnsmasq_c.elf_LINT_SOURCES),config_dnsmasq_c.elf/)
$(TIDYS_config_dnsmasq_c.elf): $(config_dnsmasq_c.elf_PRECLANG_FILES)
PLINTS_config_dnsmasq_c.elf := $(call plints,$(config_dnsmasq_c.elf_LINT_SOURCES),config_dnsmasq_c.elf/)
$(PLINTS_config_dnsmasq_c.elf): $(config_dnsmasq_c.elf_PRECLANG_FILES)

config_dnsmasq_c.elf_OUT_OF_SOURCETREE = $(filter-out $(PROJECT_ROOT)/%,$(config_dnsmasq_c.elf_SOURCES))
$(if $(strip $(config_dnsmasq_c.elf_OUT_OF_SOURCETREE)),$(warning Source file lists need to start with $$(PROJECT_ROOT). config_dnsmasq_c.elf_SOURCES -> $(config_dnsmasq_c.elf_OUT_OF_SOURCETREE)),)

$(if $(filter CLANG_TIDY_BASE_CHECKS CLANG_TIDY_CHECKS,$(config_dnsmasq_c.elf_CLANG_TIDY_RULESET)),$(error config_dnsmasq_c.elf_CLANG_TIDY_RULESET has "$(config_dnsmasq_c.elf_CLANG_TIDY_RULESET)" assigned to it. Instead, assign "$$($(config_dnsmasq_c.elf_CLANG_TIDY_RULESET))"))

config_dnsmasq_c.elf: $(BIN_DIR)/config_dnsmasq_c.elf

$(DEPS_config_dnsmasq_c.elf) $(OBJS_config_dnsmasq_c.elf) $(LOBS_config_dnsmasq_c.elf) $(TIDYS_config_dnsmasq_c.elf) $(PLINTS_config_dnsmasq_c.elf) ./out/gcc_11_3_aarch64-linux-gnu/Debug/config_dnsmasq_c.elf/lint_mac.h: BUILDTARGET_CPPFLAGS:=$(config_dnsmasq_c.elf_CPPFLAGS)

$(DEPS_config_dnsmasq_c.elf) $(OBJS_config_dnsmasq_c.elf) $(TIDYS_config_dnsmasq_c.elf) $(PLINTS_config_dnsmasq_c.elf) ./out/gcc_11_3_aarch64-linux-gnu/Debug/config_dnsmasq_c.elf/lint_mac.h: BUILDTARGET_CXXFLAGS:=$(config_dnsmasq_c.elf_CXXFLAGS)

$(DEPS_config_dnsmasq_c.elf) $(OBJS_config_dnsmasq_c.elf) $(TIDYS_config_dnsmasq_c.elf) $(PLINTS_config_dnsmasq_c.elf) ./out/gcc_11_3_aarch64-linux-gnu/Debug/config_dnsmasq_c.elf/lint_mac.h: BUILDTARGET_CFLAGS:=$(config_dnsmasq_c.elf_CFLAGS)

lint-config_dnsmasq_c.elf: flexelint-config_dnsmasq_c.elf clang-tidy-config_dnsmasq_c.elf

$(LOBS_config_dnsmasq_c.elf): BUILDTARGET_LINTFLAGS:=$(config_dnsmasq_c.elf_LINTFLAGS)

flexelint-config_dnsmasq_c.elf: $($(config_dnsmasq_c.elf_DISABLE_FLEXELINT)$(DISABLE_FLEXELINT)$(config_dnsmasq_c.elf_DISABLE_LINT)$(DISABLE_LINT)LOBS_config_dnsmasq_c.elf)

$(TIDYS_config_dnsmasq_c.elf): BUILDTARGET_TIDYFLAGS:=$(config_dnsmasq_c.elf_TIDYFLAGS) -isystem $(OUT_DIR)/config_dnsmasq_c.elf -include lint_mac.h

$(TIDYS_config_dnsmasq_c.elf): config_dnsmasq_c.elf_CLANG_TIDY_RULESET ?= $(CLANG_TIDY_RULESET)

$(TIDYS_config_dnsmasq_c.elf): CLANG_TIDY_CHECKS_OPTION:=$(subst $( ),$(,),$(strip $(config_dnsmasq_c.elf_CLANG_TIDY_RULESET) $(config_dnsmasq_c.elf_CLANG_TIDY_CHECKS)))

$(PLINTS_config_dnsmasq_c.elf): BUILDTARGET_PLINTFLAGS:=$(config_dnsmasq_c.elf_PLINTSFLAGS) -isystem $(OUT_DIR)/config_dnsmasq_c.elf -include lint_mac.h

clang-tidy-config_dnsmasq_c.elf: $($(config_dnsmasq_c.elf_DISABLE_CLANG_TIDY)$(DISABLE_CLANG_TIDY)$(config_dnsmasq_c.elf_DISABLE_LINT)$(DISABLE_LINT)TIDYS_config_dnsmasq_c.elf)

clean-clang-tidy-config_dnsmasq_c.elf:; $(SILENT)rm --force $(TIDYS_config_dnsmasq_c.elf)

clangsa-config_dnsmasq_c.elf: $(PLINTS_config_dnsmasq_c.elf)

./out/gcc_11_3_aarch64-linux-gnu/Debug/info/config_dnsmasq_c.elf-info.txt: $(SCRIPT_DIR)/internal/clang/info_txt.template $(MK_FILES); $(SILENT)$(call clangbuild_subst_info_buildtarget,config_dnsmasq_c.elf,$<) > $@

info-txt-config_dnsmasq_c.elf: $(OUT_DIR)/info/config_dnsmasq_c.elf-info.txt; $(SILENT)cat $<

$(OUT_DIR)/config_dnsmasq_c.elf/%.o.d: $(PROJECT_ROOT)/% $(MK_FILES) $(MAKEDEP_SUPPORT_FILES) | $(config_dnsmasq_c.elf_GENHEADERS); $(SILENT)$(call makedep,$@,$<,$(FLAGS))

$(OUT_DIR)/config_dnsmasq_c.elf/%.o: $(PROJECT_ROOT)/% $(MK_FILES) $(CC_SUPPORT_FILES) | $(config_dnsmasq_c.elf_GENHEADERS); $(SILENT)$(call cc,$@,$<,$(FLAGS))

$(OUT_DIR)/config_dnsmasq_c.elf/%.lob: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) | $(config_dnsmasq_c.elf_GENHEADERS); $(SILENT)$(call lint,$@,$<,$(FLAGS))

config_dnsmasq_c.elf_PRECLANG_FILES=$(OUT_DIR)/config_dnsmasq_c.elf/lint_mac.h

$(OUT_DIR)/config_dnsmasq_c.elf/%.tidy: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(config_dnsmasq_c.elf_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Debug/config_dnsmasq_c.elf/%.o.d $(wildcard .clang-tidy) | $(TIDY_SUPPORT_DIRS); $(SILENT)$(call clang-tidy,$@,$<,$(FLAGS))

$(OUT_DIR)/config_dnsmasq_c.elf/%.plint: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(config_dnsmasq_c.elf_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Debug/config_dnsmasq_c.elf/%.o.d; $(SILENT)$(call clang-sa,$@,$<,$(FLAGS))



$(OUT_DIR)/config_dnsmasq_c.elf/gcovr/gcda/%.gcno: check-config_dnsmasq_c.elf; $(SILENT)mkdir -p $(dir $@) && cp $(OUT_DIR)/$*.gcno $@

libconfig_dnsmasq.a_LINT_SOURCES ?= $(filter-out $(libconfig_dnsmasq.a_NOLINT_SOURCES),$(libconfig_dnsmasq.a_SOURCES))
OBJS_libconfig_dnsmasq.a := $(call objs,$(libconfig_dnsmasq.a_SOURCES),libconfig_dnsmasq.a/)
DEPS_libconfig_dnsmasq.a := $(call deps,$(libconfig_dnsmasq.a_SOURCES),libconfig_dnsmasq.a/)
GCNOS_NATIVE_libconfig_dnsmasq.a = $(call gcnos,$(libconfig_dnsmasq.a_SOURCES),libconfig_dnsmasq.a/)
GCNOS_TRANSITIVE_libconfig_dnsmasq.a = $(sort $(GCNOS_NATIVE_libconfig_dnsmasq.a) )
GCNO_TARGETS_NATIVE_libconfig_dnsmasq.a = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/libconfig_dnsmasq.a/gcovr/gcda/%,$(GCNOS_NATIVE_libconfig_dnsmasq.a))
GCNO_TARGETS_TRANSITIVE_libconfig_dnsmasq.a = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/libconfig_dnsmasq.a/gcovr/gcda/%,$(GCNOS_TRANSITIVE_libconfig_dnsmasq.a))
.PRECIOUS: $(GCNO_TARGETS_TRANSITIVE_libconfig_dnsmasq.a)
GCOV_TARGETS_NATIVE_libconfig_dnsmasq.a = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_NATIVE_libconfig_dnsmasq.a))
GCOV_TARGETS_TRANSITIVE_libconfig_dnsmasq.a = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_TRANSITIVE_libconfig_dnsmasq.a))
LOBS_libconfig_dnsmasq.a := $(call lobs,$(libconfig_dnsmasq.a_LINT_SOURCES),libconfig_dnsmasq.a/)
TIDYS_libconfig_dnsmasq.a := $(call tidys,$(libconfig_dnsmasq.a_LINT_SOURCES),libconfig_dnsmasq.a/)
$(TIDYS_libconfig_dnsmasq.a): $(libconfig_dnsmasq.a_PRECLANG_FILES)
PLINTS_libconfig_dnsmasq.a := $(call plints,$(libconfig_dnsmasq.a_LINT_SOURCES),libconfig_dnsmasq.a/)
$(PLINTS_libconfig_dnsmasq.a): $(libconfig_dnsmasq.a_PRECLANG_FILES)

libconfig_dnsmasq.a_OUT_OF_SOURCETREE = $(filter-out $(PROJECT_ROOT)/%,$(libconfig_dnsmasq.a_SOURCES))
$(if $(strip $(libconfig_dnsmasq.a_OUT_OF_SOURCETREE)),$(warning Source file lists need to start with $$(PROJECT_ROOT). libconfig_dnsmasq.a_SOURCES -> $(libconfig_dnsmasq.a_OUT_OF_SOURCETREE)),)

$(if $(filter CLANG_TIDY_BASE_CHECKS CLANG_TIDY_CHECKS,$(libconfig_dnsmasq.a_CLANG_TIDY_RULESET)),$(error libconfig_dnsmasq.a_CLANG_TIDY_RULESET has "$(libconfig_dnsmasq.a_CLANG_TIDY_RULESET)" assigned to it. Instead, assign "$$($(libconfig_dnsmasq.a_CLANG_TIDY_RULESET))"))

libconfig_dnsmasq.a: $(BIN_DIR)/libconfig_dnsmasq.a

$(DEPS_libconfig_dnsmasq.a) $(OBJS_libconfig_dnsmasq.a) $(LOBS_libconfig_dnsmasq.a) $(TIDYS_libconfig_dnsmasq.a) $(PLINTS_libconfig_dnsmasq.a) ./out/gcc_11_3_aarch64-linux-gnu/Debug/libconfig_dnsmasq.a/lint_mac.h: BUILDTARGET_CPPFLAGS:=$(libconfig_dnsmasq.a_CPPFLAGS)

$(DEPS_libconfig_dnsmasq.a) $(OBJS_libconfig_dnsmasq.a) $(TIDYS_libconfig_dnsmasq.a) $(PLINTS_libconfig_dnsmasq.a) ./out/gcc_11_3_aarch64-linux-gnu/Debug/libconfig_dnsmasq.a/lint_mac.h: BUILDTARGET_CXXFLAGS:=$(libconfig_dnsmasq.a_CXXFLAGS)

$(DEPS_libconfig_dnsmasq.a) $(OBJS_libconfig_dnsmasq.a) $(TIDYS_libconfig_dnsmasq.a) $(PLINTS_libconfig_dnsmasq.a) ./out/gcc_11_3_aarch64-linux-gnu/Debug/libconfig_dnsmasq.a/lint_mac.h: BUILDTARGET_CFLAGS:=$(libconfig_dnsmasq.a_CFLAGS)

lint-libconfig_dnsmasq.a: flexelint-libconfig_dnsmasq.a clang-tidy-libconfig_dnsmasq.a

$(LOBS_libconfig_dnsmasq.a): BUILDTARGET_LINTFLAGS:=$(libconfig_dnsmasq.a_LINTFLAGS)

flexelint-libconfig_dnsmasq.a: $($(libconfig_dnsmasq.a_DISABLE_FLEXELINT)$(DISABLE_FLEXELINT)$(libconfig_dnsmasq.a_DISABLE_LINT)$(DISABLE_LINT)LOBS_libconfig_dnsmasq.a)

$(TIDYS_libconfig_dnsmasq.a): BUILDTARGET_TIDYFLAGS:=$(libconfig_dnsmasq.a_TIDYFLAGS) -isystem $(OUT_DIR)/libconfig_dnsmasq.a -include lint_mac.h

$(TIDYS_libconfig_dnsmasq.a): libconfig_dnsmasq.a_CLANG_TIDY_RULESET ?= $(CLANG_TIDY_RULESET)

$(TIDYS_libconfig_dnsmasq.a): CLANG_TIDY_CHECKS_OPTION:=$(subst $( ),$(,),$(strip $(libconfig_dnsmasq.a_CLANG_TIDY_RULESET) $(libconfig_dnsmasq.a_CLANG_TIDY_CHECKS)))

$(PLINTS_libconfig_dnsmasq.a): BUILDTARGET_PLINTFLAGS:=$(libconfig_dnsmasq.a_PLINTSFLAGS) -isystem $(OUT_DIR)/libconfig_dnsmasq.a -include lint_mac.h

clang-tidy-libconfig_dnsmasq.a: $($(libconfig_dnsmasq.a_DISABLE_CLANG_TIDY)$(DISABLE_CLANG_TIDY)$(libconfig_dnsmasq.a_DISABLE_LINT)$(DISABLE_LINT)TIDYS_libconfig_dnsmasq.a)

clean-clang-tidy-libconfig_dnsmasq.a:; $(SILENT)rm --force $(TIDYS_libconfig_dnsmasq.a)

clangsa-libconfig_dnsmasq.a: $(PLINTS_libconfig_dnsmasq.a)

./out/gcc_11_3_aarch64-linux-gnu/Debug/info/libconfig_dnsmasq.a-info.txt: $(SCRIPT_DIR)/internal/clang/info_txt.template $(MK_FILES); $(SILENT)$(call clangbuild_subst_info_buildtarget,libconfig_dnsmasq.a,$<) > $@

info-txt-libconfig_dnsmasq.a: $(OUT_DIR)/info/libconfig_dnsmasq.a-info.txt; $(SILENT)cat $<

$(OUT_DIR)/libconfig_dnsmasq.a/%.o.d: $(PROJECT_ROOT)/% $(MK_FILES) $(MAKEDEP_SUPPORT_FILES) | $(libconfig_dnsmasq.a_GENHEADERS); $(SILENT)$(call makedep,$@,$<,$(FLAGS))

$(OUT_DIR)/libconfig_dnsmasq.a/%.o: $(PROJECT_ROOT)/% $(MK_FILES) $(CC_SUPPORT_FILES) | $(libconfig_dnsmasq.a_GENHEADERS); $(SILENT)$(call cc,$@,$<,$(FLAGS))

$(OUT_DIR)/libconfig_dnsmasq.a/%.lob: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) | $(libconfig_dnsmasq.a_GENHEADERS); $(SILENT)$(call lint,$@,$<,$(FLAGS))

libconfig_dnsmasq.a_PRECLANG_FILES=$(OUT_DIR)/libconfig_dnsmasq.a/lint_mac.h

$(OUT_DIR)/libconfig_dnsmasq.a/%.tidy: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(libconfig_dnsmasq.a_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Debug/libconfig_dnsmasq.a/%.o.d $(wildcard .clang-tidy) | $(TIDY_SUPPORT_DIRS); $(SILENT)$(call clang-tidy,$@,$<,$(FLAGS))

$(OUT_DIR)/libconfig_dnsmasq.a/%.plint: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(libconfig_dnsmasq.a_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Debug/libconfig_dnsmasq.a/%.o.d; $(SILENT)$(call clang-sa,$@,$<,$(FLAGS))



$(OUT_DIR)/libconfig_dnsmasq.a/gcovr/gcda/%.gcno: check-libconfig_dnsmasq.a; $(SILENT)mkdir -p $(dir $@) && cp $(OUT_DIR)/$*.gcno $@

alltests.elf_LINT_SOURCES ?= $(filter-out $(alltests.elf_NOLINT_SOURCES),$(alltests.elf_SOURCES))
OBJS_alltests.elf := $(call objs,$(alltests.elf_SOURCES),alltests.elf/)
DEPS_alltests.elf := $(call deps,$(alltests.elf_SOURCES),alltests.elf/)
GCNOS_NATIVE_alltests.elf = $(call gcnos,$(alltests.elf_SOURCES),alltests.elf/)
GCNOS_TRANSITIVE_alltests.elf = $(sort $(GCNOS_NATIVE_alltests.elf) $(GCNOS_TRANSITIVE_libconfig_dnsmasq.a))
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

$(DEPS_alltests.elf) $(OBJS_alltests.elf) $(LOBS_alltests.elf) $(TIDYS_alltests.elf) $(PLINTS_alltests.elf) ./out/gcc_11_3_aarch64-linux-gnu/Debug/alltests.elf/lint_mac.h: BUILDTARGET_CPPFLAGS:=$(alltests.elf_CPPFLAGS)

$(DEPS_alltests.elf) $(OBJS_alltests.elf) $(TIDYS_alltests.elf) $(PLINTS_alltests.elf) ./out/gcc_11_3_aarch64-linux-gnu/Debug/alltests.elf/lint_mac.h: BUILDTARGET_CXXFLAGS:=$(alltests.elf_CXXFLAGS)

$(DEPS_alltests.elf) $(OBJS_alltests.elf) $(TIDYS_alltests.elf) $(PLINTS_alltests.elf) ./out/gcc_11_3_aarch64-linux-gnu/Debug/alltests.elf/lint_mac.h: BUILDTARGET_CFLAGS:=$(alltests.elf_CFLAGS)

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

./out/gcc_11_3_aarch64-linux-gnu/Debug/info/alltests.elf-info.txt: $(SCRIPT_DIR)/internal/clang/info_txt.template $(MK_FILES); $(SILENT)$(call clangbuild_subst_info_buildtarget,alltests.elf,$<) > $@

info-txt-alltests.elf: $(OUT_DIR)/info/alltests.elf-info.txt; $(SILENT)cat $<

$(OUT_DIR)/alltests.elf/%.o.d: $(PROJECT_ROOT)/% $(MK_FILES) $(MAKEDEP_SUPPORT_FILES) | $(alltests.elf_GENHEADERS); $(SILENT)$(call makedep,$@,$<,$(FLAGS))

$(OUT_DIR)/alltests.elf/%.o: $(PROJECT_ROOT)/% $(MK_FILES) $(CC_SUPPORT_FILES) | $(alltests.elf_GENHEADERS); $(SILENT)$(call cc,$@,$<,$(FLAGS))

$(OUT_DIR)/alltests.elf/%.lob: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) | $(alltests.elf_GENHEADERS); $(SILENT)$(call lint,$@,$<,$(FLAGS))

alltests.elf_PRECLANG_FILES=$(OUT_DIR)/alltests.elf/lint_mac.h

$(OUT_DIR)/alltests.elf/%.tidy: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(alltests.elf_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Debug/alltests.elf/%.o.d $(wildcard .clang-tidy) | $(TIDY_SUPPORT_DIRS); $(SILENT)$(call clang-tidy,$@,$<,$(FLAGS))

$(OUT_DIR)/alltests.elf/%.plint: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(alltests.elf_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Debug/alltests.elf/%.o.d; $(SILENT)$(call clang-sa,$@,$<,$(FLAGS))



$(OUT_DIR)/alltests.elf/gcovr/gcda/%.gcno: check-alltests.elf; $(SILENT)mkdir -p $(dir $@) && cp $(OUT_DIR)/$*.gcno $@

$(OUT_DIR)/config_dnsmasq_c.elf.dbg: $(OBJS_config_dnsmasq_c.elf) $(MK_FILES) $(config_dnsmasq_c.elf_PREREQUISITES) $(LD_SUPPORT_FILES); $(SILENT)$(call ld$(ARTIFACT),config_dnsmasq_c.elf,$@,$(OBJS_config_dnsmasq_c.elf),$(LDFLAGS) $(config_dnsmasq_c.elf_LDFLAGS))

$(OUT_DIR)/alltests.elf.dbg: $(OBJS_alltests.elf) $(MK_FILES) $(alltests.elf_PREREQUISITES) $(LD_SUPPORT_FILES); $(SILENT)$(call ld$(ARTIFACT),alltests.elf,$@,$(OBJS_alltests.elf),$(LDFLAGS) $(alltests.elf_LDFLAGS))

$(BIN_DIR)/libconfig_dnsmasq.a: $(OBJS_libconfig_dnsmasq.a) $(MK_FILES) $(libconfig_dnsmasq.a_PREREQUISITES) $(AR_SUPPORT_FILES); $(SILENT) rm --force $@; $(call ar,libconfig_dnsmasq.a,$@,$(OBJS_libconfig_dnsmasq.a),$(ARFLAGS) $(libconfig_dnsmasq.a_ARFLAGS))

check-alltests.elf: $(BIN_DIR)/alltests.elf cleanup_coverage-alltests.elf ; $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && (cd $(dir $<) && $(call clangbuild_check,alltests.elf,./$(notdir $<)))
$(GCNOS_NATIVE_alltests.elf): check-alltests.elf
cleanup_coverage-alltests.elf: $(BIN_DIR)/alltests.elf; $(SILENT)rm -rf $(OUT_DIR)/alltests.elf/gcovr/gcda 
Tcoverage-alltests.elf Tgcovr-alltests.elf: $(OUT_DIR)/alltests.elf/gcovr/coverage.html
$(OUT_DIR)/alltests.elf/gcovr/gcda/.gcovs: check-alltests.elf $(GCNO_TARGETS_TRANSITIVE_alltests.elf); $(SILENT) find $(OUT_DIR)/alltests.elf/gcovr/gcda \( -name gmock_main.dir -or -name gmock.dir \) -type d -exec rm -rf {} + ; $(foreach folder,$(shell ls -d $(OUT_DIR)/alltests.elf/gcovr/gcda/*/), $(call clangbuildtarget_gcov_folder,$(folder)); ) touch $@
$(OUT_DIR)/alltests.elf/gcovr/coverage.xml $(OUT_DIR)/alltests.elf/gcovr/coverage.html: $(OUT_DIR)/alltests.elf/gcovr/gcda/.gcovs ; $(SILENT) gcovr -r . -j $(NPROC) --xml-pretty --xml $(OUT_DIR)/alltests.elf/gcovr/coverage.xml --html --html-details $(OUT_DIR)/alltests.elf/gcovr/coverage.html --html-title alltests.elf --exclude-throw-branches  --use-gcov-files --keep $(addprefix --filter ',$(addsuffix ',$(alltests.elf_GCOVR_FILTER:./%=%) $(GCOVR_FILTER:./%=%))) $(addprefix --exclude ',$(addsuffix ',$(alltests.elf_GCOVR_EXCLUDE:./%=%) $(GCOVR_EXCLUDE:./%=%))) $(addprefix --exclude-directories '$(OUT_DIR:./%=%)/alltests.elf/gcovr/gcda/,$(addsuffix ',$(alltests.elf_GCOVR_EXCLUDE_DIRECTORIES) $(GCOVR_EXCLUDE_DIRECTORIES))) $(alltests.elf_GCOVR_ADDITIONAL_PARAMS) --print-summary $(addprefix $(OUT_DIR)/alltests.elf/gcovr/gcda/,$(or $(strip $(alltests.elf_GCOVR_SEARCH_PATH) $(GCOVR_SEARCH_PATH)),.)) && $(call clangbuildtarget_gcov_print_coverage_written,$(OUT_DIR)/alltests.elf/gcovr/coverage.xml) $(call clangbuildtarget_gcov_print_coverage_written,$(OUT_DIR)/alltests.elf/gcovr/coverage.html)
$(OUT_DIR)/alltests.elf/gcovr/coverage.json: $(OUT_DIR)/alltests.elf/gcovr/gcda/.gcovs check-alltests.elf ; $(SILENT) gcovr -r . -j $(NPROC) --json-pretty --json --output $(OUT_DIR)/alltests.elf/gcovr/coverage.json --exclude-throw-branches  --use-gcov-files --keep $(addprefix --filter ',$(addsuffix ',$(GCOVR_FILTER:./%=%))) $(addprefix --exclude ',$(addsuffix ',$(GCOVR_EXCLUDE:./%=%))) $(addprefix --exclude-directories '$(OUT_DIR:./%=%)/alltests.elf/gcovr/gcda/,$(addsuffix ',$(GCOVR_EXCLUDE_DIRECTORIES))) --print-summary $(addprefix $(OUT_DIR)/alltests.elf/gcovr/gcda/,$(or $(strip $(GCOVR_SEARCH_PATH)),.)) && $(call clangbuildtarget_gcov_print_coverage_written,$(OUT_DIR)/alltests.elf/gcovr/coverage.json)
$(if $(DISABLE_GCOV), coverage-alltests.elf gcovr-alltests.elf: ; @echo "make: *** [coverage-alltests.elf] DISABLE_GCOV needs to be empty!" >&2; false )

memcheck-config_dnsmasq_c.elf: $(BIN_DIR)/config_dnsmasq_c.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,config_dnsmasq_c.elf,./$(notdir $<),MEMCHECK)
helgrind-config_dnsmasq_c.elf: $(BIN_DIR)/config_dnsmasq_c.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,config_dnsmasq_c.elf,./$(notdir $<),HELGRIND)
callgrind-config_dnsmasq_c.elf: $(BIN_DIR)/config_dnsmasq_c.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,config_dnsmasq_c.elf,./$(notdir $<),CALLGRIND)
massif-config_dnsmasq_c.elf: $(BIN_DIR)/config_dnsmasq_c.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,config_dnsmasq_c.elf,./$(notdir $<),MASSIF)
nulgrind-config_dnsmasq_c.elf: $(BIN_DIR)/config_dnsmasq_c.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,config_dnsmasq_c.elf,./$(notdir $<),NULGRIND)

memcheck-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,alltests.elf,./$(notdir $<),MEMCHECK)
helgrind-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,alltests.elf,./$(notdir $<),HELGRIND)
callgrind-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,alltests.elf,./$(notdir $<),CALLGRIND)
massif-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,alltests.elf,./$(notdir $<),MASSIF)
nulgrind-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,alltests.elf,./$(notdir $<),NULGRIND)
