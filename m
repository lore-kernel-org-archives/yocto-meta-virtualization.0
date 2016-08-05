Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 64F45E00DB1; Thu,  4 Aug 2016 18:38:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.220.194 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 061E4E00DA9;
	Thu,  4 Aug 2016 18:38:51 -0700 (PDT)
Received: by mail-qk0-f194.google.com with SMTP id x185so6774551qkc.3;
	Thu, 04 Aug 2016 18:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bViffmpQSvMFmeAV6/H5ZVoD+vyKMTQVFuJHx83Rw04=;
	b=GFZ2lkRI7zCaST9G6NBqdUXs7kOvEbt0K4qVPwSSPzMh7VerByQFc+yL8A+MGkZSRM
	byvrtDfus+rMVuyVILMs7W/G/CQ6n9nWKiQWT5BVPBsKIHkxz/P+/wgnhKOyWFlDzhqm
	6IxotooV2R+G7EmBHAalqmG6Nj3O6Yw2GxowCNIU9qgEBZc0rvKvEjFpGZrV1vv9oFtZ
	UAk1OCRuB8zG8U0MH4PfsI6+pGCpcX709vKBaCkG0OELqq5fIBsuzPbPAI8bnxsHtN8B
	5st5hfuWJaP6Hn0VrhgJWkl+hnJW0UiI1ZQcc/ziyBe/0VTiMgKJA6qVGbwuJDx59XLy
	xlQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bViffmpQSvMFmeAV6/H5ZVoD+vyKMTQVFuJHx83Rw04=;
	b=Epyn42LR7TZjxVjpaKSqLlZcv00RgqbnotuB2SSJCP39fNVy5CM4RA0K/m7BPoWVdL
	rzbMO+Pf2KNp3Me1l1qrkunQsZUXFU7Tr7CcgNuQVe5awtLcGk7il6JICErAXAq9bCq6
	MuJM3zl6w0clzNQTM877+f5AKfP9/RHBvggVD0472U71Gi5CBWyFJtRS3YB1qtML+UKe
	jhSTTpa0v2eh0OSlZ7ZaKn3pRlueicbVVQdzefKPT84jPswHS9pWVvCO1Hf4chGPrcre
	lJgQEvLmWeNGUw4e708N5Csg0ybS+u9zMioCqGAAhzvGj/0Vz5xCTMhktLdrijcxzWH6
	XbYw==
X-Gm-Message-State: AEkooutIYpVRnGs99gqIT3f0zig0MUBy4UKGDh2m1xdkz4TQHQxVKqSz/lJT/Pkx34zrZKVJiTj+72r0cPnpqw==
X-Received: by 10.55.184.2 with SMTP id i2mr9560034qkf.261.1470361130889; Thu,
	04 Aug 2016 18:38:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.50.137 with HTTP; Thu, 4 Aug 2016 18:38:50 -0700 (PDT)
In-Reply-To: <20160804093802.10139-2-kai.kang@windriver.com>
References: <20160804093802.10139-1-kai.kang@windriver.com>
	<20160804093802.10139-2-kai.kang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 4 Aug 2016 21:38:50 -0400
Message-ID: <CADkTA4P2orJuSEMPrPwHR-ZOompwZh7nEmC0NZmpqgvMGF+7Mg@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: Yocto Project Discussion <yocto@yoctoproject.org>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [yocto] [PATCH] libvirt: upgrade 1.3.2 -> 1.3.5
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
X-List-Received-Date: Fri, 05 Aug 2016 01:38:55 -0000
Content-Type: multipart/alternative; boundary=94eb2c09c172e5f93305394920d1

--94eb2c09c172e5f93305394920d1
Content-Type: text/plain; charset=UTF-8

Wrong mailing list (it should be meta-virtualization@yoctoproject.org), but
I can
pick up this change from here

No need to resend.

Bruce

On Thu, Aug 4, 2016 at 5:38 AM, <kai.kang@windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> Upgrade libvirt  from 1.3.2 to 1.3.5.
>
> * update checksums and remove PR
> * remove trailing whitespace
> * remove backport patch 0001-fix-crash-in-getAllDomainStats.patch
> * update context of patches
> * remove libvirtd.socket from SYSTEMD_SERVICE which doesn't exist anymore
> * install test data which ptest requires
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../0001-to-fix-build-error.patch                  |  0
>  recipes-extended/libvirt/libvirt-python.inc        |  5 +-
>  .../0001-fix-crash-in-getAllDomainStats.patch      | 57
> ----------------------
>  ...vert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch | 16 ++++--
>  .../libvirt/libvirt/install-missing-file.patch     | 12 ++++-
>  recipes-extended/libvirt/libvirt/runptest.patch    | 34 +++++++------
>  .../libvirt/{libvirt_1.3.2.bb => libvirt_1.3.5.bb} | 10 ++--
>  7 files changed, 47 insertions(+), 87 deletions(-)
>  rename recipes-extended/libvirt/{libvirt-1.3.2 =>
> libvirt-1.3.5}/0001-to-fix-build-error.patch (100%)
>  delete mode 100644
> recipes-extended/libvirt/libvirt/0001-fix-crash-in-getAllDomainStats.patch
>  rename recipes-extended/libvirt/{libvirt_1.3.2.bb => libvirt_1.3.5.bb}
> (97%)
>
> diff --git
> a/recipes-extended/libvirt/libvirt-1.3.2/0001-to-fix-build-error.patch
> b/recipes-extended/libvirt/libvirt-1.3.5/0001-to-fix-build-error.patch
> similarity index 100%
> rename from
> recipes-extended/libvirt/libvirt-1.3.2/0001-to-fix-build-error.patch
> rename to
> recipes-extended/libvirt/libvirt-1.3.5/0001-to-fix-build-error.patch
> diff --git a/recipes-extended/libvirt/libvirt-python.inc
> b/recipes-extended/libvirt/libvirt-python.inc
> index 405d5f7..7fcce43 100644
> --- a/recipes-extended/libvirt/libvirt-python.inc
> +++ b/recipes-extended/libvirt/libvirt-python.inc
> @@ -17,10 +17,9 @@ FILES_${PN}-python = "${bindir}/* ${libdir}/*
> ${libdir}/${PYTHON_DIR}/*"
>
>  SRC_URI += "
> http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python
> "
>  SRC_URI +=
> "file://libvirt_api_xml_path.patch;patchdir=../libvirt-python-${PV}"
> -SRC_URI +=
> "file://0001-fix-crash-in-getAllDomainStats.patch;patchdir=../libvirt-python-${PV}"
>
> -SRC_URI[libvirt_python.md5sum] = "ed018c714d7ddbe93221c796dff283ed"
> -SRC_URI[libvirt_python.sha256sum] =
> "6d35ae9e7801573393b9c92471f39e6700d479f10b641df81d041b469f160bf8"
> +SRC_URI[libvirt_python.md5sum] = "4dbd7ef9ee9c4dea5887b5b31eb04529"
> +SRC_URI[libvirt_python.sha256sum] =
> "a0508a57637fd18a3584fb9d2322fb172f65708c9db16e0438a70eb0f36fa5c2"
>
>  export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
>  export LIBVIRT_CFLAGS = "-I${S}/include"
> diff --git
> a/recipes-extended/libvirt/libvirt/0001-fix-crash-in-getAllDomainStats.patch
> b/recipes-extended/libvirt/libvirt/0001-fix-crash-in-getAllDomainStats.patch
> deleted file mode 100644
> index 0583a94..0000000
> ---
> a/recipes-extended/libvirt/libvirt/0001-fix-crash-in-getAllDomainStats.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -From e9c4e2abffef007a28112ebb40a9586b0128f10b Mon Sep 17 00:00:00 2001
> -From: Pavel Hrdina <phrdina@redhat.com>
> -Date: Mon, 18 Apr 2016 16:53:50 +0200
> -Subject: [PATCH] fix crash in getAllDomainStats
> -
> -Upstream-Status: Backport
> -
> -Commits 1d39dbaf and 827ed9b4 broke the libvirt-python API by removing
> -virDomainRef() and virDomainFree().  virDomainStatsRecordListFree() will
> -free that domain pointer and later when virDomain (python object) call
> -its destructor and tries to free that same pointer again.
> -
> -Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1326839
> -
> -Signed-off-by: Pavel Hrdina <phrdina@redhat.com>
> ----
> - libvirt-override.c | 8 +++++++-
> - 1 file changed, 7 insertions(+), 1 deletion(-)
> -
> -diff --git a/libvirt-override.c b/libvirt-override.c
> -index 4640ed5..2de95ce 100644
> ---- a/libvirt-override.c
> -+++ b/libvirt-override.c
> -@@ -8381,6 +8381,7 @@ convertDomainStatsRecord(virDomainStatsRecordPtr
> *records,
> -     PyObject *py_retval;
> -     PyObject *py_record;
> -     PyObject *py_record_stats = NULL;
> -+    virDomainPtr dom = NULL;
> -     size_t i;
> -
> -     if (!(py_retval = PyList_New(nrecords)))
> -@@ -8392,9 +8393,12 @@ convertDomainStatsRecord(virDomainStatsRecordPtr
> *records,
> -
> -         VIR_PY_LIST_SET_GOTO(py_retval, i, py_record, error);
> -
> -+        dom = records[i]->dom;
> -+        virDomainRef(dom);
> -         VIR_PY_TUPLE_SET_GOTO(py_record, 0,
> --                              libvirt_virDomainPtrWrap(records[i]->dom),
> -+                              libvirt_virDomainPtrWrap(dom),
> -                               error);
> -+        dom = NULL;
> -
> -         if (!(py_record_stats =
> getPyVirTypedParameter(records[i]->params,
> -
> records[i]->nparams)))
> -@@ -8406,6 +8410,8 @@ convertDomainStatsRecord(virDomainStatsRecordPtr
> *records,
> -     return py_retval;
> -
> -  error:
> -+    if (dom)
> -+        virDomainFree(dom);
> -     Py_XDECREF(py_retval);
> -     return NULL;
> - }
> ---
> -2.8.1
> -
> diff --git
> a/recipes-extended/libvirt/libvirt/Revert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch
> b/recipes-extended/libvirt/libvirt/Revert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch
> index 16c3a16..02ddf68 100644
> ---
> a/recipes-extended/libvirt/libvirt/Revert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch
> +++
> b/recipes-extended/libvirt/libvirt/Revert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch
> @@ -1,3 +1,9 @@
> +Upstream-Status: Inappropriate [configuration]
> +
> +Update context for version 1.3.5.
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +---
>  From dd915e7f70e676aea93f750c75d16ce646e71e4b Mon Sep 17 00:00:00 2001
>  From: Mark Asselstine <mark.asselstine@windriver.com>
>  Date: Wed, 9 Sep 2015 11:52:44 -0400
> @@ -24,20 +30,20 @@ diff --git a/daemon/Makefile.am b/daemon/Makefile.am
>  index 2dbe81b..41ea2db 100644
>  --- a/daemon/Makefile.am
>  +++ b/daemon/Makefile.am
> -@@ -445,7 +445,7 @@ endif ! LIBVIRT_INIT_SCRIPT_UPSTART
> +@@ -449,7 +449,7 @@ endif ! LIBVIRT_INIT_SCRIPT_UPSTART
>
>   if LIBVIRT_INIT_SCRIPT_SYSTEMD
>
>  -SYSTEMD_UNIT_DIR = $(prefix)/lib/systemd/system
>  +SYSTEMD_UNIT_DIR = /lib/systemd/system
> - BUILT_SOURCES += libvirtd.service libvirtd.socket
> + BUILT_SOURCES += libvirtd.service
>
> - install-init-systemd: install-sysconfig libvirtd.service libvirtd.socket
> + install-init-systemd: install-sysconfig libvirtd.service
>  diff --git a/src/Makefile.am b/src/Makefile.am
>  index a316b4d..d271291 100644
>  --- a/src/Makefile.am
>  +++ b/src/Makefile.am
> -@@ -2594,7 +2594,7 @@ EXTRA_DIST += \
> +@@ -2633,7 +2633,7 @@ EXTRA_DIST += \
>   if WITH_LIBVIRTD
>   if LIBVIRT_INIT_SCRIPT_SYSTEMD
>
> @@ -50,7 +56,7 @@ diff --git a/tools/Makefile.am b/tools/Makefile.am
>  index b3227a7..0e58f73 100644
>  --- a/tools/Makefile.am
>  +++ b/tools/Makefile.am
> -@@ -356,7 +356,7 @@ libvirt-guests.init: libvirt-guests.init.in
> libvirt-guests.sh
> +@@ -380,7 +380,7 @@ libvirt-guests.init: libvirt-guests.init.in
> libvirt-guests.sh
>
>
>   EXTRA_DIST += libvirt-guests.service.in
> diff --git a/recipes-extended/libvirt/libvirt/install-missing-file.patch
> b/recipes-extended/libvirt/libvirt/install-missing-file.patch
> index f6f6e25..ecd4a87 100644
> --- a/recipes-extended/libvirt/libvirt/install-missing-file.patch
> +++ b/recipes-extended/libvirt/libvirt/install-missing-file.patch
> @@ -1,3 +1,11 @@
> +Upstream-Status: Inapproriate
> +
> +This patch is for ptest, so it is inapproriate to send to upstream.
> +
> +Update context for 1.3.5.
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +---
>  From 0780181a3285511f166487a54ebc231fc657edfe Mon Sep 17 00:00:00 2001
>  From: Catalin Enache <catalin.enache@windriver.com>
>  Date: Mon, 25 Jul 2016 16:38:51 +0300
> @@ -14,10 +22,10 @@ diff --git a/tests/Makefile.am b/tests/Makefile.am
>  index 02e0dd8..187fbca 100644
>  --- a/tests/Makefile.am
>  +++ b/tests/Makefile.am
> -@@ -155,6 +155,7 @@ EXTRA_DIST =               \
> +@@ -170,6 +170,7 @@ EXTRA_DIST =               \
>         xml2vmxdata
>
> - test_helpers = commandhelper ssh test_conf
> + test_helpers = commandhelper ssh virconftest
>  +test_misc =
>   test_programs = virshtest sockettest \
>         nodeinfotest virbuftest \
> diff --git a/recipes-extended/libvirt/libvirt/runptest.patch
> b/recipes-extended/libvirt/libvirt/runptest.patch
> index a33f569..b7609a8 100644
> --- a/recipes-extended/libvirt/libvirt/runptest.patch
> +++ b/recipes-extended/libvirt/libvirt/runptest.patch
> @@ -1,14 +1,18 @@
> +Update context for 1.3.5.
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +---
>  Add 'install-ptest' rule.
>  Change TESTS_ENVIRONMENT to allow running outside build dir.
>
>  Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
>  Upstream-status: Pending
> -
> -Index: libvirt-1.2.4/tests/Makefile.am
> -===================================================================
> ---- libvirt-1.2.4.orig/tests/Makefile.am
> -+++ libvirt-1.2.4/tests/Makefile.am
> -@@ -31,9 +31,11 @@
> +---
> +diff --git a/tests/Makefile.am b/tests/Makefile.am
> +index 0c4ad3c..bb4e31a 100644
> +--- a/tests/Makefile.am
> ++++ b/tests/Makefile.am
> +@@ -33,11 +33,13 @@ INCLUDES = \
>         -I$(top_srcdir)/src/conf \
>         $(GETTEXT_CPPFLAGS)
>
> @@ -16,13 +20,17 @@ Index: libvirt-1.2.4/tests/Makefile.am
>  +
>   AM_CFLAGS = \
>  -      -Dabs_builddir="\"$(abs_builddir)\"" \
> +-      -Dabs_topbuilddir="\"$(abs_topbuilddir)\"" \
>  -      -Dabs_srcdir="\"$(abs_srcdir)\"" \
> +-      -Dabs_topsrcdir="\"$(abs_topsrcdir)\"" \
>  +      -Dabs_builddir="\"$(PTEST_DIR)/tests\"" \
> ++      -Dabs_topbuilddir="\"$(PTEST_DIR)\"" \
>  +      -Dabs_srcdir="\"$(PTEST_DIR)/tests\"" \
> ++      -Dabs_topsrcdir="\"$(PTEST_DIR)\"" \
>         $(LIBXML_CFLAGS) \
> -       $(LIBNL_CFLAGS) \
> +       $(LIBNL_CFLAGS) \
>         $(GNUTLS_CFLAGS) \
> -@@ -48,7 +50,7 @@
> +@@ -62,7 +64,7 @@ QEMULIB_LDFLAGS = \
>
>   if WITH_DRIVER_MODULES
>   INCLUDES += \
> @@ -31,15 +39,12 @@ Index: libvirt-1.2.4/tests/Makefile.am
>   endif WITH_DRIVER_MODULES
>
>   PROBES_O =
> -@@ -409,20 +411,19 @@
> +@@ -483,17 +485,15 @@ TESTS = $(test_programs) \
>   # Also, BSD sh doesn't like 'a=b b=$$a', so we can't use an
>   # intermediate shell variable, but must do all the expansion in make
>
>  -lv_abs_top_builddir=$(shell cd '$(top_builddir)' && pwd)
> - path_add = $(subst :,$(PATH_SEPARATOR),\
> --      $(subst !,$(lv_abs_top_builddir)/,!daemon:!tools:!tests))
> -+      $(subst !,$(PTEST_DIR)/,!daemon:!tools:!tests))
> -
> +-
>   VIR_TEST_EXPENSIVE ?= $(VIR_TEST_EXPENSIVE_DEFAULT)
>   TESTS_ENVIRONMENT =                           \
>  -  abs_top_builddir=$(lv_abs_top_builddir)     \
> @@ -52,14 +57,13 @@ Index: libvirt-1.2.4/tests/Makefile.am
>  +  abs_builddir="$(PTEST_DIR)/tests"           \
>  +  abs_srcdir="$(PTEST_DIR)/tests"             \
>  +  CONFIG_HEADER="$(PTEST_DIR)/config.h"       \
> -   PATH="$(path_add)$(PATH_SEPARATOR)$$PATH"   \
>     SHELL="$(SHELL)"                            \
>  -  LIBVIRT_DRIVER_DIR="$(lv_abs_top_builddir)/src/.libs" \
>  +  LIBVIRT_DRIVER_DIR="$(PTEST_DIR)/src/.libs" \
>     LIBVIRT_AUTOSTART=0                         \
>     LC_ALL=C                                    \
>     VIR_TEST_EXPENSIVE=$(VIR_TEST_EXPENSIVE)    \
> -@@ -1137,5 +1138,51 @@
> +@@ -1388,5 +1388,51 @@ else ! WITH_CIL
>   EXTRA_DIST += objectlocking.ml
>   endif ! WITH_CIL
>
> diff --git a/recipes-extended/libvirt/libvirt_1.3.2.bb
> b/recipes-extended/libvirt/libvirt_1.3.5.bb
> similarity index 97%
> rename from recipes-extended/libvirt/libvirt_1.3.2.bb
> rename to recipes-extended/libvirt/libvirt_1.3.5.bb
> index b11f514..f4a8f38 100644
> --- a/recipes-extended/libvirt/libvirt_1.3.2.bb
> +++ b/recipes-extended/libvirt/libvirt_1.3.5.bb
> @@ -5,7 +5,6 @@ LICENSE_${PN}-ptest = "GPLv2+ & LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>
>  file://COPYING.LESSER;md5=4b54a1fd55a448865a0b32d41598759d"
>  SECTION = "console/tools"
> -PR = "r1"
>
>  DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap
> util-linux e2fsprogs pm-utils \
>            iptables dnsmasq readline libtasn1 libxslt-native"
> @@ -36,8 +35,8 @@ SRC_URI = "
> http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
>             file://install-missing-file.patch \
>            "
>
> -SRC_URI[libvirt.md5sum] = "b48b06bbc7efbe9973ed0f3f223d6da2"
> -SRC_URI[libvirt.sha256sum] =
> "e3c6fc2683178660b371efb3ac7a1103a3f4b78efac7ffe560bc5917974ccf05"
> +SRC_URI[libvirt.md5sum] = "f9dc1e63d559eca50ae0ee798a4c6c6d"
> +SRC_URI[libvirt.sha256sum] =
> "93a23c44eb431da46c9458f95a66e29c9b98e37515d44b6be09e75b35ec94ac8"
>
>  inherit autotools gettext update-rc.d pkgconfig ptest systemd
>
> @@ -137,7 +136,6 @@ INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
>
>  SYSTEMD_PACKAGES = "${PN}-libvirtd"
>  SYSTEMD_SERVICE_${PN}-libvirtd = " \
> -    libvirtd.socket \
>      libvirtd.service \
>      virtlockd.service \
>      libvirt-guests.service \
> @@ -249,7 +247,7 @@ do_install_append() {
>              >> ${D}${sysconfdir}/default/volatiles/99_libvirt
>
>         # Add hook support for libvirt
> -       mkdir -p ${D}/etc/libvirt/hooks
> +       mkdir -p ${D}/etc/libvirt/hooks
>
>         # remove .la references to our working diretory
>         for i in `find ${D}${libdir} -type f -name *.la`; do
> @@ -270,6 +268,8 @@ do_compile_ptest() {
>  do_install_ptest() {
>         oe_runmake -C tests install-ptest
>
> +       find ${S}/tests -maxdepth 1 -type d -exec cp -r {}
> ${D}${PTEST_PATH}/tests/ \;
> +
>         # remove .la files for ptest, they aren't required and can trigger
> QA errors
>         for i in `find ${D}${PTEST_PATH} -type f -name *.la`; do
>                  rm -f $i
> --
> 2.9.2.368.g08bb350
>
> --
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c09c172e5f93305394920d1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Wrong mailing list (it should be <a href=3D=
"mailto:meta-virtualization@yoctoproject.org">meta-virtualization@yoctoproj=
ect.org</a>), but I can<br></div>pick up this change from here<br><br></div=
>No need to resend.<br><br></div>Bruce<br><div><div><div><div><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Aug 4, 2016 at 5:38 AM=
,  <span dir=3D"ltr">&lt;<a href=3D"mailto:kai.kang@windriver.com" target=
=3D"_blank">kai.kang@windriver.com</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">From: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com=
">kai.kang@windriver.com</a>&gt;<br>
<br>
Upgrade libvirt=C2=A0 from 1.3.2 to 1.3.5.<br>
<br>
* update checksums and remove PR<br>
* remove trailing whitespace<br>
* remove backport patch 0001-fix-crash-in-getAllDomainStats.patch<br>
* update context of patches<br>
* remove libvirtd.socket from SYSTEMD_SERVICE which doesn&#39;t exist anymo=
re<br>
* install test data which ptest requires<br>
<br>
Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.k=
ang@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../0001-to-fix-build-error.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 0<br>
=C2=A0recipes-extended/libvirt/libvirt-python.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 5 +-<br>
=C2=A0.../0001-fix-crash-in-getAllDomainStats.patch=C2=A0 =C2=A0 =C2=A0 | 5=
7 ----------------------<br>
=C2=A0...vert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch | 16 ++++--<br>
=C2=A0.../libvirt/libvirt/install-missing-file.patch=C2=A0 =C2=A0 =C2=A0| 1=
2 ++++-<br>
=C2=A0recipes-extended/libvirt/libvirt/runptest.patch=C2=A0 =C2=A0 | 34 +++=
++++------<br>
=C2=A0.../libvirt/{<a href=3D"http://libvirt_1.3.2.bb" rel=3D"noreferrer" t=
arget=3D"_blank">libvirt_1.3.2.bb</a> =3D&gt; <a href=3D"http://libvirt_1.3=
.5.bb" rel=3D"noreferrer" target=3D"_blank">libvirt_1.3.5.bb</a>} | 10 ++--=
<br>
=C2=A07 files changed, 47 insertions(+), 87 deletions(-)<br>
=C2=A0rename recipes-extended/libvirt/{libvirt-1.3.2 =3D&gt; libvirt-1.3.5}=
/0001-to-fix-build-error.patch (100%)<br>
=C2=A0delete mode 100644 recipes-extended/libvirt/libvirt/0001-fix-crash-in=
-getAllDomainStats.patch<br>
=C2=A0rename recipes-extended/libvirt/{<a href=3D"http://libvirt_1.3.2.bb" =
rel=3D"noreferrer" target=3D"_blank">libvirt_1.3.2.bb</a> =3D&gt; <a href=
=3D"http://libvirt_1.3.5.bb" rel=3D"noreferrer" target=3D"_blank">libvirt_1=
.3.5.bb</a>} (97%)<br>
<br>
diff --git a/recipes-extended/libvirt/libvirt-1.3.2/0001-to-fix-build-error=
.patch b/recipes-extended/libvirt/libvirt-1.3.5/0001-to-fix-build-error.pat=
ch<br>
similarity index 100%<br>
rename from recipes-extended/libvirt/libvirt-1.3.2/0001-to-fix-build-error.=
patch<br>
rename to recipes-extended/libvirt/libvirt-1.3.5/0001-to-fix-build-error.pa=
tch<br>
diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended=
/libvirt/libvirt-python.inc<br>
index 405d5f7..7fcce43 100644<br>
--- a/recipes-extended/libvirt/libvirt-python.inc<br>
+++ b/recipes-extended/libvirt/libvirt-python.inc<br>
@@ -17,10 +17,9 @@ FILES_${PN}-python =3D &quot;${bindir}/* ${libdir}/* ${l=
ibdir}/${PYTHON_DIR}/*&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;<a href=3D"http://libvirt.org/sources/python/libvi=
rt-python-${PV}.tar.gz;name=3Dlibvirt_python" rel=3D"noreferrer" target=3D"=
_blank">http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=
=3Dlibvirt_python</a>&quot;<br>
=C2=A0SRC_URI +=3D &quot;file://libvirt_api_xml_path.patch;patchdir=3D../li=
bvirt-python-${PV}&quot;<br>
-SRC_URI +=3D &quot;file://0001-fix-crash-in-getAllDomainStats.patch;patchd=
ir=3D../libvirt-python-${PV}&quot;<br>
<br>
-SRC_URI[libvirt_python.md5sum] =3D &quot;ed018c714d7ddbe93221c796dff283ed&=
quot;<br>
-SRC_URI[libvirt_python.sha256sum] =3D &quot;6d35ae9e7801573393b9c92471f39e=
6700d479f10b641df81d041b469f160bf8&quot;<br>
+SRC_URI[libvirt_python.md5sum] =3D &quot;4dbd7ef9ee9c4dea5887b5b31eb04529&=
quot;<br>
+SRC_URI[libvirt_python.sha256sum] =3D &quot;a0508a57637fd18a3584fb9d2322fb=
172f65708c9db16e0438a70eb0f36fa5c2&quot;<br>
<br>
=C2=A0export LIBVIRT_API_PATH =3D &quot;${S}/docs/libvirt-api.xml&quot;<br>
=C2=A0export LIBVIRT_CFLAGS =3D &quot;-I${S}/include&quot;<br>
diff --git a/recipes-extended/libvirt/libvirt/0001-fix-crash-in-getAllDomai=
nStats.patch b/recipes-extended/libvirt/libvirt/0001-fix-crash-in-getAllDom=
ainStats.patch<br>
deleted file mode 100644<br>
index 0583a94..0000000<br>
--- a/recipes-extended/libvirt/libvirt/0001-fix-crash-in-getAllDomainStats.=
patch<br>
+++ /dev/null<br>
@@ -1,57 +0,0 @@<br>
-From e9c4e2abffef007a28112ebb40a9586b0128f10b Mon Sep 17 00:00:00 2001<br>
-From: Pavel Hrdina &lt;<a href=3D"mailto:phrdina@redhat.com">phrdina@redha=
t.com</a>&gt;<br>
-Date: Mon, 18 Apr 2016 16:53:50 +0200<br>
-Subject: [PATCH] fix crash in getAllDomainStats<br>
-<br>
-Upstream-Status: Backport<br>
-<br>
-Commits 1d39dbaf and 827ed9b4 broke the libvirt-python API by removing<br>
-virDomainRef() and virDomainFree().=C2=A0 virDomainStatsRecordListFree() w=
ill<br>
-free that domain pointer and later when virDomain (python object) call<br>
-its destructor and tries to free that same pointer again.<br>
-<br>
-Resolves: <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1326839=
" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug=
.cgi?id=3D1326839</a><br>
-<br>
-Signed-off-by: Pavel Hrdina &lt;<a href=3D"mailto:phrdina@redhat.com">phrd=
ina@redhat.com</a>&gt;<br>
----<br>
- libvirt-override.c | 8 +++++++-<br>
- 1 file changed, 7 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/libvirt-override.c b/libvirt-override.c<br>
-index 4640ed5..2de95ce 100644<br>
---- a/libvirt-override.c<br>
-+++ b/libvirt-override.c<br>
-@@ -8381,6 +8381,7 @@ convertDomainStatsRecord(virDomainStatsRecordPtr *re=
cords,<br>
-=C2=A0 =C2=A0 =C2=A0PyObject *py_retval;<br>
-=C2=A0 =C2=A0 =C2=A0PyObject *py_record;<br>
-=C2=A0 =C2=A0 =C2=A0PyObject *py_record_stats =3D NULL;<br>
-+=C2=A0 =C2=A0 virDomainPtr dom =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0size_t i;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0if (!(py_retval =3D PyList_New(nrecords)))<br>
-@@ -8392,9 +8393,12 @@ convertDomainStatsRecord(virDomainStatsRecordPtr *r=
ecords,<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VIR_PY_LIST_SET_GOTO(py_retval, i, py_re=
cord, error);<br>
-<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dom =3D records[i]-&gt;dom;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 virDomainRef(dom);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VIR_PY_TUPLE_SET_GOTO(py_record, 0,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libvirt_virDomainPtrWrap(records[i]-&gt;dom=
),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libvirt_virDomainPtrWrap(dom),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dom =3D NULL;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(py_record_stats =3D getPyVirTypedP=
arameter(records[i]-&gt;params,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 records[i]-&gt;nparams)))<=
br>
-@@ -8406,6 +8410,8 @@ convertDomainStatsRecord(virDomainStatsRecordPtr *re=
cords,<br>
-=C2=A0 =C2=A0 =C2=A0return py_retval;<br>
-<br>
-=C2=A0 error:<br>
-+=C2=A0 =C2=A0 if (dom)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 virDomainFree(dom);<br>
-=C2=A0 =C2=A0 =C2=A0Py_XDECREF(py_retval);<br>
-=C2=A0 =C2=A0 =C2=A0return NULL;<br>
- }<br>
---<br>
-2.8.1<br>
-<br>
diff --git a/recipes-extended/libvirt/libvirt/Revert-build-add-prefix-to-SY=
STEMD_UNIT_DIR.patch b/recipes-extended/libvirt/libvirt/Revert-build-add-pr=
efix-to-SYSTEMD_UNIT_DIR.patch<br>
index 16c3a16..02ddf68 100644<br>
--- a/recipes-extended/libvirt/libvirt/Revert-build-add-prefix-to-SYSTEMD_U=
NIT_DIR.patch<br>
+++ b/recipes-extended/libvirt/libvirt/Revert-build-add-prefix-to-SYSTEMD_U=
NIT_DIR.patch<br>
@@ -1,3 +1,9 @@<br>
+Upstream-Status: Inappropriate [configuration]<br>
+<br>
+Update context for version 1.3.5.<br>
+<br>
+Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.=
kang@windriver.com</a>&gt;<br>
+---<br>
=C2=A0From dd915e7f70e676aea93f750c75d16ce646e71e4b Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windriver=
.com">mark.asselstine@windriver.com</a>&gt;<br>
=C2=A0Date: Wed, 9 Sep 2015 11:52:44 -0400<br>
@@ -24,20 +30,20 @@ diff --git a/daemon/Makefile.am b/daemon/Makefile.am<br=
>
=C2=A0index 2dbe81b..41ea2db 100644<br>
=C2=A0--- a/daemon/Makefile.am<br>
=C2=A0+++ b/daemon/Makefile.am<br>
-@@ -445,7 +445,7 @@ endif ! LIBVIRT_INIT_SCRIPT_UPSTART<br>
+@@ -449,7 +449,7 @@ endif ! LIBVIRT_INIT_SCRIPT_UPSTART<br>
<br>
=C2=A0 if LIBVIRT_INIT_SCRIPT_SYSTEMD<br>
<br>
=C2=A0-SYSTEMD_UNIT_DIR =3D $(prefix)/lib/systemd/system<br>
=C2=A0+SYSTEMD_UNIT_DIR =3D /lib/systemd/system<br>
- BUILT_SOURCES +=3D libvirtd.service libvirtd.socket<br>
+ BUILT_SOURCES +=3D libvirtd.service<br>
<br>
- install-init-systemd: install-sysconfig libvirtd.service libvirtd.socket<=
br>
+ install-init-systemd: install-sysconfig libvirtd.service<br>
=C2=A0diff --git a/src/Makefile.am b/src/Makefile.am<br>
=C2=A0index a316b4d..d271291 100644<br>
=C2=A0--- a/src/Makefile.am<br>
=C2=A0+++ b/src/Makefile.am<br>
-@@ -2594,7 +2594,7 @@ EXTRA_DIST +=3D \<br>
+@@ -2633,7 +2633,7 @@ EXTRA_DIST +=3D \<br>
=C2=A0 if WITH_LIBVIRTD<br>
=C2=A0 if LIBVIRT_INIT_SCRIPT_SYSTEMD<br>
<br>
@@ -50,7 +56,7 @@ diff --git a/tools/Makefile.am b/tools/Makefile.am<br>
=C2=A0index b3227a7..0e58f73 100644<br>
=C2=A0--- a/tools/Makefile.am<br>
=C2=A0+++ b/tools/Makefile.am<br>
-@@ -356,7 +356,7 @@ libvirt-guests.init: <a href=3D"http://libvirt-guests.=
init.in" rel=3D"noreferrer" target=3D"_blank">libvirt-guests.init.in</a> li=
bvirt-guests.sh<br>
+@@ -380,7 +380,7 @@ libvirt-guests.init: <a href=3D"http://libvirt-guests.=
init.in" rel=3D"noreferrer" target=3D"_blank">libvirt-guests.init.in</a> li=
bvirt-guests.sh<br>
<br>
<br>
=C2=A0 EXTRA_DIST +=3D <a href=3D"http://libvirt-guests.service.in" rel=3D"=
noreferrer" target=3D"_blank">libvirt-guests.service.in</a><br>
diff --git a/recipes-extended/libvirt/libvirt/install-missing-file.patch b/=
recipes-extended/libvirt/libvirt/install-missing-file.patch<br>
index f6f6e25..ecd4a87 100644<br>
--- a/recipes-extended/libvirt/libvirt/install-missing-file.patch<br>
+++ b/recipes-extended/libvirt/libvirt/install-missing-file.patch<br>
@@ -1,3 +1,11 @@<br>
+Upstream-Status: Inapproriate<br>
+<br>
+This patch is for ptest, so it is inapproriate to send to upstream.<br>
+<br>
+Update context for 1.3.5.<br>
+<br>
+Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.=
kang@windriver.com</a>&gt;<br>
+---<br>
=C2=A0From 0780181a3285511f166487a54ebc231fc657edfe Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Catalin Enache &lt;<a href=3D"mailto:catalin.enache@windriver.c=
om">catalin.enache@windriver.com</a>&gt;<br>
=C2=A0Date: Mon, 25 Jul 2016 16:38:51 +0300<br>
@@ -14,10 +22,10 @@ diff --git a/tests/Makefile.am b/tests/Makefile.am<br>
=C2=A0index 02e0dd8..187fbca 100644<br>
=C2=A0--- a/tests/Makefile.am<br>
=C2=A0+++ b/tests/Makefile.am<br>
-@@ -155,6 +155,7 @@ EXTRA_DIST =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
+@@ -170,6 +170,7 @@ EXTRA_DIST =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 xml2vmxdata<br>
<br>
- test_helpers =3D commandhelper ssh test_conf<br>
+ test_helpers =3D commandhelper ssh virconftest<br>
=C2=A0+test_misc =3D<br>
=C2=A0 test_programs =3D virshtest sockettest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 nodeinfotest virbuftest \<br>
diff --git a/recipes-extended/libvirt/libvirt/runptest.patch b/recipes-exte=
nded/libvirt/libvirt/runptest.patch<br>
index a33f569..b7609a8 100644<br>
--- a/recipes-extended/libvirt/libvirt/runptest.patch<br>
+++ b/recipes-extended/libvirt/libvirt/runptest.patch<br>
@@ -1,14 +1,18 @@<br>
+Update context for 1.3.5.<br>
+<br>
+Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.=
kang@windriver.com</a>&gt;<br>
+---<br>
=C2=A0Add &#39;install-ptest&#39; rule.<br>
=C2=A0Change TESTS_ENVIRONMENT to allow running outside build dir.<br>
<br>
=C2=A0Signed-off-by: Mihaela Sendrea &lt;<a href=3D"mailto:mihaela.sendrea@=
enea.com">mihaela.sendrea@enea.com</a>&gt;<br>
=C2=A0Upstream-status: Pending<br>
-<br>
-Index: libvirt-1.2.4/tests/Makefile.am<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- libvirt-1.2.4.orig/tests/Makefile.am<br>
-+++ libvirt-1.2.4/tests/Makefile.am<br>
-@@ -31,9 +31,11 @@<br>
+---<br>
+diff --git a/tests/Makefile.am b/tests/Makefile.am<br>
+index 0c4ad3c..bb4e31a 100644<br>
+--- a/tests/Makefile.am<br>
++++ b/tests/Makefile.am<br>
+@@ -33,11 +33,13 @@ INCLUDES =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -I$(top_srcdir)/src/conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(GETTEXT_CPPFLAGS)<br>
<br>
@@ -16,13 +20,17 @@ Index: libvirt-1.2.4/tests/Makefile.am<br>
=C2=A0+<br>
=C2=A0 AM_CFLAGS =3D \<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 -Dabs_builddir=3D&quot;\&quot;$(abs_builddir)\&=
quot;&quot; \<br>
+-=C2=A0 =C2=A0 =C2=A0 -Dabs_topbuilddir=3D&quot;\&quot;$(abs_topbuilddir)\=
&quot;&quot; \<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 -Dabs_srcdir=3D&quot;\&quot;$(abs_srcdir)\&quot=
;&quot; \<br>
+-=C2=A0 =C2=A0 =C2=A0 -Dabs_topsrcdir=3D&quot;\&quot;$(abs_topsrcdir)\&quo=
t;&quot; \<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 -Dabs_builddir=3D&quot;\&quot;$(PTEST_DIR)/test=
s\&quot;&quot; \<br>
++=C2=A0 =C2=A0 =C2=A0 -Dabs_topbuilddir=3D&quot;\&quot;$(PTEST_DIR)\&quot;=
&quot; \<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 -Dabs_srcdir=3D&quot;\&quot;$(PTEST_DIR)/tests\=
&quot;&quot; \<br>
++=C2=A0 =C2=A0 =C2=A0 -Dabs_topsrcdir=3D&quot;\&quot;$(PTEST_DIR)\&quot;&q=
uot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(LIBXML_CFLAGS) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(LIBNL_CFLAGS) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(LIBNL_CFLAGS) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(GNUTLS_CFLAGS) \<br>
-@@ -48,7 +50,7 @@<br>
+@@ -62,7 +64,7 @@ QEMULIB_LDFLAGS =3D \<br>
<br>
=C2=A0 if WITH_DRIVER_MODULES<br>
=C2=A0 INCLUDES +=3D \<br>
@@ -31,15 +39,12 @@ Index: libvirt-1.2.4/tests/Makefile.am<br>
=C2=A0 endif WITH_DRIVER_MODULES<br>
<br>
=C2=A0 PROBES_O =3D<br>
-@@ -409,20 +411,19 @@<br>
+@@ -483,17 +485,15 @@ TESTS =3D $(test_programs) \<br>
=C2=A0 # Also, BSD sh doesn&#39;t like &#39;a=3Db b=3D$$a&#39;, so we can&#=
39;t use an<br>
=C2=A0 # intermediate shell variable, but must do all the expansion in make=
<br>
<br>
=C2=A0-lv_abs_top_builddir=3D$(shell cd &#39;$(top_builddir)&#39; &amp;&amp=
; pwd)<br>
- path_add =3D $(subst :,$(PATH_SEPARATOR),\<br>
--=C2=A0 =C2=A0 =C2=A0 $(subst !,$(lv_abs_top_builddir)/,!daemon:!tools:!te=
sts))<br>
-+=C2=A0 =C2=A0 =C2=A0 $(subst !,$(PTEST_DIR)/,!daemon:!tools:!tests))<br>
-<br>
+-<br>
=C2=A0 VIR_TEST_EXPENSIVE ?=3D $(VIR_TEST_EXPENSIVE_DEFAULT)<br>
=C2=A0 TESTS_ENVIRONMENT =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0-=C2=A0 abs_top_builddir=3D$(lv_abs_top_builddir)=C2=A0 =C2=A0 =C2=A0=
\<br>
@@ -52,14 +57,13 @@ Index: libvirt-1.2.4/tests/Makefile.am<br>
=C2=A0+=C2=A0 abs_builddir=3D&quot;$(PTEST_DIR)/tests&quot;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0+=C2=A0 abs_srcdir=3D&quot;$(PTEST_DIR)/tests&quot;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0+=C2=A0 CONFIG_HEADER=3D&quot;$(PTEST_DIR)/config.h&quot;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0PATH=3D&quot;$(path_add)$(PATH_SEPARATOR)$$PATH&quot;=C2=A0 =
=C2=A0\<br>
=C2=A0 =C2=A0 SHELL=3D&quot;$(SHELL)&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0-=C2=A0 LIBVIRT_DRIVER_DIR=3D&quot;$(lv_abs_top_builddir)/src/.libs&q=
uot; \<br>
=C2=A0+=C2=A0 LIBVIRT_DRIVER_DIR=3D&quot;$(PTEST_DIR)/src/.libs&quot; \<br>
=C2=A0 =C2=A0 LIBVIRT_AUTOSTART=3D0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 LC_ALL=3DC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \<br>
=C2=A0 =C2=A0 VIR_TEST_EXPENSIVE=3D$(VIR_TEST_EXPENSIVE)=C2=A0 =C2=A0 \<br>
-@@ -1137,5 +1138,51 @@<br>
+@@ -1388,5 +1388,51 @@ else ! WITH_CIL<br>
=C2=A0 EXTRA_DIST +=3D <a href=3D"http://objectlocking.ml" rel=3D"noreferre=
r" target=3D"_blank">objectlocking.ml</a><br>
=C2=A0 endif ! WITH_CIL<br>
<br>
diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.2.bb" r=
el=3D"noreferrer" target=3D"_blank">libvirt_1.3.2.bb</a> b/recipes-extended=
/libvirt/<a href=3D"http://libvirt_1.3.5.bb" rel=3D"noreferrer" target=3D"_=
blank">libvirt_1.3.5.bb</a><br>
similarity index 97%<br>
rename from recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.2.bb" re=
l=3D"noreferrer" target=3D"_blank">libvirt_1.3.2.bb</a><br>
rename to recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" rel=
=3D"noreferrer" target=3D"_blank">libvirt_1.3.5.bb</a><br>
index b11f514..f4a8f38 100644<br>
--- a/recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_1.3.2.bb</a><br>
+++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_1.3.5.bb</a><br>
@@ -5,7 +5,6 @@ LICENSE_${PN}-ptest =3D &quot;GPLv2+ &amp; LGPLv2.1&quot;<b=
r>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a8=
0fdaf4a4263 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://COPYING.LESSER;md5=3D4b54a1fd55a448865a0b32d41598759d&quot;<br>
=C2=A0SECTION =3D &quot;console/tools&quot;<br>
-PR =3D &quot;r1&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;bridge-utils gnutls libxml2 lvm2 avahi parted curl =
libpcap util-linux e2fsprogs pm-utils \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iptables dnsmasq readline libtasn1=
 libxslt-native&quot;<br>
@@ -36,8 +35,8 @@ SRC_URI =3D &quot;<a href=3D"http://libvirt.org/sources/l=
ibvirt-${PV}.tar.gz;name=3Dlibvirt" rel=3D"noreferrer" target=3D"_blank">ht=
tp://libvirt.org/sources/libvirt-${PV}.tar.gz;name=3Dlibvirt</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://install-missing-file.patch=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-SRC_URI[libvirt.md5sum] =3D &quot;b48b06bbc7efbe9973ed0f3f223d6da2&quot;<b=
r>
-SRC_URI[libvirt.sha256sum] =3D &quot;e3c6fc2683178660b371efb3ac7a1103a3f4b=
78efac7ffe560bc5917974ccf05&quot;<br>
+SRC_URI[libvirt.md5sum] =3D &quot;f9dc1e63d559eca50ae0ee798a4c6c6d&quot;<b=
r>
+SRC_URI[libvirt.sha256sum] =3D &quot;93a23c44eb431da46c9458f95a66e29c9b98e=
37515d44b6be09e75b35ec94ac8&quot;<br>
<br>
=C2=A0inherit autotools gettext update-rc.d pkgconfig ptest systemd<br>
<br>
@@ -137,7 +136,6 @@ INITSCRIPT_PARAMS_${PN}-libvirtd =3D &quot;defaults 72&=
quot;<br>
<br>
=C2=A0SYSTEMD_PACKAGES =3D &quot;${PN}-libvirtd&quot;<br>
=C2=A0SYSTEMD_SERVICE_${PN}-libvirtd =3D &quot; \<br>
-=C2=A0 =C2=A0 libvirtd.socket \<br>
=C2=A0 =C2=A0 =C2=A0libvirtd.service \<br>
=C2=A0 =C2=A0 =C2=A0virtlockd.service \<br>
=C2=A0 =C2=A0 =C2=A0libvirt-guests.service \<br>
@@ -249,7 +247,7 @@ do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; ${D}${sysconfdir}/=
default/volatiles/99_libvirt<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Add hook support for libvirt<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}/etc/libvirt/hooks<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}/etc/libvirt/hooks<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # remove .la references to our working diretory=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in `find ${D}${libdir} -type f -name *.la=
`; do<br>
@@ -270,6 +268,8 @@ do_compile_ptest() {<br>
=C2=A0do_install_ptest() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake -C tests install-ptest<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0find ${S}/tests -maxdepth 1 -type d -exec cp -r=
 {} ${D}${PTEST_PATH}/tests/ \;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # remove .la files for ptest, they aren&#39;t r=
equired and can trigger QA errors<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in `find ${D}${PTEST_PATH} -type f -name =
*.la`; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f $i<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.9.2.368.g08bb350<br>
<br>
--<br>
_______________________________________________<br>
yocto mailing list<br>
<a href=3D"mailto:yocto@yoctoproject.org">yocto@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/yocto" rel=3D"noreferrer=
" target=3D"_blank">https://lists.yoctoproject.org/listinfo/yocto</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div></div></div></div></div></div>

--94eb2c09c172e5f93305394920d1--
