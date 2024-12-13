CPPFLAGS := $(CPPFLAGS)
CFLAGS := $(CFLAGS)
CXXFLAGS := $(CXXFLAGS)
LDFLAGS := $(LDFLAGS)
ARFLAGS := $(ARFLAGS)

libsnmpconfig.a_SOURCES := $(libsnmpconfig.a_SOURCES)
libsnmpconfig.a_GENHEADERS := $(libsnmpconfig.a_GENHEADERS)
libsnmpconfig.a_CPPFLAGS := $(libsnmpconfig.a_CPPFLAGS)
libsnmpconfig.a_CFLAGS := $(libsnmpconfig.a_CFLAGS)
libsnmpconfig.a_CXXFLAGS := $(libsnmpconfig.a_CXXFLAGS)
libsnmpconfig.a_LDFLAGS := $(libsnmpconfig.a_LDFLAGS)
libsnmpconfig.a_ARFLAGS := $(libsnmpconfig.a_ARFLAGS)

libsnmpconfig.so_SOURCES := $(libsnmpconfig.so_SOURCES)
libsnmpconfig.so_GENHEADERS := $(libsnmpconfig.so_GENHEADERS)
libsnmpconfig.so_CPPFLAGS := $(libsnmpconfig.so_CPPFLAGS)
libsnmpconfig.so_CFLAGS := $(libsnmpconfig.so_CFLAGS)
libsnmpconfig.so_CXXFLAGS := $(libsnmpconfig.so_CXXFLAGS)
libsnmpconfig.so_LDFLAGS := $(libsnmpconfig.so_LDFLAGS)
libsnmpconfig.so_ARFLAGS := $(libsnmpconfig.so_ARFLAGS)

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

libsnmpconfig.a_LINT_SOURCES ?= $(filter-out $(libsnmpconfig.a_NOLINT_SOURCES),$(libsnmpconfig.a_SOURCES))
OBJS_libsnmpconfig.a := $(call objs,$(libsnmpconfig.a_SOURCES),libsnmpconfig.a/)
DEPS_libsnmpconfig.a := $(call deps,$(libsnmpconfig.a_SOURCES),libsnmpconfig.a/)
GCNOS_NATIVE_libsnmpconfig.a = $(call gcnos,$(libsnmpconfig.a_SOURCES),libsnmpconfig.a/)
GCNOS_TRANSITIVE_libsnmpconfig.a = $(sort $(GCNOS_NATIVE_libsnmpconfig.a) )
GCNO_TARGETS_NATIVE_libsnmpconfig.a = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/libsnmpconfig.a/gcovr/gcda/%,$(GCNOS_NATIVE_libsnmpconfig.a))
GCNO_TARGETS_TRANSITIVE_libsnmpconfig.a = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/libsnmpconfig.a/gcovr/gcda/%,$(GCNOS_TRANSITIVE_libsnmpconfig.a))
.PRECIOUS: $(GCNO_TARGETS_TRANSITIVE_libsnmpconfig.a)
GCOV_TARGETS_NATIVE_libsnmpconfig.a = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_NATIVE_libsnmpconfig.a))
GCOV_TARGETS_TRANSITIVE_libsnmpconfig.a = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_TRANSITIVE_libsnmpconfig.a))
LOBS_libsnmpconfig.a := $(call lobs,$(libsnmpconfig.a_LINT_SOURCES),libsnmpconfig.a/)
TIDYS_libsnmpconfig.a := $(call tidys,$(libsnmpconfig.a_LINT_SOURCES),libsnmpconfig.a/)
$(TIDYS_libsnmpconfig.a): $(libsnmpconfig.a_PRECLANG_FILES)
PLINTS_libsnmpconfig.a := $(call plints,$(libsnmpconfig.a_LINT_SOURCES),libsnmpconfig.a/)
$(PLINTS_libsnmpconfig.a): $(libsnmpconfig.a_PRECLANG_FILES)

libsnmpconfig.a_OUT_OF_SOURCETREE = $(filter-out $(PROJECT_ROOT)/%,$(libsnmpconfig.a_SOURCES))
$(if $(strip $(libsnmpconfig.a_OUT_OF_SOURCETREE)),$(warning Source file lists need to start with $$(PROJECT_ROOT). libsnmpconfig.a_SOURCES -> $(libsnmpconfig.a_OUT_OF_SOURCETREE)),)

$(if $(filter CLANG_TIDY_BASE_CHECKS CLANG_TIDY_CHECKS,$(libsnmpconfig.a_CLANG_TIDY_RULESET)),$(error libsnmpconfig.a_CLANG_TIDY_RULESET has "$(libsnmpconfig.a_CLANG_TIDY_RULESET)" assigned to it. Instead, assign "$$($(libsnmpconfig.a_CLANG_TIDY_RULESET))"))

libsnmpconfig.a: $(BIN_DIR)/libsnmpconfig.a

$(DEPS_libsnmpconfig.a) $(OBJS_libsnmpconfig.a) $(LOBS_libsnmpconfig.a) $(TIDYS_libsnmpconfig.a) $(PLINTS_libsnmpconfig.a) ./out/gcc_11_3_aarch64-linux-gnu/Release/libsnmpconfig.a/lint_mac.h: BUILDTARGET_CPPFLAGS:=$(libsnmpconfig.a_CPPFLAGS)

$(DEPS_libsnmpconfig.a) $(OBJS_libsnmpconfig.a) $(TIDYS_libsnmpconfig.a) $(PLINTS_libsnmpconfig.a) ./out/gcc_11_3_aarch64-linux-gnu/Release/libsnmpconfig.a/lint_mac.h: BUILDTARGET_CXXFLAGS:=$(libsnmpconfig.a_CXXFLAGS)

$(DEPS_libsnmpconfig.a) $(OBJS_libsnmpconfig.a) $(TIDYS_libsnmpconfig.a) $(PLINTS_libsnmpconfig.a) ./out/gcc_11_3_aarch64-linux-gnu/Release/libsnmpconfig.a/lint_mac.h: BUILDTARGET_CFLAGS:=$(libsnmpconfig.a_CFLAGS)

lint-libsnmpconfig.a: flexelint-libsnmpconfig.a clang-tidy-libsnmpconfig.a

$(LOBS_libsnmpconfig.a): BUILDTARGET_LINTFLAGS:=$(libsnmpconfig.a_LINTFLAGS)

flexelint-libsnmpconfig.a: $($(libsnmpconfig.a_DISABLE_FLEXELINT)$(DISABLE_FLEXELINT)$(libsnmpconfig.a_DISABLE_LINT)$(DISABLE_LINT)LOBS_libsnmpconfig.a)

$(TIDYS_libsnmpconfig.a): BUILDTARGET_TIDYFLAGS:=$(libsnmpconfig.a_TIDYFLAGS) -isystem $(OUT_DIR)/libsnmpconfig.a -include lint_mac.h

$(TIDYS_libsnmpconfig.a): libsnmpconfig.a_CLANG_TIDY_RULESET ?= $(CLANG_TIDY_RULESET)

$(TIDYS_libsnmpconfig.a): CLANG_TIDY_CHECKS_OPTION:=$(subst $( ),$(,),$(strip $(libsnmpconfig.a_CLANG_TIDY_RULESET) $(libsnmpconfig.a_CLANG_TIDY_CHECKS)))

$(PLINTS_libsnmpconfig.a): BUILDTARGET_PLINTFLAGS:=$(libsnmpconfig.a_PLINTSFLAGS) -isystem $(OUT_DIR)/libsnmpconfig.a -include lint_mac.h

clang-tidy-libsnmpconfig.a: $($(libsnmpconfig.a_DISABLE_CLANG_TIDY)$(DISABLE_CLANG_TIDY)$(libsnmpconfig.a_DISABLE_LINT)$(DISABLE_LINT)TIDYS_libsnmpconfig.a)

clean-clang-tidy-libsnmpconfig.a:; $(SILENT)rm --force $(TIDYS_libsnmpconfig.a)

clangsa-libsnmpconfig.a: $(PLINTS_libsnmpconfig.a)

./out/gcc_11_3_aarch64-linux-gnu/Release/info/libsnmpconfig.a-info.txt: $(SCRIPT_DIR)/internal/clang/info_txt.template $(MK_FILES); $(SILENT)$(call clangbuild_subst_info_buildtarget,libsnmpconfig.a,$<) > $@

info-txt-libsnmpconfig.a: $(OUT_DIR)/info/libsnmpconfig.a-info.txt; $(SILENT)cat $<

$(OUT_DIR)/libsnmpconfig.a/%.o.d: $(PROJECT_ROOT)/% $(MK_FILES) $(MAKEDEP_SUPPORT_FILES) | $(libsnmpconfig.a_GENHEADERS); $(SILENT)$(call makedep,$@,$<,$(FLAGS))

$(OUT_DIR)/libsnmpconfig.a/%.o: $(PROJECT_ROOT)/% $(MK_FILES) $(CC_SUPPORT_FILES) | $(libsnmpconfig.a_GENHEADERS); $(SILENT)$(call cc,$@,$<,$(FLAGS))

$(OUT_DIR)/libsnmpconfig.a/%.lob: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) | $(libsnmpconfig.a_GENHEADERS); $(SILENT)$(call lint,$@,$<,$(FLAGS))

libsnmpconfig.a_PRECLANG_FILES=$(OUT_DIR)/libsnmpconfig.a/lint_mac.h

$(OUT_DIR)/libsnmpconfig.a/%.tidy: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(libsnmpconfig.a_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Release/libsnmpconfig.a/%.o.d $(wildcard .clang-tidy) | $(TIDY_SUPPORT_DIRS); $(SILENT)$(call clang-tidy,$@,$<,$(FLAGS))

$(OUT_DIR)/libsnmpconfig.a/%.plint: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(libsnmpconfig.a_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Release/libsnmpconfig.a/%.o.d; $(SILENT)$(call clang-sa,$@,$<,$(FLAGS))



$(OUT_DIR)/libsnmpconfig.a/gcovr/gcda/%.gcno: check-libsnmpconfig.a; $(SILENT)mkdir -p $(dir $@) && cp $(OUT_DIR)/$*.gcno $@

libsnmpconfig.so_LINT_SOURCES ?= $(filter-out $(libsnmpconfig.so_NOLINT_SOURCES),$(libsnmpconfig.so_SOURCES))
OBJS_libsnmpconfig.so := $(call objs,$(libsnmpconfig.so_SOURCES),libsnmpconfig.so/)
DEPS_libsnmpconfig.so := $(call deps,$(libsnmpconfig.so_SOURCES),libsnmpconfig.so/)
GCNOS_NATIVE_libsnmpconfig.so = $(call gcnos,$(libsnmpconfig.so_SOURCES),libsnmpconfig.so/)
GCNOS_TRANSITIVE_libsnmpconfig.so = $(sort $(GCNOS_NATIVE_libsnmpconfig.so) )
GCNO_TARGETS_NATIVE_libsnmpconfig.so = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/libsnmpconfig.so/gcovr/gcda/%,$(GCNOS_NATIVE_libsnmpconfig.so))
GCNO_TARGETS_TRANSITIVE_libsnmpconfig.so = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/libsnmpconfig.so/gcovr/gcda/%,$(GCNOS_TRANSITIVE_libsnmpconfig.so))
.PRECIOUS: $(GCNO_TARGETS_TRANSITIVE_libsnmpconfig.so)
GCOV_TARGETS_NATIVE_libsnmpconfig.so = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_NATIVE_libsnmpconfig.so))
GCOV_TARGETS_TRANSITIVE_libsnmpconfig.so = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_TRANSITIVE_libsnmpconfig.so))
LOBS_libsnmpconfig.so := $(call lobs,$(libsnmpconfig.so_LINT_SOURCES),libsnmpconfig.so/)
TIDYS_libsnmpconfig.so := $(call tidys,$(libsnmpconfig.so_LINT_SOURCES),libsnmpconfig.so/)
$(TIDYS_libsnmpconfig.so): $(libsnmpconfig.so_PRECLANG_FILES)
PLINTS_libsnmpconfig.so := $(call plints,$(libsnmpconfig.so_LINT_SOURCES),libsnmpconfig.so/)
$(PLINTS_libsnmpconfig.so): $(libsnmpconfig.so_PRECLANG_FILES)

libsnmpconfig.so_OUT_OF_SOURCETREE = $(filter-out $(PROJECT_ROOT)/%,$(libsnmpconfig.so_SOURCES))
$(if $(strip $(libsnmpconfig.so_OUT_OF_SOURCETREE)),$(warning Source file lists need to start with $$(PROJECT_ROOT). libsnmpconfig.so_SOURCES -> $(libsnmpconfig.so_OUT_OF_SOURCETREE)),)

$(if $(filter CLANG_TIDY_BASE_CHECKS CLANG_TIDY_CHECKS,$(libsnmpconfig.so_CLANG_TIDY_RULESET)),$(error libsnmpconfig.so_CLANG_TIDY_RULESET has "$(libsnmpconfig.so_CLANG_TIDY_RULESET)" assigned to it. Instead, assign "$$($(libsnmpconfig.so_CLANG_TIDY_RULESET))"))

libsnmpconfig.so: $(BIN_DIR)/libsnmpconfig.so

$(DEPS_libsnmpconfig.so) $(OBJS_libsnmpconfig.so) $(LOBS_libsnmpconfig.so) $(TIDYS_libsnmpconfig.so) $(PLINTS_libsnmpconfig.so) ./out/gcc_11_3_aarch64-linux-gnu/Release/libsnmpconfig.so/lint_mac.h: BUILDTARGET_CPPFLAGS:=$(libsnmpconfig.so_CPPFLAGS)

$(DEPS_libsnmpconfig.so) $(OBJS_libsnmpconfig.so) $(TIDYS_libsnmpconfig.so) $(PLINTS_libsnmpconfig.so) ./out/gcc_11_3_aarch64-linux-gnu/Release/libsnmpconfig.so/lint_mac.h: BUILDTARGET_CXXFLAGS:=$(libsnmpconfig.so_CXXFLAGS)

$(DEPS_libsnmpconfig.so) $(OBJS_libsnmpconfig.so) $(TIDYS_libsnmpconfig.so) $(PLINTS_libsnmpconfig.so) ./out/gcc_11_3_aarch64-linux-gnu/Release/libsnmpconfig.so/lint_mac.h: BUILDTARGET_CFLAGS:=$(libsnmpconfig.so_CFLAGS)

lint-libsnmpconfig.so: flexelint-libsnmpconfig.so clang-tidy-libsnmpconfig.so

$(LOBS_libsnmpconfig.so): BUILDTARGET_LINTFLAGS:=$(libsnmpconfig.so_LINTFLAGS)

flexelint-libsnmpconfig.so: $($(libsnmpconfig.so_DISABLE_FLEXELINT)$(DISABLE_FLEXELINT)$(libsnmpconfig.so_DISABLE_LINT)$(DISABLE_LINT)LOBS_libsnmpconfig.so)

$(TIDYS_libsnmpconfig.so): BUILDTARGET_TIDYFLAGS:=$(libsnmpconfig.so_TIDYFLAGS) -isystem $(OUT_DIR)/libsnmpconfig.so -include lint_mac.h

$(TIDYS_libsnmpconfig.so): libsnmpconfig.so_CLANG_TIDY_RULESET ?= $(CLANG_TIDY_RULESET)

$(TIDYS_libsnmpconfig.so): CLANG_TIDY_CHECKS_OPTION:=$(subst $( ),$(,),$(strip $(libsnmpconfig.so_CLANG_TIDY_RULESET) $(libsnmpconfig.so_CLANG_TIDY_CHECKS)))

$(PLINTS_libsnmpconfig.so): BUILDTARGET_PLINTFLAGS:=$(libsnmpconfig.so_PLINTSFLAGS) -isystem $(OUT_DIR)/libsnmpconfig.so -include lint_mac.h

clang-tidy-libsnmpconfig.so: $($(libsnmpconfig.so_DISABLE_CLANG_TIDY)$(DISABLE_CLANG_TIDY)$(libsnmpconfig.so_DISABLE_LINT)$(DISABLE_LINT)TIDYS_libsnmpconfig.so)

clean-clang-tidy-libsnmpconfig.so:; $(SILENT)rm --force $(TIDYS_libsnmpconfig.so)

clangsa-libsnmpconfig.so: $(PLINTS_libsnmpconfig.so)

./out/gcc_11_3_aarch64-linux-gnu/Release/info/libsnmpconfig.so-info.txt: $(SCRIPT_DIR)/internal/clang/info_txt.template $(MK_FILES); $(SILENT)$(call clangbuild_subst_info_buildtarget,libsnmpconfig.so,$<) > $@

info-txt-libsnmpconfig.so: $(OUT_DIR)/info/libsnmpconfig.so-info.txt; $(SILENT)cat $<

$(OUT_DIR)/libsnmpconfig.so/%.o.d: $(PROJECT_ROOT)/% $(MK_FILES) $(MAKEDEP_SUPPORT_FILES) | $(libsnmpconfig.so_GENHEADERS); $(SILENT)$(call makedep,$@,$<,$(FLAGS))

$(OUT_DIR)/libsnmpconfig.so/%.o: $(PROJECT_ROOT)/% $(MK_FILES) $(CC_SUPPORT_FILES) | $(libsnmpconfig.so_GENHEADERS); $(SILENT)$(call cc,$@,$<,$(FLAGS))

$(OUT_DIR)/libsnmpconfig.so/%.lob: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) | $(libsnmpconfig.so_GENHEADERS); $(SILENT)$(call lint,$@,$<,$(FLAGS))

libsnmpconfig.so_PRECLANG_FILES=$(OUT_DIR)/libsnmpconfig.so/lint_mac.h

$(OUT_DIR)/libsnmpconfig.so/%.tidy: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(libsnmpconfig.so_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Release/libsnmpconfig.so/%.o.d $(wildcard .clang-tidy) | $(TIDY_SUPPORT_DIRS); $(SILENT)$(call clang-tidy,$@,$<,$(FLAGS))

$(OUT_DIR)/libsnmpconfig.so/%.plint: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(libsnmpconfig.so_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Release/libsnmpconfig.so/%.o.d; $(SILENT)$(call clang-sa,$@,$<,$(FLAGS))



$(OUT_DIR)/libsnmpconfig.so/gcovr/gcda/%.gcno: check-libsnmpconfig.so; $(SILENT)mkdir -p $(dir $@) && cp $(OUT_DIR)/$*.gcno $@

alltests.elf_LINT_SOURCES ?= $(filter-out $(alltests.elf_NOLINT_SOURCES),$(alltests.elf_SOURCES))
OBJS_alltests.elf := $(call objs,$(alltests.elf_SOURCES),alltests.elf/)
DEPS_alltests.elf := $(call deps,$(alltests.elf_SOURCES),alltests.elf/)
GCNOS_NATIVE_alltests.elf = $(call gcnos,$(alltests.elf_SOURCES),alltests.elf/)
GCNOS_TRANSITIVE_alltests.elf = $(sort $(GCNOS_NATIVE_alltests.elf) $(GCNOS_TRANSITIVE_libsnmpconfig.a))
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

$(DESTDIR)/usr/%/libsnmpconfig.so.1.0.0: $(OUT_DIR)/libsnmpconfig.so.dbg | $(DESTDIR)/usr/%; $(SILENT)$(call echo_if_silent,installing libsnmpconfig.so to $@) && ln -Tsf libsnmpconfig.so.1.0.0 $(DESTDIR)/usr/$*/libsnmpconfig.so.1 && ln -Tsf libsnmpconfig.so.1.0.0 $(DESTDIR)/usr/$*/libsnmpconfig.so && cp $< $@

$(OUT_DIR)/libsnmpconfig.so.dbg: $(OBJS_libsnmpconfig.so) $(MK_FILES) $(libsnmpconfig.so_PREREQUISITES) $(LD_SUPPORT_FILES); $(SILENT)$(call ld$(ARTIFACT),libsnmpconfig.so,$@,$(OBJS_libsnmpconfig.so),$(LDFLAGS) $(libsnmpconfig.so_LDFLAGS))

$(OUT_DIR)/alltests.elf.dbg: $(OBJS_alltests.elf) $(MK_FILES) $(alltests.elf_PREREQUISITES) $(LD_SUPPORT_FILES); $(SILENT)$(call ld$(ARTIFACT),alltests.elf,$@,$(OBJS_alltests.elf),$(LDFLAGS) $(alltests.elf_LDFLAGS))

$(BIN_DIR)/libsnmpconfig.a: $(OBJS_libsnmpconfig.a) $(MK_FILES) $(libsnmpconfig.a_PREREQUISITES) $(AR_SUPPORT_FILES); $(SILENT) rm --force $@; $(call ar,libsnmpconfig.a,$@,$(OBJS_libsnmpconfig.a),$(ARFLAGS) $(libsnmpconfig.a_ARFLAGS))

check-alltests.elf: $(BIN_DIR)/alltests.elf cleanup_coverage-alltests.elf ; $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && (cd $(dir $<) && $(call clangbuild_check,alltests.elf,./$(notdir $<)))
$(GCNOS_NATIVE_alltests.elf): check-alltests.elf
cleanup_coverage-alltests.elf: $(BIN_DIR)/alltests.elf; $(SILENT)rm -rf $(OUT_DIR)/alltests.elf/gcovr/gcda 
Tcoverage-alltests.elf Tgcovr-alltests.elf: $(OUT_DIR)/alltests.elf/gcovr/coverage.html
$(OUT_DIR)/alltests.elf/gcovr/gcda/.gcovs: check-alltests.elf $(GCNO_TARGETS_TRANSITIVE_alltests.elf); $(SILENT) find $(OUT_DIR)/alltests.elf/gcovr/gcda \( -name gmock_main.dir -or -name gmock.dir \) -type d -exec rm -rf {} + ; $(foreach folder,$(shell ls -d $(OUT_DIR)/alltests.elf/gcovr/gcda/*/), $(call clangbuildtarget_gcov_folder,$(folder)); ) touch $@
$(OUT_DIR)/alltests.elf/gcovr/coverage.xml $(OUT_DIR)/alltests.elf/gcovr/coverage.html: $(OUT_DIR)/alltests.elf/gcovr/gcda/.gcovs ; $(SILENT) gcovr -r . -j $(NPROC) --xml-pretty --xml $(OUT_DIR)/alltests.elf/gcovr/coverage.xml --html --html-details $(OUT_DIR)/alltests.elf/gcovr/coverage.html --html-title alltests.elf --exclude-throw-branches  --use-gcov-files --keep $(addprefix --filter ',$(addsuffix ',$(alltests.elf_GCOVR_FILTER:./%=%) $(GCOVR_FILTER:./%=%))) $(addprefix --exclude ',$(addsuffix ',$(alltests.elf_GCOVR_EXCLUDE:./%=%) $(GCOVR_EXCLUDE:./%=%))) $(addprefix --exclude-directories '$(OUT_DIR:./%=%)/alltests.elf/gcovr/gcda/,$(addsuffix ',$(alltests.elf_GCOVR_EXCLUDE_DIRECTORIES) $(GCOVR_EXCLUDE_DIRECTORIES))) $(alltests.elf_GCOVR_ADDITIONAL_PARAMS) --print-summary $(addprefix $(OUT_DIR)/alltests.elf/gcovr/gcda/,$(or $(strip $(alltests.elf_GCOVR_SEARCH_PATH) $(GCOVR_SEARCH_PATH)),.)) && $(call clangbuildtarget_gcov_print_coverage_written,$(OUT_DIR)/alltests.elf/gcovr/coverage.xml) $(call clangbuildtarget_gcov_print_coverage_written,$(OUT_DIR)/alltests.elf/gcovr/coverage.html)
$(OUT_DIR)/alltests.elf/gcovr/coverage.json: $(OUT_DIR)/alltests.elf/gcovr/gcda/.gcovs check-alltests.elf ; $(SILENT) gcovr -r . -j $(NPROC) --json-pretty --json --output $(OUT_DIR)/alltests.elf/gcovr/coverage.json --exclude-throw-branches  --use-gcov-files --keep $(addprefix --filter ',$(addsuffix ',$(GCOVR_FILTER:./%=%))) $(addprefix --exclude ',$(addsuffix ',$(GCOVR_EXCLUDE:./%=%))) $(addprefix --exclude-directories '$(OUT_DIR:./%=%)/alltests.elf/gcovr/gcda/,$(addsuffix ',$(GCOVR_EXCLUDE_DIRECTORIES))) --print-summary $(addprefix $(OUT_DIR)/alltests.elf/gcovr/gcda/,$(or $(strip $(GCOVR_SEARCH_PATH)),.)) && $(call clangbuildtarget_gcov_print_coverage_written,$(OUT_DIR)/alltests.elf/gcovr/coverage.json)
$(if $(DISABLE_GCOV), coverage-alltests.elf gcovr-alltests.elf: ; @echo "make: *** [coverage-alltests.elf] DISABLE_GCOV needs to be empty!" >&2; false )

memcheck-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,alltests.elf,./$(notdir $<),MEMCHECK)
helgrind-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,alltests.elf,./$(notdir $<),HELGRIND)
callgrind-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,alltests.elf,./$(notdir $<),CALLGRIND)
massif-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,alltests.elf,./$(notdir $<),MASSIF)
nulgrind-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,alltests.elf,./$(notdir $<),NULGRIND)
