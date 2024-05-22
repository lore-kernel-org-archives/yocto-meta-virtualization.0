Return-Path: <troth@openavr.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E01A2C25B7C
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 22:51:36 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.4235.1716418294900779263
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 22 May 2024 15:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20230601.gappssmtp.com header.s=20230601 header.b=WWDQh5pG;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.221.51, mailfrom: troth@openavr.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-354f14bd80cso781953f8f.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 22 May 2024 15:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20230601.gappssmtp.com; s=20230601; t=1716418293; x=1717023093; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5rmORTcL2iAgA/anACKJsmMgwMHMH8miGfJj+qByzlQ=;
        b=WWDQh5pGBa+EyAbQ3pQHGru1Of6l/Atg64e15CS+XhVCaDpJrfcphTDeKCGKLO7NA7
         4aS6Mu2JfXq3RkcTfMdr8AiDVmOl/Av4SIXk6Om9FR+mKJPa3Ga/IVnTF2wL+IRQ3hRD
         bXyu3/fnFjWwLT4L5SW7hM/aokfPIPCBYWOpcOuwO+piB/S37mBCStSFXiSAttW/GVsq
         W74W0CGrKpiX0ssWvaQ4MTN0KaBp/LleBh+qqgrZXjHt/FMPCBXRVkr4trMbb39uWyEN
         JdiAMtJdGvr3FCww5PGdLGLQrvTPKu9JpIj9mX5b91U4BF9QmDld4ORK8NEfvuTTbNE/
         LSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716418293; x=1717023093;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rmORTcL2iAgA/anACKJsmMgwMHMH8miGfJj+qByzlQ=;
        b=WweJU9FV8geq6vspchQ6vYh/pU0x2rcVrvKrQkQHw47eOTKnwm5NPwZomdWNt/Naof
         E2H0FQjE1TWyqZK+Me0QjL9v0lAv+ej8ixhn+fSbdlKH287tTtc2W/jM/dSns1L9TiRG
         sGI4cU/M52e0EOQcaqkYPdPHkaqeASmpc2zudLR398VwHQr65ZepY6geUW7Ltsa+3GXU
         RsqW6gry2b3V3LNZdUyF1T2gUH15nGLjTlLmcG6uDaw7S/W+iWtSWg7nU91HatwDihbZ
         U1rP3QzAGtPYaM0MLp27D6ZIsvfHUGmCQLJJPwdRMgPQOXWUS3nwEeOCFCfHqW/e/pAH
         UrgQ==
X-Gm-Message-State: AOJu0YyPV7f/WpMSjcGJ7WWV/s1cj6NhP1t/GYRgi5s2v6ISgWiV/JlF
	0PsnxtcCwvMNYzDSU7vtGwObNJVXX1CFvUNSrxKqnM6whKskwAR5kvnGWRNU5jNKE9i30fYV7hh
	Go9xi75yIKmLLnBbyIaIgXCSbi+vZY9a+ARmtsw==
X-Google-Smtp-Source: AGHT+IGTZbgCyI/Jf1/COcGpMS6l+s1cJyKZ3kb+UZ40Es+iiHfg/o04R/itud84Tk2OKgJp0XQCr/lHtzyIFEQGYkM=
X-Received: by 2002:a5d:4650:0:b0:354:f2b0:ebdb with SMTP id
 ffacd0b85a97d-354f2b0ec33mr1405463f8f.12.1716418293145; Wed, 22 May 2024
 15:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAFMvBt2+s5a9BCnkYgmXvL9P83JDgkg5hg41q936JuEXHy568g@mail.gmail.com>
 <CA+chaQdXNXd_B3YiKXnvt0eV-i24hS1g7Jm6zW0buqN9n_3sZQ@mail.gmail.com>
In-Reply-To: <CA+chaQdXNXd_B3YiKXnvt0eV-i24hS1g7Jm6zW0buqN9n_3sZQ@mail.gmail.com>
From: "Theodore A. Roth" <troth@openavr.org>
Date: Wed, 22 May 2024 16:51:21 -0600
Message-ID: <CAFMvBt1p7DHLfeiNPA=F5__kkSyW9Z8Ouhkhpg9Kptnt=R-PQA@mail.gmail.com>
Subject: Re: [meta-virtualization] breakages in go recipes
To: Martin Jansa <martin.jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000a646c5061912c68d"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 22 May 2024 22:51:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8739

--000000000000a646c5061912c68d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 4:05=E2=80=AFPM Martin Jansa <martin.jansa@gmail.co=
m> wrote:

> Hi,
>
> I can confirm that I'm seeing the same build failures since this
> morning and agree that the recipes need to adapt to:
>
> https://git.openembedded.org/openembedded-core/commit/?id=3Dcc4ec43a2b657=
fb4c58429ab14f1edc2473c1327
>
> I've started with some WIP changes and fixed some of them in:
>
> https://github.com/shr-project/meta-virtualization/commit/30a85c0319c2536=
32206b0d2c2c483f11a490939
> but than got side tracked by some other build failures and not sure
> when I'll be able to get back to it.
>
> I've also asked Bruce on IRC and he is aware of the issues, but might
> not have time to resolve it soon, so if you have the changes ready,
> then please send them to ML for Bruce to review when he has time and
> I'll happily build test them as well.
>
> Cheers,
>

Should I send a single patch fixing a bunch of recipes (aka many destsuffix
fixes at once) or one patch per recipe?

Ted Roth


>
> On Wed, May 22, 2024 at 11:52=E2=80=AFPM Theodore A. Roth via
> lists.yoctoproject.org <troth=3Dopenavr.org@lists.yoctoproject.org>
> wrote:
> >
> > Hi,
> >
> > In our CI builds for multiple projects using meta-virtualization master
> branch, we are
> > seeing some build failures for some recipes that use GO:
> >
> > * go-md2man
> > * runc-opencontainers
> > * docker-moby
> > * podman
> > * buildah
> > * cni
> >
> > I think I've narrowed the breakages down to this commit to oe-core from
> Richard Purdie:
> >
> > * https://lists.openembedded.org/g/openembedded-core/message/199614
> >
> > The fixes for our builds seem simple enough. Just add
> ';destsuffix=3D${GO_SRCURI_DESTSUFFIX}'
> > to the SRC_URI. For example:
> >
> > ---
> >
> > diff --git a/recipes-devtools/go/go-md2man_git.bb b/recipes-devtools/go=
/
> go-md2man_git.bb
> > index 1d96bb1b..73d8d167 100644
> > --- a/recipes-devtools/go/go-md2man_git.bb
> > +++ b/recipes-devtools/go/go-md2man_git.bb
> > @@ -9,7 +9,7 @@ BBCLASSEXTEND =3D "native"
> >  GO_IMPORT =3D "github.com/cpuguy83/go-md2man"
> >  #GO_INSTALL =3D "${GO_IMPORT}/bin/go-md2man"
> >
> > -SRC_URI =3D "git://${GO_IMPORT}.git;branch=3Dmaster;protocol=3Dhttps"
> > +SRC_URI =3D
> "git://${GO_IMPORT}.git;branch=3Dmaster;protocol=3Dhttps;destsuffix=3D${G=
O_SRCURI_DESTSUFFIX}"
> >
> >  SRCREV =3D "f79a8a8ca69da163eee19ab442bedad7a35bba5a"
> >  PV =3D "1.0.10+git"
> >
> > ---
> >
> > I plan to finish my testing for our breakages and submit some patches,
> but it feels like there are many
> > more recipes that will need this change made (basically anything that i=
s
> using 'inherit go').
> >
> > I'm a bit reluctant to submit patches for recipes we are not using (and
> testing) even if they seem like
> > mechanical changes, but I wanted to let the list know what I have found=
.
> >
> > Ted Roth
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#8737):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8737
> > Mute This Topic: https://lists.yoctoproject.org/mt/106252100/3617156
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000a646c5061912c68d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, May 22, 2024 at 4:05=E2=80=AFPM M=
artin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Hi,<br>
<br>
I can confirm that I&#39;m seeing the same build failures since this<br>
morning and agree that the recipes need to adapt to:<br>
<a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3Dcc4e=
c43a2b657fb4c58429ab14f1edc2473c1327" rel=3D"noreferrer" target=3D"_blank">=
https://git.openembedded.org/openembedded-core/commit/?id=3Dcc4ec43a2b657fb=
4c58429ab14f1edc2473c1327</a><br>
<br>
I&#39;ve started with some WIP changes and fixed some of them in:<br>
<a href=3D"https://github.com/shr-project/meta-virtualization/commit/30a85c=
0319c253632206b0d2c2c483f11a490939" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/shr-project/meta-virtualization/commit/30a85c0319c25363220=
6b0d2c2c483f11a490939</a><br>
but than got side tracked by some other build failures and not sure<br>
when I&#39;ll be able to get back to it.<br>
<br>
I&#39;ve also asked Bruce on IRC and he is aware of the issues, but might<b=
r>
not have time to resolve it soon, so if you have the changes ready,<br>
then please send them to ML for Bruce to review when he has time and<br>
I&#39;ll happily build test them as well.<br>
<br>
Cheers,<br></blockquote><div><br></div><div><div>Should I send a single pat=
ch fixing a bunch of recipes (aka many destsuffix fixes at once) or one pat=
ch per recipe?</div><div><br></div><div>Ted Roth</div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
On Wed, May 22, 2024 at 11:52=E2=80=AFPM Theodore A. Roth via<br>
<a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.yoctoproject.org</a> &lt;troth=3D<a href=3D"mailto:openavr.org@li=
sts.yoctoproject.org" target=3D"_blank">openavr.org@lists.yoctoproject.org<=
/a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; In our CI builds for multiple projects using meta-virtualization maste=
r branch, we are<br>
&gt; seeing some build failures for some recipes that use GO:<br>
&gt;<br>
&gt; * go-md2man<br>
&gt; * runc-opencontainers<br>
&gt; * docker-moby<br>
&gt; * podman<br>
&gt; * buildah<br>
&gt; * cni<br>
&gt;<br>
&gt; I think I&#39;ve narrowed the breakages down to this commit to oe-core=
 from Richard Purdie:<br>
&gt;<br>
&gt; * <a href=3D"https://lists.openembedded.org/g/openembedded-core/messag=
e/199614" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/g/openembedded-core/message/199614</a><br>
&gt;<br>
&gt; The fixes for our builds seem simple enough. Just add &#39;;destsuffix=
=3D${GO_SRCURI_DESTSUFFIX}&#39;<br>
&gt; to the SRC_URI. For example:<br>
&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; diff --git a/recipes-devtools/go/<a href=3D"http://go-md2man_git.bb" r=
el=3D"noreferrer" target=3D"_blank">go-md2man_git.bb</a> b/recipes-devtools=
/go/<a href=3D"http://go-md2man_git.bb" rel=3D"noreferrer" target=3D"_blank=
">go-md2man_git.bb</a><br>
&gt; index 1d96bb1b..73d8d167 100644<br>
&gt; --- a/recipes-devtools/go/<a href=3D"http://go-md2man_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">go-md2man_git.bb</a><br>
&gt; +++ b/recipes-devtools/go/<a href=3D"http://go-md2man_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">go-md2man_git.bb</a><br>
&gt; @@ -9,7 +9,7 @@ BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt;=C2=A0 GO_IMPORT =3D &quot;<a href=3D"http://github.com/cpuguy83/go-md2=
man" rel=3D"noreferrer" target=3D"_blank">github.com/cpuguy83/go-md2man</a>=
&quot;<br>
&gt;=C2=A0 #GO_INSTALL =3D &quot;${GO_IMPORT}/bin/go-md2man&quot;<br>
&gt;<br>
&gt; -SRC_URI =3D &quot;git://${GO_IMPORT}.git;branch=3Dmaster;protocol=3Dh=
ttps&quot;<br>
&gt; +SRC_URI =3D &quot;git://${GO_IMPORT}.git;branch=3Dmaster;protocol=3Dh=
ttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX}&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;f79a8a8ca69da163eee19ab442bedad7a35bba5a&quot;<=
br>
&gt;=C2=A0 PV =3D &quot;1.0.10+git&quot;<br>
&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; I plan to finish my testing for our breakages and submit some patches,=
 but it feels like there are many<br>
&gt; more recipes that will need this change made (basically anything that =
is using &#39;inherit go&#39;).<br>
&gt;<br>
&gt; I&#39;m a bit reluctant to submit patches for recipes we are not using=
 (and testing) even if they seem like<br>
&gt; mechanical changes, but I wanted to let the list know what I have foun=
d.<br>
&gt;<br>
&gt; Ted Roth<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#8737): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/8737" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/8737</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/10625210=
0/3617156" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.=
org/mt/106252100/3617156</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproje=
ct.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:martin.jansa@gmai=
l.com" target=3D"_blank">martin.jansa@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--000000000000a646c5061912c68d--

