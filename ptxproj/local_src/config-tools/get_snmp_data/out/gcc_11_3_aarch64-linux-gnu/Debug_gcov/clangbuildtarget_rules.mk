CPPFLAGS := $(CPPFLAGS)
CFLAGS := $(CFLAGS)
CXXFLAGS := $(CXXFLAGS)
LDFLAGS := $(LDFLAGS)
ARFLAGS := $(ARFLAGS)

get_snmp_data.elf_SOURCES := $(get_snmp_data.elf_SOURCES)
get_snmp_data.elf_GENHEADERS := $(get_snmp_data.elf_GENHEADERS)
get_snmp_data.elf_CPPFLAGS := $(get_snmp_data.elf_CPPFLAGS)
get_snmp_data.elf_CFLAGS := $(get_snmp_data.elf_CFLAGS)
get_snmp_data.elf_CXXFLAGS := $(get_snmp_data.elf_CXXFLAGS)
get_snmp_data.elf_LDFLAGS := $(get_snmp_data.elf_LDFLAGS)
get_snmp_data.elf_ARFLAGS := $(get_snmp_data.elf_ARFLAGS)

libget_snmp_data.a_SOURCES := $(libget_snmp_data.a_SOURCES)
libget_snmp_data.a_GENHEADERS := $(libget_snmp_data.a_GENHEADERS)
libget_snmp_data.a_CPPFLAGS := $(libget_snmp_data.a_CPPFLAGS)
libget_snmp_data.a_CFLAGS := $(libget_snmp_data.a_CFLAGS)
libget_snmp_data.a_CXXFLAGS := $(libget_snmp_data.a_CXXFLAGS)
libget_snmp_data.a_LDFLAGS := $(libget_snmp_data.a_LDFLAGS)
libget_snmp_data.a_ARFLAGS := $(libget_snmp_data.a_ARFLAGS)

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

get_snmp_data.elf_LINT_SOURCES ?= $(filter-out $(get_snmp_data.elf_NOLINT_SOURCES),$(get_snmp_data.elf_SOURCES))
OBJS_get_snmp_data.elf := $(call objs,$(get_snmp_data.elf_SOURCES),get_snmp_data.elf/)
DEPS_get_snmp_data.elf := $(call deps,$(get_snmp_data.elf_SOURCES),get_snmp_data.elf/)
GCNOS_NATIVE_get_snmp_data.elf = $(call gcnos,$(get_snmp_data.elf_SOURCES),get_snmp_data.elf/)
GCNOS_TRANSITIVE_get_snmp_data.elf = $(sort $(GCNOS_NATIVE_get_snmp_data.elf) $(GCNOS_TRANSITIVE_libget_snmp_data.a))
GCNO_TARGETS_NATIVE_get_snmp_data.elf = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/get_snmp_data.elf/gcovr/gcda/%,$(GCNOS_NATIVE_get_snmp_data.elf))
GCNO_TARGETS_TRANSITIVE_get_snmp_data.elf = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/get_snmp_data.elf/gcovr/gcda/%,$(GCNOS_TRANSITIVE_get_snmp_data.elf))
.PRECIOUS: $(GCNO_TARGETS_TRANSITIVE_get_snmp_data.elf)
GCOV_TARGETS_NATIVE_get_snmp_data.elf = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_NATIVE_get_snmp_data.elf))
GCOV_TARGETS_TRANSITIVE_get_snmp_data.elf = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_TRANSITIVE_get_snmp_data.elf))
LOBS_get_snmp_data.elf := $(call lobs,$(get_snmp_data.elf_LINT_SOURCES),get_snmp_data.elf/)
TIDYS_get_snmp_data.elf := $(call tidys,$(get_snmp_data.elf_LINT_SOURCES),get_snmp_data.elf/)
$(TIDYS_get_snmp_data.elf): $(get_snmp_data.elf_PRECLANG_FILES)
PLINTS_get_snmp_data.elf := $(call plints,$(get_snmp_data.elf_LINT_SOURCES),get_snmp_data.elf/)
$(PLINTS_get_snmp_data.elf): $(get_snmp_data.elf_PRECLANG_FILES)

get_snmp_data.elf_OUT_OF_SOURCETREE = $(filter-out $(PROJECT_ROOT)/%,$(get_snmp_data.elf_SOURCES))
$(if $(strip $(get_snmp_data.elf_OUT_OF_SOURCETREE)),$(warning Source file lists need to start with $$(PROJECT_ROOT). get_snmp_data.elf_SOURCES -> $(get_snmp_data.elf_OUT_OF_SOURCETREE)),)

$(if $(filter CLANG_TIDY_BASE_CHECKS CLANG_TIDY_CHECKS,$(get_snmp_data.elf_CLANG_TIDY_RULESET)),$(error get_snmp_data.elf_CLANG_TIDY_RULESET has "$(get_snmp_data.elf_CLANG_TIDY_RULESET)" assigned to it. Instead, assign "$$($(get_snmp_data.elf_CLANG_TIDY_RULESET))"))

get_snmp_data.elf: $(BIN_DIR)/get_snmp_data.elf

$(DEPS_get_snmp_data.elf) $(OBJS_get_snmp_data.elf) $(LOBS_get_snmp_data.elf) $(TIDYS_get_snmp_data.elf) $(PLINTS_get_snmp_data.elf) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/get_snmp_data.elf/lint_mac.h: BUILDTARGET_CPPFLAGS:=$(get_snmp_data.elf_CPPFLAGS)

$(DEPS_get_snmp_data.elf) $(OBJS_get_snmp_data.elf) $(TIDYS_get_snmp_data.elf) $(PLINTS_get_snmp_data.elf) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/get_snmp_data.elf/lint_mac.h: BUILDTARGET_CXXFLAGS:=$(get_snmp_data.elf_CXXFLAGS)

$(DEPS_get_snmp_data.elf) $(OBJS_get_snmp_data.elf) $(TIDYS_get_snmp_data.elf) $(PLINTS_get_snmp_data.elf) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/get_snmp_data.elf/lint_mac.h: BUILDTARGET_CFLAGS:=$(get_snmp_data.elf_CFLAGS)

lint-get_snmp_data.elf: flexelint-get_snmp_data.elf clang-tidy-get_snmp_data.elf

$(LOBS_get_snmp_data.elf): BUILDTARGET_LINTFLAGS:=$(get_snmp_data.elf_LINTFLAGS)

flexelint-get_snmp_data.elf: $($(get_snmp_data.elf_DISABLE_FLEXELINT)$(DISABLE_FLEXELINT)$(get_snmp_data.elf_DISABLE_LINT)$(DISABLE_LINT)LOBS_get_snmp_data.elf)

$(TIDYS_get_snmp_data.elf): BUILDTARGET_TIDYFLAGS:=$(get_snmp_data.elf_TIDYFLAGS) -isystem $(OUT_DIR)/get_snmp_data.elf -include lint_mac.h

$(TIDYS_get_snmp_data.elf): get_snmp_data.elf_CLANG_TIDY_RULESET ?= $(CLANG_TIDY_RULESET)

$(TIDYS_get_snmp_data.elf): CLANG_TIDY_CHECKS_OPTION:=$(subst $( ),$(,),$(strip $(get_snmp_data.elf_CLANG_TIDY_RULESET) $(get_snmp_data.elf_CLANG_TIDY_CHECKS)))

$(PLINTS_get_snmp_data.elf): BUILDTARGET_PLINTFLAGS:=$(get_snmp_data.elf_PLINTSFLAGS) -isystem $(OUT_DIR)/get_snmp_data.elf -include lint_mac.h

clang-tidy-get_snmp_data.elf: $($(get_snmp_data.elf_DISABLE_CLANG_TIDY)$(DISABLE_CLANG_TIDY)$(get_snmp_data.elf_DISABLE_LINT)$(DISABLE_LINT)TIDYS_get_snmp_data.elf)

clean-clang-tidy-get_snmp_data.elf:; $(SILENT)rm --force $(TIDYS_get_snmp_data.elf)

clangsa-get_snmp_data.elf: $(PLINTS_get_snmp_data.elf)

./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/info/get_snmp_data.elf-info.txt: $(SCRIPT_DIR)/internal/clang/info_txt.template $(MK_FILES); $(SILENT)$(call clangbuild_subst_info_buildtarget,get_snmp_data.elf,$<) > $@

info-txt-get_snmp_data.elf: $(OUT_DIR)/info/get_snmp_data.elf-info.txt; $(SILENT)cat $<

$(OUT_DIR)/get_snmp_data.elf/%.o.d: $(PROJECT_ROOT)/% $(MK_FILES) $(MAKEDEP_SUPPORT_FILES) | $(get_snmp_data.elf_GENHEADERS); $(SILENT)$(call makedep,$@,$<,$(FLAGS))

$(OUT_DIR)/get_snmp_data.elf/%.o: $(PROJECT_ROOT)/% $(MK_FILES) $(CC_SUPPORT_FILES) | $(get_snmp_data.elf_GENHEADERS); $(SILENT)$(call cc,$@,$<,$(FLAGS))

$(OUT_DIR)/get_snmp_data.elf/%.lob: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) | $(get_snmp_data.elf_GENHEADERS); $(SILENT)$(call lint,$@,$<,$(FLAGS))

get_snmp_data.elf_PRECLANG_FILES=$(OUT_DIR)/get_snmp_data.elf/lint_mac.h

$(OUT_DIR)/get_snmp_data.elf/%.tidy: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(get_snmp_data.elf_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/get_snmp_data.elf/%.o.d $(wildcard .clang-tidy) | $(TIDY_SUPPORT_DIRS); $(SILENT)$(call clang-tidy,$@,$<,$(FLAGS))

$(OUT_DIR)/get_snmp_data.elf/%.plint: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(get_snmp_data.elf_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/get_snmp_data.elf/%.o.d; $(SILENT)$(call clang-sa,$@,$<,$(FLAGS))



$(OUT_DIR)/get_snmp_data.elf/gcovr/gcda/%.gcno: check-get_snmp_data.elf; $(SILENT)mkdir -p $(dir $@) && cp $(OUT_DIR)/$*.gcno $@

libget_snmp_data.a_LINT_SOURCES ?= $(filter-out $(libget_snmp_data.a_NOLINT_SOURCES),$(libget_snmp_data.a_SOURCES))
OBJS_libget_snmp_data.a := $(call objs,$(libget_snmp_data.a_SOURCES),libget_snmp_data.a/)
DEPS_libget_snmp_data.a := $(call deps,$(libget_snmp_data.a_SOURCES),libget_snmp_data.a/)
GCNOS_NATIVE_libget_snmp_data.a = $(call gcnos,$(libget_snmp_data.a_SOURCES),libget_snmp_data.a/)
GCNOS_TRANSITIVE_libget_snmp_data.a = $(sort $(GCNOS_NATIVE_libget_snmp_data.a) )
GCNO_TARGETS_NATIVE_libget_snmp_data.a = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/libget_snmp_data.a/gcovr/gcda/%,$(GCNOS_NATIVE_libget_snmp_data.a))
GCNO_TARGETS_TRANSITIVE_libget_snmp_data.a = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/libget_snmp_data.a/gcovr/gcda/%,$(GCNOS_TRANSITIVE_libget_snmp_data.a))
.PRECIOUS: $(GCNO_TARGETS_TRANSITIVE_libget_snmp_data.a)
GCOV_TARGETS_NATIVE_libget_snmp_data.a = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_NATIVE_libget_snmp_data.a))
GCOV_TARGETS_TRANSITIVE_libget_snmp_data.a = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_TRANSITIVE_libget_snmp_data.a))
LOBS_libget_snmp_data.a := $(call lobs,$(libget_snmp_data.a_LINT_SOURCES),libget_snmp_data.a/)
TIDYS_libget_snmp_data.a := $(call tidys,$(libget_snmp_data.a_LINT_SOURCES),libget_snmp_data.a/)
$(TIDYS_libget_snmp_data.a): $(libget_snmp_data.a_PRECLANG_FILES)
PLINTS_libget_snmp_data.a := $(call plints,$(libget_snmp_data.a_LINT_SOURCES),libget_snmp_data.a/)
$(PLINTS_libget_snmp_data.a): $(libget_snmp_data.a_PRECLANG_FILES)

libget_snmp_data.a_OUT_OF_SOURCETREE = $(filter-out $(PROJECT_ROOT)/%,$(libget_snmp_data.a_SOURCES))
$(if $(strip $(libget_snmp_data.a_OUT_OF_SOURCETREE)),$(warning Source file lists need to start with $$(PROJECT_ROOT). libget_snmp_data.a_SOURCES -> $(libget_snmp_data.a_OUT_OF_SOURCETREE)),)

$(if $(filter CLANG_TIDY_BASE_CHECKS CLANG_TIDY_CHECKS,$(libget_snmp_data.a_CLANG_TIDY_RULESET)),$(error libget_snmp_data.a_CLANG_TIDY_RULESET has "$(libget_snmp_data.a_CLANG_TIDY_RULESET)" assigned to it. Instead, assign "$$($(libget_snmp_data.a_CLANG_TIDY_RULESET))"))

libget_snmp_data.a: $(BIN_DIR)/libget_snmp_data.a

$(DEPS_libget_snmp_data.a) $(OBJS_libget_snmp_data.a) $(LOBS_libget_snmp_data.a) $(TIDYS_libget_snmp_data.a) $(PLINTS_libget_snmp_data.a) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/libget_snmp_data.a/lint_mac.h: BUILDTARGET_CPPFLAGS:=$(libget_snmp_data.a_CPPFLAGS)

$(DEPS_libget_snmp_data.a) $(OBJS_libget_snmp_data.a) $(TIDYS_libget_snmp_data.a) $(PLINTS_libget_snmp_data.a) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/libget_snmp_data.a/lint_mac.h: BUILDTARGET_CXXFLAGS:=$(libget_snmp_data.a_CXXFLAGS)

$(DEPS_libget_snmp_data.a) $(OBJS_libget_snmp_data.a) $(TIDYS_libget_snmp_data.a) $(PLINTS_libget_snmp_data.a) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/libget_snmp_data.a/lint_mac.h: BUILDTARGET_CFLAGS:=$(libget_snmp_data.a_CFLAGS)

lint-libget_snmp_data.a: flexelint-libget_snmp_data.a clang-tidy-libget_snmp_data.a

$(LOBS_libget_snmp_data.a): BUILDTARGET_LINTFLAGS:=$(libget_snmp_data.a_LINTFLAGS)

flexelint-libget_snmp_data.a: $($(libget_snmp_data.a_DISABLE_FLEXELINT)$(DISABLE_FLEXELINT)$(libget_snmp_data.a_DISABLE_LINT)$(DISABLE_LINT)LOBS_libget_snmp_data.a)

$(TIDYS_libget_snmp_data.a): BUILDTARGET_TIDYFLAGS:=$(libget_snmp_data.a_TIDYFLAGS) -isystem $(OUT_DIR)/libget_snmp_data.a -include lint_mac.h

$(TIDYS_libget_snmp_data.a): libget_snmp_data.a_CLANG_TIDY_RULESET ?= $(CLANG_TIDY_RULESET)

$(TIDYS_libget_snmp_data.a): CLANG_TIDY_CHECKS_OPTION:=$(subst $( ),$(,),$(strip $(libget_snmp_data.a_CLANG_TIDY_RULESET) $(libget_snmp_data.a_CLANG_TIDY_CHECKS)))

$(PLINTS_libget_snmp_data.a): BUILDTARGET_PLINTFLAGS:=$(libget_snmp_data.a_PLINTSFLAGS) -isystem $(OUT_DIR)/libget_snmp_data.a -include lint_mac.h

clang-tidy-libget_snmp_data.a: $($(libget_snmp_data.a_DISABLE_CLANG_TIDY)$(DISABLE_CLANG_TIDY)$(libget_snmp_data.a_DISABLE_LINT)$(DISABLE_LINT)TIDYS_libget_snmp_data.a)

clean-clang-tidy-libget_snmp_data.a:; $(SILENT)rm --force $(TIDYS_libget_snmp_data.a)

clangsa-libget_snmp_data.a: $(PLINTS_libget_snmp_data.a)

./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/info/libget_snmp_data.a-info.txt: $(SCRIPT_DIR)/internal/clang/info_txt.template $(MK_FILES); $(SILENT)$(call clangbuild_subst_info_buildtarget,libget_snmp_data.a,$<) > $@

info-txt-libget_snmp_data.a: $(OUT_DIR)/info/libget_snmp_data.a-info.txt; $(SILENT)cat $<

$(OUT_DIR)/libget_snmp_data.a/%.o.d: $(PROJECT_ROOT)/% $(MK_FILES) $(MAKEDEP_SUPPORT_FILES) | $(libget_snmp_data.a_GENHEADERS); $(SILENT)$(call makedep,$@,$<,$(FLAGS))

$(OUT_DIR)/libget_snmp_data.a/%.o: $(PROJECT_ROOT)/% $(MK_FILES) $(CC_SUPPORT_FILES) | $(libget_snmp_data.a_GENHEADERS); $(SILENT)$(call cc,$@,$<,$(FLAGS))

$(OUT_DIR)/libget_snmp_data.a/%.lob: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) | $(libget_snmp_data.a_GENHEADERS); $(SILENT)$(call lint,$@,$<,$(FLAGS))

libget_snmp_data.a_PRECLANG_FILES=$(OUT_DIR)/libget_snmp_data.a/lint_mac.h

$(OUT_DIR)/libget_snmp_data.a/%.tidy: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(libget_snmp_data.a_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/libget_snmp_data.a/%.o.d $(wildcard .clang-tidy) | $(TIDY_SUPPORT_DIRS); $(SILENT)$(call clang-tidy,$@,$<,$(FLAGS))

$(OUT_DIR)/libget_snmp_data.a/%.plint: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(libget_snmp_data.a_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/libget_snmp_data.a/%.o.d; $(SILENT)$(call clang-sa,$@,$<,$(FLAGS))



$(OUT_DIR)/libget_snmp_data.a/gcovr/gcda/%.gcno: check-libget_snmp_data.a; $(SILENT)mkdir -p $(dir $@) && cp $(OUT_DIR)/$*.gcno $@

alltests.elf_LINT_SOURCES ?= $(filter-out $(alltests.elf_NOLINT_SOURCES),$(alltests.elf_SOURCES))
OBJS_alltests.elf := $(call objs,$(alltests.elf_SOURCES),alltests.elf/)
DEPS_alltests.elf := $(call deps,$(alltests.elf_SOURCES),alltests.elf/)
GCNOS_NATIVE_alltests.elf = $(call gcnos,$(alltests.elf_SOURCES),alltests.elf/)
GCNOS_TRANSITIVE_alltests.elf = $(sort $(GCNOS_NATIVE_alltests.elf) $(GCNOS_TRANSITIVE_libget_snmp_data.a))
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

$(DEPS_alltests.elf) $(OBJS_alltests.elf) $(LOBS_alltests.elf) $(TIDYS_alltests.elf) $(PLINTS_alltests.elf) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/alltests.elf/lint_mac.h: BUILDTARGET_CPPFLAGS:=$(alltests.elf_CPPFLAGS)

$(DEPS_alltests.elf) $(OBJS_alltests.elf) $(TIDYS_alltests.elf) $(PLINTS_alltests.elf) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/alltests.elf/lint_mac.h: BUILDTARGET_CXXFLAGS:=$(alltests.elf_CXXFLAGS)

$(DEPS_alltests.elf) $(OBJS_alltests.elf) $(TIDYS_alltests.elf) $(PLINTS_alltests.elf) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/alltests.elf/lint_mac.h: BUILDTARGET_CFLAGS:=$(alltests.elf_CFLAGS)

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

./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/info/alltests.elf-info.txt: $(SCRIPT_DIR)/internal/clang/info_txt.template $(MK_FILES); $(SILENT)$(call clangbuild_subst_info_buildtarget,alltests.elf,$<) > $@

info-txt-alltests.elf: $(OUT_DIR)/info/alltests.elf-info.txt; $(SILENT)cat $<

$(OUT_DIR)/alltests.elf/%.o.d: $(PROJECT_ROOT)/% $(MK_FILES) $(MAKEDEP_SUPPORT_FILES) | $(alltests.elf_GENHEADERS); $(SILENT)$(call makedep,$@,$<,$(FLAGS))

$(OUT_DIR)/alltests.elf/%.o: $(PROJECT_ROOT)/% $(MK_FILES) $(CC_SUPPORT_FILES) | $(alltests.elf_GENHEADERS); $(SILENT)$(call cc,$@,$<,$(FLAGS))

$(OUT_DIR)/alltests.elf/%.lob: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) | $(alltests.elf_GENHEADERS); $(SILENT)$(call lint,$@,$<,$(FLAGS))

alltests.elf_PRECLANG_FILES=$(OUT_DIR)/alltests.elf/lint_mac.h

$(OUT_DIR)/alltests.elf/%.tidy: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(alltests.elf_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/alltests.elf/%.o.d $(wildcard .clang-tidy) | $(TIDY_SUPPORT_DIRS); $(SILENT)$(call clang-tidy,$@,$<,$(FLAGS))

$(OUT_DIR)/alltests.elf/%.plint: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(alltests.elf_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/alltests.elf/%.o.d; $(SILENT)$(call clang-sa,$@,$<,$(FLAGS))



$(OUT_DIR)/alltests.elf/gcovr/gcda/%.gcno: check-alltests.elf; $(SILENT)mkdir -p $(dir $@) && cp $(OUT_DIR)/$*.gcno $@

$(OUT_DIR)/get_snmp_data.elf.dbg: $(OBJS_get_snmp_data.elf) $(MK_FILES) $(get_snmp_data.elf_PREREQUISITES) $(LD_SUPPORT_FILES); $(SILENT)$(call ld$(ARTIFACT),get_snmp_data.elf,$@,$(OBJS_get_snmp_data.elf),$(LDFLAGS) $(get_snmp_data.elf_LDFLAGS))

$(OUT_DIR)/alltests.elf.dbg: $(OBJS_alltests.elf) $(MK_FILES) $(alltests.elf_PREREQUISITES) $(LD_SUPPORT_FILES); $(SILENT)$(call ld$(ARTIFACT),alltests.elf,$@,$(OBJS_alltests.elf),$(LDFLAGS) $(alltests.elf_LDFLAGS))

$(BIN_DIR)/libget_snmp_data.a: $(OBJS_libget_snmp_data.a) $(MK_FILES) $(libget_snmp_data.a_PREREQUISITES) $(AR_SUPPORT_FILES); $(SILENT) rm --force $@; $(call ar,libget_snmp_data.a,$@,$(OBJS_libget_snmp_data.a),$(ARFLAGS) $(libget_snmp_data.a_ARFLAGS))

check-alltests.elf: $(BIN_DIR)/alltests.elf cleanup_coverage-alltests.elf ; $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && (cd $(dir $<) && $(call clangbuild_check,alltests.elf,./$(notdir $<)))
$(GCNOS_NATIVE_alltests.elf): check-alltests.elf
cleanup_coverage-alltests.elf: $(BIN_DIR)/alltests.elf; $(SILENT)rm -rf $(OUT_DIR)/alltests.elf/gcovr/gcda 
coverage-alltests.elf gcovr-alltests.elf: $(OUT_DIR)/alltests.elf/gcovr/coverage.html
$(OUT_DIR)/alltests.elf/gcovr/gcda/.gcovs: check-alltests.elf $(GCNO_TARGETS_TRANSITIVE_alltests.elf); $(SILENT) find $(OUT_DIR)/alltests.elf/gcovr/gcda \( -name gmock_main.dir -or -name gmock.dir \) -type d -exec rm -rf {} + ; $(foreach folder,$(shell ls -d $(OUT_DIR)/alltests.elf/gcovr/gcda/*/), $(call clangbuildtarget_gcov_folder,$(folder)); ) touch $@
$(OUT_DIR)/alltests.elf/gcovr/coverage.xml $(OUT_DIR)/alltests.elf/gcovr/coverage.html: $(OUT_DIR)/alltests.elf/gcovr/gcda/.gcovs ; $(SILENT) gcovr -r . -j $(NPROC) --xml-pretty --xml $(OUT_DIR)/alltests.elf/gcovr/coverage.xml --html --html-details $(OUT_DIR)/alltests.elf/gcovr/coverage.html --html-title alltests.elf --exclude-throw-branches  --use-gcov-files --keep $(addprefix --filter ',$(addsuffix ',$(alltests.elf_GCOVR_FILTER:./%=%) $(GCOVR_FILTER:./%=%))) $(addprefix --exclude ',$(addsuffix ',$(alltests.elf_GCOVR_EXCLUDE:./%=%) $(GCOVR_EXCLUDE:./%=%))) $(addprefix --exclude-directories '$(OUT_DIR:./%=%)/alltests.elf/gcovr/gcda/,$(addsuffix ',$(alltests.elf_GCOVR_EXCLUDE_DIRECTORIES) $(GCOVR_EXCLUDE_DIRECTORIES))) $(alltests.elf_GCOVR_ADDITIONAL_PARAMS) --print-summary $(addprefix $(OUT_DIR)/alltests.elf/gcovr/gcda/,$(or $(strip $(alltests.elf_GCOVR_SEARCH_PATH) $(GCOVR_SEARCH_PATH)),.)) && $(call clangbuildtarget_gcov_print_coverage_written,$(OUT_DIR)/alltests.elf/gcovr/coverage.xml) $(call clangbuildtarget_gcov_print_coverage_written,$(OUT_DIR)/alltests.elf/gcovr/coverage.html)
$(OUT_DIR)/alltests.elf/gcovr/coverage.json: $(OUT_DIR)/alltests.elf/gcovr/gcda/.gcovs check-alltests.elf ; $(SILENT) gcovr -r . -j $(NPROC) --json-pretty --json --output $(OUT_DIR)/alltests.elf/gcovr/coverage.json --exclude-throw-branches  --use-gcov-files --keep $(addprefix --filter ',$(addsuffix ',$(GCOVR_FILTER:./%=%))) $(addprefix --exclude ',$(addsuffix ',$(GCOVR_EXCLUDE:./%=%))) $(addprefix --exclude-directories '$(OUT_DIR:./%=%)/alltests.elf/gcovr/gcda/,$(addsuffix ',$(GCOVR_EXCLUDE_DIRECTORIES))) --print-summary $(addprefix $(OUT_DIR)/alltests.elf/gcovr/gcda/,$(or $(strip $(GCOVR_SEARCH_PATH)),.)) && $(call clangbuildtarget_gcov_print_coverage_written,$(OUT_DIR)/alltests.elf/gcovr/coverage.json)
$(if $(DISABLE_GCOV), coverage-alltests.elf gcovr-alltests.elf: ; @echo "make: *** [coverage-alltests.elf] DISABLE_GCOV needs to be empty!" >&2; false )

memcheck-get_snmp_data.elf: $(BIN_DIR)/get_snmp_data.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,get_snmp_data.elf,./$(notdir $<),MEMCHECK)
helgrind-get_snmp_data.elf: $(BIN_DIR)/get_snmp_data.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,get_snmp_data.elf,./$(notdir $<),HELGRIND)
callgrind-get_snmp_data.elf: $(BIN_DIR)/get_snmp_data.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,get_snmp_data.elf,./$(notdir $<),CALLGRIND)
massif-get_snmp_data.elf: $(BIN_DIR)/get_snmp_data.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,get_snmp_data.elf,./$(notdir $<),MASSIF)
nulgrind-get_snmp_data.elf: $(BIN_DIR)/get_snmp_data.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,get_snmp_data.elf,./$(notdir $<),NULGRIND)

memcheck-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,alltests.elf,./$(notdir $<),MEMCHECK)
helgrind-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,alltests.elf,./$(notdir $<),HELGRIND)
callgrind-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,alltests.elf,./$(notdir $<),CALLGRIND)
massif-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,alltests.elf,./$(notdir $<),MASSIF)
nulgrind-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,alltests.elf,./$(notdir $<),NULGRIND)
