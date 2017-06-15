Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CB81DE00B9E; Thu, 15 Jun 2017 09:18:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93E59E00B99
	for <meta-virtualization@yoctoproject.org>;
	Thu, 15 Jun 2017 09:18:23 -0700 (PDT)
Received: by mail-yw0-f196.google.com with SMTP id u13so990184ywg.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 15 Jun 2017 09:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hi7cTtZdKmFSuY/JTVt/e/D4A1EoJ9lcSz3eArOrGvg=;
	b=AxjJklcan3Q/huBFKRDWWtd6MudGAti+rf/9QRWIL2h8KCBbDE2LLRdtRGole1mZLP
	E+9NC3Svi7uQ635KfYlWE1YLoGm9tlW6fISusiRITvf+eA/ckxkNnYrm+7G2ASVzhKWV
	DyqIa6weYfO6h0IeOARgFBSpmGkd/FHCzgUtsnbnbfJMbMMhbwS3kqd8JaRy4n6IDZQW
	DlB1iDSlGa50ST3absMhnXoZn6/VZRslVk8F+PqaoamgHbSKWUNU0eUuxZJkvnGcY8Zp
	PMBF7evrQgByzQjgU8vxoDSbGtNxqzNHDEGG88EubZxTodf9WE2cYiS1WL1TftBGPpr3
	viVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=hi7cTtZdKmFSuY/JTVt/e/D4A1EoJ9lcSz3eArOrGvg=;
	b=O+e+Ou0KdGJ7vENTV9hYrIL1bkFkZQinNv2v/dpqdk3jwSZ+5qvv/XgKvfkZWsafvy
	AURLiq0FGdh+mBThBoVZmMQH+AKMX/3N1hMlG357oUw8xT0g6CpwpbHTWVywDWUEeBb9
	c+WjBTvxiioocSngR7qyawqdXEhabis2xi74GlaCYi+H+ywtvKvwadmfNGRKDZEOOIiv
	vQHLGdbSwos3tJgBBiNcbwG081J21BPzlSFjmzZuk91H/i9+LvoAl3iwmW6l79dcdkTk
	AUPY/oLitc5scbjTSHBS96opXw3Pge7JpbduA/n4nk5Kh1jtD3IszrvJX2XE3qXSOm1J
	ERBA==
X-Gm-Message-State: AKS2vOz2F2BJegE8omBethJ5iVdN2By6Mlur5UI6gF92TGHpdmU0H5Ml
	vPOiF4AOkbohwNuZmv5MZcYWYRg7Zw==
X-Received: by 10.13.204.3 with SMTP id o3mr5034724ywd.60.1497543502124; Thu,
	15 Jun 2017 09:18:22 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.17.129 with HTTP; Thu, 15 Jun 2017 09:18:21 -0700 (PDT)
In-Reply-To: <CADkTA4M4zAVZbOABjSnc+wGaXFGLkPC6TU+x_n7YwOGdTtzBDQ@mail.gmail.com>
References: <1496731614-17822-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<CADkTA4M4zAVZbOABjSnc+wGaXFGLkPC6TU+x_n7YwOGdTtzBDQ@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Thu, 15 Jun 2017 12:18:21 -0400
X-Google-Sender-Auth: EtnhZRmvS1jaVAyVk2CI3pojftU
Message-ID: <CAPuovEK1aXtM=K7p+OPDg-yc0t7QVvDVDZ7sX3HE65+kGSe5yg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2] lxc: 2.0.0 -> 2.0.8
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Jun 2017 16:18:25 -0000
Content-Type: text/plain; charset="UTF-8"

Note that there is a change in Yocto master which will cause a build
failure with LXC but AFAICT it is not related to this uprev (ie. it is
an issue with the old version too) but rather the introduction of gcc
7 and specifically -Werror=format-truncation.

So if folks are building master you might see a build failure. I will
attempt to get a patch out and ideally get it to upstream lxc.

Mark

On Tue, Jun 13, 2017 at 6:22 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
>
> On Tue, Jun 6, 2017 at 8:46 AM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> wrote:
>>
>> 1)Upgrade lxc from 2.0.0 to 2.0.8.
>>
>> 2)Delete two patches, since it is integrated upstream.
>>   Delete Generate-lxc-restore-net-properly.patch,this script has already
>> been rearchitected out of existence by
>> cba98d127bf490b018a016b792ae05fd2d29c5ee
>>
>>   Delete Use-AC_HEADER_MAJOR-to-detect-major-minor-makedev.patch,this
>> script has already been rearchitected out of existence by
>> af6824fce9c9536fbcabef8d5547f6c486f55fdf from git://github.com/lxc/lxc.git
>
>
>
> Sorry for the delay on merging this, it would have been nice to see a log
> about how this was tested, but since it is a dot release, and I've been a
> bit slow in merging it .. I've gone ahead without that info.
>
> Bruce
>
>>
>>
>>
>> 3)Modify two patches, since the data has been changed.
>>   automake-ensure-VPATH-builds-correctly.patch
>>   runtest.patch
>>
>> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
>> ---
>>  .../files/Generate-lxc-restore-net-properly.patch  | 121
>> ---------------------
>>  ...EADER_MAJOR-to-detect-major-minor-makedev.patch | 119
>> --------------------
>>  .../automake-ensure-VPATH-builds-correctly.patch   |   2 +-
>>  recipes-containers/lxc/files/runtest.patch         |   2 +-
>>  .../lxc/{lxc_2.0.0.bb => lxc_2.0.8.bb}             |  31 +++---
>>  5 files changed, 15 insertions(+), 260 deletions(-)
>>  delete mode 100644
>> recipes-containers/lxc/files/Generate-lxc-restore-net-properly.patch
>>  delete mode 100644
>> recipes-containers/lxc/files/Use-AC_HEADER_MAJOR-to-detect-major-minor-makedev.patch
>>  rename recipes-containers/lxc/{lxc_2.0.0.bb => lxc_2.0.8.bb} (87%)
>>
>> diff --git
>> a/recipes-containers/lxc/files/Generate-lxc-restore-net-properly.patch
>> b/recipes-containers/lxc/files/Generate-lxc-restore-net-properly.patch
>> deleted file mode 100644
>> index 5adb730..0000000
>> --- a/recipes-containers/lxc/files/Generate-lxc-restore-net-properly.patch
>> +++ /dev/null
>> @@ -1,121 +0,0 @@
>> -From e08f3573b3561f1f0490624f7ca95b7ccd8157cb Mon Sep 17 00:00:00 2001
>> -Message-Id:
>> <e08f3573b3561f1f0490624f7ca95b7ccd8157cb.1435177418.git.Jim.Somerville@windriver.com>
>> -From: Jim Somerville <Jim.Somerville@windriver.com>
>> -Date: Wed, 24 Jun 2015 16:16:38 -0400
>> -Subject: [PATCH 1/1] Generate lxc-restore-net properly
>> -
>> -It's a script that should be run through the configure
>> -mechanism the same as the others.  We simply rename it
>> -to have a .in extension and add it to configure.ac .
>> -
>> -Also, by generating the script from a .in file, it gets
>> -placed into the build directory.  This plays nice with
>> -build systems that keep the src separate from the build
>> -directory.  Without this change, the install step won't
>> -find the lxc-restore-net script as it still just resides
>> -in the src directory and not in the build directory.
>> -
>> -Upstream-Status: Not applicable.  This script has already
>> -been rearchitected out of existence by
>> -cba98d127bf490b018a016b792ae05fd2d29c5ee:
>> -"c/r: use criu option instead of lxc-restore-net
>> -
>> -As of criu 1.5, the --veth-pair argument supports an additional parameter
>> that
>> -is the bridge name to attach to. This enables us to get rid of the goofy
>> -action-script hack that passed bridge names as environment variables.
>> -
>> -This patch is on top of the systemd/lxcfs mount rework patch, as we
>> probably
>> -want to wait to use 1.5 options until it has been out for a while and is
>> in
>> -distros.
>> -
>> -Signed-off-by: Tycho Andersen <tycho.andersen@canonical.com>
>> -Acked-by: Serge E. Hallyn <serge.hallyn@ubuntu.com>"
>> -
>> -Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
>> ----
>> - configure.ac               |  1 +
>> - src/lxc/lxc-restore-net    | 26 --------------------------
>> - src/lxc/lxc-restore-net.in | 26 ++++++++++++++++++++++++++
>> - 3 files changed, 27 insertions(+), 26 deletions(-)
>> - delete mode 100755 src/lxc/lxc-restore-net
>> - create mode 100755 src/lxc/lxc-restore-net.in
>> -
>> -diff --git a/configure.ac b/configure.ac
>> -index 574b2cd..4972803 100644
>> ---- a/configure.ac
>> -+++ b/configure.ac
>> -@@ -768,6 +768,7 @@ AC_CONFIG_FILES([
>> -       src/lxc/legacy/lxc-ls
>> -       src/lxc/lxc.functions
>> -       src/lxc/version.h
>> -+      src/lxc/lxc-restore-net
>> -       src/python-lxc/Makefile
>> -       src/python-lxc/setup.py
>> -
>> -diff --git a/src/lxc/lxc-restore-net b/src/lxc/lxc-restore-net
>> -deleted file mode 100755
>> -index 6ae3c19..0000000
>> ---- a/src/lxc/lxc-restore-net
>> -+++ /dev/null
>> -@@ -1,26 +0,0 @@
>> --#!/bin/sh
>> --
>> --set -e
>> --
>> --i=0
>> --while true; do
>> --      eval "bridge=\$LXC_CRIU_BRIDGE$i"
>> --      eval "veth=\$LXC_CRIU_VETH$i"
>> --
>> --      if [ -z "$bridge" ] || [ -z "$veth" ]; then
>> --              exit 0
>> --      fi
>> --
>> --      if [ "$CRTOOLS_SCRIPT_ACTION" = "network-lock" ]; then
>> --              brctl delif $bridge $veth
>> --      fi
>> --
>> --      if [ "$CRTOOLS_SCRIPT_ACTION" = "network-unlock" ]; then
>> --              brctl addif $bridge $veth
>> --              ip link set dev $veth up
>> --      fi
>> --
>> --      i=$((i+1))
>> --done
>> --
>> --exit 1
>> -diff --git a/src/lxc/lxc-restore-net.in b/src/lxc/lxc-restore-net.in
>> -new file mode 100755
>> -index 0000000..6ae3c19
>> ---- /dev/null
>> -+++ b/src/lxc/lxc-restore-net.in
>> -@@ -0,0 +1,26 @@
>> -+#!/bin/sh
>> -+
>> -+set -e
>> -+
>> -+i=0
>> -+while true; do
>> -+      eval "bridge=\$LXC_CRIU_BRIDGE$i"
>> -+      eval "veth=\$LXC_CRIU_VETH$i"
>> -+
>> -+      if [ -z "$bridge" ] || [ -z "$veth" ]; then
>> -+              exit 0
>> -+      fi
>> -+
>> -+      if [ "$CRTOOLS_SCRIPT_ACTION" = "network-lock" ]; then
>> -+              brctl delif $bridge $veth
>> -+      fi
>> -+
>> -+      if [ "$CRTOOLS_SCRIPT_ACTION" = "network-unlock" ]; then
>> -+              brctl addif $bridge $veth
>> -+              ip link set dev $veth up
>> -+      fi
>> -+
>> -+      i=$((i+1))
>> -+done
>> -+
>> -+exit 1
>> ---
>> -1.8.3.2
>> -
>> diff --git
>> a/recipes-containers/lxc/files/Use-AC_HEADER_MAJOR-to-detect-major-minor-makedev.patch
>> b/recipes-containers/lxc/files/Use-AC_HEADER_MAJOR-to-detect-major-minor-makedev.patch
>> deleted file mode 100644
>> index f9cecc0..0000000
>> ---
>> a/recipes-containers/lxc/files/Use-AC_HEADER_MAJOR-to-detect-major-minor-makedev.patch
>> +++ /dev/null
>> @@ -1,119 +0,0 @@
>> -From 5c957671a511441b112b137b88bf0b1f31adac20 Mon Sep 17 00:00:00 2001
>> -From: Sergei Trofimovich <siarheit@google.com>
>> -Date: Sat, 21 Jan 2017 11:57:13 +0000
>> -Subject: [PATCH] Use AC_HEADER_MAJOR to detect major()/minor()/makedev()
>> -
>> -commit af6824fce9c9536fbcabef8d5547f6c486f55fdf from
>> -git://github.com/lxc/lxc.git
>> -
>> -Before the change build failed on Gentoo as:
>> -
>> -  bdev/lxclvm.c: In function 'lvm_detect':
>> -  bdev/lxclvm.c:140:4: error: implicit declaration of function 'major'
>> [-Werror=implicit-function-declaration]
>> -    major(statbuf.st_rdev), minor(statbuf.st_rdev));
>> -    ^~~~~
>> -  bdev/lxclvm.c:140:28: error: implicit declaration of function 'minor'
>> [-Werror=implicit-function-declaration]
>> -    major(statbuf.st_rdev), minor(statbuf.st_rdev));
>> -                            ^~~~~
>> -
>> -glibc plans to remove <sys/sysmacros.h> from glibc's <sys/types.h>:
>> -    https://sourceware.org/ml/libc-alpha/2015-11/msg00253.html
>> -
>> -Gentoo already applied glibc patch to experimental glibc-2.24
>> -to start preparingfor the change.
>> -
>> -Autoconf has AC_HEADER_MAJOR to find out which header defines
>> -reqiured macros:
>> -
>> https://www.gnu.org/software/autoconf/manual/autoconf-2.69/html_node/Particular-Headers.html
>> -
>> -This change should also increase portability across other libcs.
>> -
>> -Bug: https://bugs.gentoo.org/604360
>> -Signed-off-by: Sergei Trofimovich <siarheit@google.com>
>> -Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> ----
>> - configure.ac           | 3 +++
>> - src/lxc/bdev/lxclvm.c  | 9 +++++++++
>> - src/lxc/conf.c         | 8 ++++++++
>> - src/lxc/lxccontainer.c | 8 ++++++++
>> - 4 files changed, 28 insertions(+)
>> -
>> -diff --git a/configure.ac b/configure.ac
>> -index 8f31c29..924baa1 100644
>> ---- a/configure.ac
>> -+++ b/configure.ac
>> -@@ -601,6 +601,9 @@ AC_CHECK_DECLS([PR_CAPBSET_DROP], [], [], [#include
>> <sys/prctl.h>])
>> - # Check for some headers
>> - AC_CHECK_HEADERS([sys/signalfd.h pty.h ifaddrs.h sys/capability.h
>> sys/personality.h utmpx.h sys/timerfd.h])
>> -
>> -+# lookup major()/minor()/makedev()
>> -+AC_HEADER_MAJOR
>> -+
>> - # Check for some syscalls functions
>> - AC_CHECK_FUNCS([setns pivot_root sethostname unshare rand_r confstr
>> faccessat])
>> -
>> -diff --git a/src/lxc/bdev/lxclvm.c b/src/lxc/bdev/lxclvm.c
>> -index 3d41b10..419d1c2 100644
>> ---- a/src/lxc/bdev/lxclvm.c
>> -+++ b/src/lxc/bdev/lxclvm.c
>> -@@ -32,10 +32,19 @@
>> - #include <sys/wait.h>
>> -
>> - #include "bdev.h"
>> -+#include "config.h"
>> - #include "log.h"
>> - #include "lxclvm.h"
>> - #include "utils.h"
>> -
>> -+/* major()/minor() */
>> -+#ifdef MAJOR_IN_MKDEV
>> -+#    include <sys/mkdev.h>
>> -+#endif
>> -+#ifdef MAJOR_IN_SYSMACROS
>> -+#    include <sys/sysmacros.h>
>> -+#endif
>> -+
>> - lxc_log_define(lxclvm, lxc);
>> -
>> - extern char *dir_new_path(char *src, const char *oldname, const char
>> *name,
>> -diff --git a/src/lxc/conf.c b/src/lxc/conf.c
>> -index 3b023ef..53406ca 100644
>> ---- a/src/lxc/conf.c
>> -+++ b/src/lxc/conf.c
>> -@@ -39,6 +39,14 @@
>> - #include <grp.h>
>> - #include <time.h>
>> -
>> -+/* makedev() */
>> -+#ifdef MAJOR_IN_MKDEV
>> -+#    include <sys/mkdev.h>
>> -+#endif
>> -+#ifdef MAJOR_IN_SYSMACROS
>> -+#    include <sys/sysmacros.h>
>> -+#endif
>> -+
>> - #ifdef HAVE_STATVFS
>> - #include <sys/statvfs.h>
>> - #endif
>> -diff --git a/src/lxc/lxccontainer.c b/src/lxc/lxccontainer.c
>> -index 9f12ca2..aa02833 100644
>> ---- a/src/lxc/lxccontainer.c
>> -+++ b/src/lxc/lxccontainer.c
>> -@@ -61,6 +61,14 @@
>> - #include "utils.h"
>> - #include "version.h"
>> -
>> -+/* major()/minor() */
>> -+#ifdef MAJOR_IN_MKDEV
>> -+#    include <sys/mkdev.h>
>> -+#endif
>> -+#ifdef MAJOR_IN_SYSMACROS
>> -+#    include <sys/sysmacros.h>
>> -+#endif
>> -+
>> - #if HAVE_IFADDRS_H
>> - #include <ifaddrs.h>
>> - #else
>> ---
>> -2.7.4
>> -
>> diff --git
>> a/recipes-containers/lxc/files/automake-ensure-VPATH-builds-correctly.patch
>> b/recipes-containers/lxc/files/automake-ensure-VPATH-builds-correctly.patch
>> index 2b5c853..61c0e29 100644
>> ---
>> a/recipes-containers/lxc/files/automake-ensure-VPATH-builds-correctly.patch
>> +++
>> b/recipes-containers/lxc/files/automake-ensure-VPATH-builds-correctly.patch
>> @@ -15,7 +15,7 @@ index d74c10d..6225f78 100644
>>  @@ -66,7 +66,7 @@ buildtest-TESTS: $(TESTS)
>>   install-ptest:
>>         install -d $(TEST_DIR)
>> -       install -D ../lxc/liblxc.so $(TEST_DIR)/../lxc/liblxc.so
>> +       install -D ../lxc/.libs/liblxc.so $(TEST_DIR)/../lxc/liblxc.so
>>  -      install -D ../../config/test-driver
>> $(TEST_DIR)/../../config/test-driver
>>  +      install -D $(top_srcdir)/config/test-driver
>> $(TEST_DIR)/../../config/test-driver
>>         cp Makefile $(TEST_DIR)
>> diff --git a/recipes-containers/lxc/files/runtest.patch
>> b/recipes-containers/lxc/files/runtest.patch
>> index e4e034b..6572265 100644
>> --- a/recipes-containers/lxc/files/runtest.patch
>> +++ b/recipes-containers/lxc/files/runtest.patch
>> @@ -19,7 +19,7 @@ diff -uNr a/src/tests/Makefile.am
>> b/src/tests/Makefile.am
>>  +
>>  +install-ptest:
>>  +      install -d $(TEST_DIR)
>> -+      install -D ../lxc/liblxc.so $(TEST_DIR)/../lxc/liblxc.so
>> ++      install -D ../lxc/.libs/liblxc.so $(TEST_DIR)/../lxc/liblxc.so
>>  +      install -D ../../config/test-driver
>> $(TEST_DIR)/../../config/test-driver
>>  +      cp Makefile $(TEST_DIR)
>>  +      @(for file in $(TESTS); do install $$file $(TEST_DIR);  done;)
>> diff --git a/recipes-containers/lxc/lxc_2.0.0.bb
>> b/recipes-containers/lxc/lxc_2.0.8.bb
>> similarity index 87%
>> rename from recipes-containers/lxc/lxc_2.0.0.bb
>> rename to recipes-containers/lxc/lxc_2.0.8.bb
>> index c98d1a7..80c8da7 100644
>> --- a/recipes-containers/lxc/lxc_2.0.0.bb
>> +++ b/recipes-containers/lxc/lxc_2.0.8.bb
>> @@ -2,7 +2,6 @@ DESCRIPTION = "lxc aims to use these new functionnalities
>> to provide an userspac
>>  SECTION = "console/utils"
>>  LICENSE = "GPLv2"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>> -PRIORITY = "optional"
>>  DEPENDS = "libxml2 libcap"
>>  RDEPENDS_${PN} = " \
>>                 rsync \
>> @@ -10,7 +9,6 @@ RDEPENDS_${PN} = " \
>>                 libcap-bin \
>>                 bridge-utils \
>>                 dnsmasq \
>> -               initscripts \
>>                 perl-module-strict \
>>                 perl-module-getopt-long \
>>                 perl-module-vars \
>> @@ -20,11 +18,7 @@ RDEPENDS_${PN} = " \
>>                 perl-module-overload \
>>                 perl-module-exporter-heavy \
>>  "
>> -RDEPENDS_${PN}_append_libc-glibc = "\
>> -               glibc-utils \
>> -"
>> -
>> -RDEPENDS_${PN}-ptest += "file make"
>> +RDEPENDS_${PN}-ptest += "file make gmp nettle gnutls"
>>
>>  SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>>         file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
>> @@ -34,11 +28,10 @@ SRC_URI =
>> "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>>         file://lxc-fix-B-S.patch \
>>         file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
>>         file://logs-optionally-use-base-filenames-to-report-src-fil.patch
>> \
>> -       file://Use-AC_HEADER_MAJOR-to-detect-major-minor-makedev.patch \
>>         "
>>
>> -SRC_URI[md5sum] = "04a7245a614cd3296b0ae9ceeeb83fbb"
>> -SRC_URI[sha256sum] =
>> "5b737e114d8ef1feb193fba936d77a5697a7c8a10199a068cdd90d1bd27c10e4"
>> +SRC_URI[md5sum] = "7bfd95280522d7936c0979dfea92cdb5"
>> +SRC_URI[sha256sum] =
>> "0d8e34b302cfe4c40c6c9ae5097096aa5cc2c1dfceea3f0f22e3e16c4a4e8494"
>>
>>  S = "${WORKDIR}/${BPN}-${PV}"
>>
>> @@ -87,19 +80,21 @@ FILES_${PN}-doc = "${mandir} ${infodir}"
>>  # For LXC the docdir only contains example configuration files and should
>> be included in the lxc package
>>  FILES_${PN} += "${docdir}"
>>  FILES_${PN} += "${libdir}/python3*"
>> -FILES_${PN} += "${datadir}/lua/*"
>> -FILES_${PN} += "${libdir}/lua/lxc/*"
>> -FILES_${PN}-dbg += "${libdir}/lua/lxc/.debug"
>> -FILES_${PN}-dbg += "${libexecdir}/lxc/.debug
>> ${libexecdir}/lxc/hooks/.debug"
>> -PACKAGES =+ "${PN}-templates ${PN}-setup ${PN}-networking"
>> +FILES_${PN} += "${datadir}/bash-completion"
>> +FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
>> +FILES_${PN}-dbg += "${libexecdir}/lxc/hooks/.debug"
>> +PACKAGES =+ "${PN}-templates ${PN}-setup ${PN}-networking ${PN}-lua"
>> +FILES_lua-${PN} = "${datadir}/lua ${libdir}/lua"
>> +FILES_lua-${PN}-dbg += "${libdir}/lua/lxc/.debug"
>>  FILES_${PN}-templates += "${datadir}/lxc/templates"
>>  RDEPENDS_${PN}-templates += "bash"
>>
>>  ALLOW_EMPTY_${PN}-networking = "1"
>>
>> -FILES_${PN}-setup += "${sysconfdir}/tmpfiles.d"
>> -FILES_${PN}-setup += "${systemd_system_unitdir}"
>> -FILES_${PN}-setup += "${sysconfdir}/init.d"
>> +FILES_${PN}-setup += "/etc/tmpfiles.d"
>> +FILES_${PN}-setup += "/lib/systemd/system"
>> +FILES_${PN}-setup += "/usr/lib/systemd/system"
>> +FILES_${PN}-setup += "/etc/init.d"
>>
>>  PRIVATE_LIBS_${PN}-ptest = "liblxc.so.1"
>>
>> --
>> 2.7.4
>>
>>
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at
> its end"
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

