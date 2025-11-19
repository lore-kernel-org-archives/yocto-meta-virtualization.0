Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2230ACF648D
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 23:23:52 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20775.1763594624238152326
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 15:23:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=doUKikZH;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8b2ea2b9631so25911985a.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Nov 2025 15:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763594623; x=1764199423; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3xXS832b0rQedjHASD20PpK3ndGvsYlWqHb+6Gkvlzw=;
        b=doUKikZHSj1Cj7bVVQc+pvREoOIrg6aqNocHC/mGLlhwO9Ay+QL8YUbQUpY6RCgh6p
         4qfqT4oaXv2aDOEfCS6ths+NYltBlbC/h1wP6aTmPxpM/4c4NpFN1Ubi/kHPXlmNl00l
         rvlwfXskPvvSMdmUzoD11WA6k+RV/9PBXxxonFRry3ynw13S95dpA6pc0DQdSdwvQqUk
         Rlf3ikgqTs7UOgreSDqvTLJiX216VpyY0nG+w1Z+0BLiZjjHxp8eCkVl8jNJS5sc0cOR
         CVXHD9JvRypUqnm7METfIrBuXI39sR+Mx1zCk7KT5sj34vvsvIeOQHz7L/MdH2UVnZal
         AnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763594623; x=1764199423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3xXS832b0rQedjHASD20PpK3ndGvsYlWqHb+6Gkvlzw=;
        b=aULSlEsFgpwbneVh7yoEsS+wgR9irEwlTtR5wJGfhu6ylbE5i1ElROBA8k5nXIwXPv
         RQxz2J027KA00fTclVzdUr4M9r8cbNW0dUUKjMfCgKw3BSW8YOiFd8DkLC6YnFwx4cED
         SEKDezcjFb4JR25OqM2peXRKu4VCFQuKdZHHSEhE/AOrNdNUFKbhyQo05xXYV8OUdgMd
         U7XEltRCJYFgeZaJpFHi6Pl+CoD0jB48hDSrRa4thipNuT2hxLxGKYBCFLsq4Zlc8WpC
         6dxMqPQAtvzk0pgwm+qNeDPOvYA7QVeLjLVeC026fzvrFJsveRiAiWI88fpaj4pAmywr
         hiRQ==
X-Gm-Message-State: AOJu0Yz1UGiP2lxfB02bM9aLU3eZTlm2AJ+2d3c+9PDl8Q5PE46ybrkc
	LxeFBoVH16KeoUAFjXErSlHMIJz5Qt8b7ZSeGR3QAvmO4ePRKumanyJgUpZV0ODE
X-Gm-Gg: ASbGncsEnyngBpfi0vC3pv9scnPwZVsxcyrMH8/L9xpTSjm7EQopr3vbuYrYxS3lD6i
	6Wbq2sk4BO/IRAAU0IymHKFslTZMGOssKb29sZdt8b1ZZMqpCf5YoRKjCsg9yvA/UmIp2iPG8lK
	AjTSej58YlJCuX2vZFxDcYFcoLNekb7ZyC5xdKFHtTl8mtf7Dvf1AFazkisKVHr4zmJ6yfUS2gD
	jzRbcH4y7kkubSvv9Lv5jITAevnzhNXVY9EEB4aE8OzYb0GOXU0G01wVZ9LTZM2SqJOG0+9rcRL
	04Z5I07v8mPZaV/yK7CkHmgf5iWZFYL8uJpuELfLJjZpYtDKwpMIoWCt3ueRBPgHeQGkW1mctjR
	KTaT2zNqUYpxqkWzLO9Kx7qt57SL/vI1gcJypfZf8Er0ogMoHGEgEuwXT9oItnxtQ3F1V8qOf2e
	DFDjiK37nDcVrLzboE+UEG3f3Q/7UL2OwF6zBTwRAVOu9KhSprZHVrNVtHDq/vBcrYCvHKmpmyt
	+w=
X-Google-Smtp-Source: AGHT+IH+R6YO3vM4obeXNNq3rI39KVNeSdHvfBBuS1rpHFzF3bvig8/s27YrocKkZ/F1RiBlhWbO/A==
X-Received: by 2002:a05:620a:410a:b0:88e:6f4:2160 with SMTP id af79cd13be357-8b327311233mr177867885a.12.1763594623058;
        Wed, 19 Nov 2025 15:23:43 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b32932d9ecsm45905085a.3.2025.11.19.15.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 15:23:42 -0800 (PST)
Date: Wed, 19 Nov 2025 18:23:40 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: tom.hochstein@oss.nxp.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH v3] libvirt: Fix missing
 libvirt-python
Message-ID: <aR5RfHEVSHzA0kaX@gmail.com>
References: <20251106161130.1562976-1-tom.hochstein@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106161130.1562976-1-tom.hochstein@oss.nxp.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Nov 2025 23:23:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9444

Sorry for the delay, I've been really focused on some larger container
stack runtime issues that have been consuming all my time.

I've merged this to master-next.

Bruce

In message: [meta-virtualization][PATCH v3] libvirt: Fix missing libvirt-python
on 06/11/2025 Tom Hochstein via lists.yoctoproject.org wrote:

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
> 
> Fix the root cause by encoding the archive folder name in a common
> variable. Also, fix the build and install commands so the cd failure is
> not ignored.
> 
> Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
> ---
>  recipes-extended/libvirt/libvirt-python.inc | 22 ++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
> index c430ffe5..b8c8656b 100644
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
> @@ -46,8 +46,12 @@ do_compile:append() {
>  		# the syroot staged pkgconfig entries. So we clear the sysroot
>  		# for just this portion.
>  		export PKG_CONFIG_SYSROOT_DIR=
> -		cd ${UNPACKDIR}/${BP}/${BPN}-python-${LIBVIRT_VERSION} && \
> -		  ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py build
> +		src=${UNPACKDIR}/${BP}/${LIBVIRT_PYTHON_ARCHIVE_NAME}
> +		if [ ! -d $src ]; then
> +			bbfatal "Python source not found at expected location \"$src\". Please check that this task logic and SRC_URI are consistent."
> +		fi
> +		cd $src
> +		${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py build
>  		cd -
>  	fi
>  }
> @@ -58,9 +62,13 @@ do_install:append() {
>  		# the syroot staged pkgconfig entries. So we clear the sysroot
>  		# for just this portion.
>  		export PKG_CONFIG_SYSROOT_DIR=
> -		cd ${UNPACKDIR}/${BP}/${BPN}-python-${LIBVIRT_VERSION} && \
> -		  ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py install \
> -                       --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${LIBVIRT_INSTALL_ARGS}
> +		src=${UNPACKDIR}/${BP}/${LIBVIRT_PYTHON_ARCHIVE_NAME}
> +		if [ ! -d $src ]; then
> +			bbfatal "Python source not found at expected location \"$src\". Please check that this task logic and SRC_URI are consistent."
> +		fi
> +		cd $src
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
> View/Reply Online (#9434): https://lists.yoctoproject.org/g/meta-virtualization/message/9434
> Mute This Topic: https://lists.yoctoproject.org/mt/116155486/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


