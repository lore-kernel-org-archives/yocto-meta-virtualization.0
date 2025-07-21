Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B070C83F1A
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 02:35:19 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.31513.1753065316378987007
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 20 Jul 2025 19:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AOJCNkvW;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4ab814c4f2dso76932141cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 20 Jul 2025 19:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753065315; x=1753670115; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7UQOLRHZGtkPdMRypfeWq3PjhxjJyCzmoxD0rIV4nb0=;
        b=AOJCNkvWm0RXI3a6GfThHIiezm8k6CYlzndejl7Zs14jBHOCPJC2WfYFGLENC+eAwM
         OSxG6tNul2ljD/95VyYXbT0FIGB/JmSzafk9XsCWahCWMSX+9wjD9IxRwpn9NLVRmFjg
         8COD+3g0dwLEizx2i7La+kfTEKS2PungTQ55Sle4WY3xASK9zRjsYFxudF8lHkptlEgI
         ehasi+iIewqw4bUdYcik+V7M/UgcRDIm6vBQSBOwGZlIn3rgooiN4zYGzQUh3KegkVjU
         1cbcpkQA31nfGBdkoU0sttO5L8x9ff/FN1OTnf0tkwJkyItBjIKtOEfzuJSXeN+VXdDV
         yezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753065315; x=1753670115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UQOLRHZGtkPdMRypfeWq3PjhxjJyCzmoxD0rIV4nb0=;
        b=H2f4s8Z8zZYqcP/AdfEWyqRM4vZwe0UG5dKgDKaplKKJ/GZ/rLXUbzbYhlmZqMiHdO
         Y2/xnIS1JjusBSWAt6m/duRnRCTeVLoFWdQkawHjQiFdrJ+uWusf43sf7wIHA32enJsu
         BGcc/t3cxQj2bbH1WLRoCJa1a2aWoEHDBYOhIB1Fst7yL3NOIRJ2lpW66CJcZ5yjS9Vl
         E1JcxGzXieZY9xm9Mn6LYmVTHHZK6lgL0CB+9Bj/b4M5XkcXQtVzSkQeMfA53pbmyRYn
         nprOHcg3QoUJXA+jQHsk8onXdE3/5uGBasCVnZkIQJhOvgMcNv1EAya5/7eFWmprl6MM
         kFUg==
X-Gm-Message-State: AOJu0YyN26+try1Dkt+V7ww7JFQpp66W5ska0NWD1dYlaV95HppVsjdP
	d6JuyVl7SDXW5R/jpbPZlaX5mLkZmLe4EFQhAfJzxANt3LwLOSLrlE/L
X-Gm-Gg: ASbGncuKS8PqA81gmozgjrzFiia1zvB3VA6JJyqTudusUwJuAfYL8bkEX5VO53Hv4qk
	UCbZl5uEGZE626fGwllOBtc7GYredv0bvP9iZw4UweICnlkRPaYPVGh2Z5cgsjVc0Y6+x8w4N6G
	ECoWxL/COdpdB5XO7d9tokMWxRRnKv/LubCwwxdqHUc4pfME2W4XLz+TE5HsJNvNoweO6GCX27v
	NhkwXBxohs6WBEQGWSsng2RUQDecN+Mu0gx8jr9ghA+SJv3Xfis6HPBDvYx3pISLWxirk9x1jrT
	rPvx5yWtEtkfRRaDxG8HwbIK8qhVtTRXZwW5yc3CnkrI3o8x8++8p9cDDnJuJOQSWjtKgVMcDtY
	53/jmp28hV3BOjkpNJGJervpSgKT8erFCzIUSeUPcfwocdTIwLB0WWiw4R/vbYEwnsaFiiASJyh
	dk
X-Google-Smtp-Source: AGHT+IEfxMv6eXo6O5abL6yCwep/OaBxMEDyJL2k26Tel1Ns6jvw2aHen2LToLnmGdy2Jun6qTPCJA==
X-Received: by 2002:a05:622a:1a8d:b0:4a9:e5c2:1264 with SMTP id d75a77b69052e-4ab93dcaa9dmr256167661cf.49.1753065315226;
        Sun, 20 Jul 2025 19:35:15 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4abb49821eesm35625131cf.10.2025.07.20.19.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 19:35:14 -0700 (PDT)
Date: Sun, 20 Jul 2025 22:35:13 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: liuyd.fnst@fujitsu.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] openvswitch: small ptest fix adapt
 to UNPACKDIR changes
Message-ID: <aH2nYarv+r9iHTkw@gmail.com>
References: <20250718012808.1403-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718012808.1403-1-liuyd.fnst@fujitsu.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 21 Jul 2025 02:35:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9323

merged.

Bruce

In message: [meta-virtualization][PATCH] openvswitch: small ptest fix adapt to UNPACKDIR changes
on 18/07/2025 Yiding Liu (Fujitsu) via lists.yoctoproject.org wrote:

> Assume the build conf dir is /mnt/test/build_auh
> before UNPACKDIR change:
> S="/mnt/test/build_auh/tmp/work/qemuarm64-poky-linux/openvswitch/3.5.0/git"
> after UNPACKDIR change:
> S="/mnt/test/build_auh/tmp/work/qemuarm64-poky-linux/openvswitch/3.5.0/sources/openvswitch-3.5.0"
> 
> Then we should change ptest patch to adapt to it
> 
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  ...tch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch
> index abad1458..e55e434d 100644
> --- a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch
> +++ b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch
> @@ -86,7 +86,7 @@ index 0000000..0b4587c
>  +	install $(srcdir)/utilities/ovs-pki.in $(TEST_DEST)/utilities ;\
>  +	for p in $$list ; do \
>  +	  echo $$p ;\
> -+	  p=$${p#../git/} ;\
> ++	  p=$${p#../sources/openvswitch*/} ;\
>  +	  pre=$${p#tests\/} ;\
>  +	  if test $$pre != $$p ; then \
>  +	    echo installing $$p to $(TEST_DEST)/tests/$$pre ;\
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9319): https://lists.yoctoproject.org/g/meta-virtualization/message/9319
> Mute This Topic: https://lists.yoctoproject.org/mt/114214572/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


