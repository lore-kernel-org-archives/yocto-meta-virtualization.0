Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60018C32793
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 01:43:59 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web08.6293.1661305437735812089
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 23 Aug 2022 18:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f4M/jl8c;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id f14so11698854qkm.0
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 23 Aug 2022 18:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc;
        bh=zcIRdqaz8gBA78SlovGPW/1W/cq4btetDOYsknovpYk=;
        b=f4M/jl8cPN1Q0vVSiLcFwy9tNF5KlATaGOZ+otMqEi2mGFF2mE52CwZhcjgzB4hA6T
         j+ZqwYhS8AgWy25RFWcFJ2J43o0/35OcFg/JjUuVJhOZo/6XPXk8ofTN/33xGmPKRNWa
         05eo07IDXAKgvhRafWgXIiXcgU7iIn1LwWiSNwApzDyUvBOX9wtUIGUVSpzyZIdpMA2k
         jwbWwpko8uFdfxIcXJBbxYdgl1aYWeQlD301ojNcyomvvqn8+GQa3vf6KmyBOqVYDnBx
         ZDKNk9ukCgX4cxDAD+5tmEF1zHR+GvCwvL7Lwgdf3w1GgcXQ92F0hTakD2IDsD3OJJW0
         2AtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=zcIRdqaz8gBA78SlovGPW/1W/cq4btetDOYsknovpYk=;
        b=G+71/9HR+/1D1q0WaADCPrx1z+LWc6Usqa5lzNg1VdGXMwkiY5ut2yAe5aGDcQoGq1
         plZnpIGiufG4aWTfssDwC8dEkSugcvIQmSjFqrCulQxWw1zKfMB+ck146z169sO98pLT
         tZ7XWtIsQqWFS2tmEcgj7CklLEM60jMLqPQ4RbWpLle1Omhcl31EqLjEDL1IvIzSWSRW
         wL06xG+V2kuU9dPE8eiMqGH740xtrV5jVUA3ESc0I9oDEJmv4LwfGBJ/MEFb5weEfuaF
         RTB226Jrsf2HJUrunRQvZ/frGuWQibONnZ2Zcacy/UqZO1bOoZhsyNCgwXZySHMUFs0E
         9oWA==
X-Gm-Message-State: ACgBeo0PLC2hk21vVzbHaIxM2euLvw66/Jag9FXT4f340FSDxxuyGlsc
	1UKjw3m/eBDAQCuKEVeJ3cTAH8ezxHw=
X-Google-Smtp-Source: 
 AA6agR54M1Ve0oXGJ8mfkAHaMGraQRL9d6k9Ol3ZrHjZ/rlamzEj9G7d+2f2LGr4jPAQhVN9JCVMNg==
X-Received: by 2002:a05:620a:2004:b0:6bb:54c1:38cd with SMTP id
 c4-20020a05620a200400b006bb54c138cdmr18313107qka.332.1661305436626;
        Tue, 23 Aug 2022 18:43:56 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 bl8-20020a05622a244800b00342fdc4004fsm12049736qtb.52.2022.08.23.18.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 18:43:55 -0700 (PDT)
Date: Tue, 23 Aug 2022 21:43:54 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] irqbalance: Use built-in
 irqbalance.service instead of local one
Message-ID: <20220824014353.GA3948@gmail.com>
References: <20220822102356.1196575-1-zhe.he@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220822102356.1196575-1-zhe.he@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Aug 2022 01:43:59 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7557

merged!

Bruce

In message: [meta-virtualization][PATCH] irqbalance: Use built-in irqbalance.service instead of local one
on 22/08/2022 He Zhe wrote:

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
> 2.32.0
> 

