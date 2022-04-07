Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26460C433F5
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 23:49:46 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.278.1649368140613978269
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 07 Apr 2022 14:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kJCNRudm;
 spf=pass (domain: gmail.com, ip: 209.85.222.182,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id v13so3377219qkv.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 07 Apr 2022 14:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5Uq+3ljwCJFCPLBglkYmQY0ZXiOaE/zvlYoACB3EQrI=;
        b=kJCNRudmwK/YdO44Sn7uDtbX65IgX7yBnTiqBjt4UwDrG0uFgczFICHPCZWO4GOiRb
         7mSPy1AMLLSikYdn/ys8mSsmTqVZBASfMa8elImdLp7D3d4xYoMvCo9mi+Oqj8fHJoqC
         mJ5kL9Gu2U9aeXeMzdgO/0x8RCZy2Cr0t9JWw5RjIvv/8Qve/MAaR8FZAvQuDeFBYfYW
         0b8OKXmhF7DyY3kxFoyOP+gJRyTBGnDeGfc12wkBXfc8Nlh1KP3IkNa5tr/t1M58lu4J
         9hshEtYDlv6Y2EUTk7nJ+SHYbjjCf/UhNUspDzZCepKRiKIAAssrkEARTIIHPgS9jE0/
         5kmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5Uq+3ljwCJFCPLBglkYmQY0ZXiOaE/zvlYoACB3EQrI=;
        b=P6PDMIt/KYcXgN3XyUzUmyAVosFc7C+hBd1PC1VrSp7cDJBwE03xrk08LMf/eYNFC6
         LYPInHq2+lCfxP4KtrqR66EKFU0xd+MUkN6psm6j/0tGzjPS51qn9BTZ3u3dSzTw1is5
         NQ3CmpaTR4CC9fp1P4e3KEYkn3k/n+835l7SD4hSMQP5tR7byS4EkReix7lt2tKl0bdY
         nNPbbskzv80rp1Ex8pcrKTY+o3qv7MxbL4cttNJTMNl3lX+tuTZ75oEf+3vphnSkvkGq
         hA9W8iy6/S4vWbn2cYuXdY1LoXnZUeiYCFF+9ppDDFiUPUG8lGLbvLdKkD7KlHCnjxsX
         7IRw==
X-Gm-Message-State: AOAM531vZLaoy4pdqtdQ3G9/5jA0kHqrOWskYzdBNS8vp0bEy/39+SZR
	u9xIwTlunOz64G0Dm21nwcI=
X-Google-Smtp-Source: 
 ABdhPJyaGbGs7lX1VBVdXiTe/fNw1gabkw99yAk0kRw70YAYDZ7HFL3U9E8K6JeZEBSksfZByIF6MQ==
X-Received: by 2002:ae9:e20f:0:b0:67d:2e50:1774 with SMTP id
 c15-20020ae9e20f000000b0067d2e501774mr10902120qkc.430.1649368139618;
        Thu, 07 Apr 2022 14:48:59 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 e15-20020ac8670f000000b002e22d9c756dsm14587394qtp.30.2022.04.07.14.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 14:48:59 -0700 (PDT)
Date: Thu, 7 Apr 2022 17:48:57 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Ross Burton <ross@burtonini.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] virt-what: add new recipe
Message-ID: <20220407214854.GA8338@gmail.com>
References: <20220406161440.2629415-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220406161440.2629415-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 07 Apr 2022 23:49:46 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7129

merged to master.

Bruce

In message: [meta-virtualization] [PATCH] virt-what: add new recipe
on 06/04/2022 Ross Burton wrote:

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  recipes-extended/virt-what/virt-what_1.21.bb | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 recipes-extended/virt-what/virt-what_1.21.bb
> 
> diff --git a/recipes-extended/virt-what/virt-what_1.21.bb b/recipes-extended/virt-what/virt-what_1.21.bb
> new file mode 100644
> index 0000000..aa235b3
> --- /dev/null
> +++ b/recipes-extended/virt-what/virt-what_1.21.bb
> @@ -0,0 +1,11 @@
> +SUMMARY = "Detect if we are running in a virtual machine"
> +HOMEPAGE = "https://people.redhat.com/~rjones/virt-what/"
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRC_URI = "https://people.redhat.com/~rjones/virt-what/files/${BP}.tar.gz"
> +SRC_URI[sha256sum] = "12cb455334aa4cfd53ab78f27e2252e94d1f676dd093f48327ed94d8080d1f7b"
> +
> +DEPENDS = "perl-native"
> +
> +inherit autotools
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7125): https://lists.yoctoproject.org/g/meta-virtualization/message/7125
> Mute This Topic: https://lists.yoctoproject.org/mt/90293376/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


