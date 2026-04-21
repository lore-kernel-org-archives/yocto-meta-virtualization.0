Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B43F8F5A8D6
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 02:36:34 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4866.1776738991502139719
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Apr 2026 19:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QY8NVapd;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8eab809593cso182102485a.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Apr 2026 19:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776738990; x=1777343790; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Le+0tn7DUB42HpFELqQwMwRVtzoXie9HLc07a880atU=;
        b=QY8NVapd5RdYbzgjsiHB3a21ZD4Nb+U4drGNVPJK0v8NUEkLL54XAdFE9z5kRbZnMU
         3WCmcjNnq4FLPUqq9NboBXVZmmlA9+y5+7MYHLH/+MUbc9XjknhnkdI3LwyOgPSV1BhW
         wr6c8d6Ei1hZUHVrj+FpzhXQaWMu2T6gYFyfQ9K0LS9LNOxGpCrzV58pNSY0i7Blm5y1
         vHECF99aDaJYvCm1sjs7yKJroweqdePm0df/m2NyJ5a433akVi0lfi49eLz5eK/OGgFP
         XNM9J3yOMNNiZmtRVK2Ifj2c3elA63cVhBHdjHBrrMU/OcVZfrALLw6OKvyIP4ZFMb9T
         6pyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776738990; x=1777343790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Le+0tn7DUB42HpFELqQwMwRVtzoXie9HLc07a880atU=;
        b=LhlCqtPm27jRN99K+BdGCwV3IszoUHzNfVqtWzs02ogQVOniGTULImXZ77D1gkX+ly
         NYBIfDSFBJL2z9sZnkZvqhpJS+66kt3ExETHgNsVL9yiyZszIO7QctCmP6qv0T5QpYXV
         abzGFPPmhZMZqsBCSENEOXV5Y0q1iVlCx+kVsHXVmgUhJ5YN/kMXbo4Of7ll3mV99d4F
         yhcp0q/VUcKMYXI1ht+KOyudZgSvxLdoYaj2wZvXa++LKJKQbMwQupD/XM/qBB+Mw7nQ
         6Z4VF2uIy8h3LM1qyLdvxo3v5un7zaeTqvRVdYMxFgrsZMdOwi6651VVeQ+GchpHXE9J
         Jgog==
X-Gm-Message-State: AOJu0YwepGn5HPz98fkA0ap6Kjk74ybo4/Rh+w+3dOuTMayTkXqdEezf
	2s4e/jdQExKU0/rT4NT/VI1E8UKhlXrNNATI+4adyJhyWWjOyRNbGm+I0oVP9AS0
X-Gm-Gg: AeBDiett3TUCQoQ0uxGWVrZZjh31WL8bvt28SjNaQ7wtjJ/IHs5MFuOjVKf5HTSUzKf
	bvasHW5ycOaBBkPoego13yUljzg2tGR7RycODy0fvF1xRuzMeg6uwr0IfcO/h9Jkc9Z7VrNBgvD
	jnWBy55Ir0MXQVtmUtBvfuMnxaAJhIEKuuN4gr60FuO8ZKkPwe/QFBMh6uAj5zvnowWyAttD0TK
	Yd/NnlRnu9M2OlBwx6w3cFeO9h8GXFDfFJuR8pXwVrnE+EbPBXEUqWzcWUP31BF7uH7PKdWDw5U
	PTC/LZgn5VNOY8qKdJsg9qEc+YBwvpifOk3PwJVnKrcvX3cNjiRCa8FF91/NcBpRIrJSTMKtT1W
	I7thW3bNhSg+Di+Y6FxkKP7iKHYpI7vRU/uI8Aean8N3s3vQSkjmMwOh1KBMJ+uxWcEHmxXIO+2
	48OXHNxXR97aKbn83C4HR1kbqKu8rrJ1QdkbQIqs0KnhZxx1uc+X5lcx7BAFKav3iXY5Y3NrbkQ
	+dzwsgRGPBVcKR27VcReWr9Uki7SxSG3JDInBZQN1uPOPs=
X-Received: by 2002:a05:620a:294e:b0:8cd:c011:dfc1 with SMTP id af79cd13be357-8e78f82c761mr2257615285a.5.1776738990353;
        Mon, 20 Apr 2026 19:36:30 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d5fe8f3csm964952485a.2.2026.04.20.19.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 19:36:29 -0700 (PDT)
Date: Tue, 21 Apr 2026 02:36:28 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: peng.zhang1.cn@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] netavark: remove nmap from ptest
 RDEPENDS
Message-ID: <aebirEvtxPjHg917@gmail.com>
References: <20260416104551.1587064-1-peng.zhang1.cn@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416104551.1587064-1-peng.zhang1.cn@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Apr 2026 02:36:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9714

merged.

Bruce

In message: [meta-virtualization][PATCH] netavark: remove nmap from ptest RDEPENDS
on 16/04/2026 Zhang, Peng (Paul) (CN) via lists.yoctoproject.org wrote:

> From: Zhang Peng <peng.zhang1.cn@windriver.com>
> 
> Since upstream commit dbc920030 ("test: add new test program for
> connection checks"), netavark test suite no longer uses ncat (from
> nmap). The tests now use a built-in Rust-based connection tester
> (netavark-connection-tester) instead. This change was included starting
> from v1.16.0, so the nmap dependency is no longer needed.
> 
> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
> ---
>  recipes-containers/netavark/netavark_1.17.2.bb | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/recipes-containers/netavark/netavark_1.17.2.bb b/recipes-containers/netavark/netavark_1.17.2.bb
> index b0790d92..b9a69e54 100644
> --- a/recipes-containers/netavark/netavark_1.17.2.bb
> +++ b/recipes-containers/netavark/netavark_1.17.2.bb
> @@ -55,7 +55,6 @@ RDEPENDS:${PN}-ptest += " \
>      iputils \
>      jq \
>      nftables \
> -    ${@bb.utils.contains( "TARGET_ARCH", "aarch64", "", "nmap", d)} \
>      procps-ps \
>      util-linux-nsenter \
>      util-linux-unshare \
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9705): https://lists.yoctoproject.org/g/meta-virtualization/message/9705
> Mute This Topic: https://lists.yoctoproject.org/mt/118855782/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


