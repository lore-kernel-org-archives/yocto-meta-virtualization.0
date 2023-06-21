Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3972FEB64D8
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 13:42:27 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.10889.1687354943957569695
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 21 Jun 2023 06:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=A6Wqpye6;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3113306a595so4806476f8f.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 21 Jun 2023 06:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687354942; x=1689946942;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3G4dUaDqYDqbFutMTC7tFUoYRmddDsTrjFYSBBlMP4c=;
        b=A6Wqpye6ThWNelwI4OBP5Wv/RNWrzvVrriCDLifZ2XJPdj1apIlJEuc2zjhwt0caCJ
         S5PEwzXvUWRPW6Wde1nQd/PCj6Y+aqXECTyDbeFwfKjEtKPtpkAWb3qAVZmAubaRTpIl
         gxbX5FplPMvONPxG0rtnPoEX+FVVdzLlCyBFROmend1cpTe5v91x5eiuAW7LzM8f6jPr
         GGCtiu2XOG4abDdDyEcY2ZM12FWuklZxiAWXGLX5OxnkHIM0HkUDJrWS2/QCahQjlJrg
         JSL673AXhvmIDGFHbLTNL9gKo/XWRpNtiOcjFcjxzfJRqiXPhp53yaR3zdL4znkVJm5J
         H6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687354942; x=1689946942;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3G4dUaDqYDqbFutMTC7tFUoYRmddDsTrjFYSBBlMP4c=;
        b=hJBKTmcw0GBzvTKKln3I74X9Lb9CfIJpCobIfMScPMNarjdfqd1lI2hzkyfwFC2PtA
         m+u90NGHPhVIaJWkmZ0kjQNubnN5k+tKvmJDJLFOZTnP1bxIaJ/vfqoqVfImGVv5iWg+
         GNg0pMWy6LZqNGZYzamuWpgTSfDNl0X70ACgofybS64u6Ki1OFYIz8pmcPISoLl6jTtv
         B6SI7n3H5ukvI+S3rzk2mm+KmdJjlqgHuRkNxeceEqyaiVmKNB7mLHNf57eXepzTtpJP
         mi8cW5y8meek3m3tEKglkn4X4KOnzKRfNdFAJQArMqlDWvAAoFSRJ0jHKTwaiwyWTJA/
         N4LA==
X-Gm-Message-State: AC+VfDwi9+hPKDQtvnz0VukEmO/qNpMKH2IlfWdbkzERKObJMRzmiSS9
	Bw+RS2u5ScDgHZK9ftIwFjQa4cfqCsIHmCT+qGo=
X-Google-Smtp-Source: ACHHUZ75VmVo3RT7NWBnR1XtGz0AyzJr4poobggOYvxZfkmoOGDH2CFlFn8ARAnk2FF5JQ+ACtpNIxkwVickQaqEdLY=
X-Received: by 2002:a5d:538b:0:b0:30a:b3c4:3b8d with SMTP id
 d11-20020a5d538b000000b0030ab3c43b8dmr14962360wrv.41.1687354942141; Wed, 21
 Jun 2023 06:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230621104656.2149899-1-Martin.Jansa@gmail.com> <CADkTA4M=ies0HM87uXrwj2vWFU0SiQp3MRb74=z=fnLT7eHOMQ@mail.gmail.com>
In-Reply-To: <CADkTA4M=ies0HM87uXrwj2vWFU0SiQp3MRb74=z=fnLT7eHOMQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 21 Jun 2023 15:42:02 +0200
Message-ID: <CA+chaQfgmuP-WdxPmAGamT6O58CbfF6VCL17v4zCMK4F3Nt8hg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] netavark, xen: *.patch: add
 Upstream-Status to all patches
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000efb9e605fea3ef86"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 21 Jun 2023 13:42:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8103

--000000000000efb9e605fea3ef86
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2023 at 2:57=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com>
wrote:

> On Wed, Jun 21, 2023 at 6:47=E2=80=AFAM Martin Jansa <Martin.Jansa@gmail.=
com>
> wrote:
> >
> > There is new patch-status QA check in oe-core:
> >
> https://git.openembedded.org/openembedded-core/commit/?id=3D76a685bfcf927=
593eac67157762a53259089ea8a
> >
> > This is temporary work around just to hide _many_ warnings from
> > optional patch-status (if you add it to WARN_QA).
> >
> > This just added
> > Upstream-Status: Pending
> > everywhere without actually investigating what's the proper status.
> >
> > This is just to hide current QA warnings and to catch new .patch files
> being
> > added without Upstream-Status, but the number of Pending patches is now=
:
>
> Pending is fine.
>
> I have no intention of doing anything more with the warning fixup
> (since my opinion on forcing ths on non-core layers and documenting it
> within the patches themselves is well documented :)
>

That's fine with me. I'm even willing to send further Upstream-Status fixes
if I spot new ones in my world build (now I've enabled patch-status in
ERROR_QA globally instead of just for oe-core recipes, so that I don't need
to explicitly list the layers I regularly use in some of my builds)

Acked-By: Martin Jansa <Martin.Jansa@gmail.com>

:)


> Bruce
>
> >
> > Patches in Pending state: 15 (11%)
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  recipes-containers/netavark/files/tests.patch                   | 2 ++
> >  .../xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.18.patch  | 2 ++
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/recipes-containers/netavark/files/tests.patch
> b/recipes-containers/netavark/files/tests.patch
> > index 254e4e9..c4b3618 100644
> > --- a/recipes-containers/netavark/files/tests.patch
> > +++ b/recipes-containers/netavark/files/tests.patch
> > @@ -1,3 +1,5 @@
> > +Upstream-Status: Pending
> > +
> >  diff --git a/test/helpers.bash b/test/helpers.bash
> >  index 89866ec..017b2b5 100644
> >  --- a/test/helpers.bash
> > diff --git
> a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.18.p=
atch
> b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.18.p=
atch
> > index 3c7a97d..7ac1a39 100644
> > ---
> a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.18.p=
atch
> > +++
> b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.18.p=
atch
> > @@ -1,3 +1,5 @@
> > +Upstream-Status: Pending
> > +
> >  diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
> >  index 4963bc89c6..c1c05eb421 100644
> >  --- a/tools/pygrub/Makefile
> > --
> > 2.41.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#8099):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8099
> > Mute This Topic: https://lists.yoctoproject.org/mt/99673711/1050810
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

--000000000000efb9e605fea3ef86
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Jun 21, 2023 at 2:57=E2=80=AFPM B=
ruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfiel=
d@gmail.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Wed, Jun 21, 2023 at 6:47=E2=80=AF=
AM Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_bl=
ank">Martin.Jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; There is new patch-status QA check in oe-core:<br>
&gt; <a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=
=3D76a685bfcf927593eac67157762a53259089ea8a" rel=3D"noreferrer" target=3D"_=
blank">https://git.openembedded.org/openembedded-core/commit/?id=3D76a685bf=
cf927593eac67157762a53259089ea8a</a><br>
&gt;<br>
&gt; This is temporary work around just to hide _many_ warnings from<br>
&gt; optional patch-status (if you add it to WARN_QA).<br>
&gt;<br>
&gt; This just added<br>
&gt; Upstream-Status: Pending<br>
&gt; everywhere without actually investigating what&#39;s the proper status=
.<br>
&gt;<br>
&gt; This is just to hide current QA warnings and to catch new .patch files=
 being<br>
&gt; added without Upstream-Status, but the number of Pending patches is no=
w:<br>
<br>
Pending is fine.<br>
<br>
I have no intention of doing anything more with the warning fixup<br>
(since my opinion on forcing ths on non-core layers and documenting it<br>
within the patches themselves is well documented :)<br></blockquote><div><b=
r></div><div>That&#39;s fine with me. I&#39;m even willing to send further =
Upstream-Status fixes if I spot new ones in my world build (now I&#39;ve en=
abled patch-status in ERROR_QA globally instead of just for oe-core recipes=
, so that I don&#39;t need to explicitly list the layers I regularly use in=
 some of my builds)</div><div><br></div><div>Acked-By: Martin Jansa &lt;<a =
href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail=
.com</a>&gt;</div><div><br></div><div>:)</div><div><br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
Bruce<br>
<br>
&gt;<br>
&gt; Patches in Pending state: 15 (11%)<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 recipes-containers/netavark/files/tests.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
&gt;=C2=A0 .../xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.18.patch=
=C2=A0 | 2 ++<br>
&gt;=C2=A0 2 files changed, 4 insertions(+)<br>
&gt;<br>
&gt; diff --git a/recipes-containers/netavark/files/tests.patch b/recipes-c=
ontainers/netavark/files/tests.patch<br>
&gt; index 254e4e9..c4b3618 100644<br>
&gt; --- a/recipes-containers/netavark/files/tests.patch<br>
&gt; +++ b/recipes-containers/netavark/files/tests.patch<br>
&gt; @@ -1,3 +1,5 @@<br>
&gt; +Upstream-Status: Pending<br>
&gt; +<br>
&gt;=C2=A0 diff --git a/test/helpers.bash b/test/helpers.bash<br>
&gt;=C2=A0 index 89866ec..017b2b5 100644<br>
&gt;=C2=A0 --- a/test/helpers.bash<br>
&gt; diff --git a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUT=
ILS-xen-4.18.patch b/recipes-extended/xen/files/0001-python-pygrub-pass-DIS=
TUTILS-xen-4.18.patch<br>
&gt; index 3c7a97d..7ac1a39 100644<br>
&gt; --- a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen=
-4.18.patch<br>
&gt; +++ b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen=
-4.18.patch<br>
&gt; @@ -1,3 +1,5 @@<br>
&gt; +Upstream-Status: Pending<br>
&gt; +<br>
&gt;=C2=A0 diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile<br>
&gt;=C2=A0 index 4963bc89c6..c1c05eb421 100644<br>
&gt;=C2=A0 --- a/tools/pygrub/Makefile<br>
&gt; --<br>
&gt; 2.41.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#8099): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/8099" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/8099</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/99673711=
/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg/mt/99673711/1050810</a><br>
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

--000000000000efb9e605fea3ef86--

