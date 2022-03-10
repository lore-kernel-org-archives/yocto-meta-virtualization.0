Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D45E7C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 19:43:07 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web12.1262.1646941386586705017
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 11:43:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=esCbrp13;
 spf=pass (domain: gmail.com, ip: 209.85.222.174,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id 1so4705224qke.1
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 11:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=q90NGdoV7ndhlItyOshaZML+T+1/C+mEzYCRLNYjrhU=;
        b=esCbrp13rCo1JLOGo+RvsSJZTt90XXdVi4BW7/ongmlaP70jgsl9maRmkM+KHFKMPL
         NmcHh6oHugHNDT64hvl4dI4ZvHZ0PqA7IeSLEnC0vXP8UppwK7IWheAuM7gzpeu/60G3
         vsSA6/1x10KuwP62Xl/RIwo1qsjRhsHtg2GM2XjGe1CuhS1YoTsafwOtoJs9Wd5urxQF
         JFuyX5+qgXFWwUsFxq89Lv1U6AjaC3tExLtn+8zCr0iUiFHWzMyVwX7t+bcVlS9xGOPc
         2LelhCHrHD5DycaNwx3QnBJOuqMEW4xYezcr1rHoDO71pnKrfw9Bo8IdTw2+cUeCzRp2
         L0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=q90NGdoV7ndhlItyOshaZML+T+1/C+mEzYCRLNYjrhU=;
        b=kJKyKLObWKtxgehpkaWHo/ENmq9PNK8Lwz3qUleoch8Z3EcucKC0V7bY/juSiJVYqL
         4B42gLRqPWQ7uzgXnu/CsZmgRXbW50AVK8yaV4cabGesCpoYZeT1VxdgID5YOQ3FpYjk
         Z0Bt9sGuK0NOG5/uj5F+o0h5+ZAzoSGqCZoT5rbiZF3zidFRPaVDT5COPYiadZuCrlQt
         HT/E4yUf1ejay4rHuMGjlBkgU1vcVYMUophNLCvye8BVNeBUtqUiRxHNp+1MGInV4Aqs
         SDpam1D4L5B1Xb02RyMbNtg8aHZ+aLyvxRvXqLXCF91LqmHRpuqIPRu+B2ilaCgtMWNz
         PIvQ==
X-Gm-Message-State: AOAM531q8aclgh/nlTIjqfmqQGjpXWXNrPVUo1AtHvHQEtI/24lJzeMe
	0aRjjaGRVvIj9dI2alT/yTI=
X-Google-Smtp-Source: 
 ABdhPJz6Gqo8HOS7huH4eMGuSOCYC1ptNXmSsFxlFxuXQL9fFXYESjKISVRWggLar2lE6eE4vQJb9g==
X-Received: by 2002:a05:620a:2591:b0:67a:f1ef:cda3 with SMTP id
 x17-20020a05620a259100b0067af1efcda3mr4344301qko.656.1646941385644;
        Thu, 10 Mar 2022 11:43:05 -0800 (PST)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a05622a00c400b002de0b744039sm3763590qtw.43.2022.03.10.11.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 11:43:05 -0800 (PST)
Date: Thu, 10 Mar 2022 14:43:03 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd@arm.com,
	christopher.w.clark@gmail.com, cardoe@gentoo.org,
	Michal Orzel <michal.orzel@arm.com>
Subject: Re: [meta-virtualization] [PATCH] xen: Override CC and CPP in make
 command line
Message-ID: <20220310194302.GB37392@gmail.com>
References: <20220309110906.2925117-1-bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220309110906.2925117-1-bertrand.marquis@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Mar 2022 19:43:07 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7086

I've merged the patch, if Christopher has any review comments or needs
changes, we'll stack them on top.

Bruce

In message: [meta-virtualization] [PATCH] xen: Override CC and CPP in make command line
on 09/03/2022 Bertrand Marquis wrote:

> From: Michal Orzel <michal.orzel@arm.com>
> 
> After 4.16 release, Xen build system has been changed significantly.
> When building latest status of Xen it was observed that commit
> 317c98cb91 broke the hypervisor build on arm32 due to the change in
> handling Rules.mk that xen.inc modifies to override CC and CPP.
> 
> In order to fix the issue this patch moves overriding CC and CPP from
> Rules.mk to make command line by adding them to EXTRA_OEMAKE:arm.
> 
> Take the opportunity to bump SRCREV of xen_git.bb and xen-tools_git.bb
> to the current status of master.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> ---
>  recipes-extended/xen/xen-hypervisor.inc | 8 ++++++++
>  recipes-extended/xen/xen-tools_git.bb   | 4 ++--
>  recipes-extended/xen/xen.inc            | 6 ------
>  recipes-extended/xen/xen_git.bb         | 4 ++--
>  4 files changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen/xen-hypervisor.inc
> index 81e361f..6f3d24d 100644
> --- a/recipes-extended/xen/xen-hypervisor.inc
> +++ b/recipes-extended/xen/xen-hypervisor.inc
> @@ -48,6 +48,14 @@ do_configure() {
>      fi
>  }
>  
> +# The hypervisor binary for arm must not be built with the hard floating point
> +# ABI. Override CC and CPP when invoking make so that they do not contain
> +# TUNE_CCARGS.
> +EXTRA_OEMAKE:arm += "CC='${CCACHE}${HOST_PREFIX}gcc ${TOOLCHAIN_OPTIONS} \
> +                         ${CC_REPRODUCIBLE_OPTIONS}' \
> +                     CPP='${CCACHE}${HOST_PREFIX}gcc -E ${TOOLCHAIN_OPTIONS} \
> +                         ${CC_REPRODUCIBLE_OPTIONS}'"
> +
>  do_compile() {
>      oe_runmake xen PYTHON="${PYTHON}" \
>                     EXTRA_CFLAGS_XEN_CORE="${EXTRA_CFLAGS_XEN_CORE}"
> diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xen/xen-tools_git.bb
> index 8ff9c4c..e733f1d 100644
> --- a/recipes-extended/xen/xen-tools_git.bb
> +++ b/recipes-extended/xen/xen-tools_git.bb
> @@ -1,5 +1,5 @@
> -# master status on 2020-10-21
> -SRCREV ?= "23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9"
> +# master status on 2022-03-08
> +SRCREV ?= "9d4a44380d273de22d5753883cbf5581795ff24d"
>  
>  XEN_REL ?= "4.16"
>  XEN_BRANCH ?= "master"
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 4df99bf..8b86de5 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -193,12 +193,6 @@ do_post_patch() {
>      fi
>  }
>  
> -do_post_patch:append:arm()  {
> -    # The hypervisor binary must not be built with the hard floating point ABI.
> -    echo "CC := \$(filter-out ${TUNE_CCARGS},\$(CC))" >> ${S}/xen/arch/arm/Rules.mk
> -    echo "CPP := \$(filter-out ${TUNE_CCARGS},\$(CPP))" >> ${S}/xen/arch/arm/Rules.mk
> -}
> -
>  addtask post_patch after do_patch before do_configure
>  
>  # Allow all hypervisor settings in a defconfig
> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
> index e014733..2fbfb54 100644
> --- a/recipes-extended/xen/xen_git.bb
> +++ b/recipes-extended/xen/xen_git.bb
> @@ -1,5 +1,5 @@
> -# master status on 2020-10-21
> -SRCREV ?= "23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9"
> +# master status on 2022-03-08
> +SRCREV ?= "9d4a44380d273de22d5753883cbf5581795ff24d"
>  
>  XEN_REL ?= "4.16"
>  XEN_BRANCH ?= "master"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7079): https://lists.yoctoproject.org/g/meta-virtualization/message/7079
> Mute This Topic: https://lists.yoctoproject.org/mt/89659618/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


