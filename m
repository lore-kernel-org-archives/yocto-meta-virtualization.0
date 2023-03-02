Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A4BC6FA8E
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 21:31:31 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.7190.1677792690746214180
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 Mar 2023 13:31:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fm5lIhXc;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id c19so782190qtn.13
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 02 Mar 2023 13:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nBVBl+l2EiIgQBGFjANR/oxTzxe2eXWmjy4s75G/N2Y=;
        b=Fm5lIhXc0n7NWHCIdQ1XBxisQEPlsaM+MNWzS2zOl9RYCtWe0tqXJUvO4OkvrZxFcl
         enyRJtU+Hf1BRhawxKWM0yFLnWnt43XwDT3qDdo8YSi3fD+gLA+UKq8UhtL/QiIBOqdT
         arMy+y7OrMiPeCfGeBcESuGIYbcwemdxDeun4mCysJZa4f/ChmtChh7Bi12D5Tgh9zkn
         Uk+qLnRKufMboMF/gBkz5tHuoqREbwMwyR+Usj36f8y9WQSQm+4hok2f/U8IXgrHDGQU
         kthwXAOX0o+ohFJ3rvP8RIu+fkX75pRL1+L+PRp6J3OqTAlmuGVp+FPM+6GT6D2O4enx
         FxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBVBl+l2EiIgQBGFjANR/oxTzxe2eXWmjy4s75G/N2Y=;
        b=Liz+fT9iZFttLbuzIlhDxUZocw+56doJFx0ae11ikBJyczHnOITdJu6PVPVAb291gl
         /6xgamykFUO6JycNKYu9cnxm0FAthD1h+NiZSd4bY/DISgbwv3BGw93f9U8RwgUovLr8
         DQcQjpZUe8Hsw/dACNGl2vlGIUJ1WMNF048FzVHbf0jwRXSqW/ArMWrMgmQ/vfsbvmVf
         uIBdtxJmm1sV1FHvl+3AtOBHA8nmXwJtdRVRFIKHICfhXGfYblsTu4/BultXVoaW2A9N
         ha/JZOUlQQGjfUAqAvWWXh4Fc3inJ6+jtbGPhsB/nlP7YWPjTNtufYZczrWG5I0tkoQa
         tk1Q==
X-Gm-Message-State: AO0yUKVhzIFjmma0xKEK9DCwVZhM4ZOJ8HWZ4P90hkJ8FhK9mIrGzG2h
	7awg4CGhnrG3SwvWYeY27SaElLOpr/NOUg==
X-Google-Smtp-Source: AK7set9LlNyhCW6xD/osNWbP7/pHOxl69KE0cH5lhA7DBvkefji7b7lUxusIOh6pxkVaTTZWICvMQg==
X-Received: by 2002:ac8:5c04:0:b0:3b9:b70c:9697 with SMTP id i4-20020ac85c04000000b003b9b70c9697mr19699088qti.5.1677792689734;
        Thu, 02 Mar 2023 13:31:29 -0800 (PST)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id p23-20020a05620a057700b0071f0d0aaef7sm401565qkp.80.2023.03.02.13.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 13:31:29 -0800 (PST)
Date: Thu, 2 Mar 2023 16:31:27 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: mingli.yu@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [PATCH] yq: remove .git suffix for cobra component
Message-ID: <ZAEVr1edmDEb3qcs@gmail.com>
References: <20230302054508.2416982-1-mingli.yu@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302054508.2416982-1-mingli.yu@eng.windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 02 Mar 2023 21:31:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7927

merged.

Bruce

In message: [PATCH] yq: remove .git suffix for cobra component
on 02/03/2023 mingli.yu@eng.windriver.com wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Remove the '.git' suffix of the cobra in SRC_URI to make the cobra
> SRC_URI exactly the same among the recipes which define cobra to
> make sure two local git repos (Yocto supports fetching locally)
> which are the same.
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  recipes-devtools/yq/yq_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.bb
> index 755a6982..45f2f970 100644
> --- a/recipes-devtools/yq/yq_git.bb
> +++ b/recipes-devtools/yq/yq_git.bb
> @@ -27,7 +27,7 @@ SRCREV_FORMAT = "yq_color"
>  SRC_URI = "git://${GO_IMPORT};name=yq;branch=master;protocol=https \
>             git://github.com/fatih/color;name=color;destsuffix=build/vendor/src/github.com/fatih/color;branch=main;protocol=https \
>             git://github.com/goccy/go-yaml;name=lexer;destsuffix=build/vendor/src/github.com/goccy/go-yaml/;branch=master;protocol=https \
> -	       git://github.com/spf13/cobra.git;name=cobra;nobranch=1;destsuffix=build/vendor/src/github.com/spf13/cobra;branch=main;protocol=https \
> +	       git://github.com/spf13/cobra;name=cobra;nobranch=1;destsuffix=build/vendor/src/github.com/spf13/cobra;branch=main;protocol=https \
>  	       git://github.com/spf13/pflag;name=pflag;destsuffix=build/vendor/src/github.com/spf13/pflag;branch=master;protocol=https \
>  	       git://github.com/op/go-logging.git;name=logging;destsuffix=build/vendor/src/gopkg.in/op/go-logging.v1;branch=master;protocol=https \
>  	       git://github.com/go-yaml/yaml.git;name=yaml;branch=v3;destsuffix=build/vendor/src/gopkg.in/yaml.v3;protocol=https \
> -- 
> 2.25.1
> 

