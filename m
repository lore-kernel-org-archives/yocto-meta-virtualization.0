Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 483C4CD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 12:03:06 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23558.1780401779801200770
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 02 Jun 2026 05:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eTqdKLN3;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8423f1e2f8eso1767199b3a.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 02 Jun 2026 05:02:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780401779; cv=none;
        d=google.com; s=arc-20240605;
        b=lywdRvCMsGDf/q2qcjK0fBjiFNM1gO6JGp9W89J3gIhCoI1TR5xK4tgIN9qAC/f5c+
         9492zKTBMibvL0eoNrmPNOjryZYtLl8BBhMpFAfxO4YcD9sNWmI3IlNli9cI9865WKr7
         okuG+IQ35yah9+LhNRTH8R6rg4CeMhEOyYdvRgEXAG8y6YIn5RgRMMqEiNyAQsvAtuBY
         cZeSl1A3TvtgxLRT0XPkz/AkxxB0g2fUza6hlAvXm7H+ky5DKkcLfqqgZHlB6aZrDCFq
         K78QHFMVWNHcVX0bHMRYb4MYSI2QLKhlrjf74hNrwTYe2sv7Atg1hnbgmT/WSIsiKOn4
         zlJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PH7rxH8J4Cn1sTr9PkAhUkE0mznd5ZanyW06D7wvEfE=;
        fh=hqfpHYyaQUOD2nG6D6GUOQEMwpI4YU1MaOFz8zfSLy0=;
        b=HoYtI0vubvg3wHQSm2X6duXOnCAh6fSwgpjwT0HXrnbWvDmeqFZOpPZk8iHT/7tynZ
         pQbX0pYRU9aNU6pJZ1R+/dG/3NQzYmfue6WyDYS8Yjk/Oru0dDcb76UfyZ/euuXC4/ka
         nhIpGN4CNAWysVV7CKuH2TTId2avAYao0hEiPYmip7hygQKasTm7WS4n50bNpTizIMap
         TyxMZ4d63knb+NtyW8Pok0Kf2GWteVU0onyzC+Fhpm6tQvFXLq3rBedKIfb9FJ5qk3FN
         9yTI5uPxl8CRyWyLxeto4Bn+n+5XB3HWmovGTlMRZVXSoeEDZFo2sKfplXZZIlH8lq83
         DHSQ==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780401779; x=1781006579; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PH7rxH8J4Cn1sTr9PkAhUkE0mznd5ZanyW06D7wvEfE=;
        b=eTqdKLN3RBjX+zplSUVHHTF4kpfERvzuI2TEHiZQMZgWJA3pDV2I3gvcdh9lYoGRQD
         ONdv6x5KjTNlTtvRBBQegU5ur7R7/om7lYckpZTvdMEJ39s/OrXs6MDi3f++MmJvGtub
         mzUEOwbVAHKz3LyBSU1z00VOSQZzbZJZg8uDILOHNFpA5uTdYims4ulz6nrE9HhPJh6v
         pA7eXPE+KMIyGTRhAfEF/gE3DtFemR+f83plyUhh29/dA5B9skpVDdBcg8pkw57jxbrx
         ev0Lb/SZivdiHeGMsqWB8fCFd16jxH7ZOohO2rOS5+BHf8f7Vq0GKAC6tOa7WbMc86VI
         3F0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780401779; x=1781006579;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PH7rxH8J4Cn1sTr9PkAhUkE0mznd5ZanyW06D7wvEfE=;
        b=lUiB9lWHMrChYePQ9NyRBAKZmV4zeuzAV+CmtNyYKW7fzH0sqRomzJyOoq7/IgDFEL
         BEvLL4y4R5l1hgYL6A/fwCdQOs6QsuVJzt/QK6ROhVmChzdXt99l/yFYb0tuIOEiiTOb
         moocKEreZneNb9aJS/Nzhw0MAo6B91ttVbemvgTT9xVt/ytildlSMdDxx5nl124F2gTn
         JjIgZtMTDxfEOEy74Ej+vAcxor4/YA45sm5lE3LtdGFqmNctJSS6Yzrl9z790C5kla+L
         K0pPhAfKb23RN+1dvb+K4uVgMlMEK5chmDJ5xQPrJ2ZpQA6neAW/41zlfVxBGYb5r0YU
         kCWA==
X-Forwarded-Encrypted: i=1; AFNElJ8pEfslIzEut84XqGhWGJbUYkkunvLdLFpHu8cG3hNaW5hHlGDZkqgtrCTLy7d5g2ZzDm1KcckzGo98f1YkGzXBsofS@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwvuI4645vCu5fcpE/xgkrxYhM3FRRdg+W9nB0xXjiGKC2XZok2
	0uPsWDIQpZDOOzgAbyi6Y6QRR805dFKEqrQ7rcZ3zIM5mY16DMgdwBC9QCPJNEiqklBKNKVQgi8
	gON/FrBjLO6jCWBS6mydSLHE0zEIxArOeViRH
X-Gm-Gg: Acq92OFRtEM6z0xap1a5rC2sUrVDAbLrHkDtXHJzr/HBf9uYPCXeaWBCnuO/gt8VF1S
	SGZpsLxmmW7DmOAjvzU5QCCUTyxzsB97lJCtbIPmUt2F/KB02Q3wdQbNv6m48eqb7wPYRlPDEfG
	v1+jBj1I5D7iUF//jrck3EvS3R5ww57gjNmY58IR0CcRyYS+GQWzeeTEa58UZ9Ujyf6zZizvjbT
	fDjtW0TFtHimktM0WJqzF1Lke/e16HwnVoR9npH6DnW3fAs5lXsCkNaL6JsxAof3j/eLvwMvtb8
	lcS67gKt0mFuhSoIU0gu8FVEih/aUAO6uv5ySmJd6ZWc+1TN7Iog1h4aNGnsP2PzGk+hOhTVJey
	Pnii7L0qIF/pMAQxQ+CKzdsSjwsEFryGUi+5SMYjeddZAwGM=
X-Received: by 2002:a05:6a00:bc8f:b0:842:6419:3ed2 with SMTP id
 d2e1a72fcca58-842641942e3mr5549724b3a.33.1780401778823; Tue, 02 Jun 2026
 05:02:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1780104071.git.tim.orling@konsulko.com> <2c612245431bf2ebcfe9c4f188be1e27117cc0db.1780104071.git.tim.orling@konsulko.com>
 <cebff4c1c3da56add582976276b3c66d65465047.camel@pbarker.dev>
In-Reply-To: <cebff4c1c3da56add582976276b3c66d65465047.camel@pbarker.dev>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 2 Jun 2026 08:02:46 -0400
X-Gm-Features: AVHnY4L-8SQbETHtyN8yEuOJlNDqWWF2pYYvo_vZhVsvjfFt35nUYGONkviEyPo
Message-ID: <CADkTA4M-3-E+EVGrJ6fE3+i25w+mO5=t84dOoqDsT7H44uckJg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/7] recipes-containers/images: add app-container-python
To: paul@pbarker.dev
Cc: ticotimo@gmail.com, meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000009595cf065344171b"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 02 Jun 2026 12:03:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9843

--0000000000009595cf065344171b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 6:02=E2=80=AFAM Paul Barker via lists.yoctoproject.o=
rg <paul=3D
pbarker.dev@lists.yoctoproject.org> wrote:

> On Fri, 2026-05-29 at 18:31 -0700, Tim Orling via lists.yoctoproject.org
> wrote:
> > Add OCI container image recipe for Python to use as a base for
> > other Python app containers. The image uses multi-layer mode with
> > separate base, terminal and python layers.
> >
> > Add ncurses-terminfo-base to a "terminal" layer to avoid warnings in th=
e
> > REPL:
> >   "Cannot read termcap database;
> >   using dumb terminal settings."
> >
> > Add coreutils to "python" layer to provide /usr/bin/env needed by
> > python3-idle in python3-modules.
> >
> > Inherit container-nonroot-user and run a `nonroot` user by default.
> > Set PACKAGECONFIG:pn-app-container-python =3D "dev" in local.conf or
> > distro/image config to run as 'root' and include 'pip'.
> >
> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > ---
> >  .../images/app-container-python.bb            | 57 +++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >  create mode 100644 recipes-containers/images/app-container-python.bb
> >
> > diff --git a/recipes-containers/images/app-container-python.bb
> b/recipes-containers/images/app-container-python.bb
> > new file mode 100644
> > index 00000000..a93f1b0f
> > --- /dev/null
> > +++ b/recipes-containers/images/app-container-python.bb
> > @@ -0,0 +1,57 @@
> > +SUMMARY =3D "Base python3 container image"
> > +DESCRIPTION =3D "OCI container image running Python with non-root user=
. \
> > +\
> > +In "dev" mode, can optionally run as 'root' and add 'pip' to allow \
> > +developers to simply run 'pip install' on top of this container (Not \
> > +advised for production/hardened use)."
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de204=
20"
> > +
> > +# Multi-layer mode: create explicit layers instead of single rootfs
> layer
> > +OCI_LAYER_MODE =3D "multi"
> > +
> > +# Optional 'dev' mode:
> > +#   - adds python3-pip to the python layer (enables `pip install` at
> runtime)
> > +#   - runs the container as root (UID 0) so pip can write to
> site-packages
> > +# Enable with: PACKAGECONFIG:pn-app-container-python =3D "dev"
> > +PACKAGECONFIG ??=3D ""
> > +PACKAGECONFIG[dev] =3D ""
> > +
> > +# Define layers: each layer contains specific packages
> > +# Format: "name:type:content" where content uses + as delimiter for
> multiple items
> > +OCI_LAYERS =3D "\
> > +    base:packages:base-files+base-passwd+netbase \
>
> Hi Tim,
>
> I wonder if we should define the base layer contents in image-oci to
> ensure that it is consistent across recipes.
>
> E.g. in image-oci.bbclass:
>
>     OCI_BASE_LAYER =3D "base:packages:base-files+base-passwd+netbase"
>
> Then in the recipe:
>
>     OCI_LAYERS =3D "\
>         ${OCI_BASE_LAYER} \
>         ...
>     "
>
> That gives consistency without forcing all OCI images to use the base
> layer definition if it isn't relevant to them.
>

We can't (and shouldn't) enforce using packages at the base like that,
since specifying layers as Tim is using is simply one way of doing it.

It could just as easily be another image, or one of the other techniques.


>
> > +    terminal:packages:ncurses-terminfo-base \
> > +
> python:packages:python3+coreutils${@bb.utils.contains('PACKAGECONFIG',
> 'dev', '+python3-pip', '', d)} \
> > +"
> > +
> > +# In 'dev' mode, override the nonroot UID inherited from
> container-nonroot-user
> > +# so the container runs as root (required for `pip install`).
> > +OCI_IMAGE_RUNTIME_UID =3D "${@bb.utils.contains('PACKAGECONFIG', 'dev'=
,
> '0', '${NONROOT_UID}', d)}"
> > +
> > +# Use CMD so `docker run image /bin/sh` works as expected
> > +OCI_IMAGE_CMD =3D "python3"
> > +
> > +IMAGE_FSTYPES =3D "container oci"
> > +inherit image
> > +inherit image-oci
> > +inherit container-nonroot-user
> > +
> > +IMAGE_FEATURES =3D ""
> > +IMAGE_LINGUAS =3D ""
> > +NO_RECOMMENDATIONS =3D "1"
> > +
> > +# IMAGE_INSTALL triggers package builds via do_rootfs recrdeptask.
> > +# Even for multi-layer mode, list packages here to ensure they're buil=
t.
> > +# The PM will install them directly to layers from DEPLOY_DIR_IPK.
> > +# Note: IMAGE_ROOTFS is still created but ignored for packages layers.
> > +IMAGE_INSTALL =3D "base-files base-passwd netbase"
>
> Maybe we also need an OCI_BASE_PACKAGES to go with OCI_BASE_LAYER.
> Pretty much every image is going to need these three packages installed.
>

Again, we shouldn't be overly prescriptive here.

Factoring things out at this point is premature.

Bruce



>
> > +IMAGE_INSTALL +=3D "ncurses-terminfo-base"
> > +IMAGE_INSTALL +=3D "python3 coreutils"
> > +IMAGE_INSTALL +=3D "${@bb.utils.contains('PACKAGECONFIG', 'dev',
> 'python3-pip', '', d)}"
> > +
> > +# Allow build with or without a specific kernel
> > +IMAGE_CONTAINER_NO_DUMMY =3D "1"
> > +
> > +# Note: No ROOTFS_POSTPROCESS_COMMAND needed - IMAGE_ROOTFS is empty
> > +# and PM handles installation directly to OCI layers
>
> Best regards,
>
> --
> Paul Barker
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9842):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9842
> Mute This Topic: https://lists.yoctoproject.org/mt/119557386/1050810
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

--0000000000009595cf065344171b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 2, 2026 at 6:02=
=E2=80=AFAM Paul Barker via <a href=3D"http://lists.yoctoproject.org">lists=
.yoctoproject.org</a> &lt;paul=3D<a href=3D"mailto:pbarker.dev@lists.yoctop=
roject.org">pbarker.dev@lists.yoctoproject.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 2026-05-29 at 18:31 -=
0700, Tim Orling via <a href=3D"http://lists.yoctoproject.org" rel=3D"noref=
errer" target=3D"_blank">lists.yoctoproject.org</a><br>
wrote:<br>
&gt; Add OCI container image recipe for Python to use as a base for<br>
&gt; other Python app containers. The image uses multi-layer mode with<br>
&gt; separate base, terminal and python layers.<br>
&gt; <br>
&gt; Add ncurses-terminfo-base to a &quot;terminal&quot; layer to avoid war=
nings in the<br>
&gt; REPL:<br>
&gt;=C2=A0 =C2=A0&quot;Cannot read termcap database;<br>
&gt;=C2=A0 =C2=A0using dumb terminal settings.&quot;<br>
&gt; <br>
&gt; Add coreutils to &quot;python&quot; layer to provide /usr/bin/env need=
ed by<br>
&gt; python3-idle in python3-modules.<br>
&gt; <br>
&gt; Inherit container-nonroot-user and run a `nonroot` user by default.<br=
>
&gt; Set PACKAGECONFIG:pn-app-container-python =3D &quot;dev&quot; in local=
.conf or<br>
&gt; distro/image config to run as &#39;root&#39; and include &#39;pip&#39;=
.<br>
&gt; <br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.co=
m" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../images/<a href=3D"http://app-container-python.bb" rel=3D"nor=
eferrer" target=3D"_blank">app-container-python.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 57 +++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 57 insertions(+)<br>
&gt;=C2=A0 create mode 100644 recipes-containers/images/<a href=3D"http://a=
pp-container-python.bb" rel=3D"noreferrer" target=3D"_blank">app-container-=
python.bb</a><br>
&gt; <br>
&gt; diff --git a/recipes-containers/images/<a href=3D"http://app-container=
-python.bb" rel=3D"noreferrer" target=3D"_blank">app-container-python.bb</a=
> b/recipes-containers/images/<a href=3D"http://app-container-python.bb" re=
l=3D"noreferrer" target=3D"_blank">app-container-python.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 00000000..a93f1b0f<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-containers/images/<a href=3D"http://app-container-python=
.bb" rel=3D"noreferrer" target=3D"_blank">app-container-python.bb</a><br>
&gt; @@ -0,0 +1,57 @@<br>
&gt; +SUMMARY =3D &quot;Base python3 container image&quot;<br>
&gt; +DESCRIPTION =3D &quot;OCI container image running Python with non-roo=
t user. \<br>
&gt; +\<br>
&gt; +In &quot;dev&quot; mode, can optionally run as &#39;root&#39; and add=
 &#39;pip&#39; to allow \<br>
&gt; +developers to simply run &#39;pip install&#39; on top of this contain=
er (Not \<br>
&gt; +advised for production/hardened use).&quot;<br>
&gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/COPYING.MIT;md5=3D=
3da9cfbcb788c80a0384361b4de20420&quot;<br>
&gt; +<br>
&gt; +# Multi-layer mode: create explicit layers instead of single rootfs l=
ayer<br>
&gt; +OCI_LAYER_MODE =3D &quot;multi&quot;<br>
&gt; +<br>
&gt; +# Optional &#39;dev&#39; mode:<br>
&gt; +#=C2=A0 =C2=A0- adds python3-pip to the python layer (enables `pip in=
stall` at runtime)<br>
&gt; +#=C2=A0 =C2=A0- runs the container as root (UID 0) so pip can write t=
o site-packages<br>
&gt; +# Enable with: PACKAGECONFIG:pn-app-container-python =3D &quot;dev&qu=
ot;<br>
&gt; +PACKAGECONFIG ??=3D &quot;&quot;<br>
&gt; +PACKAGECONFIG[dev] =3D &quot;&quot;<br>
&gt; +<br>
&gt; +# Define layers: each layer contains specific packages<br>
&gt; +# Format: &quot;name:type:content&quot; where content uses + as delim=
iter for multiple items<br>
&gt; +OCI_LAYERS =3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 base:packages:base-files+base-passwd+netbase \<br>
<br>
Hi Tim,<br>
<br>
I wonder if we should define the base layer contents in image-oci to<br>
ensure that it is consistent across recipes.<br>
<br>
E.g. in image-oci.bbclass:<br>
<br>
=C2=A0 =C2=A0 OCI_BASE_LAYER =3D &quot;base:packages:base-files+base-passwd=
+netbase&quot;<br>
<br>
Then in the recipe:<br>
<br>
=C2=A0 =C2=A0 OCI_LAYERS =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${OCI_BASE_LAYER} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 &quot;<br>
<br>
That gives consistency without forcing all OCI images to use the base<br>
layer definition if it isn&#39;t relevant to them.<br></blockquote><div><br=
></div><div><div class=3D"gmail_default" style=3D"font-size:small">We can&#=
39;t (and shouldn&#39;t) enforce using packages at the base like that,</div=
><div class=3D"gmail_default" style=3D"font-size:small">since specifying la=
yers as Tim is using is simply one way of doing it.</div><div class=3D"gmai=
l_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default"=
 style=3D"font-size:small">It could just as easily be another image, or one=
 of the other techniques.</div></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 terminal:packages:ncurses-terminfo-base \<br>
&gt; +=C2=A0 =C2=A0 python:packages:python3+coreutils${@bb.utils.contains(&=
#39;PACKAGECONFIG&#39;, &#39;dev&#39;, &#39;+python3-pip&#39;, &#39;&#39;, =
d)} \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +# In &#39;dev&#39; mode, override the nonroot UID inherited from cont=
ainer-nonroot-user<br>
&gt; +# so the container runs as root (required for `pip install`).<br>
&gt; +OCI_IMAGE_RUNTIME_UID =3D &quot;${@bb.utils.contains(&#39;PACKAGECONF=
IG&#39;, &#39;dev&#39;, &#39;0&#39;, &#39;${NONROOT_UID}&#39;, d)}&quot;<br=
>
&gt; +<br>
&gt; +# Use CMD so `docker run image /bin/sh` works as expected<br>
&gt; +OCI_IMAGE_CMD =3D &quot;python3&quot;<br>
&gt; +<br>
&gt; +IMAGE_FSTYPES =3D &quot;container oci&quot;<br>
&gt; +inherit image<br>
&gt; +inherit image-oci<br>
&gt; +inherit container-nonroot-user<br>
&gt; +<br>
&gt; +IMAGE_FEATURES =3D &quot;&quot;<br>
&gt; +IMAGE_LINGUAS =3D &quot;&quot;<br>
&gt; +NO_RECOMMENDATIONS =3D &quot;1&quot;<br>
&gt; +<br>
&gt; +# IMAGE_INSTALL triggers package builds via do_rootfs recrdeptask.<br=
>
&gt; +# Even for multi-layer mode, list packages here to ensure they&#39;re=
 built.<br>
&gt; +# The PM will install them directly to layers from DEPLOY_DIR_IPK.<br=
>
&gt; +# Note: IMAGE_ROOTFS is still created but ignored for packages layers=
.<br>
&gt; +IMAGE_INSTALL =3D &quot;base-files base-passwd netbase&quot;<br>
<br>
Maybe we also need an OCI_BASE_PACKAGES to go with OCI_BASE_LAYER.<br>
Pretty much every image is going to need these three packages installed.<br=
></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fon=
t-size:small">Again, we shouldn&#39;t be overly prescriptive here.</div><di=
v class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D=
"gmail_default" style=3D"font-size:small">Factoring things out at this poin=
t is premature.</div><div class=3D"gmail_default" style=3D"font-size:small"=
><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</di=
v><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
&gt; +IMAGE_INSTALL +=3D &quot;ncurses-terminfo-base&quot;<br>
&gt; +IMAGE_INSTALL +=3D &quot;python3 coreutils&quot;<br>
&gt; +IMAGE_INSTALL +=3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;=
, &#39;dev&#39;, &#39;python3-pip&#39;, &#39;&#39;, d)}&quot;<br>
&gt; +<br>
&gt; +# Allow build with or without a specific kernel<br>
&gt; +IMAGE_CONTAINER_NO_DUMMY =3D &quot;1&quot;<br>
&gt; +<br>
&gt; +# Note: No ROOTFS_POSTPROCESS_COMMAND needed - IMAGE_ROOTFS is empty<=
br>
&gt; +# and PM handles installation directly to OCI layers<br>
<br>
Best regards,<br>
<br>
-- <br>
Paul Barker<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9842): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9842" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9842</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/119557386/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/119557386/1050810</a><br>
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

--0000000000009595cf065344171b--

