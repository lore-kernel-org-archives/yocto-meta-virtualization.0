Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 966C2C021A9
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 02:01:16 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.10561.1739844072730609190
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 18:01:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GnFyQeYq;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e65d6e1f12so65609136d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Feb 2025 18:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739844072; x=1740448872; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xGNENpFnWZVh2E6uUVbdTLq5ffAm3vK670Au64adMfE=;
        b=GnFyQeYq+XfGSJw2zGwSNfwDuu3RNqFNu3AdJfp+iiIid3VzKmeVvVMd1wDzHVF6ox
         M0RPOk7nL96M9wn8hzhqkSvJy+ygWvULpcXRAcnt4R4VwewVVJvVnzh07NU0O3nwUFXd
         KeoPJAd/OYUTcNkI03yZVwdb0ByezbcnBCuvgxRItm58DP/DEt6pTpSe3QHrvQI8NDGZ
         onw4PnGyXmbc4aG+JjdIdFI34a1YE0lTWMZ7E16fpSZmFVSMTvHw6J3bxlpHEz9sICkU
         hPwTMOa26J12IYJmG+vwWGRYWAI5XskIBTuLsiu/ZZFJ2kRtE90nRIVrRttpIKDtLLx9
         oruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739844072; x=1740448872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGNENpFnWZVh2E6uUVbdTLq5ffAm3vK670Au64adMfE=;
        b=EiJkoVdUiYXpdDIy/ZONWv5+EzFZwEiCSGCnz88nh3KDPc+ALX0lXdfiQGboKDLrXw
         HQLUtYH75ygbMaiuq+cbB0XreLR3DTcy7c3vcDKxf56oYR2uBKeoCEUQVkg6Ht+2NGlK
         JLiNDEUPY7OalE3VOm73daVVpfir4NvMo0qZDe4Mwk86VSOqn7vesI3jVq8DHmxC1g7M
         QBwFwCagIkxjyxl6Om2t4SSVyoMcNzV9uh1yYHU0JOafQqQcGLsalrCmFvj5l3DyedHU
         SAUQHA/4Wh4xmKE5A2Ml4QdNUrdLlmcGTFvqRleZBb7HfUsZ+x61bNZEV1OjmQN5SSPH
         s4bQ==
X-Gm-Message-State: AOJu0YyPz430+u1v2YNUyPCy2yqUwJBk33TQdXCrHrbk539JbGW7WKW+
	bQMKVnfqT/VRYApV0klC6OsypImGiUUzDCsethaatt4Y+pnemP0eOpJ/09Bj3Fs=
X-Gm-Gg: ASbGncuJ0+bL7lCmEhJ3awVvanfp2zHsOrsKKUEssbxvlJTkbaO7/EPtbXuqzWPoqmL
	RloGz9jCd7bhBnwHN26ekN+V31fsL3yTSe5akY+KLYOBVG7Kyx+o0traYHgWPeNvnmZ0078+2fF
	x4z/jQWNYgJXTPGwP1Zewh64uevfN2BDb7c59fsGMrCk9AW3JzpQEsny+iFoNJ1P8yQjYhQy4Aa
	d6Km9ZPF6tKBK+MC5BVkakIOOgF7lu4YIXA1dvp59uCtP4KtJ3xJMGTsuYfWQv2R1mmOZ+7Qys9
	N/LEZWoME21NC2CU4c6ulZ+ft1phI8m99pTFwkccngTfXggXYEh/fGTRDKgHaLVD+sAh0Q==
X-Google-Smtp-Source: AGHT+IELAabxYrxQQqTp2VvrlJnpvq7kpoicx5Hk3z2MZ/GmH5Bc8epsFiu8zCJJyLkuHGT9vvTQrQ==
X-Received: by 2002:a05:6214:20ad:b0:6e4:4331:aae1 with SMTP id 6a1803df08f44-6e66cc8b42cmr192754176d6.8.1739844071723;
        Mon, 17 Feb 2025 18:01:11 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e65d9f3498sm58438536d6.84.2025.02.17.18.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 18:01:11 -0800 (PST)
Date: Tue, 18 Feb 2025 02:01:09 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: xiangyu.chen@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] lxc: disable lxc-staticdev
 buildpaths checking
Message-ID: <Z7Pp5b2jtToXelnW@gmail.com>
References: <20250216082154.4066352-1-xiangyu.chen@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250216082154.4066352-1-xiangyu.chen@eng.windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 18 Feb 2025 02:01:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9144

In message: [meta-virtualization][PATCH] lxc: disable lxc-staticdev buildpaths checking
on 16/02/2025 Xiangyu Chen via lists.yoctoproject.org wrote:

> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> 
> lxc enabled the ffat-lto-objects option since 6.0.3[1], that
> liblxc.a object files contain both the intermediate language
> and the object code, that cause yocto QA report a QA warning.

staged to master-next

Bruce

> 
> Ref:
> [1] https://github.com/lxc/lxc/commit/277ac364074f8287be91393f50f8f999d51101c4
> 
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  recipes-containers/lxc/lxc_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
> index 1655e8d0..fe713a0d 100644
> --- a/recipes-containers/lxc/lxc_git.bb
> +++ b/recipes-containers/lxc/lxc_git.bb
> @@ -127,6 +127,8 @@ FILES:${PN}-networking += " \
>  #     am_cv_python_pythondir='${PYTHON_SITEPACKAGES_DIR}' \
>  #"
>  
> +INSANE_SKIP:${PN}-staticdev += "buildpaths"
> +
>  do_install:append() {
>  	# The /var/cache/lxc directory created by the Makefile
>  	# is wiped out in volatile, we need to create this at boot.
> -- 
> 2.48.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9142): https://lists.yoctoproject.org/g/meta-virtualization/message/9142
> Mute This Topic: https://lists.yoctoproject.org/mt/111212140/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


