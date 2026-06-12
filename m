Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C5FCD98CF
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 19:32:03 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78291.1781292719540217671
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 12 Jun 2026 12:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rJS4dqyz;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-915aa0a9293so244482285a.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Jun 2026 12:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781292718; x=1781897518; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYzNgN2A1s1Cdh6uOTIqDSRh8HnPIY2XDyp4selPybs=;
        b=rJS4dqyzXFlOhy7Uex3AdhQOcttSnA6gocryngjrF0KLdRRJOTgsx9YjGZAT5p1vT1
         zJPbiR15ThubCz6pzgI9uKoQpSLbhm885Voq2wIQnmerpHelkron8m0XIM3lcbB20Cb5
         ykDRCbxx0eH0oTRU7hOFbVNIaD9klovMBo2V7aTTLWZ8+udJHF7GWypR5A9tpwXYRsZu
         Agi0L41+/0xjoBbYSnWWZLxX6XuUiQnGS6nwC1HNfP8o+IdSif8mseKFOTiSsNWY3EnW
         xVv2EflviySayhuzXBsrJWI49ho/Dyy9TeGJjnH2XXqk/0P1E6FH71b24CMpfJ7vuqIj
         uMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781292718; x=1781897518;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LYzNgN2A1s1Cdh6uOTIqDSRh8HnPIY2XDyp4selPybs=;
        b=WTddhYrsanXqyCUzanq8ZE3SCTd9tHnNwBRp3SmSp5tscxEqrfkhm5RRX1IrvKxHuU
         GWSxYfBxwBDaPFkrrVZ4XJci0xGTgLdsQvIznHBpEqGeMUaQrRwkQhmBtURRib1sa66R
         o6h2aW1jaDYYcwklQfXB0NVg/DfiE1MLOcXd2tOMLaPYwfLP8mqEfuJY2Lv/J4YxiYPb
         Fj4v/YkH9saQpIwFExqC7dfhgGEcXVEQe8/5COeHL9y42hFHDdaqZRAlslquMBQynDV2
         0A1tVRkYhkh1gzN5mz6b48sp5VDq3nx2FlHzOTrC59DEoGCBEPymiP6mxXV956N3b3GG
         JyJw==
X-Gm-Message-State: AOJu0YxhfVFVUUx2TtB/MLheDX8WmRi7TDyBWLgmo0Lb25zjT1LnJSeM
	BwLAKuQ8QqZHLPhe+vwj5cWo00/npMISE7tEUgqsckQFTqokso6MDQrA
X-Gm-Gg: Acq92OF2gfaB5GXMLGpE5F+qB91Xleqt3iSjRH1eak+hR3XDXXQOijycvKchMRkCqAk
	Fz+zCGeG+V5fBcGc1XxuW8607XQXJhn0NrUmdA2zo4GBNK92qIAxzP4KP/VHTbmUWLtiZEdu9K0
	Q4+ecwaIst9BcxLFtV6d4+zkLiGzHnG3nysxXNYMJ2k0eh4tipqe9sfOZd+bXarqMSuqI8AHmLK
	6SbdGzKw7OGYRKaGXmU0c+WRpXpuusW7GxDG9EhPmdFwJz0Dej3dvzJ+WQCMBClBGQG3fPC77YO
	1bcQNzuQYbfi5uKTwLegAIBsWJ+46zQhM4sCwG0pFOxk3+ZXhUNno4ypbxjK0gTC5kJxaFC/uXq
	DdhTPh1b/RaWUtiSq5UZIzvdFuygrQ5z0ermPxkiSyGub2L0h0TTgB8+8jVuwpnZ0np8JTLVwTu
	wss+z7XU+g0K2A/s3kbGqVCR2r0rCQ/kj+J4KZL9O/REKV7A6hpv3D5S06iM6pRmQ+gy7CF5JS6
	RSp0DqhvEZfWeI30IFNRBzIzqYKRoqXkYsf/FYEkK2EkO6bgQS/9GY3IOe69d+9VP6KLp4MJn3e
	bY8vtuwVvQpU66OrGnkXiK7H5Rd7IarAcBw=
X-Received: by 2002:a05:620a:288f:b0:8eb:41de:fb38 with SMTP id af79cd13be357-9161bd65d02mr546775185a.7.1781292718257;
        Fri, 12 Jun 2026 12:31:58 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619f1b400sm301454485a.15.2026.06.12.12.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 12:31:57 -0700 (PDT)
Message-ID: <6a2c5ead.a342f677.387e91.9022@mx.google.com>
Date: Fri, 12 Jun 2026 12:31:57 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: kraghava@qti.qualcomm.com
Cc: meta-virtualization@lists.yoctoproject.org, vkraleti@qti.qualcomm.com,
 anujmitt@qti.qualcomm.com, sbanerje@qti.qualcomm.com
Subject: Re: [PATCH v5 2/2] crosvm-image-minimal: add a reference image for
 crosvm demo
In-Reply-To: <20260527191012.1125228-3-kraghava@qti.qualcomm.com>
References: <20260527191012.1125228-1-kraghava@qti.qualcomm.com>
 <20260527191012.1125228-3-kraghava@qti.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Jun 2026 19:32:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9882

Hi Keerthivasan,

Inline review of 2/2. Same caveat as before =E2=80=94 if any of these are
addressed in v1, please ignore.

On Thu, May 28, 2026 at 00:40 +0530, Keerthivasan Raghavan wrote:
> A reference image called `crosvm-image-minimal` is provided
> for testing/validation on supported machines(arm64 and x86-64).
> Instructions are provided to test on QEMU(x86-64 only).
>=20
> Testing was done on x86-64 by achieving boot to shell on a crosvm vm
> instance running inside a vm instance on QEMU, i.e nested virtualization
> with machine as qemux86-64.
> Testing was done on arm64 by achieving boot to shell on a crosvm vm
> instance running directly on meta-qcom machine qcs9100-ride-sx.
>=20
> Signed-off-by: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
> ---
>  recipes-extended/images/README-crosvm.md      | 68 +++++++++++++++++++
>  .../images/crosvm-image-minimal.bb            | 68 +++++++++++++++++++
>  2 files changed, 136 insertions(+)
>  create mode 100644 recipes-extended/images/README-crosvm.md
>  create mode 100644 recipes-extended/images/crosvm-image-minimal.bb
>=20
> diff --git a/recipes-extended/images/README-crosvm.md b/recipes-extended/im=
ages/README-crosvm.md
> new file mode 100644
> index 00000000..2c36da7d
> --- /dev/null
> +++ b/recipes-extended/images/README-crosvm.md
> @@ -0,0 +1,68 @@
> +# crosvm-image-minimal: build and test
> +
> +Steps to test/validate crosvm are given below.
> +A reference image `crosvm-image-minimal` is provided
> +for this purpose.
> +
> +## local.conf example
> +
> +```conf
> +# virtualization
> +MACHINE ??=3D "qemux86-64"
> +DISTRO ??=3D "nodistro"
> +BBMULTICONFIG ?=3D ""
> +
> +DISTRO_FEATURES +=3D " kvm virtualization"
> +IMAGE_FEATURES +=3D " empty-root-password allow-empty-password allow-root-=
login"
> +IMAGE_FSTYPES =3D "ext4"
> +IMAGE_FSTYPES:remove =3D "ext4.zst"
> +```
> +
> +## Build
> +
> +```bash
> +bitbake crosvm-image-minimal
> +```
> +
> +## Boot in QEMU
> +
> +When the target `MACHINE` is `qemux86-64`, the host running QEMU must supp=
ort:
> +- nested virtualization
> +- Intel VT-x or AMD SVM
> +- exposed `/dev/kvm`
> +
> +Run from `tmp/deploy/images/qemux86-64/` (or adjust paths):
> +
> +```bash
> +qemu-system-x86_64 \
> +  -enable-kvm \
> +  -machine q35 \
> +  -cpu host \
> +  -smp 4 \
> +  -m 4096 \
> +  -kernel bzImage \
> +  -drive file=3Dcrosvm-image-minimal-qemux86-64.rootfs.ext4,format=3Draw,i=
f=3Dvirtio \
> +  -append "root=3D/dev/vda rw console=3DttyS0 earlyprintk=3Dserial nokaslr=
" \
> +  -nographic
> +```
> +
> +## Run crosvm inside the guest
> +
> +The image bundles:
> +
> +- `/var/lib/crosvm/images/guest-kernel`
> +- `/var/lib/crosvm/images/guest.ext4`
> +
> +```bash
> +crosvm --log-level "debug,disk=3Doff" run \
> +  --disable-sandbox  /var/lib/crosvm/images/guest-kernel \
> +  --block /var/lib/crosvm/images/guest.ext4,root \
> +  -p "root=3D/dev/vda rw console=3DttyS0 earlyprintk=3Dserial nokaslr"
> +```
> +
> +## Quick sanity checks
> +
> +```bash
> +test -e /dev/kvm && echo "/dev/kvm present"
> +ls -l /var/lib/crosvm/images/
> +```
> diff --git a/recipes-extended/images/crosvm-image-minimal.bb b/recipes-exte=
nded/images/crosvm-image-minimal.bb
> new file mode 100644
> index 00000000..de503a99
> --- /dev/null
> +++ b/recipes-extended/images/crosvm-image-minimal.bb
> @@ -0,0 +1,68 @@
> +SUMMARY =3D "A minimal image containing crosvm to demo its uage."
> +
> +KVM_MODULES =3D ""
> +
> +KVM_MODULES:x86-64 =3D " \
> +    kernel-module-kvm \
> +    kernel-module-kvm-intel \
> +    kernel-module-kvm-amd \
> +"
> +
> +IMAGE_INSTALL =3D "packagegroup-core-boot crosvm"
> +IMAGE_INSTALL:append =3D " ${KVM_MODULES}"
> +
> +IMAGE_LINGUAS =3D " "
> +
> +LICENSE =3D "MIT"
> +
> +inherit core-image
> +
> +# Guest artifact source settings (can be overridden in local.conf).
> +CROSVM_GUEST_IMAGE_RECIPE ?=3D "core-image-minimal"
> +CROSVM_GUEST_IMAGE_FSTYPE ?=3D "ext4"
> +CROSVM_GUEST_ROOTFS ?=3D "${CROSVM_GUEST_IMAGE_RECIPE}-${MACHINE}.rootfs.$=
{CROSVM_GUEST_IMAGE_FSTYPE}"
> +CROSVM_GUEST_KERNEL ?=3D "${KERNEL_IMAGETYPE}"
> +
> +# Final location inside the host/root image.
> +CROSVM_GUEST_TARGET_DIR ?=3D "/var/lib/crosvm/images"
> +CROSVM_GUEST_TARGET_ROOTFS_NAME ?=3D "guest.${CROSVM_GUEST_IMAGE_FSTYPE}"
> +CROSVM_GUEST_TARGET_KERNEL_NAME ?=3D "guest-kernel"
> +
> +# Ensure guest image and kernel are available before rootfs postprocess ru=
ns.
> +# The same kernel is used for both the host and guest.
> +do_rootfs[depends] +=3D "${CROSVM_GUEST_IMAGE_RECIPE}:do_image_complete vi=
rtual/kernel:do_deploy"
> +
> +# Copy guest rootfs+kernel into the host rootfs for crosvm demo runtime.
> +bundle_crosvm_guest() {
> +    set -e
> +
> +    local deploy_dir=3D"${DEPLOY_DIR_IMAGE}"
> +    local rootfs_src=3D"${deploy_dir}/${CROSVM_GUEST_ROOTFS}"
> +    local kernel_src=3D"${deploy_dir}/${CROSVM_GUEST_KERNEL}"
> +    local target_dir=3D"${IMAGE_ROOTFS}${CROSVM_GUEST_TARGET_DIR}"
> +
> +    if [ ! -e "$rootfs_src" ]; then
> +        bbfatal "Cannot find guest rootfs. Tried: \
> +                ${deploy_dir}/${CROSVM_GUEST_ROOTFS} and \
> +                ${deploy_dir}/${CROSVM_GUEST_IMAGE_RECIPE}-${MACHINE}.root=
fs.${CROSVM_GUEST_IMAGE_FSTYPE}"
> +    fi
> +
> +    if [ ! -e "$kernel_src" ]; then
> +        bbfatal "Cannot find guest kernel. Tried: \
> +                ${deploy_dir}/${CROSVM_GUEST_KERNEL}"
> +    fi
> +
> +    install -d "$target_dir"
> +
> +    install -m 0644 "$(readlink -f "$rootfs_src")" \
> +                    "$target_dir/${CROSVM_GUEST_TARGET_ROOTFS_NAME}"
> +
> +    install -m 0644 "$(readlink -f "$kernel_src")" \
> +                    "$target_dir/${CROSVM_GUEST_TARGET_KERNEL_NAME}"
> +}
> +
> +ROOTFS_POSTPROCESS_COMMAND +=3D "bundle_crosvm_guest;"
> +
> +IMAGE_ROOTFS_SIZE =3D "0"
> +
> +KERNEL_MODULE_AUTOLOAD:append:x86-64 =3D " kvm kvm_amd kvm_intel"

A few observations:

1. README is appreciated; I asked for this on v4 and it's here.
   Skimmed it, looks fine. Will check it more carefully once I'm
   actually building.

2. Test coverage gap

> Testing was done on x86-64 by achieving boot to shell on a crosvm vm
> instance running inside a vm instance on QEMU, i.e nested virtualization
> with machine as qemux86-64.
> Testing was done on arm64 by achieving boot to shell on a crosvm vm
> instance running directly on meta-qcom machine qcs9100-ride-sx.

Good progress over v4 =E2=80=94 x86_64 nested under qemu lets me actually try
it locally, which is what I needed. Thank you for that.

The remaining gap is qemuarm64. I can't reproduce qcs9100-ride-sx
without the hardware, so the arm64 path is effectively un-testable
from my side right now. Did you try qemuarm64 with nested
virtualization (the way you did qemux86-64), and if so what
happened? Even a "I tried, it didn't boot because X" would tell me
whether we need to ask upstream for qemuarm64 support or whether it
just needs some Yocto config wiring.

3. Image recipe =E2=80=94 bundle_crosvm_guest postprocess

> +# Ensure guest image and kernel are available before rootfs postprocess ru=
ns.
> +# The same kernel is used for both the host and guest.
> +do_rootfs[depends] +=3D "${CROSVM_GUEST_IMAGE_RECIPE}:do_image_complete vi=
rtual/kernel:do_deploy"

> +bundle_crosvm_guest() {
> +    set -e
[...]
> +    install -m 0644 "$(readlink -f "$rootfs_src")" \
> +                    "$target_dir/${CROSVM_GUEST_TARGET_ROOTFS_NAME}"
[...]
> +ROOTFS_POSTPROCESS_COMMAND +=3D "bundle_crosvm_guest;"

This is the same pattern we use elsewhere (container-cross-install
does similar bundle-into-rootfs work). Worth being aware that
DEPLOY_DIR_IMAGE-as-input has the sstate sharp-edge we documented
recently =E2=80=94 the recipe that produces ${CROSVM_GUEST_ROOTFS} can hit
sstate while its deployed output is stale from a prior run, and
then this image hits sstate with the stale guest baked in. Same
class of bug we fixed for vcontainer-tarball with explicit
mcdepends on rootfs-image:do_image_complete (commit 6fc1aa83
on master).

Not necessarily blocking =E2=80=94 the do_rootfs[depends] line is doing
the right thing for ordering =E2=80=94 but worth being aware of for when
this becomes a CI build and stale-guest reports start appearing.

4. KVM modules layout

> +KVM_MODULES =3D ""
> +
> +KVM_MODULES:x86-64 =3D " \
> +    kernel-module-kvm \
> +    kernel-module-kvm-intel \
> +    kernel-module-kvm-amd \
> +"
[...]
> +KERNEL_MODULE_AUTOLOAD:append:x86-64 =3D " kvm kvm_amd kvm_intel"

x86_64 is handled. arm64 is empty (KVM_MODULES =3D "" with no
:aarch64 override). On arm64, KVM is built into the kernel and
not a loadable module on most boards =E2=80=94 so an empty list is right.
But should we add explicit a :aarch64 =3D "" comment or some
documentation so the reader doesn't wonder if it's a bug?

5. CROSVM_GUEST_IMAGE_RECIPE default

> +CROSVM_GUEST_IMAGE_RECIPE ?=3D "core-image-minimal"

Sensible default. The PARSE-TIME do_rootfs[depends] +=3D that uses
this variable means changing it in local.conf actually works
correctly (because +=3D happens at parse time, before the dep is
read). Worth a comment in the recipe to that effect so users know
they can override without surprises.

Bruce

