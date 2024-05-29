Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23BA2C25B75
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 13:38:10 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.14455.1716989884340086040
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 May 2024 06:38:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OixfiNdq;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-66629f45359so1727911a12.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 May 2024 06:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716989883; x=1717594683; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6CmaART6MlBDdcbtRmjhNpwPOCeLKASWf1+0AyWQSY=;
        b=OixfiNdqDcOtOkTEo4RqPLKozS3T4z4QYtIqJYN6cCAdJJctSiy4wjU4SOSMG7aIQR
         TJKJ7hwlpuniKxmdtuQtwPOWAszmzMf8oiCrsCd4EujFzlQTlhh9/A4UtOkEK021/teQ
         k5ODHf9KFo/pfxrRv2GOwwCelOxTMgicRPJk2VsxuoVh3evBAWk625NuhlwIgd4uN3uZ
         SFeZT9JeTukjC9QFx6QTJ5UNssDPWynsgl/WY92DmRimSeMHCKOsFR3WH+dPWWvkfRwL
         bIfXedqW401ofby/4m6SgSUz2rc1boE/rvsjc4rB3k0C1r3Iu9apLOzkFTBsc8ZpkFJD
         hr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716989883; x=1717594683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q6CmaART6MlBDdcbtRmjhNpwPOCeLKASWf1+0AyWQSY=;
        b=ho9H0k9GpegeB90dFH07nLxwJ7dqJ5aeGEdiXKVlhkuXfkPTGmCbiZ3pUFl6uneopY
         DxkhQ7Svgy3e2wIchFkZJNM1g2glDhq+Rvi3rPmFKBP9sIp1pXnxIcHThk44lNy4VMLT
         OE+WNmMxS67RsUTqMorpq5bB9RMzCq2UhNCj1K224Og0LTDt5amYkaguhSTBO0DydRe7
         ptslsTfsa9aMYfW0mmP/iTw1h7ObuAlx22gZWgbow3atnuQAcJYA+WTXMTHu4jWSgkQv
         2OQ3M+8dVjDBKGm0ns1j6YU4ktzUWC9XKDJ8DsT7BMlnnwCRDuFGRQYqJMicE2yd4X25
         IPYg==
X-Forwarded-Encrypted: i=1; AJvYcCWMjwZMYXsj+xEXg/h3APQeH/coJVZkeWZq0MU46+6Z9YhhTIOgEI3CYpQuU8FinLOUqu+DrUu5WNKgVozQLy6hLOvf2Od1F6k/sgzfZCeYnNitr///JDARYJA=
X-Gm-Message-State: AOJu0YyMsKusX08f2K1kDQVkzd6xXTHodPxPtXdHE5HZ8rJiFMg6QBmE
	wYrrbotnRHTLRgdKx4szm6E4CwdmxDg2iq5gXgzrBswoAcNDRy47lkbgvVVeiGdXnyAKrlkHARB
	GwzqRSmszigIEPaTa5rEnEJrJeyA=
X-Google-Smtp-Source: AGHT+IFH3fTvyRNCGSrShHqGD+xFKv1IyrO2DnG01XR4uM7Xr1p+3KNvJn/OWAEsHh+KWI2Vk9ApOks0Zhay2m9VfPk=
X-Received: by 2002:a17:90b:894:b0:2c0:1dd7:4221 with SMTP id
 98e67ed59e1d1-2c01dd74385mr3549348a91.10.1716989883270; Wed, 29 May 2024
 06:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240418083047.628481-1-xiangyu.chen@eng.windriver.com> <17C75EBD44309AA6.15491@lists.yoctoproject.org>
In-Reply-To: <17C75EBD44309AA6.15491@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 29 May 2024 09:37:52 -0400
Message-ID: <CADkTA4Mg_MJSNEzfJTNd8PjHGMxGDO1Tqku9wmsCyTHffdK5FA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] lxc: update to 6.0.0
To: bruce.ashfield@gmail.com
Cc: xiangyu.chen@eng.windriver.com, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 29 May 2024 13:38:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8781

As part of my fixing of the UNPACKDIR and other recent breakages due to oe-=
core
changes, I did a couple of early package updates. I included lxc, and
just let my scripts
do the uprev work.

Could you break the ptest parts out of this and re-submit them on top
of master-next ?

Bruce

On Thu, Apr 18, 2024 at 8:12=E2=80=AFAM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> I'm not taking any package updates at this time, but I'll look at this wh=
en I do go through the next update cycle.
>
> Bruce
>
> On Thu, Apr 18, 2024 at 4:31=E2=80=AFAM Xiangyu Chen via lists.yoctoproje=
ct.org <xiangyu.chen=3Deng.windriver.com@lists.yoctoproject.org> wrote:
>>
>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>>
>> Changes:
>> 17ac6f691 lxc.spec: Align SPDX license id
>> 5fe2de84c Makefile: Align SPDX license id
>> 97f93be72 meson: Align SPDX license id
>> d4cd3741d COPYING: Clarify licensing of files without SPDX
>> 8e67eb07c doc: Add SPDX headers and remove Author field
>> cb94edf53 src/include: Add SPDX headers
>> 7bc33ef6e src/tests: Add SPDX headers
>> 007642c89 hooks: Add SPDX headers
>> 1e9e66be3 lxc.spec: Clear default changelog
>> 202d649d1 lxc.spec: Use SPDX
>> 85abd4026 template: Use SPDX
>> a074b3d27 config/yum: Use SPDX header
>> 7ed43e5e9 COPYING: Remove whitespace
>> 522721216 MAINTAINERS: Remove Dwight from the maintainer list
>> 08bf8b9e2 lxc-checkconfig: Fix shellcheck
>> 0f18db543 lxc-checkconfig: Show namespace limits
>> f71b8e3f8 lxc-ls: list names with whitespaces in `--active`.
>> 816b8973d lxc/tools: set default log_priority to ERROR
>> 989ea3969 tools/lxc_autostart: don't fail when there are no containers
>> dc4df2335 lxc/lxccontainer: specify file mode in open() call inside mod_=
rdep
>> 630b46ed2 lxc/confile: do not print excess space before scale suffix for=
 time.offset.boot
>> 796f2ccb7 lxc/confile: do not print newline symbol in getter for lxc.tim=
e.offset.*
>> dcc4fb929 tests/parse_config_file: fix some typos
>> 6fea67429 tests/parse_config_file: add tests for lxc.time.offset.*
>> ad8f55445 tree-wide: replace multiply_overflow with check_mul_overflow
>> 4464cee19 lxccontainer: rework copy_file()
>> 9d1aa932d lxccontainer: improve mod_rdep()
>> 81c1bbf45 Revert "lxccontainer: fixes"
>> 82fe01821 src/lxc/syscall_numbers.h: drop define -1
>> 590a95d83 rexec: Avoid invalid free in rexec failure path
>> f9978b179 README: Correct 'armvl7' to 'armv7l'
>> 046b63cd2 unshare: simplify lookup_name
>> 7452ee8ab lxc-unshare: fix an buffer overflow issue in lxc_unshare
>> e88883445 lxc-net: Enable IPv6 by default
>> d78ca00bc tests/meson: attempt to fix ossfuzz builds
>> d18f993b3 github: master -> main
>> 86799f554 meson: link with liblxc dynamically everywhere if possible
>> b90fecfda network: use IN_LIBLXC
>> 9eee450d2 storage_utils: move get_fssize to utils
>> 6eb0a73e2 storage_utils: unhide and rename is_valid_storage_type to lxc_=
is_valid_storage_type
>> 42eeffcb0 confile: unhide lxc_config_parse_arch() helper
>> 9bb318881 conf: reorganize/split code to utils.c
>> 863c59dc3 conf: reorganize/split code to idmap_utils.c
>> b7591ad49 confile: unhide lxc_config_define*() helpers
>> f14656ebf meson: introduce IN_LIBLXC preprocessor macro
>> 672b2172d confile: move lxc_fill_elevated_privileges() to tools/lxc_atta=
ch
>> 8f9733d75 tests: remove old and broken cgroup handling code from tests
>> d51ea224e config: apparmor: add AppArmor profile for lxc-copy
>> 627bb9460 tests: lxc-test-usernic: use iproute tool instead of brctl
>> df0665b6d oci: resolve cross-filesystem blob caching failure
>> ec85e5ca4 lxc-test-usernic: drop cgroup handling
>> 27ec0b0f6 test-usernic: don't use ifconfig
>> 44e845b3c Add x32 to the list of recognized architectures
>> 07e3a516e lxc-download, lxc-local: preserve xattrs on unpack
>> 9ac7c4895 tree-wide: use container_uses_namespace() in less trivial case=
s
>> 64341ce7b tree-wide: use container_uses_namespace() helper
>> 6b40e66c1 Fix error message.
>> c8189ee2a Add verbose output in download template.
>> 84cc3155a Align columns in lxc-download.in template
>> 872db5424 build: add more options for customizing install
>> df17ac417 Add loongarch64 support
>> 112d5615e build(deps): bump actions/upload-artifact from 3 to 4
>> 789457f1a config: try to create workdir if not exist
>> 86f5c1226 lxc-local: Add --no-dev option to exclude /dev from the fstree
>> f885a3c56 lxc-local: Re-organize code to use more functions
>> 7c025072e lxc-local: Improve usage info
>> faa38a197 lxc-local: Change LXC_CONFIG to LXC_METADATA to match args and=
 be more clear
>> d65fe1b27 Disable IPv6 link-local addresses for bridged veth
>> 8cff8fa1a don't try to delete vlan 0 from veth
>> 0e932812a conf: fix ephemeral copies
>> abffab441 config/init: Drop upstart files
>> 79a4a3cf8 doc: remove the warning mentionning upstart
>> 7bf1695d0 hooks/ubuntu-cloud-prep: remove upstart handling
>> fb73c18d2 meson: Remove support for upstart
>> cc6819c69 reset root_nsuid_map and root_nsgid_map when idmaps is cleared
>> a87d6fcc9 lxc/checkconfig: use multiline `echo`
>> f3e01fa80 lxc/checkconfig: replace `echo -n` by printf
>> ba4f810bc lxc/checkconfig: minor cosmetic change
>> d52c345c8 lxc/checkconfig: avoid subshell (SC2235)
>> f84f03d1d lxc/checkconfig: remove superfluous (..) around test command (=
SC2234)
>> 74b9faa64 lxc/checkconfig: check exit code directly (SC2181)
>> 5cc69e440 lxc/checkconfig: replace `! -z` by `-n` (SC2236)
>> a4684eb11 lxc/checkconfig: add missing quotes to please shellcheck
>> 8a611c0b2 lxc/checkconfig: remove some unneeded `echo -n`
>> cb2574319 lxc/checkconfig: replace `type` by `command`
>> 003efe6db lxc/checkconfig: replace `cat | grep` with `grep`
>> adadfa372 lxc/lxccontainer: fix do_lxcapi_set_timeout retval
>> c02367e59 containers in the FREEZING state also need to be unfreeze
>> aca53bcf7 build(deps): bump actions/checkout from 3 to 4
>> 84169158f lxccontainer.h: Move new fields to the end
>> e2696df93 Remove references to LXD
>> 7cec54455 Update console perms to 0600
>> 3f45443fd Fix start api call to split quoted strings in execute or init =
command.
>>
>> Local patches modification:
>> Removed two patches due to they are available in the code:
>> 0001-lxc-test-usernic-drop-cgroup-handling.patch
>> 0001-tests-remove-old-and-broken-cgroup-handling-code-fro.patch
>>
>> Refreshed templates-use-curl-instead-of-wget.patch
>>
>> Ptest modification:
>> Released lxc-test-shutdowntest and lxc-test-state-server due to
>> those back to normal
>> lxc-test-no-new-privs and lxc-test-checkpoint-restore are
>> broken test, already reported to upstream[1][2], move them to blacklist
>> until upstream fixed them.
>> lxc-test-usernic always fails when use ptest-runner, but normal with
>> run-ptest by manual.
>>
>> Ref:
>> [1] https://github.com/lxc/lxc/issues/4296
>> [2] https://github.com/lxc/lxc/issues/4435
>>
>> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>> ---
>>  ...xc-test-usernic-drop-cgroup-handling.patch |  61 -----------
>>  ...-and-broken-cgroup-handling-code-fro.patch | 103 ------------------
>>  recipes-containers/lxc/files/run-ptest        |  12 +-
>>  .../templates-use-curl-instead-of-wget.patch  |  13 ++-
>>  recipes-containers/lxc/lxc_git.bb             |  10 +-
>>  5 files changed, 20 insertions(+), 179 deletions(-)
>>  delete mode 100644 recipes-containers/lxc/files/0001-lxc-test-usernic-d=
rop-cgroup-handling.patch
>>  delete mode 100644 recipes-containers/lxc/files/0001-tests-remove-old-a=
nd-broken-cgroup-handling-code-fro.patch
>>
>> diff --git a/recipes-containers/lxc/files/0001-lxc-test-usernic-drop-cgr=
oup-handling.patch b/recipes-containers/lxc/files/0001-lxc-test-usernic-dro=
p-cgroup-handling.patch
>> deleted file mode 100644
>> index 162e8f9d..00000000
>> --- a/recipes-containers/lxc/files/0001-lxc-test-usernic-drop-cgroup-han=
dling.patch
>> +++ /dev/null
>> @@ -1,61 +0,0 @@
>> -From ec85e5ca4953292c4341497704ce738669a79b64 Mon Sep 17 00:00:00 2001
>> -From: Serge Hallyn <serge@hallyn.com>
>> -Date: Fri, 2 Feb 2024 10:41:11 -0600
>> -Subject: [PATCH] lxc-test-usernic: drop cgroup handling
>> -
>> -This stuff is not needed in a modern systemd based system, and in fact
>> -breaks.  It would probably be better to detect such a system so that a
>> -non-systemd box can still run this test.  But I'm not sure what would b=
e
>> -reliable.
>> -
>> -Upstream-Status: Backport from
>> -[https://github.com/lxc/lxc/commit/ec85e5ca4953292c4341497704ce738669a7=
9b64]
>> -
>> -Signed-off-by: Serge Hallyn <serge@hallyn.com>
>> -Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>> ----
>> - src/tests/lxc-test-usernic.in | 28 ----------------------------
>> - 1 file changed, 28 deletions(-)
>> -
>> -diff --git a/src/tests/lxc-test-usernic.in b/src/tests/lxc-test-usernic=
.in
>> -index 9af8678f3..49fd5e3f7 100755
>> ---- a/src/tests/lxc-test-usernic.in
>> -+++ b/src/tests/lxc-test-usernic.in
>> -@@ -80,34 +80,6 @@ lxc.idmap =3D u 0 910000 10000
>> - lxc.idmap =3D g 0 910000 10000
>> - EOF
>> -
>> --if command -v cgm >/dev/null 2>&1; then
>> --      cgm create all usernic-user
>> --      cgm chown all usernic-user $(id -u usernic-user) $(id -g usernic=
-user)
>> --      cgm movepid all usernic-user $$
>> --elif [ -e /sys/fs/cgroup/cgmanager/sock ]; then
>> --      for d in $(cut -d : -f 2 /proc/self/cgroup); do
>> --              dbus-send --print-reply --address=3Dunix:path=3D/sys/fs/=
cgroup/cgmanager/sock \
>> --                      --type=3Dmethod_call /org/linuxcontainers/cgmana=
ger org.linuxcontainers.cgmanager0_0.Create \
>> --                      string:$d string:usernic-user >/dev/null
>> --
>> --              dbus-send --print-reply --address=3Dunix:path=3D/sys/fs/=
cgroup/cgmanager/sock \
>> --                      --type=3Dmethod_call /org/linuxcontainers/cgmana=
ger org.linuxcontainers.cgmanager0_0.Chown \
>> --                      string:$d string:usernic-user int32:$(id -u user=
nic-user) int32:$(id -g usernic-user) >/dev/null
>> --
>> --              dbus-send --print-reply --address=3Dunix:path=3D/sys/fs/=
cgroup/cgmanager/sock \
>> --                      --type=3Dmethod_call /org/linuxcontainers/cgmana=
ger org.linuxcontainers.cgmanager0_0.MovePid \
>> --                      string:$d string:usernic-user int32:$$ >/dev/nul=
l
>> --      done
>> --else
>> --      for d in /sys/fs/cgroup/*; do
>> --              [ "$d" =3D "/sys/fs/cgroup/unified" ] && continue
>> --              [ -f $d/cgroup.clone_children ] && echo 1 > $d/cgroup.cl=
one_children
>> --              [ ! -d $d/lxctest ] && mkdir $d/lxctest
>> --              chown -R usernic-user: $d/lxctest
>> --              echo $$ > $d/lxctest/tasks
>> --      done
>> --fi
>> --
>> - mkdir -p /run/user/$(id -u usernic-user)
>> - chown -R usernic-user: /run/user/$(id -u usernic-user) /home/usernic-u=
ser
>> -
>> ---
>> -2.35.5
>> -
>> diff --git a/recipes-containers/lxc/files/0001-tests-remove-old-and-brok=
en-cgroup-handling-code-fro.patch b/recipes-containers/lxc/files/0001-tests=
-remove-old-and-broken-cgroup-handling-code-fro.patch
>> deleted file mode 100644
>> index bf8df795..00000000
>> --- a/recipes-containers/lxc/files/0001-tests-remove-old-and-broken-cgro=
up-handling-code-fro.patch
>> +++ /dev/null
>> @@ -1,103 +0,0 @@
>> -From 8f9733d756361ff8f8d8d589f286c0e064b1195d Mon Sep 17 00:00:00 2001
>> -From: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
>> -Date: Thu, 15 Feb 2024 18:13:05 +0100
>> -Subject: [PATCH] tests: remove old and broken cgroup handling code from=
 tests
>> -
>> -We have removed the same piece of code in
>> -ec85e5ca495 ("lxc-test-usernic: drop cgroup handling")
>> -let's do the same for two other tests.
>> -
>> -This fixes autopkgtests.
>> -
>> -Upstream-Status: Backport from
>> -[https://github.com/lxc/lxc/commit/8f9733d756361ff8f8d8d589f286c0e064b1=
195d]
>> -
>> -Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.c=
om>
>> -Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>> ----
>> - src/tests/lxc-test-apparmor-mount | 29 -----------------------------
>> - src/tests/lxc-test-unpriv         | 28 ----------------------------
>> - 2 files changed, 57 deletions(-)
>> -
>> -diff --git a/src/tests/lxc-test-apparmor-mount b/src/tests/lxc-test-app=
armor-mount
>> -index 7c9d9ad50..ddf783d4b 100755
>> ---- a/src/tests/lxc-test-apparmor-mount
>> -+++ b/src/tests/lxc-test-apparmor-mount
>> -@@ -119,35 +119,6 @@ chown -R $TUSER: /run/user/$(id -u $TUSER)
>> -
>> - cd $HDIR
>> -
>> --if command -v cgm >/dev/null 2>&1; then
>> --      cgm create all $TUSER
>> --      cgm chown all $TUSER $(id -u $TUSER) $(id -g $TUSER)
>> --      cgm movepid all $TUSER $$
>> --elif [ -e /sys/fs/cgroup/cgmanager/sock ]; then
>> --      for d in $(cut -d : -f 2 /proc/self/cgroup); do
>> --              dbus-send --print-reply --address=3Dunix:path=3D/sys/fs/=
cgroup/cgmanager/sock \
>> --                      --type=3Dmethod_call /org/linuxcontainers/cgmana=
ger org.linuxcontainers.cgmanager0_0.Create \
>> --                      string:$d string:$TUSER >/dev/null
>> --
>> --              dbus-send --print-reply --address=3Dunix:path=3D/sys/fs/=
cgroup/cgmanager/sock \
>> --                      --type=3Dmethod_call /org/linuxcontainers/cgmana=
ger org.linuxcontainers.cgmanager0_0.Chown \
>> --                      string:$d string:$TUSER int32:$(id -u $TUSER) in=
t32:$(id -g $TUSER) >/dev/null
>> --
>> --              dbus-send --print-reply --address=3Dunix:path=3D/sys/fs/=
cgroup/cgmanager/sock \
>> --                      --type=3Dmethod_call /org/linuxcontainers/cgmana=
ger org.linuxcontainers.cgmanager0_0.MovePid \
>> --                      string:$d string:$TUSER int32:$$ >/dev/null
>> --      done
>> --else
>> --      for d in /sys/fs/cgroup/*; do
>> --              [ "$d" =3D "/sys/fs/cgroup/unified" ] && continue
>> --              [ -f $d/cgroup.clone_children ] && echo 1 > $d/cgroup.cl=
one_children
>> --              [ ! -d $d/lxctest ] && mkdir $d/lxctest
>> --              chown -R $TUSER: $d/lxctest
>> --              echo $$ > $d/lxctest/tasks
>> --      done
>> --fi
>> --
>> --
>> - run_cmd lxc-create -t busybox -n $cname
>> -
>> - echo "test default confined container"
>> -diff --git a/src/tests/lxc-test-unpriv b/src/tests/lxc-test-unpriv
>> -index 8fb9106d6..426add9da 100755
>> ---- a/src/tests/lxc-test-unpriv
>> -+++ b/src/tests/lxc-test-unpriv
>> -@@ -130,34 +130,6 @@ chown -R $TUSER: /run/user/$(id -u $TUSER)
>> -
>> - cd $HDIR
>> -
>> --if command -v cgm >/dev/null 2>&1; then
>> --      cgm create all $TUSER
>> --      cgm chown all $TUSER $(id -u $TUSER) $(id -g $TUSER)
>> --      cgm movepid all $TUSER $$
>> --elif [ -e /sys/fs/cgroup/cgmanager/sock ]; then
>> --      for d in $(cut -d : -f 2 /proc/self/cgroup); do
>> --              dbus-send --print-reply --address=3Dunix:path=3D/sys/fs/=
cgroup/cgmanager/sock \
>> --                      --type=3Dmethod_call /org/linuxcontainers/cgmana=
ger org.linuxcontainers.cgmanager0_0.Create \
>> --                      string:$d string:$TUSER >/dev/null
>> --
>> --              dbus-send --print-reply --address=3Dunix:path=3D/sys/fs/=
cgroup/cgmanager/sock \
>> --                      --type=3Dmethod_call /org/linuxcontainers/cgmana=
ger org.linuxcontainers.cgmanager0_0.Chown \
>> --                      string:$d string:$TUSER int32:$(id -u $TUSER) in=
t32:$(id -g $TUSER) >/dev/null
>> --
>> --              dbus-send --print-reply --address=3Dunix:path=3D/sys/fs/=
cgroup/cgmanager/sock \
>> --                      --type=3Dmethod_call /org/linuxcontainers/cgmana=
ger org.linuxcontainers.cgmanager0_0.MovePid \
>> --                      string:$d string:$TUSER int32:$$ >/dev/null
>> --      done
>> --else
>> --      for d in /sys/fs/cgroup/*; do
>> --              [ "$d" =3D "/sys/fs/cgroup/unified" ] && continue
>> --              [ -f $d/cgroup.clone_children ] && echo 1 > $d/cgroup.cl=
one_children
>> --              [ ! -d $d/lxctest ] && mkdir $d/lxctest
>> --              chown -R $TUSER: $d/lxctest
>> --              echo $$ > $d/lxctest/tasks
>> --      done
>> --fi
>> --
>> - run_cmd lxc-create -t busybox -n c1 -l trace -o "${UNPRIV_LOG}"
>> -
>> - # Make sure we can start it - twice
>> ---
>> -2.35.5
>> -
>> diff --git a/recipes-containers/lxc/files/run-ptest b/recipes-containers=
/lxc/files/run-ptest
>> index 196adb04..278107d9 100644
>> --- a/recipes-containers/lxc/files/run-ptest
>> +++ b/recipes-containers/lxc/files/run-ptest
>> @@ -12,9 +12,15 @@ blacklist=3D"$blacklist lxc-test-apparmor"
>>  blacklist=3D"$blacklist lxc-test-apparmor-mount"
>>  #lxc-test-get_item would report Built without AppArmor support error
>>  blacklist=3D"$blacklist lxc-test-get_item"
>> -# These currently hang so skip them until someone fixes them up
>> -blacklist=3D"$blacklist lxc-test-shutdowntest"
>> -blacklist=3D"$blacklist lxc-test-state-server"
>> +# This is a broken case, also fails on opensuse, already reported to
>> +# upstream https://github.com/lxc/lxc/issues/4296
>> +blacklist=3D"$blacklist lxc-test-no-new-privs"
>> +# lxc doesn't adapt the criu's new mount flag, that cause restore fails
>> +# already reported to upstream https://github.com/lxc/lxc/issues/4435
>> +blacklist=3D"$blacklist lxc-test-checkpoint-restore"
>> +# if we run "run-ptest" under /usr/lib64/lxc/ptest, the result is norma=
l
>> +# but it would be failed when using "ptest-runner lxc"
>> +blacklist=3D"$blacklist lxc-test-usernic"
>>
>>  # Tests in firstrunlist will be run first
>>  firstrunlist=3D""
>> diff --git a/recipes-containers/lxc/files/templates-use-curl-instead-of-=
wget.patch b/recipes-containers/lxc/files/templates-use-curl-instead-of-wge=
t.patch
>> index e9af8335..3ef66138 100644
>> --- a/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.pa=
tch
>> +++ b/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.pa=
tch
>> @@ -10,6 +10,7 @@ Upstream-Status: Inappropriate [embedded specific]
>>  Signed-off-by: Joakim Roubert <joakimr@axis.com>
>>  Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
>>  Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>> +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>>  ---
>>   templates/lxc-download.in | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>> @@ -18,7 +19,7 @@ diff --git a/templates/lxc-download.in b/templates/lxc=
-download.in
>>  index a62ddf482..690307338 100755
>>  --- a/templates/lxc-download.in
>>  +++ b/templates/lxc-download.in
>> -@@ -59,9 +59,9 @@ cleanup() {
>> +@@ -45,9 +45,9 @@ cleanup() {
>>     fi
>>   }
>>
>> @@ -30,16 +31,16 @@ index a62ddf482..690307338 100755
>>         return 0
>>       fi
>>     done
>> -@@ -70,7 +70,7 @@ wget_wrapper() {
>> - }
>> -
>> - download_file() {
>> +@@ -59,7 +59,7 @@ download_file() {
>> +   if [ "${DOWNLOAD_VERBOSE}" =3D "true" ]; then
>> +     echo "Download file: https://${DOWNLOAD_SERVER}$1"
>> +   fi
>>  -  if ! wget_wrapper --user-agent=3D"lxc/@PACKAGE_VERSION@ compat:${DOW=
NLOAD_COMPAT_LEVEL}" -T 30 -q "https://${DOWNLOAD_SERVER}/$1" -O "$2" >/dev=
/null 2>&1; then
>>  +  if ! curl_wrapper -L --user-agent "lxc/@PACKAGE_VERSION@ compat:${DO=
WNLOAD_COMPAT_LEVEL}" -m 30 -s "https://${DOWNLOAD_SERVER}/$1" -o "$2" >/de=
v/null 2>&1; then
>>       if [ "$3" =3D "noexit" ]; then
>>         return 1
>>       else
>> -@@ -176,7 +176,7 @@ while :; do
>> +@@ -167,7 +167,7 @@ while :; do
>>   done
>>
>>   # Check for required binaries
>> diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/=
lxc_git.bb
>> index ee0e442f..379b4ecd 100644
>> --- a/recipes-containers/lxc/lxc_git.bb
>> +++ b/recipes-containers/lxc/lxc_git.bb
>> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.LGPL2.1;md5=3D4fbd6=
5380cdd255951079008b364516c
>>                      file://LICENSE.GPL2;md5=3D751419260aa954499f7abaaba=
a882bbe \
>>  "
>>
>> -DEPENDS =3D "libxml2 libcap"
>> +DEPENDS =3D "libxml2 libcap dbus"
>>  RDEPENDS:${PN} =3D " \
>>                 rsync \
>>                 curl \
>> @@ -36,7 +36,7 @@ RDEPENDS:${PN}-ptest +=3D "file make gmp nettle gnutls=
 bash libgcc"
>>
>>  RDEPENDS:${PN}-networking +=3D "iptables"
>>
>> -SRC_URI =3D "git://github.com/lxc/lxc.git;branch=3Dstable-5.0;protocol=
=3Dhttps \
>> +SRC_URI =3D "git://github.com/lxc/lxc.git;branch=3Dstable-6.0;protocol=
=3Dhttps \
>>         file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
>>         file://run-ptest \
>>         file://templates-actually-create-DOWNLOAD_TEMP-directory.patch \
>> @@ -47,12 +47,10 @@ SRC_URI =3D "git://github.com/lxc/lxc.git;branch=3Ds=
table-5.0;protocol=3Dhttps \
>>         file://0001-template-if-busybox-contains-init-use-it-in-containe=
.patch \
>>         file://dnsmasq.conf \
>>         file://lxc-net \
>> -       file://0001-lxc-test-usernic-drop-cgroup-handling.patch \
>> -       file://0001-tests-remove-old-and-broken-cgroup-handling-code-fro=
.patch \
>>         "
>>
>> -SRCREV =3D "cb8e38aca27a23964941f0f011a8919aab8bebab"
>> -PV =3D "5.0.3+git"
>> +SRCREV =3D "3dee5fb88c6f77496dbcab46f31bcd891c9ee4e0"
>> +PV =3D "6.0.0+git"
>>
>>  S =3D "${WORKDIR}/git"
>>
>> --
>> 2.25.1
>>
>>
>>
>>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8685): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8685
> Mute This Topic: https://lists.yoctoproject.org/mt/105594307/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

