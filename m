Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071F4FF8868
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 11:56:14 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11617.1777377369899599816
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 04:56:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=P2Xy0F9J;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35e576110adso7828260a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 04:56:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777377369; cv=none;
        d=google.com; s=arc-20240605;
        b=OMjPVwN8t3vAUYNdpOG7SZULmrAsLFMpyrDuPlJDsXAPclYp0Tu/Cqwm5chnLOvcMQ
         jmCRFPXA+wOXbw/dV/EllJAx6jCyoTUVSVb0mRBEMJYiigJ0o7ed+ZRjxiMjRc1Riw/U
         u2fL2rO6teLxn9d9x8yrayxfJe7u6jjNW4Eu8M2iJy6A7h7+phsk6/soDO/+fR1ejFCV
         Z2wA1uGkvk1rRQDrAJXlrDUAhTwOEVMAV7vWZy2ME9EytnKCxEw5Y6yv7NqUkFBCbAr+
         G9B0+x5B9AQG7fS6MGz90+JkbQhb1yQtZqiTk/erYcDmoCS3tpLApX70qTF6eyAbv8E+
         hKLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YlIoHG02W3b4GE0LXXqcGHTUDFAez1F3a2F6BsTeZMs=;
        fh=RlXFC4EVqiP0gvru7+OOCjvgFbfzQ6di88zFfkgPMyQ=;
        b=jSYb4ECia59MjaHYBher0Om5dRuAaRBA1wXdYaWRal5VnsDd3mtCktq6TlywuUKJnP
         pcT5y9/kJX6ybcOHRlmt67SLiQf0MfmjPS5BmZz8WIkeZCwB/SaN/wqbP4cb2xt6Exii
         Xmf7uw0OGdLw+OoTKquaIYT5P/DBx+tsZii4DTL0+m9q6laO2vyCNjQdwdGjyNsdFVRv
         FnSjMBqUqJFNoruup1OiXB9tQKBPJubtQOa6k1TRHDiPJTsCuCm87OwLOF0b8yBnn+g9
         xcJmYGu9UL2Iu/z2V0z2wHAKqsOiI+kaaSqb2mWA1LA3f8ee0JBhDIClVmCfMxTAo7pq
         2gpw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777377369; x=1777982169; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YlIoHG02W3b4GE0LXXqcGHTUDFAez1F3a2F6BsTeZMs=;
        b=P2Xy0F9JrdNiY901Hn2q4PIcs0DGJtg5Q9a0ty39M0RaulDvQZ07tTijEV7SCuk39C
         8tY2HyWBw/JQd/rBcg4VGFdGfU/WxTKD3+eSfCypcxk8YTSHg0sDRe7sZdoadlTugh/b
         /K9hP/Sk9mQwi9f3ASdbBDyOVrSCnvM/hxX0FnBunZZ0lpSs9Y3X4Blt9Pv87x+TGFCw
         Ce59mY30DCwVE16qjakJbF9D0H4mbBZ0BogCSdpDVzpTiNgFzlA2hjMT6cACeydPzWvp
         enaRxFV15YdWhnhHvrRJM94xQDxI2esvxhf86B4pA2o4E+D6NbCew6ScIk0INozdmCiZ
         otuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777377369; x=1777982169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YlIoHG02W3b4GE0LXXqcGHTUDFAez1F3a2F6BsTeZMs=;
        b=iBsPd4VevG4RbFPkzr4oIk74LbdBEIy+qM80qGN20KmsGybLlLDIZnag/0B0mPdvOb
         y7xNuI+/+6G0j8kufzZPlmKwk9JUf2BrvsbBX+A/ElgK5HfPDHMaMfTbFSi08VYRwYmJ
         vrKglqPBaLlyhxPPs/h0gaMJu0mDLMtM3KR/9ys8HCZiiIEFXzgPCpSQ26gPyP+fgZJ7
         8uXsEoJBJJkTtfZig9uGUa5ix+dOgIvtQiqj8QMkvnjajhWWe6mrvfOVveUjGVs8waaW
         46Ltuysy0m+8I9txX2aYdXsX9mtGwlc/ZDG9Zt6ERuciPPOZv4tZ2cyskcAM3UHBIejU
         QBFw==
X-Gm-Message-State: AOJu0Yz25QA/NNN860O0sgtqlceIO7lztb5TnTY7lzPE8Bl5ZLnDpL7p
	QgLlZX7CWRzu9WC+ktaQx0lU+s6AJmjxrPa8TRVyIMrUVMZYOUY0I83ai/aCb0xgq3dqYFES3VX
	uJOT1Qnpo0VgDGVPxH04ZsTD9UFmGNIA=
X-Gm-Gg: AeBDiesvQiXE208l0P2jeFheb5l3HYNtszpShf6m9TLFVqimhlM8bc324c1TDptxckT
	WxQqX7yht9XJGoz/QThnPTXqYXlDvUwaF2pz3TRIVgQjZj9FJOomhR5FSd1YhC6Ln82IFzR8+q/
	26TrwKPTExznv8xWMjLhS3rlH+AJdXezQjzFctG8uEvCwyvqVHeo5Pl9AkZwUyBXYOcAGSmlltk
	VVxjt90AciloZ1NeAj2AqXBtlKubc83hDtyo51lQ2iaqNM5/1KqjvicaSJCbiR95cq5e5tA0pID
	dT2E2VjIPB1gFBjcvxEUpEGFe/bEHozpx68X3ehbszIkKBSRgIU=
X-Received: by 2002:a17:90b:4ad0:b0:35b:e4f0:f9b4 with SMTP id
 98e67ed59e1d1-36491f2defamr2164005a91.10.1777377369063; Tue, 28 Apr 2026
 04:56:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1777337030.git.tim.orling@konsulko.com> <f654e57a131e4e6ef29ba6b8159a77bd1f65f388.1777337030.git.tim.orling@konsulko.com>
In-Reply-To: <f654e57a131e4e6ef29ba6b8159a77bd1f65f388.1777337030.git.tim.orling@konsulko.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 28 Apr 2026 07:55:56 -0400
X-Gm-Features: AVHnY4KcK1wV3B-28z6oC7CPHqg96ChJRR3GHJbS_0pxwnAglUkwSlyv2TONrXs
Message-ID: <CADkTA4NTi=3C5X+ipmXzP7C=xqPHEwe-gVsamJdCHfGuQSdoTQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [RFC PATCH 3/4] vcontainer-initramfs-create.inc:
 depend on virtual/kernel:do_deploy
To: ticotimo@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000b703ee065083eaad"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 11:56:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9770

--000000000000b703ee065083eaad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 9:13=E2=80=AFPM Tim Orling via lists.yoctoproject.o=
rg
<ticotimo=3Dgmail.com@lists.yoctoproject.org> wrote:

> vcontainer-tarball fails on sstate-accelerated builds with errors
> similar to:
>
>   vdkr blob not found: .../tmp-vruntime-x86-64/deploy/images/\
>   qemux86-64/vdkr/x86_64/bzImage
>
> do_compile in vcontainer-initramfs-create.inc copies the kernel out
> of the multiconfig deploy dir:
>
>     KERNEL_FILE=3D"${MC_DEPLOY}/${KERNEL_IMAGETYPE_INITRAMFS}"
>
> but only declares build-time deps on the two image recipes:
>
>     do_compile[depends]  =3D
> "${VCONTAINER_RUNTIME}-tiny-initramfs-image:do_image_complete"
>     do_compile[depends] +=3D
> "${VCONTAINER_RUNTIME}-rootfs-image:do_image_complete"
>
> The existing comment argued that the kernel is "built as a dependency
> of the rootfs image" so no explicit kernel dep was needed. That
> conflates building with deploying: a core-image rootfs needs the
> kernel via virtual/kernel:do_shared_workdir / do_packagedata, but it
> does not force virtual/kernel:do_deploy. The bare bzImage / Image
> symlink only lands in DEPLOY_DIR_IMAGE when something explicitly
> pulls in virtual/kernel:do_deploy (typically qemuboot.bbclass or an
> IMAGE_CLASSES inherit), which the vruntime-* multiconfigs do not do.
>
> Why sstate exposes it so reliably:
>
>   - On a clean from-source build the kernel ends up deployed
>     transitively through other mechanisms and do_compile finds it by
>     accident.
>   - On an sstate-accelerated build,
> <runtime>-rootfs-image:do_image_complete
>     is restored straight from cache, virtual/kernel:do_deploy is
>     never invoked, MC_DEPLOY/bzImage doesn't exist, do_compile only
>     emits a bbwarn, and do_deploy silently skips the kernel install
>     because of its `if [ -f ${B}/kernel ]` guard. vcontainer-tarball
>     is then the one that finally fatals with "vdkr blob not found".
>   - Because the kernel wasn't in do_compile's signature, the
>     do_deploy sstate key didn't reflect it either, so a cached
>     kernel-less deploy could be reused indefinitely.
>
> Fix: declare an explicit intra-multiconfig dep on
> virtual/kernel:do_deploy. The recipe runs inside the mc (it is pulled
> in as `mc::<mc>:vdkr-initramfs-create:do_deploy` from
> vcontainer-tarball.bb), so a plain `depends` =E2=80=94 not `mcdepends` =
=E2=80=94 is
> correct. Also promote the missing-kernel bbwarn to bbfatal so a
> future regression fails loudly at the producing recipe instead of
> downstream in vcontainer-tarball.
>


Your diagnosis of the sstate failure looks right to me.

do_image_complete runs before do_build, so the virtual/kernel:do_deploy
dependency attached to do_build in image.bbclass is never pulled into
the dependency chain. The kernel ends up in MC_DEPLOY by accident
on clean builds but is  missing on sstate-accelerated ones.

However, I'd prefer not to add an explicit virtual/kernel:do_deploy
dependency to the initramfs-create recipe. This recipe is designed as a
best-effort
blob assembler =E2=80=94 the kernel is intentionally optional (bbwarn, not =
bbfatal)
to support use cases where the kernel is provided  externally or from the
main build. Adding a hard dependency on virtual/kernel:do_deploy couples
 the recipe to the multiconfig kernel build and prevents those use cases.

Instead, I've fixed this by changing the dependency from
do_image_complete to do_build:

  do_compile[depends] =3D
"${VCONTAINER_RUNTIME}-tiny-initramfs-image:do_build"
  do_compile[depends] +=3D "${VCONTAINER_RUNTIME}-rootfs-image:do_build"

Both image recipes inherit core-image =E2=86=92 image.bbclass, which has:

  KERNEL_DEPLOY_DEPEND ?=3D "virtual/kernel:do_deploy"
  do_build[depends] +=3D "${KERNEL_DEPLOY_DEPEND}"

By depending on do_build instead of do_image_complete, we get
virtual/kernel:do_deploy transitively through the existing image.bbclass
dependency chain ... no new coupling needed. The image artifacts
are already deployed after do_image_complete, so they're available
when our do_compile  runs after do_build.

I've also kept the bbwarn rather than promoting to bbfatal .. the blob
assembler should remain permissive, while vcontainer-tarball.bb
(the final packager) is the one that enforces completeness with bbfatal.

I'd also like to change the name of the initramfs recipe, since it really
isn't building an initramfs, but that's for another time.

If I merge my version, can you test it in the AB environment to see
if the fix holds ? If it doesn't, we'll just go with your patch.

Bruce


>
> AI-Generated: Claude Cowork Opus 4.7
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  .../vcontainer-initramfs-create.inc           | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/recipes-containers/vcontainer/vcontainer-initramfs-create.in=
c
> b/recipes-containers/vcontainer/vcontainer-initramfs-create.inc
> index 1a22c3d4..29b14e20 100644
> --- a/recipes-containers/vcontainer/vcontainer-initramfs-create.inc
> +++ b/recipes-containers/vcontainer/vcontainer-initramfs-create.inc
> @@ -58,12 +58,18 @@ INHIBIT_DEFAULT_DEPS =3D "1"
>  # Dependencies:
>  # 1. The tiny initramfs image (produces cpio.gz)
>  # 2. The multiconfig rootfs image (produces squashfs)
> -# 3. The kernel from main build
> -#
> -# Both initramfs and rootfs images are in the same multiconfig
> +# 3. The kernel's do_deploy (so ${MC_DEPLOY}/${KERNEL_IMAGETYPE_INITRAMF=
S}
> +#    =E2=80=94 e.g. bzImage/Image =E2=80=94 actually exists before do_co=
mpile reads it).
> +#    Being a build-time dep of the rootfs image is not enough: image
> +#    recipes don't imply virtual/kernel:do_deploy, so on an sstate-
> +#    accelerated build the kernel binary never lands in MC_DEPLOY and
> +#    this recipe silently deploys a kernel-less blob set, which later
> +#    fatals in vcontainer-tarball as "vdkr blob not found: .../bzImage".
> +#    The dep is intra-multiconfig (this recipe runs inside the mc), so
> +#    a plain depends =E2=80=94 not mcdepends =E2=80=94 is correct.
>  do_compile[depends] =3D
> "${VCONTAINER_RUNTIME}-tiny-initramfs-image:do_image_complete"
>  do_compile[depends] +=3D
> "${VCONTAINER_RUNTIME}-rootfs-image:do_image_complete"
> -# mcdepends set conditionally in anonymous python below
> +do_compile[depends] +=3D "virtual/kernel:do_deploy"
>
>  S =3D "${UNPACKDIR}"
>  B =3D "${WORKDIR}/build"
> @@ -152,7 +158,10 @@ do_compile() {
>          KERNEL_SIZE=3D$(stat -c%s ${B}/kernel)
>          bbnote "Kernel copied: ${KERNEL_SIZE} bytes ($(expr
> ${KERNEL_SIZE} / 1024 / 1024)MB)"
>      else
> -        bbwarn "Kernel not found at ${KERNEL_FILE} =E2=80=94 check that =
the
> vruntime multiconfig kernel is built"
> +        # Fatal rather than warn: silently shipping a kernel-less blob s=
et
> +        # lets vcontainer-tarball get much further before failing with a
> +        # confusing "vdkr blob not found" and produces stale sstate.
> +        bbfatal "Kernel not found at ${KERNEL_FILE}. This usually means
> virtual/kernel:do_deploy was not pulled into the multiconfig build graph;
> ensure do_compile[depends] includes virtual/kernel:do_deploy."
>      fi
>  }
>
> --
> 2.50.1 (Apple Git-155)
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9752):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9752
> Mute This Topic: https://lists.yoctoproject.org/mt/119042095/1050810
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

--000000000000b703ee065083eaad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 27, 2026 at 9:13=E2=80=
=AFPM Tim Orling via <a href=3D"http://lists.yoctoproject.org" target=3D"_b=
lank">lists.yoctoproject.org</a> &lt;ticotimo=3D<a href=3D"mailto:gmail.com=
@lists.yoctoproject.org" target=3D"_blank">gmail.com@lists.yoctoproject.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
vcontainer-tarball fails on sstate-accelerated builds with errors<br>
similar to:<br>
<br>
=C2=A0 vdkr blob not found: .../tmp-vruntime-x86-64/deploy/images/\<br>
=C2=A0 qemux86-64/vdkr/x86_64/bzImage<br>
<br>
do_compile in vcontainer-initramfs-create.inc copies the kernel out<br>
of the multiconfig deploy dir:<br>
<br>
=C2=A0 =C2=A0 KERNEL_FILE=3D&quot;${MC_DEPLOY}/${KERNEL_IMAGETYPE_INITRAMFS=
}&quot;<br>
<br>
but only declares build-time deps on the two image recipes:<br>
<br>
=C2=A0 =C2=A0 do_compile[depends]=C2=A0 =3D &quot;${VCONTAINER_RUNTIME}-tin=
y-initramfs-image:do_image_complete&quot;<br>
=C2=A0 =C2=A0 do_compile[depends] +=3D &quot;${VCONTAINER_RUNTIME}-rootfs-i=
mage:do_image_complete&quot;<br>
<br>
The existing comment argued that the kernel is &quot;built as a dependency<=
br>
of the rootfs image&quot; so no explicit kernel dep was needed. That<br>
conflates building with deploying: a core-image rootfs needs the<br>
kernel via virtual/kernel:do_shared_workdir / do_packagedata, but it<br>
does not force virtual/kernel:do_deploy. The bare bzImage / Image<br>
symlink only lands in DEPLOY_DIR_IMAGE when something explicitly<br>
pulls in virtual/kernel:do_deploy (typically qemuboot.bbclass or an<br>
IMAGE_CLASSES inherit), which the vruntime-* multiconfigs do not do.<br>
<br>
Why sstate exposes it so reliably:<br>
<br>
=C2=A0 - On a clean from-source build the kernel ends up deployed<br>
=C2=A0 =C2=A0 transitively through other mechanisms and do_compile finds it=
 by<br>
=C2=A0 =C2=A0 accident.<br>
=C2=A0 - On an sstate-accelerated build, &lt;runtime&gt;-rootfs-image:do_im=
age_complete<br>
=C2=A0 =C2=A0 is restored straight from cache, virtual/kernel:do_deploy is<=
br>
=C2=A0 =C2=A0 never invoked, MC_DEPLOY/bzImage doesn&#39;t exist, do_compil=
e only<br>
=C2=A0 =C2=A0 emits a bbwarn, and do_deploy silently skips the kernel insta=
ll<br>
=C2=A0 =C2=A0 because of its `if [ -f ${B}/kernel ]` guard. vcontainer-tarb=
all<br>
=C2=A0 =C2=A0 is then the one that finally fatals with &quot;vdkr blob not =
found&quot;.<br>
=C2=A0 - Because the kernel wasn&#39;t in do_compile&#39;s signature, the<b=
r>
=C2=A0 =C2=A0 do_deploy sstate key didn&#39;t reflect it either, so a cache=
d<br>
=C2=A0 =C2=A0 kernel-less deploy could be reused indefinitely.<br>
<br>
Fix: declare an explicit intra-multiconfig dep on<br>
virtual/kernel:do_deploy. The recipe runs inside the mc (it is pulled<br>
in as `mc::&lt;mc&gt;:vdkr-initramfs-create:do_deploy` from<br>
<a href=3D"http://vcontainer-tarball.bb" rel=3D"noreferrer" target=3D"_blan=
k">vcontainer-tarball.bb</a>), so a plain `depends` =E2=80=94 not `mcdepend=
s` =E2=80=94 is<br>
correct. Also promote the missing-kernel bbwarn to bbfatal so a<br>
future regression fails loudly at the producing recipe instead of<br>
downstream in vcontainer-tarball.<br></blockquote><div><br></div><div><br><=
/div>Your diagnosis of the sstate failure=C2=A0<span class=3D"gmail_default=
" style=3D"font-size:small">looks right to me.</span></div><div class=3D"gm=
ail_quote"><span class=3D"gmail_default" style=3D"font-size:small"><br></sp=
an></div><div class=3D"gmail_quote">do_image_complete runs before do_build,=
 so the virtual/kernel:do_deploy</div><div class=3D"gmail_quote">dependency=
 attached to do_build in image.bbclass is never pulled into</div><div class=
=3D"gmail_quote">the dependency chain. The kernel ends up in MC_DEPLOY by a=
ccident</div><div class=3D"gmail_quote">on clean builds but is=C2=A0 missin=
g on sstate-accelerated ones.<br><br>However, I&#39;d prefer not to add an =
explicit virtual/kernel:do_deploy</div><div class=3D"gmail_quote">dependenc=
y to the initramfs-create recipe. This recipe is designed as a best-effort<=
/div><div class=3D"gmail_quote">blob assembler =E2=80=94 the kernel is inte=
ntionally optional (bbwarn, not bbfatal)</div><div class=3D"gmail_quote">to=
 support use cases where the kernel is provided<span class=3D"gmail_default=
" style=3D"font-size:small"></span>=C2=A0 externally or from the</div><div =
class=3D"gmail_quote">main build. Adding a hard dependency on virtual/kerne=
l:do_deploy couples</div><div class=3D"gmail_quote">=C2=A0the recipe to the=
 multiconfig kernel build and prevents those use cases.<br><br>Instead, I&#=
39;ve fixed this by changing the dependency from=C2=A0</div><div class=3D"g=
mail_quote">do_image_complete to do_build:<br><br>=C2=A0 do_compile[depends=
] =3D &quot;${VCONTAINER_RUNTIME}-tiny-initramfs-image:do_build&quot;<br>=
=C2=A0 do_compile[depends] +=3D &quot;${VCONTAINER_RUNTIME}-rootfs-image:do=
_build&quot;<br><br>Both image recipes inherit core-image =E2=86=92 image.b=
bclass, which has:<br><br>=C2=A0 KERNEL_DEPLOY_DEPEND ?=3D &quot;virtual/ke=
rnel:do_deploy&quot;<br>=C2=A0 do_build[depends] +=3D &quot;${KERNEL_DEPLOY=
_DEPEND}&quot;<br><br>By depending on do_build instead of do_image_complete=
, we get=C2=A0</div><div class=3D"gmail_quote">virtual/kernel:do_deploy tra=
nsitively through the existing image.bbclass</div><div class=3D"gmail_quote=
">dependency chain <span class=3D"gmail_default" style=3D"font-size:small">=
 ... n</span>o new coupling needed. The image artifacts</div><div class=3D"=
gmail_quote">are already deployed after do_image_complete, so they&#39;re a=
vailable</div><div class=3D"gmail_quote">when our do_compile=C2=A0 runs aft=
er do_build.<br><br>I&#39;ve also kept the bbwarn rather than promoting to =
bbfatal=C2=A0<span class=3D"gmail_default" style=3D"font-size:small">..</sp=
an> the blob</div><div class=3D"gmail_quote">assembler should remain permis=
sive, while <a href=3D"http://vcontainer-tarball.bb" target=3D"_blank">vcon=
tainer-tarball.bb</a></div><div class=3D"gmail_quote">(the final packager) =
is the one that enforces completeness with bbfatal.</div><div class=3D"gmai=
l_quote"><br></div><div class=3D"gmail_quote"><div class=3D"gmail_default" =
style=3D"font-size:small">I&#39;d also like to change the name of the initr=
amfs recipe, since it really</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">isn&#39;t building an initramfs, but that&#39;s for another t=
ime.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">If I merge my versio=
n, can you test it in the AB environment to see</div><div class=3D"gmail_de=
fault" style=3D"font-size:small">if the fix holds ? If it doesn&#39;t, we&#=
39;ll just go with your patch.</div><br>Bruce<br><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
AI-Generated: Claude Cowork Opus 4.7<br>
Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" ta=
rget=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
---<br>
=C2=A0.../vcontainer-initramfs-create.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 19 ++++++++++++++-----<br>
=C2=A01 file changed, 14 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/recipes-containers/vcontainer/vcontainer-initramfs-create.inc =
b/recipes-containers/vcontainer/vcontainer-initramfs-create.inc<br>
index 1a22c3d4..29b14e20 100644<br>
--- a/recipes-containers/vcontainer/vcontainer-initramfs-create.inc<br>
+++ b/recipes-containers/vcontainer/vcontainer-initramfs-create.inc<br>
@@ -58,12 +58,18 @@ INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
=C2=A0# Dependencies:<br>
=C2=A0# 1. The tiny initramfs image (produces cpio.gz)<br>
=C2=A0# 2. The multiconfig rootfs image (produces squashfs)<br>
-# 3. The kernel from main build<br>
-#<br>
-# Both initramfs and rootfs images are in the same multiconfig<br>
+# 3. The kernel&#39;s do_deploy (so ${MC_DEPLOY}/${KERNEL_IMAGETYPE_INITRA=
MFS}<br>
+#=C2=A0 =C2=A0 =E2=80=94 e.g. bzImage/Image =E2=80=94 actually exists befo=
re do_compile reads it).<br>
+#=C2=A0 =C2=A0 Being a build-time dep of the rootfs image is not enough: i=
mage<br>
+#=C2=A0 =C2=A0 recipes don&#39;t imply virtual/kernel:do_deploy, so on an =
sstate-<br>
+#=C2=A0 =C2=A0 accelerated build the kernel binary never lands in MC_DEPLO=
Y and<br>
+#=C2=A0 =C2=A0 this recipe silently deploys a kernel-less blob set, which =
later<br>
+#=C2=A0 =C2=A0 fatals in vcontainer-tarball as &quot;vdkr blob not found: =
.../bzImage&quot;.<br>
+#=C2=A0 =C2=A0 The dep is intra-multiconfig (this recipe runs inside the m=
c), so<br>
+#=C2=A0 =C2=A0 a plain depends =E2=80=94 not mcdepends =E2=80=94 is correc=
t.<br>
=C2=A0do_compile[depends] =3D &quot;${VCONTAINER_RUNTIME}-tiny-initramfs-im=
age:do_image_complete&quot;<br>
=C2=A0do_compile[depends] +=3D &quot;${VCONTAINER_RUNTIME}-rootfs-image:do_=
image_complete&quot;<br>
-# mcdepends set conditionally in anonymous python below<br>
+do_compile[depends] +=3D &quot;virtual/kernel:do_deploy&quot;<br>
<br>
=C2=A0S =3D &quot;${UNPACKDIR}&quot;<br>
=C2=A0B =3D &quot;${WORKDIR}/build&quot;<br>
@@ -152,7 +158,10 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0KERNEL_SIZE=3D$(stat -c%s ${B}/kernel)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbnote &quot;Kernel copied: ${KERNEL_SIZE=
} bytes ($(expr ${KERNEL_SIZE} / 1024 / 1024)MB)&quot;<br>
=C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbwarn &quot;Kernel not found at ${KERNEL_FILE=
} =E2=80=94 check that the vruntime multiconfig kernel is built&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Fatal rather than warn: silently shipping a =
kernel-less blob set<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # lets vcontainer-tarball get much further bef=
ore failing with a<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # confusing &quot;vdkr blob not found&quot; an=
d produces stale sstate.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbfatal &quot;Kernel not found at ${KERNEL_FIL=
E}. This usually means virtual/kernel:do_deploy was not pulled into the mul=
ticonfig build graph; ensure do_compile[depends] includes virtual/kernel:do=
_deploy.&quot;<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
<br>
-- <br>
2.50.1 (Apple Git-155)<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9752): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9752" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9752</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/119042095/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/119042095/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>
</div>

--000000000000b703ee065083eaad--

