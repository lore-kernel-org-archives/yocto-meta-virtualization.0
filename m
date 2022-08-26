Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B33ECAAA2
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 02:55:13 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.32824.1661482507641474153
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 25 Aug 2022 19:55:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dgmPBQw9;
 spf=pass (domain: gmail.com, ip: 209.85.219.46,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id n14so140464qvq.10
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 25 Aug 2022 19:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc;
        bh=RF+nkJStIGBPDoq+J6khjFetAUsFfuOP82il9vwGKgo=;
        b=dgmPBQw9+5AZgdP6mwUouy8WLnh8RCFyN1Rkq0g503fQwXWViNrS3Gg6OLtdAtrpHi
         HuyhqyhN9Dp6awhUlNbH4u3HssD0WTQIXBhXVkLziq7FSOyq+K0wfW7WA75l/f0oUw/e
         wuS7Vfd/eeEMD0DPkMp5j9HLNaE/uhmzSOc7R6rBptuJugiM4xPEFv48PE0fjg8WJsQN
         C3qVu3gAlSMQYcF7Q+saXwL1l5FdP01rGOOAoeIew1QKLXybBfHAiLsFI8H4IiGnsOSv
         LX3Eqq6fl0K1PvT1O+3d3ITbWiAM2nPV1Nm6r7bBr5xbBHld6u/LTukak+/QGHl1B9fc
         m3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=RF+nkJStIGBPDoq+J6khjFetAUsFfuOP82il9vwGKgo=;
        b=j7Q2q+kvscxefCgWzEPSrDkDwKrnvWdzq3+0nwamTpl3+Mea//5OS41EBr2fbu7/90
         vfUCwbmlF4xp6LbCUv4yxW1k0apdohlIkxavY3t/crHdFSqbeThUj3VQGgAlJz2TBJky
         YZlmtJcOd5k89Nhl+V0M8HTO9DQl2NTCjnxhXg7ZKJ4T9tBkclXCi+bndmiLJI2sxf21
         7mAYYoM9dexQYwAVfzTX6ar+FG83aDpC7udQVOscoiSN8qlVk79A1FPHVwUHzs+l9XEY
         ZSZ4vvZbGdcghl6tZe4QbG2TqeOUYS1ypcEH3Cy1Xgy1w+i+vL5yYLN/XDhPE3lbI8rl
         3Feg==
X-Gm-Message-State: ACgBeo2Vlm1QEOkSye64Lj7RaHKmpFPjMJ9ujil23mbkMIqrK4NBdo7J
	fHJNNnakoDO1ZUD2P40eBmo=
X-Google-Smtp-Source: 
 AA6agR5tdUVDFNRzlhX+fmKovz8yLa3mweB+xnCmdQvPkR4R7CLdjxBkvCgCha14S9XHaU0LrDn3Bw==
X-Received: by 2002:a05:6214:d83:b0:496:ca5c:74c8 with SMTP id
 e3-20020a0562140d8300b00496ca5c74c8mr6330015qve.92.1661482506612;
        Thu, 25 Aug 2022 19:55:06 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 y29-20020a37f61d000000b006b97151d2b3sm852155qkj.67.2022.08.25.19.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 19:55:05 -0700 (PDT)
Date: Thu, 25 Aug 2022 22:55:04 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Andrei Gherzan <andrei@gherzan.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: Re: [meta-virtualization] [PATCH] skopeo: Mark CVE-2019-10214 as
 fixed
Message-ID: <20220826025502.GD23530@gmail.com>
References: <20220825173226.1215646-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220825173226.1215646-1-andrei@gherzan.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 26 Aug 2022 02:55:13 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7571

merged.

Bruce

In message: [meta-virtualization] [PATCH] skopeo: Mark CVE-2019-10214 as fixed
on 25/08/2022 Andrei Gherzan wrote:

> From: Andrei Gherzan <andrei.gherzan@huawei.com>
> 
> This CVE was fixed[1] in the container image go library skopeo is using
> (vendoring). The current version of the image go module is v5.20.0 while
> the fix landed since v3.0.0[2].
> 
> See RedHat's resolution[3] for more details.
> 
> [1] https://github.com/containers/image/issues/654
> [2] https://github.com/containers/image/pull/669/commits/a3d69a4a89244803d2f5350aca6dd0fcbe444551
> [3] https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2019-10214
> 
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ---
>  recipes-containers/skopeo/skopeo_git.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
> index 9d19675..d426b4f 100644
> --- a/recipes-containers/skopeo/skopeo_git.bb
> +++ b/recipes-containers/skopeo/skopeo_git.bb
> @@ -34,6 +34,12 @@ S = "${WORKDIR}/git"
>  inherit goarch
>  inherit pkgconfig
>  
> +# This CVE was fixed in the container image go library skopeo is using.
> +# See:
> +# https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2019-10214
> +# https://github.com/containers/image/issues/654
> +CVE_CHECK_IGNORE += "CVE-2019-10214"
> +
>  # This disables seccomp and apparmor, which are on by default in the
>  # go package. 
>  EXTRA_OEMAKE="BUILDTAGS=''"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7566): https://lists.yoctoproject.org/g/meta-virtualization/message/7566
> Mute This Topic: https://lists.yoctoproject.org/mt/93253333/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


