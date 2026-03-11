Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0CBDFD88E8
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 03:21:34 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12964.1773199286593281710
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Mar 2026 20:21:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=egtUm6R6;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35a07d6f720so4372a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Mar 2026 20:21:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773199286; cv=none;
        d=google.com; s=arc-20240605;
        b=jxA84MHTz2xcfaxIx5uv6Q1Md8VmL28JLy7XfWvlit8nRNCM2oQISQlA7nllO+HFYp
         4Rlh9CKdxEixcF9yEiU+SgsYIOyN8tl0s7DBZr5ymftseSEme/uBtTnn7XGRrS0Lya2y
         /4nJkE7Jd6c39Znblbn7gudGM1uy5B+TuvrjxYj8AoWKjA/DZUHGxdtSL65JVB4P4qdR
         I/R0kP+uoXBNZMiTR153VD9sXyEWvnIdXspkp+6axWg/iE37C3A6w0p+OerPh/FRgpUU
         W/tUaaP/TqY2zef3cyF7HFdTnfoLkZ+puTZ0kFZL8G/qv/uUOTs54RhOOvVpSCA5Fi9i
         fweg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7eVczGDDPfx2yrSx4aO37tg8iPygjUzSu8ondsJGyGU=;
        fh=OClHZqodWSNbeHsUYFR0FyVz9DAVa4a7109tpdSIGh0=;
        b=gpyjJq9Le7+p1bDej/hSNwcLSgSpnUAFGEZSvIQ4e8iH5f2ECzWbi7YWP25dqGPMbF
         YEI+A61it7I+D2x8tWmcKgRuDO8sOgDpmhX6bAGyLnifK9pfr+SFYBso7yDC3hxyzMOX
         97iu/ihVRpKeV1ZEzeoFouaYU6UfBGzuZegswYUm5u/rkMwZn6Tw6qmIEtzQ0dIYgp48
         ol/yE/mMX/Prig3BIrK43MBV0Z3JraglmeV6MkzM6A5oHOyOs78TJaaihA4f+i9DN1OP
         aUPbkGV6rATe16ya1Wz7LCEBXcVoeqkW51AqhgZ2xdSOD2LwHn7HeJuz8c2VQgM5AJtH
         yfzw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773199286; x=1773804086; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7eVczGDDPfx2yrSx4aO37tg8iPygjUzSu8ondsJGyGU=;
        b=egtUm6R6gJ7cinr86b5I4nHE3EH67iTDLExZL/XXq9Pp1n37J4xhYClpU1CdvTgZSX
         0+ufdQ8RoQLCNNosbWfBlPzQN08nBSfCdiwOH5luJEnoh7kl0K9C4pKkAn9eaF3+opOT
         rU6hRRTLzX0oDlqKDQVktMsUZL1CvyYXY312qnfmNFQIQjTlksS8b+LhyTe2oB2AcXN3
         ZJIeAD/IE8j2EvBx4xpXrE3ltW6AF4sb3w8Qno58qWmXV3KgXHT8VEw+U0rBS9NAMODj
         jtaGwVeOUoRKj80GaAi0ehtbySO29cN7vTJApVMdtyrQNE3dyg3edvn/cdONrBGg/LEj
         2P6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773199286; x=1773804086;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eVczGDDPfx2yrSx4aO37tg8iPygjUzSu8ondsJGyGU=;
        b=bX6tRe7L4Lx3Pf+p8cd4WXtMx3MpbE6R9EL3VFzqU/UajkCPBL3ykA4DtRNhoeU6R2
         WPbv2oLWdmrTywE4oTi9kf3DboIItICxJNGQcfp08TFlzJ3+UR4PMOVdNxqJYyPbtCsW
         gts5NyGC5yaY1eOvJm3eFj6+kBaCPBpy0BOms4HGDJtw+TjzzkwRz3/C3AvcwTzQ8Vvk
         dlXN+uVMB0X0JC41zJaBfgc10mqbFw8dP06s8gd9EKm26eoEeMDER10kQ9Qrfxp6BfEM
         nzyGVXql9VNBDOYEljdZCSiezWE2VHMhsbuEpNuAyJh1rNemRP0GhzUxNU0xJ4IxDY4O
         pq9g==
X-Gm-Message-State: AOJu0YyJuJZu02PjC9lECHfDEeQj83AB0vbesEuW700CqAPURt2EK1m8
	Mm783Q6BF00OTKY4BfcB1Jd8nCBZjGKD4AhS9uWabpv7V6f1tawV1LSpjzZdNHsDFf0VCSeXt2S
	KcVb5ODJOSkaVDNvqJJC0Bv6coYlsS1Q2P1nza8MWQg==
X-Gm-Gg: ATEYQzzPwPSW5Ie8lbLX99elQf6Y+GzDjKaJkD2olg+EpwUQ3ob9TAATsVJ7Hhv+GuZ
	SlRbnt4YKKjGkJphAhqOhad/IA3TgWyKBnw5NHTU0Hn4v+7u/vHahsdmIwrNsyGbsOUb35wPtiU
	XluI86er65ANMRUFmuBmbOuuPyri7nCXNr4QVtxfQRuL4pBRC2YO3XKoRDpQz6UJUGwx8t3P1QK
	bGFGjM1UXE3t3p2CREO1ADNDQVUbfltIFb992T7jPEovQ56Lfaxa5Y5C9BRTCf9er1im5bE5NgO
	OBCg4sB/5MwP5TH94BvDg+pZeoBSoM3f0SAd2VZj
X-Received: by 2002:a17:90b:4a47:b0:343:684c:f8ad with SMTP id
 98e67ed59e1d1-35a011d0bd1mr1096266a91.4.1773199285704; Tue, 10 Mar 2026
 20:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260310072754.663-1-liuyd.fnst@fujitsu.com> <abCd4oJCXiiacC_P@gmail.com>
 <OS7PR01MB14444B72C738C844083F7E8D79B47A@OS7PR01MB14444.jpnprd01.prod.outlook.com>
In-Reply-To: <OS7PR01MB14444B72C738C844083F7E8D79B47A@OS7PR01MB14444.jpnprd01.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 Mar 2026 23:21:14 -0400
X-Gm-Features: AaiRm527hG61DsjFWlqk3nJon6G5pAeC-nKzpe3WBUFEOdwdqCQyJQhl8RSCi2Q
Message-ID: <CADkTA4MdEsBoich9Xz9MKQ9KJ7MDNNhxMJDGOP1v2jkcBb+Syg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] podman: Use packageconfig to control
 fuse-overlayfs depend
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000008a5e5b064cb72170"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Mar 2026 03:21:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9644

--0000000000008a5e5b064cb72170
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 10:27=E2=80=AFPM Yiding Liu (Fujitsu) <
liuyd.fnst@fujitsu.com> wrote:

> Hi Bruce
>
>      Do you mean a new patch like this:
>

No. But maybe I misunderstood what you are trying to do. Are you
saying that fuse-overlayfs is causing an issue when it is enabled
for rootless ?

I was saying that you can add a new package config for it, but also
leave it enabled in rootless, since it is currently enabled and builds
may be expecting it.

i.e. just add this:

 +PACKAGECONFIG[fuse] =3D ",,,fuse-overlayfs,,"

And leave rootless alone. That way if you just want fuse, you'll
get it via "fuse", if rootless is used, you get both (just as was the
case previously).

Bruce




>              --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -68,7 +68,7 @@ EXTRA_OEMAKE =3D " \
>  PODMAN_FEATURES ?=3D "docker"
>
>  PACKAGECONFIG ?=3D ""
> -PACKAGECONFIG[rootless] =3D ",,,fuse-overlayfs slirp4netns,,"
> +PACKAGECONFIG[rootless] =3D ",,,slirp4netns,,"
>
>  do_compile() {
>         cd ${S}/src
> @@ -142,9 +142,16 @@ VIRTUAL-RUNTIME_base-utils-nsenter ?=3D
> "util-linux-nsenter"
>
>  COMPATIBLE_HOST =3D "^(?!mips).*"
>
> +def get_fuse_overlayfs_dep(d):
> +    if bb.utils.contains('PACKAGECONFIG', 'rootless', True, False, d) an=
d
> \
> +       bb.utils.contains('PACKAGECONFIG', 'fuse', True, False, d):
> +        return "fuse-overlayfs"
> +    return ""
> +
>  RDEPENDS:${PN} +=3D "\
>         catatonit conmon ${VIRTUAL-RUNTIME_container_runtime} gpgme
> iptables libdevmapper \
>         ${VIRTUAL-RUNTIME_container_dns}
> ${VIRTUAL-RUNTIME_container_networking}
> ${VIRTUAL-RUNTIME_base-utils-nsenter} \
> +       ${@get_fuse_overlayfs_dep(d)} \
>  "
>  RRECOMMENDS:${PN} +=3D "slirp4netns
>
> Or do you have a more elegant code?
>
> Liu
> ------------------------------
> *=E5=8F=91=E4=BB=B6=E4=BA=BA:* Bruce Ashfield <bruce.ashfield@gmail.com>
> *=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:* 2026=E5=B9=B43=E6=9C=8811=E6=97=
=A5 06:40
> *=E6=94=B6=E4=BB=B6=E4=BA=BA:* Liu, Yiding/=E5=88=98 =E4=B9=99=E4=B8=81 <=
liuyd.fnst@fujitsu.com>
> *=E6=8A=84=E9=80=81:* meta-virtualization@lists.yoctoproject.org <
> meta-virtualization@lists.yoctoproject.org>
> *=E4=B8=BB=E9=A2=98:* Re: [meta-virtualization][PATCH] podman: Use packag=
econfig to
> control fuse-overlayfs depend
>
> In message: [meta-virtualization][PATCH] podman: Use packageconfig to
> control fuse-overlayfs depend
> on 10/03/2026 Yiding Liu (Fujitsu) via lists.yoctoproject.org wrote:
>
> > The RDEPEND fuse-overlayfs is an Optional package so use packageconfig
> to control it.
> >
> > Refer to https://podman.io/docs/installation
> >
> > Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> > ---
> >  recipes-containers/podman/podman_git.bb | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/recipes-containers/podman/podman_git.bb
> b/recipes-containers/podman/podman_git.bb
> > index 53b9b6a0..4495d2d9 100644
> > --- a/recipes-containers/podman/podman_git.bb
> > +++ b/recipes-containers/podman/podman_git.bb
> > @@ -68,7 +68,8 @@ EXTRA_OEMAKE =3D " \
> >  PODMAN_FEATURES ?=3D "docker"
> >
> >  PACKAGECONFIG ?=3D ""
> > -PACKAGECONFIG[rootless] =3D ",,,fuse-overlayfs slirp4netns,,"
> > +PACKAGECONFIG[rootless] =3D ",,,slirp4netns,,"
> > +PACKAGECONFIG[fuse] =3D ",,,fuse-overlayfs,,"
>
> Whether right or wrong, fuse-overlayfs was being pulled in
> by rootless.
>
> So it should stay pulled in by rootless (unless you can show
> me that there's no requirement at all from rootless .. and
> that information needs to be in the commit message).
>
> It can also just stay in both, since last I checked, having
> the depdendency in twice doesn't cause any issues.
>
> Bruce
>
> >
> >  do_compile() {
> >        cd ${S}/src
> > --
> > 2.43.0
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#9631):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9631
> > Mute This Topic: https://lists.yoctoproject.org/mt/118237141/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000008a5e5b064cb72170
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 10, 2026 at 10:27=
=E2=80=AFPM Yiding Liu (Fujitsu) &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.c=
om">liuyd.fnst@fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div class=3D"msg-7565204812206953315">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;color:rgb(0,0,0)">
<span style=3D"font-size:12pt">Hi </span><span style=3D"font-size:11pt">Bru=
ce</span></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0Do you mean a new patch like this:</div></div></div></b=
lockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-si=
ze:small">No. But maybe I misunderstood what you are trying to do. Are you<=
/div><div class=3D"gmail_default" style=3D"font-size:small">saying that fus=
e-overlayfs is causing an issue when it is enabled</div><div class=3D"gmail=
_default" style=3D"font-size:small">for rootless ?</div><div class=3D"gmail=
_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" =
style=3D"font-size:small">I was saying that you can add a new package confi=
g for it, but also</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">leave it enabled in rootless, since it is currently enabled and builds<=
/div><div class=3D"gmail_default" style=3D"font-size:small">may be expectin=
g it.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div=
><div class=3D"gmail_default" style=3D"font-size:small">i.e. just add this:=
</div><div class=3D"gmail_default" style=3D"font-size:small"><span style=3D=
"font-size:14.6667px">=C2=A0</span><br style=3D"font-size:14.6667px"><span =
style=3D"font-size:14.6667px">=C2=A0+PACKAGECONFIG[fuse] =3D &quot;,,,fuse-=
overlayfs,,&quot;</span></div><br></div><div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">And leave rootless alone. That way if you just=C2=
=A0want fuse, you&#39;ll</div><div class=3D"gmail_default" style=3D"font-si=
ze:small">get it via &quot;fuse&quot;, if rootless is used, you get both (j=
ust as was the</div><div class=3D"gmail_default" style=3D"font-size:small">=
case previously).</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</=
div><br></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div class=3D"msg-7565204812206953315"><div dir=3D"ltr=
">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--- a/recipes-containers/po=
dman/<a href=3D"http://podman_git.bb" target=3D"_blank">podman_git.bb</a></=
div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
+++ b/recipes-containers/podman/<a href=3D"http://podman_git.bb" target=3D"=
_blank">podman_git.bb</a></div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
@@ -68,7 +68,7 @@ EXTRA_OEMAKE =3D &quot; \</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0PODMAN_FEATURES ?=3D &quot;docker&quot;</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0PACKAGECONFIG ?=3D &quot;&quot;</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
-PACKAGECONFIG[rootless] =3D &quot;,,,fuse-overlayfs slirp4netns,,&quot;</d=
iv>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
+PACKAGECONFIG[rootless] =3D &quot;,,,slirp4netns,,&quot;</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0do_compile() {</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${S}/src</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
@@ -142,9 +142,16 @@ VIRTUAL-RUNTIME_base-utils-nsenter ?=3D &quot;util-lin=
ux-nsenter&quot;</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0COMPATIBLE_HOST =3D &quot;^(?!mips).*&quot;</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
+def get_fuse_overlayfs_dep(d):</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0if bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;rootless&=
#39;, True, False, d) and \</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;fuse=
&#39;, True, False, d):</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;fuse-overlayfs&quot;</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0return &quot;&quot;</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
+</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0RDEPENDS:${PN} +=3D &quot;\</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 catatonit conmon ${VIRTUAL-RUNTIME_container_ru=
ntime} gpgme iptables libdevmapper \</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${VIRTUAL-RUNTIME_container_dns} ${VIRTUAL-RUNT=
IME_container_networking} ${VIRTUAL-RUNTIME_base-utils-nsenter} \</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0 =C2=A0 ${@get_fuse_overlayfs_dep(d)} \</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0&quot;</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0RRECOMMENDS:${PN} +=3D &quot;slirp4netns=C2=A0</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Or do you have a more elegant code?</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"margin-left:40px;font-family:Aptos,Aptos_EmbeddedFont,Aptos_M=
SFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Liu</div>
<div id=3D"m_8353310908624882632appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_8353310908624882632divRplyFwdMsg" dir=3D"ltr"><font face=3D"Ca=
libri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>=E5=8F=91=
=E4=BB=B6=E4=BA=BA:</b> Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield=
@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
<b>=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:</b> 2026=E5=B9=B43=E6=9C=8811=E6=
=97=A5 06:40<br>
<b>=E6=94=B6=E4=BB=B6=E4=BA=BA:</b> Liu, Yiding/=E5=88=98 =E4=B9=99=E4=B8=
=81 &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com" target=3D"_blank">liuyd.f=
nst@fujitsu.com</a>&gt;<br>
<b>=E6=8A=84=E9=80=81:</b> <a href=3D"mailto:meta-virtualization@lists.yoct=
oproject.org" target=3D"_blank">meta-virtualization@lists.yoctoproject.org<=
/a> &lt;<a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" targe=
t=3D"_blank">meta-virtualization@lists.yoctoproject.org</a>&gt;<br>
<b>=E4=B8=BB=E9=A2=98:</b> Re: [meta-virtualization][PATCH] podman: Use pac=
kageconfig to control fuse-overlayfs depend</font>
<div>=C2=A0</div>
</div>
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>In message: [meta-virtualization][PATCH] podman: Use packageconfig to =
control fuse-overlayfs depend<br>
on 10/03/2026 Yiding Liu (Fujitsu) via <a href=3D"http://lists.yoctoproject=
.org" target=3D"_blank">lists.yoctoproject.org</a> wrote:<br>
<br>
&gt; The RDEPEND fuse-overlayfs is an Optional package so use packageconfig=
 to control it.<br>
&gt; <br>
&gt; Refer to <a href=3D"https://podman.io/docs/installation" target=3D"_bl=
ank">https://podman.io/docs/installation</a><br>
&gt; <br>
&gt; Signed-off-by: Liu Yiding &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com=
" target=3D"_blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 recipes-containers/podman/<a href=3D"http://podman_git.bb" targe=
t=3D"_blank">podman_git.bb</a> | 3 ++-<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/recipes-containers/podman/<a href=3D"http://podman_git.bb=
" target=3D"_blank">podman_git.bb</a> b/recipes-containers/podman/<a href=
=3D"http://podman_git.bb" target=3D"_blank">podman_git.bb</a><br>
&gt; index 53b9b6a0..4495d2d9 100644<br>
&gt; --- a/recipes-containers/podman/<a href=3D"http://podman_git.bb" targe=
t=3D"_blank">podman_git.bb</a><br>
&gt; +++ b/recipes-containers/podman/<a href=3D"http://podman_git.bb" targe=
t=3D"_blank">podman_git.bb</a><br>
&gt; @@ -68,7 +68,8 @@ EXTRA_OEMAKE =3D &quot; \<br>
&gt;=C2=A0 PODMAN_FEATURES ?=3D &quot;docker&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PACKAGECONFIG ?=3D &quot;&quot;<br>
&gt; -PACKAGECONFIG[rootless] =3D &quot;,,,fuse-overlayfs slirp4netns,,&quo=
t;<br>
&gt; +PACKAGECONFIG[rootless] =3D &quot;,,,slirp4netns,,&quot;<br>
&gt; +PACKAGECONFIG[fuse] =3D &quot;,,,fuse-overlayfs,,&quot;<br>
<br>
Whether right or wrong, fuse-overlayfs was being pulled in<br>
by rootless.<br>
<br>
So it should stay pulled in by rootless (unless you can show<br>
me that there&#39;s no requirement at all from rootless .. and<br>
that information needs to be in the commit message).<br>
<br>
It can also just stay in both, since last I checked, having<br>
the depdendency in twice doesn&#39;t cause any issues.<br>
<br>
Bruce<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 do_compile() {<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd ${S}/src<br>
&gt; -- <br>
&gt; 2.43.0<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#9631): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/9631" target=3D"_blank">
https://lists.yoctoproject.org/g/meta-virtualization/message/9631</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/11823714=
1/1050810" target=3D"_blank">
https://lists.yoctoproject.org/mt/118237141/1050810</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" target=3D"_blank">
https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a href=3D"=
mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com=
</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</div>
</span></font></div>
</div>

</div></blockquote></div><div><br clear=3D"all"></div><div><br></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature">- Thou shalt not follow the NULL pointer, for chaos and madn=
ess await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, S=
tar Trek II<br><br></div></div>

--0000000000008a5e5b064cb72170--

