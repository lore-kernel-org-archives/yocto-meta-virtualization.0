Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F9F2E7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 03:46:36 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.2359.1733802389805421451
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Dec 2024 19:46:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gMUNoXKS;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6d8d44e177cso47836846d6.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Dec 2024 19:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733802389; x=1734407189; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EbCRDvHolJbhsF289JxVV0qKDaFrzCdqtmRu0hPuQ2U=;
        b=gMUNoXKSKb3bsCS5YfDERadF2JoZ5pDxsAG9LoKNFfZ3hc0iXVsIdfATiq1sEtp5FM
         fbWv10I0exJdfFipyJ2MKUJFB5ANJPosmNzNssrQGiHMqMOzpxRySdr6tUBc8tajhren
         u49e+IuMe2rsH7so8tuXVlPXjqwlsbeIkBQCsNHgisM/NL4k5Bb5rnIEet5TlWd1v9t/
         3lngQbz7je9jhZl1o9lCuo7tn2lFWQwb3GAYYOWLnx3DhYAhJzEoQ99qyHIGsx5CFqLA
         sHmZWtmlimQJyjVbLjkFniutQeATuG9QW4TMuci0SDCAUGwPQnWMHorCMvxqWZ0bYoLa
         GPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733802389; x=1734407189;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EbCRDvHolJbhsF289JxVV0qKDaFrzCdqtmRu0hPuQ2U=;
        b=lXegFqNIy+TNCXBaoIh8AGX3ga9cXK/QT5QtOFeVQDciyyodj9/U6uIYmHDuslTjfb
         7ZDZs74APEBKs+xxc+77YUX3MA162NP6T4ssELEbyea4uvmKu33qxohSIq1XY729Hvye
         8MJfIA7pnNw2xgJEdP0+f8raWH/ERAk8jXHrRX+qiihOzrznH45gJWTorhDiT0Z1RXiK
         tFNqDGx3+nPDe15SkBTmkBqXEEt7c0SyukczcNJo1jCh6n5kMZ9rlcycHqu/UYq85Okj
         zdR5g/9ncL8u+kWffhmkAfzgh+IsAy4KXItmgJGlZasjTd4vFJnqkZOCvR912QIkZ1Mx
         dyyA==
X-Gm-Message-State: AOJu0Yw/zij+uIupEdRsOzgvAQqNJDtteDr7xI623K8gJ66bmshLHabJ
	lboCERAkJD+jbi5kisU7Bje2yCVzH0hCL9Z1jAczqYMLdb2hrmUI
X-Gm-Gg: ASbGncvrsx7p5u8DiRH/2U+pU+988IAIzzaAA5geDS240OfQIn1NOQSB9JPVNBy5sWN
	AzeoYrR+eRdmd1dAxoz4KhYa7kIgh15U5StTkz8sbWbnCt9Cg7Mtzvbhw6MR4y69Ye/h2P5Aqyh
	D7i/iZMMQ6vyW2eYD+q/p9a44s1zudPeEuSmCNaPLJv6b2jz6p1366nohORJ2uBoCe0aVAa72w4
	i35YrnLVzb3OISghdk99zahNTM5KEMewRd4/FghzBnVnQzeaPLH+w6eWMc9Rs9sZa5kmQfXPqNX
	4kXRvdo0yo4ROfZNrpNmH6juwWUe137V
X-Google-Smtp-Source: AGHT+IE/E8Oih4vY3VRK/Gnl9fRLbPyA0pV8lQFTyFJztx3WboDNhRYPWltJG3FKy+s1SUQ+REoLtA==
X-Received: by 2002:ad4:5dc9:0:b0:6d9:429:ab4b with SMTP id 6a1803df08f44-6d920f8ddb1mr34642366d6.0.1733802388772;
        Mon, 09 Dec 2024 19:46:28 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8da6966desm55449816d6.41.2024.12.09.19.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 19:46:28 -0800 (PST)
Date: Tue, 10 Dec 2024 03:46:26 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: vanusuri@mvista.com
Cc: meta-virtualization@lists.yoctoproject.org,
	Anand Je Sypureddy <anandje@mvista.com>
Subject: Re: [meta-virtualization][m-c-s][master][PATCH] mod-wsgi: upgrade
 4.9.0 -> 5.0.2
Message-ID: <Z1e5ksnP2SEmrlE1@gmail.com>
References: <20241203073612.1333327-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203073612.1333327-1-vanusuri@mvista.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Dec 2024 03:46:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9052

merged.

Bruce

In message: [meta-virtualization][m-c-s][master][PATCH] mod-wsgi: upgrade 4.9.0 -> 5.0.2
on 03/12/2024 Vijay Anusuri via lists.yoctoproject.org wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
> 
> mod-wsgi version 4.9.0 doesn't build against python 3.13
> update it to 5.0.2 which does build.
> 
> Refreshed configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch for 5.0.2 version.
> 
> Signed-off-by: Anand Je Sypureddy <anandje@mvista.com>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  ...ow-PYTHON-values-to-be-passed-via-en.patch | 22 ++++++++++---------
>  .../recipes-support/mod-wsgi/mod-wsgi_git.bb  |  4 ++--
>  2 files changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/meta-openstack/recipes-support/mod-wsgi/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch b/meta-openstack/recipes-support/mod-wsgi/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch
> index 79aedffd..6718a4a2 100644
> --- a/meta-openstack/recipes-support/mod-wsgi/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch
> +++ b/meta-openstack/recipes-support/mod-wsgi/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch
> @@ -9,14 +9,14 @@ issues.
>  
>  Updated for 4.9.0: Jeremy Puhlman
>  
> +Upstream-Status: Pending
>  Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> -----
> - configure.ac | 41 +++++++++++++++++++++++++++++++++++++++++
> - 1 file changed, 41 insertions(+)
> -
> +---
> + configure.ac | 40 ++++++++++++++++++++++++++++++++++++++++
> + 1 file changed, 40 insertions(+)
>  
>  diff --git a/configure.ac b/configure.ac
> -index 37a0f86..9b77c7f 100644
> +index f994dd7..8774010 100644
>  --- a/configure.ac
>  +++ b/configure.ac
>  @@ -106,26 +106,38 @@ fi
> @@ -58,7 +58,7 @@ index 37a0f86..9b77c7f 100644
>   
>   if test "${ENABLE_EMBEDDED}" != "yes"; then
>   CPPFLAGS3="-DMOD_WSGI_DISABLE_EMBEDDED"
> -@@ -137,22 +149,42 @@ CPPFLAGS="${CPPFLAGS} ${CPPFLAGS1} ${CPPFLAGS2} ${CPPFLAGS3}"
> +@@ -137,21 +149,41 @@ CPPFLAGS="${CPPFLAGS} ${CPPFLAGS1} ${CPPFLAGS2} ${CPPFLAGS3}"
>   
>   AC_SUBST(CPPFLAGS)
>   
> @@ -71,9 +71,8 @@ index 37a0f86..9b77c7f 100644
>  +fi
>  +if test -z "${PYTHON_CFGDIR}"; then
>   PYTHONCFGDIR=`${PYTHON} -c 'from sys import stdout; \
> -     import distutils.sysconfig; \
> -     stdout.write(distutils.sysconfig.get_python_lib(plat_specific=1, \
> -     standard_lib=1) +"/config")'`
> +     import sysconfig; \
> +     stdout.write(sysconfig.get_path("platstdlib") +"/config")'`
>  +else
>  +PYTHONCFGDIR="${PYTHON_CFGDIR}"
>  +fi
> @@ -101,7 +100,7 @@ index 37a0f86..9b77c7f 100644
>   
>   if test "${PYTHON_LDVERSION}" != "${PYTHON_VERSION}"; then
>       PYTHONCFGDIR="${PYTHONCFGDIR}-${PYTHON_LDVERSION}"
> -@@ -180,12 +212,20 @@ if test "${PYTHONFRAMEWORKDIR}" = "no-framework" -o \
> +@@ -179,12 +211,20 @@ if test "${PYTHONFRAMEWORKDIR}" = "no-framework" -o \
>           LDLIBS1="-lpython${PYTHON_VERSION}"
>       fi
>   
> @@ -122,3 +121,6 @@ index 37a0f86..9b77c7f 100644
>   else
>       LDFLAGS1="-Wl,-F${PYTHONFRAMEWORKPREFIX} -framework ${PYTHONFRAMEWORK}"
>   
> +-- 
> +2.25.1
> +
> diff --git a/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb b/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
> index b0daf54d..f22a2426 100644
> --- a/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
> +++ b/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
> @@ -9,8 +9,8 @@ HOMEPAGE = "https://github.com/GrahamDumpleton/mod_wsgi"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>  
> -SRCREV = "df9faf954a1ab6208f45ba6fde90f0b41f605483"
> -PV = "4.9.0+git${SRCPV}"
> +SRCREV = "1b645ebd7d87f7a27d23690c19e97dbf8dafe6b4"
> +PV = "5.0.2+git${SRCPV}"
>  
>  S = "${WORKDIR}/git"
>  
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9033): https://lists.yoctoproject.org/g/meta-virtualization/message/9033
> Mute This Topic: https://lists.yoctoproject.org/mt/109896469/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


