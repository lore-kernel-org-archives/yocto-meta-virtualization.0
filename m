Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.34947.1597627230017778674
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 16 Aug 2020 18:20:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZWrYi/Rg;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id 6so11337443qtt.0
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 16 Aug 2020 18:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0lVTHJclYqzr2Ckw+qF5ubSXHLdBSFSCMwNV8dsmHY4=;
        b=ZWrYi/Rg4xpxTIrFyYig9d7R7gOhwc7mZ2eIiTn9wUyeHbxuE6s1xco0oeaLa0jMwG
         hYsUoOmemGM4x66SmK8tjGplaS107MjJbUbypm9elEn3PpHWeRTaLl3+Qjs1V5z3jyx5
         XcrqoeuM/TOHMFhwFglsqw3XgXav8T7Mj/1mBI/+LAjc0dmhmB1GodzlUW/m76BoUqzK
         HRcPE70rouMWRQxQvl+yyJlybm4ng6cOnK4rk8THqxha0hMO/jdzry+jNyySu2wiSqau
         KybsPlAUnTtQSxtTZoC488alFmak0/g0PQNImhYRWvprYrw8LlvQuPqVkIGvLVHDkVyQ
         Hkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0lVTHJclYqzr2Ckw+qF5ubSXHLdBSFSCMwNV8dsmHY4=;
        b=ueIqn4xbFGimGrqFLZMf8x9U6uTMtXaPJ0eFJG0PlGMFQl1xvNLHWAMOwiOI7J3DNj
         dL90gUsBSDObfsHtwypbrtn0tXGAIiVmnbeLgaX5H/ektP0c+4qY/kUzBLTls08uCPrd
         Wr2hlPMW/rj4ETjdmaSV/TVQFA+aR11AQK0YdjkGJnF8ZPFxidbG7zYmzA1td5JJnUNj
         UShIPTezbk3WNM9AnVbjxvnpfcDSmbajblti5VHpJUUW5J8/vd83YgXJk2nJXNofkdkH
         3gVZN90gO2DYoNuAfJAmGTOHGAR7vR5bMAGWWSnOykNSRsruITw7AGNOlFXQ9WF8BMeT
         an5Q==
X-Gm-Message-State: AOAM533NqcTr3mY84pat1w+/HaCEEi0IUMYFZj+CqCy5PbTBclRTTiZB
	61mXmFXNIP9cV9OElCWu6a4=
X-Google-Smtp-Source: ABdhPJwiOHQh8mUPLITsx4jAKgcndvt4GJ8gzz50CLHptsHoK55DZooELQnq52Qs3R2/fserzVEDFQ==
X-Received: by 2002:aed:2f02:: with SMTP id l2mr11745751qtd.48.1597627229134;
        Sun, 16 Aug 2020 18:20:29 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id p202sm15409497qke.97.2020.08.16.18.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2020 18:20:28 -0700 (PDT)
Date: Sun, 16 Aug 2020 21:20:26 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: sakib.sajal@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] ceph: fix do_compile error: 'sys_siglist' was not declared
Message-ID: <20200817012025.GB12996@gmail.com>
References: <20200814154528.18891-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20200814154528.18891-1-sakib.sajal@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce


In message: [meta-virtualization][PATCH] ceph: fix do_compile error: 'sys_siglist' was not declared
on 14/08/2020 sakib.sajal@windriver.com wrote:

> glibc 2.32 has deprecated sys_siglist, oe-core commit
> 7c19f30849e9a73a7497d8e6c4719a2e57017086, causing ceph
> build to fail with error:
> 
> ceph-15.2.0/src/global/signal_handler.h:24:26: error: 'sys_siglist' was
> not declared
> 
> ceph has support for using reentrant strsignal, hence use it.
> See commit 82c40b67f5843162a93ebb2c1a006572d8f256a5 in upstream ceph.
> 
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  recipes-extended/ceph/ceph_15.2.0.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-extended/ceph/ceph_15.2.0.bb b/recipes-extended/ceph/ceph_15.2.0.bb
> index 9423faa..223a74e 100644
> --- a/recipes-extended/ceph/ceph_15.2.0.bb
> +++ b/recipes-extended/ceph/ceph_15.2.0.bb
> @@ -73,6 +73,7 @@ EXTRA_OECMAKE = "-DWITH_MANPAGE=OFF \
>                   -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3 \
>                   -DPython3_EXECUTABLE=${PYTHON} \
>                   -DWITH_RADOSGW_KAFKA_ENDPOINT=OFF \
> +                 -DWITH_REENTRANT_STRSIGNAL=ON \
>  "
>  
>  export STAGING_DIR_HOST
> -- 
> 2.26.2
> 

> 

