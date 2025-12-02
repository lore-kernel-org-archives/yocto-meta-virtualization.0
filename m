Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DBEDCFD2F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 03:46:35 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.188.1764647187768124511
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 19:46:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Js1xBzJS;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8824a756771so54750746d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 01 Dec 2025 19:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764647187; x=1765251987; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DZtObxKGPdItm8WB4nnIHDPVs0vWPAu1ZBVn/QkL9a8=;
        b=Js1xBzJSq/McrkDWWSKk+DgD0HGPb0quZRe30DGWT/eRLif1emJuNGeHm01XoqyV2O
         s2nRDfKxkyXOyeEVQWKKGOcLo4bwZaOekvIIwGsP3yB/masLlcVLHK7auIPc1j7zsrdg
         T+moaZgDB0YAGG1A8AP2+ePcmeP4VXOQAeqF3qcOPyqVE3MsbFVBUx8sLAMFYLz2hSbN
         jkl6lOQuRO4PJlqHapUODTu6MhGXLP6R5npPC2RB3WrvLZOWxmFhYoa4UqLKiD7L2tG3
         HPsf1mJwCCPy7l+/uYuuW0e5wSvxrAJvHeshnpGh6mZzI5hwYfdYMLMLTKXJZAtyleNS
         wWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764647187; x=1765251987;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DZtObxKGPdItm8WB4nnIHDPVs0vWPAu1ZBVn/QkL9a8=;
        b=DXZhajBMosjBo9wxZQBjauJE2QSfguDtW22e5/ht9jSFXKJsZ0fYwtukRAU3xoPZEK
         YaFXdrMGsnP/bwAAft1rxwvUyava8yG7XDUxsQ1H0puqvrxW+IdHL2gm8A7Xs1LGDXgb
         c31nPCGbO8nUL6hXmbDbbftsHxcrjE4NuBaVxOuEg7guDTRLg1s1e+7QpIs4MPbXZY/c
         Rn7zdwYgDn1DYrZVmGFrAgkKcf/OtkJ2EzTgr79yyj+kvVZ4yQIjAd3Jy9t9EKueyntS
         8cr7nmwXjOI6p2mgYckEVVU41WwKeMT1z8l5HR+JP3GOeFXovD780qjbreKeX4oq88BU
         4g/Q==
X-Gm-Message-State: AOJu0Yyj0aMH3NjtHwCaUmwLXhdNdnRHk66iHHeetqv88UzG5wqq0LVq
	ZZXNN1Z+FT45wPzEJlrOdhMYdXwfNK4vvcC/zOgQp1cDNbPDU2dGlYUs
X-Gm-Gg: ASbGnctd+aDU294bLeLPlRTTLZ5f3gi3TCAglD8Z79kyxSQTAJ68Lh0niHJdeWlFdwN
	JVMTsrdGXB5r+E2e88f4zQEULqa7PeiBynLzo+DDUhM3BkXeqdJsLHsSDuORVm5eib0HWtLPlr3
	CpezvDfUQ3EK21tiDUfFA6xOeu5nbqIg6h2gPuXJQtHYKWqeeMejUhVe9zBL0fCxvoNA43cnQlw
	hq2FbqchOxohdKPpRq3PgMDTRtuJWsh1Lg746NPzbFRowewhyLdtGpaiUwFLIjHqBs9JMaaGytk
	fY0hU7o2NhFBedWluDSA7bCitKT9WnBGm3jGx/FBKAo9YV6CBgl7lX5wXMjs2qiKhKNQ2PTxsm8
	zMxG8uw0G/cSKsw0tGb3/ZgCAqjlhVE8xq4TG6+79QC7lL6rpTKHyfcXx7g0KL87k9nwT2piKPX
	ukjA3LfGR9/6U4CQAcbPUUKNM8U1ZOl25ewm6VfLTB2v3nBuBXVpdcg3FstQ6UxQvT
X-Google-Smtp-Source: AGHT+IEt0PG+M7QOPqI6vHPsRNIoeIJs44gdTuBYmULTi7TlgYvw/UcxJyxye9UvdHChymqCRQi6LA==
X-Received: by 2002:a05:6214:5003:b0:87c:270b:aadb with SMTP id 6a1803df08f44-8880db711e0mr22221256d6.16.1764647186648;
        Mon, 01 Dec 2025 19:46:26 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88652b4a254sm96200976d6.35.2025.12.01.19.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 19:46:26 -0800 (PST)
Date: Mon, 1 Dec 2025 22:46:24 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: vudupa@qti.qualcomm.com
Cc: meta-virtualization@lists.yoctoproject.org,
	anuj.mittal@oss.qualcomm.com
Subject: Re: [meta-virtualization] [PATCH] lxc: backport patch to enable
 systemd StateDirectory for lxc
Message-ID: <aS5hEMxiPcWdQHxK@gmail.com>
References: <20251120132310.3500656-1-vudupa@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251120132310.3500656-1-vudupa@qti.qualcomm.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 02 Dec 2025 03:46:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9467

It looks like the stable-6.0 branch has picked up this change, so
I've done another lxc bump and have moved master-next to master.

I held master-next for longer than I'd like as I was working on
some issues in the stack. I finally have some of that sorted out,
so I'm now starting to introduce a bit of changes into the layer
as I finish that up.

Bruce

In message: [meta-virtualization] [PATCH] lxc: backport patch to enable systemd StateDirectory for lxc
on 20/11/2025 Vishwas Udupa via lists.yoctoproject.org wrote:

> Backport upstream patch to make sure lxc systemd service
> defines a StateDirectory to ensure that the /var/lib/lxc
> directory is automatically created and managed by systemd
> during service startup.
> Do not create lxc directory at build time for systemd.
> 
> Signed-off-by: Vishwas Udupa <vudupa@qti.qualcomm.com>
> ---
>  ...nable-systemd-StateDirectory-for-lxc.patch | 55 +++++++++++++++++++
>  recipes-containers/lxc/lxc_git.bb             |  3 +-
>  2 files changed, 57 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-containers/lxc/files/0001-enable-systemd-StateDirectory-for-lxc.patch
> 
> diff --git a/recipes-containers/lxc/files/0001-enable-systemd-StateDirectory-for-lxc.patch b/recipes-containers/lxc/files/0001-enable-systemd-StateDirectory-for-lxc.patch
> new file mode 100644
> index 00000000..2d60798a
> --- /dev/null
> +++ b/recipes-containers/lxc/files/0001-enable-systemd-StateDirectory-for-lxc.patch
> @@ -0,0 +1,55 @@
> +From c7bd5a3576f7449040e2164b6740c94cc2f5940c Mon Sep 17 00:00:00 2001
> +From: Vishwas Udupa <vudupa@qti.qualcomm.com>
> +Date: Wed, 17 Sep 2025 03:56:09 -0700
> +Subject: [PATCH] Enable systemd to create /var/lib/lxc at runtime
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Backport [https://github.com/lxc/lxc/commit/c7bd5a3]
> +Signed-off-by: Vishwas Udupa <vudupa@qti.qualcomm.com>
> +Co-developed-by: Raghuvarya S <raghuvar@qti.qualcomm.com>
> +
> +This change adds the StateDirectory= directive in the systemd
> +unit file to ensure that the /var/lib/lxc directory is
> +automatically created and managed by systemd during service startup.
> +
> +The StateDirectory= option instructs systemd to create a persistent
> +state directory under /var/lib/. This is particularly useful in
> +scenarios where the directory may be missing at first boot — such as
> +on OSTree-based Linux distributions, which typically ship with
> +empty /var directory as part of their immutable root filesystem.
> +
> +By adding StateDirectory=lxc, systemd will handle the creation of
> +/var/lib/lxc on first boot, ensuring that the service can start
> +reliably even when the directory is not present initially.
> +
> +---
> + config/init/systemd/lxc.service.in  | 1 +
> + config/init/systemd/lxc@.service.in | 1 +
> + 2 files changed, 2 insertions(+)
> +
> +diff --git a/config/init/systemd/lxc.service.in b/config/init/systemd/lxc.service.in
> +index 397a6c4d04..7142656178 100644
> +--- a/config/init/systemd/lxc.service.in
> ++++ b/config/init/systemd/lxc.service.in
> +@@ -13,6 +13,7 @@ ExecStop=@LIBEXECDIR@/lxc/lxc-containers stop
> + ExecReload=@LIBEXECDIR@/lxc/lxc-apparmor-load
> + # Environment=BOOTUP=serial
> + # Environment=CONSOLETYPE=serial
> ++StateDirectory=lxc
> + Delegate=yes
> + 
> + [Install]
> +diff --git a/config/init/systemd/lxc@.service.in b/config/init/systemd/lxc@.service.in
> +index 21ce64aefe..44e5b14dd2 100644
> +--- a/config/init/systemd/lxc@.service.in
> ++++ b/config/init/systemd/lxc@.service.in
> +@@ -13,6 +13,7 @@ ExecStart=@BINDIR@/lxc-start -F -n %i
> + ExecStop=@BINDIR@/lxc-stop -n %i
> + # Environment=BOOTUP=serial
> + # Environment=CONSOLETYPE=serial
> ++StateDirectory=lxc
> + Delegate=yes
> + 
> + [Install]
> diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
> index 2f0e8e74..97896280 100644
> --- a/recipes-containers/lxc/lxc_git.bb
> +++ b/recipes-containers/lxc/lxc_git.bb
> @@ -45,6 +45,7 @@ SRC_URI = "git://github.com/lxc/lxc.git;branch=stable-6.0;protocol=https \
>  	file://0001-download-don-t-try-compatbility-index.patch \
>  	file://tests-our-init-is-not-busybox.patch \
>  	file://0001-template-if-busybox-contains-init-use-it-in-containe.patch \
> +	file://0001-enable-systemd-StateDirectory-for-lxc.patch \
>  	file://dnsmasq.conf \
>  	file://lxc-net \
>  	"
> @@ -140,7 +141,7 @@ do_install:append() {
>  
>  	if "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}"; then
>  	    # nothing special for systemd at the moment
> -	    true
> +	    (cd ${D}${localstatedir}; [ -d lib/lxc ] && rmdir -v --parents lib/lxc)
>  	else
>  	    # with meson, these aren't built unless sysvinit is the enabled
>  	    # init system.
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9453): https://lists.yoctoproject.org/g/meta-virtualization/message/9453
> Mute This Topic: https://lists.yoctoproject.org/mt/116390300/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


