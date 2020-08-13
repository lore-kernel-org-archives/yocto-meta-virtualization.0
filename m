Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.2300.1597286306046729959
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 12 Aug 2020 19:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uygW8sCj;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id o18so4487351eje.7
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 12 Aug 2020 19:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yWB5vi/XHy7Ffseica7ZNZ6ZFFvw/DtYgEl/pO781Ug=;
        b=uygW8sCjAqRRBgMfDW37Cj5BrksbLLG4ewZFTj9eQAQe8Ruk79IgJyTIihdsQrR7hI
         AaOYsgMsabtaNsZzz8v4xNE/hnt/PgRjykdeoAIgr+j6cLzPn5wcyxw0FyC3LVWq4dUv
         5/GViAITIkL2pUUIIht6ZMRT8MlPPhaFPyCGM9akrk++ZykUsHyzEdpxh0Z9gMAP62QH
         583WloDvbRvq/vClY8E+jG9hONP40lofsBl+Z6nnpeS19LUAu6ekMAUMG+CBocvxT0Bn
         EYC6BXdpeeCeLsx04Lr4BPFKyil6RGZ7wV1Op+ZwUlFE6GunLmQ/RkxpnFOTtClsN41j
         f4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yWB5vi/XHy7Ffseica7ZNZ6ZFFvw/DtYgEl/pO781Ug=;
        b=si78LnRWeKVn/xR5m7D9l54HPNVbIlCH4wDqUUaIR7mkgOVgMCebbN2TSnwJUaAnuS
         mMm9H6jfX8xwmOsWllTIU3bbX4JzlnQlIJSoREGk3zfjPNhPnnnd2aGZMugnqdw9uoqg
         6JMcBnns471mENaUVyM4a8Zqbb+dYP3My7M1XsWlO17hZy7zM2t84QvxGt8yNWEZ/4Z3
         /KnlBg8JZuDeMK97BqrfQVPkL8IuLYEJTLH6Bv1JIMnBTXos3YZaxdr98ciTe4KoBbsn
         LEIJSIxmEG94Hu2Y3hc9/VH524Blb8AmXeATaZMkmxobCCTjAy4d6tVbKojr4YdfGyjS
         eX/g==
X-Gm-Message-State: AOAM532vMjmPZc1P/AdkitupslaEaJoz+dyuYyNR8xRYNGsGAw4lZs0w
	2r6G6zuB4gpZkLA0ksTuqZw0JUp3C+fpngGf1Z4=
X-Google-Smtp-Source: ABdhPJwqPcVrDw6mxSCS7grfoRHpoH1NKJy6AkKgj2u9FGg8phR/Fd7KVkyALVY9sa+m9Okmo+/M8Yr6lQ+XkM6DfQY=
X-Received: by 2002:a17:906:9392:: with SMTP id l18mr2683332ejx.357.1597286304474;
 Wed, 12 Aug 2020 19:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <1597210050-8813-1-git-send-email-chandana.kalluri@xilinx.com>
In-Reply-To: <1597210050-8813-1-git-send-email-chandana.kalluri@xilinx.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 12 Aug 2020 22:38:13 -0400
Message-ID: <CADkTA4OyVyf1KnHFZPGEept_i4jmjxgtq5ZtwHDnQ4rqid=ngA@mail.gmail.com>
Subject: Re: [meta-virtualization][master][PATCH] runx: Fix linux kernel versions referenced in the recipe
To: Chandana kalluri <ckalluri@xilinx.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Content-Type: multipart/alternative; boundary="000000000000c86b5605acb932e7"

--000000000000c86b5605acb932e7
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Wed, Aug 12, 2020 at 1:27 AM Chandana kalluri <ckalluri@xilinx.com>
wrote:

> Fix the linux kernel versions referenced in the recipe. For ease of use,
> add
> variables KERNEL_SRC_VER and KERNEL_URL_VER that can be used to udpate the
> linux versions.
>
> Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
> ---
>  recipes-core/runx/runx_git.bb | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-core/runx/runx_git.bb b/recipes-core/runx/runx_git.bb
> index 991e6e1..a260071 100644
> --- a/recipes-core/runx/runx_git.bb
> +++ b/recipes-core/runx/runx_git.bb
> @@ -3,9 +3,13 @@ SUMMARY = "runx stuff"
>  DESCRIPTION = "Xen Runtime for OCI"
>
>  SRCREV_runx = "f24efd33fb18469e9cfe4d1bfe8e2c90ec8c4e93"
> +
> +KERNEL_SRC_VER="linux-5.4"
> +KERNEL_URL_VER="v5.x"
> +
>  SRC_URI = "\
>           git://github.com/lf-edge/runx;nobranch=1;name=runx \
> -
> https://www.kernel.org/pub/linux/kernel/v5.x/linux-5.4.tar.xz;destsuffix=git/kernel/build
> \
> +
> https://www.kernel.org/pub/linux/kernel/${KERNEL_URL_VER}/${KERNEL_SRC_VER}.tar.xz;destsuffix=git/kernel/build
> \
>            file://0001-make-kernel-cross-compilation-tweaks.patch \
>            file://0001-make-initrd-cross-install-tweaks.patch \
>           "
> @@ -45,12 +49,12 @@ do_compile() {
>      # building.
>      mkdir -p ${S}/kernel/build
>      mkdir -p ${S}/kernel/src
> -    cp ${DL_DIR}/linux-4.15.tar.xz ${S}/kernel/build/
> +    cp ${DL_DIR}/${KERNEL_SRC_VER}.tar.xz ${S}/kernel/build/
>
>      # In the future, we might want to link the extracted kernel source (if
>      # we move patches to recipe space, but for now, we need make-kernel to
>      # extract a copy and possibly patch it.
> -    # ln -sf ${WORKDIR}/linux-4.15 ${S}/kernel/src/
> +    # ln -sf ${WORKDIR}/${KERNEL_SRC_VER} ${S}/kernel/src/
>
>      # build the kernel
>      echo "[INFO]: runx: building the kernel"
> --
> 2.7.4
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000c86b5605acb932e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Au=
g 12, 2020 at 1:27 AM Chandana kalluri &lt;<a href=3D"mailto:ckalluri@xilin=
x.com">ckalluri@xilinx.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Fix the linux kernel versions referenced in the r=
ecipe. For ease of use, add<br>
variables KERNEL_SRC_VER and KERNEL_URL_VER that can be used to udpate the=
<br>
linux versions.<br>
<br>
Signed-off-by: Sai Hari Chandana Kalluri &lt;<a href=3D"mailto:chandana.ka=
lluri@xilinx.com" target=3D"_blank">chandana.kalluri@xilinx.com</a>&gt;<br>
---<br>
=C2=A0recipes-core/runx/<a href=3D"http://runx_git.bb" rel=3D"noreferrer" =
target=3D"_blank">runx_git.bb</a> | 10 +++++++---<br>
=C2=A01 file changed, 7 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/recipes-core/runx/<a href=3D"http://runx_git.bb" rel=3D"noref=
errer" target=3D"_blank">runx_git.bb</a> b/recipes-core/runx/<a href=3D"htt=
p://runx_git.bb" rel=3D"noreferrer" target=3D"_blank">runx_git.bb</a><br>
index 991e6e1..a260071 100644<br>
--- a/recipes-core/runx/<a href=3D"http://runx_git.bb" rel=3D"noreferrer" =
target=3D"_blank">runx_git.bb</a><br>
+++ b/recipes-core/runx/<a href=3D"http://runx_git.bb" rel=3D"noreferrer" =
target=3D"_blank">runx_git.bb</a><br>
@@ -3,9 +3,13 @@ SUMMARY =3D &quot;runx stuff&quot;<br>
=C2=A0DESCRIPTION =3D &quot;Xen Runtime for OCI&quot;<br>
<br>
=C2=A0SRCREV_runx =3D &quot;f24efd33fb18469e9cfe4d1bfe8e2c90ec8c4e93&quot;=
<br>
+<br>
+KERNEL_SRC_VER=3D&quot;linux-5.4&quot;<br>
+KERNEL_URL_VER=3D&quot;v5.x&quot;<br>
+<br>
=C2=A0SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.com/lf-e=
dge/runx;nobranch=3D1;name=3Drunx" rel=3D"noreferrer" target=3D"_blank">git=
hub.com/lf-edge/runx;nobranch=3D1;name=3Drunx</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://www.kernel.org/pub/=
linux/kernel/v5.x/linux-5.4.tar.xz;destsuffix=3Dgit/kernel/build" rel=3D"no=
referrer" target=3D"_blank">https://www.kernel.org/pub/linux/kernel/v5.x/li=
nux-5.4.tar.xz;destsuffix=3Dgit/kernel/build</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://www.kernel.org/pub/=
linux/kernel/$%7BKERNEL_URL_VER%7D/$%7BKERNEL_SRC_VER%7D.tar.xz;destsuffix=
=3Dgit/kernel/build" rel=3D"noreferrer" target=3D"_blank">https://www.kern=
el.org/pub/linux/kernel/${KERNEL_URL_VER}/${KERNEL_SRC_VER}.tar.xz;destsuff=
ix=3Dgit/kernel/build</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-make-kernel-cross-com=
pilation-tweaks.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-make-initrd-cross-ins=
tall-tweaks.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
@@ -45,12 +49,12 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0# building.<br>
=C2=A0 =C2=A0 =C2=A0mkdir -p ${S}/kernel/build<br>
=C2=A0 =C2=A0 =C2=A0mkdir -p ${S}/kernel/src<br>
-=C2=A0 =C2=A0 cp ${DL_DIR}/linux-4.15.tar.xz ${S}/kernel/build/<br>
+=C2=A0 =C2=A0 cp ${DL_DIR}/${KERNEL_SRC_VER}.tar.xz ${S}/kernel/build/<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0# In the future, we might want to link the extracted k=
ernel source (if<br>
=C2=A0 =C2=A0 =C2=A0# we move patches to recipe space, but for now, we nee=
d make-kernel to<br>
=C2=A0 =C2=A0 =C2=A0# extract a copy and possibly patch it.<br>
-=C2=A0 =C2=A0 # ln -sf ${WORKDIR}/linux-4.15 ${S}/kernel/src/<br>
+=C2=A0 =C2=A0 # ln -sf ${WORKDIR}/${KERNEL_SRC_VER} ${S}/kernel/src/<br>
<br>
=C2=A0 =C2=A0 =C2=A0# build the kernel<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;[INFO]: runx: building the kernel&quot;<br>
-- <br>
2.7.4<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div>

--000000000000c86b5605acb932e7--
