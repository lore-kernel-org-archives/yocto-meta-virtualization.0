Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B6CC53209
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 00:04:39 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20979.1785110675423735458
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 26 Jul 2026 17:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=iVTVX432;
 spf=pass (domain: konsulko.com, ip: 209.85.214.177, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cacf197759so31059275ad.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 26 Jul 2026 17:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785110675; x=1785715475; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rlSsPLgYsMnC1zQ/Hmzqsd/2TQFCmCXOX7h6YDDOT1A=;
        b=iVTVX432+EyTbjHlwJZ/I9FQR1XhlggmTwlj5WkvqmAbxIN4oSHccFWeFZXwkN9dmc
         6uVfSmU6o/94DtfOf4djaokcIAG/yPCAzQYzHgR2aXHYdJKvgTAIUGX//3H8LugObWVJ
         shcdXo8z0CovaTK7+Z8dd4TRkQg7Bc2L6jfBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785110675; x=1785715475;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rlSsPLgYsMnC1zQ/Hmzqsd/2TQFCmCXOX7h6YDDOT1A=;
        b=cr9FvD+QUZlajbEDX0QMG7daPyJUF9F155o9EYjkXBEHfsCiiT07mucZ7fBhbyC5sn
         JUNh/eZP1AkUsMo/CSwh/B4NotPIbRNbJNR4H+YOhE28oO2VF6caPgSAy30Vtu2HoDm+
         CrOJlXXowA+KRB30rggbI1KKtHiu0KZ4LUkLtoshYF5Dngc3A3gtFst4cO46qS8rVlKW
         oD3TJ4jo00AjzvNAIYEijqOFJ0QEDJ1BhRD34+Lxmm0KizkbvLqoY3zTvmT5a98oASKV
         Wux0CiXBTQrcyIqL2FID1vx3qXsTZr20ebgkuoSo5O9ECbjoN2BDnaKPDlTA31UkNFiD
         AF6Q==
X-Gm-Message-State: AOJu0YwzJWbziQxQU80tTdZCpSVEAvhxjajvpD1xKATB+CYxdjL4DRiT
	fwrKIf3519UaCvZN0WSKJ4c2kdmfy6uvsncMrzw5ugSj0ZQt22fJ0xJ5CskImeawDz91xkkEKWp
	9HGxz
X-Gm-Gg: AR+sD12Cx6rHaeS6xf17CGSFf43SNIIzRXGHO7ByqOIYQvcJMMrfRumgqigHv3YKgru
	Y1sdd1s5vqjxvt9E/2rs0Aw0eGk33HGYruKka6T/hX+KSA1kyQMbANg+hkzoyBhEljZMj9CBfio
	GzsE+cM40OQd4S4CP7MG4sg6CiubZ/68BDRmYrA45oESmCJ+DbcYPXMtUqOxrqtCF3gfnmgkiia
	2B73dZWSztcFV4o9SntoDH/i85qCD+aW3pa8gcczyFvvIZIF4/3PEASIgbO0egYWPFD1jz9f0j1
	AbtaYt0ma0slCOmEJRbornlF23yw1noXfEoZ5LtVsJqpIZTsSl3GZAy2J8GOjiLFZydjKsl9WhO
	ccI7ryCViRnq7W0iEOzo7Qt91iGd5gwlpW2UTlXQWNm5EKGSTsRx6gDa2mpa+nTgv14rvExiVbH
	Uf3XQEY0hsPbtOxUbHuyg=
X-Received: by 2002:a17:903:1ae3:b0:2ca:d91d:d3a7 with SMTP id d9443c01a7336-2cfde795b4emr57317645ad.10.1785110674700;
        Sun, 26 Jul 2026 17:04:34 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:4c93:d927:aa69:60a6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e2b44sm25048625ad.27.2026.07.26.17.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 17:04:34 -0700 (PDT)
From: tim.orling@konsulko.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-virtualization][RFC][PATCH 5/5] docs: add container-yocto-builder.md
Date: Sun, 26 Jul 2026 17:02:49 -0700
Message-ID: <20260727000247.1623785-11-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260727000247.1623785-3-tim.orling@konsulko.com>
References: <20260727000247.1623785-3-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Jul 2026 00:04:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9985

From: Tim Orling <tim.orling@konsulko.com>

Document the steps needed to:
* enable multiarch builds of the container-yocto-builder recipe
* fix run-time errors and problems
* push the multiarch container to a registry
* run the container
* build core-image-minimal with the bitbake-setup workflow

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 docs/container-yocto-builder.md | 233 ++++++++++++++++++++++++++++++++
 1 file changed, 233 insertions(+)
 create mode 100644 docs/container-yocto-builder.md

diff --git a/docs/container-yocto-builder.md b/docs/container-yocto-builder=
.md
new file mode 100644
index 00000000..0dd28f48
--- /dev/null
+++ b/docs/container-yocto-builder.md
@@ -0,0 +1,233 @@
+# Yocto Builder Container
+
+## Build
+
+To build a multiarch `container-yocto-builder`, we need to add it to
+`CONTAINER_IMAGES` in `container-image-multiarch.bb`. This also required
+modifying `vcontainer-bbmask.inc` to allow `python3-pexpect` and its
+`python3-ptyprocess` dependency. This then exposes
+`meta-oe/dynamic-layers/meta-python` so we needed to add that to the mask.
+
+To build the container:
+
+```bash
+bitbake container-image-multiarch-container-yocto-builder
+```
+
+### Missing Dependencies
+
+During run-time testing, a few things were missing when following a `bitba=
ke-setup` workflow.
+
+* `ca-certificates` is needed for git cloning from `https://`
+
+* `bitbake` needed `locale-base-en-us`
+
+* `wss://` for `hashserv` (with `core/yocto/sstate-mirror-cdn` fragment) n=
eeded `python3-websockets`
+
+* `bitbake-config-build` needed `util-linux-flock` and `util-linux-getopt`
+
+   ```bash
+   ERROR: The following required tools (as specified by HOSTTOOLS) appear =
to be unavailable in PATH, please install them in order to proceed:
+     flock getopt
+   ```
+
+* `os-release` is needed to prevent the following warning, but for our mul=
tiarch containers, distro is `vcontainer` so `vcontainer-1.0` is not in san=
ity tested distros:
+
+   ```bash
+   WARNING: Host distribution "unknown" has not been validated with this v=
ersion of the build system; you may possibly experience unexpected failures=
. It is recommended that you use a tested distribution.
+   ```
+
+* We need `glibc-dev`, so following the existing pattern in `packagegroup-=
yocto-builder`:
+
+   ```bash
+   ${@bb.utils.contains('TCLIBC', 'glibc', 'glibc-dev', '', d)}
+   ```
+
+   ```bash
+   ERROR:  OE-core's config sanity checker detected a potential misconfigu=
ration.
+       Either fix the cause of this error or at your own risk disable the =
checker (see sanity.conf).
+       Following is the list of potential problems / advisories:
+
+       An unexpected issue occurred during the C++ toolchain check: Comman=
d '['g++', '-x', 'c++', '-', '-o', '/dev/null', '-lstdc++']' returned non-z=
ero exit status 1.An error occurred during checking the C++ toolchain for '=
--std=3Dgnu++20' support. Please use a g++ compiler that supports C++20 (e.=
g. g++ version 10 onwards).
+   ```
+
+   ```bash
+   $ g++ --version
+   g++ (GCC) 16.1.0
+   Copyright (C) 2026 Free Software Foundation, Inc.
+   This is free software; see the source for copying conditions.  There is=
 NO
+   warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURP=
OSE.
+
+   builder@c9a0678daa85:/workdir/bitbake-builds/poky-master/build$ g++ -x =
c++ -lstd++
+   /usr/bin/x86_64-poky-linux-ld: cannot find Scrt1.o: No such file or dir=
ectory
+   /usr/bin/x86_64-poky-linux-ld: cannot find crti.o: No such file or dire=
ctory
+   /usr/bin/x86_64-poky-linux-ld: cannot find crtbeginS.o: No such file or=
 directory
+   /usr/bin/x86_64-poky-linux-ld: cannot find -lstd++: No such file or dir=
ectory
+   /usr/bin/x86_64-poky-linux-ld: cannot find -lm: No such file or directo=
ry
+   /usr/bin/x86_64-poky-linux-ld: cannot find -lgcc_s: No such file or dir=
ectory
+   /usr/bin/x86_64-poky-linux-ld: cannot find -lgcc: No such file or direc=
tory
+   /usr/bin/x86_64-poky-linux-ld: cannot find -latomic_asneeded: No such f=
ile or directory
+   /usr/bin/x86_64-poky-linux-ld: cannot find -lc: No such file or directo=
ry
+   /usr/bin/x86_64-poky-linux-ld: cannot find -lgcc_s: No such file or dir=
ectory
+   /usr/bin/x86_64-poky-linux-ld: cannot find -lgcc: No such file or direc=
tory
+   /usr/bin/x86_64-poky-linux-ld: cannot find crtendS.o: No such file or d=
irectory
+   /usr/bin/x86_64-poky-linux-ld: cannot find crtn.o: No such file or dire=
ctory
+   collect2: error: ld returned 1 exit status
+   ```
+
+* We need `libgcc-dev`:
+
+   ```bash
+   $ g++ -x c++ -lstdc++
+   /usr/bin/x86_64-poky-linux-ld: cannot find crtbeginS.o: No such file or=
 directory
+   collect2: error: ld returned 1 exit status
+   ```
+
+   ```bash
+   $ oe-pkgdata-util -p tmp-container-aarch64/pkgdata/qemuarm64/ list-pkg-=
files libgcc-dev
+   libgcc-dev:
+     /usr/lib/aarch64-poky-linux/16.1.0/crtbegin.o
+     /usr/lib/aarch64-poky-linux/16.1.0/crtbeginS.o
+     /usr/lib/aarch64-poky-linux/16.1.0/crtbeginT.o
+     /usr/lib/aarch64-poky-linux/16.1.0/crtend.o
+     /usr/lib/aarch64-poky-linux/16.1.0/crtendS.o
+     /usr/lib/aarch64-poky-linux/16.1.0/crtfastmath.o
+     /usr/lib/aarch64-poky-linux/16.1.0/libgcc.a
+     /usr/lib/aarch64-poky-linux/16.1.0/libgcc_eh.a
+     /usr/lib/aarch64-poky-linux/16.1.0/libgcov.a
+     /usr/lib/libgcc_s.so
+     /usr/lib/libgcc_s_asneeded.so
+   ```
+
+* We need `libatomic-dev`:
+
+   ```bash
+   $ g++ -x c++ -lstdc++
+   /usr/bin/x86_64-poky-linux-ld: cannot find -latomic_asneeded: No such f=
ile or directory
+   collect2: error: ld returned 1 exit status
+   ```
+
+   ```bash
+   $ oe-pkgdata-util -p tmp-container-aarch64/pkgdata/qemuarm64/ list-pkg-=
files libatomic-dev
+   libatomic-dev:
+     /usr/lib/libatomic.so
+     /usr/lib/libatomic_asneeded.so
+   ```
+
+* We need `libgomp`:
+
+   ```bash
+   ERROR: base-files-3.0.14-r0 do_package: Fatal errors occurred in subpro=
cesses:
+   Command '['/workdir/bitbake-builds/poky-master/build/tmp/work/qemux86_6=
4-poky-linux/base-files/3.0.14/recipe-sysroot-native/usr/lib/rpm/rpmdeps', =
'--alldeps', '--define', '__font_provides %{nil}', '/workdir/bitbake-builds=
/poky-master/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/package=
s-split/base-files/etc/hosts', '/workdir/bitbake-builds/poky-master/build/t=
mp/work/qemux86_64-poky-linux/base-files/3.0.14/packages-split/base-files/e=
tc/mtab', '/workdir/bitbake-builds/poky-master/build/tmp/work/qemux86_64-po=
ky-linux/base-files/3.0.14/packages-split/base-files/etc/nsswitch.conf', '/=
workdir/bitbake-builds/poky-master/build/tmp/work/qemux86_64-poky-linux/bas=
e-files/3.0.14/packages-split/base-files/etc/issue', '/workdir/bitbake-buil=
ds/poky-master/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/packa=
ges-split/base-files/etc/motd', '/workdir/bitbake-builds/poky-master/build/=
tmp/work/qemux86_64-poky-linux/base-files/3.0.14/packages-split/base-files/=
etc/fstab', '/workdir/bitbake-builds/poky-master/build/tmp/work/qemux86_64-=
poky-linux/base-files/3.0.14/packages-split/base-files/etc/host.conf', '/wo=
rkdir/bitbake-builds/poky-master/build/tmp/work/qemux86_64-poky-linux/base-=
files/3.0.14/packages-split/base-files/etc/issue.net', '/workdir/bitbake-bu=
ilds/poky-master/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/pac=
kages-split/base-files/etc/hostname', '/workdir/bitbake-builds/poky-master/=
build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/packages-split/base-=
files/etc/shells', '/workdir/bitbake-builds/poky-master/build/tmp/work/qemu=
x86_64-poky-linux/base-files/3.0.14/packages-split/base-files/etc/profile',=
 '/workdir/bitbake-builds/poky-master/build/tmp/work/qemux86_64-poky-linux/=
base-files/3.0.14/packages-split/base-files/etc/skel/.bashrc', '/workdir/bi=
tbake-builds/poky-master/build/tmp/work/qemux86_64-poky-linux/base-files/3.=
0.14/packages-split/base-files/etc/skel/.profile', '/workdir/bitbake-builds=
/poky-master/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/package=
s-split/base-files/var/lock']' returned non-zero exit status 127.
+   Subprocess output:/workdir/bitbake-builds/poky-master/build/tmp/work/qe=
mux86_64-poky-linux/base-files/3.0.14/recipe-sysroot-native/usr/lib/rpm/rpm=
deps: error while loading shared libraries: libgomp.so.1: cannot open share=
d object file: No such file or directory
+
+   ERROR: Logfile of failure stored in: /workdir/bitbake-builds/poky-maste=
r/build/tmp/work/qemux86_64-poky-linux/base-files/3.0.14/temp/log.do_packag=
e.136007
+   ERROR: Task (/workdir/bitbake-builds/poky-master/layers/openembedded-co=
re/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package) failed wit=
h exit code '1'
+   NOTE: Tasks Summary: Attempted 4002 tasks of which 2754 didn't need to =
be rerun and 1 failed.
+
+   Summary: 1 task failed:
+     /workdir/bitbake-builds/poky-master/layers/openembedded-core/meta/rec=
ipes-core/base-files/base-files_3.0.14.bb:do_package
+       log: /workdir/bitbake-builds/poky-master/build/tmp/work/qemux86_64-=
poky-linux/base-files/3.0.14/temp/log.do_package.136007
+   Summary: There was 1 WARNING message.
+   Summary: There was 1 ERROR message, returning a non-zero exit code.
+   ```
+
+   The same was seen when building `gcc-runtime`.
+
+   According to Claude, this is yet another missing dependency in the cont=
ainer:
+
+   ```text
+   =E2=97=8F Root cause found. Your yocto-builder container's own rootfs i=
s missing libgomp.so.1 system-wide =E2=80=94 it's not a bitbake config/ssta=
te
+   problem, it's a gap in the container image itself.
+   ```
+
+## Push
+
+To push to a container registry:
+
+```bash
+ bitbake skopeo-native -c addto_recipe_sysroot
+ oe-run-native skopeo-native skopeo copy --all \
+   --dest-authfile /home/user/.config/containers/auth.json \
+   oci:tmp/deploy/images/qemux86-64/container-image-multiarch-container-yo=
cto-builder-multiarch-oci/ \
+   docker://my.registry.io/user/yocto-builder:latest
+```
+
+## Run
+
+This container is different compared to the CROPS `poky-container`, so we =
need
+a few more arguments on the command line.
+
+```bash
+docker pull my.registry.io/user/yocto-builder:latest
+docker run --privileged -d \
+  --name yocto_builder \
+  --rm -e BUILDER_UID=3D$(id -u) -e BUILDER_GID=3D$(id -g) \
+  -v /path/to/workspace-yocto-builder:/workdir \
+  my.registry.io/user/yocto-builder:latest
+```
+
+To get to a shell:
+
+```bash
+docker exec -it -w /workdir -u builder yocto_builder bash
+```
+
+You may want a different prompt, more like `poky-container`:
+
+```bash
+PS1=3D"\u@\h:\w\$ "
+```
+
+At this point, you should be able to follow the [Quick Build][quick-build]=
 guide in the [Yocto Project Documentation][yocto-docs].
+
+## Building `core-image-minimal`
+
+1. Clone `bitbake` so we can run `bitbake-setup`:
+
+   ```bash
+   git clone https://git.openembedded.org/bitbake.git
+   ```
+
+2. Setup `poky-master` non-interactively:
+
+   ```bash
+   bitbake/bin/bitbake-setup init --non-interactive poky-master poky distr=
o/poky machine/qemux86-64
+   ```
+
+3. Initialize the `poky-master` build environment:
+
+   ```bash
+   . bitbake-builds/poky-master/build/init-build-env
+   ```
+
+4. (Optional) Enable config fragments:
+
+   ```bash
+   bitbake-config-build enable-fragment core/yocto/root-login-with-empty-p=
assword
+   bitbake-config-build enable-fragment core/yocto/sbom-cve-check
+   bitbake-config-build enable-fragment core/yocto/sstate-mirror-cdn
+   ```
+
+   You can also pass multiple fragments:
+
+   ```bash
+   bitbake-config-build enable-fragment core/yocto/root-login-with-empty-p=
assword  core/yocto/sbom-cve-check core/yocto/sstate-mirror-cdn
+   ```
+
+5. Build `core-image-minimal`
+
+   ```bash
+   bitbake core-image-minimal
+   ```
+
+6. Run `core-image-minimal`
+
+   ```bash
+   runqemu nographic slirp snapshot
+   ```
+
+<!-- References -->
+
+[quick-build]: <https://docs.yoctoproject.org/brief-yoctoprojectqs/index.h=
tml>=20=20
+[yocto-docs]: <https://docs.yoctoproject.org>
--=20
2.47.3


