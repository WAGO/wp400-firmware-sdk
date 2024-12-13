CPPFLAGS := $(CPPFLAGS)
CFLAGS := $(CFLAGS)
CXXFLAGS := $(CXXFLAGS)
LDFLAGS := $(LDFLAGS)
ARFLAGS := $(ARFLAGS)

libwagosnmp.so_SOURCES := $(libwagosnmp.so_SOURCES)
libwagosnmp.so_GENHEADERS := $(libwagosnmp.so_GENHEADERS)
libwagosnmp.so_CPPFLAGS := $(libwagosnmp.so_CPPFLAGS)
libwagosnmp.so_CFLAGS := $(libwagosnmp.so_CFLAGS)
libwagosnmp.so_CXXFLAGS := $(libwagosnmp.so_CXXFLAGS)
libwagosnmp.so_LDFLAGS := $(libwagosnmp.so_LDFLAGS)
libwagosnmp.so_ARFLAGS := $(libwagosnmp.so_ARFLAGS)

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

libwagosnmp.so_LINT_SOURCES ?= $(filter-out $(libwagosnmp.so_NOLINT_SOURCES),$(libwagosnmp.so_SOURCES))
OBJS_libwagosnmp.so := $(call objs,$(libwagosnmp.so_SOURCES),libwagosnmp.so/)
DEPS_libwagosnmp.so := $(call deps,$(libwagosnmp.so_SOURCES),libwagosnmp.so/)
GCNOS_NATIVE_libwagosnmp.so = $(call gcnos,$(libwagosnmp.so_SOURCES),libwagosnmp.so/)
GCNOS_TRANSITIVE_libwagosnmp.so = $(sort $(GCNOS_NATIVE_libwagosnmp.so) )
GCNO_TARGETS_NATIVE_libwagosnmp.so = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/libwagosnmp.so/gcovr/gcda/%,$(GCNOS_NATIVE_libwagosnmp.so))
GCNO_TARGETS_TRANSITIVE_libwagosnmp.so = $(patsubst $(OUT_DIR)/%,$(OUT_DIR)/libwagosnmp.so/gcovr/gcda/%,$(GCNOS_TRANSITIVE_libwagosnmp.so))
.PRECIOUS: $(GCNO_TARGETS_TRANSITIVE_libwagosnmp.so)
GCOV_TARGETS_NATIVE_libwagosnmp.so = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_NATIVE_libwagosnmp.so))
GCOV_TARGETS_TRANSITIVE_libwagosnmp.so = $(patsubst %.gcno,%.gcov,$(GCNO_TARGETS_TRANSITIVE_libwagosnmp.so))
LOBS_libwagosnmp.so := $(call lobs,$(libwagosnmp.so_LINT_SOURCES),libwagosnmp.so/)
TIDYS_libwagosnmp.so := $(call tidys,$(libwagosnmp.so_LINT_SOURCES),libwagosnmp.so/)
$(TIDYS_libwagosnmp.so): $(libwagosnmp.so_PRECLANG_FILES)
PLINTS_libwagosnmp.so := $(call plints,$(libwagosnmp.so_LINT_SOURCES),libwagosnmp.so/)
$(PLINTS_libwagosnmp.so): $(libwagosnmp.so_PRECLANG_FILES)

libwagosnmp.so_OUT_OF_SOURCETREE = $(filter-out $(PROJECT_ROOT)/%,$(libwagosnmp.so_SOURCES))
$(if $(strip $(libwagosnmp.so_OUT_OF_SOURCETREE)),$(warning Source file lists need to start with $$(PROJECT_ROOT). libwagosnmp.so_SOURCES -> $(libwagosnmp.so_OUT_OF_SOURCETREE)),)

$(if $(filter CLANG_TIDY_BASE_CHECKS CLANG_TIDY_CHECKS,$(libwagosnmp.so_CLANG_TIDY_RULESET)),$(error libwagosnmp.so_CLANG_TIDY_RULESET has "$(libwagosnmp.so_CLANG_TIDY_RULESET)" assigned to it. Instead, assign "$$($(libwagosnmp.so_CLANG_TIDY_RULESET))"))

libwagosnmp.so: $(BIN_DIR)/libwagosnmp.so

$(DEPS_libwagosnmp.so) $(OBJS_libwagosnmp.so) $(LOBS_libwagosnmp.so) $(TIDYS_libwagosnmp.so) $(PLINTS_libwagosnmp.so) ./out/gcc_11_3_aarch64-linux-gnu/Release/libwagosnmp.so/lint_mac.h: BUILDTARGET_CPPFLAGS:=$(libwagosnmp.so_CPPFLAGS)

$(DEPS_libwagosnmp.so) $(OBJS_libwagosnmp.so) $(TIDYS_libwagosnmp.so) $(PLINTS_libwagosnmp.so) ./out/gcc_11_3_aarch64-linux-gnu/Release/libwagosnmp.so/lint_mac.h: BUILDTARGET_CXXFLAGS:=$(libwagosnmp.so_CXXFLAGS)

$(DEPS_libwagosnmp.so) $(OBJS_libwagosnmp.so) $(TIDYS_libwagosnmp.so) $(PLINTS_libwagosnmp.so) ./out/gcc_11_3_aarch64-linux-gnu/Release/libwagosnmp.so/lint_mac.h: BUILDTARGET_CFLAGS:=$(libwagosnmp.so_CFLAGS)

lint-libwagosnmp.so: flexelint-libwagosnmp.so clang-tidy-libwagosnmp.so

$(LOBS_libwagosnmp.so): BUILDTARGET_LINTFLAGS:=$(libwagosnmp.so_LINTFLAGS)

flexelint-libwagosnmp.so: $($(libwagosnmp.so_DISABLE_FLEXELINT)$(DISABLE_FLEXELINT)$(libwagosnmp.so_DISABLE_LINT)$(DISABLE_LINT)LOBS_libwagosnmp.so)

$(TIDYS_libwagosnmp.so): BUILDTARGET_TIDYFLAGS:=$(libwagosnmp.so_TIDYFLAGS) -isystem $(OUT_DIR)/libwagosnmp.so -include lint_mac.h

$(TIDYS_libwagosnmp.so): libwagosnmp.so_CLANG_TIDY_RULESET ?= $(CLANG_TIDY_RULESET)

$(TIDYS_libwagosnmp.so): CLANG_TIDY_CHECKS_OPTION:=$(subst $( ),$(,),$(strip $(libwagosnmp.so_CLANG_TIDY_RULESET) $(libwagosnmp.so_CLANG_TIDY_CHECKS)))

$(PLINTS_libwagosnmp.so): BUILDTARGET_PLINTFLAGS:=$(libwagosnmp.so_PLINTSFLAGS) -isystem $(OUT_DIR)/libwagosnmp.so -include lint_mac.h

clang-tidy-libwagosnmp.so: $($(libwagosnmp.so_DISABLE_CLANG_TIDY)$(DISABLE_CLANG_TIDY)$(libwagosnmp.so_DISABLE_LINT)$(DISABLE_LINT)TIDYS_libwagosnmp.so)

clean-clang-tidy-libwagosnmp.so:; $(SILENT)rm --force $(TIDYS_libwagosnmp.so)

clangsa-libwagosnmp.so: $(PLINTS_libwagosnmp.so)

./out/gcc_11_3_aarch64-linux-gnu/Release/info/libwagosnmp.so-info.txt: $(SCRIPT_DIR)/internal/clang/info_txt.template $(MK_FILES); $(SILENT)$(call clangbuild_subst_info_buildtarget,libwagosnmp.so,$<) > $@

info-txt-libwagosnmp.so: $(OUT_DIR)/info/libwagosnmp.so-info.txt; $(SILENT)cat $<

$(OUT_DIR)/libwagosnmp.so/%.o.d: $(PROJECT_ROOT)/% $(MK_FILES) $(MAKEDEP_SUPPORT_FILES) | $(libwagosnmp.so_GENHEADERS); $(SILENT)$(call makedep,$@,$<,$(FLAGS))

$(OUT_DIR)/libwagosnmp.so/%.o: $(PROJECT_ROOT)/% $(MK_FILES) $(CC_SUPPORT_FILES) | $(libwagosnmp.so_GENHEADERS); $(SILENT)$(call cc,$@,$<,$(FLAGS))

$(OUT_DIR)/libwagosnmp.so/%.lob: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) | $(libwagosnmp.so_GENHEADERS); $(SILENT)$(call lint,$@,$<,$(FLAGS))

libwagosnmp.so_PRECLANG_FILES=$(OUT_DIR)/libwagosnmp.so/lint_mac.h

$(OUT_DIR)/libwagosnmp.so/%.tidy: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(libwagosnmp.so_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Release/libwagosnmp.so/%.o.d $(wildcard .clang-tidy) | $(TIDY_SUPPORT_DIRS); $(SILENT)$(call clang-tidy,$@,$<,$(FLAGS))

$(OUT_DIR)/libwagosnmp.so/%.plint: $(PROJECT_ROOT)/% $(MK_FILES) $(LINT_SUPPORT_FILES) $(libwagosnmp.so_PRECLANG_FILES) ./out/gcc_11_3_aarch64-linux-gnu/Release/libwagosnmp.so/%.o.d; $(SILENT)$(call clang-sa,$@,$<,$(FLAGS))



$(OUT_DIR)/libwagosnmp.so/gcovr/gcda/%.gcno: check-libwagosnmp.so; $(SILENT)mkdir -p $(dir $@) && cp $(OUT_DIR)/$*.gcno $@

alltests.elf_LINT_SOURCES ?= $(filter-out $(alltests.elf_NOLINT_SOURCES),$(alltests.elf_SOURCES))
OBJS_alltests.elf := $(call objs,$(alltests.elf_SOURCES),alltests.elf/)
DEPS_alltests.elf := $(call deps,$(alltests.elf_SOURCES),alltests.elf/)
GCNOS_NATIVE_alltests.elf = $(call gcnos,$(alltests.elf_SOURCES),alltests.elf/)
GCNOS_TRANSITIVE_alltests.elf = $(sort $(GCNOS_NATIVE_alltests.elf) )
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

$(DESTDIR)/usr/%/libwagosnmp.so.0.1.0: $(OUT_DIR)/libwagosnmp.so.dbg | $(DESTDIR)/usr/%; $(SILENT)$(call echo_if_silent,installing libwagosnmp.so to $@) && ln -Tsf libwagosnmp.so.0.1.0 $(DESTDIR)/usr/$*/libwagosnmp.so.0 && ln -Tsf libwagosnmp.so.0.1.0 $(DESTDIR)/usr/$*/libwagosnmp.so && cp $< $@

$(OUT_DIR)/libwagosnmp.so.dbg: $(OBJS_libwagosnmp.so) $(MK_FILES) $(libwagosnmp.so_PREREQUISITES) $(LD_SUPPORT_FILES); $(SILENT)$(call ld$(ARTIFACT),libwagosnmp.so,$@,$(OBJS_libwagosnmp.so),$(LDFLAGS) $(libwagosnmp.so_LDFLAGS))

$(OUT_DIR)/alltests.elf.dbg: $(OBJS_alltests.elf) $(MK_FILES) $(alltests.elf_PREREQUISITES) $(LD_SUPPORT_FILES); $(SILENT)$(call ld$(ARTIFACT),alltests.elf,$@,$(OBJS_alltests.elf),$(LDFLAGS) $(alltests.elf_LDFLAGS))

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
