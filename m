Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web08.23108.1604981033231042073
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 20:03:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JMgHuJeQ;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id j31so7712870qtb.8
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Nov 2020 20:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=b7rdBsyqV5woyqhu+LlzgYcp/UV1xzYASMY4uYE+O2Y=;
        b=JMgHuJeQW/ipFl5JQXPHMUT43FG7vt/MZKgR/jwiHiidDvTID8NxiHhLWK2xQY/w7H
         y90NEyZcQHlp00ll6LrCOYdCi3M79UCGNewTN/ZOvkeThAGlmN54tpafNnvO+jNNSgHF
         6txv2/esMiyBKtC7eblI31FaFoyTLJ0/++NBh5FqSvFVecxgVZmOAAwzH+B9dkuiby2A
         JO5+WJF0nkyXdgoypuojJwKkh3mqAPseCEDn0s6C0lzTlLvLNMiF+rrq44zdbuHWEt+G
         Si7P2IaXeBwKJPt+1u09LcrSm/iCiV8eGVPCBaunnl6DhAy77LTu79NoHCdV6ZOZUs0C
         Zi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=b7rdBsyqV5woyqhu+LlzgYcp/UV1xzYASMY4uYE+O2Y=;
        b=iArZPKpyaq68Kn2nXI7fgy1gg/GrE5/T3gz51cxKaovPQ18aj9p7403yi4qcL3B/I2
         xurGoSMlSCkg7PiFJZNzKMHCUUx/J8Zm8bor1sDojsywh22IAJvCrdwnBnIrWgA4BOCs
         nr1seTDyv0LTtGC7BL3mWGgvtdZlfH5r/1MyEKkyNo/5TAH98y6eW6wuNsPmzbDgHKZJ
         k5Yur4jPvooRxgnSKOddTVnH11SRcvQhre5Qd4Cij0LzAecwNJoLua5zocge3Tx4TW8u
         BiZy4fXy+O9AKNEid6THZLZkFR+nj3br3Iotb8Da6SsFdL8JJb2I2ffEppb7my+HboLP
         n8cw==
X-Gm-Message-State: AOAM531gF03T6dfqmmLTb6rOzA0U63iD7wIOGGFy6QK+5Q4oovH3pMMp
	R9tgavK1rB+q0HLw3xHPwgM=
X-Google-Smtp-Source: ABdhPJzmYzbisHDPEZ/9aHun0JhbtVAkMYPUrVHu646JSQeEGSF0m8MUUyhWpEY697mIGCNXhrA5PA==
X-Received: by 2002:a05:622a:18f:: with SMTP id s15mr15805732qtw.160.1604981032169;
        Mon, 09 Nov 2020 20:03:52 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id a1sm1486183qtw.11.2020.11.09.20.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 20:03:50 -0800 (PST)
Date: Mon, 9 Nov 2020 23:03:49 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 1/2] cloud-init: add dependency on systemd to fix installed-vs-shipped QA issue
Message-ID: <20201110040348.GA36914@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201107162437.1786961-2-Martin.Jansa@gmail.com>
 <20201107162437.1786961-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks for the fixups .. most appreciated.

These are now merged.

Bruce


In message: [meta-virtualization][PATCH 1/2] cloud-init: add dependency on systemd to fix installed-vs-shipped QA issue
on 07/11/2020 Martin Jansa wrote:

> * without systemd in RSS, setup.py will fail to call:
>   "pkg-config systemd --variable=systemdsystemunitdir"
>   and then clound-init might fail with:
>   ERROR: cloud-init-20.3-r0 do_package: QA Issue: cloud-init: Files/directories were installed but not shipped in any package:
>     /lib/systemd
>     /lib/systemd/system-generators
>     /lib/systemd/system
>     /lib/systemd/system-generators/cloud-init-generator
>     /lib/systemd/system/cloud-final.service
>     /lib/systemd/system/cloud-init.service
>     /lib/systemd/system/cloud-config.target
>     /lib/systemd/system/cloud-init.target
>     /lib/systemd/system/cloud-init-local.service
>     /lib/systemd/system/cloud-config.service
>   Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
>   cloud-init: 10 installed and not shipped files. [installed-vs-shipped]
> 
>   when systemd on host or in the systemd fallback uses
>   different systemdsystemunitdir value than what OE packages with:
>   FILES_${PN}-systemd += "${systemd_unitdir}/*"
> 
>   setup.py fallback:
>   def pkg_config_read(library, var):
>     fallbacks = {
>         'systemd': {
>             'systemdsystemunitdir': '/lib/systemd/system',
>             'systemdsystemgeneratordir': '/lib/systemd/system-generators',
>         }
>     }
>     ..
> 
>   ubuntu:
>   meta-virtualization$ pkg-config systemd --variable=systemdsystemunitdir
>   /lib/systemd/system
> 
>   OE (with usrmerge in DISTRO_FEATURES):
>   cloud-init/20.3-r0$ pkg-config systemd --variable=systemdsystemunitdir
>   /usr/lib/systemd/system
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-extended/cloud-init/cloud-init_20.3.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/recipes-extended/cloud-init/cloud-init_20.3.bb b/recipes-extended/cloud-init/cloud-init_20.3.bb
> index 31b4066..53d71a6 100644
> --- a/recipes-extended/cloud-init/cloud-init_20.3.bb
> +++ b/recipes-extended/cloud-init/cloud-init_20.3.bb
> @@ -25,6 +25,9 @@ inherit setuptools3
>  inherit update-rc.d
>  inherit systemd
>  
> +# setup.py calls "pkg-config systemd --variable=systemdsystemunitdir" and needs to find our systemd
> +DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
> +
>  inherit python3native
>  
>  PACKAGES += "${PN}-systemd"
> -- 
> 2.27.0
> 

> 
> 
> 


