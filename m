Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9634FE7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 08:21:57 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.5449.1733818908373101575
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Dec 2024 00:21:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KfAni2JG;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53e384e3481so3010178e87.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Dec 2024 00:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733818906; x=1734423706; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2abs3IsFMc/OGGIWSl/jC3myNNZ/WTolrSgUDRY4pE=;
        b=KfAni2JGMlvLUr90x+CNn/wmRwgSKO6kSJHobXqBmkUamC1DMOOYHF8VPxDl7gkqDv
         0wSdPdERyWKUBczjp2F7MiMkPuWv77GAorZEvWLQL0eG4jB47M2ijZm2ain2auU5nzoE
         FkiL/to5rtuX8v6tWF2lSmsySQ1+s/IM6fDfTT1CG3CSQ7R0Q8jxvc9Qnc1VN3Jgx+cx
         a7SrIrggZavFjG3fKXPnYXjNMnxaAjpKhNNfDz93dO8/YTxtujFO4klqqSJn86mh9Nmw
         TTTWb9kJj6Vg4RNVEVySh4rgAPVJf75wfmCZ937MUePYsRuNXvRx3CVOX2xzjfDa/a5Z
         Qq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733818906; x=1734423706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H2abs3IsFMc/OGGIWSl/jC3myNNZ/WTolrSgUDRY4pE=;
        b=ewLwpC0RMHo3aoM7ujEXRZLhL4O9vVUHk3lOrldM1p+U8/12l/Lihdyir362bCQNdX
         6DisqF9W8BIDvK3IlCjgjRqkdfrBvSZyYy2WytX0bUWJYg/bzLhfdO4GcFYT4Ffev+G3
         El2/Er1Tp8YyOP+hrpd+naHdTdezoMb7NdLl7FUj8kc7WRvc3vu2f9FK39v6rI3swAaP
         EfhvtHRleGW/MHh/0i7nofigfRw6hyDqTgg7nQaICSHHPx3F9TP+ZqSs/GbL3OZqfvae
         O5IfO2vuElymvrYbUpd1vhl2U4IRQkA28kZIg19PogDlMmUvYF47VU27vxKJOq8BKwKn
         nypw==
X-Forwarded-Encrypted: i=1; AJvYcCWNDzGZDjiuDyYHOKOxMGGOjc4ETu++TrIoVh5lhK0aBO8suZ3zZseC77J4LYohfvmw6FYpcaN/AhlYQgCFBxC5bLVj@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxS30NCOGxpAQuj5XoyRtIWSxwcnfWkvDRa4Oi6KYZHw/Cf8DjL
	hEa1Y/S3ehIbdEzt+PJsTQDJpHmWgPuta/2LsBKrPi4+JxTFHPcWWQ3QB3XwIRKUUQW8eiBvop1
	uU2NWcdlBK/bZsHxUp7nuWAiuYME=
X-Gm-Gg: ASbGnctmr0OL+rTbGrcxF1lrCjL1P4Iw9jlQox4ktIpztSZ+mGNpczpDb1GVkhwWrf9
	nj12fMANzasLEqEfnvJ01jpF7fpR4wk5hmVYskg==
X-Google-Smtp-Source: AGHT+IF+6LQHXrw+ycLrFeLRc+sdeJNlMwdWTcqjBgU4dJ6t6/f1fWwwI/EJq3fVnV//vGslCf2Fk5aOXsf5mfxl7gk=
X-Received: by 2002:ac2:5227:0:b0:53e:362e:ed0 with SMTP id
 2adb3069b0e04-53e362e0f1emr5257376e87.44.1733818906196; Tue, 10 Dec 2024
 00:21:46 -0800 (PST)
MIME-Version: 1.0
References: <20241128030717.3733955-1-changqing.li@windriver.com> <Z1e4CmoAbU4/LkOK@gmail.com>
In-Reply-To: <Z1e4CmoAbU4/LkOK@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 10 Dec 2024 09:21:34 +0100
Message-ID: <CA+chaQdn5=FCZ1ovLvK=c0ZJ+gmt=swGO0de5B5x3E=ZK=KP6A@mail.gmail.com>
Subject: Re: [meta-virtualization] [kirkstone][PATCH] nagios-plugins: fix CVE-2023-37154
To: bruce.ashfield@gmail.com
Cc: changqing.li@windriver.com, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Dec 2024 08:21:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9054

Something went wrong when applying this in kirkstone and
recipes-extended/nagios/nagios-plugins/CVE-2023-37154.patch doesn't
exist.

On Tue, Dec 10, 2024 at 4:39=E2=80=AFAM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> merged.
>
> Bruce
>
> In message: [meta-virtualization] [kirkstone][PATCH] nagios-plugins: fix =
CVE-2023-37154
> on 28/11/2024 Changqing Li via lists.yoctoproject.org wrote:
>
> > From: Changqing Li <changqing.li@windriver.com>
> >
> > CVE-2023-37154:
> > check_by_ssh in Nagios nagios-plugins 2.4.5 allows arbitrary command ex=
ecution
> > via ProxyCommand, LocalCommand, and PermitLocalCommand with \${IFS}. Th=
is has
> > been categorized both as fixed in e8810de, and as intended behavior.
> >
> > Refer:
> > https://nvd.nist.gov/vuln/detail/CVE-2023-37154
> >
> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > ---
> >  .../nagios-plugins/CVE-2023-37154.patch       | 69 +++++++++++++++++++
> >  .../nagios/nagios-plugins_2.2.1.bb            |  1 +
> >  2 files changed, 70 insertions(+)
> >  create mode 100644 recipes-extended/nagios/nagios-plugins/CVE-2023-371=
54.patch
> >
> > diff --git a/recipes-extended/nagios/nagios-plugins/CVE-2023-37154.patc=
h b/recipes-extended/nagios/nagios-plugins/CVE-2023-37154.patch
> > new file mode 100644
> > index 00000000..436bba42
> > --- /dev/null
> > +++ b/recipes-extended/nagios/nagios-plugins/CVE-2023-37154.patch
> > @@ -0,0 +1,69 @@
> > +From 7f07a9e89373d5906c2b6a9eee0e74cf69f302c1 Mon Sep 17 00:00:00 2001
> > +From: Sebastian Wolf <swolf@nagios.com>
> > +Date: Wed, 31 May 2023 16:43:54 -0400
> > +Subject: [PATCH] check_by_ssh: Prevent users from using several SSH op=
tions
> > + which run local commands.
> > +
> > +CVE: CVE-2023-37154
> > +Upstream-Status: Backport [https://github.com/nagios-plugins/nagios-pl=
ugins/commit/e8810de21be80148562b7e0168b0a62aeedffde6]
> > +
> > +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > +---
> > + configure.ac           | 10 ++++++++++
> > + plugins/check_by_ssh.c | 12 +++++++++++-
> > + 2 files changed, 21 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index 963514a..236d233 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -418,6 +418,16 @@ then
> > +             [path and arguments for invoking 'who'])
> > + fi
> > +
> > ++AC_ARG_WITH(unrestricted_ssh_options,
> > ++    [AS_HELP_STRING([--with-unrestricted-ssh-options],
> > ++            [allow any SSH options to be used with check_by_ssh])],
> > ++    [],
> > ++    [unrestricted_ssh_options=3Dno])
> > ++
> > ++if test "x$with_unrestricted_ssh_options" =3D xyes ; then
> > ++    AC_DEFINE(HAVE_UNRESTRICTED_SSH_OPTIONS,[1],[Allow SSH to use opt=
ions that run local commands.])
> > ++fi
> > ++
> > + AC_ARG_WITH([ipv6],
> > +     [AS_HELP_STRING([--with-ipv6], [support IPv6 @<:@default=3Dcheck@=
:>@])],
> > +     [], [with_ipv6=3Dcheck])
> > +diff --git a/plugins/check_by_ssh.c b/plugins/check_by_ssh.c
> > +index b6f3130..6cc6c7a 100644
> > +--- a/plugins/check_by_ssh.c
> > ++++ b/plugins/check_by_ssh.c
> > +@@ -27,7 +27,7 @@
> > + *********************************************************************=
********/
> > +
> > + const char *progname =3D "check_by_ssh";
> > +-const char *copyright =3D "2000-2014";
> > ++const char *copyright =3D "2000-";
> > + const char *email =3D "devel@nagios-plugins.org";
> > +
> > + #include "common.h"
> > +@@ -299,6 +299,16 @@ process_arguments (int argc, char **argv)
> > +                             skip_stderr =3D atoi (optarg);
> > +                     break;
> > +             case 'o':                                                =
                       /* Extra options for the ssh command */
> > ++
> > ++                    /* Don't allow the user to run commands local to =
the nagios server, unless they decide otherwise at compile time. */
> > ++#ifndef HAVE_UNRESTRICTED_SSH_OPTIONS
> > ++                    if (   strcasestr(optarg, "ProxyCommand") !=3D NU=
LL
> > ++                            || strcasestr(optarg, "PermitLocalCommand=
") !=3D NULL
> > ++                            || strcasestr(optarg, "LocalCommand") !=
=3D NULL) {
> > ++                            break;
> > ++                    }
> > ++#endif
> > ++
> > +                     comm_append("-o");
> > +                     comm_append(optarg);
> > +                     break;
> > +--
> > +2.23.0
> > +
> > diff --git a/recipes-extended/nagios/nagios-plugins_2.2.1.bb b/recipes-=
extended/nagios/nagios-plugins_2.2.1.bb
> > index 471d4b42..cd89b329 100644
> > --- a/recipes-extended/nagios/nagios-plugins_2.2.1.bb
> > +++ b/recipes-extended/nagios/nagios-plugins_2.2.1.bb
> > @@ -9,6 +9,7 @@ LICENSE =3D "GPL-3.0-only"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47f=
ae504"
> >
> >  SRC_URI =3D "https://www.nagios-plugins.org/download/${BPN}-${PV}.tar.=
gz \
> > +           file://CVE-2023-37154.patch \
> >  "
> >
> >  SRC_URI[md5sum] =3D "fb521d5c05897f165b0b1862c1e5cb27"
> > --
> > 2.25.1
> >
>
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9049): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/9049
> Mute This Topic: https://lists.yoctoproject.org/mt/109817333/3617156
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

