CPPFLAGS := $(CPPFLAGS)
CFLAGS := $(CFLAGS)
CXXFLAGS := $(CXXFLAGS)
LDFLAGS := $(LDFLAGS)
ARFLAGS := $(ARFLAGS)

libconfigstp.a_SOURCES := $(libconfigstp.a_SOURCES)
libconfigstp.a_GENHEADERS := $(libconfigstp.a_GENHEADERS)
libconfigstp.a_CPPFLAGS := $(libconfigstp.a_CPPFLAGS)
libconfigstp.a_CFLAGS := $(libconfigstp.a_CFLAGS)
libconfigstp.a_CXXFLAGS := $(libconfigstp.a_CXXFLAGS)
libconfigstp.a_LDFLAGS := $(libconfigstp.a_LDFLAGS)
libconfigstp.a_ARFLAGS := $(libconfigstp.a_ARFLAGS)

libconfigstp.so_SOURCES := $(libconfigstp.so_SOURCES)
libconfigstp.so_GENHEADERS := $(libconfigstp.so_GENHEADERS)
libconfigstp.so_CPPFLAGS := $(libconfigstp.so_CPPFLAGS)
libconfigstp.so_CFLAGS := $(libconfigstp.so_CFLAGS)
libconfigstp.so_CXXFLAGS := $(libconfigstp.so_CXXFLAGS)
libconfigstp.so_LDFLAGS := $(libconfigstp.so_LDFLAGS)
libconfigstp.so_ARFLAGS := $(libconfigstp.so_ARFLAGS)

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

libconfigstp.a_LINT_SOURCES ?= $(filter-out $(libconfigstp.a_NOLINT_SOURCES),$(libconfigstp.a_SOURCES))
OBJS_libconfigstp.a := $(call objs,$(libconfigstp.a_SOURCES),libconfigstp.a/)
DEPS_libconfigstp.a := $(call deps,$(libconfigstp.a_SOURCES),libconfigstp.a/)
GCNOS_NATIVE_libconfigstp.a = $(call gcnos,$(libconfigstp.a_SOURCES),libconfigstp.a/)
GCNOS_TRANSITIVE_libconfigstp.a = $(sort $(GCNOS_NATIVE_libconfigstp.a) )
GCNO_TARGETS_NATIVE_libconfigstp.a = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/libconfigstp.a/gcovr/gcda/%,$(GCNOS_NATIVE_libconfigstp.a))
GCNO_TARGETS_TRANSITIVE_libconfigstp.a = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/libconfigstp.a/gcovr/gcda/%,$(GCNOS_TRANSITIVE_libconfigstp.a))
.PRECIOUS: $(GCNO_TARGETS_TRANSITIVE_libconfigstp.a)
GCOV_TARGETS_NATIVE_libconfigstp.a = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_NATIVE_libconfigstp.a))
GCOV_TARGETS_TRANSITIVE_libconfigstp.a = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_TRANSITIVE_libconfigstp.a))
LOBS_libconfigstp.a := $(call lobs,$(libconfigstp.a_LINT_SOURCES),libconfigstp.a/)
TIDYS_libconfigstp.a := $(call tidys,$(libconfigstp.a_LINT_SOURCES),libconfigstp.a/)
$(TIDYS_libconfigstp.a): $(libconfigstp.a_PRECLANG_FILES)
PLINTS_libconfigstp.a := $(call plints,$(libconfigstp.a_LINT_SOURCES),libconfigstp.a/)
$(PLINTS_libconfigstp.a): $(libconfigstp.a_PRECLANG_FILES)

libconfigstp.a_OUT_OF_SOURCETREE = $(filter-out $(PROJECT_ROOT)/%,$(libconfigstp.a_SOURCES))
$(if $(strip $(libconfigstp.a_OUT_OF_SOURCETREE)),$(warning Source file lists need to start with $$(PROJECT_ROOT). libconfigstp.a_SOURCES -> $(libconfigstp.a_OUT_OF_SOURCETREE)),)

$(if $(filter CLANG_TIDY_BASE_CHECKS CLANG_TIDY_CHECKS,$(libconfigstp.a_CLANG_TIDY_RULESET)),$(error libconfigstp.a_CLANG_TIDY_RULESET has "$(libconfigstp.a_CLANG_TIDY_RULESET)" assigned to it. Instead, assign "$$($(libconfigstp.a_CLANG_TIDY_RULESET))"))

libconfigstp.a: $(BIN_DIR)/libconfigstp.a

$(DEPS_libconfigstp.a) $(OBJS_libconfigstp.a) $(LOBS_libconfigstp.a) $(TIDYS_libconfigstp.a) $(PLINTS_libconfigstp.a) ./out/gcc_11_3_aarch64-linux-gnu/Release/libconfigstp.a/lint_mac.h: BUILDTARGET_CPPFLAGS:=$(libconfigstp.a_CPPFLAGS)

$(DEPS_libconfigstp.a) $(OBJS_libconfigstp.a) $(TIDYS_libconfigstp.a) $(PLINTS_libconfigstp.a) ./out/gcc_11_3_aarch64-linux-gnu/Release/libconfigstp.a/lint_mac.h: BUILDTARGET_CXXFLAGS:=$(libconfigstp.a_CXXFLAGS)

$(DEPS_libconfigstp.a) $(OBJS_libconfigstp.a) $(TIDYS_libconfigstp.a) $(PLINTS_libconfigstp.a) ./out/gcc_11_3_aarch64-linux-gnu/Release/libconfigstp.a/lint_mac.h: BUILDTARGET_CFLAGS:=$(libconfigstp.a_CFLAGS)

lint-libconfigstp.a: flexelint-libconfigstp.a clang-tidy-libconfigstp.a

$(LOBS_libconfigstp.a): BUILDTARGET_LINTFLAGS:=$(libconfigstp.a_LINTFLAGS)

flexelint-libconfigstp.a: $($(libconfigstp.a_DISABLE_FLEXELINT)$(DISABLE_FLEXELINT)$(libconfigstp.a_DISABLE_LINT)$(DISABLE_LINT)LOBS_libconfigstp.a)

$(TIDYS_libconfigstp.a): BUILDTARGET_TIDYFLAGS:=$(libconfigstp.a_TIDYFLAGS) -isystem $(OUT_DIR)/libconfigstp.a -include lint_mac.h

$(TIDYS_libconfigstp.a): libconfigstp.a_CLANG_TIDY_RULESET ?= $(CLANG_TIDY_RULESET)

$(TIDYS_libconfigstp.a): CLANG_TIDY_CHECKS_OPTION:=$(subst $( ),$(,),$(strip $(libconfigstp.a_CLANG_TIDY_RULESET) $(libconfigstp.a_CLANG_TIDY_CHECKS)))

$(PLINTS_libconfigstp.a): BUILDTARGET_PLINTFLAGS:=$(libconfigstp.a_PLINTSFLAGS) -isystem $(OUT_DIR)/libconfigstp.a -include lint_mac.h

clang-tidy-libconfigstp.a: $($(libconfigstp.a_DISABLE_CLANG_TIDY)$(DISABLE_CLANG_TIDY)$(libconfigstp.a_DISABLE_LINT)$(DISABLE_LINT)TIDYS_libconfigstp.a)

clean-clang-tidy-libconfigstp.a:; $(SILENT)rm --force $(TIDYS_libconfigstp.a)

clangsa-libconfigstp.a: $(PLINTS_libconfigstp.a)

./out/gcc_11_3_aarch64-linux-gnu/Release/info/libconfigstp.a-info.txt: $(SCRIPT_DIR)/internal/clang/info_txt.template $(MK_FILES); $(SILENT)$(call clangbuild_subst_info_buildtarget,libconfigstp.a,$<) > $@

info-txt-libconfigstp.a: $(OUT_DIR)/info/libconfigstp.a-info.txt; $(SILENT)cat $<

$(OUT_DIR)/libconfigstp.a/%.o.d: $(PROJECT_ROOT)/% $(MK_FILES) $(MAKEDEP_SUPPORT_FILES) | $(libconfigstp.a_GENHEADERS); $(SILENT)$(call makedep,$@,$<,$(FLAGS))

$(OUT_DIR)/libconfigstp.a/%.o: $(PROJECT_ROOT)/% $(MK_FILES) $(CC_SUPPORT_FILES) | $(libconfigstp.a_GENHEADERS); $(SILENT)$(call cc,$@,$<,$(FLAGS))

$(OUT_DIR)/libconfigstp.a/%.lob: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) | $(libconfigstp.a_GENHEADERS); $(SILENT)$(call lint,$@,$<,$(FLAGS))

libconfigstp.a_PRECLANG_FILES=$(OUT_DIR)/libconfigstp.a/lint_mac.h

$(OUT_DIR)/libconfigstp.a/%.tidy: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(libconfigstp.a_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Release/libconfigstp.a/%.o.d $(wildcard .clang-tidy) | $(TIDY_SUPPORT_DIRS); $(SILENT)$(call clang-tidy,$@,$<,$(FLAGS))

$(OUT_DIR)/libconfigstp.a/%.plint: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(libconfigstp.a_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Release/libconfigstp.a/%.o.d; $(SILENT)$(call clang-sa,$@,$<,$(FLAGS))



$(OUT_DIR)/libconfigstp.a/gcovr/gcda/%.gcno: check-libconfigstp.a; $(SILENT)mkdir -p $(dir $@) && cp $(OUT_DIR)/$*.gcno $@

libconfigstp.so_LINT_SOURCES ?= $(filter-out $(libconfigstp.so_NOLINT_SOURCES),$(libconfigstp.so_SOURCES))
OBJS_libconfigstp.so := $(call objs,$(libconfigstp.so_SOURCES),libconfigstp.so/)
DEPS_libconfigstp.so := $(call deps,$(libconfigstp.so_SOURCES),libconfigstp.so/)
GCNOS_NATIVE_libconfigstp.so = $(call gcnos,$(libconfigstp.so_SOURCES),libconfigstp.so/)
GCNOS_TRANSITIVE_libconfigstp.so = $(sort $(GCNOS_NATIVE_libconfigstp.so) )
GCNO_TARGETS_NATIVE_libconfigstp.so = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/libconfigstp.so/gcovr/gcda/%,$(GCNOS_NATIVE_libconfigstp.so))
GCNO_TARGETS_TRANSITIVE_libconfigstp.so = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/libconfigstp.so/gcovr/gcda/%,$(GCNOS_TRANSITIVE_libconfigstp.so))
.PRECIOUS: $(GCNO_TARGETS_TRANSITIVE_libconfigstp.so)
GCOV_TARGETS_NATIVE_libconfigstp.so = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_NATIVE_libconfigstp.so))
GCOV_TARGETS_TRANSITIVE_libconfigstp.so = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_TRANSITIVE_libconfigstp.so))
LOBS_libconfigstp.so := $(call lobs,$(libconfigstp.so_LINT_SOURCES),libconfigstp.so/)
TIDYS_libconfigstp.so := $(call tidys,$(libconfigstp.so_LINT_SOURCES),libconfigstp.so/)
$(TIDYS_libconfigstp.so): $(libconfigstp.so_PRECLANG_FILES)
PLINTS_libconfigstp.so := $(call plints,$(libconfigstp.so_LINT_SOURCES),libconfigstp.so/)
$(PLINTS_libconfigstp.so): $(libconfigstp.so_PRECLANG_FILES)

libconfigstp.so_OUT_OF_SOURCETREE = $(filter-out $(PROJECT_ROOT)/%,$(libconfigstp.so_SOURCES))
$(if $(strip $(libconfigstp.so_OUT_OF_SOURCETREE)),$(warning Source file lists need to start with $$(PROJECT_ROOT). libconfigstp.so_SOURCES -> $(libconfigstp.so_OUT_OF_SOURCETREE)),)

$(if $(filter CLANG_TIDY_BASE_CHECKS CLANG_TIDY_CHECKS,$(libconfigstp.so_CLANG_TIDY_RULESET)),$(error libconfigstp.so_CLANG_TIDY_RULESET has "$(libconfigstp.so_CLANG_TIDY_RULESET)" assigned to it. Instead, assign "$$($(libconfigstp.so_CLANG_TIDY_RULESET))"))

libconfigstp.so: $(BIN_DIR)/libconfigstp.so

$(DEPS_libconfigstp.so) $(OBJS_libconfigstp.so) $(LOBS_libconfigstp.so) $(TIDYS_libconfigstp.so) $(PLINTS_libconfigstp.so) ./out/gcc_11_3_aarch64-linux-gnu/Release/libconfigstp.so/lint_mac.h: BUILDTARGET_CPPFLAGS:=$(libconfigstp.so_CPPFLAGS)

$(DEPS_libconfigstp.so) $(OBJS_libconfigstp.so) $(TIDYS_libconfigstp.so) $(PLINTS_libconfigstp.so) ./out/gcc_11_3_aarch64-linux-gnu/Release/libconfigstp.so/lint_mac.h: BUILDTARGET_CXXFLAGS:=$(libconfigstp.so_CXXFLAGS)

$(DEPS_libconfigstp.so) $(OBJS_libconfigstp.so) $(TIDYS_libconfigstp.so) $(PLINTS_libconfigstp.so) ./out/gcc_11_3_aarch64-linux-gnu/Release/libconfigstp.so/lint_mac.h: BUILDTARGET_CFLAGS:=$(libconfigstp.so_CFLAGS)

lint-libconfigstp.so: flexelint-libconfigstp.so clang-tidy-libconfigstp.so

$(LOBS_libconfigstp.so): BUILDTARGET_LINTFLAGS:=$(libconfigstp.so_LINTFLAGS)

flexelint-libconfigstp.so: $($(libconfigstp.so_DISABLE_FLEXELINT)$(DISABLE_FLEXELINT)$(libconfigstp.so_DISABLE_LINT)$(DISABLE_LINT)LOBS_libconfigstp.so)

$(TIDYS_libconfigstp.so): BUILDTARGET_TIDYFLAGS:=$(libconfigstp.so_TIDYFLAGS) -isystem $(OUT_DIR)/libconfigstp.so -include lint_mac.h

$(TIDYS_libconfigstp.so): libconfigstp.so_CLANG_TIDY_RULESET ?= $(CLANG_TIDY_RULESET)

$(TIDYS_libconfigstp.so): CLANG_TIDY_CHECKS_OPTION:=$(subst $( ),$(,),$(strip $(libconfigstp.so_CLANG_TIDY_RULESET) $(libconfigstp.so_CLANG_TIDY_CHECKS)))

$(PLINTS_libconfigstp.so): BUILDTARGET_PLINTFLAGS:=$(libconfigstp.so_PLINTSFLAGS) -isystem $(OUT_DIR)/libconfigstp.so -include lint_mac.h

clang-tidy-libconfigstp.so: $($(libconfigstp.so_DISABLE_CLANG_TIDY)$(DISABLE_CLANG_TIDY)$(libconfigstp.so_DISABLE_LINT)$(DISABLE_LINT)TIDYS_libconfigstp.so)

clean-clang-tidy-libconfigstp.so:; $(SILENT)rm --force $(TIDYS_libconfigstp.so)

clangsa-libconfigstp.so: $(PLINTS_libconfigstp.so)

./out/gcc_11_3_aarch64-linux-gnu/Release/info/libconfigstp.so-info.txt: $(SCRIPT_DIR)/internal/clang/info_txt.template $(MK_FILES); $(SILENT)$(call clangbuild_subst_info_buildtarget,libconfigstp.so,$<) > $@

info-txt-libconfigstp.so: $(OUT_DIR)/info/libconfigstp.so-info.txt; $(SILENT)cat $<

$(OUT_DIR)/libconfigstp.so/%.o.d: $(PROJECT_ROOT)/% $(MK_FILES) $(MAKEDEP_SUPPORT_FILES) | $(libconfigstp.so_GENHEADERS); $(SILENT)$(call makedep,$@,$<,$(FLAGS))

$(OUT_DIR)/libconfigstp.so/%.o: $(PROJECT_ROOT)/% $(MK_FILES) $(CC_SUPPORT_FILES) | $(libconfigstp.so_GENHEADERS); $(SILENT)$(call cc,$@,$<,$(FLAGS))

$(OUT_DIR)/libconfigstp.so/%.lob: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) | $(libconfigstp.so_GENHEADERS); $(SILENT)$(call lint,$@,$<,$(FLAGS))

libconfigstp.so_PRECLANG_FILES=$(OUT_DIR)/libconfigstp.so/lint_mac.h

$(OUT_DIR)/libconfigstp.so/%.tidy: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(libconfigstp.so_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Release/libconfigstp.so/%.o.d $(wildcard .clang-tidy) | $(TIDY_SUPPORT_DIRS); $(SILENT)$(call clang-tidy,$@,$<,$(FLAGS))

$(OUT_DIR)/libconfigstp.so/%.plint: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(libconfigstp.so_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Release/libconfigstp.so/%.o.d; $(SILENT)$(call clang-sa,$@,$<,$(FLAGS))



$(OUT_DIR)/libconfigstp.so/gcovr/gcda/%.gcno: check-libconfigstp.so; $(SILENT)mkdir -p $(dir $@) && cp $(OUT_DIR)/$*.gcno $@

alltests.elf_LINT_SOURCES ?= $(filter-out $(alltests.elf_NOLINT_SOURCES),$(alltests.elf_SOURCES))
OBJS_alltests.elf := $(call objs,$(alltests.elf_SOURCES),alltests.elf/)
DEPS_alltests.elf := $(call deps,$(alltests.elf_SOURCES),alltests.elf/)
GCNOS_NATIVE_alltests.elf = $(call gcnos,$(alltests.elf_SOURCES),alltests.elf/)
GCNOS_TRANSITIVE_alltests.elf = $(sort $(GCNOS_NATIVE_alltests.elf) $(GCNOS_TRANSITIVE_libconfigstp.a))
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

$(DESTDIR)/usr/%/libconfigstp.so.1.0.0: $(OUT_DIR)/libconfigstp.so.dbg | $(DESTDIR)/usr/%; $(SILENT)$(call echo_if_silent,installing libconfigstp.so to $@) && ln -Tsf libconfigstp.so.1.0.0 $(DESTDIR)/usr/$*/libconfigstp.so.1 && ln -Tsf libconfigstp.so.1.0.0 $(DESTDIR)/usr/$*/libconfigstp.so && cp $< $@

$(OUT_DIR)/libconfigstp.so.dbg: $(OBJS_libconfigstp.so) $(MK_FILES) $(libconfigstp.so_PREREQUISITES) $(LD_SUPPORT_FILES); $(SILENT)$(call ld$(ARTIFACT),libconfigstp.so,$@,$(OBJS_libconfigstp.so),$(LDFLAGS) $(libconfigstp.so_LDFLAGS))

$(OUT_DIR)/alltests.elf.dbg: $(OBJS_alltests.elf) $(MK_FILES) $(alltests.elf_PREREQUISITES) $(LD_SUPPORT_FILES); $(SILENT)$(call ld$(ARTIFACT),alltests.elf,$@,$(OBJS_alltests.elf),$(LDFLAGS) $(alltests.elf_LDFLAGS))

$(BIN_DIR)/libconfigstp.a: $(OBJS_libconfigstp.a) $(MK_FILES) $(libconfigstp.a_PREREQUISITES) $(AR_SUPPORT_FILES); $(SILENT) rm --force $@; $(call ar,libconfigstp.a,$@,$(OBJS_libconfigstp.a),$(ARFLAGS) $(libconfigstp.a_ARFLAGS))

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
