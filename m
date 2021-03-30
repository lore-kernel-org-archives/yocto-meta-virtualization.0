Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web09.4927.1617136957049515912
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 30 Mar 2021 13:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PjlCFJB+;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id j7so12927366qtx.5
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Mar 2021 13:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=F4lXBTVF7SDwts50LU4W4pObTZ+6SV93XGy5BRoHNaE=;
        b=PjlCFJB+9t+rcOqO4w1dsp/AvaYPp+OuVfnNDDpJOixo+87/R61w0I5bNONomjROSh
         IRtg0GWETf52Vagv49rbvVmjII7AbZXuFKs61q0RB/Byt9VqWlbf6IZdH4X1oPuRyu8E
         FKZjJf8PfKEm4C0xYA16uOZSfwvG+MoJ/9yk3n7l9HCJf5cKN0/3Qf9gbEanFxsqjp1D
         H6gbvCJc/ZEQv2HAinUMynX2KMh1OjFI7YgfSOnQUuhRIc/O6ig4sN9JyYxsVFACRHHV
         dw4puESQk8Q9Ro5UWBqBBZJldGcll82E6Btpxe3bYpO2UPZXDBRwscFzDcVQv3Dk6Bp1
         BqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=F4lXBTVF7SDwts50LU4W4pObTZ+6SV93XGy5BRoHNaE=;
        b=LtIgnKlIHftkaQERJgrUpWu53Z202WRxmJZIYALGDy7chWYQGI27/NOFe1ewjO+ljF
         mSYWQmgpzs+tSq5PHNIYFPqcX2slHhjkc4eS5GHtHJbwFL6tDH4qEp+UVe7bLculieVb
         cr8s3uLtEJusi1cv9lPRUwA5LXlaMDxedpyHjiLKGrYYwXdauCIVM7zIV9UdENFzqLee
         g/aiwO0TMu+47P6Wzg03HUJzPYkVac3P/sgLH/yK3xYpx0+HckYMTLlV8ekF09oNlo90
         YGh5Zk+UMA49gHfcq4UO6RSa7aFwGFW0FqdTj99qqdiemPSeZlqw58MKXJPIFy0qOItX
         Oatg==
X-Gm-Message-State: AOAM530e/od5Rlh4o7gVLvfuF9pN2iJ+3nIlxEmLGsKKO4YL2oHt5IWL
	KfbS40N8L4yZXfgUfC34xb4=
X-Google-Smtp-Source: ABdhPJxUP5dtWqLp5BARpW3ICuJ6GFNEwsXK5KpUOo6u06LSffeAW7h3aV9LZ4ZemxZZftHEmMQ46w==
X-Received: by 2002:ac8:7a95:: with SMTP id x21mr29047950qtr.209.1617136954822;
        Tue, 30 Mar 2021 13:42:34 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id y9sm16105375qkm.19.2021.03.30.13.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 13:42:34 -0700 (PDT)
Date: Tue, 30 Mar 2021 16:42:32 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: qiang.zhang@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [PATCH] libvmi: uprev from 0.12 to 0.14
Message-ID: <20210330204230.GA12428@gmail.com>
References: <20210322014148.35609-1-qiang.zhang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20210322014148.35609-1-qiang.zhang@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [PATCH] libvmi: uprev from 0.12 to 0.14
on 22/03/2021 qiang.zhang@windriver.com wrote:

> From: Zqiang <qiang.zhang@windriver.com>
> 
> Bump version to 0.14.
> This upgrade is mainly to fix some BUG.
> 
> Signed-off-by: Zqiang <qiang.zhang@windriver.com>
> ---
>  recipes-extended/libvmi/libvmi_git.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/libvmi/libvmi_git.bb b/recipes-extended/libvmi/libvmi_git.bb
> index 88fa5d30..b8e35669 100644
> --- a/recipes-extended/libvmi/libvmi_git.bb
> +++ b/recipes-extended/libvmi/libvmi_git.bb
> @@ -11,7 +11,7 @@ DEPENDS = "libvirt libcheck bison fuse byacc-native"
>  SRC_URI = "git://github.com/libvmi/libvmi.git \
>  "
>  
> -SRCREV = "6934e8a4758018983ec53ec791dd14a7d6ac31a9"
> +SRCREV = "e8c2061d11c42e5868cbf48229f59b5e7071395a"
>  
>  S = "${WORKDIR}/git"
>  
> @@ -29,6 +29,7 @@ FILES_${PN}-dev = "${includedir} ${libdir}/${BPN}.so ${libdir}/*.la \
>  
>  PACKAGECONFIG ??= "json-c"
>  PACKAGECONFIG[xen] = "--enable-xen,--disable-xen,xen,"
> +PACKAGECONFIG[kvm] = "--disable-kvm-legacy,--enable-kvm-legacy,kvm,"
>  PACKAGECONFIG[json-c] = ",,json-c,"
>  
>  # We include a sample conf file to which we have added
> -- 
> 2.17.1
> 
