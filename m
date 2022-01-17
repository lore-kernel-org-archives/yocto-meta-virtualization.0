Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B1C2C433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 13:35:32 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web12.11061.1642426530727555134
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 05:35:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=frbZ+MHa;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id f21so8569821eds.11
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 05:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NFyBjYuLqoOnLWNGvmIPw6aAQjfen2sVzRH8UojN7SI=;
        b=frbZ+MHaumtyR7nWf0vo2yMPtk+46sW2kkoC829fY+X5Xl87q/AEtgbD2sS5o+J/Po
         F3ulxCViUqWWnWF9uVXs7lY8UBJhrPAPCgeJxLag/mUtUrunJfDcIqItsak+PJBK6nPL
         hFYUQFjVNKQeEe4bIaP7iRM3AaTs4ti4nvIW2ytp4jPIT3rJ6T0t2V9Pp+A4dXUnmQdP
         xQMRTLFxUDnJEqqJhDKpcFfna1ywQ3+YP6ueg/WFFDYx37Kc2o/uioIfzBk/IGY1MiPm
         WUhtfBh2unpaqQkl1v8bJluXiKmA3Cg/zEg3NF33DYSvLbY1fX+NXHK9R1ShB6E2UjR9
         6TdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NFyBjYuLqoOnLWNGvmIPw6aAQjfen2sVzRH8UojN7SI=;
        b=ichivaiwDgo4s1nkXetMsDMJe6k9zrnuQc7QWeHLUL4spe0vLqLE/BIIpr6iBCEqYU
         sXHoNJ6xvJChH0HlhMGsJoZYWjBb8lEu+HuKnvGq78BuK6kGoLFEA6uYDh3wZiWIcMP5
         Ky+TzkKVKnBO/0CkhpWm7GgWWT/29qjQrR46FPeh3dhAYyTVz7KT01iDJfY2thCvqn69
         yyGsl2myKr4Yp3TACSl6Z5eBG89ODOxB0kHPhvmpkRvSoFfMxfz7o+RKXjuVhpyuPIIQ
         ztU0u8DfKJT1amy4lVLLHISCY+h/+oSeM8FDa6n8cYJHfZEO04qrfI6uq8UhspaGHTp7
         cBYw==
X-Gm-Message-State: AOAM533QwPDPiruLmQ0VYGKOjlfg02BaTHfzz31dAqrIomU/nLh8LQqz
	zK0pa99Qi/wwoR6x7sqi3DJhvILMZkuNMhG0JLQ=
X-Google-Smtp-Source: 
 ABdhPJzJTQiC1FmbH6bZwAlgi7rn9gTGblLNjpgwjwtbuPXWqiioofKCG/zVLgsLLetZMOQGhneOftQadkERUawi33E=
X-Received: by 2002:a17:906:2cd5:: with SMTP id
 r21mr17282083ejr.435.1642426528796;
 Mon, 17 Jan 2022 05:35:28 -0800 (PST)
MIME-Version: 1.0
References: <20220117125827.464599-1-ross.burton@arm.com>
In-Reply-To: <20220117125827.464599-1-ross.burton@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 17 Jan 2022 08:35:17 -0500
Message-ID: 
 <CADkTA4Nm6mr0F0fYGtmC7iA+pDsoUwawb54SBGxnQidnLd7WGg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] python3-dtc: fix packaging by using
 setuptools
To: Ross Burton <ross@burtonini.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Jan 2022 13:35:32 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7008

On Mon, Jan 17, 2022 at 7:58 AM Ross Burton <ross@burtonini.com> wrote:
>
> Inheriting setuptools3-base doesn't actually define any tasks, so commit
> 1ef6050 to drop distutils3 had the side-effect of not building any code.
>
> Backport a commit from upstream to switch to setuptools, inherit
> setuptool3, and change DISTUTILS_SETUP_PATH to SETUPTOOLS_SETUP_PATH.
>

I have a SRCREV bump ready to go for dtc, so I've applied this and
then the bump on top.

Bruce

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  recipes-kernel/dtc/files/setuptools.patch | 34 +++++++++++++++++++++++
>  recipes-kernel/dtc/python3-dtc_1.6.1.bb   |  7 +++--
>  2 files changed, 38 insertions(+), 3 deletions(-)
>  create mode 100644 recipes-kernel/dtc/files/setuptools.patch
>
> diff --git a/recipes-kernel/dtc/files/setuptools.patch b/recipes-kernel/dtc/files/setuptools.patch
> new file mode 100644
> index 0000000..3d37ebd
> --- /dev/null
> +++ b/recipes-kernel/dtc/files/setuptools.patch
> @@ -0,0 +1,34 @@
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +From c691776ddb26acbd3674722caafacaf7b6e3e807 Mon Sep 17 00:00:00 2001
> +From: Rob Herring <robh@kernel.org>
> +Date: Wed, 10 Nov 2021 19:11:32 -0600
> +Subject: [PATCH] pylibfdt: Use setuptools instead of distutils
> +
> +The use of setuptools is favored over distutils. setuptools is needed to
> +support building Python 'wheels' and for pip support.
> +
> +Signed-off-by: Rob Herring <robh@kernel.org>
> +Message-Id: <20211111011135.2386773-2-robh@kernel.org>
> +Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> +---
> + pylibfdt/setup.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
> +index ef40f15..f065a59 100755
> +--- a/pylibfdt/setup.py
> ++++ b/pylibfdt/setup.py
> +@@ -10,7 +10,7 @@ Copyright (C) 2017 Google, Inc.
> + Written by Simon Glass <sjg@chromium.org>
> + """
> +
> +-from distutils.core import setup, Extension
> ++from setuptools import setup, Extension
> + import os
> + import re
> + import sys
> +--
> +2.25.1
> +
> diff --git a/recipes-kernel/dtc/python3-dtc_1.6.1.bb b/recipes-kernel/dtc/python3-dtc_1.6.1.bb
> index e9b8499..6e02db6 100644
> --- a/recipes-kernel/dtc/python3-dtc_1.6.1.bb
> +++ b/recipes-kernel/dtc/python3-dtc_1.6.1.bb
> @@ -7,6 +7,7 @@ LICENSE = "GPLv2 | BSD-2-Clause"
>  DEPENDS = "flex-native bison-native swig-native libyaml dtc"
>
>  SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=master \
> +           file://setuptools.patch \
>             file://ssize.patch"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
> @@ -17,13 +18,13 @@ SRCREV = "ecaeb97fec013973360e94888a7de645f084345c"
>
>  S = "${WORKDIR}/git"
>
> -inherit setuptools3-base pkgconfig
> +inherit setuptools3 pkgconfig
>
> -DISTUTILS_SETUP_PATH = "${S}/pylibfdt"
> +SETUPTOOLS_SETUP_PATH = "${S}/pylibfdt"
>
>  do_configure:prepend() {
>      oe_runmake -C "${S}" version_gen.h
> -    mv "${S}/version_gen.h" "${DISTUTILS_SETUP_PATH}/"
> +    mv "${S}/version_gen.h" "${SETUPTOOLS_SETUP_PATH}/"
>  }
>
>  BBCLASSEXTEND = "native nativesdk"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7007): https://lists.yoctoproject.org/g/meta-virtualization/message/7007
> Mute This Topic: https://lists.yoctoproject.org/mt/88482921/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

