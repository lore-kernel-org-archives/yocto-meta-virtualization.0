Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web12.503.1617755833228498112
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 17:37:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bHpLfiU+;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id 7so17032862qka.7
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Apr 2021 17:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=emDJIw17EGZ4vhKqLqZHED53nRDZ9tJHbgC22BViW3U=;
        b=bHpLfiU+tcGJ54oDuWnRajKrAEyXJoo3nDcjpmmOzKyMx8UsDtOydA0r6b6UGretFD
         1LPui+6GKwSy/qollX2DKcQrhP1bQD1ib6V9pNx5dIPr35Ht0+BhQC3WfxDIOoXcC+KO
         J7IdJBmCyr5d2hblzXsLezjm58lUb4bpP1Om1rPzsC84vBS6WCSP1UjBoUvHkuzaSTJw
         TbHin8KgQmZpO8jRjFDMwwxAiPp3cWmHGtQx6KoQerrNAy4m39XFYpnRKXfn8mwsHiSL
         ySq+iS4ypKzE/gCRIP1xN+qH22Py7UX4+m2SVPs/sJQpdzbOARuCh6YveYh48aHPnPcF
         WqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=emDJIw17EGZ4vhKqLqZHED53nRDZ9tJHbgC22BViW3U=;
        b=gfT2dLMwJTUxjAoaJ1EAJICABKpJt9o5sEqAdf7cNWolk8zoDyXXIvqBQNKCBiq9yG
         DDp+bJ9Q6pyPvlIY6tika4g2paJVFSc5xu/Z67e6/bnCPypgCfW58k1a7dUqv6wlLgqy
         i83o0XFbFpbP9xR3RQYcVHonrIF5UpvbAKCCbmZO/Tieb1ztqIjta/JRd1BfVo5LDHa5
         VMMQp7sqAUt9wB9WS61seMAxEXKf1WHqYt3p6EvGs2PlFjfupU12RJ2ujeM/+yaAvlBA
         pE9lfmrgsSCTAw6DZctBKd/s+Tm3i2IkrVD4ptEE+CDQ3ltHsyXaobSF11G96beU1abc
         kMdg==
X-Gm-Message-State: AOAM533bpD0mBVGjmYXaxbeRWQi0RLvzsEJIKMtwFZVPtlXUksO0Dn7H
	IaKrPFlUU7UL7p6Fsbwq6mk=
X-Google-Smtp-Source: ABdhPJy0W6KYTGrlu36jImVucXAhWWBd8gWDK9YMEtV78/bxPbZ+ouOeVIdolEtNmvBu67qNgVrySg==
X-Received: by 2002:a05:620a:5fb:: with SMTP id z27mr651769qkg.19.1617755832364;
        Tue, 06 Apr 2021 17:37:12 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id j129sm17155990qkf.110.2021.04.06.17.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 17:37:12 -0700 (PDT)
Date: Tue, 6 Apr 2021 20:37:10 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 1/2] dev86: upgrade to 0.16.21 and fix SRC_URI
Message-ID: <20210407003709.GD25009@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210404092558.2059318-2-Martin.Jansa@gmail.com>
 <20210404092558.2059318-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This looks fine to me,

But I'll wait to get Christopher's Ack before pulling it in.

Bruce

In message: [meta-virtualization][PATCH 1/2] dev86: upgrade to 0.16.21 and fix SRC_URI
on 04/04/2021 Martin Jansa wrote:

> * don't use github archives
> * upgrade to fix build with security-flags.inc enabled, fixed upstream in:
>   https://github.com/lkundrak/dev86/commit/537e806f8c62b26c5d5fa912f383f4a7d558574d
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../dev86/{dev86_0.16.20.bb => dev86_0.16.21.bb}         | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>  rename recipes-extended/dev86/{dev86_0.16.20.bb => dev86_0.16.21.bb} (76%)
> 
> diff --git a/recipes-extended/dev86/dev86_0.16.20.bb b/recipes-extended/dev86/dev86_0.16.21.bb
> similarity index 76%
> rename from recipes-extended/dev86/dev86_0.16.20.bb
> rename to recipes-extended/dev86/dev86_0.16.21.bb
> index d93e487..d38f7bd 100644
> --- a/recipes-extended/dev86/dev86_0.16.20.bb
> +++ b/recipes-extended/dev86/dev86_0.16.21.bb
> @@ -3,14 +3,11 @@ HOMEPAGE = "http://www.debath.co.uk/dev86/"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
>  SECTION = "console/tools"
> -PR="r0"
>  
> -SRC_URI="https://github.com/lkundrak/dev86/archive/v${PV}.tar.gz"
> +SRCREV = "c6f36cbafa979710b809f117562773dbd6825918"
> +SRC_URI = "git://github.com/lkundrak/${BPN}.git;protocol=https"
>  
> -SRC_URI[md5sum] = "288af53f256300777efc91d97c082fda"
> -SRC_URI[sha256sum] = "533f2a0d2ed61223040f27e5cd007a11d969aaf34f6b709ece122b1e6fc50580"
> -
> -S = "${WORKDIR}/dev86-${PV}"
> +S = "${WORKDIR}/git"
>  
>  BBCLASSEXTEND = "native"
>  EXTRA_OEMAKE = "VERSION=${PV} PREFIX=${prefix} DIST=${D}"
> -- 
> 2.30.2
> 

> 
> 
> 


