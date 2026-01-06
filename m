Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 479A3CEFD01
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 19:44:02 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.98859.1767728641099404245
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Jan 2026 11:44:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JDlndC7m;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-88860551e39so10327066d6.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jan 2026 11:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767728640; x=1768333440; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OmD5qlRsW+RPUEIXPEUpFm0r7FPpab85qnmt49YIEE0=;
        b=JDlndC7mBkX8Km8ahDz2MtxAAQ9WsHBhR72yMdXfgM/LzgNDshjbl2/J/l6GESyDWS
         ufP+Yb8LRKj4VYoTJceiMlJzLbIsU2bMcTkGK9maiVPQ++tHqiyHhGqPP3ZAg2muX0zC
         M8Z7BSRXC1UHKvVgiEQyVAQ68MKLLZwJ55oU4+GvX9fjskYQrpG2j0xgmQK+o7v0n+mq
         SiOLRyOT3mv42Z7bIoGKAK1cwzLaehhmc9MD1tZe5BYtEPzB5llyZ+Nlo9EPe7S7OALQ
         vXm52JYjwIfja3QVUDNrc5vgAv9W7qabwr+ucKLS9Wlq+5EncVZrUT9w8+fqFcjvpDp8
         O54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767728640; x=1768333440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OmD5qlRsW+RPUEIXPEUpFm0r7FPpab85qnmt49YIEE0=;
        b=oZVr8fTfgYXaXrP4VlppJjCWnHuRrgjOI6hcrr11FUItHOfb/KsdyFUbCcahHgQisL
         GimXEIqIpxsKOfntD9n7oEh8i5YCVLTiCQaIgRhWjvwiK6O/5suYsfUszfkYzXpbHGu2
         2KPeYyWiSXtNkS0NrFxpWEN8eMvkOh/h3ATt+xsE1SBYv6w61QcgN/kCAuhHuXLV7c62
         hrwd8ZrEoXVdaWgNRRnKnzNut9HwADpUk0s6+HeYTwUGGPXld6+FqkYm0zidMtuoZisF
         TiZBCXSU5r5FGLOGJxl0Jpm9mfbn5Jl/XlqM0DH0YmBNVRpBEN+7O37eePXD7qrVv/D2
         KIJA==
X-Gm-Message-State: AOJu0YwHui7hj4qKONOVvU0Uu7NQ4/RnswXrnDpYwGVH0KGRhQIiZlmN
	bsyiEXcRA7wwLx4xrExY1cZhQ3ZzQ+VfsS/XZlzdjJMqfWbm91d6LNtp
X-Gm-Gg: AY/fxX59+j+yNGgP+9AcXwI5688zk6TSm0/+UpPio1heu5Q0F0MdEkJi6H5Bd6qpV9t
	kPEElR7S4hkjXXpWJwULKLV3KwO+WvbeNrP1mXUApW06uN7z5GD3296CwySEj/Gj7hnGMVexECZ
	WQU/21ypEjI+p9wAPLLHEKxJljpDldAoCXzLJkca5LUbu0TfFB+L1EGlB4xr3OoezJjIBtK+NId
	YFpna4Rhayw68t9h7RIuxZkGtnKkpKE8Nd5YIpj7rmRVkhp3SF3bpZ/w88ump94Awr79kNMnQ3v
	E6qCmdtNo5dmhybrGWWu44vMaxm8bO5QzNseIg6LOg+39Q7N/lm23FiRVD/ukA3kBj7DZgbYD1e
	fftjP1jXxN4DO8dS9fHm+FTDeotar1DlrDZU/7ybk8R/dHE/omcp6KauUbpCF1X2qTc/WtZQ/1j
	3Oae6pZQXU7NfxGMd8p+0wuCmM/9e91FMGeGclTnNoYl3rLEMiVfcPBa5l1WNVTKMC
X-Google-Smtp-Source: AGHT+IFvMfwRN1cRPkRMf4CL1L5v4msza8MiKam9qjMJs2JArLGDEQdJAyJykvOl5LLTfY0e96w1cg==
X-Received: by 2002:a05:6214:4342:b0:882:4987:367 with SMTP id 6a1803df08f44-890843298f1mr668386d6.65.1767728639948;
        Tue, 06 Jan 2026 11:43:59 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89076fa0718sm19220286d6.0.2026.01.06.11.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 11:43:59 -0800 (PST)
Date: Tue, 6 Jan 2026 14:43:57 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: vudupa@qti.qualcomm.com
Cc: meta-virtualization@lists.yoctoproject.org,
	anuj.mittal@oss.qualcomm.com
Subject: Re: [meta-virtualization] [PATCH v2] lxc: delete empty lxc state
 directory
Message-ID: <aV1l/cWeoUGbLlFG@gmail.com>
References: <20251204064329.568898-1-vudupa@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204064329.568898-1-vudupa@qti.qualcomm.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jan 2026 19:44:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9529

merged.

Bruce

In message: [meta-virtualization] [PATCH v2] lxc: delete empty lxc state directory
on 04/12/2025 Vishwas Udupa via lists.yoctoproject.org wrote:

> lxc systemd service [1] defines a StateDirectory to ensure that
> the /var/lib/lxc directory is automatically created and managed
> by systemd during service startup.
> Do not create lxc directory at build time for systemd.
> 
> [1] https://github.com/lxc/lxc/blob/f9ff9ea2a92653a823edf25e8e28c9dab08b3090/config/init/systemd/lxc.service.in#L16
> 
> Signed-off-by: Vishwas Udupa <vudupa@qti.qualcomm.com>
> ---
>  recipes-containers/lxc/lxc_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
> index d6f137d3..542134db 100644
> --- a/recipes-containers/lxc/lxc_git.bb
> +++ b/recipes-containers/lxc/lxc_git.bb
> @@ -141,7 +141,7 @@ do_install:append() {
>  
>  	if "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}"; then
>  	    # nothing special for systemd at the moment
> -	    true
> +	    (cd ${D}${localstatedir}; [ -d lib/lxc ] && rmdir -v --parents lib/lxc)
>  	else
>  	    # with meson, these aren't built unless sysvinit is the enabled
>  	    # init system.
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9477): https://lists.yoctoproject.org/g/meta-virtualization/message/9477
> Mute This Topic: https://lists.yoctoproject.org/mt/116608759/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


