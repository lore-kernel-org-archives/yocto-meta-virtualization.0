Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C2EDC54E58
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 03:20:07 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.7971.1710300004056787621
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Mar 2024 20:20:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jDDmoUHK;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-690cd7f83cdso4436136d6.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Mar 2024 20:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710300003; x=1710904803; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=23ptfO0G/zGYLuPj293nMKJMpXK/g8CRYa117M3sGis=;
        b=jDDmoUHKMePKB0XzwHasEEqUfRh+iqqu/DSxz7CMNfx+dzenvGMWdae9VceQ/iJbql
         s9+J8yTdg6vsCa8JvkW1b4atuTcEdTLzWt9fHvGPxpx2QFzcuNxIWS+jhseaaepLun7G
         MlI6M3SaEfqjxuYDG2ShEYf4XbN5Ey0BX27TBq56zp/aeCz9KxalOaA0CGUbuBZN+J3f
         9/DHaUQhMyqqEo8giP8YNZvXheZ+dis1LfCQSDVDL5aTIgzUWNFfvZS4ejWU/zSkecnz
         PKKRLcaEdRsH6AevLjAgajF9Ec0OXtF/bqUnWcieDe5Fh964pvRP8U7p1tEnPzLKnDq9
         Qa/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710300003; x=1710904803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23ptfO0G/zGYLuPj293nMKJMpXK/g8CRYa117M3sGis=;
        b=bmfmRPNxjH7lRShBwFqpHX3cJSRivhzC8nt4xdS0A4nZ+4zgcnZEaSWGW61EWNWJsQ
         eJaWPN38Tt3QU16mx3hCWfhUTNmz1ccaTLKqoyCHJ+YaUKOHJjU7masetTvefL0gOxXj
         MoLUEgCSMBUxrfSHqRXqZzeMDAQlN/KSwo4jCajaHnovO8I2BcsfO3cdVuBtXyQx//OL
         qzc4dYszQV6cAbSiO6i0j8J5h7lFJZPdeT+9A4GoXvWr9aWY/5BByRY5tk644vrh/2oq
         PZ8HUdgFRZjoxW9wTXqmT0Wb+HTFoicEpH5pnRO4cigx9siyt4eC9qEzinEoDnE2Stp7
         wQyw==
X-Gm-Message-State: AOJu0Yz6N8KupH9C/yNRjLoq2gdqmWo885hM3W5/v8pxV/WDLJ8m5IMx
	PCKSvavRmBvrmqgg6DiagKOW5gMOVh6YYnP2D3rskEcK4U1TXDqHiV8vOpMs
X-Google-Smtp-Source: AGHT+IEsjdOIX05ztiba6m2EB5ygCVzarmnClU1z0Vzo12tqD/WCiVg+v2oqxVpPlz1xGrcYrNwbew==
X-Received: by 2002:a0c:c249:0:b0:690:b3a3:2261 with SMTP id w9-20020a0cc249000000b00690b3a32261mr2524644qvh.53.1710300003039;
        Tue, 12 Mar 2024 20:20:03 -0700 (PDT)
Received: from gmail.com ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id j6-20020a0cc346000000b0068f6e1c3582sm4189554qvi.146.2024.03.12.20.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 20:20:02 -0700 (PDT)
Date: Wed, 13 Mar 2024 03:20:01 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] libvirtd: don't allow named.service
 listening on libvirt network interface
Message-ID: <ZfEbYI412leqPnav@gmail.com>
References: <20240312100619.1724680-1-xiangyu.chen@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312100619.1724680-1-xiangyu.chen@eng.windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Mar 2024 03:20:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8631

Staged on master-next

Bruce

In message: [meta-virtualization][PATCH] libvirtd: don't allow named.service listening on libvirt network interface
on 12/03/2024 Xiangyu Chen wrote:

> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> 
> libvirtd has its own network interface named virbr0, and it using
> dnsmasq to setup the DNS. the named.service also listen interface and try to
> bind the port 59 on virtbr0, that cause dnsmasq report following error:
> 
> dnsmasq: failed to create listening socket for 192.168.122.1: Address already in use
> 
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  recipes-core/bind/bind_virtualization.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-core/bind/bind_virtualization.inc b/recipes-core/bind/bind_virtualization.inc
> index dc63b2aa..a6e39049 100644
> --- a/recipes-core/bind/bind_virtualization.inc
> +++ b/recipes-core/bind/bind_virtualization.inc
> @@ -1,4 +1,4 @@
> -# Tell named not to bother listening on the IP address that lxc handles itself.
> +# Tell named not to bother listening on the IP address that lxc and libvirtd handles itself.
>  do_install:append() {
> -	sed -i -e 's,^\( *options *{\)$,\1\n\t// lxc would take care of this address itself\n\tlisten-on { ! 10.0.3.1; any;};\n,' ${D}${sysconfdir}/bind/named.conf.options
> +	sed -i -e 's,^\( *options *{\)$,\1\n\t// lxc and libvirtd would take care of this address itself\n\tlisten-on { ! 10.0.3.1; ! 192.168.122.1; any;};\n,' ${D}${sysconfdir}/bind/named.conf.options
>  }
> -- 
> 2.35.5
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8627): https://lists.yoctoproject.org/g/meta-virtualization/message/8627
> Mute This Topic: https://lists.yoctoproject.org/mt/104881353/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


