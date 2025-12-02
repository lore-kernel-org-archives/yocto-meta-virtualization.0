Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1368BCFD376
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 04:44:47 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.701.1764650679890321144
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 20:44:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k/hMO8Sx;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8b2627269d5so431963785a.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 01 Dec 2025 20:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764650679; x=1765255479; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5vhVFGGAbhHAcXwucALhhBY8Id61DfdwGtH9YOoaTyY=;
        b=k/hMO8SxrwwZFTX8eQX8Qh9Tyfnqz6JnyvGXUdOYzbPml6x2UBjsQwZsPUZ+NxI9kK
         epSC2KvTizCwBKj4ex8fMNJA9neeZlXJN6nYOEQ1FsV5FSzjYxZC8Exnkm7/p2ejB2mH
         vuQ+SCGMISpkT1NtO2iL1hbVsurB7YW5lW90sQxAfPMNjx8mHwWiHTBJzf2rI3hRbui2
         FpRU/3yrI0SevbBlCPm9rhvaHC2NmaqrpbbZyNI4YtDCYqayrWJ8l6cmECkmvRecU7qX
         RMgZ2m6xm6/hLnXi05vUc3EbS5+gZy2NPy/CHEBuIdjyo6VK1GoWhMEuy9tIYYDgSX7B
         i8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764650679; x=1765255479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5vhVFGGAbhHAcXwucALhhBY8Id61DfdwGtH9YOoaTyY=;
        b=qe4GbD2aF6nHWhN5syLUaxELChlXCbxPmav/Q5DEpTxoFN0gMuS3Fuy+mNSWhZQ5Hi
         +Y7rrQRaOsxLwJL+FlFaco7e6j3IRU8eeT9uHRygFr/k9cD+IEPoY0X38tWOYXr7HeX4
         8eIlzKmqjJFqu3lO+ee0IdRJM/BfB3bRs+srBVRkot2RM8Ik3/DNCgxr6mogPPu64WKr
         sdXmjwGqjWbgwxDCMfRkmZa1SedtuI0eLPxZITmZXNSsawbFs8YX3rjRgdFw58w0Rtkf
         igfIPWKwXT15yfTITy/1zLwRpzoX1uVUQ+uRaRo1MHBcDpYIWv3xevA1r8GagzvKMIFW
         LSkg==
X-Gm-Message-State: AOJu0Ywx/QUP8ym47eTGsnSEaLErQ343SQQB6mVgwLCcMVu7WKYc+2fp
	yaDPGzK3xCiffM3ktiNfv8d62Q/YNeX6+pbrmsJw/S+1nSHOAYEObjO3n4kd6WD6oqw=
X-Gm-Gg: ASbGnctWc8jQjbky3m6nuGnZsk8D2lei9d7pzGfh1fTiEmDTgzYvatXQm0wV52+c7x2
	xOQ1wB71hkNqkfniYitFetrgSjf0bIvk+EL23JPIgR2g90kA8vXulLZ4XoUNLtiXpVkJZh69qMs
	vFfcfbVFizR0ctKJTMV6m0uGi4uQfewSb7IXsEkwGjYH2bc1cNj5+cJQdgWyq2aXke1G2C0jNob
	T7zFTcymexwBDUZYwsttfXeBIGyFmo9omkmys+c5a2ZNjHjgKGZmD5z5K0J4FZnRuimh8ZgUkTU
	zl0lZkZ9V9Uyqf+gN3OnzAB3NiCqrEdwx18S/mbPda2PKYZ8dQv0TZ3do1yrVtaVZH0WASxPWDk
	evt1QJ8Rs/UoFhdvAVrsRSPosLs0P31UQe/Sr4vXS/8vFAmth+3jgJqAUNHRmvnX9dsNlEYsY1M
	KsiDKIjRXY64o1jjXGXNE5zUwHpulIYiFU1IGjxzYIMotAnUkECnar1LuE9ejXdfsc
X-Google-Smtp-Source: AGHT+IGCmE+X2b1N+7alwcUW2HJNWcaNRyNT6egamlJ6psob9dfSV87lN8tDUDU+/EfFUXHlOTdJtg==
X-Received: by 2002:a05:620a:28c9:b0:866:f322:c6c0 with SMTP id af79cd13be357-8b33d48275dmr5571424285a.60.1764650678733;
        Mon, 01 Dec 2025 20:44:38 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b5299938b5sm1013406485a.4.2025.12.01.20.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 20:44:38 -0800 (PST)
Date: Mon, 1 Dec 2025 23:44:36 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: kai.kang@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [PATCH] libvirt: set firewall backend priority
Message-ID: <aS5utFRSiZDsSaFq@gmail.com>
References: <20251126072914.2711374-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126072914.2711374-1-kai.kang@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 02 Dec 2025 04:44:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9469

staged to master-next.

Bruce

In message: [PATCH] libvirt: set firewall backend priority
on 26/11/2025 kai.kang@windriver.com wrote:

> From: Kai Kang <kai.kang@windriver.com>
> 
> If firewall_backend isn't configured in the config file, libvirt will
> choose the first available backend from the following list by default:
> 
>     [nftables, iptables]
> 
> so when nftables is installed in image, firewall backend nftables rather
> than iptables is adopted.
> 
> Add a PACKAGECONFIG to set the firewall backend priority. And update
> runtime dependencies for backend nftables.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_git.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
> index 681ceade..e9359e1e 100644
> --- a/recipes-extended/libvirt/libvirt_git.bb
> +++ b/recipes-extended/libvirt/libvirt_git.bb
> @@ -15,7 +15,9 @@ DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux
>  #
>  RDEPENDS:${PN} = "gettext-runtime"
>  
> -RDEPENDS:libvirt-libvirtd += "bridge-utils iptables pm-utils dnsmasq netcat-openbsd ebtables"
> +RDEPENDS:libvirt-libvirtd += "bridge-utils pm-utils dnsmasq netcat-openbsd ebtables \
> +                              ${@bb.utils.contains('PACKAGECONFIG', 'nftables', 'nftables iproute2-tc', 'iptables', d)} \
> +                              "
>  RDEPENDS:libvirt-libvirtd:append:x86-64 = " dmidecode"
>  RDEPENDS:libvirt-libvirtd:append:x86 = " dmidecode"
>  RDEPENDS:libvirt-libvirtd:append:arm = " dmidecode"
> @@ -175,6 +177,7 @@ PACKAGECONFIG[apparmor_profiles] = "-Dapparmor_profiles=enabled, -Dapparmor_prof
>  PACKAGECONFIG[firewalld] = "-Dfirewalld=enabled, -Dfirewalld=disabled,"
>  PACKAGECONFIG[libpcap] = "-Dlibpcap=enabled, -Dlibpcap=disabled,libpcap,libpcap"
>  PACKAGECONFIG[numad] = "-Dnumad=enabled, -Dnumad=disabled,"
> +PACKAGECONFIG[nftables] = ""
>  
>  # Enable the Python tool support
>  require libvirt-python.inc
> @@ -313,6 +316,7 @@ do_install:append() {
>  
>  EXTRA_OEMESON += " \
>      -Dinit_script=${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','none', d)} \
> +    -Dfirewall_backend_priority=${@bb.utils.contains('PACKAGECONFIG','nftables','nftables,iptables','iptables,nftables', d)} \
>      -Drunstatedir=/run \
>      -Dtests=enabled \
>      "
> -- 
> 2.34.1
> 

