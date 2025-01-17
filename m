Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 255D7C02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 18:18:52 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.1761.1737137925990846505
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 10:18:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gw3L4k51;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7b98a2e3b3eso123758485a.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Jan 2025 10:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737137925; x=1737742725; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=flLq74IqOMAmdxF5g7upLKcRy5/OSYftMuHa8ltDhp0=;
        b=Gw3L4k51rIMDliHA/fS8m1KPm1goCMEm2LiP4pERDtpL709NthPG7cyK1SpMrkIsze
         j+Cu8T7BnAton9HmAzBxpks/qVtedVKi/GnQViCOBBq7SZOppX/Y/R9/wXNkU+tHoDtP
         TRPYgjzovxAkiWX54P03mgQbH9Ec7tU8jTX/vDz1xZsul6/D827TkJxa0i+ddy3oj1WI
         OpmsZzy6pSKeG04WASgdws+0Ewkind2G8Z31jb0FdZ69Y6iuk0Cjgi9ASUEY4+W//j/w
         v9h3C9ebnOzGA9c/5QOeFhOgrbCyD7SZr+vfGMPpU+hwcUpmL7slsg+/HImAMCeomRPY
         dRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737137925; x=1737742725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=flLq74IqOMAmdxF5g7upLKcRy5/OSYftMuHa8ltDhp0=;
        b=Rv8ZEfEvubVK7t9SXGGekLiQAzmg877xjcLjMFiPIltWv5Fl7sD3huHCctmbe7AWeH
         DyTW/Bn58mqlAKo17FUAIiESrRjGgoE+e1zYTqlVJsaufqMqvyDR2kwOvFBPjWO/v/5Z
         1pTVoSWgbkWWc0GiXAtmX7d/rbb9WZ6V/TBF0qbfx2sYK2uxiZUBRv8doVYVozZZ/Cre
         d4JtwJ6LrY2Mczat7IYidUC4jM6t6ve9Ia0p3fDAPLuydjGT2vAOnT/lfegJCFrVcjAT
         mhgVjkj9QZMTek2r1tKNQ4brYvwgrvRx6ccS2Z72bVm/DJVLULjFdkDFQ5X3xmemOhSi
         E/ww==
X-Gm-Message-State: AOJu0Yy1hrSVvYVQntpIO0QjraBvz+U6GnABXwmhg/NaOH4XzTJ5Tgxu
	wVIR4jhB8nGLx8XdboPdd5P6cfsz0Vvhbwpu6DOp7UBACK4m1EF1
X-Gm-Gg: ASbGnctOP1zGXeyNqUGG3ckBchD9/UjA1T5zVISs3wMFVegD/FSveSRXWOVlm53bEU7
	4Ox687hHySJQIkLBjbndpll3GFeMXhMM/CakPMUMDQPC6EQGKRRuxf1FYFvIvPg4hcj3LCMjAcv
	5sp00xMndA4WCdAYBMw/CuHJqnY1XYrHvBF7y0bcUTrk4JaIvLQlpDr8ZkH5l4HdDsB0TrUnOBs
	6sUS5axGKqnP8uTDQb2N0i9fQlvTqwVM8zYiqb2wBO0RhI0LCXGN8dsniMTZ3r70onvRSetJaJG
	dnlVroq62Xwu17D8kJgcjiLtXNnEouYNH54=
X-Google-Smtp-Source: AGHT+IGeZRd99ues/euqh1urD8TZiwYtWu7K6F0CXeKR++i+you422cpHUBdfHjxwDHGkREtNzPdfA==
X-Received: by 2002:a05:6214:242b:b0:6d4:3b7a:313a with SMTP id 6a1803df08f44-6e1b21c4a7amr73399016d6.32.1737137924767;
        Fri, 17 Jan 2025 10:18:44 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afcd38e8sm13685116d6.93.2025.01.17.10.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 10:18:44 -0800 (PST)
Date: Fri, 17 Jan 2025 18:18:42 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] go-metalinter: deprecate and remove
 it from podman's DEPENDS
Message-ID: <Z4qfArlOhhhE2pt8@gmail.com>
References: <20250108090754.1858999-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108090754.1858999-1-Qi.Chen@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Jan 2025 18:18:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9096

I've staged this patch.

I only took the podman dependency part, I won't depreciate it just yet.

Bruce

In message: [meta-virtualization][PATCH] go-metalinter: deprecate and remove it from podman's DEPENDS
on 08/01/2025 Chen Qi via lists.yoctoproject.org wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
> 
> This package is pure source package and its only user is podman's
> DEPENDS. The current podman does not need it to be built successfully.
> So let's remove it from podman's DEPENDS and make it deprecated.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/podman/podman_git.bb  | 1 -
>  recipes-devtools/go/go-metalinter_git.bb | 2 ++
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index 41bb419a..01644163 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -10,7 +10,6 @@ inherit features_check
>  REQUIRED_DISTRO_FEATURES ?= "seccomp ipv6"
>  
>  DEPENDS = " \
> -    go-metalinter-native \
>      gpgme \
>      libseccomp \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> diff --git a/recipes-devtools/go/go-metalinter_git.bb b/recipes-devtools/go/go-metalinter_git.bb
> index def3d063..5adab2d6 100644
> --- a/recipes-devtools/go/go-metalinter_git.bb
> +++ b/recipes-devtools/go/go-metalinter_git.bb
> @@ -16,6 +16,8 @@ PV = "0.0+git"
>  
>  S = "${WORKDIR}/git"
>  
> +inherit meta-virt-depreciated-warning
> +
>  do_install() {
>  	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
>  	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9079): https://lists.yoctoproject.org/g/meta-virtualization/message/9079
> Mute This Topic: https://lists.yoctoproject.org/mt/110493737/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


