Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC7EFC0218B
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 15:29:33 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.18221.1737473371490206804
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Jan 2025 07:29:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cq5zrkZm;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-216281bc30fso133326325ad.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Jan 2025 07:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737473371; x=1738078171; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XAkG3gMSJKyGyQfl/LJwSHYSNnUy7z7ueTZH8rwIPss=;
        b=Cq5zrkZm7Zq1q0eEi5xD+lN/9i44JrIttxSmy8ETp71sOk619jlLWBFj8WoSJ58Pcc
         UNHDDW2ZcczReg7/q7kwccrxBkAnG1QHyDcfW2a5DOZMs/NN0wDiJ86FaKZTdC35eDXk
         ySmqFEQnPt6uKu+l0pkDaLru3TFGYLqVQ9U8Yinj0vPdwqflqsDn5dl7xr2LuQhKQsJx
         zL+GcwfntJoJS241GYqwkPR3H93fOoNMHIVKp1whAuuv1s09SSvC++lhZ/Y3pMF3QKat
         b8XvZ04LVObFbp7QrwT4Njq/CB49NogipATKT7KNTJ++PqxVclBJZrxlXs6FVZkZEEjD
         SeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737473371; x=1738078171;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XAkG3gMSJKyGyQfl/LJwSHYSNnUy7z7ueTZH8rwIPss=;
        b=ry/winOXkniUeWmZtxW9kTsYuPWZkHV59AjQbImeoviucfEcIn9ctx+Sr50RVmaRoL
         +nrcMdNMv/8q/3MtAQ/zNmv5s9/vxN/6ztfLw2XKYZ1c1GlltDitYWxDVX0RWz+KW3ZM
         fB0wgUQn/Fz7jGKz6ecT5Vb8jkzvVNdeTI405Dext+LvyRJrJ39wVKXtVJEA4QzhXNvR
         h8xv8TkjEv75+QoORHSbXUYeEHmsKuCHcE+RiCJz24Cl4FXnv+TPIGAUSz9zy1+cKKEX
         AoK+S9VAuJglO5ASyCghNYC1/27TsfnKLRd3A+rx+jgtWad2K3t8PDuGPU0SUnWDOYwD
         GbKg==
X-Gm-Message-State: AOJu0YxTIuoaW/P24GdxH4jrfxfPmYk9KwmhPCo3gW5pZPbY7ftKgp6p
	cMf6IdmnWN/aoXzuGyldS4WTR46WbIBt4xWZCmDdP0luiY83Akq2bpr6cKawoMcW6cNaT/Uybp8
	WxQ7ZpAr2EqlXbBRDh1eWPHB3ro8=
X-Gm-Gg: ASbGnctBb+F41NCDiW83Pub7zVK8lcUuMJLdUpq9Uun6gCPxnDV6DvdLx0eag+xu+bM
	CYcYMQ29TdvSdLyfFjO1KCIxn368x4AXtkoQnfxl5s2E2zhT965g=
X-Google-Smtp-Source: AGHT+IGzvVoOdKC/fTJ3S9zYpa+q4Y4owmso/+GZebRfQP+Eus4iQI87HbWYyVYb7RqAcHIYkmI6bmuBDZwvNwWNr+8=
X-Received: by 2002:a05:6a21:3288:b0:1e0:be48:177d with SMTP id
 adf61e73a8af0-1eb2146519dmr29566381637.3.1737473370745; Tue, 21 Jan 2025
 07:29:30 -0800 (PST)
MIME-Version: 1.0
References: <20250121-use_inherit_defer-v1-1-dbfd42de3a01@se.com>
In-Reply-To: <20250121-use_inherit_defer-v1-1-dbfd42de3a01@se.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 21 Jan 2025 10:29:18 -0500
X-Gm-Features: AbW1kvZ8rsXh5fMi1JW5ypXBkfflsVlZsu40sEwZI0tBQMrXSWUfnOtPrxiy-g4
Message-ID: <CADkTA4P-BS3h=owPN_rwi6BzDsZjzge_MNuysUiX42uV-2EX_Q@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH RESEND meta-virtualization]
 virt-manager: use inherit_defer for optional gtk-icon-cache class
To: massimiliano.minella@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org, 
	Massimiliano Minella <massimiliano.minella@se.com>
Content-Type: multipart/alternative; boundary="00000000000011f2d1062c390b9f"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Jan 2025 15:29:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9102

--00000000000011f2d1062c390b9f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Check master-next: virt-manager has gone to meson for the build and I had
to drop some icon cache bits, as well as add more gtk dependencies to get
it to build/work.

Any patches to make that support more optional would be acceptable, since I
won't look into it for quite some time.

But as it stands, I can't merge this one, as things are different enough
after the uprev to 5.x

Bruce

On Tue, Jan 21, 2025 at 10:12=E2=80=AFAM Massimiliano Minella via
lists.yoctoproject.org <massimiliano.minella=3D
gmail.com@lists.yoctoproject.org> wrote:

> From: Massimiliano Minella <massimiliano.minella@se.com>
>
> The inherit is controlled by the PACKAGECONFIG option "gui" but, since
> it is expanded at parse time, this causes a build error if the option is
> removed via a bbappend and DISTRO_FEATURES doesn't contain "x11" or
> "wayland". Replace the inherit with inherit_defer to evaluate the
> inherit at the end of parsing.
>
> Signed-off-by: Massimiliano Minella <massimiliano.minella@se.com>
> ---
>  recipes-extended/virt-manager/virt-manager_4.1.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git recipes-extended/virt-manager/virt-manager_4.1.0.bb
> recipes-extended/virt-manager/virt-manager_4.1.0.bb
> index d752fd2b..08b7d02b 100644
> --- recipes-extended/virt-manager/virt-manager_4.1.0.bb
> +++ recipes-extended/virt-manager/virt-manager_4.1.0.bb
> @@ -15,7 +15,7 @@ S =3D "${WORKDIR}/git"
>  PACKAGECONFIG ??=3D "gui"
>  PACKAGECONFIG[gui] =3D ",--no-update-icon-cache
> --no-compile-schemas,python3-pygobject"
>
> -inherit ${@bb.utils.contains('PACKAGECONFIG', 'gui', 'gtk-icon-cache',
> '', d)}
> +inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'gui',
> 'gtk-icon-cache', '', d)}
>  inherit bash-completion gettext pkgconfig setuptools3_legacy
>
>  PACKAGES +=3D " \
>
> ---
> base-commit: b57f8a25a35a93b95e3baa950c2d359fffc13051
> change-id: 20250121-use_inherit_defer-0d8e1fb85c13
>
> Best regards,
> --
> Massimiliano Minella <massimiliano.minella@se.com>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9101):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9101
> Mute This Topic: https://lists.yoctoproject.org/mt/110734659/1050810
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

--00000000000011f2d1062c390b9f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Che=
ck master-next: virt-manager has gone to meson for the build and I had to d=
rop some icon cache bits, as well as add more gtk dependencies to get it to=
 build/work.</div><div class=3D"gmail_default" style=3D"font-size:small"><b=
r></div><div class=3D"gmail_default" style=3D"font-size:small">Any patches =
to make that support more optional would be acceptable, since I won&#39;t l=
ook into it for quite some time.</div><div class=3D"gmail_default" style=3D=
"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size=
:small">But as it stands, I can&#39;t merge this one, as things are differe=
nt enough after the uprev to 5.x</div><div class=3D"gmail_default" style=3D=
"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size=
:small">Bruce</div></div><br><div class=3D"gmail_quote gmail_quote_containe=
r"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 21, 2025 at 10:12=E2=
=80=AFAM Massimiliano Minella via <a href=3D"http://lists.yoctoproject.org"=
>lists.yoctoproject.org</a> &lt;massimiliano.minella=3D<a href=3D"mailto:gm=
ail.com@lists.yoctoproject.org">gmail.com@lists.yoctoproject.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Massi=
miliano Minella &lt;<a href=3D"mailto:massimiliano.minella@se.com" target=
=3D"_blank">massimiliano.minella@se.com</a>&gt;<br>
<br>
The inherit is controlled by the PACKAGECONFIG option &quot;gui&quot; but, =
since<br>
it is expanded at parse time, this causes a build error if the option is<br=
>
removed via a bbappend and DISTRO_FEATURES doesn&#39;t contain &quot;x11&qu=
ot; or<br>
&quot;wayland&quot;. Replace the inherit with inherit_defer to evaluate the=
<br>
inherit at the end of parsing.<br>
<br>
Signed-off-by: Massimiliano Minella &lt;<a href=3D"mailto:massimiliano.mine=
lla@se.com" target=3D"_blank">massimiliano.minella@se.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/virt-manager/<a href=3D"http://virt-manager_4.1.0.bb=
" rel=3D"noreferrer" target=3D"_blank">virt-manager_4.1.0.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git recipes-extended/virt-manager/<a href=3D"http://virt-manager_4.1=
.0.bb" rel=3D"noreferrer" target=3D"_blank">virt-manager_4.1.0.bb</a> recip=
es-extended/virt-manager/<a href=3D"http://virt-manager_4.1.0.bb" rel=3D"no=
referrer" target=3D"_blank">virt-manager_4.1.0.bb</a><br>
index d752fd2b..08b7d02b 100644<br>
--- recipes-extended/virt-manager/<a href=3D"http://virt-manager_4.1.0.bb" =
rel=3D"noreferrer" target=3D"_blank">virt-manager_4.1.0.bb</a><br>
+++ recipes-extended/virt-manager/<a href=3D"http://virt-manager_4.1.0.bb" =
rel=3D"noreferrer" target=3D"_blank">virt-manager_4.1.0.bb</a><br>
@@ -15,7 +15,7 @@ S =3D &quot;${WORKDIR}/git&quot;<br>
=C2=A0PACKAGECONFIG ??=3D &quot;gui&quot;<br>
=C2=A0PACKAGECONFIG[gui] =3D &quot;,--no-update-icon-cache --no-compile-sch=
emas,python3-pygobject&quot;<br>
<br>
-inherit ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;gui&#39;, &#39;=
gtk-icon-cache&#39;, &#39;&#39;, d)}<br>
+inherit_defer ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;gui&#39;,=
 &#39;gtk-icon-cache&#39;, &#39;&#39;, d)}<br>
=C2=A0inherit bash-completion gettext pkgconfig setuptools3_legacy<br>
<br>
=C2=A0PACKAGES +=3D &quot; \<br>
<br>
---<br>
base-commit: b57f8a25a35a93b95e3baa950c2d359fffc13051<br>
change-id: 20250121-use_inherit_defer-0d8e1fb85c13<br>
<br>
Best regards,<br>
-- <br>
Massimiliano Minella &lt;<a href=3D"mailto:massimiliano.minella@se.com" tar=
get=3D"_blank">massimiliano.minella@se.com</a>&gt;<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9101): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9101" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9101</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/110734659/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/110734659/1050810</a><br>
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
rek II<br><br></div>

--00000000000011f2d1062c390b9f--

