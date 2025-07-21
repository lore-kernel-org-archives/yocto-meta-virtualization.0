Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F60C83F1A
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 02:34:49 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.31280.1753065285164685566
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 20 Jul 2025 19:34:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N5caDbbM;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d95b08634fso231097785a.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 20 Jul 2025 19:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753065284; x=1753670084; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jC57Y4U+3DlALXRK6xDaXUbkeCGOzkPBePjeoVultB8=;
        b=N5caDbbMUADOvK5EvShGI0MP6tDJ3STIjWfnXj0mIkQLjoOl9Mc+OpVAni/RMYg5hw
         HUKx4kA9L7oWapRVZm+DRuHksJLmpOAyeakbiTroVp808g0peSP6knz+33Sv8Kys/EpM
         edlOUzzH6O7VBZmTvuaXuYPhGUs7oS6XIXmAVcCtOF9ZDZLpfZbg2RRjjQaPGxId9ZT4
         9PHcGd5VGUruJ48FxzfhpWQj4xx0jQqn9qzZQidL/JGYfJS4TvMywKiPR7JIINYGvzXa
         lcdnanQU/lwLp1IoaVxDVyy3MpqUZD2I9UuuxOhXK9Qa9nIuovRrH1pIF1H7gfgL3fND
         hIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753065284; x=1753670084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jC57Y4U+3DlALXRK6xDaXUbkeCGOzkPBePjeoVultB8=;
        b=KIPOdgGOltXtkOLQ7mcrb/RfSRoVlMqWvHG/P3hodkK3OEH57v88hOJT9W0cjfb8Wp
         D2mCuoPsthMaHYL1A4tKzVtmPMNMe0Gdc/APRJJpxzdDWSAnYRpv2HOf+rptsXhA6/E/
         eErQWGnxl2gyp7M68Nym1p3D+eFbN+Tsafk0bXYaOk/chCjITSvTs+W1U1l2taqRWAtl
         0l/12G+lJEMQGHMQkxt67kTwFeOuELTaBfQmVMT6ISk4PgZQen2259542lWRIueBWJBO
         3D7GkrWNOv8NR6hyhv9N/74NP4wrDcZqazlVP5vrZH7XGkv/owkid9sPE2eaDwXF1gJw
         CtwA==
X-Gm-Message-State: AOJu0YwdJajrySETJ/n96cRuLzBrFBY+dI/vT5hvGl+yYfkWoKlk7dr8
	qI03u0JiCAndmOdKpfZOF0qBqbzBU2VHUgh53R2Bc4OzX47jaiEab5cL
X-Gm-Gg: ASbGncvvg5Sj7zo1S0OMWj1vcANoHpskXDGaiS3C6rUe+DqIwKoMn2DOREufRH2wXdF
	194cXW65n4s7M6Gr9Ycvf8QrK2gDV+P6upYcehueetAWJMpODNyrXszQj4/WdycapIUFQ9mu51O
	PNjivRhIiTlrHOMRRVq1ufrswMmQIa27dOix4xIaVgmjP3BlWr+miZ6+H09VjIuZ77lLCgbM1Pe
	iQs+goZJx1C6z6VUOebgoFRYu1CoHHE5nVF55lrLZcutYyXeUsQmxqLbkpRmbCTaB/MmteYoUnf
	WRa9M8dLLBQDVdpYqM9MmRKQracHK2P5Tm64+L7zel4Dj8wIDfhPjOyT1qOpCz7nCMCcmUYqE57
	lf2Au2UM4CocsKosfib7ioUd0xRBYUEeXxyqSZiM+ShZfFt3N2L7aAQJS3ovtl4MEyTgP71xEhW
	dC
X-Google-Smtp-Source: AGHT+IHWLdTsLZPhoG7zpsoVgCZ/TwNwVKY4Ta7FFYFiNLxO7qJdZUIGwBcQpXrKsDiQdD7ULIwAyg==
X-Received: by 2002:a05:620a:27c6:b0:7dc:8bf9:ee6c with SMTP id af79cd13be357-7e34357149amr1946440985a.23.1753065283968;
        Sun, 20 Jul 2025 19:34:43 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e356c43308sm361949185a.64.2025.07.20.19.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 19:34:43 -0700 (PDT)
Date: Sun, 20 Jul 2025 22:34:41 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: raitosyo@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org, ryosuke.saito@linaro.org
Subject: Re: [meta-virtualization][PATCH] tini: Fix build error with CMake 4+
Message-ID: <aH2nQblZfyk1OYog@gmail.com>
References: <20250718091253.829595-1-raitosyo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718091253.829595-1-raitosyo@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 21 Jul 2025 02:34:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9322

Rather than stacking more backports onto the recipe, I've just
bumped to -tip (I'm doing more package uprev's anyway), and I'm
now able to build with the OE CMake bump.

Bruce

In message: [meta-virtualization][PATCH] tini: Fix build error with CMake 4+
on 18/07/2025 Ryosuke Saito via lists.yoctoproject.org wrote:

> From: Ryosuke Saito <ryosuke.saito@linaro.org>
> 
> Backport patches from https://github.com/krallin/tini to resolve the
> build error with CMake 4.0 and later.
> 
> - 0001-chore-bump-minimum-CMake-to-2.8.12.patch
> - 0001-chore-allow-CMake-though-to-3.10.patch
> 
> Signed-off-by: Ryosuke Saito <ryosuke.saito@linaro.org>
> ---
>  ...001-chore-allow-CMake-though-to-3.10.patch | 39 +++++++++++++++++++
>  ...1-chore-bump-minimum-CMake-to-2.8.12.patch | 29 ++++++++++++++
>  recipes-containers/tini/tini_0.19.0.bb        |  2 +
>  3 files changed, 70 insertions(+)
>  create mode 100644 recipes-containers/tini/tini/0001-chore-allow-CMake-though-to-3.10.patch
>  create mode 100644 recipes-containers/tini/tini/0001-chore-bump-minimum-CMake-to-2.8.12.patch
> 
> diff --git a/recipes-containers/tini/tini/0001-chore-allow-CMake-though-to-3.10.patch b/recipes-containers/tini/tini/0001-chore-allow-CMake-though-to-3.10.patch
> new file mode 100644
> index 000000000000..faea9fb647f9
> --- /dev/null
> +++ b/recipes-containers/tini/tini/0001-chore-allow-CMake-though-to-3.10.patch
> @@ -0,0 +1,39 @@
> +From bb775aa14cc5072cf687fd7f4edd44df62c06b1d Mon Sep 17 00:00:00 2001
> +From: Rudi Heitbaum <rudi@heitbaum.com>
> +Date: Fri, 28 Mar 2025 19:10:02 +1100
> +Subject: [PATCH] chore: allow CMake though to 3.10
> +
> +This is allows the build with cmake-4.0.0 without deprecation warnings.
> +
> +use min...max syntax to allow build with newer cmake.
> +ref: https://cmake.org/cmake/help/latest/command/cmake_minimum_required.html
> +
> +Fixes:
> +CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
> +  Compatibility with CMake < 3.5 has been removed from CMake.
> +
> +  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
> +  to tell CMake that the project requires at least <min> but has been updated
> +  to work with policies introduced by <max> or earlier.
> +
> +  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
> +
> +Upstream-Status: Backport [https://github.com/krallin/tini/commit/071c715e376e9ee0ac1a196fe8c38bcb61ad385c]
> +Signed-off-by: Ryosuke Saito <ryosuke.saito@linaro.org>
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 9b06fc13f31d..2e5390b84967 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required (VERSION 2.8.12)
> ++cmake_minimum_required (VERSION 2.8.12...3.10)
> + project (tini C)
> + 
> + # Config
> +-- 
> +2.34.1
> +
> diff --git a/recipes-containers/tini/tini/0001-chore-bump-minimum-CMake-to-2.8.12.patch b/recipes-containers/tini/tini/0001-chore-bump-minimum-CMake-to-2.8.12.patch
> new file mode 100644
> index 000000000000..ec03f7ff16b2
> --- /dev/null
> +++ b/recipes-containers/tini/tini/0001-chore-bump-minimum-CMake-to-2.8.12.patch
> @@ -0,0 +1,29 @@
> +From 0a5449a61b64938354db6efae8465d530d824d37 Mon Sep 17 00:00:00 2001
> +From: Bjorn Neergaard <bneergaard@mirantis.com>
> +Date: Fri, 27 Jan 2023 08:07:51 -0700
> +Subject: [PATCH] chore: bump minimum CMake to 2.8.12
> +
> +This is both the last version supported by current CMake, and the
> +version in use on Enterprise Linux 7.
> +
> +Signed-off-by: Bjorn Neergaard <bneergaard@mirantis.com>
> +
> +Upstream-Status: Backport [https://github.com/krallin/tini/commit/0b44d3665869e46ccbac7414241b8256d6234dc4]
> +Signed-off-by: Ryosuke Saito <ryosuke.saito@linaro.org>
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 4a6cab12fc25..9b06fc13f31d 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -1,4 +1,4 @@
> +-cmake_minimum_required (VERSION 2.8.0)
> ++cmake_minimum_required (VERSION 2.8.12)
> + project (tini C)
> + 
> + # Config
> +-- 
> +2.34.1
> +
> diff --git a/recipes-containers/tini/tini_0.19.0.bb b/recipes-containers/tini/tini_0.19.0.bb
> index c3ca25d07a4a..9eed4a646cba 100644
> --- a/recipes-containers/tini/tini_0.19.0.bb
> +++ b/recipes-containers/tini/tini_0.19.0.bb
> @@ -10,6 +10,8 @@ SRC_URI = " \
>    file://0001-Do-not-strip-the-output-binary-allow-yocto-to-do-thi.patch \
>    file://0001-tini.c-a-function-declaration-without-a-prototype-is.patch \
>    file://0001-Support-POSIX-basename-from-musl-libc.patch \
> +  file://0001-chore-bump-minimum-CMake-to-2.8.12.patch \
> +  file://0001-chore-allow-CMake-though-to-3.10.patch \
>    "
>  
>  LICENSE = "MIT"
> -- 
> 2.50.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9321): https://lists.yoctoproject.org/g/meta-virtualization/message/9321
> Mute This Topic: https://lists.yoctoproject.org/mt/114218116/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


