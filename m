Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216CDF0183E
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 14:17:39 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70107.1772806650019571576
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Mar 2026 06:17:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rub2Y7rC;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-826c49b7628so5858957b3a.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Mar 2026 06:17:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772806649; cv=none;
        d=google.com; s=arc-20240605;
        b=f09qU5xfFqdAN3u/CtnK+qeSC17gvkwrQsaaNkBdIQVS9t/Y3ENk/hUMF5QMkWAUMD
         7DJ18BqLuWnn5Kqvn0JjiLGnJNlplkhy0Lcp7kOGJx+TOHwq9cmUo6omoQd7iZlZPuOA
         3PSmYX1Tku4cnyCjHyUaPfwtd5mEEV2Sqb5vPAZx2ku/9lV3WwGHyis4vhSiVPy0EfvD
         PED4Onf2GDTb7/hnFylyzzVqY4DLwWMyxPtCgwQCdiyGPxkebrPObGQZLh0El8SWHLUQ
         TWSZJPPBrvz8ADrQIHVCnn6Ykk1AZQjnHbRLfCQXjRUJH5p7n7hD0iXOTfC4zlZhQlJ2
         jalQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=T2IyFj8y4Y5IZIDcQ8I4SPHgm4vI009WgulfaUrb6I8=;
        fh=OClHZqodWSNbeHsUYFR0FyVz9DAVa4a7109tpdSIGh0=;
        b=dk4+uXL6MSSV0idzEoSH2AJ/Wrv2T/eFEcwPd4wW6o3O0PamA1FNnEeOxsE13ezHdW
         aOmcaUVWP/B1p++Df8IDAc5Z2F0ycDRWA2zfqGARx9fSxBOL1FALD9nRHEjj1tHwNf6T
         GWyOm9oYFYO8TE5xXuwt+fAmAsh0PMkiXN9HNQ1G0g/ZTFvELQTvFTMzki8/b5rZ0EzW
         jrUHYPiGYUhM7x6cO4JHFWH1wgexou9ZxWkAwe9fTqnODXHWkq0a9aR1K34FyseXnQ6J
         iCPOcqkGilqZwS915sDDTMYKOZF0eUiA75pHl+VvXqTqj9WYCKDYK0b296BmNydwi2JO
         np5Q==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772806649; x=1773411449; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T2IyFj8y4Y5IZIDcQ8I4SPHgm4vI009WgulfaUrb6I8=;
        b=Rub2Y7rCthXDHwPWZS199p+YMluai65dL3vfgFyEjVHChznn0V4/A+KFCwcXkCVEwk
         hiGw4N8py4u/XAoeDOfkJKwV4kuiFJ1k4rnkV6RWnHlS3TAhzTZ8300ch8/pgoECYiVX
         fmIEoYPpnCCq7/m0CzEpHzSAWz++71Rh0mtX7bTe+WTmoxxMg5FxCoJx4lt+tgj6fxna
         vuQU3Go2sNrAIgyAECWWsVv681JeTce9OYDl3hi1f8PGzpxLRGWKU5Hv4RonEkMCIroB
         cg+iGfDQD/s/iMFLvs2NZJ2tQffmV9wZrAdY8oaXomlf9O0PH0f9fbIfDs5I58ZuF8H9
         /Xwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772806649; x=1773411449;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2IyFj8y4Y5IZIDcQ8I4SPHgm4vI009WgulfaUrb6I8=;
        b=k2vKB0J3C1zv0lmZiPPoh1qwuPBRkUNn6b1D/FYzS+StzewRGyHHquEQJtxVRHLbuI
         qQN4J4EnQpmb6I3CLDBcfbPrssnCDSKHUD6Xw5G8cQ70+/w13b37vuQFb3fVIRJZfmaZ
         Y+tgIUmGI9KlFZ2tFMCkyLCV7EnOQmiX0Kig1aRoIQJI71wpWewOGakpbCCvGxhXSYJZ
         E5BqSkZBAixeYiKHwubwGI/As9L4RbxTH278sRMr6a/VCYYZk4e2xFWZfJadjFeoW4yi
         3abkqCOV6MPtbiNL9oMp61HJs+IbKNTdhNqN2Fay9IlU+ADe45eFCgvnBt62FY1u/nvf
         2I5Q==
X-Gm-Message-State: AOJu0Yy6R3B/iHf7wuZotq3BxRIPZ71hU0FSEvu6j4IXy4khm1bVLj07
	sBie5MbmWPgxizT53AP8bq1sc8OnlkeoX1iicbc78ROVDTyz1+fpLkjXcpAOGRM8oGxq+cM5frf
	K7tPL605MPp801q4w/zF9seeb9gY6mWU=
X-Gm-Gg: ATEYQzwEG3II7ZsbyTeZgFLeyXtdgMl0XpLF3SWtTfKR8aytTPGJb8fYLRG9Fzfzrmi
	TtbV9J47SXeWH3oIewq2UoXdKOU8COZ0HSna2tAYPdCz8pFj5WQ129S3leZJqOrop3SH+zRjpEW
	WJlxjOt0K9SQKelBXCfFVUfRpbP0LZ+3XZ/iJfZBfBhhCn05rCMHtLpb2mMUQHdtY/NzS6HfIzT
	jQkagp4qoxVNdMwy49ZQfkywkeNmGMWAjMO9jBRVX+WUI7vEn0tVFhOxtueCadbyLWYcXTjABIC
	iZH9lWJrQIN2PNQPgIbWoDHwPLuTF7ycQV22Wkha
X-Received: by 2002:a05:6a20:43ac:b0:350:fa56:3f45 with SMTP id
 adf61e73a8af0-3985908773emr2512134637.35.1772806649162; Fri, 06 Mar 2026
 06:17:29 -0800 (PST)
MIME-Version: 1.0
References: <TY3PR01MB101107358F0B9DB8423E4529A9B7AA@TY3PR01MB10110.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB101107358F0B9DB8423E4529A9B7AA@TY3PR01MB10110.jpnprd01.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 6 Mar 2026 09:17:18 -0500
X-Gm-Features: AaiRm53BxazMhSihMyCIicsyyCqMk578FW4FLQ9i0fsE7j_6K1neKFoNYB2wyhE
Message-ID: <CADkTA4M2kCghCv75qd83WZ3KPcP0W8J84Z5onLkJ1TUjisWFMQ@mail.gmail.com>
Subject: Re: Depends about podman rootless
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000943062064c5bb6dc"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Mar 2026 14:17:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9623

--000000000000943062064c5bb6dc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 6, 2026 at 2:04=E2=80=AFAM Yiding Liu (Fujitsu) <liuyd.fnst@fuj=
itsu.com>
wrote:

> Hi Bruce
>     When I try to run container with  podman rootless, it showed followin=
g
> error:
>  $ podman run -it xxx
>  Error: could not find pasta, the network namespace can't be configured:
> exec: "pasta": executable file not found in $PATH
>
>    Which means pasta is required by  podman rootless.
>    Pasta command is provided by passt recipe, so I want to send a patch t=
o
> fix this issue like
>

I'm still attempting to keep all of the networking and
infrastructure dependencies
for the runtimes by variable, even if there's less flexibility now.

That being said, podman's networking is typically provided by network which
is what the profile's have for that selection.

This sort of falls into a "support utility" category,  and in that case, it
would be
better in the podman recipe itself, under a "rootless" packagecconrfig
option.

If there needs to be coordination between multiple recipes and packages to
make rootless work, then it could be promoted to a distro or image feature
and then the podman packageconfig could trigger off of that.

That



>
>   diff --git a/recipes-core/packagegroups/packagegroup-container.bb
> b/recipes-core/packagegroups/packagegroup-container.bb
> index b94e6799..c861e508 100644
> --- a/recipes-core/packagegroups/packagegroup-container.bb
> +++ b/recipes-core/packagegroups/packagegroup-container.bb
> @@ -39,6 +39,7 @@ RDEPENDS:packagegroup-docker =3D " \
>
>  RDEPENDS:packagegroup-podman =3D " \
>      podman \
> +    passt \
>  "
>
>  What do you think about my suggestion=EF=BC=9F
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000943062064c5bb6dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 6, 2026 at 2:04=
=E2=80=AFAM Yiding Liu (Fujitsu) &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.c=
om">liuyd.fnst@fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div class=3D"msg-2153310553614262189">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif,serif,EmojiFont;font-size:12pt;color:black">
<span style=3D"background-color:white">Hi Bruce</span></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 When I try to run container with =C2=A0podman rootless, it sh=
owed following error:</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0$ podman run -it xxx</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0Error: could not find pasta, the network namespace can&#39;t be confi=
gured: exec: &quot;pasta&quot;: executable file not found in $PATH</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0=C2=A0</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0Which means pasta is required by =C2=A0podman rootless.=C2=A0<=
/div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0Pasta command is provided by passt recipe, so I want to send a=
 patch to fix this issue like</div></div></div></blockquote><div><br></div>=
<div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;m still a=
ttempting to keep all of the networking and infrastructure=C2=A0dependencie=
s</div><div class=3D"gmail_default" style=3D"font-size:small">for the runti=
mes by variable, even=C2=A0if there&#39;s less flexibility now.</div><div c=
lass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">That being said, podman&#39;s networ=
king is typically provided by network=C2=A0which</div><div class=3D"gmail_d=
efault" style=3D"font-size:small">is what the profile&#39;s have for that s=
election.</div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">This sort of fa=
lls into a &quot;support utility&quot; category,=C2=A0 and in that case, it=
 would be</div><div class=3D"gmail_default" style=3D"font-size:small">bette=
r in the podman recipe itself, under a &quot;rootless&quot;=C2=A0packagecco=
nrfig=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small">opt=
ion.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">If there needs to be=
 coordination between multiple recipes and packages to</div><div class=3D"g=
mail_default" style=3D"font-size:small">make rootless work, then it could b=
e promoted to a distro or image feature</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">and then the podman packageconfig could trigger of=
f of that.</div><div class=3D"gmail_default" style=3D"font-size:small"><br>=
</div><div class=3D"gmail_default" style=3D"font-size:small">That=C2=A0</di=
v><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div class=3D"msg-2153310553614262189"><div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 diff --git a/recipes-core/packagegroups/<a href=3D"http://packagegro=
up-container.bb" target=3D"_blank">packagegroup-container.bb</a> b/recipes-=
core/packagegroups/<a href=3D"http://packagegroup-container.bb" target=3D"_=
blank">packagegroup-container.bb</a></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
index b94e6799..c861e508 100644</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
--- a/recipes-core/packagegroups/<a href=3D"http://packagegroup-container.b=
b" target=3D"_blank">packagegroup-container.bb</a></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
+++ b/recipes-core/packagegroups/<a href=3D"http://packagegroup-container.b=
b" target=3D"_blank">packagegroup-container.bb</a></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
@@ -39,6 +39,7 @@ RDEPENDS:packagegroup-docker =3D &quot; \</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0RDEPENDS:packagegroup-podman =3D &quot; \</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0podman \</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0passt \</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0&quot;</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-size:12pt"><span style=3D"font-family:Aptos,Aptos_Embedd=
edFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;color:rgb(0,0,0)">=
=C2=A0</span><span style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFo=
ntService,Calibri,Helvetica,sans-serif,serif,EmojiFont;color:black;backgrou=
nd-color:white">What
 do you think about my suggestion=EF=BC=9F</span></div>
</div>

</div></blockquote></div><div><br clear=3D"all"></div><div><br></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature">- Thou shalt not follow the NULL pointer, for chaos and madn=
ess await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, S=
tar Trek II<br><br></div></div>

--000000000000943062064c5bb6dc--

