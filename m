Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8C9FCD6E6B
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 03:27:38 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.665.1780630049602711612
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 04 Jun 2026 20:27:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KtFTBgLj;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8ccd1f57b32so13848026d6.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Jun 2026 20:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780630048; x=1781234848; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xy7AOHj32QYotz4kGvPyudIGqLwnFuw/0KJ+2UNZ6MA=;
        b=KtFTBgLjmfQgtNbScT52zHu+APcfvukSLrB1S2NAZz1rNBQ30zL9ANkzlFUhAAqV2j
         Wi4Luz2qhHzIke996eFcrTE7oHbjkEH+woyV/wqGHY2hIHEv9ufREEwcCag7lwOGZAgr
         aLf43RjaQ8lz+GdXVavYwzJwTQt4/q5LsQBWSm3kYd2wtLdJK5gI+4nhuT5qWGtou6/Q
         HEh0GEGdZthRfUXnhV+G5AGwMdzJo0i2U3RF2id4oFMd+LYntERG/fNKh9/0L07YvQ0P
         XDILCmsCEo2Es0w9+Zb8XcBxm8F8opKxaZmVrCplzFE78SAgSDW5C9PVG3jaVZQpyzZT
         OuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780630048; x=1781234848;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xy7AOHj32QYotz4kGvPyudIGqLwnFuw/0KJ+2UNZ6MA=;
        b=o2WR5CnetZdQ2kSX9tMx6EnkwV7lW67fWhbA4uEJNLoWALSpu9yhCBugDnRJCdGlX3
         eaO41eVR4mvmcqjhTGwexvnLyLGqpHDK80YoxiMv8Fw8OPEFmC+Mrl7u3gOYB4Ut+Q3M
         3+o6dkaXdcXiPDBd5VLkMyTAg/wvG9TxPAEkS+eyAyAz4wt15ssWn+C2yw+u31mpJYWf
         0DlpYsFlQAc9unEeTpmAFk24xe7iLM8u2vl3z85eutojIPG69yzt4+6u37EvLiQszpZU
         0ManI/t1yo3yW1ouA7tMq0/yuWunxe6hrNQEyqVF35KRr8z4PtkU2+zKeTm8eZc68cd/
         Nv8A==
X-Gm-Message-State: AOJu0YyL1ldM8bExLQblIXr0N3OE4X0375QsX9rpNfsBFHWSacDQxdle
	GGdmbES4QYbfG1zPUbQvWWQVw6i5RVDi2Qw/DkZ3EyKOpq+crxtfnUQO
X-Gm-Gg: Acq92OFXnMcVPKmtpZnrzWrP8cxssRrhK8/Bo2FwgvTVKbx4uH2S9ieBQYzTry9ZA9f
	vhj6Ug7eAFIIrpIJqMc+6a5BflZdes15FNl7f95qUAEnjj6o4tP1CBbB3p5OQhx2Nbef6cmqZ3F
	0pogdOe6BH2m6MS3e1IevNbCUOEfnLRY7f95vecjptqfrHAEBvGpr/eI1a5lfUracIlCugdtV63
	FIUxjvP9UMVqfEjOcoYsP4r73lQo5B9IVWE1RGnbSvSFdQXFtsZu1jVCcHkL++aOmpiZveJLwhr
	zEkeZUctFCtHA1HaKy6ZCL2Jlgz7JyrmGe57ZLqcESYqin3PDRWqnPWskvhoZczAHu9jKw5NU/V
	MEfrb8Harv1DSWxQy5CNkspfBDUuMOEatfcbnx3ofDdd/x17eCRMD2EGwOn7ZR5JpRvGAP3/JqB
	xicMqCia5pVrBLLvbyIYsj2vCnWKu/rQaP41V2TQYlKkudPe5C66ytXDqsTcugbdJKi8NyDfe6r
	WHeB/xIJipxLdl1aq5sxAB/453vxaVR2AahX7z7kwWrDAjltGeB0ojz+LXYKZCxxbOH7SYxTvnQ
	18ztLn/6bn5yezs8jvVf+OV5AxlUL5m7
X-Received: by 2002:a05:6214:4246:b0:8ca:16a6:3d40 with SMTP id 6a1803df08f44-8cee5f9f6c6mr27370226d6.5.1780630048509;
        Thu, 04 Jun 2026 20:27:28 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd06f5eesm71001276d6.37.2026.06.04.20.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 20:27:27 -0700 (PDT)
Date: Fri, 5 Jun 2026 03:27:26 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Haitao.Liu@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][wrynose][PATCH 1/2] libvirt: update to
 v12.2.0
Message-ID: <aiJCHhtN7Xmu6Ogl@gmail.com>
References: <20260529030040.1487113-1-haitao.liu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529030040.1487113-1-haitao.liu@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 05 Jun 2026 03:27:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9851

In message: [meta-virtualization][wrynose][PATCH 1/2] libvirt: update to v12.2.0
on 29/05/2026 jason.lau via lists.yoctoproject.org wrote:

> Bumping libvirt to version v12.2.0-93a00a3db8c, which comprises the following commits:
> 
>     93a00a3db8 (tag: v12.2.0) Release of libvirt-12.2.0
>     f9c95bdbd0 NEWS: mention new hyperv features

This "NEWS" commit, is talking about new features. The 2nd
digit bump of this recipe is not bugfix only, so it goes
against the normal stable branch "bugfix" only policy.

What are you trying to fix with this ? CVEs ? something
else ?

I need justification to go against policy and pick up
new features.

Bruce"

>     8850040735 NEWS: Document 'handle' fs backend removal, blockjob backend zeroing and stats for '<dataStore>'
>     d2c6b93f4e NEWS: Document IOMMUFD fixes and new features
>     f5868958e4 NEWS: Mention VIR_CONNECT_GET_DOMAIN_CAPABILITIES_EXPAND_CPU_FEATURES
>     473b1d917c NEWS: Document features/improvements/bug fixes I've participated in
>     2f8013287a qemu_hotplug: Set correct iommufdState on error path
>     e46934cd98 (tag: v12.2.0-rc2) Translated using Weblate (Czech)
>     b96ea4db3a hypervisor: Call virWaitForDevices() after detaching host devices
>     3a91192252 util: virfile: Don't over-allocate buffers in saferead_lim
>     a719ab7344 util: virfile: Document the various functions for reading from file/fd
>     4fc09da299 virPCIDeviceReadID: Fix use of 'virFileReadAll'
>     59684e9cc1 virNetDevIPCheckIPv6Forwarding: Don't NUL terminate buffer from virFileReadAll
>     747a74dd05 virSecretLoadValue: Don't re-termiante the buffer
>     58b3a78aff virPCIDeviceReadClass: Don't write beyond end of buffer from virFileReadAll
>     458c6a2810 util: file: Shrink buffer returned from 'saferead_lim' to actual size
>     74b24ffc24 secret: config: Don't leak 'cfg->secretsEncryptionKey'
>     4a363bdfe9 qemu: driver: Don't leak 'qemu_driver->backupPorts'
>     f590a18da6 (tag: v12.2.0-rc1) po: Refresh potfile for v12.2.0
>     9d99334bba Translated using Weblate (Romanian)
>     d3667c0bad Translated using Weblate (Korean)
>     d1223c502f Translated using Weblate (Chinese (Simplified) (zh_CN))
>     a99d11bd22 Translated using Weblate (Spanish)
>     b1d88f766d Translated using Weblate (Spanish)
>     616c618a2f Translated using Weblate (Spanish)
>     397b1f9cf0 Translated using Weblate (Spanish)
>     0fa4d624fe Translated using Weblate (Portuguese)
>     26263b5600 Translated using Weblate (Georgian)
>     a8ee17c8a3 Translated using Weblate (English (United Kingdom))
>     0f52d35b1b virxml: Fix virXMLPropTristateBoolAllowDefault() documentation
>     a52ba0ae7b tests/virhostcputest: Remove duplicit g_autofree
>     83f49f6335 util: Fix comment in virBitmapNewData
>     e2e1b02ae4 qemuDomainGetBlockInfo: Add debug statement when updating disk physical size
>     ce56dc26f4 qemu: monitor: Separate stats from capacity properties in qemuBlockStats
>     5f081c4b2e qemuDomainGetStatsBlockExportDisk: Export stats also for 'dataStore'
>     d731d54a57 virDomainGetBlockInfo: Log 'disk' argument
> 
> Signed-off-by: Haitao Liu <haitao.liu@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt-python.inc | 2 +-
>  recipes-extended/libvirt/libvirt_git.bb     | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
> index 6738193a..c37a9ebe 100644
> --- a/recipes-extended/libvirt/libvirt-python.inc
> +++ b/recipes-extended/libvirt/libvirt-python.inc
> @@ -20,7 +20,7 @@ INSANE_SKIP:${PN}-dbg += "buildpaths"
>  
>  SRC_URI += "http://libvirt.org/sources/python/${LIBVIRT_PYTHON_ARCHIVE_NAME}.tar.gz;name=libvirt_python;subdir=${BP}"
>  LIBVIRT_PYTHON_ARCHIVE_NAME = "${BPN}_python-${LIBVIRT_VERSION}"
> -SRC_URI[libvirt_python.sha256sum] = "2cc02c0b91a9abd140185feab46b33281091d4deffbc1bbfdb68ce682359f2b0"
> +SRC_URI[libvirt_python.sha256sum] = "742147988bba7d400f6892beeeb7e0a27758f10ff65421b569b7b4b6a2572e44"
>  
>  export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
>  export LIBVIRT_CFLAGS = "-I${S}/include"
> diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
> index 34a1ff21..cb5d3482 100644
> --- a/recipes-extended/libvirt/libvirt_git.bb
> +++ b/recipes-extended/libvirt/libvirt_git.bb
> @@ -26,9 +26,9 @@ RDEPENDS:libvirt-libvirtd:append:aarch64 = " dmidecode"
>  #connman blocks the 53 port and libvirtd can't start its DNS service
>  RCONFLICTS:${PN}_libvirtd = "connman"
>  
> -SRCREV_libvirt = "9fa6beff05728a32dd11f7ccb7e3c97fca510029"
> +SRCREV_libvirt = "93a00a3db8c8b5e3ee4a97ff2539193e5e7accff"
>  
> -LIBVIRT_VERSION = "12.1.0"
> +LIBVIRT_VERSION = "12.2.0"
>  PV = "v${LIBVIRT_VERSION}+git"
>  
>  SRC_URI = "gitsm://github.com/libvirt/libvirt.git;name=libvirt;protocol=https;branch=master \
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9823): https://lists.yoctoproject.org/g/meta-virtualization/message/9823
> Mute This Topic: https://lists.yoctoproject.org/mt/119542052/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


