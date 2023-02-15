Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE98C636D4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 20:11:42 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.3628.1676491901970467559
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 12:11:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DeMjwsXm;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id g18so23080206qtb.6
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Feb 2023 12:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xOJn+vzfiKM9rH5BiyDVKOi4vE9S1SWlRt1de3b4DhE=;
        b=DeMjwsXmv8Ro5Ao82E8yUKABkVD+Kclus0GJywJ+PM4AvK27nvIAZ4RJByhrrz3oFK
         EUkjZNaUcL4Q0arEbOPEVbVN/EiZJfJVeL8NUhTN8anx/YYMS1moTZirLeChs/1TvYqQ
         WgwSJ4HkLh5MKPxQqE+VQr+pWegGTZggR8qUixE2DIhbA0g0hq6kJOaH1fXLLoz3Rvpn
         dLfhxyD+iMuuKJUQRwXapZIUYHE+HRoRDm7ksOP91SAlhh/x/Tee53V6p9E47CR1XMZ8
         YTL1rafJQnhDPjULu27YPog8ei9EI5+PmQ8c8DP8nKnwMVhRto1wG27VBQpASjuUrhhq
         TAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOJn+vzfiKM9rH5BiyDVKOi4vE9S1SWlRt1de3b4DhE=;
        b=L/Htu14kukB5qzOAzkho+4ISKHh0ostVccRFY0TCqrSISld7q86TQTyZ8Tlb5RNCrN
         TLPvct0RQBQAQua9QQXTMx92FkeUfRA+0QHkNC9fyJSQqh4gSd1iVuCuofaSmWP6cj7Z
         GpJgNWPfXdgGQTyyvhsC4rwZJ0ekSb4WnNtZOPI+WwPzNlgnKp1TrqWOMAXgaTeHyF87
         K0BAQcJwETQ+8GWp8G3iU2rPGtS0MUPA6Q4ddfBE4YtK5fgJ5Cd1iPeE3JfXnpPw9VWv
         d8dM+qrtiTCRMKBuZ5qVOV+WhBmejlwEQuzZwg0xuDnoTZQf7OiJJPfXjCyrdLvtfUOR
         AqlA==
X-Gm-Message-State: AO0yUKUQebp2NiRzcuEZt5q4R0iwUqaKInWxbIvlSmvjDb7Si4p9DnAf
	eHM37WnYPcccm1h9/8okB8M=
X-Google-Smtp-Source: AK7set9fIKhI80KH5rZQo7b2f9lPEBFvTRfgWUXhU3s56bw6U+joooapUbebg/aZoyfudrXFzRJldw==
X-Received: by 2002:a05:622a:15c4:b0:3b8:6075:5d16 with SMTP id d4-20020a05622a15c400b003b860755d16mr5762513qty.56.1676491900924;
        Wed, 15 Feb 2023 12:11:40 -0800 (PST)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id h7-20020ac85047000000b003b9a50c8fa1sm13502188qtm.87.2023.02.15.12.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 12:11:40 -0800 (PST)
Date: Wed, 15 Feb 2023 15:11:39 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][kirkstone][PATCH] irqbalance: Use built-in
 irqbalance.service instead of local one
Message-ID: <Y+08e7p0rw2lE7jy@gmail.com>
References: <20230215121632.3091565-1-zhe.he@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215121632.3091565-1-zhe.he@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Feb 2023 20:11:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7858

merged.

Bruce

In message: [meta-virtualization][kirkstone][PATCH] irqbalance: Use built-in irqbalance.service instead of local one
on 15/02/2023 He Zhe wrote:

> The local irqbalanced.service was written long before when there wasn't one in
> upstream. Then upstream created temporary runtime directory /run/irqbalance in
> its irqbalanced.service, but no one did this for this recipe. Which renders the
> following error.
> 
> /usr/sbin/irqbalance[314]: Daemon couldn't be bound to the file-based socket.
> 
> This patch starts to use upstream irqbalance.service instead and remove the
> local one.
> 
> root@qemux86-64:~# systemctl status irqbalanced
> * irqbalanced.service - irqbalance daemon
>      Loaded: loaded (/lib/systemd/system/irqbalanced.service; enabled; preset: enabled)
>      Active: active (running) since Mon 2022-08-22 10:10:22 UTC; 3s ago
>        Docs: man:irqbalance(1)
>              https://github.com/Irqbalance/irqbalance
>    Main PID: 208 (irqbalance)
>       Tasks: 2 (limit: 263)
>      Memory: 1.4M
>      CGroup: /system.slice/irqbalanced.service
>              `-208 /usr/sbin/irqbalance --foreground
> 
> Aug 22 10:10:22 qemux86-64 systemd[1]: Started irqbalance daemon.
> root@qemux86-64:~# ls -l /run/irqbalance/irqbalance208.sock
> srwxr-xr-x 1 root root 0 Aug 22 10:10 /run/irqbalance/irqbalance208.sock
> 
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  recipes-extended/irqbalance/irqbalance.inc               | 3 +--
>  .../irqbalance/irqbalance/irqbalanced.service            | 9 ---------
>  recipes-extended/irqbalance/irqbalance_git.bb            | 1 -
>  3 files changed, 1 insertion(+), 12 deletions(-)
>  delete mode 100644 recipes-extended/irqbalance/irqbalance/irqbalanced.service
> 
> diff --git a/recipes-extended/irqbalance/irqbalance.inc b/recipes-extended/irqbalance/irqbalance.inc
> index c69b74ec..038cbae3 100644
> --- a/recipes-extended/irqbalance/irqbalance.inc
> +++ b/recipes-extended/irqbalance/irqbalance.inc
> @@ -42,6 +42,5 @@ do_install () {
>          chmod 755 ${D}${sysconfdir}/init.d/irqbalanced
>  
>          install -d ${D}${systemd_unitdir}/system
> -        install -m 0644 ${WORKDIR}/irqbalanced.service ${D}${systemd_unitdir}/system
> -        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/irqbalanced.service
> +        install -m 0644 ${S}/misc/irqbalance.service ${D}${systemd_unitdir}/system/irqbalanced.service
>  }
> diff --git a/recipes-extended/irqbalance/irqbalance/irqbalanced.service b/recipes-extended/irqbalance/irqbalance/irqbalanced.service
> deleted file mode 100644
> index 5b284faa..00000000
> --- a/recipes-extended/irqbalance/irqbalance/irqbalanced.service
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -[Unit]
> -Description=irqbalance daemon
> -After=syslog.target
> -
> -[Service]
> -ExecStart=@SBINDIR@/irqbalance --foreground
> -
> -[Install]
> -WantedBy=multi-user.target
> diff --git a/recipes-extended/irqbalance/irqbalance_git.bb b/recipes-extended/irqbalance/irqbalance_git.bb
> index 48774889..a944c2f1 100644
> --- a/recipes-extended/irqbalance/irqbalance_git.bb
> +++ b/recipes-extended/irqbalance/irqbalance_git.bb
> @@ -10,7 +10,6 @@ PV = "1.8.0+git${SRCPV}"
>  SRC_URI = "git://github.com/Irqbalance/irqbalance;branch=master;protocol=https \
>             file://add-initscript.patch \
>             file://irqbalance-Add-status-and-reload-commands.patch \
> -           file://irqbalanced.service \
>            "
>  
>  S = "${WORKDIR}/git"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7854): https://lists.yoctoproject.org/g/meta-virtualization/message/7854
> Mute This Topic: https://lists.yoctoproject.org/mt/96981111/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


