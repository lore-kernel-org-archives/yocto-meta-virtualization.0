Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0299D462A6
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 14:06:31 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.12112.1731506784818536383
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Nov 2024 06:06:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AQnkvS31;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7ee6edc47abso4558618a12.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Nov 2024 06:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731506784; x=1732111584; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uwKP862uovW7vzxldXf2Hr6YUgPEN8st3SMs7phMf4Q=;
        b=AQnkvS31gSofvwnEo81nbB2AbCmVHTzH4e2fep69GbSvgwFOYbaDPb6zwL2d5MXoQR
         L1IFtQ2FdNTDyFihRo6zIyiysHffVYR431q+z97KZ8TIgVDeDwN/i6+zLtlO/lr4MUYh
         YBN+2MAChHkqT39cshMcEbdiZ4dBkuiuldcT5f2pOfL+4oDkQ3sMa9+jdVaA7Z+QcNiC
         SUMf+yNMeMpOqLeZ/YjR72phMpqfXnD5RC2XV6pt70qUHz2c7Nk5PFatT+96h7judeOr
         bmglPm6kEQSLgXehW6AFi66/KIALKC9LBajRPH4Jc5rBYIgjOSuqdgqNnI37E18xCPvO
         eFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731506784; x=1732111584;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uwKP862uovW7vzxldXf2Hr6YUgPEN8st3SMs7phMf4Q=;
        b=jSJvlF5H03x0wdIp5ra88p6Drv15lyCoBvTkmMxHTEUGjllP7v0DLjjM4iJFoQmRI4
         ZejLj2M9Rw/igJDKYKnHB3RPNnaNTMhzNV8FWr5qXAFLeFymhr75w06/IczqPpwIWICa
         VbkGx9i+n9fMtJKBdtZ7u1LfKqNSNtIhTrEXFC/7I1xdDqi0UGluStcwICGz2dRp2d9R
         SGjddhC+cRisamqnqPpN1a+mXy1+BW5jkEtEiekxVwp0ErLKu6oqKMpc40HXETwZycQm
         aXvdRsHLU2ZThvhRqOyLwtzl9+9KP/yAOQHjB7xF0fyqAI8HSARHhc3FL7UZTdxiAh2W
         OIqg==
X-Gm-Message-State: AOJu0YxIsub0tBBgSewD2iM1v41PnwtrCI4TzrAQl1cTRtgYJpRkSsiT
	sY65zOuxnqtmGCF3ZJ2wyL88AH6e9+GOO5vEX3RsYFpNO/YLtSD4JX82O5SfW7gJMMkH6cgw5Ud
	0Tr7E+tLt39ejuGIXWrELTcDc/ek=
X-Google-Smtp-Source: AGHT+IH0Tg2czf0qTRevmQnEXfS+Av4ZIDYSAHv39D1Wg8pFAr0HILYGN246GI9zdp3VE4fBxZA5+ve7hlZcMJDVWuc=
X-Received: by 2002:a17:90b:1c08:b0:2d8:3fe8:a195 with SMTP id
 98e67ed59e1d1-2e9b16ea69bmr26772159a91.4.1731506783815; Wed, 13 Nov 2024
 06:06:23 -0800 (PST)
MIME-Version: 1.0
References: <20241111163628.111992-1-martin.jansa@gmail.com>
 <ZzPjBWxtD2+wHij7@gmail.com> <CA+chaQevweZrObk74CaYRW0jm4t22-asUxTi04HKP4b_mJdkBA@mail.gmail.com>
In-Reply-To: <CA+chaQevweZrObk74CaYRW0jm4t22-asUxTi04HKP4b_mJdkBA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 13 Nov 2024 09:06:11 -0500
Message-ID: <CADkTA4NVUxZPRPHPuBZPcOYcHhaBG7fXp5O4kWNzJVQ0aopNrQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [master][scarthgap][styhead][kirkstone][PATCH]
 go-cli: use main branch
To: Martin Jansa <martin.jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000c6905c0626cbd6a0"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Nov 2024 14:06:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8969

--000000000000c6905c0626cbd6a0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 2:44=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:

> On Wed, Nov 13, 2024 at 12:21=E2=80=AFAM Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> >
> > I had to tweak it a bit for kirkstone, but it is now applied
> > everywhere!
>
> Thanks!
>
> For me git cherry-pick tweaked it automatically for me for kirkstone,
> when cherry-picking from master, that's why I've sent just one
> version. But I guess git am was more picky, sorry about that and
> thanks for resolving it.
>

Aha! Yes, that would be it. No concerns on my end, I was more
double checking I hadn't mangled it :)

Bruce


> Cheers,
>
> >
> > Bruce
> >
> > In message: [meta-virtualization]
> [master][scarthgap][styhead][kirkstone][PATCH] go-cli: use main branch
> > on 11/11/2024 Martin Jansa via lists.yoctoproject.org wrote:
> >
> > > * master was renamed to main long time ago
> > >
> > > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > > ---
> > >  recipes-devtools/go/go-cli_git.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/recipes-devtools/go/go-cli_git.bb b/recipes-devtools/go/
> go-cli_git.bb
> > > index 8a4992bd..37f65c33 100644
> > > --- a/recipes-devtools/go/go-cli_git.bb
> > > +++ b/recipes-devtools/go/go-cli_git.bb
> > > @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Ded9b539ed65d73926f30ff1f1587dc44"
> > >  SRCNAME =3D "cli"
> > >
> > >  PKG_NAME =3D "github.com/codegangsta/${SRCNAME}
> <http://github.com/codegangsta/$%7BSRCNAME%7D>"
> > > -SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmaster;protocol=3Dhttps"
> > > +SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmain;protocol=3Dhttps"
> > >
> > >  SRCREV =3D "27ecc97192df1bf053a22b04463f2b51b8b8373e"
> > >  PV =3D "1.1.0+git"
> > > --
> > > 2.47.0
> > >
> >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#8962):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8962
> > > Mute This Topic: https://lists.yoctoproject.org/mt/109518136/1050810
> > > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > > Unsubscribe:
> https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000c6905c0626cbd6a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Nov 13, 2024 at 2:44=E2=80=AFAM Martin Jans=
a &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On We=
d, Nov 13, 2024 at 12:21=E2=80=AFAM Bruce Ashfield<br>
&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ash=
field@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I had to tweak it a bit for kirkstone, but it is now applied<br>
&gt; everywhere!<br>
<br>
Thanks!<br>
<br>
For me git cherry-pick tweaked it automatically for me for kirkstone,<br>
when cherry-picking from master, that&#39;s why I&#39;ve sent just one<br>
version. But I guess git am was more picky, sorry about that and<br>
thanks for resolving it.<br></blockquote><div><br></div><div><div class=3D"=
gmail_default" style=3D"font-size:small">Aha! Yes, that would be it. No con=
cerns on my end, I was more</div><div class=3D"gmail_default" style=3D"font=
-size:small">double checking I hadn&#39;t mangled it :)</div><div class=3D"=
gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">Bruce</div></div><div><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt; In message: [meta-virtualization] [master][scarthgap][styhead][kirksto=
ne][PATCH] go-cli: use main branch<br>
&gt; on 11/11/2024 Martin Jansa via <a href=3D"http://lists.yoctoproject.or=
g" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> wrote:<b=
r>
&gt;<br>
&gt; &gt; * master was renamed to main long time ago<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gm=
ail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 recipes-devtools/go/<a href=3D"http://go-cli_git.bb" rel=3D=
"noreferrer" target=3D"_blank">go-cli_git.bb</a> | 2 +-<br>
&gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/recipes-devtools/go/<a href=3D"http://go-cli_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">go-cli_git.bb</a> b/recipes-devtools/=
go/<a href=3D"http://go-cli_git.bb" rel=3D"noreferrer" target=3D"_blank">go=
-cli_git.bb</a><br>
&gt; &gt; index 8a4992bd..37f65c33 100644<br>
&gt; &gt; --- a/recipes-devtools/go/<a href=3D"http://go-cli_git.bb" rel=3D=
"noreferrer" target=3D"_blank">go-cli_git.bb</a><br>
&gt; &gt; +++ b/recipes-devtools/go/<a href=3D"http://go-cli_git.bb" rel=3D=
"noreferrer" target=3D"_blank">go-cli_git.bb</a><br>
&gt; &gt; @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3De=
d9b539ed65d73926f30ff1f1587dc44&quot;<br>
&gt; &gt;=C2=A0 SRCNAME =3D &quot;cli&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 PKG_NAME =3D &quot;<a href=3D"http://github.com/codegangsta=
/$%7BSRCNAME%7D" rel=3D"noreferrer" target=3D"_blank">github.com/codegangst=
a/${SRCNAME}</a>&quot;<br>
&gt; &gt; -SRC_URI =3D &quot;git://${PKG_NAME}.git;branch=3Dmaster;protocol=
=3Dhttps&quot;<br>
&gt; &gt; +SRC_URI =3D &quot;git://${PKG_NAME}.git;branch=3Dmain;protocol=
=3Dhttps&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 SRCREV =3D &quot;27ecc97192df1bf053a22b04463f2b51b8b8373e&q=
uot;<br>
&gt; &gt;=C2=A0 PV =3D &quot;1.1.0+git&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.47.0<br>
&gt; &gt;<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#8962): <a href=3D"https://lists.yoctoproject.=
org/g/meta-virtualization/message/8962" rel=3D"noreferrer" target=3D"_blank=
">https://lists.yoctoproject.org/g/meta-virtualization/message/8962</a><br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/109=
518136/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctopro=
ject.org/mt/109518136/1050810</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.=
yoctoproject.org" target=3D"_blank">meta-virtualization+owner@lists.yoctopr=
oject.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-vir=
tualization/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yocto=
project.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfie=
ld@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--000000000000c6905c0626cbd6a0--

