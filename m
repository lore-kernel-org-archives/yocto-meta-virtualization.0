Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31421C76195
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 02:15:03 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.56877.1679969697704178063
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Mar 2023 19:14:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RAv8Qk+9;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id q88so8201236qvq.13
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Mar 2023 19:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679969697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KnLDl/3vnbJScbwTvjhMDNdgZL/AmXjG3ZasfI7gaOM=;
        b=RAv8Qk+9yYfAsWNucQA89gugSVc+YLwLe5KEOeriJ1MaOJ9cf/KIkrIFyx2k/n9iFW
         cELOd7t/iwtW/UExsiYtIAYl5U8toZ3T6iP/yi+lhXYR8lP+7nTbumo9n6zha+dkfvx4
         e22PsjiuB56LIwVxXpolHax/nvX174ykJXpLygvT82Lcc2z3ePJKktVlSPUrWx8GNjF9
         H7CGjueJ92RUR4xY1t1kFbDRGK0WqvliYCYL5zk2AqAnGCBvY1LouZhtC3qlPckXJmLv
         VZYkA+meQlO32FWIg/9freqjYcbY3EQLmfSbKbPDOEI4w4q3ehz2WgQW/6d6h/8+E8v7
         ai4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679969697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KnLDl/3vnbJScbwTvjhMDNdgZL/AmXjG3ZasfI7gaOM=;
        b=Ap37XYLvQ6L642BwpdZ21KL1FEWVjcnidEeQEIQTokidITaxEOJ3l088R7BCSHk0vM
         tDZ4eGel1wNXVqrIgOmjp6tkkMmTIMSownaVCQp3vQnLmLZVeq17jRJN/sWEG5m1oEUS
         sViWWjvGIdpG8rylMsYevEY8VvW5pQ8NZpi6sigieQPlblTYX+w9Q5WRQtIunDKEL+sR
         qPeAyiyPG1tQyY/U/ZANvcCXGycwYU3i619bmF8VUGCyJKdd1JC+RbZsmEMxN/uv4w7K
         v65/FAuu8TZRxT4PyN/v7J+ro86MvDRHL/F/olkR8TdFvKsNBjWNh61AZtxqV/w3yh4c
         oNpQ==
X-Gm-Message-State: AAQBX9fnyX/NruG9YL2bb/aLx0EfD3fqb6BJZUnYY7GJjgRZRldzjftN
	9PT3cVeOpWG0vL4+xsgM8Nw=
X-Google-Smtp-Source: AKy350YkPvLeolHnJ3DD9UjbYS+41WrgqoGHlTPGWfxphQpsApUwzLO1QHHtKWH3UXiyFUhxeUgxYw==
X-Received: by 2002:ad4:594b:0:b0:5c7:640:8997 with SMTP id eo11-20020ad4594b000000b005c706408997mr20041822qvb.51.1679969696567;
        Mon, 27 Mar 2023 19:14:56 -0700 (PDT)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id i13-20020a056214030d00b005dd8b9345ccsm3387941qvu.100.2023.03.27.19.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 19:14:56 -0700 (PDT)
Date: Mon, 27 Mar 2023 22:14:54 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: Re: [meta-virtualization][PATCH 1/2] Revert "yq: drop {LINKSHARED}"
Message-ID: <ZCJNnkEcFtApQ8FR@gmail.com>
References: <20230327082037.3173653-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327082037.3173653-1-jose.quaresma@foundries.io>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Mar 2023 02:15:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7960

This is now staged on master-next.

Bruce

In message: [meta-virtualization][PATCH 1/2] Revert "yq: drop {LINKSHARED}"
on 27/03/2023 Jose Quaresma wrote:

> This reverts commit d2a630ce6cf67a145f218012fbf02e4d0d9648df.
> 
> The linkshared is fixed upstream and backported in oe-core.
> https://git.yoctoproject.org/poky/commit/?id=d5c79ca6a77af1a04992fff4300333e02d94d84d
> 
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  recipes-devtools/yq/yq_git.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.bb
> index bd474a7..45f2f97 100644
> --- a/recipes-devtools/yq/yq_git.bb
> +++ b/recipes-devtools/yq/yq_git.bb
> @@ -50,7 +50,7 @@ GO_IMPORT = "github.com/mikefarah/yq"
>  
>  inherit go ptest
>  
> -do_compile() {
> +do_compile:prepend() {
>      # arrange for some of the golang built ins to be found
>      (
>  	cd ${WORKDIR}/build/src/
> @@ -60,7 +60,6 @@ do_compile() {
>      # arrange for the fetched dependencies to be found
>      export GOPATH="${GOPATH}:${WORKDIR}/build/vendor/"
>      export GO111MODULE=off
> -    ${GO} install ${GOBUILDFLAGS} `go_list_packages`
>  }
>  
>  do_install:append() {
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7956): https://lists.yoctoproject.org/g/meta-virtualization/message/7956
> Mute This Topic: https://lists.yoctoproject.org/mt/97877469/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


