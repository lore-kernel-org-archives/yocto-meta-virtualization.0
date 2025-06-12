Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4923C71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 14:41:15 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.15066.1749739274609059879
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Jun 2025 07:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oo7vmR4F;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a56cc0def0so17296661cf.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Jun 2025 07:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749739274; x=1750344074; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uDTFAp5IcvBscOPjUMF7S5tXMkZnvQRY3qdloHPNI0Y=;
        b=Oo7vmR4Fx+J+iQOcSOs8rRBuhxYlnylnA/PHJkd89hn4iky3Mev8/INDq0XdywDpkE
         JjCBqzTd3lbo4Ssuz9n7QBzAugrlev0mzpXeKmbCjLoGFjzQzsuhzBagl6afBBOQJ/4n
         n+woCvZI76zPrSui1vfiuFIzb8Q0dj8Wi7t+qp54d7kIBX7YzGDzAnJ/VwEFOpb4iMkn
         qtSCIamSF9IrWRWHIVgIFs1yRv78SbDWWbanIle142umnsTD4+oizqFLeHd1FGWBj/82
         ROiuWp43nBs3ehgT7OOb33QS2KJNrAsVXyVAuwktptN9DpZU1jTIus9yXXF6LfyEhIla
         UnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749739274; x=1750344074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDTFAp5IcvBscOPjUMF7S5tXMkZnvQRY3qdloHPNI0Y=;
        b=LBZit9hkyWzrCUfketdIPVe5LxCZbL59/VdqHMqvo+R4O3+6GDqx7FjfLHUOoFkddv
         wrp7JZW38DVfMIph+9uBehU80gcBtMs02HY41zls7wbK1nqGTO1beY5pL0AX+hP4RHaF
         mFt25wUZgmEK2BZ+vYSjB8Twi0osCEp2HSTvdre59zdaE+XEdDX/eY0x5UmEexRB3ehB
         14SkwSQjhVfMDZOTLacmqSpFwxfLfugXehAMGOH3SCuu8wysFYBeFOVSS/imW6bSAg/P
         DCQIJ2x/besSipT355gUFr+Dd9kUfPlXJ3/HgHZZf6qIMwQkd88eRSvRk02i5XEgWNFs
         Qt6g==
X-Gm-Message-State: AOJu0YzEURVLUl6mVWPX2YHcOgfNsOtijJQmxGlDceXs02PrHA7rjBod
	br+IeJ0mOOPfd75EzvLfo4d9Szy3ShGQFlenfUR21EIDXs2KxdFdOQqZJsEkqysc5fo=
X-Gm-Gg: ASbGnctAYS1E4CQFF2BhuX4+7NeDh2vi5weNJ5tb8yqp9FUlnssiS1JyR6djIpJRNgl
	U86QRpd1wIAH1FZb+/05IH7RlP0hN2WtlN1seS4YnWbJENVDgZpSfV7ZA5FwWKAHFQKebZ8ZDgm
	M63XxvbLXb+EOplVV9wPo4J/D8z4FU+neWPUR82M4pH1OJJ4nrmL5Qf09ena4XBVCKvRZer+Ons
	XIseJ55niUkhCjMY0vLoONXcbjficXYns2QnewCaxtP4te7OrC4DR7DR0dxccWWgerhbkHmsuSj
	IdhQn1k66FdTv9g31nZawPd17O4IyhqvtznkESjgfYlb41KpYmeT9bZz+G4N17mKkAHUiJECxk0
	YEWiAZW1soIE5n08RDHCHm0CQwe4xNv23h8JdVm1d
X-Google-Smtp-Source: AGHT+IGIQ7b0ItdFiJf4h1yjbOjnvRxdZTFJHzpkcyqmnQmMxkzrzitYc9XeoiX5TFZkvlGlDxav0Q==
X-Received: by 2002:a05:622a:4892:b0:4a4:2c4c:ccb3 with SMTP id d75a77b69052e-4a72434e9damr50458281cf.38.1749739273390;
        Thu, 12 Jun 2025 07:41:13 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a4e7ef1sm4705611cf.64.2025.06.12.07.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 07:41:12 -0700 (PDT)
Date: Thu, 12 Jun 2025 10:41:10 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: xiangyu.chen@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] lxc: don't allow named listening
 IPv6 address on lxcbrX network interface
Message-ID: <aErnBr8etCw5Tou9@gmail.com>
References: <20250606033516.3503990-1-xiangyu.chen@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606033516.3503990-1-xiangyu.chen@eng.windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Jun 2025 14:41:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9281

merged.

Bruce

In message: [meta-virtualization][PATCH] lxc: don't allow named listening IPv6 address on lxcbrX network interface
on 06/06/2025 Xiangyu Chen via lists.yoctoproject.org wrote:

> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> 
> lxc-net enabled the IPv6 by default since v6.0.0[1], when named enabled on
> system, the lxc-net which based on dnsmasq would fail to bind the IPv6
> address on lxcbrX interface, that cause lxc cannot work correctly.
> 
> LXC upstream changed the default v6 address again[2], we need to line up with
> upstream. Updated the lxc-net default v6 address to named.conf.option to tell
> named don't bind and listen that address.
> 
> Ref:
> 
> [1] https://github.com/lxc/lxc/commit/e8888344
> [2] https://github.com/lxc/lxc/commit/31012d49
> 
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  recipes-core/bind/bind_virtualization.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-core/bind/bind_virtualization.inc b/recipes-core/bind/bind_virtualization.inc
> index f942d7ad..bb4e22b2 100644
> --- a/recipes-core/bind/bind_virtualization.inc
> +++ b/recipes-core/bind/bind_virtualization.inc
> @@ -1,4 +1,4 @@
>  # Tell named not to bother listening on the IP address that lxc and libvirtd handles itself.
>  do_install:append() {
> -	sed -i -e 's,^\( *options *{\)$,\1\n\t// lxc and libvirtd would take care of this address itself\n\tlisten-on { ! 10.0.3.1; ! 192.168.122.1; any;};\n\tlisten-on-v6 { ! fc11:4514:1919:810::1; any;};\n,' ${D}${sysconfdir}/bind/named.conf.options
> +	sed -i -e 's,^\( *options *{\)$,\1\n\t// lxc and libvirtd would take care of this address itself\n\tlisten-on { ! 10.0.3.1; ! 192.168.122.1; any;};\n\tlisten-on-v6 { ! fc42:5009:ba4b:5ab0::1; any;};\n,' ${D}${sysconfdir}/bind/named.conf.options
>  }
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9273): https://lists.yoctoproject.org/g/meta-virtualization/message/9273
> Mute This Topic: https://lists.yoctoproject.org/mt/113498088/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


