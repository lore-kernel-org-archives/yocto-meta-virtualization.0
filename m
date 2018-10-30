Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2D449E00950; Tue, 30 Oct 2018 10:42:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.167.65 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C08FBE008D7
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Oct 2018 10:42:29 -0700 (PDT)
Received: by mail-lf1-f65.google.com with SMTP id i26so5240293lfc.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Oct 2018 10:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=R//pOR8FeKd2WGBLPQW9LUCT//ttUeaDACpmb0yqfj8=;
	b=ZM5jgJ3Q3yHQ2vQjoj4H4EX+4OFahkm+IoKpwODlReOTZvXM5cqaRUdMI1YyG6Q8/c
	knrXDZz4HD4zbhaB4g7RY4Z9a+FAIJS6UXyElFTj7IreK7mlvgCcQRLFRbrrKjwkFvbL
	vf1BHsOJYenpLMn49tV/9WEAWx03bOlV1zOxJ2LRrvrkLearvOJFfyxwKcxKj74N1PSi
	f98iZ4fQWLFhK0qAGKu07JE7ockn5OwF06NkF3OZWkn2d9WlIEzcszOibrzwsRp1kuAt
	zsNAqJAott4ImBa6y+ufHV45FEg73ZrfSnjXD+8aypRG2OhoEYZq6i9yj6g9hFTg+U94
	YHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=R//pOR8FeKd2WGBLPQW9LUCT//ttUeaDACpmb0yqfj8=;
	b=nVz0Yol8tRHxlWWD1P5E0WKdYZoXnGbkOg6LFD0XISbg7Juk20W40yju7QPkhzEDMb
	BeTpAdQtabk4hJFCTGy+iwSFmss4gUcAKcmYzW+f8B+Dhkt7efc7bzx7T8Ssqni3otHC
	GJajgHrB33cuPvEAk4EWoyXIlBbGLQavIq5BeHa10Nr43xLDGXpwUNAW+ICzQlTeDy0l
	pDtqXPt+2XEXCr8CHc5igeoGO63j24XYkErWdTf54ox+38piAQxF1CQaB5vF4jfnTtCF
	fUkKUxdERqKiWXZpocyYEZUN+oIWvTwaCVqA01ldEllhavAavijbpzuZ4Lt9ehF0c/6l
	TogA==
X-Gm-Message-State: AGRZ1gL/2UWZGJk3mtlo1M0RyrQbYPXQlZ4Wg/+N36h0eOUPO4a2Os3l
	iJwd8MXB1Z9EUKmWeY071FLadnHhMr0QtG31iaA=
X-Google-Smtp-Source: AJdET5f2aYtZ9TVHpIUuzcBF5yjUyaxnN+VhyMdokAZYiy1YAdgabdyQs5n8LsKHZUyjzXSG8rRiugECUwJEjQXQShU=
X-Received: by 2002:a19:c203:: with SMTP id l3mr2421325lfc.113.1540921348465; 
	Tue, 30 Oct 2018 10:42:28 -0700 (PDT)
MIME-Version: 1.0
References: <1540547139-12493-1-git-send-email-dengke.du@windriver.com>
In-Reply-To: <1540547139-12493-1-git-send-email-dengke.du@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 30 Oct 2018 13:42:16 -0400
Message-ID: <CADkTA4NZOKSVu3FnOf-ThrRTO548-X67+ndZBZDpD+D=F98Q4Q@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH V2] ceph: fix Distutils.cmake installation for cross compile
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
X-List-Received-Date: Tue, 30 Oct 2018 17:42:31 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Fri, Oct 26, 2018 at 5:45 AM Dengke Du <dengke.du@windriver.com> wrote:
>
> 1. Remove the detection for build host and correct the install destination
>    for cross compile.
> 2. Delete the build host information in the results files.
>
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>  ...tect-init-correct-the-installation-for-OE.patch | 36 ++++++++++++++++++++++
>  recipes-extended/ceph/ceph_13.2.2.bb               | 30 +++++++++++++-----
>  2 files changed, 58 insertions(+), 8 deletions(-)
>  create mode 100644 recipes-extended/ceph/ceph/0001-ceph-detect-init-correct-the-installation-for-OE.patch
>
> diff --git a/recipes-extended/ceph/ceph/0001-ceph-detect-init-correct-the-installation-for-OE.patch b/recipes-extended/ceph/ceph/0001-ceph-detect-init-correct-the-installation-for-OE.patch
> new file mode 100644
> index 0000000..875501b
> --- /dev/null
> +++ b/recipes-extended/ceph/ceph/0001-ceph-detect-init-correct-the-installation-for-OE.patch
> @@ -0,0 +1,36 @@
> +From 6aaf04036f0affbeddda123bff111990c4d5fd72 Mon Sep 17 00:00:00 2001
> +From: Dengke Du <dengke.du@windriver.com>
> +Date: Fri, 26 Oct 2018 14:31:10 +0800
> +Subject: [PATCH] ceph-detect-init: correct the installation for OE
> +
> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
> +Upstream-Status: Inappropriate [oe specific]
> +---
> + cmake/modules/Distutils.cmake | 11 ++---------
> + 1 file changed, 2 insertions(+), 9 deletions(-)
> +
> +diff --git a/cmake/modules/Distutils.cmake b/cmake/modules/Distutils.cmake
> +index 3091d97..c50fe77 100644
> +--- a/cmake/modules/Distutils.cmake
> ++++ b/cmake/modules/Distutils.cmake
> +@@ -16,15 +16,8 @@ function(distutils_install_module name)
> +   cmake_parse_arguments(DU "" INSTALL_SCRIPT "" ${ARGN})
> +   install(CODE "
> +     set(options --prefix=${CMAKE_INSTALL_PREFIX})
> +-    if(DEFINED ENV{DESTDIR})
> +-      if(EXISTS /etc/debian_version)
> +-        list(APPEND options --install-layout=deb)
> +-      endif()
> +-      list(APPEND options --root=\$ENV{DESTDIR})
> +-      if(NOT \"${DU_INSTALL_SCRIPT}\" STREQUAL \"\")
> +-        list(APPEND options --install-script=${DU_INSTALL_SCRIPT})
> +-      endif()
> +-    endif()
> ++    list(APPEND options --root=${CMAKE_DESTDIR})
> ++    list(APPEND options --install-lib=${PYTHON_SITEPACKAGES_DIR})
> +     execute_process(
> +     COMMAND ${PYTHON${PYTHON_VERSION}_EXECUTABLE}
> +         setup.py install \${options}
> +--
> +2.7.4
> +
> diff --git a/recipes-extended/ceph/ceph_13.2.2.bb b/recipes-extended/ceph/ceph_13.2.2.bb
> index 6c6da41..3d9faae 100644
> --- a/recipes-extended/ceph/ceph_13.2.2.bb
> +++ b/recipes-extended/ceph/ceph_13.2.2.bb
> @@ -12,6 +12,7 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
>             file://0001-Correct-the-path-to-find-version.h-in-rocksdb.patch \
>             file://0001-zstd-fix-error-for-cross-compile.patch \
>             file://0001-ceph-add-pybind-support-in-OE.patch \
> +           file://0001-ceph-detect-init-correct-the-installation-for-OE.patch \
>             file://ceph.conf \
>  "
>  SRC_URI[md5sum] = "ce118be451dcb6b89e9e0a45057827dd"
> @@ -24,12 +25,25 @@ DEPENDS = "boost bzip2 curl expat gperf-native \
>             python python-cython-native rocksdb snappy udev \
>             valgrind xfsprogs zlib \
>  "
> -SYSTEMD_SERVICE_${PN} = "ceph-radosgw@.service \
> +SYSTEMD_SERVICE_${PN} = " \
> +       ceph-radosgw@.service \
> +       ceph-radosgw.target \
>          ceph-mon@.service \
> +       ceph-mon.target \
>          ceph-mds@.service \
> +       ceph-mds.target \
>          ceph-disk@.service \
>          ceph-osd@.service \
> +       ceph-osd.target \
>          ceph.target \
> +       ceph-fuse@.service \
> +       ceph-fuse.target \
> +       ceph-rbd-mirror@.service \
> +       ceph-rbd-mirror.target \
> +       ceph-volume@.service \
> +       ceph-mgr@.service \
> +       ceph-mgr.target \
> +       rbdmap.service \
>  "
>  OECMAKE_GENERATOR = "Unix Makefiles"
>
> @@ -54,15 +68,15 @@ do_configure_prepend () {
>
>  do_install_append () {
>         sed -i -e 's:${WORKDIR}.*python2:${bindir}/python:' ${D}${bindir}/ceph
> +       sed -i -e 's:${WORKDIR}.*python2:${bindir}/python:' ${D}${bindir}/ceph-disk
> +       sed -i -e 's:${WORKDIR}.*python2:${bindir}/python:' ${D}${bindir}/ceph-detect-init
> +       find ${D} -name SOURCES.txt | xargs sed -i -e 's:${WORKDIR}::'
>         install -d ${D}${sysconfdir}/ceph
>         install -m 644 ${WORKDIR}/ceph.conf ${D}${sysconfdir}/ceph/
> -       install -d ${D}${systemd_unitdir}/system
> -       mv ${D}${libexecdir}/systemd/system/ceph-radosgw@.service ${D}${systemd_unitdir}/system/ceph-radosgw@.service
> -       mv ${D}${libexecdir}/systemd/system/ceph-mon@.service ${D}${systemd_unitdir}/system/ceph-mon@.service
> -       mv ${D}${libexecdir}/systemd/system/ceph-mds@.service ${D}${systemd_unitdir}/system/ceph-mds@.service
> -       mv ${D}${libexecdir}/systemd/system/ceph-disk@.service ${D}${systemd_unitdir}/system/ceph-disk@.service
> -       mv ${D}${libexecdir}/systemd/system/ceph-osd@.service ${D}${systemd_unitdir}/system/ceph-osd@.service
> -       mv ${D}${libexecdir}/systemd/system/ceph.target ${D}${systemd_unitdir}/system/ceph.target
> +       install -d ${D}${systemd_unitdir}
> +       mv ${D}${libexecdir}/systemd/system ${D}${systemd_unitdir}
> +       mv ${D}${libexecdir}/ceph/ceph-osd-prestart.sh ${D}${libdir}/ceph
> +       mv ${D}${libexecdir}/ceph/ceph_common.sh ${D}${libdir}/ceph
>  }
>
>  FILES_${PN} += "\
> --
> 2.7.4
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

