Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3132EC43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 13:41:22 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.93393.1783086078266985347
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 06:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=E2JeCBf7;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-92e53581361so29515485a.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Jul 2026 06:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783086077; x=1783690877; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wLwMdi0pZljwi5tgLPR3Q4GmsnivMWCr4/Gyc8+K490=;
        b=E2JeCBf7WpOaIjA8Qr9tS5ooNWKs3pz42Q1261j/rco4apR0E9sBYQyuPSlQ0b8yzB
         YPKDXTCYfdGENSPypBYhQH31VZRcOonZLL1LLjX6d51Ii8XA05B10ribl5STJ5woc1SW
         YF+DcWiWQMnHA/BJYKbZJiYKOjJM2qO0Eksyagf/bnpuGDrtf5b45cuhfBrwxFmi7KNV
         nKD7nGYdisfnRYKC0FBQWWAYq3KK/GBPygx4zhDZqwwVw0YU6hTL8YG5dgTzeb/A1VPr
         i6BxI9e62G7nM8zGF/UCEv/6m6EAAgkVuCPWw9nkatC/KgR9aHLyjcqfCtEI0x8NL/S8
         KhMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783086077; x=1783690877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLwMdi0pZljwi5tgLPR3Q4GmsnivMWCr4/Gyc8+K490=;
        b=QALEiQdpnIc56pyfzdv38MK0C8IV5mR2BZbMgtIiTJt9lPxtN+VK2FJQQ8JS0fbNgG
         hnBFHhtcnwEYwMuxlvA+ChgEXARKzgYCeC3++1EDGmSIRslGl3mw27NgZVqyrvWcLPqS
         yfZKpdSPKYMvx2kIJSPUUNGDBFDiOXy7pqxCGKTejzE57cQVMADLvb2cU7zvccFViWmw
         VBX103pAbMJWdl3Wrlyt4/V1qR1c4lwzcjJEYHgSvXuZdYR795QbgdDGL8H8Rp47B5IY
         3Mfse9SZ8Jpx537UZRrCkdnKATziF1XApyEM8CYAYN7lmtl7MBnWDnJRT+Z3yyTPf5GJ
         jmvA==
X-Gm-Message-State: AOJu0YyN7WSQE8BViC2YQLv5sI7nXlBPtMcCBauGLXRq07bYVYvMUmfU
	5L24bP7BlQmrUyzOJOOktiiQalJQvDqM/OrqaClNKIO6t0zEQGDQO3mz
X-Gm-Gg: AfdE7clpcsRIIsR4OCYSXLhA5EEK9CseWC2Kv8zIH46FftUnmqUgUFKGRbZ4cfvgrpW
	zLqOaW7cipSLYujQCV9FH71InDBEUn/7MkERvKXONx0wSqUjlpGGWPh/Qwz+0zXbInIZtYVzwhZ
	0S5BMlKullOU1CVqVvsDM1ma+9CJz4Li3vtG8O2ia9mT+csU1zfXrfmE1dM6Rpou1237GxuBfqA
	rGvAW9w1lEmhCD81iReQXpJU16o+sHo41Ps+OmVyfnELdXxX302xD+M1/rR/ns7AhnScJ2qsSPD
	bvX4Qt0tMRLcCFiG+K4YAB+ezCoGMGCm/qLgdM1utna+nsHTKKvLQSGo82QeERvzPPUYL1mrQg6
	HeOq9B9cmi+gveDfXxhJMfBi+SUZjVvSN/GLgnpBO9c3G1zLIFG2DrDe5uCoAgSHsjHtJjm6jJB
	gH3viOVeO6xxS4DrPnZeRm7w9AdGQybQFX06Xr5UHGS+Sve3lK8rqe4n7hdTAxBfMTp+QgkwWyb
	Z7H69XAofoaj7lQNJqDfUSO8l57oOR4e1wBq6P4purtZZzLsMMhHytmFtuWY7irNL9cq13MRihe
	IKltD10u1x8=
X-Received: by 2002:a05:620a:640a:b0:927:25f5:ee08 with SMTP id af79cd13be357-92e782c6cbbmr1373895585a.43.1783086077094;
        Fri, 03 Jul 2026 06:41:17 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90d0011fsm171362485a.45.2026.07.03.06.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 06:41:16 -0700 (PDT)
Date: Fri, 3 Jul 2026 09:41:14 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: wangmy@fujitsu.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [PATCH] [meta-virtualization] [meta-cloud-services] [PATCH]
 qemu: upgrade bbappend to 11.%
Message-ID: <ake7-tDE0M5J9O0X@gmail.com>
References: <20260623055639.1185-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623055639.1185-1-wangmy@fujitsu.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Jul 2026 13:41:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9911

merged.

Bruce

In message: [PATCH] [meta-virtualization] [meta-cloud-services] [PATCH] qemu: upgrade bbappend to 11.%
on 23/06/2026 wangmy via lists.yoctoproject.org wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Compatibility with OE-core.
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../qemu/{qemu_10.%.bbappend => qemu_11.%.bbappend}               | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-openstack/recipes-devtools/qemu/{qemu_10.%.bbappend => qemu_11.%.bbappend} (100%)
> 
> diff --git a/meta-openstack/recipes-devtools/qemu/qemu_10.%.bbappend b/meta-openstack/recipes-devtools/qemu/qemu_11.%.bbappend
> similarity index 100%
> rename from meta-openstack/recipes-devtools/qemu/qemu_10.%.bbappend
> rename to meta-openstack/recipes-devtools/qemu/qemu_11.%.bbappend
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9902): https://lists.yoctoproject.org/g/meta-virtualization/message/9902
> Mute This Topic: https://lists.yoctoproject.org/mt/119937023/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


