Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.2979.1602701744696630321
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 14 Oct 2020 11:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n54MN4Uy;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id t77so296748oie.4
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 14 Oct 2020 11:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=kqX8F7yHZSy+dBPJWaaDoC9YHNsTZknP5tDMSKnngzM=;
        b=n54MN4UyNae/Lv3StLj8HSrD8mITru5OsNyhvefAsNEV8nbwcuTYdJHyZRazepx73L
         UHsB4GU/BryRMrstUoUXo9HitQCoB7VrmsZd0sOzCuipj4Wmzld7mhK54rWhj/6UNh7o
         CLTeLx+OBKtKfy9HYtGBYtQXASjbA0zTXC80txGtquxwDgB8/e6zRnI2G5GCI8ShKTbl
         y3nbcn0z44cQ9QNdsqAblYd8OXgWBYY9WmYSHmIETbOaYrGB7Gls496eNUiqu4YM0B8K
         O+FbNamvoyk7EP7xjJtGaKJjxuXhopY8Ndtwy6kxsS3Qbjo9LEpsV8hzVw495DTc7LIW
         U/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=kqX8F7yHZSy+dBPJWaaDoC9YHNsTZknP5tDMSKnngzM=;
        b=mV1fvYEJBU2U470/hn6mb+vcSgkBdjkruo4OEpzTrwo17JOjJ23ObkJT48UVdeShoh
         FyETZDG4ZKVZSMVWYpsTSHLbm4lW6VouKlQ+vwSBA702Sf0Kea3QMG//sYgJDr+NypFa
         a6AL+Jt2q3+8u0na5vb+yFvsNuU6OCdZxK+hdBcbCPAKUB/kQBZ0x9N2nnfbyuSajhd9
         eHfFtvDfTXPVOFkl3eG4Mj5PLmHrXtU9AKla/sqZHld7/9HvSvr0vQE2Mo/7rrPx30s2
         LSCaBDPn0SI5/sNZ2KQBMql4dRBDh0gCvxSXpKDFxG9ZlIUmYbAhzYo4gZREdn58yZul
         WXzA==
X-Gm-Message-State: AOAM532Z3BeWxFIr4kVycwfQ8TnWoCjIGhGY7lkqari28+qzd87d00wt
	GN3A70S9mZPeNtn3mTdO0m3EtG5Nz6A=
X-Google-Smtp-Source: ABdhPJya61/pW+UCyEoK/X/NfumQiCxFYVU9dhH4S7BqsuQk4aEU7TjeBYQwhz2yqkMwmh/7C3yahA==
X-Received: by 2002:aca:aa08:: with SMTP id t8mr489633oie.129.1602701743877;
        Wed, 14 Oct 2020 11:55:43 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:283a:e7e0:f7dd:41c0? ([2601:202:4180:a5c0:283a:e7e0:f7dd:41c0])
        by smtp.gmail.com with ESMTPSA id f2sm77603ots.64.2020.10.14.11.55.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 11:55:43 -0700 (PDT)
Subject: Re: [meta-virtualization] [PATCH] layer.conf: add security to LAYERDEPENDS
To: Martin Jansa <Martin.Jansa@gmail.com>,
 meta-virtualization@lists.yoctoproject.org
References: <20201014143120.423865-1-Martin.Jansa@gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <e90ecb58-79be-93c5-84e6-8f9778b2e756@gmail.com>
Date: Wed, 14 Oct 2020 11:55:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201014143120.423865-1-Martin.Jansa@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 10/14/20 7:31 AM, Martin Jansa wrote:
> * fixes:
>   NOTE: Resolving any missing task queue dependencies
>   ERROR: Nothing PROVIDES 'libseccomp' (but /OE/meta-virtualization/recipes-networking/slirp4netns/slirp4netns_0.4.1.bb, /OE/meta-virtualization/recipes-containers/crun/crun_git.bb DEPENDS on or otherwise requires it). Close matches:

Sorry.  I am aware of this situation and I think is stinks that
meta-virt would have pull in meta-security just for a common package
like this. I did try to get this package in meta-oe already once. Maybe
its worth trying again.

- armin
>     libcomps
>   ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
>   Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'slirp4netns', 'libseccomp']
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  conf/layer.conf | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 16d071b..e2cdf23 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -38,6 +38,7 @@ LAYERDEPENDS_virtualization-layer = " \
>      networking-layer \
>      filesystems-layer \
>      meta-python \
> +    security \
>  "
>  
>  # webserver: naigos requires apache2
>
> 
>

