Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3B9CD98D9
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 19:32:03 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.78077.1781292717818277837
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 12 Jun 2026 12:31:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RMWshf6V;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-9159da9bba5so103054985a.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Jun 2026 12:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781292717; x=1781897517; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dNQ6lxLcB/94PUGGp8SM3sKCTY+XNX56EL/vvjblOE=;
        b=RMWshf6VTvCs0fyWZnyhsJ+JfMRn1uuOFTIiYW2tiRTnN6xfYQ0EVSn1PqgquSAU3e
         7OFTrL/CQZ5K/62xywoFvXFNAyKvcUY5aMAxpn/+eszleyA1lX03nSXXJIv10psAtpTo
         qz5M+vIV4Qcnu+VvwTEKDoSInuerpjFedIps3Ebncq9aBBvCi0GJEc4DGTe+REIk+z9o
         i63iO5WW80UxLT0eSfO3XG8iijMxSvtZNCL7ekT57PaRXm9wrBkk1u2mAhsVhwAd6vD7
         VLAgz4VJAZnjhgkbARAyWcwMKyFislhc7IRAKTSF3fDqCOlQn0fmMt/H6x1ZzrSwThGX
         S9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781292717; x=1781897517;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8dNQ6lxLcB/94PUGGp8SM3sKCTY+XNX56EL/vvjblOE=;
        b=l/3DnY0oKxGFt4Gt0GbthQcvONlxChqtqHoGOMfNsSVWFuKq7Ao5JvEqsSFUEL9qSH
         7NdQPQNS87Xd903TSSse0+q5u4uE1mP/kM2q0b0XBBHw6vuHv0CZ4A0XekpdowqF04rO
         hiUS6W9R40PJs0RWG8rvzI160X7DGjgBIPFxy86IXt+RpZyxgVROanTap979YDg7G8w4
         LalTlhpx3p1UG7Ld5tnzowkswIrFrMlJjMg20d9BYqhGE2bFBnfo4OsS3m8yEzdk0LWt
         fo9rnhE6k3gUqxyMifI36UBYYI9h2meIi5ZutwloxbxZk/Zkrfn7iB/BRN/aHsNWCoEN
         6u3w==
X-Gm-Message-State: AOJu0YyCAWUrPfq/p4qnWDs+EgG1zdRa2J8AFrNdS6e72FGb2b1V9tna
	w9ofACQV9ySQZtBkTuQWkGc6iR2BQgeJ7N8gfDWlF+90T3yZ182lZPGj
X-Gm-Gg: Acq92OGWwZwsB8P+PFQe1Yy2hMS6IWNkFibCs9utFjNi4tQGEz1vOf/sMDISgR1/M1f
	A6E0lcfX9e4D61Fbp9JtHmTKxddXtyFHWhaKmKbbQpoF89FEGdTydPGtYVrIlrrJ16255LLck5f
	IrShB84a8DiwnHkBFKdpotuNlS1aF6VeSx8yok3gx/wP714dJGG4sXtkREF6QR1ypaVqNo4WvO7
	/AY26enDV09tBuQsByikHVsMpck9FBV/d26G9qS7LyyM6OtbhWwD1wOZvhYQLyVVcjdeVvuEuXJ
	XJGQDstqYE3NJnlsBufsEb/7/B4NkzOTEnT2W7Nz2ME8b34F5KtwqV8w2n58FOvCbC0m/eg3j5I
	+QmcsGeP+/wwUeh0KoVonQcJ7QnUYh2xWZDfm1z+3X5qsBVIFXzAbtDlBeXkx61/JFnwF5eZRfZ
	A9lsHawLOk7atw1iHgOBeHVccp5kj3HAgh6c2A3AfTFzlZgqCP6gBy9FOcLOvgkKNoOyLaFwyrh
	ceJXiXD46libm6yBYm+xmCJeuxYl7ghxflY+FwDA+D2tA/yiywtng9wr/00u8B71lOUKGtz2KkF
	3Q1FImue9vietdinAON0V0DO
X-Received: by 2002:a05:620a:46a3:b0:915:87ad:d5b1 with SMTP id af79cd13be357-9161bbfca43mr639711585a.15.1781292716428;
        Fri, 12 Jun 2026 12:31:56 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619f3c324sm302457285a.21.2026.06.12.12.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 12:31:55 -0700 (PDT)
Message-ID: <6a2c5eab.f14b93a6.79425.b27f@mx.google.com>
Date: Fri, 12 Jun 2026 12:31:55 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: kraghava@qti.qualcomm.com
Cc: meta-virtualization@lists.yoctoproject.org, vkraleti@qti.qualcomm.com,
 anujmitt@qti.qualcomm.com, sbanerje@qti.qualcomm.com
Subject: Re: [PATCH v5 1/2] crosvm: add recipe for ChromeOS Virtual Machine
 Monitor (VMM)
In-Reply-To: <20260527191012.1125228-2-kraghava@qti.qualcomm.com>
References: <20260527191012.1125228-1-kraghava@qti.qualcomm.com>
 <20260527191012.1125228-2-kraghava@qti.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Jun 2026 19:32:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9881

Hi Keerthivasan,

Inline review of 1/2. Same caveat as on the cover: if any of these are
already addressed in your v1 (which I can't see), please ignore and
let me know.

On Thu, May 28, 2026 at 00:40 +0530, Keerthivasan Raghavan wrote:
> crosvm is a lightweight, Rust-based virtual
> machine monitor originally developed for ChromeOS,
> and provides an alternative to traditional VMMs such
> as QEMU.
>=20
> Signed-off-by: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
> ---
>  recipes-devtools/crosvm/crosvm-crates.inc | 966 ++++++++++++++++++++++
>  recipes-devtools/crosvm/crosvm_0.1.0.bb   |  57 ++
>  2 files changed, 1023 insertions(+)
>  create mode 100644 recipes-devtools/crosvm/crosvm-crates.inc
>  create mode 100644 recipes-devtools/crosvm/crosvm_0.1.0.bb
>=20
> diff --git a/recipes-devtools/crosvm/crosvm-crates.inc b/recipes-devtools/c=
rosvm/crosvm-crates.inc
> [... 966 lines of autogenerated crates.inc elided ...]
> diff --git a/recipes-devtools/crosvm/crosvm_0.1.0.bb b/recipes-devtools/cro=
svm/crosvm_0.1.0.bb
> new file mode 100644
> index 00000000..00b492b0
> --- /dev/null
> +++ b/recipes-devtools/crosvm/crosvm_0.1.0.bb
> @@ -0,0 +1,57 @@
> +SUMMARY =3D "crosvm is a secure, lightweight, and performant Virtual Machi=
ne Monitor (VMM) written in Rust."
> +
> +DESCRIPTION =3D "\
> +crosvm is a Rust-based virtual machine monitor (VMM) originally developed \
> +for ChromeOS. It uses KVM acceleration and process-level isolation to run =
guest VMs \
> +with sandboxed device emulation.\
> +"
> +
> +HOMEPAGE =3D "https://github.com/google/crosvm"
> +
> +LICENSE =3D "BSD-3-Clause-Clear"
> +LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/BSD-3-Clause-Clear;md5=
=3D7a434440b651f4a472ca93716d01033a"
> +
> +inherit cargo pkgconfig cargo-update-recipe-crates features_check
> +
> +SRC_URI =3D " \
> +    git://chromium.googlesource.com/crosvm/crosvm.git;branch=3Dmain;protoc=
ol=3Dhttps;name=3Dcrosvm \
> +    git://chromium.googlesource.com/chromiumos/platform/minijail;branch=3D=
main;protocol=3Dhttps;name=3Dminijail;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFI=
X}/third_party/minijail \
> +"
> +
> +SRCREV_crosvm =3D "b04c13a65b93034010b20612e3566d4f9d83c4f0"
> +SRCREV_minijail =3D "bfd22f25fd2302fe4ae5121d80c836e0f124e742"
> +
> +SRCREV_FORMAT =3D "crosvm_minijail"
> +
> +PV =3D "0.1.0+git"
> +
> +DEPENDS +=3D "libcap wayland wayland-native protobuf-native wayland-protoc=
ols"
> +
> +REQUIRED_DISTRO_FEATURES =3D "kvm"
> +
> +COMPATIBLE_HOST =3D "(aarch64|x86_64).*-linux.*"
> +
> +BBCLASSEXTEND =3D "native"
> +
> +# cargo.bbclass adds SRC_URI entries with "name" and "destsuffix" to
> +# ${CARGO_HOME}/config.toml as Cargo patches. It uses the SRC_URI path as-=
is
> +# and does not account for "subdir".
> +# This can make Cargo try to build a directory that has no Cargo.toml. Rem=
ove
> +# the generated entry from ${CARGO_HOME}/config.toml. The crosvm Cargo.toml
> +# already points to the correct patch path relative to the source root.
> +do_filter_minijail_cargo_config() {
> +
> +    cfg=3D"${CARGO_HOME}/config.toml"
> +
> +    if [ ! -f "$cfg" ]; then
> +        bbwarn "Skipping missing Cargo config: $cfg"
> +        exit 0
> +    fi
> +
> +    bbnote "Processing Cargo config: $cfg"
> +    sed -i '/minijail/d' "$cfg"
> +}
> +
> +addtask filter_minijail_cargo_config after do_configure before do_compile
> +
> +require crosvm-crates.inc

A few things:

1. recipes-devtools/ vs recipes-extended/

The other VMMs in this layer (libvirt, xen, xen-tools) all live under
recipes-extended/. recipes-devtools/ in meta-virt is mostly go-mod
tooling (go, go-distribution, etc.). crosvm fits the VMM category, so
recipes-extended/crosvm/ would match convention better.

Not strictly blocking, but worth moving in v2 (or whatever the next
spin is called).

2. do_filter_minijail_cargo_config =E2=80=94 root cause, please

The recipe carries this workaround:

> +do_filter_minijail_cargo_config() {
> +    cfg=3D"${CARGO_HOME}/config.toml"
> +    if [ ! -f "$cfg" ]; then
> +        bbwarn "Skipping missing Cargo config: $cfg"
> +        exit 0
> +    fi
> +    bbnote "Processing Cargo config: $cfg"
> +    sed -i '/minijail/d' "$cfg"
> +}
> +addtask filter_minijail_cargo_config after do_configure before do_compile

The comment says cargo.bbclass writes a [patches.crates-io] entry to
${CARGO_HOME}/config.toml using the SRC_URI path as-is, without
honouring the "subdir=3D" in your minijail SRC_URI entry. So cargo tries
to build a path that has no Cargo.toml and fails.

This concerns me because meta-virt has a number of other cargo
recipes =E2=80=94 netavark, aardvark-dns, podlet, fuse-overlayfs =E2=80=94 an=
d none
of them carry an equivalent workaround. So either:

  a) they all benefit from the same problem somehow (e.g. their
     SRC_URI entries don't use subdir=3D), or

  b) they do trigger the same cargo.bbclass behaviour but happen to
     not break because their secondary repos do contain a Cargo.toml
     at the SRC_URI root, or

  c) cargo.bbclass has been fixed in oe-core master since this recipe
     was written, and the workaround is now stale.

Could you dig into the root cause and confirm which of (a/b/c) applies?
If (c), we can just drop the workaround. If (a) or (b), the fix
probably belongs in cargo.bbclass upstream =E2=80=94 and we'd carry a
documented local workaround until that lands, rather than a sed-script
postfunc with no commentary on why it's needed only for crosvm.

3. SRC_URI source

> +    git://chromium.googlesource.com/crosvm/crosvm.git;branch=3Dmain;protoc=
ol=3Dhttps;name=3Dcrosvm \

chromium.googlesource.com is the canonical source. The
github.com/google/crosvm mirror is typically more reliable from a
yocto build infrastructure standpoint (the chromium.org hosts have
periodically been touchy with cgit-style fetches for me in the past).
Did you consider the github mirror? If there's a reason chromium is
preferred (e.g. it gets fixes first, or has signed tags), worth a
one-line comment in the recipe.

4. PV =3D "0.1.0+git"

> +PV =3D "0.1.0+git"

crosvm doesn't tag releases, so "0.1.0" is arbitrary. That's fine =E2=80=94
we have precedent in the layer (kvmtool's PV is similarly cosmetic).
Just calling it out so we don't get bug reports asking why we're
shipping a "0.1.0" of a project that has never had a 1.0.

5. BBCLASSEXTEND =3D "native"

> +BBCLASSEXTEND =3D "native"

Per offline discussion with you previously, I understand this is for
a future "runqemu"-like runner that can boot a guest from a host
build. Nothing to do today; leave it.

Bruce

