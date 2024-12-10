Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B2CE7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 14:01:19 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.10942.1733839276454153767
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Dec 2024 06:01:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CkW83G+W;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-728e1799d95so742859b3a.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Dec 2024 06:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733839276; x=1734444076; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbUQXfukBCQDlbSRFYpI2IZWFvo09hjDghSZwilF73U=;
        b=CkW83G+WVawUPf1B3zGP2Dy3q9dtQR/Udlf+R3ssoFh5RGqX5/vSC0BgQSR7xlgrIm
         ILgpKxrv2KBhO1/oHPi6t/VnBUWBw/IgK7m7rUcwSRCWvOvG7nOLxVysO251zP7dO2+m
         tiuOHi0RAF7TPnOEzfFvQDABgaYrAyjjqEZQagV0VrkRkfjrfzx/MXf8y0ckV6/MGsue
         wMhSGya2Rj9krE6hMap0KjyPfxDmVZBy6zVdqbaspurvlurpEv/ntOz2BUR5uEc4i91h
         O/ooFPEn7iJ370SE2p6GkqaQWQW6WvcYt2Gi6YkcSN4OJLfkxLaojD7laHhRVIBMBfOT
         HRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733839276; x=1734444076;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZbUQXfukBCQDlbSRFYpI2IZWFvo09hjDghSZwilF73U=;
        b=GURrWzl3kx93R0DMMuyVVhNjWFzYlRMAjPjFMyjiCJ9+4a/mYp2dTFxSe/lVpFA2ni
         nUNthy5uNPTRuMGmYHYMZ2D0AafxmFLVFE4vtfJbBesnBTRWPjSiAcezAFIUEDAAkuEC
         2NC3CdKZR/t+HZwsm/snJJv8Sh0goGMOqiLYOgUgf3NDyN3BGjlgR7+z5HMoDRXHv6ap
         kj8a0IDEYQpiOa4AMAEfrwvPu386enhcgqohL5rqnCvYZl5c+0Rji7zTFFCsYbMu5rkV
         Z05Ipkj0b6uiQbmcslWGl7XETAmtdVpGxM8wtf0H3IB92e4+B1jDHht7uwtkEeJ0ur1b
         Rslg==
X-Forwarded-Encrypted: i=1; AJvYcCWmyxyf3tteiHW32jSEE+Hv+NEm05FyA5f6tfjX6LzWHnogPMPaKxBMIOvXzWP/vUeOmKchzSC7NXHqgV/duyWRuGdn@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Ywy5g7N032KEmEVYkv2zFKXfHRiLR5xAhNPu5WZUxiLzMoHDJf0
	/9GEeHl4NhGeJ1Z3oD3Zu7O9TYf4jqRiUoRd9O1bbmq/fSzNCjUXqSfDYAR/sHt69fRQHXlpoSk
	lmPAW+cDbnSv3gxKg1dK6dZEXkiI=
X-Gm-Gg: ASbGnctsL2gpyYFr51g+PnNIv5ibATdqEZFJFHwnGETfPw4XbhdTqlsB2jBFICWktRs
	jA8VMoClNei4CBw8yVs8rZfHLJJiOWTdkkl4=
X-Google-Smtp-Source: AGHT+IHRpYX1c2OGcPsoEOvTniKXeUzXAFMuE5JxIYcxrsy/GRT3Qt7P6MeShli5EmXL4BDVChYM6HoIf974dZHSC1o=
X-Received: by 2002:a05:6a00:1490:b0:725:d64c:f113 with SMTP id
 d2e1a72fcca58-7273c8f1cffmr6212565b3a.3.1733839275446; Tue, 10 Dec 2024
 06:01:15 -0800 (PST)
MIME-Version: 1.0
References: <20241128030717.3733955-1-changqing.li@windriver.com>
 <Z1e4CmoAbU4/LkOK@gmail.com> <CA+chaQdn5=FCZ1ovLvK=c0ZJ+gmt=swGO0de5B5x3E=ZK=KP6A@mail.gmail.com>
In-Reply-To: <CA+chaQdn5=FCZ1ovLvK=c0ZJ+gmt=swGO0de5B5x3E=ZK=KP6A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 Dec 2024 09:01:03 -0500
Message-ID: <CADkTA4N59Y1j6qNdcPcy8PYs5-YNcZi3VvBHkcr9gdEAP-s3Lw@mail.gmail.com>
Subject: Re: [meta-virtualization] [kirkstone][PATCH] nagios-plugins: fix CVE-2023-37154
To: Martin Jansa <martin.jansa@gmail.com>
Cc: changqing.li@windriver.com, meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000001c58990628eaea30"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Dec 2024 14:01:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9055

--0000000000001c58990628eaea30
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

odd. I don't even have any refuse sitting around in my merge directory.

I'll revert and re-apply.

Bruce

On Tue, Dec 10, 2024 at 3:21=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:

> Something went wrong when applying this in kirkstone and
> recipes-extended/nagios/nagios-plugins/CVE-2023-37154.patch doesn't
> exist.
>
> On Tue, Dec 10, 2024 at 4:39=E2=80=AFAM Bruce Ashfield via
> lists.yoctoproject.org
> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > merged.
> >
> > Bruce
> >
> > In message: [meta-virtualization] [kirkstone][PATCH] nagios-plugins: fi=
x
> CVE-2023-37154
> > on 28/11/2024 Changqing Li via lists.yoctoproject.org wrote:
> >
> > > From: Changqing Li <changqing.li@windriver.com>
> > >
> > > CVE-2023-37154:
> > > check_by_ssh in Nagios nagios-plugins 2.4.5 allows arbitrary command
> execution
> > > via ProxyCommand, LocalCommand, and PermitLocalCommand with \${IFS}.
> This has
> > > been categorized both as fixed in e8810de, and as intended behavior.
> > >
> > > Refer:
> > > https://nvd.nist.gov/vuln/detail/CVE-2023-37154
> > >
> > > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > > ---
> > >  .../nagios-plugins/CVE-2023-37154.patch       | 69 +++++++++++++++++=
++
> > >  .../nagios/nagios-plugins_2.2.1.bb            |  1 +
> > >  2 files changed, 70 insertions(+)
> > >  create mode 100644
> recipes-extended/nagios/nagios-plugins/CVE-2023-37154.patch
> > >
> > > diff --git
> a/recipes-extended/nagios/nagios-plugins/CVE-2023-37154.patch
> b/recipes-extended/nagios/nagios-plugins/CVE-2023-37154.patch
> > > new file mode 100644
> > > index 00000000..436bba42
> > > --- /dev/null
> > > +++ b/recipes-extended/nagios/nagios-plugins/CVE-2023-37154.patch
> > > @@ -0,0 +1,69 @@
> > > +From 7f07a9e89373d5906c2b6a9eee0e74cf69f302c1 Mon Sep 17 00:00:00 20=
01
> > > +From: Sebastian Wolf <swolf@nagios.com>
> > > +Date: Wed, 31 May 2023 16:43:54 -0400
> > > +Subject: [PATCH] check_by_ssh: Prevent users from using several SSH
> options
> > > + which run local commands.
> > > +
> > > +CVE: CVE-2023-37154
> > > +Upstream-Status: Backport [
> https://github.com/nagios-plugins/nagios-plugins/commit/e8810de21be801485=
62b7e0168b0a62aeedffde6
> ]
> > > +
> > > +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > > +---
> > > + configure.ac           | 10 ++++++++++
> > > + plugins/check_by_ssh.c | 12 +++++++++++-
> > > + 2 files changed, 21 insertions(+), 1 deletion(-)
> > > +
> > > +diff --git a/configure.ac b/configure.ac
> > > +index 963514a..236d233 100644
> > > +--- a/configure.ac
> > > ++++ b/configure.ac
> > > +@@ -418,6 +418,16 @@ then
> > > +             [path and arguments for invoking 'who'])
> > > + fi
> > > +
> > > ++AC_ARG_WITH(unrestricted_ssh_options,
> > > ++    [AS_HELP_STRING([--with-unrestricted-ssh-options],
> > > ++            [allow any SSH options to be used with check_by_ssh])],
> > > ++    [],
> > > ++    [unrestricted_ssh_options=3Dno])
> > > ++
> > > ++if test "x$with_unrestricted_ssh_options" =3D xyes ; then
> > > ++    AC_DEFINE(HAVE_UNRESTRICTED_SSH_OPTIONS,[1],[Allow SSH to use
> options that run local commands.])
> > > ++fi
> > > ++
> > > + AC_ARG_WITH([ipv6],
> > > +     [AS_HELP_STRING([--with-ipv6], [support IPv6 @<:@default=3Dchec=
k@
> :>@])],
> > > +     [], [with_ipv6=3Dcheck])
> > > +diff --git a/plugins/check_by_ssh.c b/plugins/check_by_ssh.c
> > > +index b6f3130..6cc6c7a 100644
> > > +--- a/plugins/check_by_ssh.c
> > > ++++ b/plugins/check_by_ssh.c
> > > +@@ -27,7 +27,7 @@
> > > +
> *************************************************************************=
****/
> > > +
> > > + const char *progname =3D "check_by_ssh";
> > > +-const char *copyright =3D "2000-2014";
> > > ++const char *copyright =3D "2000-";
> > > + const char *email =3D "devel@nagios-plugins.org";
> > > +
> > > + #include "common.h"
> > > +@@ -299,6 +299,16 @@ process_arguments (int argc, char **argv)
> > > +                             skip_stderr =3D atoi (optarg);
> > > +                     break;
> > > +             case 'o':
>                        /* Extra options for the ssh command */
> > > ++
> > > ++                    /* Don't allow the user to run commands local t=
o
> the nagios server, unless they decide otherwise at compile time. */
> > > ++#ifndef HAVE_UNRESTRICTED_SSH_OPTIONS
> > > ++                    if (   strcasestr(optarg, "ProxyCommand") !=3D =
NULL
> > > ++                            || strcasestr(optarg,
> "PermitLocalCommand") !=3D NULL
> > > ++                            || strcasestr(optarg, "LocalCommand") !=
=3D
> NULL) {
> > > ++                            break;
> > > ++                    }
> > > ++#endif
> > > ++
> > > +                     comm_append("-o");
> > > +                     comm_append(optarg);
> > > +                     break;
> > > +--
> > > +2.23.0
> > > +
> > > diff --git a/recipes-extended/nagios/nagios-plugins_2.2.1.bb
> b/recipes-extended/nagios/nagios-plugins_2.2.1.bb
> > > index 471d4b42..cd89b329 100644
> > > --- a/recipes-extended/nagios/nagios-plugins_2.2.1.bb
> > > +++ b/recipes-extended/nagios/nagios-plugins_2.2.1.bb
> > > @@ -9,6 +9,7 @@ LICENSE =3D "GPL-3.0-only"
> > >  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504"
> > >
> > >  SRC_URI =3D "
> https://www.nagios-plugins.org/download/${BPN}-${PV}.tar.gz \
> > > +           file://CVE-2023-37154.patch \
> > >  "
> > >
> > >  SRC_URI[md5sum] =3D "fb521d5c05897f165b0b1862c1e5cb27"
> > > --
> > > 2.25.1
> > >
> >
> > >
> > >
> > >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#9049):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9049
> > Mute This Topic: https://lists.yoctoproject.org/mt/109817333/3617156
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000001c58990628eaea30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">odd. I don&#39;t even have any refuse sitting around in my me=
rge directory.</div><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;ll r=
evert and re-apply.</div><div class=3D"gmail_default" style=3D"font-size:sm=
all"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce=
</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Dec 10, 2024 at 3:21=E2=80=AFAM Marti=
n Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Something went wrong when applying this in kirkstone and<br>
recipes-extended/nagios/nagios-plugins/CVE-2023-37154.patch doesn&#39;t<br>
exist.<br>
<br>
On Tue, Dec 10, 2024 at 4:39=E2=80=AFAM Bruce Ashfield via<br>
<a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.yoctoproject.org</a><br>
&lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org" ta=
rget=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt;<br>
&gt; merged.<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt; In message: [meta-virtualization] [kirkstone][PATCH] nagios-plugins: f=
ix CVE-2023-37154<br>
&gt; on 28/11/2024 Changqing Li via <a href=3D"http://lists.yoctoproject.or=
g" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> wrote:<b=
r>
&gt;<br>
&gt; &gt; From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.c=
om" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; CVE-2023-37154:<br>
&gt; &gt; check_by_ssh in Nagios nagios-plugins 2.4.5 allows arbitrary comm=
and execution<br>
&gt; &gt; via ProxyCommand, LocalCommand, and PermitLocalCommand with \${IF=
S}. This has<br>
&gt; &gt; been categorized both as fixed in e8810de, and as intended behavi=
or.<br>
&gt; &gt;<br>
&gt; &gt; Refer:<br>
&gt; &gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-37154" rel=
=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2023=
-37154</a><br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@wi=
ndriver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../nagios-plugins/CVE-2023-37154.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 69 +++++++++++++++++++<br>
&gt; &gt;=C2=A0 .../nagios/<a href=3D"http://nagios-plugins_2.2.1.bb" rel=
=3D"noreferrer" target=3D"_blank">nagios-plugins_2.2.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; &gt;=C2=A0 2 files changed, 70 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644 recipes-extended/nagios/nagios-plugins/C=
VE-2023-37154.patch<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/recipes-extended/nagios/nagios-plugins/CVE-2023-3715=
4.patch b/recipes-extended/nagios/nagios-plugins/CVE-2023-37154.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 00000000..436bba42<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/recipes-extended/nagios/nagios-plugins/CVE-2023-37154.patch=
<br>
&gt; &gt; @@ -0,0 +1,69 @@<br>
&gt; &gt; +From 7f07a9e89373d5906c2b6a9eee0e74cf69f302c1 Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From: Sebastian Wolf &lt;<a href=3D"mailto:swolf@nagios.com" tar=
get=3D"_blank">swolf@nagios.com</a>&gt;<br>
&gt; &gt; +Date: Wed, 31 May 2023 16:43:54 -0400<br>
&gt; &gt; +Subject: [PATCH] check_by_ssh: Prevent users from using several =
SSH options<br>
&gt; &gt; + which run local commands.<br>
&gt; &gt; +<br>
&gt; &gt; +CVE: CVE-2023-37154<br>
&gt; &gt; +Upstream-Status: Backport [<a href=3D"https://github.com/nagios-=
plugins/nagios-plugins/commit/e8810de21be80148562b7e0168b0a62aeedffde6" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/nagios-plugins/nagios-=
plugins/commit/e8810de21be80148562b7e0168b0a62aeedffde6</a>]<br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@w=
indriver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++++++=
+++<br>
&gt; &gt; + plugins/check_by_ssh.c | 12 +++++++++++-<br>
&gt; &gt; + 2 files changed, 21 insertions(+), 1 deletion(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" =
target=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D=
"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt; &gt; +index 963514a..236d233 100644<br>
&gt; &gt; +--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
&gt; &gt; ++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
&gt; &gt; +@@ -418,6 +418,16 @@ then<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[path and argume=
nts for invoking &#39;who&#39;])<br>
&gt; &gt; + fi<br>
&gt; &gt; +<br>
&gt; &gt; ++AC_ARG_WITH(unrestricted_ssh_options,<br>
&gt; &gt; ++=C2=A0 =C2=A0 [AS_HELP_STRING([--with-unrestricted-ssh-options]=
,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [allow any SSH option=
s to be used with check_by_ssh])],<br>
&gt; &gt; ++=C2=A0 =C2=A0 [],<br>
&gt; &gt; ++=C2=A0 =C2=A0 [unrestricted_ssh_options=3Dno])<br>
&gt; &gt; ++<br>
&gt; &gt; ++if test &quot;x$with_unrestricted_ssh_options&quot; =3D xyes ; =
then<br>
&gt; &gt; ++=C2=A0 =C2=A0 AC_DEFINE(HAVE_UNRESTRICTED_SSH_OPTIONS,[1],[Allo=
w SSH to use options that run local commands.])<br>
&gt; &gt; ++fi<br>
&gt; &gt; ++<br>
&gt; &gt; + AC_ARG_WITH([ipv6],<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0[AS_HELP_STRING([--with-ipv6], [support IPv6=
 @&lt;:@default=3Dcheck@:&gt;@])],<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0[], [with_ipv6=3Dcheck])<br>
&gt; &gt; +diff --git a/plugins/check_by_ssh.c b/plugins/check_by_ssh.c<br>
&gt; &gt; +index b6f3130..6cc6c7a 100644<br>
&gt; &gt; +--- a/plugins/check_by_ssh.c<br>
&gt; &gt; ++++ b/plugins/check_by_ssh.c<br>
&gt; &gt; +@@ -27,7 +27,7 @@<br>
&gt; &gt; + ***************************************************************=
**************/<br>
&gt; &gt; +<br>
&gt; &gt; + const char *progname =3D &quot;check_by_ssh&quot;;<br>
&gt; &gt; +-const char *copyright =3D &quot;2000-2014&quot;;<br>
&gt; &gt; ++const char *copyright =3D &quot;2000-&quot;;<br>
&gt; &gt; + const char *email =3D &quot;<a href=3D"mailto:devel@nagios-plug=
ins.org" target=3D"_blank">devel@nagios-plugins.org</a>&quot;;<br>
&gt; &gt; +<br>
&gt; &gt; + #include &quot;common.h&quot;<br>
&gt; &gt; +@@ -299,6 +299,16 @@ process_arguments (int argc, char **argv)<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0skip_stderr =3D atoi (optarg);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0break;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &#39;o&#39;=
:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Extra options for the ssh command */<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /* Don&#39;t allow the user to run commands local to the nagios serv=
er, unless they decide otherwise at compile time. */<br>
&gt; &gt; ++#ifndef HAVE_UNRESTRICTED_SSH_OPTIONS<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if (=C2=A0 =C2=A0strcasestr(optarg, &quot;ProxyCommand&quot;) !=3D N=
ULL<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || strcasestr(optarg, &quot;PermitLocalC=
ommand&quot;) !=3D NULL<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || strcasestr(optarg, &quot;LocalCommand=
&quot;) !=3D NULL) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 }<br>
&gt; &gt; ++#endif<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0comm_append(&quot;-o&quot;);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0comm_append(optarg);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0break;<br>
&gt; &gt; +--<br>
&gt; &gt; +2.23.0<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/recipes-extended/nagios/<a href=3D"http://nagios-plu=
gins_2.2.1.bb" rel=3D"noreferrer" target=3D"_blank">nagios-plugins_2.2.1.bb=
</a> b/recipes-extended/nagios/<a href=3D"http://nagios-plugins_2.2.1.bb" r=
el=3D"noreferrer" target=3D"_blank">nagios-plugins_2.2.1.bb</a><br>
&gt; &gt; index 471d4b42..cd89b329 100644<br>
&gt; &gt; --- a/recipes-extended/nagios/<a href=3D"http://nagios-plugins_2.=
2.1.bb" rel=3D"noreferrer" target=3D"_blank">nagios-plugins_2.2.1.bb</a><br=
>
&gt; &gt; +++ b/recipes-extended/nagios/<a href=3D"http://nagios-plugins_2.=
2.1.bb" rel=3D"noreferrer" target=3D"_blank">nagios-plugins_2.2.1.bb</a><br=
>
&gt; &gt; @@ -9,6 +9,7 @@ LICENSE =3D &quot;GPL-3.0-only&quot;<br>
&gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd32239bcb67=
3463ab874e80d47fae504&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://www.nagios-plugins.org=
/download/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank"=
>https://www.nagios-plugins.org/download/${BPN}-${PV}.tar.gz</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-37154.p=
atch \<br>
&gt; &gt;=C2=A0 &quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 SRC_URI[md5sum] =3D &quot;fb521d5c05897f165b0b1862c1e5cb27&=
quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.25.1<br>
&gt; &gt;<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#9049): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/9049" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/9049</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/10981733=
3/3617156" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.=
org/mt/109817333/3617156</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproje=
ct.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:martin.jansa@gmai=
l.com" target=3D"_blank">martin.jansa@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000001c58990628eaea30--

