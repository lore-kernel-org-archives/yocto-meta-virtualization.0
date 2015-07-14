Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0CDE4E0095C; Tue, 14 Jul 2015 11:34:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,URIBL_BLACK
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.180 listed in list.dnswl.org]
	*  1.7 URIBL_BLACK Contains an URL listed in the URIBL blacklist
	*      [URIs: configure.ac]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com
	[209.85.160.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3BF6EE0086D
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Jul 2015 11:34:00 -0700 (PDT)
Received: by ykay190 with SMTP id y190so15830991yka.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Jul 2015 11:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=9WwAexdSr9cNt4SSPbLKEBWfpxFe8E9zy/6APiZCkUw=;
	b=cJaB6QpCZKebt/nJcfuD70VaJPe224pSX6v5zC+g/vlxz2ghQ8OGXGLaykj2WQkZww
	FEx8nSpIxw3tsy3ekG94Dm9lKsAeKZG3wVdDdC5ubmJaSwLiXeGVnWH6gbc22GhOyTTZ
	V9ddIuQdutNYTv3JjgbAyRY4dCWaex68F3yni6PhLhaOuwNRN1qCwhGUJ+9j8Co4RzhZ
	X4MhyTYpwe9HdxfKj6jIAGVEpIWGB4Yd/IdVNKR2x+bUIaqQ5QjCW9YyNvHiPHXHDxc/
	l423rwyE+sOhG/dCBCgROBKnfubGzzaTBYB1m4atdVKYrZ0nFbcKAFXqm1h2pttTVjJp
	PdoQ==
MIME-Version: 1.0
X-Received: by 10.170.120.197 with SMTP id m188mr23359ykb.60.1436898839998;
	Tue, 14 Jul 2015 11:33:59 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Tue, 14 Jul 2015 11:33:59 -0700 (PDT)
In-Reply-To: <1436450308-26334-1-git-send-email-Jim.Somerville@windriver.com>
References: <1436450308-26334-1-git-send-email-Jim.Somerville@windriver.com>
Date: Tue, 14 Jul 2015 14:33:59 -0400
Message-ID: <CADkTA4PsY5EB9J=igHRYiE7PVJEv-fL=JZK9HXqK-zaw8TM-JQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Jim Somerville <Jim.Somerville@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: upgrade to version 1.1.2
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
X-List-Received-Date: Tue, 14 Jul 2015 18:34:09 -0000
Content-Type: text/plain; charset=UTF-8

Thanks Jim.

I've merged this to master.

Bruce

On Thu, Jul 9, 2015 at 9:58 AM, Jim Somerville
<Jim.Somerville@windriver.com> wrote:
> This version has better support for unprivileged
> containers.
>
> Two patches are deleted as they are now included.
> One new patch is introduced to fix a file not found error at
> the install build step.
>
> Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
> ---
>  .../files/Generate-lxc-restore-net-properly.patch  | 121 +++++++++++++++++
>  .../lxc-helper-create-local-action-function.patch  |  38 ------
>  .../files/ppc-add-seccomp-support-for-lxc.patch    | 111 ----------------
>  recipes-containers/lxc/lxc_1.0.7.bb                | 148 ---------------------
>  recipes-containers/lxc/lxc_1.1.2.bb                | 147 ++++++++++++++++++++
>  5 files changed, 268 insertions(+), 297 deletions(-)
>  create mode 100644 recipes-containers/lxc/files/Generate-lxc-restore-net-properly.patch
>  delete mode 100644 recipes-containers/lxc/files/lxc-helper-create-local-action-function.patch
>  delete mode 100644 recipes-containers/lxc/files/ppc-add-seccomp-support-for-lxc.patch
>  delete mode 100644 recipes-containers/lxc/lxc_1.0.7.bb
>  create mode 100644 recipes-containers/lxc/lxc_1.1.2.bb
>
> diff --git a/recipes-containers/lxc/files/Generate-lxc-restore-net-properly.patch b/recipes-containers/lxc/files/Generate-lxc-restore-net-properly.patch
> new file mode 100644
> index 0000000..5adb730
> --- /dev/null
> +++ b/recipes-containers/lxc/files/Generate-lxc-restore-net-properly.patch
> @@ -0,0 +1,121 @@
> +From e08f3573b3561f1f0490624f7ca95b7ccd8157cb Mon Sep 17 00:00:00 2001
> +Message-Id: <e08f3573b3561f1f0490624f7ca95b7ccd8157cb.1435177418.git.Jim.Somerville@windriver.com>
> +From: Jim Somerville <Jim.Somerville@windriver.com>
> +Date: Wed, 24 Jun 2015 16:16:38 -0400
> +Subject: [PATCH 1/1] Generate lxc-restore-net properly
> +
> +It's a script that should be run through the configure
> +mechanism the same as the others.  We simply rename it
> +to have a .in extension and add it to configure.ac .
> +
> +Also, by generating the script from a .in file, it gets
> +placed into the build directory.  This plays nice with
> +build systems that keep the src separate from the build
> +directory.  Without this change, the install step won't
> +find the lxc-restore-net script as it still just resides
> +in the src directory and not in the build directory.
> +
> +Upstream-Status: Not applicable.  This script has already
> +been rearchitected out of existence by
> +cba98d127bf490b018a016b792ae05fd2d29c5ee:
> +"c/r: use criu option instead of lxc-restore-net
> +
> +As of criu 1.5, the --veth-pair argument supports an additional parameter that
> +is the bridge name to attach to. This enables us to get rid of the goofy
> +action-script hack that passed bridge names as environment variables.
> +
> +This patch is on top of the systemd/lxcfs mount rework patch, as we probably
> +want to wait to use 1.5 options until it has been out for a while and is in
> +distros.
> +
> +Signed-off-by: Tycho Andersen <tycho.andersen@canonical.com>
> +Acked-by: Serge E. Hallyn <serge.hallyn@ubuntu.com>"
> +
> +Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
> +---
> + configure.ac               |  1 +
> + src/lxc/lxc-restore-net    | 26 --------------------------
> + src/lxc/lxc-restore-net.in | 26 ++++++++++++++++++++++++++
> + 3 files changed, 27 insertions(+), 26 deletions(-)
> + delete mode 100755 src/lxc/lxc-restore-net
> + create mode 100755 src/lxc/lxc-restore-net.in
> +
> +diff --git a/configure.ac b/configure.ac
> +index 574b2cd..4972803 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -768,6 +768,7 @@ AC_CONFIG_FILES([
> +       src/lxc/legacy/lxc-ls
> +       src/lxc/lxc.functions
> +       src/lxc/version.h
> ++      src/lxc/lxc-restore-net
> +       src/python-lxc/Makefile
> +       src/python-lxc/setup.py
> +
> +diff --git a/src/lxc/lxc-restore-net b/src/lxc/lxc-restore-net
> +deleted file mode 100755
> +index 6ae3c19..0000000
> +--- a/src/lxc/lxc-restore-net
> ++++ /dev/null
> +@@ -1,26 +0,0 @@
> +-#!/bin/sh
> +-
> +-set -e
> +-
> +-i=0
> +-while true; do
> +-      eval "bridge=\$LXC_CRIU_BRIDGE$i"
> +-      eval "veth=\$LXC_CRIU_VETH$i"
> +-
> +-      if [ -z "$bridge" ] || [ -z "$veth" ]; then
> +-              exit 0
> +-      fi
> +-
> +-      if [ "$CRTOOLS_SCRIPT_ACTION" = "network-lock" ]; then
> +-              brctl delif $bridge $veth
> +-      fi
> +-
> +-      if [ "$CRTOOLS_SCRIPT_ACTION" = "network-unlock" ]; then
> +-              brctl addif $bridge $veth
> +-              ip link set dev $veth up
> +-      fi
> +-
> +-      i=$((i+1))
> +-done
> +-
> +-exit 1
> +diff --git a/src/lxc/lxc-restore-net.in b/src/lxc/lxc-restore-net.in
> +new file mode 100755
> +index 0000000..6ae3c19
> +--- /dev/null
> ++++ b/src/lxc/lxc-restore-net.in
> +@@ -0,0 +1,26 @@
> ++#!/bin/sh
> ++
> ++set -e
> ++
> ++i=0
> ++while true; do
> ++      eval "bridge=\$LXC_CRIU_BRIDGE$i"
> ++      eval "veth=\$LXC_CRIU_VETH$i"
> ++
> ++      if [ -z "$bridge" ] || [ -z "$veth" ]; then
> ++              exit 0
> ++      fi
> ++
> ++      if [ "$CRTOOLS_SCRIPT_ACTION" = "network-lock" ]; then
> ++              brctl delif $bridge $veth
> ++      fi
> ++
> ++      if [ "$CRTOOLS_SCRIPT_ACTION" = "network-unlock" ]; then
> ++              brctl addif $bridge $veth
> ++              ip link set dev $veth up
> ++      fi
> ++
> ++      i=$((i+1))
> ++done
> ++
> ++exit 1
> +--
> +1.8.3.2
> +
> diff --git a/recipes-containers/lxc/files/lxc-helper-create-local-action-function.patch b/recipes-containers/lxc/files/lxc-helper-create-local-action-function.patch
> deleted file mode 100644
> index d1d31ee..0000000
> --- a/recipes-containers/lxc/files/lxc-helper-create-local-action-function.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From aada9da49caca9e4a25764df2d2a2c11d9d95dbb Mon Sep 17 00:00:00 2001
> -From: Bruce Ashfield <bruce.ashfield@windriver.com>
> -Date: Fri, 10 Apr 2015 10:55:49 -0400
> -Subject: [PATCH] lxc-helper: create local action() function
> -
> -Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ----
> - config/init/sysvinit/lxc.in | 14 ++++++++++++++
> - 1 file changed, 14 insertions(+)
> -
> -diff --git a/config/init/sysvinit/lxc.in b/config/init/sysvinit/lxc.in
> -index 19c102e74c86..9f96a4f7496f 100644
> ---- a/config/init/sysvinit/lxc.in
> -+++ b/config/init/sysvinit/lxc.in
> -@@ -52,6 +52,20 @@ test ! -r "$sysconfdir"/sysconfig/lxc ||
> - # Check for needed utility program
> - [ -x "$bindir"/lxc-autostart ] || exit 1
> -
> -+action()
> -+{
> -+    local STRING rc
> -+
> -+    STRING=$1
> -+    echo -n "$STRING "
> -+
> -+    shift
> -+    "$@" && success $"$STRING" || failure $"$STRING"
> -+    rc=$?
> -+
> -+    return $rc
> -+}
> -+
> - # If libvirtd is providing the bridge, it might not be
> - # immediately available, so wait a bit for it before starting
> - # up the containers or else any that use the bridge will fail
> ---
> -2.1.0
> -
> diff --git a/recipes-containers/lxc/files/ppc-add-seccomp-support-for-lxc.patch b/recipes-containers/lxc/files/ppc-add-seccomp-support-for-lxc.patch
> deleted file mode 100644
> index 1055539..0000000
> --- a/recipes-containers/lxc/files/ppc-add-seccomp-support-for-lxc.patch
> +++ /dev/null
> @@ -1,111 +0,0 @@
> -From b4067426d58aec9b6cad7a4739793f3d90c5f189 Mon Sep 17 00:00:00 2001
> -From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> -Date: Thu, 12 Mar 2015 08:57:47 +0000
> -Subject: [PATCH] seccomp: add ppc support
> -
> -This patch enables seccomp support for LXC containers running on PowerPC
> -architectures. It is based on the latest PowerPC support added to libseccomp, on
> -the working-ppc64 branch [1].
> -
> -Libseccomp has been tested on ppc, ppc64 and ppc64le architectures. LXC with
> -seccomp support has been tested on ppc and ppc64 architectures, using the
> -default seccomp policy example files delivered with the LXC package.
> -
> -[1] https://github.com/seccomp/libseccomp/commits/working-ppc64
> -
> -v2:
> -- add #ifdefs in get_new_ctx to fix builds on systems not having SCMP_ARCH_PPC*
> -  defined
> -
> -Upstream-Status: Applied
> -[https://github.com/lxc/lxc/commit/b4067426d58aec9b6cad7a4739793f3d90c5f189]
> -
> -Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> -Acked-by: Serge E. Hallyn <serge.hallyn@ubuntu.com>
> ----
> - src/lxc/seccomp.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
> - 1 file changed, 48 insertions(+)
> -
> -diff --git a/src/lxc/seccomp.c b/src/lxc/seccomp.c
> -index 3ba6c9a..108faa0 100644
> ---- a/src/lxc/seccomp.c
> -+++ b/src/lxc/seccomp.c
> -@@ -121,6 +121,9 @@ enum lxc_hostarch_t {
> -       lxc_seccomp_arch_i386,
> -       lxc_seccomp_arch_amd64,
> -       lxc_seccomp_arch_arm,
> -+      lxc_seccomp_arch_ppc64,
> -+      lxc_seccomp_arch_ppc64le,
> -+      lxc_seccomp_arch_ppc,
> -       lxc_seccomp_arch_unknown = 999,
> - };
> -
> -@@ -137,6 +140,12 @@ int get_hostarch(void)
> -               return lxc_seccomp_arch_amd64;
> -       else if (strncmp(uts.machine, "armv7", 5) == 0)
> -               return lxc_seccomp_arch_arm;
> -+      else if (strncmp(uts.machine, "ppc64le", 7) == 0)
> -+              return lxc_seccomp_arch_ppc64le;
> -+      else if (strncmp(uts.machine, "ppc64", 5) == 0)
> -+              return lxc_seccomp_arch_ppc64;
> -+      else if (strncmp(uts.machine, "ppc", 3) == 0)
> -+              return lxc_seccomp_arch_ppc;
> -       return lxc_seccomp_arch_unknown;
> - }
> -
> -@@ -150,6 +159,15 @@ scmp_filter_ctx get_new_ctx(enum lxc_hostarch_t n_arch, uint32_t default_policy_
> -       case lxc_seccomp_arch_i386: arch = SCMP_ARCH_X86; break;
> -       case lxc_seccomp_arch_amd64: arch = SCMP_ARCH_X86_64; break;
> -       case lxc_seccomp_arch_arm: arch = SCMP_ARCH_ARM; break;
> -+#ifdef SCMP_ARCH_PPC64LE
> -+      case lxc_seccomp_arch_ppc64le: arch = SCMP_ARCH_PPC64LE; break;
> -+#endif
> -+#ifdef SCMP_ARCH_PPC64
> -+      case lxc_seccomp_arch_ppc64: arch = SCMP_ARCH_PPC64; break;
> -+#endif
> -+#ifdef SCMP_ARCH_PPC
> -+      case lxc_seccomp_arch_ppc: arch = SCMP_ARCH_PPC; break;
> -+#endif
> -       default: return NULL;
> -       }
> -
> -@@ -343,6 +361,36 @@ static int parse_config_v2(FILE *f, char *line, struct lxc_conf *conf)
> -                               cur_rule_arch = lxc_seccomp_arch_arm;
> -                       }
> - #endif
> -+#ifdef SCMP_ARCH_PPC64LE
> -+                      else if (strcmp(line, "[ppc64le]") == 0 ||
> -+                                      strcmp(line, "[PPC64LE]") == 0) {
> -+                              if (native_arch != lxc_seccomp_arch_ppc64le) {
> -+                                      cur_rule_arch = lxc_seccomp_arch_unknown;
> -+                                      continue;
> -+                              }
> -+                              cur_rule_arch = lxc_seccomp_arch_ppc64le;
> -+                      }
> -+#endif
> -+#ifdef SCMP_ARCH_PPC64
> -+                      else if (strcmp(line, "[ppc64]") == 0 ||
> -+                                      strcmp(line, "[PPC64]") == 0) {
> -+                              if (native_arch != lxc_seccomp_arch_ppc64) {
> -+                                      cur_rule_arch = lxc_seccomp_arch_unknown;
> -+                                      continue;
> -+                              }
> -+                              cur_rule_arch = lxc_seccomp_arch_ppc64;
> -+                      }
> -+#endif
> -+#ifdef SCMP_ARCH_PPC
> -+                      else if (strcmp(line, "[ppc]") == 0 ||
> -+                                      strcmp(line, "[PPC]") == 0) {
> -+                              if (native_arch != lxc_seccomp_arch_ppc) {
> -+                                      cur_rule_arch = lxc_seccomp_arch_unknown;
> -+                                      continue;
> -+                              }
> -+                              cur_rule_arch = lxc_seccomp_arch_ppc;
> -+                      }
> -+#endif
> -                       else
> -                               goto bad_arch;
> -
> ---
> -2.1.4
> -
> diff --git a/recipes-containers/lxc/lxc_1.0.7.bb b/recipes-containers/lxc/lxc_1.0.7.bb
> deleted file mode 100644
> index faa31b7..0000000
> --- a/recipes-containers/lxc/lxc_1.0.7.bb
> +++ /dev/null
> @@ -1,148 +0,0 @@
> -DESCRIPTION = "lxc aims to use these new functionnalities to provide an userspace container object"
> -SECTION = "console/utils"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> -PRIORITY = "optional"
> -DEPENDS = "libxml2 libcap"
> -RDEPENDS_${PN} = " \
> -               rsync \
> -               gzip \
> -               libcap-bin \
> -               bridge-utils \
> -               dnsmasq \
> -               perl-module-strict \
> -               perl-module-getopt-long \
> -               perl-module-vars \
> -               perl-module-warnings-register \
> -               perl-module-exporter \
> -               perl-module-constant \
> -               perl-module-overload \
> -               perl-module-exporter-heavy \
> -"
> -RDEPENDS_${PN}-ptest += "file make"
> -
> -SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
> -       file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
> -       file://runtest.patch \
> -       file://run-ptest \
> -       file://automake-ensure-VPATH-builds-correctly.patch \
> -       file://add-lxc.rebootsignal.patch \
> -       file://lxc-helper-create-local-action-function.patch \
> -       file://document-lxc.rebootsignal.patch \
> -       file://lxc-busybox-use-lxc.rebootsignal-SIGTERM.patch \
> -       file://ppc-add-seccomp-support-for-lxc.patch \
> -       file://lxc-fix-B-S.patch \
> -       file://lxc-busybox-add-OpenSSH-support.patch \
> -       file://make-some-OpenSSH-tools-optional.patch \
> -       "
> -
> -SRC_URI[md5sum] = "b48f468a9bef0e4e140dd723f0a65ad0"
> -SRC_URI[sha256sum] = "3c0cb2d95d9d8a8d59c7189d237a45cde77f38ea180fbff2c148d59e176e9dab"
> -
> -S = "${WORKDIR}/${BPN}-${PV}"
> -
> -# Let's not configure for the host distro.
> -#
> -PTEST_CONF = "${@base_contains('DISTRO_FEATURES', 'ptest', '--enable-tests', '', d)}"
> -EXTRA_OECONF += "--with-distro=${DISTRO} ${PTEST_CONF}"
> -
> -EXTRA_OECONF += "--with-init-script=\
> -${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit,', '', d)}\
> -${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
> -
> -PACKAGECONFIG ??= "templates \
> -    ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
> -"
> -PACKAGECONFIG[doc] = "--enable-doc --enable-api-docs,--disable-doc --disable-api-docs,,"
> -PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
> -PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
> -PACKAGECONFIG[templates] = ",,, ${PN}-templates"
> -PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
> -PACKAGECONFIG[seccomp] ="--enable-seccomp,--disable-seccomp,libseccomp,libseccomp"
> -
> -inherit autotools pkgconfig ptest update-rc.d systemd
> -
> -SYSTEMD_PACKAGES = "${PN}-setup"
> -SYSTEMD_SERVICE_${PN}-setup = "lxc.service"
> -SYSTEMD_AUTO_ENABLE_${PN}-setup = "disable"
> -
> -INITSCRIPT_PACKAGES = "${PN}-setup"
> -INITSCRIPT_NAME_{PN}-setup = "lxc"
> -INITSCRIPT_PARAMS_${PN}-setup = "${OS_DEFAULT_INITSCRIPT_PARAMS}"
> -
> -FILES_${PN}-doc = "${mandir} ${infodir}"
> -# For LXC the docdir only contains example configuration files and should be included in the lxc package
> -FILES_${PN} += "${docdir}"
> -FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
> -PACKAGES =+ "${PN}-templates ${PN}-setup"
> -FILES_${PN}-templates += "${datadir}/lxc/templates"
> -RDEPENDS_${PN}-templates += "bash"
> -
> -FILES_${PN}-setup += "/etc/tmpfiles.d"
> -FILES_${PN}-setup += "/lib/systemd/system"
> -FILES_${PN}-setup += "/usr/lib/systemd/system"
> -FILES_${PN}-setup += "/etc/init.d"
> -
> -PRIVATE_LIBS_${PN}-ptest = "liblxc.so.1"
> -
> -do_install_append() {
> -       # The /var/cache/lxc directory created by the Makefile
> -       # is wiped out in volatile, we need to create this at boot.
> -       rm -rf ${D}${localstatedir}/cache
> -       install -d ${D}${sysconfdir}/default/volatiles
> -       echo "d root root 0755 ${localstatedir}/cache/lxc none" \
> -            > ${D}${sysconfdir}/default/volatiles/99_lxc
> -
> -       for i in `grep -l "#! */bin/bash" ${D}${datadir}/lxc/hooks/*`; do \
> -           sed -e 's|#! */bin/bash|#!/bin/sh|' -i $i; done
> -
> -       if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
> -           install -d ${D}${sysconfdir}/init.d
> -           cp ${S}/config/init/sysvinit/lxc ${D}${sysconfdir}/init.d
> -       fi
> -}
> -
> -EXTRA_OEMAKE += "TEST_DIR=${D}${PTEST_PATH}/src/tests"
> -
> -do_install_ptest() {
> -       oe_runmake -C src/tests install-ptest
> -}
> -
> -pkg_postinst_${PN}() {
> -       if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
> -               /etc/init.d/populate-volatile.sh update
> -       fi
> -}
> -
> -pkg_postinst_${PN}-setup() {
> -       if [ "x$D" != "x" ]; then
> -               exit 1
> -       fi
> -
> -       # setup for our bridge
> -        echo "lxc.network.link=lxcbr0" >> ${sysconfdir}/lxc/default.conf
> -
> -cat >> /etc/network/interfaces << EOF
> -
> -auto lxcbr0
> -iface lxcbr0 inet dhcp
> -       bridge_ports eth0
> -       bridge_fd 0
> -       bridge_maxwait 0
> -EOF
> -
> -cat<<EOF>/etc/network/if-pre-up.d/lxcbr0
> -#! /bin/sh
> -
> -if test "x\$IFACE" = xlxcbr0 ; then
> -        brctl show |grep lxcbr0 > /dev/null 2>/dev/null
> -        if [ \$? != 0 ] ; then
> -                brctl addbr lxcbr0
> -                brctl addif lxcbr0 eth0
> -                ip addr flush eth0
> -                ifconfig eth0 up
> -        fi
> -fi
> -EOF
> -chmod 755 /etc/network/if-pre-up.d/lxcbr0
> -}
> diff --git a/recipes-containers/lxc/lxc_1.1.2.bb b/recipes-containers/lxc/lxc_1.1.2.bb
> new file mode 100644
> index 0000000..77d226b
> --- /dev/null
> +++ b/recipes-containers/lxc/lxc_1.1.2.bb
> @@ -0,0 +1,147 @@
> +DESCRIPTION = "lxc aims to use these new functionnalities to provide an userspace container object"
> +SECTION = "console/utils"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> +PRIORITY = "optional"
> +DEPENDS = "libxml2 libcap"
> +RDEPENDS_${PN} = " \
> +               rsync \
> +               gzip \
> +               libcap-bin \
> +               bridge-utils \
> +               dnsmasq \
> +               perl-module-strict \
> +               perl-module-getopt-long \
> +               perl-module-vars \
> +               perl-module-warnings-register \
> +               perl-module-exporter \
> +               perl-module-constant \
> +               perl-module-overload \
> +               perl-module-exporter-heavy \
> +"
> +RDEPENDS_${PN}-ptest += "file make"
> +
> +SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
> +       file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
> +       file://runtest.patch \
> +       file://run-ptest \
> +       file://automake-ensure-VPATH-builds-correctly.patch \
> +       file://add-lxc.rebootsignal.patch \
> +       file://document-lxc.rebootsignal.patch \
> +       file://lxc-busybox-use-lxc.rebootsignal-SIGTERM.patch \
> +       file://lxc-fix-B-S.patch \
> +       file://lxc-busybox-add-OpenSSH-support.patch \
> +       file://make-some-OpenSSH-tools-optional.patch \
> +       file://Generate-lxc-restore-net-properly.patch \
> +       "
> +
> +SRC_URI[md5sum] = "3ebadacf5fe8bfe689fd7a09812b682c"
> +SRC_URI[sha256sum] = "34ba517ffd7b38a14e5d12d56a4928b78602d56311d5f47c3ef90f4e714b9604"
> +
> +S = "${WORKDIR}/${BPN}-${PV}"
> +
> +# Let's not configure for the host distro.
> +#
> +PTEST_CONF = "${@base_contains('DISTRO_FEATURES', 'ptest', '--enable-tests', '', d)}"
> +EXTRA_OECONF += "--with-distro=${DISTRO} ${PTEST_CONF}"
> +
> +EXTRA_OECONF += "--with-init-script=\
> +${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit,', '', d)}\
> +${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
> +
> +PACKAGECONFIG ??= "templates \
> +    ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
> +"
> +PACKAGECONFIG[doc] = "--enable-doc --enable-api-docs,--disable-doc --disable-api-docs,,"
> +PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
> +PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
> +PACKAGECONFIG[templates] = ",,, ${PN}-templates"
> +PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
> +PACKAGECONFIG[seccomp] ="--enable-seccomp,--disable-seccomp,libseccomp,libseccomp"
> +
> +inherit autotools pkgconfig ptest update-rc.d systemd
> +
> +SYSTEMD_PACKAGES = "${PN}-setup"
> +SYSTEMD_SERVICE_${PN}-setup = "lxc.service"
> +SYSTEMD_AUTO_ENABLE_${PN}-setup = "disable"
> +
> +INITSCRIPT_PACKAGES = "${PN}-setup"
> +INITSCRIPT_NAME_{PN}-setup = "lxc"
> +INITSCRIPT_PARAMS_${PN}-setup = "${OS_DEFAULT_INITSCRIPT_PARAMS}"
> +
> +FILES_${PN}-doc = "${mandir} ${infodir}"
> +# For LXC the docdir only contains example configuration files and should be included in the lxc package
> +FILES_${PN} += "${docdir}"
> +FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
> +PACKAGES =+ "${PN}-templates ${PN}-setup"
> +FILES_${PN}-templates += "${datadir}/lxc/templates"
> +RDEPENDS_${PN}-templates += "bash"
> +
> +FILES_${PN}-setup += "/etc/tmpfiles.d"
> +FILES_${PN}-setup += "/lib/systemd/system"
> +FILES_${PN}-setup += "/usr/lib/systemd/system"
> +FILES_${PN}-setup += "/etc/init.d"
> +
> +PRIVATE_LIBS_${PN}-ptest = "liblxc.so.1"
> +
> +do_install_append() {
> +       # The /var/cache/lxc directory created by the Makefile
> +       # is wiped out in volatile, we need to create this at boot.
> +       rm -rf ${D}${localstatedir}/cache
> +       install -d ${D}${sysconfdir}/default/volatiles
> +       echo "d root root 0755 ${localstatedir}/cache/lxc none" \
> +            > ${D}${sysconfdir}/default/volatiles/99_lxc
> +
> +       for i in `grep -l "#! */bin/bash" ${D}${datadir}/lxc/hooks/*`; do \
> +           sed -e 's|#! */bin/bash|#!/bin/sh|' -i $i; done
> +
> +       if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
> +           install -d ${D}${sysconfdir}/init.d
> +           install -m 755 config/init/sysvinit/lxc* ${D}${sysconfdir}/init.d
> +       fi
> +}
> +
> +EXTRA_OEMAKE += "TEST_DIR=${D}${PTEST_PATH}/src/tests"
> +
> +do_install_ptest() {
> +       oe_runmake -C src/tests install-ptest
> +}
> +
> +pkg_postinst_${PN}() {
> +       if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
> +               /etc/init.d/populate-volatile.sh update
> +       fi
> +}
> +
> +pkg_postinst_${PN}-setup() {
> +       if [ "x$D" != "x" ]; then
> +               exit 1
> +       fi
> +
> +       # setup for our bridge
> +        echo "lxc.network.link=lxcbr0" >> ${sysconfdir}/lxc/default.conf
> +
> +cat >> /etc/network/interfaces << EOF
> +
> +auto lxcbr0
> +iface lxcbr0 inet dhcp
> +       bridge_ports eth0
> +       bridge_fd 0
> +       bridge_maxwait 0
> +EOF
> +
> +cat<<EOF>/etc/network/if-pre-up.d/lxcbr0
> +#! /bin/sh
> +
> +if test "x\$IFACE" = xlxcbr0 ; then
> +        brctl show |grep lxcbr0 > /dev/null 2>/dev/null
> +        if [ \$? != 0 ] ; then
> +                brctl addbr lxcbr0
> +                brctl addif lxcbr0 eth0
> +                ip addr flush eth0
> +                ifconfig eth0 up
> +        fi
> +fi
> +EOF
> +chmod 755 /etc/network/if-pre-up.d/lxcbr0
> +}
> --
> 1.8.3.2
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

