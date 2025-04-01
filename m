Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE1CC3600C
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 02:34:29 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.10237.1743474861697917524
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 31 Mar 2025 19:34:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mL8RiAQ/;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so11044267a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 31 Mar 2025 19:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743474861; x=1744079661; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YqreyE3rbrCi4wFe4pLTd1btzTUbQsg6Rui/AYmguM8=;
        b=mL8RiAQ/xW+yFl1Ce5eHBoy9FYw2QaNEhpsGA977/jNjdMo+VclcOF0PnScVIN3qRS
         Bnz6U9kT+ObXqMjRJXswLEInbXHizTeD5efMOg/JQ1i+7GK7eEwy1UrmZnfqcQzkZzsN
         ZMoM4i0JsC5gq0u583XrXkgTJrwHOBk3XwnZA93sOGZbSn9ERvRe6SQfnLMAFsgZO6AM
         ZOCgOa3ri12lFkTDaLSa2iUeV3uaVa39+rFzmgUbDt7jg1ZmhySl+qhAHn/y0uPYqAT+
         gzO2FmFrBXKGR7GvGhMzSBwxhWb1p+GQflm4XYnpqZ/JCTOdFLujP34xcMUhfWOnHcRK
         B+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743474861; x=1744079661;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YqreyE3rbrCi4wFe4pLTd1btzTUbQsg6Rui/AYmguM8=;
        b=Ts82F41TrU4dt6mI1EaDKB07JgHyuNRJbF4XtsXnPbstDyZFrTFXP6IyUDrXZ9tDnB
         SNTEL8vjdkBSU8P238rdizvJpFWmN2Ry0tFEPX3/y9+eJxKvxCts757/E0ySD26gSyG4
         /gKYvy6iisNu9hfV8rEelxGNYcG0eKHEVrIiUWbtgXfMsl3eeGNqwMggVzPIkcUyFXRK
         u6nV/y0x/l5txa35DBTBr0w75bd/NuJNkV7lOGKhy8PzpTXw2Zh0fAIdCiBB4S3vUOFJ
         BmY8F9271kbf00w7eVHkb/slYsXugjUbTgSEr65BZPDb+SbKgTq3b/OZzkA5YZ6qFeGy
         nD5w==
X-Forwarded-Encrypted: i=1; AJvYcCVcnJl+N9oBMxlFPnCkpRZY5pDn5gSyJ/bLImqoobIhdjzatFWXGj0Y2cSD+ddwThXhaF1Z4o5QuzRjC9zLxj9V1nrp@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyPNdePBraCgakmxEd0CWgS4dsojf5JD1W6RbF6J+mTzXwopcog
	KObmKOeduWJIGfp6LBCV0vkEgnw5pwxnn40ekdu8lJC0spqphNuSGnblh3ZiJAxxntfidQUGkFV
	xjmzkXsz1gQC8VNA8ePOKlLU8A0Y=
X-Gm-Gg: ASbGncuH76q/1bUlxoAIN6EokW+UVOmi1MFi5w09E/F6q3AsXkCoaHDamRWkiQ01fZ8
	PDMA4q09naSNExvH653lkrPU2GiyiBQSQZYI+RPjJNi7X3v7bTl6zC87TKXl8M7AgG4/Gfv4HC5
	N1kAnJye694YGwo05t7Nr/SoyFA7M=
X-Google-Smtp-Source: AGHT+IHIivCM4X4xYDPZQ/5EUZfiexxZvXEOGfDuGx8rPyaOjsiEdSYGcAkbp6moRNkeCPzVdKqGlOjBzeKDnHkWVuA=
X-Received: by 2002:a17:90b:3851:b0:2ea:712d:9a82 with SMTP id
 98e67ed59e1d1-3053215b2b3mr17765690a91.29.1743474860921; Mon, 31 Mar 2025
 19:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250330135615.1769001-1-richard.purdie@linuxfoundation.org> <2c13bb98-32f2-4bb3-b6c7-236aa0205174@ti.com>
In-Reply-To: <2c13bb98-32f2-4bb3-b6c7-236aa0205174@ti.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 31 Mar 2025 22:34:10 -0400
X-Gm-Features: AQ5f1Jrl3kgG2sL6La7OktQmmyT7h9kPa4ivCoPcyfHQQKOiAmYeR3W6GM-8MIM
Message-ID: <CADkTA4PdP+0J05JiVNhMvJNoDV_W6Hj6aqxGVbkLGOwqAhe1_g@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] layer.conf: Update to the new
 release layer series
To: reatmon@ti.com
Cc: richard.purdie@linuxfoundation.org, 
	meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000c298210631ae5f1c"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Apr 2025 02:34:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9182

--000000000000c298210631ae5f1c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 4:54=E2=80=AFPM Ryan Eatmon via lists.yoctoproject.=
org
<reatmon=3Dti.com@lists.yoctoproject.org> wrote:

>
> I know we are in the middle of fixing the infrastructure against the bot
> attacks, but can we get this patch pulled onto master?  This is blocking
> our nightly master builds.
>

I already have my own (and slightly different patch for this), it will be
In master-next shortly. I have some transition testing to do, and the
Well known slowed access to the repositories is causing problems.

But I have to point out that no matter how urgent you think something
Is, pinging a few hours after a patch was sent on the weekend is not
Good etiquette.

Bruce


>
> On 3/30/2025 8:56 AM, Richard Purdie via lists.yoctoproject.org wrote:
> > Update to the walnascar release.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >   conf/layer.conf | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/conf/layer.conf b/conf/layer.conf
> > index fc35ce40..3db840e7 100644
> > --- a/conf/layer.conf
> > +++ b/conf/layer.conf
> > @@ -21,7 +21,7 @@ BBFILES_DYNAMIC +=3D " \
> >   # This should only be incremented on significant changes that will
> >   # cause compatibility issues with other layers
> >   LAYERVERSION_virtualization-layer =3D "1"
> > -LAYERSERIES_COMPAT_virtualization-layer =3D "styhead"
> > +LAYERSERIES_COMPAT_virtualization-layer =3D "walnascar"
> >   LAYERDEPENDS_virtualization-layer =3D " \
> >       core \
> >       openembedded-layer \
> >
> >
> >
> >
> >
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9181):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9181
> Mute This Topic: https://lists.yoctoproject.org/mt/111986532/1050810
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

--000000000000c298210631ae5f1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 31, 2025 at 4:54=
=E2=80=AFPM Ryan Eatmon via <a href=3D"http://lists.yoctoproject.org">lists=
.yoctoproject.org</a> &lt;reatmon=3D<a href=3D"mailto:ti.com@lists.yoctopro=
ject.org">ti.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><br>
I know we are in the middle of fixing the infrastructure against the bot <b=
r>
attacks, but can we get this patch pulled onto master?=C2=A0 This is blocki=
ng <br>
our nightly master builds.<br>
<span class=3D"gmail_default" style=3D"font-size:small"></span></blockquote=
><div><span class=3D"gmail_default" style=3D"font-size:small"><br></span></=
div><div><span class=3D"gmail_default" style=3D"font-size:small">I already =
have my own (and slightly different patch for this), it will be</span></div=
><div><span class=3D"gmail_default" style=3D"font-size:small">In master-nex=
t shortly. I have some transition testing to do, and the</span></div><div><=
div class=3D"gmail_default" style=3D"font-size:small">Well known slowed acc=
ess to the repositories is causing problems.</div></div><div><span class=3D=
"gmail_default" style=3D"font-size:small"><br></span></div><div><span class=
=3D"gmail_default" style=3D"font-size:small">But I have to point out that n=
o matter how urgent you think something</span></div><div><span class=3D"gma=
il_default" style=3D"font-size:small">Is, pinging a few hours after a patch=
 was sent on the weekend is not</span></div><div><span class=3D"gmail_defau=
lt" style=3D"font-size:small">Good etiquette.</span></div><div><span class=
=3D"gmail_default" style=3D"font-size:small"><br></span></div><div><span cl=
ass=3D"gmail_default" style=3D"font-size:small">Bruce</span></div><div clas=
s=3D"gmail_default" style=3D"font-size:small"></div><div class=3D"gmail_def=
ault" style=3D"font-size:small"><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><br>
<br>
On 3/30/2025 8:56 AM, Richard Purdie via <a href=3D"http://lists.yoctoproje=
ct.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> wro=
te:<br>
&gt; Update to the walnascar release.<br>
&gt; <br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0conf/layer.conf | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/conf/layer.conf b/conf/layer.conf<br>
&gt; index fc35ce40..3db840e7 100644<br>
&gt; --- a/conf/layer.conf<br>
&gt; +++ b/conf/layer.conf<br>
&gt; @@ -21,7 +21,7 @@ BBFILES_DYNAMIC +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0# This should only be incremented on significant changes t=
hat will<br>
&gt;=C2=A0 =C2=A0# cause compatibility issues with other layers<br>
&gt;=C2=A0 =C2=A0LAYERVERSION_virtualization-layer =3D &quot;1&quot;<br>
&gt; -LAYERSERIES_COMPAT_virtualization-layer =3D &quot;styhead&quot;<br>
&gt; +LAYERSERIES_COMPAT_virtualization-layer =3D &quot;walnascar&quot;<br>
&gt;=C2=A0 =C2=A0LAYERDEPENDS_virtualization-layer =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0core \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0openembedded-layer \<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
-- <br>
Ryan Eatmon=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=
=3D"mailto:reatmon@ti.com" target=3D"_blank">reatmon@ti.com</a><br>
-----------------------------------------<br>
Texas Instruments, Inc.=C2=A0 -=C2=A0 LCPD=C2=A0 -=C2=A0 MGTS<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9181): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9181" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9181</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/111986532/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/111986532/1050810</a><br>
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

--000000000000c298210631ae5f1c--

