Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 368B5E00D4C; Fri, 10 May 2019 13:42:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.46 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
	[209.85.167.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 91882E00C78
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 May 2019 13:42:42 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id n134so5039077lfn.11
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 May 2019 13:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sKUVtTP8jRjttRS/9eLWPZudmLiM4A6W7w/omp8nj30=;
	b=T8Ubf+cyEyezaiG+whiiEglHo68gPLHVYGVZE7N97KUiW5U+s7/ely0nK+fYyIUL/t
	eQLiR0K8+mQcO959ll+dzzCmjyZwRi59NyztHgRt71lKXWS7J8DSNlJwetVzxbXeNRDk
	6DQ7a4tVu+rwnZgEyiSlMnMaq0CHSOgggdclVAyAEGnK3Nrd1q7WCRMdoRoTsxFmQPlx
	Lf8BCaKsdrO1TR6BJb2SHWv/UhBUj3vs+g+Z2Sm1Dq1qQphPWAHmlkeDknBPsalIj4w0
	5LymFd/A/Q/BsGr6wOcgMUSswTAmIQTFcI+pBh7fmTcK+NQKIt7G+TLBRC9JQ4vKYPTY
	T1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sKUVtTP8jRjttRS/9eLWPZudmLiM4A6W7w/omp8nj30=;
	b=YySEcc77W8XLG2Aev+HGF1Gnyk9wWZSaHiKo2ahHlo7cSezpwwI9Ix3YgfR2708mzR
	ZM2l8Ir2lpc5gTdS6qNqhatm324+QOS+igOQ/1Qx6o59M5nGAevzXMC9U1R+IegBNoGf
	0y17vv6ClFZHtRig8CSw+ka9AcOieMA/p1pfWIWATSsoZ8IjcXUeep4hfsSupTAkcwDc
	aoLWAkS/cIqxoFnPoqBxjwGXubGxpBibRwKacne8wQ7b3/sEvR10AM95iwwv3P+RqWZm
	Pv/h5SjoHJfmTQAR4yPNi7ZcNCL8/rglFDBvlJLbj5Hpp9o+Zn6kwuLIe+370bPZk378
	vUOw==
X-Gm-Message-State: APjAAAXI/nnMY9x6XWFsbdXBpL/TVPBjMGItbra2pi8pDXwhcXupFIkd
	RdPaLdQJKAfjAiLxGhSfzVnnbN5ZhZKbsH+meNx/oh22
X-Google-Smtp-Source: APXvYqz+6JO+6tEopj3nCK9wY1aaTdH1S9VuwwULjfcD5xRBLr9mxAvnTtOObndU+eO8vl3wUH7obDlztTN8jQuPRLI=
X-Received: by 2002:a19:ae14:: with SMTP id f20mr6888655lfc.49.1557520961158; 
	Fri, 10 May 2019 13:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <1557395608-10447-1-git-send-email-dengke.du@windriver.com>
In-Reply-To: <1557395608-10447-1-git-send-email-dengke.du@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 10 May 2019 16:42:29 -0400
Message-ID: <CADkTA4O1D0yfOdWbVxwrJMWcUNArrjuQE9K5CqKMnj6itJsuXg@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] libvirt: upgrade to 5.3.0
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
X-List-Received-Date: Fri, 10 May 2019 20:42:46 -0000
Content-Type: multipart/alternative; boundary="0000000000009ec48a05888e9bdd"

--0000000000009ec48a05888e9bdd
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, May 9, 2019 at 5:53 AM Dengke Du <dengke.du@windriver.com> wrote:

> 1. remove the uml configure option because new version libvirt drop it
> 2. rebase three patches for new source codes
>
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt-python.inc        |  4 +-
>  .../libvirt/libvirt/install-missing-file.patch     | 17 +++----
>  recipes-extended/libvirt/libvirt/runptest.patch    | 56
> ++++++++--------------
>  ...ibvirt-net-rpc-to-virt-host-validate-when.patch | 33 ++++++-------
>  .../libvirt/{libvirt_4.9.0.bb => libvirt_5.3.0.bb} |  8 ++--
>  5 files changed, 52 insertions(+), 66 deletions(-)
>  rename recipes-extended/libvirt/{libvirt_4.9.0.bb => libvirt_5.3.0.bb}
> (97%)
>
> diff --git a/recipes-extended/libvirt/libvirt-python.inc
> b/recipes-extended/libvirt/libvirt-python.inc
> index ae43ba8..9554328 100644
> --- a/recipes-extended/libvirt/libvirt-python.inc
> +++ b/recipes-extended/libvirt/libvirt-python.inc
> @@ -18,8 +18,8 @@ FILES_${PN}-python = "${bindir}/* ${libdir}/*
> ${libdir}/${PYTHON_DIR}/*"
>  SRC_URI += "
> http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python
> "
>  SRC_URI +=
> "file://libvirt_api_xml_path.patch;patchdir=../libvirt-python-${PV}"
>
> -SRC_URI[libvirt_python.md5sum] = "cba7dc90d564aa8c267c38d452b83f80"
> -SRC_URI[libvirt_python.sha256sum] =
> "01c4becf50b521a9e3d1b48a3a79d83cb389d86d760b895d911d78f5b6ae7b60"
> +SRC_URI[libvirt_python.md5sum] = "b7e086e080e5681bece9e87db5a88afa"
> +SRC_URI[libvirt_python.sha256sum] =
> "5213f995cb55a2f770aa36704b60313958c7ff1fde8cca39028ea889cc9f30ff"
>
>  export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
>  export LIBVIRT_CFLAGS = "-I${S}/include"
> diff --git a/recipes-extended/libvirt/libvirt/install-missing-file.patch
> b/recipes-extended/libvirt/libvirt/install-missing-file.patch
> index cb5a20e..94c7299 100644
> --- a/recipes-extended/libvirt/libvirt/install-missing-file.patch
> +++ b/recipes-extended/libvirt/libvirt/install-missing-file.patch
> @@ -1,6 +1,6 @@
> -From 0780181a3285511f166487a54ebc231fc657edfe Mon Sep 17 00:00:00 2001
> -From: Catalin Enache <catalin.enache@windriver.com>
> -Date: Mon, 25 Jul 2016 16:38:51 +0300
> +From 4aea9dbeb7f7990ac5a2227d80251570b4a5bca1 Mon Sep 17 00:00:00 2001
> +From: Dengke Du <dengke.du@windriver.com>
> +Date: Wed, 8 May 2019 17:24:17 +0800
>  Subject: [PATCH] Install missing conf file
>
>  openvzutilstest.conf file is needed by openvzutilstest test.
> @@ -12,15 +12,17 @@ Signed-off-by: Catalin Enache <
> catalin.enache@windriver.com>
>  Signed-off-by: Kai Kang <kai.kang@windriver.com>
>  [MA: Update context for v4.3.0]
>  Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> +[DDU: Update context for v5.3.0]
> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
>  ---
>   tests/Makefile.am | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
>  diff --git a/tests/Makefile.am b/tests/Makefile.am
> -index 65f776e..8a6fd44 100644
> +index 7d0387e..68c3561 100644
>  --- a/tests/Makefile.am
>  +++ b/tests/Makefile.am
> -@@ -173,6 +173,7 @@ EXTRA_DIST = \
> +@@ -168,6 +168,7 @@ EXTRA_DIST = \
>         $(NULL)
>
>   test_helpers = commandhelper ssh
> @@ -28,7 +30,7 @@ index 65f776e..8a6fd44 100644
>   test_programs = virshtest sockettest \
>         virhostcputest virbuftest \
>         commandtest seclabeltest \
> -@@ -305,6 +306,7 @@ endif WITH_LXC
> +@@ -303,6 +304,7 @@ endif WITH_LXC
>
>   if WITH_OPENVZ
>   test_programs += openvzutilstest
> @@ -36,7 +38,7 @@ index 65f776e..8a6fd44 100644
>   endif WITH_OPENVZ
>
>   if WITH_ESX
> -@@ -1488,7 +1490,7 @@ endif ! WITH_CIL
> +@@ -1539,7 +1541,7 @@ endif ! WITH_CIL
>
>   buildtest-TESTS: $(TESTS) $(test_libraries) $(test_helpers)
>
> @@ -45,7 +47,6 @@ index 65f776e..8a6fd44 100644
>
>   install-ptest:
>         list='$(TESTS) $(test_helpers) test-lib.sh virschematest'
> -
>  --
>  2.7.4
>
> diff --git a/recipes-extended/libvirt/libvirt/runptest.patch
> b/recipes-extended/libvirt/libvirt/runptest.patch
> index 457e821..bc97ba6 100644
> --- a/recipes-extended/libvirt/libvirt/runptest.patch
> +++ b/recipes-extended/libvirt/libvirt/runptest.patch
> @@ -1,7 +1,7 @@
> -From 94478517c4f9950b28be3a348387db6ede3db812 Mon Sep 17 00:00:00 2001
> -From: Mark Asselstine <mark.asselstine@windriver.com>
> -Date: Mon, 4 Jun 2018 11:55:37 -0400
> -Subject: [PATCH] Add 'install-ptest' rule.
> +From 52fc46b4f8cfd36476f59c0796f4f39686b53953 Mon Sep 17 00:00:00 2001
> +From: Dengke Du <dengke.du@windriver.com>
> +Date: Wed, 8 May 2019 10:20:47 +0800
> +Subject: [PATCH] Add 'install-ptest' rule
>
>  Change TESTS_ENVIRONMENT to allow running outside build dir.
>
> @@ -15,15 +15,17 @@ Signed-off-by: Mark Asselstine <
> mark.asselstine@windriver.com>
>  Signed-off-by: He Zhe <zhe.he@windriver.com>
>  [MA: Update context for v4.3.0]
>  Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> +[DDU: Update context for v5.3.0]
> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
>  ---
> - tests/Makefile.am | 74
> +++++++++++++++++++++++++++++++++++++++++++++----------
> - 1 file changed, 61 insertions(+), 13 deletions(-)
> + tests/Makefile.am | 68
> ++++++++++++++++++++++++++++++++++++++++++++++++-------
> + 1 file changed, 60 insertions(+), 8 deletions(-)
>
>  diff --git a/tests/Makefile.am b/tests/Makefile.am
> -index 7b93fbd..edc1eb9 100644
> +index 46d94d2..7d0387e 100644
>  --- a/tests/Makefile.am
>  +++ b/tests/Makefile.am
> -@@ -35,11 +35,13 @@ INCLUDES = \
> +@@ -29,11 +29,13 @@ AM_CPPFLAGS = \
>
>   WARN_CFLAGS += $(RELAXED_FRAME_LIMIT_CFLAGS)
>
> @@ -31,50 +33,32 @@ index 7b93fbd..edc1eb9 100644
>  +
>   AM_CFLAGS = \
>  -      -Dabs_builddir="\"$(abs_builddir)\"" \
> --      -Dabs_topbuilddir="\"$(abs_topbuilddir)\"" \
> +-      -Dabs_top_builddir="\"$(abs_top_builddir)\"" \
>  -      -Dabs_srcdir="\"$(abs_srcdir)\"" \
> --      -Dabs_topsrcdir="\"$(abs_topsrcdir)\"" \
> +-      -Dabs_top_srcdir="\"$(abs_top_srcdir)\"" \
>  +      -Dabs_builddir="\"$(PTEST_DIR)/tests\"" \
> -+      -Dabs_topbuilddir="\"$(PTEST_DIR)\"" \
> ++      -Dabs_top_builddir="\"$(PTEST_DIR)\"" \
>  +      -Dabs_srcdir="\"$(PTEST_DIR)/tests\"" \
> -+      -Dabs_topsrcdir="\"$(PTEST_DIR)\"" \
> ++      -Dabs_top_srcdir="\"$(PTEST_DIR)\"" \
>         $(LIBXML_CFLAGS) \
>         $(LIBNL_CFLAGS) \
>         $(GNUTLS_CFLAGS) \
> -@@ -64,7 +66,7 @@ QEMULIB_LDFLAGS = \
> -       $(MINGW_EXTRA_LDFLAGS)
> +@@ -465,10 +467,10 @@ TESTS = $(test_programs) \
>
> - INCLUDES += \
> --      -DTEST_DRIVER_DIR=\"$(top_builddir)/src/.libs\"
> -+      -DTEST_DRIVER_DIR=\"$(PTEST_DIR)/src/.libs\"
> -
> - PROBES_O =
> - if WITH_DTRACE_PROBES
> -@@ -466,17 +468,15 @@ TESTS = $(test_programs) \
> - # Also, BSD sh doesn't like 'a=b b=$$a', so we can't use an
> - # intermediate shell variable, but must do all the expansion in make
> -
> --lv_abs_top_builddir=$(shell cd '$(top_builddir)' && pwd)
> --
>   VIR_TEST_EXPENSIVE ?= $(VIR_TEST_EXPENSIVE_DEFAULT)
>   TESTS_ENVIRONMENT = \
> --  abs_top_builddir=$(lv_abs_top_builddir) \
> --  abs_top_srcdir=`cd '$(top_srcdir)'; pwd` \
> --  abs_builddir=$(abs_builddir) \
> --  abs_srcdir=$(abs_srcdir) \
> --  CONFIG_HEADER="$(lv_abs_top_builddir)/config.h" \
> +-  abs_top_builddir="$(abs_top_builddir)" \
> +-  abs_top_srcdir="$(abs_top_srcdir)" \
> +-  abs_builddir="$(abs_builddir)" \
> +-  abs_srcdir="$(abs_srcdir)" \
>  +  abs_top_builddir="$(PTEST_DIR)" \
>  +  abs_top_srcdir="$(PTEST_DIR)" \
>  +  abs_builddir="$(PTEST_DIR)/tests" \
>  +  abs_srcdir="$(PTEST_DIR)/tests" \
> -+  CONFIG_HEADER="$(PTEST_DIR)/config.h" \
>     SHELL="$(SHELL)" \
> --  LIBVIRT_DRIVER_DIR="$(lv_abs_top_builddir)/src/.libs" \
> -+  LIBVIRT_DRIVER_DIR="$(PTEST_DIR)/src/.libs" \
>     LIBVIRT_AUTOSTART=0 \
>     LC_ALL=C \
> -   VIR_TEST_EXPENSIVE=$(VIR_TEST_EXPENSIVE) \
> -@@ -1486,5 +1486,55 @@ else ! WITH_CIL
> +@@ -1535,5 +1537,55 @@ else ! WITH_CIL
>   EXTRA_DIST += objectlocking.ml
>   endif ! WITH_CIL
>
> diff --git
> a/recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch
> b/recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch
> index 5f6f950..d49776c 100644
> ---
> a/recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch
> +++
> b/recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch
> @@ -1,6 +1,6 @@
> -From f73c5c61c921bf773dcba5e4234e23afce5dbe7f Mon Sep 17 00:00:00 2001
> -From: Bruce Ashfield <bruce.ashfield@windriver.com>
> -Date: Fri, 2 Aug 2013 11:38:43 -0400
> +From ae4b40a1b3cb63a322716b6ad1762d53ada249e1 Mon Sep 17 00:00:00 2001
> +From: Dengke Du <dengke.du@windriver.com>
> +Date: Tue, 7 May 2019 15:26:32 +0800
>  Subject: [PATCH] tools: add libvirt-net-rpc to virt-host-validate when
> TLS is
>   enabled
>
> @@ -13,17 +13,19 @@ Signed-off-by: Bruce Ashfield <
> bruce.ashfield@windriver.com>
>  Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
>  [MA: rebase to v4.3.0]
>  Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> +[ddu: rebase to v5.3.0]
> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
>  ---
>   examples/Makefile.am | 19 +++++++++++++++++++
> - tools/Makefile.am    | 13 +++++++++++++
> - 2 files changed, 32 insertions(+)
> + tools/Makefile.am    | 12 ++++++++++++
> + 2 files changed, 31 insertions(+)
>
>  diff --git a/examples/Makefile.am b/examples/Makefile.am
> -index 7069d74..c8893e3 100644
> +index ee7d3e6..7a5fd73 100644
>  --- a/examples/Makefile.am
>  +++ b/examples/Makefile.am
> -@@ -39,6 +39,10 @@ LDADD = $(STATIC_BINARIES) $(WARN_CFLAGS)
> $(COVERAGE_LDFLAGS) \
> -       $(top_builddir)/src/libvirt.la $(top_builddir)/gnulib/lib/
> libgnu.la \
> +@@ -34,6 +34,10 @@ LDADD = $(STATIC_BINARIES) $(WARN_CFLAGS) \
> +       $(top_builddir)/src/libvirt.la \
>         $(top_builddir)/src/libvirt-admin.la
>
>  +if WITH_GNUTLS
> @@ -33,7 +35,7 @@ index 7069d74..c8893e3 100644
>   noinst_PROGRAMS=dominfo/info1 dommigrate/dommigrate domsuspend/suspend \
>         domtop/domtop hellolibvirt/hellolibvirt object-events/event-test \
>         openauth/openauth rename/rename admin/list_servers
> admin/list_clients \
> -@@ -70,6 +74,21 @@ admin_logging_SOURCES = admin/logging.c
> +@@ -65,6 +69,21 @@ admin_logging_SOURCES = admin/logging.c
>   INSTALL_DATA_LOCAL =
>   UNINSTALL_LOCAL =
>
> @@ -52,14 +54,14 @@ index 7069d74..c8893e3 100644
>  +               $(NULL)
>  +endif
>  +
> - if WITH_APPARMOR_PROFILES
> - apparmordir = $(sysconfdir)/apparmor.d/
> - apparmor_DATA = \
> + if WITH_NWFILTER
> + NWFILTER_DIR = "$(DESTDIR)$(sysconfdir)/libvirt/nwfilter"
> +
>  diff --git a/tools/Makefile.am b/tools/Makefile.am
> -index 1452d98..204e772 100644
> +index c6064de..1ac8445 100644
>  --- a/tools/Makefile.am
>  +++ b/tools/Makefile.am
> -@@ -188,6 +188,13 @@ virt_host_validate_LDADD = \
> +@@ -188,6 +188,12 @@ virt_host_validate_LDADD = \
>                 ../gnulib/lib/libgnu.la \
>                 $(NULL)
>
> @@ -69,11 +71,10 @@ index 1452d98..204e772 100644
>  +                            $(NULL)
>  +endif
>  +
> -+
>   virt_host_validate_CFLAGS = \
>                 $(AM_CFLAGS) \
>                 $(NULL)
> -@@ -268,6 +275,12 @@ virt_admin_CFLAGS = \
> +@@ -265,6 +271,12 @@ virt_admin_CFLAGS = \
>                 $(READLINE_CFLAGS)
>   BUILT_SOURCES =
>
> diff --git a/recipes-extended/libvirt/libvirt_4.9.0.bb
> b/recipes-extended/libvirt/libvirt_5.3.0.bb
> similarity index 97%
> rename from recipes-extended/libvirt/libvirt_4.9.0.bb
> rename to recipes-extended/libvirt/libvirt_5.3.0.bb
> index 813d95e..c54a99e 100644
> --- a/recipes-extended/libvirt/libvirt_4.9.0.bb
> +++ b/recipes-extended/libvirt/libvirt_5.3.0.bb
> @@ -38,8 +38,8 @@ SRC_URI = "
> http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
>             file://hook_support.py \
>            "
>
> -SRC_URI[libvirt.md5sum] = "aaf7b265ac2013d6eb184a86b5f7eeb9"
> -SRC_URI[libvirt.sha256sum] =
> "4fd4bfe7312b7996a817c7919cf0062de0d5b3c400c93bd30855a46c40dd455a"
> +SRC_URI[libvirt.md5sum] = "1cfaaf3717783ba19850b5ac04f7e76a"
> +SRC_URI[libvirt.sha256sum] =
> "8564bdd506817b3957fa67e4f06b217922d30f19e416c4dc620995fd155dc101"
>
>  inherit autotools gettext update-rc.d pkgconfig ptest systemd useradd
>  USERADD_PACKAGES = "${PN}"
> @@ -131,6 +131,7 @@ FILES_${PN} += "${libdir}/libvirt/connection-driver \
>             ${@bb.utils.contains('PACKAGECONFIG', 'polkit',
> '${datadir}/polkit-1', '', d)} \
>             ${datadir}/bash-completion/completions/vsh \
>             ${datadir}/bash-completion/completions/virt-admin \
> +           /usr/lib/firewalld/zones/libvirt.xml \
>             "
>
>  FILES_${PN}-dbg += "${libdir}/libvirt/connection-driver/.debug
> ${libdir}/libvirt/lock-driver/.debug"
> @@ -182,7 +183,7 @@ PRIVATE_LIBS_${PN}-ptest = " \
>  #PACKAGECONFIG ??= "xen libxl xen-inotify test remote libvirtd"
>
>  # full config
> -PACKAGECONFIG ??= "qemu yajl uml openvz vmware vbox esx iproute2 lxc test
> \
> +PACKAGECONFIG ??= "qemu yajl openvz vmware vbox esx iproute2 lxc test \
>                     remote macvtap libvirtd netcf udev python ebtables \
>                     fuse iproute2 firewalld libpcap \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux',
> 'selinux audit libcap-ng', '', d)} \
> @@ -201,7 +202,6 @@ PACKAGECONFIG[qemu] = "--with-qemu
> --with-qemu-user=qemu --with-qemu-group=qemu,
>  PACKAGECONFIG[yajl] = "--with-yajl,--without-yajl,yajl,yajl"
>  PACKAGECONFIG[xenapi] = "--with-xenapi,--without-xenapi,,"
>  PACKAGECONFIG[libxl] =
> "--with-libxl=${STAGING_DIR_TARGET}/lib,--without-libxl,xen,"
> -PACKAGECONFIG[uml] = "--with-uml, --without-uml,,"
>  PACKAGECONFIG[openvz] = "--with-openvz,--without-openvz,,"
>  PACKAGECONFIG[vmware] = "--with-vmware,--without-vmware,,"
>  PACKAGECONFIG[phyp] = "--with-phyp,--without-phyp,,"
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000009ec48a05888e9bdd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Ma=
y 9, 2019 at 5:53 AM Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.co=
m">dengke.du@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">1. remove the uml configure option because new ve=
rsion libvirt drop it<br>
2. rebase three patches for new source codes<br>
<br>
Signed-off-by: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com" tar=
get=3D"_blank">dengke.du@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/libvirt/libvirt-python.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 4 +-<br>
=C2=A0.../libvirt/libvirt/install-missing-file.patch=C2=A0 =C2=A0 =C2=A0| 1=
7 +++----<br>
=C2=A0recipes-extended/libvirt/libvirt/runptest.patch=C2=A0 =C2=A0 | 56 +++=
+++++--------------<br>
=C2=A0...ibvirt-net-rpc-to-virt-host-validate-when.patch | 33 ++++++-------=
<br>
=C2=A0.../libvirt/{<a href=3D"http://libvirt_4.9.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">libvirt_4.9.0.bb</a> =3D&gt; <a href=3D"http://libvirt_5.3=
.0.bb" rel=3D"noreferrer" target=3D"_blank">libvirt_5.3.0.bb</a>} |=C2=A0 8=
 ++--<br>
=C2=A05 files changed, 52 insertions(+), 66 deletions(-)<br>
=C2=A0rename recipes-extended/libvirt/{<a href=3D"http://libvirt_4.9.0.bb" =
rel=3D"noreferrer" target=3D"_blank">libvirt_4.9.0.bb</a> =3D&gt; <a href=
=3D"http://libvirt_5.3.0.bb" rel=3D"noreferrer" target=3D"_blank">libvirt_5=
.3.0.bb</a>} (97%)<br>
<br>
diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended=
/libvirt/libvirt-python.inc<br>
index ae43ba8..9554328 100644<br>
--- a/recipes-extended/libvirt/libvirt-python.inc<br>
+++ b/recipes-extended/libvirt/libvirt-python.inc<br>
@@ -18,8 +18,8 @@ FILES_${PN}-python =3D &quot;${bindir}/* ${libdir}/* ${li=
bdir}/${PYTHON_DIR}/*&quot;<br>
=C2=A0SRC_URI +=3D &quot;<a href=3D"http://libvirt.org/sources/python/libvi=
rt-python-$%7BPV%7D.tar.gz;name=3Dlibvirt_python" rel=3D"noreferrer" target=
=3D"_blank">http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;n=
ame=3Dlibvirt_python</a>&quot;<br>
=C2=A0SRC_URI +=3D &quot;file://libvirt_api_xml_path.patch;patchdir=3D../li=
bvirt-python-${PV}&quot;<br>
<br>
-SRC_URI[libvirt_python.md5sum] =3D &quot;cba7dc90d564aa8c267c38d452b83f80&=
quot;<br>
-SRC_URI[libvirt_python.sha256sum] =3D &quot;01c4becf50b521a9e3d1b48a3a79d8=
3cb389d86d760b895d911d78f5b6ae7b60&quot;<br>
+SRC_URI[libvirt_python.md5sum] =3D &quot;b7e086e080e5681bece9e87db5a88afa&=
quot;<br>
+SRC_URI[libvirt_python.sha256sum] =3D &quot;5213f995cb55a2f770aa36704b6031=
3958c7ff1fde8cca39028ea889cc9f30ff&quot;<br>
<br>
=C2=A0export LIBVIRT_API_PATH =3D &quot;${S}/docs/libvirt-api.xml&quot;<br>
=C2=A0export LIBVIRT_CFLAGS =3D &quot;-I${S}/include&quot;<br>
diff --git a/recipes-extended/libvirt/libvirt/install-missing-file.patch b/=
recipes-extended/libvirt/libvirt/install-missing-file.patch<br>
index cb5a20e..94c7299 100644<br>
--- a/recipes-extended/libvirt/libvirt/install-missing-file.patch<br>
+++ b/recipes-extended/libvirt/libvirt/install-missing-file.patch<br>
@@ -1,6 +1,6 @@<br>
-From 0780181a3285511f166487a54ebc231fc657edfe Mon Sep 17 00:00:00 2001<br>
-From: Catalin Enache &lt;<a href=3D"mailto:catalin.enache@windriver.com" t=
arget=3D"_blank">catalin.enache@windriver.com</a>&gt;<br>
-Date: Mon, 25 Jul 2016 16:38:51 +0300<br>
+From 4aea9dbeb7f7990ac5a2227d80251570b4a5bca1 Mon Sep 17 00:00:00 2001<br>
+From: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com" target=3D"_=
blank">dengke.du@windriver.com</a>&gt;<br>
+Date: Wed, 8 May 2019 17:24:17 +0800<br>
=C2=A0Subject: [PATCH] Install missing conf file<br>
<br>
=C2=A0openvzutilstest.conf file is needed by openvzutilstest test.<br>
@@ -12,15 +12,17 @@ Signed-off-by: Catalin Enache &lt;<a href=3D"mailto:cat=
alin.enache@windriver.com" target=3D"_blank">catalin.enache@windriver.com</=
a>&gt;<br>
=C2=A0Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com"=
 target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
=C2=A0[MA: Update context for v4.3.0]<br>
=C2=A0Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@=
windriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;<br>
+[DDU: Update context for v5.3.0]<br>
+Signed-off-by: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com" ta=
rget=3D"_blank">dengke.du@windriver.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 tests/Makefile.am | 4 +++-<br>
=C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/tests/Makefile.am b/tests/Makefile.am<br>
-index 65f776e..8a6fd44 100644<br>
+index 7d0387e..68c3561 100644<br>
=C2=A0--- a/tests/Makefile.am<br>
=C2=A0+++ b/tests/Makefile.am<br>
-@@ -173,6 +173,7 @@ EXTRA_DIST =3D \<br>
+@@ -168,6 +168,7 @@ EXTRA_DIST =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(NULL)<br>
<br>
=C2=A0 test_helpers =3D commandhelper ssh<br>
@@ -28,7 +30,7 @@ index 65f776e..8a6fd44 100644<br>
=C2=A0 test_programs =3D virshtest sockettest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 virhostcputest virbuftest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 commandtest seclabeltest \<br>
-@@ -305,6 +306,7 @@ endif WITH_LXC<br>
+@@ -303,6 +304,7 @@ endif WITH_LXC<br>
<br>
=C2=A0 if WITH_OPENVZ<br>
=C2=A0 test_programs +=3D openvzutilstest<br>
@@ -36,7 +38,7 @@ index 65f776e..8a6fd44 100644<br>
=C2=A0 endif WITH_OPENVZ<br>
<br>
=C2=A0 if WITH_ESX<br>
-@@ -1488,7 +1490,7 @@ endif ! WITH_CIL<br>
+@@ -1539,7 +1541,7 @@ endif ! WITH_CIL<br>
<br>
=C2=A0 buildtest-TESTS: $(TESTS) $(test_libraries) $(test_helpers)<br>
<br>
@@ -45,7 +47,6 @@ index 65f776e..8a6fd44 100644<br>
<br>
=C2=A0 install-ptest:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 list=3D&#39;$(TESTS) $(test_helpers) test-lib.s=
h virschematest&#39;<br>
-<br>
=C2=A0-- <br>
=C2=A02.7.4<br>
<br>
diff --git a/recipes-extended/libvirt/libvirt/runptest.patch b/recipes-exte=
nded/libvirt/libvirt/runptest.patch<br>
index 457e821..bc97ba6 100644<br>
--- a/recipes-extended/libvirt/libvirt/runptest.patch<br>
+++ b/recipes-extended/libvirt/libvirt/runptest.patch<br>
@@ -1,7 +1,7 @@<br>
-From 94478517c4f9950b28be3a348387db6ede3db812 Mon Sep 17 00:00:00 2001<br>
-From: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windriver.com"=
 target=3D"_blank">mark.asselstine@windriver.com</a>&gt;<br>
-Date: Mon, 4 Jun 2018 11:55:37 -0400<br>
-Subject: [PATCH] Add &#39;install-ptest&#39; rule.<br>
+From 52fc46b4f8cfd36476f59c0796f4f39686b53953 Mon Sep 17 00:00:00 2001<br>
+From: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com" target=3D"_=
blank">dengke.du@windriver.com</a>&gt;<br>
+Date: Wed, 8 May 2019 10:20:47 +0800<br>
+Subject: [PATCH] Add &#39;install-ptest&#39; rule<br>
<br>
=C2=A0Change TESTS_ENVIRONMENT to allow running outside build dir.<br>
<br>
@@ -15,15 +15,17 @@ Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:ma=
rk.asselstine@windriver.com" target=3D"_blank">mark.asselstine@windriver.co=
m</a>&gt;<br>
=C2=A0Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com" tar=
get=3D"_blank">zhe.he@windriver.com</a>&gt;<br>
=C2=A0[MA: Update context for v4.3.0]<br>
=C2=A0Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@=
windriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;<br>
+[DDU: Update context for v5.3.0]<br>
+Signed-off-by: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com" ta=
rget=3D"_blank">dengke.du@windriver.com</a>&gt;<br>
=C2=A0---<br>
- tests/Makefile.am | 74 +++++++++++++++++++++++++++++++++++++++++++++-----=
-----<br>
- 1 file changed, 61 insertions(+), 13 deletions(-)<br>
+ tests/Makefile.am | 68 ++++++++++++++++++++++++++++++++++++++++++++++++--=
-----<br>
+ 1 file changed, 60 insertions(+), 8 deletions(-)<br>
<br>
=C2=A0diff --git a/tests/Makefile.am b/tests/Makefile.am<br>
-index 7b93fbd..edc1eb9 100644<br>
+index 46d94d2..7d0387e 100644<br>
=C2=A0--- a/tests/Makefile.am<br>
=C2=A0+++ b/tests/Makefile.am<br>
-@@ -35,11 +35,13 @@ INCLUDES =3D \<br>
+@@ -29,11 +29,13 @@ AM_CPPFLAGS =3D \<br>
<br>
=C2=A0 WARN_CFLAGS +=3D $(RELAXED_FRAME_LIMIT_CFLAGS)<br>
<br>
@@ -31,50 +33,32 @@ index 7b93fbd..edc1eb9 100644<br>
=C2=A0+<br>
=C2=A0 AM_CFLAGS =3D \<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 -Dabs_builddir=3D&quot;\&quot;$(abs_builddir)\&=
quot;&quot; \<br>
--=C2=A0 =C2=A0 =C2=A0 -Dabs_topbuilddir=3D&quot;\&quot;$(abs_topbuilddir)\=
&quot;&quot; \<br>
+-=C2=A0 =C2=A0 =C2=A0 -Dabs_top_builddir=3D&quot;\&quot;$(abs_top_builddir=
)\&quot;&quot; \<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 -Dabs_srcdir=3D&quot;\&quot;$(abs_srcdir)\&quot=
;&quot; \<br>
--=C2=A0 =C2=A0 =C2=A0 -Dabs_topsrcdir=3D&quot;\&quot;$(abs_topsrcdir)\&quo=
t;&quot; \<br>
+-=C2=A0 =C2=A0 =C2=A0 -Dabs_top_srcdir=3D&quot;\&quot;$(abs_top_srcdir)\&q=
uot;&quot; \<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 -Dabs_builddir=3D&quot;\&quot;$(PTEST_DIR)/test=
s\&quot;&quot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 -Dabs_topbuilddir=3D&quot;\&quot;$(PTEST_DIR)\&quot;=
&quot; \<br>
++=C2=A0 =C2=A0 =C2=A0 -Dabs_top_builddir=3D&quot;\&quot;$(PTEST_DIR)\&quot=
;&quot; \<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 -Dabs_srcdir=3D&quot;\&quot;$(PTEST_DIR)/tests\=
&quot;&quot; \<br>
-+=C2=A0 =C2=A0 =C2=A0 -Dabs_topsrcdir=3D&quot;\&quot;$(PTEST_DIR)\&quot;&q=
uot; \<br>
++=C2=A0 =C2=A0 =C2=A0 -Dabs_top_srcdir=3D&quot;\&quot;$(PTEST_DIR)\&quot;&=
quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(LIBXML_CFLAGS) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(LIBNL_CFLAGS) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(GNUTLS_CFLAGS) \<br>
-@@ -64,7 +66,7 @@ QEMULIB_LDFLAGS =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(MINGW_EXTRA_LDFLAGS)<br>
+@@ -465,10 +467,10 @@ TESTS =3D $(test_programs) \<br>
<br>
- INCLUDES +=3D \<br>
--=C2=A0 =C2=A0 =C2=A0 -DTEST_DRIVER_DIR=3D\&quot;$(top_builddir)/src/.libs=
\&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 -DTEST_DRIVER_DIR=3D\&quot;$(PTEST_DIR)/src/.libs\&q=
uot;<br>
- <br>
- PROBES_O =3D<br>
- if WITH_DTRACE_PROBES<br>
-@@ -466,17 +468,15 @@ TESTS =3D $(test_programs) \<br>
- # Also, BSD sh doesn&#39;t like &#39;a=3Db b=3D$$a&#39;, so we can&#39;t =
use an<br>
- # intermediate shell variable, but must do all the expansion in make<br>
- <br>
--lv_abs_top_builddir=3D$(shell cd &#39;$(top_builddir)&#39; &amp;&amp; pwd=
)<br>
--<br>
=C2=A0 VIR_TEST_EXPENSIVE ?=3D $(VIR_TEST_EXPENSIVE_DEFAULT)<br>
=C2=A0 TESTS_ENVIRONMENT =3D \<br>
--=C2=A0 abs_top_builddir=3D$(lv_abs_top_builddir) \<br>
--=C2=A0 abs_top_srcdir=3D`cd &#39;$(top_srcdir)&#39;; pwd` \<br>
--=C2=A0 abs_builddir=3D$(abs_builddir) \<br>
--=C2=A0 abs_srcdir=3D$(abs_srcdir) \<br>
--=C2=A0 CONFIG_HEADER=3D&quot;$(lv_abs_top_builddir)/config.h&quot; \<br>
+-=C2=A0 abs_top_builddir=3D&quot;$(abs_top_builddir)&quot; \<br>
+-=C2=A0 abs_top_srcdir=3D&quot;$(abs_top_srcdir)&quot; \<br>
+-=C2=A0 abs_builddir=3D&quot;$(abs_builddir)&quot; \<br>
+-=C2=A0 abs_srcdir=3D&quot;$(abs_srcdir)&quot; \<br>
=C2=A0+=C2=A0 abs_top_builddir=3D&quot;$(PTEST_DIR)&quot; \<br>
=C2=A0+=C2=A0 abs_top_srcdir=3D&quot;$(PTEST_DIR)&quot; \<br>
=C2=A0+=C2=A0 abs_builddir=3D&quot;$(PTEST_DIR)/tests&quot; \<br>
=C2=A0+=C2=A0 abs_srcdir=3D&quot;$(PTEST_DIR)/tests&quot; \<br>
-+=C2=A0 CONFIG_HEADER=3D&quot;$(PTEST_DIR)/config.h&quot; \<br>
=C2=A0 =C2=A0 SHELL=3D&quot;$(SHELL)&quot; \<br>
--=C2=A0 LIBVIRT_DRIVER_DIR=3D&quot;$(lv_abs_top_builddir)/src/.libs&quot; =
\<br>
-+=C2=A0 LIBVIRT_DRIVER_DIR=3D&quot;$(PTEST_DIR)/src/.libs&quot; \<br>
=C2=A0 =C2=A0 LIBVIRT_AUTOSTART=3D0 \<br>
=C2=A0 =C2=A0 LC_ALL=3DC \<br>
-=C2=A0 =C2=A0VIR_TEST_EXPENSIVE=3D$(VIR_TEST_EXPENSIVE) \<br>
-@@ -1486,5 +1486,55 @@ else ! WITH_CIL<br>
+@@ -1535,5 +1537,55 @@ else ! WITH_CIL<br>
=C2=A0 EXTRA_DIST +=3D <a href=3D"http://objectlocking.ml" rel=3D"noreferre=
r" target=3D"_blank">objectlocking.ml</a><br>
=C2=A0 endif ! WITH_CIL<br>
<br>
diff --git a/recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-=
virt-host-validate-when.patch b/recipes-extended/libvirt/libvirt/tools-add-=
libvirt-net-rpc-to-virt-host-validate-when.patch<br>
index 5f6f950..d49776c 100644<br>
--- a/recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-virt-ho=
st-validate-when.patch<br>
+++ b/recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-virt-ho=
st-validate-when.patch<br>
@@ -1,6 +1,6 @@<br>
-From f73c5c61c921bf773dcba5e4234e23afce5dbe7f Mon Sep 17 00:00:00 2001<br>
-From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windriver.com" t=
arget=3D"_blank">bruce.ashfield@windriver.com</a>&gt;<br>
-Date: Fri, 2 Aug 2013 11:38:43 -0400<br>
+From ae4b40a1b3cb63a322716b6ad1762d53ada249e1 Mon Sep 17 00:00:00 2001<br>
+From: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com" target=3D"_=
blank">dengke.du@windriver.com</a>&gt;<br>
+Date: Tue, 7 May 2019 15:26:32 +0800<br>
=C2=A0Subject: [PATCH] tools: add libvirt-net-rpc to virt-host-validate whe=
n TLS is<br>
=C2=A0 enabled<br>
<br>
@@ -13,17 +13,19 @@ Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bru=
ce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@windriver.com</=
a>&gt;<br>
=C2=A0Signed-off-by: Yunguo Wei &lt;<a href=3D"mailto:yunguo.wei@windriver.=
com" target=3D"_blank">yunguo.wei@windriver.com</a>&gt;<br>
=C2=A0[MA: rebase to v4.3.0]<br>
=C2=A0Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@=
windriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;<br>
+[ddu: rebase to v5.3.0]<br>
+Signed-off-by: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com" ta=
rget=3D"_blank">dengke.du@windriver.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 examples/Makefile.am | 19 +++++++++++++++++++<br>
- tools/Makefile.am=C2=A0 =C2=A0 | 13 +++++++++++++<br>
- 2 files changed, 32 insertions(+)<br>
+ tools/Makefile.am=C2=A0 =C2=A0 | 12 ++++++++++++<br>
+ 2 files changed, 31 insertions(+)<br>
<br>
=C2=A0diff --git a/examples/Makefile.am b/examples/Makefile.am<br>
-index 7069d74..c8893e3 100644<br>
+index ee7d3e6..7a5fd73 100644<br>
=C2=A0--- a/examples/Makefile.am<br>
=C2=A0+++ b/examples/Makefile.am<br>
-@@ -39,6 +39,10 @@ LDADD =3D $(STATIC_BINARIES) $(WARN_CFLAGS) $(COVERAGE_=
LDFLAGS) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(top_builddir)/src/<a href=3D"http://libvirt.l=
a" rel=3D"noreferrer" target=3D"_blank">libvirt.la</a> $(top_builddir)/gnul=
ib/lib/<a href=3D"http://libgnu.la" rel=3D"noreferrer" target=3D"_blank">li=
bgnu.la</a> \<br>
+@@ -34,6 +34,10 @@ LDADD =3D $(STATIC_BINARIES) $(WARN_CFLAGS) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(top_builddir)/src/<a href=3D"http://libvirt.l=
a" rel=3D"noreferrer" target=3D"_blank">libvirt.la</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(top_builddir)/src/<a href=3D"http://libvirt-a=
dmin.la" rel=3D"noreferrer" target=3D"_blank">libvirt-admin.la</a><br>
<br>
=C2=A0+if WITH_GNUTLS<br>
@@ -33,7 +35,7 @@ index 7069d74..c8893e3 100644<br>
=C2=A0 noinst_PROGRAMS=3Ddominfo/info1 dommigrate/dommigrate domsuspend/sus=
pend \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 domtop/domtop hellolibvirt/hellolibvirt object-=
events/event-test \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 openauth/openauth rename/rename admin/list_serv=
ers admin/list_clients \<br>
-@@ -70,6 +74,21 @@ admin_logging_SOURCES =3D admin/logging.c<br>
+@@ -65,6 +69,21 @@ admin_logging_SOURCES =3D admin/logging.c<br>
=C2=A0 INSTALL_DATA_LOCAL =3D<br>
=C2=A0 UNINSTALL_LOCAL =3D<br>
<br>
@@ -52,14 +54,14 @@ index 7069d74..c8893e3 100644<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(NULL)<br>
=C2=A0+endif<br>
=C2=A0+<br>
- if WITH_APPARMOR_PROFILES<br>
- apparmordir =3D $(sysconfdir)/apparmor.d/<br>
- apparmor_DATA =3D \<br>
+ if WITH_NWFILTER<br>
+ NWFILTER_DIR =3D &quot;$(DESTDIR)$(sysconfdir)/libvirt/nwfilter&quot;<br>
+ <br>
=C2=A0diff --git a/tools/Makefile.am b/tools/Makefile.am<br>
-index 1452d98..204e772 100644<br>
+index c6064de..1ac8445 100644<br>
=C2=A0--- a/tools/Makefile.am<br>
=C2=A0+++ b/tools/Makefile.am<br>
-@@ -188,6 +188,13 @@ virt_host_validate_LDADD =3D \<br>
+@@ -188,6 +188,12 @@ virt_host_validate_LDADD =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ../gnulib/lib/<a hr=
ef=3D"http://libgnu.la" rel=3D"noreferrer" target=3D"_blank">libgnu.la</a> =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(NULL)<br>
<br>
@@ -69,11 +71,10 @@ index 1452d98..204e772 100644<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(NULL)<br>
=C2=A0+endif<br>
=C2=A0+<br>
-+<br>
=C2=A0 virt_host_validate_CFLAGS =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(AM_CFLAGS) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(NULL)<br>
-@@ -268,6 +275,12 @@ virt_admin_CFLAGS =3D \<br>
+@@ -265,6 +271,12 @@ virt_admin_CFLAGS =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(READLINE_CFLAGS)<=
br>
=C2=A0 BUILT_SOURCES =3D<br>
<br>
diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_4.9.0.bb" r=
el=3D"noreferrer" target=3D"_blank">libvirt_4.9.0.bb</a> b/recipes-extended=
/libvirt/<a href=3D"http://libvirt_5.3.0.bb" rel=3D"noreferrer" target=3D"_=
blank">libvirt_5.3.0.bb</a><br>
similarity index 97%<br>
rename from recipes-extended/libvirt/<a href=3D"http://libvirt_4.9.0.bb" re=
l=3D"noreferrer" target=3D"_blank">libvirt_4.9.0.bb</a><br>
rename to recipes-extended/libvirt/<a href=3D"http://libvirt_5.3.0.bb" rel=
=3D"noreferrer" target=3D"_blank">libvirt_5.3.0.bb</a><br>
index 813d95e..c54a99e 100644<br>
--- a/recipes-extended/libvirt/<a href=3D"http://libvirt_4.9.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_4.9.0.bb</a><br>
+++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_5.3.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_5.3.0.bb</a><br>
@@ -38,8 +38,8 @@ SRC_URI =3D &quot;<a href=3D"http://libvirt.org/sources/l=
ibvirt-$%7BPV%7D.tar.xz;name=3Dlibvirt" rel=3D"noreferrer" target=3D"_blank=
">http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=3Dlibvirt</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://hook_support.py \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-SRC_URI[libvirt.md5sum] =3D &quot;aaf7b265ac2013d6eb184a86b5f7eeb9&quot;<b=
r>
-SRC_URI[libvirt.sha256sum] =3D &quot;4fd4bfe7312b7996a817c7919cf0062de0d5b=
3c400c93bd30855a46c40dd455a&quot;<br>
+SRC_URI[libvirt.md5sum] =3D &quot;1cfaaf3717783ba19850b5ac04f7e76a&quot;<b=
r>
+SRC_URI[libvirt.sha256sum] =3D &quot;8564bdd506817b3957fa67e4f06b217922d30=
f19e416c4dc620995fd155dc101&quot;<br>
<br>
=C2=A0inherit autotools gettext update-rc.d pkgconfig ptest systemd useradd=
<br>
=C2=A0USERADD_PACKAGES =3D &quot;${PN}&quot;<br>
@@ -131,6 +131,7 @@ FILES_${PN} +=3D &quot;${libdir}/libvirt/connection-dri=
ver \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;PACKAGE=
CONFIG&#39;, &#39;polkit&#39;, &#39;${datadir}/polkit-1&#39;, &#39;&#39;, d=
)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/bash-completion/comple=
tions/vsh \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/bash-completion/comple=
tions/virt-admin \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/lib/firewalld/zones/libvirt.=
xml \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0FILES_${PN}-dbg +=3D &quot;${libdir}/libvirt/connection-driver/.debug=
 ${libdir}/libvirt/lock-driver/.debug&quot;<br>
@@ -182,7 +183,7 @@ PRIVATE_LIBS_${PN}-ptest =3D &quot; \<br>
=C2=A0#PACKAGECONFIG ??=3D &quot;xen libxl xen-inotify test remote libvirtd=
&quot;<br>
<br>
=C2=A0# full config<br>
-PACKAGECONFIG ??=3D &quot;qemu yajl uml openvz vmware vbox esx iproute2 lx=
c test \<br>
+PACKAGECONFIG ??=3D &quot;qemu yajl openvz vmware vbox esx iproute2 lxc te=
st \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remot=
e macvtap libvirtd netcf udev python ebtables \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fuse =
iproute2 firewalld libpcap \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;selinux&#39;, &#39;selinux =
audit libcap-ng&#39;, &#39;&#39;, d)} \<br>
@@ -201,7 +202,6 @@ PACKAGECONFIG[qemu] =3D &quot;--with-qemu --with-qemu-u=
ser=3Dqemu --with-qemu-group=3Dqemu,<br>
=C2=A0PACKAGECONFIG[yajl] =3D &quot;--with-yajl,--without-yajl,yajl,yajl&qu=
ot;<br>
=C2=A0PACKAGECONFIG[xenapi] =3D &quot;--with-xenapi,--without-xenapi,,&quot=
;<br>
=C2=A0PACKAGECONFIG[libxl] =3D &quot;--with-libxl=3D${STAGING_DIR_TARGET}/l=
ib,--without-libxl,xen,&quot;<br>
-PACKAGECONFIG[uml] =3D &quot;--with-uml, --without-uml,,&quot;<br>
=C2=A0PACKAGECONFIG[openvz] =3D &quot;--with-openvz,--without-openvz,,&quot=
;<br>
=C2=A0PACKAGECONFIG[vmware] =3D &quot;--with-vmware,--without-vmware,,&quot=
;<br>
=C2=A0PACKAGECONFIG[phyp] =3D &quot;--with-phyp,--without-phyp,,&quot;<br>
-- <br>
2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div>

--0000000000009ec48a05888e9bdd--
