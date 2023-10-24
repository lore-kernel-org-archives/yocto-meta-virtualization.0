Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1595FC07545
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 17:47:32 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.24781.1698169651499002072
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 10:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XUcCC9Gk;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7788ebea620so311243685a.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 24 Oct 2023 10:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698169650; x=1698774450; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eXtPhBaBKcecm6GKWqPITBcOXZt04EKUIDChmfy3WgA=;
        b=XUcCC9GkJ/CTULkKvMBo9tQ59/fReFCatCUM5+EyzqKWUlTTlDAr/+po6eJtoUPvtb
         VWf5coCntznLLhNEf1sNL+4IKp+Kv82Pgnm9RrfmbIcVFXNCqSI3iMb2nRGg9kYA9sxG
         cISx8DRLBKO4vdL10ljEmSDZw85Pn+717rdGvyPkL7ZsZt05X4xROCOn7DDyHCOx4j2x
         6NAE17xfCIHO59LX95V9gFTWyTLvS+iVRfS2ngY1OV+Ezxu47RvjF853YbopeqFnsux2
         1GE9fj2lHfpZnEm23asnS2xrK2Rf9Wp0u+w5gvpZcMb8S/z8B+1WiMDwxZuFPEQkt8oh
         UgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698169650; x=1698774450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXtPhBaBKcecm6GKWqPITBcOXZt04EKUIDChmfy3WgA=;
        b=D6Rlgh9eNxA/IKdIagUmc+mrbP/8ZPXeeNZ+GWnrCiC3sOez8s6/XllqCJfxqjQK7t
         sqvJRU6KIIVQL/Mc1bNwXM1xwxazFYDAXEtJIj+11PPsD83hMYB4t33zuSuqQ4dmRrpq
         10/9dyvKcsdZG6o5+OCCSwG5zZYltjftUghDh1PalGqkfk8zQK1VSgQjRCE5aqfjAhwr
         K6sUOaXxJUo7ObLRjhmwUk+h9T1mBglumOZupsJXJl/QT2VJKJlhL8TZtrojn8YSwz+w
         GRZiPrftAg7mpPtqi1lPUqGLaXphdkM1xMAkbMoHBLHrGaVqkHvlWAtI05lwv7ChmIAX
         KlLA==
X-Gm-Message-State: AOJu0YzSizS0zvBk+CK/aF6Fx8OBc8b5xTwvlORRx4d1azyq5e5OoFXS
	g4cgQDWoI2A1183J9EHbw+uZAy/zUnZNHA==
X-Google-Smtp-Source: AGHT+IElhpKvJOd31yDKphTxEN3Ri3RJG4igcasKsjn8qgqUTSlZruRB1Vb0Bal0M/r/o0BXNPCsGA==
X-Received: by 2002:ad4:5be5:0:b0:66c:fae1:1c72 with SMTP id k5-20020ad45be5000000b0066cfae11c72mr15460444qvc.42.1698169650311;
        Tue, 24 Oct 2023 10:47:30 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id lf18-20020a0562142cd200b0065b21b232bfsm3773824qvb.138.2023.10.24.10.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 10:47:29 -0700 (PDT)
Date: Tue, 24 Oct 2023 17:47:28 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Leonard Anderweit <L.Anderweit@phytec.de>
Cc: meta-virtualization@lists.yoctoproject.org, upstream@lists.phytec.de
Subject: Re: [meta-virtualization][PATCH] podman-compose: Actually update to
 v1.0.6
Message-ID: <ZTgDMPcNIkLgUhpv@gmail.com>
References: <20231023093320.2584858-1-l.anderweit@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023093320.2584858-1-l.anderweit@phytec.de>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 24 Oct 2023 17:47:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8388

Crazy update script failure. I can see my update and what went wrong.

Thanks for the fix, this is now staged on master-next.

Bruce

In message: [meta-virtualization][PATCH] podman-compose: Actually update to v1.0.6
on 23/10/2023 Leonard Anderweit wrote:

> Commit 1fc1b193 (podman-compse: update to v1.0.6) states an update to v1.0.6
> but does not change the SRCREV. Fix this by using the correct SRCREV of v1.0.6.
> 
> Fixes: 1fc1b193 (podman-compse: update to v1.0.6)
> 
> Signed-off-by: Leonard Anderweit <l.anderweit@phytec.de>
> ---
>  recipes-containers/podman-compose/podman-compose_1.0.6.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/podman-compose/podman-compose_1.0.6.bb b/recipes-containers/podman-compose/podman-compose_1.0.6.bb
> index 04c1be9b..8a7c0c9e 100644
> --- a/recipes-containers/podman-compose/podman-compose_1.0.6.bb
> +++ b/recipes-containers/podman-compose/podman-compose_1.0.6.bb
> @@ -6,7 +6,7 @@ inherit setuptools3
>  
>  SRC_URI = "git://github.com/containers/podman-compose.git;branch=stable;protocol=https"
>  
> -SRCREV = "24ec539932580a6bc96d6eb2341141b6d7198b39"
> +SRCREV = "f6dbce36181c44d0d08b6f4ca166508542875ce1"
>  
>  S = "${WORKDIR}/git"
>  
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8383): https://lists.yoctoproject.org/g/meta-virtualization/message/8383
> Mute This Topic: https://lists.yoctoproject.org/mt/102131745/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


