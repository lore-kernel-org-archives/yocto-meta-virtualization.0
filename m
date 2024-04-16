Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A03C4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 12:09:41 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.19066.1713269376778734798
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 16 Apr 2024 05:09:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T+QN9R/U;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-349772bdb05so432336f8f.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 16 Apr 2024 05:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713269375; x=1713874175; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rd1lWJFLFwDsHs7xr6YBtyGEFEamDNg/yrphgXpjb2k=;
        b=T+QN9R/UjTikXmz3pvqLX420HuTFVIHORUZajSAygz5Dh6Khe53ieWF2GZz/mVBU07
         tcmV8TDq4qVx/3CKdJsDnjiAI5i+1j/FTBqQlm7Sqjm25eVAw7wHDEsbdpu4myusVk6x
         R3NKZ3zvEanCle4Pwb3De0rkguzBHqnCDok0OFPghQOKSvaXsgRcZpsvYCvgzPJ5QTDH
         TB5jRARr7ftCBu3c/3/iKSE0gblA4UeXPFjp8R3VQvAi/OebWaBJz0C1cVksxEbBwJcX
         CKhuDJZutfcFCEsrhoIs6oiDbinlPrC6nqbPQOxalDVeI5cayObMelIKD+1hqIeObnYi
         EMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713269375; x=1713874175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rd1lWJFLFwDsHs7xr6YBtyGEFEamDNg/yrphgXpjb2k=;
        b=Xhbh53SdyBA8t3jA1VwgAJEw750Bv/MkwydVVLWdxqw3EmNW4m6zJ0UwAGgipskssf
         WdMIJpG4KFKytnOMuoUjeR7tSNwXVgK8f0+cpfleCFqs+uSnAM8oAkkb+exEhfMlaKYP
         0ZbTDkoYEo32p53r38RRE0JZdJpxYc5RIbfx//5CPUwrJUlJ8e7fkkvMtB1rqiorgS5T
         7xwwwRSev3SyRrmCl8RQIWS5R3iEnD6YUTN8W0fkrtQS22lJcX3Mn8mATgG2ZM7i6Wgw
         YDxIcDMGVelqIKrUSVX8Du7LIahwT14Y/mwD1bQ0le+k5XhEosT9xOBNdrZqXga1d8V4
         rJlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYh2WB0mAA0e6fQ3KFHbfGqAL3NqKWM2JhTpjt6ex2pXya64mNuQMMmXOhuEuZ5W2csROrJsTp1nlEWPg2tkaw3uypob7MBBv4tkdmwdPVOd5QOEZLkx1aeMo=
X-Gm-Message-State: AOJu0YyvhOqKyXfStsTr0gT9QunjN8wAyHj7xoi3Siw0oXVBRthyoZ3w
	qnnEAoz4ApjbXBfSUhGCozwPa2SrMrLg1WIkVUAlCuf52ICp6w8LI+7aGvjdr7T2iEpKmXGiOMF
	7C5d/cGjQqwu9y8WJKvFOY5858JI=
X-Google-Smtp-Source: AGHT+IFE2ZJmc3/M3jJKyqhvu+bDlMgrk+DShOiPKL/Ml0ifVS1vTi+ARh1Ho53jJzxteXtaD4YfQAny1FYEdej/m/k=
X-Received: by 2002:a5d:588c:0:b0:346:b79c:b1f5 with SMTP id
 n12-20020a5d588c000000b00346b79cb1f5mr13074254wrf.52.1713269374876; Tue, 16
 Apr 2024 05:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240415161144.3107769-1-olani@axis.com> <Zh2UXTk6GYWVGGxg@gmail.com>
In-Reply-To: <Zh2UXTk6GYWVGGxg@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 16 Apr 2024 14:09:22 +0200
Message-ID: <CA+chaQfmn0AznryPwF16-ZBJuH+AQJW-e8x6h4WuPofsGuLjnw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] diod: Build in 32bit systems with
 64bit time_t
To: bruce.ashfield@gmail.com
Cc: ola.x.nilsson@axis.com, meta-virtualization@lists.yoctoproject.org, 
	olani@axis.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 16 Apr 2024 12:09:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8681

Thanks for fix.

Tested-by: Martin Jansa <martin.jansa@gmail.com>

On Mon, Apr 15, 2024 at 10:56=E2=80=AFPM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> Thanks for the fix!
>
> Your patching workflow is misconfigured and the author
> field is incorrect.
>
> Total 12 (delta 7), reused 0 (delta 0), pack-reused 0
> remote: ##############################################
> remote: Invalid author Ola x Nilsson via lists.yoctoproject.org
> remote: ##############################################
>
> See: https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.h=
tml#troubleshooting-email-issues
>
> Bruce
>
> In message: [meta-virtualization][PATCH] diod: Build in 32bit systems wit=
h 64bit time_t
> on 15/04/2024 Ola x Nilsson via lists.yoctoproject.org wrote:
>
> > Change-Id: I84c9c3526b79a63de7cdc2f0841bce26e29a72a2
> > Signed-off-by: Ola x Nilsson <olani@axis.com>
> > ---
> >  recipes-extended/diod/diod_1.0.24.bb          |   1 +
> >  ...ous-time_t-sizes-in-printf-and-scanf.patch | 100 ++++++++++++++++++
> >  2 files changed, 101 insertions(+)
> >  create mode 100644 recipes-extended/diod/files/0002-Handle-various-tim=
e_t-sizes-in-printf-and-scanf.patch
> >
> > diff --git a/recipes-extended/diod/diod_1.0.24.bb b/recipes-extended/di=
od/diod_1.0.24.bb
> > index 5e191dc0..6019fbfb 100644
> > --- a/recipes-extended/diod/diod_1.0.24.bb
> > +++ b/recipes-extended/diod/diod_1.0.24.bb
> > @@ -14,6 +14,7 @@ SRC_URI =3D "git://github.com/chaos/diod.git;protocol=
=3Dhttps;branch=3Dmaster \
> >             file://diod \
> >             file://diod.conf \
> >             file://0001-build-Find-lua-with-pkg-config.patch \
> > +           file://0002-Handle-various-time_t-sizes-in-printf-and-scanf=
.patch \
> >             "
> >  DEPENDS =3D "libcap ncurses tcp-wrappers lua"
> >
> > diff --git a/recipes-extended/diod/files/0002-Handle-various-time_t-siz=
es-in-printf-and-scanf.patch b/recipes-extended/diod/files/0002-Handle-vari=
ous-time_t-sizes-in-printf-and-scanf.patch
> > new file mode 100644
> > index 00000000..3c13c101
> > --- /dev/null
> > +++ b/recipes-extended/diod/files/0002-Handle-various-time_t-sizes-in-p=
rintf-and-scanf.patch
> > @@ -0,0 +1,100 @@
> > +From 04b0c5a5cb9e32090b177ff7327ad3260783abe0 Mon Sep 17 00:00:00 2001
> > +From: Ola x Nilsson <olani@axis.com>
> > +Date: Mon, 15 Apr 2024 17:31:44 +0200
> > +Subject: [PATCH] Handle various time_t sizes in printf and scanf
> > +
> > +The members of the timeval struct are both signed (defined by POSIX)
> > +and typically both 64 bits on a system where time_t is 64 bits.  This
> > +is possible also on 32 bit systems where time_t is larger to handle
> > +the 2038 problem.
> > +
> > +It's practically impossible to find a type and printf format that
> > +works even on all glibc systems.  Play it safe and always use printf
> > +with intmax_t and explict int64_t variables for scanf.
> > +
> > +Upstream-Status: Submitted [https://github.com/chaos/diod/pull/100]
> > +Signed-off-by: Ola x Nilsson <olani@axis.com>
> > +---
> > + libnpfs/conn.c   | 5 +++--
> > + libnpfs/ctl.c    | 7 ++++---
> > + utils/dioddate.c | 8 +++++++-
> > + 3 files changed, 14 insertions(+), 6 deletions(-)
> > +
> > +diff --git a/libnpfs/conn.c b/libnpfs/conn.c
> > +index 6e85fff..c34c840 100644
> > +--- a/libnpfs/conn.c
> > ++++ b/libnpfs/conn.c
> > +@@ -16,6 +16,7 @@
> > + #include <stdio.h>
> > + #include <string.h>
> > + #include <stdint.h>
> > ++#include <inttypes.h>
> > + #include <stdarg.h>
> > + #include <errno.h>
> > + #include <pthread.h>
> > +@@ -133,8 +134,8 @@ _debug_trace (Npsrv *srv, Npfcall *fc)
> > +                             (void)gettimeofday(&b, NULL);
> > +                     (void)gettimeofday(&a, NULL);
> > +                     timersub(&a, &b, &c);
> > +-                    np_logmsg(srv, "[%lu.%-3lu] %s",
> > +-                              c.tv_sec, c.tv_usec/1000, s);
> > ++                    np_logmsg(srv, "[%"PRIdMAX".%-3"PRIdMAX"] %s",
> > ++                              (intmax_t)c.tv_sec, (intmax_t)c.tv_usec=
/1000, s);
> > +             } else
> > +                     np_logmsg(srv, "%s", s);
> > +     }
> > +diff --git a/libnpfs/ctl.c b/libnpfs/ctl.c
> > +index f40cde4..317a22e 100644
> > +--- a/libnpfs/ctl.c
> > ++++ b/libnpfs/ctl.c
> > +@@ -16,6 +16,7 @@
> > + #include <stdio.h>
> > + #include <string.h>
> > + #include <stdint.h>
> > ++#include <inttypes.h>
> > + #include <stdarg.h>
> > + #include <pthread.h>
> > + #include <errno.h>
> > +@@ -291,9 +292,9 @@ _ctl_get_date (char *name, void *a)
> > +             np_uerror (errno);
> > +             goto error;
> > +     }
> > +-    if (aspf (&s, &len, "%lu.%lu %d.%d\n",
> > +-                                    tv.tv_sec,         tv.tv_usec,
> > +-                                    tz.tz_minuteswest, tz.tz_dsttime)=
 < 0) {
> > ++    if (aspf (&s, &len, "%"PRIdMAX".%"PRIdMAX" %d.%d\n",
> > ++                                    (uintmax_t)tv.tv_sec, (uintmax_t)=
tv.tv_usec,
> > ++                                    tz.tz_minuteswest,    tz.tz_dstti=
me) < 0) {
> > +             np_uerror (ENOMEM);
> > +             goto error;
> > +     }
> > +diff --git a/utils/dioddate.c b/utils/dioddate.c
> > +index bde002f..f392792 100644
> > +--- a/utils/dioddate.c
> > ++++ b/utils/dioddate.c
> > +@@ -21,6 +21,7 @@
> > + #include <unistd.h>
> > + #include <stdlib.h>
> > + #include <stdint.h>
> > ++#include <inttypes.h>
> > + #include <stdarg.h>
> > + #include <stdio.h>
> > + #if HAVE_GETOPT_H
> > +@@ -142,11 +143,16 @@ main (int argc, char *argv[])
> > +         errn (np_rerror (), "error reading date");
> > +         goto done;
> > +     }
> > +-    if (sscanf (buf, "%lu.%lu %d.%d", &tv.tv_sec, &tv.tv_usec,
> > ++
> > ++    int64_t sec =3D 0, usec =3D 0;
> > ++    if (sscanf (buf, "%"SCNd64".%"SCNd64" %d.%d", &sec, &usec,
> > +                                     &tz.tz_minuteswest, &tz.tz_dsttim=
e) !=3D 4) {
> > +         msg ("error scanning returned date: %s", buf);
> > +         goto done;
> > +     }
> > ++    tv.tv_sec =3D sec;
> > ++    tv.tv_usec =3D usec;
> > ++
> > +     if (Sopt) {
> > +         if (settimeofday (&tv, &tz) < 0)
> > +             err_exit ("settimeofday");
> > --
> > 2.39.2
> >
>
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8677): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8677
> Mute This Topic: https://lists.yoctoproject.org/mt/105539333/3617156
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

