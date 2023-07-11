Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7266EEB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 19:14:18 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.4923.1689102851823682293
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 11 Jul 2023 12:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=hocja21A;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-403392ce2b9so49017381cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 11 Jul 2023 12:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689102851; x=1691694851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zVKZI4xRiUZrCPXo7w2z8hoyECorJunwWPNY4ql3pCE=;
        b=hocja21AaPUzCi4e6fJpdHFkGkvXt51P2AfLaviJXgiL7+Ss3zkq5KoqgfOeEPVNJi
         gGETeaogj9fF3HbQoxZN8334ffudZgVGIMtSjjwBxrIXa6by4ZDtlZjSyCEePZH8zpqB
         wjfCBKaK+PtuwpxBZ9VdqZ6RUjCG/g2xoG8fnlRYE3mneb9qo+p3mFI0zIhuZLRVP9GA
         al29zQcq1H8FJUWXoasOpkhW55+Q/Vl0n1yV2zK1V7++TzHXc1X86jj7klJ7qC4YbZHh
         B/95zrkrPosua5YQIbwNlAl3QdEdMgwskLlsNZQLy/moCeW73inx06z+U3+sTxmy71IB
         +pww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689102851; x=1691694851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zVKZI4xRiUZrCPXo7w2z8hoyECorJunwWPNY4ql3pCE=;
        b=FUIV1ld3Swt7JZRz2WkPjSuqmf3IKsjyQo2omTKBguUrTf0bAKusjWQL+W5g3fjqZG
         calHjv2+kzcSOKEp6AKq3grnBYHWAxzFhCCn71qh36oL/0pYEWA2FutfFJsEOovpZpa1
         AWGn9hk4Wp6TeelKYfWig8LYdqlzvt3aBrYQlUNzFhHNwHO5Rc/So/enu3E9yET06Btu
         QAvWfbcrkKZS7nQYXrOJp+3vVDsMKZ6yACHIaujY7zYRP+T1Lk3f6H1QQ/wrTaBofips
         4pNgOsiPyr9zaZr4eCAEGW7goxwBSHPApHH+jgj99MssK2w5N7kFqj/RnWW8ARaNQjYl
         oujw==
X-Gm-Message-State: ABy/qLZoKVl4wzDONZiy0bCO1S5NjrVggMoClGPzuL8HckJu3S/1JPFc
	i8TJM0K0zDobhu3OaQBDuvInvU28JiC3Mw==
X-Google-Smtp-Source: APBJJlG4oUdHtGc57+8CbEyVep4V8WBqMfiB4RBHIQ5tnUSyceXmCdLfAWyj2LKgGyEvNXL+zQdcLg==
X-Received: by 2002:a05:620a:3197:b0:765:a9f4:9656 with SMTP id bi23-20020a05620a319700b00765a9f49656mr19567506qkb.26.1689102850765;
        Tue, 11 Jul 2023 12:14:10 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id g25-20020a05620a13d900b00767d7307490sm1314252qkl.34.2023.07.11.12.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 12:14:10 -0700 (PDT)
Date: Tue, 11 Jul 2023 19:14:08 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: ml@calgera.com
Cc: meta-virtualization@lists.yoctoproject.org,
	Renato Caldas <renato@calgera.com>
Subject: Re: [meta-virtualization][PATCH] cri-o: drop unneeded dependency on
 virtual-containerd
Message-ID: <ZK2qADK3bhjZ7nIf@gmail.com>
References: <20230706225313.3085607-1-ml@calgera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230706225313.3085607-1-ml@calgera.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 11 Jul 2023 19:14:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8128

In message: [meta-virtualization][PATCH] cri-o: drop unneeded dependency on virtual-containerd
on 06/07/2023 Renato Caldas via lists.yoctoproject.org wrote:

> From: Renato Caldas <renato@calgera.com>

Indeed .. it really never did need to be there, it was always just tested with
both on the target, so it crept into the depends.

This is now merged.

Bruce

> 
> Signed-off-by: Renato Caldas <renato@calgera.com>
> ---
>  recipes-containers/cri-o/cri-o_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
> index 3b6bbf3..7ff3610 100644
> --- a/recipes-containers/cri-o/cri-o_git.bb
> +++ b/recipes-containers/cri-o/cri-o_git.bb
> @@ -50,7 +50,7 @@ PACKAGECONFIG[selinux] = ",,libselinux"
>  
>  PACKAGES =+ "${PN}-config"
>  
> -RDEPENDS:${PN} += " virtual-containerd ${VIRTUAL-RUNTIME_container_runtime}"
> +RDEPENDS:${PN} += " ${VIRTUAL-RUNTIME_container_runtime}"
>  RDEPENDS:${PN} += " e2fsprogs-mke2fs conmon util-linux iptables conntrack-tools"
>  
>  inherit systemd
> -- 
> 2.41.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8122): https://lists.yoctoproject.org/g/meta-virtualization/message/8122
> Mute This Topic: https://lists.yoctoproject.org/mt/99996198/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


