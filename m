Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D98BBC433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 21:15:58 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.2838.1648070157763319161
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 14:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MXHfyp7f;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id d10so5364542eje.10
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 14:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+VoyfV5gXB4iGtaBDJ4KeC7TZWSGecTcNIKzSJaw4Tc=;
        b=MXHfyp7fYqFpCmEFMcLb8GgG8lL9GdAZ1Bu0vMtUH7SHeT/6tMQ9dsCbnz1W+giwEE
         QtCCEOwQULijxcXxhTeSrGv1Q1nZo0TswPFBylTiVW9W2ggSwJPlq6mQwM8R3fx3HJOl
         ho/fmB5MZ2f3/43tlkpjxHdKSLXU7XsZ4NOKbyswNvF6+3e65AUjOu8UDdUHD/Ovph0d
         MbXwM+Hjz5mg99e8bt/BWRTc9FShm5mUzmoEGeLpuQ5/GxPABQm//cm7eV11aFGb+Qys
         xqX2ebDpbuBVfUAwlEpAr8PqnwgXdtOUm6QsTg9ZTEsjsvUqrRMpPLuRnpVA8kXq7x8y
         Jq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+VoyfV5gXB4iGtaBDJ4KeC7TZWSGecTcNIKzSJaw4Tc=;
        b=HU8Vy5k2pGoMtGSV0fiNr3Q4ubAo5mW1UHNoBowVsw5WM4mNc/qUJrq97BF8Cb0bmW
         vaA5pIoPxEOM/3bU5NKnbq9AhOkYuScBZgk85IUCsFMFyCiHHMfzTIoXsQP10lcGKTG+
         0ouLHQUvcwREdfZ1+iF0xkdPXoRydgs+35gsIGIPDsmqE1DUUWrR6hmq9Cmih8XNazQp
         1BE82RCwtgv9L08r4x49VNFfuajYXH5gNpDAJQZxX83Z7KgeE0hRgF0ljrN2QLJsKh3Q
         Nb7nOPkTm7CCNBK4iOQfDEs5aL3PRf6tupzvSBiebekRceqJC17wdgdfDiMcgercBUfc
         k+OQ==
X-Gm-Message-State: AOAM532hqsYT+aexSHTsOG5RbUDfmRCJFE1gWj/kCKTKPtaeveI2nA+a
	mfDSA8SzJ978hWvaOoX+8v+AD9bUaYa4AN3w4rU=
X-Google-Smtp-Source: 
 ABdhPJy96FiNZMxBr6NeiV/Kw3v8DKh0vngDpBvDRCJBENtAihxIdhFVXN3AndtWBrMr1YFxv03ceZc5csg/Dqs0+Kw=
X-Received: by 2002:a17:906:dc8f:b0:6e0:5ce7:d80e with SMTP id
 cs15-20020a170906dc8f00b006e05ce7d80emr2194591ejc.435.1648070156201; Wed, 23
 Mar 2022 14:15:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220323173336.1284452-1-richard.purdie@linuxfoundation.org>
 <CAPoiz9w++T9T4Tq7VB-b54QfyGj2CC67TZwDY8dCUzBPN2kWzg@mail.gmail.com>
In-Reply-To: 
 <CAPoiz9w++T9T4Tq7VB-b54QfyGj2CC67TZwDY8dCUzBPN2kWzg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 23 Mar 2022 17:15:45 -0400
Message-ID: 
 <CADkTA4Pf31VovViyJ1BkJufw-dbZ6DyFToA-zRB7tHaS3e3FNQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] python3-sphinx: Drop as newer recipe
 merged to OE-Core
To: Jon Mason <jdmason@kudzu.us>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000039b33c05dae93c8e"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Mar 2022 21:15:58 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7111

--00000000000039b33c05dae93c8e
Content-Type: text/plain; charset="UTF-8"

Unfortunately not.

I have a dependency on this version, which means i need to fork the recipe,
create a version specific one and then do some regression testing.

I'm tied up with a few other high priority issues .. and the merge without
realizing that this recipe was in meta-virt, does not make an emergency on
my part.

Bruce


On Wed, Mar 23, 2022 at 3:30 PM Jon Mason <jdmason@kudzu.us> wrote:

> Good fix.  Please pull this in, as it is causing autobuilder errors
> See
> https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/601/steps/23/logs/stdio
>
> Thanks,
> Jon
>
> On Wed, Mar 23, 2022 at 1:33 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > A newer version of this was merged to OE-Core and there shouldn't be a
> hard
> > version dependency in meta-virtualization so this can be droped from
> here.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  recipes-devtools/python/python3-sphinx_4.2.0.bb | 11 -----------
> >  1 file changed, 11 deletions(-)
> >  delete mode 100644 recipes-devtools/python/python3-sphinx_4.2.0.bb
> >
> > diff --git a/recipes-devtools/python/python3-sphinx_4.2.0.bb
> b/recipes-devtools/python/python3-sphinx_4.2.0.bb
> > deleted file mode 100644
> > index 01f36ea..0000000
> > --- a/recipes-devtools/python/python3-sphinx_4.2.0.bb
> > +++ /dev/null
> > @@ -1,11 +0,0 @@
> > -DESCRIPTION = "Python documentation generator"
> > -HOMEPAGE = "http://sphinx-doc.org/"
> > -SECTION = "devel/python"
> > -LICENSE = "BSD-2-Clause & BSD-3-Clause & MIT"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=82cc7d23060a75a07b820eaaf75abecf"
> > -
> > -PYPI_PACKAGE = "Sphinx"
> > -
> > -SRC_URI[sha256sum] =
> "94078db9184491e15bce0a56d9186e0aec95f16ac20b12d00e06d4e36f1058a6"
> > -
> > -inherit setuptools3 pypi
> > --
> > 2.32.0
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7110):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7110
> Mute This Topic: https://lists.yoctoproject.org/mt/89981297/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000039b33c05dae93c8e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Unfortunately not.</div><div class=3D"gmail_default" style=3D=
"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size=
:small">I have a dependency on this version, which means i need to fork the=
 recipe, create a version specific one and then do some regression testing.=
</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">I&#39;m tied up with a f=
ew other=C2=A0high priority issues .. and the merge without realizing that =
this recipe was in meta-virt, does not make an emergency on my part.</div><=
div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Bruce</div><div class=3D"gmail=
_default" style=3D"font-size:small"><br></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 23, 2022 at 3:30 =
PM Jon Mason &lt;<a href=3D"mailto:jdmason@kudzu.us">jdmason@kudzu.us</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Good f=
ix.=C2=A0 Please pull this in, as it is causing autobuilder errors<br>
See <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/121/=
builds/601/steps/23/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https:=
//autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/601/steps/23/l=
ogs/stdio</a><br>
<br>
Thanks,<br>
Jon<br>
<br>
On Wed, Mar 23, 2022 at 1:33 PM Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; A newer version of this was merged to OE-Core and there shouldn&#39;t =
be a hard<br>
&gt; version dependency in meta-virtualization so this can be droped from h=
ere.<br>
&gt;<br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
&gt; ---<br>
&gt;=C2=A0 recipes-devtools/python/<a href=3D"http://python3-sphinx_4.2.0.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-sphinx_4.2.0.bb</a> | 11 --=
---------<br>
&gt;=C2=A0 1 file changed, 11 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 recipes-devtools/python/<a href=3D"http://pyt=
hon3-sphinx_4.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-sphinx_4=
.2.0.bb</a><br>
&gt;<br>
&gt; diff --git a/recipes-devtools/python/<a href=3D"http://python3-sphinx_=
4.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-sphinx_4.2.0.bb</a> =
b/recipes-devtools/python/<a href=3D"http://python3-sphinx_4.2.0.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-sphinx_4.2.0.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index 01f36ea..0000000<br>
&gt; --- a/recipes-devtools/python/<a href=3D"http://python3-sphinx_4.2.0.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-sphinx_4.2.0.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,11 +0,0 @@<br>
&gt; -DESCRIPTION =3D &quot;Python documentation generator&quot;<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"http://sphinx-doc.org/" rel=3D"noreferr=
er" target=3D"_blank">http://sphinx-doc.org/</a>&quot;<br>
&gt; -SECTION =3D &quot;devel/python&quot;<br>
&gt; -LICENSE =3D &quot;BSD-2-Clause &amp; BSD-3-Clause &amp; MIT&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D82cc7d23060a75a07b820=
eaaf75abecf&quot;<br>
&gt; -<br>
&gt; -PYPI_PACKAGE =3D &quot;Sphinx&quot;<br>
&gt; -<br>
&gt; -SRC_URI[sha256sum] =3D &quot;94078db9184491e15bce0a56d9186e0aec95f16a=
c20b12d00e06d4e36f1058a6&quot;<br>
&gt; -<br>
&gt; -inherit setuptools3 pypi<br>
&gt; --<br>
&gt; 2.32.0<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7110): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/7110" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/7110</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/89981297/1050=
810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/89981297/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--00000000000039b33c05dae93c8e--

