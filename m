Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57EC2C433F5
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 18:07:57 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web09.673.1651514870320417944
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 May 2022 11:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f50OKIuK;
 spf=pass (domain: gmail.com, ip: 209.85.160.177,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id t16so11670433qtr.9
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 May 2022 11:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dngVthLF2UiIfVy0R5mHmX3yEofjMR4HS9YD36gdk6w=;
        b=f50OKIuKD5zuaBF1Z8kvlO3oyPNjCQXHlO/+Xj/HPuNyuKlLvFhRmIRWUZpiAgOnIq
         5Tmk0dd+6dHNzBsB8KI3IIqLblTqV5itmHzKaik4WMLP3iAeNnZQeInNraMY+s2VAqIL
         xc4MiHeNrlLCRJICd7wDtzrQc+PQHhlif/Rtw/+kHeVLO8asoVzjcS7CTVGm9WVrFERY
         Z1ixxVLLdJFLvtJ4LHnzxl4krI5hQYhXcM1zlmLjBrjH/3AhT4ypfN4fJKyf4d6Rosej
         B+1xaqskdzWSbMzlixHqqqjuA0heR5CgE+hqDQkODtoO9tBCkKT3G3PF1kf8cDQeaunc
         LYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dngVthLF2UiIfVy0R5mHmX3yEofjMR4HS9YD36gdk6w=;
        b=3rOKEvppDSTWi1n6TaeTYCpOC4CwP1BPwhR9Eey9GdzZH26CpGNM7BVnDVWycbmAK4
         D/xhgCcbPbeSj3QEyfG4cloiOKqpCXPv7AogtAtEPU9OKCxHzo0zvKt9AbMrz/Jsm5hb
         lX8QucxCZd/d2SLI7TBSiCYrmcCYTJd9KWhlBB6kOwpFgVZ12Cl+F0t8ScQSWI4/JEr2
         5KuAXW5U56dzJufQjTVqwqzqHu6pqJlLfrrjSbnqTLxooncyrqLz3p+Z5BCh5Vgd1L/6
         NJrvF0eGKAe2MLNgnIfUaRuEfQxegXyu42Yw3LrUqpwB457an6B3bKiznGwN6vGp/OrF
         GUnw==
X-Gm-Message-State: AOAM531RAdHuxndWJbJWWUGDR6K9bhM/1j8Q+A3FD9SPkyiNUkDDQVR/
	JjU48eBveKHaKuZJskgiK9I=
X-Google-Smtp-Source: 
 ABdhPJyqb4rmWKz5hlFoePRwfAtzYBUxcPcqFTjvpREMvOE8OBOqZbqiQu3hAOKCEJLXClhiFd2VgQ==
X-Received: by 2002:a05:622a:245:b0:2f1:f7d5:9286 with SMTP id
 c5-20020a05622a024500b002f1f7d59286mr11399206qtx.65.1651514869216;
        Mon, 02 May 2022 11:07:49 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 w18-20020ac86b12000000b002f39b99f678sm4417908qts.18.2022.05.02.11.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 11:07:48 -0700 (PDT)
Date: Mon, 2 May 2022 14:07:47 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Ross Burton <ross.burton@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-virtualization] [PATCH] dev86: fix a build race
Message-ID: <20220502180745.GA33182@gmail.com>
References: <20220429155558.177801-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220429155558.177801-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 02 May 2022 18:07:57 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7239

merged.

Bruce

In message: [meta-virtualization] [PATCH] dev86: fix a build race
on 29/04/2022 Ross Burton wrote:

> Fix a race in cpp/ where token[12].h are written to a temporary file
> with the same name.
> 
> Also update the status of cross.patch.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  ...1-cpp-fix-race-writing-token.h-files.patch | 42 +++++++++++++++++++
>  recipes-extended/dev86/dev86/cross.patch      |  2 +-
>  recipes-extended/dev86/dev86_git.bb           |  3 +-
>  3 files changed, 45 insertions(+), 2 deletions(-)
>  create mode 100644 recipes-extended/dev86/dev86/0001-cpp-fix-race-writing-token.h-files.patch
> 
> diff --git a/recipes-extended/dev86/dev86/0001-cpp-fix-race-writing-token.h-files.patch b/recipes-extended/dev86/dev86/0001-cpp-fix-race-writing-token.h-files.patch
> new file mode 100644
> index 0000000..d6e7999
> --- /dev/null
> +++ b/recipes-extended/dev86/dev86/0001-cpp-fix-race-writing-token.h-files.patch
> @@ -0,0 +1,42 @@
> +Upstream-Status: Submitted [https://github.com/jbruchon/dev86/pull/23]
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +From f507ee398ae20e4e97f01dfbd9a8709a90bc760f Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@arm.com>
> +Date: Fri, 29 Apr 2022 16:44:08 +0100
> +Subject: [PATCH] cpp: fix race writing token.h files
> +
> +The rules for token1.h and token2.h both write to a temporary file tmp.h
> +before renaming to token1.h or token2.h. However, in a parallel build
> +these will execute at the same time and race.
> +
> +  gperf -aptTc -N is_ctok -H hash1 token1.tok > tmp.h
> +  gperf -aptTc -k1,3 -N is_ckey -H hash2 token2.tok > tmp.h
> +  mv tmp.h token1.h
> +  mv tmp.h token2.h
> +  mv: cannot stat 'tmp.h': No such file or directory
> +
> +By using gperf --output-file, the race is avoided entirely.
> +---
> + cpp/Makefile | 6 ++----
> + 1 file changed, 2 insertions(+), 4 deletions(-)
> +
> +diff --git a/cpp/Makefile b/cpp/Makefile
> +index 0ea43cc..743694f 100644
> +--- a/cpp/Makefile
> ++++ b/cpp/Makefile
> +@@ -20,9 +20,7 @@ token1.o: token1.h
> + token2.o: token2.h
> + 
> + token1.h: token1.tok
> +-	gperf -aptTc -N is_ctok -H hash1 token1.tok > tmp.h
> +-	mv tmp.h token1.h
> ++	gperf -aptTc -N is_ctok -H hash1 --output-file $@ $<
> + 
> + token2.h: token2.tok
> +-	gperf -aptTc -k1,3 -N is_ckey -H hash2 token2.tok > tmp.h
> +-	mv tmp.h token2.h
> ++	gperf -aptTc -k1,3 -N is_ckey -H hash2 --output-file $@ $<
> +-- 
> +2.25.1
> +
> diff --git a/recipes-extended/dev86/dev86/cross.patch b/recipes-extended/dev86/dev86/cross.patch
> index 041a8d3..fd62c5d 100644
> --- a/recipes-extended/dev86/dev86/cross.patch
> +++ b/recipes-extended/dev86/dev86/cross.patch
> @@ -1,6 +1,6 @@
>  Build ifdef using BUILD_CC, not CC.
>  
> -Upstream-Status: Pending
> +Upstream-Status: Submitted [https://github.com/jbruchon/dev86/pull/22]
>  Signed-off-by: Ross Burton <ross.burton@arm.com>
>  
>  diff --git a/Makefile b/Makefile
> diff --git a/recipes-extended/dev86/dev86_git.bb b/recipes-extended/dev86/dev86_git.bb
> index 4b5a265..82f43a0 100644
> --- a/recipes-extended/dev86/dev86_git.bb
> +++ b/recipes-extended/dev86/dev86_git.bb
> @@ -11,7 +11,8 @@ SRC_URI = "git://github.com/jbruchon/${BPN}.git;protocol=https;branch=master \
>      file://0001-cpp-Makefile-respect-LDFLAGS-when-building-bcc-cpp.patch \
>      file://0003-cpp-update-token1.tok-to-make-new-gperf-happy-regen..patch \
>      file://0004-regen-token2.h-token1.h-with-gperf-3.1.patch \
> -	file://cross.patch \
> +    file://cross.patch \
> +    file://0001-cpp-fix-race-writing-token.h-files.patch \
>  "
>  
>  S = "${WORKDIR}/git"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7237): https://lists.yoctoproject.org/g/meta-virtualization/message/7237
> Mute This Topic: https://lists.yoctoproject.org/mt/90778984/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


