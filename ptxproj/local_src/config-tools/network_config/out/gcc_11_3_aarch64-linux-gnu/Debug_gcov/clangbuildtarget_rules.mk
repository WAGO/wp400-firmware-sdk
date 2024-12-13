CPPFLAGS := $(CPPFLAGS)
CFLAGS := $(CFLAGS)
CXXFLAGS := $(CXXFLAGS)
LDFLAGS := $(LDFLAGS)
ARFLAGS := $(ARFLAGS)

network_config.elf_SOURCES := $(network_config.elf_SOURCES)
network_config.elf_GENHEADERS := $(network_config.elf_GENHEADERS)
network_config.elf_CPPFLAGS := $(network_config.elf_CPPFLAGS)
network_config.elf_CFLAGS := $(network_config.elf_CFLAGS)
network_config.elf_CXXFLAGS := $(network_config.elf_CXXFLAGS)
network_config.elf_LDFLAGS := $(network_config.elf_LDFLAGS)
network_config.elf_ARFLAGS := $(network_config.elf_ARFLAGS)

libnetwork_config.a_SOURCES := $(libnetwork_config.a_SOURCES)
libnetwork_config.a_GENHEADERS := $(libnetwork_config.a_GENHEADERS)
libnetwork_config.a_CPPFLAGS := $(libnetwork_config.a_CPPFLAGS)
libnetwork_config.a_CFLAGS := $(libnetwork_config.a_CFLAGS)
libnetwork_config.a_CXXFLAGS := $(libnetwork_config.a_CXXFLAGS)
libnetwork_config.a_LDFLAGS := $(libnetwork_config.a_LDFLAGS)
libnetwork_config.a_ARFLAGS := $(libnetwork_config.a_ARFLAGS)

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

network_config.elf_LINT_SOURCES ?= $(filter-out $(network_config.elf_NOLINT_SOURCES),$(network_config.elf_SOURCES))
OBJS_network_config.elf := $(call objs,$(network_config.elf_SOURCES),network_config.elf/)
DEPS_network_config.elf := $(call deps,$(network_config.elf_SOURCES),network_config.elf/)
GCNOS_NATIVE_network_config.elf = $(call gcnos,$(network_config.elf_SOURCES),network_config.elf/)
GCNOS_TRANSITIVE_network_config.elf = $(sort $(GCNOS_NATIVE_network_config.elf) $(GCNOS_TRANSITIVE_libnetwork_config.a))
GCNO_TARGETS_NATIVE_network_config.elf = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/network_config.elf/gcovr/gcda/%,$(GCNOS_NATIVE_network_config.elf))
GCNO_TARGETS_TRANSITIVE_network_config.elf = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/network_config.elf/gcovr/gcda/%,$(GCNOS_TRANSITIVE_network_config.elf))
.PRECIOUS: $(GCNO_TARGETS_TRANSITIVE_network_config.elf)
GCOV_TARGETS_NATIVE_network_config.elf = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_NATIVE_network_config.elf))
GCOV_TARGETS_TRANSITIVE_network_config.elf = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_TRANSITIVE_network_config.elf))
LOBS_network_config.elf := $(call lobs,$(network_config.elf_LINT_SOURCES),network_config.elf/)
TIDYS_network_config.elf := $(call tidys,$(network_config.elf_LINT_SOURCES),network_config.elf/)
$(TIDYS_network_config.elf): $(network_config.elf_PRECLANG_FILES)
PLINTS_network_config.elf := $(call plints,$(network_config.elf_LINT_SOURCES),network_config.elf/)
$(PLINTS_network_config.elf): $(network_config.elf_PRECLANG_FILES)

network_config.elf_OUT_OF_SOURCETREE = $(filter-out $(PROJECT_ROOT)/%,$(network_config.elf_SOURCES))
$(if $(strip $(network_config.elf_OUT_OF_SOURCETREE)),$(warning Source file lists need to start with $$(PROJECT_ROOT). network_config.elf_SOURCES -> $(network_config.elf_OUT_OF_SOURCETREE)),)

$(if $(filter CLANG_TIDY_BASE_CHECKS CLANG_TIDY_CHECKS,$(network_config.elf_CLANG_TIDY_RULESET)),$(error network_config.elf_CLANG_TIDY_RULESET has "$(network_config.elf_CLANG_TIDY_RULESET)" assigned to it. Instead, assign "$$($(network_config.elf_CLANG_TIDY_RULESET))"))

network_config.elf: $(BIN_DIR)/network_config.elf

$(DEPS_network_config.elf) $(OBJS_network_config.elf) $(LOBS_network_config.elf) $(TIDYS_network_config.elf) $(PLINTS_network_config.elf) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/network_config.elf/lint_mac.h: BUILDTARGET_CPPFLAGS:=$(network_config.elf_CPPFLAGS)

$(DEPS_network_config.elf) $(OBJS_network_config.elf) $(TIDYS_network_config.elf) $(PLINTS_network_config.elf) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/network_config.elf/lint_mac.h: BUILDTARGET_CXXFLAGS:=$(network_config.elf_CXXFLAGS)

$(DEPS_network_config.elf) $(OBJS_network_config.elf) $(TIDYS_network_config.elf) $(PLINTS_network_config.elf) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/network_config.elf/lint_mac.h: BUILDTARGET_CFLAGS:=$(network_config.elf_CFLAGS)

lint-network_config.elf: flexelint-network_config.elf clang-tidy-network_config.elf

$(LOBS_network_config.elf): BUILDTARGET_LINTFLAGS:=$(network_config.elf_LINTFLAGS)

flexelint-network_config.elf: $($(network_config.elf_DISABLE_FLEXELINT)$(DISABLE_FLEXELINT)$(network_config.elf_DISABLE_LINT)$(DISABLE_LINT)LOBS_network_config.elf)

$(TIDYS_network_config.elf): BUILDTARGET_TIDYFLAGS:=$(network_config.elf_TIDYFLAGS) -isystem $(OUT_DIR)/network_config.elf -include lint_mac.h

$(TIDYS_network_config.elf): network_config.elf_CLANG_TIDY_RULESET ?= $(CLANG_TIDY_RULESET)

$(TIDYS_network_config.elf): CLANG_TIDY_CHECKS_OPTION:=$(subst $( ),$(,),$(strip $(network_config.elf_CLANG_TIDY_RULESET) $(network_config.elf_CLANG_TIDY_CHECKS)))

$(PLINTS_network_config.elf): BUILDTARGET_PLINTFLAGS:=$(network_config.elf_PLINTSFLAGS) -isystem $(OUT_DIR)/network_config.elf -include lint_mac.h

clang-tidy-network_config.elf: $($(network_config.elf_DISABLE_CLANG_TIDY)$(DISABLE_CLANG_TIDY)$(network_config.elf_DISABLE_LINT)$(DISABLE_LINT)TIDYS_network_config.elf)

clean-clang-tidy-network_config.elf:; $(SILENT)rm --force $(TIDYS_network_config.elf)

clangsa-network_config.elf: $(PLINTS_network_config.elf)

./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/info/network_config.elf-info.txt: $(SCRIPT_DIR)/internal/clang/info_txt.template $(MK_FILES); $(SILENT)$(call clangbuild_subst_info_buildtarget,network_config.elf,$<) > $@

info-txt-network_config.elf: $(OUT_DIR)/info/network_config.elf-info.txt; $(SILENT)cat $<

$(OUT_DIR)/network_config.elf/%.o.d: $(PROJECT_ROOT)/% $(MK_FILES) $(MAKEDEP_SUPPORT_FILES) | $(network_config.elf_GENHEADERS); $(SILENT)$(call makedep,$@,$<,$(FLAGS))

$(OUT_DIR)/network_config.elf/%.o: $(PROJECT_ROOT)/% $(MK_FILES) $(CC_SUPPORT_FILES) | $(network_config.elf_GENHEADERS); $(SILENT)$(call cc,$@,$<,$(FLAGS))

$(OUT_DIR)/network_config.elf/%.lob: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) | $(network_config.elf_GENHEADERS); $(SILENT)$(call lint,$@,$<,$(FLAGS))

network_config.elf_PRECLANG_FILES=$(OUT_DIR)/network_config.elf/lint_mac.h

$(OUT_DIR)/network_config.elf/%.tidy: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(network_config.elf_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/network_config.elf/%.o.d $(wildcard .clang-tidy) | $(TIDY_SUPPORT_DIRS); $(SILENT)$(call clang-tidy,$@,$<,$(FLAGS))

$(OUT_DIR)/network_config.elf/%.plint: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(network_config.elf_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/network_config.elf/%.o.d; $(SILENT)$(call clang-sa,$@,$<,$(FLAGS))



$(OUT_DIR)/network_config.elf/gcovr/gcda/%.gcno: check-network_config.elf; $(SILENT)mkdir -p $(dir $@) && cp $(OUT_DIR)/$*.gcno $@

libnetwork_config.a_LINT_SOURCES ?= $(filter-out $(libnetwork_config.a_NOLINT_SOURCES),$(libnetwork_config.a_SOURCES))
OBJS_libnetwork_config.a := $(call objs,$(libnetwork_config.a_SOURCES),libnetwork_config.a/)
DEPS_libnetwork_config.a := $(call deps,$(libnetwork_config.a_SOURCES),libnetwork_config.a/)
GCNOS_NATIVE_libnetwork_config.a = $(call gcnos,$(libnetwork_config.a_SOURCES),libnetwork_config.a/)
GCNOS_TRANSITIVE_libnetwork_config.a = $(sort $(GCNOS_NATIVE_libnetwork_config.a) )
GCNO_TARGETS_NATIVE_libnetwork_config.a = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/libnetwork_config.a/gcovr/gcda/%,$(GCNOS_NATIVE_libnetwork_config.a))
GCNO_TARGETS_TRANSITIVE_libnetwork_config.a = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/libnetwork_config.a/gcovr/gcda/%,$(GCNOS_TRANSITIVE_libnetwork_config.a))
.PRECIOUS: $(GCNO_TARGETS_TRANSITIVE_libnetwork_config.a)
GCOV_TARGETS_NATIVE_libnetwork_config.a = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_NATIVE_libnetwork_config.a))
GCOV_TARGETS_TRANSITIVE_libnetwork_config.a = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_TRANSITIVE_libnetwork_config.a))
LOBS_libnetwork_config.a := $(call lobs,$(libnetwork_config.a_LINT_SOURCES),libnetwork_config.a/)
TIDYS_libnetwork_config.a := $(call tidys,$(libnetwork_config.a_LINT_SOURCES),libnetwork_config.a/)
$(TIDYS_libnetwork_config.a): $(libnetwork_config.a_PRECLANG_FILES)
PLINTS_libnetwork_config.a := $(call plints,$(libnetwork_config.a_LINT_SOURCES),libnetwork_config.a/)
$(PLINTS_libnetwork_config.a): $(libnetwork_config.a_PRECLANG_FILES)

libnetwork_config.a_OUT_OF_SOURCETREE = $(filter-out $(PROJECT_ROOT)/%,$(libnetwork_config.a_SOURCES))
$(if $(strip $(libnetwork_config.a_OUT_OF_SOURCETREE)),$(warning Source file lists need to start with $$(PROJECT_ROOT). libnetwork_config.a_SOURCES -> $(libnetwork_config.a_OUT_OF_SOURCETREE)),)

$(if $(filter CLANG_TIDY_BASE_CHECKS CLANG_TIDY_CHECKS,$(libnetwork_config.a_CLANG_TIDY_RULESET)),$(error libnetwork_config.a_CLANG_TIDY_RULESET has "$(libnetwork_config.a_CLANG_TIDY_RULESET)" assigned to it. Instead, assign "$$($(libnetwork_config.a_CLANG_TIDY_RULESET))"))

libnetwork_config.a: $(BIN_DIR)/libnetwork_config.a

$(DEPS_libnetwork_config.a) $(OBJS_libnetwork_config.a) $(LOBS_libnetwork_config.a) $(TIDYS_libnetwork_config.a) $(PLINTS_libnetwork_config.a) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/libnetwork_config.a/lint_mac.h: BUILDTARGET_CPPFLAGS:=$(libnetwork_config.a_CPPFLAGS)

$(DEPS_libnetwork_config.a) $(OBJS_libnetwork_config.a) $(TIDYS_libnetwork_config.a) $(PLINTS_libnetwork_config.a) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/libnetwork_config.a/lint_mac.h: BUILDTARGET_CXXFLAGS:=$(libnetwork_config.a_CXXFLAGS)

$(DEPS_libnetwork_config.a) $(OBJS_libnetwork_config.a) $(TIDYS_libnetwork_config.a) $(PLINTS_libnetwork_config.a) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/libnetwork_config.a/lint_mac.h: BUILDTARGET_CFLAGS:=$(libnetwork_config.a_CFLAGS)

lint-libnetwork_config.a: flexelint-libnetwork_config.a clang-tidy-libnetwork_config.a

$(LOBS_libnetwork_config.a): BUILDTARGET_LINTFLAGS:=$(libnetwork_config.a_LINTFLAGS)

flexelint-libnetwork_config.a: $($(libnetwork_config.a_DISABLE_FLEXELINT)$(DISABLE_FLEXELINT)$(libnetwork_config.a_DISABLE_LINT)$(DISABLE_LINT)LOBS_libnetwork_config.a)

$(TIDYS_libnetwork_config.a): BUILDTARGET_TIDYFLAGS:=$(libnetwork_config.a_TIDYFLAGS) -isystem $(OUT_DIR)/libnetwork_config.a -include lint_mac.h

$(TIDYS_libnetwork_config.a): libnetwork_config.a_CLANG_TIDY_RULESET ?= $(CLANG_TIDY_RULESET)

$(TIDYS_libnetwork_config.a): CLANG_TIDY_CHECKS_OPTION:=$(subst $( ),$(,),$(strip $(libnetwork_config.a_CLANG_TIDY_RULESET) $(libnetwork_config.a_CLANG_TIDY_CHECKS)))

$(PLINTS_libnetwork_config.a): BUILDTARGET_PLINTFLAGS:=$(libnetwork_config.a_PLINTSFLAGS) -isystem $(OUT_DIR)/libnetwork_config.a -include lint_mac.h

clang-tidy-libnetwork_config.a: $($(libnetwork_config.a_DISABLE_CLANG_TIDY)$(DISABLE_CLANG_TIDY)$(libnetwork_config.a_DISABLE_LINT)$(DISABLE_LINT)TIDYS_libnetwork_config.a)

clean-clang-tidy-libnetwork_config.a:; $(SILENT)rm --force $(TIDYS_libnetwork_config.a)

clangsa-libnetwork_config.a: $(PLINTS_libnetwork_config.a)

./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/info/libnetwork_config.a-info.txt: $(SCRIPT_DIR)/internal/clang/info_txt.template $(MK_FILES); $(SILENT)$(call clangbuild_subst_info_buildtarget,libnetwork_config.a,$<) > $@

info-txt-libnetwork_config.a: $(OUT_DIR)/info/libnetwork_config.a-info.txt; $(SILENT)cat $<

$(OUT_DIR)/libnetwork_config.a/%.o.d: $(PROJECT_ROOT)/% $(MK_FILES) $(MAKEDEP_SUPPORT_FILES) | $(libnetwork_config.a_GENHEADERS); $(SILENT)$(call makedep,$@,$<,$(FLAGS))

$(OUT_DIR)/libnetwork_config.a/%.o: $(PROJECT_ROOT)/% $(MK_FILES) $(CC_SUPPORT_FILES) | $(libnetwork_config.a_GENHEADERS); $(SILENT)$(call cc,$@,$<,$(FLAGS))

$(OUT_DIR)/libnetwork_config.a/%.lob: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) | $(libnetwork_config.a_GENHEADERS); $(SILENT)$(call lint,$@,$<,$(FLAGS))

libnetwork_config.a_PRECLANG_FILES=$(OUT_DIR)/libnetwork_config.a/lint_mac.h

$(OUT_DIR)/libnetwork_config.a/%.tidy: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(libnetwork_config.a_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/libnetwork_config.a/%.o.d $(wildcard .clang-tidy) | $(TIDY_SUPPORT_DIRS); $(SILENT)$(call clang-tidy,$@,$<,$(FLAGS))

$(OUT_DIR)/libnetwork_config.a/%.plint: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(libnetwork_config.a_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Debug_gcov/libnetwork_config.a/%.o.d; $(SILENT)$(call clang-sa,$@,$<,$(FLAGS))



$(OUT_DIR)/libnetwork_config.a/gcovr/gcda/%.gcno: check-libnetwork_config.a; $(SILENT)mkdir -p $(dir $@) && cp $(OUT_DIR)/$*.gcno $@

alltests.elf_LINT_SOURCES ?= $(filter-out $(alltests.elf_NOLINT_SOURCES),$(alltests.elf_SOURCES))
OBJS_alltests.elf := $(call objs,$(alltests.elf_SOURCES),alltests.elf/)
DEPS_alltests.elf := $(call deps,$(alltests.elf_SOURCES),alltests.elf/)
GCNOS_NATIVE_alltests.elf = $(call gcnos,$(alltests.elf_SOURCES),alltests.elf/)
GCNOS_TRANSITIVE_alltests.elf = $(sort $(GCNOS_NATIVE_alltests.elf) $(GCNOS_TRANSITIVE_libnetwork_config.a))
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

$(OUT_DIR)/network_config.elf.dbg: $(OBJS_network_config.elf) $(MK_FILES) $(network_config.elf_PREREQUISITES) $(LD_SUPPORT_FILES); $(SILENT)$(call ld$(ARTIFACT),network_config.elf,$@,$(OBJS_network_config.elf),$(LDFLAGS) $(network_config.elf_LDFLAGS))

$(OUT_DIR)/alltests.elf.dbg: $(OBJS_alltests.elf) $(MK_FILES) $(alltests.elf_PREREQUISITES) $(LD_SUPPORT_FILES); $(SILENT)$(call ld$(ARTIFACT),alltests.elf,$@,$(OBJS_alltests.elf),$(LDFLAGS) $(alltests.elf_LDFLAGS))

$(BIN_DIR)/libnetwork_config.a: $(OBJS_libnetwork_config.a) $(MK_FILES) $(libnetwork_config.a_PREREQUISITES) $(AR_SUPPORT_FILES); $(SILENT) rm --force $@; $(call ar,libnetwork_config.a,$@,$(OBJS_libnetwork_config.a),$(ARFLAGS) $(libnetwork_config.a_ARFLAGS))

check-alltests.elf: $(BIN_DIR)/alltests.elf cleanup_coverage-alltests.elf ; $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && (cd $(dir $<) && $(call clangbuild_check,alltests.elf,./$(notdir $<)))
$(GCNOS_NATIVE_alltests.elf): check-alltests.elf
cleanup_coverage-alltests.elf: $(BIN_DIR)/alltests.elf; $(SILENT)rm -rf $(OUT_DIR)/alltests.elf/gcovr/gcda 
coverage-alltests.elf gcovr-alltests.elf: $(OUT_DIR)/alltests.elf/gcovr/coverage.html
$(OUT_DIR)/alltests.elf/gcovr/gcda/.gcovs: check-alltests.elf $(GCNO_TARGETS_TRANSITIVE_alltests.elf); $(SILENT) find $(OUT_DIR)/alltests.elf/gcovr/gcda \( -name gmock_main.dir -or -name gmock.dir \) -type d -exec rm -rf {} + ; $(foreach folder,$(shell ls -d $(OUT_DIR)/alltests.elf/gcovr/gcda/*/), $(call clangbuildtarget_gcov_folder,$(folder)); ) touch $@
$(OUT_DIR)/alltests.elf/gcovr/coverage.xml $(OUT_DIR)/alltests.elf/gcovr/coverage.html: $(OUT_DIR)/alltests.elf/gcovr/gcda/.gcovs ; $(SILENT) gcovr -r . -j $(NPROC) --xml-pretty --xml $(OUT_DIR)/alltests.elf/gcovr/coverage.xml --html --html-details $(OUT_DIR)/alltests.elf/gcovr/coverage.html --html-title alltests.elf --exclude-throw-branches  --use-gcov-files --keep $(addprefix --filter ',$(addsuffix ',$(alltests.elf_GCOVR_FILTER:./%=%) $(GCOVR_FILTER:./%=%))) $(addprefix --exclude ',$(addsuffix ',$(alltests.elf_GCOVR_EXCLUDE:./%=%) $(GCOVR_EXCLUDE:./%=%))) $(addprefix --exclude-directories '$(OUT_DIR:./%=%)/alltests.elf/gcovr/gcda/,$(addsuffix ',$(alltests.elf_GCOVR_EXCLUDE_DIRECTORIES) $(GCOVR_EXCLUDE_DIRECTORIES))) $(alltests.elf_GCOVR_ADDITIONAL_PARAMS) --print-summary $(addprefix $(OUT_DIR)/alltests.elf/gcovr/gcda/,$(or $(strip $(alltests.elf_GCOVR_SEARCH_PATH) $(GCOVR_SEARCH_PATH)),.)) && $(call clangbuildtarget_gcov_print_coverage_written,$(OUT_DIR)/alltests.elf/gcovr/coverage.xml) $(call clangbuildtarget_gcov_print_coverage_written,$(OUT_DIR)/alltests.elf/gcovr/coverage.html)
$(OUT_DIR)/alltests.elf/gcovr/coverage.json: $(OUT_DIR)/alltests.elf/gcovr/gcda/.gcovs check-alltests.elf ; $(SILENT) gcovr -r . -j $(NPROC) --json-pretty --json --output $(OUT_DIR)/alltests.elf/gcovr/coverage.json --exclude-throw-branches  --use-gcov-files --keep $(addprefix --filter ',$(addsuffix ',$(GCOVR_FILTER:./%=%))) $(addprefix --exclude ',$(addsuffix ',$(GCOVR_EXCLUDE:./%=%))) $(addprefix --exclude-directories '$(OUT_DIR:./%=%)/alltests.elf/gcovr/gcda/,$(addsuffix ',$(GCOVR_EXCLUDE_DIRECTORIES))) --print-summary $(addprefix $(OUT_DIR)/alltests.elf/gcovr/gcda/,$(or $(strip $(GCOVR_SEARCH_PATH)),.)) && $(call clangbuildtarget_gcov_print_coverage_written,$(OUT_DIR)/alltests.elf/gcovr/coverage.json)
$(if $(DISABLE_GCOV), coverage-alltests.elf gcovr-alltests.elf: ; @echo "make: *** [coverage-alltests.elf] DISABLE_GCOV needs to be empty!" >&2; false )

memcheck-network_config.elf: $(BIN_DIR)/network_config.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,network_config.elf,./$(notdir $<),MEMCHECK)
helgrind-network_config.elf: $(BIN_DIR)/network_config.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,network_config.elf,./$(notdir $<),HELGRIND)
callgrind-network_config.elf: $(BIN_DIR)/network_config.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,network_config.elf,./$(notdir $<),CALLGRIND)
massif-network_config.elf: $(BIN_DIR)/network_config.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,network_config.elf,./$(notdir $<),MASSIF)
nulgrind-network_config.elf: $(BIN_DIR)/network_config.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,network_config.elf,./$(notdir $<),NULGRIND)

memcheck-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,alltests.elf,./$(notdir $<),MEMCHECK)
helgrind-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,alltests.elf,./$(notdir $<),HELGRIND)
callgrind-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,alltests.elf,./$(notdir $<),CALLGRIND)
massif-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,alltests.elf,./$(notdir $<),MASSIF)
nulgrind-alltests.elf: $(BIN_DIR)/alltests.elf $(VALGRIND); $(CHECK_IGNORE_ERROR)$(SILENT) $(call echo_colored,PURPLE,$<) && cd $(dir $<) && $(call clangbuild_valgrind,alltests.elf,./$(notdir $<),NULGRIND)
