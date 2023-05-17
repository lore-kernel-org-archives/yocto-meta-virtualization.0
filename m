Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54206C77B7D
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 03:23:07 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.41385.1684293782109172662
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 16 May 2023 20:23:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=DB2wNQfc;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9661a1ff1e9so28951466b.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 16 May 2023 20:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684293780; x=1686885780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HhRONIq7b5PJkhlVADzhGIiV3l012v3/MWCLKt7ca34=;
        b=DB2wNQfc7MkTik6+BnwMn2M8OFeXQK/RPl/aGyISCVRFwelUB8700pbhSl6eKAbsRT
         dnTDImP3IiHqsK3DRN8j/NLeFwhBwYfHkf9EkxVOmQhJgWbdKRycrgLVCFEX6V7Ovo4T
         YIzOaqIMrqxZMbFI6yhScA2wq96Cf+/H9rB4V9CEtF854D0wcXRom1skjXszdCTigKyX
         5qpk4UmOwWcFXJpjeFg8J0FCyShTprJjkz7a968ZAr2mLgR97VH2X/0jADiQ0g4u0yjJ
         dj40AuGyT4HCvsC6QoBxOn3o8qUE94J3CHmQPPtOSU5lhr25q4QA0TvCrQeJlouuKZEA
         nSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684293780; x=1686885780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HhRONIq7b5PJkhlVADzhGIiV3l012v3/MWCLKt7ca34=;
        b=fvjix4WMpgwYD3tYB8b7W3SEgL9m1O9Y+VbBVx14QEHSCoG9L6bpaOAF9E8l29rqc9
         MVUcMXI0vgYquHEzEygJ5WFIZArRaSig0lTboDSoV+WttU1ngrmfRTzGpD8f0wcaplDa
         R3TYNH45jT1JA9xrumoxSE5Odvg/FAdDvHpogbcqg137rM40nA/jDmY+pyPCVtUOphuU
         OiKSEfKXhTusJWhXkbXZb3tYbaLqkqFxEwy1iUksdRH7f2vqYWE29276QEDgmU9C+X1Z
         r2P1dQ9eLCUoBD32nDJr2MnA8+rMuTxaNAk2QpFVHuGhYbxNZpoKOmpLpWUUKTjcr7MI
         SBVw==
X-Gm-Message-State: AC+VfDzeKKxzj91u+2kMHWVx/1eL6cqZCuPeA0teMVJDr7r/jh4rA8Wn
	mfn8yRNyEp5YlTvdblidboRQSKm8itZanMSrUTk=
X-Google-Smtp-Source: ACHHUZ6kg/5O/gqHqqRBq3cDijEkaC22IEnZ9bWgs9i2BUJa0MouVVFzYv4CNL9lDnJ1Q/8O/qEBAwjZ8W8bPYiOWek=
X-Received: by 2002:a17:906:db05:b0:959:18b2:454a with SMTP id
 xj5-20020a170906db0500b0095918b2454amr31198935ejb.76.1684293780215; Tue, 16
 May 2023 20:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230510022946.2327496-1-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20230510022946.2327496-1-xiangyu.chen@eng.windriver.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 16 May 2023 20:22:48 -0700
Message-ID: <CACMJ4GYJ6+p=MJTbfFyqHMtYKNn2q1zGk8LRrx-mT1aWZicWnQ@mail.gmail.com>
Subject: Re: [meta-virtualization][master][kirkstone][PATCH] xtf: chang the
 old override syntax
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000779ccf05fbdb342b"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 17 May 2023 03:23:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8058

--000000000000779ccf05fbdb342b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 9, 2023 at 7:30=E2=80=AFPM Xiangyu Chen <xiangyu.chen@eng.windr=
iver.com>
wrote:

> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>


Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>

Tested with mickledore and this fix could also go into langdale and
mickledore branches in addition to master and kirkstone.

thanks,

Christopher



> ---
>  recipes-extended/images/xtf-image.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/images/xtf-image.bb
> b/recipes-extended/images/xtf-image.bb
> index a78959d..f9ecea9 100644
> --- a/recipes-extended/images/xtf-image.bb
> +++ b/recipes-extended/images/xtf-image.bb
> @@ -31,4 +31,4 @@ IMAGE_INSTALL:append =3D " xtf"
>
>  DEFAULT_TEST_SUITES:append =3D " xtf_minimal"
>
> -QB_DEFAULT_FSTYPE_x86-64 =3D "wic"
> +QB_DEFAULT_FSTYPE:x86-64 =3D "wic"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8048):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8048
> Mute This Topic: https://lists.yoctoproject.org/mt/98798654/3619036
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> christopher.w.clark+meta-virt@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000779ccf05fbdb342b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, May 9, 2023 at 7:30=E2=80=AFPM Xi=
angyu Chen &lt;<a href=3D"mailto:xiangyu.chen@eng.windriver.com">xiangyu.ch=
en@eng.windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">From: Xiangyu Chen &lt;<a href=3D"mailto:xiangyu.chen@w=
indriver.com" target=3D"_blank">xiangyu.chen@windriver.com</a>&gt;<br>
<br>
Signed-off-by: Xiangyu Chen &lt;<a href=3D"mailto:xiangyu.chen@windriver.co=
m" target=3D"_blank">xiangyu.chen@windriver.com</a>&gt;<br></blockquote><di=
v><br></div><div><br></div><div>Reviewed-by: Christopher Clark &lt;<a href=
=3D"mailto:christopher.w.clark@gmail.com">christopher.w.clark@gmail.com</a>=
&gt;</div><div><br></div><div>Tested with mickledore and this fix could als=
o go into langdale and mickledore branches in addition=C2=A0to master and k=
irkstone.</div><div><br></div><div>thanks,</div><div><br></div><div>Christo=
pher</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
---<br>
=C2=A0recipes-extended/images/<a href=3D"http://xtf-image.bb" rel=3D"norefe=
rrer" target=3D"_blank">xtf-image.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/images/<a href=3D"http://xtf-image.bb" rel=3D=
"noreferrer" target=3D"_blank">xtf-image.bb</a> b/recipes-extended/images/<=
a href=3D"http://xtf-image.bb" rel=3D"noreferrer" target=3D"_blank">xtf-ima=
ge.bb</a><br>
index a78959d..f9ecea9 100644<br>
--- a/recipes-extended/images/<a href=3D"http://xtf-image.bb" rel=3D"norefe=
rrer" target=3D"_blank">xtf-image.bb</a><br>
+++ b/recipes-extended/images/<a href=3D"http://xtf-image.bb" rel=3D"norefe=
rrer" target=3D"_blank">xtf-image.bb</a><br>
@@ -31,4 +31,4 @@ IMAGE_INSTALL:append =3D &quot; xtf&quot;<br>
<br>
=C2=A0DEFAULT_TEST_SUITES:append =3D &quot; xtf_minimal&quot;<br>
<br>
-QB_DEFAULT_FSTYPE_x86-64 =3D &quot;wic&quot;<br>
+QB_DEFAULT_FSTYPE:x86-64 =3D &quot;wic&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8048): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8048" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8048</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/98798654/3619=
036" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/98798654/3619036</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:christopher.w.clark%2B=
meta-virt@gmail.com" target=3D"_blank">christopher.w.clark+meta-virt@gmail.=
com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000779ccf05fbdb342b--

