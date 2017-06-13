Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4B3FDE00ACF; Tue, 13 Jun 2017 15:22:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.182 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A6F5CE00888
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Jun 2017 15:22:19 -0700 (PDT)
Received: by mail-qk0-f182.google.com with SMTP id g83so13941835qkb.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Jun 2017 15:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+ksHHKV4R/MBIG9cKLeXc45E4bkJ9SUZYsHIw1CN/o4=;
	b=PGEUHLMEVVC9BL6VRrVgMJDi0yAuDi+QVojuUj54FsRxvtEZogDAZAiN1PIID746IF
	874HYW5zM0n4qNseLU650UsTFataG/W5iXB7lHvoaMy06ECgsHLCTSrLqTJDNwwHLN/Q
	k0sa4TJ3xE7lrlsXL1JBOTKNZHuu+GsFk9NJDMlLTVPirjrjR60asfRhQ88hFhtFoVkv
	mZrWZYNZqTakVZw85x2m4Q1imP35/GWOsrJ392lNqJJe/7+qz3VpMjNwy3Tb0fDFv81K
	0gZucifHysIxaJhdtRdEvuJpG3Nr/1NfvcpwbDhTzn0YjERAPODo2pZ6mWhDhZQdE0Rw
	dg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+ksHHKV4R/MBIG9cKLeXc45E4bkJ9SUZYsHIw1CN/o4=;
	b=E/yViIqydeVKaQEJwsUF7Wn1OvWTg0Auc2G4ynjea/jbqmBaGaAJOjSWBJLM6Pkl9l
	IglmFRzm1sLbI/24jJpHV8d0zIW7t+kzAUSJXNcVG5LxfUHMdOzKBjU1lv19Pm6ZTNcy
	XSCKBQBlKsYBqHu+62KEBURzMCnP0ADkfp9ofgZC1sLjz0J3J84n7+S9odvY4rbKGEF9
	fljSCHIRjA9u1vUmphDCg5YZ4BfMNiXCr4Wo1ePSvXaUulA1FEvrLtl2B8IOYjBl7TSf
	ystkklp6EiPDKhPGZGORZSWdCEpkBm1WNLv+tAh4TfH/EncMkQ3MRI+zaEhygQxwh6Lj
	ny+w==
X-Gm-Message-State: AKS2vOwiBf84Qp+D+g9RtBrMKEbnC9nJImoSy67XWV2IreWYBM+rHrKo
	u7BUzCvxIR/fvKZNo0wM2WDQhcc/Cg==
X-Received: by 10.55.50.203 with SMTP id y194mr3119889qky.40.1497392538440;
	Tue, 13 Jun 2017 15:22:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.209.28 with HTTP; Tue, 13 Jun 2017 15:22:17 -0700 (PDT)
In-Reply-To: <1496731614-17822-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1496731614-17822-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 14 Jun 2017 00:22:17 +0200
Message-ID: <CADkTA4M4zAVZbOABjSnc+wGaXFGLkPC6TU+x_n7YwOGdTtzBDQ@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2] lxc: 2.0.0 -> 2.0.8
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
X-List-Received-Date: Tue, 13 Jun 2017 22:22:23 -0000
Content-Type: multipart/alternative; boundary="001a114900c857d95a0551dedefb"

--001a114900c857d95a0551dedefb
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 6, 2017 at 8:46 AM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
wrote:

> 1)Upgrade lxc from 2.0.0 to 2.0.8.
>
> 2)Delete two patches, since it is integrated upstream.
>   Delete Generate-lxc-restore-net-properly.patch,this script has already
> been rearchitected out of existence by cba98d127bf490b018a016b792ae05
> fd2d29c5ee
>
>   Delete Use-AC_HEADER_MAJOR-to-detect-major-minor-makedev.patch,this
> script has already been rearchitected out of existence by
> af6824fce9c9536fbcabef8d5547f6c486f55fdf from git://github.com/lxc/lxc.git



Sorry for the delay on merging this, it would have been nice to see a log
about how this was tested, but since it is a dot release, and I've been a
bit slow in merging it .. I've gone ahead without that info.

Bruce


>
>
> 3)Modify two patches, since the data has been changed.
>   automake-ensure-VPATH-builds-correctly.patch
>   runtest.patch
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  .../files/Generate-lxc-restore-net-properly.patch  | 121
> ---------------------
>  ...EADER_MAJOR-to-detect-major-minor-makedev.patch | 119
> --------------------
>  .../automake-ensure-VPATH-builds-correctly.patch   |   2 +-
>  recipes-containers/lxc/files/runtest.patch         |   2 +-
>  .../lxc/{lxc_2.0.0.bb => lxc_2.0.8.bb}             |  31 +++---
>  5 files changed, 15 insertions(+), 260 deletions(-)
>  delete mode 100644 recipes-containers/lxc/files/Generate-lxc-restore-net-
> properly.patch
>  delete mode 100644 recipes-containers/lxc/files/
> Use-AC_HEADER_MAJOR-to-detect-major-minor-makedev.patch
>  rename recipes-containers/lxc/{lxc_2.0.0.bb => lxc_2.0.8.bb} (87%)
>
> diff --git a/recipes-containers/lxc/files/Generate-lxc-restore-net-properly.patch
> b/recipes-containers/lxc/files/Generate-lxc-restore-net-properly.patch
> deleted file mode 100644
> index 5adb730..0000000
> --- a/recipes-containers/lxc/files/Generate-lxc-restore-net-properly.patch
> +++ /dev/null
> @@ -1,121 +0,0 @@
> -From e08f3573b3561f1f0490624f7ca95b7ccd8157cb Mon Sep 17 00:00:00 2001
> -Message-Id: <e08f3573b3561f1f0490624f7ca95b7ccd8157cb.1435177418.git.
> Jim.Somerville@windriver.com>
> -From: Jim Somerville <Jim.Somerville@windriver.com>
> -Date: Wed, 24 Jun 2015 16:16:38 -0400
> -Subject: [PATCH 1/1] Generate lxc-restore-net properly
> -
> -It's a script that should be run through the configure
> -mechanism the same as the others.  We simply rename it
> -to have a .in extension and add it to configure.ac .
> -
> -Also, by generating the script from a .in file, it gets
> -placed into the build directory.  This plays nice with
> -build systems that keep the src separate from the build
> -directory.  Without this change, the install step won't
> -find the lxc-restore-net script as it still just resides
> -in the src directory and not in the build directory.
> -
> -Upstream-Status: Not applicable.  This script has already
> -been rearchitected out of existence by
> -cba98d127bf490b018a016b792ae05fd2d29c5ee:
> -"c/r: use criu option instead of lxc-restore-net
> -
> -As of criu 1.5, the --veth-pair argument supports an additional parameter
> that
> -is the bridge name to attach to. This enables us to get rid of the goofy
> -action-script hack that passed bridge names as environment variables.
> -
> -This patch is on top of the systemd/lxcfs mount rework patch, as we
> probably
> -want to wait to use 1.5 options until it has been out for a while and is
> in
> -distros.
> -
> -Signed-off-by: Tycho Andersen <tycho.andersen@canonical.com>
> -Acked-by: Serge E. Hallyn <serge.hallyn@ubuntu.com>"
> -
> -Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
> ----
> - configure.ac               |  1 +
> - src/lxc/lxc-restore-net    | 26 --------------------------
> - src/lxc/lxc-restore-net.in | 26 ++++++++++++++++++++++++++
> - 3 files changed, 27 insertions(+), 26 deletions(-)
> - delete mode 100755 src/lxc/lxc-restore-net
> - create mode 100755 src/lxc/lxc-restore-net.in
> -
> -diff --git a/configure.ac b/configure.ac
> -index 574b2cd..4972803 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -768,6 +768,7 @@ AC_CONFIG_FILES([
> -       src/lxc/legacy/lxc-ls
> -       src/lxc/lxc.functions
> -       src/lxc/version.h
> -+      src/lxc/lxc-restore-net
> -       src/python-lxc/Makefile
> -       src/python-lxc/setup.py
> -
> -diff --git a/src/lxc/lxc-restore-net b/src/lxc/lxc-restore-net
> -deleted file mode 100755
> -index 6ae3c19..0000000
> ---- a/src/lxc/lxc-restore-net
> -+++ /dev/null
> -@@ -1,26 +0,0 @@
> --#!/bin/sh
> --
> --set -e
> --
> --i=0
> --while true; do
> --      eval "bridge=\$LXC_CRIU_BRIDGE$i"
> --      eval "veth=\$LXC_CRIU_VETH$i"
> --
> --      if [ -z "$bridge" ] || [ -z "$veth" ]; then
> --              exit 0
> --      fi
> --
> --      if [ "$CRTOOLS_SCRIPT_ACTION" = "network-lock" ]; then
> --              brctl delif $bridge $veth
> --      fi
> --
> --      if [ "$CRTOOLS_SCRIPT_ACTION" = "network-unlock" ]; then
> --              brctl addif $bridge $veth
> --              ip link set dev $veth up
> --      fi
> --
> --      i=$((i+1))
> --done
> --
> --exit 1
> -diff --git a/src/lxc/lxc-restore-net.in b/src/lxc/lxc-restore-net.in
> -new file mode 100755
> -index 0000000..6ae3c19
> ---- /dev/null
> -+++ b/src/lxc/lxc-restore-net.in
> -@@ -0,0 +1,26 @@
> -+#!/bin/sh
> -+
> -+set -e
> -+
> -+i=0
> -+while true; do
> -+      eval "bridge=\$LXC_CRIU_BRIDGE$i"
> -+      eval "veth=\$LXC_CRIU_VETH$i"
> -+
> -+      if [ -z "$bridge" ] || [ -z "$veth" ]; then
> -+              exit 0
> -+      fi
> -+
> -+      if [ "$CRTOOLS_SCRIPT_ACTION" = "network-lock" ]; then
> -+              brctl delif $bridge $veth
> -+      fi
> -+
> -+      if [ "$CRTOOLS_SCRIPT_ACTION" = "network-unlock" ]; then
> -+              brctl addif $bridge $veth
> -+              ip link set dev $veth up
> -+      fi
> -+
> -+      i=$((i+1))
> -+done
> -+
> -+exit 1
> ---
> -1.8.3.2
> -
> diff --git a/recipes-containers/lxc/files/Use-AC_HEADER_MAJOR-to-
> detect-major-minor-makedev.patch b/recipes-containers/lxc/
> files/Use-AC_HEADER_MAJOR-to-detect-major-minor-makedev.patch
> deleted file mode 100644
> index f9cecc0..0000000
> --- a/recipes-containers/lxc/files/Use-AC_HEADER_MAJOR-to-
> detect-major-minor-makedev.patch
> +++ /dev/null
> @@ -1,119 +0,0 @@
> -From 5c957671a511441b112b137b88bf0b1f31adac20 Mon Sep 17 00:00:00 2001
> -From: Sergei Trofimovich <siarheit@google.com>
> -Date: Sat, 21 Jan 2017 11:57:13 +0000
> -Subject: [PATCH] Use AC_HEADER_MAJOR to detect major()/minor()/makedev()
> -
> -commit af6824fce9c9536fbcabef8d5547f6c486f55fdf from
> -git://github.com/lxc/lxc.git
> -
> -Before the change build failed on Gentoo as:
> -
> -  bdev/lxclvm.c: In function 'lvm_detect':
> -  bdev/lxclvm.c:140:4: error: implicit declaration of function 'major'
> [-Werror=implicit-function-declaration]
> -    major(statbuf.st_rdev), minor(statbuf.st_rdev));
> -    ^~~~~
> -  bdev/lxclvm.c:140:28: error: implicit declaration of function 'minor'
> [-Werror=implicit-function-declaration]
> -    major(statbuf.st_rdev), minor(statbuf.st_rdev));
> -                            ^~~~~
> -
> -glibc plans to remove <sys/sysmacros.h> from glibc's <sys/types.h>:
> -    https://sourceware.org/ml/libc-alpha/2015-11/msg00253.html
> -
> -Gentoo already applied glibc patch to experimental glibc-2.24
> -to start preparingfor the change.
> -
> -Autoconf has AC_HEADER_MAJOR to find out which header defines
> -reqiured macros:
> -    https://www.gnu.org/software/autoconf/manual/autoconf-2.69/
> html_node/Particular-Headers.html
> -
> -This change should also increase portability across other libcs.
> -
> -Bug: https://bugs.gentoo.org/604360
> -Signed-off-by: Sergei Trofimovich <siarheit@google.com>
> -Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ----
> - configure.ac           | 3 +++
> - src/lxc/bdev/lxclvm.c  | 9 +++++++++
> - src/lxc/conf.c         | 8 ++++++++
> - src/lxc/lxccontainer.c | 8 ++++++++
> - 4 files changed, 28 insertions(+)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 8f31c29..924baa1 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -601,6 +601,9 @@ AC_CHECK_DECLS([PR_CAPBSET_DROP], [], [], [#include
> <sys/prctl.h>])
> - # Check for some headers
> - AC_CHECK_HEADERS([sys/signalfd.h pty.h ifaddrs.h sys/capability.h
> sys/personality.h utmpx.h sys/timerfd.h])
> -
> -+# lookup major()/minor()/makedev()
> -+AC_HEADER_MAJOR
> -+
> - # Check for some syscalls functions
> - AC_CHECK_FUNCS([setns pivot_root sethostname unshare rand_r confstr
> faccessat])
> -
> -diff --git a/src/lxc/bdev/lxclvm.c b/src/lxc/bdev/lxclvm.c
> -index 3d41b10..419d1c2 100644
> ---- a/src/lxc/bdev/lxclvm.c
> -+++ b/src/lxc/bdev/lxclvm.c
> -@@ -32,10 +32,19 @@
> - #include <sys/wait.h>
> -
> - #include "bdev.h"
> -+#include "config.h"
> - #include "log.h"
> - #include "lxclvm.h"
> - #include "utils.h"
> -
> -+/* major()/minor() */
> -+#ifdef MAJOR_IN_MKDEV
> -+#    include <sys/mkdev.h>
> -+#endif
> -+#ifdef MAJOR_IN_SYSMACROS
> -+#    include <sys/sysmacros.h>
> -+#endif
> -+
> - lxc_log_define(lxclvm, lxc);
> -
> - extern char *dir_new_path(char *src, const char *oldname, const char
> *name,
> -diff --git a/src/lxc/conf.c b/src/lxc/conf.c
> -index 3b023ef..53406ca 100644
> ---- a/src/lxc/conf.c
> -+++ b/src/lxc/conf.c
> -@@ -39,6 +39,14 @@
> - #include <grp.h>
> - #include <time.h>
> -
> -+/* makedev() */
> -+#ifdef MAJOR_IN_MKDEV
> -+#    include <sys/mkdev.h>
> -+#endif
> -+#ifdef MAJOR_IN_SYSMACROS
> -+#    include <sys/sysmacros.h>
> -+#endif
> -+
> - #ifdef HAVE_STATVFS
> - #include <sys/statvfs.h>
> - #endif
> -diff --git a/src/lxc/lxccontainer.c b/src/lxc/lxccontainer.c
> -index 9f12ca2..aa02833 100644
> ---- a/src/lxc/lxccontainer.c
> -+++ b/src/lxc/lxccontainer.c
> -@@ -61,6 +61,14 @@
> - #include "utils.h"
> - #include "version.h"
> -
> -+/* major()/minor() */
> -+#ifdef MAJOR_IN_MKDEV
> -+#    include <sys/mkdev.h>
> -+#endif
> -+#ifdef MAJOR_IN_SYSMACROS
> -+#    include <sys/sysmacros.h>
> -+#endif
> -+
> - #if HAVE_IFADDRS_H
> - #include <ifaddrs.h>
> - #else
> ---
> -2.7.4
> -
> diff --git a/recipes-containers/lxc/files/automake-ensure-VPATH-builds-correctly.patch
> b/recipes-containers/lxc/files/automake-ensure-VPATH-
> builds-correctly.patch
> index 2b5c853..61c0e29 100644
> --- a/recipes-containers/lxc/files/automake-ensure-VPATH-
> builds-correctly.patch
> +++ b/recipes-containers/lxc/files/automake-ensure-VPATH-
> builds-correctly.patch
> @@ -15,7 +15,7 @@ index d74c10d..6225f78 100644
>  @@ -66,7 +66,7 @@ buildtest-TESTS: $(TESTS)
>   install-ptest:
>         install -d $(TEST_DIR)
> -       install -D ../lxc/liblxc.so $(TEST_DIR)/../lxc/liblxc.so
> +       install -D ../lxc/.libs/liblxc.so $(TEST_DIR)/../lxc/liblxc.so
>  -      install -D ../../config/test-driver $(TEST_DIR)/../../config/test-
> driver
>  +      install -D $(top_srcdir)/config/test-driver
> $(TEST_DIR)/../../config/test-driver
>         cp Makefile $(TEST_DIR)
> diff --git a/recipes-containers/lxc/files/runtest.patch
> b/recipes-containers/lxc/files/runtest.patch
> index e4e034b..6572265 100644
> --- a/recipes-containers/lxc/files/runtest.patch
> +++ b/recipes-containers/lxc/files/runtest.patch
> @@ -19,7 +19,7 @@ diff -uNr a/src/tests/Makefile.am b/src/tests/Makefile.am
>  +
>  +install-ptest:
>  +      install -d $(TEST_DIR)
> -+      install -D ../lxc/liblxc.so $(TEST_DIR)/../lxc/liblxc.so
> ++      install -D ../lxc/.libs/liblxc.so $(TEST_DIR)/../lxc/liblxc.so
>  +      install -D ../../config/test-driver $(TEST_DIR)/../../config/test-
> driver
>  +      cp Makefile $(TEST_DIR)
>  +      @(for file in $(TESTS); do install $$file $(TEST_DIR);  done;)
> diff --git a/recipes-containers/lxc/lxc_2.0.0.bb b/recipes-containers/lxc/
> lxc_2.0.8.bb
> similarity index 87%
> rename from recipes-containers/lxc/lxc_2.0.0.bb
> rename to recipes-containers/lxc/lxc_2.0.8.bb
> index c98d1a7..80c8da7 100644
> --- a/recipes-containers/lxc/lxc_2.0.0.bb
> +++ b/recipes-containers/lxc/lxc_2.0.8.bb
> @@ -2,7 +2,6 @@ DESCRIPTION = "lxc aims to use these new functionnalities
> to provide an userspac
>  SECTION = "console/utils"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> -PRIORITY = "optional"
>  DEPENDS = "libxml2 libcap"
>  RDEPENDS_${PN} = " \
>                 rsync \
> @@ -10,7 +9,6 @@ RDEPENDS_${PN} = " \
>                 libcap-bin \
>                 bridge-utils \
>                 dnsmasq \
> -               initscripts \
>                 perl-module-strict \
>                 perl-module-getopt-long \
>                 perl-module-vars \
> @@ -20,11 +18,7 @@ RDEPENDS_${PN} = " \
>                 perl-module-overload \
>                 perl-module-exporter-heavy \
>  "
> -RDEPENDS_${PN}_append_libc-glibc = "\
> -               glibc-utils \
> -"
> -
> -RDEPENDS_${PN}-ptest += "file make"
> +RDEPENDS_${PN}-ptest += "file make gmp nettle gnutls"
>
>  SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>         file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
> @@ -34,11 +28,10 @@ SRC_URI = "http://linuxcontainers.org/
> downloads/${BPN}-${PV}.tar.gz \
>         file://lxc-fix-B-S.patch \
>         file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
>         file://logs-optionally-use-base-filenames-to-report-src-fil.patch
> \
> -       file://Use-AC_HEADER_MAJOR-to-detect-major-minor-makedev.patch \
>         "
>
> -SRC_URI[md5sum] = "04a7245a614cd3296b0ae9ceeeb83fbb"
> -SRC_URI[sha256sum] = "5b737e114d8ef1feb193fba936d77a
> 5697a7c8a10199a068cdd90d1bd27c10e4"
> +SRC_URI[md5sum] = "7bfd95280522d7936c0979dfea92cdb5"
> +SRC_URI[sha256sum] = "0d8e34b302cfe4c40c6c9ae5097096
> aa5cc2c1dfceea3f0f22e3e16c4a4e8494"
>
>  S = "${WORKDIR}/${BPN}-${PV}"
>
> @@ -87,19 +80,21 @@ FILES_${PN}-doc = "${mandir} ${infodir}"
>  # For LXC the docdir only contains example configuration files and should
> be included in the lxc package
>  FILES_${PN} += "${docdir}"
>  FILES_${PN} += "${libdir}/python3*"
> -FILES_${PN} += "${datadir}/lua/*"
> -FILES_${PN} += "${libdir}/lua/lxc/*"
> -FILES_${PN}-dbg += "${libdir}/lua/lxc/.debug"
> -FILES_${PN}-dbg += "${libexecdir}/lxc/.debug ${libexecdir}/lxc/hooks/.
> debug"
> -PACKAGES =+ "${PN}-templates ${PN}-setup ${PN}-networking"
> +FILES_${PN} += "${datadir}/bash-completion"
> +FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
> +FILES_${PN}-dbg += "${libexecdir}/lxc/hooks/.debug"
> +PACKAGES =+ "${PN}-templates ${PN}-setup ${PN}-networking ${PN}-lua"
> +FILES_lua-${PN} = "${datadir}/lua ${libdir}/lua"
> +FILES_lua-${PN}-dbg += "${libdir}/lua/lxc/.debug"
>  FILES_${PN}-templates += "${datadir}/lxc/templates"
>  RDEPENDS_${PN}-templates += "bash"
>
>  ALLOW_EMPTY_${PN}-networking = "1"
>
> -FILES_${PN}-setup += "${sysconfdir}/tmpfiles.d"
> -FILES_${PN}-setup += "${systemd_system_unitdir}"
> -FILES_${PN}-setup += "${sysconfdir}/init.d"
> +FILES_${PN}-setup += "/etc/tmpfiles.d"
> +FILES_${PN}-setup += "/lib/systemd/system"
> +FILES_${PN}-setup += "/usr/lib/systemd/system"
> +FILES_${PN}-setup += "/etc/init.d"
>
>  PRIVATE_LIBS_${PN}-ptest = "liblxc.so.1"
>
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114900c857d95a0551dedefb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Jun 6, 2017 at 8:46 AM, Huang Qiyu <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:huangqy.fnst@cn.fujitsu.com" target=3D"_blank">huangqy.fnst@cn.=
fujitsu.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">1)Upgra=
de lxc from 2.0.0 to 2.0.8.<br>
<br>
2)Delete two patches, since it is integrated upstream.<br>
=C2=A0 Delete Generate-lxc-restore-net-<wbr>properly.patch,this script has =
already been rearchitected out of existence by cba98d127bf490b018a016b792ae=
05<wbr>fd2d29c5ee<br>
<br>
=C2=A0 Delete Use-AC_HEADER_MAJOR-to-detect-<wbr>major-minor-makedev.patch,=
this script has already been rearchitected out of existence by af6824fce9c9=
536fbcabef8d5547f6<wbr>c486f55fdf from git://<a href=3D"http://github.com/l=
xc/lxc.git" rel=3D"noreferrer" target=3D"_blank">github.com/lxc/lxc.git</a>=
</blockquote><div><br></div><div><br></div><div>Sorry for the delay on merg=
ing this, it would have been nice to see a log about how this was tested, b=
ut since it is a dot release, and I&#39;ve been a bit slow in merging it ..=
 I&#39;ve gone ahead without that info.</div><div><br></div><div>Bruce</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
3)Modify two patches, since the data has been changed.<br>
=C2=A0 automake-ensure-VPATH-builds-<wbr>correctly.patch<br>
=C2=A0 runtest.patch<br>
<br>
Signed-off-by: Huang Qiyu &lt;<a href=3D"mailto:huangqy.fnst@cn.fujitsu.com=
">huangqy.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../files/Generate-lxc-<wbr>restore-net-properly.patch=C2=A0 | 121 --=
-------------------<br>
=C2=A0...EADER_MAJOR-to-detect-<wbr>major-minor-makedev.patch | 119 -------=
-------------<br>
=C2=A0.../automake-ensure-VPATH-<wbr>builds-correctly.patch=C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0recipes-containers/lxc/files/<wbr>runtest.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../lxc/{<a href=3D"http://lxc_2.0.0.bb" rel=3D"noreferrer" target=3D=
"_blank">lxc_2.0.0.bb</a> =3D&gt; <a href=3D"http://lxc_2.0.8.bb" rel=3D"no=
referrer" target=3D"_blank">lxc_2.0.8.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 31 +++---<br>
=C2=A05 files changed, 15 insertions(+), 260 deletions(-)<br>
=C2=A0delete mode 100644 recipes-containers/lxc/files/<wbr>Generate-lxc-res=
tore-net-<wbr>properly.patch<br>
=C2=A0delete mode 100644 recipes-containers/lxc/files/<wbr>Use-AC_HEADER_MA=
JOR-to-detect-<wbr>major-minor-makedev.patch<br>
=C2=A0rename recipes-containers/lxc/{<a href=3D"http://lxc_2.0.0.bb" rel=3D=
"noreferrer" target=3D"_blank">lxc_2.<wbr>0.0.bb</a> =3D&gt; <a href=3D"htt=
p://lxc_2.0.8.bb" rel=3D"noreferrer" target=3D"_blank">lxc_2.0.8.bb</a>} (8=
7%)<br>
<br>
diff --git a/recipes-containers/lxc/<wbr>files/Generate-lxc-restore-<wbr>ne=
t-properly.patch b/recipes-containers/lxc/<wbr>files/Generate-lxc-restore-<=
wbr>net-properly.patch<br>
deleted file mode 100644<br>
index 5adb730..0000000<br>
--- a/recipes-containers/lxc/<wbr>files/Generate-lxc-restore-<wbr>net-prope=
rly.patch<br>
+++ /dev/null<br>
@@ -1,121 +0,0 @@<br>
-From e08f3573b3561f1f0490624f7ca95b<wbr>7ccd8157cb Mon Sep 17 00:00:00 200=
1<br>
-Message-Id: &lt;<a href=3D"mailto:e08f3573b3561f1f0490624f7ca95b7ccd8157cb=
.1435177418.git.Jim.Somerville@windriver.com">e08f3573b3561f1f0490624f7ca95=
<wbr>b7ccd8157cb.1435177418.git.<wbr>Jim.Somerville@windriver.com</a>&gt;<b=
r>
-From: Jim Somerville &lt;<a href=3D"mailto:Jim.Somerville@windriver.com">J=
im.Somerville@windriver.com</a>&gt;<br>
-Date: Wed, 24 Jun 2015 16:16:38 -0400<br>
-Subject: [PATCH 1/1] Generate lxc-restore-net properly<br>
-<br>
-It&#39;s a script that should be run through the configure<br>
-mechanism the same as the others.=C2=A0 We simply rename it<br>
-to have a .in extension and add it to <a href=3D"http://configure.ac" rel=
=3D"noreferrer" target=3D"_blank">configure.ac</a> .<br>
-<br>
-Also, by generating the script from a .in file, it gets<br>
-placed into the build directory.=C2=A0 This plays nice with<br>
-build systems that keep the src separate from the build<br>
-directory.=C2=A0 Without this change, the install step won&#39;t<br>
-find the lxc-restore-net script as it still just resides<br>
-in the src directory and not in the build directory.<br>
-<br>
-Upstream-Status: Not applicable.=C2=A0 This script has already<br>
-been rearchitected out of existence by<br>
-<wbr>cba98d127bf490b018a016b792ae05<wbr>fd2d29c5ee:<br>
-&quot;c/r: use criu option instead of lxc-restore-net<br>
-<br>
-As of criu 1.5, the --veth-pair argument supports an additional parameter =
that<br>
-is the bridge name to attach to. This enables us to get rid of the goofy<b=
r>
-action-script hack that passed bridge names as environment variables.<br>
-<br>
-This patch is on top of the systemd/lxcfs mount rework patch, as we probab=
ly<br>
-want to wait to use 1.5 options until it has been out for a while and is i=
n<br>
-distros.<br>
-<br>
-Signed-off-by: Tycho Andersen &lt;<a href=3D"mailto:tycho.andersen@canonic=
al.com">tycho.andersen@canonical.com</a>&gt;<br>
-Acked-by: Serge E. Hallyn &lt;<a href=3D"mailto:serge.hallyn@ubuntu.com">s=
erge.hallyn@ubuntu.com</a>&gt;&quot;<br>
-<br>
-Signed-off-by: Jim Somerville &lt;<a href=3D"mailto:Jim.Somerville@windriv=
er.com">Jim.Somerville@windriver.com</a>&gt;<br>
----<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
1 +<br>
- src/lxc/lxc-restore-net=C2=A0 =C2=A0 | 26 --------------------------<br>
- src/lxc/<a href=3D"http://lxc-restore-net.in" rel=3D"noreferrer" target=
=3D"_blank">lxc-restore-net.in</a> | 26 ++++++++++++++++++++++++++<br>
- 3 files changed, 27 insertions(+), 26 deletions(-)<br>
- delete mode 100755 src/lxc/lxc-restore-net<br>
- create mode 100755 src/lxc/<a href=3D"http://lxc-restore-net.in" rel=3D"n=
oreferrer" target=3D"_blank">lxc-restore-net.in</a><br>
-<br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
-index 574b2cd..4972803 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-@@ -768,6 +768,7 @@ AC_CONFIG_FILES([<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0src/lxc/legacy/lxc-ls<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0src/lxc/lxc.functions<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0src/lxc/version.h<br>
-+=C2=A0 =C2=A0 =C2=A0 src/lxc/lxc-restore-net<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0src/python-lxc/Makefile<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0src/python-lxc/setup.py<br>
-<br>
-diff --git a/src/lxc/lxc-restore-net b/src/lxc/lxc-restore-net<br>
-deleted file mode 100755<br>
-index 6ae3c19..0000000<br>
---- a/src/lxc/lxc-restore-net<br>
-+++ /dev/null<br>
-@@ -1,26 +0,0 @@<br>
--#!/bin/sh<br>
--<br>
--set -e<br>
--<br>
--i=3D0<br>
--while true; do<br>
--=C2=A0 =C2=A0 =C2=A0 eval &quot;bridge=3D\$LXC_CRIU_BRIDGE$i&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 eval &quot;veth=3D\$LXC_CRIU_VETH$i&quot;<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 if [ -z &quot;$bridge&quot; ] || [ -z &quot;$veth&qu=
ot; ]; then<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 0<br>
--=C2=A0 =C2=A0 =C2=A0 fi<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 if [ &quot;$CRTOOLS_SCRIPT_ACTION&quot; =3D &quot;ne=
twork-lock&quot; ]; then<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brctl delif $bridge $vet=
h<br>
--=C2=A0 =C2=A0 =C2=A0 fi<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 if [ &quot;$CRTOOLS_SCRIPT_ACTION&quot; =3D &quot;ne=
twork-unlock&quot; ]; then<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brctl addif $bridge $vet=
h<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ip link set dev $veth up=
<br>
--=C2=A0 =C2=A0 =C2=A0 fi<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 i=3D$((i+1))<br>
--done<br>
--<br>
--exit 1<br>
-diff --git a/src/lxc/<a href=3D"http://lxc-restore-net.in" rel=3D"noreferr=
er" target=3D"_blank">lxc-restore-net.in</a> b/src/lxc/<a href=3D"http://lx=
c-restore-net.in" rel=3D"noreferrer" target=3D"_blank">lxc-restore-net.in</=
a><br>
-new file mode 100755<br>
-index 0000000..6ae3c19<br>
---- /dev/null<br>
-+++ b/src/lxc/<a href=3D"http://lxc-restore-net.in" rel=3D"noreferrer" tar=
get=3D"_blank">lxc-restore-net.in</a><br>
-@@ -0,0 +1,26 @@<br>
-+#!/bin/sh<br>
-+<br>
-+set -e<br>
-+<br>
-+i=3D0<br>
-+while true; do<br>
-+=C2=A0 =C2=A0 =C2=A0 eval &quot;bridge=3D\$LXC_CRIU_BRIDGE$i&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 eval &quot;veth=3D\$LXC_CRIU_VETH$i&quot;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if [ -z &quot;$bridge&quot; ] || [ -z &quot;$veth&qu=
ot; ]; then<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 0<br>
-+=C2=A0 =C2=A0 =C2=A0 fi<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if [ &quot;$CRTOOLS_SCRIPT_ACTION&quot; =3D &quot;ne=
twork-lock&quot; ]; then<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brctl delif $bridge $vet=
h<br>
-+=C2=A0 =C2=A0 =C2=A0 fi<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if [ &quot;$CRTOOLS_SCRIPT_ACTION&quot; =3D &quot;ne=
twork-unlock&quot; ]; then<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brctl addif $bridge $vet=
h<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ip link set dev $veth up=
<br>
-+=C2=A0 =C2=A0 =C2=A0 fi<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 i=3D$((i+1))<br>
-+done<br>
-+<br>
-+exit 1<br>
---<br>
-1.8.3.2<br>
-<br>
diff --git a/recipes-containers/lxc/<wbr>files/Use-AC_HEADER_MAJOR-to-<wbr>=
detect-major-minor-makedev.<wbr>patch b/recipes-containers/lxc/<wbr>files/U=
se-AC_HEADER_MAJOR-to-<wbr>detect-major-minor-makedev.<wbr>patch<br>
deleted file mode 100644<br>
index f9cecc0..0000000<br>
--- a/recipes-containers/lxc/<wbr>files/Use-AC_HEADER_MAJOR-to-<wbr>detect-=
major-minor-makedev.<wbr>patch<br>
+++ /dev/null<br>
@@ -1,119 +0,0 @@<br>
-From 5c957671a511441b112b137b88bf0b<wbr>1f31adac20 Mon Sep 17 00:00:00 200=
1<br>
-From: Sergei Trofimovich &lt;<a href=3D"mailto:siarheit@google.com">siarhe=
it@google.com</a>&gt;<br>
-Date: Sat, 21 Jan 2017 11:57:13 +0000<br>
-Subject: [PATCH] Use AC_HEADER_MAJOR to detect major()/minor()/makedev()<b=
r>
-<br>
-commit af6824fce9c9536fbcabef8d5547f6<wbr>c486f55fdf from<br>
-git://<a href=3D"http://github.com/lxc/lxc.git" rel=3D"noreferrer" target=
=3D"_blank">github.com/lxc/lxc.git</a><br>
-<br>
-Before the change build failed on Gentoo as:<br>
-<br>
-=C2=A0 bdev/lxclvm.c: In function &#39;lvm_detect&#39;:<br>
-=C2=A0 bdev/lxclvm.c:140:4: error: implicit declaration of function &#39;m=
ajor&#39; [-Werror=3Dimplicit-function-<wbr>declaration]<br>
-=C2=A0 =C2=A0 major(statbuf.st_rdev), minor(statbuf.st_rdev));<br>
-=C2=A0 =C2=A0 ^~~~~<br>
-=C2=A0 bdev/lxclvm.c:140:28: error: implicit declaration of function &#39;=
minor&#39; [-Werror=3Dimplicit-function-<wbr>declaration]<br>
-=C2=A0 =C2=A0 major(statbuf.st_rdev), minor(statbuf.st_rdev));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~<br>
-<br>
-glibc plans to remove &lt;sys/sysmacros.h&gt; from glibc&#39;s &lt;sys/typ=
es.h&gt;:<br>
-=C2=A0 =C2=A0 <a href=3D"https://sourceware.org/ml/libc-alpha/2015-11/msg0=
0253.html" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/ml/<=
wbr>libc-alpha/2015-11/msg00253.<wbr>html</a><br>
-<br>
-Gentoo already applied glibc patch to experimental glibc-2.24<br>
-to start preparingfor the change.<br>
-<br>
-Autoconf has AC_HEADER_MAJOR to find out which header defines<br>
-reqiured macros:<br>
-=C2=A0 =C2=A0 <a href=3D"https://www.gnu.org/software/autoconf/manual/auto=
conf-2.69/html_node/Particular-Headers.html" rel=3D"noreferrer" target=3D"_=
blank">https://www.gnu.org/software/<wbr>autoconf/manual/autoconf-2.69/<wbr=
>html_node/Particular-Headers.<wbr>html</a><br>
-<br>
-This change should also increase portability across other libcs.<br>
-<br>
-Bug: <a href=3D"https://bugs.gentoo.org/604360" rel=3D"noreferrer" target=
=3D"_blank">https://bugs.gentoo.org/604360</a><br>
-Signed-off-by: Sergei Trofimovich &lt;<a href=3D"mailto:siarheit@google.co=
m">siarheit@google.com</a>&gt;<br>
-Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windr=
iver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
----<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 +++<br>
- src/lxc/bdev/lxclvm.c=C2=A0 | 9 +++++++++<br>
- src/lxc/conf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 8 ++++++++<br>
- src/lxc/lxccontainer.c | 8 ++++++++<br>
- 4 files changed, 28 insertions(+)<br>
-<br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
-index 8f31c29..924baa1 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-@@ -601,6 +601,9 @@ AC_CHECK_DECLS([PR_CAPBSET_<wbr>DROP], [], [], [#inclu=
de &lt;sys/prctl.h&gt;])<br>
- # Check for some headers<br>
- AC_CHECK_HEADERS([sys/<wbr>signalfd.h pty.h ifaddrs.h sys/capability.h sy=
s/personality.h utmpx.h sys/timerfd.h])<br>
-<br>
-+# lookup major()/minor()/makedev()<br>
-+AC_HEADER_MAJOR<br>
-+<br>
- # Check for some syscalls functions<br>
- AC_CHECK_FUNCS([setns pivot_root sethostname unshare rand_r confstr facce=
ssat])<br>
-<br>
-diff --git a/src/lxc/bdev/lxclvm.c b/src/lxc/bdev/lxclvm.c<br>
-index 3d41b10..419d1c2 100644<br>
---- a/src/lxc/bdev/lxclvm.c<br>
-+++ b/src/lxc/bdev/lxclvm.c<br>
-@@ -32,10 +32,19 @@<br>
- #include &lt;sys/wait.h&gt;<br>
-<br>
- #include &quot;bdev.h&quot;<br>
-+#include &quot;config.h&quot;<br>
- #include &quot;log.h&quot;<br>
- #include &quot;lxclvm.h&quot;<br>
- #include &quot;utils.h&quot;<br>
-<br>
-+/* major()/minor() */<br>
-+#ifdef MAJOR_IN_MKDEV<br>
-+#=C2=A0 =C2=A0 include &lt;sys/mkdev.h&gt;<br>
-+#endif<br>
-+#ifdef MAJOR_IN_SYSMACROS<br>
-+#=C2=A0 =C2=A0 include &lt;sys/sysmacros.h&gt;<br>
-+#endif<br>
-+<br>
- lxc_log_define(lxclvm, lxc);<br>
-<br>
- extern char *dir_new_path(char *src, const char *oldname, const char *nam=
e,<br>
-diff --git a/src/lxc/conf.c b/src/lxc/conf.c<br>
-index 3b023ef..53406ca 100644<br>
---- a/src/lxc/conf.c<br>
-+++ b/src/lxc/conf.c<br>
-@@ -39,6 +39,14 @@<br>
- #include &lt;grp.h&gt;<br>
- #include &lt;time.h&gt;<br>
-<br>
-+/* makedev() */<br>
-+#ifdef MAJOR_IN_MKDEV<br>
-+#=C2=A0 =C2=A0 include &lt;sys/mkdev.h&gt;<br>
-+#endif<br>
-+#ifdef MAJOR_IN_SYSMACROS<br>
-+#=C2=A0 =C2=A0 include &lt;sys/sysmacros.h&gt;<br>
-+#endif<br>
-+<br>
- #ifdef HAVE_STATVFS<br>
- #include &lt;sys/statvfs.h&gt;<br>
- #endif<br>
-diff --git a/src/lxc/lxccontainer.c b/src/lxc/lxccontainer.c<br>
-index 9f12ca2..aa02833 100644<br>
---- a/src/lxc/lxccontainer.c<br>
-+++ b/src/lxc/lxccontainer.c<br>
-@@ -61,6 +61,14 @@<br>
- #include &quot;utils.h&quot;<br>
- #include &quot;version.h&quot;<br>
-<br>
-+/* major()/minor() */<br>
-+#ifdef MAJOR_IN_MKDEV<br>
-+#=C2=A0 =C2=A0 include &lt;sys/mkdev.h&gt;<br>
-+#endif<br>
-+#ifdef MAJOR_IN_SYSMACROS<br>
-+#=C2=A0 =C2=A0 include &lt;sys/sysmacros.h&gt;<br>
-+#endif<br>
-+<br>
- #if HAVE_IFADDRS_H<br>
- #include &lt;ifaddrs.h&gt;<br>
- #else<br>
---<br>
-2.7.4<br>
-<br>
diff --git a/recipes-containers/lxc/<wbr>files/automake-ensure-VPATH-<wbr>b=
uilds-correctly.patch b/recipes-containers/lxc/<wbr>files/automake-ensure-V=
PATH-<wbr>builds-correctly.patch<br>
index 2b5c853..61c0e29 100644<br>
--- a/recipes-containers/lxc/<wbr>files/automake-ensure-VPATH-<wbr>builds-c=
orrectly.patch<br>
+++ b/recipes-containers/lxc/<wbr>files/automake-ensure-VPATH-<wbr>builds-c=
orrectly.patch<br>
@@ -15,7 +15,7 @@ index d74c10d..6225f78 100644<br>
=C2=A0@@ -66,7 +66,7 @@ buildtest-TESTS: $(TESTS)<br>
=C2=A0 install-ptest:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DIR)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -D ../lxc/liblxc.so $(TEST_DIR)/../lxc/=
liblxc.so<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -D ../lxc/.libs/liblxc.so $(TEST_DIR)/.=
./lxc/liblxc.so<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 install -D ../../config/test-driver $(TEST_DIR)=
/../../config/test-<wbr>driver<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 install -D $(top_srcdir)/config/test-<wbr>drive=
r $(TEST_DIR)/../../config/test-<wbr>driver<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp Makefile $(TEST_DIR)<br>
diff --git a/recipes-containers/lxc/<wbr>files/runtest.patch b/recipes-cont=
ainers/lxc/<wbr>files/runtest.patch<br>
index e4e034b..6572265 100644<br>
--- a/recipes-containers/lxc/<wbr>files/runtest.patch<br>
+++ b/recipes-containers/lxc/<wbr>files/runtest.patch<br>
@@ -19,7 +19,7 @@ diff -uNr a/src/tests/Makefile.am b/src/tests/Makefile.am=
<br>
=C2=A0+<br>
=C2=A0+install-ptest:<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DIR)<br>
-+=C2=A0 =C2=A0 =C2=A0 install -D ../lxc/liblxc.so $(TEST_DIR)/../lxc/liblx=
c.so<br>
++=C2=A0 =C2=A0 =C2=A0 install -D ../lxc/.libs/liblxc.so $(TEST_DIR)/../lxc=
/liblxc.so<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 install -D ../../config/test-driver $(TEST_DIR)=
/../../config/test-<wbr>driver<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 cp Makefile $(TEST_DIR)<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 @(for file in $(TESTS); do install $$file $(TES=
T_DIR);=C2=A0 done;)<br>
diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_2.0.0.bb" rel=3D"=
noreferrer" target=3D"_blank">lxc_<wbr>2.0.0.bb</a> b/recipes-containers/lx=
c/<a href=3D"http://lxc_2.0.8.bb" rel=3D"noreferrer" target=3D"_blank">lxc_=
<wbr>2.0.8.bb</a><br>
similarity index 87%<br>
rename from recipes-containers/lxc/<a href=3D"http://lxc_2.0.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">lxc_2.<wbr>0.0.bb</a><br>
rename to recipes-containers/lxc/<a href=3D"http://lxc_2.0.8.bb" rel=3D"nor=
eferrer" target=3D"_blank">lxc_2.<wbr>0.8.bb</a><br>
index c98d1a7..80c8da7 100644<br>
--- a/recipes-containers/lxc/<a href=3D"http://lxc_2.0.0.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_<wbr>2.0.0.bb</a><br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_2.0.8.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_<wbr>2.0.8.bb</a><br>
@@ -2,7 +2,6 @@ DESCRIPTION =3D &quot;lxc aims to use these new functionnal=
ities to provide an userspac<br>
=C2=A0SECTION =3D &quot;console/utils&quot;<br>
=C2=A0LICENSE =3D &quot;GPLv2&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>4fbd65380cdd2559=
51079008b36451<wbr>6c&quot;<br>
-PRIORITY =3D &quot;optional&quot;<br>
=C2=A0DEPENDS =3D &quot;libxml2 libcap&quot;<br>
=C2=A0RDEPENDS_${PN} =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rsync \<br>
@@ -10,7 +9,6 @@ RDEPENDS_${PN} =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libcap-bin \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bridge-utils \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dnsmasq \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0initscripts \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perl-module-strict =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perl-module-getopt-=
long \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perl-module-vars \<=
br>
@@ -20,11 +18,7 @@ RDEPENDS_${PN} =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perl-module-overloa=
d \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perl-module-exporte=
r-heavy \<br>
=C2=A0&quot;<br>
-RDEPENDS_${PN}_append_libc-<wbr>glibc =3D &quot;\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glibc-utils \<br>
-&quot;<br>
-<br>
-RDEPENDS_${PN}-ptest +=3D &quot;file make&quot;<br>
+RDEPENDS_${PN}-ptest +=3D &quot;file make gmp nettle gnutls&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://linuxcontainers.org/downloads/${B=
PN}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://linuxcontaine=
rs.org/<wbr>downloads/${BPN}-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc-1.0.0-disable-<wbr>udhcp-from-busybo=
x-template.<wbr>patch \<br>
@@ -34,11 +28,10 @@ SRC_URI =3D &quot;<a href=3D"http://linuxcontainers.org=
/downloads/${BPN}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http:/=
/linuxcontainers.org/<wbr>downloads/${BPN}-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc-fix-B-S.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc-doc-upgrade-to-use-<wbr>docbook-3.1-=
DTD.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://logs-optionally-use-<wbr>base-filenames-=
to-report-src-<wbr>fil.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file://Use-AC_HEADER_MAJOR-to-<wbr>detect-major=
-minor-makedev.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>04a7245a614cd3296b0ae9ceeeb83f<wbr>bb&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>5b737e114d8ef1feb193fba936d77a<wbr>5697a=
7c8a10199a068cdd90d1bd27c<wbr>10e4&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>7bfd95280522d7936c0979dfea92cd<wbr>b5&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>0d8e34b302cfe4c40c6c9ae5097096<wbr>aa5cc=
2c1dfceea3f0f22e3e16c4a4e<wbr>8494&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/${BPN}-${PV}&quot;<br>
<br>
@@ -87,19 +80,21 @@ FILES_${PN}-doc =3D &quot;${mandir} ${infodir}&quot;<br=
>
=C2=A0# For LXC the docdir only contains example configuration files and sh=
ould be included in the lxc package<br>
=C2=A0FILES_${PN} +=3D &quot;${docdir}&quot;<br>
=C2=A0FILES_${PN} +=3D &quot;${libdir}/python3*&quot;<br>
-FILES_${PN} +=3D &quot;${datadir}/lua/*&quot;<br>
-FILES_${PN} +=3D &quot;${libdir}/lua/lxc/*&quot;<br>
-FILES_${PN}-dbg +=3D &quot;${libdir}/lua/lxc/.debug&quot;<br>
-FILES_${PN}-dbg +=3D &quot;${libexecdir}/lxc/.debug ${libexecdir}/lxc/hook=
s/.<wbr>debug&quot;<br>
-PACKAGES =3D+ &quot;${PN}-templates ${PN}-setup ${PN}-networking&quot;<br>
+FILES_${PN} +=3D &quot;${datadir}/bash-completion&quot;<br>
+FILES_${PN}-dbg +=3D &quot;${libexecdir}/lxc/.debug&quot;<br>
+FILES_${PN}-dbg +=3D &quot;${libexecdir}/lxc/hooks/.<wbr>debug&quot;<br>
+PACKAGES =3D+ &quot;${PN}-templates ${PN}-setup ${PN}-networking ${PN}-lua=
&quot;<br>
+FILES_lua-${PN} =3D &quot;${datadir}/lua ${libdir}/lua&quot;<br>
+FILES_lua-${PN}-dbg +=3D &quot;${libdir}/lua/lxc/.debug&quot;<br>
=C2=A0FILES_${PN}-templates +=3D &quot;${datadir}/lxc/templates&quot;<br>
=C2=A0RDEPENDS_${PN}-templates +=3D &quot;bash&quot;<br>
<br>
=C2=A0ALLOW_EMPTY_${PN}-networking =3D &quot;1&quot;<br>
<br>
-FILES_${PN}-setup +=3D &quot;${sysconfdir}/tmpfiles.d&quot;<br>
-FILES_${PN}-setup +=3D &quot;${systemd_system_unitdir}&quot;<br>
-FILES_${PN}-setup +=3D &quot;${sysconfdir}/init.d&quot;<br>
+FILES_${PN}-setup +=3D &quot;/etc/tmpfiles.d&quot;<br>
+FILES_${PN}-setup +=3D &quot;/lib/systemd/system&quot;<br>
+FILES_${PN}-setup +=3D &quot;/usr/lib/systemd/system&quot;<br>
+FILES_${PN}-setup +=3D &quot;/etc/init.d&quot;<br>
<br>
=C2=A0PRIVATE_LIBS_${PN}-ptest =3D &quot;liblxc.so.1&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.7.4<br>
<br>
<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--001a114900c857d95a0551dedefb--
