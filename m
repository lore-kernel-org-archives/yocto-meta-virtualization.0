Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B61C10F15
	for <webhook@archiver.kernel.org>; Thu, 25 Apr 2024 17:52:06 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.23716.1714067517726219385
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 25 Apr 2024 10:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JadmdsE/;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-434c695ec3dso7233921cf.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 25 Apr 2024 10:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714067517; x=1714672317; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BzOix1VTjmUNwMkkL/z3Aw5SWb0VfVFXZEO+jWTLD+s=;
        b=JadmdsE//HQk76kZxYn3LIMUBBBWcaKTLRkmN3YRDUhV7vj8CLbNzGkKu+4hxtBQR+
         ARNwsiEW7F31HrKgSNrtHt0UFEzUK6oPQNZDkfOxowPyypor3VZIR2Cck1GpwOPja6u+
         eTbd3TD6TgaU1fgM5te5msiCWioVTVTqex4CxZ49AemJoN3gg2Q00Aa4SlL/Ol3a8Yg/
         Ds/9dNAsr0NziBnrogxMxox9OTmuhiUVqp72sC+2cU7t6RVAG3wZcXSHLSUlBU00UXKE
         ohQsT4ee4AWdjyO/RbArnXIRlr7F8m2BZmNoXwl+B5A4H6F2kPqQxi+1LVAHbRiuZP5d
         eNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714067517; x=1714672317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BzOix1VTjmUNwMkkL/z3Aw5SWb0VfVFXZEO+jWTLD+s=;
        b=oD/ijyM2E8zHdIcmH0DsGdHzpU9WndVLgitc1SiOuQfXwwP1lFD+A+NHNUFYnaXT94
         qiahSexx/FceDBmDv/zrirAdiECXGgP0gQ6KJ14JJApUehhfkHEtaGxrV7NjEHtHw6/w
         uIlXd32FQ5AhuHs+yhU5izM+iCtMH+BqxoTQKAsMlZnakMUitV6nOa0WryFEskzYjSfx
         abnoSnGHtZik4zCjBCFKFJwyZZa5X3B8AQIIkzDJDNdTcY6jZ5Mlal6T6xAdva4Rf3mw
         QZgegwnim1ESGVSGVg/h0uHPZxxT8SBCFp26DUtNeQeiMxKoN1auH/mt8g2LTmKe7iHz
         oO4g==
X-Gm-Message-State: AOJu0YyLUze5Ueg9wa3tGDIB3BchGTDLGjWWCcyqvGrLr1kV2aNL2aAb
	Ntty2x+RCp7sj5f/hKvylwKjfOQ4C9tJ2X0mlM4Uk7FCvUGyRXBe
X-Google-Smtp-Source: AGHT+IGWuvMdiGArFbPC+jyUd7wsU+l8+epJ8ssLztmBqVoXfNUQmFBU/Lz7G3AbQYG7OWtjCxtgcA==
X-Received: by 2002:a05:622a:1a1b:b0:437:bfea:1f43 with SMTP id f27-20020a05622a1a1b00b00437bfea1f43mr491416qtb.32.1714067516581;
        Thu, 25 Apr 2024 10:51:56 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id h10-20020ac8138a000000b00439a9319a4fsm4069042qtj.48.2024.04.25.10.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 10:51:56 -0700 (PDT)
Date: Thu, 25 Apr 2024 17:51:54 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: ola.x.nilsson@axis.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH v3] diod: Build in 32bit systems
 with 64bit time_t
Message-ID: <ZiqYOuvCbmfWKjHZ@gmail.com>
References: <20240424083508.824061-1-olani@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240424083508.824061-1-olani@axis.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 25 Apr 2024 17:52:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8702

v3 looks good and is now merged to master and scarthgap.

Bruce

In message: [meta-virtualization][PATCH v3] diod: Build in 32bit systems with 64bit time_t
on 24/04/2024 Ola x Nilsson via lists.yoctoproject.org wrote:

> From: Ola x Nilsson <olani@axis.com>
> 
> Signed-off-by: Ola x Nilsson <olani@axis.com>
> ---
>  recipes-extended/diod/diod_1.0.24.bb          |   1 +
>  ...ous-time_t-sizes-in-printf-and-scanf.patch | 100 ++++++++++++++++++
>  2 files changed, 101 insertions(+)
>  create mode 100644 recipes-extended/diod/files/0002-Handle-various-time_t-sizes-in-printf-and-scanf.patch
> 
> diff --git a/recipes-extended/diod/diod_1.0.24.bb b/recipes-extended/diod/diod_1.0.24.bb
> index 5e191dc0..6019fbfb 100644
> --- a/recipes-extended/diod/diod_1.0.24.bb
> +++ b/recipes-extended/diod/diod_1.0.24.bb
> @@ -14,6 +14,7 @@ SRC_URI = "git://github.com/chaos/diod.git;protocol=https;branch=master \
>             file://diod \
>             file://diod.conf \
>             file://0001-build-Find-lua-with-pkg-config.patch \
> +           file://0002-Handle-various-time_t-sizes-in-printf-and-scanf.patch \
>             "
>  DEPENDS = "libcap ncurses tcp-wrappers lua"
>  
> diff --git a/recipes-extended/diod/files/0002-Handle-various-time_t-sizes-in-printf-and-scanf.patch b/recipes-extended/diod/files/0002-Handle-various-time_t-sizes-in-printf-and-scanf.patch
> new file mode 100644
> index 00000000..3c13c101
> --- /dev/null
> +++ b/recipes-extended/diod/files/0002-Handle-various-time_t-sizes-in-printf-and-scanf.patch
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
> + 				(void)gettimeofday(&b, NULL);
> + 			(void)gettimeofday(&a, NULL);
> + 			timersub(&a, &b, &c);
> +-			np_logmsg(srv, "[%lu.%-3lu] %s",
> +-				  c.tv_sec, c.tv_usec/1000, s);
> ++			np_logmsg(srv, "[%"PRIdMAX".%-3"PRIdMAX"] %s",
> ++				  (intmax_t)c.tv_sec, (intmax_t)c.tv_usec/1000, s);
> + 		} else
> + 			np_logmsg(srv, "%s", s);
> + 	}
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
> + 		np_uerror (errno);
> + 		goto error;
> + 	}
> +-	if (aspf (&s, &len, "%lu.%lu %d.%d\n",
> +-					tv.tv_sec,         tv.tv_usec,
> +-					tz.tz_minuteswest, tz.tz_dsttime) < 0) {
> ++	if (aspf (&s, &len, "%"PRIdMAX".%"PRIdMAX" %d.%d\n",
> ++					(uintmax_t)tv.tv_sec, (uintmax_t)tv.tv_usec,
> ++					tz.tz_minuteswest,    tz.tz_dsttime) < 0) {
> + 		np_uerror (ENOMEM);
> + 		goto error;
> + 	}
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
> ++    int64_t sec = 0, usec = 0;
> ++    if (sscanf (buf, "%"SCNd64".%"SCNd64" %d.%d", &sec, &usec,
> +                                     &tz.tz_minuteswest, &tz.tz_dsttime) != 4) {
> +         msg ("error scanning returned date: %s", buf);
> +         goto done;
> +     }
> ++    tv.tv_sec = sec;
> ++    tv.tv_usec = usec;
> ++
> +     if (Sopt) {
> +         if (settimeofday (&tv, &tz) < 0)
> +             err_exit ("settimeofday");
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8699): https://lists.yoctoproject.org/g/meta-virtualization/message/8699
> Mute This Topic: https://lists.yoctoproject.org/mt/105706610/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


