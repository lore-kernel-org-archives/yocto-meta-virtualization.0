Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F17B6C678D4
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 21:26:31 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.7026.1677792387259503204
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 Mar 2023 13:26:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R1PEWSK4;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id z6so904124qtv.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 02 Mar 2023 13:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wfFKgnzGz7bYvvvmAbZCnq0GnRq4TAFDidReP/ZQGck=;
        b=R1PEWSK4sxCBXi4exT7TCh0iieFX+JPq0gRW+fuJNzD2ApSJ205UE/GHTgN+5Xyg4X
         N5gynw6USz/cDCQQCFhfWoA1Tkr0aIcNVdIdmetGyptUyrjjx44Db6iN5RPSA3vOm41M
         TtO9o1SrI0bEqQq3bbMrpsfAaMnfRj4pggH+kX5ycCWxEJgw1S3TQpkzRYo+ff6SapOo
         d0WmdMhFsTMTyTR9Abe8mnMq5Jof1zcBtK2LC2yDIRYIbAeNJxzP700DJZ86wFeaCdj5
         03KZtTHSyeUuyriikhlT7eezCWS+KTEVSWa7fHNq9h8UV/aOTzr5v01alLLsyBqS8C4m
         cVpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wfFKgnzGz7bYvvvmAbZCnq0GnRq4TAFDidReP/ZQGck=;
        b=uhQUzPtmG7b95iFdJaL0u7tUd61HJSa7QvjBrTXBqdom/WEuq79v8Y/G0x0sh0es+0
         CcI7L7H3Oe32YP/5xeVHg7Xvus4V+q0uHi3JBxSkmAkjnyebWn0aIoS9REFh/O8oyE/o
         BGnVk4BwFC0Ae5gOr40XLLInRRywpOW9lqfVaHfwMOYkbE3yQvyauFdyIaI5j/vhx8UQ
         HPBT5BhpSf37solsTQBKSb7OrdxBIZhCTmsm8E1PaVGemI15tRYvm23m7+Hx5bE+9L2j
         EpzsW/NaBxKVpUs9jAJKp25I5uXj7E2sX5aZHsWJgjpy/ksP0ADqiSROYmbAnEDMFm2F
         lVwA==
X-Gm-Message-State: AO0yUKW3YHVrY7rGo0aimo7VxvFjZ6AokYpPoTDpALHRvBSz22fjxQ46
	u/Lhzb8hOXqZ9hjKsAa1McRFpf38NljQRw==
X-Google-Smtp-Source: AK7set8BdeMabRfrauSTM+1SPSqxYyqYwY8jaLCu+ZyEXSwtBkRN2H5IT1N58oXZ2Z7jFeGEJihEig==
X-Received: by 2002:a05:622a:1aa0:b0:3bd:efa:baf with SMTP id s32-20020a05622a1aa000b003bd0efa0bafmr20674244qtc.19.1677792386229;
        Thu, 02 Mar 2023 13:26:26 -0800 (PST)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id b1-20020ac84f01000000b003bb8c60cdf1sm424729qte.78.2023.03.02.13.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 13:26:25 -0800 (PST)
Date: Thu, 2 Mar 2023 16:26:24 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][kirkstone][PATCH 01/10] cri-o: remove
 meta-security check
Message-ID: <ZAEUgD6RO8QHEk18@gmail.com>
References: <20230301095228.122562-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301095228.122562-1-Qi.Chen@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 02 Mar 2023 21:26:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7925

All 10 have now been cherry-picked to kirkstone.

Bruce

In message: [meta-virtualization][kirkstone][PATCH 01/10] cri-o: remove meta-security check
on 01/03/2023 Chen Qi wrote:

> libseccomp is not in oe-core. There's no need to check
> meta-security any more.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  recipes-containers/cri-o/cri-o_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
> index 7940bbd..ee5906e 100644
> --- a/recipes-containers/cri-o/cri-o_git.bb
> +++ b/recipes-containers/cri-o/cri-o_git.bb
> @@ -46,7 +46,7 @@ RDEPENDS:${PN} = " \
>      libdevmapper \
>      "
>  
> -SKIP_RECIPE[cri-o] ?= "${@bb.utils.contains('BBFILE_COLLECTIONS', 'security', bb.utils.contains('BBFILE_COLLECTIONS', 'selinux', '', 'Depends on libselinux from meta-selinux which is not included', d), 'Depends on libseccomp from meta-security which is not included', d)}"
> +SKIP_RECIPE[cri-o] ?= "${@bb.utils.contains('BBFILE_COLLECTIONS', 'selinux', '', 'Depends on libselinux from meta-selinux which is not included', d)}"
>  
>  PACKAGES =+ "${PN}-config"
>  
> -- 
> 2.37.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7911): https://lists.yoctoproject.org/g/meta-virtualization/message/7911
> Mute This Topic: https://lists.yoctoproject.org/mt/97311047/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


