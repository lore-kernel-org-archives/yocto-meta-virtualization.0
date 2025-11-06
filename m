Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B1C1CCF9F8
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 04:37:03 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7711.1762403813251801751
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 05 Nov 2025 20:36:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lvcBzmoI;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-891208f6185so55385685a.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 05 Nov 2025 20:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762403812; x=1763008612; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XcZAgbAw4eX/BD8ezs0micOa08hTPzEDlN6nkUmwyBU=;
        b=lvcBzmoIwgVKUwh6acG3oRY6RqJZiLzPnTxRyeFbZS5DYRj6KDMkiDIn/3OSEnEzJi
         XktUyD3T9vym+QvdQ+49OzwlXTmZm3JQj3VEF6Q94skz4LlIVS0L0gJ/czvs68cAUS/U
         R8ctvpe+303FVXHlUeGMR7Noud08Dx7FE05xYiK4r74tnPyYfgdwoRb9bLwFox5Tpv47
         phxIjdbzh378MM7V03ajD8vS1TXQm+u/Ap7FJ3/3ePw3QUasjjNdBDliGbax5+AmVqY9
         Da6fnD0sXgSga3njiDxparHhkzFf9zDSUNiGYjNLycKFxH925tDRKMG5unHqKlKKUqnQ
         H9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762403812; x=1763008612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcZAgbAw4eX/BD8ezs0micOa08hTPzEDlN6nkUmwyBU=;
        b=h05F1rbb/oCqDX2EsIEcB/0ULVGYjtqGwiuF8rzeEo59Jewehjl8GNkazcS0/PnL3s
         lGpSUR31rhf47vjFTMp2I06fglVTgQ1ZJKh/PF13RILAFswxfO8dYDlEkl+ouiEEnaST
         ICgH27dIcZB5svxrMYJfYALlFbeEalLkXPdHIVDIHRskJ1xBvp0My1qHxeb2MTvwVfLJ
         vX5wyhvaSSSPQ1Pd5rpHgrMKsLzznp5CAM00anKRkzeTAiB7LpawU1TOHGg58mcd9VNN
         zB+TLyNCw8hp41LewB6/BB9JtEn71HOc7bzO/FznHy3AundEw9XYo86ThyjuRY616uvs
         3MSA==
X-Gm-Message-State: AOJu0YwQUrMRIZO2DYw6nqulN2ZbWmGA05vbZYmyOQB3mewC9JJIHGwz
	VGH+BkE6yOTtoWivo/jZonHSTbiGqiun2LLydcQwoEkFWKWKVEUikEwQAmKLKB+A
X-Gm-Gg: ASbGnctfo9wyNztKtxOUC5Fv7Zt09h+6V27SqMGDXq//NBuRvsc7drz2D8fi1amkwwd
	LcXKjXt613RGhe6qMhiAcJZEMEQfvh61uWwqIBeHFWM0JkGrLgO1rej1jZfY9m3havUeiDbqcwX
	HfQL2aID/+OIPl845KClGv/Dyh4spuidFyAvcRbbVsM/RSJE6BtBDODHJAagXU13P8LvI8iJ5AS
	GTRs7sT2UwH1DN5sCju+EOe/EVcYk9iPr0GOr7UgrY7Gxf11oGtqlVXafLHOZKdQnwY3nNcUlji
	Y/IRFjq/clTNtm3mE9aAvfs2NbE2Lt2sQHNgM0HNVo4kaIQaVsDNPgC/YIT2Nsf8kt39Y7oT7xU
	7R/GpKntH8bEgvCDW4rShHHfdl70ecycGLNT7qD7YlewbwZx4k/1WWFdcGZf30Hxmj9LIv7JcYr
	YgBACs98vXV8zEAvd5amJnS+5KBdo1xEyNYogAC93AOaKjbTJ0yoTPjA==
X-Google-Smtp-Source: AGHT+IH7qkbwEUBYDdafltNQriSIYeET1fd9gBgq9UlXuvcC7wUxz/ffQExLUHISqz4IFeUKECGXvA==
X-Received: by 2002:a05:620a:3711:b0:892:25d5:2ec with SMTP id af79cd13be357-8b220adba1bmr760569585a.27.1762403812002;
        Wed, 05 Nov 2025 20:36:52 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2355e56c0sm123191685a.14.2025.11.05.20.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 20:36:51 -0800 (PST)
Date: Wed, 5 Nov 2025 23:36:49 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: tom.hochstein@oss.nxp.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] libvirt: Fix missing libvirt-python
Message-ID: <aQwl4Wli3oqH6ZgV@gmail.com>
References: <20251105201525.288881-1-tom.hochstein@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105201525.288881-1-tom.hochstein@oss.nxp.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Nov 2025 04:37:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9427

In message: [meta-virtualization][PATCH] libvirt: Fix missing libvirt-python
on 05/11/2025 Tom Hochstein via lists.yoctoproject.org wrote:

> From: Tom Hochstein <tom.hochstein@oss.nxp.com>
> 
> The do_rootfs task for an image that includes libvirt-python fails.
> ```
>   - nothing provides libvirt-python needed by packagegroup-fsl-virtualization-1.0-r0.ls1012afrwy from oe-repo
> ```
> 
> The log shows that the do_compile:append() from libvirt-python.inc is
> failing but not reporting the failure.
> ```
> 174: cd: can't cd to /.../libvirt/v11.8.0+git/sources/libvirt-v11.8.0+git/libvirt-python-11.8.0
> ```
> 
> The root cause is the archive folder format is changed from
> libvirt-python-VERSION to libvirt_python-VERSION, but the do_compile
> and do_install tasks are hard-coded to the old format.

Indeed. I did change it for the main package but missed it here.

> 
> Fix the root cause by encoding the archive folder name in a common
> variable. Also, fix the build and install commands so the cd failure is
> not ignored.
> 
> Fixes: 389df3b77e

Drop this fixes line. It doesn't fix that commit, it completes
that update for the python part of libvirt.

> Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
> ---
>  recipes-extended/libvirt/libvirt-python.inc | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
> index c430ffe5..0a99296a 100644
> --- a/recipes-extended/libvirt/libvirt-python.inc
> +++ b/recipes-extended/libvirt/libvirt-python.inc
> @@ -18,8 +18,8 @@ FILES:${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
>  # Currently the libvirt-python debug libraries contain buildpaths
>  INSANE_SKIP:${PN}-dbg += "buildpaths"
>  
> -SRC_URI += "http://libvirt.org/sources/python/${BPN}_python-${LIBVIRT_VERSION}.tar.gz;name=libvirt_python;subdir=${BP}"
> -
> +SRC_URI += "http://libvirt.org/sources/python/${LIBVIRT_PYTHON_ARCHIVE_NAME}.tar.gz;name=libvirt_python;subdir=${BP}"
> +LIBVIRT_PYTHON_ARCHIVE_NAME = "${BPN}_python-${LIBVIRT_VERSION}"
>  SRC_URI[libvirt_python.sha256sum] = "5d80e13e0cfb96dd254d765ee60e77e5f9b6925172540056cec0aa0e6f0ca83c"
>  
>  export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
> @@ -46,8 +46,8 @@ do_compile:append() {
>  		# the syroot staged pkgconfig entries. So we clear the sysroot
>  		# for just this portion.
>  		export PKG_CONFIG_SYSROOT_DIR=
> -		cd ${UNPACKDIR}/${BP}/${BPN}-python-${LIBVIRT_VERSION} && \
> -		  ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py build
> +		cd ${UNPACKDIR}/${BP}/${LIBVIRT_PYTHON_ARCHIVE_NAME}
> +		${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py build

If the cd in it's own command fails, so should have the one in
the &&

If one is failing and the other isn't when the directory doesn't
exist, something strange is up with set -e in the routines, or
am I not seeing something that change more than the new variable
and the removal of the && ?

Bruce

>  		cd -
>  	fi
>  }
> @@ -58,9 +58,9 @@ do_install:append() {
>  		# the syroot staged pkgconfig entries. So we clear the sysroot
>  		# for just this portion.
>  		export PKG_CONFIG_SYSROOT_DIR=
> -		cd ${UNPACKDIR}/${BP}/${BPN}-python-${LIBVIRT_VERSION} && \
> -		  ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py install \
> -                       --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${LIBVIRT_INSTALL_ARGS}
> +		cd ${UNPACKDIR}/${BP}/${LIBVIRT_PYTHON_ARCHIVE_NAME}
> +		${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py install \
> +			--install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${LIBVIRT_INSTALL_ARGS}
>  		cd -
>  	fi
>  }
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9426): https://lists.yoctoproject.org/g/meta-virtualization/message/9426
> Mute This Topic: https://lists.yoctoproject.org/mt/116141416/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


