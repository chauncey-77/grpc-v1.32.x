# GRPC global makefile
# This currently builds C and C++ code.
# This file has been automatically generated from a template file.
# Please look at the templates directory instead.
# This file can be regenerated from the template by running
# tools/buildgen/generate_projects.sh

# Copyright 2015 gRPC authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.



comma := ,


# Basic platform detection
HOST_SYSTEM = $(shell uname | cut -f 1 -d_)
SYSTEM ?= $(HOST_SYSTEM)
ifeq ($(SYSTEM),MSYS)
SYSTEM = MINGW32
endif
ifeq ($(SYSTEM),MINGW64)
SYSTEM = MINGW32
endif

# Basic machine detection
HOST_MACHINE = $(shell uname -m)
ifeq ($(HOST_MACHINE),x86_64)
HOST_IS_X86_64 = true
else
HOST_IS_X86_64 = false
endif

MAKEFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
ifndef BUILDDIR
BUILDDIR_ABSOLUTE = $(patsubst %/,%,$(dir $(MAKEFILE_PATH)))
else
BUILDDIR_ABSOLUTE = $(abspath $(BUILDDIR))
endif

HAS_GCC = $(shell which gcc > /dev/null 2> /dev/null && echo true || echo false)
HAS_CC = $(shell which cc > /dev/null 2> /dev/null && echo true || echo false)
HAS_CLANG = $(shell which clang > /dev/null 2> /dev/null && echo true || echo false)

ifeq ($(HAS_CC),true)
DEFAULT_CC = cc
DEFAULT_CXX = c++
else
ifeq ($(HAS_GCC),true)
DEFAULT_CC = gcc
DEFAULT_CXX = g++
else
ifeq ($(HAS_CLANG),true)
DEFAULT_CC = clang
DEFAULT_CXX = clang++
else
DEFAULT_CC = no_c_compiler
DEFAULT_CXX = no_c++_compiler
endif
endif
endif


BINDIR = $(BUILDDIR_ABSOLUTE)/bins
OBJDIR = $(BUILDDIR_ABSOLUTE)/objs
LIBDIR = $(BUILDDIR_ABSOLUTE)/libs
GENDIR = $(BUILDDIR_ABSOLUTE)/gens

# Configurations

VALID_CONFIG_opt = 1
CC_opt = $(DEFAULT_CC)
CXX_opt = $(DEFAULT_CXX)
LD_opt = $(DEFAULT_CC)
LDXX_opt = $(DEFAULT_CXX)
CPPFLAGS_opt = -O2 -Wframe-larger-than=16384
DEFINES_opt = NDEBUG

VALID_CONFIG_asan-trace-cmp = 1
REQUIRE_CUSTOM_LIBRARIES_asan-trace-cmp = 1
CC_asan-trace-cmp = clang
CXX_asan-trace-cmp = clang++
LD_asan-trace-cmp = clang++
LDXX_asan-trace-cmp = clang++
CPPFLAGS_asan-trace-cmp = -O0 -fsanitize-coverage=edge,trace-pc-guard -fsanitize-coverage=trace-cmp -fsanitize=address -fno-omit-frame-pointer -Wno-unused-command-line-argument -DGPR_NO_DIRECT_SYSCALLS
LDFLAGS_asan-trace-cmp = -fsanitize=address

VALID_CONFIG_dbg = 1
CC_dbg = $(DEFAULT_CC)
CXX_dbg = $(DEFAULT_CXX)
LD_dbg = $(DEFAULT_CC)
LDXX_dbg = $(DEFAULT_CXX)
CPPFLAGS_dbg = -O0
DEFINES_dbg = _DEBUG DEBUG

VALID_CONFIG_asan = 1
REQUIRE_CUSTOM_LIBRARIES_asan = 1
CC_asan = clang
CXX_asan = clang++
LD_asan = clang++
LDXX_asan = clang++
CPPFLAGS_asan = -O0 -fsanitize-coverage=edge,trace-pc-guard -fsanitize=address -fno-omit-frame-pointer -Wno-unused-command-line-argument -DGPR_NO_DIRECT_SYSCALLS
LDFLAGS_asan = -fsanitize=address

VALID_CONFIG_msan = 1
REQUIRE_CUSTOM_LIBRARIES_msan = 1
CC_msan = clang
CXX_msan = clang++
LD_msan = clang++
LDXX_msan = clang++
CPPFLAGS_msan = -O0 -stdlib=libc++ -fsanitize-coverage=edge,trace-pc-guard -fsanitize=memory -fsanitize-memory-track-origins -fsanitize-memory-use-after-dtor -fno-omit-frame-pointer -DGTEST_HAS_TR1_TUPLE=0 -DGTEST_USE_OWN_TR1_TUPLE=1 -Wno-unused-command-line-argument -fPIE -pie -DGPR_NO_DIRECT_SYSCALLS
LDFLAGS_msan = -stdlib=libc++ -fsanitize=memory -DGTEST_HAS_TR1_TUPLE=0 -DGTEST_USE_OWN_TR1_TUPLE=1 -fPIE -pie $(if $(JENKINS_BUILD),-Wl$(comma)-Ttext-segment=0x7e0000000000,)
DEFINES_msan = NDEBUG

VALID_CONFIG_basicprof = 1
CC_basicprof = $(DEFAULT_CC)
CXX_basicprof = $(DEFAULT_CXX)
LD_basicprof = $(DEFAULT_CC)
LDXX_basicprof = $(DEFAULT_CXX)
CPPFLAGS_basicprof = -O2 -DGRPC_BASIC_PROFILER -DGRPC_TIMERS_RDTSC
DEFINES_basicprof = NDEBUG

VALID_CONFIG_helgrind = 1
CC_helgrind = $(DEFAULT_CC)
CXX_helgrind = $(DEFAULT_CXX)
LD_helgrind = $(DEFAULT_CC)
LDXX_helgrind = $(DEFAULT_CXX)
CPPFLAGS_helgrind = -O0
LDFLAGS_helgrind = -rdynamic
DEFINES_helgrind = _DEBUG DEBUG

VALID_CONFIG_asan-noleaks = 1
REQUIRE_CUSTOM_LIBRARIES_asan-noleaks = 1
CC_asan-noleaks = clang
CXX_asan-noleaks = clang++
LD_asan-noleaks = clang++
LDXX_asan-noleaks = clang++
CPPFLAGS_asan-noleaks = -O0 -fsanitize-coverage=edge,trace-pc-guard -fsanitize=address -fno-omit-frame-pointer -Wno-unused-command-line-argument -DGPR_NO_DIRECT_SYSCALLS
LDFLAGS_asan-noleaks = fsanitize=address

VALID_CONFIG_noexcept = 1
CC_noexcept = $(DEFAULT_CC)
CXX_noexcept = $(DEFAULT_CXX)
LD_noexcept = $(DEFAULT_CC)
LDXX_noexcept = $(DEFAULT_CXX)
CXXFLAGS_noexcept = -fno-exceptions
CPPFLAGS_noexcept = -O2 -Wframe-larger-than=16384
DEFINES_noexcept = NDEBUG

VALID_CONFIG_ubsan = 1
REQUIRE_CUSTOM_LIBRARIES_ubsan = 1
CC_ubsan = clang
CXX_ubsan = clang++
LD_ubsan = clang++
LDXX_ubsan = clang++
CPPFLAGS_ubsan = -O0 -stdlib=libc++ -fsanitize-coverage=edge,trace-pc-guard -fsanitize=undefined -fno-omit-frame-pointer -Wno-unused-command-line-argument -Wvarargs
LDFLAGS_ubsan = -stdlib=libc++ -fsanitize=undefined,unsigned-integer-overflow
DEFINES_ubsan = NDEBUG GRPC_UBSAN

VALID_CONFIG_tsan = 1
REQUIRE_CUSTOM_LIBRARIES_tsan = 1
CC_tsan = clang
CXX_tsan = clang++
LD_tsan = clang++
LDXX_tsan = clang++
CPPFLAGS_tsan = -O0 -fsanitize=thread -fno-omit-frame-pointer -Wno-unused-command-line-argument -DGPR_NO_DIRECT_SYSCALLS
LDFLAGS_tsan = -fsanitize=thread
DEFINES_tsan = GRPC_TSAN

VALID_CONFIG_counters_with_memory_counter = 1
CC_counters_with_memory_counter = $(DEFAULT_CC)
CXX_counters_with_memory_counter = $(DEFAULT_CXX)
LD_counters_with_memory_counter = $(DEFAULT_CC)
LDXX_counters_with_memory_counter = $(DEFAULT_CXX)
CPPFLAGS_counters_with_memory_counter = -O2 -DGPR_LOW_LEVEL_COUNTERS -DGPR_WRAP_MEMORY_COUNTER
LDFLAGS_counters_with_memory_counter = -Wl,--wrap=malloc -Wl,--wrap=calloc -Wl,--wrap=realloc -Wl,--wrap=free
DEFINES_counters_with_memory_counter = NDEBUG

VALID_CONFIG_stapprof = 1
CC_stapprof = $(DEFAULT_CC)
CXX_stapprof = $(DEFAULT_CXX)
LD_stapprof = $(DEFAULT_CC)
LDXX_stapprof = $(DEFAULT_CXX)
CPPFLAGS_stapprof = -O2 -DGRPC_STAP_PROFILER
DEFINES_stapprof = NDEBUG

VALID_CONFIG_gcov = 1
CC_gcov = gcc
CXX_gcov = g++
LD_gcov = gcc
LDXX_gcov = g++
CPPFLAGS_gcov = -O0 -fprofile-arcs -ftest-coverage -Wno-return-type
LDFLAGS_gcov = -fprofile-arcs -ftest-coverage -rdynamic -lstdc++
DEFINES_gcov = _DEBUG DEBUG GPR_GCOV

VALID_CONFIG_memcheck = 1
CC_memcheck = $(DEFAULT_CC)
CXX_memcheck = $(DEFAULT_CXX)
LD_memcheck = $(DEFAULT_CC)
LDXX_memcheck = $(DEFAULT_CXX)
CPPFLAGS_memcheck = -O0
LDFLAGS_memcheck = -rdynamic
DEFINES_memcheck = _DEBUG DEBUG

VALID_CONFIG_lto = 1
CC_lto = $(DEFAULT_CC)
CXX_lto = $(DEFAULT_CXX)
LD_lto = $(DEFAULT_CC)
LDXX_lto = $(DEFAULT_CXX)
CPPFLAGS_lto = -O2
DEFINES_lto = NDEBUG

VALID_CONFIG_c++-compat = 1
CC_c++-compat = $(DEFAULT_CC)
CXX_c++-compat = $(DEFAULT_CXX)
LD_c++-compat = $(DEFAULT_CC)
LDXX_c++-compat = $(DEFAULT_CXX)
CFLAGS_c++-compat = -Wc++-compat
CPPFLAGS_c++-compat = -O0
DEFINES_c++-compat = _DEBUG DEBUG

VALID_CONFIG_mutrace = 1
CC_mutrace = $(DEFAULT_CC)
CXX_mutrace = $(DEFAULT_CXX)
LD_mutrace = $(DEFAULT_CC)
LDXX_mutrace = $(DEFAULT_CXX)
CPPFLAGS_mutrace = -O3 -fno-omit-frame-pointer
LDFLAGS_mutrace = -rdynamic
DEFINES_mutrace = NDEBUG

VALID_CONFIG_counters = 1
CC_counters = $(DEFAULT_CC)
CXX_counters = $(DEFAULT_CXX)
LD_counters = $(DEFAULT_CC)
LDXX_counters = $(DEFAULT_CXX)
CPPFLAGS_counters = -O2 -DGPR_LOW_LEVEL_COUNTERS
DEFINES_counters = NDEBUG



# General settings.
# You may want to change these depending on your system.

prefix ?= /usr/local

PROTOC ?= protoc
DTRACE ?= dtrace
CONFIG ?= opt
# Doing X ?= Y is the same as:
# ifeq ($(origin X), undefined)
#  X = Y
# endif
# but some variables, such as CC, CXX, LD or AR, have defaults.
# So instead of using ?= on them, we need to check their origin.
# See:
#  https://www.gnu.org/software/make/manual/html_node/Implicit-Variables.html
#  https://www.gnu.org/software/make/manual/html_node/Flavors.html#index-_003f_003d
#  https://www.gnu.org/software/make/manual/html_node/Origin-Function.html
ifeq ($(origin CC), default)
CC = $(CC_$(CONFIG))
endif
ifeq ($(origin CXX), default)
CXX = $(CXX_$(CONFIG))
endif
ifeq ($(origin LD), default)
LD = $(LD_$(CONFIG))
endif
LDXX ?= $(LDXX_$(CONFIG))
ARFLAGS ?= rcs
ifeq ($(SYSTEM),Linux)
ifeq ($(origin AR), default)
AR = ar
endif
STRIP ?= strip --strip-unneeded
else
ifeq ($(SYSTEM),Darwin)
ifeq ($(origin AR), default)
AR = libtool
ARFLAGS = -no_warning_for_no_symbols -o
endif
STRIP ?= strip -x
else
ifeq ($(SYSTEM),MINGW32)
ifeq ($(origin AR), default)
AR = ar
endif
STRIP ?= strip --strip-unneeded
else
ifeq ($(origin AR), default)
AR = ar
endif
STRIP ?= strip
endif
endif
endif
INSTALL ?= install
RM ?= rm -f
PKG_CONFIG ?= pkg-config

ifndef VALID_CONFIG_$(CONFIG)
$(error Invalid CONFIG value '$(CONFIG)')
endif

ifeq ($(SYSTEM),Linux)
TMPOUT = /dev/null
else
TMPOUT = `mktemp /tmp/test-out-XXXXXX`
endif

CHECK_NO_CXX14_COMPAT_WORKS_CMD = $(CC) -std=c++11 -Werror -Wno-c++14-compat -o $(TMPOUT) -c test/build/no-c++14-compat.cc
HAS_WORKING_NO_CXX14_COMPAT = $(shell $(CHECK_NO_CXX14_COMPAT_WORKS_CMD) 2> /dev/null && echo true || echo false)
ifeq ($(HAS_WORKING_NO_CXX14_COMPAT),true)
W_NO_CXX14_COMPAT=-Wno-c++14-compat
endif

CHECK_EXTRA_SEMI_WORKS_CMD = $(CC) -std=c99 -Werror -Wextra-semi -o $(TMPOUT) -c test/build/extra-semi.c
HAS_WORKING_EXTRA_SEMI = $(shell $(CHECK_EXTRA_SEMI_WORKS_CMD) 2> /dev/null && echo true || echo false)
ifeq ($(HAS_WORKING_EXTRA_SEMI),true)
W_EXTRA_SEMI=-Wextra-semi
NO_W_EXTRA_SEMI=-Wno-extra-semi
endif
CHECK_NO_SHIFT_NEGATIVE_VALUE_WORKS_CMD = $(CC) -std=c99 -Werror -Wno-shift-negative-value -o $(TMPOUT) -c test/build/no-shift-negative-value.c
HAS_WORKING_NO_SHIFT_NEGATIVE_VALUE = $(shell $(CHECK_NO_SHIFT_NEGATIVE_VALUE_WORKS_CMD) 2> /dev/null && echo true || echo false)
ifeq ($(HAS_WORKING_NO_SHIFT_NEGATIVE_VALUE),true)
W_NO_SHIFT_NEGATIVE_VALUE=-Wno-shift-negative-value
NO_W_NO_SHIFT_NEGATIVE_VALUE=-Wshift-negative-value
endif
CHECK_NO_UNUSED_BUT_SET_VARIABLE_WORKS_CMD = $(CC) -std=c99 -Werror -Wno-unused-but-set-variable -o $(TMPOUT) -c test/build/no-unused-but-set-variable.c
HAS_WORKING_NO_UNUSED_BUT_SET_VARIABLE = $(shell $(CHECK_NO_UNUSED_BUT_SET_VARIABLE_WORKS_CMD) 2> /dev/null && echo true || echo false)
ifeq ($(HAS_WORKING_NO_UNUSED_BUT_SET_VARIABLE),true)
W_NO_UNUSED_BUT_SET_VARIABLE=-Wno-unused-but-set-variable
NO_W_NO_UNUSED_BUT_SET_VARIABLE=-Wunused-but-set-variable
endif
CHECK_NO_MAYBE_UNINITIALIZED_WORKS_CMD = $(CC) -std=c99 -Werror -Wno-maybe-uninitialized -o $(TMPOUT) -c test/build/no-maybe-uninitialized.c
HAS_WORKING_NO_MAYBE_UNINITIALIZED = $(shell $(CHECK_NO_MAYBE_UNINITIALIZED_WORKS_CMD) 2> /dev/null && echo true || echo false)
ifeq ($(HAS_WORKING_NO_MAYBE_UNINITIALIZED),true)
W_NO_MAYBE_UNINITIALIZED=-Wno-maybe-uninitialized
NO_W_NO_MAYBE_UNINITIALIZED=-Wmaybe-uninitialized
endif
CHECK_NO_UNKNOWN_WARNING_OPTION_WORKS_CMD = $(CC) -std=c99 -Werror -Wno-unknown-warning-option -o $(TMPOUT) -c test/build/no-unknown-warning-option.c
HAS_WORKING_NO_UNKNOWN_WARNING_OPTION = $(shell $(CHECK_NO_UNKNOWN_WARNING_OPTION_WORKS_CMD) 2> /dev/null && echo true || echo false)
ifeq ($(HAS_WORKING_NO_UNKNOWN_WARNING_OPTION),true)
W_NO_UNKNOWN_WARNING_OPTION=-Wno-unknown-warning-option
NO_W_NO_UNKNOWN_WARNING_OPTION=-Wunknown-warning-option
endif

# The HOST compiler settings are used to compile the protoc plugins.
# In most cases, you won't have to change anything, but if you are
# cross-compiling, you can override these variables from GNU make's
# command line: make CC=cross-gcc HOST_CC=gcc

HOST_CC ?= $(CC)
HOST_CXX ?= $(CXX)
HOST_LD ?= $(LD)
HOST_LDXX ?= $(LDXX)

CFLAGS += -std=c99 $(W_EXTRA_SEMI)
CXXFLAGS += -std=c++11
ifeq ($(SYSTEM),Darwin)
CXXFLAGS += -stdlib=libc++
LDFLAGS += -framework CoreFoundation
endif
CFLAGS += -g
CPPFLAGS += -g -Wall -Wextra -DOSATOMIC_USE_INLINED=1 -Ithird_party/abseil-cpp -Ithird_party/re2 -Ithird_party/upb -Isrc/core/ext/upb-generated -Isrc/core/ext/upbdefs-generated
COREFLAGS += -fno-exceptions
LDFLAGS += -g

CPPFLAGS += $(CPPFLAGS_$(CONFIG))
CFLAGS += $(CFLAGS_$(CONFIG))
CXXFLAGS += $(CXXFLAGS_$(CONFIG))
DEFINES += $(DEFINES_$(CONFIG)) INSTALL_PREFIX=\"$(prefix)\"
LDFLAGS += $(LDFLAGS_$(CONFIG))

ifneq ($(SYSTEM),MINGW32)
PIC_CPPFLAGS = -fPIC
CPPFLAGS += -fPIC
LDFLAGS += -fPIC
endif

INCLUDES = . include $(GENDIR)
LDFLAGS += -Llibs/$(CONFIG)

ifeq ($(SYSTEM),Darwin)
ifneq ($(wildcard /usr/local/ssl/include),)
INCLUDES += /usr/local/ssl/include
endif
ifneq ($(wildcard /opt/local/include),)
INCLUDES += /opt/local/include
endif
ifneq ($(wildcard /usr/local/include),)
INCLUDES += /usr/local/include
endif
LIBS = m z
ifneq ($(wildcard /usr/local/ssl/lib),)
LDFLAGS += -L/usr/local/ssl/lib
endif
ifneq ($(wildcard /opt/local/lib),)
LDFLAGS += -L/opt/local/lib
endif
ifneq ($(wildcard /usr/local/lib),)
LDFLAGS += -L/usr/local/lib
endif
endif

ifeq ($(SYSTEM),Linux)
LIBS = dl rt m pthread
LDFLAGS += -pthread
endif

ifeq ($(SYSTEM),MINGW32)
LIBS = m pthread ws2_32 dbghelp
LDFLAGS += -pthread
endif

#
# The steps for cross-compiling are as follows:
# First, clone and make install of grpc using the native compilers for the host.
# Also, install protoc (e.g., from a package like apt-get)
# Then clone a fresh grpc for the actual cross-compiled build
# Set the environment variable GRPC_CROSS_COMPILE to true
# Set CC, CXX, LD, LDXX, AR, and STRIP to the cross-compiling binaries
# Also set PROTOBUF_CONFIG_OPTS to indicate cross-compilation to protobuf (e.g.,
#  PROTOBUF_CONFIG_OPTS="--host=arm-linux --with-protoc=/usr/local/bin/protoc" )
# Set HAS_PKG_CONFIG=false
# To build tests, go to third_party/gflags and follow its ccmake instructions
# Make sure that you enable building shared libraries and set your prefix to
# something useful like /usr/local/cross
# You will also need to set GRPC_CROSS_LDOPTS and GRPC_CROSS_AROPTS to hold
# additional required arguments for LD and AR (examples below)
# Then you can do a make from the cross-compiling fresh clone!
#
ifeq ($(GRPC_CROSS_COMPILE),true)
LDFLAGS += $(GRPC_CROSS_LDOPTS) # e.g. -L/usr/local/lib -L/usr/local/cross/lib
ARFLAGS += $(GRPC_CROSS_AROPTS) # e.g., rc --target=elf32-little
USE_BUILT_PROTOC = false
endif

GTEST_LIB = -Ithird_party/googletest/googletest/include -Ithird_party/googletest/googletest third_party/googletest/googletest/src/gtest-all.cc -Ithird_party/googletest/googlemock/include -Ithird_party/googletest/googlemock third_party/googletest/googlemock/src/gmock-all.cc
GTEST_LIB += -lgflags -std=c++11
ifeq ($(V),1)
E = @:
Q =
else
E = @echo
Q = @
endif

CORE_VERSION = 12.0.0
CPP_VERSION = 1.32.0-pre1
CSHARP_VERSION = 2.32.0-pre1

CPPFLAGS_NO_ARCH += $(addprefix -I, $(INCLUDES)) $(addprefix -D, $(DEFINES))
CPPFLAGS += $(CPPFLAGS_NO_ARCH) $(ARCH_FLAGS)

LDFLAGS += $(ARCH_FLAGS)
LDLIBS += $(addprefix -l, $(LIBS))
LDLIBSXX += $(addprefix -l, $(LIBSXX))


CFLAGS += $(EXTRA_CFLAGS)
CXXFLAGS += $(EXTRA_CXXFLAGS)
CPPFLAGS += $(EXTRA_CPPFLAGS)
LDFLAGS += $(EXTRA_LDFLAGS)
DEFINES += $(EXTRA_DEFINES)
LDLIBS += $(EXTRA_LDLIBS)

HOST_CPPFLAGS += $(CPPFLAGS)
HOST_CFLAGS += $(CFLAGS)
HOST_CXXFLAGS += $(CXXFLAGS)
HOST_LDFLAGS += $(LDFLAGS)
HOST_LDLIBS += $(LDLIBS)

# These are automatically computed variables.
# There shouldn't be any need to change anything from now on.

-include cache.mk

CACHE_MK =

HAS_PKG_CONFIG ?= $(shell command -v $(PKG_CONFIG) >/dev/null 2>&1 && echo true || echo false)

ifeq ($(HAS_PKG_CONFIG), true)
CACHE_MK += HAS_PKG_CONFIG = true,
endif

ifeq ($(SYSTEM),MINGW32)
EXECUTABLE_SUFFIX = .exe
SHARED_EXT_CORE = dll
SHARED_EXT_CPP = dll
SHARED_EXT_CSHARP = dll
SHARED_PREFIX =
SHARED_VERSION_CORE = -12
SHARED_VERSION_CPP = -1
SHARED_VERSION_CSHARP = -2
else ifeq ($(SYSTEM),Darwin)
EXECUTABLE_SUFFIX =
SHARED_EXT_CORE = dylib
SHARED_EXT_CPP = dylib
SHARED_EXT_CSHARP = dylib
SHARED_PREFIX = lib
SHARED_VERSION_CORE =
SHARED_VERSION_CPP =
SHARED_VERSION_CSHARP =
else
EXECUTABLE_SUFFIX =
SHARED_EXT_CORE = so.$(CORE_VERSION)
SHARED_EXT_CPP = so.$(CPP_VERSION)
SHARED_EXT_CSHARP = so.$(CSHARP_VERSION)
SHARED_PREFIX = lib
SHARED_VERSION_CORE =
SHARED_VERSION_CPP =
SHARED_VERSION_CSHARP =
endif

ifeq ($(wildcard .git),)
IS_GIT_FOLDER = false
else
IS_GIT_FOLDER = true
endif

ifeq ($(HAS_PKG_CONFIG),true)
OPENSSL_ALPN_CHECK_CMD = $(PKG_CONFIG) --atleast-version=1.0.2 openssl
ZLIB_CHECK_CMD = $(PKG_CONFIG) --exists zlib
PROTOBUF_CHECK_CMD = $(PKG_CONFIG) --atleast-version=3.12.0 protobuf
CARES_CHECK_CMD = $(PKG_CONFIG) --atleast-version=1.11.0 libcares
else # HAS_PKG_CONFIG

ifeq ($(SYSTEM),MINGW32)
OPENSSL_LIBS = ssl32 eay32
else
OPENSSL_LIBS = ssl crypto
endif

OPENSSL_ALPN_CHECK_CMD = $(CC) $(CPPFLAGS) $(CFLAGS) -o $(TMPOUT) test/build/openssl-alpn.c $(addprefix -l, $(OPENSSL_LIBS)) $(LDFLAGS)
BORINGSSL_COMPILE_CHECK_CMD = $(CC) $(CPPFLAGS) -Ithird_party/boringssl-with-bazel/src/include -fvisibility=hidden -DOPENSSL_NO_ASM -D_GNU_SOURCE -DWIN32_LEAN_AND_MEAN -D_HAS_EXCEPTIONS=0 -DNOMINMAX $(CFLAGS) -g -o $(TMPOUT) test/build/boringssl.c $(LDFLAGS)
ZLIB_CHECK_CMD = $(CC) $(CPPFLAGS) $(CFLAGS) -o $(TMPOUT) test/build/zlib.c -lz $(LDFLAGS)
PROTOBUF_CHECK_CMD = $(CXX) $(CPPFLAGS) $(CXXFLAGS) -o $(TMPOUT) test/build/protobuf.cc -lprotobuf $(LDFLAGS)
CARES_CHECK_CMD = $(CXX) $(CPPFLAGS) $(CXXFLAGS) -o $(TMPOUT) test/build/c-ares.c -lcares $(LDFLAGS)

endif # HAS_PKG_CONFIG

PERFTOOLS_CHECK_CMD = $(CC) $(CPPFLAGS) $(CFLAGS) -o $(TMPOUT) test/build/perftools.c -lprofiler $(LDFLAGS)

PROTOC_CHECK_CMD = which protoc > /dev/null
PROTOC_CHECK_VERSION_CMD = protoc --version | grep -q libprotoc.3
DTRACE_CHECK_CMD = which dtrace > /dev/null
SYSTEMTAP_HEADERS_CHECK_CMD = $(CC) $(CPPFLAGS) $(CFLAGS) -o $(TMPOUT) test/build/systemtap.c $(LDFLAGS)

ifndef REQUIRE_CUSTOM_LIBRARIES_$(CONFIG)
HAS_SYSTEM_PERFTOOLS ?= $(shell $(PERFTOOLS_CHECK_CMD) 2> /dev/null && echo true || echo false)
ifeq ($(HAS_SYSTEM_PERFTOOLS),true)
DEFINES += GRPC_HAVE_PERFTOOLS
LIBS += profiler
CACHE_MK += HAS_SYSTEM_PERFTOOLS = true,
endif
endif

HAS_SYSTEM_PROTOBUF_VERIFY = $(shell $(PROTOBUF_CHECK_CMD) 2> /dev/null && echo true || echo false)
ifndef REQUIRE_CUSTOM_LIBRARIES_$(CONFIG)
HAS_SYSTEM_OPENSSL_ALPN ?= $(shell $(OPENSSL_ALPN_CHECK_CMD) 2> /dev/null && echo true || echo false)
ifeq ($(HAS_SYSTEM_OPENSSL_ALPN),true)
CACHE_MK += HAS_SYSTEM_OPENSSL_ALPN = true,
endif
HAS_SYSTEM_ZLIB ?= $(shell $(ZLIB_CHECK_CMD) 2> /dev/null && echo true || echo false)
ifeq ($(HAS_SYSTEM_ZLIB),true)
CACHE_MK += HAS_SYSTEM_ZLIB = true,
endif
HAS_SYSTEM_PROTOBUF ?= $(HAS_SYSTEM_PROTOBUF_VERIFY)
ifeq ($(HAS_SYSTEM_PROTOBUF),true)
CACHE_MK += HAS_SYSTEM_PROTOBUF = true,
endif
HAS_SYSTEM_CARES ?=  $(shell $(CARES_CHECK_CMD) 2> /dev/null && echo true || echo false)
ifeq ($(HAS_SYSTEM_CARES),true)
CACHE_MK += HAS_SYSTEM_CARES = true,
endif
else
# override system libraries if the config requires a custom compiled library
HAS_SYSTEM_OPENSSL_ALPN = false
HAS_SYSTEM_ZLIB = false
HAS_SYSTEM_PROTOBUF = false
HAS_SYSTEM_CARES = false
endif

HAS_PROTOC ?= $(shell $(PROTOC_CHECK_CMD) 2> /dev/null && echo true || echo false)
ifeq ($(HAS_PROTOC),true)
CACHE_MK += HAS_PROTOC = true,
HAS_VALID_PROTOC ?= $(shell $(PROTOC_CHECK_VERSION_CMD) 2> /dev/null && echo true || echo false)
ifeq ($(HAS_VALID_PROTOC),true)
CACHE_MK += HAS_VALID_PROTOC = true,
endif
else
HAS_VALID_PROTOC = false
endif

# Check for Systemtap (https://sourceware.org/systemtap/), first by making sure <sys/sdt.h> is present
# in the system and secondly by checking for the "dtrace" binary (on Linux, this is part of the Systemtap
# distribution. It's part of the base system on BSD/Solaris machines).
ifndef HAS_SYSTEMTAP
HAS_SYSTEMTAP_HEADERS = $(shell $(SYSTEMTAP_HEADERS_CHECK_CMD) 2> /dev/null && echo true || echo false)
HAS_DTRACE = $(shell $(DTRACE_CHECK_CMD) 2> /dev/null && echo true || echo false)
HAS_SYSTEMTAP = false
ifeq ($(HAS_SYSTEMTAP_HEADERS),true)
ifeq ($(HAS_DTRACE),true)
HAS_SYSTEMTAP = true
endif
endif
endif

ifeq ($(HAS_SYSTEMTAP),true)
CACHE_MK += HAS_SYSTEMTAP = true,
endif

# Note that for testing purposes, one can do:
#   make HAS_EMBEDDED_OPENSSL_ALPN=false
# to emulate the fact we do not have OpenSSL in the third_party folder.
ifeq ($(wildcard third_party/boringssl-with-bazel/src/include/openssl/ssl.h),)
HAS_EMBEDDED_OPENSSL_ALPN = false
else
CAN_COMPILE_EMBEDDED_OPENSSL ?= $(shell $(BORINGSSL_COMPILE_CHECK_CMD) 2> /dev/null && echo true || echo false)
HAS_EMBEDDED_OPENSSL_ALPN = $(CAN_COMPILE_EMBEDDED_OPENSSL)
endif

ifeq ($(wildcard third_party/zlib/zlib.h),)
HAS_EMBEDDED_ZLIB = false
else
HAS_EMBEDDED_ZLIB = true
endif

ifeq ($(wildcard third_party/protobuf/src/google/protobuf/descriptor.pb.h),)
HAS_EMBEDDED_PROTOBUF = false
ifneq ($(HAS_VALID_PROTOC),true)
NO_PROTOC = true
endif
else
HAS_EMBEDDED_PROTOBUF = true
endif

ifeq ($(wildcard third_party/cares/cares/ares.h),)
HAS_EMBEDDED_CARES = false
else
HAS_EMBEDDED_CARES = true
endif

PC_REQUIRES_GRPC =
PC_LIBS_GRPC =

ifeq ($(HAS_SYSTEM_ZLIB),false)
ifeq ($(HAS_EMBEDDED_ZLIB), true)
EMBED_ZLIB ?= true
else
DEP_MISSING += zlib
EMBED_ZLIB ?= broken
endif
else
EMBED_ZLIB ?= false
endif

ifeq ($(EMBED_ZLIB),true)
ZLIB_DEP = $(LIBDIR)/$(CONFIG)/libz.a
ZLIB_MERGE_LIBS = $(LIBDIR)/$(CONFIG)/libz.a
ZLIB_MERGE_OBJS = $(LIBZ_OBJS)
CPPFLAGS += -Ithird_party/zlib
else
ifeq ($(HAS_PKG_CONFIG),true)
CPPFLAGS += $(shell $(PKG_CONFIG) --cflags zlib)
LDFLAGS += $(shell $(PKG_CONFIG) --libs-only-L zlib)
LIBS += $(patsubst -l%,%,$(shell $(PKG_CONFIG) --libs-only-l zlib))
PC_REQUIRES_GRPC += zlib
else
PC_LIBS_GRPC += -lz
LIBS += z
endif
endif

CARES_PKG_CONFIG = false

ifeq ($(HAS_SYSTEM_CARES),false)
ifeq ($(HAS_EMBEDDED_CARES), true)
EMBED_CARES ?= true
else
DEP_MISSING += cares
EMBED_CARES ?= broken
endif
else
EMBED_CARES ?= false
endif

ADDRESS_SORTING_DEP = $(LIBDIR)/$(CONFIG)/libaddress_sorting.a
ADDRESS_SORTING_MERGE_OBJS = $(LIBADDRESS_SORTING_OBJS)
ADDRESS_SORTING_MERGE_LIBS = $(LIBDIR)/$(CONFIG)/libaddress_sorting.a
CPPFLAGS := -Ithird_party/address_sorting/include $(CPPFLAGS)

GRPC_ABSEIL_DEP = $(LIBDIR)/$(CONFIG)/libgrpc_abseil.a
GRPC_ABSEIL_MERGE_LIBS = $(LIBDIR)/$(CONFIG)/libgrpc_abseil.a
ifeq ($(HOST_IS_X86_64),true)
ABSL_RANDOM_HWAES_FLAGS = -maes -msse4
else
ABSL_RANDOM_HWAES_FLAGS =
endif

RE2_DEP = $(LIBDIR)/$(CONFIG)/libre2.a
RE2_MERGE_OBJS = $(LIBRE2_OBJS)
RE2_MERGE_LIBS = $(LIBDIR)/$(CONFIG)/libre2.a

UPB_DEP = $(LIBDIR)/$(CONFIG)/libupb.a
UPB_MERGE_OBJS = $(LIBUPB_OBJS)
UPB_MERGE_LIBS = $(LIBDIR)/$(CONFIG)/libupb.a

ifeq ($(EMBED_CARES),true)
CARES_DEP = $(LIBDIR)/$(CONFIG)/libares.a
CARES_MERGE_OBJS = $(LIBARES_OBJS)
CARES_MERGE_LIBS = $(LIBDIR)/$(CONFIG)/libares.a
CPPFLAGS := -Ithird_party/cares -Ithird_party/cares/cares $(CPPFLAGS)
else
ifeq ($(HAS_PKG_CONFIG),true)
PC_REQUIRES_GRPC += libcares
CPPFLAGS += $(shell $(PKG_CONFIG) --cflags libcares)
LDFLAGS += $(shell $(PKG_CONFIG) --libs-only-L libcares)
LIBS += $(patsubst -l%,%,$(shell $(PKG_CONFIG) --libs-only-l libcares))
else
PC_LIBS_GRPC += -lcares
LIBS += cares
endif
endif

OPENSSL_PKG_CONFIG = false

PC_REQUIRES_SECURE =
PC_LIBS_SECURE =

ifeq ($(HAS_SYSTEM_OPENSSL_ALPN),true)
EMBED_OPENSSL ?= false
NO_SECURE ?= false
else # HAS_SYSTEM_OPENSSL_ALPN=false
ifneq ($(HAS_EMBEDDED_OPENSSL_ALPN),false)
EMBED_OPENSSL ?= $(HAS_EMBEDDED_OPENSSL_ALPN)
NO_SECURE ?= false
else # HAS_EMBEDDED_OPENSSL_ALPN=false
NO_SECURE ?= true
endif # HAS_EMBEDDED_OPENSSL_ALPN
endif # HAS_SYSTEM_OPENSSL_ALPN

OPENSSL_DEP :=
OPENSSL_MERGE_LIBS :=
ifeq ($(NO_SECURE),false)
ifeq ($(EMBED_OPENSSL),true)
OPENSSL_DEP += $(LIBDIR)/$(CONFIG)/libboringssl.a
OPENSSL_MERGE_LIBS += $(LIBDIR)/$(CONFIG)/libboringssl.a
OPENSSL_MERGE_OBJS += $(LIBBORINGSSL_OBJS)
# need to prefix these to ensure overriding system libraries
CPPFLAGS := -Ithird_party/boringssl-with-bazel/src/include $(CPPFLAGS)
else ifneq ($(EMBED_OPENSSL),false)
OPENSSL_DEP += $(EMBED_OPENSSL)/libssl.a $(EMBED_OPENSSL)/libcrypto.a
OPENSSL_MERGE_LIBS += $(EMBED_OPENSSL)/libssl.a $(EMBED_OPENSSL)/libcrypto.a
OPENSSL_MERGE_OBJS += $(wildcard $(EMBED_OPENSSL)/grpc_obj/*.o)
# need to prefix these to ensure overriding system libraries
CPPFLAGS := -I$(EMBED_OPENSSL)/include $(CPPFLAGS)
else # EMBED_OPENSSL=false
ifeq ($(HAS_PKG_CONFIG),true)
OPENSSL_PKG_CONFIG = true
PC_REQUIRES_SECURE = openssl
CPPFLAGS := $(shell $(PKG_CONFIG) --cflags openssl) $(CPPFLAGS)
LDFLAGS_OPENSSL_PKG_CONFIG = $(shell $(PKG_CONFIG) --libs-only-L openssl)
ifeq ($(SYSTEM),Linux)
ifneq ($(LDFLAGS_OPENSSL_PKG_CONFIG),)
LDFLAGS_OPENSSL_PKG_CONFIG += $(shell $(PKG_CONFIG) --libs-only-L openssl | sed s/L/Wl,-rpath,/)
endif # LDFLAGS_OPENSSL_PKG_CONFIG=''
endif # System=Linux
LDFLAGS := $(LDFLAGS_OPENSSL_PKG_CONFIG) $(LDFLAGS)
else # HAS_PKG_CONFIG=false
LIBS_SECURE = $(OPENSSL_LIBS)
endif # HAS_PKG_CONFIG
ifeq ($(DISABLE_ALPN),true)
CPPFLAGS += -DTSI_OPENSSL_ALPN_SUPPORT=0
LIBS_SECURE = $(OPENSSL_LIBS)
endif # DISABLE_ALPN
PC_LIBS_SECURE = $(addprefix -l, $(LIBS_SECURE))
endif # EMBED_OPENSSL
endif # NO_SECURE

ifeq ($(OPENSSL_PKG_CONFIG),true)
LDLIBS_SECURE += $(shell $(PKG_CONFIG) --libs-only-l openssl)
else
LDLIBS_SECURE += $(addprefix -l, $(LIBS_SECURE))
endif

PROTOBUF_PKG_CONFIG = false

PC_REQUIRES_GRPCXX =
PC_LIBS_GRPCXX =

CPPFLAGS := -Ithird_party/googletest/googletest/include -Ithird_party/googletest/googlemock/include $(CPPFLAGS)

PROTOC_PLUGINS_ALL = $(BINDIR)/$(CONFIG)/grpc_cpp_plugin $(BINDIR)/$(CONFIG)/grpc_csharp_plugin $(BINDIR)/$(CONFIG)/grpc_node_plugin $(BINDIR)/$(CONFIG)/grpc_objective_c_plugin $(BINDIR)/$(CONFIG)/grpc_php_plugin $(BINDIR)/$(CONFIG)/grpc_python_plugin $(BINDIR)/$(CONFIG)/grpc_ruby_plugin
PROTOC_PLUGINS_DIR = $(BINDIR)/$(CONFIG)

ifeq ($(HAS_SYSTEM_PROTOBUF),true)
ifeq ($(HAS_PKG_CONFIG),true)
PROTOBUF_PKG_CONFIG = true
PC_REQUIRES_GRPCXX = protobuf
CPPFLAGS := $(CPPFLAGS) $(shell $(PKG_CONFIG) --cflags protobuf)
LDFLAGS_PROTOBUF_PKG_CONFIG = $(shell $(PKG_CONFIG) --libs-only-L protobuf)
ifeq ($(SYSTEM),Linux)
ifneq ($(LDFLAGS_PROTOBUF_PKG_CONFIG),)
LDFLAGS_PROTOBUF_PKG_CONFIG += $(shell $(PKG_CONFIG) --libs-only-L protobuf | sed s/L/Wl,-rpath,/)
endif
endif
else
PC_LIBS_GRPCXX = -lprotobuf
endif
PROTOC_PLUGINS = $(PROTOC_PLUGINS_ALL)
else
ifeq ($(HAS_EMBEDDED_PROTOBUF),true)
PROTOBUF_DEP = $(LIBDIR)/$(CONFIG)/protobuf/libprotobuf.a
CPPFLAGS := -Ithird_party/protobuf/src $(CPPFLAGS)
LDFLAGS := -L$(LIBDIR)/$(CONFIG)/protobuf $(LDFLAGS)
ifneq ($(USE_BUILT_PROTOC),false)
PROTOC = $(BINDIR)/$(CONFIG)/protobuf/protoc
PROTOC_PLUGINS = $(PROTOC_PLUGINS_ALL)
else
PROTOC_PLUGINS =
PROTOC_PLUGINS_DIR = $(prefix)/bin
endif
else
NO_PROTOBUF = true
endif
endif

LIBS_PROTOBUF = protobuf
LIBS_PROTOC = protoc protobuf

HOST_LDLIBS_PROTOC += $(addprefix -l, $(LIBS_PROTOC))

ifeq ($(PROTOBUF_PKG_CONFIG),true)
LDLIBS_PROTOBUF += $(shell $(PKG_CONFIG) --libs-only-l protobuf)
else
LDLIBS_PROTOBUF += $(addprefix -l, $(LIBS_PROTOBUF))
endif

ifeq ($(MAKECMDGOALS),clean)
NO_DEPS = true
endif

.SECONDARY = %.pb.h %.pb.cc

ifeq ($(DEP_MISSING),)
all: static shared plugins
dep_error:
	@echo "You shouldn't see this message - all of your dependencies are correct."
else
all: dep_error git_update stop

dep_error:
	@echo
	@echo "DEPENDENCY ERROR"
	@echo
	@echo "You are missing system dependencies that are essential to build grpc,"
	@echo "and the third_party directory doesn't have them:"
	@echo
	@echo "  $(DEP_MISSING)"
	@echo
	@echo "Installing the development packages for your system will solve"
	@echo "this issue. Please consult INSTALL to get more information."
	@echo
	@echo "If you need information about why these tests failed, run:"
	@echo
	@echo "  make run_dep_checks"
	@echo
endif

git_update:
ifeq ($(IS_GIT_FOLDER),true)
	@echo "Additionally, since you are in a git clone, you can download the"
	@echo "missing dependencies in third_party by running the following command:"
	@echo
	@echo "  git submodule update --init"
	@echo
endif

openssl_dep_error: openssl_dep_message git_update stop

protobuf_dep_error: protobuf_dep_message git_update stop

protoc_dep_error: protoc_dep_message git_update stop

openssl_dep_message:
	@echo
	@echo "DEPENDENCY ERROR"
	@echo
	@echo "The target you are trying to run requires an OpenSSL implementation."
	@echo "Your system doesn't have one, and either the third_party directory"
	@echo "doesn't have it, or your compiler can't build BoringSSL."
	@echo
	@echo "Please consult BUILDING.md to get more information."
	@echo
	@echo "If you need information about why these tests failed, run:"
	@echo
	@echo "  make run_dep_checks"
	@echo

protobuf_dep_message:
	@echo
	@echo "DEPENDENCY ERROR"
	@echo
	@echo "The target you are trying to run requires protobuf 3.12.0+"
	@echo "Your system doesn't have it, and neither does the third_party directory."
	@echo
	@echo "Please consult BUILDING.md to get more information."
	@echo
	@echo "If you need information about why these tests failed, run:"
	@echo
	@echo "  make run_dep_checks"
	@echo

protoc_dep_message:
	@echo
	@echo "DEPENDENCY ERROR"
	@echo
	@echo "The target you are trying to run requires protobuf-compiler 3.12.0+"
	@echo "Your system doesn't have it, and neither does the third_party directory."
	@echo
	@echo "Please consult BUILDING.md to get more information."
	@echo
	@echo "If you need information about why these tests failed, run:"
	@echo
	@echo "  make run_dep_checks"
	@echo

systemtap_dep_error:
	@echo
	@echo "DEPENDENCY ERROR"
	@echo
	@echo "Under the '$(CONFIG)' configutation, the target you are trying "
	@echo "to build requires systemtap 2.7+ (on Linux) or dtrace (on other "
	@echo "platforms such as Solaris and *BSD). "
	@echo
	@echo "Please consult BUILDING.md to get more information."
	@echo

install_not_supported_message:
	@echo
	@echo "Installing via 'make' is no longer supported. Use cmake or bazel instead."
	@echo
	@echo "Please consult BUILDING.md to get more information."
	@echo

install_not_supported_error: install_not_supported_message stop

stop:
	@false

grpc_cpp_plugin: $(BINDIR)/$(CONFIG)/grpc_cpp_plugin
grpc_csharp_plugin: $(BINDIR)/$(CONFIG)/grpc_csharp_plugin
grpc_node_plugin: $(BINDIR)/$(CONFIG)/grpc_node_plugin
grpc_objective_c_plugin: $(BINDIR)/$(CONFIG)/grpc_objective_c_plugin
grpc_php_plugin: $(BINDIR)/$(CONFIG)/grpc_php_plugin
grpc_python_plugin: $(BINDIR)/$(CONFIG)/grpc_python_plugin
grpc_ruby_plugin: $(BINDIR)/$(CONFIG)/grpc_ruby_plugin

run_dep_checks:
	$(OPENSSL_ALPN_CHECK_CMD) || true
	$(ZLIB_CHECK_CMD) || true
	$(PERFTOOLS_CHECK_CMD) || true
	$(PROTOBUF_CHECK_CMD) || true
	$(PROTOC_CHECK_VERSION_CMD) || true
	$(CARES_CHECK_CMD) || true

third_party/protobuf/configure:
	$(E) "[AUTOGEN] Preparing protobuf"
	$(Q)(cd third_party/protobuf ; autoreconf -f -i -Wall,no-obsolete)

$(LIBDIR)/$(CONFIG)/protobuf/libprotobuf.a: third_party/protobuf/configure
	$(E) "[MAKE]    Building protobuf"
	$(Q)mkdir -p $(LIBDIR)/$(CONFIG)/protobuf
	$(Q)(cd third_party/protobuf ; CC="$(CC)" CXX="$(CXX)" LDFLAGS="$(LDFLAGS_$(CONFIG)) -g $(PROTOBUF_LDFLAGS_EXTRA)" CPPFLAGS="$(PIC_CPPFLAGS) $(CPPFLAGS_$(CONFIG)) -g $(PROTOBUF_CPPFLAGS_EXTRA)" ./configure --disable-shared --enable-static $(PROTOBUF_CONFIG_OPTS))
	$(Q)$(MAKE) -C third_party/protobuf clean
	$(Q)$(MAKE) -C third_party/protobuf
	$(Q)mkdir -p $(BINDIR)/$(CONFIG)/protobuf
	$(Q)cp third_party/protobuf/src/.libs/libprotoc.a $(LIBDIR)/$(CONFIG)/protobuf
	$(Q)cp third_party/protobuf/src/.libs/libprotobuf.a $(LIBDIR)/$(CONFIG)/protobuf
	$(Q)cp third_party/protobuf/src/protoc $(BINDIR)/$(CONFIG)/protobuf

static: static_c static_cxx

static_c: cache.mk  $(LIBDIR)/$(CONFIG)/libaddress_sorting.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgrpc_csharp_ext.a $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBDIR)/$(CONFIG)/libupb.a

static_cxx: cache.mk  $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBDIR)/$(CONFIG)/libgrpc++_alts.a $(LIBDIR)/$(CONFIG)/libgrpc++_error_details.a $(LIBDIR)/$(CONFIG)/libgrpc++_reflection.a $(LIBDIR)/$(CONFIG)/libgrpc++_unsecure.a $(LIBDIR)/$(CONFIG)/libgrpcpp_channelz.a

static_csharp: static_c 

shared: shared_c shared_cxx

shared_c: cache.mk $(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)address_sorting$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)gpr$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)grpc$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)grpc_csharp_ext$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)grpc_unsecure$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)upb$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE)
shared_cxx: cache.mk $(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)grpc++$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)grpc++_alts$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)grpc++_error_details$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)grpc++_reflection$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)grpc++_unsecure$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)grpcpp_channelz$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP)

shared_csharp: shared_c 
grpc_csharp_ext: shared_csharp

plugins: $(PROTOC_PLUGINS)

privatelibs: privatelibs_c privatelibs_cxx

privatelibs_c:  $(LIBDIR)/$(CONFIG)/libre2.a $(LIBDIR)/$(CONFIG)/libz.a $(LIBDIR)/$(CONFIG)/libares.a
ifeq ($(EMBED_OPENSSL),true)
privatelibs_cxx: 
else
privatelibs_cxx: 
endif


strip: strip-static strip-shared

strip-static: strip-static_c strip-static_cxx

strip-shared: strip-shared_c strip-shared_cxx

strip-static_c: static_c
ifeq ($(CONFIG),opt)
	$(E) "[STRIP]   Stripping libaddress_sorting.a"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/libaddress_sorting.a
	$(E) "[STRIP]   Stripping libgpr.a"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/libgpr.a
	$(E) "[STRIP]   Stripping libgrpc.a"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/libgrpc.a
	$(E) "[STRIP]   Stripping libgrpc_csharp_ext.a"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/libgrpc_csharp_ext.a
	$(E) "[STRIP]   Stripping libgrpc_unsecure.a"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a
	$(E) "[STRIP]   Stripping libupb.a"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/libupb.a
endif

strip-static_cxx: static_cxx
ifeq ($(CONFIG),opt)
	$(E) "[STRIP]   Stripping libgrpc++.a"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/libgrpc++.a
	$(E) "[STRIP]   Stripping libgrpc++_alts.a"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/libgrpc++_alts.a
	$(E) "[STRIP]   Stripping libgrpc++_error_details.a"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/libgrpc++_error_details.a
	$(E) "[STRIP]   Stripping libgrpc++_reflection.a"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/libgrpc++_reflection.a
	$(E) "[STRIP]   Stripping libgrpc++_unsecure.a"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/libgrpc++_unsecure.a
	$(E) "[STRIP]   Stripping libgrpcpp_channelz.a"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/libgrpcpp_channelz.a
endif

strip-shared_c: shared_c
ifeq ($(CONFIG),opt)
	$(E) "[STRIP]   Stripping $(SHARED_PREFIX)address_sorting$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE)"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)address_sorting$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE)
	$(E) "[STRIP]   Stripping $(SHARED_PREFIX)gpr$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE)"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)gpr$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE)
	$(E) "[STRIP]   Stripping $(SHARED_PREFIX)grpc$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE)"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)grpc$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE)
	$(E) "[STRIP]   Stripping $(SHARED_PREFIX)grpc_csharp_ext$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE)"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)grpc_csharp_ext$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE)
	$(E) "[STRIP]   Stripping $(SHARED_PREFIX)grpc_unsecure$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE)"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)grpc_unsecure$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE)
	$(E) "[STRIP]   Stripping $(SHARED_PREFIX)upb$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE)"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)upb$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE)
endif

strip-shared_cxx: shared_cxx
ifeq ($(CONFIG),opt)
	$(E) "[STRIP]   Stripping $(SHARED_PREFIX)grpc++$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP)"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)grpc++$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP)
	$(E) "[STRIP]   Stripping $(SHARED_PREFIX)grpc++_alts$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP)"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)grpc++_alts$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP)
	$(E) "[STRIP]   Stripping $(SHARED_PREFIX)grpc++_error_details$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP)"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)grpc++_error_details$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP)
	$(E) "[STRIP]   Stripping $(SHARED_PREFIX)grpc++_reflection$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP)"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)grpc++_reflection$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP)
	$(E) "[STRIP]   Stripping $(SHARED_PREFIX)grpc++_unsecure$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP)"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)grpc++_unsecure$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP)
	$(E) "[STRIP]   Stripping $(SHARED_PREFIX)grpcpp_channelz$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP)"
	$(Q) $(STRIP) $(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)grpcpp_channelz$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP)
endif

strip-shared_csharp: shared_csharp
ifeq ($(CONFIG),opt)
endif

cache.mk::
	$(E) "[MAKE]    Generating $@"
	$(Q) echo "$(CACHE_MK)" | tr , '\n' >$@

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/channelz/channelz.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/channelz/channelz.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/channelz/channelz.pb.cc: src/proto/grpc/channelz/channelz.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/channelz/channelz.grpc.pb.cc: src/proto/grpc/channelz/channelz.proto $(GENDIR)/src/proto/grpc/channelz/channelz.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/core/stats.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/core/stats.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/core/stats.pb.cc: src/proto/grpc/core/stats.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/core/stats.grpc.pb.cc: src/proto/grpc/core/stats.proto $(GENDIR)/src/proto/grpc/core/stats.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/health/v1/health.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/health/v1/health.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/health/v1/health.pb.cc: src/proto/grpc/health/v1/health.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/health/v1/health.grpc.pb.cc: src/proto/grpc/health/v1/health.proto $(GENDIR)/src/proto/grpc/health/v1/health.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/lb/v1/load_balancer.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/lb/v1/load_balancer.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/lb/v1/load_balancer.pb.cc: src/proto/grpc/lb/v1/load_balancer.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/lb/v1/load_balancer.grpc.pb.cc: src/proto/grpc/lb/v1/load_balancer.proto $(GENDIR)/src/proto/grpc/lb/v1/load_balancer.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/reflection/v1alpha/reflection.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/reflection/v1alpha/reflection.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/reflection/v1alpha/reflection.pb.cc: src/proto/grpc/reflection/v1alpha/reflection.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/reflection/v1alpha/reflection.grpc.pb.cc: src/proto/grpc/reflection/v1alpha/reflection.proto $(GENDIR)/src/proto/grpc/reflection/v1alpha/reflection.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/status/status.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/status/status.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/status/status.pb.cc: src/proto/grpc/status/status.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/status/status.grpc.pb.cc: src/proto/grpc/status/status.proto $(GENDIR)/src/proto/grpc/status/status.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/benchmark_service.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/benchmark_service.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/benchmark_service.pb.cc: src/proto/grpc/testing/benchmark_service.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/messages.pb.cc
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/benchmark_service.grpc.pb.cc: src/proto/grpc/testing/benchmark_service.proto $(GENDIR)/src/proto/grpc/testing/benchmark_service.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/messages.pb.cc $(GENDIR)/src/proto/grpc/testing/messages.grpc.pb.cc
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/control.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/control.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/control.pb.cc: src/proto/grpc/testing/control.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/payloads.pb.cc $(GENDIR)/src/proto/grpc/testing/stats.pb.cc
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/control.grpc.pb.cc: src/proto/grpc/testing/control.proto $(GENDIR)/src/proto/grpc/testing/control.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/payloads.pb.cc $(GENDIR)/src/proto/grpc/testing/payloads.grpc.pb.cc $(GENDIR)/src/proto/grpc/testing/stats.pb.cc $(GENDIR)/src/proto/grpc/testing/stats.grpc.pb.cc
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/duplicate/echo_duplicate.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/duplicate/echo_duplicate.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/duplicate/echo_duplicate.pb.cc: src/proto/grpc/testing/duplicate/echo_duplicate.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/echo_messages.pb.cc
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/duplicate/echo_duplicate.grpc.pb.cc: src/proto/grpc/testing/duplicate/echo_duplicate.proto $(GENDIR)/src/proto/grpc/testing/duplicate/echo_duplicate.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/echo_messages.pb.cc $(GENDIR)/src/proto/grpc/testing/echo_messages.grpc.pb.cc
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/echo.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/echo.grpc.pb.cc: protoc_dep_error
else


$(GENDIR)/src/proto/grpc/testing/echo.pb.cc: src/proto/grpc/testing/echo.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/echo_messages.pb.cc $(GENDIR)/src/proto/grpc/testing/simple_messages.pb.cc
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/echo.grpc.pb.cc: src/proto/grpc/testing/echo.proto $(GENDIR)/src/proto/grpc/testing/echo.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/echo_messages.pb.cc $(GENDIR)/src/proto/grpc/testing/echo_messages.grpc.pb.cc $(GENDIR)/src/proto/grpc/testing/simple_messages.pb.cc $(GENDIR)/src/proto/grpc/testing/simple_messages.grpc.pb.cc
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=generate_mock_code=true:$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/echo_messages.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/echo_messages.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/echo_messages.pb.cc: src/proto/grpc/testing/echo_messages.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/echo_messages.grpc.pb.cc: src/proto/grpc/testing/echo_messages.proto $(GENDIR)/src/proto/grpc/testing/echo_messages.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/empty.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/empty.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/empty.pb.cc: src/proto/grpc/testing/empty.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/empty.grpc.pb.cc: src/proto/grpc/testing/empty.proto $(GENDIR)/src/proto/grpc/testing/empty.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/messages.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/messages.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/messages.pb.cc: src/proto/grpc/testing/messages.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/messages.grpc.pb.cc: src/proto/grpc/testing/messages.proto $(GENDIR)/src/proto/grpc/testing/messages.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/payloads.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/payloads.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/payloads.pb.cc: src/proto/grpc/testing/payloads.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/payloads.grpc.pb.cc: src/proto/grpc/testing/payloads.proto $(GENDIR)/src/proto/grpc/testing/payloads.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/report_qps_scenario_service.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/report_qps_scenario_service.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/report_qps_scenario_service.pb.cc: src/proto/grpc/testing/report_qps_scenario_service.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/control.pb.cc
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/report_qps_scenario_service.grpc.pb.cc: src/proto/grpc/testing/report_qps_scenario_service.proto $(GENDIR)/src/proto/grpc/testing/report_qps_scenario_service.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/control.pb.cc $(GENDIR)/src/proto/grpc/testing/control.grpc.pb.cc
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/simple_messages.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/simple_messages.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/simple_messages.pb.cc: src/proto/grpc/testing/simple_messages.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/simple_messages.grpc.pb.cc: src/proto/grpc/testing/simple_messages.proto $(GENDIR)/src/proto/grpc/testing/simple_messages.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/stats.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/stats.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/stats.pb.cc: src/proto/grpc/testing/stats.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/core/stats.pb.cc
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/stats.grpc.pb.cc: src/proto/grpc/testing/stats.proto $(GENDIR)/src/proto/grpc/testing/stats.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/core/stats.pb.cc $(GENDIR)/src/proto/grpc/core/stats.grpc.pb.cc
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/test.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/test.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/test.pb.cc: src/proto/grpc/testing/test.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/empty.pb.cc $(GENDIR)/src/proto/grpc/testing/messages.pb.cc
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/test.grpc.pb.cc: src/proto/grpc/testing/test.proto $(GENDIR)/src/proto/grpc/testing/test.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/empty.pb.cc $(GENDIR)/src/proto/grpc/testing/empty.grpc.pb.cc $(GENDIR)/src/proto/grpc/testing/messages.pb.cc $(GENDIR)/src/proto/grpc/testing/messages.grpc.pb.cc
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/worker_service.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/worker_service.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/worker_service.pb.cc: src/proto/grpc/testing/worker_service.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/control.pb.cc
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/worker_service.grpc.pb.cc: src/proto/grpc/testing/worker_service.proto $(GENDIR)/src/proto/grpc/testing/worker_service.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/control.pb.cc $(GENDIR)/src/proto/grpc/testing/control.grpc.pb.cc
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/xds/ads_for_test.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/xds/ads_for_test.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/xds/ads_for_test.pb.cc: src/proto/grpc/testing/xds/ads_for_test.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/xds/eds_for_test.pb.cc
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/xds/ads_for_test.grpc.pb.cc: src/proto/grpc/testing/xds/ads_for_test.proto $(GENDIR)/src/proto/grpc/testing/xds/ads_for_test.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/xds/eds_for_test.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/eds_for_test.grpc.pb.cc
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/xds/cds_for_test.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/xds/cds_for_test.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/xds/cds_for_test.pb.cc: src/proto/grpc/testing/xds/cds_for_test.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/xds/cds_for_test.grpc.pb.cc: src/proto/grpc/testing/xds/cds_for_test.proto $(GENDIR)/src/proto/grpc/testing/xds/cds_for_test.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/xds/eds_for_test.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/xds/eds_for_test.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/xds/eds_for_test.pb.cc: src/proto/grpc/testing/xds/eds_for_test.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/xds/eds_for_test.grpc.pb.cc: src/proto/grpc/testing/xds/eds_for_test.proto $(GENDIR)/src/proto/grpc/testing/xds/eds_for_test.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/xds/lds_rds_for_test.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/xds/lds_rds_for_test.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/xds/lds_rds_for_test.pb.cc: src/proto/grpc/testing/xds/lds_rds_for_test.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/xds/cds_for_test.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/eds_for_test.pb.cc
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/xds/lds_rds_for_test.grpc.pb.cc: src/proto/grpc/testing/xds/lds_rds_for_test.proto $(GENDIR)/src/proto/grpc/testing/xds/lds_rds_for_test.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/xds/cds_for_test.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/cds_for_test.grpc.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/eds_for_test.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/eds_for_test.grpc.pb.cc
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/xds/lrs_for_test.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/xds/lrs_for_test.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/xds/lrs_for_test.pb.cc: src/proto/grpc/testing/xds/lrs_for_test.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/xds/eds_for_test.pb.cc
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/xds/lrs_for_test.grpc.pb.cc: src/proto/grpc/testing/xds/lrs_for_test.proto $(GENDIR)/src/proto/grpc/testing/xds/lrs_for_test.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/xds/eds_for_test.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/eds_for_test.grpc.pb.cc
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/xds/orca_load_report_for_test.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/xds/orca_load_report_for_test.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/xds/orca_load_report_for_test.pb.cc: src/proto/grpc/testing/xds/orca_load_report_for_test.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/xds/orca_load_report_for_test.grpc.pb.cc: src/proto/grpc/testing/xds/orca_load_report_for_test.proto $(GENDIR)/src/proto/grpc/testing/xds/orca_load_report_for_test.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/xds/v3/address.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/xds/v3/address.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/xds/v3/address.pb.cc: src/proto/grpc/testing/xds/v3/address.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/xds/v3/address.grpc.pb.cc: src/proto/grpc/testing/xds/v3/address.proto $(GENDIR)/src/proto/grpc/testing/xds/v3/address.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/xds/v3/ads.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/xds/v3/ads.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/xds/v3/ads.pb.cc: src/proto/grpc/testing/xds/v3/ads.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/xds/v3/discovery.pb.cc
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/xds/v3/ads.grpc.pb.cc: src/proto/grpc/testing/xds/v3/ads.proto $(GENDIR)/src/proto/grpc/testing/xds/v3/ads.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/xds/v3/discovery.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/discovery.grpc.pb.cc
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/xds/v3/base.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/xds/v3/base.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/xds/v3/base.pb.cc: src/proto/grpc/testing/xds/v3/base.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/xds/v3/percent.pb.cc
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/xds/v3/base.grpc.pb.cc: src/proto/grpc/testing/xds/v3/base.proto $(GENDIR)/src/proto/grpc/testing/xds/v3/base.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/xds/v3/percent.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/percent.grpc.pb.cc
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/xds/v3/cluster.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/xds/v3/cluster.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/xds/v3/cluster.pb.cc: src/proto/grpc/testing/xds/v3/cluster.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/xds/v3/config_source.pb.cc
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/xds/v3/cluster.grpc.pb.cc: src/proto/grpc/testing/xds/v3/cluster.proto $(GENDIR)/src/proto/grpc/testing/xds/v3/cluster.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/xds/v3/config_source.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/config_source.grpc.pb.cc
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/xds/v3/config_source.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/xds/v3/config_source.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/xds/v3/config_source.pb.cc: src/proto/grpc/testing/xds/v3/config_source.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/xds/v3/config_source.grpc.pb.cc: src/proto/grpc/testing/xds/v3/config_source.proto $(GENDIR)/src/proto/grpc/testing/xds/v3/config_source.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/xds/v3/discovery.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/xds/v3/discovery.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/xds/v3/discovery.pb.cc: src/proto/grpc/testing/xds/v3/discovery.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/xds/v3/base.pb.cc
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/xds/v3/discovery.grpc.pb.cc: src/proto/grpc/testing/xds/v3/discovery.proto $(GENDIR)/src/proto/grpc/testing/xds/v3/discovery.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/xds/v3/base.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/base.grpc.pb.cc
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/xds/v3/endpoint.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/xds/v3/endpoint.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/xds/v3/endpoint.pb.cc: src/proto/grpc/testing/xds/v3/endpoint.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/xds/v3/address.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/base.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/percent.pb.cc
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/xds/v3/endpoint.grpc.pb.cc: src/proto/grpc/testing/xds/v3/endpoint.proto $(GENDIR)/src/proto/grpc/testing/xds/v3/endpoint.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/xds/v3/address.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/address.grpc.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/base.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/base.grpc.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/percent.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/percent.grpc.pb.cc
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/xds/v3/http_connection_manager.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/xds/v3/http_connection_manager.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/xds/v3/http_connection_manager.pb.cc: src/proto/grpc/testing/xds/v3/http_connection_manager.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/xds/v3/config_source.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/route.pb.cc
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/xds/v3/http_connection_manager.grpc.pb.cc: src/proto/grpc/testing/xds/v3/http_connection_manager.proto $(GENDIR)/src/proto/grpc/testing/xds/v3/http_connection_manager.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/xds/v3/config_source.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/config_source.grpc.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/route.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/route.grpc.pb.cc
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/xds/v3/listener.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/xds/v3/listener.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/xds/v3/listener.pb.cc: src/proto/grpc/testing/xds/v3/listener.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/xds/v3/listener.grpc.pb.cc: src/proto/grpc/testing/xds/v3/listener.proto $(GENDIR)/src/proto/grpc/testing/xds/v3/listener.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/xds/v3/load_report.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/xds/v3/load_report.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/xds/v3/load_report.pb.cc: src/proto/grpc/testing/xds/v3/load_report.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/xds/v3/address.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/base.pb.cc
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/xds/v3/load_report.grpc.pb.cc: src/proto/grpc/testing/xds/v3/load_report.proto $(GENDIR)/src/proto/grpc/testing/xds/v3/load_report.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/xds/v3/address.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/address.grpc.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/base.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/base.grpc.pb.cc
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/xds/v3/lrs.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/xds/v3/lrs.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/xds/v3/lrs.pb.cc: src/proto/grpc/testing/xds/v3/lrs.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/xds/v3/base.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/load_report.pb.cc
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/xds/v3/lrs.grpc.pb.cc: src/proto/grpc/testing/xds/v3/lrs.proto $(GENDIR)/src/proto/grpc/testing/xds/v3/lrs.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/xds/v3/base.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/base.grpc.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/load_report.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/load_report.grpc.pb.cc
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/xds/v3/percent.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/xds/v3/percent.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/xds/v3/percent.pb.cc: src/proto/grpc/testing/xds/v3/percent.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/xds/v3/percent.grpc.pb.cc: src/proto/grpc/testing/xds/v3/percent.proto $(GENDIR)/src/proto/grpc/testing/xds/v3/percent.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/xds/v3/range.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/xds/v3/range.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/xds/v3/range.pb.cc: src/proto/grpc/testing/xds/v3/range.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/xds/v3/range.grpc.pb.cc: src/proto/grpc/testing/xds/v3/range.proto $(GENDIR)/src/proto/grpc/testing/xds/v3/range.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/xds/v3/regex.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/xds/v3/regex.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/xds/v3/regex.pb.cc: src/proto/grpc/testing/xds/v3/regex.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/xds/v3/regex.grpc.pb.cc: src/proto/grpc/testing/xds/v3/regex.proto $(GENDIR)/src/proto/grpc/testing/xds/v3/regex.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/src/proto/grpc/testing/xds/v3/route.pb.cc: protoc_dep_error
$(GENDIR)/src/proto/grpc/testing/xds/v3/route.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/src/proto/grpc/testing/xds/v3/route.pb.cc: src/proto/grpc/testing/xds/v3/route.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/xds/v3/base.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/regex.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/percent.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/range.pb.cc
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/src/proto/grpc/testing/xds/v3/route.grpc.pb.cc: src/proto/grpc/testing/xds/v3/route.proto $(GENDIR)/src/proto/grpc/testing/xds/v3/route.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) $(GENDIR)/src/proto/grpc/testing/xds/v3/base.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/base.grpc.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/regex.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/regex.grpc.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/percent.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/percent.grpc.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/range.pb.cc $(GENDIR)/src/proto/grpc/testing/xds/v3/range.grpc.pb.cc
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/test/core/tsi/alts/fake_handshaker/handshaker.pb.cc: protoc_dep_error
$(GENDIR)/test/core/tsi/alts/fake_handshaker/handshaker.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/test/core/tsi/alts/fake_handshaker/handshaker.pb.cc: test/core/tsi/alts/fake_handshaker/handshaker.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/test/core/tsi/alts/fake_handshaker/handshaker.grpc.pb.cc: test/core/tsi/alts/fake_handshaker/handshaker.proto $(GENDIR)/test/core/tsi/alts/fake_handshaker/handshaker.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif

ifeq ($(NO_PROTOC),true)
$(GENDIR)/test/core/tsi/alts/fake_handshaker/transport_security_common.pb.cc: protoc_dep_error
$(GENDIR)/test/core/tsi/alts/fake_handshaker/transport_security_common.grpc.pb.cc: protoc_dep_error
else

$(GENDIR)/test/core/tsi/alts/fake_handshaker/transport_security_common.pb.cc: test/core/tsi/alts/fake_handshaker/transport_security_common.proto $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[PROTOC]  Generating protobuf CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --cpp_out=$(GENDIR) $<

$(GENDIR)/test/core/tsi/alts/fake_handshaker/transport_security_common.grpc.pb.cc: test/core/tsi/alts/fake_handshaker/transport_security_common.proto $(GENDIR)/test/core/tsi/alts/fake_handshaker/transport_security_common.pb.cc $(PROTOBUF_DEP) $(PROTOC_PLUGINS) 
	$(E) "[GRPC]    Generating gRPC's protobuf service CC file from $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(PROTOC) -Ithird_party/protobuf/src -I. --grpc_out=$(GENDIR) --plugin=protoc-gen-grpc=$(PROTOC_PLUGINS_DIR)/grpc_cpp_plugin$(EXECUTABLE_SUFFIX) $<
endif


ifeq ($(CONFIG),stapprof)
src/core/profiling/stap_timers.c: $(GENDIR)/src/core/profiling/stap_probes.h
ifeq ($(HAS_SYSTEMTAP),true)
$(GENDIR)/src/core/profiling/stap_probes.h: src/core/profiling/stap_probes.d
	$(E) "[DTRACE]  Compiling $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(DTRACE) -C -h -s $< -o $@
else
$(GENDIR)/src/core/profiling/stap_probes.h: systemtap_dep_error stop
endif
endif

$(OBJDIR)/$(CONFIG)/%.o : %.c
	$(E) "[C]       Compiling $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(CC) $(CPPFLAGS) $(CFLAGS) -MMD -MF $(addsuffix .dep, $(basename $@)) -c -o $@ $<

$(OBJDIR)/$(CONFIG)/%.o : $(GENDIR)/%.pb.cc
	$(E) "[CXX]     Compiling $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(CXX) $(CPPFLAGS) $(CXXFLAGS) -MMD -MF $(addsuffix .dep, $(basename $@)) -c -o $@ $<

$(OBJDIR)/$(CONFIG)/src/compiler/%.o : src/compiler/%.cc
	$(E) "[HOSTCXX] Compiling $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(HOST_CXX) $(HOST_CXXFLAGS) $(HOST_CPPFLAGS) -MMD -MF $(addsuffix .dep, $(basename $@)) -c -o $@ $<

$(OBJDIR)/$(CONFIG)/src/core/%.o : src/core/%.cc
	$(E) "[CXX]     Compiling $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(CXX) $(CPPFLAGS) $(CXXFLAGS) $(COREFLAGS) -MMD -MF $(addsuffix .dep, $(basename $@)) -c -o $@ $<

$(OBJDIR)/$(CONFIG)/test/core/%.o : test/core/%.cc
	$(E) "[CXX]     Compiling $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(CXX) $(CPPFLAGS) $(CXXFLAGS) $(COREFLAGS) -MMD -MF $(addsuffix .dep, $(basename $@)) -c -o $@ $<

$(OBJDIR)/$(CONFIG)/%.o : %.cc
	$(E) "[CXX]     Compiling $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(CXX) $(CPPFLAGS) $(CXXFLAGS) -MMD -MF $(addsuffix .dep, $(basename $@)) -c -o $@ $<

$(OBJDIR)/$(CONFIG)/%.o : %.cpp
	$(E) "[CXX]     Compiling $<"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(CXX) $(CPPFLAGS) $(CXXFLAGS) -MMD -MF $(addsuffix .dep, $(basename $@)) -c -o $@ $<

install: install_not_supported_error

install_c: install_not_supported_error

install_cxx: install_not_supported_error

install_csharp: install_not_supported_error

install-static: install_not_supported_error

install-certs: install_not_supported_error

clean:
	$(E) "[CLEAN]   Cleaning build directories."
	$(Q) $(RM) -rf $(OBJDIR) $(LIBDIR) $(BINDIR) $(GENDIR) cache.mk


# The various libraries


# start of build recipe for library "address_sorting" (generated by makelib(lib) template function)
LIBADDRESS_SORTING_SRC = \
    third_party/address_sorting/address_sorting.c \
    third_party/address_sorting/address_sorting_posix.c \
    third_party/address_sorting/address_sorting_windows.c \

PUBLIC_HEADERS_C += \

LIBADDRESS_SORTING_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBADDRESS_SORTING_SRC))))


$(LIBDIR)/$(CONFIG)/libaddress_sorting.a:  $(LIBADDRESS_SORTING_OBJS) 
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libaddress_sorting.a
	$(Q) $(AR) $(ARFLAGS) $(LIBDIR)/$(CONFIG)/libaddress_sorting.a $(LIBADDRESS_SORTING_OBJS) 
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib -no_warning_for_no_symbols $(LIBDIR)/$(CONFIG)/libaddress_sorting.a
endif



ifeq ($(SYSTEM),MINGW32)
$(LIBDIR)/$(CONFIG)/address_sorting$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE): $(LIBADDRESS_SORTING_OBJS)  $(ZLIB_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,--output-def=$(LIBDIR)/$(CONFIG)/address_sorting$(SHARED_VERSION_CORE).def -Wl,--out-implib=$(LIBDIR)/$(CONFIG)/libaddress_sorting$(SHARED_VERSION_CORE)-dll.a -o $(LIBDIR)/$(CONFIG)/address_sorting$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBADDRESS_SORTING_OBJS) $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBS)
else
$(LIBDIR)/$(CONFIG)/libaddress_sorting$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE): $(LIBADDRESS_SORTING_OBJS)  $(ZLIB_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
ifeq ($(SYSTEM),Darwin)
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -install_name $(SHARED_PREFIX)address_sorting$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) -dynamiclib -o $(LIBDIR)/$(CONFIG)/libaddress_sorting$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBADDRESS_SORTING_OBJS) $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBS)
else
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,-soname,libaddress_sorting.so.12 -o $(LIBDIR)/$(CONFIG)/libaddress_sorting$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBADDRESS_SORTING_OBJS) $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBS)
	$(Q) ln -sf $(SHARED_PREFIX)address_sorting$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/libaddress_sorting$(SHARED_VERSION_CORE).so.12
	$(Q) ln -sf $(SHARED_PREFIX)address_sorting$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/libaddress_sorting$(SHARED_VERSION_CORE).so
endif
endif

ifneq ($(NO_DEPS),true)
-include $(LIBADDRESS_SORTING_OBJS:.o=.dep)
endif
# end of build recipe for library "address_sorting"


# start of build recipe for library "gpr" (generated by makelib(lib) template function)
LIBGPR_SRC = \
    src/core/lib/gpr/alloc.cc \
    src/core/lib/gpr/atm.cc \
    src/core/lib/gpr/cpu_iphone.cc \
    src/core/lib/gpr/cpu_linux.cc \
    src/core/lib/gpr/cpu_posix.cc \
    src/core/lib/gpr/cpu_windows.cc \
    src/core/lib/gpr/env_linux.cc \
    src/core/lib/gpr/env_posix.cc \
    src/core/lib/gpr/env_windows.cc \
    src/core/lib/gpr/log.cc \
    src/core/lib/gpr/log_android.cc \
    src/core/lib/gpr/log_linux.cc \
    src/core/lib/gpr/log_posix.cc \
    src/core/lib/gpr/log_windows.cc \
    src/core/lib/gpr/murmur_hash.cc \
    src/core/lib/gpr/string.cc \
    src/core/lib/gpr/string_posix.cc \
    src/core/lib/gpr/string_util_windows.cc \
    src/core/lib/gpr/string_windows.cc \
    src/core/lib/gpr/sync.cc \
    src/core/lib/gpr/sync_abseil.cc \
    src/core/lib/gpr/sync_posix.cc \
    src/core/lib/gpr/sync_windows.cc \
    src/core/lib/gpr/time.cc \
    src/core/lib/gpr/time_posix.cc \
    src/core/lib/gpr/time_precise.cc \
    src/core/lib/gpr/time_windows.cc \
    src/core/lib/gpr/tls_pthread.cc \
    src/core/lib/gpr/tmpfile_msys.cc \
    src/core/lib/gpr/tmpfile_posix.cc \
    src/core/lib/gpr/tmpfile_windows.cc \
    src/core/lib/gpr/wrap_memcpy.cc \
    src/core/lib/gprpp/arena.cc \
    src/core/lib/gprpp/fork.cc \
    src/core/lib/gprpp/global_config_env.cc \
    src/core/lib/gprpp/host_port.cc \
    src/core/lib/gprpp/mpscq.cc \
    src/core/lib/gprpp/thd_posix.cc \
    src/core/lib/gprpp/thd_windows.cc \
    src/core/lib/profiling/basic_timers.cc \
    src/core/lib/profiling/stap_timers.cc \

PUBLIC_HEADERS_C += \
    include/grpc/impl/codegen/atm.h \
    include/grpc/impl/codegen/atm_gcc_atomic.h \
    include/grpc/impl/codegen/atm_gcc_sync.h \
    include/grpc/impl/codegen/atm_windows.h \
    include/grpc/impl/codegen/byte_buffer.h \
    include/grpc/impl/codegen/byte_buffer_reader.h \
    include/grpc/impl/codegen/compression_types.h \
    include/grpc/impl/codegen/connectivity_state.h \
    include/grpc/impl/codegen/fork.h \
    include/grpc/impl/codegen/gpr_slice.h \
    include/grpc/impl/codegen/gpr_types.h \
    include/grpc/impl/codegen/grpc_types.h \
    include/grpc/impl/codegen/log.h \
    include/grpc/impl/codegen/port_platform.h \
    include/grpc/impl/codegen/propagation_bits.h \
    include/grpc/impl/codegen/slice.h \
    include/grpc/impl/codegen/status.h \
    include/grpc/impl/codegen/sync.h \
    include/grpc/impl/codegen/sync_abseil.h \
    include/grpc/impl/codegen/sync_custom.h \
    include/grpc/impl/codegen/sync_generic.h \
    include/grpc/impl/codegen/sync_posix.h \
    include/grpc/impl/codegen/sync_windows.h \
    include/grpc/support/alloc.h \
    include/grpc/support/atm.h \
    include/grpc/support/atm_gcc_atomic.h \
    include/grpc/support/atm_gcc_sync.h \
    include/grpc/support/atm_windows.h \
    include/grpc/support/cpu.h \
    include/grpc/support/log.h \
    include/grpc/support/log_windows.h \
    include/grpc/support/port_platform.h \
    include/grpc/support/string_util.h \
    include/grpc/support/sync.h \
    include/grpc/support/sync_abseil.h \
    include/grpc/support/sync_custom.h \
    include/grpc/support/sync_generic.h \
    include/grpc/support/sync_posix.h \
    include/grpc/support/sync_windows.h \
    include/grpc/support/thd_id.h \
    include/grpc/support/time.h \

LIBGPR_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBGPR_SRC))))


$(LIBDIR)/$(CONFIG)/libgpr.a: $(ZLIB_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP)  $(LIBGPR_OBJS) 
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libgpr.a
	$(Q) $(AR) $(ARFLAGS) $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBGPR_OBJS) 
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib -no_warning_for_no_symbols $(LIBDIR)/$(CONFIG)/libgpr.a
endif



ifeq ($(SYSTEM),MINGW32)
$(LIBDIR)/$(CONFIG)/gpr$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE): $(LIBGPR_OBJS)  $(ZLIB_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,--output-def=$(LIBDIR)/$(CONFIG)/gpr$(SHARED_VERSION_CORE).def -Wl,--out-implib=$(LIBDIR)/$(CONFIG)/libgpr$(SHARED_VERSION_CORE)-dll.a -o $(LIBDIR)/$(CONFIG)/gpr$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBGPR_OBJS) $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBS)
else
$(LIBDIR)/$(CONFIG)/libgpr$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE): $(LIBGPR_OBJS)  $(ZLIB_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
ifeq ($(SYSTEM),Darwin)
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -install_name $(SHARED_PREFIX)gpr$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) -dynamiclib -o $(LIBDIR)/$(CONFIG)/libgpr$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBGPR_OBJS) $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBS)
else
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,-soname,libgpr.so.12 -o $(LIBDIR)/$(CONFIG)/libgpr$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBGPR_OBJS) $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBS)
	$(Q) ln -sf $(SHARED_PREFIX)gpr$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/libgpr$(SHARED_VERSION_CORE).so.12
	$(Q) ln -sf $(SHARED_PREFIX)gpr$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/libgpr$(SHARED_VERSION_CORE).so
endif
endif

ifneq ($(NO_DEPS),true)
-include $(LIBGPR_OBJS:.o=.dep)
endif
# end of build recipe for library "gpr"


# start of build recipe for library "grpc" (generated by makelib(lib) template function)
LIBGRPC_SRC = \
    src/core/ext/filters/census/grpc_context.cc \
    src/core/ext/filters/client_channel/backend_metric.cc \
    src/core/ext/filters/client_channel/backup_poller.cc \
    src/core/ext/filters/client_channel/channel_connectivity.cc \
    src/core/ext/filters/client_channel/client_channel.cc \
    src/core/ext/filters/client_channel/client_channel_channelz.cc \
    src/core/ext/filters/client_channel/client_channel_factory.cc \
    src/core/ext/filters/client_channel/client_channel_plugin.cc \
    src/core/ext/filters/client_channel/config_selector.cc \
    src/core/ext/filters/client_channel/global_subchannel_pool.cc \
    src/core/ext/filters/client_channel/health/health_check_client.cc \
    src/core/ext/filters/client_channel/http_connect_handshaker.cc \
    src/core/ext/filters/client_channel/http_proxy.cc \
    src/core/ext/filters/client_channel/lb_policy.cc \
    src/core/ext/filters/client_channel/lb_policy/address_filtering.cc \
    src/core/ext/filters/client_channel/lb_policy/child_policy_handler.cc \
    src/core/ext/filters/client_channel/lb_policy/grpclb/client_load_reporting_filter.cc \
    src/core/ext/filters/client_channel/lb_policy/grpclb/grpclb.cc \
    src/core/ext/filters/client_channel/lb_policy/grpclb/grpclb_balancer_addresses.cc \
    src/core/ext/filters/client_channel/lb_policy/grpclb/grpclb_channel_secure.cc \
    src/core/ext/filters/client_channel/lb_policy/grpclb/grpclb_client_stats.cc \
    src/core/ext/filters/client_channel/lb_policy/grpclb/load_balancer_api.cc \
    src/core/ext/filters/client_channel/lb_policy/pick_first/pick_first.cc \
    src/core/ext/filters/client_channel/lb_policy/priority/priority.cc \
    src/core/ext/filters/client_channel/lb_policy/round_robin/round_robin.cc \
    src/core/ext/filters/client_channel/lb_policy/weighted_target/weighted_target.cc \
    src/core/ext/filters/client_channel/lb_policy/xds/cds.cc \
    src/core/ext/filters/client_channel/lb_policy/xds/eds.cc \
    src/core/ext/filters/client_channel/lb_policy/xds/lrs.cc \
    src/core/ext/filters/client_channel/lb_policy/xds/xds_routing.cc \
    src/core/ext/filters/client_channel/lb_policy_registry.cc \
    src/core/ext/filters/client_channel/local_subchannel_pool.cc \
    src/core/ext/filters/client_channel/proxy_mapper_registry.cc \
    src/core/ext/filters/client_channel/resolver.cc \
    src/core/ext/filters/client_channel/resolver/dns/c_ares/dns_resolver_ares.cc \
    src/core/ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_ev_driver.cc \
    src/core/ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_ev_driver_libuv.cc \
    src/core/ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_ev_driver_posix.cc \
    src/core/ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_ev_driver_windows.cc \
    src/core/ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_wrapper.cc \
    src/core/ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_wrapper_fallback.cc \
    src/core/ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_wrapper_libuv.cc \
    src/core/ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_wrapper_posix.cc \
    src/core/ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_wrapper_windows.cc \
    src/core/ext/filters/client_channel/resolver/dns/dns_resolver_selection.cc \
    src/core/ext/filters/client_channel/resolver/dns/native/dns_resolver.cc \
    src/core/ext/filters/client_channel/resolver/fake/fake_resolver.cc \
    src/core/ext/filters/client_channel/resolver/sockaddr/sockaddr_resolver.cc \
    src/core/ext/filters/client_channel/resolver/xds/xds_resolver.cc \
    src/core/ext/filters/client_channel/resolver_registry.cc \
    src/core/ext/filters/client_channel/resolver_result_parsing.cc \
    src/core/ext/filters/client_channel/resolving_lb_policy.cc \
    src/core/ext/filters/client_channel/retry_throttle.cc \
    src/core/ext/filters/client_channel/server_address.cc \
    src/core/ext/filters/client_channel/service_config.cc \
    src/core/ext/filters/client_channel/service_config_channel_arg_filter.cc \
    src/core/ext/filters/client_channel/service_config_parser.cc \
    src/core/ext/filters/client_channel/subchannel.cc \
    src/core/ext/filters/client_channel/subchannel_pool_interface.cc \
    src/core/ext/filters/client_idle/client_idle_filter.cc \
    src/core/ext/filters/deadline/deadline_filter.cc \
    src/core/ext/filters/http/client/http_client_filter.cc \
    src/core/ext/filters/http/client_authority_filter.cc \
    src/core/ext/filters/http/http_filters_plugin.cc \
    src/core/ext/filters/http/message_compress/message_compress_filter.cc \
    src/core/ext/filters/http/message_compress/message_decompress_filter.cc \
    src/core/ext/filters/http/server/http_server_filter.cc \
    src/core/ext/filters/max_age/max_age_filter.cc \
    src/core/ext/filters/message_size/message_size_filter.cc \
    src/core/ext/filters/workarounds/workaround_cronet_compression_filter.cc \
    src/core/ext/filters/workarounds/workaround_utils.cc \
    src/core/ext/transport/chttp2/alpn/alpn.cc \
    src/core/ext/transport/chttp2/client/authority.cc \
    src/core/ext/transport/chttp2/client/chttp2_connector.cc \
    src/core/ext/transport/chttp2/client/insecure/channel_create.cc \
    src/core/ext/transport/chttp2/client/insecure/channel_create_posix.cc \
    src/core/ext/transport/chttp2/client/secure/secure_channel_create.cc \
    src/core/ext/transport/chttp2/server/chttp2_server.cc \
    src/core/ext/transport/chttp2/server/insecure/server_chttp2.cc \
    src/core/ext/transport/chttp2/server/insecure/server_chttp2_posix.cc \
    src/core/ext/transport/chttp2/server/secure/server_secure_chttp2.cc \
    src/core/ext/transport/chttp2/transport/bin_decoder.cc \
    src/core/ext/transport/chttp2/transport/bin_encoder.cc \
    src/core/ext/transport/chttp2/transport/chttp2_plugin.cc \
    src/core/ext/transport/chttp2/transport/chttp2_transport.cc \
    src/core/ext/transport/chttp2/transport/context_list.cc \
    src/core/ext/transport/chttp2/transport/flow_control.cc \
    src/core/ext/transport/chttp2/transport/frame_data.cc \
    src/core/ext/transport/chttp2/transport/frame_goaway.cc \
    src/core/ext/transport/chttp2/transport/frame_ping.cc \
    src/core/ext/transport/chttp2/transport/frame_rst_stream.cc \
    src/core/ext/transport/chttp2/transport/frame_settings.cc \
    src/core/ext/transport/chttp2/transport/frame_window_update.cc \
    src/core/ext/transport/chttp2/transport/hpack_encoder.cc \
    src/core/ext/transport/chttp2/transport/hpack_parser.cc \
    src/core/ext/transport/chttp2/transport/hpack_table.cc \
    src/core/ext/transport/chttp2/transport/http2_settings.cc \
    src/core/ext/transport/chttp2/transport/huffsyms.cc \
    src/core/ext/transport/chttp2/transport/incoming_metadata.cc \
    src/core/ext/transport/chttp2/transport/parsing.cc \
    src/core/ext/transport/chttp2/transport/stream_lists.cc \
    src/core/ext/transport/chttp2/transport/stream_map.cc \
    src/core/ext/transport/chttp2/transport/varint.cc \
    src/core/ext/transport/chttp2/transport/writing.cc \
    src/core/ext/transport/inproc/inproc_plugin.cc \
    src/core/ext/transport/inproc/inproc_transport.cc \
    src/core/ext/upb-generated/envoy/annotations/deprecation.upb.c \
    src/core/ext/upb-generated/envoy/annotations/resource.upb.c \
    src/core/ext/upb-generated/envoy/config/accesslog/v3/accesslog.upb.c \
    src/core/ext/upb-generated/envoy/config/cluster/v3/circuit_breaker.upb.c \
    src/core/ext/upb-generated/envoy/config/cluster/v3/cluster.upb.c \
    src/core/ext/upb-generated/envoy/config/cluster/v3/filter.upb.c \
    src/core/ext/upb-generated/envoy/config/cluster/v3/outlier_detection.upb.c \
    src/core/ext/upb-generated/envoy/config/core/v3/address.upb.c \
    src/core/ext/upb-generated/envoy/config/core/v3/backoff.upb.c \
    src/core/ext/upb-generated/envoy/config/core/v3/base.upb.c \
    src/core/ext/upb-generated/envoy/config/core/v3/config_source.upb.c \
    src/core/ext/upb-generated/envoy/config/core/v3/event_service_config.upb.c \
    src/core/ext/upb-generated/envoy/config/core/v3/grpc_service.upb.c \
    src/core/ext/upb-generated/envoy/config/core/v3/health_check.upb.c \
    src/core/ext/upb-generated/envoy/config/core/v3/http_uri.upb.c \
    src/core/ext/upb-generated/envoy/config/core/v3/protocol.upb.c \
    src/core/ext/upb-generated/envoy/config/core/v3/proxy_protocol.upb.c \
    src/core/ext/upb-generated/envoy/config/core/v3/socket_option.upb.c \
    src/core/ext/upb-generated/envoy/config/endpoint/v3/endpoint.upb.c \
    src/core/ext/upb-generated/envoy/config/endpoint/v3/endpoint_components.upb.c \
    src/core/ext/upb-generated/envoy/config/endpoint/v3/load_report.upb.c \
    src/core/ext/upb-generated/envoy/config/listener/v3/api_listener.upb.c \
    src/core/ext/upb-generated/envoy/config/listener/v3/listener.upb.c \
    src/core/ext/upb-generated/envoy/config/listener/v3/listener_components.upb.c \
    src/core/ext/upb-generated/envoy/config/listener/v3/udp_listener_config.upb.c \
    src/core/ext/upb-generated/envoy/config/rbac/v3/rbac.upb.c \
    src/core/ext/upb-generated/envoy/config/route/v3/route.upb.c \
    src/core/ext/upb-generated/envoy/config/route/v3/route_components.upb.c \
    src/core/ext/upb-generated/envoy/config/route/v3/scoped_route.upb.c \
    src/core/ext/upb-generated/envoy/config/trace/v3/http_tracer.upb.c \
    src/core/ext/upb-generated/envoy/extensions/filters/network/http_connection_manager/v3/http_connection_manager.upb.c \
    src/core/ext/upb-generated/envoy/extensions/transport_sockets/tls/v3/cert.upb.c \
    src/core/ext/upb-generated/envoy/extensions/transport_sockets/tls/v3/common.upb.c \
    src/core/ext/upb-generated/envoy/extensions/transport_sockets/tls/v3/secret.upb.c \
    src/core/ext/upb-generated/envoy/extensions/transport_sockets/tls/v3/tls.upb.c \
    src/core/ext/upb-generated/envoy/service/cluster/v3/cds.upb.c \
    src/core/ext/upb-generated/envoy/service/discovery/v3/ads.upb.c \
    src/core/ext/upb-generated/envoy/service/discovery/v3/discovery.upb.c \
    src/core/ext/upb-generated/envoy/service/endpoint/v3/eds.upb.c \
    src/core/ext/upb-generated/envoy/service/listener/v3/lds.upb.c \
    src/core/ext/upb-generated/envoy/service/load_stats/v3/lrs.upb.c \
    src/core/ext/upb-generated/envoy/service/route/v3/rds.upb.c \
    src/core/ext/upb-generated/envoy/service/route/v3/srds.upb.c \
    src/core/ext/upb-generated/envoy/type/matcher/v3/metadata.upb.c \
    src/core/ext/upb-generated/envoy/type/matcher/v3/number.upb.c \
    src/core/ext/upb-generated/envoy/type/matcher/v3/path.upb.c \
    src/core/ext/upb-generated/envoy/type/matcher/v3/regex.upb.c \
    src/core/ext/upb-generated/envoy/type/matcher/v3/string.upb.c \
    src/core/ext/upb-generated/envoy/type/matcher/v3/value.upb.c \
    src/core/ext/upb-generated/envoy/type/metadata/v3/metadata.upb.c \
    src/core/ext/upb-generated/envoy/type/tracing/v3/custom_tag.upb.c \
    src/core/ext/upb-generated/envoy/type/v3/http.upb.c \
    src/core/ext/upb-generated/envoy/type/v3/percent.upb.c \
    src/core/ext/upb-generated/envoy/type/v3/range.upb.c \
    src/core/ext/upb-generated/envoy/type/v3/semantic_version.upb.c \
    src/core/ext/upb-generated/gogoproto/gogo.upb.c \
    src/core/ext/upb-generated/google/api/annotations.upb.c \
    src/core/ext/upb-generated/google/api/expr/v1alpha1/syntax.upb.c \
    src/core/ext/upb-generated/google/api/http.upb.c \
    src/core/ext/upb-generated/google/protobuf/any.upb.c \
    src/core/ext/upb-generated/google/protobuf/descriptor.upb.c \
    src/core/ext/upb-generated/google/protobuf/duration.upb.c \
    src/core/ext/upb-generated/google/protobuf/empty.upb.c \
    src/core/ext/upb-generated/google/protobuf/struct.upb.c \
    src/core/ext/upb-generated/google/protobuf/timestamp.upb.c \
    src/core/ext/upb-generated/google/protobuf/wrappers.upb.c \
    src/core/ext/upb-generated/google/rpc/status.upb.c \
    src/core/ext/upb-generated/src/proto/grpc/gcp/altscontext.upb.c \
    src/core/ext/upb-generated/src/proto/grpc/gcp/handshaker.upb.c \
    src/core/ext/upb-generated/src/proto/grpc/gcp/transport_security_common.upb.c \
    src/core/ext/upb-generated/src/proto/grpc/health/v1/health.upb.c \
    src/core/ext/upb-generated/src/proto/grpc/lb/v1/load_balancer.upb.c \
    src/core/ext/upb-generated/udpa/annotations/migrate.upb.c \
    src/core/ext/upb-generated/udpa/annotations/sensitive.upb.c \
    src/core/ext/upb-generated/udpa/annotations/status.upb.c \
    src/core/ext/upb-generated/udpa/annotations/versioning.upb.c \
    src/core/ext/upb-generated/udpa/data/orca/v1/orca_load_report.upb.c \
    src/core/ext/upb-generated/validate/validate.upb.c \
    src/core/ext/xds/xds_api.cc \
    src/core/ext/xds/xds_bootstrap.cc \
    src/core/ext/xds/xds_channel_secure.cc \
    src/core/ext/xds/xds_client.cc \
    src/core/ext/xds/xds_client_stats.cc \
    src/core/lib/avl/avl.cc \
    src/core/lib/backoff/backoff.cc \
    src/core/lib/channel/channel_args.cc \
    src/core/lib/channel/channel_stack.cc \
    src/core/lib/channel/channel_stack_builder.cc \
    src/core/lib/channel/channel_trace.cc \
    src/core/lib/channel/channelz.cc \
    src/core/lib/channel/channelz_registry.cc \
    src/core/lib/channel/connected_channel.cc \
    src/core/lib/channel/handshaker.cc \
    src/core/lib/channel/handshaker_registry.cc \
    src/core/lib/channel/status_util.cc \
    src/core/lib/compression/compression.cc \
    src/core/lib/compression/compression_args.cc \
    src/core/lib/compression/compression_internal.cc \
    src/core/lib/compression/message_compress.cc \
    src/core/lib/compression/stream_compression.cc \
    src/core/lib/compression/stream_compression_gzip.cc \
    src/core/lib/compression/stream_compression_identity.cc \
    src/core/lib/debug/stats.cc \
    src/core/lib/debug/stats_data.cc \
    src/core/lib/debug/trace.cc \
    src/core/lib/http/format_request.cc \
    src/core/lib/http/httpcli.cc \
    src/core/lib/http/httpcli_security_connector.cc \
    src/core/lib/http/parser.cc \
    src/core/lib/iomgr/buffer_list.cc \
    src/core/lib/iomgr/call_combiner.cc \
    src/core/lib/iomgr/cfstream_handle.cc \
    src/core/lib/iomgr/combiner.cc \
    src/core/lib/iomgr/dualstack_socket_posix.cc \
    src/core/lib/iomgr/endpoint.cc \
    src/core/lib/iomgr/endpoint_cfstream.cc \
    src/core/lib/iomgr/endpoint_pair_posix.cc \
    src/core/lib/iomgr/endpoint_pair_uv.cc \
    src/core/lib/iomgr/endpoint_pair_windows.cc \
    src/core/lib/iomgr/error.cc \
    src/core/lib/iomgr/error_cfstream.cc \
    src/core/lib/iomgr/ev_apple.cc \
    src/core/lib/iomgr/ev_epoll1_linux.cc \
    src/core/lib/iomgr/ev_epollex_linux.cc \
    src/core/lib/iomgr/ev_poll_posix.cc \
    src/core/lib/iomgr/ev_posix.cc \
    src/core/lib/iomgr/ev_windows.cc \
    src/core/lib/iomgr/exec_ctx.cc \
    src/core/lib/iomgr/executor.cc \
    src/core/lib/iomgr/executor/mpmcqueue.cc \
    src/core/lib/iomgr/executor/threadpool.cc \
    src/core/lib/iomgr/fork_posix.cc \
    src/core/lib/iomgr/fork_windows.cc \
    src/core/lib/iomgr/gethostname_fallback.cc \
    src/core/lib/iomgr/gethostname_host_name_max.cc \
    src/core/lib/iomgr/gethostname_sysconf.cc \
    src/core/lib/iomgr/grpc_if_nametoindex_posix.cc \
    src/core/lib/iomgr/grpc_if_nametoindex_unsupported.cc \
    src/core/lib/iomgr/internal_errqueue.cc \
    src/core/lib/iomgr/iocp_windows.cc \
    src/core/lib/iomgr/iomgr.cc \
    src/core/lib/iomgr/iomgr_custom.cc \
    src/core/lib/iomgr/iomgr_internal.cc \
    src/core/lib/iomgr/iomgr_posix.cc \
    src/core/lib/iomgr/iomgr_posix_cfstream.cc \
    src/core/lib/iomgr/iomgr_uv.cc \
    src/core/lib/iomgr/iomgr_windows.cc \
    src/core/lib/iomgr/is_epollexclusive_available.cc \
    src/core/lib/iomgr/load_file.cc \
    src/core/lib/iomgr/lockfree_event.cc \
    src/core/lib/iomgr/parse_address.cc \
    src/core/lib/iomgr/poller/eventmanager_libuv.cc \
    src/core/lib/iomgr/polling_entity.cc \
    src/core/lib/iomgr/pollset.cc \
    src/core/lib/iomgr/pollset_custom.cc \
    src/core/lib/iomgr/pollset_set.cc \
    src/core/lib/iomgr/pollset_set_custom.cc \
    src/core/lib/iomgr/pollset_set_windows.cc \
    src/core/lib/iomgr/pollset_uv.cc \
    src/core/lib/iomgr/pollset_windows.cc \
    src/core/lib/iomgr/resolve_address.cc \
    src/core/lib/iomgr/resolve_address_custom.cc \
    src/core/lib/iomgr/resolve_address_posix.cc \
    src/core/lib/iomgr/resolve_address_windows.cc \
    src/core/lib/iomgr/resource_quota.cc \
    src/core/lib/iomgr/sockaddr_utils.cc \
    src/core/lib/iomgr/socket_factory_posix.cc \
    src/core/lib/iomgr/socket_mutator.cc \
    src/core/lib/iomgr/socket_utils_common_posix.cc \
    src/core/lib/iomgr/socket_utils_linux.cc \
    src/core/lib/iomgr/socket_utils_posix.cc \
    src/core/lib/iomgr/socket_utils_uv.cc \
    src/core/lib/iomgr/socket_utils_windows.cc \
    src/core/lib/iomgr/socket_windows.cc \
    src/core/lib/iomgr/tcp_client.cc \
    src/core/lib/iomgr/tcp_client_cfstream.cc \
    src/core/lib/iomgr/tcp_client_custom.cc \
    src/core/lib/iomgr/tcp_client_posix.cc \
    src/core/lib/iomgr/tcp_client_windows.cc \
    src/core/lib/iomgr/tcp_custom.cc \
    src/core/lib/iomgr/tcp_posix.cc \
    src/core/lib/iomgr/tcp_server.cc \
    src/core/lib/iomgr/tcp_server_custom.cc \
    src/core/lib/iomgr/tcp_server_posix.cc \
    src/core/lib/iomgr/tcp_server_utils_posix_common.cc \
    src/core/lib/iomgr/tcp_server_utils_posix_ifaddrs.cc \
    src/core/lib/iomgr/tcp_server_utils_posix_noifaddrs.cc \
    src/core/lib/iomgr/tcp_server_windows.cc \
    src/core/lib/iomgr/tcp_uv.cc \
    src/core/lib/iomgr/tcp_windows.cc \
    src/core/lib/iomgr/time_averaged_stats.cc \
    src/core/lib/iomgr/timer.cc \
    src/core/lib/iomgr/timer_custom.cc \
    src/core/lib/iomgr/timer_generic.cc \
    src/core/lib/iomgr/timer_heap.cc \
    src/core/lib/iomgr/timer_manager.cc \
    src/core/lib/iomgr/timer_uv.cc \
    src/core/lib/iomgr/udp_server.cc \
    src/core/lib/iomgr/unix_sockets_posix.cc \
    src/core/lib/iomgr/unix_sockets_posix_noop.cc \
    src/core/lib/iomgr/wakeup_fd_eventfd.cc \
    src/core/lib/iomgr/wakeup_fd_nospecial.cc \
    src/core/lib/iomgr/wakeup_fd_pipe.cc \
    src/core/lib/iomgr/wakeup_fd_posix.cc \
    src/core/lib/iomgr/work_serializer.cc \
    src/core/lib/json/json_reader.cc \
    src/core/lib/json/json_writer.cc \
    src/core/lib/security/authorization/authorization_engine.cc \
    src/core/lib/security/authorization/evaluate_args.cc \
    src/core/lib/security/context/security_context.cc \
    src/core/lib/security/credentials/alts/alts_credentials.cc \
    src/core/lib/security/credentials/alts/check_gcp_environment.cc \
    src/core/lib/security/credentials/alts/check_gcp_environment_linux.cc \
    src/core/lib/security/credentials/alts/check_gcp_environment_no_op.cc \
    src/core/lib/security/credentials/alts/check_gcp_environment_windows.cc \
    src/core/lib/security/credentials/alts/grpc_alts_credentials_client_options.cc \
    src/core/lib/security/credentials/alts/grpc_alts_credentials_options.cc \
    src/core/lib/security/credentials/alts/grpc_alts_credentials_server_options.cc \
    src/core/lib/security/credentials/composite/composite_credentials.cc \
    src/core/lib/security/credentials/credentials.cc \
    src/core/lib/security/credentials/credentials_metadata.cc \
    src/core/lib/security/credentials/fake/fake_credentials.cc \
    src/core/lib/security/credentials/google_default/credentials_generic.cc \
    src/core/lib/security/credentials/google_default/google_default_credentials.cc \
    src/core/lib/security/credentials/iam/iam_credentials.cc \
    src/core/lib/security/credentials/jwt/json_token.cc \
    src/core/lib/security/credentials/jwt/jwt_credentials.cc \
    src/core/lib/security/credentials/jwt/jwt_verifier.cc \
    src/core/lib/security/credentials/local/local_credentials.cc \
    src/core/lib/security/credentials/oauth2/oauth2_credentials.cc \
    src/core/lib/security/credentials/plugin/plugin_credentials.cc \
    src/core/lib/security/credentials/ssl/ssl_credentials.cc \
    src/core/lib/security/credentials/tls/grpc_tls_credentials_options.cc \
    src/core/lib/security/credentials/tls/tls_credentials.cc \
    src/core/lib/security/security_connector/alts/alts_security_connector.cc \
    src/core/lib/security/security_connector/fake/fake_security_connector.cc \
    src/core/lib/security/security_connector/load_system_roots_fallback.cc \
    src/core/lib/security/security_connector/load_system_roots_linux.cc \
    src/core/lib/security/security_connector/local/local_security_connector.cc \
    src/core/lib/security/security_connector/security_connector.cc \
    src/core/lib/security/security_connector/ssl/ssl_security_connector.cc \
    src/core/lib/security/security_connector/ssl_utils.cc \
    src/core/lib/security/security_connector/ssl_utils_config.cc \
    src/core/lib/security/security_connector/tls/tls_security_connector.cc \
    src/core/lib/security/transport/client_auth_filter.cc \
    src/core/lib/security/transport/secure_endpoint.cc \
    src/core/lib/security/transport/security_handshaker.cc \
    src/core/lib/security/transport/server_auth_filter.cc \
    src/core/lib/security/transport/tsi_error.cc \
    src/core/lib/security/util/json_util.cc \
    src/core/lib/slice/b64.cc \
    src/core/lib/slice/percent_encoding.cc \
    src/core/lib/slice/slice.cc \
    src/core/lib/slice/slice_buffer.cc \
    src/core/lib/slice/slice_intern.cc \
    src/core/lib/slice/slice_string_helpers.cc \
    src/core/lib/surface/api_trace.cc \
    src/core/lib/surface/byte_buffer.cc \
    src/core/lib/surface/byte_buffer_reader.cc \
    src/core/lib/surface/call.cc \
    src/core/lib/surface/call_details.cc \
    src/core/lib/surface/call_log_batch.cc \
    src/core/lib/surface/channel.cc \
    src/core/lib/surface/channel_init.cc \
    src/core/lib/surface/channel_ping.cc \
    src/core/lib/surface/channel_stack_type.cc \
    src/core/lib/surface/completion_queue.cc \
    src/core/lib/surface/completion_queue_factory.cc \
    src/core/lib/surface/event_string.cc \
    src/core/lib/surface/init.cc \
    src/core/lib/surface/init_secure.cc \
    src/core/lib/surface/lame_client.cc \
    src/core/lib/surface/metadata_array.cc \
    src/core/lib/surface/server.cc \
    src/core/lib/surface/validate_metadata.cc \
    src/core/lib/surface/version.cc \
    src/core/lib/transport/authority_override.cc \
    src/core/lib/transport/bdp_estimator.cc \
    src/core/lib/transport/byte_stream.cc \
    src/core/lib/transport/connectivity_state.cc \
    src/core/lib/transport/error_utils.cc \
    src/core/lib/transport/metadata.cc \
    src/core/lib/transport/metadata_batch.cc \
    src/core/lib/transport/pid_controller.cc \
    src/core/lib/transport/static_metadata.cc \
    src/core/lib/transport/status_conversion.cc \
    src/core/lib/transport/status_metadata.cc \
    src/core/lib/transport/timeout_encoding.cc \
    src/core/lib/transport/transport.cc \
    src/core/lib/transport/transport_op_string.cc \
    src/core/lib/uri/uri_parser.cc \
    src/core/plugin_registry/grpc_plugin_registry.cc \
    src/core/tsi/alts/crypt/aes_gcm.cc \
    src/core/tsi/alts/crypt/gsec.cc \
    src/core/tsi/alts/frame_protector/alts_counter.cc \
    src/core/tsi/alts/frame_protector/alts_crypter.cc \
    src/core/tsi/alts/frame_protector/alts_frame_protector.cc \
    src/core/tsi/alts/frame_protector/alts_record_protocol_crypter_common.cc \
    src/core/tsi/alts/frame_protector/alts_seal_privacy_integrity_crypter.cc \
    src/core/tsi/alts/frame_protector/alts_unseal_privacy_integrity_crypter.cc \
    src/core/tsi/alts/frame_protector/frame_handler.cc \
    src/core/tsi/alts/handshaker/alts_handshaker_client.cc \
    src/core/tsi/alts/handshaker/alts_shared_resource.cc \
    src/core/tsi/alts/handshaker/alts_tsi_handshaker.cc \
    src/core/tsi/alts/handshaker/alts_tsi_utils.cc \
    src/core/tsi/alts/handshaker/transport_security_common_api.cc \
    src/core/tsi/alts/zero_copy_frame_protector/alts_grpc_integrity_only_record_protocol.cc \
    src/core/tsi/alts/zero_copy_frame_protector/alts_grpc_privacy_integrity_record_protocol.cc \
    src/core/tsi/alts/zero_copy_frame_protector/alts_grpc_record_protocol_common.cc \
    src/core/tsi/alts/zero_copy_frame_protector/alts_iovec_record_protocol.cc \
    src/core/tsi/alts/zero_copy_frame_protector/alts_zero_copy_grpc_protector.cc \
    src/core/tsi/fake_transport_security.cc \
    src/core/tsi/local_transport_security.cc \
    src/core/tsi/ssl/session_cache/ssl_session_boringssl.cc \
    src/core/tsi/ssl/session_cache/ssl_session_cache.cc \
    src/core/tsi/ssl/session_cache/ssl_session_openssl.cc \
    src/core/tsi/ssl_transport_security.cc \
    src/core/tsi/transport_security.cc \
    src/core/tsi/transport_security_grpc.cc \

PUBLIC_HEADERS_C += \
    include/grpc/byte_buffer.h \
    include/grpc/byte_buffer_reader.h \
    include/grpc/census.h \
    include/grpc/compression.h \
    include/grpc/fork.h \
    include/grpc/grpc.h \
    include/grpc/grpc_posix.h \
    include/grpc/grpc_security.h \
    include/grpc/grpc_security_constants.h \
    include/grpc/load_reporting.h \
    include/grpc/slice.h \
    include/grpc/slice_buffer.h \
    include/grpc/status.h \
    include/grpc/support/workaround_list.h \

LIBGRPC_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBGRPC_SRC))))


ifeq ($(NO_SECURE),true)

# You can't build secure libraries if you don't have OpenSSL.

$(LIBDIR)/$(CONFIG)/libgrpc.a: openssl_dep_error

$(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)grpc$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE): openssl_dep_error

else


$(LIBDIR)/$(CONFIG)/libgrpc.a: $(ZLIB_DEP) $(OPENSSL_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP)  $(LIBGRPC_OBJS)  $(LIBGPR_OBJS)  $(LIBGRPC_ABSEIL_OBJS)  $(ZLIB_MERGE_OBJS)  $(CARES_MERGE_OBJS)  $(ADDRESS_SORTING_MERGE_OBJS)  $(RE2_MERGE_OBJS)  $(UPB_MERGE_OBJS)  $(OPENSSL_MERGE_OBJS) 
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libgrpc.a
	$(Q) $(AR) $(ARFLAGS) $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBGRPC_OBJS)  $(LIBGPR_OBJS)  $(LIBGRPC_ABSEIL_OBJS)  $(ZLIB_MERGE_OBJS)  $(CARES_MERGE_OBJS)  $(ADDRESS_SORTING_MERGE_OBJS)  $(RE2_MERGE_OBJS)  $(UPB_MERGE_OBJS)  $(OPENSSL_MERGE_OBJS) 
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib -no_warning_for_no_symbols $(LIBDIR)/$(CONFIG)/libgrpc.a
endif



ifeq ($(SYSTEM),MINGW32)
$(LIBDIR)/$(CONFIG)/grpc$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE): $(LIBGRPC_OBJS)  $(ZLIB_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP) $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libaddress_sorting.a $(LIBDIR)/$(CONFIG)/libupb.a $(OPENSSL_DEP)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,--output-def=$(LIBDIR)/$(CONFIG)/grpc$(SHARED_VERSION_CORE).def -Wl,--out-implib=$(LIBDIR)/$(CONFIG)/libgrpc$(SHARED_VERSION_CORE)-dll.a -o $(LIBDIR)/$(CONFIG)/grpc$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBGRPC_OBJS) $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libaddress_sorting.a $(LIBDIR)/$(CONFIG)/libupb.a $(OPENSSL_MERGE_LIBS) $(LDLIBS_SECURE) $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBS)
else
$(LIBDIR)/$(CONFIG)/libgrpc$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE): $(LIBGRPC_OBJS)  $(ZLIB_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP) $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libaddress_sorting.a $(LIBDIR)/$(CONFIG)/libupb.a $(OPENSSL_DEP)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
ifeq ($(SYSTEM),Darwin)
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -install_name $(SHARED_PREFIX)grpc$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) -dynamiclib -o $(LIBDIR)/$(CONFIG)/libgrpc$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBGRPC_OBJS) $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libaddress_sorting.a $(LIBDIR)/$(CONFIG)/libupb.a $(OPENSSL_MERGE_LIBS) $(LDLIBS_SECURE) $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBS)
else
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,-soname,libgrpc.so.12 -o $(LIBDIR)/$(CONFIG)/libgrpc$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBGRPC_OBJS) $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libaddress_sorting.a $(LIBDIR)/$(CONFIG)/libupb.a $(OPENSSL_MERGE_LIBS) $(LDLIBS_SECURE) $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBS)
	$(Q) ln -sf $(SHARED_PREFIX)grpc$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/libgrpc$(SHARED_VERSION_CORE).so.12
	$(Q) ln -sf $(SHARED_PREFIX)grpc$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/libgrpc$(SHARED_VERSION_CORE).so
endif
endif

endif

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(LIBGRPC_OBJS:.o=.dep)
endif
endif
# end of build recipe for library "grpc"


# start of build recipe for library "grpc_csharp_ext" (generated by makelib(lib) template function)
LIBGRPC_CSHARP_EXT_SRC = \
    src/csharp/ext/grpc_csharp_ext.c \

PUBLIC_HEADERS_C += \

LIBGRPC_CSHARP_EXT_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBGRPC_CSHARP_EXT_SRC))))


ifeq ($(NO_SECURE),true)

# You can't build secure libraries if you don't have OpenSSL.

$(LIBDIR)/$(CONFIG)/libgrpc_csharp_ext.a: openssl_dep_error

$(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)grpc_csharp_ext$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE): openssl_dep_error

else


$(LIBDIR)/$(CONFIG)/libgrpc_csharp_ext.a: $(ZLIB_DEP) $(OPENSSL_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP)  $(LIBGRPC_CSHARP_EXT_OBJS) 
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libgrpc_csharp_ext.a
	$(Q) $(AR) $(ARFLAGS) $(LIBDIR)/$(CONFIG)/libgrpc_csharp_ext.a $(LIBGRPC_CSHARP_EXT_OBJS) 
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib -no_warning_for_no_symbols $(LIBDIR)/$(CONFIG)/libgrpc_csharp_ext.a
endif



ifeq ($(SYSTEM),MINGW32)
$(LIBDIR)/$(CONFIG)/grpc_csharp_ext$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE): $(LIBGRPC_CSHARP_EXT_OBJS)  $(ZLIB_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP) $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libaddress_sorting.a $(LIBDIR)/$(CONFIG)/libupb.a $(OPENSSL_DEP)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,--output-def=$(LIBDIR)/$(CONFIG)/grpc_csharp_ext$(SHARED_VERSION_CORE).def -Wl,--out-implib=$(LIBDIR)/$(CONFIG)/libgrpc_csharp_ext$(SHARED_VERSION_CORE)-dll.a -o $(LIBDIR)/$(CONFIG)/grpc_csharp_ext$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBGRPC_CSHARP_EXT_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libaddress_sorting.a $(LIBDIR)/$(CONFIG)/libupb.a $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBS)
else
$(LIBDIR)/$(CONFIG)/libgrpc_csharp_ext$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE): $(LIBGRPC_CSHARP_EXT_OBJS)  $(ZLIB_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP) $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libaddress_sorting.a $(LIBDIR)/$(CONFIG)/libupb.a $(OPENSSL_DEP)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
ifeq ($(SYSTEM),Darwin)
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -install_name $(SHARED_PREFIX)grpc_csharp_ext$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) -dynamiclib -o $(LIBDIR)/$(CONFIG)/libgrpc_csharp_ext$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBGRPC_CSHARP_EXT_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libaddress_sorting.a $(LIBDIR)/$(CONFIG)/libupb.a $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBS)
else
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,-soname,libgrpc_csharp_ext.so.12 -o $(LIBDIR)/$(CONFIG)/libgrpc_csharp_ext$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBGRPC_CSHARP_EXT_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc.a $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libaddress_sorting.a $(LIBDIR)/$(CONFIG)/libupb.a $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBS)
	$(Q) ln -sf $(SHARED_PREFIX)grpc_csharp_ext$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/libgrpc_csharp_ext$(SHARED_VERSION_CORE).so.12
	$(Q) ln -sf $(SHARED_PREFIX)grpc_csharp_ext$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/libgrpc_csharp_ext$(SHARED_VERSION_CORE).so
endif
endif

endif

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(LIBGRPC_CSHARP_EXT_OBJS:.o=.dep)
endif
endif
# end of build recipe for library "grpc_csharp_ext"


# start of build recipe for library "grpc_unsecure" (generated by makelib(lib) template function)
LIBGRPC_UNSECURE_SRC = \
    src/core/ext/filters/census/grpc_context.cc \
    src/core/ext/filters/client_channel/backend_metric.cc \
    src/core/ext/filters/client_channel/backup_poller.cc \
    src/core/ext/filters/client_channel/channel_connectivity.cc \
    src/core/ext/filters/client_channel/client_channel.cc \
    src/core/ext/filters/client_channel/client_channel_channelz.cc \
    src/core/ext/filters/client_channel/client_channel_factory.cc \
    src/core/ext/filters/client_channel/client_channel_plugin.cc \
    src/core/ext/filters/client_channel/config_selector.cc \
    src/core/ext/filters/client_channel/global_subchannel_pool.cc \
    src/core/ext/filters/client_channel/health/health_check_client.cc \
    src/core/ext/filters/client_channel/http_connect_handshaker.cc \
    src/core/ext/filters/client_channel/http_proxy.cc \
    src/core/ext/filters/client_channel/lb_policy.cc \
    src/core/ext/filters/client_channel/lb_policy/address_filtering.cc \
    src/core/ext/filters/client_channel/lb_policy/child_policy_handler.cc \
    src/core/ext/filters/client_channel/lb_policy/grpclb/client_load_reporting_filter.cc \
    src/core/ext/filters/client_channel/lb_policy/grpclb/grpclb.cc \
    src/core/ext/filters/client_channel/lb_policy/grpclb/grpclb_balancer_addresses.cc \
    src/core/ext/filters/client_channel/lb_policy/grpclb/grpclb_channel.cc \
    src/core/ext/filters/client_channel/lb_policy/grpclb/grpclb_client_stats.cc \
    src/core/ext/filters/client_channel/lb_policy/grpclb/load_balancer_api.cc \
    src/core/ext/filters/client_channel/lb_policy/pick_first/pick_first.cc \
    src/core/ext/filters/client_channel/lb_policy/priority/priority.cc \
    src/core/ext/filters/client_channel/lb_policy/round_robin/round_robin.cc \
    src/core/ext/filters/client_channel/lb_policy/weighted_target/weighted_target.cc \
    src/core/ext/filters/client_channel/lb_policy/xds/cds.cc \
    src/core/ext/filters/client_channel/lb_policy/xds/eds.cc \
    src/core/ext/filters/client_channel/lb_policy/xds/lrs.cc \
    src/core/ext/filters/client_channel/lb_policy/xds/xds_routing.cc \
    src/core/ext/filters/client_channel/lb_policy_registry.cc \
    src/core/ext/filters/client_channel/local_subchannel_pool.cc \
    src/core/ext/filters/client_channel/proxy_mapper_registry.cc \
    src/core/ext/filters/client_channel/resolver.cc \
    src/core/ext/filters/client_channel/resolver/dns/c_ares/dns_resolver_ares.cc \
    src/core/ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_ev_driver.cc \
    src/core/ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_ev_driver_libuv.cc \
    src/core/ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_ev_driver_posix.cc \
    src/core/ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_ev_driver_windows.cc \
    src/core/ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_wrapper.cc \
    src/core/ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_wrapper_fallback.cc \
    src/core/ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_wrapper_libuv.cc \
    src/core/ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_wrapper_posix.cc \
    src/core/ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_wrapper_windows.cc \
    src/core/ext/filters/client_channel/resolver/dns/dns_resolver_selection.cc \
    src/core/ext/filters/client_channel/resolver/dns/native/dns_resolver.cc \
    src/core/ext/filters/client_channel/resolver/fake/fake_resolver.cc \
    src/core/ext/filters/client_channel/resolver/sockaddr/sockaddr_resolver.cc \
    src/core/ext/filters/client_channel/resolver/xds/xds_resolver.cc \
    src/core/ext/filters/client_channel/resolver_registry.cc \
    src/core/ext/filters/client_channel/resolver_result_parsing.cc \
    src/core/ext/filters/client_channel/resolving_lb_policy.cc \
    src/core/ext/filters/client_channel/retry_throttle.cc \
    src/core/ext/filters/client_channel/server_address.cc \
    src/core/ext/filters/client_channel/service_config.cc \
    src/core/ext/filters/client_channel/service_config_channel_arg_filter.cc \
    src/core/ext/filters/client_channel/service_config_parser.cc \
    src/core/ext/filters/client_channel/subchannel.cc \
    src/core/ext/filters/client_channel/subchannel_pool_interface.cc \
    src/core/ext/filters/client_idle/client_idle_filter.cc \
    src/core/ext/filters/deadline/deadline_filter.cc \
    src/core/ext/filters/http/client/http_client_filter.cc \
    src/core/ext/filters/http/client_authority_filter.cc \
    src/core/ext/filters/http/http_filters_plugin.cc \
    src/core/ext/filters/http/message_compress/message_compress_filter.cc \
    src/core/ext/filters/http/message_compress/message_decompress_filter.cc \
    src/core/ext/filters/http/server/http_server_filter.cc \
    src/core/ext/filters/max_age/max_age_filter.cc \
    src/core/ext/filters/message_size/message_size_filter.cc \
    src/core/ext/filters/workarounds/workaround_cronet_compression_filter.cc \
    src/core/ext/filters/workarounds/workaround_utils.cc \
    src/core/ext/transport/chttp2/alpn/alpn.cc \
    src/core/ext/transport/chttp2/client/authority.cc \
    src/core/ext/transport/chttp2/client/chttp2_connector.cc \
    src/core/ext/transport/chttp2/client/insecure/channel_create.cc \
    src/core/ext/transport/chttp2/client/insecure/channel_create_posix.cc \
    src/core/ext/transport/chttp2/server/chttp2_server.cc \
    src/core/ext/transport/chttp2/server/insecure/server_chttp2.cc \
    src/core/ext/transport/chttp2/server/insecure/server_chttp2_posix.cc \
    src/core/ext/transport/chttp2/transport/bin_decoder.cc \
    src/core/ext/transport/chttp2/transport/bin_encoder.cc \
    src/core/ext/transport/chttp2/transport/chttp2_plugin.cc \
    src/core/ext/transport/chttp2/transport/chttp2_transport.cc \
    src/core/ext/transport/chttp2/transport/context_list.cc \
    src/core/ext/transport/chttp2/transport/flow_control.cc \
    src/core/ext/transport/chttp2/transport/frame_data.cc \
    src/core/ext/transport/chttp2/transport/frame_goaway.cc \
    src/core/ext/transport/chttp2/transport/frame_ping.cc \
    src/core/ext/transport/chttp2/transport/frame_rst_stream.cc \
    src/core/ext/transport/chttp2/transport/frame_settings.cc \
    src/core/ext/transport/chttp2/transport/frame_window_update.cc \
    src/core/ext/transport/chttp2/transport/hpack_encoder.cc \
    src/core/ext/transport/chttp2/transport/hpack_parser.cc \
    src/core/ext/transport/chttp2/transport/hpack_table.cc \
    src/core/ext/transport/chttp2/transport/http2_settings.cc \
    src/core/ext/transport/chttp2/transport/huffsyms.cc \
    src/core/ext/transport/chttp2/transport/incoming_metadata.cc \
    src/core/ext/transport/chttp2/transport/parsing.cc \
    src/core/ext/transport/chttp2/transport/stream_lists.cc \
    src/core/ext/transport/chttp2/transport/stream_map.cc \
    src/core/ext/transport/chttp2/transport/varint.cc \
    src/core/ext/transport/chttp2/transport/writing.cc \
    src/core/ext/transport/inproc/inproc_plugin.cc \
    src/core/ext/transport/inproc/inproc_transport.cc \
    src/core/ext/upb-generated/envoy/annotations/deprecation.upb.c \
    src/core/ext/upb-generated/envoy/annotations/resource.upb.c \
    src/core/ext/upb-generated/envoy/config/accesslog/v3/accesslog.upb.c \
    src/core/ext/upb-generated/envoy/config/cluster/v3/circuit_breaker.upb.c \
    src/core/ext/upb-generated/envoy/config/cluster/v3/cluster.upb.c \
    src/core/ext/upb-generated/envoy/config/cluster/v3/filter.upb.c \
    src/core/ext/upb-generated/envoy/config/cluster/v3/outlier_detection.upb.c \
    src/core/ext/upb-generated/envoy/config/core/v3/address.upb.c \
    src/core/ext/upb-generated/envoy/config/core/v3/backoff.upb.c \
    src/core/ext/upb-generated/envoy/config/core/v3/base.upb.c \
    src/core/ext/upb-generated/envoy/config/core/v3/config_source.upb.c \
    src/core/ext/upb-generated/envoy/config/core/v3/event_service_config.upb.c \
    src/core/ext/upb-generated/envoy/config/core/v3/grpc_service.upb.c \
    src/core/ext/upb-generated/envoy/config/core/v3/health_check.upb.c \
    src/core/ext/upb-generated/envoy/config/core/v3/http_uri.upb.c \
    src/core/ext/upb-generated/envoy/config/core/v3/protocol.upb.c \
    src/core/ext/upb-generated/envoy/config/core/v3/proxy_protocol.upb.c \
    src/core/ext/upb-generated/envoy/config/core/v3/socket_option.upb.c \
    src/core/ext/upb-generated/envoy/config/endpoint/v3/endpoint.upb.c \
    src/core/ext/upb-generated/envoy/config/endpoint/v3/endpoint_components.upb.c \
    src/core/ext/upb-generated/envoy/config/endpoint/v3/load_report.upb.c \
    src/core/ext/upb-generated/envoy/config/listener/v3/api_listener.upb.c \
    src/core/ext/upb-generated/envoy/config/listener/v3/listener.upb.c \
    src/core/ext/upb-generated/envoy/config/listener/v3/listener_components.upb.c \
    src/core/ext/upb-generated/envoy/config/listener/v3/udp_listener_config.upb.c \
    src/core/ext/upb-generated/envoy/config/rbac/v3/rbac.upb.c \
    src/core/ext/upb-generated/envoy/config/route/v3/route.upb.c \
    src/core/ext/upb-generated/envoy/config/route/v3/route_components.upb.c \
    src/core/ext/upb-generated/envoy/config/route/v3/scoped_route.upb.c \
    src/core/ext/upb-generated/envoy/config/trace/v3/http_tracer.upb.c \
    src/core/ext/upb-generated/envoy/extensions/filters/network/http_connection_manager/v3/http_connection_manager.upb.c \
    src/core/ext/upb-generated/envoy/extensions/transport_sockets/tls/v3/cert.upb.c \
    src/core/ext/upb-generated/envoy/extensions/transport_sockets/tls/v3/common.upb.c \
    src/core/ext/upb-generated/envoy/extensions/transport_sockets/tls/v3/secret.upb.c \
    src/core/ext/upb-generated/envoy/extensions/transport_sockets/tls/v3/tls.upb.c \
    src/core/ext/upb-generated/envoy/service/cluster/v3/cds.upb.c \
    src/core/ext/upb-generated/envoy/service/discovery/v3/ads.upb.c \
    src/core/ext/upb-generated/envoy/service/discovery/v3/discovery.upb.c \
    src/core/ext/upb-generated/envoy/service/endpoint/v3/eds.upb.c \
    src/core/ext/upb-generated/envoy/service/listener/v3/lds.upb.c \
    src/core/ext/upb-generated/envoy/service/load_stats/v3/lrs.upb.c \
    src/core/ext/upb-generated/envoy/service/route/v3/rds.upb.c \
    src/core/ext/upb-generated/envoy/service/route/v3/srds.upb.c \
    src/core/ext/upb-generated/envoy/type/matcher/v3/metadata.upb.c \
    src/core/ext/upb-generated/envoy/type/matcher/v3/number.upb.c \
    src/core/ext/upb-generated/envoy/type/matcher/v3/path.upb.c \
    src/core/ext/upb-generated/envoy/type/matcher/v3/regex.upb.c \
    src/core/ext/upb-generated/envoy/type/matcher/v3/string.upb.c \
    src/core/ext/upb-generated/envoy/type/matcher/v3/value.upb.c \
    src/core/ext/upb-generated/envoy/type/metadata/v3/metadata.upb.c \
    src/core/ext/upb-generated/envoy/type/tracing/v3/custom_tag.upb.c \
    src/core/ext/upb-generated/envoy/type/v3/http.upb.c \
    src/core/ext/upb-generated/envoy/type/v3/percent.upb.c \
    src/core/ext/upb-generated/envoy/type/v3/range.upb.c \
    src/core/ext/upb-generated/envoy/type/v3/semantic_version.upb.c \
    src/core/ext/upb-generated/gogoproto/gogo.upb.c \
    src/core/ext/upb-generated/google/api/annotations.upb.c \
    src/core/ext/upb-generated/google/api/expr/v1alpha1/syntax.upb.c \
    src/core/ext/upb-generated/google/api/http.upb.c \
    src/core/ext/upb-generated/google/protobuf/any.upb.c \
    src/core/ext/upb-generated/google/protobuf/descriptor.upb.c \
    src/core/ext/upb-generated/google/protobuf/duration.upb.c \
    src/core/ext/upb-generated/google/protobuf/empty.upb.c \
    src/core/ext/upb-generated/google/protobuf/struct.upb.c \
    src/core/ext/upb-generated/google/protobuf/timestamp.upb.c \
    src/core/ext/upb-generated/google/protobuf/wrappers.upb.c \
    src/core/ext/upb-generated/google/rpc/status.upb.c \
    src/core/ext/upb-generated/src/proto/grpc/health/v1/health.upb.c \
    src/core/ext/upb-generated/src/proto/grpc/lb/v1/load_balancer.upb.c \
    src/core/ext/upb-generated/udpa/annotations/migrate.upb.c \
    src/core/ext/upb-generated/udpa/annotations/sensitive.upb.c \
    src/core/ext/upb-generated/udpa/annotations/status.upb.c \
    src/core/ext/upb-generated/udpa/annotations/versioning.upb.c \
    src/core/ext/upb-generated/udpa/data/orca/v1/orca_load_report.upb.c \
    src/core/ext/upb-generated/validate/validate.upb.c \
    src/core/ext/xds/xds_api.cc \
    src/core/ext/xds/xds_bootstrap.cc \
    src/core/ext/xds/xds_channel.cc \
    src/core/ext/xds/xds_client.cc \
    src/core/ext/xds/xds_client_stats.cc \
    src/core/lib/avl/avl.cc \
    src/core/lib/backoff/backoff.cc \
    src/core/lib/channel/channel_args.cc \
    src/core/lib/channel/channel_stack.cc \
    src/core/lib/channel/channel_stack_builder.cc \
    src/core/lib/channel/channel_trace.cc \
    src/core/lib/channel/channelz.cc \
    src/core/lib/channel/channelz_registry.cc \
    src/core/lib/channel/connected_channel.cc \
    src/core/lib/channel/handshaker.cc \
    src/core/lib/channel/handshaker_registry.cc \
    src/core/lib/channel/status_util.cc \
    src/core/lib/compression/compression.cc \
    src/core/lib/compression/compression_args.cc \
    src/core/lib/compression/compression_internal.cc \
    src/core/lib/compression/message_compress.cc \
    src/core/lib/compression/stream_compression.cc \
    src/core/lib/compression/stream_compression_gzip.cc \
    src/core/lib/compression/stream_compression_identity.cc \
    src/core/lib/debug/stats.cc \
    src/core/lib/debug/stats_data.cc \
    src/core/lib/debug/trace.cc \
    src/core/lib/http/format_request.cc \
    src/core/lib/http/httpcli.cc \
    src/core/lib/http/parser.cc \
    src/core/lib/iomgr/buffer_list.cc \
    src/core/lib/iomgr/call_combiner.cc \
    src/core/lib/iomgr/cfstream_handle.cc \
    src/core/lib/iomgr/combiner.cc \
    src/core/lib/iomgr/dualstack_socket_posix.cc \
    src/core/lib/iomgr/endpoint.cc \
    src/core/lib/iomgr/endpoint_cfstream.cc \
    src/core/lib/iomgr/endpoint_pair_posix.cc \
    src/core/lib/iomgr/endpoint_pair_uv.cc \
    src/core/lib/iomgr/endpoint_pair_windows.cc \
    src/core/lib/iomgr/error.cc \
    src/core/lib/iomgr/error_cfstream.cc \
    src/core/lib/iomgr/ev_apple.cc \
    src/core/lib/iomgr/ev_epoll1_linux.cc \
    src/core/lib/iomgr/ev_epollex_linux.cc \
    src/core/lib/iomgr/ev_poll_posix.cc \
    src/core/lib/iomgr/ev_posix.cc \
    src/core/lib/iomgr/ev_windows.cc \
    src/core/lib/iomgr/exec_ctx.cc \
    src/core/lib/iomgr/executor.cc \
    src/core/lib/iomgr/executor/mpmcqueue.cc \
    src/core/lib/iomgr/executor/threadpool.cc \
    src/core/lib/iomgr/fork_posix.cc \
    src/core/lib/iomgr/fork_windows.cc \
    src/core/lib/iomgr/gethostname_fallback.cc \
    src/core/lib/iomgr/gethostname_host_name_max.cc \
    src/core/lib/iomgr/gethostname_sysconf.cc \
    src/core/lib/iomgr/grpc_if_nametoindex_posix.cc \
    src/core/lib/iomgr/grpc_if_nametoindex_unsupported.cc \
    src/core/lib/iomgr/internal_errqueue.cc \
    src/core/lib/iomgr/iocp_windows.cc \
    src/core/lib/iomgr/iomgr.cc \
    src/core/lib/iomgr/iomgr_custom.cc \
    src/core/lib/iomgr/iomgr_internal.cc \
    src/core/lib/iomgr/iomgr_posix.cc \
    src/core/lib/iomgr/iomgr_posix_cfstream.cc \
    src/core/lib/iomgr/iomgr_uv.cc \
    src/core/lib/iomgr/iomgr_windows.cc \
    src/core/lib/iomgr/is_epollexclusive_available.cc \
    src/core/lib/iomgr/load_file.cc \
    src/core/lib/iomgr/lockfree_event.cc \
    src/core/lib/iomgr/parse_address.cc \
    src/core/lib/iomgr/poller/eventmanager_libuv.cc \
    src/core/lib/iomgr/polling_entity.cc \
    src/core/lib/iomgr/pollset.cc \
    src/core/lib/iomgr/pollset_custom.cc \
    src/core/lib/iomgr/pollset_set.cc \
    src/core/lib/iomgr/pollset_set_custom.cc \
    src/core/lib/iomgr/pollset_set_windows.cc \
    src/core/lib/iomgr/pollset_uv.cc \
    src/core/lib/iomgr/pollset_windows.cc \
    src/core/lib/iomgr/resolve_address.cc \
    src/core/lib/iomgr/resolve_address_custom.cc \
    src/core/lib/iomgr/resolve_address_posix.cc \
    src/core/lib/iomgr/resolve_address_windows.cc \
    src/core/lib/iomgr/resource_quota.cc \
    src/core/lib/iomgr/sockaddr_utils.cc \
    src/core/lib/iomgr/socket_factory_posix.cc \
    src/core/lib/iomgr/socket_mutator.cc \
    src/core/lib/iomgr/socket_utils_common_posix.cc \
    src/core/lib/iomgr/socket_utils_linux.cc \
    src/core/lib/iomgr/socket_utils_posix.cc \
    src/core/lib/iomgr/socket_utils_uv.cc \
    src/core/lib/iomgr/socket_utils_windows.cc \
    src/core/lib/iomgr/socket_windows.cc \
    src/core/lib/iomgr/tcp_client.cc \
    src/core/lib/iomgr/tcp_client_cfstream.cc \
    src/core/lib/iomgr/tcp_client_custom.cc \
    src/core/lib/iomgr/tcp_client_posix.cc \
    src/core/lib/iomgr/tcp_client_windows.cc \
    src/core/lib/iomgr/tcp_custom.cc \
    src/core/lib/iomgr/tcp_posix.cc \
    src/core/lib/iomgr/tcp_server.cc \
    src/core/lib/iomgr/tcp_server_custom.cc \
    src/core/lib/iomgr/tcp_server_posix.cc \
    src/core/lib/iomgr/tcp_server_utils_posix_common.cc \
    src/core/lib/iomgr/tcp_server_utils_posix_ifaddrs.cc \
    src/core/lib/iomgr/tcp_server_utils_posix_noifaddrs.cc \
    src/core/lib/iomgr/tcp_server_windows.cc \
    src/core/lib/iomgr/tcp_uv.cc \
    src/core/lib/iomgr/tcp_windows.cc \
    src/core/lib/iomgr/time_averaged_stats.cc \
    src/core/lib/iomgr/timer.cc \
    src/core/lib/iomgr/timer_custom.cc \
    src/core/lib/iomgr/timer_generic.cc \
    src/core/lib/iomgr/timer_heap.cc \
    src/core/lib/iomgr/timer_manager.cc \
    src/core/lib/iomgr/timer_uv.cc \
    src/core/lib/iomgr/udp_server.cc \
    src/core/lib/iomgr/unix_sockets_posix.cc \
    src/core/lib/iomgr/unix_sockets_posix_noop.cc \
    src/core/lib/iomgr/wakeup_fd_eventfd.cc \
    src/core/lib/iomgr/wakeup_fd_nospecial.cc \
    src/core/lib/iomgr/wakeup_fd_pipe.cc \
    src/core/lib/iomgr/wakeup_fd_posix.cc \
    src/core/lib/iomgr/work_serializer.cc \
    src/core/lib/json/json_reader.cc \
    src/core/lib/json/json_writer.cc \
    src/core/lib/slice/b64.cc \
    src/core/lib/slice/percent_encoding.cc \
    src/core/lib/slice/slice.cc \
    src/core/lib/slice/slice_buffer.cc \
    src/core/lib/slice/slice_intern.cc \
    src/core/lib/slice/slice_string_helpers.cc \
    src/core/lib/surface/api_trace.cc \
    src/core/lib/surface/byte_buffer.cc \
    src/core/lib/surface/byte_buffer_reader.cc \
    src/core/lib/surface/call.cc \
    src/core/lib/surface/call_details.cc \
    src/core/lib/surface/call_log_batch.cc \
    src/core/lib/surface/channel.cc \
    src/core/lib/surface/channel_init.cc \
    src/core/lib/surface/channel_ping.cc \
    src/core/lib/surface/channel_stack_type.cc \
    src/core/lib/surface/completion_queue.cc \
    src/core/lib/surface/completion_queue_factory.cc \
    src/core/lib/surface/event_string.cc \
    src/core/lib/surface/init.cc \
    src/core/lib/surface/init_unsecure.cc \
    src/core/lib/surface/lame_client.cc \
    src/core/lib/surface/metadata_array.cc \
    src/core/lib/surface/server.cc \
    src/core/lib/surface/validate_metadata.cc \
    src/core/lib/surface/version.cc \
    src/core/lib/transport/authority_override.cc \
    src/core/lib/transport/bdp_estimator.cc \
    src/core/lib/transport/byte_stream.cc \
    src/core/lib/transport/connectivity_state.cc \
    src/core/lib/transport/error_utils.cc \
    src/core/lib/transport/metadata.cc \
    src/core/lib/transport/metadata_batch.cc \
    src/core/lib/transport/pid_controller.cc \
    src/core/lib/transport/static_metadata.cc \
    src/core/lib/transport/status_conversion.cc \
    src/core/lib/transport/status_metadata.cc \
    src/core/lib/transport/timeout_encoding.cc \
    src/core/lib/transport/transport.cc \
    src/core/lib/transport/transport_op_string.cc \
    src/core/lib/uri/uri_parser.cc \
    src/core/plugin_registry/grpc_unsecure_plugin_registry.cc \

PUBLIC_HEADERS_C += \
    include/grpc/byte_buffer.h \
    include/grpc/byte_buffer_reader.h \
    include/grpc/census.h \
    include/grpc/compression.h \
    include/grpc/fork.h \
    include/grpc/grpc.h \
    include/grpc/grpc_posix.h \
    include/grpc/grpc_security_constants.h \
    include/grpc/load_reporting.h \
    include/grpc/slice.h \
    include/grpc/slice_buffer.h \
    include/grpc/status.h \
    include/grpc/support/workaround_list.h \

LIBGRPC_UNSECURE_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBGRPC_UNSECURE_SRC))))


$(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a: $(ZLIB_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP)  $(LIBGRPC_UNSECURE_OBJS)  $(LIBGPR_OBJS)  $(LIBGRPC_ABSEIL_OBJS)  $(ZLIB_MERGE_OBJS)  $(CARES_MERGE_OBJS)  $(ADDRESS_SORTING_MERGE_OBJS)  $(RE2_MERGE_OBJS)  $(UPB_MERGE_OBJS) 
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a
	$(Q) $(AR) $(ARFLAGS) $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a $(LIBGRPC_UNSECURE_OBJS)  $(LIBGPR_OBJS)  $(LIBGRPC_ABSEIL_OBJS)  $(ZLIB_MERGE_OBJS)  $(CARES_MERGE_OBJS)  $(ADDRESS_SORTING_MERGE_OBJS)  $(RE2_MERGE_OBJS)  $(UPB_MERGE_OBJS) 
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib -no_warning_for_no_symbols $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.a
endif



ifeq ($(SYSTEM),MINGW32)
$(LIBDIR)/$(CONFIG)/grpc_unsecure$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE): $(LIBGRPC_UNSECURE_OBJS)  $(ZLIB_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP) $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libaddress_sorting.a $(LIBDIR)/$(CONFIG)/libupb.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,--output-def=$(LIBDIR)/$(CONFIG)/grpc_unsecure$(SHARED_VERSION_CORE).def -Wl,--out-implib=$(LIBDIR)/$(CONFIG)/libgrpc_unsecure$(SHARED_VERSION_CORE)-dll.a -o $(LIBDIR)/$(CONFIG)/grpc_unsecure$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBGRPC_UNSECURE_OBJS) $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libaddress_sorting.a $(LIBDIR)/$(CONFIG)/libupb.a $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBS)
else
$(LIBDIR)/$(CONFIG)/libgrpc_unsecure$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE): $(LIBGRPC_UNSECURE_OBJS)  $(ZLIB_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP) $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libaddress_sorting.a $(LIBDIR)/$(CONFIG)/libupb.a
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
ifeq ($(SYSTEM),Darwin)
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -install_name $(SHARED_PREFIX)grpc_unsecure$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) -dynamiclib -o $(LIBDIR)/$(CONFIG)/libgrpc_unsecure$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBGRPC_UNSECURE_OBJS) $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libaddress_sorting.a $(LIBDIR)/$(CONFIG)/libupb.a $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBS)
else
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,-soname,libgrpc_unsecure.so.12 -o $(LIBDIR)/$(CONFIG)/libgrpc_unsecure$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBGRPC_UNSECURE_OBJS) $(LIBDIR)/$(CONFIG)/libgpr.a $(LIBDIR)/$(CONFIG)/libaddress_sorting.a $(LIBDIR)/$(CONFIG)/libupb.a $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBS)
	$(Q) ln -sf $(SHARED_PREFIX)grpc_unsecure$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/libgrpc_unsecure$(SHARED_VERSION_CORE).so.12
	$(Q) ln -sf $(SHARED_PREFIX)grpc_unsecure$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/libgrpc_unsecure$(SHARED_VERSION_CORE).so
endif
endif

ifneq ($(NO_DEPS),true)
-include $(LIBGRPC_UNSECURE_OBJS:.o=.dep)
endif
# end of build recipe for library "grpc_unsecure"


# start of build recipe for library "grpc++" (generated by makelib(lib) template function)
LIBGRPC++_SRC = \
    src/cpp/client/channel_cc.cc \
    src/cpp/client/client_callback.cc \
    src/cpp/client/client_context.cc \
    src/cpp/client/client_interceptor.cc \
    src/cpp/client/create_channel.cc \
    src/cpp/client/create_channel_internal.cc \
    src/cpp/client/create_channel_posix.cc \
    src/cpp/client/credentials_cc.cc \
    src/cpp/client/insecure_credentials.cc \
    src/cpp/client/secure_credentials.cc \
    src/cpp/codegen/codegen_init.cc \
    src/cpp/common/alarm.cc \
    src/cpp/common/auth_property_iterator.cc \
    src/cpp/common/channel_arguments.cc \
    src/cpp/common/channel_filter.cc \
    src/cpp/common/completion_queue_cc.cc \
    src/cpp/common/core_codegen.cc \
    src/cpp/common/resource_quota_cc.cc \
    src/cpp/common/rpc_method.cc \
    src/cpp/common/secure_auth_context.cc \
    src/cpp/common/secure_channel_arguments.cc \
    src/cpp/common/secure_create_auth_context.cc \
    src/cpp/common/tls_credentials_options.cc \
    src/cpp/common/tls_credentials_options_util.cc \
    src/cpp/common/validate_service_config.cc \
    src/cpp/common/version_cc.cc \
    src/cpp/server/async_generic_service.cc \
    src/cpp/server/channel_argument_option.cc \
    src/cpp/server/create_default_thread_pool.cc \
    src/cpp/server/dynamic_thread_pool.cc \
    src/cpp/server/external_connection_acceptor_impl.cc \
    src/cpp/server/health/default_health_check_service.cc \
    src/cpp/server/health/health_check_service.cc \
    src/cpp/server/health/health_check_service_server_builder_option.cc \
    src/cpp/server/insecure_server_credentials.cc \
    src/cpp/server/secure_server_credentials.cc \
    src/cpp/server/server_builder.cc \
    src/cpp/server/server_callback.cc \
    src/cpp/server/server_cc.cc \
    src/cpp/server/server_context.cc \
    src/cpp/server/server_credentials.cc \
    src/cpp/server/server_posix.cc \
    src/cpp/thread_manager/thread_manager.cc \
    src/cpp/util/byte_buffer_cc.cc \
    src/cpp/util/status.cc \
    src/cpp/util/string_ref.cc \
    src/cpp/util/time_cc.cc \

PUBLIC_HEADERS_CXX += \
    include/grpc++/alarm.h \
    include/grpc++/channel.h \
    include/grpc++/client_context.h \
    include/grpc++/completion_queue.h \
    include/grpc++/create_channel.h \
    include/grpc++/create_channel_posix.h \
    include/grpc++/ext/health_check_service_server_builder_option.h \
    include/grpc++/generic/async_generic_service.h \
    include/grpc++/generic/generic_stub.h \
    include/grpc++/grpc++.h \
    include/grpc++/health_check_service_interface.h \
    include/grpc++/impl/call.h \
    include/grpc++/impl/channel_argument_option.h \
    include/grpc++/impl/client_unary_call.h \
    include/grpc++/impl/codegen/async_stream.h \
    include/grpc++/impl/codegen/async_unary_call.h \
    include/grpc++/impl/codegen/byte_buffer.h \
    include/grpc++/impl/codegen/call.h \
    include/grpc++/impl/codegen/call_hook.h \
    include/grpc++/impl/codegen/channel_interface.h \
    include/grpc++/impl/codegen/client_context.h \
    include/grpc++/impl/codegen/client_unary_call.h \
    include/grpc++/impl/codegen/completion_queue.h \
    include/grpc++/impl/codegen/completion_queue_tag.h \
    include/grpc++/impl/codegen/config.h \
    include/grpc++/impl/codegen/config_protobuf.h \
    include/grpc++/impl/codegen/core_codegen.h \
    include/grpc++/impl/codegen/core_codegen_interface.h \
    include/grpc++/impl/codegen/create_auth_context.h \
    include/grpc++/impl/codegen/grpc_library.h \
    include/grpc++/impl/codegen/metadata_map.h \
    include/grpc++/impl/codegen/method_handler_impl.h \
    include/grpc++/impl/codegen/proto_utils.h \
    include/grpc++/impl/codegen/rpc_method.h \
    include/grpc++/impl/codegen/rpc_service_method.h \
    include/grpc++/impl/codegen/security/auth_context.h \
    include/grpc++/impl/codegen/serialization_traits.h \
    include/grpc++/impl/codegen/server_context.h \
    include/grpc++/impl/codegen/server_interface.h \
    include/grpc++/impl/codegen/service_type.h \
    include/grpc++/impl/codegen/slice.h \
    include/grpc++/impl/codegen/status.h \
    include/grpc++/impl/codegen/status_code_enum.h \
    include/grpc++/impl/codegen/string_ref.h \
    include/grpc++/impl/codegen/stub_options.h \
    include/grpc++/impl/codegen/sync_stream.h \
    include/grpc++/impl/codegen/time.h \
    include/grpc++/impl/grpc_library.h \
    include/grpc++/impl/method_handler_impl.h \
    include/grpc++/impl/rpc_method.h \
    include/grpc++/impl/rpc_service_method.h \
    include/grpc++/impl/serialization_traits.h \
    include/grpc++/impl/server_builder_option.h \
    include/grpc++/impl/server_builder_plugin.h \
    include/grpc++/impl/server_initializer.h \
    include/grpc++/impl/service_type.h \
    include/grpc++/resource_quota.h \
    include/grpc++/security/auth_context.h \
    include/grpc++/security/auth_metadata_processor.h \
    include/grpc++/security/credentials.h \
    include/grpc++/security/server_credentials.h \
    include/grpc++/server.h \
    include/grpc++/server_builder.h \
    include/grpc++/server_context.h \
    include/grpc++/server_posix.h \
    include/grpc++/support/async_stream.h \
    include/grpc++/support/async_unary_call.h \
    include/grpc++/support/byte_buffer.h \
    include/grpc++/support/channel_arguments.h \
    include/grpc++/support/config.h \
    include/grpc++/support/slice.h \
    include/grpc++/support/status.h \
    include/grpc++/support/status_code_enum.h \
    include/grpc++/support/string_ref.h \
    include/grpc++/support/stub_options.h \
    include/grpc++/support/sync_stream.h \
    include/grpc++/support/time.h \
    include/grpcpp/alarm.h \
    include/grpcpp/alarm_impl.h \
    include/grpcpp/channel.h \
    include/grpcpp/client_context.h \
    include/grpcpp/completion_queue.h \
    include/grpcpp/create_channel.h \
    include/grpcpp/create_channel_posix.h \
    include/grpcpp/ext/health_check_service_server_builder_option.h \
    include/grpcpp/generic/async_generic_service.h \
    include/grpcpp/generic/generic_stub.h \
    include/grpcpp/grpcpp.h \
    include/grpcpp/health_check_service_interface.h \
    include/grpcpp/impl/call.h \
    include/grpcpp/impl/channel_argument_option.h \
    include/grpcpp/impl/client_unary_call.h \
    include/grpcpp/impl/codegen/async_generic_service.h \
    include/grpcpp/impl/codegen/async_stream.h \
    include/grpcpp/impl/codegen/async_stream_impl.h \
    include/grpcpp/impl/codegen/async_unary_call.h \
    include/grpcpp/impl/codegen/async_unary_call_impl.h \
    include/grpcpp/impl/codegen/byte_buffer.h \
    include/grpcpp/impl/codegen/call.h \
    include/grpcpp/impl/codegen/call_hook.h \
    include/grpcpp/impl/codegen/call_op_set.h \
    include/grpcpp/impl/codegen/call_op_set_interface.h \
    include/grpcpp/impl/codegen/callback_common.h \
    include/grpcpp/impl/codegen/channel_interface.h \
    include/grpcpp/impl/codegen/client_callback.h \
    include/grpcpp/impl/codegen/client_callback_impl.h \
    include/grpcpp/impl/codegen/client_context.h \
    include/grpcpp/impl/codegen/client_interceptor.h \
    include/grpcpp/impl/codegen/client_unary_call.h \
    include/grpcpp/impl/codegen/completion_queue.h \
    include/grpcpp/impl/codegen/completion_queue_tag.h \
    include/grpcpp/impl/codegen/config.h \
    include/grpcpp/impl/codegen/config_protobuf.h \
    include/grpcpp/impl/codegen/core_codegen.h \
    include/grpcpp/impl/codegen/core_codegen_interface.h \
    include/grpcpp/impl/codegen/create_auth_context.h \
    include/grpcpp/impl/codegen/delegating_channel.h \
    include/grpcpp/impl/codegen/grpc_library.h \
    include/grpcpp/impl/codegen/intercepted_channel.h \
    include/grpcpp/impl/codegen/interceptor.h \
    include/grpcpp/impl/codegen/interceptor_common.h \
    include/grpcpp/impl/codegen/message_allocator.h \
    include/grpcpp/impl/codegen/metadata_map.h \
    include/grpcpp/impl/codegen/method_handler.h \
    include/grpcpp/impl/codegen/method_handler_impl.h \
    include/grpcpp/impl/codegen/proto_buffer_reader.h \
    include/grpcpp/impl/codegen/proto_buffer_writer.h \
    include/grpcpp/impl/codegen/proto_utils.h \
    include/grpcpp/impl/codegen/rpc_method.h \
    include/grpcpp/impl/codegen/rpc_service_method.h \
    include/grpcpp/impl/codegen/security/auth_context.h \
    include/grpcpp/impl/codegen/serialization_traits.h \
    include/grpcpp/impl/codegen/server_callback.h \
    include/grpcpp/impl/codegen/server_callback_handlers.h \
    include/grpcpp/impl/codegen/server_callback_impl.h \
    include/grpcpp/impl/codegen/server_context.h \
    include/grpcpp/impl/codegen/server_context_impl.h \
    include/grpcpp/impl/codegen/server_interceptor.h \
    include/grpcpp/impl/codegen/server_interface.h \
    include/grpcpp/impl/codegen/service_type.h \
    include/grpcpp/impl/codegen/slice.h \
    include/grpcpp/impl/codegen/status.h \
    include/grpcpp/impl/codegen/status_code_enum.h \
    include/grpcpp/impl/codegen/string_ref.h \
    include/grpcpp/impl/codegen/stub_options.h \
    include/grpcpp/impl/codegen/sync.h \
    include/grpcpp/impl/codegen/sync_stream.h \
    include/grpcpp/impl/codegen/sync_stream_impl.h \
    include/grpcpp/impl/codegen/time.h \
    include/grpcpp/impl/grpc_library.h \
    include/grpcpp/impl/method_handler_impl.h \
    include/grpcpp/impl/rpc_method.h \
    include/grpcpp/impl/rpc_service_method.h \
    include/grpcpp/impl/serialization_traits.h \
    include/grpcpp/impl/server_builder_option.h \
    include/grpcpp/impl/server_builder_option_impl.h \
    include/grpcpp/impl/server_builder_plugin.h \
    include/grpcpp/impl/server_initializer.h \
    include/grpcpp/impl/server_initializer_impl.h \
    include/grpcpp/impl/service_type.h \
    include/grpcpp/resource_quota.h \
    include/grpcpp/security/auth_context.h \
    include/grpcpp/security/auth_metadata_processor.h \
    include/grpcpp/security/credentials.h \
    include/grpcpp/security/server_credentials.h \
    include/grpcpp/security/tls_credentials_options.h \
    include/grpcpp/server.h \
    include/grpcpp/server_builder.h \
    include/grpcpp/server_context.h \
    include/grpcpp/server_impl.h \
    include/grpcpp/server_posix.h \
    include/grpcpp/support/async_stream.h \
    include/grpcpp/support/async_stream_impl.h \
    include/grpcpp/support/async_unary_call.h \
    include/grpcpp/support/async_unary_call_impl.h \
    include/grpcpp/support/byte_buffer.h \
    include/grpcpp/support/channel_arguments.h \
    include/grpcpp/support/client_callback.h \
    include/grpcpp/support/client_callback_impl.h \
    include/grpcpp/support/client_interceptor.h \
    include/grpcpp/support/config.h \
    include/grpcpp/support/interceptor.h \
    include/grpcpp/support/message_allocator.h \
    include/grpcpp/support/method_handler.h \
    include/grpcpp/support/proto_buffer_reader.h \
    include/grpcpp/support/proto_buffer_writer.h \
    include/grpcpp/support/server_callback.h \
    include/grpcpp/support/server_callback_impl.h \
    include/grpcpp/support/server_interceptor.h \
    include/grpcpp/support/slice.h \
    include/grpcpp/support/status.h \
    include/grpcpp/support/status_code_enum.h \
    include/grpcpp/support/string_ref.h \
    include/grpcpp/support/stub_options.h \
    include/grpcpp/support/sync_stream.h \
    include/grpcpp/support/sync_stream_impl.h \
    include/grpcpp/support/time.h \
    include/grpcpp/support/validate_service_config.h \

LIBGRPC++_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBGRPC++_SRC))))


ifeq ($(NO_SECURE),true)

# You can't build secure libraries if you don't have OpenSSL.

$(LIBDIR)/$(CONFIG)/libgrpc++.a: openssl_dep_error

$(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)grpc++$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP): openssl_dep_error

else

ifeq ($(NO_PROTOBUF),true)

# You can't build a C++ library if you don't have protobuf - a bit overreached, but still okay.

$(LIBDIR)/$(CONFIG)/libgrpc++.a: protobuf_dep_error

$(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)grpc++$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP): protobuf_dep_error

else

$(LIBDIR)/$(CONFIG)/libgrpc++.a: $(ZLIB_DEP) $(OPENSSL_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP)  $(PROTOBUF_DEP) $(LIBGRPC++_OBJS)  $(LIBGPR_OBJS)  $(LIBGRPC_ABSEIL_OBJS)  $(ZLIB_MERGE_OBJS)  $(CARES_MERGE_OBJS)  $(ADDRESS_SORTING_MERGE_OBJS)  $(RE2_MERGE_OBJS)  $(UPB_MERGE_OBJS) 
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libgrpc++.a
	$(Q) $(AR) $(ARFLAGS) $(LIBDIR)/$(CONFIG)/libgrpc++.a $(LIBGRPC++_OBJS)  $(LIBGPR_OBJS)  $(LIBGRPC_ABSEIL_OBJS)  $(ZLIB_MERGE_OBJS)  $(CARES_MERGE_OBJS)  $(ADDRESS_SORTING_MERGE_OBJS)  $(RE2_MERGE_OBJS)  $(UPB_MERGE_OBJS) 
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib -no_warning_for_no_symbols $(LIBDIR)/$(CONFIG)/libgrpc++.a
endif



ifeq ($(SYSTEM),MINGW32)
$(LIBDIR)/$(CONFIG)/grpc++$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP): $(LIBGRPC++_OBJS)  $(ZLIB_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP) $(PROTOBUF_DEP) $(LIBDIR)/$(CONFIG)/grpc$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/gpr$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/address_sorting$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/upb$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(OPENSSL_DEP)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,--output-def=$(LIBDIR)/$(CONFIG)/grpc++$(SHARED_VERSION_CPP).def -Wl,--out-implib=$(LIBDIR)/$(CONFIG)/libgrpc++$(SHARED_VERSION_CPP)-dll.a -o $(LIBDIR)/$(CONFIG)/grpc++$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBGRPC++_OBJS) $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) -lgrpc$(SHARED_VERSION_CORE)-dll -lgpr$(SHARED_VERSION_CORE)-dll -laddress_sorting$(SHARED_VERSION_CORE)-dll -lupb$(SHARED_VERSION_CORE)-dll
else
$(LIBDIR)/$(CONFIG)/libgrpc++$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP): $(LIBGRPC++_OBJS)  $(ZLIB_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP) $(PROTOBUF_DEP) $(LIBDIR)/$(CONFIG)/libgrpc.$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/libgpr.$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/libaddress_sorting.$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/libupb.$(SHARED_EXT_CORE) $(OPENSSL_DEP)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
ifeq ($(SYSTEM),Darwin)
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -install_name $(SHARED_PREFIX)grpc++$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) -dynamiclib -o $(LIBDIR)/$(CONFIG)/libgrpc++$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBGRPC++_OBJS) $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) -lgrpc -lgpr -laddress_sorting -lupb
else
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,-soname,libgrpc++.so.1 -o $(LIBDIR)/$(CONFIG)/libgrpc++$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBGRPC++_OBJS) $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) -lgrpc -lgpr -laddress_sorting -lupb
	$(Q) ln -sf $(SHARED_PREFIX)grpc++$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBDIR)/$(CONFIG)/libgrpc++$(SHARED_VERSION_CPP).so.1
	$(Q) ln -sf $(SHARED_PREFIX)grpc++$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBDIR)/$(CONFIG)/libgrpc++$(SHARED_VERSION_CPP).so
endif
endif

endif

endif

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(LIBGRPC++_OBJS:.o=.dep)
endif
endif
# end of build recipe for library "grpc++"


# start of build recipe for library "grpc++_alts" (generated by makelib(lib) template function)
LIBGRPC++_ALTS_SRC = \
    src/cpp/common/alts_context.cc \
    src/cpp/common/alts_util.cc \

PUBLIC_HEADERS_CXX += \
    include/grpcpp/security/alts_context.h \
    include/grpcpp/security/alts_util.h \

LIBGRPC++_ALTS_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBGRPC++_ALTS_SRC))))


ifeq ($(NO_SECURE),true)

# You can't build secure libraries if you don't have OpenSSL.

$(LIBDIR)/$(CONFIG)/libgrpc++_alts.a: openssl_dep_error

$(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)grpc++_alts$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP): openssl_dep_error

else

ifeq ($(NO_PROTOBUF),true)

# You can't build a C++ library if you don't have protobuf - a bit overreached, but still okay.

$(LIBDIR)/$(CONFIG)/libgrpc++_alts.a: protobuf_dep_error

$(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)grpc++_alts$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP): protobuf_dep_error

else

$(LIBDIR)/$(CONFIG)/libgrpc++_alts.a: $(ZLIB_DEP) $(OPENSSL_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP)  $(PROTOBUF_DEP) $(LIBGRPC++_ALTS_OBJS)  $(LIBGPR_OBJS)  $(LIBGRPC_ABSEIL_OBJS)  $(ZLIB_MERGE_OBJS)  $(CARES_MERGE_OBJS)  $(ADDRESS_SORTING_MERGE_OBJS)  $(RE2_MERGE_OBJS)  $(UPB_MERGE_OBJS) 
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libgrpc++_alts.a
	$(Q) $(AR) $(ARFLAGS) $(LIBDIR)/$(CONFIG)/libgrpc++_alts.a $(LIBGRPC++_ALTS_OBJS)  $(LIBGPR_OBJS)  $(LIBGRPC_ABSEIL_OBJS)  $(ZLIB_MERGE_OBJS)  $(CARES_MERGE_OBJS)  $(ADDRESS_SORTING_MERGE_OBJS)  $(RE2_MERGE_OBJS)  $(UPB_MERGE_OBJS) 
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib -no_warning_for_no_symbols $(LIBDIR)/$(CONFIG)/libgrpc++_alts.a
endif



ifeq ($(SYSTEM),MINGW32)
$(LIBDIR)/$(CONFIG)/grpc++_alts$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP): $(LIBGRPC++_ALTS_OBJS)  $(ZLIB_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP) $(PROTOBUF_DEP) $(LIBDIR)/$(CONFIG)/grpc++$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBDIR)/$(CONFIG)/grpc$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/gpr$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/address_sorting$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/upb$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(OPENSSL_DEP)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,--output-def=$(LIBDIR)/$(CONFIG)/grpc++_alts$(SHARED_VERSION_CPP).def -Wl,--out-implib=$(LIBDIR)/$(CONFIG)/libgrpc++_alts$(SHARED_VERSION_CPP)-dll.a -o $(LIBDIR)/$(CONFIG)/grpc++_alts$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBGRPC++_ALTS_OBJS) $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) -lgrpc++$(SHARED_VERSION_CPP)-dll -lgrpc$(SHARED_VERSION_CORE)-dll -lgpr$(SHARED_VERSION_CORE)-dll -laddress_sorting$(SHARED_VERSION_CORE)-dll -lupb$(SHARED_VERSION_CORE)-dll
else
$(LIBDIR)/$(CONFIG)/libgrpc++_alts$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP): $(LIBGRPC++_ALTS_OBJS)  $(ZLIB_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP) $(PROTOBUF_DEP) $(LIBDIR)/$(CONFIG)/libgrpc++.$(SHARED_EXT_CPP) $(LIBDIR)/$(CONFIG)/libgrpc.$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/libgpr.$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/libaddress_sorting.$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/libupb.$(SHARED_EXT_CORE) $(OPENSSL_DEP)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
ifeq ($(SYSTEM),Darwin)
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -install_name $(SHARED_PREFIX)grpc++_alts$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) -dynamiclib -o $(LIBDIR)/$(CONFIG)/libgrpc++_alts$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBGRPC++_ALTS_OBJS) $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) -lgrpc++ -lgrpc -lgpr -laddress_sorting -lupb
else
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,-soname,libgrpc++_alts.so.1 -o $(LIBDIR)/$(CONFIG)/libgrpc++_alts$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBGRPC++_ALTS_OBJS) $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) -lgrpc++ -lgrpc -lgpr -laddress_sorting -lupb
	$(Q) ln -sf $(SHARED_PREFIX)grpc++_alts$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBDIR)/$(CONFIG)/libgrpc++_alts$(SHARED_VERSION_CPP).so.1
	$(Q) ln -sf $(SHARED_PREFIX)grpc++_alts$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBDIR)/$(CONFIG)/libgrpc++_alts$(SHARED_VERSION_CPP).so
endif
endif

endif

endif

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(LIBGRPC++_ALTS_OBJS:.o=.dep)
endif
endif
# end of build recipe for library "grpc++_alts"


# start of build recipe for library "grpc++_error_details" (generated by makelib(lib) template function)
LIBGRPC++_ERROR_DETAILS_SRC = \
    $(GENDIR)/src/proto/grpc/status/status.pb.cc $(GENDIR)/src/proto/grpc/status/status.grpc.pb.cc \
    src/cpp/util/error_details.cc \

PUBLIC_HEADERS_CXX += \
    include/grpc++/support/error_details.h \
    include/grpcpp/support/error_details.h \

LIBGRPC++_ERROR_DETAILS_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBGRPC++_ERROR_DETAILS_SRC))))


ifeq ($(NO_SECURE),true)

# You can't build secure libraries if you don't have OpenSSL.

$(LIBDIR)/$(CONFIG)/libgrpc++_error_details.a: openssl_dep_error

$(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)grpc++_error_details$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP): openssl_dep_error

else

ifeq ($(NO_PROTOBUF),true)

# You can't build a C++ library if you don't have protobuf - a bit overreached, but still okay.

$(LIBDIR)/$(CONFIG)/libgrpc++_error_details.a: protobuf_dep_error

$(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)grpc++_error_details$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP): protobuf_dep_error

else

$(LIBDIR)/$(CONFIG)/libgrpc++_error_details.a: $(ZLIB_DEP) $(OPENSSL_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP)  $(PROTOBUF_DEP) $(LIBGRPC++_ERROR_DETAILS_OBJS) 
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libgrpc++_error_details.a
	$(Q) $(AR) $(ARFLAGS) $(LIBDIR)/$(CONFIG)/libgrpc++_error_details.a $(LIBGRPC++_ERROR_DETAILS_OBJS) 
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib -no_warning_for_no_symbols $(LIBDIR)/$(CONFIG)/libgrpc++_error_details.a
endif



ifeq ($(SYSTEM),MINGW32)
$(LIBDIR)/$(CONFIG)/grpc++_error_details$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP): $(LIBGRPC++_ERROR_DETAILS_OBJS)  $(ZLIB_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP) $(PROTOBUF_DEP) $(LIBDIR)/$(CONFIG)/grpc++$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBDIR)/$(CONFIG)/grpc$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/gpr$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/address_sorting$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/upb$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(OPENSSL_DEP)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,--output-def=$(LIBDIR)/$(CONFIG)/grpc++_error_details$(SHARED_VERSION_CPP).def -Wl,--out-implib=$(LIBDIR)/$(CONFIG)/libgrpc++_error_details$(SHARED_VERSION_CPP)-dll.a -o $(LIBDIR)/$(CONFIG)/grpc++_error_details$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBGRPC++_ERROR_DETAILS_OBJS) $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) -lgrpc++$(SHARED_VERSION_CPP)-dll -lgrpc$(SHARED_VERSION_CORE)-dll -lgpr$(SHARED_VERSION_CORE)-dll -laddress_sorting$(SHARED_VERSION_CORE)-dll -lupb$(SHARED_VERSION_CORE)-dll
else
$(LIBDIR)/$(CONFIG)/libgrpc++_error_details$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP): $(LIBGRPC++_ERROR_DETAILS_OBJS)  $(ZLIB_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP) $(PROTOBUF_DEP) $(LIBDIR)/$(CONFIG)/libgrpc++.$(SHARED_EXT_CPP) $(LIBDIR)/$(CONFIG)/libgrpc.$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/libgpr.$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/libaddress_sorting.$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/libupb.$(SHARED_EXT_CORE) $(OPENSSL_DEP)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
ifeq ($(SYSTEM),Darwin)
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -install_name $(SHARED_PREFIX)grpc++_error_details$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) -dynamiclib -o $(LIBDIR)/$(CONFIG)/libgrpc++_error_details$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBGRPC++_ERROR_DETAILS_OBJS) $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) -lgrpc++ -lgrpc -lgpr -laddress_sorting -lupb
else
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,-soname,libgrpc++_error_details.so.1 -o $(LIBDIR)/$(CONFIG)/libgrpc++_error_details$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBGRPC++_ERROR_DETAILS_OBJS) $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) -lgrpc++ -lgrpc -lgpr -laddress_sorting -lupb
	$(Q) ln -sf $(SHARED_PREFIX)grpc++_error_details$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBDIR)/$(CONFIG)/libgrpc++_error_details$(SHARED_VERSION_CPP).so.1
	$(Q) ln -sf $(SHARED_PREFIX)grpc++_error_details$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBDIR)/$(CONFIG)/libgrpc++_error_details$(SHARED_VERSION_CPP).so
endif
endif

endif

endif

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(LIBGRPC++_ERROR_DETAILS_OBJS:.o=.dep)
endif
endif
$(OBJDIR)/$(CONFIG)/src/cpp/util/error_details.o: $(GENDIR)/src/proto/grpc/status/status.pb.cc $(GENDIR)/src/proto/grpc/status/status.grpc.pb.cc
# end of build recipe for library "grpc++_error_details"


# start of build recipe for library "grpc++_reflection" (generated by makelib(lib) template function)
LIBGRPC++_REFLECTION_SRC = \
    $(GENDIR)/src/proto/grpc/reflection/v1alpha/reflection.pb.cc $(GENDIR)/src/proto/grpc/reflection/v1alpha/reflection.grpc.pb.cc \
    src/cpp/ext/proto_server_reflection.cc \
    src/cpp/ext/proto_server_reflection_plugin.cc \

PUBLIC_HEADERS_CXX += \
    include/grpc++/ext/proto_server_reflection_plugin.h \
    include/grpcpp/ext/proto_server_reflection_plugin.h \

LIBGRPC++_REFLECTION_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBGRPC++_REFLECTION_SRC))))


ifeq ($(NO_SECURE),true)

# You can't build secure libraries if you don't have OpenSSL.

$(LIBDIR)/$(CONFIG)/libgrpc++_reflection.a: openssl_dep_error

$(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)grpc++_reflection$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP): openssl_dep_error

else

ifeq ($(NO_PROTOBUF),true)

# You can't build a C++ library if you don't have protobuf - a bit overreached, but still okay.

$(LIBDIR)/$(CONFIG)/libgrpc++_reflection.a: protobuf_dep_error

$(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)grpc++_reflection$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP): protobuf_dep_error

else

$(LIBDIR)/$(CONFIG)/libgrpc++_reflection.a: $(ZLIB_DEP) $(OPENSSL_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP)  $(PROTOBUF_DEP) $(LIBGRPC++_REFLECTION_OBJS) 
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libgrpc++_reflection.a
	$(Q) $(AR) $(ARFLAGS) $(LIBDIR)/$(CONFIG)/libgrpc++_reflection.a $(LIBGRPC++_REFLECTION_OBJS) 
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib -no_warning_for_no_symbols $(LIBDIR)/$(CONFIG)/libgrpc++_reflection.a
endif



ifeq ($(SYSTEM),MINGW32)
$(LIBDIR)/$(CONFIG)/grpc++_reflection$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP): $(LIBGRPC++_REFLECTION_OBJS)  $(ZLIB_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP) $(PROTOBUF_DEP) $(LIBDIR)/$(CONFIG)/grpc++$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBDIR)/$(CONFIG)/grpc$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/gpr$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/address_sorting$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/upb$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(OPENSSL_DEP)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,--output-def=$(LIBDIR)/$(CONFIG)/grpc++_reflection$(SHARED_VERSION_CPP).def -Wl,--out-implib=$(LIBDIR)/$(CONFIG)/libgrpc++_reflection$(SHARED_VERSION_CPP)-dll.a -o $(LIBDIR)/$(CONFIG)/grpc++_reflection$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBGRPC++_REFLECTION_OBJS) $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) -lgrpc++$(SHARED_VERSION_CPP)-dll -lgrpc$(SHARED_VERSION_CORE)-dll -lgpr$(SHARED_VERSION_CORE)-dll -laddress_sorting$(SHARED_VERSION_CORE)-dll -lupb$(SHARED_VERSION_CORE)-dll
else
$(LIBDIR)/$(CONFIG)/libgrpc++_reflection$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP): $(LIBGRPC++_REFLECTION_OBJS)  $(ZLIB_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP) $(PROTOBUF_DEP) $(LIBDIR)/$(CONFIG)/libgrpc++.$(SHARED_EXT_CPP) $(LIBDIR)/$(CONFIG)/libgrpc.$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/libgpr.$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/libaddress_sorting.$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/libupb.$(SHARED_EXT_CORE) $(OPENSSL_DEP)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
ifeq ($(SYSTEM),Darwin)
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -install_name $(SHARED_PREFIX)grpc++_reflection$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) -dynamiclib -o $(LIBDIR)/$(CONFIG)/libgrpc++_reflection$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBGRPC++_REFLECTION_OBJS) $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) -lgrpc++ -lgrpc -lgpr -laddress_sorting -lupb
else
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,-soname,libgrpc++_reflection.so.1 -o $(LIBDIR)/$(CONFIG)/libgrpc++_reflection$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBGRPC++_REFLECTION_OBJS) $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) -lgrpc++ -lgrpc -lgpr -laddress_sorting -lupb
	$(Q) ln -sf $(SHARED_PREFIX)grpc++_reflection$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBDIR)/$(CONFIG)/libgrpc++_reflection$(SHARED_VERSION_CPP).so.1
	$(Q) ln -sf $(SHARED_PREFIX)grpc++_reflection$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBDIR)/$(CONFIG)/libgrpc++_reflection$(SHARED_VERSION_CPP).so
endif
endif

endif

endif

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(LIBGRPC++_REFLECTION_OBJS:.o=.dep)
endif
endif
$(OBJDIR)/$(CONFIG)/src/cpp/ext/proto_server_reflection.o: $(GENDIR)/src/proto/grpc/reflection/v1alpha/reflection.pb.cc $(GENDIR)/src/proto/grpc/reflection/v1alpha/reflection.grpc.pb.cc
$(OBJDIR)/$(CONFIG)/src/cpp/ext/proto_server_reflection_plugin.o: $(GENDIR)/src/proto/grpc/reflection/v1alpha/reflection.pb.cc $(GENDIR)/src/proto/grpc/reflection/v1alpha/reflection.grpc.pb.cc
# end of build recipe for library "grpc++_reflection"


# start of build recipe for library "grpc++_unsecure" (generated by makelib(lib) template function)
LIBGRPC++_UNSECURE_SRC = \
    src/cpp/client/channel_cc.cc \
    src/cpp/client/client_callback.cc \
    src/cpp/client/client_context.cc \
    src/cpp/client/client_interceptor.cc \
    src/cpp/client/create_channel.cc \
    src/cpp/client/create_channel_internal.cc \
    src/cpp/client/create_channel_posix.cc \
    src/cpp/client/credentials_cc.cc \
    src/cpp/client/insecure_credentials.cc \
    src/cpp/codegen/codegen_init.cc \
    src/cpp/common/alarm.cc \
    src/cpp/common/channel_arguments.cc \
    src/cpp/common/channel_filter.cc \
    src/cpp/common/completion_queue_cc.cc \
    src/cpp/common/core_codegen.cc \
    src/cpp/common/insecure_create_auth_context.cc \
    src/cpp/common/resource_quota_cc.cc \
    src/cpp/common/rpc_method.cc \
    src/cpp/common/validate_service_config.cc \
    src/cpp/common/version_cc.cc \
    src/cpp/server/async_generic_service.cc \
    src/cpp/server/channel_argument_option.cc \
    src/cpp/server/create_default_thread_pool.cc \
    src/cpp/server/dynamic_thread_pool.cc \
    src/cpp/server/external_connection_acceptor_impl.cc \
    src/cpp/server/health/default_health_check_service.cc \
    src/cpp/server/health/health_check_service.cc \
    src/cpp/server/health/health_check_service_server_builder_option.cc \
    src/cpp/server/insecure_server_credentials.cc \
    src/cpp/server/server_builder.cc \
    src/cpp/server/server_callback.cc \
    src/cpp/server/server_cc.cc \
    src/cpp/server/server_context.cc \
    src/cpp/server/server_credentials.cc \
    src/cpp/server/server_posix.cc \
    src/cpp/thread_manager/thread_manager.cc \
    src/cpp/util/byte_buffer_cc.cc \
    src/cpp/util/status.cc \
    src/cpp/util/string_ref.cc \
    src/cpp/util/time_cc.cc \

PUBLIC_HEADERS_CXX += \
    include/grpc++/alarm.h \
    include/grpc++/channel.h \
    include/grpc++/client_context.h \
    include/grpc++/completion_queue.h \
    include/grpc++/create_channel.h \
    include/grpc++/create_channel_posix.h \
    include/grpc++/ext/health_check_service_server_builder_option.h \
    include/grpc++/generic/async_generic_service.h \
    include/grpc++/generic/generic_stub.h \
    include/grpc++/grpc++.h \
    include/grpc++/health_check_service_interface.h \
    include/grpc++/impl/call.h \
    include/grpc++/impl/channel_argument_option.h \
    include/grpc++/impl/client_unary_call.h \
    include/grpc++/impl/codegen/async_stream.h \
    include/grpc++/impl/codegen/async_unary_call.h \
    include/grpc++/impl/codegen/byte_buffer.h \
    include/grpc++/impl/codegen/call.h \
    include/grpc++/impl/codegen/call_hook.h \
    include/grpc++/impl/codegen/channel_interface.h \
    include/grpc++/impl/codegen/client_context.h \
    include/grpc++/impl/codegen/client_unary_call.h \
    include/grpc++/impl/codegen/completion_queue.h \
    include/grpc++/impl/codegen/completion_queue_tag.h \
    include/grpc++/impl/codegen/config.h \
    include/grpc++/impl/codegen/config_protobuf.h \
    include/grpc++/impl/codegen/core_codegen.h \
    include/grpc++/impl/codegen/core_codegen_interface.h \
    include/grpc++/impl/codegen/create_auth_context.h \
    include/grpc++/impl/codegen/grpc_library.h \
    include/grpc++/impl/codegen/metadata_map.h \
    include/grpc++/impl/codegen/method_handler_impl.h \
    include/grpc++/impl/codegen/proto_utils.h \
    include/grpc++/impl/codegen/rpc_method.h \
    include/grpc++/impl/codegen/rpc_service_method.h \
    include/grpc++/impl/codegen/security/auth_context.h \
    include/grpc++/impl/codegen/serialization_traits.h \
    include/grpc++/impl/codegen/server_context.h \
    include/grpc++/impl/codegen/server_interface.h \
    include/grpc++/impl/codegen/service_type.h \
    include/grpc++/impl/codegen/slice.h \
    include/grpc++/impl/codegen/status.h \
    include/grpc++/impl/codegen/status_code_enum.h \
    include/grpc++/impl/codegen/string_ref.h \
    include/grpc++/impl/codegen/stub_options.h \
    include/grpc++/impl/codegen/sync_stream.h \
    include/grpc++/impl/codegen/time.h \
    include/grpc++/impl/grpc_library.h \
    include/grpc++/impl/method_handler_impl.h \
    include/grpc++/impl/rpc_method.h \
    include/grpc++/impl/rpc_service_method.h \
    include/grpc++/impl/serialization_traits.h \
    include/grpc++/impl/server_builder_option.h \
    include/grpc++/impl/server_builder_plugin.h \
    include/grpc++/impl/server_initializer.h \
    include/grpc++/impl/service_type.h \
    include/grpc++/resource_quota.h \
    include/grpc++/security/auth_context.h \
    include/grpc++/security/auth_metadata_processor.h \
    include/grpc++/security/credentials.h \
    include/grpc++/security/server_credentials.h \
    include/grpc++/server.h \
    include/grpc++/server_builder.h \
    include/grpc++/server_context.h \
    include/grpc++/server_posix.h \
    include/grpc++/support/async_stream.h \
    include/grpc++/support/async_unary_call.h \
    include/grpc++/support/byte_buffer.h \
    include/grpc++/support/channel_arguments.h \
    include/grpc++/support/config.h \
    include/grpc++/support/slice.h \
    include/grpc++/support/status.h \
    include/grpc++/support/status_code_enum.h \
    include/grpc++/support/string_ref.h \
    include/grpc++/support/stub_options.h \
    include/grpc++/support/sync_stream.h \
    include/grpc++/support/time.h \
    include/grpcpp/alarm.h \
    include/grpcpp/alarm_impl.h \
    include/grpcpp/channel.h \
    include/grpcpp/client_context.h \
    include/grpcpp/completion_queue.h \
    include/grpcpp/create_channel.h \
    include/grpcpp/create_channel_posix.h \
    include/grpcpp/ext/health_check_service_server_builder_option.h \
    include/grpcpp/generic/async_generic_service.h \
    include/grpcpp/generic/generic_stub.h \
    include/grpcpp/grpcpp.h \
    include/grpcpp/health_check_service_interface.h \
    include/grpcpp/impl/call.h \
    include/grpcpp/impl/channel_argument_option.h \
    include/grpcpp/impl/client_unary_call.h \
    include/grpcpp/impl/codegen/async_generic_service.h \
    include/grpcpp/impl/codegen/async_stream.h \
    include/grpcpp/impl/codegen/async_stream_impl.h \
    include/grpcpp/impl/codegen/async_unary_call.h \
    include/grpcpp/impl/codegen/async_unary_call_impl.h \
    include/grpcpp/impl/codegen/byte_buffer.h \
    include/grpcpp/impl/codegen/call.h \
    include/grpcpp/impl/codegen/call_hook.h \
    include/grpcpp/impl/codegen/call_op_set.h \
    include/grpcpp/impl/codegen/call_op_set_interface.h \
    include/grpcpp/impl/codegen/callback_common.h \
    include/grpcpp/impl/codegen/channel_interface.h \
    include/grpcpp/impl/codegen/client_callback.h \
    include/grpcpp/impl/codegen/client_callback_impl.h \
    include/grpcpp/impl/codegen/client_context.h \
    include/grpcpp/impl/codegen/client_interceptor.h \
    include/grpcpp/impl/codegen/client_unary_call.h \
    include/grpcpp/impl/codegen/completion_queue.h \
    include/grpcpp/impl/codegen/completion_queue_tag.h \
    include/grpcpp/impl/codegen/config.h \
    include/grpcpp/impl/codegen/config_protobuf.h \
    include/grpcpp/impl/codegen/core_codegen.h \
    include/grpcpp/impl/codegen/core_codegen_interface.h \
    include/grpcpp/impl/codegen/create_auth_context.h \
    include/grpcpp/impl/codegen/delegating_channel.h \
    include/grpcpp/impl/codegen/grpc_library.h \
    include/grpcpp/impl/codegen/intercepted_channel.h \
    include/grpcpp/impl/codegen/interceptor.h \
    include/grpcpp/impl/codegen/interceptor_common.h \
    include/grpcpp/impl/codegen/message_allocator.h \
    include/grpcpp/impl/codegen/metadata_map.h \
    include/grpcpp/impl/codegen/method_handler.h \
    include/grpcpp/impl/codegen/method_handler_impl.h \
    include/grpcpp/impl/codegen/proto_buffer_reader.h \
    include/grpcpp/impl/codegen/proto_buffer_writer.h \
    include/grpcpp/impl/codegen/proto_utils.h \
    include/grpcpp/impl/codegen/rpc_method.h \
    include/grpcpp/impl/codegen/rpc_service_method.h \
    include/grpcpp/impl/codegen/security/auth_context.h \
    include/grpcpp/impl/codegen/serialization_traits.h \
    include/grpcpp/impl/codegen/server_callback.h \
    include/grpcpp/impl/codegen/server_callback_handlers.h \
    include/grpcpp/impl/codegen/server_callback_impl.h \
    include/grpcpp/impl/codegen/server_context.h \
    include/grpcpp/impl/codegen/server_context_impl.h \
    include/grpcpp/impl/codegen/server_interceptor.h \
    include/grpcpp/impl/codegen/server_interface.h \
    include/grpcpp/impl/codegen/service_type.h \
    include/grpcpp/impl/codegen/slice.h \
    include/grpcpp/impl/codegen/status.h \
    include/grpcpp/impl/codegen/status_code_enum.h \
    include/grpcpp/impl/codegen/string_ref.h \
    include/grpcpp/impl/codegen/stub_options.h \
    include/grpcpp/impl/codegen/sync.h \
    include/grpcpp/impl/codegen/sync_stream.h \
    include/grpcpp/impl/codegen/sync_stream_impl.h \
    include/grpcpp/impl/codegen/time.h \
    include/grpcpp/impl/grpc_library.h \
    include/grpcpp/impl/method_handler_impl.h \
    include/grpcpp/impl/rpc_method.h \
    include/grpcpp/impl/rpc_service_method.h \
    include/grpcpp/impl/serialization_traits.h \
    include/grpcpp/impl/server_builder_option.h \
    include/grpcpp/impl/server_builder_option_impl.h \
    include/grpcpp/impl/server_builder_plugin.h \
    include/grpcpp/impl/server_initializer.h \
    include/grpcpp/impl/server_initializer_impl.h \
    include/grpcpp/impl/service_type.h \
    include/grpcpp/resource_quota.h \
    include/grpcpp/security/auth_context.h \
    include/grpcpp/security/auth_metadata_processor.h \
    include/grpcpp/security/credentials.h \
    include/grpcpp/security/server_credentials.h \
    include/grpcpp/security/tls_credentials_options.h \
    include/grpcpp/server.h \
    include/grpcpp/server_builder.h \
    include/grpcpp/server_context.h \
    include/grpcpp/server_impl.h \
    include/grpcpp/server_posix.h \
    include/grpcpp/support/async_stream.h \
    include/grpcpp/support/async_stream_impl.h \
    include/grpcpp/support/async_unary_call.h \
    include/grpcpp/support/async_unary_call_impl.h \
    include/grpcpp/support/byte_buffer.h \
    include/grpcpp/support/channel_arguments.h \
    include/grpcpp/support/client_callback.h \
    include/grpcpp/support/client_callback_impl.h \
    include/grpcpp/support/client_interceptor.h \
    include/grpcpp/support/config.h \
    include/grpcpp/support/interceptor.h \
    include/grpcpp/support/message_allocator.h \
    include/grpcpp/support/method_handler.h \
    include/grpcpp/support/proto_buffer_reader.h \
    include/grpcpp/support/proto_buffer_writer.h \
    include/grpcpp/support/server_callback.h \
    include/grpcpp/support/server_callback_impl.h \
    include/grpcpp/support/server_interceptor.h \
    include/grpcpp/support/slice.h \
    include/grpcpp/support/status.h \
    include/grpcpp/support/status_code_enum.h \
    include/grpcpp/support/string_ref.h \
    include/grpcpp/support/stub_options.h \
    include/grpcpp/support/sync_stream.h \
    include/grpcpp/support/sync_stream_impl.h \
    include/grpcpp/support/time.h \
    include/grpcpp/support/validate_service_config.h \

LIBGRPC++_UNSECURE_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBGRPC++_UNSECURE_SRC))))


ifeq ($(NO_PROTOBUF),true)

# You can't build a C++ library if you don't have protobuf - a bit overreached, but still okay.

$(LIBDIR)/$(CONFIG)/libgrpc++_unsecure.a: protobuf_dep_error

$(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)grpc++_unsecure$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP): protobuf_dep_error

else

$(LIBDIR)/$(CONFIG)/libgrpc++_unsecure.a: $(ZLIB_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP)  $(PROTOBUF_DEP) $(LIBGRPC++_UNSECURE_OBJS)  $(LIBGPR_OBJS)  $(LIBGRPC_ABSEIL_OBJS)  $(ZLIB_MERGE_OBJS)  $(CARES_MERGE_OBJS)  $(ADDRESS_SORTING_MERGE_OBJS)  $(RE2_MERGE_OBJS)  $(UPB_MERGE_OBJS) 
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libgrpc++_unsecure.a
	$(Q) $(AR) $(ARFLAGS) $(LIBDIR)/$(CONFIG)/libgrpc++_unsecure.a $(LIBGRPC++_UNSECURE_OBJS)  $(LIBGPR_OBJS)  $(LIBGRPC_ABSEIL_OBJS)  $(ZLIB_MERGE_OBJS)  $(CARES_MERGE_OBJS)  $(ADDRESS_SORTING_MERGE_OBJS)  $(RE2_MERGE_OBJS)  $(UPB_MERGE_OBJS) 
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib -no_warning_for_no_symbols $(LIBDIR)/$(CONFIG)/libgrpc++_unsecure.a
endif



ifeq ($(SYSTEM),MINGW32)
$(LIBDIR)/$(CONFIG)/grpc++_unsecure$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP): $(LIBGRPC++_UNSECURE_OBJS)  $(ZLIB_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP) $(PROTOBUF_DEP) $(LIBDIR)/$(CONFIG)/grpc_unsecure$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/gpr$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/address_sorting$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/upb$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,--output-def=$(LIBDIR)/$(CONFIG)/grpc++_unsecure$(SHARED_VERSION_CPP).def -Wl,--out-implib=$(LIBDIR)/$(CONFIG)/libgrpc++_unsecure$(SHARED_VERSION_CPP)-dll.a -o $(LIBDIR)/$(CONFIG)/grpc++_unsecure$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBGRPC++_UNSECURE_OBJS) $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) -lgrpc_unsecure$(SHARED_VERSION_CORE)-dll -lgpr$(SHARED_VERSION_CORE)-dll -laddress_sorting$(SHARED_VERSION_CORE)-dll -lupb$(SHARED_VERSION_CORE)-dll
else
$(LIBDIR)/$(CONFIG)/libgrpc++_unsecure$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP): $(LIBGRPC++_UNSECURE_OBJS)  $(ZLIB_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP) $(PROTOBUF_DEP) $(LIBDIR)/$(CONFIG)/libgrpc_unsecure.$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/libgpr.$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/libaddress_sorting.$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/libupb.$(SHARED_EXT_CORE)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
ifeq ($(SYSTEM),Darwin)
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -install_name $(SHARED_PREFIX)grpc++_unsecure$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) -dynamiclib -o $(LIBDIR)/$(CONFIG)/libgrpc++_unsecure$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBGRPC++_UNSECURE_OBJS) $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) -lgrpc_unsecure -lgpr -laddress_sorting -lupb
else
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,-soname,libgrpc++_unsecure.so.1 -o $(LIBDIR)/$(CONFIG)/libgrpc++_unsecure$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBGRPC++_UNSECURE_OBJS) $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) -lgrpc_unsecure -lgpr -laddress_sorting -lupb
	$(Q) ln -sf $(SHARED_PREFIX)grpc++_unsecure$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBDIR)/$(CONFIG)/libgrpc++_unsecure$(SHARED_VERSION_CPP).so.1
	$(Q) ln -sf $(SHARED_PREFIX)grpc++_unsecure$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBDIR)/$(CONFIG)/libgrpc++_unsecure$(SHARED_VERSION_CPP).so
endif
endif

endif

ifneq ($(NO_DEPS),true)
-include $(LIBGRPC++_UNSECURE_OBJS:.o=.dep)
endif
# end of build recipe for library "grpc++_unsecure"


# start of build recipe for library "grpc_plugin_support" (generated by makelib(lib) template function)
LIBGRPC_PLUGIN_SUPPORT_SRC = \
    src/compiler/cpp_generator.cc \
    src/compiler/csharp_generator.cc \
    src/compiler/node_generator.cc \
    src/compiler/objective_c_generator.cc \
    src/compiler/php_generator.cc \
    src/compiler/python_generator.cc \
    src/compiler/ruby_generator.cc \

PUBLIC_HEADERS_CXX += \
    include/grpc++/impl/codegen/config_protobuf.h \
    include/grpcpp/impl/codegen/config_protobuf.h \

LIBGRPC_PLUGIN_SUPPORT_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBGRPC_PLUGIN_SUPPORT_SRC))))


ifeq ($(NO_PROTOBUF),true)

# You can't build a C++ library if you don't have protobuf - a bit overreached, but still okay.

$(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a: protobuf_dep_error


else

$(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a: $(ZLIB_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP)  $(PROTOBUF_DEP) $(LIBGRPC_PLUGIN_SUPPORT_OBJS) 
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a
	$(Q) $(AR) $(ARFLAGS) $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a $(LIBGRPC_PLUGIN_SUPPORT_OBJS) 
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib -no_warning_for_no_symbols $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a
endif




endif

ifneq ($(NO_DEPS),true)
-include $(LIBGRPC_PLUGIN_SUPPORT_OBJS:.o=.dep)
endif
# end of build recipe for library "grpc_plugin_support"


# start of build recipe for library "grpcpp_channelz" (generated by makelib(lib) template function)
LIBGRPCPP_CHANNELZ_SRC = \
    $(GENDIR)/src/proto/grpc/channelz/channelz.pb.cc $(GENDIR)/src/proto/grpc/channelz/channelz.grpc.pb.cc \
    src/cpp/server/channelz/channelz_service.cc \
    src/cpp/server/channelz/channelz_service_plugin.cc \

PUBLIC_HEADERS_CXX += \
    include/grpcpp/ext/channelz_service_plugin.h \
    include/grpcpp/ext/channelz_service_plugin_impl.h \

LIBGRPCPP_CHANNELZ_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBGRPCPP_CHANNELZ_SRC))))


ifeq ($(NO_SECURE),true)

# You can't build secure libraries if you don't have OpenSSL.

$(LIBDIR)/$(CONFIG)/libgrpcpp_channelz.a: openssl_dep_error

$(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)grpcpp_channelz$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP): openssl_dep_error

else

ifeq ($(NO_PROTOBUF),true)

# You can't build a C++ library if you don't have protobuf - a bit overreached, but still okay.

$(LIBDIR)/$(CONFIG)/libgrpcpp_channelz.a: protobuf_dep_error

$(LIBDIR)/$(CONFIG)/$(SHARED_PREFIX)grpcpp_channelz$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP): protobuf_dep_error

else

$(LIBDIR)/$(CONFIG)/libgrpcpp_channelz.a: $(ZLIB_DEP) $(OPENSSL_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP)  $(PROTOBUF_DEP) $(LIBGRPCPP_CHANNELZ_OBJS) 
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libgrpcpp_channelz.a
	$(Q) $(AR) $(ARFLAGS) $(LIBDIR)/$(CONFIG)/libgrpcpp_channelz.a $(LIBGRPCPP_CHANNELZ_OBJS) 
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib -no_warning_for_no_symbols $(LIBDIR)/$(CONFIG)/libgrpcpp_channelz.a
endif



ifeq ($(SYSTEM),MINGW32)
$(LIBDIR)/$(CONFIG)/grpcpp_channelz$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP): $(LIBGRPCPP_CHANNELZ_OBJS)  $(ZLIB_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP) $(PROTOBUF_DEP) $(LIBDIR)/$(CONFIG)/grpc++$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBDIR)/$(CONFIG)/grpc$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/gpr$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/address_sorting$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/upb$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(OPENSSL_DEP)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,--output-def=$(LIBDIR)/$(CONFIG)/grpcpp_channelz$(SHARED_VERSION_CPP).def -Wl,--out-implib=$(LIBDIR)/$(CONFIG)/libgrpcpp_channelz$(SHARED_VERSION_CPP)-dll.a -o $(LIBDIR)/$(CONFIG)/grpcpp_channelz$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBGRPCPP_CHANNELZ_OBJS) $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) -lgrpc++$(SHARED_VERSION_CPP)-dll -lgrpc$(SHARED_VERSION_CORE)-dll -lgpr$(SHARED_VERSION_CORE)-dll -laddress_sorting$(SHARED_VERSION_CORE)-dll -lupb$(SHARED_VERSION_CORE)-dll
else
$(LIBDIR)/$(CONFIG)/libgrpcpp_channelz$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP): $(LIBGRPCPP_CHANNELZ_OBJS)  $(ZLIB_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP) $(PROTOBUF_DEP) $(LIBDIR)/$(CONFIG)/libgrpc++.$(SHARED_EXT_CPP) $(LIBDIR)/$(CONFIG)/libgrpc.$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/libgpr.$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/libaddress_sorting.$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/libupb.$(SHARED_EXT_CORE) $(OPENSSL_DEP)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
ifeq ($(SYSTEM),Darwin)
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -install_name $(SHARED_PREFIX)grpcpp_channelz$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) -dynamiclib -o $(LIBDIR)/$(CONFIG)/libgrpcpp_channelz$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBGRPCPP_CHANNELZ_OBJS) $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) -lgrpc++ -lgrpc -lgpr -laddress_sorting -lupb
else
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,-soname,libgrpcpp_channelz.so.1 -o $(LIBDIR)/$(CONFIG)/libgrpcpp_channelz$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBGRPCPP_CHANNELZ_OBJS) $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBSXX) $(LDLIBS_PROTOBUF) $(LDLIBS) -lgrpc++ -lgrpc -lgpr -laddress_sorting -lupb
	$(Q) ln -sf $(SHARED_PREFIX)grpcpp_channelz$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBDIR)/$(CONFIG)/libgrpcpp_channelz$(SHARED_VERSION_CPP).so.1
	$(Q) ln -sf $(SHARED_PREFIX)grpcpp_channelz$(SHARED_VERSION_CPP).$(SHARED_EXT_CPP) $(LIBDIR)/$(CONFIG)/libgrpcpp_channelz$(SHARED_VERSION_CPP).so
endif
endif

endif

endif

ifneq ($(NO_SECURE),true)
ifneq ($(NO_DEPS),true)
-include $(LIBGRPCPP_CHANNELZ_OBJS:.o=.dep)
endif
endif
$(OBJDIR)/$(CONFIG)/src/cpp/server/channelz/channelz_service.o: $(GENDIR)/src/proto/grpc/channelz/channelz.pb.cc $(GENDIR)/src/proto/grpc/channelz/channelz.grpc.pb.cc
$(OBJDIR)/$(CONFIG)/src/cpp/server/channelz/channelz_service_plugin.o: $(GENDIR)/src/proto/grpc/channelz/channelz.pb.cc $(GENDIR)/src/proto/grpc/channelz/channelz.grpc.pb.cc
# end of build recipe for library "grpcpp_channelz"


# start of build recipe for library "boringssl" (generated by makelib(lib) template function)
LIBBORINGSSL_SRC = \
    third_party/boringssl-with-bazel/err_data.c \
    third_party/boringssl-with-bazel/src/crypto/asn1/a_bitstr.c \
    third_party/boringssl-with-bazel/src/crypto/asn1/a_bool.c \
    third_party/boringssl-with-bazel/src/crypto/asn1/a_d2i_fp.c \
    third_party/boringssl-with-bazel/src/crypto/asn1/a_dup.c \
    third_party/boringssl-with-bazel/src/crypto/asn1/a_enum.c \
    third_party/boringssl-with-bazel/src/crypto/asn1/a_gentm.c \
    third_party/boringssl-with-bazel/src/crypto/asn1/a_i2d_fp.c \
    third_party/boringssl-with-bazel/src/crypto/asn1/a_int.c \
    third_party/boringssl-with-bazel/src/crypto/asn1/a_mbstr.c \
    third_party/boringssl-with-bazel/src/crypto/asn1/a_object.c \
    third_party/boringssl-with-bazel/src/crypto/asn1/a_octet.c \
    third_party/boringssl-with-bazel/src/crypto/asn1/a_print.c \
    third_party/boringssl-with-bazel/src/crypto/asn1/a_strnid.c \
    third_party/boringssl-with-bazel/src/crypto/asn1/a_time.c \
    third_party/boringssl-with-bazel/src/crypto/asn1/a_type.c \
    third_party/boringssl-with-bazel/src/crypto/asn1/a_utctm.c \
    third_party/boringssl-with-bazel/src/crypto/asn1/a_utf8.c \
    third_party/boringssl-with-bazel/src/crypto/asn1/asn1_lib.c \
    third_party/boringssl-with-bazel/src/crypto/asn1/asn1_par.c \
    third_party/boringssl-with-bazel/src/crypto/asn1/asn_pack.c \
    third_party/boringssl-with-bazel/src/crypto/asn1/f_enum.c \
    third_party/boringssl-with-bazel/src/crypto/asn1/f_int.c \
    third_party/boringssl-with-bazel/src/crypto/asn1/f_string.c \
    third_party/boringssl-with-bazel/src/crypto/asn1/tasn_dec.c \
    third_party/boringssl-with-bazel/src/crypto/asn1/tasn_enc.c \
    third_party/boringssl-with-bazel/src/crypto/asn1/tasn_fre.c \
    third_party/boringssl-with-bazel/src/crypto/asn1/tasn_new.c \
    third_party/boringssl-with-bazel/src/crypto/asn1/tasn_typ.c \
    third_party/boringssl-with-bazel/src/crypto/asn1/tasn_utl.c \
    third_party/boringssl-with-bazel/src/crypto/asn1/time_support.c \
    third_party/boringssl-with-bazel/src/crypto/base64/base64.c \
    third_party/boringssl-with-bazel/src/crypto/bio/bio.c \
    third_party/boringssl-with-bazel/src/crypto/bio/bio_mem.c \
    third_party/boringssl-with-bazel/src/crypto/bio/connect.c \
    third_party/boringssl-with-bazel/src/crypto/bio/fd.c \
    third_party/boringssl-with-bazel/src/crypto/bio/file.c \
    third_party/boringssl-with-bazel/src/crypto/bio/hexdump.c \
    third_party/boringssl-with-bazel/src/crypto/bio/pair.c \
    third_party/boringssl-with-bazel/src/crypto/bio/printf.c \
    third_party/boringssl-with-bazel/src/crypto/bio/socket.c \
    third_party/boringssl-with-bazel/src/crypto/bio/socket_helper.c \
    third_party/boringssl-with-bazel/src/crypto/bn_extra/bn_asn1.c \
    third_party/boringssl-with-bazel/src/crypto/bn_extra/convert.c \
    third_party/boringssl-with-bazel/src/crypto/buf/buf.c \
    third_party/boringssl-with-bazel/src/crypto/bytestring/asn1_compat.c \
    third_party/boringssl-with-bazel/src/crypto/bytestring/ber.c \
    third_party/boringssl-with-bazel/src/crypto/bytestring/cbb.c \
    third_party/boringssl-with-bazel/src/crypto/bytestring/cbs.c \
    third_party/boringssl-with-bazel/src/crypto/bytestring/unicode.c \
    third_party/boringssl-with-bazel/src/crypto/chacha/chacha.c \
    third_party/boringssl-with-bazel/src/crypto/cipher_extra/cipher_extra.c \
    third_party/boringssl-with-bazel/src/crypto/cipher_extra/derive_key.c \
    third_party/boringssl-with-bazel/src/crypto/cipher_extra/e_aesccm.c \
    third_party/boringssl-with-bazel/src/crypto/cipher_extra/e_aesctrhmac.c \
    third_party/boringssl-with-bazel/src/crypto/cipher_extra/e_aesgcmsiv.c \
    third_party/boringssl-with-bazel/src/crypto/cipher_extra/e_chacha20poly1305.c \
    third_party/boringssl-with-bazel/src/crypto/cipher_extra/e_null.c \
    third_party/boringssl-with-bazel/src/crypto/cipher_extra/e_rc2.c \
    third_party/boringssl-with-bazel/src/crypto/cipher_extra/e_rc4.c \
    third_party/boringssl-with-bazel/src/crypto/cipher_extra/e_tls.c \
    third_party/boringssl-with-bazel/src/crypto/cipher_extra/tls_cbc.c \
    third_party/boringssl-with-bazel/src/crypto/cmac/cmac.c \
    third_party/boringssl-with-bazel/src/crypto/conf/conf.c \
    third_party/boringssl-with-bazel/src/crypto/cpu-aarch64-fuchsia.c \
    third_party/boringssl-with-bazel/src/crypto/cpu-aarch64-linux.c \
    third_party/boringssl-with-bazel/src/crypto/cpu-arm-linux.c \
    third_party/boringssl-with-bazel/src/crypto/cpu-arm.c \
    third_party/boringssl-with-bazel/src/crypto/cpu-intel.c \
    third_party/boringssl-with-bazel/src/crypto/cpu-ppc64le.c \
    third_party/boringssl-with-bazel/src/crypto/crypto.c \
    third_party/boringssl-with-bazel/src/crypto/curve25519/curve25519.c \
    third_party/boringssl-with-bazel/src/crypto/curve25519/spake25519.c \
    third_party/boringssl-with-bazel/src/crypto/dh/check.c \
    third_party/boringssl-with-bazel/src/crypto/dh/dh.c \
    third_party/boringssl-with-bazel/src/crypto/dh/dh_asn1.c \
    third_party/boringssl-with-bazel/src/crypto/dh/params.c \
    third_party/boringssl-with-bazel/src/crypto/digest_extra/digest_extra.c \
    third_party/boringssl-with-bazel/src/crypto/dsa/dsa.c \
    third_party/boringssl-with-bazel/src/crypto/dsa/dsa_asn1.c \
    third_party/boringssl-with-bazel/src/crypto/ec_extra/ec_asn1.c \
    third_party/boringssl-with-bazel/src/crypto/ec_extra/ec_derive.c \
    third_party/boringssl-with-bazel/src/crypto/ec_extra/hash_to_curve.c \
    third_party/boringssl-with-bazel/src/crypto/ecdh_extra/ecdh_extra.c \
    third_party/boringssl-with-bazel/src/crypto/ecdsa_extra/ecdsa_asn1.c \
    third_party/boringssl-with-bazel/src/crypto/engine/engine.c \
    third_party/boringssl-with-bazel/src/crypto/err/err.c \
    third_party/boringssl-with-bazel/src/crypto/evp/digestsign.c \
    third_party/boringssl-with-bazel/src/crypto/evp/evp.c \
    third_party/boringssl-with-bazel/src/crypto/evp/evp_asn1.c \
    third_party/boringssl-with-bazel/src/crypto/evp/evp_ctx.c \
    third_party/boringssl-with-bazel/src/crypto/evp/p_dsa_asn1.c \
    third_party/boringssl-with-bazel/src/crypto/evp/p_ec.c \
    third_party/boringssl-with-bazel/src/crypto/evp/p_ec_asn1.c \
    third_party/boringssl-with-bazel/src/crypto/evp/p_ed25519.c \
    third_party/boringssl-with-bazel/src/crypto/evp/p_ed25519_asn1.c \
    third_party/boringssl-with-bazel/src/crypto/evp/p_rsa.c \
    third_party/boringssl-with-bazel/src/crypto/evp/p_rsa_asn1.c \
    third_party/boringssl-with-bazel/src/crypto/evp/p_x25519.c \
    third_party/boringssl-with-bazel/src/crypto/evp/p_x25519_asn1.c \
    third_party/boringssl-with-bazel/src/crypto/evp/pbkdf.c \
    third_party/boringssl-with-bazel/src/crypto/evp/print.c \
    third_party/boringssl-with-bazel/src/crypto/evp/scrypt.c \
    third_party/boringssl-with-bazel/src/crypto/evp/sign.c \
    third_party/boringssl-with-bazel/src/crypto/ex_data.c \
    third_party/boringssl-with-bazel/src/crypto/fipsmodule/bcm.c \
    third_party/boringssl-with-bazel/src/crypto/fipsmodule/fips_shared_support.c \
    third_party/boringssl-with-bazel/src/crypto/fipsmodule/is_fips.c \
    third_party/boringssl-with-bazel/src/crypto/hkdf/hkdf.c \
    third_party/boringssl-with-bazel/src/crypto/hpke/hpke.c \
    third_party/boringssl-with-bazel/src/crypto/hrss/hrss.c \
    third_party/boringssl-with-bazel/src/crypto/lhash/lhash.c \
    third_party/boringssl-with-bazel/src/crypto/mem.c \
    third_party/boringssl-with-bazel/src/crypto/obj/obj.c \
    third_party/boringssl-with-bazel/src/crypto/obj/obj_xref.c \
    third_party/boringssl-with-bazel/src/crypto/pem/pem_all.c \
    third_party/boringssl-with-bazel/src/crypto/pem/pem_info.c \
    third_party/boringssl-with-bazel/src/crypto/pem/pem_lib.c \
    third_party/boringssl-with-bazel/src/crypto/pem/pem_oth.c \
    third_party/boringssl-with-bazel/src/crypto/pem/pem_pk8.c \
    third_party/boringssl-with-bazel/src/crypto/pem/pem_pkey.c \
    third_party/boringssl-with-bazel/src/crypto/pem/pem_x509.c \
    third_party/boringssl-with-bazel/src/crypto/pem/pem_xaux.c \
    third_party/boringssl-with-bazel/src/crypto/pkcs7/pkcs7.c \
    third_party/boringssl-with-bazel/src/crypto/pkcs7/pkcs7_x509.c \
    third_party/boringssl-with-bazel/src/crypto/pkcs8/p5_pbev2.c \
    third_party/boringssl-with-bazel/src/crypto/pkcs8/pkcs8.c \
    third_party/boringssl-with-bazel/src/crypto/pkcs8/pkcs8_x509.c \
    third_party/boringssl-with-bazel/src/crypto/poly1305/poly1305.c \
    third_party/boringssl-with-bazel/src/crypto/poly1305/poly1305_arm.c \
    third_party/boringssl-with-bazel/src/crypto/poly1305/poly1305_vec.c \
    third_party/boringssl-with-bazel/src/crypto/pool/pool.c \
    third_party/boringssl-with-bazel/src/crypto/rand_extra/deterministic.c \
    third_party/boringssl-with-bazel/src/crypto/rand_extra/forkunsafe.c \
    third_party/boringssl-with-bazel/src/crypto/rand_extra/fuchsia.c \
    third_party/boringssl-with-bazel/src/crypto/rand_extra/rand_extra.c \
    third_party/boringssl-with-bazel/src/crypto/rand_extra/windows.c \
    third_party/boringssl-with-bazel/src/crypto/rc4/rc4.c \
    third_party/boringssl-with-bazel/src/crypto/refcount_c11.c \
    third_party/boringssl-with-bazel/src/crypto/refcount_lock.c \
    third_party/boringssl-with-bazel/src/crypto/rsa_extra/rsa_asn1.c \
    third_party/boringssl-with-bazel/src/crypto/rsa_extra/rsa_print.c \
    third_party/boringssl-with-bazel/src/crypto/siphash/siphash.c \
    third_party/boringssl-with-bazel/src/crypto/stack/stack.c \
    third_party/boringssl-with-bazel/src/crypto/thread.c \
    third_party/boringssl-with-bazel/src/crypto/thread_none.c \
    third_party/boringssl-with-bazel/src/crypto/thread_pthread.c \
    third_party/boringssl-with-bazel/src/crypto/thread_win.c \
    third_party/boringssl-with-bazel/src/crypto/trust_token/pmbtoken.c \
    third_party/boringssl-with-bazel/src/crypto/trust_token/trust_token.c \
    third_party/boringssl-with-bazel/src/crypto/x509/a_digest.c \
    third_party/boringssl-with-bazel/src/crypto/x509/a_sign.c \
    third_party/boringssl-with-bazel/src/crypto/x509/a_strex.c \
    third_party/boringssl-with-bazel/src/crypto/x509/a_verify.c \
    third_party/boringssl-with-bazel/src/crypto/x509/algorithm.c \
    third_party/boringssl-with-bazel/src/crypto/x509/asn1_gen.c \
    third_party/boringssl-with-bazel/src/crypto/x509/by_dir.c \
    third_party/boringssl-with-bazel/src/crypto/x509/by_file.c \
    third_party/boringssl-with-bazel/src/crypto/x509/i2d_pr.c \
    third_party/boringssl-with-bazel/src/crypto/x509/rsa_pss.c \
    third_party/boringssl-with-bazel/src/crypto/x509/t_crl.c \
    third_party/boringssl-with-bazel/src/crypto/x509/t_req.c \
    third_party/boringssl-with-bazel/src/crypto/x509/t_x509.c \
    third_party/boringssl-with-bazel/src/crypto/x509/t_x509a.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x509.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x509_att.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x509_cmp.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x509_d2.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x509_def.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x509_ext.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x509_lu.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x509_obj.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x509_r2x.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x509_req.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x509_set.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x509_trs.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x509_txt.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x509_v3.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x509_vfy.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x509_vpm.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x509cset.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x509name.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x509rset.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x509spki.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x_algor.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x_all.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x_attrib.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x_crl.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x_exten.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x_info.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x_name.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x_pkey.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x_pubkey.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x_req.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x_sig.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x_spki.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x_val.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x_x509.c \
    third_party/boringssl-with-bazel/src/crypto/x509/x_x509a.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/pcy_cache.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/pcy_data.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/pcy_lib.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/pcy_map.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/pcy_node.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/pcy_tree.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/v3_akey.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/v3_akeya.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/v3_alt.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/v3_bcons.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/v3_bitst.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/v3_conf.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/v3_cpols.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/v3_crld.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/v3_enum.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/v3_extku.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/v3_genn.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/v3_ia5.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/v3_info.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/v3_int.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/v3_lib.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/v3_ncons.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/v3_ocsp.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/v3_pci.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/v3_pcia.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/v3_pcons.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/v3_pku.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/v3_pmaps.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/v3_prn.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/v3_purp.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/v3_skey.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/v3_sxnet.c \
    third_party/boringssl-with-bazel/src/crypto/x509v3/v3_utl.c \
    third_party/boringssl-with-bazel/src/ssl/bio_ssl.cc \
    third_party/boringssl-with-bazel/src/ssl/d1_both.cc \
    third_party/boringssl-with-bazel/src/ssl/d1_lib.cc \
    third_party/boringssl-with-bazel/src/ssl/d1_pkt.cc \
    third_party/boringssl-with-bazel/src/ssl/d1_srtp.cc \
    third_party/boringssl-with-bazel/src/ssl/dtls_method.cc \
    third_party/boringssl-with-bazel/src/ssl/dtls_record.cc \
    third_party/boringssl-with-bazel/src/ssl/handoff.cc \
    third_party/boringssl-with-bazel/src/ssl/handshake.cc \
    third_party/boringssl-with-bazel/src/ssl/handshake_client.cc \
    third_party/boringssl-with-bazel/src/ssl/handshake_server.cc \
    third_party/boringssl-with-bazel/src/ssl/s3_both.cc \
    third_party/boringssl-with-bazel/src/ssl/s3_lib.cc \
    third_party/boringssl-with-bazel/src/ssl/s3_pkt.cc \
    third_party/boringssl-with-bazel/src/ssl/ssl_aead_ctx.cc \
    third_party/boringssl-with-bazel/src/ssl/ssl_asn1.cc \
    third_party/boringssl-with-bazel/src/ssl/ssl_buffer.cc \
    third_party/boringssl-with-bazel/src/ssl/ssl_cert.cc \
    third_party/boringssl-with-bazel/src/ssl/ssl_cipher.cc \
    third_party/boringssl-with-bazel/src/ssl/ssl_file.cc \
    third_party/boringssl-with-bazel/src/ssl/ssl_key_share.cc \
    third_party/boringssl-with-bazel/src/ssl/ssl_lib.cc \
    third_party/boringssl-with-bazel/src/ssl/ssl_privkey.cc \
    third_party/boringssl-with-bazel/src/ssl/ssl_session.cc \
    third_party/boringssl-with-bazel/src/ssl/ssl_stat.cc \
    third_party/boringssl-with-bazel/src/ssl/ssl_transcript.cc \
    third_party/boringssl-with-bazel/src/ssl/ssl_versions.cc \
    third_party/boringssl-with-bazel/src/ssl/ssl_x509.cc \
    third_party/boringssl-with-bazel/src/ssl/t1_enc.cc \
    third_party/boringssl-with-bazel/src/ssl/t1_lib.cc \
    third_party/boringssl-with-bazel/src/ssl/tls13_both.cc \
    third_party/boringssl-with-bazel/src/ssl/tls13_client.cc \
    third_party/boringssl-with-bazel/src/ssl/tls13_enc.cc \
    third_party/boringssl-with-bazel/src/ssl/tls13_server.cc \
    third_party/boringssl-with-bazel/src/ssl/tls_method.cc \
    third_party/boringssl-with-bazel/src/ssl/tls_record.cc \

PUBLIC_HEADERS_C += \

LIBBORINGSSL_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBBORINGSSL_SRC))))

$(LIBBORINGSSL_OBJS): CPPFLAGS += -Ithird_party/boringssl-with-bazel/src/include -fvisibility=hidden -DOPENSSL_NO_ASM -D_GNU_SOURCE -DWIN32_LEAN_AND_MEAN -D_HAS_EXCEPTIONS=0 -DNOMINMAX
$(LIBBORINGSSL_OBJS): CXXFLAGS += -fno-exceptions
$(LIBBORINGSSL_OBJS): CFLAGS += -g

$(LIBDIR)/$(CONFIG)/libboringssl.a: $(ZLIB_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP)  $(LIBBORINGSSL_OBJS) 
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libboringssl.a
	$(Q) $(AR) $(ARFLAGS) $(LIBDIR)/$(CONFIG)/libboringssl.a $(LIBBORINGSSL_OBJS) 
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib -no_warning_for_no_symbols $(LIBDIR)/$(CONFIG)/libboringssl.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBBORINGSSL_OBJS:.o=.dep)
endif
# end of build recipe for library "boringssl"


# start of build recipe for library "re2" (generated by makelib(lib) template function)
LIBRE2_SRC = \
    third_party/re2/re2/bitstate.cc \
    third_party/re2/re2/compile.cc \
    third_party/re2/re2/dfa.cc \
    third_party/re2/re2/filtered_re2.cc \
    third_party/re2/re2/mimics_pcre.cc \
    third_party/re2/re2/nfa.cc \
    third_party/re2/re2/onepass.cc \
    third_party/re2/re2/parse.cc \
    third_party/re2/re2/perl_groups.cc \
    third_party/re2/re2/prefilter.cc \
    third_party/re2/re2/prefilter_tree.cc \
    third_party/re2/re2/prog.cc \
    third_party/re2/re2/re2.cc \
    third_party/re2/re2/regexp.cc \
    third_party/re2/re2/set.cc \
    third_party/re2/re2/simplify.cc \
    third_party/re2/re2/stringpiece.cc \
    third_party/re2/re2/tostring.cc \
    third_party/re2/re2/unicode_casefold.cc \
    third_party/re2/re2/unicode_groups.cc \
    third_party/re2/util/pcre.cc \
    third_party/re2/util/rune.cc \
    third_party/re2/util/strutil.cc \

PUBLIC_HEADERS_C += \

LIBRE2_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBRE2_SRC))))


$(LIBDIR)/$(CONFIG)/libre2.a:  $(LIBRE2_OBJS) 
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libre2.a
	$(Q) $(AR) $(ARFLAGS) $(LIBDIR)/$(CONFIG)/libre2.a $(LIBRE2_OBJS) 
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib -no_warning_for_no_symbols $(LIBDIR)/$(CONFIG)/libre2.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBRE2_OBJS:.o=.dep)
endif
# end of build recipe for library "re2"


# start of build recipe for library "upb" (generated by makelib(lib) template function)
LIBUPB_SRC = \
    third_party/upb/upb/decode.c \
    third_party/upb/upb/encode.c \
    third_party/upb/upb/msg.c \
    third_party/upb/upb/port.c \
    third_party/upb/upb/table.c \
    third_party/upb/upb/upb.c \

PUBLIC_HEADERS_C += \

LIBUPB_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBUPB_SRC))))


$(LIBDIR)/$(CONFIG)/libupb.a:  $(LIBUPB_OBJS) 
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libupb.a
	$(Q) $(AR) $(ARFLAGS) $(LIBDIR)/$(CONFIG)/libupb.a $(LIBUPB_OBJS) 
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib -no_warning_for_no_symbols $(LIBDIR)/$(CONFIG)/libupb.a
endif



ifeq ($(SYSTEM),MINGW32)
$(LIBDIR)/$(CONFIG)/upb$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE): $(LIBUPB_OBJS)  $(ZLIB_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,--output-def=$(LIBDIR)/$(CONFIG)/upb$(SHARED_VERSION_CORE).def -Wl,--out-implib=$(LIBDIR)/$(CONFIG)/libupb$(SHARED_VERSION_CORE)-dll.a -o $(LIBDIR)/$(CONFIG)/upb$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBUPB_OBJS) $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBS)
else
$(LIBDIR)/$(CONFIG)/libupb$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE): $(LIBUPB_OBJS)  $(ZLIB_DEP) $(CARES_DEP) $(ADDRESS_SORTING_DEP) $(RE2_DEP) $(UPB_DEP) $(GRPC_ABSEIL_DEP)
	$(E) "[LD]      Linking $@"
	$(Q) mkdir -p `dirname $@`
ifeq ($(SYSTEM),Darwin)
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -install_name $(SHARED_PREFIX)upb$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) -dynamiclib -o $(LIBDIR)/$(CONFIG)/libupb$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBUPB_OBJS) $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBS)
else
	$(Q) $(LDXX) $(LDFLAGS) -L$(LIBDIR)/$(CONFIG) -shared -Wl,-soname,libupb.so.12 -o $(LIBDIR)/$(CONFIG)/libupb$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBUPB_OBJS) $(ZLIB_MERGE_LIBS) $(CARES_MERGE_LIBS) $(ADDRESS_SORTING_MERGE_LIBS) $(RE2_MERGE_LIBS) $(UPB_MERGE_LIBS) $(GRPC_ABSEIL_MERGE_LIBS) $(LDLIBS)
	$(Q) ln -sf $(SHARED_PREFIX)upb$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/libupb$(SHARED_VERSION_CORE).so.12
	$(Q) ln -sf $(SHARED_PREFIX)upb$(SHARED_VERSION_CORE).$(SHARED_EXT_CORE) $(LIBDIR)/$(CONFIG)/libupb$(SHARED_VERSION_CORE).so
endif
endif

ifneq ($(NO_DEPS),true)
-include $(LIBUPB_OBJS:.o=.dep)
endif
# end of build recipe for library "upb"


# start of build recipe for library "z" (generated by makelib(lib) template function)
LIBZ_SRC = \
    third_party/zlib/adler32.c \
    third_party/zlib/compress.c \
    third_party/zlib/crc32.c \
    third_party/zlib/deflate.c \
    third_party/zlib/gzclose.c \
    third_party/zlib/gzlib.c \
    third_party/zlib/gzread.c \
    third_party/zlib/gzwrite.c \
    third_party/zlib/infback.c \
    third_party/zlib/inffast.c \
    third_party/zlib/inflate.c \
    third_party/zlib/inftrees.c \
    third_party/zlib/trees.c \
    third_party/zlib/uncompr.c \
    third_party/zlib/zutil.c \

PUBLIC_HEADERS_C += \

LIBZ_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBZ_SRC))))

$(LIBZ_OBJS): CFLAGS += -fvisibility=hidden

$(LIBDIR)/$(CONFIG)/libz.a:  $(LIBZ_OBJS) 
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libz.a
	$(Q) $(AR) $(ARFLAGS) $(LIBDIR)/$(CONFIG)/libz.a $(LIBZ_OBJS) 
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib -no_warning_for_no_symbols $(LIBDIR)/$(CONFIG)/libz.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBZ_OBJS:.o=.dep)
endif
# end of build recipe for library "z"


# start of build recipe for library "ares" (generated by makelib(lib) template function)
LIBARES_SRC = \
    third_party/cares/cares/ares__close_sockets.c \
    third_party/cares/cares/ares__get_hostent.c \
    third_party/cares/cares/ares__read_line.c \
    third_party/cares/cares/ares__timeval.c \
    third_party/cares/cares/ares_cancel.c \
    third_party/cares/cares/ares_create_query.c \
    third_party/cares/cares/ares_data.c \
    third_party/cares/cares/ares_destroy.c \
    third_party/cares/cares/ares_expand_name.c \
    third_party/cares/cares/ares_expand_string.c \
    third_party/cares/cares/ares_fds.c \
    third_party/cares/cares/ares_free_hostent.c \
    third_party/cares/cares/ares_free_string.c \
    third_party/cares/cares/ares_getenv.c \
    third_party/cares/cares/ares_gethostbyaddr.c \
    third_party/cares/cares/ares_gethostbyname.c \
    third_party/cares/cares/ares_getnameinfo.c \
    third_party/cares/cares/ares_getopt.c \
    third_party/cares/cares/ares_getsock.c \
    third_party/cares/cares/ares_init.c \
    third_party/cares/cares/ares_library_init.c \
    third_party/cares/cares/ares_llist.c \
    third_party/cares/cares/ares_mkquery.c \
    third_party/cares/cares/ares_nowarn.c \
    third_party/cares/cares/ares_options.c \
    third_party/cares/cares/ares_parse_a_reply.c \
    third_party/cares/cares/ares_parse_aaaa_reply.c \
    third_party/cares/cares/ares_parse_mx_reply.c \
    third_party/cares/cares/ares_parse_naptr_reply.c \
    third_party/cares/cares/ares_parse_ns_reply.c \
    third_party/cares/cares/ares_parse_ptr_reply.c \
    third_party/cares/cares/ares_parse_soa_reply.c \
    third_party/cares/cares/ares_parse_srv_reply.c \
    third_party/cares/cares/ares_parse_txt_reply.c \
    third_party/cares/cares/ares_platform.c \
    third_party/cares/cares/ares_process.c \
    third_party/cares/cares/ares_query.c \
    third_party/cares/cares/ares_search.c \
    third_party/cares/cares/ares_send.c \
    third_party/cares/cares/ares_strcasecmp.c \
    third_party/cares/cares/ares_strdup.c \
    third_party/cares/cares/ares_strerror.c \
    third_party/cares/cares/ares_strsplit.c \
    third_party/cares/cares/ares_timeout.c \
    third_party/cares/cares/ares_version.c \
    third_party/cares/cares/ares_writev.c \
    third_party/cares/cares/bitncmp.c \
    third_party/cares/cares/inet_net_pton.c \
    third_party/cares/cares/inet_ntop.c \
    third_party/cares/cares/windows_port.c \

PUBLIC_HEADERS_C += \

LIBARES_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBARES_SRC))))

$(LIBARES_OBJS): CPPFLAGS += -Ithird_party/cares -Ithird_party/cares/cares -fvisibility=hidden -D_GNU_SOURCE $(if $(subst Darwin,,$(SYSTEM)),,-Ithird_party/cares/config_darwin) $(if $(subst FreeBSD,,$(SYSTEM)),,-Ithird_party/cares/config_freebsd) $(if $(subst Linux,,$(SYSTEM)),,-Ithird_party/cares/config_linux) $(if $(subst OpenBSD,,$(SYSTEM)),,-Ithird_party/cares/config_openbsd) -DWIN32_LEAN_AND_MEAN -D_HAS_EXCEPTIONS=0 -DNOMINMAX $(if $(subst MINGW32,,$(SYSTEM)),-DHAVE_CONFIG_H,)
$(LIBARES_OBJS): CFLAGS += -g

$(LIBDIR)/$(CONFIG)/libares.a:  $(LIBARES_OBJS) 
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libares.a
	$(Q) $(AR) $(ARFLAGS) $(LIBDIR)/$(CONFIG)/libares.a $(LIBARES_OBJS) 
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib -no_warning_for_no_symbols $(LIBDIR)/$(CONFIG)/libares.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBARES_OBJS:.o=.dep)
endif
# end of build recipe for library "ares"


# Add private ABSEIL target which contains all sources used by all baselib libraries.


# start of build recipe for library "grpc_abseil" (generated by makelib(lib) template function)
LIBGRPC_ABSEIL_SRC = \
    third_party/abseil-cpp/absl/base/dynamic_annotations.cc \
    third_party/abseil-cpp/absl/base/internal/cycleclock.cc \
    third_party/abseil-cpp/absl/base/internal/exponential_biased.cc \
    third_party/abseil-cpp/absl/base/internal/low_level_alloc.cc \
    third_party/abseil-cpp/absl/base/internal/raw_logging.cc \
    third_party/abseil-cpp/absl/base/internal/spinlock.cc \
    third_party/abseil-cpp/absl/base/internal/spinlock_wait.cc \
    third_party/abseil-cpp/absl/base/internal/sysinfo.cc \
    third_party/abseil-cpp/absl/base/internal/thread_identity.cc \
    third_party/abseil-cpp/absl/base/internal/throw_delegate.cc \
    third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc \
    third_party/abseil-cpp/absl/base/log_severity.cc \
    third_party/abseil-cpp/absl/container/internal/hashtablez_sampler.cc \
    third_party/abseil-cpp/absl/container/internal/hashtablez_sampler_force_weak_definition.cc \
    third_party/abseil-cpp/absl/container/internal/raw_hash_set.cc \
    third_party/abseil-cpp/absl/debugging/internal/address_is_readable.cc \
    third_party/abseil-cpp/absl/debugging/internal/demangle.cc \
    third_party/abseil-cpp/absl/debugging/internal/elf_mem_image.cc \
    third_party/abseil-cpp/absl/debugging/internal/vdso_support.cc \
    third_party/abseil-cpp/absl/debugging/stacktrace.cc \
    third_party/abseil-cpp/absl/debugging/symbolize.cc \
    third_party/abseil-cpp/absl/hash/internal/city.cc \
    third_party/abseil-cpp/absl/hash/internal/hash.cc \
    third_party/abseil-cpp/absl/numeric/int128.cc \
    third_party/abseil-cpp/absl/status/status.cc \
    third_party/abseil-cpp/absl/status/status_payload_printer.cc \
    third_party/abseil-cpp/absl/strings/ascii.cc \
    third_party/abseil-cpp/absl/strings/charconv.cc \
    third_party/abseil-cpp/absl/strings/cord.cc \
    third_party/abseil-cpp/absl/strings/escaping.cc \
    third_party/abseil-cpp/absl/strings/internal/charconv_bigint.cc \
    third_party/abseil-cpp/absl/strings/internal/charconv_parse.cc \
    third_party/abseil-cpp/absl/strings/internal/escaping.cc \
    third_party/abseil-cpp/absl/strings/internal/memutil.cc \
    third_party/abseil-cpp/absl/strings/internal/ostringstream.cc \
    third_party/abseil-cpp/absl/strings/internal/str_format/arg.cc \
    third_party/abseil-cpp/absl/strings/internal/str_format/bind.cc \
    third_party/abseil-cpp/absl/strings/internal/str_format/extension.cc \
    third_party/abseil-cpp/absl/strings/internal/str_format/float_conversion.cc \
    third_party/abseil-cpp/absl/strings/internal/str_format/output.cc \
    third_party/abseil-cpp/absl/strings/internal/str_format/parser.cc \
    third_party/abseil-cpp/absl/strings/internal/utf8.cc \
    third_party/abseil-cpp/absl/strings/match.cc \
    third_party/abseil-cpp/absl/strings/numbers.cc \
    third_party/abseil-cpp/absl/strings/str_cat.cc \
    third_party/abseil-cpp/absl/strings/str_replace.cc \
    third_party/abseil-cpp/absl/strings/str_split.cc \
    third_party/abseil-cpp/absl/strings/string_view.cc \
    third_party/abseil-cpp/absl/strings/substitute.cc \
    third_party/abseil-cpp/absl/synchronization/barrier.cc \
    third_party/abseil-cpp/absl/synchronization/blocking_counter.cc \
    third_party/abseil-cpp/absl/synchronization/internal/create_thread_identity.cc \
    third_party/abseil-cpp/absl/synchronization/internal/graphcycles.cc \
    third_party/abseil-cpp/absl/synchronization/internal/per_thread_sem.cc \
    third_party/abseil-cpp/absl/synchronization/internal/waiter.cc \
    third_party/abseil-cpp/absl/synchronization/mutex.cc \
    third_party/abseil-cpp/absl/synchronization/notification.cc \
    third_party/abseil-cpp/absl/time/civil_time.cc \
    third_party/abseil-cpp/absl/time/clock.cc \
    third_party/abseil-cpp/absl/time/duration.cc \
    third_party/abseil-cpp/absl/time/format.cc \
    third_party/abseil-cpp/absl/time/internal/cctz/src/civil_time_detail.cc \
    third_party/abseil-cpp/absl/time/internal/cctz/src/time_zone_fixed.cc \
    third_party/abseil-cpp/absl/time/internal/cctz/src/time_zone_format.cc \
    third_party/abseil-cpp/absl/time/internal/cctz/src/time_zone_if.cc \
    third_party/abseil-cpp/absl/time/internal/cctz/src/time_zone_impl.cc \
    third_party/abseil-cpp/absl/time/internal/cctz/src/time_zone_info.cc \
    third_party/abseil-cpp/absl/time/internal/cctz/src/time_zone_libc.cc \
    third_party/abseil-cpp/absl/time/internal/cctz/src/time_zone_lookup.cc \
    third_party/abseil-cpp/absl/time/internal/cctz/src/time_zone_posix.cc \
    third_party/abseil-cpp/absl/time/internal/cctz/src/zone_info_source.cc \
    third_party/abseil-cpp/absl/time/time.cc \
    third_party/abseil-cpp/absl/types/bad_optional_access.cc \
    third_party/abseil-cpp/absl/types/bad_variant_access.cc \


LIBGRPC_ABSEIL_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(LIBGRPC_ABSEIL_SRC))))

$(LIBGRPC_ABSEIL_OBJS): CPPFLAGS += -g $(ABSL_RANDOM_HWAES_FLAGS) -Ithird_party/abseil-cpp

$(LIBDIR)/$(CONFIG)/libgrpc_abseil.a:  $(LIBGRPC_ABSEIL_OBJS) 
	$(E) "[AR]      Creating $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) rm -f $(LIBDIR)/$(CONFIG)/libgrpc_abseil.a
	$(Q) $(AR) $(ARFLAGS) $(LIBDIR)/$(CONFIG)/libgrpc_abseil.a $(LIBGRPC_ABSEIL_OBJS) 
ifeq ($(SYSTEM),Darwin)
	$(Q) ranlib -no_warning_for_no_symbols $(LIBDIR)/$(CONFIG)/libgrpc_abseil.a
endif




ifneq ($(NO_DEPS),true)
-include $(LIBGRPC_ABSEIL_OBJS:.o=.dep)
endif
# end of build recipe for library "grpc_abseil"


# All of the test targets, and protoc plugins


# start of build recipe for target "grpc_cpp_plugin" (generated by maketarget(tgt) template function)
GRPC_CPP_PLUGIN_SRC = \
    src/compiler/cpp_plugin.cc \

GRPC_CPP_PLUGIN_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GRPC_CPP_PLUGIN_SRC))))



ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.12.0+.

$(BINDIR)/$(CONFIG)/grpc_cpp_plugin: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/grpc_cpp_plugin: $(PROTOBUF_DEP) $(GRPC_CPP_PLUGIN_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a
	$(E) "[HOSTLD]  Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(HOST_LDXX) $(HOST_LDFLAGS) $(GRPC_CPP_PLUGIN_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a $(HOST_LDLIBSXX) $(HOST_LDLIBS_PROTOC) $(HOST_LDLIBS) $(HOST_LDLIBS_PROTOC) -o $(BINDIR)/$(CONFIG)/grpc_cpp_plugin

endif

$(OBJDIR)/$(CONFIG)/src/compiler/cpp_plugin.o:  $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a

deps_grpc_cpp_plugin: $(GRPC_CPP_PLUGIN_OBJS:.o=.dep)

ifneq ($(NO_DEPS),true)
-include $(GRPC_CPP_PLUGIN_OBJS:.o=.dep)
endif
# end of build recipe for target "grpc_cpp_plugin"


# start of build recipe for target "grpc_csharp_plugin" (generated by maketarget(tgt) template function)
GRPC_CSHARP_PLUGIN_SRC = \
    src/compiler/csharp_plugin.cc \

GRPC_CSHARP_PLUGIN_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GRPC_CSHARP_PLUGIN_SRC))))



ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.12.0+.

$(BINDIR)/$(CONFIG)/grpc_csharp_plugin: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/grpc_csharp_plugin: $(PROTOBUF_DEP) $(GRPC_CSHARP_PLUGIN_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a
	$(E) "[HOSTLD]  Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(HOST_LDXX) $(HOST_LDFLAGS) $(GRPC_CSHARP_PLUGIN_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a $(HOST_LDLIBSXX) $(HOST_LDLIBS_PROTOC) $(HOST_LDLIBS) $(HOST_LDLIBS_PROTOC) -o $(BINDIR)/$(CONFIG)/grpc_csharp_plugin

endif

$(OBJDIR)/$(CONFIG)/src/compiler/csharp_plugin.o:  $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a

deps_grpc_csharp_plugin: $(GRPC_CSHARP_PLUGIN_OBJS:.o=.dep)

ifneq ($(NO_DEPS),true)
-include $(GRPC_CSHARP_PLUGIN_OBJS:.o=.dep)
endif
# end of build recipe for target "grpc_csharp_plugin"


# start of build recipe for target "grpc_node_plugin" (generated by maketarget(tgt) template function)
GRPC_NODE_PLUGIN_SRC = \
    src/compiler/node_plugin.cc \

GRPC_NODE_PLUGIN_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GRPC_NODE_PLUGIN_SRC))))



ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.12.0+.

$(BINDIR)/$(CONFIG)/grpc_node_plugin: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/grpc_node_plugin: $(PROTOBUF_DEP) $(GRPC_NODE_PLUGIN_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a
	$(E) "[HOSTLD]  Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(HOST_LDXX) $(HOST_LDFLAGS) $(GRPC_NODE_PLUGIN_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a $(HOST_LDLIBSXX) $(HOST_LDLIBS_PROTOC) $(HOST_LDLIBS) $(HOST_LDLIBS_PROTOC) -o $(BINDIR)/$(CONFIG)/grpc_node_plugin

endif

$(OBJDIR)/$(CONFIG)/src/compiler/node_plugin.o:  $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a

deps_grpc_node_plugin: $(GRPC_NODE_PLUGIN_OBJS:.o=.dep)

ifneq ($(NO_DEPS),true)
-include $(GRPC_NODE_PLUGIN_OBJS:.o=.dep)
endif
# end of build recipe for target "grpc_node_plugin"


# start of build recipe for target "grpc_objective_c_plugin" (generated by maketarget(tgt) template function)
GRPC_OBJECTIVE_C_PLUGIN_SRC = \
    src/compiler/objective_c_plugin.cc \

GRPC_OBJECTIVE_C_PLUGIN_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GRPC_OBJECTIVE_C_PLUGIN_SRC))))



ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.12.0+.

$(BINDIR)/$(CONFIG)/grpc_objective_c_plugin: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/grpc_objective_c_plugin: $(PROTOBUF_DEP) $(GRPC_OBJECTIVE_C_PLUGIN_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a
	$(E) "[HOSTLD]  Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(HOST_LDXX) $(HOST_LDFLAGS) $(GRPC_OBJECTIVE_C_PLUGIN_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a $(HOST_LDLIBSXX) $(HOST_LDLIBS_PROTOC) $(HOST_LDLIBS) $(HOST_LDLIBS_PROTOC) -o $(BINDIR)/$(CONFIG)/grpc_objective_c_plugin

endif

$(OBJDIR)/$(CONFIG)/src/compiler/objective_c_plugin.o:  $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a

deps_grpc_objective_c_plugin: $(GRPC_OBJECTIVE_C_PLUGIN_OBJS:.o=.dep)

ifneq ($(NO_DEPS),true)
-include $(GRPC_OBJECTIVE_C_PLUGIN_OBJS:.o=.dep)
endif
# end of build recipe for target "grpc_objective_c_plugin"


# start of build recipe for target "grpc_php_plugin" (generated by maketarget(tgt) template function)
GRPC_PHP_PLUGIN_SRC = \
    src/compiler/php_plugin.cc \

GRPC_PHP_PLUGIN_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GRPC_PHP_PLUGIN_SRC))))



ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.12.0+.

$(BINDIR)/$(CONFIG)/grpc_php_plugin: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/grpc_php_plugin: $(PROTOBUF_DEP) $(GRPC_PHP_PLUGIN_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a
	$(E) "[HOSTLD]  Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(HOST_LDXX) $(HOST_LDFLAGS) $(GRPC_PHP_PLUGIN_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a $(HOST_LDLIBSXX) $(HOST_LDLIBS_PROTOC) $(HOST_LDLIBS) $(HOST_LDLIBS_PROTOC) -o $(BINDIR)/$(CONFIG)/grpc_php_plugin

endif

$(OBJDIR)/$(CONFIG)/src/compiler/php_plugin.o:  $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a

deps_grpc_php_plugin: $(GRPC_PHP_PLUGIN_OBJS:.o=.dep)

ifneq ($(NO_DEPS),true)
-include $(GRPC_PHP_PLUGIN_OBJS:.o=.dep)
endif
# end of build recipe for target "grpc_php_plugin"


# start of build recipe for target "grpc_python_plugin" (generated by maketarget(tgt) template function)
GRPC_PYTHON_PLUGIN_SRC = \
    src/compiler/python_plugin.cc \

GRPC_PYTHON_PLUGIN_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GRPC_PYTHON_PLUGIN_SRC))))



ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.12.0+.

$(BINDIR)/$(CONFIG)/grpc_python_plugin: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/grpc_python_plugin: $(PROTOBUF_DEP) $(GRPC_PYTHON_PLUGIN_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a
	$(E) "[HOSTLD]  Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(HOST_LDXX) $(HOST_LDFLAGS) $(GRPC_PYTHON_PLUGIN_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a $(HOST_LDLIBSXX) $(HOST_LDLIBS_PROTOC) $(HOST_LDLIBS) $(HOST_LDLIBS_PROTOC) -o $(BINDIR)/$(CONFIG)/grpc_python_plugin

endif

$(OBJDIR)/$(CONFIG)/src/compiler/python_plugin.o:  $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a

deps_grpc_python_plugin: $(GRPC_PYTHON_PLUGIN_OBJS:.o=.dep)

ifneq ($(NO_DEPS),true)
-include $(GRPC_PYTHON_PLUGIN_OBJS:.o=.dep)
endif
# end of build recipe for target "grpc_python_plugin"


# start of build recipe for target "grpc_ruby_plugin" (generated by maketarget(tgt) template function)
GRPC_RUBY_PLUGIN_SRC = \
    src/compiler/ruby_plugin.cc \

GRPC_RUBY_PLUGIN_OBJS = $(addprefix $(OBJDIR)/$(CONFIG)/, $(addsuffix .o, $(basename $(GRPC_RUBY_PLUGIN_SRC))))



ifeq ($(NO_PROTOBUF),true)

# You can't build the protoc plugins or protobuf-enabled targets if you don't have protobuf 3.12.0+.

$(BINDIR)/$(CONFIG)/grpc_ruby_plugin: protobuf_dep_error

else

$(BINDIR)/$(CONFIG)/grpc_ruby_plugin: $(PROTOBUF_DEP) $(GRPC_RUBY_PLUGIN_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a
	$(E) "[HOSTLD]  Linking $@"
	$(Q) mkdir -p `dirname $@`
	$(Q) $(HOST_LDXX) $(HOST_LDFLAGS) $(GRPC_RUBY_PLUGIN_OBJS) $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a $(HOST_LDLIBSXX) $(HOST_LDLIBS_PROTOC) $(HOST_LDLIBS) $(HOST_LDLIBS_PROTOC) -o $(BINDIR)/$(CONFIG)/grpc_ruby_plugin

endif

$(OBJDIR)/$(CONFIG)/src/compiler/ruby_plugin.o:  $(LIBDIR)/$(CONFIG)/libgrpc_plugin_support.a

deps_grpc_ruby_plugin: $(GRPC_RUBY_PLUGIN_OBJS:.o=.dep)

ifneq ($(NO_DEPS),true)
-include $(GRPC_RUBY_PLUGIN_OBJS:.o=.dep)
endif
# end of build recipe for target "grpc_ruby_plugin"






ifneq ($(OPENSSL_DEP),)
# This is to ensure the embedded OpenSSL is built beforehand, properly
# installing headers to their final destination on the drive. We need this
# otherwise parallel compilation will fail if a source is compiled first.
src/core/ext/filters/client_channel/lb_policy/grpclb/grpclb_channel_secure.cc: $(OPENSSL_DEP)
src/core/ext/transport/chttp2/client/secure/secure_channel_create.cc: $(OPENSSL_DEP)
src/core/ext/transport/chttp2/server/secure/server_secure_chttp2.cc: $(OPENSSL_DEP)
src/core/ext/upb-generated/src/proto/grpc/gcp/altscontext.upb.c: $(OPENSSL_DEP)
src/core/ext/upb-generated/src/proto/grpc/gcp/handshaker.upb.c: $(OPENSSL_DEP)
src/core/ext/upb-generated/src/proto/grpc/gcp/transport_security_common.upb.c: $(OPENSSL_DEP)
src/core/ext/xds/xds_channel_secure.cc: $(OPENSSL_DEP)
src/core/lib/http/httpcli_security_connector.cc: $(OPENSSL_DEP)
src/core/lib/security/authorization/authorization_engine.cc: $(OPENSSL_DEP)
src/core/lib/security/authorization/evaluate_args.cc: $(OPENSSL_DEP)
src/core/lib/security/context/security_context.cc: $(OPENSSL_DEP)
src/core/lib/security/credentials/alts/alts_credentials.cc: $(OPENSSL_DEP)
src/core/lib/security/credentials/alts/check_gcp_environment.cc: $(OPENSSL_DEP)
src/core/lib/security/credentials/alts/check_gcp_environment_linux.cc: $(OPENSSL_DEP)
src/core/lib/security/credentials/alts/check_gcp_environment_no_op.cc: $(OPENSSL_DEP)
src/core/lib/security/credentials/alts/check_gcp_environment_windows.cc: $(OPENSSL_DEP)
src/core/lib/security/credentials/alts/grpc_alts_credentials_client_options.cc: $(OPENSSL_DEP)
src/core/lib/security/credentials/alts/grpc_alts_credentials_options.cc: $(OPENSSL_DEP)
src/core/lib/security/credentials/alts/grpc_alts_credentials_server_options.cc: $(OPENSSL_DEP)
src/core/lib/security/credentials/composite/composite_credentials.cc: $(OPENSSL_DEP)
src/core/lib/security/credentials/credentials.cc: $(OPENSSL_DEP)
src/core/lib/security/credentials/credentials_metadata.cc: $(OPENSSL_DEP)
src/core/lib/security/credentials/fake/fake_credentials.cc: $(OPENSSL_DEP)
src/core/lib/security/credentials/google_default/credentials_generic.cc: $(OPENSSL_DEP)
src/core/lib/security/credentials/google_default/google_default_credentials.cc: $(OPENSSL_DEP)
src/core/lib/security/credentials/iam/iam_credentials.cc: $(OPENSSL_DEP)
src/core/lib/security/credentials/jwt/json_token.cc: $(OPENSSL_DEP)
src/core/lib/security/credentials/jwt/jwt_credentials.cc: $(OPENSSL_DEP)
src/core/lib/security/credentials/jwt/jwt_verifier.cc: $(OPENSSL_DEP)
src/core/lib/security/credentials/local/local_credentials.cc: $(OPENSSL_DEP)
src/core/lib/security/credentials/oauth2/oauth2_credentials.cc: $(OPENSSL_DEP)
src/core/lib/security/credentials/plugin/plugin_credentials.cc: $(OPENSSL_DEP)
src/core/lib/security/credentials/ssl/ssl_credentials.cc: $(OPENSSL_DEP)
src/core/lib/security/credentials/tls/grpc_tls_credentials_options.cc: $(OPENSSL_DEP)
src/core/lib/security/credentials/tls/tls_credentials.cc: $(OPENSSL_DEP)
src/core/lib/security/security_connector/alts/alts_security_connector.cc: $(OPENSSL_DEP)
src/core/lib/security/security_connector/fake/fake_security_connector.cc: $(OPENSSL_DEP)
src/core/lib/security/security_connector/load_system_roots_fallback.cc: $(OPENSSL_DEP)
src/core/lib/security/security_connector/load_system_roots_linux.cc: $(OPENSSL_DEP)
src/core/lib/security/security_connector/local/local_security_connector.cc: $(OPENSSL_DEP)
src/core/lib/security/security_connector/security_connector.cc: $(OPENSSL_DEP)
src/core/lib/security/security_connector/ssl/ssl_security_connector.cc: $(OPENSSL_DEP)
src/core/lib/security/security_connector/ssl_utils.cc: $(OPENSSL_DEP)
src/core/lib/security/security_connector/ssl_utils_config.cc: $(OPENSSL_DEP)
src/core/lib/security/security_connector/tls/tls_security_connector.cc: $(OPENSSL_DEP)
src/core/lib/security/transport/client_auth_filter.cc: $(OPENSSL_DEP)
src/core/lib/security/transport/secure_endpoint.cc: $(OPENSSL_DEP)
src/core/lib/security/transport/security_handshaker.cc: $(OPENSSL_DEP)
src/core/lib/security/transport/server_auth_filter.cc: $(OPENSSL_DEP)
src/core/lib/security/transport/tsi_error.cc: $(OPENSSL_DEP)
src/core/lib/security/util/json_util.cc: $(OPENSSL_DEP)
src/core/lib/surface/init_secure.cc: $(OPENSSL_DEP)
src/core/plugin_registry/grpc_plugin_registry.cc: $(OPENSSL_DEP)
src/core/tsi/alts/crypt/aes_gcm.cc: $(OPENSSL_DEP)
src/core/tsi/alts/crypt/gsec.cc: $(OPENSSL_DEP)
src/core/tsi/alts/frame_protector/alts_counter.cc: $(OPENSSL_DEP)
src/core/tsi/alts/frame_protector/alts_crypter.cc: $(OPENSSL_DEP)
src/core/tsi/alts/frame_protector/alts_frame_protector.cc: $(OPENSSL_DEP)
src/core/tsi/alts/frame_protector/alts_record_protocol_crypter_common.cc: $(OPENSSL_DEP)
src/core/tsi/alts/frame_protector/alts_seal_privacy_integrity_crypter.cc: $(OPENSSL_DEP)
src/core/tsi/alts/frame_protector/alts_unseal_privacy_integrity_crypter.cc: $(OPENSSL_DEP)
src/core/tsi/alts/frame_protector/frame_handler.cc: $(OPENSSL_DEP)
src/core/tsi/alts/handshaker/alts_handshaker_client.cc: $(OPENSSL_DEP)
src/core/tsi/alts/handshaker/alts_shared_resource.cc: $(OPENSSL_DEP)
src/core/tsi/alts/handshaker/alts_tsi_handshaker.cc: $(OPENSSL_DEP)
src/core/tsi/alts/handshaker/alts_tsi_utils.cc: $(OPENSSL_DEP)
src/core/tsi/alts/handshaker/transport_security_common_api.cc: $(OPENSSL_DEP)
src/core/tsi/alts/zero_copy_frame_protector/alts_grpc_integrity_only_record_protocol.cc: $(OPENSSL_DEP)
src/core/tsi/alts/zero_copy_frame_protector/alts_grpc_privacy_integrity_record_protocol.cc: $(OPENSSL_DEP)
src/core/tsi/alts/zero_copy_frame_protector/alts_grpc_record_protocol_common.cc: $(OPENSSL_DEP)
src/core/tsi/alts/zero_copy_frame_protector/alts_iovec_record_protocol.cc: $(OPENSSL_DEP)
src/core/tsi/alts/zero_copy_frame_protector/alts_zero_copy_grpc_protector.cc: $(OPENSSL_DEP)
src/core/tsi/fake_transport_security.cc: $(OPENSSL_DEP)
src/core/tsi/local_transport_security.cc: $(OPENSSL_DEP)
src/core/tsi/ssl/session_cache/ssl_session_boringssl.cc: $(OPENSSL_DEP)
src/core/tsi/ssl/session_cache/ssl_session_cache.cc: $(OPENSSL_DEP)
src/core/tsi/ssl/session_cache/ssl_session_openssl.cc: $(OPENSSL_DEP)
src/core/tsi/ssl_transport_security.cc: $(OPENSSL_DEP)
src/core/tsi/transport_security.cc: $(OPENSSL_DEP)
src/core/tsi/transport_security_grpc.cc: $(OPENSSL_DEP)
src/cpp/client/secure_credentials.cc: $(OPENSSL_DEP)
src/cpp/common/alts_context.cc: $(OPENSSL_DEP)
src/cpp/common/alts_util.cc: $(OPENSSL_DEP)
src/cpp/common/auth_property_iterator.cc: $(OPENSSL_DEP)
src/cpp/common/secure_auth_context.cc: $(OPENSSL_DEP)
src/cpp/common/secure_channel_arguments.cc: $(OPENSSL_DEP)
src/cpp/common/secure_create_auth_context.cc: $(OPENSSL_DEP)
src/cpp/common/tls_credentials_options.cc: $(OPENSSL_DEP)
src/cpp/common/tls_credentials_options_util.cc: $(OPENSSL_DEP)
src/cpp/ext/proto_server_reflection.cc: $(OPENSSL_DEP)
src/cpp/ext/proto_server_reflection_plugin.cc: $(OPENSSL_DEP)
src/cpp/server/channelz/channelz_service.cc: $(OPENSSL_DEP)
src/cpp/server/channelz/channelz_service_plugin.cc: $(OPENSSL_DEP)
src/cpp/server/secure_server_credentials.cc: $(OPENSSL_DEP)
src/cpp/util/error_details.cc: $(OPENSSL_DEP)
src/csharp/ext/grpc_csharp_ext.c: $(OPENSSL_DEP)
endif

.PHONY: all strip tools dep_error openssl_dep_error openssl_dep_message git_update stop buildtests buildtests_c buildtests_cxx test test_c test_cxx install install_c install_cxx install_csharp install-static install-certs strip strip-shared strip-static strip_c strip-shared_c strip-static_c strip_cxx strip-shared_cxx strip-static_cxx dep_c dep_cxx bins_dep_c bins_dep_cxx clean

.PHONY: printvars
printvars:
	@$(foreach V,$(sort $(.VARIABLES)),                 	  $(if $(filter-out environment% default automatic, 	  $(origin $V)),$(warning $V=$($V) ($(value $V)))))
