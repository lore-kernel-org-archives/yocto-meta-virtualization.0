Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF4AC433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 14:02:04 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web11.11113.1645192923525962279
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 18 Feb 2022 06:02:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=axz6KEKZ;
 spf=pass (domain: gmail.com, ip: 209.85.217.47,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id g20so10030938vsb.9
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 18 Feb 2022 06:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=E2TBX2a5lFN17wjUb6h1jxwIrZpZukrHM/II1dhWb8I=;
        b=axz6KEKZRhhbgDwbe2W9y0DLUwQR6oc3NgWZek7lJ3dYL33cenNkv8tDAfjzQs0zn1
         +M7gE6zkViKj0o3wqeXNw+M1gKmvryl3CJBpQpUh1u1BCYP9KeiCu3do5itnEMwtqyru
         zhjqSAICO4W7ogiXqI8Zn0IaRfjd2HVS2Fp4fAGzc/Wyu5aU1SgGJzMFN15XLSC+1JDn
         leedsBxJnrbe3ce6/WJNtQbygTOdgtsHITCxE2nTbBROcTTJzmmkkekZQD8Hzs7SH50w
         WzVVrz/C2LMDWdYsxdzVlg/MLzUBUicwZA3UUjulVuv+OmyFZJwNwS0JotSHDKsHVk9j
         N39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=E2TBX2a5lFN17wjUb6h1jxwIrZpZukrHM/II1dhWb8I=;
        b=3oeWGcW3y2zJexYl8wPcHzM3Eq/8hJrc8QI3nvfJpbQSkd9jDOyTy7QkLlEYv+pJT3
         Kc8tZ9jkslUqrFNfCv2ktcAonVrvlfsu4YFAo/2tc5D/I2Kr3uRftc4Y2QagsSnFL+5x
         nfAbuLrxf7jN8TVsZwRMzmsrBLRJG5eRNeWTBoQa2RjNouqVJoClO7AdCdHG/HO2oTY2
         LQKy30adE1ggfPtG7nTaDqWjmJ6CK68jCHV+rLIEw2EUkaDZrM5XCpwvU8ZAxlnWlEV2
         c9fY6JpUssJQSPfjAHG5bmHbIUiiDWMpF2KmgMX+c59vJb4qV4g6wh4qrwUsN8h4OrkL
         uWew==
X-Gm-Message-State: AOAM533wh95zBCkkEl1FO2bMIcp/JMvA2DPf+TYLSDJKF+wLp/HM2WYk
	5mrL0Q2L5V/XJJX/4tbHfjc=
X-Google-Smtp-Source: 
 ABdhPJz8mVxw9pKV1DO+QEHFalzLfeS5ranL2YI8quCpHKsr5lZfoHKLIcVukvvNKI5ZsEixqniMjA==
X-Received: by 2002:a05:6102:418a:b0:307:8e85:7b7d with SMTP id
 cd10-20020a056102418a00b003078e857b7dmr3585746vsb.53.1645192919716;
        Fri, 18 Feb 2022 06:01:59 -0800 (PST)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 s136sm1608109vkb.50.2022.02.18.06.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 06:01:58 -0800 (PST)
Date: Fri, 18 Feb 2022 09:01:56 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][m-c-s][PATCH 1/2] librdmacm: update
 LICENSE variant
Message-ID: <20220218140154.GA57810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220218083347.3359542-2-changqing.li@windriver.com>
 <20220218083347.3359542-1-changqing.li@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 18 Feb 2022 14:02:04 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7064

merged.

Bruce

In message: [meta-virtualization][m-c-s][PATCH 1/2] librdmacm: update LICENSE variant
on 18/02/2022 Changqing Li wrote:

> From: Changqing Li <changqing.li@windriver.com>
> 
> Fix warning:
> WARNING: QA Issue: librdmacm: No generic license file exists for: BSD in any provider [license-exists]
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  recipes-extended/librdmacm/librdmacm_1.1.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/librdmacm/librdmacm_1.1.0.bb b/recipes-extended/librdmacm/librdmacm_1.1.0.bb
> index 2e18b0a9..a3271dfd 100644
> --- a/recipes-extended/librdmacm/librdmacm_1.1.0.bb
> +++ b/recipes-extended/librdmacm/librdmacm_1.1.0.bb
> @@ -9,7 +9,7 @@ Also includes ACM (communication management assistant) service."
>  HOMEPAGE = "http://www.openfabrics.org/downloads/rdmacm/"
>  SECTION = "libs/devel"
>  
> -LICENSE = "BSD"
> +LICENSE = "BSD-2-Clause | GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=39cc3044d68741f9005da73e9b92db95"
>  
>  DEPENDS = "virtual/libibverbs"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7063): https://lists.yoctoproject.org/g/meta-virtualization/message/7063
> Mute This Topic: https://lists.yoctoproject.org/mt/89228857/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


In message: [meta-virtualization][m-c-s][PATCH 2/2] celt051: update LICENSE variant
on 18/02/2022 Changqing Li wrote:

> From: Changqing Li <changqing.li@windriver.com>
> 
> fix warning:
> WARNING: QA Issue: celt051: No generic license file exists for: BSD in any provider [license-exists]
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  recipes-support/celt051/celt051_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-support/celt051/celt051_git.bb b/recipes-support/celt051/celt051_git.bb
> index 6eab5669..52c7cf38 100644
> --- a/recipes-support/celt051/celt051_git.bb
> +++ b/recipes-support/celt051/celt051_git.bb
> @@ -9,7 +9,7 @@ with high quality. Unlike these formats CELT imposes very little delay \
>  on the signal, even less than is typical for speech centric formats \
>  like Speex, GSM, or G.729."
>  
> -LICENSE = "BSD"
> +LICENSE = "BSD-2-Clause"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=375f60ab360d17f0172737036ff155b2"
>  
>  PV = "0.5.1.3"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7062): https://lists.yoctoproject.org/g/meta-virtualization/message/7062
> Mute This Topic: https://lists.yoctoproject.org/mt/89228856/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



