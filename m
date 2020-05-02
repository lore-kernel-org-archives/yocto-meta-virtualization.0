Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.6793.1588432207541140975
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 02 May 2020 08:10:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P6N3dsXj;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id 71so10268008qtc.12
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 02 May 2020 08:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9ymp2mbdfsIiNd/OiGiGck7vCLuct95JvgtRRYvefyo=;
        b=P6N3dsXjuAqiCrVi5gVH2zl7GMfhjC6pzmYQGBmEWuTQy6NHeTCd4VLWQiGFMF8HbA
         FVDU0y/WOfEhdieuV8FYlRy6ThEg5WDDRT0kY3UGd3mopQ99zt3qXYfgFFaWVTOXT3fj
         rVvMEz0dISD7mx7cbOo3OAhPa1Qz/CIyMig8Z1xFYiNM/fZG63pf1mzp53+4Hk5pwemB
         PKLKrpsKLASgUQPWKFxfnxCk2p8ewBL3kAoNzdyK0RpYZ+ILjBJCM4P6yrByATDY/SzX
         b1Hv2Av6byOg5bm+CV7J9awbeV04Ve0gTXJuHaBQ/5AvAT87rngYsDpOc6/OW+tzyF0q
         LbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9ymp2mbdfsIiNd/OiGiGck7vCLuct95JvgtRRYvefyo=;
        b=HmFsY943coHiG4LO7GiNPmwkLiY1Cf6XGC0x+3pY8DWPnpk0O0NR/mdEBz6Z7AmS3A
         vYXMoZmHEcTKzHlCit611xUQh/kygi0v+t6aT+6k3vRZZg+BJXzn83ZZLwhKTLFl/no8
         mIllv8LNa0JAkyCzr4Sb3zHhXf2y3AvRFlxoB8NGXLiRUhVPvJkYEkJql6cyXOPB4sS+
         4vkQu+qMMvry1ilnOkB850R6quZPLMSYrDFitKj9DZTvKdJ9hgezoXfWWZPyXv8hufnU
         KMHzKKGH6iMU1A3ZhgUvFkcwHbWoU8xMddsG8mmSx3+9CTSBBlWGtXQpGG5/Gv5mJ/NF
         +a+A==
X-Gm-Message-State: AGi0Puad8gVPZtb+8ZhnNNGf8AKf+j/30L6Du3ccTRP1fRgyU+uICNCc
	IQyNfCkNc9T5roe4+zZWPEg=
X-Google-Smtp-Source: APiQypLFt0oJxCtalRNFFFdcvz5XA/IEOVIGAgMasoc4x61y2X6y6RVt/kVaGBqbt18+G2N0TSLTNQ==
X-Received: by 2002:ac8:1bb8:: with SMTP id z53mr9152359qtj.132.1588432206709;
        Sat, 02 May 2020 08:10:06 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id c68sm5438016qke.121.2020.05.02.08.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 08:10:06 -0700 (PDT)
Date: Sat, 2 May 2020 11:10:04 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][master][PATCH] busybox_vmsep.inc: busybox changes for runx support
Message-ID: <20200502151003.GD9724@gmail.com>
References: <1588393237-11939-1-git-send-email-chandana.kalluri@xilinx.com>
MIME-Version: 1.0
In-Reply-To: <1588393237-11939-1-git-send-email-chandana.kalluri@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][master][PATCH] busybox_vmsep.inc: busybox changes for runx support
on 01/05/2020 Sai Hari Chandana Kalluri wrote:

> Runx needs busybox static binary that contains symlinks to mount.  However, in
> zeus, busybox by default uses BUSYBOX_SPLIT_SUID = 1.  With the variable set,
> busybox binary gets split into two busybox.suid and busybox.nosuid busybox.suid
> contains links to mount while runx recipes pulls in busybox.nosuid.
> 
> When vmsep is enabled, set BUSYBOX_SPLIT_SUID = 0 so that an unstripped busybox
> binary is generated which contains all the required links including mount.
> 
> Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
> ---
>  recipes-core/busybox/busybox_vmsep.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-core/busybox/busybox_vmsep.inc b/recipes-core/busybox/busybox_vmsep.inc
> index b70a065..d4b1e6c 100644
> --- a/recipes-core/busybox/busybox_vmsep.inc
> +++ b/recipes-core/busybox/busybox_vmsep.inc
> @@ -6,3 +6,4 @@ SRC_URI += " \
>  # we do this to get the target binary available to recipes that
>  # depend on busybox
>  SYSROOT_DIRS += "/bin"
> +BUSYBOX_SPLIT_SUID = "0"
> -- 
> 2.7.4
> 
