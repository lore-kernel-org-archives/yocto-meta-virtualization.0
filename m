Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.5736.1625370127869043007
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 03 Jul 2021 20:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ovvu4XEC;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id h18so6805247qve.1
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 03 Jul 2021 20:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4yGd4vzy+ZAPbmyEi2O876ALp0jFvwV0cYRcxLncNBk=;
        b=ovvu4XECMHbPyyrlSK4zCIVJ7UM0xetU6lmGG5OvfBRvF3VhfS4TovlWtWniElyg7X
         w0HuQhGEpMrPATxVEhCHO9n/a+AfwgaUVlP4+PV+9DaB/xjK6tdsDiTugqUMSyFAK4O8
         bARjGHz5O89ATfqedj9lvLs6bWKI6zOwFAyY3SnCjeBoCLGWUbBDlbyUy/iR4LY1wR/5
         0Rw7f8OvAGVgXdz30uBmv+vF47+9tOx+Tm03bka9LYRADAUa4YVCHgsHx4XYjONku7+h
         VdgYDrL3t1m0N40hU540mIKRXGWwJ+QceMGYMOdtKibTytStJXcpfSBQMTtm9Fo7TyJE
         IruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4yGd4vzy+ZAPbmyEi2O876ALp0jFvwV0cYRcxLncNBk=;
        b=Ko6BOBoXjZ64NK1htSoDCc4NrMb7yU0pUWg62iOT4GDoZ8EsCb3Oa66LbHjeu67RhK
         xdNBiS2FNZBh9oLr1CC6bsV6gpO/J1wN2NYolANzxvV1fNDIUYHDCh4zHkXolzo3was/
         ZDSTGjxDbQit72unYzjFlgyk3SG7e80vFGywlCNwupB8V+aKpObbeAu6VxM6070ui4Kn
         30wKebbJNpeHU1qPI523QhujIY4NYNBq9OBbjCavQLCbLk92Zip1MMnztm7akcM4WH4Q
         giFuX3M34S4XhIVqpegLIB9gkS0PX+xGeHWso+zXg6HQdXZQ2VHLMPs83pSw7svwRLa3
         LhdA==
X-Gm-Message-State: AOAM530gLR30nb5vrKIRECozx71b4l8Kgv0NcQnL1Y5s0I+4mnypx+SA
	FqgQu20HKjx0wAdgg+Bwbps=
X-Google-Smtp-Source: ABdhPJxcLJ/n3hflAmAChAc1KiCPFYxfmObwdkzM6JY+CAlCTpTvPYjVIAaFiXlbsw9lrRK0Wq3kpg==
X-Received: by 2002:ad4:4b6d:: with SMTP id m13mr2749803qvx.20.1625370126721;
        Sat, 03 Jul 2021 20:42:06 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id y14sm948816qtn.81.2021.07.03.20.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jul 2021 20:42:06 -0700 (PDT)
Date: Sat, 3 Jul 2021 23:42:04 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] podman-compose: remove pypi inherit to fix do_fetch
Message-ID: <20210704034202.GA32345@gmail.com>
References: <20210702095942.1303820-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210702095942.1303820-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: [meta-virtualization][PATCH] podman-compose: remove pypi inherit to fix do_fetch
on 02/07/2021 Martin Jansa wrote:

> * now when pypi uses SRC_URI_prepend since:
>   https://git.openembedded.org/openembedded-core/commit/?id=8f17b8bce85efb0e9a7e15d0b98a5cf7b6bd9750
>   both entries end in SRC_URI (because of delayed nature of prepend):
>   https://files.pythonhosted.org/packages/source/p/podman-compose/podman-compose-0.1.5.tar.gz
>   git://github.com/containers/podman-compose.git
> 
>   causing:
>   ERROR: podman-compose-0.1.5-r0 do_fetch: No checksum specified for '/OE/build/oe-core/downloads/podman-compose-0.1.5.tar.gz', please add at least one to the recipe:
>   SRC_URI[sha256sum] = "fb229362f188980ea3fbdee2a25d0a2dd6a0b886d925d5213e22e09f1062ebe9"
>   ERROR: podman-compose-0.1.5-r0 do_fetch: Fetcher failure for URL: 'https://files.pythonhosted.org/packages/source/p/podman-compose/podman-compose-0.1.5.tar.gz'. Missing SRC_URI checksum
>   ERROR: Logfile of failure stored in: /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/podman-compose/0.1.5-r0/temp/log.do_fetch.55855
> 
>   drop pypi inherit to restore the previous SRC_URI with just the git:// entry.

Thanks for the fixup.

This is now merged.

Bruce

> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-containers/podman-compose/podman-compose_0.1.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/podman-compose/podman-compose_0.1.5.bb b/recipes-containers/podman-compose/podman-compose_0.1.5.bb
> index bf91705..1b91a92 100644
> --- a/recipes-containers/podman-compose/podman-compose_0.1.5.bb
> +++ b/recipes-containers/podman-compose/podman-compose_0.1.5.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "An implementation of docker-compose with podman backend"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  
> -inherit setuptools3 pypi
> +inherit setuptools3
>  
>  SRC_URI = "git://github.com/containers/podman-compose.git;branch=devel"
>  
> -- 
> 2.30.2
> 

> 
> 
> 

