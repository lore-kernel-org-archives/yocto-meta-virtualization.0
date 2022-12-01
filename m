Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF313C4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 21:50:16 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.58660.1669931412244559813
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Dec 2022 13:50:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JBfFyqFm;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id r19so2739914qtx.6
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Dec 2022 13:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=00b2AJPgiCoriYspdv5uXsGkOqlpgPadtnwi0nNz3RM=;
        b=JBfFyqFmDyXfnfC+sf2DA1llCbRn5ETfbnxQvOfKAF8S6JelmopxCgmgApHZcS30HS
         47kJ83MraVOKbtSxPPoMP4GWBswHpzYNFPfIg7MA2CQl00i2Lk0AJiy+OBWYT3YbyA4b
         5hCdB+AqM5QlIHswKb9wLV9jBGvAnp6cVaW5o6VoK/5BcsvxL5lGbb1K+YnwBs92wOpr
         Mck9aLudL7QjZ8Ey2gMfB05/Y13rxIpbZxFCHXPaYQkKl1UFMKfORrig0hACD0LUDe1U
         SnhW8DKgJgPhLYHnrz8e0HK2un5yvR/1H51H8jDVKEuq0JSruQadTr+63NndStgqGsHO
         Be3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00b2AJPgiCoriYspdv5uXsGkOqlpgPadtnwi0nNz3RM=;
        b=G7wE6c7bsZf5jhM5nZ3U3xP0IkXdM/WkvK2+Q9/gOlF2Yvc75YqKym6E6vJjXPFVTH
         frgMLm22+iijq9GtM/V530mQioDltkV5Q4qoolkuEXjsq+EYS2PMZu9kMhCI482fNsgF
         ZMjcKLhxJ/1w+G2BNkE0kZvnhSdGa8r2mvh7mNF0GzkjuSLSDl3FXlnNtQuEsT2Kfynq
         24G8olUKZdC0E5u9oxUP2nA4CiLdiz+VWtj8zUxAsg58DeqpG2M5E/PhOV+0akxuYHyT
         S1scgC2UxNzjAFtSqzOANijWA9xsBvHFZcA3sjMJQ2V9XDMZXqxWapwwQLRw7mVAPFJ9
         6uBA==
X-Gm-Message-State: ANoB5pmJLiETyqiE+rtxWRN8xnTBIz+eKbSgQqVHpdE+5/ywi3XFuEdl
	NaUHK6dvx3KvkG5wCF+KvSsTedNaTBIlrw==
X-Google-Smtp-Source: AA0mqf53BifYRd2zYe9mR5lgaCHrHHgcwO6uOMfiZ6gQoezGZOY5zcNBmcAq4bzfYd7NJ9Pwo8bP6A==
X-Received: by 2002:a05:620a:b10:b0:6fa:2363:92f2 with SMTP id t16-20020a05620a0b1000b006fa236392f2mr61625401qkg.25.1669931411175;
        Thu, 01 Dec 2022 13:50:11 -0800 (PST)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id u20-20020a37ab14000000b006bb29d932e1sm730409qke.105.2022.12.01.13.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 13:50:11 -0800 (PST)
Date: Thu, 1 Dec 2022 16:50:09 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][m-c-s][PATCH 1/2] libvirt: Update
 bbappends version from 6 to 8
Message-ID: <20221201215009.GB30616@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130204843.3524686-2-chaitanya.vadrevu@ni.com>
 <20221130204843.3524686-1-chaitanya.vadrevu@ni.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Dec 2022 21:50:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7724

Merged.

Thanks for the cleanup, most appreciated!

Bruce

In message: [meta-virtualization][m-c-s][PATCH 1/2] libvirt: Update bbappends version from 6 to 8
on 30/11/2022 Chaitanya Vadrevu wrote:

> meta-virtualization has upgraded libvirt to 8.1
> 
> Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
> ---
>  .../libvirt/{libvirt_6.%.bbappend => libvirt_8.%.bbappend}        | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-openstack/recipes-extended/libvirt/{libvirt_6.%.bbappend => libvirt_8.%.bbappend} (100%)
> 
> diff --git a/meta-openstack/recipes-extended/libvirt/libvirt_6.%.bbappend b/meta-openstack/recipes-extended/libvirt/libvirt_8.%.bbappend
> similarity index 100%
> rename from meta-openstack/recipes-extended/libvirt/libvirt_6.%.bbappend
> rename to meta-openstack/recipes-extended/libvirt/libvirt_8.%.bbappend
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7715): https://lists.yoctoproject.org/g/meta-virtualization/message/7715
> Mute This Topic: https://lists.yoctoproject.org/mt/95367896/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


In message: [meta-virtualization][m-c-s][PATCH 2/2] qemu: Update bbappends version from 5 to 7
on 30/11/2022 Chaitanya Vadrevu wrote:

> openembedded-core has upgraded qemu to 7.1
> 
> Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
> ---
>  .../qemu/{qemu_5.%.bbappend => qemu_7.%.bbappend}                 | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-openstack/recipes-devtools/qemu/{qemu_5.%.bbappend => qemu_7.%.bbappend} (100%)
> 
> diff --git a/meta-openstack/recipes-devtools/qemu/qemu_5.%.bbappend b/meta-openstack/recipes-devtools/qemu/qemu_7.%.bbappend
> similarity index 100%
> rename from meta-openstack/recipes-devtools/qemu/qemu_5.%.bbappend
> rename to meta-openstack/recipes-devtools/qemu/qemu_7.%.bbappend
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7716): https://lists.yoctoproject.org/g/meta-virtualization/message/7716
> Mute This Topic: https://lists.yoctoproject.org/mt/95367900/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



