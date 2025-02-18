Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D377C021A9
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 02:03:36 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.10595.1739844212190759984
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 18:03:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XfCH6ZdA;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6e677921db0so14711356d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Feb 2025 18:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739844211; x=1740449011; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p87uANYtVKiWGepH8FpYL25YiTSOibObgp0BhoWVDng=;
        b=XfCH6ZdAHNfzYNYBZOMap8hvXFk91fOmLZtZ9XDdEfhT9O5PIntPc3tw9q57CBxYfB
         8WXijqOLSUnoiSvofePe9vCRcK22C2+LJxxCVj/6k5kCorrdoJfDy2dtVFqDYOPMwFtF
         WwOgzdDz3Fddg0zyN2zjMps85NQHwKmk9qDLaulmJs8WlauO7Q22WSdqJM2pdj3J0N3B
         +lzF0WL/vXkT3NpExyGd4bdYcj3Xg5+TKuWaIt0rONtWp4E6m0bxrpEmIxr6lbQ51Wgi
         Ukw5TLTwifgVHyIZOJrNHO4g9jBhtUYV1RcU6pr7PKxZxXnG2iI0IvYf5E6L4MKVPUXW
         Ping==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739844211; x=1740449011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p87uANYtVKiWGepH8FpYL25YiTSOibObgp0BhoWVDng=;
        b=lHZhAfJ/rqv3GkA+v6/tSGUqVDy4I61ihRQPqDziADnVzo8b2Qgjjh3cC6u3JoTzOX
         dIrlC1+vSR0sLLNDAnF2gh2aFjnA6HF1EZ/pUoqQ9iZ2aQh66Ek1mYl9w8w4GX4pcxbf
         iRJ9jHN4uqWP/uEM7j2pC18sDYArAzUD9agrUTzhDrUBKnfGPQOPYT/4j7Rvr184PaYd
         Duo4mrVpxSeEJ20mjsZWvRPi9wX0oCpcAFuajoo76WZduKmXvApFJvzd9SVJQPgE/QJ1
         4CYloq7VO2WHXbIkZ08gp5i1gYndv63W9Zp63HYurwx74lKPMiTxtGPJFKQL+TTfmVUB
         ml1A==
X-Gm-Message-State: AOJu0YzSlWJzTemG91yF10w9ulQhmHNnMbkZTADl3v9yp0ZVGNZe47lY
	VHZ3Qq8yXsmSxqysvlt9d+t+/rz1oiJGDBGAGbiQAFrraPYv25GDMVlidj3s8fE=
X-Gm-Gg: ASbGncuJYEaG3cdV/kabAeEU3v/8XTG6POgaMoI9BjV0P95DQIcgtXcGPVco8JGFVNe
	BJvp+0JU7oUNDLl2VTRTigIG51wT8UG0WfqpxaZM//BkmLs9yHr443KGxkrrokdAuBKOYarhI0L
	k7206QZO1WC7z7Lbdfc3dSJ90osA9PinMGRuftcHehMfAkZW4OWrYhBSUDsIqxXlUxREancvRYX
	gXag2369pJtwQf0XVDLrVnfdV5UTnwZatFnzD1IlWPicmDIIHU2EWYadlIrZfmp/uOzVUEBda1d
	Knw5hckr9/zljXGDsaABOTZq4ee9nDFRWzIz/liFoMRJmI5n2d8XhnaHZhmVXJHr7Dr8Sg==
X-Google-Smtp-Source: AGHT+IGg5x+bS//Jad5srk7t/KbJps+6Bbx6Ig3nJ2bDskYaGBtNaQC4ufmrCwFfXDVzg/ZQGYXXZA==
X-Received: by 2002:a05:6214:2021:b0:6d8:8390:15db with SMTP id 6a1803df08f44-6e66cc80951mr167541786d6.6.1739844210105;
        Mon, 17 Feb 2025 18:03:30 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c07c5f3684sm608360685a.5.2025.02.17.18.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 18:03:29 -0800 (PST)
Date: Tue, 18 Feb 2025 02:03:28 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: hongxu.jia@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH V3] libvirt: fix
 installed-vs-shipped QA error
Message-ID: <Z7PqcF02KiPk1C1O@gmail.com>
References: <1822C9325CE187F8.703@lists.yoctoproject.org>
 <20250210083145.2939-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210083145.2939-1-hongxu.jia@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 18 Feb 2025 02:03:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9145

In message: [meta-virtualization][PATCH V3] libvirt: fix installed-vs-shipped QA error
on 10/02/2025 hongxu via lists.yoctoproject.org wrote:

> In commit [1], upstream added sysusers config file for qemu & kvm user/groups,
> the install dir is "install_dir: prefix / 'lib' / 'sysusers.d'".
> 
> In commit [2], Yocto created an empty file libvirt-qemu.conf to override
> sysusers config file which is added by commit [1]
> 
> While usrmerge not in DISTRO_FEATURES, nonarch_base_libdir does not match
> install_dir and trigger an installed-vs-shipped QA error
> ...
> ERROR: QA Issue: libvirt: Files/directories were installed but not shipped in any package:
>   /usr/lib/sysusers.d
>   /usr/lib/sysusers.d/libvirt-qemu.conf
> Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
> libvirt: 2 installed and not shipped files. [installed-vs-shipped]
> ...
> 
> Use nonarch_libdir to intead of nonarch_base_libdir to match the install dir
> in commit [1]

staged to master-next

Bruce

> 
> [1] https://github.com/libvirt/libvirt/commit/a2c3e390f7bedf36f4ddc544d09fe3b8772c5c6f
> [2] https://git.yoctoproject.org/meta-virtualization/commit/?id=8138d9cc7e0c31171230110db0cfa881c46a821b
> 
> Suggested-by: Chen Qi <Qi.Chen@windriver.com>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
> index 6a524977..b6f46722 100644
> --- a/recipes-extended/libvirt/libvirt_git.bb
> +++ b/recipes-extended/libvirt/libvirt_git.bb
> @@ -95,7 +95,7 @@ FILES:${PN} += "${libdir}/libvirt/connection-driver \
>  	    ${datadir}/bash-completion/completions/vsh \
>  	    ${datadir}/bash-completion/completions/virt-admin \
>  	    /usr/lib/firewalld/ \
> -            ${nonarch_base_libdir}/sysusers.d/ \
> +            ${nonarch_libdir}/sysusers.d/ \
>  	    "
>  
>  FILES:${PN}-dbg += "${libdir}/libvirt/connection-driver/.debug ${libdir}/libvirt/lock-driver/.debug"
> @@ -204,11 +204,11 @@ do_install:append() {
>  	install -d ${D}/etc/init.d
>  	install -d ${D}/etc/libvirt
>  	install -d ${D}/etc/dnsmasq.d
> -	install -d ${D}${nonarch_base_libdir}/sysusers.d/
> +	install -d ${D}${nonarch_libdir}/sysusers.d/
>  
>  	install -m 0755 ${UNPACKDIR}/libvirtd.sh ${D}/etc/init.d/libvirtd
>  	install -m 0644 ${UNPACKDIR}/libvirtd.conf ${D}/etc/libvirt/libvirtd.conf
> -	install -m 0644 ${UNPACKDIR}/libvirt-qemu.conf ${D}${nonarch_base_libdir}/sysusers.d/libvirt-qemu.conf
> +	install -m 0644 ${UNPACKDIR}/libvirt-qemu.conf ${D}${nonarch_libdir}/sysusers.d/libvirt-qemu.conf
>  
>  	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
>  	    # This will wind up in the libvirtd package, but will NOT be invoked by default.
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9134): https://lists.yoctoproject.org/g/meta-virtualization/message/9134
> Mute This Topic: https://lists.yoctoproject.org/mt/111098897/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


