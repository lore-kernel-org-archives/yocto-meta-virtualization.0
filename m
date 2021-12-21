Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F89DC433F5
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 01:52:48 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web09.869.1640051567654580389
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Dec 2021 17:52:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JR+O+Us7;
 spf=pass (domain: gmail.com, ip: 209.85.219.46,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id q3so3700245qvc.7
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Dec 2021 17:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iGGNaJvpMcsnN51VF7lTfTs2fa9ruuvE37tUwOG5m1M=;
        b=JR+O+Us7Lx/oJjf50H+tvoTGdRth0osu2vbNe5RUrBShvSs5pcWJmGEC1/N66ISwbt
         iY0/dX3UeRjIO9s6isSs43GM7DyYHJgQgtvfKChcwAHiCMG3QWR0Gvx10yrbNXCcD8bG
         f7RtOVajvOWwLU9pAC7VPpvTEQUTzE1M/l35Gzue/42qhYlvVVVuPHDJ9imS++6zsJXc
         Hl2e7R9hQQ4pIjzXpixuQg4UL4CxW6IqbkC26brM5/lqwpDu7FJNqAq/DNohWae6LwgP
         GewPxHK+YINYR9vfzryVWlw9jaiv5cw4WW3efSHSdMDnipaqUuQr2U79oWyvidbM1EiT
         8qXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iGGNaJvpMcsnN51VF7lTfTs2fa9ruuvE37tUwOG5m1M=;
        b=AzWkd4r7u672EEXDuSJDcqIGhtyIBrAlKQ0WfK5rtjUp9kQ953q306JrzDoJtocSu5
         sU0ar1TMQ8X508ft1+9rocQj9O3dF4l1I120cYFKiFZCVu+Sx1fhfwLEbN3iEya6mZy+
         V5N0TM6CKQu8fy8YaKXL0HP7ngILjrfIPVFWMX3Lp4Mq8g3FkhB2ud8eIxlcDRZyMOLK
         Eo+ABd257F9T57ZVYmK0l+0hCPyseXZoFPULVkJkP5QFrpNU4MBRqW8/wcm+8wpeSz6t
         s/akMQWfLeDuR792PRCAjzxt0SB7GRHZtZIqvqTLFQk4fyTE2CZqut1uHhJIjIl3noIz
         wUaQ==
X-Gm-Message-State: AOAM533kvTRgQDIu3GYJ7h4FuFckpY1GHSiON8L2ZI7gOuP9xlCZAf3E
	fWrqgOQu3ZkQUqRlfoZCXQfxDRbLCA0=
X-Google-Smtp-Source: 
 ABdhPJx1dTk1Rx9ZDxM2S1PHLdC4ouOBbmZ+YWV8Dq6o/4Wf03GOW81gN92ryxdDtwd8E9kN041a5g==
X-Received: by 2002:a05:6214:2523:: with SMTP id
 gg3mr599984qvb.1.1640051566689;
        Mon, 20 Dec 2021 17:52:46 -0800 (PST)
Received: from gmail.com
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 y20sm13175661qkj.24.2021.12.20.17.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 17:52:46 -0800 (PST)
Date: Mon, 20 Dec 2021 20:52:44 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][m-c-s][PATCH] mod-wsgi: move to 4.9.0
Message-ID: <20211221015242.GA36916@gmail.com>
References: <20211220192706.4002841-1-jpuhlman@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211220192706.4002841-1-jpuhlman@mvista.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Dec 2021 01:52:48 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/6982

merged.

Bruce

In message: [meta-virtualization][m-c-s][PATCH] mod-wsgi: move to 4.9.0
on 20/12/2021 Jeremy Puhlman wrote:

> Older version of mod-wsgi no longer builds against python 3.10
> 
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> ---
>  ...ow-PYTHON-values-to-be-passed-via-en.patch | 37 +++++++++----------
>  .../recipes-support/mod-wsgi/mod-wsgi_git.bb  |  4 +-
>  2 files changed, 20 insertions(+), 21 deletions(-)
> 
> diff --git a/meta-openstack/recipes-support/mod-wsgi/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch b/meta-openstack/recipes-support/mod-wsgi/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch
> index 4683db0a..79aedffd 100644
> --- a/meta-openstack/recipes-support/mod-wsgi/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch
> +++ b/meta-openstack/recipes-support/mod-wsgi/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch
> @@ -7,28 +7,31 @@ This allows the recipe to specify specific values instead of them
>  being 'discovered' which may lead to host contamination or similar
>  issues.
>  
> +Updated for 4.9.0: Jeremy Puhlman
> +
>  Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ----
> +----
>   configure.ac | 41 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 41 insertions(+)
>  
> +
>  diff --git a/configure.ac b/configure.ac
> -index 25afe44..b5a9e03 100644
> +index 37a0f86..9b77c7f 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -100,26 +100,38 @@ fi
> +@@ -106,26 +106,38 @@ fi
>   
>   AC_SUBST(PYTHON)
>   
>  +if test -z "${PYTHON_VERSION}"; then
>   PYTHON_VERSION=`${PYTHON} -c 'from sys import stdout; \
> -     from distutils import sysconfig; \
> +     import sysconfig; \
>       stdout.write(sysconfig.get_config_var("VERSION"))'`
>  +fi
>   
>  +if test -z "${PYTHON_LDVERSION}"; then
>   PYTHON_LDVERSION=`${PYTHON} -c 'from sys import stdout; \
> -     from distutils import sysconfig; \
> +     import sysconfig; \
>       stdout.write(sysconfig.get_config_var("LDVERSION") or "")'`
>  +fi
>   
> @@ -38,7 +41,7 @@ index 25afe44..b5a9e03 100644
>   
>  +if test -z "${PYTHON_INCLUDEPY}"; then
>   CPPFLAGS1=`${PYTHON} -c 'from sys import stdout; \
> -     from distutils import sysconfig; \
> +     import sysconfig; \
>       stdout.write("-I" + sysconfig.get_config_var("INCLUDEPY"))'`
>  +else
>  +CPPFLAGS1="${PYTHON_INCLUDEPY}"
> @@ -46,7 +49,7 @@ index 25afe44..b5a9e03 100644
>   
>  +if test -z "${PYTHON_CFLAGS}"; then
>   CPPFLAGS2=`${PYTHON} -c 'from sys import stdout; \
> -     from distutils import sysconfig; \
> +     import sysconfig; \
>       stdout.write(" ".join(filter(lambda x: x.startswith("-D"), \
>       sysconfig.get_config_var("CFLAGS").split())))'`
>  +else
> @@ -55,13 +58,13 @@ index 25afe44..b5a9e03 100644
>   
>   if test "${ENABLE_EMBEDDED}" != "yes"; then
>   CPPFLAGS3="-DMOD_WSGI_DISABLE_EMBEDDED"
> -@@ -131,22 +143,43 @@ CPPFLAGS="${CPPFLAGS} ${CPPFLAGS1} ${CPPFLAGS2} ${CPPFLAGS3}"
> +@@ -137,22 +149,42 @@ CPPFLAGS="${CPPFLAGS} ${CPPFLAGS1} ${CPPFLAGS2} ${CPPFLAGS3}"
>   
>   AC_SUBST(CPPFLAGS)
>   
>  +if test -z "${PYTHON_LIBDIR}"; then
>   PYTHONLIBDIR=`${PYTHON} -c 'from sys import stdout; \
> -     from distutils import sysconfig; \
> +     import sysconfig; \
>       stdout.write(sysconfig.get_config_var("LIBDIR"))'`
>  +else
>  +PYTHONLIBDIR="${PYTHON_LIBDIR}"
> @@ -76,22 +79,21 @@ index 25afe44..b5a9e03 100644
>  +fi
>  +if test -z "${PYTHON_FRAMEWORKDIR}"; then
>   PYTHONFRAMEWORKDIR=`${PYTHON} -c 'from sys import stdout; \
> -     from distutils import sysconfig; \
> +     import sysconfig; \
>       stdout.write(sysconfig.get_config_var("PYTHONFRAMEWORKDIR"))'`
>  +else
>  +PYTHONFRAMEWORKDIR="${PYTHON_FRAMEWORKDIR}"
>  +fi
> -+
>  +if test -z "${PYTHON_FRAMEWORKPREFIX}"; then
>   PYTHONFRAMEWORKPREFIX=`${PYTHON} -c 'from sys import stdout; \
> -     from distutils import sysconfig; \
> +     import sysconfig; \
>       stdout.write(sysconfig.get_config_var("PYTHONFRAMEWORKPREFIX"))'`
>  +else
>  +PYTHONFRAMEWORKPREFIX="${PYTHON_FRAMEWORKPREFIX}"
>  +fi
>  +if test -z "${PYTHON_FRAMEWORK}"; then
>   PYTHONFRAMEWORK=`${PYTHON} -c 'from sys import stdout; \
> -     from distutils import sysconfig; \
> +     import sysconfig; \
>       stdout.write(sysconfig.get_config_var("PYTHONFRAMEWORK"))'`
>  +else
>  +PYTHONFRAMEWORK="${PYTHON_FRAMEWORK}"
> @@ -99,20 +101,20 @@ index 25afe44..b5a9e03 100644
>   
>   if test "${PYTHON_LDVERSION}" != "${PYTHON_VERSION}"; then
>       PYTHONCFGDIR="${PYTHONCFGDIR}-${PYTHON_LDVERSION}"
> -@@ -170,12 +203,20 @@ if test "${PYTHONFRAMEWORKDIR}" = "no-framework" -o \
> +@@ -180,12 +212,20 @@ if test "${PYTHONFRAMEWORKDIR}" = "no-framework" -o \
>           LDLIBS1="-lpython${PYTHON_VERSION}"
>       fi
>   
>  +    if test -z "${PYTHON_LIBS}"; then
>       LDLIBS2=`${PYTHON} -c 'from sys import stdout; \
> -         from distutils import sysconfig; \
> +         import sysconfig; \
>           stdout.write(sysconfig.get_config_var("LIBS"))'`
>  +    else
>  +    LDLIBS2="${PYTHON_LIBS}"
>  +    fi
>  +    if test -z "${PYTHON_SYSLIBS}"; then
>       LDLIBS3=`${PYTHON} -c 'from sys import stdout; \
> -         from distutils import sysconfig; \
> +         import sysconfig; \
>           stdout.write(sysconfig.get_config_var("SYSLIBS"))'`
>  +    else
>  +    LDLIBS3="${PYTHON_SYSLIBS}"
> @@ -120,6 +122,3 @@ index 25afe44..b5a9e03 100644
>   else
>       LDFLAGS1="-Wl,-F${PYTHONFRAMEWORKPREFIX} -framework ${PYTHONFRAMEWORK}"
>   
> --- 
> -2.7.4
> -
> diff --git a/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb b/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
> index 79afba81..910bba1b 100644
> --- a/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
> +++ b/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
> @@ -9,8 +9,8 @@ HOMEPAGE = "https://github.com/GrahamDumpleton/mod_wsgi"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>  
> -SRCREV = "217e80b7436035723b80ff02ee349365e8553dfc"
> -PV = "4.6.8+git${SRCPV}"
> +SRCREV = "df9faf954a1ab6208f45ba6fde90f0b41f605483"
> +PV = "4.9.0+git${SRCPV}"
>  
>  S = "${WORKDIR}/git"
>  
> -- 
> 2.31.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6981): https://lists.yoctoproject.org/g/meta-virtualization/message/6981
> Mute This Topic: https://lists.yoctoproject.org/mt/87863585/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


