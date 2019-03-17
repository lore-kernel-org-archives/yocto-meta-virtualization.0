Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6AB44E00D72; Sat, 16 Mar 2019 17:22:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.67 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 44104E00798
	for <meta-virtualization@yoctoproject.org>;
	Sat, 16 Mar 2019 17:22:16 -0700 (PDT)
Received: by mail-lf1-f67.google.com with SMTP id y62so1217661lfc.13
	for <meta-virtualization@yoctoproject.org>;
	Sat, 16 Mar 2019 17:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EaxOOSEkd8r6tZY9d99L15IhdM7hyitgiho8hKrLPzY=;
	b=j0J0wV09xf4VviyGnfaWZDcDNX4aWHT31oWWwEh2ZKHE6D7SxUGKlHO7kn2kRUedME
	sQkhpI+YVPK+MNaceErQ4CCN81GN/L915qY6WTk3/SiJeZS5t8xBCbn2jBN9IJvcZ6WY
	J1Zl6YwKJIQkFvlVkhJse6SO0DE1O2rNaS0UHwuMQoP5FKgA22G2E4tbD0MqSDSjCphb
	UbKpEf+R4TsMSSvJsXjUoeenYjBLgTGopzPX9Mw1UXBGg6ou2P/sfY3mkt/lhhYParTa
	BoqcWRRdXyFNSn0UQNKOKHpHpHMzbke68qNyjgpoYhKxzR6ODEplt7KgExH37fRylbhk
	/eaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EaxOOSEkd8r6tZY9d99L15IhdM7hyitgiho8hKrLPzY=;
	b=JHmfqgkjgJ9ECDbkxDhhaTn9igW79USckJ2gF3rB3vmMGZXwyLUacyFHHo8JclYH28
	bIJlKRGq9Q4nEPr9dB9fhlZ6Xj1Zxc7iROhEHJ6iTXxlT1X4IQKtx+5GSRbaGruGOBpA
	sQ+DALdvNku1JpjBFe2ucpgdW9H06I/4Ee0s1fqy/9YlPkaIo637DFUl6gzUpGPLitex
	GnOtGj+ELeJxvx+hcnM+/CuKlkGLmb97WAEw6cmYh35PLO0DEsSRFBzqWgjyZ8cYVVDj
	31SVLCsl+Qpfj61488mtVldjrCcQJAWC9A6iwHuHwqju1WCShyeOdasHzDfIlC/oH8Qt
	eUww==
X-Gm-Message-State: APjAAAXtqJj8pku6SnGafpKz5JDxybcRoImhvHA5UQj1c6s70Cj9dkob
	Cxv7IAWP+/6AL3zQm3YPMoKcMcbMxLT1E+sUMlc9Lw==
X-Google-Smtp-Source: APXvYqyc7G65p1cjv4JHxHJr7Hr9oJhPqyqPkysX/b0XVuK8jtGAsKHjRjyVyh7Bm32/DfPQ64KsbtOkF+F9MSRSnSU=
X-Received: by 2002:a19:d411:: with SMTP id l17mr5899445lfg.112.1552782135160; 
	Sat, 16 Mar 2019 17:22:15 -0700 (PDT)
MIME-Version: 1.0
References: <1552471601-5020-1-git-send-email-dengke.du@windriver.com>
In-Reply-To: <1552471601-5020-1-git-send-email-dengke.du@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 16 Mar 2019 20:22:04 -0400
Message-ID: <CADkTA4PSW27yTEB90VnnJx8mjwR2Aj320VcVQErB5aQycNskog@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] ceph: upgrade to 14.1.0
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Mar 2019 00:22:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 13, 2019 at 6:13 AM Dengke Du <dengke.du@windriver.com> wrote:
>
> 1. set the cross compile sysroot to find the rocksdb library
> 2. correct the install path for library in Distutils.cmake

merged.

Bruce

>
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>  ...ect-the-path-to-find-version.h-in-rocksdb.patch |  40 -----
>  .../ceph/0001-ceph-add-pybind-support-in-OE.patch  | 129 --------------
>  ...tect-init-correct-the-installation-for-OE.patch |  36 ----
>  ...1-ceph-fix-build-errors-for-cross-compile.patch | 188 +++++++++++++++++++++
>  .../0001-zstd-fix-error-for-cross-compile.patch    |  26 ---
>  .../ceph/{ceph_13.2.2.bb => ceph_14.1.0.bb}        |  22 +--
>  6 files changed, 199 insertions(+), 242 deletions(-)
>  delete mode 100644 recipes-extended/ceph/ceph/0001-Correct-the-path-to-find-version.h-in-rocksdb.patch
>  delete mode 100644 recipes-extended/ceph/ceph/0001-ceph-add-pybind-support-in-OE.patch
>  delete mode 100644 recipes-extended/ceph/ceph/0001-ceph-detect-init-correct-the-installation-for-OE.patch
>  create mode 100644 recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch
>  delete mode 100644 recipes-extended/ceph/ceph/0001-zstd-fix-error-for-cross-compile.patch
>  rename recipes-extended/ceph/{ceph_13.2.2.bb => ceph_14.1.0.bb} (82%)
>
> diff --git a/recipes-extended/ceph/ceph/0001-Correct-the-path-to-find-version.h-in-rocksdb.patch b/recipes-extended/ceph/ceph/0001-Correct-the-path-to-find-version.h-in-rocksdb.patch
> deleted file mode 100644
> index 788505b..0000000
> --- a/recipes-extended/ceph/ceph/0001-Correct-the-path-to-find-version.h-in-rocksdb.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From a53605694d5301b7bb543464b17f74bbbd35d372 Mon Sep 17 00:00:00 2001
> -From: Dengke Du <dengke.du@windriver.com>
> -Date: Tue, 28 Aug 2018 10:04:40 +0800
> -Subject: [PATCH] Correct the path to find version.h in rocksdb
> -
> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ----
> - cmake/modules/Findrocksdb.cmake | 10 +++++-----
> - 1 file changed, 5 insertions(+), 5 deletions(-)
> -
> -diff --git a/cmake/modules/Findrocksdb.cmake b/cmake/modules/Findrocksdb.cmake
> -index f8369f7..36b67ea 100644
> ---- a/cmake/modules/Findrocksdb.cmake
> -+++ b/cmake/modules/Findrocksdb.cmake
> -@@ -9,17 +9,17 @@
> - #  ROCKSDB_VERSION_MINOR
> - #  ROCKSDB_VERSION_PATCH
> -
> --find_path(ROCKSDB_INCLUDE_DIR rocksdb/db.h)
> -+find_path(ROCKSDB_INCLUDE_DIR rocksdb/db.h ${CMAKE_SYSROOT})
> -
> --find_library(ROCKSDB_LIBRARIES rocksdb)
> -+find_library(ROCKSDB_LIBRARIES rocksdb ${CMAKE_SYSROOT})
> -
> - if(ROCKSDB_INCLUDE_DIR AND EXISTS "${ROCKSDB_INCLUDE_DIR}/rocksdb/version.h")
> -   foreach(ver "MAJOR" "MINOR" "PATCH")
> --    file(STRINGS "${ROCKSDB_INCLUDE_DIR}/version.h" ROCKSDB_VER_${ver}_LINE
> -+    file(STRINGS "${ROCKSDB_INCLUDE_DIR}/rocksdb/version.h" ROCKSDB_VER_${ver}_LINE
> -       REGEX "^#define[ \t]+ROCKSDB_${ver}[ \t]+[0-9]+$")
> -     string(REGEX REPLACE "^#define[ \t]+ROCKSDB_${ver}[ \t]+([0-9]+)$"
> --      "\\1" ROCKSDB_VERSION_${ver} "${ROCKDB_VER_${ver}_LINE}")
> --    unset(${ROCKDB_VER_${ver}_LINE})
> -+      "\\1" ROCKSDB_VERSION_${ver} "${ROCKSDB_VER_${ver}_LINE}")
> -+    unset(ROCKSDB_VER_${ver}_LINE)
> -   endforeach()
> -   set(ROCKSDB_VERSION_STRING
> -     "${ROCKSDB_VERSION_MAJOR}.${ROCKSDB_VERSION_MINOR}.${ROCKSDB_VERSION_PATCH}")
> ---
> -2.7.4
> -
> diff --git a/recipes-extended/ceph/ceph/0001-ceph-add-pybind-support-in-OE.patch b/recipes-extended/ceph/ceph/0001-ceph-add-pybind-support-in-OE.patch
> deleted file mode 100644
> index f9c5340..0000000
> --- a/recipes-extended/ceph/ceph/0001-ceph-add-pybind-support-in-OE.patch
> +++ /dev/null
> @@ -1,129 +0,0 @@
> -From 00d44940c2e83bf73101a05d2aa8f88c2e2fca58 Mon Sep 17 00:00:00 2001
> -From: Dengke Du <dengke.du@windriver.com>
> -Date: Tue, 23 Oct 2018 15:34:53 +0800
> -Subject: [PATCH] ceph: add pybind support in OE
> -
> -1. add sysroot to CFLAGS when cross compiling pybind
> -2. change the pybind's INSTALL path to OE's INSTALL path
> -3. delete the check for header files, because the check method using
> -   host compiler.
> -
> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
> -Upstream-Status: Inappropriate [oe specific]
> ----
> - cmake/modules/Distutils.cmake | 12 +++---------
> - src/pybind/cephfs/setup.py    |  8 --------
> - src/pybind/rados/setup.py     |  8 --------
> - src/pybind/rbd/setup.py       |  8 --------
> - src/pybind/rgw/setup.py       |  8 --------
> - 5 files changed, 3 insertions(+), 41 deletions(-)
> -
> -diff --git a/cmake/modules/Distutils.cmake b/cmake/modules/Distutils.cmake
> -index d6e9f38..3091d97 100644
> ---- a/cmake/modules/Distutils.cmake
> -+++ b/cmake/modules/Distutils.cmake
> -@@ -47,7 +47,7 @@ function(distutils_add_cython_module name src)
> -     LDFLAGS=-L${CMAKE_LIBRARY_OUTPUT_DIRECTORY}
> -     CYTHON_BUILD_DIR=${CMAKE_CURRENT_BINARY_DIR}
> -     CEPH_LIBDIR=${CMAKE_LIBRARY_OUTPUT_DIRECTORY}
> --    CFLAGS=\"-iquote${CMAKE_SOURCE_DIR}/src/include -w\"
> -+    CFLAGS=\"-iquote${CMAKE_SOURCE_DIR}/src/include -w --sysroot=${CMAKE_SYSROOT}\"
> -     ${PYTHON${PYTHON_VERSION}_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/setup.py
> -     build --verbose --build-base ${CYTHON_MODULE_DIR}
> -     --build-platlib ${CYTHON_MODULE_DIR}/lib.${PYTHON${PYTHON_VERSION}_VERSION_MAJOR}
> -@@ -69,14 +69,8 @@ function(distutils_install_cython_module name)
> -     set(ENV{CEPH_LIBDIR} \"${CMAKE_LIBRARY_OUTPUT_DIRECTORY}\")
> -
> -     set(options --prefix=${CMAKE_INSTALL_PREFIX})
> --    if(DEFINED ENV{DESTDIR})
> --      if(EXISTS /etc/debian_version)
> --        list(APPEND options --install-layout=deb)
> --      endif()
> --      list(APPEND options --root=\$ENV{DESTDIR})
> --    else()
> --      list(APPEND options --root=/)
> --    endif()
> -+    list(APPEND options --root=${CMAKE_DESTDIR})
> -+    list(APPEND options --install-lib=${PYTHON_SITEPACKAGES_DIR})
> -     execute_process(
> -        COMMAND
> -            ${PYTHON${PYTHON_VERSION}_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/setup.py
> -diff --git a/src/pybind/cephfs/setup.py b/src/pybind/cephfs/setup.py
> -index 6533f41..1ee4a59 100755
> ---- a/src/pybind/cephfs/setup.py
> -+++ b/src/pybind/cephfs/setup.py
> -@@ -121,14 +121,6 @@ def check_sanity():
> -     finally:
> -         shutil.rmtree(tmp_dir)
> -
> --
> --if 'BUILD_DOC' in os.environ.keys():
> --    pass
> --elif check_sanity():
> --    pass
> --else:
> --    sys.exit(1)
> --
> - cmdclass = {}
> - try:
> -     from Cython.Build import cythonize
> -diff --git a/src/pybind/rados/setup.py b/src/pybind/rados/setup.py
> -index ef7c307..5204017 100755
> ---- a/src/pybind/rados/setup.py
> -+++ b/src/pybind/rados/setup.py
> -@@ -117,14 +117,6 @@ def check_sanity():
> -     finally:
> -         shutil.rmtree(tmp_dir)
> -
> --
> --if 'BUILD_DOC' in os.environ.keys():
> --    pass
> --elif check_sanity():
> --    pass
> --else:
> --    sys.exit(1)
> --
> - cmdclass = {}
> - try:
> -     from Cython.Build import cythonize
> -diff --git a/src/pybind/rbd/setup.py b/src/pybind/rbd/setup.py
> -index bcf96f2..d4cbbeb 100755
> ---- a/src/pybind/rbd/setup.py
> -+++ b/src/pybind/rbd/setup.py
> -@@ -120,14 +120,6 @@ def check_sanity():
> -     finally:
> -         shutil.rmtree(tmp_dir)
> -
> --
> --if 'BUILD_DOC' in os.environ.keys():
> --    pass
> --elif check_sanity():
> --    pass
> --else:
> --    sys.exit(1)
> --
> - cmdclass = {}
> - try:
> -     from Cython.Build import cythonize
> -diff --git a/src/pybind/rgw/setup.py b/src/pybind/rgw/setup.py
> -index f14f30c..ee7570b 100755
> ---- a/src/pybind/rgw/setup.py
> -+++ b/src/pybind/rgw/setup.py
> -@@ -120,14 +120,6 @@ def check_sanity():
> -     finally:
> -         shutil.rmtree(tmp_dir)
> -
> --
> --if 'BUILD_DOC' in os.environ.keys():
> --    pass
> --elif check_sanity():
> --    pass
> --else:
> --    sys.exit(1)
> --
> - cmdclass = {}
> - try:
> -     from Cython.Build import cythonize
> ---
> -2.7.4
> -
> diff --git a/recipes-extended/ceph/ceph/0001-ceph-detect-init-correct-the-installation-for-OE.patch b/recipes-extended/ceph/ceph/0001-ceph-detect-init-correct-the-installation-for-OE.patch
> deleted file mode 100644
> index 875501b..0000000
> --- a/recipes-extended/ceph/ceph/0001-ceph-detect-init-correct-the-installation-for-OE.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 6aaf04036f0affbeddda123bff111990c4d5fd72 Mon Sep 17 00:00:00 2001
> -From: Dengke Du <dengke.du@windriver.com>
> -Date: Fri, 26 Oct 2018 14:31:10 +0800
> -Subject: [PATCH] ceph-detect-init: correct the installation for OE
> -
> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
> -Upstream-Status: Inappropriate [oe specific]
> ----
> - cmake/modules/Distutils.cmake | 11 ++---------
> - 1 file changed, 2 insertions(+), 9 deletions(-)
> -
> -diff --git a/cmake/modules/Distutils.cmake b/cmake/modules/Distutils.cmake
> -index 3091d97..c50fe77 100644
> ---- a/cmake/modules/Distutils.cmake
> -+++ b/cmake/modules/Distutils.cmake
> -@@ -16,15 +16,8 @@ function(distutils_install_module name)
> -   cmake_parse_arguments(DU "" INSTALL_SCRIPT "" ${ARGN})
> -   install(CODE "
> -     set(options --prefix=${CMAKE_INSTALL_PREFIX})
> --    if(DEFINED ENV{DESTDIR})
> --      if(EXISTS /etc/debian_version)
> --        list(APPEND options --install-layout=deb)
> --      endif()
> --      list(APPEND options --root=\$ENV{DESTDIR})
> --      if(NOT \"${DU_INSTALL_SCRIPT}\" STREQUAL \"\")
> --        list(APPEND options --install-script=${DU_INSTALL_SCRIPT})
> --      endif()
> --    endif()
> -+    list(APPEND options --root=${CMAKE_DESTDIR})
> -+    list(APPEND options --install-lib=${PYTHON_SITEPACKAGES_DIR})
> -     execute_process(
> -     COMMAND ${PYTHON${PYTHON_VERSION}_EXECUTABLE}
> -         setup.py install \${options}
> ---
> -2.7.4
> -
> diff --git a/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch b/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch
> new file mode 100644
> index 0000000..1e23cc1
> --- /dev/null
> +++ b/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch
> @@ -0,0 +1,188 @@
> +From 20dd3fb9e5daa780e15113a2c88f846c8f5dd904 Mon Sep 17 00:00:00 2001
> +From: Dengke Du <dengke.du@windriver.com>
> +Date: Mon, 11 Mar 2019 09:14:09 +0800
> +Subject: [PATCH] ceph: fix build errors for cross compile
> +
> +1. set the cross compile sysroot to find the rocksdb library
> +2. correct the install path for library in Distutils.cmake
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
> +---
> + cmake/modules/Distutils.cmake      | 25 +++++--------------------
> + cmake/modules/FindRocksDB.cmake    |  6 +++---
> + src/compressor/zstd/CMakeLists.txt |  2 +-
> + src/pybind/cephfs/setup.py         |  8 --------
> + src/pybind/rados/setup.py          |  8 --------
> + src/pybind/rbd/setup.py            |  8 --------
> + src/pybind/rgw/setup.py            |  8 --------
> + 7 files changed, 9 insertions(+), 56 deletions(-)
> +
> +diff --git a/cmake/modules/Distutils.cmake b/cmake/modules/Distutils.cmake
> +index 5697dff..de3cd57 100644
> +--- a/cmake/modules/Distutils.cmake
> ++++ b/cmake/modules/Distutils.cmake
> +@@ -16,17 +16,8 @@ function(distutils_install_module name)
> +   cmake_parse_arguments(DU "" INSTALL_SCRIPT "" ${ARGN})
> +   install(CODE "
> +     set(options --prefix=${CMAKE_INSTALL_PREFIX})
> +-    if(DEFINED ENV{DESTDIR})
> +-      if(EXISTS /etc/debian_version)
> +-        list(APPEND options --install-layout=deb)
> +-      endif()
> +-      list(APPEND options
> +-        --root=\$ENV{DESTDIR}
> +-        --single-version-externally-managed)
> +-      if(NOT \"${DU_INSTALL_SCRIPT}\" STREQUAL \"\")
> +-        list(APPEND options --install-script=${DU_INSTALL_SCRIPT})
> +-      endif()
> +-    endif()
> ++    list(APPEND options --root=${CMAKE_DESTDIR})
> ++    list(APPEND options --install-lib=${PYTHON_SITEPACKAGES_DIR})
> +     execute_process(
> +     COMMAND ${PYTHON${PYTHON_VERSION}_EXECUTABLE}
> +         setup.py install \${options}
> +@@ -48,7 +39,7 @@ function(distutils_add_cython_module name src)
> +   # Note: no quotes, otherwise distutils will execute "/usr/bin/ccache gcc"
> +   # CMake's implicit conversion between strings and lists is wonderful, isn't it?
> +   string(REPLACE " " ";" cflags ${CMAKE_C_FLAGS})
> +-  list(APPEND cflags -iquote${CMAKE_SOURCE_DIR}/src/include -w)
> ++  list(APPEND cflags -iquote${CMAKE_SOURCE_DIR}/src/include -w --sysroot=${CMAKE_SYSROOT})
> +   # This little bit of magic wipes out __Pyx_check_single_interpreter()
> +   list(APPEND cflags -D'void0=dead_function\(void\)')
> +   list(APPEND cflags -D'__Pyx_check_single_interpreter\(ARG\)=ARG \#\# 0')
> +@@ -86,14 +77,8 @@ function(distutils_install_cython_module name)
> +     set(ENV{CEPH_LIBDIR} \"${CMAKE_LIBRARY_OUTPUT_DIRECTORY}\")
> +
> +     set(options --prefix=${CMAKE_INSTALL_PREFIX})
> +-    if(DEFINED ENV{DESTDIR})
> +-      if(EXISTS /etc/debian_version)
> +-        list(APPEND options --install-layout=deb)
> +-      endif()
> +-      list(APPEND options --root=\$ENV{DESTDIR})
> +-    else()
> +-      list(APPEND options --root=/)
> +-    endif()
> ++    list(APPEND options --root=${CMAKE_DESTDIR})
> ++    list(APPEND options --install-lib=${PYTHON_SITEPACKAGES_DIR})
> +     execute_process(
> +        COMMAND
> +            ${PYTHON${PYTHON_VERSION}_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/setup.py
> +diff --git a/cmake/modules/FindRocksDB.cmake b/cmake/modules/FindRocksDB.cmake
> +index 9818433..be38597 100644
> +--- a/cmake/modules/FindRocksDB.cmake
> ++++ b/cmake/modules/FindRocksDB.cmake
> +@@ -9,9 +9,9 @@
> + #  ROCKSDB_VERSION_MINOR
> + #  ROCKSDB_VERSION_PATCH
> +
> +-find_path(ROCKSDB_INCLUDE_DIR rocksdb/db.h)
> ++find_path(ROCKSDB_INCLUDE_DIR rocksdb/db.h ${CMAKE_SYSROOT})
> +
> +-find_library(ROCKSDB_LIBRARIES rocksdb)
> ++find_library(ROCKSDB_LIBRARIES rocksdb ${CMAKE_SYSROOT})
> +
> + if(ROCKSDB_INCLUDE_DIR AND EXISTS "${ROCKSDB_INCLUDE_DIR}/rocksdb/version.h")
> +   foreach(ver "MAJOR" "MINOR" "PATCH")
> +@@ -40,7 +40,7 @@ if(RocksDB_FOUND)
> +     set_target_properties(RocksDB::RocksDB PROPERTIES
> +       INTERFACE_INCLUDE_DIRECTORIES "${ROCKSDB_INCLUDE_DIR}"
> +       IMPORTED_LINK_INTERFACE_LANGUAGES "CXX"
> +-      IMPORTED_LOCATION "${ROCKSDB_LIBRARY}"
> ++      IMPORTED_LOCATION "${ROCKSDB_LIBRARIES}"
> +       VERSION "${ROCKSDB_VERSION_STRING}")
> +   endif()
> + endif()
> +diff --git a/src/compressor/zstd/CMakeLists.txt b/src/compressor/zstd/CMakeLists.txt
> +index 76709bb..95bba4a 100644
> +--- a/src/compressor/zstd/CMakeLists.txt
> ++++ b/src/compressor/zstd/CMakeLists.txt
> +@@ -9,7 +9,7 @@ ExternalProject_Add(zstd_ext
> +   CMAKE_ARGS -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
> +              -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
> +              -DCMAKE_C_FLAGS=${ZSTD_C_FLAGS}
> +-             -DCMAKE_AR=${CMAKE_AR}
> ++             -DCMAKE_SYSROOT=${CMAKE_SYSROOT}
> +              -DCMAKE_POSITION_INDEPENDENT_CODE=${ENABLE_SHARED}
> +   BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/libzstd
> +   BUILD_COMMAND $(MAKE) libzstd_static
> +diff --git a/src/pybind/cephfs/setup.py b/src/pybind/cephfs/setup.py
> +index 1f95005..8a6d136 100755
> +--- a/src/pybind/cephfs/setup.py
> ++++ b/src/pybind/cephfs/setup.py
> +@@ -142,14 +142,6 @@ def check_sanity():
> +     finally:
> +         shutil.rmtree(tmp_dir)
> +
> +-
> +-if 'BUILD_DOC' in os.environ.keys():
> +-    pass
> +-elif check_sanity():
> +-    pass
> +-else:
> +-    sys.exit(1)
> +-
> + cmdclass = {}
> + try:
> +     from Cython.Build import cythonize
> +diff --git a/src/pybind/rados/setup.py b/src/pybind/rados/setup.py
> +index 75081df..4d1591c 100755
> +--- a/src/pybind/rados/setup.py
> ++++ b/src/pybind/rados/setup.py
> +@@ -138,14 +138,6 @@ def check_sanity():
> +     finally:
> +         shutil.rmtree(tmp_dir)
> +
> +-
> +-if 'BUILD_DOC' in os.environ.keys():
> +-    pass
> +-elif check_sanity():
> +-    pass
> +-else:
> +-    sys.exit(1)
> +-
> + cmdclass = {}
> + try:
> +     from Cython.Build import cythonize
> +diff --git a/src/pybind/rbd/setup.py b/src/pybind/rbd/setup.py
> +index 8dd5c12..b8f4d91 100755
> +--- a/src/pybind/rbd/setup.py
> ++++ b/src/pybind/rbd/setup.py
> +@@ -141,14 +141,6 @@ def check_sanity():
> +     finally:
> +         shutil.rmtree(tmp_dir)
> +
> +-
> +-if 'BUILD_DOC' in os.environ.keys():
> +-    pass
> +-elif check_sanity():
> +-    pass
> +-else:
> +-    sys.exit(1)
> +-
> + cmdclass = {}
> + try:
> +     from Cython.Build import cythonize
> +diff --git a/src/pybind/rgw/setup.py b/src/pybind/rgw/setup.py
> +index 4ee4f49..91dc7d4 100755
> +--- a/src/pybind/rgw/setup.py
> ++++ b/src/pybind/rgw/setup.py
> +@@ -143,14 +143,6 @@ def check_sanity():
> +     finally:
> +         shutil.rmtree(tmp_dir)
> +
> +-
> +-if 'BUILD_DOC' in os.environ.keys():
> +-    pass
> +-elif check_sanity():
> +-    pass
> +-else:
> +-    sys.exit(1)
> +-
> + cmdclass = {}
> + try:
> +     from Cython.Build import cythonize
> +--
> +2.7.4
> +
> diff --git a/recipes-extended/ceph/ceph/0001-zstd-fix-error-for-cross-compile.patch b/recipes-extended/ceph/ceph/0001-zstd-fix-error-for-cross-compile.patch
> deleted file mode 100644
> index 66b5f0a..0000000
> --- a/recipes-extended/ceph/ceph/0001-zstd-fix-error-for-cross-compile.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From 3e86b6d9db2682b123839e38e9bf45060e2bb2ab Mon Sep 17 00:00:00 2001
> -From: Dengke Du <dengke.du@windriver.com>
> -Date: Wed, 29 Aug 2018 16:57:52 +0800
> -Subject: [PATCH] zstd: fix error for cross compile
> -
> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ----
> - src/compressor/zstd/CMakeLists.txt | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/compressor/zstd/CMakeLists.txt b/src/compressor/zstd/CMakeLists.txt
> -index e30cb89..b298a3d 100644
> ---- a/src/compressor/zstd/CMakeLists.txt
> -+++ b/src/compressor/zstd/CMakeLists.txt
> -@@ -9,7 +9,7 @@ ExternalProject_Add(zstd_ext
> -   CMAKE_ARGS -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
> -              -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
> -              -DCMAKE_C_FLAGS=${ZSTD_C_FLAGS}
> --             -DCMAKE_AR=${CMAKE_AR}
> -+             -DCMAKE_SYSROOT=${CMAKE_SYSROOT}
> -   BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/libzstd
> -   BUILD_COMMAND $(MAKE) libzstd_static
> -   INSTALL_COMMAND "true")
> ---
> -2.7.4
> -
> diff --git a/recipes-extended/ceph/ceph_13.2.2.bb b/recipes-extended/ceph/ceph_14.1.0.bb
> similarity index 82%
> rename from recipes-extended/ceph/ceph_13.2.2.bb
> rename to recipes-extended/ceph/ceph_14.1.0.bb
> index 0cba08a..0005d3b 100644
> --- a/recipes-extended/ceph/ceph_13.2.2.bb
> +++ b/recipes-extended/ceph/ceph_14.1.0.bb
> @@ -2,27 +2,24 @@ SUMMARY = "User space components of the Ceph file system"
>  LICENSE = "LGPLv2.1 & GPLv2 & Apache-2.0 & MIT"
>  LIC_FILES_CHKSUM = "file://COPYING-LGPL2.1;md5=fbc093901857fcd118f065f900982c24 \
>                      file://COPYING-GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> -                    file://COPYING;md5=92d301c8fccd296f2221a68a8dd53828 \
> +                    file://COPYING;md5=601c21a554d728c3038ca292b83b8af0 \
>  "
>  inherit cmake pythonnative python-dir systemd
>  # Disable python pybind support for ceph temporary, when corss compiling pybind,
>  # pybind mix cmake and python setup environment, would case a lot of errors.
>
>  SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
> -           file://0001-Correct-the-path-to-find-version.h-in-rocksdb.patch \
> -           file://0001-zstd-fix-error-for-cross-compile.patch \
> -           file://0001-ceph-add-pybind-support-in-OE.patch \
> -           file://0001-ceph-detect-init-correct-the-installation-for-OE.patch \
> +           file://0001-ceph-fix-build-errors-for-cross-compile.patch \
>             file://ceph.conf \
>  "
> -SRC_URI[md5sum] = "ce118be451dcb6b89e9e0a45057827dd"
> -SRC_URI[sha256sum] = "f3a61db4c90e00c38a2dac7239b956ec367ef56f601e07335ed3011f931d8840"
> +SRC_URI[md5sum] = "67b53eeb0f241c3011e7f40925aa7e08"
> +SRC_URI[sha256sum] = "9ef726d7e73ce4d9510ad899493258374f1b40ba20a26b72bbbedb0bfb6dffd8"
>
>  DEPENDS = "boost bzip2 curl expat gperf-native \
>             keyutils libaio libibverbs lz4 \
>             nspr nss \
>             oath openldap openssl \
> -           python python-cython-native rocksdb snappy udev \
> +           python python-cython-native rabbitmq-c rocksdb snappy udev \
>             valgrind xfsprogs zlib \
>  "
>  SYSTEMD_SERVICE_${PN} = " \
> @@ -32,7 +29,6 @@ SYSTEMD_SERVICE_${PN} = " \
>         ceph-mon.target \
>          ceph-mds@.service \
>         ceph-mds.target \
> -        ceph-disk@.service \
>          ceph-osd@.service \
>         ceph-osd.target \
>          ceph.target \
> @@ -43,6 +39,7 @@ SYSTEMD_SERVICE_${PN} = " \
>         ceph-volume@.service \
>         ceph-mgr@.service \
>         ceph-mgr.target \
> +       ceph-crash.service \
>         rbdmap.service \
>  "
>  OECMAKE_GENERATOR = "Unix Makefiles"
> @@ -58,6 +55,8 @@ EXTRA_OECMAKE = "-DWITH_MANPAGE=OFF \
>                   -DWITH_MGR_DASHBOARD_FRONTEND=OFF \
>                   -DWITH_SYSTEM_BOOST=ON \
>                   -DWITH_SYSTEM_ROCKSDB=ON \
> +                 -DWITH_RDMA=OFF \
> +                 -DWITH_RADOSGW_AMQP_ENDPOINT=OFF \
>  "
>
>  do_configure_prepend () {
> @@ -68,8 +67,9 @@ do_configure_prepend () {
>
>  do_install_append () {
>         sed -i -e 's:${WORKDIR}.*python2:${bindir}/python:' ${D}${bindir}/ceph
> -       sed -i -e 's:${WORKDIR}.*python2:${bindir}/python:' ${D}${bindir}/ceph-disk
> -       sed -i -e 's:${WORKDIR}.*python2:${bindir}/python:' ${D}${bindir}/ceph-detect-init
> +       sed -i -e 's:${WORKDIR}.*python2:${bindir}/python:' ${D}${bindir}/ceph-crash
> +       sed -i -e 's:${WORKDIR}.*python2:${bindir}/python:' ${D}${bindir}/ceph-volume
> +       sed -i -e 's:${WORKDIR}.*python2:${bindir}/python:' ${D}${bindir}/ceph-volume-systemd
>         find ${D} -name SOURCES.txt | xargs sed -i -e 's:${WORKDIR}::'
>         install -d ${D}${sysconfdir}/ceph
>         install -m 644 ${WORKDIR}/ceph.conf ${D}${sysconfdir}/ceph/
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

