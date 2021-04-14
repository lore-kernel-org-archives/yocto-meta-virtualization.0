Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web09.7716.1618368597519140917
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 19:49:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EfnraUs4;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id o2so1031972qtr.4
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 13 Apr 2021 19:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=4FQUlWyc2tOkxSdqHx46naoAxmCUcyK+RvBOi4okQco=;
        b=EfnraUs4JjkBydbxdGcoMy+Kh5V1KaJqqXKXji3mpC4mZJ7g8xq8Zprr59aj5PDfEH
         gPw6UCUsdARQzpTrwH85U/ZgKSQAM7WpCKy3/kQcwY85Y181ZnUkxLS3aMviJtyTImFQ
         yCjTn9kWhN2zZ4LKb0QNhupMILawMdTvQQ69A0EW7eHmOKQeJaDSBsIKJxlirPsZeuN2
         3pqo3U8rr+Uj/tFZ4hbFE4y01oKi/vh7GAAY1bWymCcBJRfjs3ZL1f/woDLCCa3a4D05
         BVuc5YTnzfce1PNc8Ufce1ZMc/Rl+ZOhbRQAf0699APq9V4cvORBVOfEYQb/PZqBOIyW
         fOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4FQUlWyc2tOkxSdqHx46naoAxmCUcyK+RvBOi4okQco=;
        b=PKghSwYwqqLPa8lSIQAtfjEFGTDbr8BzWalYitEGdhhqxEerB5l4/tB70kiQhKznRu
         vQ1fvOVK/wsuSrVrww/gmGmQm00UEPbjW2L1zIrQLJiP79/wpfzM9/bbMzI8AZIkXjDL
         2qW1k+0eo9lVcXmGjuwEGMBYdOanMXB0gwjN2UADJ65YGaA5h3ykIGGA25tezbwElvEy
         dEJiiGrB8R9FfGunjDZszgchyKpSF/CgV3qzXKmGQZ7+hFMq7zpvP47fbQfaHv8sdwGb
         quYk2czbCF6PkWqRTVjthL5pjoXnpgnzO31YtCdPN7EAX7Vev/faz9wFRJTgtEZIjFVq
         QCpQ==
X-Gm-Message-State: AOAM532hPDX5SD29mzAeyTIopFjzr2zfKSX575ty/ZiIqEOwmy2vv1MA
	O6PfqOPh/Ym+mmrCPH25q/M=
X-Google-Smtp-Source: ABdhPJyOL953zt6Ir2PukiX87t4MGPR+w9Mg7YS7v9TMNJTmgp5S8TlIbHFFBZmhc3FOm9/qiRI+eg==
X-Received: by 2002:ac8:5651:: with SMTP id 17mr6100650qtt.361.1618368596581;
        Tue, 13 Apr 2021 19:49:56 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id f16sm4474571qkl.25.2021.04.13.19.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 19:49:56 -0700 (PDT)
Date: Tue, 13 Apr 2021 22:49:54 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 1/5] python3-paramiko: Upgrade 2.7.0 -> 2.7.2
Message-ID: <20210414024952.GA28158@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210409163104.26711-4-leon.anavi@konsulko.com>
 <20210409163104.26711-2-leon.anavi@konsulko.com>
 <20210409163104.26711-5-leon.anavi@konsulko.com>
 <20210409163104.26711-3-leon.anavi@konsulko.com>
 <20210409163104.26711-1-leon.anavi@konsulko.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][PATCH 1/5] python3-paramiko: Upgrade 2.7.0 -> 2.7.2
on 09/04/2021 Leon Anavi wrote:

> Upgrade to release 2.7.2:
> 
> - Update our CI to catch issues with sdist generation,
>   installation and testing.
> - Add missing test suite fixtures directory to MANIFEST.in,
>   reinstating the ability to run Paramiko's tests from an sdist
>   tarball.
> - Remove leading whitespace from OpenSSH RSA test suite static
>   key fixture, to conform better to spec.
> - Fix incorrect string formatting causing unhelpful error message
>   annotation when using Kerberos/GSSAPI.
> - Fix incorrectly swapped order of p and q numbers when loading
>   OpenSSH-format RSA private keys. At minimum this should address
>   a slowdown when using such keys, and it also means Paramiko
>   works with Cryptography 3.1 and above (which complains
>   strenuously when this problem appears).
> 
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../{python3-paramiko_2.7.0.bb => python3-paramiko_2.7.2.bb}   | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>  rename recipes-devtools/python/{python3-paramiko_2.7.0.bb => python3-paramiko_2.7.2.bb} (70%)
> 
> diff --git a/recipes-devtools/python/python3-paramiko_2.7.0.bb b/recipes-devtools/python/python3-paramiko_2.7.2.bb
> similarity index 70%
> rename from recipes-devtools/python/python3-paramiko_2.7.0.bb
> rename to recipes-devtools/python/python3-paramiko_2.7.2.bb
> index d03702c..3d05efb 100644
> --- a/recipes-devtools/python/python3-paramiko_2.7.0.bb
> +++ b/recipes-devtools/python/python3-paramiko_2.7.2.bb
> @@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
>  
>  inherit pypi setuptools3
>  
> -SRC_URI[md5sum] = "b130f3e1c3442d21c1a0c9ae17776f4e"
> -SRC_URI[sha256sum] = "fba9c46340e3d690ad5a9d0dbf06677cd91425de3afa7e9c0c187298ee4ddd0d"
> +SRC_URI[sha256sum] = "7f36f4ba2c0d81d219f4595e35f70d56cc94f9ac40a6acdf51d6ca210ce65035"
>  
>  RDEPENDS_${PN} += " \
>      python3-bcrypt \
> -- 
> 2.17.1
> 

> 
> 
> 


