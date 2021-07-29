Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web09.10573.1627570624072064173
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 29 Jul 2021 07:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PvGpFsVM;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id p38so3493139qvp.11
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 29 Jul 2021 07:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=I/vzwvjS/wOwh9mZDtBxOYotyBixfaUy3G60+29p4Sg=;
        b=PvGpFsVM/TP03uo07h3M8vzTwpPO+LwtNMmyZFanAQo5AxNb4i6LXcv1oSvjnXLWrN
         583A5rxNWvVtoun452jnRNKUzm29wUww1OEL85q+WLndFmI7HDu8KL/ws3otU3I1lm+Y
         GL8J0Dn9DAuPYFdBSNyZODSOzfVdlX+okUmUVxQHJ9D0B8zwCFbg/FY76/DGZnTUgVuv
         XTCV3D9zmRuLV16dj61FdHERTlw+3lK6IIyH7GiIezApAHaZsmFaVvYC4EXt8/ig3oj4
         JcHzT9qvtNc6eDEzHm8ne+l0s9SeTEp6fBtOAzL+y8nTg5Jpphl+sRtcDlRIT0Y+FccW
         IHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=I/vzwvjS/wOwh9mZDtBxOYotyBixfaUy3G60+29p4Sg=;
        b=QTwgYSs0T+3iVTa7P0uTAyEhERi7SKF1zOYKkufDwc5cWh+ue1MTg+kdbFl6IesXst
         Di+zE17HlMiCEAcIfvI2xFlNdTjaT/EjosRrx3jJmMhP/KkzsB2slcUH6/4PCAOAESSC
         qNqf0arPmK7K520ixMPfsbBnUhnuSLKj4zOtMeSLm9koeWl+Z2ajIwNjLYUKXSrxHpOt
         UL19jrMj6jcCdMngrlv+NXwp+7qfxnrNcyhXLWDJd2WSv3VPhSII93y+1JWsh+tb9Wkp
         c0Nmg0SAHlRExRh5Il+rABT6fbZ5eBDY38zByOIIhiNBXhf74Ho4OpS1b+ZMp0cgqWEA
         XpXQ==
X-Gm-Message-State: AOAM531AVqJXhfGzfiZU4wtNkegAxvjoy0VYY0I2nNKJi6uS0AbuA/TG
	J8LRqvrmm7AVyChAFDgfJ7A=
X-Google-Smtp-Source: ABdhPJzUf3sk6HCbO0lKmicvjq/9oiFlrp41aPlCUfRwY/ADWFHYjORLkgvgS0nTTWRP2+71g5lFAQ==
X-Received: by 2002:a05:6214:e83:: with SMTP id hf3mr5620631qvb.19.1627570623274;
        Thu, 29 Jul 2021 07:57:03 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id g1sm1836811qkd.89.2021.07.29.07.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 07:57:02 -0700 (PDT)
Date: Thu, 29 Jul 2021 10:57:01 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Ruslan Babayev <fib@cisco.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH v3] python3: remove the no-longer required bbappend
Message-ID: <20210729145700.GB40673@gmail.com>
References: <20210726185823.26402-1-fib@cisco.com>
 <20210726185823.26402-2-fib@cisco.com>
MIME-Version: 1.0
In-Reply-To: <20210726185823.26402-2-fib@cisco.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][PATCH v3] python3: remove the no-longer required bbappend
on 26/07/2021 Ruslan Babayev wrote:

> It has been carried over from python2 and is no longer required.  More
> importantly it breaks the python3-native build due to
> ${STAGING_DIR_TARGET} being "" for native recipes.
> 
> Signed-off-by: Ruslan Babayev <fib@cisco.com>
> ---
>  recipes-devtools/python/python3_3.%.bbappend       | 1 -
>  recipes-devtools/python/python3_virtualization.inc | 8 --------
>  2 files changed, 9 deletions(-)
>  delete mode 100644 recipes-devtools/python/python3_3.%.bbappend
>  delete mode 100644 recipes-devtools/python/python3_virtualization.inc
> 
> diff --git a/recipes-devtools/python/python3_3.%.bbappend b/recipes-devtools/python/python3_3.%.bbappend
> deleted file mode 100644
> index 617cacc..0000000
> --- a/recipes-devtools/python/python3_3.%.bbappend
> +++ /dev/null
> @@ -1 +0,0 @@
> -require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', '${BPN}_virtualization.inc', '', d)}
> diff --git a/recipes-devtools/python/python3_virtualization.inc b/recipes-devtools/python/python3_virtualization.inc
> deleted file mode 100644
> index 55301c7..0000000
> --- a/recipes-devtools/python/python3_virtualization.inc
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> -
> -DEPENDS += " ncurses"
> -
> -do_compile_prepend() {
> -	export LIBRARY_PATH=${STAGING_DIR_TARGET}/lib
> -}
> -
> -- 
> 2.26.2.Cisco
> 
