Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web08.94.1619196727577835286
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 23 Apr 2021 09:52:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AcDEWmSo;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id g5so68086942ejx.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 23 Apr 2021 09:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ildKC4/oyXFzygjcopElxk8wy11ZrUeCP3ACVzUoUhM=;
        b=AcDEWmSo0xmhG06GqiIq1DbazzZ/2W31UeZlQZrsfMa55KIB2xiKkD3xsIXJIDrLL2
         mtVjNIPxgbTz6DVKpHLJGjNeZ7HsDHlfxfYhW4LtOxV0uqZoY72kL1BRagXmJAX+kjVS
         sYAb49kPAeiUQmu/Zv2X9O311B47JgN5bqfS9K53NWZnN1Vifrofd8tDgfLCSCgkGAtz
         +YIZSgfWhRjTWZR1S7z3WxmbbXyleNGBnV7X8xoK9GtGa6MTtf//KH2ptIiO5BW7hxml
         6//eFDZQ4aSWNPCcjJ3IvFLmCU8b+nBJw89MMjyutEOiP2qN8efCqKWdjJfOAyruuVTC
         eQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ildKC4/oyXFzygjcopElxk8wy11ZrUeCP3ACVzUoUhM=;
        b=MeMu0I3q3m0/3mNTIKw4b8v+ItiHH8bJJ5rY3WZer3inkZaZ7pQFYIY6Gv+lPbkKQV
         WKOmPmZ9b5pFjghCsTyt1iFdw9WPwDQ4JnC5IvdKyGu+XFafgUg+W9CxMPJLPUjypIzd
         +FNQ8Zc+u0oaRXIrwQayLz9iIgjA3N7tOCy1h8fmWqlq1TogeOmbjxCO6sqmAa0ZrlGl
         sD0UurmWD1WyCKfzNWLe608YyWpDyRcC6TypTS8PQiSIC/Wn3lBnpB2+hIH9nCaoIV6e
         Z+a6ihMRNy/Yjhplrpyx6dAHGy+z6tL/5iHfTP70z4geQqD/KRXEU7CzcRxjgLhZeD9a
         hjaQ==
X-Gm-Message-State: AOAM530D210fMmqfPglHjTI+JdjLfXsXX8ouJ6LS9j5hoxM3xKYBHA5J
	19OTk9Qak0Y4pneaseHy59qqfVLBqWReuE+lNcg=
X-Google-Smtp-Source: ABdhPJxG5iL9300woULxPZ0sm/86ylNk1rIw27hk8xtocS5SpASJG4N4foS9oS/XGeUxuWPo6Bk4FsMv1CW8n8lnGtk=
X-Received: by 2002:a17:906:3749:: with SMTP id e9mr5266290ejc.247.1619196725909;
 Fri, 23 Apr 2021 09:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <16784505F0C7AD01.8361@lists.yoctoproject.org> <a0a25678-7990-d5ab-2327-6a9701b2bf5e@windriver.com>
In-Reply-To: <a0a25678-7990-d5ab-2327-6a9701b2bf5e@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 23 Apr 2021 12:51:54 -0400
Message-ID: <CADkTA4PfK9SzgaRJEpMj0eNYa_dwkr3RW8rqXjoxi=gFKFTxdg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] ceph: Upgrade to 16.2.0
To: Saul Wold <Saul.Wold@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 22, 2021 at 3:34 PM Saul Wold <Saul.Wold@windriver.com> wrote:
>
> Bruce
>
> I am aware there is a 16.2.1 that was just published on the 19th, I
> wanted to get visibility to the base upgrade which I just completed
> while I work on the dot dot update.
>

Thanks Saul!

I'll do some test builds here, but will hold on the merge until you
have that next update ready. unless there's a reason to get this
version in first.

Cheers,

Bruce

> Ceph-17 is the next major release, but has not be released yet.
>
> Thanks
>
> Sau!
>
>
> On 4/22/21 12:32 PM, Saul Wold wrote:
> > This updates the Ceph version to 16.2.0 which required a couple
> > changes to base code via a rebased patch which also disabled the
> > sanity check due to it not working correctly, but the actual
> > compile worked.  Also added a new patch to add soversion information
> > for the new libcephsqlite library so it would be packaged correctly
> >
> > Signed-off-by: Saul Wold <saul.wold@windriver.com>
> > ---
> >   ...h-fix-build-errors-for-cross-compile.patch | 119 ++++++++++++++----
> >   ...ite-Add-library-soversion-properties.patch |  31 +++++
> >   recipes-extended/ceph/ceph_16.2.0.bb          |  22 ++--
> >   3 files changed, 138 insertions(+), 34 deletions(-)
> >   create mode 100644 recipes-extended/ceph/ceph/0001-libcephsqlite-Add-library-soversion-properties.patch
> >
> > diff --git a/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch b/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch
> > index 7764a2b..00c7e5b 100644
> > --- a/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch
> > +++ b/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch
> > @@ -1,10 +1,15 @@
> > -From 04b53b669dbd75c9a90bf7f8ae2b47ff96176239 Mon Sep 17 00:00:00 2001
> > +From 2a3ccc8079040a7e783b8a9091618878e7cf0719 Mon Sep 17 00:00:00 2001
> >   From: Dengke Du <dengke.du@windriver.com>
> >   Date: Mon, 11 Mar 2019 09:14:09 +0800
> >   Subject: [PATCH] ceph: fix build errors for cross compile
> >
> >   1. set the cross compile sysroot to find the rocksdb library
> >   2. correct the install path for library in Distutils.cmake
> > +3. remove / disable the sanity_check(), for some reasong the
> > +   sanity check gets the wrong settings and will not link
> > +   correctly, but the actual build works correctly, this needs
> > +   more investigation later, earlier versions of the patch also
> > +   removed it but no comment on why. (sgw)
> >
> >   Upstream-Status: Inappropriate [oe specific]
> >
> > @@ -14,16 +19,17 @@ Adjust context for v14.2.3
> >
> >   Signed-off-by: He Zhe <zhe.he@windriver.com>
> >   Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> > +Signed-off-by: Saul Wold <saul.wold@windriver.com>
> >
> >   ---
> >    cmake/modules/Distutils.cmake      | 25 +++++--------------------
> >    cmake/modules/FindRocksDB.cmake    |  4 ++--
> >    src/compressor/zstd/CMakeLists.txt |  2 +-
> > - src/pybind/cephfs/setup.py         |  1 -
> > - src/pybind/rados/setup.py          |  1 -
> > - src/pybind/rbd/setup.py            |  1 -
> > - src/pybind/rgw/setup.py            |  1 -
> > - 7 files changed, 8 insertions(+), 27 deletions(-)
> > + src/pybind/cephfs/setup.py         | 18 +++++-------------
> > + src/pybind/rados/setup.py          | 11 ++---------
> > + src/pybind/rbd/setup.py            | 18 +++++-------------
> > + src/pybind/rgw/setup.py            | 18 +++++-------------
> > + 7 files changed, 25 insertions(+), 71 deletions(-)
> >
> >   diff --git a/cmake/modules/Distutils.cmake b/cmake/modules/Distutils.cmake
> >   index ff01aaf81..18656c5a5 100644
> > @@ -105,50 +111,111 @@ index b53b0d944..4955711a9 100644
> >                 -G${CMAKE_GENERATOR}
> >      BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/libzstd
> >   diff --git a/src/pybind/cephfs/setup.py b/src/pybind/cephfs/setup.py
> > -index c3d40df05..87cdeb473 100755
> > +index c3d40df05..24c26c3ed 100755
> >   --- a/src/pybind/cephfs/setup.py
> >   +++ b/src/pybind/cephfs/setup.py
> > -@@ -137,7 +137,6 @@ def check_sanity():
> > +@@ -137,19 +137,11 @@ def check_sanity():
> >        finally:
> >            shutil.rmtree(tmp_dir)
> >
> >   -
> > - if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
> > -     ext_args = {}
> > -     cython_constants = dict(BUILD_DOC=True)
> > +-if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
> > +-    ext_args = {}
> > +-    cython_constants = dict(BUILD_DOC=True)
> > +-    cythonize_args = dict(compile_time_env=cython_constants)
> > +-elif check_sanity():
> > +-    ext_args = get_python_flags(['cephfs'])
> > +-    cython_constants = dict(BUILD_DOC=False)
> > +-    include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
> > +-    cythonize_args = dict(compile_time_env=cython_constants,
> > +-                          include_path=include_path)
> > +-else:
> > +-    sys.exit(1)
> > ++ext_args = get_python_flags(['cephfs'])
> > ++cython_constants = dict(BUILD_DOC=False)
> > ++include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
> > ++cythonize_args = dict(compile_time_env=cython_constants,
> > ++                      include_path=include_path)
> > +
> > + cmdclass = {}
> > + try:
> >   diff --git a/src/pybind/rados/setup.py b/src/pybind/rados/setup.py
> > -index 0d1047825..feafb605d 100755
> > +index 0d1047825..cff85a063 100755
> >   --- a/src/pybind/rados/setup.py
> >   +++ b/src/pybind/rados/setup.py
> > -@@ -131,7 +131,6 @@ def check_sanity():
> > +@@ -131,15 +131,8 @@ def check_sanity():
> >        finally:
> >            shutil.rmtree(tmp_dir)
> >
> >   -
> > - if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
> > -     ext_args = {}
> > -     cython_constants = dict(BUILD_DOC=True)
> > +-if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
> > +-    ext_args = {}
> > +-    cython_constants = dict(BUILD_DOC=True)
> > +-elif check_sanity():
> > +-    ext_args = get_python_flags(['rados'])
> > +-    cython_constants = dict(BUILD_DOC=False)
> > +-else:
> > +-    sys.exit(1)
> > ++ext_args = get_python_flags(['rados'])
> > ++cython_constants = dict(BUILD_DOC=False)
> > +
> > + cmdclass = {}
> > + try:
> >   diff --git a/src/pybind/rbd/setup.py b/src/pybind/rbd/setup.py
> > -index 73ea4555f..b9c6a78d2 100755
> > +index 73ea4555f..e7f57ddb5 100755
> >   --- a/src/pybind/rbd/setup.py
> >   +++ b/src/pybind/rbd/setup.py
> > -@@ -135,7 +135,6 @@ def check_sanity():
> > +@@ -135,19 +135,11 @@ def check_sanity():
> >        finally:
> >            shutil.rmtree(tmp_dir)
> >
> >   -
> > - if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
> > -     ext_args = {}
> > -     cython_constants = dict(BUILD_DOC=True)
> > +-if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
> > +-    ext_args = {}
> > +-    cython_constants = dict(BUILD_DOC=True)
> > +-    cythonize_args = dict(compile_time_env=cython_constants)
> > +-elif check_sanity():
> > +-    ext_args = get_python_flags(['rados', 'rbd'])
> > +-    cython_constants = dict(BUILD_DOC=False)
> > +-    include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
> > +-    cythonize_args = dict(compile_time_env=cython_constants,
> > +-                          include_path=include_path)
> > +-else:
> > +-    sys.exit(1)
> > ++ext_args = get_python_flags(['rados', 'rbd'])
> > ++cython_constants = dict(BUILD_DOC=False)
> > ++include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
> > ++cythonize_args = dict(compile_time_env=cython_constants,
> > ++                      include_path=include_path)
> > +
> > + cmdclass = {}
> > + try:
> >   diff --git a/src/pybind/rgw/setup.py b/src/pybind/rgw/setup.py
> > -index 663604e8f..695038c0e 100755
> > +index 663604e8f..489c9ba1f 100755
> >   --- a/src/pybind/rgw/setup.py
> >   +++ b/src/pybind/rgw/setup.py
> > -@@ -135,7 +135,6 @@ def check_sanity():
> > +@@ -135,19 +135,11 @@ def check_sanity():
> >        finally:
> >            shutil.rmtree(tmp_dir)
> >
> >   -
> > - if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
> > -     ext_args = {}
> > -     cython_constants = dict(BUILD_DOC=True)
> > +-if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
> > +-    ext_args = {}
> > +-    cython_constants = dict(BUILD_DOC=True)
> > +-    cythonize_args = dict(compile_time_env=cython_constants)
> > +-elif check_sanity():
> > +-    ext_args = get_python_flags(['rados', 'rgw'])
> > +-    cython_constants = dict(BUILD_DOC=False)
> > +-    include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
> > +-    cythonize_args = dict(compile_time_env=cython_constants,
> > +-                          include_path=include_path)
> > +-else:
> > +-    sys.exit(1)
> > ++ext_args = get_python_flags(['rados', 'rgw'])
> > ++cython_constants = dict(BUILD_DOC=False)
> > ++include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
> > ++cythonize_args = dict(compile_time_env=cython_constants,
> > ++                      include_path=include_path)
> > +
> > + cmdclass = {}
> > + try:
> > diff --git a/recipes-extended/ceph/ceph/0001-libcephsqlite-Add-library-soversion-properties.patch b/recipes-extended/ceph/ceph/0001-libcephsqlite-Add-library-soversion-properties.patch
> > new file mode 100644
> > index 0000000..2c9cd11
> > --- /dev/null
> > +++ b/recipes-extended/ceph/ceph/0001-libcephsqlite-Add-library-soversion-properties.patch
> > @@ -0,0 +1,31 @@
> > +From ce36ce7d1c0f954d1532a759f4d7b09d87287dac Mon Sep 17 00:00:00 2001
> > +From: Saul Wold <saul.wold@windriver.com>
> > +Date: Thu, 22 Apr 2021 08:05:57 -0700
> > +Subject: [PATCH] libcephsqlite: Add library soversion properties
> > +
> > +This additional properties are needed to ensure the library
> > +is installed with an soversion so that when the library is
> > +packaged it gets packaged corectly in the ceph package and
> > +ceph-dev package as the link.
> > +
> > +Upstream-Status: pending
> > +Signed-off-by: Saul Wold <saul.wold@windriver.com>
> > +---
> > + src/CMakeLists.txt | 4 ++++
> > + 1 file changed, 4 insertions(+)
> > +
> > +diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
> > +index 37db48f86..8dc7bdb56 100644
> > +--- a/src/CMakeLists.txt
> > ++++ b/src/CMakeLists.txt
> > +@@ -804,6 +804,10 @@ if(WITH_LIBCEPHSQLITE)
> > +   set(cephsqlite_srcs libcephsqlite.cc SimpleRADOSStriper.cc)
> > +   add_library(cephsqlite ${CEPH_SHARED} ${cephsqlite_srcs})
> > +   target_link_libraries(cephsqlite PRIVATE cls_lock_client librados ceph-common SQLite3::SQLite3 ${EXTRALIBS})
> > ++  set_target_properties(cephsqlite PROPERTIES
> > ++    OUTPUT_NAME cephsqlite
> > ++    VERSION 1.0.0
> > ++    SOVERSION 1)
> > +   install(TARGETS cephsqlite DESTINATION ${CMAKE_INSTALL_LIBDIR})
> > + endif(WITH_LIBCEPHSQLITE)
> > +
> > diff --git a/recipes-extended/ceph/ceph_16.2.0.bb b/recipes-extended/ceph/ceph_16.2.0.bb
> > index 806a03f..d55e602 100644
> > --- a/recipes-extended/ceph/ceph_16.2.0.bb
> > +++ b/recipes-extended/ceph/ceph_16.2.0.bb
> > @@ -58,7 +58,9 @@ LIC_FILES_CHKSUM = "file://COPYING-LGPL2.1;md5=fbc093901857fcd118f065f900982c24
> >                       file://COPYING-GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> >                       file://COPYING;md5=d140fb1fedb53047f0d0830883e7af9f \
> >                       "
> > -inherit cmake python3native python3-dir systemd
> > +#inherit cmake setuptools3 systemd
> > +inherit cmake distutils3-base systemd
> > +
> >   # Disable python pybind support for ceph temporary, when corss compiling pybind,
> >   # pybind mix cmake and python setup environment, would case a lot of errors.
> >
> > @@ -66,14 +68,9 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
> >              file://0001-ceph-fix-build-errors-for-cross-compile.patch \
> >              file://0001-fix-host-library-paths-were-used.patch \
> >              file://ceph.conf \
> > +           file://0001-libcephsqlite-Add-library-soversion-properties.patch \
> >              "
> >
> > -#SRC_URI[md5sum] = "5a949b91199efe130bfe2e57f200eacd"
> > -#SRC_URI[sha256sum] = "ea7fa2be68b3570c5c3aa02774dca27de20b6f20a8498f65e5c4ef375a209ace"
> > -#SRC_URI[sha1sum] = "0503649d7c7d9268cb61b03bbe839106988f87d7"
> > -#SRC_URI[sha384sum] = "57208c126ea8e640c3979073fd64ce58606f17b4b7ed2e005b0792bdfd51b13391af325658d0f68f961f94175d93e891"
> > -#SRC_URI[sha512sum] = "1f55b0a13bf06df782831d0c9d5f8617c22442ab97fb186e6ccb08183e02bf1756caf8633fa6b1cf156c3fb7b1bdff90a60a1249adfad0b9450036e2329bf8ff"
> > -SRC_URI[sha256sum] = "dfeee542536607220dc2ca49f47c41127c8562dea234a886625e0f7ee1524904"
> >   SRC_URI[sha1sum] = "f8cc85e4cc519d7e469a0c3c8327bd1675f0b287"
> >   SRC_URI[sha384sum] = "29a75a733e5ae8039a5ad603558a9707e36b8c337419039ee97351cdbad57875fa57a365fcde29124cee72734608e245"
> >   SRC_URI[sha512sum] = "aeb9a91c33221c64ea24603dc88cab346bf0abdf0d41ff85c2e1cf134130737ec1fab1246be0a2fa3af8a655ae1dabb69688855f229f54438e60cb8098175b8e"
> > @@ -149,6 +146,13 @@ do_install_append () {
> >       mv ${D}${libexecdir}/ceph/ceph_common.sh ${D}${libdir}/ceph
> >       # WITH_FUSE is set to OFF, remove ceph-fuse related units
> >       rm ${D}${systemd_unitdir}/system/ceph-fuse.target ${D}${systemd_unitdir}/system/ceph-fuse@.service
> > +
> > +     for i in ${D}${bindir}/* ${D}${sbindir}/*; do
> > +             if [ -f "$i" ]; then
> > +                     sed -i -e s:${PYTHON}:${USRBINPATH}/env\ ${DISTUTILS_PYTHON}:g $i
> > +                     sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
> > +             fi
> > +     done
> >   }
> >
> >   do_install_append_class-target () {
> > @@ -173,7 +177,8 @@ FILES_${PN} += "\
> >               ${libdir}/rados-classes/*.so.* \
> >               ${libdir}/ceph/compressor/*.so \
> >               ${libdir}/rados-classes/*.so \
> > -             ${libdir}/ceph/*.so \
> > +             ${libdir}/ceph/*.so \
> > +                ${libdir}/libcephsqlite.so \
> >   "
> >
> >   FILES_${PN} += " \
> > @@ -190,6 +195,7 @@ RDEPENDS_${PN} += "\
> >               python3-modules \
> >               python3-prettytable \
> >               ${PN}-python \
> > +                gawk \
> >   "
> >   COMPATIBLE_HOST = "(x86_64).*"
> >   PACKAGES += " \
> >
> >
> >
> >
> >
>
> --
> Sau!
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
