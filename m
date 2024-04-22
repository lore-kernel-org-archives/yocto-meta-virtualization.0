Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E97D8C4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 10:38:01 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.15368.1713782280508398645
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 22 Apr 2024 03:38:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=caVeTKnl;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-346f4266e59so3108472f8f.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Apr 2024 03:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713782279; x=1714387079; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1kXkR7bVvKMBK/rvjfCmKm9u1LNyo/+tKB8JZnMS+8=;
        b=caVeTKnlWkKEPx8uri3m8NeNkvanHDK8xRliCcirnbkT4JBLVrzWVGGLPGfh7GT4yf
         X0+wMjG8zePaanSOFH5nSt+l12OxYwSkdd5ETPfn32SDWqzrRsilBEzJplS7W2/1caF4
         Vkui43E6n6BSAVMwn22ZbFuVG6oTwB80kBxc6TGj+XsuKtJgTEgneD4Iki4HPb5A5Uee
         AFgnSFFCk1rCKVjScL/7Yt0tBEWa0y+ZD3p8OZSi6kn8+AT00Q1enXqgXYZC/0dpsJcV
         oC3zrF7Wa6xVHAWoJ8MTGAoxW1fELPDR7n2+hZgCprT45U99hGS0/IyVpLqSd9SMZUjL
         I+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713782279; x=1714387079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1kXkR7bVvKMBK/rvjfCmKm9u1LNyo/+tKB8JZnMS+8=;
        b=TbU8QMJzw5XkIQ+pcpYRzli1Dm5m/Bni6Dp09BnwZavW2YcyHRNm8x7Q8tl2Kur8gm
         3+jh4911RZhsjQhX9R5CsUW3PaSSaGvw5ZetxkO7AnV+Xa3T5N3l3DRllOqD8rPXKmXC
         KclzbvH0usaNggMEBxzARq2dSLxQGKSOGsQIpHdYhXoo4+cRfUMD4nSmV6srPKDe4VLy
         DBdb9tdB/omdtBTA6Ne2cwu9CRozmGTsdUEzeDMH815EY5J3y3rJzOMNQHWVPtRtrXw3
         VW1kA4m4aB2yciJEcuttW/dpoElRbmwRdU850OHxtp5IoZGQs1+GF3O+EGq4waU7/LJu
         8qGg==
X-Gm-Message-State: AOJu0YxgHyOnyaYjMfVBpsocyb191XhgN5nmxb0yIZtn7MuuVCTYdESw
	t5gH7uzkVPtBrFEhrtMS15mXWnjvPaZ02fFhCk4AoERdqV+a3Gkbyrpxhz9v8Tmd1kB72KB9+HH
	VTieYDZsrKYELqK1xSArMtdYT4wU=
X-Google-Smtp-Source: AGHT+IFbX63EoqOCbqmGdurcRaUYtJDJr4co6ZCpn1PGjCFnGZ2B8o24X9VWkSN4YfTuJeWJSK2QQA/nffXHrCQWDJw=
X-Received: by 2002:adf:b219:0:b0:34a:5683:1c37 with SMTP id
 u25-20020adfb219000000b0034a56831c37mr5807970wra.51.1713782278534; Mon, 22
 Apr 2024 03:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240420072917.914160-1-martin.jansa@gmail.com>
 <CADkTA4O0aONd4+4u4ZnTTiDNv2CqoQZvUVKSZM=5Dk08QpWDog@mail.gmail.com> <PR3PR02MB6252A820016A2ECCB1D5C3FEC6122@PR3PR02MB6252.eurprd02.prod.outlook.com>
In-Reply-To: <PR3PR02MB6252A820016A2ECCB1D5C3FEC6122@PR3PR02MB6252.eurprd02.prod.outlook.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 22 Apr 2024 12:37:46 +0200
Message-ID: <CA+chaQeUX0zNuUYYzK4n9XFhE810p+Tcn8xLE0scwM_RnxLL+A@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCHv2] diod: Build in 32bit systems with
 64bit time_t
To: ola.x.nilsson@axis.com
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Apr 2024 10:38:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8690

The From: in your original e-mail was mangled by ML:

...
From: "Ola x Nilsson via lists.yoctoproject.org"
<ola.x.nilsson=3Daxis.com@lists.yoctoproject.org>
To: <meta-virtualization@lists.yoctoproject.org>
CC: <olani@axis.com>
Subject: [meta-virtualization][PATCH] diod: Build in 32bit systems
with 64bit time_t
...

See the e-mail from Bruce (with a link how to fix that):
https://lists.yoctoproject.org/g/meta-virtualization/message/8677

On Mon, Apr 22, 2024 at 12:14=E2=80=AFPM Ola x Nilsson via
lists.yoctoproject.org <ola.x.nilsson=3Daxis.com@lists.yoctoproject.org>
wrote:
>
>
> Sorry, I did not realize you required a new patch from me.
> What was wrong with my patch exactly? I had already deleted the email
> and could not see anything wrong in the groups.io web-ui.
> I have not changed my setup and have sent patches successfully before.
>
> (There is something wrong with our SMTP server today, I'm forced to use t=
he outlook web client *shudder*.  Sorry if I sent this more than once by mi=
stake. )
>
> /Ola
>
> On Sun, Apr 21 2024, Bruce Ashfield wrote:
>
> > On Sat, Apr 20, 2024 at 3:29=C3=A2=E2=82=AC=C2=AFAM Martin Jansa via li=
sts.yoctoproject.org
> > <martin.jansa=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> >> From: Ola x Nilsson <olani@axis.com>
> >>
> >> Signed-off-by: Ola x Nilsson <olani@axis.com>
> >> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> >> ---
> >> v2: just fixed Author
> >>
> >>
> > While I appreciate the fix,  I'm going to wait until Ola ack's this, as=
 I
> > need to know that their setup is fixed so that future patches have a
> > correct author field.
> >
> > Otherwise, we are just pushing the issue of their configuration down th=
e
> > road.
> >
> > Bruce
> >
> >
> >
> >>  recipes-extended/diod/diod_1.0.24.bb          |   1 +
> >>  ...ous-time_t-sizes-in-printf-and-scanf.patch | 100 +++++++++++++++++=
+
> >>  2 files changed, 101 insertions(+)
> >>  create mode 100644
> >> recipes-extended/diod/files/0002-Handle-various-time_t-sizes-in-printf=
-and-scanf.patch
> >>
> >> diff --git a/recipes-extended/diod/diod_1.0.24.bb b/recipes-extended/d=
iod/
> >> diod_1.0.24.bb
> >> index 5e191dc0..6019fbfb 100644
> >> --- a/recipes-extended/diod/diod_1.0.24.bb
> >> +++ b/recipes-extended/diod/diod_1.0.24.bb
> >> @@ -14,6 +14,7 @@ SRC_URI =3D "git://
> >> github.com/chaos/diod.git;protocol=3Dhttps;branch=3Dmaster \
> >>             file://diod \
> >>             file://diod.conf \
> >>             file://0001-build-Find-lua-with-pkg-config.patch \
> >> +
> >>  file://0002-Handle-various-time_t-sizes-in-printf-and-scanf.patch \
> >>             "
> >>  DEPENDS =3D "libcap ncurses tcp-wrappers lua"
> >>
> >> diff --git
> >> a/recipes-extended/diod/files/0002-Handle-various-time_t-sizes-in-prin=
tf-and-scanf.patch
> >> b/recipes-extended/diod/files/0002-Handle-various-time_t-sizes-in-prin=
tf-and-scanf.patch
> >> new file mode 100644
> >> index 00000000..3c13c101
> >> --- /dev/null
> >> +++
> >> b/recipes-extended/diod/files/0002-Handle-various-time_t-sizes-in-prin=
tf-and-scanf.patch
> >> @@ -0,0 +1,100 @@
> >> +From 04b0c5a5cb9e32090b177ff7327ad3260783abe0 Mon Sep 17 00:00:00 200=
1
> >> +From: Ola x Nilsson <olani@axis.com>
> >> +Date: Mon, 15 Apr 2024 17:31:44 +0200
> >> +Subject: [PATCH] Handle various time_t sizes in printf and scanf
> >> +
> >> +The members of the timeval struct are both signed (defined by POSIX)
> >> +and typically both 64 bits on a system where time_t is 64 bits.  This
> >> +is possible also on 32 bit systems where time_t is larger to handle
> >> +the 2038 problem.
> >> +
> >> +It's practically impossible to find a type and printf format that
> >> +works even on all glibc systems.  Play it safe and always use printf
> >> +with intmax_t and explict int64_t variables for scanf.
> >> +
> >> +Upstream-Status: Submitted [https://github.com/chaos/diod/pull/100]
> >> +Signed-off-by: Ola x Nilsson <olani@axis.com>
> >> +---
> >> + libnpfs/conn.c   | 5 +++--
> >> + libnpfs/ctl.c    | 7 ++++---
> >> + utils/dioddate.c | 8 +++++++-
> >> + 3 files changed, 14 insertions(+), 6 deletions(-)
> >> +
> >> +diff --git a/libnpfs/conn.c b/libnpfs/conn.c
> >> +index 6e85fff..c34c840 100644
> >> +--- a/libnpfs/conn.c
> >> ++++ b/libnpfs/conn.c
> >> +@@ -16,6 +16,7 @@
> >> + #include <stdio.h>
> >> + #include <string.h>
> >> + #include <stdint.h>
> >> ++#include <inttypes.h>
> >> + #include <stdarg.h>
> >> + #include <errno.h>
> >> + #include <pthread.h>
> >> +@@ -133,8 +134,8 @@ _debug_trace (Npsrv *srv, Npfcall *fc)
> >> +                               (void)gettimeofday(&b, NULL);
> >> +                       (void)gettimeofday(&a, NULL);
> >> +                       timersub(&a, &b, &c);
> >> +-                      np_logmsg(srv, "[%lu.%-3lu] %s",
> >> +-                                c.tv_sec, c.tv_usec/1000, s);
> >> ++                      np_logmsg(srv, "[%"PRIdMAX".%-3"PRIdMAX"] %s",
> >> ++                                (intmax_t)c.tv_sec,
> >> (intmax_t)c.tv_usec/1000, s);
> >> +               } else
> >> +                       np_logmsg(srv, "%s", s);
> >> +       }
> >> +diff --git a/libnpfs/ctl.c b/libnpfs/ctl.c
> >> +index f40cde4..317a22e 100644
> >> +--- a/libnpfs/ctl.c
> >> ++++ b/libnpfs/ctl.c
> >> +@@ -16,6 +16,7 @@
> >> + #include <stdio.h>
> >> + #include <string.h>
> >> + #include <stdint.h>
> >> ++#include <inttypes.h>
> >> + #include <stdarg.h>
> >> + #include <pthread.h>
> >> + #include <errno.h>
> >> +@@ -291,9 +292,9 @@ _ctl_get_date (char *name, void *a)
> >> +               np_uerror (errno);
> >> +               goto error;
> >> +       }
> >> +-      if (aspf (&s, &len, "%lu.%lu %d.%d\n",
> >> +-                                      tv.tv_sec,         tv.tv_usec,
> >> +-                                      tz.tz_minuteswest, tz.tz_dstti=
me)
> >> < 0) {
> >> ++      if (aspf (&s, &len, "%"PRIdMAX".%"PRIdMAX" %d.%d\n",
> >> ++                                      (uintmax_t)tv.tv_sec,
> >> (uintmax_t)tv.tv_usec,
> >> ++                                      tz.tz_minuteswest,
> >> tz.tz_dsttime) < 0) {
> >> +               np_uerror (ENOMEM);
> >> +               goto error;
> >> +       }
> >> +diff --git a/utils/dioddate.c b/utils/dioddate.c
> >> +index bde002f..f392792 100644
> >> +--- a/utils/dioddate.c
> >> ++++ b/utils/dioddate.c
> >> +@@ -21,6 +21,7 @@
> >> + #include <unistd.h>
> >> + #include <stdlib.h>
> >> + #include <stdint.h>
> >> ++#include <inttypes.h>
> >> + #include <stdarg.h>
> >> + #include <stdio.h>
> >> + #if HAVE_GETOPT_H
> >> +@@ -142,11 +143,16 @@ main (int argc, char *argv[])
> >> +         errn (np_rerror (), "error reading date");
> >> +         goto done;
> >> +     }
> >> +-    if (sscanf (buf, "%lu.%lu %d.%d", &tv.tv_sec, &tv.tv_usec,
> >> ++
> >> ++    int64_t sec =3D 0, usec =3D 0;
> >> ++    if (sscanf (buf, "%"SCNd64".%"SCNd64" %d.%d", &sec, &usec,
> >> +                                     &tz.tz_minuteswest, &tz.tz_dstti=
me)
> >> !=3D 4) {
> >> +         msg ("error scanning returned date: %s", buf);
> >> +         goto done;
> >> +     }
> >> ++    tv.tv_sec =3D sec;
> >> ++    tv.tv_usec =3D usec;
> >> ++
> >> +     if (Sopt) {
> >> +         if (settimeofday (&tv, &tz) < 0)
> >> +             err_exit ("settimeofday");
> >> --
> >> 2.44.0
> >>
> >>
> >>
> >>
> >>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8689): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8689
> Mute This Topic: https://lists.yoctoproject.org/mt/105632595/3617156
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

