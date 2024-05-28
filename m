Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE997C25B7E
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 19:14:08 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.600.1716923645878495013
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 May 2024 12:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nlJb23WZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3d1b587910fso661125b6e.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 May 2024 12:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716923645; x=1717528445; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XH6x6dq2mLhcNByu78TsPhZTroPxP3J0vLVOWkivnW8=;
        b=nlJb23WZhH2cXN4w5PrTzN7ofKqLQL6gNX/DCGnfGVP9P4pG+QhGgSZHmSJnQjl7oQ
         klxgHctNhwWgSwa6HTHTqJE4M6GsbB1fG4012b+R6QwQxbxUV+bZHVBIy4/YFZLV8sCG
         fxZU1LTtTwGFVn9rD3WQQjuk1/AJiEy0f2un57EVjxNpeOQbPM4nWWM83UisqQGdmBMg
         Q1axIpkKgfSLvBllU4a30VDHPO085GUMSn9hLGAOfGSoKUPxfth+hILoJ+NldkL2B4uv
         pSRhRi2EUo0rIMKO54CFZK3h7nlGivGb2TD1FHvLJq6NQXir4UDbkNRNbq2nox8R3I0d
         0LpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716923645; x=1717528445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XH6x6dq2mLhcNByu78TsPhZTroPxP3J0vLVOWkivnW8=;
        b=bpaL2xpxVKQAQPOR2QT+TTBOGMB1joYaaFAaztPbC69G1tv5Sm9dPz9BjCSCwQzWbJ
         oY0hqcBXL5pB4QbVHpkve4+6Tt9iy7G3K9o6GMYxD1xDZL41L0kRd7/iP2zWhaUAK1OP
         qUUV8tJRfsBUd/fUl5Q6QRVWZjgv+LP4ULBWyxfVR4unA6nhqx64eams7EaAJoyvn0i/
         7g8t8t44L5Xb+Vyg1D2GhGsBUda/Qv71szVX2aan6Jx+e4JS7FcfeRMdWzkIoIKNN8aT
         Q2+T+RK0/xaKIIL75/7UTckVKUPeUyIsfvwdOgnZ7mDVQ5pB9NdqKQDNsBVhhDY/hlqj
         5Imw==
X-Gm-Message-State: AOJu0YzOAfohkG7ekq7u+QHQqQoSZaI4lPNsSIgrZXylvWvj8l1lTzgr
	o5gDCuv/ot5/N+YaY3ZFqTyIqzNk9J/QRsu8ibov1enaRj2V7eHB
X-Google-Smtp-Source: AGHT+IGIsBWSpyfKDftc95sKsVnJrcVdm2fsAW0H6QQ2/UoegwOYferOg+3rINh578r79uWO0gy9sA==
X-Received: by 2002:a05:6808:23c7:b0:3c9:6fe4:91b0 with SMTP id 5614622812f47-3d1a74597a4mr15927890b6e.41.1716923645055;
        Tue, 28 May 2024 12:14:05 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ac78b2773asm46583886d6.118.2024.05.28.12.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 12:14:04 -0700 (PDT)
Date: Tue, 28 May 2024 19:14:02 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: mingli.yu@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org, patrick.wicki@siemens.com
Subject: Re: [meta-virtualization] [PATCH] netavark: Make ptest run
Message-ID: <ZlYs+j0If2MpoQuw@gmail.com>
References: <17C92B9B397D8953.1247@lists.yoctoproject.org>
 <20240515025431.3049144-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240515025431.3049144-1-mingli.yu@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 May 2024 19:14:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8773

I've queued this for testing along with my other UNPACKDIR and
go fetcher fixes.

Bruce

In message: [meta-virtualization] [PATCH] netavark: Make ptest run
on 15/05/2024 Yu, Mingli via lists.yoctoproject.org wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Fixes:
>   # ./run-ptest
>   /tmp/bats-run-ELGGaA/bats.18820.src: line 5: To: command not found
>   1..1
>   not ok 1 bats-gather-tests
>   # (in test file test/README.md, line 5)
>   #   `To run the tests locally in your sandbox, you can use one of these methods:' failed with status 127
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  recipes-containers/netavark/files/run-ptest | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/netavark/files/run-ptest b/recipes-containers/netavark/files/run-ptest
> index 7e017ae2..f6f90b15 100644
> --- a/recipes-containers/netavark/files/run-ptest
> +++ b/recipes-containers/netavark/files/run-ptest
> @@ -5,4 +5,10 @@ shopt -s extglob
>  # Skip the plugin tests because those example plugins are built only while
>  # running cargo test and for this to work as a ptest they would need to be cross
>  # compiled and installed as part of the ptest.
> -NETAVARK=/usr/libexec/podman/netavark bats test/!(*-plugin.bats)
> +for i in `ls test`; do
> +     if [ $i == "200-bridge-firewalld.bats" ] || [ $i == "500-plugin.bats" ] ; then
> +         continue
> +     fi
> +     [ ${i: -4 -1} == ".bats" ] && NETAVARK=/usr/libexec/podman/netavark bats test/$i
> +done
> +
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8724): https://lists.yoctoproject.org/g/meta-virtualization/message/8724
> Mute This Topic: https://lists.yoctoproject.org/mt/106107836/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


