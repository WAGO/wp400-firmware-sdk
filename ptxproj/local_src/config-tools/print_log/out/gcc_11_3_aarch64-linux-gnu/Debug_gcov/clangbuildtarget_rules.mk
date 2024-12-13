CPPFLAGS := $(CPPFLAGS)
CFLAGS := $(CFLAGS)
CXXFLAGS := $(CXXFLAGS)
LDFLAGS := $(LDFLAGS)
ARFLAGS := $(ARFLAGS)

print_log.elf_SOURCES := $(print_log.elf_SOURCES)
print_log.elf_GENHEADERS := $(print_log.elf_GENHEADERS)
print_log.elf_CPPFLAGS := $(print_log.elf_CPPFLAGS)
print_log.elf_CFLAGS := $(print_log.elf_CFLAGS)
print_log.elf_CXXFLAGS := $(print_log.elf_CXXFLAGS)
print_log.elf_LDFLAGS := $(print_log.elf_LDFLAGS)
print_log.elf_ARFLAGS := $(print_log.elf_ARFLAGS)

libutil_log.a_SOURCES := $(libutil_log.a_SOURCES)
libutil_log.a_GENHEADERS := $(libutil_log.a_GENHEADERS)
libutil_log.a_CPPFLAGS := $(libutil_log.a_CPPFLAGS)
libutil_log.a_CFLAGS := $(libutil_log.a_CFLAGS)
libutil_log.a_CXXFLAGS := $(libutil_log.a_CXXFLAGS)
libutil_log.a_LDFLAGS := $(libutil_log.a_LDFLAGS)
libutil_log.a_ARFLAGS := $(libutil_log.a_ARFLAGS)

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

print_log.elf_LINT_SOURCES ?= $(filter-out $(print_log.elf_NOLINT_SOURCES),$(print_log.elf_SOURCES))
OBJS_print_log.elf := $(call objs,$(print_log.elf_SOURCES),print_log.elf/)
DEPS_print_log.elf := $(call deps,$(print_log.elf_SOURCES),print_log.elf/)
GCNOS_NATIVE_print_log.elf = $(call gcnos,$(print_log.elf_SOURCES),print_log.elf/)
GCNOS_TRANSITIVE_print_log.elf = $(sort $(GCNOS_NATIVE_print_log.elf) $(GCNOS_TRANSITIVE_libutil_log.a))
GCNO_TARGETS_NATIVE_print_log.elf = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/print_log.elf/gcovr/gcda/%,$(GCNOS_NATIVE_print_log.elf))
GCNO_TARGETS_TRANSITIVE_print_log.elf = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/print_log.elf/gcovr/gcda/%,$(GCNOS_TRANSITIVE_print_log.elf))
.PRECIOUS: $(GCNO_TARGETS_TRANSITIVE_print_log.elf)
GCOV_TARGETS_NATIVE_print_log.elf = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_NATIVE_print_log.elf))
GCOV_TARGETS_TRANSITIVE_print_log.elf = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_TRANSITIVE_print_log.elf))
LOBS_print_log.elf := $(call lobs,$(print_log.elf_LINT_SOURCES),print_log.elf/)
TIDYS_print_log.elf := $(call tidys,$(print_log.elf_LINT_SOURCES),print_log.elf/)
$(TIDYS_print_log.elf): $(print_log.elf_PRECLANG_FILES)
PLINTS_print_log.elf := $(call plints,$(print_log.elf_LINT_SOURCES),print_log.elf/)
$(PLINTS_print_log.elf): $(print_log.elf_PRECLANG_FILES)

print_log.elf_OUT_OF_SOURCETREE = $(filter-out $(PROJECT_ROOT)/%,$(print_log.elf_SOURCES))
$(if $(strip $(print_log.elf_OUT_OF_SOURCETREE)),$(warning Source file lists need to start with $$(PROJECT_ROOT). print_log.elf_SOURCES -> $(print_log.elf_OUT_OF_SOURCETREE)),)

$(if $(filter CLANG_TIDY_BASE_CHECKS CLANG_TIDY_CHECKS,$(print_log.elf_CLANG_TIDY_RULESET)),$(error print_log.elf_CLANG_TIDY_RULESET has "$(print_log.elf_CLANG_TIDY_RULESET)" assigned to it. Instead, assign "$$($(print_log.elf_CLANG_TIDY_RULESET))"))

print_log.elf: $(BIN_DIR)/print_log.elf

$(DEPS_print_log.elf) $(OBJS_print_log.elf) $(LOBS_print_log.elf) $(TIDYS_print_log.elf) $(PLINTS_print_log.elf) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/print_log.elf/lint_mac.h: BUILDTARGET_CPPFLAGS:=$(print_log.elf_CPPFLAGS)

$(DEPS_print_log.elf) $(OBJS_print_log.elf) $(TIDYS_print_log.elf) $(PLINTS_print_log.elf) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/print_log.elf/lint_mac.h: BUILDTARGET_CXXFLAGS:=$(print_log.elf_CXXFLAGS)

$(DEPS_print_log.elf) $(OBJS_print_log.elf) $(TIDYS_print_log.elf) $(PLINTS_print_log.elf) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/print_log.elf/lint_mac.h: BUILDTARGET_CFLAGS:=$(print_log.elf_CFLAGS)

lint-print_log.elf: flexelint-print_log.elf clang-tidy-print_log.elf

$(LOBS_print_log.elf): BUILDTARGET_LINTFLAGS:=$(print_log.elf_LINTFLAGS)

flexelint-print_log.elf: $($(print_log.elf_DISABLE_FLEXELINT)$(DISABLE_FLEXELINT)$(print_log.elf_DISABLE_LINT)$(DISABLE_LINT)LOBS_print_log.elf)

$(TIDYS_print_log.elf): BUILDTARGET_TIDYFLAGS:=$(print_log.elf_TIDYFLAGS) -isystem $(OUT_DIR)/print_log.elf -include lint_mac.h

$(TIDYS_print_log.elf): print_log.elf_CLANG_TIDY_RULESET ?= $(CLANG_TIDY_RULESET)

$(TIDYS_print_log.elf): CLANG_TIDY_CHECKS_OPTION:=$(subst $( ),$(,),$(strip $(print_log.elf_CLANG_TIDY_RULESET) $(print_log.elf_CLANG_TIDY_CHECKS)))

$(PLINTS_print_log.elf): BUILDTARGET_PLINTFLAGS:=$(print_log.elf_PLINTSFLAGS) -isystem $(OUT_DIR)/print_log.elf -include lint_mac.h

clang-tidy-print_log.elf: $($(print_log.elf_DISABLE_CLANG_TIDY)$(DISABLE_CLANG_TIDY)$(print_log.elf_DISABLE_LINT)$(DISABLE_LINT)TIDYS_print_log.elf)

clean-clang-tidy-print_log.elf:; $(SILENT)rm --force $(TIDYS_print_log.elf)

clangsa-print_log.elf: $(PLINTS_print_log.elf)

./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/info/print_log.elf-info.txt: $(SCRIPT_DIR)/internal/clang/info_txt.template $(MK_FILES); $(SILENT)$(call clangbuild_subst_info_buildtarget,print_log.elf,$<) > $@

info-txt-print_log.elf: $(OUT_DIR)/info/print_log.elf-info.txt; $(SILENT)cat $<

$(OUT_DIR)/print_log.elf/%.o.d: $(PROJECT_ROOT)/% $(MK_FILES) $(MAKEDEP_SUPPORT_FILES) | $(print_log.elf_GENHEADERS); $(SILENT)$(call makedep,$@,$<,$(FLAGS))

$(OUT_DIR)/print_log.elf/%.o: $(PROJECT_ROOT)/% $(MK_FILES) $(CC_SUPPORT_FILES) | $(print_log.elf_GENHEADERS); $(SILENT)$(call cc,$@,$<,$(FLAGS))

$(OUT_DIR)/print_log.elf/%.lob: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) | $(print_log.elf_GENHEADERS); $(SILENT)$(call lint,$@,$<,$(FLAGS))

print_log.elf_PRECLANG_FILES=$(OUT_DIR)/print_log.elf/lint_mac.h

$(OUT_DIR)/print_log.elf/%.tidy: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(print_log.elf_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/print_log.elf/%.o.d $(wildcard .clang-tidy) | $(TIDY_SUPPORT_DIRS); $(SILENT)$(call clang-tidy,$@,$<,$(FLAGS))

$(OUT_DIR)/print_log.elf/%.plint: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(print_log.elf_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/print_log.elf/%.o.d; $(SILENT)$(call clang-sa,$@,$<,$(FLAGS))



$(OUT_DIR)/print_log.elf/gcovr/gcda/%.gcno: check-print_log.elf; $(SILENT)mkdir -p $(dir $@) && cp $(OUT_DIR)/$*.gcno $@

libutil_log.a_LINT_SOURCES ?= $(filter-out $(libutil_log.a_NOLINT_SOURCES),$(libutil_log.a_SOURCES))
OBJS_libutil_log.a := $(call objs,$(libutil_log.a_SOURCES),libutil_log.a/)
DEPS_libutil_log.a := $(call deps,$(libutil_log.a_SOURCES),libutil_log.a/)
GCNOS_NATIVE_libutil_log.a = $(call gcnos,$(libutil_log.a_SOURCES),libutil_log.a/)
GCNOS_TRANSITIVE_libutil_log.a = $(sort $(GCNOS_NATIVE_libutil_log.a) )
GCNO_TARGETS_NATIVE_libutil_log.a = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/libutil_log.a/gcovr/gcda/%,$(GCNOS_NATIVE_libutil_log.a))
GCNO_TARGETS_TRANSITIVE_libutil_log.a = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/libutil_log.a/gcovr/gcda/%,$(GCNOS_TRANSITIVE_libutil_log.a))
.PRECIOUS: $(GCNO_TARGETS_TRANSITIVE_libutil_log.a)
GCOV_TARGETS_NATIVE_libutil_log.a = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_NATIVE_libutil_log.a))
GCOV_TARGETS_TRANSITIVE_libutil_log.a = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_TRANSITIVE_libutil_log.a))
LOBS_libutil_log.a := $(call lobs,$(libutil_log.a_LINT_SOURCES),libutil_log.a/)
TIDYS_libutil_log.a := $(call tidys,$(libutil_log.a_LINT_SOURCES),libutil_log.a/)
$(TIDYS_libutil_log.a): $(libutil_log.a_PRECLANG_FILES)
PLINTS_libutil_log.a := $(call plints,$(libutil_log.a_LINT_SOURCES),libutil_log.a/)
$(PLINTS_libutil_log.a): $(libutil_log.a_PRECLANG_FILES)

libutil_log.a_OUT_OF_SOURCETREE = $(filter-out $(PROJECT_ROOT)/%,$(libutil_log.a_SOURCES))
$(if $(strip $(libutil_log.a_OUT_OF_SOURCETREE)),$(warning Source file lists need to start with $$(PROJECT_ROOT). libutil_log.a_SOURCES -> $(libutil_log.a_OUT_OF_SOURCETREE)),)

$(if $(filter CLANG_TIDY_BASE_CHECKS CLANG_TIDY_CHECKS,$(libutil_log.a_CLANG_TIDY_RULESET)),$(error libutil_log.a_CLANG_TIDY_RULESET has "$(libutil_log.a_CLANG_TIDY_RULESET)" assigned to it. Instead, assign "$$($(libutil_log.a_CLANG_TIDY_RULESET))"))

libutil_log.a: $(BIN_DIR)/libutil_log.a

$(DEPS_libutil_log.a) $(OBJS_libutil_log.a) $(LOBS_libutil_log.a) $(TIDYS_libutil_log.a) $(PLINTS_libutil_log.a) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/libutil_log.a/lint_mac.h: BUILDTARGET_CPPFLAGS:=$(libutil_log.a_CPPFLAGS)

$(DEPS_libutil_log.a) $(OBJS_libutil_log.a) $(TIDYS_libutil_log.a) $(PLINTS_libutil_log.a) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/libutil_log.a/lint_mac.h: BUILDTARGET_CXXFLAGS:=$(libutil_log.a_CXXFLAGS)

$(DEPS_libutil_log.a) $(OBJS_libutil_log.a) $(TIDYS_libutil_log.a) $(PLINTS_libutil_log.a) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/libutil_log.a/lint_mac.h: BUILDTARGET_CFLAGS:=$(libutil_log.a_CFLAGS)

lint-libutil_log.a: flexelint-libutil_log.a clang-tidy-libutil_log.a

$(LOBS_libutil_log.a): BUILDTARGET_LINTFLAGS:=$(libutil_log.a_LINTFLAGS)

flexelint-libutil_log.a: $($(libutil_log.a_DISABLE_FLEXELINT)$(DISABLE_FLEXELINT)$(libutil_log.a_DISABLE_LINT)$(DISABLE_LINT)LOBS_libutil_log.a)

$(TIDYS_libutil_log.a): BUILDTARGET_TIDYFLAGS:=$(libutil_log.a_TIDYFLAGS) -isystem $(OUT_DIR)/libutil_log.a -include lint_mac.h

$(TIDYS_libutil_log.a): libutil_log.a_CLANG_TIDY_RULESET ?= $(CLANG_TIDY_RULESET)

$(TIDYS_libutil_log.a): CLANG_TIDY_CHECKS_OPTION:=$(subst $( ),$(,),$(strip $(libutil_log.a_CLANG_TIDY_RULESET) $(libutil_log.a_CLANG_TIDY_CHECKS)))

$(PLINTS_libutil_log.a): BUILDTARGET_PLINTFLAGS:=$(libutil_log.a_PLINTSFLAGS) -isystem $(OUT_DIR)/libutil_log.a -include lint_mac.h

clang-tidy-libutil_log.a: $($(libutil_log.a_DISABLE_CLANG_TIDY)$(DISABLE_CLANG_TIDY)$(libutil_log.a_DISABLE_LINT)$(DISABLE_LINT)TIDYS_libutil_log.a)

clean-clang-tidy-libutil_log.a:; $(SILENT)rm --force $(TIDYS_libutil_log.a)

clangsa-libutil_log.a: $(PLINTS_libutil_log.a)

./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/info/libutil_log.a-info.txt: $(SCRIPT_DIR)/internal/clang/info_txt.template $(MK_FILES); $(SILENT)$(call clangbuild_subst_info_buildtarget,libutil_log.a,$<) > $@

info-txt-libutil_log.a: $(OUT_DIR)/info/libutil_log.a-info.txt; $(SILENT)cat $<

$(OUT_DIR)/libutil_log.a/%.o.d: $(PROJECT_ROOT)/% $(MK_FILES) $(MAKEDEP_SUPPORT_FILES) | $(libutil_log.a_GENHEADERS); $(SILENT)$(call makedep,$@,$<,$(FLAGS))

$(OUT_DIR)/libutil_log.a/%.o: $(PROJECT_ROOT)/% $(MK_FILES) $(CC_SUPPORT_FILES) | $(libutil_log.a_GENHEADERS); $(SILENT)$(call cc,$@,$<,$(FLAGS))

$(OUT_DIR)/libutil_log.a/%.lob: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) | $(libutil_log.a_GENHEADERS); $(SILENT)$(call lint,$@,$<,$(FLAGS))

libutil_log.a_PRECLANG_FILES=$(OUT_DIR)/libutil_log.a/lint_mac.h

$(OUT_DIR)/libutil_log.a/%.tidy: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(libutil_log.a_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/libutil_log.a/%.o.d $(wildcard .clang-tidy) | $(TIDY_SUPPORT_DIRS); $(SILENT)$(call clang-tidy,$@,$<,$(FLAGS))

$(OUT_DIR)/libutil_log.a/%.plint: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(libutil_log.a_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/libutil_log.a/%.o.d; $(SILENT)$(call clang-sa,$@,$<,$(FLAGS))



$(OUT_DIR)/libutil_log.a/gcovr/gcda/%.gcno: check-libutil_log.a; $(SILENT)mkdir -p $(dir $@) && cp $(OUT_DIR)/$*.gcno $@

alltests.elf_LINT_SOURCES ?= $(filter-out $(alltests.elf_NOLINT_SOURCES),$(alltests.elf_SOURCES))
OBJS_alltests.elf := $(call objs,$(alltests.elf_SOURCES),alltests.elf/)
DEPS_alltests.elf := $(call deps,$(alltests.elf_SOURCES),alltests.elf/)
GCNOS_NATIVE_alltests.elf = $(call gcnos,$(alltests.elf_SOURCES),alltests.elf/)
GCNOS_TRANSITIVE_alltests.elf = $(sort $(GCNOS_NATIVE_alltests.elf) $(GCNOS_TRANSITIVE_libutil_log.a))
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

$(OUT_DIR)/print_log.elf.dbg: $(OBJS_print_log.elf) $(MK_FILES) $(print_log.elf_PREREQUISITES) $(LD_SUPPORT_FILES); $(SILENT)$(call ld$(ARTIFACT),print_log.elf,$@,$(OBJS_print_log.elf),$(LDFLAGS) $(print_log.elf_LDFLAGS))

$(OUT_DIR)/alltests.elf.dbg: $(OBJS_alltests.elf) $(MK_FILES) $(alltests.elf_PREREQUISITES) $(LD_SUPPORT_FILES); $(SILENT)$(call ld$(ARTIFACT),alltests.elf,$@,$(OBJS_alltests.elf),$(LDFLAGS) $(alltests.elf_LDFLAGS))

$(BIN_DIR)/libutil_log.a: $(OBJS_libutil_log.a) $(MK_FILES) $(libutil_log.a_PREREQUISITES) $(AR_SUPPORT_FILES); $(SILENT) rm --force $@; $(call ar,libutil_log.a,$@,$(OBJS_libutil_log.a),$(ARFLAGS) $(libutil_log.a_ARFLAGS))

check-alltests.elf: $(BIN_DIR)/alltests.elf cleanup_coverage-alltests.elf ; $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && (cd $(dir $<) && $(call clangbuild_check,alltests.elf,./$(notdir $<)))
$(GCNOS_NATIVE_alltests.elf): check-alltests.elf
cleanup_coverage-alltests.elf: $(BIN_DIR)/alltests.elf; $(SILENT)rm -rf $(OUT_DIR)/alltests.elf/gcovr/gcda 
coverage-alltests.elf gcovr-alltests.elf: $(OUT_DIR)/alltests.elf/gcovr/coverage.html
$(OUT_DIR)/alltests.elf/gcovr/gcda/.gcovs: check-alltests.elf $(GCNO_TARGETS_TRANSITIVE_alltests.elf); $(SILENT) find $(OUT_DIR)/alltests.elf/gcovr/gcda \( -name gmock_main.dir -or -name gmock.dir \) -type d -exec rm -rf {} + ; $(foreach folder,$(shell ls -d $(OUT_DIR)/alltests.elf/gcovr/gcda/*/), $(call clangbuildtarget_gcov_folder,$(folder)); ) touch $@
$(OUT_DIR)/alltests.elf/gcovr/coverage.xml $(OUT_DIR)/alltests.elf/gcovr/coverage.html: $(OUT_DIR)/alltests.elf/gcovr/gcda/.gcovs ; $(SILENT) gcovr -r . -j $(NPROC) --xml-pretty --xml $(OUT_DIR)/alltests.elf/gcovr/coverage.xml --html --html-details $(OUT_DIR)/alltests.elf/gcovr/coverage.html --html-title alltests.elf --exclude-throw-branches  --use-gcov-files --keep $(addprefix --filter ',$(addsuffix ',$(alltests.elf_GCOVR_FILTER:./%=%) $(GCOVR_FILTER:./%=%))) $(addprefix --exclude ',$(addsuffix ',$(alltests.elf_GCOVR_EXCLUDE:./%=%) $(GCOVR_EXCLUDE:./%=%))) $(addprefix --exclude-directories '$(OUT_DIR:./%=%)/alltests.elf/gcovr/gcda/,$(addsuffix ',$(alltests.elf_GCOVR_EXCLUDE_DIRECTORIES) $(GCOVR_EXCLUDE_DIRECTORIES))) $(alltests.elf_GCOVR_ADDITIONAL_PARAMS) --print-summary $(addprefix $(OUT_DIR)/alltests.elf/gcovr/gcda/,$(or $(strip $(alltests.elf_GCOVR_SEARCH_PATH) $(GCOVR_SEARCH_PATH)),.)) && $(call clangbuildtarget_gcov_print_coverage_written,$(OUT_DIR)/alltests.elf/gcovr/coverage.xml) $(call clangbuildtarget_gcov_print_coverage_written,$(OUT_DIR)/alltests.elf/gcovr/coverage.html)
$(OUT_DIR)/alltests.elf/gcovr/coverage.json: $(OUT_DIR)/alltests.elf/gcovr/gcda/.gcovs check-alltests.elf ; $(SILENT) gcovr -r . -j $(NPROC) --json-pretty --json --output $(OUT_DIR)/alltests.elf/gcovr/coverage.json --exclude-throw-branches  --use-gcov-files --keep $(addprefix --filter ',$(addsuffix ',$(GCOVR_FILTER:./%=%))) $(addprefix --exclude ',$(addsuffix ',$(GCOVR_EXCLUDE:./%=%))) $(addprefix --exclude-directories '$(OUT_DIR:./%=%)/alltests.elf/gcovr/gcda/,$(addsuffix ',$(GCOVR_EXCLUDE_DIRECTORIES))) --print-summary $(addprefix $(OUT_DIR)/alltests.elf/gcovr/gcda/,$(or $(strip $(GCOVR_SEARCH_PATH)),.)) && $(call clangbuildtarget_gcov_print_coverage_written,$(OUT_DIR)/alltests.elf/gcovr/coverage.json)
$(if $(DISABLE_GCOV), coverage-alltests.elf gcovr-alltests.elf: ; @echo "make: *** [coverage-alltests.elf] DISABLE_GCOV needs to be empty!" >&2; false )

memcheck-print_log.elf: $(BIN_DIR)/print_log.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,print_log.elf,./$(notdir $<),MEMCHECK)
helgrind-print_log.elf: $(BIN_DIR)/print_log.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,print_log.elf,./$(notdir $<),HELGRIND)
callgrind-print_log.elf: $(BIN_DIR)/print_log.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,print_log.elf,./$(notdir $<),CALLGRIND)
massif-print_log.elf: $(BIN_DIR)/print_log.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,print_log.elf,./$(notdir $<),MASSIF)
nulgrind-print_log.elf: $(BIN_DIR)/print_log.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,print_log.elf,./$(notdir $<),NULGRIND)

memcheck-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,alltests.elf,./$(notdir $<),MEMCHECK)
helgrind-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,alltests.elf,./$(notdir $<),HELGRIND)
callgrind-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,alltests.elf,./$(notdir $<),CALLGRIND)
massif-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,alltests.elf,./$(notdir $<),MASSIF)
nulgrind-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,alltests.elf,./$(notdir $<),NULGRIND)
