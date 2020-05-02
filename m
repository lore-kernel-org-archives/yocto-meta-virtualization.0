Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.6770.1588432138897063166
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 02 May 2020 08:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MzmmZB0N;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id c10so1108020qka.4
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 02 May 2020 08:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XeJSlLDUatahvwQNFW/dQTEdPzr1ehaXOD+q210mcFY=;
        b=MzmmZB0NhNtGCDsHxPGe/pDOnjrwBQL4yXCE8dmBB5M1TaTW7/2AxGV2cksXmPhopM
         ND2DvPGYZDnX9Xhd/GCieoTui4sRGw4Z6AhMtZgtiLb7OD0gAtV2Xt016i56b9mKGTNT
         luF5zq7AryemUcOOhGhzdnExB8juOQf8t7QtRViCkWGINcYID2uzFB0Du3f7mHrZLwDd
         AhSnSOKYqrTqFNJagUmngokLYPmuRs3Z44II1+p9APdCjZxWhCGTVRdzHV3wx3IjjsEX
         MjcD1YPoDDXf8m3LkPtCqQNZ1a83ISb5+AqBRXnGpqO+QpAlbVDmxXoFE0leNutfxjMf
         hbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XeJSlLDUatahvwQNFW/dQTEdPzr1ehaXOD+q210mcFY=;
        b=JbbYbftRUAw16YcuDtzgMYArSErqwxRPDMI0UUVALpBwvHhVbYvA4jBsY74SDOq5qz
         ajaWLJwol5F04HMs0mRjaCLbFII73rA9L3EjZVrjG86LXEozLdgVcny++xqHd0MmlWfY
         Edndx54yL44WJRv4yH91j/YyeS2T6cFwWzNQEtH2ixD/2lpOcgqw2ro0LlGccvK/vzOf
         8Hsjv7zmirLChPbK2dvBqZURwCvEbaeHXi6PLUG3kmNscZCXcfVW2nbeJTv3+wQ6CxaC
         kP2fjJU9IUfPpattTBY5UAWrfNNsqG30xu31RyEmLrMxK/loTKSbv3P7ZOAez7ZKhIP/
         1vTw==
X-Gm-Message-State: AGi0PuZHTQPArHAE7fy0plBHjTeyFGnyfDKhbL1Lki02wsEJpP5zmW0f
	QwYjJOvHjAjXguNkjSfII01t1bvl0/4=
X-Google-Smtp-Source: APiQypJ999NaLdhRrM9UmF+/y0iXsgsX/+Ee2qaJdZEO4dkirQQCWWtrD3PvR2BMUWVinONPGc5nZw==
X-Received: by 2002:a05:620a:1396:: with SMTP id k22mr8214281qki.424.1588432138028;
        Sat, 02 May 2020 08:08:58 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id d23sm5214393qkj.26.2020.05.02.08.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 08:08:57 -0700 (PDT)
Date: Sat, 2 May 2020 11:08:55 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][master][PATCH] lxc: Update python3.5 reference to latest python version
Message-ID: <20200502150854.GC9724@gmail.com>
References: <1588308746-14653-1-git-send-email-chandana.kalluri@xilinx.com>
MIME-Version: 1.0
In-Reply-To: <1588308746-14653-1-git-send-email-chandana.kalluri@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged!

Bruce

In message: [meta-virtualization][master][PATCH] lxc: Update python3.5 reference to latest python version
on 30/04/2020 Sai Hari Chandana Kalluri wrote:

> Python3.5 is no longer supported, update references to latest python version
> using variables from python3-dir bbclass
> 
> Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
> ---
>  recipes-containers/lxc/lxc_4.0.2.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-containers/lxc/lxc_4.0.2.bb b/recipes-containers/lxc/lxc_4.0.2.bb
> index bc7f88b..441cf96 100644
> --- a/recipes-containers/lxc/lxc_4.0.2.bb
> +++ b/recipes-containers/lxc/lxc_4.0.2.bb
> @@ -121,8 +121,8 @@ FILES_${PN}-networking += " \
>  
>  CACHED_CONFIGUREVARS += " \
>      ac_cv_path_PYTHON='${STAGING_BINDIR_NATIVE}/python3-native/python3' \
> -    am_cv_python_pyexecdir='${exec_prefix}/${libdir}/python3.5/site-packages' \
> -    am_cv_python_pythondir='${prefix}/${libdir}/python3.5/site-packages' \
> +    am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
> +    am_cv_python_pythondir='${PYTHON_SITEPACKAGES_DIR}' \
>  "
>  
>  do_install_append() {
> -- 
> 2.7.4
> 
