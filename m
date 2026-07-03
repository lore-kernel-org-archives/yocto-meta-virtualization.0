Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4253BC43602
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 13:43:52 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92757.1783086228118882689
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 06:43:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eEPVbfn/;
 spf=pass (domain: gmail.com, ip: 209.85.221.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5bdd0779366so176106e0c.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Jul 2026 06:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783086227; x=1783691027; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9rAiyRDg1nw4KwaCcgKH9nUdYskzWny5CP29RNvkMWM=;
        b=eEPVbfn/P6lix1+BVgyvqzNqxDEdTgGnPmPZPVl7/r0WJ9YZZAAcKSATPNAYIiFA5d
         E9d1zVDP8FQAeEgbhMBO5YZMw73fezTQRkV+/a8n2+5tgor03QSvytpejJff4JT0Uerd
         E/85kfujDUgwyzzr9qONJCkCctJ/Ugrq2pq/WTICIHM71i1btjOTdUTT0vSR7/z0IGcv
         /mP1ITJgWQWhZEthRxKqYfO8BMoFRm1Q+F/l34dc6p9WIc8Qh+PICyOmBcTTntqrmcXi
         ypyVst5WflIf4NANClQRYB+J/rnTySEIcUYIa4ZyFoS4drPt/ik+RdyvohdW6gwGEO+m
         Nanw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783086227; x=1783691027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9rAiyRDg1nw4KwaCcgKH9nUdYskzWny5CP29RNvkMWM=;
        b=LCVKj5s8BPkKse8xKLEZ/Saku6GIqo5Y+2F34/NjnnxTe7hb9mVQxaTn+WLNL4jWzI
         Tl8f+qo/ceHUEDp9/rBuTYmj0Z3S4/z/VmjMfhhxSHZa2pFCynC7AxtwFcfbCTaxfkwy
         pFc9YzapYnVVVjD6OWwP5p2JGnDfYx7ZHdJwu0Mm5qco0BWQOzMpZXdncLD9Bs5dgmGH
         UNrbdovgacdOE2Yg1fGeh7zfAj1mwiWGLiW8NUp+ZOGE/4xvD1a41kOvhHFdBXD051c0
         dVPi1b5JCJPySi6a8ZDYDd28sAT7kjCQjG3V83K3XHFCqoEBsubXgdgBHO0P3sX2BB3U
         KUyQ==
X-Gm-Message-State: AOJu0YyquAG4YSTRpW+DJRDVsTQxruf+6+TXU8/mUrq43S8lcPICvUrm
	HpEwFr5XR0rbXag/USDeuHu7f7NsRJSfZToOnKbVllBrso7/bb+HZo4lVD82jZdr
X-Gm-Gg: AfdE7ckBOuRFfHLxu9KtOHp1qCWhtAsBap4EheVh0jcUjKXk/pxYl7vuqcf44CtQzYm
	Owh1yOd0TChC86t648C64s8510SiZrnkmsE4ilor0gA859G9SjZ33uq27rKYabDWefUCRbeQPaC
	PnJxhf3GOCWIDRUblFVEOjncBCB3lV5LeKRSA7MvAjTchmQqlU484Va277SFNudET0uHhLplxak
	+yWfl80rqA8GIfBXId40rOnSLm/fXKkCAQq18JHyBnnx0HEM4OAasTRILzwK+XmPGGkf9l7N5SL
	pNpFwetwHKTbi1jTyKI29wmZ1Hvcx1t+8EZVlBUXKiVxcrYcTQrBcHkW111Tr0jmMwf/j/NPO6x
	60FWlnRVMoB58+SuDip8JwboFVMvMvBxWDvw56Ik/Hnh9YOX/4ja2h8TDtHHMQzfGJsfje5arYV
	DLhtBeGJHxzyq4f/w7iWT7a/SPaJSF2EGuLqumL/J5OmTgulV0VgxHuFPzYx11BTloWen+dkQHq
	+O1cJXVO+fpR+QVXtsrQV6FYkNmsVZ58fuSAQD6JkN6mlpzd0OuPRnYxhuaYiStKj39GSLu0uns
	RsZn4MLjvLU=
X-Received: by 2002:a05:6122:218a:b0:5a1:19d4:a363 with SMTP id 71dfb90a1353d-5bddf4f3c69mr3924255e0c.3.1783086226819;
        Fri, 03 Jul 2026 06:43:46 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5be027004c3sm783699e0c.0.2026.07.03.06.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 06:43:45 -0700 (PDT)
Date: Fri, 3 Jul 2026 09:43:44 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Sandeep.J@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org, Shiva.Komati@windriver.com,
	Randy.MacLeod@windriver.com
Subject: Re: [meta-virtualization][m-c-s][PATCH] Documentation/README: fix
 broken URLs in meta-openstack and puppet
Message-ID: <ake8kPrscLM2pHCy@gmail.com>
References: <20260626050139.3401173-1-Sandeep.J@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626050139.3401173-1-Sandeep.J@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Jul 2026 13:43:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9912

merged.

But given that the meta-openstack* layers no longer build
anything functinal, it would be a good idea if you are using
recipes from those layers to let me know, and we can move it
either to the main meta-cloud-services layer or to meta-virtualization.

Bruce

In message: [meta-virtualization][m-c-s][PATCH] Documentation/README: fix broken URLs in meta-openstack and puppet
on 26/06/2026 Sandeep J via lists.yoctoproject.org wrote:

> Replace dead/moved URLs in README.trove, README.swift,
> README.networking_flat, README.networking_vlan, README.ceph-openstack,
> and puppet/README with current working links.
> 
> Signed-off-by: Sandeep J <Sandeep.J@windriver.com>
> ---
>  meta-openstack/Documentation/README.ceph-openstack  | 2 +-
>  meta-openstack/Documentation/README.networking_flat | 2 +-
>  meta-openstack/Documentation/README.networking_vlan | 2 +-
>  meta-openstack/Documentation/README.swift           | 4 ++--
>  meta-openstack/Documentation/README.trove           | 2 +-
>  recipes-support/puppet/README                       | 2 +-
>  6 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/meta-openstack/Documentation/README.ceph-openstack b/meta-openstack/Documentation/README.ceph-openstack
> index 11348375..44d24f57 100644
> --- a/meta-openstack/Documentation/README.ceph-openstack
> +++ b/meta-openstack/Documentation/README.ceph-openstack
> @@ -572,4 +572,4 @@ Hello World
>  Additional References
>  =====================
>  
> -* https://ceph.com/docs/master/rbd/rbd-openstack/
> +* https://docs.ceph.com/en/latest/rbd/rbd-openstack/
> \ No newline at end of file
> diff --git a/meta-openstack/Documentation/README.networking_flat b/meta-openstack/Documentation/README.networking_flat
> index ab18f6f5..c44968c6 100644
> --- a/meta-openstack/Documentation/README.networking_flat
> +++ b/meta-openstack/Documentation/README.networking_flat
> @@ -246,4 +246,4 @@ root@compute:~# ovs-vsctl show
>  
>  References
>  ----------
> -http://developer.rackspace.com/blog/neutron-networking-simple-flat-network.html
> \ No newline at end of file
> +http://docs.openstack.org/neutron/latest/admin/intro-basic-networking.html
> \ No newline at end of file
> diff --git a/meta-openstack/Documentation/README.networking_vlan b/meta-openstack/Documentation/README.networking_vlan
> index 6d48e2b6..afb93436 100644
> --- a/meta-openstack/Documentation/README.networking_vlan
> +++ b/meta-openstack/Documentation/README.networking_vlan
> @@ -379,4 +379,4 @@ root@compute:~# ovs-vsctl show
>  
>  References
>  ----------
> -http://developer.rackspace.com/blog/neutron-networking-vlan-provider-networks.html
> \ No newline at end of file
> +http://docs.openstack.org/neutron/latest/admin/intro-basic-networking.html
> \ No newline at end of file
> diff --git a/meta-openstack/Documentation/README.swift b/meta-openstack/Documentation/README.swift
> index 0945ed30..af333c83 100644
> --- a/meta-openstack/Documentation/README.swift
> +++ b/meta-openstack/Documentation/README.swift
> @@ -428,5 +428,5 @@ References
>  ==========
>  
>  * http://docs.openstack.org/developer/swift/deployment_guide.html
> -* http://docs.openstack.org/grizzly/openstack-compute/install/yum/content/ch_installing-openstack-object-storage.html
> -* https://swiftstack.com/openstack-swift/architecture/
> +* https://docs.openstack.org/swift/rocky/install/index.html
> +* https://docs.openstack.org/swift/latest/install/index.html
> \ No newline at end of file
> diff --git a/meta-openstack/Documentation/README.trove b/meta-openstack/Documentation/README.trove
> index cdbfb583..ce7d2a99 100644
> --- a/meta-openstack/Documentation/README.trove
> +++ b/meta-openstack/Documentation/README.trove
> @@ -72,5 +72,5 @@ References
>  
>   * https://github.com/openstack/python-troveclient
>   * https://github.com/openstack/trove
> - * https://wiki.openstack.org/wiki/TrovArchitecture
> + * https://wiki.openstack.org/wiki/TroveArchitecture
>   * https://wiki.openstack.org/wiki/Trove
> diff --git a/recipes-support/puppet/README b/recipes-support/puppet/README
> index 8befb157..bff0c8b7 100644
> --- a/recipes-support/puppet/README
> +++ b/recipes-support/puppet/README
> @@ -16,7 +16,7 @@ The json gem (any modern version)
>      Over time, it became a requirement and was even included in the
>      puppet-agent package, but it was limited by its original design.
>  
> -    https://puppet.com/docs/puppet/4.10/hiera_intro.html
> +    https://help.puppet.com/core/current/Content/PuppetCore/hiera_intro.htm
>  
>  Simple Demo
>  ------------------------

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9905): https://lists.yoctoproject.org/g/meta-virtualization/message/9905
> Mute This Topic: https://lists.yoctoproject.org/mt/119985617/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


