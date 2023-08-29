Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E862C83F15
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 01:56:57 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.8642.1693274210254757825
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 18:56:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=H6YaFaLB;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-307d20548adso3192348f8f.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Aug 2023 18:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693274209; x=1693879009;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lhXQi1YpYvQUM3AcCmDyfFOdJNxFwOa+klZbtwODwS8=;
        b=H6YaFaLBtSq2YY0iXfDgx2ITU0r1HwXANV1tpfC0awS132WVjfqUn85RNwgOJpOKMK
         2NkAnKwWp2iQs08T7bWKEP020zEVOyNlV+6vvx6TRSxzx4M9V12zfh/jz/SWH2Z5NjJ2
         gUrNBMvPNmJXPCQ8lVmWVT0jbqEdEeKg3pFkEeCLttn21KFaF1G9MP492mw/Jwqlhu+J
         qAYmMsHaqqAK2JIONyxRc4adwW4JcgTrd+MiSk6PyGO+kxgahLwLqj6K+MH1jtC8kwWA
         w1pxwOfBsmScrrOvLmf4j1+n3lbKeC86qp3cVCXqRuaqpNYXM1f6rVgWHwU904vfZW/u
         5eqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693274209; x=1693879009;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lhXQi1YpYvQUM3AcCmDyfFOdJNxFwOa+klZbtwODwS8=;
        b=UDx05fzDfjAFKC1AJe/uSCUsfJejPx+yPOtq2xECOqg4DUlz4EdUwY10tfA9G+9OhH
         LAn1M7iAT7w7SquRgR42KBPGPMYromuNoYr8RCellR9N2SMRqBerDDMM31JIDzTNU+dO
         ix2YfLa3p6h7IXAR9EbNg6EkPwvhp8QmCfoICDA1KQpCvP6DheeHLCC/OfEzGzySY0jW
         KsH5+jvCYvCd8o1fQW5aERSYIZ5sAFWEqBJ/VA5up1OPg+qKcnLQfut3Fz5MTuNNJafq
         jUUeSlzlpNeRaZ+TltsshAfuLcekBKHtP20gwjU1wrO2O4vPdi7zuXAYUegqCB3urxaf
         KzSA==
X-Gm-Message-State: AOJu0Yw0d48FzyItPOxRXRvCjx3Rf7s8CYrPiQisEvwKxxB0ma9VkU3p
	Ls7tRnurU9UpGrYKn/PxgRi074sFNoil6m4VaL4=
X-Google-Smtp-Source: AGHT+IGJqeF3ND4b1qGDXqKTvDEtq5FKxU74MwhV3aywbuuz7Yv+z415uInmehljPCYfme16GmNLrqqhy/BawMTLFRY=
X-Received: by 2002:a5d:46cd:0:b0:317:5c36:913b with SMTP id
 g13-20020a5d46cd000000b003175c36913bmr19216114wrs.48.1693274208392; Mon, 28
 Aug 2023 18:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230828220710.2689454-1-Martin.Jansa@gmail.com> <CADkTA4PGWLMN4J8xxmiHzYA7gdWa9UVGK5PgHJHBqvKKCBx0uQ@mail.gmail.com>
In-Reply-To: <CADkTA4PGWLMN4J8xxmiHzYA7gdWa9UVGK5PgHJHBqvKKCBx0uQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 29 Aug 2023 03:56:27 +0200
Message-ID: <CA+chaQcTkyg8pXB0n4LOWORAimASf2Qt45x_E3VkJ+KDFNrGag@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] go-mux: Switch to main branch
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000b2d8c30604061f06"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Aug 2023 01:56:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8254

--000000000000b2d8c30604061f06
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 29, 2023 at 3:50=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gmai=
l.com>
wrote:

> We've got this one already queued on master-next.
>

Sorry somehow I've overlooked this one and seen only the go-context, but
you're right of course.


> While I'm on holidays, I'm holding most patches out of master until I
> can be around to deal with issues.
>

Ack.

When back please cherry-pick both go-mux and go-context branch changes to
kirkstone and mickledore as well.

Cheers,


> Bruce
>
> On Mon, Aug 28, 2023 at 6:07=E2=80=AFPM Martin Jansa <Martin.Jansa@gmail.=
com>
> wrote:
> >
> > The project has renamed the master branch to main.
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  recipes-devtools/go/go-mux_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/recipes-devtools/go/go-mux_git.bb b/recipes-devtools/go/
> go-mux_git.bb
> > index 3f939f4..fb4502b 100644
> > --- a/recipes-devtools/go/go-mux_git.bb
> > +++ b/recipes-devtools/go/go-mux_git.bb
> > @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Dc50f6bd9c1e15ed0bad3bea18e3c1b7f"
> >  SRCNAME =3D "mux"
> >
> >  PKG_NAME =3D "github.com/gorilla/${SRCNAME}
> <http://github.com/gorilla/$%7BSRCNAME%7D>"
> > -SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmaster;protocol=3Dhttps"
> > +SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmain;protocol=3Dhttps"
> >
> >  SRCREV =3D "136d54f81f00414c45c3c68dd47e98cc97519c5e"
> >
> > --
> > 2.42.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#8251):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8251
> > Mute This Topic: https://lists.yoctoproject.org/mt/101020201/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--000000000000b2d8c30604061f06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Aug 29, 2023 at 3:50=E2=80=AFAM B=
ruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfiel=
d@gmail.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">We&#39;ve got this one already queued=
 on master-next.<br></blockquote><div><br></div><div>Sorry somehow I&#39;ve=
 overlooked this one and seen only the go-context, but you&#39;re right of =
course.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
While I&#39;m on holidays, I&#39;m holding most patches out of master until=
 I<br>
can be around to deal with issues.<br></blockquote><div><br></div><div>Ack.=
</div><div><br></div><div>When back please cherry-pick both go-mux and go-c=
ontext branch changes to kirkstone and mickledore as well.</div><div><br></=
div><div>Cheers,</div><div><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><br>
Bruce<br>
<br>
On Mon, Aug 28, 2023 at 6:07=E2=80=AFPM Martin Jansa &lt;<a href=3D"mailto:=
Martin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; The project has renamed the master branch to main.<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 recipes-devtools/go/<a href=3D"http://go-mux_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">go-mux_git.bb</a> | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/recipes-devtools/go/<a href=3D"http://go-mux_git.bb" rel=
=3D"noreferrer" target=3D"_blank">go-mux_git.bb</a> b/recipes-devtools/go/<=
a href=3D"http://go-mux_git.bb" rel=3D"noreferrer" target=3D"_blank">go-mux=
_git.bb</a><br>
&gt; index 3f939f4..fb4502b 100644<br>
&gt; --- a/recipes-devtools/go/<a href=3D"http://go-mux_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">go-mux_git.bb</a><br>
&gt; +++ b/recipes-devtools/go/<a href=3D"http://go-mux_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">go-mux_git.bb</a><br>
&gt; @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dc50f6b=
d9c1e15ed0bad3bea18e3c1b7f&quot;<br>
&gt;=C2=A0 SRCNAME =3D &quot;mux&quot;<br>
&gt;<br>
&gt;=C2=A0 PKG_NAME =3D &quot;<a href=3D"http://github.com/gorilla/$%7BSRCN=
AME%7D" rel=3D"noreferrer" target=3D"_blank">github.com/gorilla/${SRCNAME}<=
/a>&quot;<br>
&gt; -SRC_URI =3D &quot;git://${PKG_NAME}.git;branch=3Dmaster;protocol=3Dht=
tps&quot;<br>
&gt; +SRC_URI =3D &quot;git://${PKG_NAME}.git;branch=3Dmain;protocol=3Dhttp=
s&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;136d54f81f00414c45c3c68dd47e98cc97519c5e&quot;<=
br>
&gt;<br>
&gt; --<br>
&gt; 2.42.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#8251): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/8251" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/8251</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/10102020=
1/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.=
org/mt/101020201/1050810</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproje=
ct.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gm=
ail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div></div>

--000000000000b2d8c30604061f06--

