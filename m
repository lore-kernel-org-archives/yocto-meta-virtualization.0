Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B327AC5DF70
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 03:54:52 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28860.1771818890064806193
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Feb 2026 19:54:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OH22Uf0X;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-896ff127650so67045456d6.3
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 22 Feb 2026 19:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771818889; x=1772423689; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t/o5v65EoDWQSx1HwLvae7RX806czRJoaYmc0BC7wto=;
        b=OH22Uf0Xm6Fjz7h0doim8oOzgfhjSNJ/D/PTFHbONWkc4wNSj4t+xbP6E5u1wjOVij
         e6CD1T5ZVeabGZzFBpwdLdNMUDe+tqtwEWMd4YXQwL2ZhxFu/ebWTKhpQ1DQwrdLOqRu
         hPNMa1i+m40zgDjNBfzMOeFcXZWUQo3fARR06hHSeo3b3fjvygya9BamLYcQB2c8Oln/
         A7Rvv4izYQ2CzxEXvRPu7t5q0y5TI53yNcGXsrmxKgi+07cRExliqrS9EgWR0sLgPrhX
         Jb05LZ8mAtweUXdhv1dR8ABa6QtFe/Pb5vyvZuoio0DpJc3pwkPfOdHmyd4q53ovp3q0
         BPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771818889; x=1772423689;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t/o5v65EoDWQSx1HwLvae7RX806czRJoaYmc0BC7wto=;
        b=q0BGXquT7sFCGZCUgoj0ObcMiv1+2GbSoyJc/8+RCr47jHCjcpqkJ3fEnUPHmqq2vg
         Jo4tqRB7Mf6CoZm06135T4fmqrJrSWWq4uHoIucA69nJf6By7mcXPDkYR8juzyAJ8dWq
         whfd21yM7+nGQTLi7Jo/R5RAcyVClGN1th5eZhKQPzywCUBVDF0L5HVe/RASGzamoLQc
         8XFDR+nlOh8wWezMk4N5CPqFuSeR3n44i2c9hrAHU5Ig/l0RFzwuL891zXU/BUiTvdeI
         jkT/KIQQpeTcSfOdM5nyKPLIrRU3EqYp7lH20DBEECq8b+Y1yhpskcwsb9ucKmaAz/BF
         eC3g==
X-Gm-Message-State: AOJu0Yyh0lb8nloYZc0DFCHdv+sX8HYoJoXAsj9LpOyIrBqoyzaojAVm
	24IClhtBtuL5PVybK8HggfecLAI/A0ilRSu5gjLPV0KzyUErVkT7TJ+7RytRY6cR6B0=
X-Gm-Gg: AZuq6aIiKUNEcYGaXIaCgpxno7ptugv36+WTJGy3cklBytkH8/yxmhlm98C84u6GJga
	OdbtdvkwcbzcX38NeuK2foDNOxMNmvTDPA8seIywv0qiAcSecJsS2Jh0y0YWPTE4KPoNBBO2iuq
	bDZprEobgWbwiwTqbtQn2z9/l44K3Rbxxd4vS+0ykL21uBncyWxt1F4EVRSx7WNz+GlqHbfE4jp
	2gTP23RaG3tsM3QFEQvL6OutKtClwEzhC7Fd3WxdA2cUc4Og7PFs61Zo7NU/CAocqoHQlPwuolz
	cfmUPSUFdLG64AdcpJk5aO+6Bn5st7n3SE/MCmM8bWqd9RBQXcdbMIDkcliJrcxjjUe+a88tqGV
	uV4k6qNlyhPoxlqVT8h73x4JoMgWSQSstkM2WusGIYJ/1Qoo7Zuk4TD2maUCvk6QarsFBAqNCF2
	uk/D5iisLEj0ChPMb79e+zA/5XenXCU4CKFR9N0EjuInPAXsAidLIjmy6EyDvUJiwWQc0QYXyK7
	VUiap0lRelorjRuUERcBsYO0ZEeBgOFYBIJ
X-Received: by 2002:a05:6214:2aa8:b0:895:635:c00e with SMTP id 6a1803df08f44-89979d67aebmr101410586d6.45.1771818889061;
        Sun, 22 Feb 2026 19:54:49 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5070d6c638dsm58185791cf.25.2026.02.22.19.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 19:54:47 -0800 (PST)
Date: Mon, 23 Feb 2026 03:54:46 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: liuyd.fnst@fujitsu.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH v2] irqbalance: Fix QA error when
 sysvinit is used
Message-ID: <aZvPhtEoEC0PE8sl@gmail.com>
References: <20260213043115.19961-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260213043115.19961-1-liuyd.fnst@fujitsu.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Feb 2026 03:54:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9602

merged.

Bruce

In message: [meta-virtualization][PATCH v2] irqbalance: Fix QA error when sysvinit is used
on 13/02/2026 Yiding Liu (Fujitsu) via lists.yoctoproject.org wrote:

> irqbalance: correct to install /etc/default for sysvinit
> 
> 1.This commit uses option --with-pkgconfdir for sysvinit to correct to install /etc/default
>   Without this fix, there will show do_package QA Issue when sysvinit is used
>   ERROR: irqbalance-1.9.4+git-r0 do_package: QA Issue: irqbalance: Files/directories were installed but not shipped in any package:
>     /usr/etc
>     /usr/etc/default
>     /usr/etc/default/irqbalance.env
> 
>   Previous PACKAGECONFIG[systemd]�only works when systemd is used. So making this patch to fix it.
> 
> 2.Merge DEPENDS for systemd into PACKAGECONFIG[systemd]
> 
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
> Changes in v2:
> - Improved commit message to explain the sysvinit case
> - Use PACKAGECONFIG instead of EXTRA_OECONF
> 
> ---
>  recipes-extended/irqbalance/irqbalance.inc | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/recipes-extended/irqbalance/irqbalance.inc b/recipes-extended/irqbalance/irqbalance.inc
> index 35b6388e..0c570e12 100644
> --- a/recipes-extended/irqbalance/irqbalance.inc
> +++ b/recipes-extended/irqbalance/irqbalance.inc
> @@ -14,7 +14,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>  		   "
>  
>  DEPENDS = "glib-2.0"
> -DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
>  
>  INITSCRIPT_NAME = "irqbalanced"
>  INITSCRIPT_PARAMS = "defaults"
> @@ -34,7 +33,7 @@ PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd',
>  #
>  PACKAGECONFIG[numa] = "--enable-numa,--disable-numa,numactl,"
>  PACKAGECONFIG[libcap-ng] = "--with-libcap-ng,--without-libcap-ng,libcap-ng,"
> -PACKAGECONFIG[systemd] = "--with-systemd --with-pkgconfdir=${sysconfdir},,,"
> +PACKAGECONFIG[systemd] = "--with-systemd --with-pkgconfdir=${sysconfdir},--with-pkgconfdir=${sysconfdir},systemd,"
>  
>  do_install () {
>          oe_runmake 'DESTDIR=${D}' install
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9586): https://lists.yoctoproject.org/g/meta-virtualization/message/9586
> Mute This Topic: https://lists.yoctoproject.org/mt/117787082/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


