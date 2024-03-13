Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF96DC54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 13:13:31 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.16374.1710335603700998778
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Mar 2024 06:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nYNlFO8g;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-29c54d08d5cso1074725a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Mar 2024 06:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710335603; x=1710940403; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VlULitUhTOFNIzYnhvv2ELnFpGrQ8fC2ZFBwtcoKdmU=;
        b=nYNlFO8g+v8sHZsKZ/wpV7EOAcuR0de8eMisGHiIBHfFVDN4gcKdRI6XH7wsHa90jZ
         JENw4fJO3u30mKGTBoBiy0Rv+LYRJ1MsTCZ2iUjAIrIZ8wBoM9Xb9wgfNNvrK/cRmzLP
         QegD6S/U0rc+ZrFWlMml97zyoqICOd7JaK44zN11J3/WPM6xzMaaQkvf06Sz0XYxYxqR
         XddGemcKpBboxFQ6O6paWYcQ1ggKkdyNdExRSmKuumXGkPWud2ynoKoRccJkkYOFXcqM
         CbldYk7Ee8ToBnrNGUEF4t1y60d4cnB5unxQlmcd2ldaNCXKFX25FlU9/sMFbDXu73e3
         Xaww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710335603; x=1710940403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VlULitUhTOFNIzYnhvv2ELnFpGrQ8fC2ZFBwtcoKdmU=;
        b=bCdGWpWVO0Ba5XS3HDfU2oJ+GKMNcqbG3Ua8Si+VNVuZ3osLclUWQpoOrNunFRAbE9
         kIuAMkoXK7H9qoeC4zZTksS0lQgdPrgio9KA2hBtjXBJMWvZqBakq6UDTg6tiogUQ9dL
         f/UZ0HRBDLeUhIYoVKc5a+9M4c3ek/LJQMYZo7tB5khJkysoUEemLUfnjLLjkXDzbTmV
         972GUMdWJJLp31N924T1YK3aB2QA3JqCQiOsIbG4LEgKFBCO18VybXgYP9cCHiB/7KLL
         gdo5TgcfxzXqBBBf1iHZD9ffpF9lh+cNgBrGO7lz4kFG3pVlSJMMhAYTROstUH5XE/hZ
         0JRw==
X-Gm-Message-State: AOJu0YybmoRnsLSDA+9qyUA9Wx9Mg5iQitMX9CE7yVOC3lJ/uEjJ5zgi
	8wFD/HALoylXW3WJn1m1eGdCQJiB0kMG6qaoYnLeaarnatdCwjIJ3S+90zch6OO7HiuayX9WdgJ
	sqXd/4aXDNhsXPxFxt7wOos4Gic8=
X-Google-Smtp-Source: AGHT+IEUPBpFb/n/OigD1ivi+fT2A3ZatsKzKlBgy1yWOjJPJC6TQT6Ph/bgUPHiaJyWqzZKOb7ob5AKrD/ZmNiAKi4=
X-Received: by 2002:a17:90a:e606:b0:29c:3bed:afb2 with SMTP id
 j6-20020a17090ae60600b0029c3bedafb2mr4296986pjy.7.1710335602675; Wed, 13 Mar
 2024 06:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240313110727.3748134-1-Qi.Chen@windriver.com>
In-Reply-To: <20240313110727.3748134-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 13 Mar 2024 09:13:11 -0400
Message-ID: <CADkTA4NqDEGDs9wXN4+Ae3-YKvzcnALkpDqTKa6h9Hxti1Rd2A@mail.gmail.com>
Subject: Re: [meta-virtualization][master-next][PATCH] ceph: fix
 do_compile/do_install failures
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Mar 2024 13:13:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8636

These questions are for my own understanding, they aren't issues I
have with the patch!

On Wed, Mar 13, 2024 at 7:08=E2=80=AFAM Chen Qi via lists.yoctoproject.org
<Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> 1. OECMAKE_C/CXX_COMPILER needs to have sysroot setting in it, because
>    ceph's cmake files are using it to construct PY_CC. Without it, files
>    such as stdlib.h cannot be found.

Since this used to be cross compiling (but it has been a while since
it updated, hence
my stubbornness in needing to upgrade it before the release). I'm
curious as to why
this wasn't already done. The inability to link the test C program
showed that this was
the case .. but I wasn't able to locate this variable and set it.

I would have thought that this is something the cmake bbclass should
take care of.

Is the variable used for this in Ceph custom ?

> 2. re2 is added to deps. Seems no way to disable it.

ok. I didn't make it far enough to see that this was needed.

> 3. 0001-ceph-fix-build-errors-for-cross-compile.patch is dropped. It's us=
eless
>    and problematic for new version.

What broke with this in place ?

> 4. 0001-cmake-add-support-for-python3.11.patch is dropped as it's not nee=
ded anymore.

Agreed. I was going to drop it as well (in particular since we are python12=
 and
it wasn't failing checks).

On this point: Did you not run into Thrift or python not being
detected properly ?
I was constantly hitting those two errors.

> 5. 0001-avoid-to_string-error.patch is added to fix build error, maybe ca=
used by
>    boost version incompatibility.

Looks good. I didn't get far enough to run into this one.

> 6. Some cleanups.
> 7. A few more options are set.

I assume it is these ones (among a few others)

> +                 -DARROW_GANDIVA=3DOFF \
> +                 -DARROW_WITH_RE2=3DOFF \
> +                 -DWITH_RADOSGW_SELECT_PARQUET=3DOFF \
> +                 -DWITH_RADOSGW_ARROW_FLIGHT=3DOFF \

Were those options needed to fix build issues ? I assume so,
since they are being turned off.

I support turning off everything we can in Ceph :)

> 8. BUILD_DOC=3D1 is exported so that check_sanity() causes compilation er=
ror.
>    This is a workaround and may need further visit in the future.

Interesting. What is the sanity error ? Without having hit it that way, tha=
t
variable indicates that we will be building the docs .. I assume the sanity
check is looking to see that they are present and/or that the build of them
has been enabled ?

> 9. Delete the conditional check for /etc/debian_version which adds '--ins=
tall-layout deb'
>    and causes the following error.
>      error: option --install-layout not recognized
>    The patch is 0001-delete-install-layout-deb.patch.

Sounds good. I didn't make it this far :)

> 10. ceph-volume[-systemd] are now in sbin.
> 11. cephfs-mirror units are added to avoid package QA issue.

Also good.

As I mentioned, we'll ignore the TMPDIR QA issues, this is going to be an
incremental process to bring ceph back into something that is updated.

Bruce

>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../ceph/0001-avoid-to_string-error.patch     |  73 +++++++
>  ...h-fix-build-errors-for-cross-compile.patch | 189 ------------------
>  ...001-cmake-add-support-for-python3.11.patch |  31 ---
>  .../ceph/0001-delete-install-layout-deb.patch |  37 ++++
>  recipes-extended/ceph/ceph_18.2.0.bb          |  61 +++---
>  5 files changed, 136 insertions(+), 255 deletions(-)
>  create mode 100644 recipes-extended/ceph/ceph/0001-avoid-to_string-error=
.patch
>  delete mode 100644 recipes-extended/ceph/ceph/0001-ceph-fix-build-errors=
-for-cross-compile.patch
>  delete mode 100644 recipes-extended/ceph/ceph/0001-cmake-add-support-for=
-python3.11.patch
>  create mode 100644 recipes-extended/ceph/ceph/0001-delete-install-layout=
-deb.patch
>
> diff --git a/recipes-extended/ceph/ceph/0001-avoid-to_string-error.patch =
b/recipes-extended/ceph/ceph/0001-avoid-to_string-error.patch
> new file mode 100644
> index 00000000..0b4fc984
> --- /dev/null
> +++ b/recipes-extended/ceph/ceph/0001-avoid-to_string-error.patch
> @@ -0,0 +1,73 @@
> +From f807220d13adc0656c30d3207d11c70360b88d06 Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Wed, 13 Mar 2024 03:14:55 -0700
> +Subject: [PATCH] avoid to_string error
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + src/rgw/rgw_asio_client.cc | 15 ++++++++-------
> + 1 file changed, 8 insertions(+), 7 deletions(-)
> +
> +diff --git a/src/rgw/rgw_asio_client.cc b/src/rgw/rgw_asio_client.cc
> +index a0ec0bf5c..17880eda5 100644
> +--- a/src/rgw/rgw_asio_client.cc
> ++++ b/src/rgw/rgw_asio_client.cc
> +@@ -3,6 +3,7 @@
> +
> + #include <boost/algorithm/string/predicate.hpp>
> + #include <boost/asio/write.hpp>
> ++#include <string_view>
> +
> + #include "rgw_asio_client.h"
> + #include "rgw_perf_counters.h"
> +@@ -39,11 +40,11 @@ int ClientIO::init_env(CephContext *cct)
> +     const auto& value =3D header->value();
> +
> +     if (field =3D=3D beast::http::field::content_length) {
> +-      env.set("CONTENT_LENGTH", value.to_string());
> ++      env.set("CONTENT_LENGTH", std::string(value));
> +       continue;
> +     }
> +     if (field =3D=3D beast::http::field::content_type) {
> +-      env.set("CONTENT_TYPE", value.to_string());
> ++      env.set("CONTENT_TYPE", std::string(value));
> +       continue;
> +     }
> +
> +@@ -62,26 +63,26 @@ int ClientIO::init_env(CephContext *cct)
> +     }
> +     *dest =3D '\0';
> +
> +-    env.set(buf, value.to_string());
> ++    env.set(buf, std::string(value));
> +   }
> +
> +   int major =3D request.version() / 10;
> +   int minor =3D request.version() % 10;
> +   env.set("HTTP_VERSION", std::to_string(major) + '.' + std::to_string(=
minor));
> +
> +-  env.set("REQUEST_METHOD", request.method_string().to_string());
> ++  env.set("REQUEST_METHOD", std::string(request.method_string()));
> +
> +   // split uri from query
> +   auto uri =3D request.target();
> +   auto pos =3D uri.find('?');
> +   if (pos !=3D uri.npos) {
> +     auto query =3D uri.substr(pos + 1);
> +-    env.set("QUERY_STRING", query.to_string());
> ++    env.set("QUERY_STRING", std::string(query));
> +     uri =3D uri.substr(0, pos);
> +   }
> +-  env.set("SCRIPT_URI", uri.to_string());
> ++  env.set("SCRIPT_URI", std::string(uri));
> +
> +-  env.set("REQUEST_URI", request.target().to_string());
> ++  env.set("REQUEST_URI", std::string(request.target()));
> +
> +   char port_buf[16];
> +   snprintf(port_buf, sizeof(port_buf), "%d", local_endpoint.port());
> +--
> +2.42.0
> +
> diff --git a/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cr=
oss-compile.patch b/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-f=
or-cross-compile.patch
> deleted file mode 100644
> index 9686becb..00000000
> --- a/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-com=
pile.patch
> +++ /dev/null
> @@ -1,189 +0,0 @@
> -From 4712fe18405ffea31405308357a8e7fca358bcce Mon Sep 17 00:00:00 2001
> -From: Dengke Du <dengke.du@windriver.com>
> -Date: Mon, 11 Mar 2019 09:14:09 +0800
> -Subject: [PATCH] ceph: fix build errors for cross compile
> -
> -1. set the cross compile sysroot to find the rocksdb library
> -2. correct the install path for library in Distutils.cmake
> -
> -Upstream-Status: Inappropriate [oe specific]
> -
> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
> -
> -Adjust context for v14.2.3
> -
> -Signed-off-by: He Zhe <zhe.he@windriver.com>
> -Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ----
> - cmake/modules/Distutils.cmake      | 25 +++++--------------------
> - cmake/modules/FindRocksDB.cmake    |  4 ++--
> - src/compressor/zstd/CMakeLists.txt |  2 +-
> - src/pybind/cephfs/setup.py         |  8 --------
> - src/pybind/rados/setup.py          |  8 --------
> - src/pybind/rbd/setup.py            |  8 --------
> - src/pybind/rgw/setup.py            |  8 --------
> - 7 files changed, 8 insertions(+), 55 deletions(-)
> -
> -Index: ceph-18.2.0/cmake/modules/Distutils.cmake
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- ceph-18.2.0.orig/cmake/modules/Distutils.cmake
> -+++ ceph-18.2.0/cmake/modules/Distutils.cmake
> -@@ -29,17 +29,10 @@
> -   cmake_parse_arguments(DU "" "INSTALL_SCRIPT" "" ${ARGN})
> -   install(CODE "
> -     set(options --prefix=3D${CMAKE_INSTALL_PREFIX})
> --    if(DEFINED ENV{DESTDIR})
> --      if(EXISTS /etc/debian_version)
> --        list(APPEND options --install-layout=3Ddeb)
> --      endif()
> --      list(APPEND options
> --        --root=3D\$ENV{DESTDIR}
> --        --single-version-externally-managed)
> --    endif()
> -     if(NOT \"${DU_INSTALL_SCRIPT}\" STREQUAL \"\")
> -       list(APPEND options --install-script=3D${DU_INSTALL_SCRIPT})
> --    endif()
> -+    list(APPEND options --root=3D${CMAKE_DESTDIR})
> -+    list(APPEND options --install-lib=3D${PYTHON_SITEPACKAGES_DIR})
> -     execute_process(
> -     COMMAND ${Python3_EXECUTABLE}
> -         setup.py install \${options}
> -@@ -65,7 +58,7 @@
> -   if(DU_DISABLE_VTA AND HAS_VTA)
> -     list(APPEND PY_CFLAGS -fno-var-tracking-assignments)
> -   endif()
> --  list(APPEND PY_CPPFLAGS -iquote${CMAKE_SOURCE_DIR}/src/include -w)
> -+  list(APPEND PY_CPPFLAGS -iquote${CMAKE_SOURCE_DIR}/src/include -w --s=
ysroot=3D${CMAKE_SYSROOT})
> -   # This little bit of magic wipes out __Pyx_check_single_interpreter()
> -   # Note: this is reproduced in distutils_install_cython_module
> -   list(APPEND PY_CPPFLAGS -D'void0=3Ddead_function\(void\)')
> -@@ -135,14 +128,8 @@
> -     set(ENV{CEPH_LIBDIR} \"${CMAKE_LIBRARY_OUTPUT_DIRECTORY}\")
> -
> -     set(options --prefix=3D${CMAKE_INSTALL_PREFIX})
> --    if(DEFINED ENV{DESTDIR})
> --      if(EXISTS /etc/debian_version)
> --        list(APPEND options --install-layout=3Ddeb)
> --      endif()
> --      list(APPEND options --root=3D\$ENV{DESTDIR})
> --    else()
> --      list(APPEND options --root=3D/)
> --    endif()
> -+    list(APPEND options --root=3D${CMAKE_DESTDIR})
> -+    list(APPEND options --install-lib=3D${PYTHON_SITEPACKAGES_DIR})
> -     execute_process(
> -        COMMAND
> -            ${Python3_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/setup.py
> -Index: ceph-18.2.0/cmake/modules/FindRocksDB.cmake
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- ceph-18.2.0.orig/cmake/modules/FindRocksDB.cmake
> -+++ ceph-18.2.0/cmake/modules/FindRocksDB.cmake
> -@@ -9,9 +9,9 @@
> - #  ROCKSDB_VERSION_MINOR
> - #  ROCKSDB_VERSION_PATCH
> -
> --find_path(ROCKSDB_INCLUDE_DIR rocksdb/db.h)
> -+find_path(ROCKSDB_INCLUDE_DIR rocksdb/db.h ${CMAKE_SYSROOT})
> -
> --find_library(ROCKSDB_LIBRARIES rocksdb)
> -+find_library(ROCKSDB_LIBRARIES rocksdb ${CMAKE_SYSROOT})
> -
> - if(ROCKSDB_INCLUDE_DIR AND EXISTS "${ROCKSDB_INCLUDE_DIR}/rocksdb/versi=
on.h")
> -   foreach(ver "MAJOR" "MINOR" "PATCH")
> -Index: ceph-18.2.0/src/pybind/cephfs/setup.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- ceph-18.2.0.orig/src/pybind/cephfs/setup.py
> -+++ ceph-18.2.0/src/pybind/cephfs/setup.py
> -@@ -135,20 +135,6 @@
> -     finally:
> -         shutil.rmtree(tmp_dir)
> -
> --
> --if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
> --    ext_args =3D {}
> --    cython_constants =3D dict(BUILD_DOC=3DTrue)
> --    cythonize_args =3D dict(compile_time_env=3Dcython_constants)
> --elif check_sanity():
> --    ext_args =3D get_python_flags(['cephfs'])
> --    cython_constants =3D dict(BUILD_DOC=3DFalse)
> --    include_path =3D [os.path.join(os.path.dirname(__file__), "..", "ra=
dos")]
> --    cythonize_args =3D dict(compile_time_env=3Dcython_constants,
> --                          include_path=3Dinclude_path)
> --else:
> --    sys.exit(1)
> --
> - cmdclass =3D {}
> - try:
> -     from Cython.Build import cythonize
> -Index: ceph-18.2.0/src/pybind/rados/setup.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- ceph-18.2.0.orig/src/pybind/rados/setup.py
> -+++ ceph-18.2.0/src/pybind/rados/setup.py
> -@@ -130,17 +130,6 @@
> -     finally:
> -         shutil.rmtree(tmp_dir)
> -
> --
> --if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
> --    ext_args =3D {}
> --    cython_constants =3D dict(BUILD_DOC=3DTrue)
> --elif check_sanity():
> --    ext_args =3D get_python_flags(['rados'])
> --    cython_constants =3D dict(BUILD_DOC=3DFalse)
> --else:
> --    sys.exit(1)
> --
> --cmdclass =3D {}
> - try:
> -     from Cython.Build import cythonize
> -     from Cython.Distutils import build_ext
> -Index: ceph-18.2.0/src/pybind/rbd/setup.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- ceph-18.2.0.orig/src/pybind/rbd/setup.py
> -+++ ceph-18.2.0/src/pybind/rbd/setup.py
> -@@ -133,20 +133,6 @@
> -     finally:
> -         shutil.rmtree(tmp_dir)
> -
> --
> --if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
> --    ext_args =3D {}
> --    cython_constants =3D dict(BUILD_DOC=3DTrue)
> --    cythonize_args =3D dict(compile_time_env=3Dcython_constants)
> --elif check_sanity():
> --    ext_args =3D get_python_flags(['rados', 'rbd'])
> --    cython_constants =3D dict(BUILD_DOC=3DFalse)
> --    include_path =3D [os.path.join(os.path.dirname(__file__), "..", "ra=
dos")]
> --    cythonize_args =3D dict(compile_time_env=3Dcython_constants,
> --                          include_path=3Dinclude_path)
> --else:
> --    sys.exit(1)
> --
> - cmdclass =3D {}
> - try:
> -     from Cython.Build import cythonize
> -Index: ceph-18.2.0/src/pybind/rgw/setup.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- ceph-18.2.0.orig/src/pybind/rgw/setup.py
> -+++ ceph-18.2.0/src/pybind/rgw/setup.py
> -@@ -134,20 +134,6 @@
> -     finally:
> -         shutil.rmtree(tmp_dir)
> -
> --
> --if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
> --    ext_args =3D {}
> --    cython_constants =3D dict(BUILD_DOC=3DTrue)
> --    cythonize_args =3D dict(compile_time_env=3Dcython_constants)
> --elif check_sanity():
> --    ext_args =3D get_python_flags(['rados', 'rgw'])
> --    cython_constants =3D dict(BUILD_DOC=3DFalse)
> --    include_path =3D [os.path.join(os.path.dirname(__file__), "..", "ra=
dos")]
> --    cythonize_args =3D dict(compile_time_env=3Dcython_constants,
> --                          include_path=3Dinclude_path)
> --else:
> --    sys.exit(1)
> --
> - cmdclass =3D {}
> - try:
> -     from Cython.Build import cythonize
> diff --git a/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python=
3.11.patch b/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.=
11.patch
> deleted file mode 100644
> index c72c91b2..00000000
> --- a/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.11.pa=
tch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 1060f2e4362ebd6db23870d442dcd158d219ee92 Mon Sep 17 00:00:00 2001
> -From: Yanfei Xu <yanfei.xu@windriver.com>
> -Date: Tue, 10 Nov 2020 17:17:30 +0800
> -Subject: [PATCH] cmake: add support for python 3.9 and 3.10
> -
> -add support for python3.9.
> -
> -Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> -
> -Add support for python 3.10.
> -
> -Upstream-Status: Submitted [https://github.com/ceph/ceph/pull/43630]
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> - cmake/modules/FindPython/Support.cmake | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -Index: ceph-18.2.0/cmake/modules/FindPython/Support.cmake
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- ceph-18.2.0.orig/cmake/modules/FindPython/Support.cmake
> -+++ ceph-18.2.0/cmake/modules/FindPython/Support.cmake
> -@@ -17,7 +17,7 @@
> -   message (FATAL_ERROR "FindPython: INTERNAL ERROR")
> - endif()
> - if (_${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR EQUAL 3)
> --  set(_${_PYTHON_PREFIX}_VERSIONS 3.10 3.9 3.8 3.7 3.6 3.5 3.4 3.3 3.2 =
3.1 3.0)
> -+  set(_${_PYTHON_PREFIX}_VERSIONS 3.11 3.10 3.9 3.8 3.7 3.6 3.5 3.4 3.3=
 3.2 3.1 3.0)
> - elseif (_${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR EQUAL 2)
> -   set(_${_PYTHON_PREFIX}_VERSIONS 2.7 2.6 2.5 2.4 2.3 2.2 2.1 2.0)
> - else()
> diff --git a/recipes-extended/ceph/ceph/0001-delete-install-layout-deb.pa=
tch b/recipes-extended/ceph/ceph/0001-delete-install-layout-deb.patch
> new file mode 100644
> index 00000000..91eacfa9
> --- /dev/null
> +++ b/recipes-extended/ceph/ceph/0001-delete-install-layout-deb.patch
> @@ -0,0 +1,37 @@
> +From 903bb882a44eb5567f8b1fc7f7c4857c2f03579d Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Wed, 13 Mar 2024 03:41:47 -0700
> +Subject: [PATCH] delete install-layout=3Ddeb
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + cmake/modules/Distutils.cmake | 6 ------
> + 1 file changed, 6 deletions(-)
> +
> +diff --git a/cmake/modules/Distutils.cmake b/cmake/modules/Distutils.cma=
ke
> +index daaae4ba6..e606e3890 100644
> +--- a/cmake/modules/Distutils.cmake
> ++++ b/cmake/modules/Distutils.cmake
> +@@ -30,9 +30,6 @@ function(distutils_install_module name)
> +   install(CODE "
> +     set(options --prefix=3D${CMAKE_INSTALL_PREFIX})
> +     if(DEFINED ENV{DESTDIR})
> +-      if(EXISTS /etc/debian_version)
> +-        list(APPEND options --install-layout=3Ddeb)
> +-      endif()
> +       list(APPEND options
> +         --root=3D\$ENV{DESTDIR}
> +         --single-version-externally-managed)
> +@@ -136,9 +133,6 @@ function(distutils_install_cython_module name)
> +
> +     set(options --prefix=3D${CMAKE_INSTALL_PREFIX})
> +     if(DEFINED ENV{DESTDIR})
> +-      if(EXISTS /etc/debian_version)
> +-        list(APPEND options --install-layout=3Ddeb)
> +-      endif()
> +       list(APPEND options --root=3D\$ENV{DESTDIR})
> +     else()
> +       list(APPEND options --root=3D/)
> +--
> +2.42.0
> +
> diff --git a/recipes-extended/ceph/ceph_18.2.0.bb b/recipes-extended/ceph=
/ceph_18.2.0.bb
> index 35188106..ca713bc6 100644
> --- a/recipes-extended/ceph/ceph_18.2.0.bb
> +++ b/recipes-extended/ceph/ceph_18.2.0.bb
> @@ -9,10 +9,10 @@ inherit cmake pkgconfig python3native python3-dir syste=
md
>  # pybind mix cmake and python setup environment, would case a lot of err=
ors.
>
>  SRC_URI =3D "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
> -           file://0001-ceph-fix-build-errors-for-cross-compile.patch \
>             file://0001-fix-host-library-paths-were-used.patch \
>             file://ceph.conf \
> -           file://0001-cmake-add-support-for-python3.11.patch \
> +           file://0001-avoid-to_string-error.patch \
> +           file://0001-delete-install-layout-deb.patch \
>  "
>
>  SRC_URI[sha256sum] =3D "495b63e1146c604018ae0cb29bf769b5d6235e3c95849c43=
513baf12bba1364d"
> @@ -23,8 +23,13 @@ DEPENDS =3D "boost bzip2 curl cryptsetup expat gperf-n=
ative \
>             oath openldap openssl \
>             python3 python3-native python3-cython-native python3-pyyaml-n=
ative \
>            rabbitmq-c rocksdb snappy thrift udev \
> -           valgrind xfsprogs zlib libgcc \
> +           valgrind xfsprogs zlib libgcc zstd re2 \
>  "
> +
> +
> +OECMAKE_C_COMPILER =3D "${@oecmake_map_compiler('CC', d)[0]} --sysroot=
=3D${RECIPE_SYSROOT}"
> +OECMAKE_CXX_COMPILER =3D "${@oecmake_map_compiler('CXX', d)[0]} --sysroo=
t=3D${RECIPE_SYSROOT}"
> +
>  SYSTEMD_SERVICE:${PN} =3D " \
>          ceph-radosgw@.service \
>          ceph-radosgw.target \
> @@ -34,6 +39,8 @@ SYSTEMD_SERVICE:${PN} =3D " \
>          ceph-mds.target \
>          ceph-osd@.service \
>          ceph-osd.target \
> +        cephfs-mirror@.service \
> +        cephfs-mirror.target \
>          ceph.target \
>          ceph-rbd-mirror@.service \
>          ceph-rbd-mirror.target \
> @@ -45,15 +52,20 @@ SYSTEMD_SERVICE:${PN} =3D " \
>          ceph-immutable-object-cache@.service \
>          ceph-immutable-object-cache.target \
>  "
> -OECMAKE_GENERATOR =3D "Unix Makefiles"
>
> -EXTRA_OECMAKE =3D "-DWITH_MANPAGE=3DOFF \
> +EXTRA_OECMAKE +=3D "-DWITH_MANPAGE=3DOFF \
> +                 -DWITH_JAEGER=3DOFF \
> +                 -DWITH_SYSTEM_ZSTD=3DON \
>                   -DWITH_FUSE=3DOFF \
>                   -DWITH_SPDK=3DOFF \
>                   -DWITH_LEVELDB=3DOFF \
>                   -DWITH_LTTNG=3DOFF \
>                   -DWITH_BABELTRACE=3DOFF \
>                   -DWITH_TESTS=3DOFF \
> +                 -DARROW_GANDIVA=3DOFF \
> +                 -DARROW_WITH_RE2=3DOFF \
> +                 -DWITH_RADOSGW_SELECT_PARQUET=3DOFF \
> +                 -DWITH_RADOSGW_ARROW_FLIGHT=3DOFF \
>                   -DWITH_MGR=3DOFF \
>                   -DWITH_MGR_DASHBOARD_FRONTEND=3DOFF \
>                   -DWITH_SYSTEM_BOOST=3DON \
> @@ -67,34 +79,6 @@ EXTRA_OECMAKE =3D "-DWITH_MANPAGE=3DOFF \
>                  -DCMAKE_TOOLCHAIN_FILE:FILEPATH=3D${WORKDIR}/toolchain.c=
make \
>                  "
>
> -EXTRA_OECMAKE +=3D "-DThrift_INCLUDE_DIR:PATH=3D${STAGING_INCDIR} \
> -                  -DThrift_LIBRARIES:PATH=3D${STAGING_LIBDIR} \
> -                 "
> -
> -# retired options:
> -#               -DPython3_VERSION=3D${PYTHON_BASEVERSION}
> -#               -DPython3_USE_STATIC_LIBS=3DFALSE
> -#               -DPython3_INCLUDE_DIR:PATH=3D${PYTHON_INCLUDE_DIR}
> -#               -DPython3_LIBRARY:PATH=3D${PYTHON_LIBRARY}
> -#               -DPython3_ROOT_DIR:PATH=3D${PYTHON_SITEPACKAGES_DIR}
> -#                -DPython3_EXECUTABLE:PATH=3D"${PYTHON}"
> -
> -CXXFLAGS +=3D "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
> -CFLAGS +=3D "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
> -
> -export STAGING_DIR_HOST
> -
> -do_compile:prepend() {
> -       cmake_runcmake_build --target legacy-option-headers
> -}
> -
> -# do_compile() {
> -#      ninja -v ${PARALLEL_MAKE}
> -# }
> -do_compile() {
> -        cmake_runcmake_build --target all
> -}
> -
>  do_configure:prepend () {
>         echo "set( CMAKE_SYSROOT \"${RECIPE_SYSROOT}\" )" >> ${WORKDIR}/t=
oolchain.cmake
>         echo "set( CMAKE_DESTDIR \"${D}\" )" >> ${WORKDIR}/toolchain.cmak=
e
> @@ -104,16 +88,23 @@ do_configure:prepend () {
>         echo "set( CMAKE_C_COMPILER_FORCED TRUE )" >> ${WORKDIR}/toolchai=
n.cmake
>  }
>
> +do_compile:prepend() {
> +       export BUILD_DOC=3D1
> +}
> +
> +do_install:prepend() {
> +       export BUILD_DOC=3D1
> +}
> +
>  do_install:append () {
>         sed -i -e 's:^#!/usr/bin/python$:&3:' \
>                 -e 's:${WORKDIR}.*python3:${bindir}/python3:' \
>                 ${D}${bindir}/ceph ${D}${bindir}/ceph-crash \
> -               ${D}${bindir}/ceph-volume ${D}${bindir}/ceph-volume-syste=
md
> +               ${D}${sbindir}/ceph-volume ${D}${sbindir}/ceph-volume-sys=
temd
>         find ${D} -name SOURCES.txt | xargs sed -i -e 's:${WORKDIR}::'
>         install -d ${D}${sysconfdir}/ceph
>         install -m 644 ${WORKDIR}/ceph.conf ${D}${sysconfdir}/ceph/
>         install -d ${D}${systemd_unitdir}
> -       mv ${D}${libexecdir}/systemd/system ${D}${systemd_unitdir}
>         mv ${D}${libexecdir}/ceph/ceph-osd-prestart.sh ${D}${libdir}/ceph
>         mv ${D}${libexecdir}/ceph/ceph_common.sh ${D}${libdir}/ceph
>         # WITH_FUSE is set to OFF, remove ceph-fuse related units
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8633): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8633
> Mute This Topic: https://lists.yoctoproject.org/mt/104902878/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

