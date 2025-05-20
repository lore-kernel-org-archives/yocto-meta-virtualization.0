Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE2BC54754
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 02:54:58 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.12158.1747709692926027080
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 May 2025 19:54:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fHvqEeDh;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c5e39d1e0eso571257585a.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 19 May 2025 19:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747709692; x=1748314492; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j8fusE911dgQDhwjwzcckwNlw1/cCik4VmTossT97OE=;
        b=fHvqEeDh6UFvdxQOtgyTKGYEliSzel8dazLW49uMQS1I6/BxUNSNcQxmffmxoeTrae
         A1Ur1+xE2fNp59BwqMTsAvOzwAAZne7fq2Bdxm6SS23s5k2nLSojKrTI85V+0oG+k5wM
         /PqZMGK43SpzBRfrP4we8SxmsnwiKP8OHBWCn0X/ESqKbSO/kETGibnbZf0QqZd8rwPy
         Xurav8YkczJZ0K2FNP2CwGPWmUvppAvCdrV9/mxhSxgATjEB1VP4fl+awtJklQs6U9j6
         B9ZVNJMnNGdSNprWEpgZQwFgWVpt3kwbfuSp28td/5+xs7s+SzQTeW/+w05+c+SjcbDw
         GSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747709692; x=1748314492;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8fusE911dgQDhwjwzcckwNlw1/cCik4VmTossT97OE=;
        b=QBGv5Pw2/ePkuapa4ROQ/s9HQT6ojSw5MbxEbqAoBjxL8L/Q0AjFbYBJdmXmfvLjYe
         cwPilc46HMQB4BpsWFuKaFVRodFTaQmu56FkEugOKP7WsSE8hnSxOLWXeiC6tVwfxT67
         JH7yZEzGV9tEFkYAXEt0AbUCctZlIz/bfLFxCp0LzuL4MIKmcZw22vxfcYoU6kW188eQ
         ylJeyGutj3L7mwguECezXD2RH1bZAw2JQILp0VC9OFjuBJqbkPxHptj+ukzMgFXCIIZF
         cvaY+YT+PW3tVop2yz/1dWq/mhHFmSqJ3OLigGI9CJPl/1V9oGRpal1QD4A532X/luCO
         EL0A==
X-Gm-Message-State: AOJu0YxCqDulWDuZavWK13uIvzAtlpdDr9byhQfo+A23S74j3BdCJYlZ
	uEHs7Kt1rubQx6ypmB8GqjTojL5qSZD5nyixtFdppbyXM/xbaw1s6Yz9sTfV7rdh
X-Gm-Gg: ASbGncvOj4r2V4tprjvy7EFR2p/2jQiCxs9k8kEVzislegBX1PoFxKmTAJQBs2BRHzc
	tX+G/XgJO03YZezdnKEvJzIEh+qJ9cR0h+qcmOaNcjKNRMudz4BqcmTcyORF29sr/bQ4GGJ7zHf
	z8zRTCPDdld6wlv9Pqt2vvjeOFNDGKeJEYM0/8Go/sZweyDyhFJqFEhW2sS0idHEichFUJvpTrX
	guerxAu6Ai/ht1zsIM4tAp5TWcMaMP7Yy1EU3qgCKYqyP7Fl6s4T8DDh/gP+aYT5qtkxz0Dayc5
	IStc1z4Zy5FynpOUOOoa++lQBK5EKIeDMG3EDUwJtrrpR7fotNQ2Noa9LUYh4l7ZeORXbeKtb5h
	UGUAj7W+5AfMNgtoiA3BWPIFfP4u+Fg==
X-Google-Smtp-Source: AGHT+IEvFnD0qOzJ5BFjFXZzSCOOybbW7DDlF2xztpcIC5atisLk+mMTW/9xDdWm9VsZPEpS9YVPlw==
X-Received: by 2002:a05:620a:258a:b0:7c5:5791:122b with SMTP id af79cd13be357-7cd47fc582amr2221618285a.37.1747709691806;
        Mon, 19 May 2025 19:54:51 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467be470sm671216185a.13.2025.05.19.19.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 19:54:51 -0700 (PDT)
Date: Mon, 19 May 2025 22:54:49 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: guocai.he.cn@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][walnascar][master][PATCH 1/1] libvirt: add
 groups of libvirt and virtlogin
Message-ID: <aCvu+dWQl2maF6p0@gmail.com>
References: <20250509065028.560826-1-guocai.he.cn@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509065028.560826-1-guocai.he.cn@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 20 May 2025 02:54:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9253

merged.

Bruce

In message: [meta-virtualization][walnascar][master][PATCH 1/1] libvirt: add groups of libvirt and virtlogin
on 09/05/2025 guocai he via lists.yoctoproject.org wrote:

> From: Guocai He <guocai.he.cn@windriver.com>
> 
> The systemd_sysusers_check logs:
> WARNING: wrlinux-image-std-1.0-r5 do_rootfs: Group libvirt has never been defined
> WARNING: wrlinux-image-std-1.0-r5 do_rootfs: Group virtlogin has never been defined
> 
> This is because when libvirt is updated to v11.1.0, it involves:
> 2dd4f594ea tools: add sysusers file to create 'virtlogin' group
> 18f0160994 remote: add sysusers file to create 'libvirt' group
> 
> To eliminate this warning, it is necessary to add these two groups.
> 
> Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
> index 4c6b3bdd..7d694ac1 100644
> --- a/recipes-extended/libvirt/libvirt_git.bb
> +++ b/recipes-extended/libvirt/libvirt_git.bb
> @@ -47,7 +47,7 @@ S = "${WORKDIR}/git"
>  
>  inherit meson gettext update-rc.d pkgconfig systemd useradd perlnative
>  USERADD_PACKAGES = "${PN}"
> -GROUPADD_PARAM:${PN} = "-r qemu; -r kvm"
> +GROUPADD_PARAM:${PN} = "-r qemu; -r kvm; -r libvirt; -r virtlogin"
>  USERADD_PARAM:${PN} = "-r -g qemu -G kvm qemu"
>  
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9246): https://lists.yoctoproject.org/g/meta-virtualization/message/9246
> Mute This Topic: https://lists.yoctoproject.org/mt/112894514/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


