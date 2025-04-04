Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80119C36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 14:56:34 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.13585.1743778590573845445
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Apr 2025 07:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G+iZIjGi;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2295d78b433so21761675ad.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 04 Apr 2025 07:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743778590; x=1744383390; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H4Fzbia0hQutYcnyWhXyD4hYGpRIA9LpALSffyUiTQ0=;
        b=G+iZIjGifBXgIy/7gp4aMAyvioW7KphO475a1SjrUUeqtTnpEmuypD9U8YrsDyk0P8
         H4o5RfXqG5sVz0TwLTFraWW898ScCREZVXU6hkuM+/lSpFjTBA1tgIXBNC/n3yD64gDU
         GsWYCDn3cGwOrJupL+tQRfwQLH6FHozjc6+gsoaGAJ3uc7wi1Wsv34Aja0QmeIjGssv+
         BfWBbgQbnWtyY6ndWGe71RLma+qKUq92kNZxhu7zv3Z3ajODU7ZtE1wkgcHk91zW8GJS
         vH1APIfBGKti/JBKcu989/q6aAtAhWj0uuaP3PPD92Uhz+rZtf8y5fb4E3JC2wCTVtjJ
         H4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743778590; x=1744383390;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H4Fzbia0hQutYcnyWhXyD4hYGpRIA9LpALSffyUiTQ0=;
        b=GcAB/4aejsuQDiG/rK0456YV34fIPMoBrGcf5iSArYHE9kPKxmmXWiEU0yTINPJFrB
         CKlK3ppd00FUdc0+PazIi4+jbUorNKwzkQSgyj1rs2mYoaSireTMOR5hYrM27u0mFMbn
         ORbj85Id5duowhljaMwhU6mylVbb1wwY4x+e7y/J9K/Ov5hNbpAvyjBfysEaLZBoXlva
         Am9h8K2xBJn3M3GgQ5A8wVtYAo9tiLI4Pt3bYnpS0V+1vbChtCjBT+TCoESEMNImh8DK
         e4Ad8A1YfOllKBCsk1dYZuBJqkXO5j6b+yFoPJjiHq9FEAdTEqPtu/IaU2Ejx7Np22yB
         6QIw==
X-Gm-Message-State: AOJu0YymoFxiHptWqSO2zDFJ8IrJJelRxEcbOzlj6lV6eMLKyB6M3tCI
	+fceBOFaDFEtkh20KZMTGjueQU5EaJVLbkABaPR/kgxGKKUqqpXyyLBfjzSNwS91+dpNrGZxwzu
	sEM0LKR4lpKDXHEgrfCEpxPNikxg=
X-Gm-Gg: ASbGnct3Z9SLt/jFHo2C9b4mYNuhMapfosl1SzL6mP5BPmcTtLc0e8HL0mipNq2zFL6
	wS8G38zS07+OJDRIpjKIQCUPGFyPUdS2NrtlgSPBM1cqSuYyGH+iIojxymImY1YWXthdDUDSsqC
	MPH4CPoSDW5uEfMrZVNVqix+K9gHc=
X-Google-Smtp-Source: AGHT+IGBOtvDojAt42oC/5W654jVvo98kDp0y0vZSGuFovRH/qiyIgBnRa5rPfyh4tBAMk10VPV7uhJWmUMid4HeTeQ=
X-Received: by 2002:a17:902:f547:b0:225:ac99:ae08 with SMTP id
 d9443c01a7336-22a8a04602cmr45909655ad.5.1743778588964; Fri, 04 Apr 2025
 07:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250403062511.3088323-1-pkj@axis.com>
In-Reply-To: <20250403062511.3088323-1-pkj@axis.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 4 Apr 2025 10:56:16 -0400
X-Gm-Features: AQ5f1JrKrcJdEV-WVz74tLQY-AjyahzQaP7ZFKsXEtJpf3i-dAbRrRPb8m3Vyhc
Message-ID: <CADkTA4O=zgxEz9cyTCLfpeMS743p8uim2k9CaKsvtKRb-7jiSA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 1/2] diod: Remove the dependency on tcp-wrappers
To: peter.kjellerstedt@axis.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000005cc1850631f5173c"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 04 Apr 2025 14:56:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9202

--0000000000005cc1850631f5173c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the patches! I'll stage them shortly.

I am curious how you managed to detect that the dependency and
systemd parameter were no longer necessary. Since I'd add checks like
that to my update steps at the M1/M3 points in the cycle.

Bruce

On Thu, Apr 3, 2025 at 2:25=E2=80=AFAM Peter Kjellerstedt via lists.yoctopr=
oject.org
<peter.kjellerstedt=3Daxis.com@lists.yoctoproject.org> wrote:

> Use of tcp-wrappers was removed from the diod repository in commit
> 59b221f7b5eb24a20fdd886fdd1f8ff9810bdb73.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  recipes-extended/diod/diod_1.0.24.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/diod/diod_1.0.24.bb b/recipes-extended/diod=
/
> diod_1.0.24.bb
> index 89e79df9..a33b9a66 100644
> --- a/recipes-extended/diod/diod_1.0.24.bb
> +++ b/recipes-extended/diod/diod_1.0.24.bb
> @@ -15,7 +15,7 @@ SRC_URI =3D "git://
> github.com/chaos/diod.git;protocol=3Dhttps;branch=3Dmaster \
>             file://diod.conf \
>             file://0001-build-Find-lua-with-pkg-config.patch \
>             "
> -DEPENDS =3D "libcap ncurses tcp-wrappers lua"
> +DEPENDS =3D "libcap ncurses lua"
>
>  EXTRA_OEMAKE +=3D "systemddir=3D${systemd_unitdir}/system"
>  EXTRA_OECONF =3D "--disable-auth \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9197):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9197
> Mute This Topic: https://lists.yoctoproject.org/mt/112061247/1050810
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

--0000000000005cc1850631f5173c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Tha=
nks for the patches! I&#39;ll stage them shortly.</div><div class=3D"gmail_=
default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">I am curious how you managed to detect that the de=
pendency and</div><div class=3D"gmail_default" style=3D"font-size:small">sy=
stemd parameter were no longer necessary. Since I&#39;d add checks like</di=
v><div class=3D"gmail_default" style=3D"font-size:small">that to my update =
steps at the M1/M3 points in the cycle.</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">Bruce</div></div><br><div class=3D"gmail_quote gmail_quote_c=
ontainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 3, 2025 at 2:25=
=E2=80=AFAM Peter Kjellerstedt via <a href=3D"http://lists.yoctoproject.org=
">lists.yoctoproject.org</a> &lt;peter.kjellerstedt=3D<a href=3D"mailto:axi=
s.com@lists.yoctoproject.org">axis.com@lists.yoctoproject.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Use of tcp-wra=
ppers was removed from the diod repository in commit<br>
59b221f7b5eb24a20fdd886fdd1f8ff9810bdb73.<br>
<br>
Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@=
axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/diod/<a href=3D"http://diod_1.0.24.bb" rel=3D"norefe=
rrer" target=3D"_blank">diod_1.0.24.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/diod/<a href=3D"http://diod_1.0.24.bb" rel=3D=
"noreferrer" target=3D"_blank">diod_1.0.24.bb</a> b/recipes-extended/diod/<=
a href=3D"http://diod_1.0.24.bb" rel=3D"noreferrer" target=3D"_blank">diod_=
1.0.24.bb</a><br>
index 89e79df9..a33b9a66 100644<br>
--- a/recipes-extended/diod/<a href=3D"http://diod_1.0.24.bb" rel=3D"norefe=
rrer" target=3D"_blank">diod_1.0.24.bb</a><br>
+++ b/recipes-extended/diod/<a href=3D"http://diod_1.0.24.bb" rel=3D"norefe=
rrer" target=3D"_blank">diod_1.0.24.bb</a><br>
@@ -15,7 +15,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/chao=
s/diod.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_=
blank">github.com/chaos/diod.git;protocol=3Dhttps;branch=3Dmaster</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://diod.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-build-Find-lua-with-p=
kg-config.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-DEPENDS =3D &quot;libcap ncurses tcp-wrappers lua&quot;<br>
+DEPENDS =3D &quot;libcap ncurses lua&quot;<br>
<br>
=C2=A0EXTRA_OEMAKE +=3D &quot;systemddir=3D${systemd_unitdir}/system&quot;<=
br>
=C2=A0EXTRA_OECONF =3D &quot;--disable-auth \<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9197): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9197" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9197</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/112061247/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/112061247/1050810</a><br>
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

--0000000000005cc1850631f5173c--

