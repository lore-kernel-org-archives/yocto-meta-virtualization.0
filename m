Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46BB81061B1E
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 19:38:41 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4059.1774899517717041435
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 30 Mar 2026 12:38:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fxmxijao;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8cfc1aced74so842557285a.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 30 Mar 2026 12:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774899517; x=1775504317; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zzYmzO2c/dE3SRmDYgwaMwje9tipyx+L4+DBAGL4YiY=;
        b=fxmxijaovfSZZfEZBAdtlDs0W9hgcVHqQJvGc0coXu2M1By0pDXM0AGmu3FuvTnoQM
         wI1aloLjYt61KhQYSC5ietgYaw4MIRCAKX1vt4VYcCVInPfQM7wAYYbWKQ+mm+oWr5ty
         NFFWcf6/nFOnJ3hJrSx2ndoXVGvj9mqPdbv5MSmsuWY3IyQMlXUkjclPuFhWFxGXpSFT
         NhsT8+wE2YuUd4bfgFBev10fCC8mQ5V0wpXjfSWN3pAO/18FTmpJVJzyQy1WyG5tX8iI
         d8+lHDGyIZJ6n5MCTTKmeGbMv4kFrmW+5g3JCDfxJC6V6mKDfwsLIBz0ZC2JfSFNea8N
         Agqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774899517; x=1775504317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zzYmzO2c/dE3SRmDYgwaMwje9tipyx+L4+DBAGL4YiY=;
        b=R+9Yfzr5z/scd7difpuM7V5YZSKyDBP7SoybOCG93WIBeKMeeQsZed3IQH+5RB/PxX
         H5M6pYSPtIWO6ONXi9/+CUqgYA7Qa2DkkXgscBORsTxqzKpqxlsO9KxCJU3ha29GuWgv
         6toU6NnZd/npPRhUj90Bnatket4lWusPpoBwlzwn/gmtyPpQEcEKPVBQIZ3kJ3l2AJ6L
         0iLl6E8SmmVdHAA5vy6rshzFj36n3L0gi2Znma3qUXoKBX9894YClLRQzTFXUVCPIvrb
         plAG7FM9z+47x44eSagyWB/uUhul1vaQbyilgNJ/+ObHMbxOYZx6J1ZYygDC9u+vwToi
         WHVw==
X-Gm-Message-State: AOJu0Yw7OnCn9oP757NQIhykxVJgmcoDIHRhiHcDxqMHBT7rU4CarBMa
	2BZnNjVo5J7hK/s/RorKi6JLSgZ1Lv65hEOhaMNvHKSJOvQqiPfewbgayBd+RetC
X-Gm-Gg: ATEYQzx5hFWQ4wd8JWBgLsb0AgVqk69DEEfg5zr65mJSXIw1Jxh2TbffWdwn6e4W5KZ
	t6N4RaXStr/xM5cmgOmtZ3F+ILlfD3JPtETnOxUstn8WrcHgx+S9etMd24RlnuIQY65N4YOa6Jf
	OOmprYOIrONmAJJtElhnc4lpzz2T4ObVluntcoWpRQ1pixbUg8cB6BFQSDySKavH9lynWeQ40cL
	eRg4//4M1xRdRPpMWKmgKgyppvtek7XWGwSnY+qzT3Ud+ryyVV0CGozUK8gISa0pp63pTzql7hK
	+l19DDh0Hys9SGpCHzv8sbFSIkGj770WV+NiAu1G3qc8WGddSU7Da/HPMSZeNUJ51E6dewjA3hx
	LbsL3hPTq3FoPkC3jV9JtQ+brdfK9upq5FlIpcNdiIqV1MRWhElu63Zh4O/Lo1xB3mN47nnhMeO
	ViDix+I0TY+aDI+ycZu1VLB1VrBt5gMxqiNmnKXx7cFL0TNc1sy5RgTufHycjgir14t/DeMLRhI
	Uv6ox/bHODUuTC123QoOvi5P5CfzbkNOFaL
X-Received: by 2002:a05:620a:31a8:b0:8cf:c1c2:910 with SMTP id af79cd13be357-8d01c5ecb29mr1988478185a.21.1774899516643;
        Mon, 30 Mar 2026 12:38:36 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d027f0afd5sm652392985a.17.2026.03.30.12.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 12:38:36 -0700 (PDT)
Date: Mon, 30 Mar 2026 19:38:34 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: f_l_k@t-online.de
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] libvirt: disable netcf backend by
 default
Message-ID: <acrROmumFePuBYsP@gmail.com>
References: <20260319151552.313063-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319151552.313063-1-f_l_k@t-online.de>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 30 Mar 2026 19:38:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9683

In message: [meta-virtualization][PATCH] libvirt: disable netcf backend by default
on 19/03/2026 Markus Volk via lists.yoctoproject.org wrote:

> I see a failure in netcf:
> | ./bootstrap: .gnulib/gnulib-tool  --import --no-changelog --aux-dir build-aux --doc-base doc --lib libgnu --m4-base gnulib/m4/ --source-base gnulib/lib/ --tests-base gnulib/tests --local-dir gl  --lgpl=2 --with-tests --makefile-name=gnulib.mk --libtool --import ...
> | python3: can't open file '/home/flk/bitbake-builds/poky/build/tmp/work/corei7-64-oe-linux/netcf/0.2.8+git/sources/netcf-0.2.8+git/.gnulib/.gnulib-tool.py': [Errno 2] No such file or directory
> | ./bootstrap: gnulib-tool failed
> 
> Since the code hasn't been updated in over seven years, and after reading this discussion, perhaps the best solution would be to disable netcf support by default?
> 
> https://lists.libvirt.org/archives/list/devel@lists.libvirt.org/message/755CCFUFUW6OTN7CAHB77H7YXQNE5WGG/
> 

Merged.

I'll eventually just remove the packageconfig itself, but let's see if
anyone notices this first!

Bruce

> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  recipes-extended/libvirt/libvirt_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
> index 63f882ee..db600b92 100644
> --- a/recipes-extended/libvirt/libvirt_git.bb
> +++ b/recipes-extended/libvirt/libvirt_git.bb
> @@ -131,7 +131,7 @@ SYSTEMD_SERVICE:${PN}-libvirtd = " \
>  
>  # full config
>  PACKAGECONFIG ??= "gnutls qemu openvz vmware vbox esx lxc test remote \
> -                   libvirtd netcf udev python fuse firewalld libpcap \
> +                   libvirtd udev python fuse firewalld libpcap \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux audit libcap-ng', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'libxl', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'polkit', '', d)} \
> -- 
> 2.53.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9668): https://lists.yoctoproject.org/g/meta-virtualization/message/9668
> Mute This Topic: https://lists.yoctoproject.org/mt/118401958/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


