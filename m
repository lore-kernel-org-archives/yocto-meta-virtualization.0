Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web09.9805.1619455490776542702
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Apr 2021 09:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q2aIEwxP;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id n2so85412363ejy.7
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Apr 2021 09:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ugXJtUx1ModSIU6X0WYeAPZ+qLWlh1XWUCj3FfiZq2Q=;
        b=q2aIEwxPCfbTdW9S7HYA4DNl8vDdgDKDm5o4qp45323iNw8U6D/RT4jIyiIgyI0ZEx
         6l6DPMjFccoeZVkmud82EZPgIsrQ7QMGO0UTjBwGCm/e95q9aPbFeKs157hIsxzzOhdd
         6rhyIQ4p8Hmr9scZPJhV/2Kl/FTxJ1W3se0EdUkLWbfQ+hF+phG2oEqxW+70OhwsqYEO
         WEETYgiC9pfJk4IhY802QtTJqcSbmPRTwxXi4zSPwvphgJ66TYyOgKz41xpSl4XBrQDd
         TUCyCuqnxxCsSgwOMey/3VY2fpGTNfbZkWtCsg87B6nUcKFtVufJlhpi5m05PiBpyzB9
         yTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ugXJtUx1ModSIU6X0WYeAPZ+qLWlh1XWUCj3FfiZq2Q=;
        b=BTOP+Clz55S8pHL819GD2NGDbOF5Eayb4vJmlSwQtD6yVyK8DpF/rJbb2pbfgx4zlD
         r5oFs7ikjwr9kB8GQNLcT7r0hXkn41XILK0xoSsnRk9PK3m/HO9t382l3NYLV4vZj2iS
         QUpKpe988jUoRAWDb4gTV7qT0A4JBrtS+RnQKzq7rz7GycCEXEHCj3Z1Df8t0e9AaVme
         qGAsGU1txzmK6XFUvOnTaVAMpNqB7wzjrz9wz3Sn/mKii5vCZdYgpfC7yVL4prL72wB4
         hqBMl/JdWrc7GcisPQanwYspexSKbrzrvLbqCwYP2cgnrheNo7xfghxnHdu+XlKqoNYr
         CIkQ==
X-Gm-Message-State: AOAM533bsRA8wkTjJDSOP5S8MGaZlN3UAdhDc/wrdE820S0asE6FA0Wj
	Y24yEihEhFgDsmLGNH9pv0gFx5xnBSS1OZVx/Aw=
X-Google-Smtp-Source: ABdhPJxjaFxYdjUyOfLdAH5vNNMI0+614Tpxli57btXb8NiX2zoLMMMUUSIjlHb1pdv55Z/5+pdd9aDS9VvZqVZ4JuE=
X-Received: by 2002:a17:907:7baa:: with SMTP id ne42mr19885965ejc.357.1619455489185;
 Mon, 26 Apr 2021 09:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210426162442.1590419-1-saul.wold@windriver.com>
In-Reply-To: <20210426162442.1590419-1-saul.wold@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 26 Apr 2021 12:44:37 -0400
Message-ID: <CADkTA4NF0vfcUtqwMpzG4VAUW1XJwCm8VV91JYpHr1Kkq8gUSA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH v2] ceph: Upgrade to 16.2.1
To: Saul Wold <Saul.Wold@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 26, 2021 at 12:24 PM Saul Wold <Saul.Wold@windriver.com> wrote:
>
> This updates the Ceph version to 16.2.1 which required a couple
> changes to base code via a rebased patch which also disabled the
> sanity check due to it not working correctly, but the actual
> compile worked.  Also added a new patch to add soversion information
> for the new libcephsqlite library so it would be packaged correctly
>
> Added fixed for new python script to adjust #! from the native path
> and moved the ceph-python package in order for it to get the correct
> set of files before the ceph package.
>
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
>
>
> ---
> [v2]: Corrected Hashes and added the missing #! fix, compiled OK

What's the base for this ?

I've tried it with and without your previous upgrade patch, and it
won't apply in either case.

I just pushed a new master branch for the libseccomp fixes, it is
probably best to just to a v3, based on master and I'll start over
from there.

Bruce

>
>  ...-add-missing-include-for-atomic-bool.patch |  25 ----
>  ...h-fix-build-errors-for-cross-compile.patch | 125 ++++++++++++------
>  ...0001-cmake-add-support-for-python3.9.patch |  30 -----
>  ...001-fix-host-library-paths-were-used.patch |  58 ++++----
>  ...ite-Add-library-soversion-properties.patch |  31 +++++
>  .../ceph/{ceph_15.2.9.bb => ceph_16.2.1.bb}   |  93 ++++++++++---
>  6 files changed, 220 insertions(+), 142 deletions(-)
>  delete mode 100644 recipes-extended/ceph/ceph/0001-add-missing-include-for-atomic-bool.patch
>  delete mode 100644 recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.9.patch
>  create mode 100644 recipes-extended/ceph/ceph/0001-libcephsqlite-Add-library-soversion-properties.patch
>  rename recipes-extended/ceph/{ceph_15.2.9.bb => ceph_16.2.1.bb} (60%)
>
> diff --git a/recipes-extended/ceph/ceph/0001-add-missing-include-for-atomic-bool.patch b/recipes-extended/ceph/ceph/0001-add-missing-include-for-atomic-bool.patch
> deleted file mode 100644
> index ffcbc58..0000000
> --- a/recipes-extended/ceph/ceph/0001-add-missing-include-for-atomic-bool.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -From 502be73be3c3645094525aa552f5e53d8782a004 Mon Sep 17 00:00:00 2001
> -From: Sakib Sajal <sakib.sajal@windriver.com>
> -Date: Fri, 28 Aug 2020 19:36:19 -0400
> -Subject: [PATCH] add missing include for atomic<bool>
> -
> -Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ----
> - src/tools/rbd/action/Bench.cc | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/src/tools/rbd/action/Bench.cc b/src/tools/rbd/action/Bench.cc
> -index aa6edbc1..90c551c1 100644
> ---- a/src/tools/rbd/action/Bench.cc
> -+++ b/src/tools/rbd/action/Bench.cc
> -@@ -9,6 +9,7 @@
> - #include "common/ceph_mutex.h"
> - #include "include/types.h"
> - #include "global/signal_handler.h"
> -+#include <atomic>
> - #include <iostream>
> - #include <boost/accumulators/accumulators.hpp>
> - #include <boost/accumulators/statistics/stats.hpp>
> ---
> -2.27.0
> -
> diff --git a/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch b/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch
> index 4d54549..00c7e5b 100644
> --- a/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch
> +++ b/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch
> @@ -1,10 +1,15 @@
> -From 4712fe18405ffea31405308357a8e7fca358bcce Mon Sep 17 00:00:00 2001
> +From 2a3ccc8079040a7e783b8a9091618878e7cf0719 Mon Sep 17 00:00:00 2001
>  From: Dengke Du <dengke.du@windriver.com>
>  Date: Mon, 11 Mar 2019 09:14:09 +0800
>  Subject: [PATCH] ceph: fix build errors for cross compile
>
>  1. set the cross compile sysroot to find the rocksdb library
>  2. correct the install path for library in Distutils.cmake
> +3. remove / disable the sanity_check(), for some reasong the
> +   sanity check gets the wrong settings and will not link
> +   correctly, but the actual build works correctly, this needs
> +   more investigation later, earlier versions of the patch also
> +   removed it but no comment on why. (sgw)
>
>  Upstream-Status: Inappropriate [oe specific]
>
> @@ -14,18 +19,20 @@ Adjust context for v14.2.3
>
>  Signed-off-by: He Zhe <zhe.he@windriver.com>
>  Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +Signed-off-by: Saul Wold <saul.wold@windriver.com>
> +
>  ---
>   cmake/modules/Distutils.cmake      | 25 +++++--------------------
>   cmake/modules/FindRocksDB.cmake    |  4 ++--
>   src/compressor/zstd/CMakeLists.txt |  2 +-
> - src/pybind/cephfs/setup.py         |  8 --------
> - src/pybind/rados/setup.py          |  8 --------
> - src/pybind/rbd/setup.py            |  8 --------
> - src/pybind/rgw/setup.py            |  8 --------
> - 7 files changed, 8 insertions(+), 55 deletions(-)
> + src/pybind/cephfs/setup.py         | 18 +++++-------------
> + src/pybind/rados/setup.py          | 11 ++---------
> + src/pybind/rbd/setup.py            | 18 +++++-------------
> + src/pybind/rgw/setup.py            | 18 +++++-------------
> + 7 files changed, 25 insertions(+), 71 deletions(-)
>
>  diff --git a/cmake/modules/Distutils.cmake b/cmake/modules/Distutils.cmake
> -index 5fe929499d..802eb37e32 100644
> +index ff01aaf81..18656c5a5 100644
>  --- a/cmake/modules/Distutils.cmake
>  +++ b/cmake/modules/Distutils.cmake
>  @@ -18,17 +18,8 @@ function(distutils_install_module name)
> @@ -39,9 +46,9 @@ index 5fe929499d..802eb37e32 100644
>  -      list(APPEND options
>  -        --root=\$ENV{DESTDIR}
>  -        --single-version-externally-managed)
> --      if(NOT \"${DU_INSTALL_SCRIPT}\" STREQUAL \"\")
> --        list(APPEND options --install-script=${DU_INSTALL_SCRIPT})
> --      endif()
> +-    endif()
> +-    if(NOT \"${DU_INSTALL_SCRIPT}\" STREQUAL \"\")
> +-      list(APPEND options --install-script=${DU_INSTALL_SCRIPT})
>  -    endif()
>  +    list(APPEND options --root=${CMAKE_DESTDIR})
>  +    list(APPEND options --install-lib=${PYTHON_SITEPACKAGES_DIR})
> @@ -51,7 +58,7 @@ index 5fe929499d..802eb37e32 100644
>  @@ -50,7 +41,7 @@ function(distutils_add_cython_module target name src)
>     # Note: no quotes, otherwise distutils will execute "/usr/bin/ccache gcc"
>     # CMake's implicit conversion between strings and lists is wonderful, isn't it?
> -   string(REPLACE " " ";" cflags ${CMAKE_C_FLAGS})
> +   set(cflags ${COMPILE_OPTIONS})
>  -  list(APPEND cflags -iquote${CMAKE_SOURCE_DIR}/src/include -w)
>  +  list(APPEND cflags -iquote${CMAKE_SOURCE_DIR}/src/include -w --sysroot=${CMAKE_SYSROOT})
>     # This little bit of magic wipes out __Pyx_check_single_interpreter()
> @@ -75,7 +82,7 @@ index 5fe929499d..802eb37e32 100644
>          COMMAND
>              ${Python3_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/setup.py
>  diff --git a/cmake/modules/FindRocksDB.cmake b/cmake/modules/FindRocksDB.cmake
> -index c5dd3dfaf6..be38597af2 100644
> +index c5dd3dfaf..be38597af 100644
>  --- a/cmake/modules/FindRocksDB.cmake
>  +++ b/cmake/modules/FindRocksDB.cmake
>  @@ -9,9 +9,9 @@
> @@ -91,7 +98,7 @@ index c5dd3dfaf6..be38597af2 100644
>   if(ROCKSDB_INCLUDE_DIR AND EXISTS "${ROCKSDB_INCLUDE_DIR}/rocksdb/version.h")
>     foreach(ver "MAJOR" "MINOR" "PATCH")
>  diff --git a/src/compressor/zstd/CMakeLists.txt b/src/compressor/zstd/CMakeLists.txt
> -index a5ebdaf538..a234068150 100644
> +index b53b0d944..4955711a9 100644
>  --- a/src/compressor/zstd/CMakeLists.txt
>  +++ b/src/compressor/zstd/CMakeLists.txt
>  @@ -9,7 +9,7 @@ ExternalProject_Add(zstd_ext
> @@ -104,81 +111,111 @@ index a5ebdaf538..a234068150 100644
>                -G${CMAKE_GENERATOR}
>     BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/libzstd
>  diff --git a/src/pybind/cephfs/setup.py b/src/pybind/cephfs/setup.py
> -index 19ae6c329a..c9a25ccfff 100755
> +index c3d40df05..24c26c3ed 100755
>  --- a/src/pybind/cephfs/setup.py
>  +++ b/src/pybind/cephfs/setup.py
> -@@ -135,14 +135,6 @@ def check_sanity():
> +@@ -137,19 +137,11 @@ def check_sanity():
>       finally:
>           shutil.rmtree(tmp_dir)
>
>  -
> --if 'BUILD_DOC' in os.environ.keys():
> --    pass
> +-if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
> +-    ext_args = {}
> +-    cython_constants = dict(BUILD_DOC=True)
> +-    cythonize_args = dict(compile_time_env=cython_constants)
>  -elif check_sanity():
> --    pass
> +-    ext_args = get_python_flags(['cephfs'])
> +-    cython_constants = dict(BUILD_DOC=False)
> +-    include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
> +-    cythonize_args = dict(compile_time_env=cython_constants,
> +-                          include_path=include_path)
>  -else:
>  -    sys.exit(1)
> --
> ++ext_args = get_python_flags(['cephfs'])
> ++cython_constants = dict(BUILD_DOC=False)
> ++include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
> ++cythonize_args = dict(compile_time_env=cython_constants,
> ++                      include_path=include_path)
> +
>   cmdclass = {}
>   try:
> -     from Cython.Build import cythonize
>  diff --git a/src/pybind/rados/setup.py b/src/pybind/rados/setup.py
> -index e2c5696404..4e99d26721 100755
> +index 0d1047825..cff85a063 100755
>  --- a/src/pybind/rados/setup.py
>  +++ b/src/pybind/rados/setup.py
> -@@ -134,14 +134,6 @@ def check_sanity():
> +@@ -131,15 +131,8 @@ def check_sanity():
>       finally:
>           shutil.rmtree(tmp_dir)
>
>  -
> --if 'BUILD_DOC' in os.environ.keys():
> --    pass
> +-if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
> +-    ext_args = {}
> +-    cython_constants = dict(BUILD_DOC=True)
>  -elif check_sanity():
> --    pass
> +-    ext_args = get_python_flags(['rados'])
> +-    cython_constants = dict(BUILD_DOC=False)
>  -else:
>  -    sys.exit(1)
> --
> ++ext_args = get_python_flags(['rados'])
> ++cython_constants = dict(BUILD_DOC=False)
> +
>   cmdclass = {}
>   try:
> -     from Cython.Build import cythonize
>  diff --git a/src/pybind/rbd/setup.py b/src/pybind/rbd/setup.py
> -index 634484f140..f5bbbdab4f 100755
> +index 73ea4555f..e7f57ddb5 100755
>  --- a/src/pybind/rbd/setup.py
>  +++ b/src/pybind/rbd/setup.py
> -@@ -133,14 +133,6 @@ def check_sanity():
> +@@ -135,19 +135,11 @@ def check_sanity():
>       finally:
>           shutil.rmtree(tmp_dir)
>
>  -
> --if 'BUILD_DOC' in os.environ.keys():
> --    pass
> +-if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
> +-    ext_args = {}
> +-    cython_constants = dict(BUILD_DOC=True)
> +-    cythonize_args = dict(compile_time_env=cython_constants)
>  -elif check_sanity():
> --    pass
> +-    ext_args = get_python_flags(['rados', 'rbd'])
> +-    cython_constants = dict(BUILD_DOC=False)
> +-    include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
> +-    cythonize_args = dict(compile_time_env=cython_constants,
> +-                          include_path=include_path)
>  -else:
>  -    sys.exit(1)
> --
> ++ext_args = get_python_flags(['rados', 'rbd'])
> ++cython_constants = dict(BUILD_DOC=False)
> ++include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
> ++cythonize_args = dict(compile_time_env=cython_constants,
> ++                      include_path=include_path)
> +
>   cmdclass = {}
>   try:
> -     from Cython.Build import cythonize
>  diff --git a/src/pybind/rgw/setup.py b/src/pybind/rgw/setup.py
> -index eb1591a460..b9f2428cf9 100755
> +index 663604e8f..489c9ba1f 100755
>  --- a/src/pybind/rgw/setup.py
>  +++ b/src/pybind/rgw/setup.py
> -@@ -134,14 +134,6 @@ def check_sanity():
> +@@ -135,19 +135,11 @@ def check_sanity():
>       finally:
>           shutil.rmtree(tmp_dir)
>
>  -
> --if 'BUILD_DOC' in os.environ.keys():
> --    pass
> +-if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
> +-    ext_args = {}
> +-    cython_constants = dict(BUILD_DOC=True)
> +-    cythonize_args = dict(compile_time_env=cython_constants)
>  -elif check_sanity():
> --    pass
> +-    ext_args = get_python_flags(['rados', 'rgw'])
> +-    cython_constants = dict(BUILD_DOC=False)
> +-    include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
> +-    cythonize_args = dict(compile_time_env=cython_constants,
> +-                          include_path=include_path)
>  -else:
>  -    sys.exit(1)
> --
> ++ext_args = get_python_flags(['rados', 'rgw'])
> ++cython_constants = dict(BUILD_DOC=False)
> ++include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
> ++cythonize_args = dict(compile_time_env=cython_constants,
> ++                      include_path=include_path)
> +
>   cmdclass = {}
>   try:
> -     from Cython.Build import cythonize
> ---
> -2.20.1
> -
> diff --git a/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.9.patch b/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.9.patch
> deleted file mode 100644
> index d9116c4..0000000
> --- a/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.9.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 1060f2e4362ebd6db23870d442dcd158d219ee92 Mon Sep 17 00:00:00 2001
> -From: Yanfei Xu <yanfei.xu@windriver.com>
> -Date: Tue, 10 Nov 2020 17:17:30 +0800
> -Subject: [PATCH] cmake: add support for python3.9
> -
> -add support for python3.9.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> ----
> - cmake/modules/FindPython/Support.cmake | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/cmake/modules/FindPython/Support.cmake b/cmake/modules/FindPython/Support.cmake
> -index 6584699b79..c05bbe3306 100644
> ---- a/cmake/modules/FindPython/Support.cmake
> -+++ b/cmake/modules/FindPython/Support.cmake
> -@@ -17,7 +17,7 @@ if (NOT DEFINED _${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR)
> -   message (FATAL_ERROR "FindPython: INTERNAL ERROR")
> - endif()
> - if (_${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR EQUAL 3)
> --  set(_${_PYTHON_PREFIX}_VERSIONS 3.8 3.7 3.6 3.5 3.4 3.3 3.2 3.1 3.0)
> -+  set(_${_PYTHON_PREFIX}_VERSIONS 3.9 3.8 3.7 3.6 3.5 3.4 3.3 3.2 3.1 3.0)
> - elseif (_${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR EQUAL 2)
> -   set(_${_PYTHON_PREFIX}_VERSIONS 2.7 2.6 2.5 2.4 2.3 2.2 2.1 2.0)
> - else()
> ---
> -2.18.2
> -
> diff --git a/recipes-extended/ceph/ceph/0001-fix-host-library-paths-were-used.patch b/recipes-extended/ceph/ceph/0001-fix-host-library-paths-were-used.patch
> index 310bfa4..1062ae7 100644
> --- a/recipes-extended/ceph/ceph/0001-fix-host-library-paths-were-used.patch
> +++ b/recipes-extended/ceph/ceph/0001-fix-host-library-paths-were-used.patch
> @@ -1,4 +1,4 @@
> -From bbf1cba8feb0e43492a1f6a6b31d024117cad262 Mon Sep 17 00:00:00 2001
> +From a7f56278dd4762c56cccd559e260e51092763cac Mon Sep 17 00:00:00 2001
>  From: Hongxu Jia <hongxu.jia@windriver.com>
>  Date: Mon, 13 Apr 2020 23:35:41 -0700
>  Subject: [PATCH] fix host library paths were used
> @@ -8,6 +8,7 @@ Test the existence of recipe-sysrooot, add it back if lost
>  Upstream-Status: Inappropriate [oe specific]
>
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +
>  ---
>   src/pybind/cephfs/setup.py | 6 +++++-
>   src/pybind/rados/setup.py  | 6 +++++-
> @@ -16,11 +17,11 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>   4 files changed, 20 insertions(+), 4 deletions(-)
>
>  diff --git a/src/pybind/cephfs/setup.py b/src/pybind/cephfs/setup.py
> -index c9a25ccf..972f936c 100755
> +index 87cdeb473..5144c8441 100755
>  --- a/src/pybind/cephfs/setup.py
>  +++ b/src/pybind/cephfs/setup.py
> -@@ -63,9 +63,13 @@ def get_python_flags(libs):
> -                    distutils.sysconfig.get_config_vars('LIBS', 'SYSLIBS')), [])
> +@@ -65,10 +65,14 @@ def get_python_flags(libs):
> +                filter(lambda lib: lib.startswith('-l'), py_libs)]
>       compiler = new_compiler()
>       distutils.sysconfig.customize_compiler(compiler)
>  +    libpl = distutils.sysconfig.get_config_var('LIBPL')
> @@ -29,17 +30,18 @@ index c9a25ccf..972f936c 100755
>  +        libpl = sysroot + libpl
>       return dict(
>           include_dirs=[distutils.sysconfig.get_python_inc()],
> --        library_dirs=distutils.sysconfig.get_config_vars('LIBDIR', 'LIBPL'),
> -+        library_dirs=[distutils.sysconfig.get_config_var('LIBDIR'), libpl],
> -         libraries=libs + [lib.replace('-l', '') for lib in py_libs],
> +         library_dirs=distutils.sysconfig.get_config_vars('LIBDIR', 'LIBPL'),
> +-        libraries=libs + py_libs,
> ++        libraries=libs + [lib.replace('-l', '') for lib in py_libs],
>           extra_compile_args=filter_unsupported_flags(
>               compiler.compiler[0],
> +             compiler.compiler[1:] + distutils.sysconfig.get_config_var('CFLAGS').split()),
>  diff --git a/src/pybind/rados/setup.py b/src/pybind/rados/setup.py
> -index 4e99d267..de24f766 100755
> +index feafb605d..82aff5154 100755
>  --- a/src/pybind/rados/setup.py
>  +++ b/src/pybind/rados/setup.py
> -@@ -66,9 +66,13 @@ def get_python_flags(libs):
> -                    distutils.sysconfig.get_config_vars('LIBS', 'SYSLIBS')), [])
> +@@ -63,10 +63,14 @@ def get_python_flags(libs):
> +                filter(lambda lib: lib.startswith('-l'), py_libs)]
>       compiler = new_compiler()
>       distutils.sysconfig.customize_compiler(compiler)
>  +    libpl = distutils.sysconfig.get_config_var('LIBPL')
> @@ -48,17 +50,18 @@ index 4e99d267..de24f766 100755
>  +        libpl = sysroot + libpl
>       return dict(
>           include_dirs=[distutils.sysconfig.get_python_inc()],
> --        library_dirs=distutils.sysconfig.get_config_vars('LIBDIR', 'LIBPL'),
> -+        library_dirs=[distutils.sysconfig.get_config_var('LIBDIR'), libpl],
> -         libraries=libs + [lib.replace('-l', '') for lib in py_libs],
> +         library_dirs=distutils.sysconfig.get_config_vars('LIBDIR', 'LIBPL'),
> +-        libraries=libs + py_libs,
> ++        libraries=libs + [lib.replace('-l', '') for lib in py_libs],
>           extra_compile_args=filter_unsupported_flags(
>               compiler.compiler[0],
> +             compiler.compiler[1:] + distutils.sysconfig.get_config_var('CFLAGS').split()),
>  diff --git a/src/pybind/rbd/setup.py b/src/pybind/rbd/setup.py
> -index f5bbbdab..a1f70e1d 100755
> +index b9c6a78d2..4ef714f8d 100755
>  --- a/src/pybind/rbd/setup.py
>  +++ b/src/pybind/rbd/setup.py
> -@@ -63,9 +63,13 @@ def get_python_flags(libs):
> -                    distutils.sysconfig.get_config_vars('LIBS', 'SYSLIBS')), [])
> +@@ -65,10 +65,14 @@ def get_python_flags(libs):
> +                filter(lambda lib: lib.startswith('-l'), py_libs)]
>       compiler = new_compiler()
>       distutils.sysconfig.customize_compiler(compiler)
>  +    libpl = distutils.sysconfig.get_config_var('LIBPL')
> @@ -67,17 +70,18 @@ index f5bbbdab..a1f70e1d 100755
>  +        libpl = sysroot + libpl
>       return dict(
>           include_dirs=[distutils.sysconfig.get_python_inc()],
> --        library_dirs=distutils.sysconfig.get_config_vars('LIBDIR', 'LIBPL'),
> -+        library_dirs=[distutils.sysconfig.get_config_var('LIBDIR'), libpl],
> -         libraries=libs + [lib.replace('-l', '') for lib in py_libs],
> +         library_dirs=distutils.sysconfig.get_config_vars('LIBDIR', 'LIBPL'),
> +-        libraries=libs + py_libs,
> ++        libraries=libs + [lib.replace('-l', '') for lib in py_libs],
>           extra_compile_args=filter_unsupported_flags(
>               compiler.compiler[0],
> +             compiler.compiler[1:] + distutils.sysconfig.get_config_var('CFLAGS').split()),
>  diff --git a/src/pybind/rgw/setup.py b/src/pybind/rgw/setup.py
> -index b9f2428c..f5119f73 100755
> +index 695038c0e..2521f0cbb 100755
>  --- a/src/pybind/rgw/setup.py
>  +++ b/src/pybind/rgw/setup.py
> -@@ -64,9 +64,13 @@ def get_python_flags(libs):
> -                    distutils.sysconfig.get_config_vars('LIBS', 'SYSLIBS')), [])
> +@@ -65,10 +65,14 @@ def get_python_flags(libs):
> +                filter(lambda lib: lib.startswith('-l'), py_libs)]
>       compiler = new_compiler()
>       distutils.sysconfig.customize_compiler(compiler)
>  +    libpl = distutils.sysconfig.get_config_var('LIBPL')
> @@ -86,11 +90,9 @@ index b9f2428c..f5119f73 100755
>  +        libpl = sysroot + libpl
>       return dict(
>           include_dirs=[distutils.sysconfig.get_python_inc()],
> --        library_dirs=distutils.sysconfig.get_config_vars('LIBDIR', 'LIBPL'),
> -+        library_dirs=[distutils.sysconfig.get_config_var('LIBDIR'), libpl],
> -         libraries=libs + [lib.replace('-l', '') for lib in py_libs],
> +         library_dirs=distutils.sysconfig.get_config_vars('LIBDIR', 'LIBPL'),
> +-        libraries=libs + py_libs,
> ++        libraries=libs + [lib.replace('-l', '') for lib in py_libs],
>           extra_compile_args=filter_unsupported_flags(
>               compiler.compiler[0],
> ---
> -2.21.0
> -
> +             compiler.compiler[1:] + distutils.sysconfig.get_config_var('CFLAGS').split()),
> diff --git a/recipes-extended/ceph/ceph/0001-libcephsqlite-Add-library-soversion-properties.patch b/recipes-extended/ceph/ceph/0001-libcephsqlite-Add-library-soversion-properties.patch
> new file mode 100644
> index 0000000..2c9cd11
> --- /dev/null
> +++ b/recipes-extended/ceph/ceph/0001-libcephsqlite-Add-library-soversion-properties.patch
> @@ -0,0 +1,31 @@
> +From ce36ce7d1c0f954d1532a759f4d7b09d87287dac Mon Sep 17 00:00:00 2001
> +From: Saul Wold <saul.wold@windriver.com>
> +Date: Thu, 22 Apr 2021 08:05:57 -0700
> +Subject: [PATCH] libcephsqlite: Add library soversion properties
> +
> +This additional properties are needed to ensure the library
> +is installed with an soversion so that when the library is
> +packaged it gets packaged corectly in the ceph package and
> +ceph-dev package as the link.
> +
> +Upstream-Status: pending
> +Signed-off-by: Saul Wold <saul.wold@windriver.com>
> +---
> + src/CMakeLists.txt | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
> +index 37db48f86..8dc7bdb56 100644
> +--- a/src/CMakeLists.txt
> ++++ b/src/CMakeLists.txt
> +@@ -804,6 +804,10 @@ if(WITH_LIBCEPHSQLITE)
> +   set(cephsqlite_srcs libcephsqlite.cc SimpleRADOSStriper.cc)
> +   add_library(cephsqlite ${CEPH_SHARED} ${cephsqlite_srcs})
> +   target_link_libraries(cephsqlite PRIVATE cls_lock_client librados ceph-common SQLite3::SQLite3 ${EXTRALIBS})
> ++  set_target_properties(cephsqlite PROPERTIES
> ++    OUTPUT_NAME cephsqlite
> ++    VERSION 1.0.0
> ++    SOVERSION 1)
> +   install(TARGETS cephsqlite DESTINATION ${CMAKE_INSTALL_LIBDIR})
> + endif(WITH_LIBCEPHSQLITE)
> +
> diff --git a/recipes-extended/ceph/ceph_15.2.9.bb b/recipes-extended/ceph/ceph_16.2.1.bb
> similarity index 60%
> rename from recipes-extended/ceph/ceph_15.2.9.bb
> rename to recipes-extended/ceph/ceph_16.2.1.bb
> index 0d821f0..0aa27dc 100644
> --- a/recipes-extended/ceph/ceph_15.2.9.bb
> +++ b/recipes-extended/ceph/ceph_16.2.1.bb
> @@ -1,26 +1,81 @@
> +# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
> +# The following is the difference between the old and the new license text.
> +# Please update the LICENSE value if needed, and summarize the changes in
> +# the commit message via 'License-Update:' tag.
> +# (example: 'License-Update: copyright years updated.')
> +#
> +# The changes:
> +#
> +# --- COPYING
> +# +++ COPYING
> +# @@ -7,6 +7,11 @@
> +#  Copyright: (c) 2004-2010 by Sage Weil <sage@newdream.net>
> +#  License: LGPL-2.1 or LGPL-3 (see COPYING-LGPL2.1 and COPYING-LGPL3)
> +#
> +# +Files: cmake/modules/FindPython*
> +# +Copyright:
> +# +    Copyright 2000-2020 Kitware, Inc. and Contributors
> +# +License: BSD 3-clause
> +# +
> +#  Files: cmake/modules/FindLTTngUST.cmake
> +#  Copyright:
> +#      Copyright 2016 Kitware, Inc.
> +# @@ -31,6 +36,10 @@
> +#  Files: src/include/ceph_hash.cc
> +#  Copyright: None
> +#  License: Public domain
> +# +
> +# +Files: src/include/rados.h, except ceph_stable_mod(), which is public domain
> +# +Copyright: the authors
> +# +License: LGPL-2.1 or LGPL-3 (see COPYING-LGPL2.1 and COPYING-LGPL3)
> +#
> +#  Files: src/common/bloom_filter.hpp
> +#  Copyright: Copyright (C) 2000 Arash Partow <arash@partow.net>
> +# @@ -191,4 +200,17 @@
> +#
> +#  Files: src/include/function2.hpp
> +#  Copyright: 2015-2018, Denis Blank
> +# -License: Boost Software License, Version 1.0+License: Boost Software License, Version 1.0
> +# +
> +# +Files: src/include/expected.hpp
> +# +Copyright: 2017, Simon Brand
> +# +License: CC0
> +# +
> +# +Files: src/include/uses_allocator.h
> +# +Copyright: 2016, Pablo Halpern <phalpern@halpernwightsoftware.com>
> +# +License: Boost Software License, Version 1.0
> +# +
> +# +Files: src/common/async/bind_allocator.h
> +# +Copyright: 2020 Red Hat <contact@redhat.com>
> +# +           2003-2019 Christopher M. Kohlhoff <chris@kohlhoff.com>
> +# +License: Boost Software License, Version 1.0
> +#
> +#
> +
>  SUMMARY = "User space components of the Ceph file system"
>  LICENSE = "LGPLv2.1 & GPLv2 & Apache-2.0 & MIT"
>  LIC_FILES_CHKSUM = "file://COPYING-LGPL2.1;md5=fbc093901857fcd118f065f900982c24 \
>                      file://COPYING-GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> -                    file://COPYING;md5=4eb012c221c5fd4b760029a2981a6754 \
> -"
> -inherit cmake python3native python3-dir systemd
> +                    file://COPYING;md5=d140fb1fedb53047f0d0830883e7af9f \
> +                    "
> +inherit cmake distutils3-base systemd
> +
>  # Disable python pybind support for ceph temporary, when corss compiling pybind,
>  # pybind mix cmake and python setup environment, would case a lot of errors.
>
> +SRC_URI[sha256sum] = "30ff943287361b4c3f0a9bf8bcd4399751b91434eec7d602ce6e93c42c741be3"
>  SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
>             file://0001-ceph-fix-build-errors-for-cross-compile.patch \
>             file://0001-fix-host-library-paths-were-used.patch \
>             file://ceph.conf \
> -           file://0001-add-missing-include-for-atomic-bool.patch \
> -           file://0001-cmake-add-support-for-python3.9.patch \
> -"
> +           file://0001-libcephsqlite-Add-library-soversion-properties.patch \
> +           "
>
> -SRC_URI[md5sum] = "5a949b91199efe130bfe2e57f200eacd"
> -SRC_URI[sha256sum] = "ea7fa2be68b3570c5c3aa02774dca27de20b6f20a8498f65e5c4ef375a209ace"
> -SRC_URI[sha1sum] = "0503649d7c7d9268cb61b03bbe839106988f87d7"
> -SRC_URI[sha384sum] = "57208c126ea8e640c3979073fd64ce58606f17b4b7ed2e005b0792bdfd51b13391af325658d0f68f961f94175d93e891"
> -SRC_URI[sha512sum] = "1f55b0a13bf06df782831d0c9d5f8617c22442ab97fb186e6ccb08183e02bf1756caf8633fa6b1cf156c3fb7b1bdff90a60a1249adfad0b9450036e2329bf8ff"
> +
> +SRC_URI[sha1sum] = "f8cc85e4cc519d7e469a0c3c8327bd1675f0b287"
> +SRC_URI[sha256sum] = "30ff943287361b4c3f0a9bf8bcd4399751b91434eec7d602ce6e93c42c741be3"
> +SRC_URI[sha384sum] = "29a75a733e5ae8039a5ad603558a9707e36b8c337419039ee97351cdbad57875fa57a365fcde29124cee72734608e245"
> +SRC_URI[sha512sum] = "aeb9a91c33221c64ea24603dc88cab346bf0abdf0d41ff85c2e1cf134130737ec1fab1246be0a2fa3af8a655ae1dabb69688855f229f54438e60cb8098175b8e"
>
>  DEPENDS = "boost bzip2 curl expat gperf-native \
>             keyutils libaio libibverbs lz4 \
> @@ -28,6 +83,7 @@ DEPENDS = "boost bzip2 curl expat gperf-native \
>             oath openldap openssl \
>             python3 python3-cython-native rabbitmq-c rocksdb snappy udev \
>             valgrind xfsprogs zlib \
> +           lua cryptsetup \
>  "
>  SYSTEMD_SERVICE_${PN} = " \
>          ceph-radosgw@.service \
> @@ -92,6 +148,14 @@ do_install_append () {
>         mv ${D}${libexecdir}/ceph/ceph_common.sh ${D}${libdir}/ceph
>         # WITH_FUSE is set to OFF, remove ceph-fuse related units
>         rm ${D}${systemd_unitdir}/system/ceph-fuse.target ${D}${systemd_unitdir}/system/ceph-fuse@.service
> +        # Fix up cehpfs-top and any other python installed with wrong #!
> +        for i in ${D}${bindir}/* ${D}${sbindir}/*; do
> +            if [ -f "$i" ]; then
> +                sed -i -e s:${PYTHON}:${USRBINPATH}/env\ ${DISTUTILS_PYTHON}:g $i
> +                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
> +            fi
> +        done
> +
>  }
>
>  do_install_append_class-target () {
> @@ -116,7 +180,7 @@ FILES_${PN} += "\
>                 ${libdir}/rados-classes/*.so.* \
>                 ${libdir}/ceph/compressor/*.so \
>                 ${libdir}/rados-classes/*.so \
> -               ${libdir}/ceph/*.so \
> +               ${libdir}/ceph/*.so \
>  "
>
>  FILES_${PN} += " \
> @@ -133,11 +197,10 @@ RDEPENDS_${PN} += "\
>                 python3-modules \
>                 python3-prettytable \
>                 ${PN}-python \
> +                gawk \
>  "
>  COMPATIBLE_HOST = "(x86_64).*"
> -PACKAGES += " \
> -       ${PN}-python \
> -"
> +PACKAGE_BEFORE_PN += "${PN}-python"
>  INSANE_SKIP_${PN}-python += "ldflags"
>  INSANE_SKIP_${PN} += "dev-so"
>  CCACHE_DISABLE = "1"
> --
> 2.25.1
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
