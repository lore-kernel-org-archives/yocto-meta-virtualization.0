Return-Path: <troth@openavr.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB6E8C36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 21:28:35 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.19983.1744234114326700243
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 09 Apr 2025 14:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20230601.gappssmtp.com header.s=20230601 header.b=sFLvG+X4;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.128.175, mailfrom: troth@openavr.org)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6ff37565154so1527087b3.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 09 Apr 2025 14:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20230601.gappssmtp.com; s=20230601; t=1744234113; x=1744838913; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DhifdZRmmGEZwkbWmrUJSvGe09LU/7GdMMXWe+moqs0=;
        b=sFLvG+X456D/V0e6+qsIWN36D73pEcgmSkVuWFZz/I003KUg90KWf20yCIu2qgGyri
         50DyfRId6YK9rKPCEGmHEbq8D6RCJdWgPeKPFgLkYFnMOozLEiRZ4qr2crQ4pimkmjx6
         6ZbFEb20tTsxOzGN/WLRaoYgwcwDOY+4/e5lXQwVJ7S0rzwR6rQD3dFq4Fc8fOALg29u
         w5qObcHhTQSDxmL9AXhDIvin2BlR8aFN8fVftq2QybanO6N4pbhRSjqwMbE9ammjIzga
         uhA8hmUWZ93AFyZs9FKAlboATEwfY+GCG7coQzC+vwisXLzGy6rcQdO2wbnTnkjoI+5i
         cc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744234113; x=1744838913;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DhifdZRmmGEZwkbWmrUJSvGe09LU/7GdMMXWe+moqs0=;
        b=lDuesJ9I27QoWZsgPunqhLJQOmznAs1dOjL4yJ9t8ZgW4y7lPZs7+qOXYrGqnleK2i
         VKfMAGElR3CUcQkA0eEor2r/7qTazCoVqwyFilxiqNqLfkxeWnX34y5MeenrevTdv1TN
         +vhG42Lw/2Mekla8lbZjPCLTeUnCbK6t+MY0Dgw8mTIt51FQxbStz4xTH/f5GH6Z8uQv
         QlFG80yFMnzuDfx7hTCuDPR3Wn3MqWGSXMME9y2YUHTHFbgl2P9EKbZjHXaj+LFBQR2U
         VXiELXQYJtpH10O3hx5LlmQ6X8ctkreaa20YaukkgrjNRrZbZd3sKZQkS9BOj2oAHLmh
         wb1g==
X-Gm-Message-State: AOJu0Yy0fY880tXVjtpbhho3Vg1/4PrBmr6Snvoym+TFYu1RyaeHGZLu
	Z7Y+3VBqPQTi1Ye1nqL4q7FHoBpMCXZzLUGbYA/W60ATVhcjy6Nwaz8Kd5/Zy0N/S1ZzD39lEcN
	D4Lwnq2Z9bzWMuMSQRbqFr1LPGxsjLQw9O46P3w==
X-Gm-Gg: ASbGncuALSLBPy0PB5Ggdvnmyj2+B+EEKeX1CES0H8aKFRt6euGGEYRoUST6MH3wdFx
	dLFvWhT+xa5V/gUNtY+tnQTneOQ3GXts2xnicmPl90xW7nkJk4MpdAFqRyl+SZbvjT1XaTfWN2Z
	WrvY2PbVUQ/pru+Z8l98P0gDg=
X-Google-Smtp-Source: AGHT+IHP4RUOVulpuhXemIyZa5JzAfZIMFQl1+EWlCx7MoGcep+LU2FJTswI/KsT6944f1+6QNVLiXB1EPay7myoPOY=
X-Received: by 2002:a05:690c:6610:b0:6fb:916c:a33c with SMTP id
 00721157ae682-7054a181392mr3820467b3.34.1744234113179; Wed, 09 Apr 2025
 14:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250409150620.59558-1-troth@openavr.org> <Z_beOkjtGrcXKjlg@gmail.com>
In-Reply-To: <Z_beOkjtGrcXKjlg@gmail.com>
From: "Theodore A. Roth" <troth@openavr.org>
Date: Wed, 9 Apr 2025 15:28:21 -0600
X-Gm-Features: ATxdqUEPlX2yqOAGIHwpiG8NfNQHfn2IBp-cpO_ulRxsAQ3pkdS2PH1sJrg27hg
Message-ID: <CAFMvBt1-4dyioXMnS_cG+WwwRbFkeCfsnxBHkhMXVezHUiBi0g@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] podman: Fix QA error for invalid PACKAGECONFIG
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	"Theodore A . Roth" <theodore_roth@trimble.com>
Content-Type: multipart/alternative; boundary="000000000000b8c2cd06325f2663"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 09 Apr 2025 21:28:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9217

--000000000000b8c2cd06325f2663
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I like your fix over mine. Mine felt hacky and with your changes it doesn't
feel like the PACKAGECONFIG mechanism is being abused.

Thanks!

Ted Roth

On Wed, Apr 9, 2025 at 2:53=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmail=
.com>
wrote:

> I went a different way with this.
>
> docker shouldnt' really be a packageconfig, and rootless was adding
> an rdepends later .. when it could have just been done in a compliant
> way in the PACKAGECONFIG.
>
> Bruce
>
> In message: [meta-virtualization][PATCH] podman: Fix QA error for invalid
> PACKAGECONFIG
> on 09/04/2025 Theodore A. Roth via lists.yoctoproject.org wrote:
>
> > The insane.bbclass now flags as errors when PACKAGECONFIG contains a
> > value that does not have a setting.
> >
> > For example, setting a value like this:
> >
> >     PACKAGECONFIG +=3D "foo"
> >
> > without something like this in the recipe:
> >
> >     PACKAGECONFIG[foo] =3D "stuff"
> >
> > will result in QA errors like the following:
> >
> >     ERROR: podman-v5.4.1-r0 do_recipe_qa: QA Issue: podman:
> >            invalid PACKAGECONFIG(s): docker rootless
> [invalid-packageconfig]
> >     ERROR: podman-v5.4.1-r0 do_recipe_qa: Fatal QA errors were found,
> failing task.
> >
> > Signed-off-by: Theodore A. Roth <troth@openavr.org>
> > Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
> > ---
> >  recipes-containers/podman/podman_git.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/recipes-containers/podman/podman_git.bb
> b/recipes-containers/podman/podman_git.bb
> > index be85e512..9f886ed4 100644
> > --- a/recipes-containers/podman/podman_git.bb
> > +++ b/recipes-containers/podman/podman_git.bb
> > @@ -70,6 +70,9 @@ EXTRA_OEMAKE =3D " \
> >  # packageconfig, the podman package will rconfict with docker.
> >  PACKAGECONFIG ?=3D "docker"
> >
> > +PACKAGECONFIG[docker] ?=3D ""
> > +PACKAGECONFIG[rootless] ?=3D ""
> > +
> >  do_compile() {
> >       cd ${S}/src
> >       rm -rf .gopath
> > --
> > 2.34.1
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#9211):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9211
> > Mute This Topic: https://lists.yoctoproject.org/mt/112173803/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--000000000000b8c2cd06325f2663
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I like your fix over mine. Mine felt hacky and with y=
our changes it doesn&#39;t feel like the PACKAGECONFIG mechanism is being a=
bused.</div><div><br></div><div>Thanks!</div><div><br></div><div>Ted Roth</=
div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"=
ltr" class=3D"gmail_attr">On Wed, Apr 9, 2025 at 2:53=E2=80=AFPM Bruce Ashf=
ield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">I went a different way with this.<br>
<br>
docker shouldnt&#39; really be a packageconfig, and rootless was adding<br>
an rdepends later .. when it could have just been done in a compliant<br>
way in the PACKAGECONFIG.<br>
<br>
Bruce<br>
<br>
In message: [meta-virtualization][PATCH] podman: Fix QA error for invalid P=
ACKAGECONFIG<br>
on 09/04/2025 Theodore A. Roth via <a href=3D"http://lists.yoctoproject.org=
" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> wrote:<br=
>
<br>
&gt; The insane.bbclass now flags as errors when PACKAGECONFIG contains a<b=
r>
&gt; value that does not have a setting.<br>
&gt; <br>
&gt; For example, setting a value like this:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0PACKAGECONFIG +=3D &quot;foo&quot;<br>
&gt; <br>
&gt; without something like this in the recipe:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0PACKAGECONFIG[foo] =3D &quot;stuff&quot;<br>
&gt; <br>
&gt; will result in QA errors like the following:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: podman-v5.4.1-r0 do_recipe_qa: QA Issue: pod=
man:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 invalid PACKAGECONFIG(s): doc=
ker rootless [invalid-packageconfig]<br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: podman-v5.4.1-r0 do_recipe_qa: Fatal QA erro=
rs were found, failing task.<br>
&gt; <br>
&gt; Signed-off-by: Theodore A. Roth &lt;<a href=3D"mailto:troth@openavr.or=
g" target=3D"_blank">troth@openavr.org</a>&gt;<br>
&gt; Signed-off-by: Theodore A. Roth &lt;<a href=3D"mailto:theodore_roth@tr=
imble.com" target=3D"_blank">theodore_roth@trimble.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=
=3D"noreferrer" target=3D"_blank">podman_git.bb</a> | 3 +++<br>
&gt;=C2=A0 1 file changed, 3 insertions(+)<br>
&gt; <br>
&gt; diff --git a/recipes-containers/podman/<a href=3D"http://podman_git.bb=
" rel=3D"noreferrer" target=3D"_blank">podman_git.bb</a> b/recipes-containe=
rs/podman/<a href=3D"http://podman_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">podman_git.bb</a><br>
&gt; index be85e512..9f886ed4 100644<br>
&gt; --- a/recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=
=3D"noreferrer" target=3D"_blank">podman_git.bb</a><br>
&gt; +++ b/recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=
=3D"noreferrer" target=3D"_blank">podman_git.bb</a><br>
&gt; @@ -70,6 +70,9 @@ EXTRA_OEMAKE =3D &quot; \<br>
&gt;=C2=A0 # packageconfig, the podman package will rconfict with docker.<b=
r>
&gt;=C2=A0 PACKAGECONFIG ?=3D &quot;docker&quot;<br>
&gt;=C2=A0 <br>
&gt; +PACKAGECONFIG[docker] ?=3D &quot;&quot;<br>
&gt; +PACKAGECONFIG[rootless] ?=3D &quot;&quot;<br>
&gt; +<br>
&gt;=C2=A0 do_compile() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}/src<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf .gopath<br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#9211): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/9211" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/9211</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/11217380=
3/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.=
org/mt/112173803/1050810</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproje=
ct.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gm=
ail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div>

--000000000000b8c2cd06325f2663--

