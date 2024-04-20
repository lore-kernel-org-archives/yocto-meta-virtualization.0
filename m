Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD947C4345F
	for <webhook@archiver.kernel.org>; Sat, 20 Apr 2024 16:11:28 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.15005.1713629485535023097
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 20 Apr 2024 09:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hjwr20gY;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-234f5e54446so1279646fac.1
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 20 Apr 2024 09:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713629485; x=1714234285; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZCOvcK28E6mpcnaWMElzEgOUsb+oI4Pn11vbfpnaM8=;
        b=hjwr20gYBTyPNkAlTXccO7lnkB4SN/1R+R9U3WpGOcSuCjI0op3h1X8rVdchCNH1K8
         fE6AWD7k0u6FNbo7+7PKTLotY0uCyrPDeED+igFbqRoOEku2aGtPWbcL2TccGu/eNexK
         BSKEqXxT2+Dhg2J/LHLmW2d5euViABlPYJHUQCsSM2m4aE7oXsA1UcPjFVJzTica7ErB
         Phf5MRNMSFs7Hd/8QEbiCdsP3wyTyy7oCgxYJeFM4b2Oi49JNaRvdRxAQg4n6dZrgBZm
         O/vVQgt2NEnAGeniVPGCn33tDp7pNpJRWwjOwrnXA8KHaGYTlUbF3xjjj6dYoaiurkz8
         W7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713629485; x=1714234285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZCOvcK28E6mpcnaWMElzEgOUsb+oI4Pn11vbfpnaM8=;
        b=D2UXIZFdN4PdjmKQU1X0LTEeQnbB/LiSRhC1PhOe4e/G6B6PH9AvtE983F2Kofy2zk
         Ewy6iwKF3NrLw10+pYQ9iHVWVirMHROi/qhfIgABhEY8dtTx+UEiNB5KgPAZ0HLXafgI
         n5PQV3IQiaUwuljNU9Hz4h81CiRjxuIoW7ic75Mqzxj967vVIM14KuRsx5ZyKGc7ALpx
         mn0EoBojAL0RJiHewv6Cxz+Lbvkf5KO6s6KoJcXc/8K4/dh3B9rF08QuY1VfCojpHYf1
         h6C5OYGlAoy2mFBdqCg8KWpyy3z9jL27hDCmqo4foWL/o7QYTpYddwbh+1/K8UszPtjP
         pCwQ==
X-Gm-Message-State: AOJu0Yyp0YwNYtidsnTtSv5pQPHuaR5LBNdJ1EqVIB7JdrEAEAZ7LZHp
	yPFrN/19WG57CRaXyLhhGmNEActePsG9ZL7lQ7FhYsX5nCHvLoPo61C3PjP+/l/QY5hPIteUokQ
	i+DCy1eq3SDjN85BYFSnh8ZirLOw=
X-Google-Smtp-Source: AGHT+IGpTeeYZ9osdhp2v27MgvpIar2DzmHzibrYSrSJJX4PuA2KS2yWBSt/F4EUY7EEhUWE+MIzj/1Il9VJMwwkEdE=
X-Received: by 2002:a05:6870:ae89:b0:22e:7f50:7b01 with SMTP id
 uw9-20020a056870ae8900b0022e7f507b01mr3523221oab.29.1713629483319; Sat, 20
 Apr 2024 09:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240420072917.914160-1-martin.jansa@gmail.com>
In-Reply-To: <20240420072917.914160-1-martin.jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 20 Apr 2024 09:10:56 -0700
Message-ID: <CAMKF1sq6cS34OH6zxXh2b+Sb_a0Ms2xXiATF4WOsYS5x7rqxdw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCHv2] diod: Build in 32bit systems with
 64bit time_t
To: martin.jansa@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org, Ola x Nilsson <olani@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 20 Apr 2024 16:11:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8687

On Sat, Apr 20, 2024 at 12:29=E2=80=AFAM Martin Jansa via
lists.yoctoproject.org <martin.jansa=3Dgmail.com@lists.yoctoproject.org>
wrote:
>
> From: Ola x Nilsson <olani@axis.com>
>
> Signed-off-by: Ola x Nilsson <olani@axis.com>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
> v2: just fixed Author
>
>  recipes-extended/diod/diod_1.0.24.bb          |   1 +
>  ...ous-time_t-sizes-in-printf-and-scanf.patch | 100 ++++++++++++++++++
>  2 files changed, 101 insertions(+)
>  create mode 100644 recipes-extended/diod/files/0002-Handle-various-time_=
t-sizes-in-printf-and-scanf.patch
>
> diff --git a/recipes-extended/diod/diod_1.0.24.bb b/recipes-extended/diod=
/diod_1.0.24.bb
> index 5e191dc0..6019fbfb 100644
> --- a/recipes-extended/diod/diod_1.0.24.bb
> +++ b/recipes-extended/diod/diod_1.0.24.bb
> @@ -14,6 +14,7 @@ SRC_URI =3D "git://github.com/chaos/diod.git;protocol=
=3Dhttps;branch=3Dmaster \
>             file://diod \
>             file://diod.conf \
>             file://0001-build-Find-lua-with-pkg-config.patch \
> +           file://0002-Handle-various-time_t-sizes-in-printf-and-scanf.p=
atch \
>             "
>  DEPENDS =3D "libcap ncurses tcp-wrappers lua"
>
> diff --git a/recipes-extended/diod/files/0002-Handle-various-time_t-sizes=
-in-printf-and-scanf.patch b/recipes-extended/diod/files/0002-Handle-variou=
s-time_t-sizes-in-printf-and-scanf.patch
> new file mode 100644
> index 00000000..3c13c101
> --- /dev/null
> +++ b/recipes-extended/diod/files/0002-Handle-various-time_t-sizes-in-pri=
ntf-and-scanf.patch
> @@ -0,0 +1,100 @@
> +From 04b0c5a5cb9e32090b177ff7327ad3260783abe0 Mon Sep 17 00:00:00 2001
> +From: Ola x Nilsson <olani@axis.com>
> +Date: Mon, 15 Apr 2024 17:31:44 +0200
> +Subject: [PATCH] Handle various time_t sizes in printf and scanf
> +
> +The members of the timeval struct are both signed (defined by POSIX)
> +and typically both 64 bits on a system where time_t is 64 bits.  This
> +is possible also on 32 bit systems where time_t is larger to handle
> +the 2038 problem.
> +
> +It's practically impossible to find a type and printf format that
> +works even on all glibc systems.  Play it safe and always use printf
> +with intmax_t and explict int64_t variables for scanf.
> +
> +Upstream-Status: Submitted [https://github.com/chaos/diod/pull/100]
> +Signed-off-by: Ola x Nilsson <olani@axis.com>
> +---
> + libnpfs/conn.c   | 5 +++--
> + libnpfs/ctl.c    | 7 ++++---
> + utils/dioddate.c | 8 +++++++-
> + 3 files changed, 14 insertions(+), 6 deletions(-)
> +
> +diff --git a/libnpfs/conn.c b/libnpfs/conn.c
> +index 6e85fff..c34c840 100644
> +--- a/libnpfs/conn.c
> ++++ b/libnpfs/conn.c
> +@@ -16,6 +16,7 @@
> + #include <stdio.h>
> + #include <string.h>
> + #include <stdint.h>
> ++#include <inttypes.h>
> + #include <stdarg.h>
> + #include <errno.h>
> + #include <pthread.h>
> +@@ -133,8 +134,8 @@ _debug_trace (Npsrv *srv, Npfcall *fc)
> +                               (void)gettimeofday(&b, NULL);
> +                       (void)gettimeofday(&a, NULL);
> +                       timersub(&a, &b, &c);
> +-                      np_logmsg(srv, "[%lu.%-3lu] %s",
> +-                                c.tv_sec, c.tv_usec/1000, s);
> ++                      np_logmsg(srv, "[%"PRIdMAX".%-3"PRIdMAX"] %s",
> ++                                (intmax_t)c.tv_sec, (intmax_t)c.tv_usec=
/1000, s);
> +               } else
> +                       np_logmsg(srv, "%s", s);
> +       }
> +diff --git a/libnpfs/ctl.c b/libnpfs/ctl.c
> +index f40cde4..317a22e 100644
> +--- a/libnpfs/ctl.c
> ++++ b/libnpfs/ctl.c
> +@@ -16,6 +16,7 @@
> + #include <stdio.h>
> + #include <string.h>
> + #include <stdint.h>
> ++#include <inttypes.h>
> + #include <stdarg.h>
> + #include <pthread.h>
> + #include <errno.h>
> +@@ -291,9 +292,9 @@ _ctl_get_date (char *name, void *a)
> +               np_uerror (errno);
> +               goto error;
> +       }
> +-      if (aspf (&s, &len, "%lu.%lu %d.%d\n",
> +-                                      tv.tv_sec,         tv.tv_usec,
> +-                                      tz.tz_minuteswest, tz.tz_dsttime)=
 < 0) {
> ++      if (aspf (&s, &len, "%"PRIdMAX".%"PRIdMAX" %d.%d\n",
> ++                                      (uintmax_t)tv.tv_sec, (uintmax_t)=
tv.tv_usec,
> ++                                      tz.tz_minuteswest,    tz.tz_dstti=
me) < 0) {

LGTM

> +               np_uerror (ENOMEM);
> +               goto error;
> +       }
> +diff --git a/utils/dioddate.c b/utils/dioddate.c
> +index bde002f..f392792 100644
> +--- a/utils/dioddate.c
> ++++ b/utils/dioddate.c
> +@@ -21,6 +21,7 @@
> + #include <unistd.h>
> + #include <stdlib.h>
> + #include <stdint.h>
> ++#include <inttypes.h>
> + #include <stdarg.h>
> + #include <stdio.h>
> + #if HAVE_GETOPT_H
> +@@ -142,11 +143,16 @@ main (int argc, char *argv[])
> +         errn (np_rerror (), "error reading date");
> +         goto done;
> +     }
> +-    if (sscanf (buf, "%lu.%lu %d.%d", &tv.tv_sec, &tv.tv_usec,
> ++
> ++    int64_t sec =3D 0, usec =3D 0;
> ++    if (sscanf (buf, "%"SCNd64".%"SCNd64" %d.%d", &sec, &usec,
> +                                     &tz.tz_minuteswest, &tz.tz_dsttime)=
 !=3D 4) {
> +         msg ("error scanning returned date: %s", buf);
> +         goto done;
> +     }
> ++    tv.tv_sec =3D sec;
> ++    tv.tv_usec =3D usec;
> ++
> +     if (Sopt) {
> +         if (settimeofday (&tv, &tz) < 0)
> +             err_exit ("settimeofday");
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8686): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8686
> Mute This Topic: https://lists.yoctoproject.org/mt/105632595/1997914
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

