Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31321C4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 12:12:33 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.11134.1713442350080636770
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 18 Apr 2024 05:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g2px6We4;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ab88634cfaso696179a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Apr 2024 05:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713442349; x=1714047149; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g1qDnJ2ajCboLtUegaWoqsl4UXTrzQRtWYzEeHbXrmM=;
        b=g2px6We43OdIE9KmWBetNnY/LKv3+aJ0bo9bVKrALUcIqAUkAEJErVNj2K7sVabogA
         wWEzdnjzi8dWUzYr9Qsqm0xDFaGlhCYJw8SQLBD6ajjhaXIejF2v/bvCQ+h5/tv9lSuN
         Y29Bs/C+9dVCZmXaseYFXZbNy9nDhZ9qJE3JxPAU7O4ECPERl7ZwmdvJHv748FJxkFnl
         oM2JNlE4paVxXwaDDK++ouSC1QlQdOgurq+4wLhpEyp8XLoex6bubehJjt8ZboIZLaP5
         bzYT3Ch/WyGGBPODl7qd3unDAoeIMhmsmDiwqZMFrBlyWRvkE7obO2zxtC3REIRsc1Ht
         EmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713442349; x=1714047149;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1qDnJ2ajCboLtUegaWoqsl4UXTrzQRtWYzEeHbXrmM=;
        b=c85eceaBI4EimnRhnHczrcGRHJ9gtSjmwqeyojA5kxQAYPwt9NtrOwdffsuwSU2pbx
         2ZoTwc//d8YgQr5jt0VWeSh1r8+CUUz9AfifAN8rmmtKlxxIeooRJwKjgfr1hq6H7HgR
         MYw7i64SHyqjnJZg0FTd50TCSaTImZNdkgrNQiEG1G6Ik9lmjLIeNHacwUwv4eQEAev3
         Ci9uMvtiVh3eWG2efpToU3an2frYmjLHms9JB8VKYw5ZEVWKyXbUpTAHapOUqS8/CkOT
         1et3In3ipXwj38O5CaReWJidZCb/vTOtpdwHkh2g48AwDhqU7qKonc58PSlmwDMjSrQV
         5pbA==
X-Gm-Message-State: AOJu0YyaKqoJnpGiYOiE2ld0M2YwGaRijOK6gJ1NT4akG+FKZds4tUBV
	10WgSOxNuOFJrJFVRWl0gO56LgpWPmOwSfQSnJVC2Dxb5iVlrp9s3uEteWkhn+XLa1Bog+Eg8Ld
	wF6Q4RPdRst8SF27DQh7GUfrzWkk=
X-Google-Smtp-Source: AGHT+IGgRKRzV478aRMFfHD0R7lVIMTOkJnOm9pdq5fxaWABGk6XscdvZDRC6oLJ3bwgUQZLnq5wUEo5aMNyq1Xy4Ec=
X-Received: by 2002:a17:90b:3941:b0:2ac:257d:3e7c with SMTP id
 oe1-20020a17090b394100b002ac257d3e7cmr237166pjb.9.1713442349039; Thu, 18 Apr
 2024 05:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240418083047.628481-1-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20240418083047.628481-1-xiangyu.chen@eng.windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 18 Apr 2024 08:12:13 -0400
Message-ID: <CADkTA4PBoM5mWay+H_YDCGqYMs--fo6U4myVYN0ZiA4pz+t0ug@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] lxc: update to 6.0.0
To: xiangyu.chen@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000008ecd3906165de242"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Apr 2024 12:12:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8685

--0000000000008ecd3906165de242
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm not taking any package updates at this time, but I'll look at this when
I do go through the next update cycle.

Bruce

On Thu, Apr 18, 2024 at 4:31=E2=80=AFAM Xiangyu Chen via lists.yoctoproject=
.org
<xiangyu.chen=3Deng.windriver.com@lists.yoctoproject.org> wrote:

> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> Changes:
> 17ac6f691 lxc.spec: Align SPDX license id
> 5fe2de84c Makefile: Align SPDX license id
> 97f93be72 meson: Align SPDX license id
> d4cd3741d COPYING: Clarify licensing of files without SPDX
> 8e67eb07c doc: Add SPDX headers and remove Author field
> cb94edf53 src/include: Add SPDX headers
> 7bc33ef6e src/tests: Add SPDX headers
> 007642c89 hooks: Add SPDX headers
> 1e9e66be3 lxc.spec: Clear default changelog
> 202d649d1 lxc.spec: Use SPDX
> 85abd4026 template: Use SPDX
> a074b3d27 config/yum: Use SPDX header
> 7ed43e5e9 COPYING: Remove whitespace
> 522721216 MAINTAINERS: Remove Dwight from the maintainer list
> 08bf8b9e2 lxc-checkconfig: Fix shellcheck
> 0f18db543 lxc-checkconfig: Show namespace limits
> f71b8e3f8 lxc-ls: list names with whitespaces in `--active`.
> 816b8973d lxc/tools: set default log_priority to ERROR
> 989ea3969 tools/lxc_autostart: don't fail when there are no containers
> dc4df2335 lxc/lxccontainer: specify file mode in open() call inside
> mod_rdep
> 630b46ed2 lxc/confile: do not print excess space before scale suffix for
> time.offset.boot
> 796f2ccb7 lxc/confile: do not print newline symbol in getter for
> lxc.time.offset.*
> dcc4fb929 tests/parse_config_file: fix some typos
> 6fea67429 tests/parse_config_file: add tests for lxc.time.offset.*
> ad8f55445 tree-wide: replace multiply_overflow with check_mul_overflow
> 4464cee19 lxccontainer: rework copy_file()
> 9d1aa932d lxccontainer: improve mod_rdep()
> 81c1bbf45 Revert "lxccontainer: fixes"
> 82fe01821 src/lxc/syscall_numbers.h: drop define -1
> 590a95d83 rexec: Avoid invalid free in rexec failure path
> f9978b179 README: Correct 'armvl7' to 'armv7l'
> 046b63cd2 unshare: simplify lookup_name
> 7452ee8ab lxc-unshare: fix an buffer overflow issue in lxc_unshare
> e88883445 lxc-net: Enable IPv6 by default
> d78ca00bc tests/meson: attempt to fix ossfuzz builds
> d18f993b3 github: master -> main
> 86799f554 meson: link with liblxc dynamically everywhere if possible
> b90fecfda network: use IN_LIBLXC
> 9eee450d2 storage_utils: move get_fssize to utils
> 6eb0a73e2 storage_utils: unhide and rename is_valid_storage_type to
> lxc_is_valid_storage_type
> 42eeffcb0 confile: unhide lxc_config_parse_arch() helper
> 9bb318881 conf: reorganize/split code to utils.c
> 863c59dc3 conf: reorganize/split code to idmap_utils.c
> b7591ad49 confile: unhide lxc_config_define*() helpers
> f14656ebf meson: introduce IN_LIBLXC preprocessor macro
> 672b2172d confile: move lxc_fill_elevated_privileges() to tools/lxc_attac=
h
> 8f9733d75 tests: remove old and broken cgroup handling code from tests
> d51ea224e config: apparmor: add AppArmor profile for lxc-copy
> 627bb9460 tests: lxc-test-usernic: use iproute tool instead of brctl
> df0665b6d oci: resolve cross-filesystem blob caching failure
> ec85e5ca4 lxc-test-usernic: drop cgroup handling
> 27ec0b0f6 test-usernic: don't use ifconfig
> 44e845b3c Add x32 to the list of recognized architectures
> 07e3a516e lxc-download, lxc-local: preserve xattrs on unpack
> 9ac7c4895 tree-wide: use container_uses_namespace() in less trivial cases
> 64341ce7b tree-wide: use container_uses_namespace() helper
> 6b40e66c1 Fix error message.
> c8189ee2a Add verbose output in download template.
> 84cc3155a Align columns in lxc-download.in template
> 872db5424 build: add more options for customizing install
> df17ac417 Add loongarch64 support
> 112d5615e build(deps): bump actions/upload-artifact from 3 to 4
> 789457f1a config: try to create workdir if not exist
> 86f5c1226 lxc-local: Add --no-dev option to exclude /dev from the fstree
> f885a3c56 lxc-local: Re-organize code to use more functions
> 7c025072e lxc-local: Improve usage info
> faa38a197 lxc-local: Change LXC_CONFIG to LXC_METADATA to match args and
> be more clear
> d65fe1b27 Disable IPv6 link-local addresses for bridged veth
> 8cff8fa1a don't try to delete vlan 0 from veth
> 0e932812a conf: fix ephemeral copies
> abffab441 config/init: Drop upstart files
> 79a4a3cf8 doc: remove the warning mentionning upstart
> 7bf1695d0 hooks/ubuntu-cloud-prep: remove upstart handling
> fb73c18d2 meson: Remove support for upstart
> cc6819c69 reset root_nsuid_map and root_nsgid_map when idmaps is cleared
> a87d6fcc9 lxc/checkconfig: use multiline `echo`
> f3e01fa80 lxc/checkconfig: replace `echo -n` by printf
> ba4f810bc lxc/checkconfig: minor cosmetic change
> d52c345c8 lxc/checkconfig: avoid subshell (SC2235)
> f84f03d1d lxc/checkconfig: remove superfluous (..) around test command
> (SC2234)
> 74b9faa64 lxc/checkconfig: check exit code directly (SC2181)
> 5cc69e440 lxc/checkconfig: replace `! -z` by `-n` (SC2236)
> a4684eb11 lxc/checkconfig: add missing quotes to please shellcheck
> 8a611c0b2 lxc/checkconfig: remove some unneeded `echo -n`
> cb2574319 lxc/checkconfig: replace `type` by `command`
> 003efe6db lxc/checkconfig: replace `cat | grep` with `grep`
> adadfa372 lxc/lxccontainer: fix do_lxcapi_set_timeout retval
> c02367e59 containers in the FREEZING state also need to be unfreeze
> aca53bcf7 build(deps): bump actions/checkout from 3 to 4
> 84169158f lxccontainer.h: Move new fields to the end
> e2696df93 Remove references to LXD
> 7cec54455 Update console perms to 0600
> 3f45443fd Fix start api call to split quoted strings in execute or init
> command.
>
> Local patches modification:
> Removed two patches due to they are available in the code:
> 0001-lxc-test-usernic-drop-cgroup-handling.patch
> 0001-tests-remove-old-and-broken-cgroup-handling-code-fro.patch
>
> Refreshed templates-use-curl-instead-of-wget.patch
>
> Ptest modification:
> Released lxc-test-shutdowntest and lxc-test-state-server due to
> those back to normal
> lxc-test-no-new-privs and lxc-test-checkpoint-restore are
> broken test, already reported to upstream[1][2], move them to blacklist
> until upstream fixed them.
> lxc-test-usernic always fails when use ptest-runner, but normal with
> run-ptest by manual.
>
> Ref:
> [1] https://github.com/lxc/lxc/issues/4296
> [2] https://github.com/lxc/lxc/issues/4435
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  ...xc-test-usernic-drop-cgroup-handling.patch |  61 -----------
>  ...-and-broken-cgroup-handling-code-fro.patch | 103 ------------------
>  recipes-containers/lxc/files/run-ptest        |  12 +-
>  .../templates-use-curl-instead-of-wget.patch  |  13 ++-
>  recipes-containers/lxc/lxc_git.bb             |  10 +-
>  5 files changed, 20 insertions(+), 179 deletions(-)
>  delete mode 100644
> recipes-containers/lxc/files/0001-lxc-test-usernic-drop-cgroup-handling.p=
atch
>  delete mode 100644
> recipes-containers/lxc/files/0001-tests-remove-old-and-broken-cgroup-hand=
ling-code-fro.patch
>
> diff --git
> a/recipes-containers/lxc/files/0001-lxc-test-usernic-drop-cgroup-handling=
.patch
> b/recipes-containers/lxc/files/0001-lxc-test-usernic-drop-cgroup-handling=
.patch
> deleted file mode 100644
> index 162e8f9d..00000000
> ---
> a/recipes-containers/lxc/files/0001-lxc-test-usernic-drop-cgroup-handling=
.patch
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -From ec85e5ca4953292c4341497704ce738669a79b64 Mon Sep 17 00:00:00 2001
> -From: Serge Hallyn <serge@hallyn.com>
> -Date: Fri, 2 Feb 2024 10:41:11 -0600
> -Subject: [PATCH] lxc-test-usernic: drop cgroup handling
> -
> -This stuff is not needed in a modern systemd based system, and in fact
> -breaks.  It would probably be better to detect such a system so that a
> -non-systemd box can still run this test.  But I'm not sure what would be
> -reliable.
> -
> -Upstream-Status: Backport from
> -[
> https://github.com/lxc/lxc/commit/ec85e5ca4953292c4341497704ce738669a79b6=
4
> ]
> -
> -Signed-off-by: Serge Hallyn <serge@hallyn.com>
> -Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ----
> - src/tests/lxc-test-usernic.in | 28 ----------------------------
> - 1 file changed, 28 deletions(-)
> -
> -diff --git a/src/tests/lxc-test-usernic.in b/src/tests/
> lxc-test-usernic.in
> -index 9af8678f3..49fd5e3f7 100755
> ---- a/src/tests/lxc-test-usernic.in
> -+++ b/src/tests/lxc-test-usernic.in
> -@@ -80,34 +80,6 @@ lxc.idmap =3D u 0 910000 10000
> - lxc.idmap =3D g 0 910000 10000
> - EOF
> -
> --if command -v cgm >/dev/null 2>&1; then
> --      cgm create all usernic-user
> --      cgm chown all usernic-user $(id -u usernic-user) $(id -g
> usernic-user)
> --      cgm movepid all usernic-user $$
> --elif [ -e /sys/fs/cgroup/cgmanager/sock ]; then
> --      for d in $(cut -d : -f 2 /proc/self/cgroup); do
> --              dbus-send --print-reply
> --address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \
> --                      --type=3Dmethod_call /org/linuxcontainers/cgmanag=
er
> org.linuxcontainers.cgmanager0_0.Create \
> --                      string:$d string:usernic-user >/dev/null
> --
> --              dbus-send --print-reply
> --address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \
> --                      --type=3Dmethod_call /org/linuxcontainers/cgmanag=
er
> org.linuxcontainers.cgmanager0_0.Chown \
> --                      string:$d string:usernic-user int32:$(id -u
> usernic-user) int32:$(id -g usernic-user) >/dev/null
> --
> --              dbus-send --print-reply
> --address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \
> --                      --type=3Dmethod_call /org/linuxcontainers/cgmanag=
er
> org.linuxcontainers.cgmanager0_0.MovePid \
> --                      string:$d string:usernic-user int32:$$ >/dev/null
> --      done
> --else
> --      for d in /sys/fs/cgroup/*; do
> --              [ "$d" =3D "/sys/fs/cgroup/unified" ] && continue
> --              [ -f $d/cgroup.clone_children ] && echo 1 >
> $d/cgroup.clone_children
> --              [ ! -d $d/lxctest ] && mkdir $d/lxctest
> --              chown -R usernic-user: $d/lxctest
> --              echo $$ > $d/lxctest/tasks
> --      done
> --fi
> --
> - mkdir -p /run/user/$(id -u usernic-user)
> - chown -R usernic-user: /run/user/$(id -u usernic-user) /home/usernic-us=
er
> -
> ---
> -2.35.5
> -
> diff --git
> a/recipes-containers/lxc/files/0001-tests-remove-old-and-broken-cgroup-ha=
ndling-code-fro.patch
> b/recipes-containers/lxc/files/0001-tests-remove-old-and-broken-cgroup-ha=
ndling-code-fro.patch
> deleted file mode 100644
> index bf8df795..00000000
> ---
> a/recipes-containers/lxc/files/0001-tests-remove-old-and-broken-cgroup-ha=
ndling-code-fro.patch
> +++ /dev/null
> @@ -1,103 +0,0 @@
> -From 8f9733d756361ff8f8d8d589f286c0e064b1195d Mon Sep 17 00:00:00 2001
> -From: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
> -Date: Thu, 15 Feb 2024 18:13:05 +0100
> -Subject: [PATCH] tests: remove old and broken cgroup handling code from
> tests
> -
> -We have removed the same piece of code in
> -ec85e5ca495 ("lxc-test-usernic: drop cgroup handling")
> -let's do the same for two other tests.
> -
> -This fixes autopkgtests.
> -
> -Upstream-Status: Backport from
> -[
> https://github.com/lxc/lxc/commit/8f9733d756361ff8f8d8d589f286c0e064b1195=
d
> ]
> -
> -Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.co=
m
> >
> -Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ----
> - src/tests/lxc-test-apparmor-mount | 29 -----------------------------
> - src/tests/lxc-test-unpriv         | 28 ----------------------------
> - 2 files changed, 57 deletions(-)
> -
> -diff --git a/src/tests/lxc-test-apparmor-mount
> b/src/tests/lxc-test-apparmor-mount
> -index 7c9d9ad50..ddf783d4b 100755
> ---- a/src/tests/lxc-test-apparmor-mount
> -+++ b/src/tests/lxc-test-apparmor-mount
> -@@ -119,35 +119,6 @@ chown -R $TUSER: /run/user/$(id -u $TUSER)
> -
> - cd $HDIR
> -
> --if command -v cgm >/dev/null 2>&1; then
> --      cgm create all $TUSER
> --      cgm chown all $TUSER $(id -u $TUSER) $(id -g $TUSER)
> --      cgm movepid all $TUSER $$
> --elif [ -e /sys/fs/cgroup/cgmanager/sock ]; then
> --      for d in $(cut -d : -f 2 /proc/self/cgroup); do
> --              dbus-send --print-reply
> --address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \
> --                      --type=3Dmethod_call /org/linuxcontainers/cgmanag=
er
> org.linuxcontainers.cgmanager0_0.Create \
> --                      string:$d string:$TUSER >/dev/null
> --
> --              dbus-send --print-reply
> --address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \
> --                      --type=3Dmethod_call /org/linuxcontainers/cgmanag=
er
> org.linuxcontainers.cgmanager0_0.Chown \
> --                      string:$d string:$TUSER int32:$(id -u $TUSER)
> int32:$(id -g $TUSER) >/dev/null
> --
> --              dbus-send --print-reply
> --address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \
> --                      --type=3Dmethod_call /org/linuxcontainers/cgmanag=
er
> org.linuxcontainers.cgmanager0_0.MovePid \
> --                      string:$d string:$TUSER int32:$$ >/dev/null
> --      done
> --else
> --      for d in /sys/fs/cgroup/*; do
> --              [ "$d" =3D "/sys/fs/cgroup/unified" ] && continue
> --              [ -f $d/cgroup.clone_children ] && echo 1 >
> $d/cgroup.clone_children
> --              [ ! -d $d/lxctest ] && mkdir $d/lxctest
> --              chown -R $TUSER: $d/lxctest
> --              echo $$ > $d/lxctest/tasks
> --      done
> --fi
> --
> --
> - run_cmd lxc-create -t busybox -n $cname
> -
> - echo "test default confined container"
> -diff --git a/src/tests/lxc-test-unpriv b/src/tests/lxc-test-unpriv
> -index 8fb9106d6..426add9da 100755
> ---- a/src/tests/lxc-test-unpriv
> -+++ b/src/tests/lxc-test-unpriv
> -@@ -130,34 +130,6 @@ chown -R $TUSER: /run/user/$(id -u $TUSER)
> -
> - cd $HDIR
> -
> --if command -v cgm >/dev/null 2>&1; then
> --      cgm create all $TUSER
> --      cgm chown all $TUSER $(id -u $TUSER) $(id -g $TUSER)
> --      cgm movepid all $TUSER $$
> --elif [ -e /sys/fs/cgroup/cgmanager/sock ]; then
> --      for d in $(cut -d : -f 2 /proc/self/cgroup); do
> --              dbus-send --print-reply
> --address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \
> --                      --type=3Dmethod_call /org/linuxcontainers/cgmanag=
er
> org.linuxcontainers.cgmanager0_0.Create \
> --                      string:$d string:$TUSER >/dev/null
> --
> --              dbus-send --print-reply
> --address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \
> --                      --type=3Dmethod_call /org/linuxcontainers/cgmanag=
er
> org.linuxcontainers.cgmanager0_0.Chown \
> --                      string:$d string:$TUSER int32:$(id -u $TUSER)
> int32:$(id -g $TUSER) >/dev/null
> --
> --              dbus-send --print-reply
> --address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \
> --                      --type=3Dmethod_call /org/linuxcontainers/cgmanag=
er
> org.linuxcontainers.cgmanager0_0.MovePid \
> --                      string:$d string:$TUSER int32:$$ >/dev/null
> --      done
> --else
> --      for d in /sys/fs/cgroup/*; do
> --              [ "$d" =3D "/sys/fs/cgroup/unified" ] && continue
> --              [ -f $d/cgroup.clone_children ] && echo 1 >
> $d/cgroup.clone_children
> --              [ ! -d $d/lxctest ] && mkdir $d/lxctest
> --              chown -R $TUSER: $d/lxctest
> --              echo $$ > $d/lxctest/tasks
> --      done
> --fi
> --
> - run_cmd lxc-create -t busybox -n c1 -l trace -o "${UNPRIV_LOG}"
> -
> - # Make sure we can start it - twice
> ---
> -2.35.5
> -
> diff --git a/recipes-containers/lxc/files/run-ptest
> b/recipes-containers/lxc/files/run-ptest
> index 196adb04..278107d9 100644
> --- a/recipes-containers/lxc/files/run-ptest
> +++ b/recipes-containers/lxc/files/run-ptest
> @@ -12,9 +12,15 @@ blacklist=3D"$blacklist lxc-test-apparmor"
>  blacklist=3D"$blacklist lxc-test-apparmor-mount"
>  #lxc-test-get_item would report Built without AppArmor support error
>  blacklist=3D"$blacklist lxc-test-get_item"
> -# These currently hang so skip them until someone fixes them up
> -blacklist=3D"$blacklist lxc-test-shutdowntest"
> -blacklist=3D"$blacklist lxc-test-state-server"
> +# This is a broken case, also fails on opensuse, already reported to
> +# upstream https://github.com/lxc/lxc/issues/4296
> +blacklist=3D"$blacklist lxc-test-no-new-privs"
> +# lxc doesn't adapt the criu's new mount flag, that cause restore fails
> +# already reported to upstream https://github.com/lxc/lxc/issues/4435
> +blacklist=3D"$blacklist lxc-test-checkpoint-restore"
> +# if we run "run-ptest" under /usr/lib64/lxc/ptest, the result is normal
> +# but it would be failed when using "ptest-runner lxc"
> +blacklist=3D"$blacklist lxc-test-usernic"
>
>  # Tests in firstrunlist will be run first
>  firstrunlist=3D""
> diff --git
> a/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
> b/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
> index e9af8335..3ef66138 100644
> --- a/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.pat=
ch
> +++ b/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.pat=
ch
> @@ -10,6 +10,7 @@ Upstream-Status: Inappropriate [embedded specific]
>  Signed-off-by: Joakim Roubert <joakimr@axis.com>
>  Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
>  Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>  ---
>   templates/lxc-download.in | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> @@ -18,7 +19,7 @@ diff --git a/templates/lxc-download.in b/templates/
> lxc-download.in
>  index a62ddf482..690307338 100755
>  --- a/templates/lxc-download.in
>  +++ b/templates/lxc-download.in
> -@@ -59,9 +59,9 @@ cleanup() {
> +@@ -45,9 +45,9 @@ cleanup() {
>     fi
>   }
>
> @@ -30,16 +31,16 @@ index a62ddf482..690307338 100755
>         return 0
>       fi
>     done
> -@@ -70,7 +70,7 @@ wget_wrapper() {
> - }
> -
> - download_file() {
> +@@ -59,7 +59,7 @@ download_file() {
> +   if [ "${DOWNLOAD_VERBOSE}" =3D "true" ]; then
> +     echo "Download file: https://${DOWNLOAD_SERVER}$1"
> +   fi
>  -  if ! wget_wrapper --user-agent=3D"lxc/@PACKAGE_VERSION@
> compat:${DOWNLOAD_COMPAT_LEVEL}" -T 30 -q "https://${DOWNLOAD_SERVER}/$1"
> -O "$2" >/dev/null 2>&1; then
>  +  if ! curl_wrapper -L --user-agent "lxc/@PACKAGE_VERSION@
> compat:${DOWNLOAD_COMPAT_LEVEL}" -m 30 -s "https://${DOWNLOAD_SERVER}/$1"
> -o "$2" >/dev/null 2>&1; then
>       if [ "$3" =3D "noexit" ]; then
>         return 1
>       else
> -@@ -176,7 +176,7 @@ while :; do
> +@@ -167,7 +167,7 @@ while :; do
>   done
>
>   # Check for required binaries
> diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/
> lxc_git.bb
> index ee0e442f..379b4ecd 100644
> --- a/recipes-containers/lxc/lxc_git.bb
> +++ b/recipes-containers/lxc/lxc_git.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079008b364516c
>
>  file://LICENSE.GPL2;md5=3D751419260aa954499f7abaabaa882bbe \
>  "
>
> -DEPENDS =3D "libxml2 libcap"
> +DEPENDS =3D "libxml2 libcap dbus"
>  RDEPENDS:${PN} =3D " \
>                 rsync \
>                 curl \
> @@ -36,7 +36,7 @@ RDEPENDS:${PN}-ptest +=3D "file make gmp nettle gnutls
> bash libgcc"
>
>  RDEPENDS:${PN}-networking +=3D "iptables"
>
> -SRC_URI =3D "git://github.com/lxc/lxc.git;branch=3Dstable-5.0;protocol=
=3Dhttps
> \
> +SRC_URI =3D "git://github.com/lxc/lxc.git;branch=3Dstable-6.0;protocol=
=3Dhttps
> \
>         file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
>         file://run-ptest \
>         file://templates-actually-create-DOWNLOAD_TEMP-directory.patch \
> @@ -47,12 +47,10 @@ SRC_URI =3D "git://
> github.com/lxc/lxc.git;branch=3Dstable-5.0;protocol=3Dhttps \
>
> file://0001-template-if-busybox-contains-init-use-it-in-containe.patch \
>         file://dnsmasq.conf \
>         file://lxc-net \
> -       file://0001-lxc-test-usernic-drop-cgroup-handling.patch \
> -
>  file://0001-tests-remove-old-and-broken-cgroup-handling-code-fro.patch \
>         "
>
> -SRCREV =3D "cb8e38aca27a23964941f0f011a8919aab8bebab"
> -PV =3D "5.0.3+git"
> +SRCREV =3D "3dee5fb88c6f77496dbcab46f31bcd891c9ee4e0"
> +PV =3D "6.0.0+git"
>
>  S =3D "${WORKDIR}/git"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8684):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8684
> Mute This Topic: https://lists.yoctoproject.org/mt/105594307/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000008ecd3906165de242
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">I&#=
39;m not taking any package updates at this time, but I&#39;ll look at this=
 when I do go through the next update cycle.</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Bruce</div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 18, 2024 at 4:31=E2=80=AFAM Xia=
ngyu Chen via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.=
org</a> &lt;xiangyu.chen=3D<a href=3D"mailto:eng.windriver.com@lists.yoctop=
roject.org">eng.windriver.com@lists.yoctoproject.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">From: Xiangyu Chen &lt;=
<a href=3D"mailto:xiangyu.chen@windriver.com" target=3D"_blank">xiangyu.che=
n@windriver.com</a>&gt;<br>
<br>
Changes:<br>
17ac6f691 lxc.spec: Align SPDX license id<br>
5fe2de84c Makefile: Align SPDX license id<br>
97f93be72 meson: Align SPDX license id<br>
d4cd3741d COPYING: Clarify licensing of files without SPDX<br>
8e67eb07c doc: Add SPDX headers and remove Author field<br>
cb94edf53 src/include: Add SPDX headers<br>
7bc33ef6e src/tests: Add SPDX headers<br>
007642c89 hooks: Add SPDX headers<br>
1e9e66be3 lxc.spec: Clear default changelog<br>
202d649d1 lxc.spec: Use SPDX<br>
85abd4026 template: Use SPDX<br>
a074b3d27 config/yum: Use SPDX header<br>
7ed43e5e9 COPYING: Remove whitespace<br>
522721216 MAINTAINERS: Remove Dwight from the maintainer list<br>
08bf8b9e2 lxc-checkconfig: Fix shellcheck<br>
0f18db543 lxc-checkconfig: Show namespace limits<br>
f71b8e3f8 lxc-ls: list names with whitespaces in `--active`.<br>
816b8973d lxc/tools: set default log_priority to ERROR<br>
989ea3969 tools/lxc_autostart: don&#39;t fail when there are no containers<=
br>
dc4df2335 lxc/lxccontainer: specify file mode in open() call inside mod_rde=
p<br>
630b46ed2 lxc/confile: do not print excess space before scale suffix for ti=
me.offset.boot<br>
796f2ccb7 lxc/confile: do not print newline symbol in getter for lxc.time.o=
ffset.*<br>
dcc4fb929 tests/parse_config_file: fix some typos<br>
6fea67429 tests/parse_config_file: add tests for lxc.time.offset.*<br>
ad8f55445 tree-wide: replace multiply_overflow with check_mul_overflow<br>
4464cee19 lxccontainer: rework copy_file()<br>
9d1aa932d lxccontainer: improve mod_rdep()<br>
81c1bbf45 Revert &quot;lxccontainer: fixes&quot;<br>
82fe01821 src/lxc/syscall_numbers.h: drop define -1<br>
590a95d83 rexec: Avoid invalid free in rexec failure path<br>
f9978b179 README: Correct &#39;armvl7&#39; to &#39;armv7l&#39;<br>
046b63cd2 unshare: simplify lookup_name<br>
7452ee8ab lxc-unshare: fix an buffer overflow issue in lxc_unshare<br>
e88883445 lxc-net: Enable IPv6 by default<br>
d78ca00bc tests/meson: attempt to fix ossfuzz builds<br>
d18f993b3 github: master -&gt; main<br>
86799f554 meson: link with liblxc dynamically everywhere if possible<br>
b90fecfda network: use IN_LIBLXC<br>
9eee450d2 storage_utils: move get_fssize to utils<br>
6eb0a73e2 storage_utils: unhide and rename is_valid_storage_type to lxc_is_=
valid_storage_type<br>
42eeffcb0 confile: unhide lxc_config_parse_arch() helper<br>
9bb318881 conf: reorganize/split code to utils.c<br>
863c59dc3 conf: reorganize/split code to idmap_utils.c<br>
b7591ad49 confile: unhide lxc_config_define*() helpers<br>
f14656ebf meson: introduce IN_LIBLXC preprocessor macro<br>
672b2172d confile: move lxc_fill_elevated_privileges() to tools/lxc_attach<=
br>
8f9733d75 tests: remove old and broken cgroup handling code from tests<br>
d51ea224e config: apparmor: add AppArmor profile for lxc-copy<br>
627bb9460 tests: lxc-test-usernic: use iproute tool instead of brctl<br>
df0665b6d oci: resolve cross-filesystem blob caching failure<br>
ec85e5ca4 lxc-test-usernic: drop cgroup handling<br>
27ec0b0f6 test-usernic: don&#39;t use ifconfig<br>
44e845b3c Add x32 to the list of recognized architectures<br>
07e3a516e lxc-download, lxc-local: preserve xattrs on unpack<br>
9ac7c4895 tree-wide: use container_uses_namespace() in less trivial cases<b=
r>
64341ce7b tree-wide: use container_uses_namespace() helper<br>
6b40e66c1 Fix error message.<br>
c8189ee2a Add verbose output in download template.<br>
84cc3155a Align columns in <a href=3D"http://lxc-download.in" rel=3D"norefe=
rrer" target=3D"_blank">lxc-download.in</a> template<br>
872db5424 build: add more options for customizing install<br>
df17ac417 Add loongarch64 support<br>
112d5615e build(deps): bump actions/upload-artifact from 3 to 4<br>
789457f1a config: try to create workdir if not exist<br>
86f5c1226 lxc-local: Add --no-dev option to exclude /dev from the fstree<br=
>
f885a3c56 lxc-local: Re-organize code to use more functions<br>
7c025072e lxc-local: Improve usage info<br>
faa38a197 lxc-local: Change LXC_CONFIG to LXC_METADATA to match args and be=
 more clear<br>
d65fe1b27 Disable IPv6 link-local addresses for bridged veth<br>
8cff8fa1a don&#39;t try to delete vlan 0 from veth<br>
0e932812a conf: fix ephemeral copies<br>
abffab441 config/init: Drop upstart files<br>
79a4a3cf8 doc: remove the warning mentionning upstart<br>
7bf1695d0 hooks/ubuntu-cloud-prep: remove upstart handling<br>
fb73c18d2 meson: Remove support for upstart<br>
cc6819c69 reset root_nsuid_map and root_nsgid_map when idmaps is cleared<br=
>
a87d6fcc9 lxc/checkconfig: use multiline `echo`<br>
f3e01fa80 lxc/checkconfig: replace `echo -n` by printf<br>
ba4f810bc lxc/checkconfig: minor cosmetic change<br>
d52c345c8 lxc/checkconfig: avoid subshell (SC2235)<br>
f84f03d1d lxc/checkconfig: remove superfluous (..) around test command (SC2=
234)<br>
74b9faa64 lxc/checkconfig: check exit code directly (SC2181)<br>
5cc69e440 lxc/checkconfig: replace `! -z` by `-n` (SC2236)<br>
a4684eb11 lxc/checkconfig: add missing quotes to please shellcheck<br>
8a611c0b2 lxc/checkconfig: remove some unneeded `echo -n`<br>
cb2574319 lxc/checkconfig: replace `type` by `command`<br>
003efe6db lxc/checkconfig: replace `cat | grep` with `grep`<br>
adadfa372 lxc/lxccontainer: fix do_lxcapi_set_timeout retval<br>
c02367e59 containers in the FREEZING state also need to be unfreeze<br>
aca53bcf7 build(deps): bump actions/checkout from 3 to 4<br>
84169158f lxccontainer.h: Move new fields to the end<br>
e2696df93 Remove references to LXD<br>
7cec54455 Update console perms to 0600<br>
3f45443fd Fix start api call to split quoted strings in execute or init com=
mand.<br>
<br>
Local patches modification:<br>
Removed two patches due to they are available in the code:<br>
0001-lxc-test-usernic-drop-cgroup-handling.patch<br>
0001-tests-remove-old-and-broken-cgroup-handling-code-fro.patch<br>
<br>
Refreshed templates-use-curl-instead-of-wget.patch<br>
<br>
Ptest modification:<br>
Released lxc-test-shutdowntest and lxc-test-state-server due to<br>
those back to normal<br>
lxc-test-no-new-privs and lxc-test-checkpoint-restore are<br>
broken test, already reported to upstream[1][2], move them to blacklist<br>
until upstream fixed them.<br>
lxc-test-usernic always fails when use ptest-runner, but normal with<br>
run-ptest by manual.<br>
<br>
Ref:<br>
[1] <a href=3D"https://github.com/lxc/lxc/issues/4296" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/lxc/lxc/issues/4296</a><br>
[2] <a href=3D"https://github.com/lxc/lxc/issues/4435" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/lxc/lxc/issues/4435</a><br>
<br>
Signed-off-by: Xiangyu Chen &lt;<a href=3D"mailto:xiangyu.chen@windriver.co=
m" target=3D"_blank">xiangyu.chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0...xc-test-usernic-drop-cgroup-handling.patch |=C2=A0 61 -----------<=
br>
=C2=A0...-and-broken-cgroup-handling-code-fro.patch | 103 -----------------=
-<br>
=C2=A0recipes-containers/lxc/files/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 12 +-<br>
=C2=A0.../templates-use-curl-instead-of-wget.patch=C2=A0 |=C2=A0 13 ++-<br>
=C2=A0recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferre=
r" target=3D"_blank">lxc_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 10 +-<br>
=C2=A05 files changed, 20 insertions(+), 179 deletions(-)<br>
=C2=A0delete mode 100644 recipes-containers/lxc/files/0001-lxc-test-usernic=
-drop-cgroup-handling.patch<br>
=C2=A0delete mode 100644 recipes-containers/lxc/files/0001-tests-remove-old=
-and-broken-cgroup-handling-code-fro.patch<br>
<br>
diff --git a/recipes-containers/lxc/files/0001-lxc-test-usernic-drop-cgroup=
-handling.patch b/recipes-containers/lxc/files/0001-lxc-test-usernic-drop-c=
group-handling.patch<br>
deleted file mode 100644<br>
index 162e8f9d..00000000<br>
--- a/recipes-containers/lxc/files/0001-lxc-test-usernic-drop-cgroup-handli=
ng.patch<br>
+++ /dev/null<br>
@@ -1,61 +0,0 @@<br>
-From ec85e5ca4953292c4341497704ce738669a79b64 Mon Sep 17 00:00:00 2001<br>
-From: Serge Hallyn &lt;<a href=3D"mailto:serge@hallyn.com" target=3D"_blan=
k">serge@hallyn.com</a>&gt;<br>
-Date: Fri, 2 Feb 2024 10:41:11 -0600<br>
-Subject: [PATCH] lxc-test-usernic: drop cgroup handling<br>
-<br>
-This stuff is not needed in a modern systemd based system, and in fact<br>
-breaks.=C2=A0 It would probably be better to detect such a system so that =
a<br>
-non-systemd box can still run this test.=C2=A0 But I&#39;m not sure what w=
ould be<br>
-reliable.<br>
-<br>
-Upstream-Status: Backport from<br>
-[<a href=3D"https://github.com/lxc/lxc/commit/ec85e5ca4953292c4341497704ce=
738669a79b64" rel=3D"noreferrer" target=3D"_blank">https://github.com/lxc/l=
xc/commit/ec85e5ca4953292c4341497704ce738669a79b64</a>]<br>
-<br>
-Signed-off-by: Serge Hallyn &lt;<a href=3D"mailto:serge@hallyn.com" target=
=3D"_blank">serge@hallyn.com</a>&gt;<br>
-Signed-off-by: Xiangyu Chen &lt;<a href=3D"mailto:xiangyu.chen@windriver.c=
om" target=3D"_blank">xiangyu.chen@windriver.com</a>&gt;<br>
----<br>
- src/tests/<a href=3D"http://lxc-test-usernic.in" rel=3D"noreferrer" targe=
t=3D"_blank">lxc-test-usernic.in</a> | 28 ----------------------------<br>
- 1 file changed, 28 deletions(-)<br>
-<br>
-diff --git a/src/tests/<a href=3D"http://lxc-test-usernic.in" rel=3D"noref=
errer" target=3D"_blank">lxc-test-usernic.in</a> b/src/tests/<a href=3D"htt=
p://lxc-test-usernic.in" rel=3D"noreferrer" target=3D"_blank">lxc-test-user=
nic.in</a><br>
-index 9af8678f3..49fd5e3f7 100755<br>
---- a/src/tests/<a href=3D"http://lxc-test-usernic.in" rel=3D"noreferrer" =
target=3D"_blank">lxc-test-usernic.in</a><br>
-+++ b/src/tests/<a href=3D"http://lxc-test-usernic.in" rel=3D"noreferrer" =
target=3D"_blank">lxc-test-usernic.in</a><br>
-@@ -80,34 +80,6 @@ lxc.idmap =3D u 0 910000 10000<br>
- lxc.idmap =3D g 0 910000 10000<br>
- EOF<br>
- <br>
--if command -v cgm &gt;/dev/null 2&gt;&amp;1; then<br>
--=C2=A0 =C2=A0 =C2=A0 cgm create all usernic-user<br>
--=C2=A0 =C2=A0 =C2=A0 cgm chown all usernic-user $(id -u usernic-user) $(i=
d -g usernic-user)<br>
--=C2=A0 =C2=A0 =C2=A0 cgm movepid all usernic-user $$<br>
--elif [ -e /sys/fs/cgroup/cgmanager/sock ]; then<br>
--=C2=A0 =C2=A0 =C2=A0 for d in $(cut -d : -f 2 /proc/self/cgroup); do<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbus-send --print-reply =
--address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 --type=3Dmethod_call /org/linuxcontainers/cgmanager org.linuxcontainers=
.cgmanager0_0.Create \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 string:$d string:usernic-user &gt;/dev/null<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbus-send --print-reply =
--address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 --type=3Dmethod_call /org/linuxcontainers/cgmanager org.linuxcontainers=
.cgmanager0_0.Chown \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 string:$d string:usernic-user int32:$(id -u usernic-user) int32:$(id -g=
 usernic-user) &gt;/dev/null<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbus-send --print-reply =
--address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 --type=3Dmethod_call /org/linuxcontainers/cgmanager org.linuxcontainers=
.cgmanager0_0.MovePid \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 string:$d string:usernic-user int32:$$ &gt;/dev/null<br>
--=C2=A0 =C2=A0 =C2=A0 done<br>
--else<br>
--=C2=A0 =C2=A0 =C2=A0 for d in /sys/fs/cgroup/*; do<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ &quot;$d&quot; =3D &qu=
ot;/sys/fs/cgroup/unified&quot; ] &amp;&amp; continue<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -f $d/cgroup.clone_chi=
ldren ] &amp;&amp; echo 1 &gt; $d/cgroup.clone_children<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ ! -d $d/lxctest ] &amp=
;&amp; mkdir $d/lxctest<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chown -R usernic-user: $=
d/lxctest<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo $$ &gt; $d/lxctest/=
tasks<br>
--=C2=A0 =C2=A0 =C2=A0 done<br>
--fi<br>
--<br>
- mkdir -p /run/user/$(id -u usernic-user)<br>
- chown -R usernic-user: /run/user/$(id -u usernic-user) /home/usernic-user=
<br>
- <br>
--- <br>
-2.35.5<br>
-<br>
diff --git a/recipes-containers/lxc/files/0001-tests-remove-old-and-broken-=
cgroup-handling-code-fro.patch b/recipes-containers/lxc/files/0001-tests-re=
move-old-and-broken-cgroup-handling-code-fro.patch<br>
deleted file mode 100644<br>
index bf8df795..00000000<br>
--- a/recipes-containers/lxc/files/0001-tests-remove-old-and-broken-cgroup-=
handling-code-fro.patch<br>
+++ /dev/null<br>
@@ -1,103 +0,0 @@<br>
-From 8f9733d756361ff8f8d8d589f286c0e064b1195d Mon Sep 17 00:00:00 2001<br>
-From: Alexander Mikhalitsyn &lt;<a href=3D"mailto:aleksandr.mikhalitsyn@ca=
nonical.com" target=3D"_blank">aleksandr.mikhalitsyn@canonical.com</a>&gt;<=
br>
-Date: Thu, 15 Feb 2024 18:13:05 +0100<br>
-Subject: [PATCH] tests: remove old and broken cgroup handling code from te=
sts<br>
-<br>
-We have removed the same piece of code in<br>
-ec85e5ca495 (&quot;lxc-test-usernic: drop cgroup handling&quot;)<br>
-let&#39;s do the same for two other tests.<br>
-<br>
-This fixes autopkgtests.<br>
-<br>
-Upstream-Status: Backport from<br>
-[<a href=3D"https://github.com/lxc/lxc/commit/8f9733d756361ff8f8d8d589f286=
c0e064b1195d" rel=3D"noreferrer" target=3D"_blank">https://github.com/lxc/l=
xc/commit/8f9733d756361ff8f8d8d589f286c0e064b1195d</a>]<br>
-<br>
-Signed-off-by: Alexander Mikhalitsyn &lt;<a href=3D"mailto:aleksandr.mikha=
litsyn@canonical.com" target=3D"_blank">aleksandr.mikhalitsyn@canonical.com=
</a>&gt;<br>
-Signed-off-by: Xiangyu Chen &lt;<a href=3D"mailto:xiangyu.chen@windriver.c=
om" target=3D"_blank">xiangyu.chen@windriver.com</a>&gt;<br>
----<br>
- src/tests/lxc-test-apparmor-mount | 29 -----------------------------<br>
- src/tests/lxc-test-unpriv=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 28 ---------=
-------------------<br>
- 2 files changed, 57 deletions(-)<br>
-<br>
-diff --git a/src/tests/lxc-test-apparmor-mount b/src/tests/lxc-test-apparm=
or-mount<br>
-index 7c9d9ad50..ddf783d4b 100755<br>
---- a/src/tests/lxc-test-apparmor-mount<br>
-+++ b/src/tests/lxc-test-apparmor-mount<br>
-@@ -119,35 +119,6 @@ chown -R $TUSER: /run/user/$(id -u $TUSER)<br>
- <br>
- cd $HDIR<br>
- <br>
--if command -v cgm &gt;/dev/null 2&gt;&amp;1; then<br>
--=C2=A0 =C2=A0 =C2=A0 cgm create all $TUSER<br>
--=C2=A0 =C2=A0 =C2=A0 cgm chown all $TUSER $(id -u $TUSER) $(id -g $TUSER)=
<br>
--=C2=A0 =C2=A0 =C2=A0 cgm movepid all $TUSER $$<br>
--elif [ -e /sys/fs/cgroup/cgmanager/sock ]; then<br>
--=C2=A0 =C2=A0 =C2=A0 for d in $(cut -d : -f 2 /proc/self/cgroup); do<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbus-send --print-reply =
--address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 --type=3Dmethod_call /org/linuxcontainers/cgmanager org.linuxcontainers=
.cgmanager0_0.Create \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 string:$d string:$TUSER &gt;/dev/null<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbus-send --print-reply =
--address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 --type=3Dmethod_call /org/linuxcontainers/cgmanager org.linuxcontainers=
.cgmanager0_0.Chown \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 string:$d string:$TUSER int32:$(id -u $TUSER) int32:$(id -g $TUSER) &gt=
;/dev/null<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbus-send --print-reply =
--address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 --type=3Dmethod_call /org/linuxcontainers/cgmanager org.linuxcontainers=
.cgmanager0_0.MovePid \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 string:$d string:$TUSER int32:$$ &gt;/dev/null<br>
--=C2=A0 =C2=A0 =C2=A0 done<br>
--else<br>
--=C2=A0 =C2=A0 =C2=A0 for d in /sys/fs/cgroup/*; do<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ &quot;$d&quot; =3D &qu=
ot;/sys/fs/cgroup/unified&quot; ] &amp;&amp; continue<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -f $d/cgroup.clone_chi=
ldren ] &amp;&amp; echo 1 &gt; $d/cgroup.clone_children<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ ! -d $d/lxctest ] &amp=
;&amp; mkdir $d/lxctest<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chown -R $TUSER: $d/lxct=
est<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo $$ &gt; $d/lxctest/=
tasks<br>
--=C2=A0 =C2=A0 =C2=A0 done<br>
--fi<br>
--<br>
--<br>
- run_cmd lxc-create -t busybox -n $cname<br>
- <br>
- echo &quot;test default confined container&quot;<br>
-diff --git a/src/tests/lxc-test-unpriv b/src/tests/lxc-test-unpriv<br>
-index 8fb9106d6..426add9da 100755<br>
---- a/src/tests/lxc-test-unpriv<br>
-+++ b/src/tests/lxc-test-unpriv<br>
-@@ -130,34 +130,6 @@ chown -R $TUSER: /run/user/$(id -u $TUSER)<br>
- <br>
- cd $HDIR<br>
- <br>
--if command -v cgm &gt;/dev/null 2&gt;&amp;1; then<br>
--=C2=A0 =C2=A0 =C2=A0 cgm create all $TUSER<br>
--=C2=A0 =C2=A0 =C2=A0 cgm chown all $TUSER $(id -u $TUSER) $(id -g $TUSER)=
<br>
--=C2=A0 =C2=A0 =C2=A0 cgm movepid all $TUSER $$<br>
--elif [ -e /sys/fs/cgroup/cgmanager/sock ]; then<br>
--=C2=A0 =C2=A0 =C2=A0 for d in $(cut -d : -f 2 /proc/self/cgroup); do<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbus-send --print-reply =
--address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 --type=3Dmethod_call /org/linuxcontainers/cgmanager org.linuxcontainers=
.cgmanager0_0.Create \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 string:$d string:$TUSER &gt;/dev/null<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbus-send --print-reply =
--address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 --type=3Dmethod_call /org/linuxcontainers/cgmanager org.linuxcontainers=
.cgmanager0_0.Chown \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 string:$d string:$TUSER int32:$(id -u $TUSER) int32:$(id -g $TUSER) &gt=
;/dev/null<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbus-send --print-reply =
--address=3Dunix:path=3D/sys/fs/cgroup/cgmanager/sock \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 --type=3Dmethod_call /org/linuxcontainers/cgmanager org.linuxcontainers=
.cgmanager0_0.MovePid \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 string:$d string:$TUSER int32:$$ &gt;/dev/null<br>
--=C2=A0 =C2=A0 =C2=A0 done<br>
--else<br>
--=C2=A0 =C2=A0 =C2=A0 for d in /sys/fs/cgroup/*; do<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ &quot;$d&quot; =3D &qu=
ot;/sys/fs/cgroup/unified&quot; ] &amp;&amp; continue<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -f $d/cgroup.clone_chi=
ldren ] &amp;&amp; echo 1 &gt; $d/cgroup.clone_children<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ ! -d $d/lxctest ] &amp=
;&amp; mkdir $d/lxctest<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chown -R $TUSER: $d/lxct=
est<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo $$ &gt; $d/lxctest/=
tasks<br>
--=C2=A0 =C2=A0 =C2=A0 done<br>
--fi<br>
--<br>
- run_cmd lxc-create -t busybox -n c1 -l trace -o &quot;${UNPRIV_LOG}&quot;=
<br>
- <br>
- # Make sure we can start it - twice<br>
--- <br>
-2.35.5<br>
-<br>
diff --git a/recipes-containers/lxc/files/run-ptest b/recipes-containers/lx=
c/files/run-ptest<br>
index 196adb04..278107d9 100644<br>
--- a/recipes-containers/lxc/files/run-ptest<br>
+++ b/recipes-containers/lxc/files/run-ptest<br>
@@ -12,9 +12,15 @@ blacklist=3D&quot;$blacklist lxc-test-apparmor&quot;<br>
=C2=A0blacklist=3D&quot;$blacklist lxc-test-apparmor-mount&quot;<br>
=C2=A0#lxc-test-get_item would report Built without AppArmor support error<=
br>
=C2=A0blacklist=3D&quot;$blacklist lxc-test-get_item&quot;<br>
-# These currently hang so skip them until someone fixes them up<br>
-blacklist=3D&quot;$blacklist lxc-test-shutdowntest&quot;<br>
-blacklist=3D&quot;$blacklist lxc-test-state-server&quot;<br>
+# This is a broken case, also fails on opensuse, already reported to<br>
+# upstream <a href=3D"https://github.com/lxc/lxc/issues/4296" rel=3D"noref=
errer" target=3D"_blank">https://github.com/lxc/lxc/issues/4296</a><br>
+blacklist=3D&quot;$blacklist lxc-test-no-new-privs&quot;<br>
+# lxc doesn&#39;t adapt the criu&#39;s new mount flag, that cause restore =
fails<br>
+# already reported to upstream <a href=3D"https://github.com/lxc/lxc/issue=
s/4435" rel=3D"noreferrer" target=3D"_blank">https://github.com/lxc/lxc/iss=
ues/4435</a><br>
+blacklist=3D&quot;$blacklist lxc-test-checkpoint-restore&quot;<br>
+# if we run &quot;run-ptest&quot; under /usr/lib64/lxc/ptest, the result i=
s normal<br>
+# but it would be failed when using &quot;ptest-runner lxc&quot;<br>
+blacklist=3D&quot;$blacklist lxc-test-usernic&quot;<br>
<br>
=C2=A0# Tests in firstrunlist will be run first<br>
=C2=A0firstrunlist=3D&quot;&quot;<br>
diff --git a/recipes-containers/lxc/files/templates-use-curl-instead-of-wge=
t.patch b/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.p=
atch<br>
index e9af8335..3ef66138 100644<br>
--- a/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch=
<br>
+++ b/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch=
<br>
@@ -10,6 +10,7 @@ Upstream-Status: Inappropriate [embedded specific]<br>
=C2=A0Signed-off-by: Joakim Roubert &lt;<a href=3D"mailto:joakimr@axis.com"=
 target=3D"_blank">joakimr@axis.com</a>&gt;<br>
=C2=A0Signed-off-by: Yanfei Xu &lt;<a href=3D"mailto:yanfei.xu@windriver.co=
m" target=3D"_blank">yanfei.xu@windriver.com</a>&gt;<br>
=C2=A0Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gm=
ail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
+Signed-off-by: Xiangyu Chen &lt;<a href=3D"mailto:xiangyu.chen@windriver.c=
om" target=3D"_blank">xiangyu.chen@windriver.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 templates/<a href=3D"http://lxc-download.in" rel=3D"noreferrer" targ=
et=3D"_blank">lxc-download.in</a> | 8 ++++----<br>
=C2=A0 1 file changed, 4 insertions(+), 4 deletions(-)<br>
@@ -18,7 +19,7 @@ diff --git a/templates/<a href=3D"http://lxc-download.in"=
 rel=3D"noreferrer" target=3D"_blank">lxc-download.in</a> b/templates/<a hr=
ef=3D"http://lxc-download.in" rel=3D"noreferrer" target=3D"_blank">lxc-down=
load.in</a><br>
=C2=A0index a62ddf482..690307338 100755<br>
=C2=A0--- a/templates/<a href=3D"http://lxc-download.in" rel=3D"noreferrer"=
 target=3D"_blank">lxc-download.in</a><br>
=C2=A0+++ b/templates/<a href=3D"http://lxc-download.in" rel=3D"noreferrer"=
 target=3D"_blank">lxc-download.in</a><br>
-@@ -59,9 +59,9 @@ cleanup() {<br>
+@@ -45,9 +45,9 @@ cleanup() {<br>
=C2=A0 =C2=A0 fi<br>
=C2=A0 }<br>
<br>
@@ -30,16 +31,16 @@ index a62ddf482..690307338 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0<br>
=C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 done<br>
-@@ -70,7 +70,7 @@ wget_wrapper() {<br>
- }<br>
- <br>
- download_file() {<br>
+@@ -59,7 +59,7 @@ download_file() {<br>
+=C2=A0 =C2=A0if [ &quot;${DOWNLOAD_VERBOSE}&quot; =3D &quot;true&quot; ]; =
then<br>
+=C2=A0 =C2=A0 =C2=A0echo &quot;Download file: https://${DOWNLOAD_SERVER}$1=
&quot;<br>
+=C2=A0 =C2=A0fi<br>
=C2=A0-=C2=A0 if ! wget_wrapper --user-agent=3D&quot;lxc/@PACKAGE_VERSION@ =
compat:${DOWNLOAD_COMPAT_LEVEL}&quot; -T 30 -q &quot;https://${DOWNLOAD_SER=
VER}/$1&quot; -O &quot;$2&quot; &gt;/dev/null 2&gt;&amp;1; then<br>
=C2=A0+=C2=A0 if ! curl_wrapper -L --user-agent &quot;lxc/@PACKAGE_VERSION@=
 compat:${DOWNLOAD_COMPAT_LEVEL}&quot; -m 30 -s &quot;https://${DOWNLOAD_SE=
RVER}/$1&quot; -o &quot;$2&quot; &gt;/dev/null 2&gt;&amp;1; then<br>
=C2=A0 =C2=A0 =C2=A0 if [ &quot;$3&quot; =3D &quot;noexit&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1<br>
=C2=A0 =C2=A0 =C2=A0 else<br>
-@@ -176,7 +176,7 @@ while :; do<br>
+@@ -167,7 +167,7 @@ while :; do<br>
=C2=A0 done<br>
<br>
=C2=A0 # Check for required binaries<br>
diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"no=
referrer" target=3D"_blank">lxc_git.bb</a> b/recipes-containers/lxc/<a href=
=3D"http://lxc_git.bb" rel=3D"noreferrer" target=3D"_blank">lxc_git.bb</a><=
br>
index ee0e442f..379b4ecd 100644<br>
--- a/recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferre=
r" target=3D"_blank">lxc_git.bb</a><br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferre=
r" target=3D"_blank">lxc_git.bb</a><br>
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.LGPL2.1;md5=3D4fb=
d65380cdd255951079008b364516c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://LICENSE.GPL2;md5=3D751419260aa954499f7abaabaa882bbe \<br>
=C2=A0&quot;<br>
<br>
-DEPENDS =3D &quot;libxml2 libcap&quot;<br>
+DEPENDS =3D &quot;libxml2 libcap dbus&quot;<br>
=C2=A0RDEPENDS:${PN} =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rsync \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 curl \<br>
@@ -36,7 +36,7 @@ RDEPENDS:${PN}-ptest +=3D &quot;file make gmp nettle gnut=
ls bash libgcc&quot;<br>
<br>
=C2=A0RDEPENDS:${PN}-networking +=3D &quot;iptables&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/lxc/lxc.git;branch=3D=
stable-5.0;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.co=
m/lxc/lxc.git;branch=3Dstable-5.0;protocol=3Dhttps</a> \<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/lxc/lxc.git;branch=3D=
stable-6.0;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.co=
m/lxc/lxc.git;branch=3Dstable-6.0;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc-1.0.0-disable-udhcp-from-busybox-tem=
plate.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://templates-actually-create-DOWNLOAD_TEMP-=
directory.patch \<br>
@@ -47,12 +47,10 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/lx=
c/lxc.git;branch=3Dstable-5.0;protocol=3Dhttps" rel=3D"noreferrer" target=
=3D"_blank">github.com/lxc/lxc.git;branch=3Dstable-5.0;protocol=3Dhttps</a>=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-template-if-busybox-contains-init-u=
se-it-in-containe.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://dnsmasq.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc-net \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-lxc-test-usernic-drop-cgroup-handli=
ng.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-tests-remove-old-and-broken-cgroup-=
handling-code-fro.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRCREV =3D &quot;cb8e38aca27a23964941f0f011a8919aab8bebab&quot;<br>
-PV =3D &quot;5.0.3+git&quot;<br>
+SRCREV =3D &quot;3dee5fb88c6f77496dbcab46f31bcd891c9ee4e0&quot;<br>
+PV =3D &quot;6.0.0+git&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8684): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8684" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8684</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/105594307/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/105594307/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div>

--0000000000008ecd3906165de242--

