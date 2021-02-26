Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.14857.1614368818507088937
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 26 Feb 2021 11:46:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=laYKN4pp;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id x20so10886643oie.11
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 26 Feb 2021 11:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rN35coY1THCNL917rW0lcqQOMIIXQUnwl4CUNaYg0x8=;
        b=laYKN4ppz2o0n7qNc9xl1aReJzsRH4lH9/BvyrR2C1X2xwlZPHlJdROIsQlOPE+LiJ
         oraMue+wRGH5V4cZsUWaYjROPTZq2DdIuPWc4BYVKmgANSd1E28tl31K0aDudU3FELRR
         TtJjPsll8zb02/UBMb+WEegrDNaw0RGvkS9A1twAMEYQrA6dziQwMx0SrNam3A2HYzDB
         6BxluIaNPD2wA8hwFQUhl/idnzbck+8YBMmsWcTGmGHp9uNmV4m9yGiU2IJVCc7C+ZEs
         iIyLtnHAvENkaKzMLLvvfH/Vp2USWYTUjgfNBBvvpUpGXIrIeS/Du95ca68F0N/AJtzh
         P51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rN35coY1THCNL917rW0lcqQOMIIXQUnwl4CUNaYg0x8=;
        b=NNwv0VTTdXEZ9G9EMS0vvmn4+Er5kjtvE4cBYXaKmfNhPDYhRtIb0vUtRs/Hahx6do
         /3HUzpJUk5RjL1dtisX9SYOSoQS9r9/CNDPmnuIXNt7+GdlyW7tmtnczLQyacq/sc8PD
         bdgRe4MA1Ei2sNPu2PqIeMlP97e6lc9mqa6kYsq+kK+NwScnHpcD4WhTTlhYYElkWN0z
         FR6bGwl0UNckoYC6/bobAnDtX3uY75YeUXHGb1xO2acqTdCxiPMBRCDYuUkU0Ux1Bd54
         LNFPUQQctUcDRXzymZLCCD698FqP8EsOCaddtpSVTOZSkDF9vtRZ0YjWcy2NGV5agP5o
         iL9A==
X-Gm-Message-State: AOAM532G9mPrLkXqor2NDOG+rTCgtjW3C3UQMweR5+yFWk4QhdqEzsA/
	rkiF0hsrmKUEX+w0nHqxVa5crqQ+kWnwpPeNswU=
X-Google-Smtp-Source: ABdhPJxgA1B6hOcI8vGFyCbiDR7D0lmecDKL/rPTFjgLrpWS2TKTMrN6I7AahLH+7M103lI+Am+hUuclXIrgHB2iUos=
X-Received: by 2002:aca:8cf:: with SMTP id 198mr3266459oii.152.1614368817695;
 Fri, 26 Feb 2021 11:46:57 -0800 (PST)
MIME-Version: 1.0
References: <7f53a8e6f74499215ec593993a00631049e05c8a.1613658838.git.bertrand.marquis@arm.com>
 <AM6PR08MB34614F21BA86DE2E60E51FCC92859@AM6PR08MB3461.eurprd08.prod.outlook.com>
In-Reply-To: <AM6PR08MB34614F21BA86DE2E60E51FCC92859@AM6PR08MB3461.eurprd08.prod.outlook.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Fri, 26 Feb 2021 11:46:46 -0800
Message-ID: <CACMJ4GbpzCnJbZJytnfFhfDaF2Jjsp2AaHKn8NW+LVNQmNdMrg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] xen: Bump SRCREV to 4.14.1 and current master
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 18, 2021 at 7:19 AM Diego Sueiro <diego.sueiro@arm.com> wrote:
>
> >-----Original Message-----
> >From: meta-virtualization@lists.yoctoproject.org <meta-
> >virtualization@lists.yoctoproject.org> On Behalf Of Bertrand Marquis via
> >lists.yoctoproject.org
> >Sent: 18 February 2021 15:05
> >To: meta-virtualization@lists.yoctoproject.org
> >Cc: nd <nd@arm.com>
> >Subject: [meta-virtualization] [PATCH] xen: Bump SRCREV to 4.14.1 and
> >current master
> >
> >Bump SRCREV version of xen recipes to use the latest 4.14 release
> >(4.14.1) and the current status of master.
> >
> >This allows to remove some patches related to gcc 10 support which have now
> >been merged in Xen.
> >
> >Xen-tools is modified to include the latest tools installed with Xen:
> >- a rename of the bash-completion,
> >- a new xl example,
> >- xen-access,
> >- xen-memshare (only available on x86).
> >
> >A new patch to fix python and pygrub is added as the makefiles have been
> >deeply modified in 4.15 which require a new patch (but doing the same).
> >
> >Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>
> Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

Apologies for my delay in looking at these - I am making my way to it
and will post an update by end of Monday.

Christopher

>
> >---
> > ...ython-pygrub-pass-DISTUTILS-xen-4.15.patch | 73
> >+++++++++++++++++++  ...ls-xenpmd-Fix-gcc10-snprintf-warning.patch | 60 ----
> >-----------  ...uild-temporarily-inhibit-Werror-4.14.patch | 26 -------
> > recipes-extended/xen/xen-tools.inc            | 14 ++++
> > recipes-extended/xen/xen-tools_4.14.bb        |  4 +-
> > recipes-extended/xen/xen-tools_git.bb         |  6 +-
> > recipes-extended/xen/xen_4.14.bb              |  2 +-
> > recipes-extended/xen/xen_git.bb               |  2 +-
> > 8 files changed, 92 insertions(+), 95 deletions(-)  create mode 100644 recipes-
> >extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch
> > delete mode 100644 recipes-extended/xen/files/0001-tools-xenpmd-Fix-
> >gcc10-snprintf-warning.patch
> > delete mode 100644 recipes-extended/xen/files/0001-xen-build-temporarily-
> >inhibit-Werror-4.14.patch
> >
> >diff --git a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-
> >xen-4.15.patch b/recipes-extended/xen/files/0001-python-pygrub-pass-
> >DISTUTILS-xen-4.15.patch
> >new file mode 100644
> >index 0000000..35cd9a8
> >--- /dev/null
> >+++ b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4
> >+++ .15.patch
> >@@ -0,0 +1,73 @@
> >+From 6db88791d923167f160afbcadeffad84a4cbdbc5 Mon Sep 17 00:00:00
> >2001
> >+Message-Id:
> >+<6db88791d923167f160afbcadeffad84a4cbdbc5.1612262706.git.bertrand.m
> >arqu
> >+is@arm.com>
> >+From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> >+Date: Fri, 19 Oct 2018 11:01:37 +0200
> >+Subject: [PATCH] python,pygrub: pass DISTUTILS env vars as setup.py
> >+args
> >+
> >+Upstream-Status: Xen: Inappropriate [oe specific, python install
> >+issues]
> >+
> >+Allow to respect the target install dir (PYTHON_SITEPACKAGES_DIR) as
> >+well as other parameters set by the OpenEmbedded build system.
> >+This is especially useful when the target libdir is not the default one
> >+(/usr/lib), but for example /usr/lib64.
> >+
> >+Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> >+
> >+Forward-ported to Xen 4.12.0
> >+Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> >+
> >+Modified to support pygrub installation with python 3
> >+Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> >+
> >+Forward-ported to Xen 4.14.0
> >+Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> >+
> >+Forward-ported to Xen 4.15.0
> >+Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >+
> >+---
> >+ tools/pygrub/Makefile | 7 +++++--
> >+ tools/python/Makefile | 2 +-
> >+ 2 files changed, 6 insertions(+), 3 deletions(-)
> >+
> >+diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile index
> >+37b2146214..ffb9270065 100644
> >+--- a/tools/pygrub/Makefile
> >++++ b/tools/pygrub/Makefile
> >+@@ -10,7 +10,7 @@ INSTALL_LOG = build/installed_files.txt
> >+ all: build
> >+ .PHONY: build
> >+ build:
> >+-     CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)"
> >LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py build
> >++     CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)"
> >++LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py build
> >++$(DISTUTILS_BUILD_ARGS)
> >+
> >+ .PHONY: install
> >+ install: all
> >+@@ -18,7 +18,10 @@ install: all
> >+      CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)" \
> >+              LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py install \
> >+              --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
> >+-              --root="$(DESTDIR)" --install-scripts=$(LIBEXEC_BIN) --force
> >++              --root="$(DESTDIR)" --install-scripts=$(LIBEXEC_BIN) --force \
> >++              $(DISTUTILS_INSTALL_ARGS)
> >++     rm -f $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
> >++     $(INSTALL_PYTHON_PROG) src/pygrub
> >$(DESTDIR)/$(LIBEXEC_BIN)/pygrub
> >+      set -e; if [ $(bindir) != $(LIBEXEC_BIN) -a \
> >+                   "`readlink -f $(DESTDIR)/$(bindir)`" != \
> >+                   "`readlink -f $(LIBEXEC_BIN)`" ]; then \ diff --git
> >+a/tools/python/Makefile b/tools/python/Makefile index
> >+cc76423647..5cb11ae453 100644
> >+--- a/tools/python/Makefile
> >++++ b/tools/python/Makefile
> >+@@ -12,7 +12,7 @@ setup.py = CC="$(CC)" CFLAGS="$(PY_CFLAGS)"
> >LDSHARED="$(CC)" LDFLAGS="$(PY_LDFLA
> >+            SHLIB_libxenctrl="$(SHLIB_libxenctrl)" \
> >+            SHLIB_libxenguest="$(SHLIB_libxenguest)" \
> >+            SHLIB_libxenstore="$(SHLIB_libxenstore)" \
> >+-           $(PYTHON) setup.py
> >++           $(PYTHON) setup.py $(DISTUTILS_BUILD_ARGS)
> >+
> >+ .PHONY: build
> >+ build:
> >+--
> >+2.17.1
> >+
> >diff --git a/recipes-extended/xen/files/0001-tools-xenpmd-Fix-gcc10-snprintf-
> >warning.patch b/recipes-extended/xen/files/0001-tools-xenpmd-Fix-gcc10-
> >snprintf-warning.patch
> >deleted file mode 100644
> >index 0a136c9..0000000
> >--- a/recipes-extended/xen/files/0001-tools-xenpmd-Fix-gcc10-snprintf-
> >warning.patch
> >+++ /dev/null
> >@@ -1,60 +0,0 @@
> >-From 0dfddb2116e3757f77a691a3fe335173088d69dc Mon Sep 17 00:00:00
> >2001
> >-Message-Id:
> ><0dfddb2116e3757f77a691a3fe335173088d69dc.1604734077.git.bertrand.m
> >arquis@arm.com>
> >-From: Bertrand Marquis <bertrand.marquis@arm.com>
> >-Date: Thu, 15 Oct 2020 10:16:09 +0100
> >-Subject: [PATCH] tools/xenpmd: Fix gcc10 snprintf warning
> >-
> >-Add a check for snprintf return code and ignore the entry if we get an -error.
> >This should in fact never happen and is more a trick to make gcc -happy and
> >prevent compilation errors.
> >-
> >-This is solving the following gcc warning when compiling for arm32 host -
> >platforms with optimization activated:
> >-xenpmd.c:92:37: error: '%s' directive output may be truncated writing -
> >between 4 and 2147483645 bytes into a region of size 271 -[-Werror=format-
> >truncation=]
> >-
> >-This is also solving the following Debian bug:
> >-https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=970802
> >-
> >-Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >-Acked-by: Wei Liu <wl@xen.org>
> >----
> >-Upstream-status: Backport from 4.15
> >----
> >- tools/xenpmd/xenpmd.c | 9 +++++++--
> >- 1 file changed, 7 insertions(+), 2 deletions(-)
> >-
> >-diff --git a/tools/xenpmd/xenpmd.c b/tools/xenpmd/xenpmd.c -index
> >35fd1c931a..12b82cf43e 100644
> >---- a/tools/xenpmd/xenpmd.c
> >-+++ b/tools/xenpmd/xenpmd.c
> >-@@ -102,6 +102,7 @@ FILE *get_next_battery_file(DIR *battery_dir,
> >-     FILE *file = 0;
> >-     struct dirent *dir_entries;
> >-     char file_name[284];
> >-+    int ret;
> >-
> >-     do
> >-     {
> >-@@ -111,11 +112,15 @@ FILE *get_next_battery_file(DIR *battery_dir,
> >-         if ( strlen(dir_entries->d_name) < 4 )
> >-             continue;
> >-         if ( battery_info_type == BIF )
> >--            snprintf(file_name, sizeof(file_name), BATTERY_INFO_FILE_PATH,
> >-+            ret = snprintf(file_name, sizeof(file_name),
> >-+ BATTERY_INFO_FILE_PATH,
> >-                      dir_entries->d_name);
> >-         else
> >--            snprintf(file_name, sizeof(file_name), BATTERY_STATE_FILE_PATH,
> >-+            ret = snprintf(file_name, sizeof(file_name),
> >-+ BATTERY_STATE_FILE_PATH,
> >-                      dir_entries->d_name);
> >-+        /* This should not happen but is needed to pass gcc checks */
> >-+        if (ret < 0)
> >-+            continue;
> >-+        file_name[sizeof(file_name) - 1] = '\0';
> >-         file = fopen(file_name, "r");
> >-     } while ( !file );
> >-
> >---
> >-2.17.1
> >-
> >diff --git a/recipes-extended/xen/files/0001-xen-build-temporarily-inhibit-
> >Werror-4.14.patch b/recipes-extended/xen/files/0001-xen-build-temporarily-
> >inhibit-Werror-4.14.patch
> >deleted file mode 100644
> >index 0e0a3dc..0000000
> >--- a/recipes-extended/xen/files/0001-xen-build-temporarily-inhibit-Werror-
> >4.14.patch
> >+++ /dev/null
> >@@ -1,26 +0,0 @@
> >-From 9cff3bf8425ccc593825fcde8ca5eaa32a43d04d Mon Sep 17 00:00:00
> >2001
> >-From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >-Date: Thu, 18 Jun 2020 09:05:22 -0400
> >-Subject: [PATCH] xen/build: temporarily inhibit Werror
> >-
> >-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com> -Rebased on Xen
> >4.14:
> >-Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> >----
> >- tools/libxl/Makefile | 2 +-
> >- xen/Rules.mk         | 2 +-
> >- 2 files changed, 2 insertions(+), 2 deletions(-)
> >-
> >-diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile -index
> >6da342ed61..c67560e269 100644
> >---- a/tools/libxl/Makefile
> >-+++ b/tools/libxl/Makefile
> >-@@ -11,7 +11,7 @@ MINOR = 0
> >- XLUMAJOR = 4.14
> >- XLUMINOR = 0
> >-
> >--CFLAGS += -Werror -Wno-format-zero-length -Wmissing-declarations \
> >-+CFLAGS += -Wno-format-zero-length -Wmissing-declarations \
> >-      -Wno-declaration-after-statement -Wformat-nonliteral
> >- CFLAGS += -I. -fPIC
> >-
> >diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-
> >tools.inc
> >index 0c69fec..722c503 100644
> >--- a/recipes-extended/xen/xen-tools.inc
> >+++ b/recipes-extended/xen/xen-tools.inc
> >@@ -234,6 +234,8 @@ PACKAGES = " \
> >     ${PN}-xl-examples \
> >     ${PN}-xm \
> >     ${PN}-xm-examples \
> >+    ${PN}-xen-access \
> >+    ${PN}-xen-memshare \
> >     "
> >
> > PROVIDES =+ " \
> >@@ -633,6 +635,7 @@ FILES_${PN}-xen-watchdog = "\
> >
> > FILES_${PN}-xl = "\
> >     ${sysconfdir}/bash_completion.d/xl.sh \
> >+    ${sysconfdir}/bash_completion.d/xl \
> >     ${sysconfdir}/xen/xl.conf \
> >     ${libdir}/xen/bin/libxl-save-helper \
> >     ${sbindir}/xl \
> >@@ -642,6 +645,7 @@ FILES_${PN}-xl = "\
> > FILES_${PN}-xl-examples = "\
> >     ${sysconfdir}/xen/xlexample.hvm \
> >     ${sysconfdir}/xen/xlexample.pvlinux \
> >+    ${sysconfdir}/xen/xlexample.pvhlinux \
> >     "
> >
> > FILES_${PN}-xm-examples = "\
> >@@ -692,6 +696,16 @@ FILES_${PN}-xendomains += "\
> >     ${sysconfdir}/sysconfig/xendomains \
> >     ${systemd_unitdir}/system/xendomains.service \
> >     "
> >+FILES_${PN}-xen-access += "\
> >+    ${sbindir}/xen-access \
> >+    "
> >+
> >+FILES_${PN}-xen-memshare += "\
> >+    ${sbindir}/xen-memshare \
> >+    "
> >+
> >+# memshare is only built for x86, so allow empty package for other
> >+archs ALLOW_EMPTY_${PN}-xen-memshare = "1"
> >
> > INSANE_SKIP_${PN} = "already-stripped"
> >
> >diff --git a/recipes-extended/xen/xen-tools_4.14.bb b/recipes-
> >extended/xen/xen-tools_4.14.bb
> >index 73a52bc..a79b41d 100644
> >--- a/recipes-extended/xen/xen-tools_4.14.bb
> >+++ b/recipes-extended/xen/xen-tools_4.14.bb
> >@@ -1,4 +1,4 @@
> >-SRCREV ?= "456957aaa1391e0dfa969e2dd97b87c51a79444e"
> >+SRCREV ?= "ad844aa352559a8b1f36e391a27d9d7dbddbdc36"
> >
> > XEN_REL ?= "4.14"
> > XEN_BRANCH ?= "stable-${XEN_REL}"
> >@@ -6,8 +6,6 @@ XEN_BRANCH ?= "stable-${XEN_REL}"
> > SRC_URI = " \
> >     git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
> >     file://0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch \
> >-    file://0001-xen-build-temporarily-inhibit-Werror-4.14.patch \
> >-    file://0001-tools-xenpmd-Fix-gcc10-snprintf-warning.patch \
> >     "
> >
> > LIC_FILES_CHKSUM ?=
> >"file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
> >diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-
> >extended/xen/xen-tools_git.bb
> >index 1f6be1d..71850ee 100644
> >--- a/recipes-extended/xen/xen-tools_git.bb
> >+++ b/recipes-extended/xen/xen-tools_git.bb
> >@@ -1,13 +1,11 @@
> >-SRCREV ?= "8c4532f19d6925538fb0c938f7de9a97da8c5c3b"
> >+SRCREV ?= "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
> >
> > XEN_REL ?= "4.15"
> > XEN_BRANCH ?= "master"
> >
> > SRC_URI = " \
> >     git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
> >-    file://0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch \
> >-    file://0001-xen-build-temporarily-inhibit-Werror-4.14.patch \
> >-    file://0001-tools-xenpmd-Fix-gcc10-snprintf-warning.patch \
> >+    file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
> >     "
> >
> > LIC_FILES_CHKSUM ?=
> >"file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
> >diff --git a/recipes-extended/xen/xen_4.14.bb b/recipes-
> >extended/xen/xen_4.14.bb
> >index 91e8988..653e3b6 100644
> >--- a/recipes-extended/xen/xen_4.14.bb
> >+++ b/recipes-extended/xen/xen_4.14.bb
> >@@ -1,4 +1,4 @@
> >-SRCREV ?= "456957aaa1391e0dfa969e2dd97b87c51a79444e"
> >+SRCREV ?= "ad844aa352559a8b1f36e391a27d9d7dbddbdc36"
> >
> > XEN_REL ?= "4.14"
> > XEN_BRANCH ?= "stable-${XEN_REL}"
> >diff --git a/recipes-extended/xen/xen_git.bb b/recipes-
> >extended/xen/xen_git.bb index 57791fc..2b62c5c 100644
> >--- a/recipes-extended/xen/xen_git.bb
> >+++ b/recipes-extended/xen/xen_git.bb
> >@@ -1,4 +1,4 @@
> >-SRCREV ?= "8c4532f19d6925538fb0c938f7de9a97da8c5c3b"
> >+SRCREV ?= "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
> >
> > XEN_REL ?= "4.15"
> > XEN_BRANCH ?= "master"
> >--
> >2.17.1
>
>
> 
>
