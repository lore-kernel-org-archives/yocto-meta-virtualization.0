Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE26ECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 02:54:53 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web12.32559.1661482490518694829
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 25 Aug 2022 19:54:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EmMClF1s;
 spf=pass (domain: gmail.com, ip: 209.85.222.182,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id f4so242325qkl.7
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 25 Aug 2022 19:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc;
        bh=6z0V25M1qflg/aV8oNRzyqlo5gkVkJxmqpeDtWNobcE=;
        b=EmMClF1sNvOk926w9hKfLePruxvYqD94b8qVX616fiTtMK1ePKEXRQF2/23J/TUYRm
         65sge97anjaotr7Jcru2tzlH0FSBo6g+GJ0OQthRtQ2tJDxsfLhixxILyRCsmi8n1HnH
         B7h13dL8m4P07i/bhNU+5APu21sIrPvwUc2XJeXpHzt7eQ5bN9YFTeZGnlWyXwVofvEx
         eL1NRr3KQYcraweAuO60M8SU4QJ90/Dgnwhehz8fHTLAYcbwiwFCKXU2Q5jgfGXA+r9o
         SiJAmS28LOPTut/hKkjTzM2pDtNIZXUVSCGCz8HQB5fHIgeuWvX7KTFbNRLOoo4D6SC7
         bOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=6z0V25M1qflg/aV8oNRzyqlo5gkVkJxmqpeDtWNobcE=;
        b=J3O+neQziLg0eCgZENP/UkDeJAy1yiHtCDqmflh9yYWI2Yr/W1BRZ1ONeU/36giGog
         6jnq70jUBWFLV2zEwRUVLcCweOx1xSDsQcZsrR4Vs9RtFV68hIcHnw/mngeQ4m03F7cV
         2ApKGVRhiCQQJKNAm9RtN+t9XRi/M2r34LFhu3/43rYDK9XdcQPICx3ABEN4AfNrnZCe
         GRugXvX7bhXU6gM9EspV2SOPYfpFDlRu4R+Fk8bOX3QyEK3VIzDwG2Q4MXfyBGXvismT
         /X3lsvko290iqy7Dg+Pa1a4FBHchgguCxN0DZ8t2Jspon8dCmWryaQMFSr2seLOippsQ
         jEPg==
X-Gm-Message-State: ACgBeo1/bRjKikt2FYpO2v07LQXbmYd1ZG5zJBNRfN1Ekw5Fxty0/RpM
	MbSchPcQJ6vQ29zr/wZij0o=
X-Google-Smtp-Source: 
 AA6agR7STlpbTw0tJDrRdn+z0ea8R2ZTFyZoVimNzJidTdnkjn+QtAO+gQLR2wxNydTjJF1p25Rm0g==
X-Received: by 2002:a05:620a:4089:b0:6bb:97e6:d5b1 with SMTP id
 f9-20020a05620a408900b006bb97e6d5b1mr5408703qko.117.1661482489543;
        Thu, 25 Aug 2022 19:54:49 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 g2-20020a05620a40c200b006b8619a67f4sm1038731qko.34.2022.08.25.19.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 19:54:48 -0700 (PDT)
Date: Thu, 25 Aug 2022 22:54:47 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Andrei Gherzan <andrei@gherzan.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: Re: [meta-virtualization] [kirkstone][PATCH] skopeo: Mark
 CVE-2019-10214 as fixed
Message-ID: <20220826025445.GC23530@gmail.com>
References: <20220825173342.1220887-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220825173342.1220887-1-andrei@gherzan.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 26 Aug 2022 02:54:53 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7570

merged.

Bruce

In message: [meta-virtualization] [kirkstone][PATCH] skopeo: Mark CVE-2019-10214 as fixed
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
> index 35377a8..d32c525 100644
> --- a/recipes-containers/skopeo/skopeo_git.bb
> +++ b/recipes-containers/skopeo/skopeo_git.bb
> @@ -35,6 +35,12 @@ S = "${WORKDIR}/git"
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
> View/Reply Online (#7567): https://lists.yoctoproject.org/g/meta-virtualization/message/7567
> Mute This Topic: https://lists.yoctoproject.org/mt/93253352/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


