Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web09.15581.1627876141085882112
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 01 Aug 2021 20:49:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Pgr/68DC;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id h10so10855484qth.5
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 01 Aug 2021 20:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jNSn55GmHdHwEF1E8aiUGdUM7dTl5hGuVH0X8dVkwlA=;
        b=Pgr/68DCLhftKzo8rHiJxZMnaNOdEIloCW9SK0H9hPwexP2ts7FACbxdeUjJLuzIp7
         P9k2tdHU0PxHHt3o0mvg9w2nE1YUGdAHew/qmRZRtV7yjypCO0cGmrpu7axBA5YjoLpY
         2FZBZ5VgqqUzoSo7mnTxRZPbpXV4wlGCyLtR6GMkpntDlJGUUjzmsPhLJg9Z4n+LbMxM
         FcSYh4jWK+wSaL4z3QgvgQWL9sjdN38A3Dq6bJeV/wSkrbBwO4NvUVmWbQPVj3CNgYl3
         9AzBYuGFY4128PtcJE9/OL/ShwdC2n//e9fA7rSD2rQZwhdP3VkycL6P/h38p9QJNfxN
         l0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jNSn55GmHdHwEF1E8aiUGdUM7dTl5hGuVH0X8dVkwlA=;
        b=XR4uKUZYhrdQSyiLWMkxg7ZVqKeeiBIaI0/NfafuJ+rn7XlgdoIuwgBl6FzPeMxLHE
         sTbilLR+Ahd1nzeeugo2So8yq8ndgccLOnOOUimkz/AFnNMAA46987YBsz4eE8K7eNqF
         ZiYvKC3XUCfKOtqmF3GmFogoXmZ+JA2e9IdDDqE2hhFVFhAQx6f/G4kRPLqdDRF6m3fp
         rInKeadzhRqNsT1/7oES0/NKgXBg8InyZJxOsQayGTNneElV6GMSxn1vQefG0XqY+c2c
         eZeeq1uhkO3f7rUJAWQB3gGYYifrd1dxSa9Dr3XYm+L50eeZDHXXWK+zm3f9EXM57ARt
         ZbxQ==
X-Gm-Message-State: AOAM531a97GeOgXCC1j8k7sYWPg/wE/QoQotqXWGu7psXm0oT1jHThdi
	ExPPYP6CU59Syuuoaf3eA1o=
X-Google-Smtp-Source: ABdhPJyJG3Ig8nL5x56dmMVLNAvXVCSdOqMbnKGYt2qgEf7Ha+vZ56QZJpqJYnLO2426tqhWvYlLqQ==
X-Received: by 2002:a05:622a:50:: with SMTP id y16mr12739715qtw.322.1627876140282;
        Sun, 01 Aug 2021 20:49:00 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id o17sm5210472qko.100.2021.08.01.20.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 20:48:59 -0700 (PDT)
Date: Sun, 1 Aug 2021 23:48:58 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, cardoe@gentoo.org,
	jdmason@kudzu.us, christopher.clark@starlab.io
Subject: Re: [meta-virtualization][PATCH] xen-image-minimal: fix aarch64 build for non-qemuboot-enabled machines
Message-ID: <20210802034857.GC16820@gmail.com>
References: <20210802012656.40174-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210802012656.40174-1-christopher.w.clark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Looks good to me.

I'll wait to hear from Jon that it fixes his problem before merging.

Cheers,

Bruce

In message: [meta-virtualization][PATCH] xen-image-minimal: fix aarch64 build for non-qemuboot-enabled machines
on 01/08/2021 Christopher Clark wrote:
> The qemuboot device tree generation task in qemuboot-xen-dtb.bbclass
> requires the QB_SYSTEM_NAME variable to be set to identify the Qemu
> binary to use. Skip the task if it is not set.
> 
> Reported-by: Jon Mason <jdmason@kudzu.us>
> Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
> ---
>  classes/qemuboot-xen-dtb.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/classes/qemuboot-xen-dtb.bbclass b/classes/qemuboot-xen-dtb.bbclass
> index 08f9b02..2d37e91 100644
> --- a/classes/qemuboot-xen-dtb.bbclass
> +++ b/classes/qemuboot-xen-dtb.bbclass
> @@ -176,7 +176,7 @@ do_write_xen_qemuboot_dtb() {
>      # Not all architectures qemuboot with a device tree binary, so check
>      # to see if one is needed. This allows this bbclass file to be used
>      # in the same image recipe for multiple architectures.
> -    if [ -n "${QB_DTB}" ] ; then
> +    if [ -n "${QB_DTB}" ] && [ -n "${QB_SYSTEM_NAME}" ] ; then
>          generate_xen_qemuboot_dtb
>      fi
>  }
> -- 
> 2.25.1
> 
