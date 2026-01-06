Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ACB3CEFCF8
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 19:20:22 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.98269.1767727217552179086
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Jan 2026 11:20:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NyrFwRo6;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8c0f13e4424so122559885a.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jan 2026 11:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767727216; x=1768332016; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGg4k+WpPjraIYFOOVVdnO/elEmwsM9aPmpwUsTA078=;
        b=NyrFwRo6236GIooD7pymgIfXqy09PYqvOWLNe7fjlhTdEhJksHqAsmXDwOoGJdYlEb
         1FofmGf3SuPW4gvbLuymhAIqFLfzF0PM37hCJ2UNmJflg0y1xoUfH+Jy/2WLh6KfDb/3
         7OGfyJdkCov/FIwbXKQrV1LgIb41lebFqJFgyHjVmHtHNVPkrxt6yZjTr30qyAAaSDrE
         lEP3JQTTzzerJ38jEjbFNCaIcUnEPTFImirozpH7Tud+WGXmBivfHGMzBZFQIp14qPpu
         SadYuDT8GRbPlR1etaO1MsfwnTi1ioF/jUAFEO3YSYiBxvm7UAWeolGZXqvsgIV9Pfed
         6RIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767727216; x=1768332016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZGg4k+WpPjraIYFOOVVdnO/elEmwsM9aPmpwUsTA078=;
        b=DXtZRhVyi6xqLnGL+avQQhA8eJJvGcKiiHRVhdq4ltiXB8FqoX4Q5hCA24C6ZRXsZB
         eF8nUhl+NbdcFssQq+9HgJbUiCqMKYVzcQZQ1MTD+mYwexxAhjrgOu1zsd+XNMDQBS6L
         1a6gu9Ayxkbt6RYByy2oepawh8QyJ5yGM93hf11jVDg3KirzxNWkreDQwmlQLXh/QgBT
         e5cqi5W0valtIePc71Md7KRQCWs2JtOrT7wiefMaxrr4BidcJZmaCDU4dvWJLYEdmyBf
         yFlRFFpp7jaHC/TkzHAO9IPsf018IH5RY5vfNFHZCBf5hdtm+iHsYQ40P0S8lBhULdK+
         xabg==
X-Gm-Message-State: AOJu0YyiN+c2X74VX1WLkVPZiv+cIfzMBAsg0q48CkP8qEy/UALYM/u3
	1bZIMqhj1d1b+9Oh2YhjCGY1F4PcDQfnzMRkAPcheXykGa15TL6Us0AQ
X-Gm-Gg: AY/fxX4kSpfEANW05dxFVAkOHGF65boWF1FtINRz2J3SqylXyYgQ0GNfROZSpIZd1vB
	3Ynd4zB2MpF8rv7aTzKiOjto/QLtk2q/8ZnIGq+ssJOP5IGrExBQftcDBo8EgE3bp/T62JyC0Bd
	YqGkonKZX675ylG+Noshliwk6Ou909Na2Lpw5O4aGJnSn7ChAqPz4hvR4Z2MXPQ29PhmqmC1Ysq
	OvQiZv+qx2+nGXRvK4WmESgvhpxkquNsK8wdjUNpyfH47qoREzD5F/3uYFsmhTg2txagZmgsmia
	BhMZ7FYfIp4tl/KQ7SyVzi8hQ0+75ksd6f+SVHZ1o5aTRZmRDRwAlrHRv4eyiuNAxRouUXpgOXO
	1oCs7kJmfNrSxHXCcyPUxAhRHaw2K5o7FNS9vTzc49o01sIQK0wVmwyQE6dJMfMFG8wBb3aIEHu
	V+Yc54xajCS5WDUl4R98zbBFHXppGFeyd5jgbpp82dUmomkPx20ekkgob56vAd6U6L
X-Google-Smtp-Source: AGHT+IFijSWBpFfzp8stEOUWJLvwDfNPgdmPU5m31kW3zaWU9BazOZpZSZL01P6pPLeaTpWmuK5l5Q==
X-Received: by 2002:a05:620a:280e:b0:89f:db05:1643 with SMTP id af79cd13be357-8c37ebb899bmr545588085a.89.1767727216276;
        Tue, 06 Jan 2026 11:20:16 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4b9c31sm219527085a.20.2026.01.06.11.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 11:20:15 -0800 (PST)
Date: Tue, 6 Jan 2026 14:20:14 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: hongxu.jia@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] irqbalance: correct to install
 /etc/default for systemd
Message-ID: <aV1gbj2aBhzFpPfv@gmail.com>
References: <20251229061921.751807-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229061921.751807-1-hongxu.jia@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jan 2026 19:20:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9522

merged.

Bruce

In message: [meta-virtualization][PATCH] irqbalance: correct to install /etc/default for systemd
on 29/12/2025 hongxu via lists.yoctoproject.org wrote:

> Due to upstream commit [Properly embed EnvironmentFile sourced systemd
> configs into meson and autonconf][1], introduced 2 configurable directories,
> defaults set to: /usr/etc/default.
> 
> This commit uses option --with-pkgconfdir to correct to install /etc/default
> for systemd as usual
> 
> [1] https://github.com/Irqbalance/irqbalance/commit/41cb97c714e6216ab7f10f8aaa51a2548da3acc7
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  recipes-extended/irqbalance/irqbalance.inc | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/recipes-extended/irqbalance/irqbalance.inc b/recipes-extended/irqbalance/irqbalance.inc
> index a145a3b3..35b6388e 100644
> --- a/recipes-extended/irqbalance/irqbalance.inc
> +++ b/recipes-extended/irqbalance/irqbalance.inc
> @@ -34,7 +34,7 @@ PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd',
>  #
>  PACKAGECONFIG[numa] = "--enable-numa,--disable-numa,numactl,"
>  PACKAGECONFIG[libcap-ng] = "--with-libcap-ng,--without-libcap-ng,libcap-ng,"
> -PACKAGECONFIG[systemd] = "--with-systemd,,,"
> +PACKAGECONFIG[systemd] = "--with-systemd --with-pkgconfdir=${sysconfdir},,,"
>  
>  do_install () {
>          oe_runmake 'DESTDIR=${D}' install
> @@ -48,5 +48,3 @@ do_install () {
>  	fi
>  }
>  
> -# in case systemd support files are installed
> -FILES:${PN} += "${prefix}${sysconfdir}/default/"
> \ No newline at end of file
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9509): https://lists.yoctoproject.org/g/meta-virtualization/message/9509
> Mute This Topic: https://lists.yoctoproject.org/mt/116981078/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


