Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AADFCEBF73
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 20:16:44 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.65345.1727727400103434512
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 30 Sep 2024 13:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LhafskKX;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7a99e4417c3so412864085a.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 30 Sep 2024 13:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727727399; x=1728332199; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5d20dAMi4AeUeNWlsQINTs4jpXD6VJ+gZ7W6t+/QMaw=;
        b=LhafskKXoIOa9P+J03iu8kH0ttG5+ZonZcDzJhmeOY0mLUtyHzcNVn9t9dhPuUgyAv
         +DOk7MiDRCmAepTJmp7QPqlRUJFnwrNU2RnEIkheTS6H58q0sslmsJHNOqsvGbhdaod5
         OPTkpvUfxi0OdbX3TQhpuQv9iujGzmHUE+i3NB/y5u6rQjVWWlVv2Pl7bBfYmsoPaOZ4
         VRB7N3dskYB71eSUZTvBdNTGqp0l8SNQnDLvT6ppnxQG5Fyx0cCmKOvJL1784eZtcRIP
         ZZU8esA7OSM8aTGTFamWQuLH5wKaH79LNb/wt46gLMFHaDy7UfyD704uTKjgIA2EXKgh
         r+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727727399; x=1728332199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5d20dAMi4AeUeNWlsQINTs4jpXD6VJ+gZ7W6t+/QMaw=;
        b=pyl+KfbgcV9PfoRC9FIF9RWcyQglUL+kz7YT9B6I5tiZXRl4fOs7uP++BhhLTIvjtn
         MtWK/V50MI6+S6xT5WQ3pwy9vkiefd027g6ms1fC0t2jbi8+180pY8HUqzwpzA0sLEOC
         hZ/CodBwRgNdhCDhSLQqSd3iVrekBOlgJ+hk398Y06hRdMtDxp04KUq0ImsSEDSYWFcu
         zKAm3+rYxtLY8y+oGGz3ymdOJoY/FXsd1vzKxGePsMThbStHuTbTrRTErGUlhmLH+gnm
         kz1WEh6CJWnqM58GbCAAAOhqrl/xWxnG0rPFDnreGhLdBWfv+NVj8FHzUuammAKssmP1
         LDgw==
X-Gm-Message-State: AOJu0YzRGevA++gqaQMyp9UTp8hJwR2ZqsbC22yF7xGpySMhYqG+v+NT
	9Wt8CsdzH/Hf/cxOB+1fjrNoBugjXgHtV1DDJmqzz7ERwZ5YM1Pk
X-Google-Smtp-Source: AGHT+IEZccStmZ0sCAo0KN9bVSmXEn01isY97HDBV0mFsNNEAa3zvuT2bZFJbqO2DCztOEY+3Mmf3Q==
X-Received: by 2002:a05:620a:179e:b0:7a4:f284:b955 with SMTP id af79cd13be357-7ae378e3776mr1919432485a.66.1727727399068;
        Mon, 30 Sep 2024 13:16:39 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae377d8699sm441554685a.40.2024.09.30.13.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 13:16:38 -0700 (PDT)
Date: Mon, 30 Sep 2024 20:16:37 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: tim.orling@konsulko.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] libvirt: ensure sysusers.d path for
 libvirt-qemu
Message-ID: <ZvsHJZqFe38Cpq6T@gmail.com>
References: <20240929035828.26171-2-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240929035828.26171-2-tim.orling@konsulko.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 30 Sep 2024 20:16:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8904

merged.

Bruce

In message: [meta-virtualization][PATCH] libvirt: ensure sysusers.d path for libvirt-qemu
on 28/09/2024 Tim Orling via lists.yoctoproject.org wrote:

> From: Tim Orling <tim.orling@konsulko.com>
> 
> In 8138d9cc7e0c31171230110db0cfa881c46a821b the path to
> /lib/sysusers.d might not exist, use install -d to ensure
> it does.
> 
> Fixes:
> install: cannot create regular file
> '.../libvirt/v10.5.0+git/image/lib/sysusers.d/libvirt-qemu.conf':
> No such file or directory
> 
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  recipes-extended/libvirt/libvirt_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
> index 1175e737..bef98b69 100644
> --- a/recipes-extended/libvirt/libvirt_git.bb
> +++ b/recipes-extended/libvirt/libvirt_git.bb
> @@ -208,7 +208,7 @@ do_install:append() {
>  
>  	install -m 0755 ${UNPACKDIR}/libvirtd.sh ${D}/etc/init.d/libvirtd
>  	install -m 0644 ${UNPACKDIR}/libvirtd.conf ${D}/etc/libvirt/libvirtd.conf
> -	install -m 0644 ${UNPACKDIR}/libvirt-qemu.conf ${D}${nonarch_base_libdir}/sysusers.d/libvirt-qemu.conf
> +	install -d -m 0644 ${UNPACKDIR}/libvirt-qemu.conf ${D}${nonarch_base_libdir}/sysusers.d/libvirt-qemu.conf
>  
>  	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
>  	    # This will wind up in the libvirtd package, but will NOT be invoked by default.
> -- 
> 2.46.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8902): https://lists.yoctoproject.org/g/meta-virtualization/message/8902
> Mute This Topic: https://lists.yoctoproject.org/mt/108714337/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


