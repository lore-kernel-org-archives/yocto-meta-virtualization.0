Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B019EE3F12
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 19:46:55 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.133.1694548012139649145
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Sep 2023 12:46:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=bTBdGzyb;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-64b3ae681d1so32727536d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Sep 2023 12:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694548011; x=1695152811; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oLt7RfgvDD8HcBBd782Y/cb3T4G4FGo4jwsR/ujtOwU=;
        b=bTBdGzybUztQvLFO+lCDklTjHL8fjFkoa8ziaJeeRLbQRiub2IxrVL28SFnzF8zOY1
         vUNfi8fS6KwUCrSipZoi6/CYvXyij7iY9nL5ho1UtATA+vX6wYHvBFz+Yz5AaqsLnbcG
         D+3b2QGihTOODAxtlIRR9Mg/93C02USPQ8/EiL6diinn+EvJbDhCcDTq8SXmiGpObUXB
         C5rWW8jJW/lD6sORCQt7M9RXIipaqvE/NWEF8CFq6ig/yq+1ygreldFScsZT7adWReGV
         jlS+K/hV3N1WidJHsomWdDRUz/m6u1w8AqaYZfmhrpVcBdBQByJ7pL7I+ASllbSMHR3B
         jhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694548011; x=1695152811;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oLt7RfgvDD8HcBBd782Y/cb3T4G4FGo4jwsR/ujtOwU=;
        b=OTr9HSaIGDGP2aot8i4TsOLDdfO9ud50/fwmezWnNTfMjAkca8zxvSwN1pZX/BwjAN
         fT5ZS3w2c1lPNF5xZ7jSj1Rft4p1Rrm20QoEoxywyO62h0BdJQNZSpcAii2vsx3LknR1
         7BNwpAgYiTtzRgGhfMg4INIZd3RZPd/PcQHO49raTIv+6HEjtuUnwMRT/ptJZVPE6d2k
         m6VbEwfFTm7RAsmHgFeUY+jfY6TyFqXOWS9xnWA2ab/oeGKAFxnYe15v+aJ2j1j2cj9l
         PuP6BPX6bG9UfanUMhh5UXVSgtHy6wf/vFMERsm5HJPU8eNtlg8CyNf0mdSH9gzIxgOU
         RTiw==
X-Gm-Message-State: AOJu0YyxAvIIFHqJ7HuPfZT1uNyhXSOzbZKjPU1u2JxiPKHXlgKmvVHf
	OIXnBZhYLOajx2zETt5z1GU=
X-Google-Smtp-Source: AGHT+IG1Y4q2AeZyFkqwf6owlbsoIW+/siLzJwG5ACF4S2JNSvSpymDrYDagQpYONOku2t098L2Z1A==
X-Received: by 2002:a05:6214:29ee:b0:64f:8213:197d with SMTP id jv14-20020a05621429ee00b0064f8213197dmr581353qvb.33.1694548011098;
        Tue, 12 Sep 2023 12:46:51 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id u11-20020ae9c00b000000b0076aeeb69cb1sm3415929qkk.4.2023.09.12.12.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 12:46:50 -0700 (PDT)
Date: Tue, 12 Sep 2023 19:46:49 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Mingli Yu <mingli.yu@windriver.com>
Subject: Re: [meta-virtualization] [kirkstone][PATCH 1/2] go-context: Switch
 to main branch
Message-ID: <ZQDAKQuTe4G0qNFz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912072034.89009-2-martin.jansa@gmail.com>
 <20230912072034.89009-1-martin.jansa@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Sep 2023 19:46:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8298

merged to kirkstone.

Bruce

In message: [meta-virtualization] [kirkstone][PATCH 1/2] go-context: Switch to main branch
on 12/09/2023 Martin Jansa wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
> 
> The project has renamed the master branch to main.
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  recipes-devtools/go/go-context_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-devtools/go/go-context_git.bb b/recipes-devtools/go/go-context_git.bb
> index 37f39b38..0959054b 100644
> --- a/recipes-devtools/go/go-context_git.bb
> +++ b/recipes-devtools/go/go-context_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c50f6bd9c1e15ed0bad3bea18e3c1b7f"
>  SRCNAME = "context"
>  
>  PKG_NAME = "github.com/gorilla/${SRCNAME}"
> -SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
> +SRC_URI = "git://${PKG_NAME}.git;branch=main;protocol=https"
>  
>  SRCREV = "14f550f51af52180c2eefed15e5fd18d63c0a64a"
>  
> -- 
> 2.42.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8294): https://lists.yoctoproject.org/g/meta-virtualization/message/8294
> Mute This Topic: https://lists.yoctoproject.org/mt/101310625/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


In message: [kirkstone][PATCH 2/2] go-mux: Switch to main branch
on 12/09/2023 Martin Jansa wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
> 
> The project has renamed the master branch to main.
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  recipes-devtools/go/go-mux_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-devtools/go/go-mux_git.bb b/recipes-devtools/go/go-mux_git.bb
> index 3f939f45..fb4502b6 100644
> --- a/recipes-devtools/go/go-mux_git.bb
> +++ b/recipes-devtools/go/go-mux_git.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c50f6bd9c1e15ed0bad3bea18e3c1b7f"
>  SRCNAME = "mux"
>  
>  PKG_NAME = "github.com/gorilla/${SRCNAME}"
> -SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
> +SRC_URI = "git://${PKG_NAME}.git;branch=main;protocol=https"
>  
>  SRCREV = "136d54f81f00414c45c3c68dd47e98cc97519c5e"
>  
> -- 
> 2.42.0
> 


