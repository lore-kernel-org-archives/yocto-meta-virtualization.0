Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F69C38150
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 03:52:27 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.6212.1720583543160307822
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Jul 2024 20:52:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k2MCs8Sc;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-79ef810bd4fso300640985a.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Jul 2024 20:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720583542; x=1721188342; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eovGQYXe9+EGNV96etd7YAZFkd7ZP6jhRALf9w/HVUA=;
        b=k2MCs8SczL+ph/qWaI4azh86r2/Bd9bsztnRJnH2zEOJXLII0+6JxEOGxYco55Zdfz
         SsQXIx4CyNedN+WYT3ucL15QNMoqTXSYizzwbyiKi7HFsNhUt0MpClJ4Up/cLGyC8wgG
         EWSwH4k+7WLR3KIuZ3VfSD86sRD9bioHPdZgXzqXO0g5ZQq0RF699P/rVFhPGndJZEBe
         w+wGn1rQw7TvhhJRnTFPLU0tC1wuuRE+G/kanEIvvB4G6dt/hEMDkF+giw25liLnXHo/
         EoojZ7iHbZtKi84kdxTeGmJLIyvwD2RpF/YC3RJx6ceN1UP6wGTWkKg/UxG4S3PTCPfu
         I6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720583542; x=1721188342;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eovGQYXe9+EGNV96etd7YAZFkd7ZP6jhRALf9w/HVUA=;
        b=Pd8oG6q8CmuchAivIOLe/6VqF2C+hCWgyq4RGvG+mUfoKTxwuKouND9prxM0/b5Z6h
         oOl5oqRBBbJO546IzEl5QhEheiwwlnaUghwsxEcksjPyeGcYy6f1GgNMnYXAN02f9JBG
         zKDqTz47EIiKVkozA0/7zpDwPupA+pApQwkZUsSdGUygeozuy5gLI0E6B1/qNiQYj7z6
         IcgK5Hzksql5Rf5RxizHdQA7et4PFGZwUEg3kFhwgohinJgVTWHiZj7K9HiSiJ23kWWi
         sgcTLsGj0wqqCMMgM7uMGqt3qaDcZl0GxbeOiFVR9guhRki4US6QWZUnIrBC/V7HxDc/
         U5cA==
X-Gm-Message-State: AOJu0Yy4Kdrd3GngDHyeP2tgKzzikQ9NeKXDgpWxWkRm1IREXEYJPDWz
	qG/7cgSjzGuQ/rC5MiY3W9fQWMT3P4Dc4juK52n0htx9EAsF/BIUlvZoDDit
X-Google-Smtp-Source: AGHT+IFFP7nIIcjL1wZ7/liwG5EAhxhoOD33CCgQZOzWFjebsUBYzk7CzbWztGIXpAA7wWwtfZtR1A==
X-Received: by 2002:a37:ef19:0:b0:795:5995:fc89 with SMTP id af79cd13be357-79f19a6f377mr467098185a.18.1720583541890;
        Tue, 09 Jul 2024 20:52:21 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79f190a862bsm157803385a.114.2024.07.09.20.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 20:52:21 -0700 (PDT)
Date: Wed, 10 Jul 2024 03:52:19 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: mingli.yu@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] aardvark-dns: Improve the ptest
 output
Message-ID: <Zo4Fcz/Jn596jp6v@gmail.com>
References: <20240626032417.1990728-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240626032417.1990728-1-mingli.yu@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jul 2024 03:52:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8822

staged to master-next

Bruce

In message: [meta-virtualization] [PATCH] aardvark-dns: Improve the ptest output
on 26/06/2024 Yu, Mingli via lists.yoctoproject.org wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
> 
> The previous ptest result show as ✓ or ✗ , improve the result to
> PASS or FAIL.
>  # ./run-ptest
>  [snip]
>  PASS: 6 basic container - dns itself with long network name
>  PASS: 7 two containers on the same network
>  PASS: 8 two containers on different networks
>  [snip]
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  recipes-containers/aardvark-dns/files/run-ptest | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/aardvark-dns/files/run-ptest b/recipes-containers/aardvark-dns/files/run-ptest
> index b33d8fd4..d7abbb34 100644
> --- a/recipes-containers/aardvark-dns/files/run-ptest
> +++ b/recipes-containers/aardvark-dns/files/run-ptest
> @@ -1,3 +1,3 @@
>  #!/bin/bash
>  
> -NETAVARK=/usr/libexec/podman/netavark AARDVARK=/usr/libexec/podman/aardvark-dns bats ./test/
> +NETAVARK=/usr/libexec/podman/netavark AARDVARK=/usr/libexec/podman/aardvark-dns bats -t ./test/ | sed -e '/^ok/ s/^ok/PASS:/g' | sed -e '/^not ok/ s/^not ok/FAIL:/g'
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8812): https://lists.yoctoproject.org/g/meta-virtualization/message/8812
> Mute This Topic: https://lists.yoctoproject.org/mt/106884095/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


