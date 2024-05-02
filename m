Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E5AC4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 17:59:40 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.1452.1714672775921354976
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 May 2024 10:59:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bYoB/6Ai;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-69b44071a07so79620466d6.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 02 May 2024 10:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714672775; x=1715277575; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OAG+ebTTub1qybIwBcEsFH1nCYbinbQJ1C77Us85V7Q=;
        b=bYoB/6AiQDDVN9dM00tW6bddnwd53fYFkvIUm252tOYW6tKBvjCNQW8BIn/kl00+eN
         xVVA8QHr+oarEtsb0NtodfI8uDOClLkZi9Ahk903nsKZdKnrsK4cDh/tR7LndPspNz8i
         jUPmrlmSB3UQyH9kgNXzMtGXbhVmNWqlFP22rsRd0VZq/RTtWTSPSkis1jYm9F7ivV8k
         crro5w1AnZIDCxqptbYJzfWkskqeCF91eQo70NS36rzIvA8OyqMCgzI61tfmRWYLhIYD
         nTO43hUa49zthB2mpUMISVFqZHZQiwBurbZqtwSknT7yixHPzDOs/zsAVkiXKvfKmpC7
         TMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714672775; x=1715277575;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAG+ebTTub1qybIwBcEsFH1nCYbinbQJ1C77Us85V7Q=;
        b=Amtm9dwZU6t8WqLgg2yDl2PACQnMGF177VbBtZSuxfIRBq1vQqyVBTPAL52zm5BBnU
         KX7w6g1+JMKS7ftavcq1pmou5XiSWhKdR1H3L0kcRy+WV3YpVlobVibskJoCvGvHIdqO
         Fq+rky79kuZFz2/bfXFYFgtG3oRRhvecdRGmFJkdCST7vu1zhGZQQY1XnvQ45Dso3esV
         u+mRXxmrcHSyRv/ZGu8fqckrcByfNEKx1LZkjdGeCT22EY+6gzm3gu86jcEnt5xr4V4r
         zUB33o1Kh1UtWW6KMWZBhkeOMeMhGcNOY4/fuWm+W7MJ3FhqbHBgc++TuW1VeYooUgPc
         DSOw==
X-Gm-Message-State: AOJu0YzOftKwwMWeu5GI2vmWILhjnNQ1ozzJut/tkiqBcFC7W0V3VzHi
	1U3YWyWMVHp+zVDZ0s1RpCldIfvIDfRx3FNZFQAH8hOnbt/FN7HM
X-Google-Smtp-Source: AGHT+IHukS3rKzoUlDXYHlOt8Qw1SkKv3IsJytjDgdMHSK2X+2+vEDGmUuE/4gAmeD91FTmJRNK6zQ==
X-Received: by 2002:a05:6214:2a89:b0:6a0:b9bf:3cb3 with SMTP id jr9-20020a0562142a8900b006a0b9bf3cb3mr372513qvb.34.1714672774846;
        Thu, 02 May 2024 10:59:34 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id l1-20020ad44521000000b006a1051b933csm517008qvu.116.2024.05.02.10.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 10:59:34 -0700 (PDT)
Date: Thu, 2 May 2024 17:59:32 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Theodore A. Roth" <troth@openavr.org>
Cc: meta-virtualization@lists.yoctoproject.org,
	"Theodore A . Roth" <theodore_roth@trimble.com>
Subject: Re: [master][scarthgap][meta-virtualization][PATCH] podman: Fix
 missing brace in FILES
Message-ID: <ZjPUhFwaiSO/RoE6@gmail.com>
References: <20240501170343.1036664-1-theodore_roth@trimble.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240501170343.1036664-1-theodore_roth@trimble.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 02 May 2024 17:59:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8713

merged.

Bruce

In message: [master][scarthgap][meta-virtualization][PATCH] podman: Fix missing brace in FILES
on 01/05/2024 Theodore A. Roth wrote:

> From: "Theodore A. Roth" <troth@openavr.org>
> 
> When converting to use {systemd_user_unitdir}, the closing brace was
> omitted
> 
> Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
> Signed-off-by: Theodore A. Roth <troth@openavr.org>
> ---
>  recipes-containers/podman/podman_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index f69dec16..32de3f0c 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -134,7 +134,7 @@ do_install_ptest () {
>  FILES:${PN} += " \
>      ${systemd_unitdir}/system/* \
>      ${nonarch_libdir}/systemd/* \
> -    ${systemd_user_unitdir/* \
> +    ${systemd_user_unitdir}/* \
>      ${nonarch_libdir}/tmpfiles.d/* \
>      ${datadir}/user-tmpfiles.d/* \
>      ${sysconfdir}/cni \
> -- 
> 2.34.1
> 

