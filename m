Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.21115.1607633965951484974
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Dec 2020 12:59:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=thTPILo2;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 7C64438C13A4
	for <meta-virtualization@yoctoproject.org>; Thu, 10 Dec 2020 20:59:25 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id z20so4862674qtq.3
        for <meta-virtualization@yoctoproject.org>; Thu, 10 Dec 2020 12:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=RtcjoN2x5GKjKAvTaSAOj0G3jg9R2Lc+MHGmS4Dt4D0=;
        b=thTPILo2g1mtLS7iH9WjIb0KropusjJmsgJoIypk3T8F/hVOYLv6ayCEo8N/dSD+Eh
         qENAqXwUuexRYweP7mutrV8VfGTebJxJGNd5CkFfOVmOdCvAF2Ncvq6NuBGiLDvOn5Xd
         oMuaHjfEpom/3uTmEQxmcmQ8/jxaH1INDAF1KU0iYYLPAXdhMj6UtQGvcD4pqR1wzACY
         ntunFYUgdcI5fMmx+m0eugk1kPztHkVLNMElVHMOxoLzpjrzun28EvnWk0hyeKYh/4Ti
         TDr3R0PS61p9c5Ztr3GvkSDFX1YKkeycjLcSaeqaZ6eSHn99ytcLnYv2+ZjrNTYhme1p
         FsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RtcjoN2x5GKjKAvTaSAOj0G3jg9R2Lc+MHGmS4Dt4D0=;
        b=mA0mJ/eku5SHgwYnO9Cr7Ha5rVf4RRMAH43Etsk7WnoV1S3pFbxmGOSp4X7KM4ca3T
         tCpbQF0jN7q6nvU7x7p6gi5ZTkPtNGV6QXfvfuY3cwsJ1vHiOphdEERB1kQgBCaMhj7t
         aL1uD1StJDcb3cc3kNe9IGnAVXg1IPKFvnhY1gBQqf0qcxes1lsuVp5H8W1Rwj+J82NK
         a8yyAiE5DZiM++OhDFbTMcmH0dwH2jsD7qqx99V4i7UyzVSWEqlZ8oLY+KJ/0dNQhRYk
         Wx+KkeKLUKargwr++LISsaCx542jrvhVVuGRTFLLdVt/JWAiNi42Cc32xx8QCMVXR6Qh
         zMXA==
X-Gm-Message-State: AOAM5302buNkorOmZ3k86PE1hPug+Y7gcIw9dnsVAdSkkwlh3I8vFpOP
	bv1Qpz6Q8h8w318s7DO7vWQ=
X-Google-Smtp-Source: ABdhPJziKWxHcD3nM9E1ZVv1omvwovXsq48hqtdefvU7Ivz4Z2d9PgUTHDW1dGAfiBjbFKM3ypEpow==
X-Received: by 2002:ac8:1013:: with SMTP id z19mr11076101qti.74.1607633964390;
        Thu, 10 Dec 2020 12:59:24 -0800 (PST)
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id l11sm4631657qtn.83.2020.12.10.12.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 12:59:23 -0800 (PST)
Date: Thu, 10 Dec 2020 15:59:22 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-dogpile.cache: upgrade 1.0.2 -> 1.1.1
Message-ID: <20201210205921.GB4078@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1607403570-56215-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1607403611-56302-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1607403624-56341-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1607403680-56464-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1607403671-56404-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1607403688-56502-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce


In message: [meta-virtualization] [PATCH] python3-dogpile.cache: upgrade 1.0.2 -> 1.1.1
on 08/12/2020 zhengruoqin wrote:

> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  ...-dogpile.cache_1.0.2.bb => python3-dogpile.cache_1.1.1.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python3-dogpile.cache_1.0.2.bb => python3-dogpile.cache_1.1.1.bb} (73%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python3-dogpile.cache_1.0.2.bb b/meta-openstack/recipes-devtools/python/python3-dogpile.cache_1.1.1.bb
> similarity index 73%
> rename from meta-openstack/recipes-devtools/python/python3-dogpile.cache_1.0.2.bb
> rename to meta-openstack/recipes-devtools/python/python3-dogpile.cache_1.1.1.bb
> index 21b596fc..627d7db0 100644
> --- a/meta-openstack/recipes-devtools/python/python3-dogpile.cache_1.0.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-dogpile.cache_1.1.1.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=46e560ef3e93a33b284504845ea6a11d"
>  
> -SRC_URI[md5sum] = "a325ec142d690269573a872e24fc1cb6"
> -SRC_URI[sha256sum] = "64fda39d25b46486a4876417ca03a4af06f35bfadba9f59613f9b3d748aa21ef"
> +SRC_URI[md5sum] = "3cf83a593a1a1bc17b89d14917f66ef0"
> +SRC_URI[sha256sum] = "40147b19696f387415a7efaaa4cf8ea0b5d31bdd1b53e5187e75d48ddfee9f0e"
>  
>  inherit setuptools3 pypi
>  
> -- 
> 2.25.1
> 
> 
> 

> 
> 
> 


