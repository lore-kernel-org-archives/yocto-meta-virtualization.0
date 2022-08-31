Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FEBDECAAD1
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 12:20:11 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web12.24825.1661948399868796222
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 31 Aug 2022 05:20:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BUDfjqxc;
 spf=pass (domain: gmail.com, ip: 209.85.160.175,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id h22so10777615qtu.2
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 31 Aug 2022 05:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc;
        bh=8gU+oxAd3DSmegKGfpEwxwNDz0delp2FnGyShyOkjFA=;
        b=BUDfjqxcdsqojha4V489oWQK9Zw+HuOog7OsaZe9iEa2btEVpiX8JYoO2GagDp+EDb
         QoszxkwlGWN+84D9oC8fhEhb7JJVI4U654BUs1O7Hxsz12KJrPQl/TYf/sZNjhdQJSc5
         zBQTIQvBicJ0guEhhQA7mTag1eJxC7aiOIioOnBAQHd+IsNfWFqhA7FWgEnpm1c0b60P
         BBaNQNdJzrHRPE0rfxsoS9q4+J6pqbiqrsh50/arejxLHioSccPwEOSblRXg9T5/wUFt
         F1tTAX07ssyDAbvS6IW0JuWFpUCgUyWUDyO1j8dhr0hJCXKydCV+gNAKn3FxAfcwVLWQ
         rJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=8gU+oxAd3DSmegKGfpEwxwNDz0delp2FnGyShyOkjFA=;
        b=rpHIastDqZFlNKaq4RW84INkwEbVopoq5JC5g8ojr/1Aum8zlSUIVxaKqw2iaReT2F
         rNU56VgP94RKT1N8+UEo8sUGuwTeXc9AdNc6gzIzSCFrSI3/qF1q6QQh7VyNBzFjBYNx
         20dIILDG327bYaRArw3EGco0BpuzH5F1nwlSksgQw7N6CFiaT7Xje7vkJ4CUz0Q65KrB
         M+YBvc+1Iij2aa3jkdIVmNQ3fB6RtPCfBvPX8Kt/rc076zlyBqTbNX1aF2y2k+aFCDLA
         Gq1KMIEOdHC6GMZdXnoDI2Sx+mbknoOoGX4StaCo41rCnzWulrhhofGhTpHC5ElMZdAX
         eymA==
X-Gm-Message-State: ACgBeo3amlqpFnNwUsEtZ/NPWiySVSV2g5ZFApbV7zhXAoM5BEaUVtpP
	XKmdDVvcmA8BQRhgqelQGHI=
X-Google-Smtp-Source: 
 AA6agR4qKQ4AAP1pRJTF1xSzJVeMnuhcJwT2mI8CvAz84KQEiz38Sz70NZre+ABHPDRVG8OaaTEhug==
X-Received: by 2002:a05:622a:58e:b0:343:79d8:2e76 with SMTP id
 c14-20020a05622a058e00b0034379d82e76mr18953192qtb.404.1661948398878;
        Wed, 31 Aug 2022 05:19:58 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 x6-20020ac86b46000000b00339b8a5639csm8559200qts.95.2022.08.31.05.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 05:19:58 -0700 (PDT)
Date: Wed, 31 Aug 2022 08:19:56 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Andrei Gherzan <andrei@gherzan.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: Re: [meta-virtualization][kirkstone][PATCH] podman: Fix merge typo
Message-ID: <20220831121954.GA32905@gmail.com>
References: <20220831110546.3898236-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831110546.3898236-1-andrei@gherzan.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 31 Aug 2022 12:20:11 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7588

merged.

Bruce

In message: [meta-virtualization][kirkstone][PATCH] podman: Fix merge typo
on 31/08/2022 Andrei Gherzan wrote:

> From: Andrei Gherzan <andrei.gherzan@huawei.com>
> 
> 2b28d64667e4c22434b9db0a87a1265a0caedb66 brought a typo when resolving
> merge/rebase conflict. This fixes it.
> 
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ---
>  recipes-containers/podman/podman_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index 65e0205..09bf827 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -23,7 +23,7 @@ SRC_URI = " \
>      file://0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch;patchdir=src/import \
>      file://0002-Define-ActKillThread-equal-to-ActKill.patch;patchdir=src/import/vendor/github.com/seccomp/libseccomp-golang \
>      file://CVE-2022-27649.patch;patchdir=src/import \
> -    ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://00-podman-rootless.conf', '', d)} \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-rootless.conf', '', d)} \
>  "
>  
>  LICENSE = "Apache-2.0"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7587): https://lists.yoctoproject.org/g/meta-virtualization/message/7587
> Mute This Topic: https://lists.yoctoproject.org/mt/93368235/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


