Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 351A8C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 20:56:04 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.4137.1713214561124718591
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 13:56:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aLapiT1p;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dd10ebcd702so3437655276.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Apr 2024 13:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713214560; x=1713819360; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rUdgNL3Vu9FhFT3G+9R1/R0bX7URO9P6ifAZTKnA2Jw=;
        b=aLapiT1pbPMok1Ko3/KNtyN6Iag8shAXdRz2Zg8tsIh/79oyMUWln1wQ4P7Y7xoQlF
         AgrGRP/rv/9fvTozKf3jzkvUh7odH16GqC8pl+CwSijPH9tishkl+XI/14K8N6YGd4Mo
         JVXlS5QfyfgQFj/46UrulhQM/dygbvtPLL4JVsF3jImmJR7hD8Lsy67IlOdCm8ovPLVv
         k33yI5TWt5iBvj9OSGwPLSBclIGthILq6w2fO/8cEIxTqScpCOjSjfEUvygcuPqIQ6eA
         iykwg98uzJ6lszkqtdKDnRt0xs6/VDBsfAAa3QiVw4k+EjdZwfjB0PlvOwmzlWmwR8PT
         jxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713214560; x=1713819360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUdgNL3Vu9FhFT3G+9R1/R0bX7URO9P6ifAZTKnA2Jw=;
        b=WEhZEFwFmGlGs6ZaMHJOacmzaEpUSqwn7gu6f4av73tmU0gp3+qVyPzYkEz1fJmUUb
         CaSthIlc8qC9WmDxCOjvf+QsHHWF8DPmuhqLKK/JGdJF4zTLG7kiH7jNPJkRdOu17v6O
         sj9stWR0F2+ZwItFFSbh9l4dSZEtHiBiVawTZDsbvbXeD7aDIowpVDp+fbwEXxK9KXnp
         Fbg2M5FSbfflhEy9zh6tzgtmRnRGbT0KpcncP+555fsTH6vLmtdaNUzhteYXU3Xfzsna
         LUdd9PrbUDk7jbfdqByiEY+twQXdhnFuHr2Wsc7YUZ/e11Bzm5tswbh4Eph+KE53keyW
         U/4A==
X-Gm-Message-State: AOJu0Yy5+USoNmnR4HZEIS/JbLNdJOrbwjh2yIbhDufgC5DRT48Dj75s
	qQVUj7l6CWZisXof0heSNtGP1DwMXnkkB9N+4w8IgOSmygPcucJW
X-Google-Smtp-Source: AGHT+IEFG8s8IQ9+iRsWKJbesWuIks/En5036GQXpzXqWny/BjvgjC7OoXzd2YC/usO8QMOmweZWuw==
X-Received: by 2002:a25:7405:0:b0:de3:ec94:2e94 with SMTP id p5-20020a257405000000b00de3ec942e94mr2695737ybc.15.1713214560062;
        Mon, 15 Apr 2024 13:56:00 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id ec7-20020ad44e67000000b0069b61f8c0a1sm4203872qvb.42.2024.04.15.13.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 13:55:59 -0700 (PDT)
Date: Mon, 15 Apr 2024 20:55:57 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: ola.x.nilsson@axis.com
Cc: meta-virtualization@lists.yoctoproject.org, olani@axis.com
Subject: Re: [meta-virtualization][PATCH] diod: Build in 32bit systems with
 64bit time_t
Message-ID: <Zh2UXTk6GYWVGGxg@gmail.com>
References: <20240415161144.3107769-1-olani@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415161144.3107769-1-olani@axis.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Apr 2024 20:56:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8677

Thanks for the fix!

Your patching workflow is misconfigured and the author
field is incorrect.

Total 12 (delta 7), reused 0 (delta 0), pack-reused 0
remote: ##############################################
remote: Invalid author Ola x Nilsson via lists.yoctoproject.org
remote: ##############################################

See: https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#troubleshooting-email-issues

Bruce

In message: [meta-virtualization][PATCH] diod: Build in 32bit systems with 64bit time_t
on 15/04/2024 Ola x Nilsson via lists.yoctoproject.org wrote:

> Change-Id: I84c9c3526b79a63de7cdc2f0841bce26e29a72a2
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
> View/Reply Online (#8676): https://lists.yoctoproject.org/g/meta-virtualization/message/8676
> Mute This Topic: https://lists.yoctoproject.org/mt/105539333/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


