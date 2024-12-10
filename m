Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D24E7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 14:20:09 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.11431.1733840403214558656
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Dec 2024 06:20:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EH5kt2BL;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30036310158so32159321fa.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Dec 2024 06:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733840401; x=1734445201; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjiAmbVZAtD8Ak3706fE1JS9yOfG2YQV2KObHYjxkvI=;
        b=EH5kt2BLRz1Wa6avOHpLjc1X8URpLtRI9ssnnrbtHGVWSrI3d7duNWyJXS4zgTzMke
         plyiuki6OJBFdZ1UMH7tDeZtkGynQXX3L+mzIufNpXDdQw424DRe61pJ/WZRSPBV4N+h
         Ty8U7sA1Tsj+Xv9F+jl4S3VYdAy3W6VUNZwSbA16Vk+MNlEVh8Miof7EU2YnxhNHvAV4
         fHRpJRjuq6RNJGe2gu+OQD2y61IbyewuK+YzbcK/zt4nqfhRCFitNXxyUQPwSIQGfL1e
         3sD6TEno8bB3YjqllWs3boxGm3voqM9J3TSvbyOUiZcF+xDyPLKkrqp8I6/gkP6g3/NS
         frww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733840401; x=1734445201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PjiAmbVZAtD8Ak3706fE1JS9yOfG2YQV2KObHYjxkvI=;
        b=Hqa+/nTuplBaa90LbS1joZaAdGfnGURGEQs23UpABXA4huVAm80T0fSm3Y911wLqPQ
         FYydGbZ2acM3XfRjKNLpRbzUdiG4vj3DoCeopepJYi8p6PyiKLZilVNYf5KcyB+eMN+k
         XmtYkH/Z7jAGt6QcQQi2oNKAWr8FkG6Qv31yIgF1wnhtnj7cLzfopgykyq9ln7d8tVDX
         1rjMA/AsBNZJo6e6YJApylx597uMFiCezuRrYxfEGZW9U8qSFY8Ww7omSNakmdCsDHfN
         dBiN3YOlipkZ+XZU0IyK2uEYzV9ViZ6sMXpY2pyxYNZeczNQXh1+jSpJF/rVIwaW/IYO
         Qz5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXGqUAYOtT6550RtCqLkB6FuTe6Lz826h6lDKcxiXU1jJLeZcDZWtqoeVNgEjyDj54Vbxv9y9PvQyjulLyolZ89ImJ4@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzpEqBCCNrBRJ1ebQlL+NH5rEINbJnKby0jhlgr4gWkRSdYEgI7
	2DRv53W9YDE/7SqnHddElV1xgRJ8mL6w3rCM1mO7qwrCnAGbzJYEg23XhkFJonbxqQvqIdGx64y
	wouPMwyw9NkFKxuKL2tTplr5m4o8=
X-Gm-Gg: ASbGncuCEwGhPJeTZidFr7ZwZjeOSd9vY25uzHMcgC9ZWdtPuegZBlj3j+zGp1jsBC5
	e7g747VYcqbU6elLC6BhS4yVBdk52fvd/nAMEEA==
X-Google-Smtp-Source: AGHT+IEljGOFqhtZEoeROmPibyYqjtvLJtKuBbIR4fWFv95muP8PEDcooeCW3q7uApKg9hsnfyMBjYoXkuMnZ86PRM4=
X-Received: by 2002:a05:651c:510:b0:302:2598:dec2 with SMTP id
 38308e7fff4ca-3022598e35bmr25920661fa.14.1733840400847; Tue, 10 Dec 2024
 06:20:00 -0800 (PST)
MIME-Version: 1.0
References: <20241128030717.3733955-1-changqing.li@windriver.com>
 <Z1e4CmoAbU4/LkOK@gmail.com> <CA+chaQdn5=FCZ1ovLvK=c0ZJ+gmt=swGO0de5B5x3E=ZK=KP6A@mail.gmail.com>
 <CADkTA4N59Y1j6qNdcPcy8PYs5-YNcZi3VvBHkcr9gdEAP-s3Lw@mail.gmail.com>
In-Reply-To: <CADkTA4N59Y1j6qNdcPcy8PYs5-YNcZi3VvBHkcr9gdEAP-s3Lw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 10 Dec 2024 15:19:49 +0100
Message-ID: <CA+chaQczR3owuG9HJ1Ht6Rujd6iYpQtEdHkEHworSe5QniuCaQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [kirkstone][PATCH] nagios-plugins: fix CVE-2023-37154
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: changqing.li@windriver.com, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Dec 2024 14:20:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9056

Looks like most of that .patch file ended in the commit message, but
the patch looks ok to me, so not sure what happened.

On Tue, Dec 10, 2024 at 3:01=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com> wrote:
>
> odd. I don't even have any refuse sitting around in my merge directory.
>
> I'll revert and re-apply.
>
> Bruce
>
> On Tue, Dec 10, 2024 at 3:21=E2=80=AFAM Martin Jansa <martin.jansa@gmail.=
com> wrote:
>>
>> Something went wrong when applying this in kirkstone and
>> recipes-extended/nagios/nagios-plugins/CVE-2023-37154.patch doesn't
>> exist.
>>
>> On Tue, Dec 10, 2024 at 4:39=E2=80=AFAM Bruce Ashfield via
>> lists.yoctoproject.org
>> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>> >
>> > merged.
>> >
>> > Bruce
>> >
>> > In message: [meta-virtualization] [kirkstone][PATCH] nagios-plugins: f=
ix CVE-2023-37154
>> > on 28/11/2024 Changqing Li via lists.yoctoproject.org wrote:
>> >
>> > > From: Changqing Li <changqing.li@windriver.com>
>> > >
>> > > CVE-2023-37154:
>> > > check_by_ssh in Nagios nagios-plugins 2.4.5 allows arbitrary command=
 execution
>> > > via ProxyCommand, LocalCommand, and PermitLocalCommand with \${IFS}.=
 This has
>> > > been categorized both as fixed in e8810de, and as intended behavior.
>> > >
>> > > Refer:
>> > > https://nvd.nist.gov/vuln/detail/CVE-2023-37154
>> > >
>> > > Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> > > ---
>> > >  .../nagios-plugins/CVE-2023-37154.patch       | 69 ++++++++++++++++=
+++
>> > >  .../nagios/nagios-plugins_2.2.1.bb            |  1 +
>> > >  2 files changed, 70 insertions(+)
>> > >  create mode 100644 recipes-extended/nagios/nagios-plugins/CVE-2023-=
37154.patch
>> > >
>> > > diff --git a/recipes-extended/nagios/nagios-plugins/CVE-2023-37154.p=
atch b/recipes-extended/nagios/nagios-plugins/CVE-2023-37154.patch
>> > > new file mode 100644
>> > > index 00000000..436bba42
>> > > --- /dev/null
>> > > +++ b/recipes-extended/nagios/nagios-plugins/CVE-2023-37154.patch
>> > > @@ -0,0 +1,69 @@
>> > > +From 7f07a9e89373d5906c2b6a9eee0e74cf69f302c1 Mon Sep 17 00:00:00 2=
001
>> > > +From: Sebastian Wolf <swolf@nagios.com>
>> > > +Date: Wed, 31 May 2023 16:43:54 -0400
>> > > +Subject: [PATCH] check_by_ssh: Prevent users from using several SSH=
 options
>> > > + which run local commands.
>> > > +
>> > > +CVE: CVE-2023-37154
>> > > +Upstream-Status: Backport [https://github.com/nagios-plugins/nagios=
-plugins/commit/e8810de21be80148562b7e0168b0a62aeedffde6]
>> > > +
>> > > +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> > > +---
>> > > + configure.ac           | 10 ++++++++++
>> > > + plugins/check_by_ssh.c | 12 +++++++++++-
>> > > + 2 files changed, 21 insertions(+), 1 deletion(-)
>> > > +
>> > > +diff --git a/configure.ac b/configure.ac
>> > > +index 963514a..236d233 100644
>> > > +--- a/configure.ac
>> > > ++++ b/configure.ac
>> > > +@@ -418,6 +418,16 @@ then
>> > > +             [path and arguments for invoking 'who'])
>> > > + fi
>> > > +
>> > > ++AC_ARG_WITH(unrestricted_ssh_options,
>> > > ++    [AS_HELP_STRING([--with-unrestricted-ssh-options],
>> > > ++            [allow any SSH options to be used with check_by_ssh])]=
,
>> > > ++    [],
>> > > ++    [unrestricted_ssh_options=3Dno])
>> > > ++
>> > > ++if test "x$with_unrestricted_ssh_options" =3D xyes ; then
>> > > ++    AC_DEFINE(HAVE_UNRESTRICTED_SSH_OPTIONS,[1],[Allow SSH to use =
options that run local commands.])
>> > > ++fi
>> > > ++
>> > > + AC_ARG_WITH([ipv6],
>> > > +     [AS_HELP_STRING([--with-ipv6], [support IPv6 @<:@default=3Dche=
ck@:>@])],
>> > > +     [], [with_ipv6=3Dcheck])
>> > > +diff --git a/plugins/check_by_ssh.c b/plugins/check_by_ssh.c
>> > > +index b6f3130..6cc6c7a 100644
>> > > +--- a/plugins/check_by_ssh.c
>> > > ++++ b/plugins/check_by_ssh.c
>> > > +@@ -27,7 +27,7 @@
>> > > + ******************************************************************=
***********/
>> > > +
>> > > + const char *progname =3D "check_by_ssh";
>> > > +-const char *copyright =3D "2000-2014";
>> > > ++const char *copyright =3D "2000-";
>> > > + const char *email =3D "devel@nagios-plugins.org";
>> > > +
>> > > + #include "common.h"
>> > > +@@ -299,6 +299,16 @@ process_arguments (int argc, char **argv)
>> > > +                             skip_stderr =3D atoi (optarg);
>> > > +                     break;
>> > > +             case 'o':                                             =
                          /* Extra options for the ssh command */
>> > > ++
>> > > ++                    /* Don't allow the user to run commands local =
to the nagios server, unless they decide otherwise at compile time. */
>> > > ++#ifndef HAVE_UNRESTRICTED_SSH_OPTIONS
>> > > ++                    if (   strcasestr(optarg, "ProxyCommand") !=3D=
 NULL
>> > > ++                            || strcasestr(optarg, "PermitLocalComm=
and") !=3D NULL
>> > > ++                            || strcasestr(optarg, "LocalCommand") =
!=3D NULL) {
>> > > ++                            break;
>> > > ++                    }
>> > > ++#endif
>> > > ++
>> > > +                     comm_append("-o");
>> > > +                     comm_append(optarg);
>> > > +                     break;
>> > > +--
>> > > +2.23.0
>> > > +
>> > > diff --git a/recipes-extended/nagios/nagios-plugins_2.2.1.bb b/recip=
es-extended/nagios/nagios-plugins_2.2.1.bb
>> > > index 471d4b42..cd89b329 100644
>> > > --- a/recipes-extended/nagios/nagios-plugins_2.2.1.bb
>> > > +++ b/recipes-extended/nagios/nagios-plugins_2.2.1.bb
>> > > @@ -9,6 +9,7 @@ LICENSE =3D "GPL-3.0-only"
>> > >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d=
47fae504"
>> > >
>> > >  SRC_URI =3D "https://www.nagios-plugins.org/download/${BPN}-${PV}.t=
ar.gz \
>> > > +           file://CVE-2023-37154.patch \
>> > >  "
>> > >
>> > >  SRC_URI[md5sum] =3D "fb521d5c05897f165b0b1862c1e5cb27"
>> > > --
>> > > 2.25.1
>> > >
>> >
>> > >
>> > >
>> > >
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#9049): https://lists.yoctoproject.org/g/meta-virtu=
alization/message/9049
>> > Mute This Topic: https://lists.yoctoproject.org/mt/109817333/3617156
>> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsu=
b [martin.jansa@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

