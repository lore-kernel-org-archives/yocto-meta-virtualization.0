Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B651BC433F5
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web12.10900.1650476546420554343
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 10:42:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cl/mhS9D;
 spf=pass (domain: gmail.com, ip: 209.85.222.176,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id j6so1763503qkp.9
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 10:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ptcLQBnDQTqj+I62+zClViNY97M5w84IEyy1RNhYjZk=;
        b=cl/mhS9DLa4sgUzIhrM7+61qk4P1wgUfV+BvbBuguc0DWTDLIyJP+eNuYi8582PHNk
         ahttrKrdtP7Hafk9LaAasldHKTe/DSISiJitwcSYFhQhklQynUt07urzdfoJSoF9A5CY
         UOGZOizWyhvDNMfM0KeTnG98zlWKa8BJBzE1mW0VclvmYsfXkDovZ4vKpdclDYxxBYUd
         Rs4qV1BfssVNwNUWsvPRA0idGRJfRT6iDiSLrB0V93HGfKU2lYJ5xXn5C7OPyGVsAxjL
         kOYz52iAPLmcaIbuzehLU5m9j20YuteAgcnQVercGeUv4ap/rAkAMCW21eH3HbSKrK2S
         JG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ptcLQBnDQTqj+I62+zClViNY97M5w84IEyy1RNhYjZk=;
        b=hh6ujpbT9X4iwiHSgsVXN+gB2AIKeX1GHemYKNXFH9wNDyyso6V+A1Oq1mfqOyU2qn
         SIlYy+Jlg4cvSOSwvFKXx8Fvi+bonFpyOON6GafKlpytrPZJ5fw82dvc7bYoQo9PKjY+
         E+O/XvsaaESJbgotjM4Q5hEUhMpc4E4fyqFgvjqilPI8bqKbyJiOCXx43LcCM17emNYQ
         5eR0nISJJHBM3s2ZLsneCQHJhgir1cjwY3uibY3Nxwclyw/zOb6jILAeQ6AOUIpoaLdM
         dajNbUFTWhLSkOVJVDjEeqrsgcqwBCFl7ROFIBgkz6B22gxxl5jFvIvhKJ4pKP/gDsPs
         j5fQ==
X-Gm-Message-State: AOAM5313QDu7OtT4H1DybpuPy5D6GXfcg4PS647jbaOu9VxrHkwlwCMX
	9csGW0+aa5koiRuRAJKaNAs=
X-Google-Smtp-Source: 
 ABdhPJzjP6vyg3ZsUwIvc0GVyQks11ii8BTji2rzkqcz01GKBj4LQ2BBKXBMaNhs7nLPPZ2kGvhsCQ==
X-Received: by 2002:a05:620a:2941:b0:69e:a525:8379 with SMTP id
 n1-20020a05620a294100b0069ea5258379mr8769824qkp.124.1650476545479;
        Wed, 20 Apr 2022 10:42:25 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 a7-20020a05622a064700b002e238d6db02sm2201897qtb.54.2022.04.20.10.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 10:42:25 -0700 (PDT)
Date: Wed, 20 Apr 2022 13:42:23 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][hardknott][PATCH V2]
 containerd-opencontainers: bump to v1.4.13
Message-ID: <20220420174220.GA60199@gmail.com>
References: <20220415092430.108366-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220415092430.108366-1-Qi.Chen@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7202

merged.

Bruce

In message: [meta-virtualization][hardknott][PATCH V2] containerd-opencontainers: bump to v1.4.13
on 15/04/2022 Chen Qi wrote:

> Bump from v1.4.12 to v.1.4.13, which solves CVE-2022-23648.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../containerd/containerd-opencontainers_git.bb               | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
> index 7f6c75d9..40b03163 100644
> --- a/recipes-containers/containerd/containerd-opencontainers_git.bb
> +++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
> @@ -5,7 +5,7 @@ DESCRIPTION = "containerd is a daemon to control runC, built for performance and
>                 support as well as checkpoint and restore for cloning and live migration of containers."
>  
>  
> -SRCREV = "7b11cfaabd73bb80907dd23182b9347b4245eb5d"
> +SRCREV = "9cc61520f4cd876b86e77edfeb88fbcd536d1f9d"
>  SRC_URI = "git://github.com/containerd/containerd;branch=release/1.4 \
>             file://0001-build-use-oe-provided-GO-and-flags.patch \
>             file://0001-Add-build-option-GODEBUG-1.patch \
> @@ -15,7 +15,7 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/1.4 \
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=1269f40c0d099c21a871163984590d89"
>  
> -CONTAINERD_VERSION = "v1.4.12"
> +CONTAINERD_VERSION = "v1.4.13"
>  
>  EXTRA_OEMAKE += "GODEBUG=1"
>  
> -- 
> 2.33.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7180): https://lists.yoctoproject.org/g/meta-virtualization/message/7180
> Mute This Topic: https://lists.yoctoproject.org/mt/90483257/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


