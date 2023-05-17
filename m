Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B99BAC77B75
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 15:48:00 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.53883.1684338471762015031
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 May 2023 08:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=C5R3HtgP;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-759219bed84so55394685a.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 17 May 2023 08:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684338471; x=1686930471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VcJTxT5k8XZxEKfYkai699DYFDKV7ZtaUms5wHEj33E=;
        b=C5R3HtgPK2fBSt9ysDJitZB0fe6pofX6Qc77FPR+hMzw7tMKHuRO1LCSTc7dQ1Y6oO
         /W/mNqjiaJ+qhOJb6Kj3dIpDB0J6/ysHmkaAXvnpwblMfqw+o5OyMYBnfZfiVwY0aVCs
         L0VBKEUxH1C0qII0AXRD4dnyRYNGmXDjLWc/uI2E+3phFwij/dvwCfs2JwXL95aZiLDh
         DAEuYUbX7LfT91/ZkTERN3dMOO+tusgXpFQh2AbCU15A7n6k8n5M7jPGpQpCM+Q1s7gi
         gdbKiEPMfZgf9g67/CeJQa4MASxkB32+/9EMFUALEPiZQTaEtR/GeCKUZhagCMYHF9QZ
         ZGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684338471; x=1686930471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcJTxT5k8XZxEKfYkai699DYFDKV7ZtaUms5wHEj33E=;
        b=Zbea4iygJv1KAffIRTd11sV/7lyYAlpbcchhrClnZP86iIdMycjURCNoq9StiBZEd+
         1gQkF51eHygr3BJLEYp2M8BtWQy//1gcqxXrOa6Vv0rsFphtIASoost1ApkHI+qdxS3Z
         a/rrwg+ZO1tsgft+q9OZww9fHgpgNELQzAqVGtL8p19lIYgTA/QYpP18jLY2VP7/qM6/
         RVj613VIH9ONKnOfauCmkwJMoh4IBvR63HGmICRhC0P+qVqVYUESrQX6uZGuHUVM9pjH
         TmlcRL4WwZNJa464IUimpJ/Si1Gk2XTWvbFI4zkHd4YIFJa3JapeOSwWRrvWjUltEw7Z
         NhDA==
X-Gm-Message-State: AC+VfDyAqhuBK0O8bxf6ByyZdH9425opuAnUAkRIOX/iMHbhKa9o56rg
	OUkRb4VamJukmbUIAfCD3+VgRUqVuAJRkw==
X-Google-Smtp-Source: ACHHUZ63r/UWuVsLffoY+Ciq5KABEa80/Fh6H40R04SNxFn65hEyLhuSya2t8Q6rH90Cmg1Je2B+mQ==
X-Received: by 2002:ad4:5b85:0:b0:621:7d4:e068 with SMTP id 5-20020ad45b85000000b0062107d4e068mr17305qvp.52.1684338470684;
        Wed, 17 May 2023 08:47:50 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id f8-20020a0cf3c8000000b0061b67ae2ff9sm6435086qvm.121.2023.05.17.08.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 08:47:50 -0700 (PDT)
Date: Wed, 17 May 2023 11:47:48 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][master][kirkstone][PATCH] xtf: chang the
 old override syntax
Message-ID: <ZGT3JMOqK95lGEYf@gmail.com>
References: <20230510022946.2327496-1-xiangyu.chen@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230510022946.2327496-1-xiangyu.chen@eng.windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 17 May 2023 15:48:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8060

Amazing that this has hidden for so long!

This is now merged to master, mickledor and kirstone.

Bruce

In message: [meta-virtualization][master][kirkstone][PATCH] xtf: chang the old override syntax
on 10/05/2023 Xiangyu Chen wrote:

> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> 
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  recipes-extended/images/xtf-image.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/images/xtf-image.bb b/recipes-extended/images/xtf-image.bb
> index a78959d..f9ecea9 100644
> --- a/recipes-extended/images/xtf-image.bb
> +++ b/recipes-extended/images/xtf-image.bb
> @@ -31,4 +31,4 @@ IMAGE_INSTALL:append = " xtf"
>  
>  DEFAULT_TEST_SUITES:append = " xtf_minimal"
>  
> -QB_DEFAULT_FSTYPE_x86-64 = "wic"
> +QB_DEFAULT_FSTYPE:x86-64 = "wic"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8048): https://lists.yoctoproject.org/g/meta-virtualization/message/8048
> Mute This Topic: https://lists.yoctoproject.org/mt/98798654/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


