Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05036E6B252
	for <webhook@archiver.kernel.org>; Sat,  2 Nov 2024 04:04:27 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.11140.1730520258055124809
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 01 Nov 2024 21:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CEHJZiBs;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7b150dc7bc0so188480985a.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 01 Nov 2024 21:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730520257; x=1731125057; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EA41jlj39/56Kl6GbaKCjENsfgO0ooco8DdNVt2WJdw=;
        b=CEHJZiBswy8LDAh1KJ/0xd0YsJucKOLfh1+q1aXsdeY5vnWTVsfhfCWpeIT1k8xQr/
         Bg1CfNmoVao3k6/4QxhzgW0tRwR5OPt8aYC2NrF1H0lwl1gfrOgrRq/ZWcmIxpgJUfFb
         oowmNf0V+5bTt5Kh+VxdaksGy9KuAqUySeQwT88/2e3mfdLg+dT2kg5UqoiJvd2Jv7Aw
         cO/OTx9QTsQo98Mkqzq9Z0F6QffHmULcxOJ4hlVO7lwDYU6xzrk2qhLLI65spy0NAxYQ
         jzG6uADVadwHiOJGE5/swV3a98GZ/2uhwNdBM1DuBcLQvtRzO6Q2ar+DJk9ztnbMwc8H
         TN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730520257; x=1731125057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EA41jlj39/56Kl6GbaKCjENsfgO0ooco8DdNVt2WJdw=;
        b=PfHYiQ6XhZkVHkNPS9Rg8S4UOz4yzkNvSeV8LODz6a+BKHqRhAFRo7DXQxYIB9QURB
         /zJbwUKWEbJZj36lnGbY/fex5Uhl/KlAxeNQPGtwqgFuYB+cbGFof8HSKV1LMzVfbZfP
         amnpIXI1ToET8Nyp2U04QUpQIgGF6GUJmh8nFfmCb9OsiybWQdmu/c/hVJXa6i0cCgcw
         Z+/u9MNhjol36lnK737recXPMOAD8ovmDlynFZVFImT8AIRJhuWdioDX7dICOIB1yJ7Q
         SKtSKoywIybw73MMzPlqw6fN4VNXxAxg8m2Yv+u7YU01JlHEphhSx6zJU9l32eE+CPpi
         7WVg==
X-Gm-Message-State: AOJu0YxqIJ/kzj7nEfPmSejrcbu8ztzIo4uhXLQNnLySLzzlLehG5C5v
	MnHebed3W1U/KxNRA2idwH5EaPIp6NoYyarnNMRrDfrEOKk3Ml02
X-Google-Smtp-Source: AGHT+IH6Rp2dQbP7MvRT3SLgZwLxnwGXebOf4afXHOEj5SmysLyGqxlL4p6VyRgeXjOhXIwXSkyGwA==
X-Received: by 2002:a05:6214:2f85:b0:6cb:d4ed:aa59 with SMTP id 6a1803df08f44-6d35c08849fmr66894396d6.4.1730520256759;
        Fri, 01 Nov 2024 21:04:16 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d353ff4f49sm26139736d6.70.2024.11.01.21.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 21:04:15 -0700 (PDT)
Date: Sat, 2 Nov 2024 00:04:13 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: xiangyu.chen@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] lxc: don't allow named listening
 IPv6 address on lxcbrX network interface
Message-ID: <ZyWkvd6Kkxb0DLIn@gmail.com>
References: <20241028073846.1087759-1-xiangyu.chen@eng.windriver.com>
 <20241028073846.1087759-2-xiangyu.chen@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028073846.1087759-2-xiangyu.chen@eng.windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 02 Nov 2024 04:04:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8950

merged to master (which will become styhead shortly)

Bruce

In message: [meta-virtualization][PATCH] lxc: don't allow named listening IPv6 address on lxcbrX network interface
on 28/10/2024 Xiangyu Chen via lists.yoctoproject.org wrote:

> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> 
> lxc-net enabled the IPv6 by default since v6.0.0[1], when named enabled on
> system, the lxc-net which based on dnsmasq would fail to bind the IPv6
> address on lxcbrX interface, that cause lxc cannot work correctly.
> 
> Add the lxc-net default v6 address to named.conf.option to tell named don't
> bind and listen that address.
> 
> [1] https://github.com/lxc/lxc/commit/e8888344
> 
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  recipes-core/bind/bind_virtualization.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-core/bind/bind_virtualization.inc b/recipes-core/bind/bind_virtualization.inc
> index a6e39049..f942d7ad 100644
> --- a/recipes-core/bind/bind_virtualization.inc
> +++ b/recipes-core/bind/bind_virtualization.inc
> @@ -1,4 +1,4 @@
>  # Tell named not to bother listening on the IP address that lxc and libvirtd handles itself.
>  do_install:append() {
> -	sed -i -e 's,^\( *options *{\)$,\1\n\t// lxc and libvirtd would take care of this address itself\n\tlisten-on { ! 10.0.3.1; ! 192.168.122.1; any;};\n,' ${D}${sysconfdir}/bind/named.conf.options
> +	sed -i -e 's,^\( *options *{\)$,\1\n\t// lxc and libvirtd would take care of this address itself\n\tlisten-on { ! 10.0.3.1; ! 192.168.122.1; any;};\n\tlisten-on-v6 { ! fc11:4514:1919:810::1; any;};\n,' ${D}${sysconfdir}/bind/named.conf.options
>  }
> -- 
> 2.35.5
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8938): https://lists.yoctoproject.org/g/meta-virtualization/message/8938
> Mute This Topic: https://lists.yoctoproject.org/mt/109253028/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


