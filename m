Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACBAAE7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 15:09:10 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.12534.1733843347658465260
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Dec 2024 07:09:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qti7o+4V;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-725ecc42d43so1828441b3a.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Dec 2024 07:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733843347; x=1734448147; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1dWZoIWbylYKK+GsPr15UkHrnV9qO2z7MwhlfpYdCX0=;
        b=Qti7o+4VB0j4NHvn33bA4MWAr9Otk7+8rbVL8RRaCK+rja3A8l/NVSIy4STYlFwrzT
         LDjSwkq+ci5WD8mC7DTXQzcTMOB40nT0Z5ube2hVoG9AmaWsRU1mS2X9YZGTyQV0Z1V+
         cGXPAuuhd1u8gy5MUDrsJTkD7/LTBlPUpkkVKZkWm1Nbd6m678M7i4bbbPG6D0uDOyKV
         437i1a99iQrg0nFPWVg6nKES5FQ8jeJTo4WCCVdVUtfpro2yKFONS9YWP3k14hINw6I6
         hoPklKhpEqMwBOp30TCtLplRGQNgj8wOcb+8Fa5KJlBYMrtAM8Rq68nmKhLDdjuX3bqX
         U/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733843347; x=1734448147;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1dWZoIWbylYKK+GsPr15UkHrnV9qO2z7MwhlfpYdCX0=;
        b=FRqZE208Pir8Z0qWxga8t6N+reWxBb+Y/X5VXysyRjZSjhN6Zx0dg/uli3uNubKADj
         S6NRip/jO89E5xYZhdl9zSPG1xbWZkAA9BhvWfA6aJ4GvJgUDAKbSIMtFJ+ePCdBJYhp
         gqZHAOzTYgP830tPDyCeS/2YAwBN2QCxU0cv0MyDQhhHuiQze3qFNJFhDmzyGZT5OXbY
         X1UJN3/o50aI7KnoyCnLK9tWNGL3Mu0pGBH5vFsnSp/WBx9hxjUGfAsssgfshAMdmcVk
         686oiCvv/r3RidaSn9CMF2XUXofIR3UHH4ygGVEb2aCcYOtL6WrpGECV87orCRtHOUxh
         QHCA==
X-Forwarded-Encrypted: i=1; AJvYcCWr+92SxxXTDR8GEY/6BRboAdZGxZ0S+D2mlkkMDSDHN1rF3d9k8yjL4VRDGf+BiTUP+cItiKOhOOn3MqSRrf0DylPe@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxxSojGsKKi5SzvPDBnR+QamKSsQ6ZDZkyf6Qaeu+IDTBreSnnT
	y1qIT/dp0jQyexFls2X2ofDS+O7vpxmQ7riOoyVJszGm0XnT9tsxgV65FYbIHMCu7ZIiIDnoVLd
	h37bYqh+HL5vPPH5zePnXNAZvLxI=
X-Gm-Gg: ASbGncst2Bn4oK7ru/6MHEk1BoQyJr/IfsEPLTxyMR6s2vGO6QjKT91qh7iL4YIM0j5
	TQhItYNV8BkTHmkfp6kmotOdAUYErp0tDIfs=
X-Google-Smtp-Source: AGHT+IFfaGOEsktqssd9F0oUhIPwJqe1j3eSilmaB/EvtQuXTaBTlnRYpQBStai7L5PuZvifgaPQP5YCVEPc60BVn+0=
X-Received: by 2002:a05:6a00:1c8a:b0:727:3cd0:112b with SMTP id
 d2e1a72fcca58-7273cd011d1mr5963074b3a.9.1733843346776; Tue, 10 Dec 2024
 07:09:06 -0800 (PST)
MIME-Version: 1.0
References: <20241128030717.3733955-1-changqing.li@windriver.com>
 <Z1e4CmoAbU4/LkOK@gmail.com> <CA+chaQdn5=FCZ1ovLvK=c0ZJ+gmt=swGO0de5B5x3E=ZK=KP6A@mail.gmail.com>
 <CADkTA4N59Y1j6qNdcPcy8PYs5-YNcZi3VvBHkcr9gdEAP-s3Lw@mail.gmail.com> <CA+chaQczR3owuG9HJ1Ht6Rujd6iYpQtEdHkEHworSe5QniuCaQ@mail.gmail.com>
In-Reply-To: <CA+chaQczR3owuG9HJ1Ht6Rujd6iYpQtEdHkEHworSe5QniuCaQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 Dec 2024 10:08:54 -0500
Message-ID: <CADkTA4M9HvnCrU+H05Q40H9mE8A2w9FnHkzQnUd1i5Qg+gtvdw@mail.gmail.com>
Subject: Re: [meta-virtualization] [kirkstone][PATCH] nagios-plugins: fix CVE-2023-37154
To: Martin Jansa <martin.jansa@gmail.com>
Cc: changqing.li@windriver.com, meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000c7eacc0628ebdc91"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Dec 2024 15:09:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9057

--000000000000c7eacc0628ebdc91
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 9:20=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:

> Looks like most of that .patch file ended in the commit message, but
> the patch looks ok to me, so not sure what happened.
>

My scripts/utilities that save patches to mbox just can't deal with that
message.

I tried a new save. Same result. Hopefully this is a one-off formatting
issue, or
I'm going to need to modify my scripts.

I manually saved the patch, and it looks ok now. So the branch should now
build again.

Bruce


> On Tue, Dec 10, 2024 at 3:01=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gm=
ail.com>
> wrote:
> >
> > odd. I don't even have any refuse sitting around in my merge directory.
> >
> > I'll revert and re-apply.
> >
> > Bruce
> >
> > On Tue, Dec 10, 2024 at 3:21=E2=80=AFAM Martin Jansa <martin.jansa@gmai=
l.com>
> wrote:
> >>
> >> Something went wrong when applying this in kirkstone and
> >> recipes-extended/nagios/nagios-plugins/CVE-2023-37154.patch doesn't
> >> exist.
> >>
> >> On Tue, Dec 10, 2024 at 4:39=E2=80=AFAM Bruce Ashfield via
> >> lists.yoctoproject.org
> >> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >> >
> >> > merged.
> >> >
> >> > Bruce
> >> >
> >> > In message: [meta-virtualization] [kirkstone][PATCH] nagios-plugins:
> fix CVE-2023-37154
> >> > on 28/11/2024 Changqing Li via lists.yoctoproject.org wrote:
> >> >
> >> > > From: Changqing Li <changqing.li@windriver.com>
> >> > >
> >> > > CVE-2023-37154:
> >> > > check_by_ssh in Nagios nagios-plugins 2.4.5 allows arbitrary
> command execution
> >> > > via ProxyCommand, LocalCommand, and PermitLocalCommand with
> \${IFS}. This has
> >> > > been categorized both as fixed in e8810de, and as intended behavio=
r.
> >> > >
> >> > > Refer:
> >> > > https://nvd.nist.gov/vuln/detail/CVE-2023-37154
> >> > >
> >> > > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> >> > > ---
> >> > >  .../nagios-plugins/CVE-2023-37154.patch       | 69
> +++++++++++++++++++
> >> > >  .../nagios/nagios-plugins_2.2.1.bb            |  1 +
> >> > >  2 files changed, 70 insertions(+)
> >> > >  create mode 100644
> recipes-extended/nagios/nagios-plugins/CVE-2023-37154.patch
> >> > >
> >> > > diff --git
> a/recipes-extended/nagios/nagios-plugins/CVE-2023-37154.patch
> b/recipes-extended/nagios/nagios-plugins/CVE-2023-37154.patch
> >> > > new file mode 100644
> >> > > index 00000000..436bba42
> >> > > --- /dev/null
> >> > > +++ b/recipes-extended/nagios/nagios-plugins/CVE-2023-37154.patch
> >> > > @@ -0,0 +1,69 @@
> >> > > +From 7f07a9e89373d5906c2b6a9eee0e74cf69f302c1 Mon Sep 17 00:00:00
> 2001
> >> > > +From: Sebastian Wolf <swolf@nagios.com>
> >> > > +Date: Wed, 31 May 2023 16:43:54 -0400
> >> > > +Subject: [PATCH] check_by_ssh: Prevent users from using several
> SSH options
> >> > > + which run local commands.
> >> > > +
> >> > > +CVE: CVE-2023-37154
> >> > > +Upstream-Status: Backport [
> https://github.com/nagios-plugins/nagios-plugins/commit/e8810de21be801485=
62b7e0168b0a62aeedffde6
> ]
> >> > > +
> >> > > +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> >> > > +---
> >> > > + configure.ac           | 10 ++++++++++
> >> > > + plugins/check_by_ssh.c | 12 +++++++++++-
> >> > > + 2 files changed, 21 insertions(+), 1 deletion(-)
> >> > > +
> >> > > +diff --git a/configure.ac b/configure.ac
> >> > > +index 963514a..236d233 100644
> >> > > +--- a/configure.ac
> >> > > ++++ b/configure.ac
> >> > > +@@ -418,6 +418,16 @@ then
> >> > > +             [path and arguments for invoking 'who'])
> >> > > + fi
> >> > > +
> >> > > ++AC_ARG_WITH(unrestricted_ssh_options,
> >> > > ++    [AS_HELP_STRING([--with-unrestricted-ssh-options],
> >> > > ++            [allow any SSH options to be used with
> check_by_ssh])],
> >> > > ++    [],
> >> > > ++    [unrestricted_ssh_options=3Dno])
> >> > > ++
> >> > > ++if test "x$with_unrestricted_ssh_options" =3D xyes ; then
> >> > > ++    AC_DEFINE(HAVE_UNRESTRICTED_SSH_OPTIONS,[1],[Allow SSH to us=
e
> options that run local commands.])
> >> > > ++fi
> >> > > ++
> >> > > + AC_ARG_WITH([ipv6],
> >> > > +     [AS_HELP_STRING([--with-ipv6], [support IPv6
> @<:@default=3Dcheck@:>@])],
> >> > > +     [], [with_ipv6=3Dcheck])
> >> > > +diff --git a/plugins/check_by_ssh.c b/plugins/check_by_ssh.c
> >> > > +index b6f3130..6cc6c7a 100644
> >> > > +--- a/plugins/check_by_ssh.c
> >> > > ++++ b/plugins/check_by_ssh.c
> >> > > +@@ -27,7 +27,7 @@
> >> > > +
> *************************************************************************=
****/
> >> > > +
> >> > > + const char *progname =3D "check_by_ssh";
> >> > > +-const char *copyright =3D "2000-2014";
> >> > > ++const char *copyright =3D "2000-";
> >> > > + const char *email =3D "devel@nagios-plugins.org";
> >> > > +
> >> > > + #include "common.h"
> >> > > +@@ -299,6 +299,16 @@ process_arguments (int argc, char **argv)
> >> > > +                             skip_stderr =3D atoi (optarg);
> >> > > +                     break;
> >> > > +             case 'o':
>                            /* Extra options for the ssh command */
> >> > > ++
> >> > > ++                    /* Don't allow the user to run commands loca=
l
> to the nagios server, unless they decide otherwise at compile time. */
> >> > > ++#ifndef HAVE_UNRESTRICTED_SSH_OPTIONS
> >> > > ++                    if (   strcasestr(optarg, "ProxyCommand") !=
=3D
> NULL
> >> > > ++                            || strcasestr(optarg,
> "PermitLocalCommand") !=3D NULL
> >> > > ++                            || strcasestr(optarg, "LocalCommand"=
)
> !=3D NULL) {
> >> > > ++                            break;
> >> > > ++                    }
> >> > > ++#endif
> >> > > ++
> >> > > +                     comm_append("-o");
> >> > > +                     comm_append(optarg);
> >> > > +                     break;
> >> > > +--
> >> > > +2.23.0
> >> > > +
> >> > > diff --git a/recipes-extended/nagios/nagios-plugins_2.2.1.bb
> b/recipes-extended/nagios/nagios-plugins_2.2.1.bb
> >> > > index 471d4b42..cd89b329 100644
> >> > > --- a/recipes-extended/nagios/nagios-plugins_2.2.1.bb
> >> > > +++ b/recipes-extended/nagios/nagios-plugins_2.2.1.bb
> >> > > @@ -9,6 +9,7 @@ LICENSE =3D "GPL-3.0-only"
> >> > >  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504"
> >> > >
> >> > >  SRC_URI =3D "
> https://www.nagios-plugins.org/download/${BPN}-${PV}.tar.gz \
> >> > > +           file://CVE-2023-37154.patch \
> >> > >  "
> >> > >
> >> > >  SRC_URI[md5sum] =3D "fb521d5c05897f165b0b1862c1e5cb27"
> >> > > --
> >> > > 2.25.1
> >> > >
> >> >
> >> > >
> >> > >
> >> > >
> >> >
> >> >
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> > Links: You receive all messages sent to this group.
> >> > View/Reply Online (#9049):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9049
> >> > Mute This Topic: https://lists.yoctoproject.org/mt/109817333/3617156
> >> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> >> > Unsubscribe:
> https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> martin.jansa@gmail.com]
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000c7eacc0628ebdc91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 10, 2024 at 9:20=
=E2=80=AFAM Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">mart=
in.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Looks like most of that .patch file ended in the commit m=
essage, but<br>
the patch looks ok to me, so not sure what happened.<br></blockquote><div><=
br></div><div><div class=3D"gmail_default" style=3D"font-size:small">My scr=
ipts/utilities that save patches to mbox just can&#39;t deal with that mess=
age.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">I tried a new save. =
Same result. Hopefully this is a one-off formatting issue, or</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">I&#39;m going to need to mod=
ify my scripts.</div><div class=3D"gmail_default" style=3D"font-size:small"=
><br></div><div class=3D"gmail_default" style=3D"font-size:small">I manuall=
y saved the patch, and it looks ok now. So the branch should now</div><div =
class=3D"gmail_default" style=3D"font-size:small">build again.</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gma=
il_default" style=3D"font-size:small">Bruce</div></div><div><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
On Tue, Dec 10, 2024 at 3:01=E2=80=AFPM Bruce Ashfield &lt;<a href=3D"mailt=
o:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&=
gt; wrote:<br>
&gt;<br>
&gt; odd. I don&#39;t even have any refuse sitting around in my merge direc=
tory.<br>
&gt;<br>
&gt; I&#39;ll revert and re-apply.<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt; On Tue, Dec 10, 2024 at 3:21=E2=80=AFAM Martin Jansa &lt;<a href=3D"ma=
ilto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&g=
t; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Something went wrong when applying this in kirkstone and<br>
&gt;&gt; recipes-extended/nagios/nagios-plugins/CVE-2023-37154.patch doesn&=
#39;t<br>
&gt;&gt; exist.<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Dec 10, 2024 at 4:39=E2=80=AFAM Bruce Ashfield via<br>
&gt;&gt; <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" targe=
t=3D"_blank">lists.yoctoproject.org</a><br>
&gt;&gt; &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoctoprojec=
t.org" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br=
>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; merged.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Bruce<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; In message: [meta-virtualization] [kirkstone][PATCH] nagios-p=
lugins: fix CVE-2023-37154<br>
&gt;&gt; &gt; on 28/11/2024 Changqing Li via <a href=3D"http://lists.yoctop=
roject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a>=
 wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt; From: Changqing Li &lt;<a href=3D"mailto:changqing.li@wi=
ndriver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; CVE-2023-37154:<br>
&gt;&gt; &gt; &gt; check_by_ssh in Nagios nagios-plugins 2.4.5 allows arbit=
rary command execution<br>
&gt;&gt; &gt; &gt; via ProxyCommand, LocalCommand, and PermitLocalCommand w=
ith \${IFS}. This has<br>
&gt;&gt; &gt; &gt; been categorized both as fixed in e8810de, and as intend=
ed behavior.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Refer:<br>
&gt;&gt; &gt; &gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-371=
54" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/C=
VE-2023-37154</a><br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changq=
ing.li@windriver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<=
br>
&gt;&gt; &gt; &gt; ---<br>
&gt;&gt; &gt; &gt;=C2=A0 .../nagios-plugins/CVE-2023-37154.patch=C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 69 +++++++++++++++++++<br>
&gt;&gt; &gt; &gt;=C2=A0 .../nagios/<a href=3D"http://nagios-plugins_2.2.1.=
bb" rel=3D"noreferrer" target=3D"_blank">nagios-plugins_2.2.1.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;&gt; &gt; &gt;=C2=A0 2 files changed, 70 insertions(+)<br>
&gt;&gt; &gt; &gt;=C2=A0 create mode 100644 recipes-extended/nagios/nagios-=
plugins/CVE-2023-37154.patch<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; diff --git a/recipes-extended/nagios/nagios-plugins/CVE-=
2023-37154.patch b/recipes-extended/nagios/nagios-plugins/CVE-2023-37154.pa=
tch<br>
&gt;&gt; &gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; &gt; index 00000000..436bba42<br>
&gt;&gt; &gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; &gt; +++ b/recipes-extended/nagios/nagios-plugins/CVE-2023-37=
154.patch<br>
&gt;&gt; &gt; &gt; @@ -0,0 +1,69 @@<br>
&gt;&gt; &gt; &gt; +From 7f07a9e89373d5906c2b6a9eee0e74cf69f302c1 Mon Sep 1=
7 00:00:00 2001<br>
&gt;&gt; &gt; &gt; +From: Sebastian Wolf &lt;<a href=3D"mailto:swolf@nagios=
.com" target=3D"_blank">swolf@nagios.com</a>&gt;<br>
&gt;&gt; &gt; &gt; +Date: Wed, 31 May 2023 16:43:54 -0400<br>
&gt;&gt; &gt; &gt; +Subject: [PATCH] check_by_ssh: Prevent users from using=
 several SSH options<br>
&gt;&gt; &gt; &gt; + which run local commands.<br>
&gt;&gt; &gt; &gt; +<br>
&gt;&gt; &gt; &gt; +CVE: CVE-2023-37154<br>
&gt;&gt; &gt; &gt; +Upstream-Status: Backport [<a href=3D"https://github.co=
m/nagios-plugins/nagios-plugins/commit/e8810de21be80148562b7e0168b0a62aeedf=
fde6" rel=3D"noreferrer" target=3D"_blank">https://github.com/nagios-plugin=
s/nagios-plugins/commit/e8810de21be80148562b7e0168b0a62aeedffde6</a>]<br>
&gt;&gt; &gt; &gt; +<br>
&gt;&gt; &gt; &gt; +Signed-off-by: Changqing Li &lt;<a href=3D"mailto:chang=
qing.li@windriver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;=
<br>
&gt;&gt; &gt; &gt; +---<br>
&gt;&gt; &gt; &gt; + <a href=3D"http://configure.ac" rel=3D"noreferrer" tar=
get=3D"_blank">configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
0 ++++++++++<br>
&gt;&gt; &gt; &gt; + plugins/check_by_ssh.c | 12 +++++++++++-<br>
&gt;&gt; &gt; &gt; + 2 files changed, 21 insertions(+), 1 deletion(-)<br>
&gt;&gt; &gt; &gt; +<br>
&gt;&gt; &gt; &gt; +diff --git a/<a href=3D"http://configure.ac" rel=3D"nor=
eferrer" target=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.a=
c" rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt;&gt; &gt; &gt; +index 963514a..236d233 100644<br>
&gt;&gt; &gt; &gt; +--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer=
" target=3D"_blank">configure.ac</a><br>
&gt;&gt; &gt; &gt; ++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer=
" target=3D"_blank">configure.ac</a><br>
&gt;&gt; &gt; &gt; +@@ -418,6 +418,16 @@ then<br>
&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[path a=
nd arguments for invoking &#39;who&#39;])<br>
&gt;&gt; &gt; &gt; + fi<br>
&gt;&gt; &gt; &gt; +<br>
&gt;&gt; &gt; &gt; ++AC_ARG_WITH(unrestricted_ssh_options,<br>
&gt;&gt; &gt; &gt; ++=C2=A0 =C2=A0 [AS_HELP_STRING([--with-unrestricted-ssh=
-options],<br>
&gt;&gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [allow any S=
SH options to be used with check_by_ssh])],<br>
&gt;&gt; &gt; &gt; ++=C2=A0 =C2=A0 [],<br>
&gt;&gt; &gt; &gt; ++=C2=A0 =C2=A0 [unrestricted_ssh_options=3Dno])<br>
&gt;&gt; &gt; &gt; ++<br>
&gt;&gt; &gt; &gt; ++if test &quot;x$with_unrestricted_ssh_options&quot; =
=3D xyes ; then<br>
&gt;&gt; &gt; &gt; ++=C2=A0 =C2=A0 AC_DEFINE(HAVE_UNRESTRICTED_SSH_OPTIONS,=
[1],[Allow SSH to use options that run local commands.])<br>
&gt;&gt; &gt; &gt; ++fi<br>
&gt;&gt; &gt; &gt; ++<br>
&gt;&gt; &gt; &gt; + AC_ARG_WITH([ipv6],<br>
&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0[AS_HELP_STRING([--with-ipv6], [sup=
port IPv6 @&lt;:@default=3Dcheck@:&gt;@])],<br>
&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0[], [with_ipv6=3Dcheck])<br>
&gt;&gt; &gt; &gt; +diff --git a/plugins/check_by_ssh.c b/plugins/check_by_=
ssh.c<br>
&gt;&gt; &gt; &gt; +index b6f3130..6cc6c7a 100644<br>
&gt;&gt; &gt; &gt; +--- a/plugins/check_by_ssh.c<br>
&gt;&gt; &gt; &gt; ++++ b/plugins/check_by_ssh.c<br>
&gt;&gt; &gt; &gt; +@@ -27,7 +27,7 @@<br>
&gt;&gt; &gt; &gt; + ******************************************************=
***********************/<br>
&gt;&gt; &gt; &gt; +<br>
&gt;&gt; &gt; &gt; + const char *progname =3D &quot;check_by_ssh&quot;;<br>
&gt;&gt; &gt; &gt; +-const char *copyright =3D &quot;2000-2014&quot;;<br>
&gt;&gt; &gt; &gt; ++const char *copyright =3D &quot;2000-&quot;;<br>
&gt;&gt; &gt; &gt; + const char *email =3D &quot;<a href=3D"mailto:devel@na=
gios-plugins.org" target=3D"_blank">devel@nagios-plugins.org</a>&quot;;<br>
&gt;&gt; &gt; &gt; +<br>
&gt;&gt; &gt; &gt; + #include &quot;common.h&quot;<br>
&gt;&gt; &gt; &gt; +@@ -299,6 +299,16 @@ process_arguments (int argc, char =
**argv)<br>
&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0skip_stderr =3D atoi (opta=
rg);<br>
&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &#=
39;o&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Extra options for the ssh comma=
nd */<br>
&gt;&gt; &gt; &gt; ++<br>
&gt;&gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /* Don&#39;t allow the user to run commands local to the =
nagios server, unless they decide otherwise at compile time. */<br>
&gt;&gt; &gt; &gt; ++#ifndef HAVE_UNRESTRICTED_SSH_OPTIONS<br>
&gt;&gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (=C2=A0 =C2=A0strcasestr(optarg, &quot;ProxyCommand&qu=
ot;) !=3D NULL<br>
&gt;&gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || strcasestr(optarg, &quot;P=
ermitLocalCommand&quot;) !=3D NULL<br>
&gt;&gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || strcasestr(optarg, &quot;L=
ocalCommand&quot;) !=3D NULL) {<br>
&gt;&gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt; &gt; ++#endif<br>
&gt;&gt; &gt; &gt; ++<br>
&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0comm_append(&quot;-o&quot;);<br>
&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0comm_append(optarg);<br>
&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;&gt; &gt; &gt; +--<br>
&gt;&gt; &gt; &gt; +2.23.0<br>
&gt;&gt; &gt; &gt; +<br>
&gt;&gt; &gt; &gt; diff --git a/recipes-extended/nagios/<a href=3D"http://n=
agios-plugins_2.2.1.bb" rel=3D"noreferrer" target=3D"_blank">nagios-plugins=
_2.2.1.bb</a> b/recipes-extended/nagios/<a href=3D"http://nagios-plugins_2.=
2.1.bb" rel=3D"noreferrer" target=3D"_blank">nagios-plugins_2.2.1.bb</a><br=
>
&gt;&gt; &gt; &gt; index 471d4b42..cd89b329 100644<br>
&gt;&gt; &gt; &gt; --- a/recipes-extended/nagios/<a href=3D"http://nagios-p=
lugins_2.2.1.bb" rel=3D"noreferrer" target=3D"_blank">nagios-plugins_2.2.1.=
bb</a><br>
&gt;&gt; &gt; &gt; +++ b/recipes-extended/nagios/<a href=3D"http://nagios-p=
lugins_2.2.1.bb" rel=3D"noreferrer" target=3D"_blank">nagios-plugins_2.2.1.=
bb</a><br>
&gt;&gt; &gt; &gt; @@ -9,6 +9,7 @@ LICENSE =3D &quot;GPL-3.0-only&quot;<br>
&gt;&gt; &gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd3=
2239bcb673463ab874e80d47fae504&quot;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://www.nagios-pl=
ugins.org/download/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=
=3D"_blank">https://www.nagios-plugins.org/download/${BPN}-${PV}.tar.gz</a>=
 \<br>
&gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-202=
3-37154.patch \<br>
&gt;&gt; &gt; &gt;=C2=A0 &quot;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;=C2=A0 SRC_URI[md5sum] =3D &quot;fb521d5c05897f165b0b1862=
c1e5cb27&quot;<br>
&gt;&gt; &gt; &gt; --<br>
&gt;&gt; &gt; &gt; 2.25.1<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; &gt; View/Reply Online (#9049): <a href=3D"https://lists.yoctoproj=
ect.org/g/meta-virtualization/message/9049" rel=3D"noreferrer" target=3D"_b=
lank">https://lists.yoctoproject.org/g/meta-virtualization/message/9049</a>=
<br>
&gt;&gt; &gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt=
/109817333/3617156" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/mt/109817333/3617156</a><br>
&gt;&gt; &gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@li=
sts.yoctoproject.org" target=3D"_blank">meta-virtualization+owner@lists.yoc=
toproject.org</a><br>
&gt;&gt; &gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.y=
octoproject.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:martin.j=
ansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>]<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await =
thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt;<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000c7eacc0628ebdc91--

