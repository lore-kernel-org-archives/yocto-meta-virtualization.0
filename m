Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web08.2811.1627933920612459206
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Aug 2021 12:52:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=btdWhe0S;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id em4so4606530qvb.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 02 Aug 2021 12:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qnjVYPOweNmImiVsPNBg2f+II2maosm4oMelO1aZMgY=;
        b=btdWhe0S+t2lpFoD9iSGfRt60yl/WfiyP9sccuVivOTyPrOWuJ8jWRhCWZYrx+0m26
         lKeIv6fQPdzc4Qnw/IFPezfIewq4oWNSPNlTiem28F8AhjgikRwEFUWJuZ4+FbmCvbCV
         wy1AQ5UzY8xJlbwKZEXx2iv5LsDX++CJ+Pxi8hwrwrC2KrMIYQNr0jopOZqOZam+27RQ
         OQNoPMXkOaeNWp+tk6yNFs2/01Xf/OHTiZIiENeHrUGZDOrlmBB1Ogl3PHJeVMtbSjqt
         v0bSQRH+EISA+1h6I/wXoBwP7S/1OEyvHoMvBAJvgHNd7Cs8VTx8ykAeIjs2LXmNDBNI
         QAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qnjVYPOweNmImiVsPNBg2f+II2maosm4oMelO1aZMgY=;
        b=uB+n+nh+engmA87vqrJNqI3ThYsyHa5/GNYavFX3zzEnGj+/dIZzVj4Ulf2Nxomism
         b5gV0MTyxVdE+Fqt6wWxd4NRRFECCFEj3mWAVkylO5Zj3oFIrIKleTlbi9eY1Lw1tzzg
         Z+4kuSl3qs/jMoRvisahw3LY/BvDS9/zLVM1guSEFNYg1lFoTkFUggkwjrdbABVQ0KVl
         8jfPjp7TQbGKAcGeAXxneTEictOxfgk5lSKSEp4LY0O+Vd/8gSiKqroyT56YpDFUbwju
         3ulfes0Vc8W3VKq+jQ7g+q9jVFc3hFnY9LNld3hv7VSKB48bqHhJVQDLatb/0c7PFy80
         rAyw==
X-Gm-Message-State: AOAM530IcPie0u/U54XoWkymaQaTRmXi7AtkkiGsDAQDcSmrrHe0NOzL
	I6WRwKOS0z0z+4dv3IFYy34=
X-Google-Smtp-Source: ABdhPJxtm4rDy6iaxFJTAa0N9onQ36FO+3HYG64ojmF1TPXt6CztjcmvXywOr/XMJGkoflN61taRIg==
X-Received: by 2002:ad4:5de1:: with SMTP id jn1mr16438948qvb.62.1627933919723;
        Mon, 02 Aug 2021 12:51:59 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id c6sm6421769qke.133.2021.08.02.12.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 12:51:59 -0700 (PDT)
Date: Mon, 2 Aug 2021 15:51:57 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, cardoe@gentoo.org,
	jdmason@kudzu.us, christopher.clark@starlab.io
Subject: Re: [meta-virtualization][PATCH] xen-image-minimal: fix aarch64 build for non-qemuboot-enabled machines
Message-ID: <20210802195154.GA25548@gmail.com>
References: <20210802012656.40174-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210802012656.40174-1-christopher.w.clark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][PATCH] xen-image-minimal: fix aarch64 build for non-qemuboot-enabled machines
on 01/08/2021 Christopher Clark wrote:

> The qemuboot device tree generation task in qemuboot-xen-dtb.bbclass
> requires the QB_SYSTEM_NAME variable to be set to identify the Qemu
> binary to use. Skip the task if it is not set.
> 
> Reported-by: Jon Mason <jdmason@kudzu.us>
> Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
> ---
>  classes/qemuboot-xen-dtb.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/classes/qemuboot-xen-dtb.bbclass b/classes/qemuboot-xen-dtb.bbclass
> index 08f9b02..2d37e91 100644
> --- a/classes/qemuboot-xen-dtb.bbclass
> +++ b/classes/qemuboot-xen-dtb.bbclass
> @@ -176,7 +176,7 @@ do_write_xen_qemuboot_dtb() {
>      # Not all architectures qemuboot with a device tree binary, so check
>      # to see if one is needed. This allows this bbclass file to be used
>      # in the same image recipe for multiple architectures.
> -    if [ -n "${QB_DTB}" ] ; then
> +    if [ -n "${QB_DTB}" ] && [ -n "${QB_SYSTEM_NAME}" ] ; then
>          generate_xen_qemuboot_dtb
>      fi
>  }
> -- 
> 2.25.1
> 
