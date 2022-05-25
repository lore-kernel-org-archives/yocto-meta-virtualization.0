Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26685C433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 15:45:27 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web08.8525.1653493520293523527
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 May 2022 08:45:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gBv8ir2K;
 spf=pass (domain: gmail.com, ip: 209.85.222.172,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id r84so6278642qke.10
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 May 2022 08:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=299+nxU8VFEKldNSldN3ZlzRrRbAHvwDjsqtwCMgiro=;
        b=gBv8ir2KY32oaBbFlc2CW9c36/6JrCRKI2hNN54Hr2/NJ+dxD/1CaxUxTg1/jbfKOh
         XA2tf/zBawySv3rPxdNFH51xrdVv+EVqQ6MYmtSypcd6mdxPHMkpoVjHCQN1ndK/k13+
         MB0TlGEphKzsKFOFnmMXrkStFkCwbSlY4cFeTkozafWGXHr8aor0xXI/wIvo1Ex6sK2B
         ICH1wWKJdsLitRDXIuKZXbxzxR6RgMzzpPGOPm7m6gI+gUnwTggiGxWnsSnVQAEB657S
         mvN9alXItJqQ6GaepV2RYznLw6i+KBARPBAhOWdMQIlGSgi0N3Qp5DYnyNE0joPrKqu6
         bC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=299+nxU8VFEKldNSldN3ZlzRrRbAHvwDjsqtwCMgiro=;
        b=Pss/fysuDxNCkI7GVIRU1Hr7xBykHbNAnqJioepJiUETOgxe1nJo4H4J3xwdCrLWm4
         OAv1xDXMkQa3EUzL9ozggQUQkPYbBrfADvwMozC/ipikfdB01p0KxgR6n36M+VyjIDwZ
         MqQ0+8E83zrwSAFRj3S1pr2NNNWqh16ep+a/RzEJ1QugpgiYQtqC7JMQNqpVnsUPSJ2A
         sCSKDhhM3UcnI/vmIU5v9k/uec63yeMdOVI9RLjFUBqJGyxTSJgPPx3Om7O4dcybzkrw
         3PZB15+6zOL7u+itkRE/gNpzVKxHXDnYwW5PIrmM5ILE7+Wtw63IgxtCVgDLrqe1G3Nr
         J7jw==
X-Gm-Message-State: AOAM530cYlj0RR92t4euGEK9xNLiI21oQFlCntV7SZzsuXtOrNl2chum
	Cc1HzFCcyI8oc24y+vAIax8=
X-Google-Smtp-Source: 
 ABdhPJzWT1pUUAGis918XZCapVD7AVZTmKN7aKeUbjlPWth6+UK3ynJb5CSEKj2izrm3PqW6gmNV/g==
X-Received: by 2002:a05:620a:424e:b0:67e:4c1b:c214 with SMTP id
 w14-20020a05620a424e00b0067e4c1bc214mr21509881qko.651.1653493519247;
        Wed, 25 May 2022 08:45:19 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 z4-20020ae9e604000000b0069fc13ce1f7sm1451487qkf.40.2022.05.25.08.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 08:45:18 -0700 (PDT)
Date: Wed, 25 May 2022 11:45:17 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Ross Burton <ross.burton@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-virtualization] [RFC PATCH] xen: make LZO dependency
 optional
Message-ID: <20220525154515.GA42310@gmail.com>
References: <20220525112512.2512972-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220525112512.2512972-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 25 May 2022 15:45:27 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7320

merged.

If someone really needed this enabled by default, they can
follow up and explain (or carry a bbappend with the packageconfig).

Bruce


In message: [meta-virtualization] [RFC PATCH] xen: make LZO dependency optional
on 25/05/2022 Ross Burton wrote:

> xen-tools has an optional dependency on LZO.  As this is a unmaintained
> compression format with better alternatives (such as Zstd), disable it
> by default.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> 
> I'm trying to purge LZO from as much as possible, as it is unmaintained
> and Zstd is a better all-rounder.  I hope to move lzo from oe-core to
> meta-oe, so if you wish to keep LZO support enabled by default it will
> continue to work.
> 
>  recipes-extended/xen/xen.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index d352ffb..ed6e6a7 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -11,6 +11,7 @@ PACKAGECONFIG ??= " \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
>      "
>  
> +PACKAGECONFIG[lzo] = ",,lzo"
>  PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl,"
>  PACKAGECONFIG[xsm] = "--enable-xsmpolicy,--disable-xsmpolicy,checkpolicy-native,"
>  PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd,"
> @@ -41,7 +42,6 @@ DEPENDS = " \
>      procps \
>      python3 \
>      libaio \
> -    lzo \
>      util-linux \
>      xz \
>      yajl \
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7318): https://lists.yoctoproject.org/g/meta-virtualization/message/7318
> Mute This Topic: https://lists.yoctoproject.org/mt/91330824/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


