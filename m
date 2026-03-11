Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA07FD88E6
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 03:22:34 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12613.1773199354402365384
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Mar 2026 20:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iqxhW1xr;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2aae4816912so89553465ad.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Mar 2026 20:22:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773199354; cv=none;
        d=google.com; s=arc-20240605;
        b=DyOc0nSctGdTSIS9SsJ0iZ4IZkEiM3i6LocyVNQcHQQWK7VfmR4RhdKFleoA1M779V
         KLwFBLy3AuNfZyhFh5aZRqvgB8e8J3x/XgFf0z1f3a2+rsF7T/oNcNOZrYZ91QIi/Hoo
         xpFE4DdrJGluOa1O2grTVBTvnHGLIjf1E2rtOTIm5hPyCkdkQS9SfaN679ZTp7Xv8c+Y
         UZ4yqPXkXEabovgotdMC2Ow5mdqlMnBGzFE9FKW9YSLdW5yUxwIYfB6MvEjAGb8suyzk
         li/D6o97+qFGgmTYzd1Mfy4ID248wPs/MNUoHINICw0xvumTK2nH50JwM0Vx0SHLHgMQ
         3viA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cK1uD7Uw0LCop5aDjViOsZaYFV4Qt41qQa80sT4/gj4=;
        fh=OClHZqodWSNbeHsUYFR0FyVz9DAVa4a7109tpdSIGh0=;
        b=NFAtb5Ljq27cB8pFSKng0bWABOVMYVqL24kbDkxdyN+o0ibRvWqRhmoPmqgjVHN2ZZ
         WkZzvips0KUy7zdfNLPTETMGsx6UvfUy65yiVlXG210MQ2px3LB1SMgqWDF4398EsPAM
         64KbAVLZbNLy41CXOvzNPxXFYDhrIx1X5y6FAoPgfSVopCVfekGT0rYjG+4Cnb7QTm5U
         EYPWgJKFMJOs3Q00ldZNA1ZlYvTmKQ3a3Pbv3KgKSqszmbOdQd3ptGdXrCQJWxIXkRnY
         BeEWZL5dnpB0y419W/l9DL8ejzo3cMCiBEWxVVbxLsOsaPw7Ji1Fg6OnwTj2Aw78AJQh
         y48Q==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773199354; x=1773804154; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cK1uD7Uw0LCop5aDjViOsZaYFV4Qt41qQa80sT4/gj4=;
        b=iqxhW1xrc9Q9gpV+ByU6aMd1BBjAr1omVMB6jOHzu9i0pgmplk7dPqXuHtr/uEFw2s
         4JWH9uTSWguIdmtTQfMOvB1oxVmJglKaAV781FWl/3WguSNExdjEWE488knjSg2U1dKu
         ccDt71rLUY5dexK6aTvIOivdBeJ8oiVzOl8o4Lzvxai7zqWu30E1ZXvKGWrzx/LGCu2t
         QP+excod8X6fmvc2dN3RNhQ2FMo/aFrzZMGbT11otgH9peWr/y/8lgIAyKJB8N1XVtM4
         0MhOiT1YtQV2yUBzfRabp1s9iiObdA7m2OURbejBYIHzosGr+d4YaGax36zar4mKfG9D
         wEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773199354; x=1773804154;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cK1uD7Uw0LCop5aDjViOsZaYFV4Qt41qQa80sT4/gj4=;
        b=obKaaHJ2u6IaeAhZmP24UdYR5tU40N4AaKYvaWsWWQf2ptj1KATROGRemJ8RUORmq+
         JxDmitMkORxNW3w9oIX6Ji/ZH/bKT4BDuIBQOlEX/oXPuV9M3NoCIlgIOX7YVUQA/BdW
         QgcjYMcpnS2yJ7YUfL1fg749eATO/p3jGnTpkfSOCKIm85XC7DxWq+MNovMhHlu3ie1j
         0VfDXnoyjMez2+s3amQvbVKDnLH7mEv/inXqhY3ArQVDzfUQiofIRsiu1dm9eHZ+dPMN
         zrVoOUfkktvboshaBYSSZS3TrhtCofd+GamncZphrnWVfXM6JUvGhArOYsWGPzb+ytFt
         sg/A==
X-Gm-Message-State: AOJu0YwNA3jntNa7hRuX5/wU4PHChRa8WXu27dL6cxnlxAVv5WFGCYtX
	jB0AUo5Og1Lq6QPAuUTTn56wyby1XDjuNH530mpW66KoCMmDD/RE990TeOjb8S8CzHuCKzXdOQT
	vidf2kut/qtuJr/9XHBKJwhweb9/VldY=
X-Gm-Gg: ATEYQzyt8aSqB5dEACxlNXzBUULpiedMSKsFawufXujNVZo3Q19nfogH/XZPAKgj2vO
	IsPmKDUwm7ZhNBa70pkdEItoWznNAny/mQAygpQ1CGlGnA5c0gxQRbmv5zay297Y6NoqvVxfwL1
	IRmUDtpLDB0ulZQarSewwWTi2dLnwy3o883rZZwP+m3DGCWidfxcIZLgGdhBELzSsI43jnkYQxh
	lYiIHhTvF8U27HGFw4/xZuho0LQH/TOgAVUS0jRpnRqbV4tSOyysMC6z9vSrH7ULuuoB5zXwPL6
	Oio3iKTTQraOWmc0ND5TgyWrnJPKJDD6MSI/2LKK
X-Received: by 2002:a17:903:2b0c:b0:2ae:508e:5019 with SMTP id
 d9443c01a7336-2aeae7bf52amr10876705ad.20.1773199353700; Tue, 10 Mar 2026
 20:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260310072754.663-1-liuyd.fnst@fujitsu.com> <abCd4oJCXiiacC_P@gmail.com>
 <189BA86F08D2A85A.2412760@lists.yoctoproject.org> <OS7PR01MB14444AFB4E071A7B18E39989A9B47A@OS7PR01MB14444.jpnprd01.prod.outlook.com>
In-Reply-To: <OS7PR01MB14444AFB4E071A7B18E39989A9B47A@OS7PR01MB14444.jpnprd01.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 Mar 2026 23:22:20 -0400
X-Gm-Features: AaiRm53OUOVO4vVA--q3qAlld1bU_I7SRn99aw12EJZ9f4dDOas51dKlFkz-2P8
Message-ID: <CADkTA4Mf4s7OQ0A_myM85JOurtTCp7tX6+Ec+ZwUE2OMioL7yg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] podman: Use packageconfig to control
 fuse-overlayfs depend
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000097e285064cb725f0"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Mar 2026 03:22:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9646

--00000000000097e285064cb725f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 11:21=E2=80=AFPM Yiding Liu (Fujitsu) <
liuyd.fnst@fujitsu.com> wrote:

> Hi Bruce
>      I found rootless overlay for podman:
>      https://www.redhat.com/en/blog/podman-rootless-overlay
>
>

Yes, I'm aware.



>      It seems that podman can use native overlay file system with the
> Linux kernel versions 5.13.
>      So fuse-overlayfs is not mandatory RDEDPEN in rootless after kernel
> 5.13.
>
>      What do you think about it.
>


My answer is the same. If it isn't causing a runtime issue, then leave it
as-is.

Bruce



>
> Liu
> ------------------------------
> *=E5=8F=91=E4=BB=B6=E4=BA=BA:* meta-virtualization@lists.yoctoproject.org=
 <
> meta-virtualization@lists.yoctoproject.org> =E4=BB=A3=E8=A1=A8 Yiding Liu=
 (Fujitsu) via
> lists.yoctoproject.org <liuyd.fnst=3Dfujitsu.com@lists.yoctoproject.org>
> *=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:* 2026=E5=B9=B43=E6=9C=8811=E6=97=
=A5 10:27
> *=E6=94=B6=E4=BB=B6=E4=BA=BA:* Bruce Ashfield <bruce.ashfield@gmail.com>
> *=E6=8A=84=E9=80=81:* meta-virtualization@lists.yoctoproject.org <
> meta-virtualization@lists.yoctoproject.org>
> *=E4=B8=BB=E9=A2=98:* Re: [meta-virtualization][PATCH] podman: Use packag=
econfig to
> control fuse-overlayfs depend
>
> Hi Bruce
>
>      Do you mean a new patch like this:
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
> >
> >
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000097e285064cb725f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 10, 2026 at 11:21=
=E2=80=AFPM Yiding Liu (Fujitsu) &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.c=
om">liuyd.fnst@fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div class=3D"msg-3010024077291917843">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Hi Bruce</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;color:rgb(0,0,0)">
<span style=3D"font-size:12pt">=C2=A0 =C2=A0 =C2=A0I found </span><span sty=
le=3D"font-size:11pt">rootless overlay for podman:</span></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0<a id=3D"m_-675878300066944735OWAba05b060-7e93-44d4-7d2=
e-edce3c0c4244" href=3D"https://www.redhat.com/en/blog/podman-rootless-over=
lay" target=3D"_blank">https://www.redhat.com/en/blog/podman-rootless-overl=
ay</a></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0</div></div></div></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">Yes, I&#39;m aware.</div><br><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v class=3D"msg-3010024077291917843"><div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0It seems that podman can use native overlay file system=
 with the Linux kernel versions 5.13.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;color:rgb(0,0,0)">
<span style=3D"font-size:12pt">=C2=A0 =C2=A0 =C2=A0So </span><span style=3D=
"font-size:11pt">fuse-overlayfs is not mandatory RDEDPEN in rootless after =
kernel
</span><span style=3D"font-size:12pt">5.13.</span></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0What do you think about it.</div></div></div></blockquo=
te><div><br></div><div><br></div><div><div class=3D"gmail_default" style=3D=
"font-size:small">My answer is the same. If it isn&#39;t causing a runtime =
issue, then leave it as-is.</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div class=3D"msg-3010024077291917843"><div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
Liu</div>
<div id=3D"m_-675878300066944735appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_-675878300066944735divRplyFwdMsg" dir=3D"ltr"><font face=3D"Ca=
libri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>=E5=8F=91=
=E4=BB=B6=E4=BA=BA:</b> <a href=3D"mailto:meta-virtualization@lists.yoctopr=
oject.org" target=3D"_blank">meta-virtualization@lists.yoctoproject.org</a>=
 &lt;<a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" target=
=3D"_blank">meta-virtualization@lists.yoctoproject.org</a>&gt; =E4=BB=A3=E8=
=A1=A8 Yiding Liu (Fujitsu) via <a href=3D"http://lists.yoctoproject.org" t=
arget=3D"_blank">lists.yoctoproject.org</a>
 &lt;liuyd.fnst=3D<a href=3D"mailto:fujitsu.com@lists.yoctoproject.org" tar=
get=3D"_blank">fujitsu.com@lists.yoctoproject.org</a>&gt;<br>
<b>=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:</b> 2026=E5=B9=B43=E6=9C=8811=E6=
=97=A5 10:27<br>
<b>=E6=94=B6=E4=BB=B6=E4=BA=BA:</b> Bruce Ashfield &lt;<a href=3D"mailto:br=
uce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<=
br>
<b>=E6=8A=84=E9=80=81:</b> <a href=3D"mailto:meta-virtualization@lists.yoct=
oproject.org" target=3D"_blank">meta-virtualization@lists.yoctoproject.org<=
/a> &lt;<a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" targe=
t=3D"_blank">meta-virtualization@lists.yoctoproject.org</a>&gt;<br>
<b>=E4=B8=BB=E9=A2=98:</b> Re: [meta-virtualization][PATCH] podman: Use pac=
kageconfig to control fuse-overlayfs depend</font>
<div>=C2=A0</div>
</div>

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
=C2=A0 =C2=A0 =C2=A0Do you mean a new patch like this:</div>
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
<div id=3D"m_-675878300066944735x_appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_-675878300066944735x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"=
Calibri, sans-serif" color=3D"#000000" style=3D"font-size:11pt"><b>=E5=8F=
=91=E4=BB=B6=E4=BA=BA:</b> Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfi=
eld@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
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
&gt; <br>
&gt; <br>
<br>
</div>
</span></font></div>
</div>
</div>

</div></blockquote></div><div><br clear=3D"all"></div><div><br></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature">- Thou shalt not follow the NULL pointer, for chaos and madn=
ess await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, S=
tar Trek II<br><br></div></div>

--00000000000097e285064cb725f0--

