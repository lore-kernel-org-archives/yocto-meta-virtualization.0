Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F26B0ECAAA2
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 02:52:22 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.32755.1661482342109174939
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 25 Aug 2022 19:52:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=St8xJBvA;
 spf=pass (domain: gmail.com, ip: 209.85.160.171,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id r6so375453qtx.6
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 25 Aug 2022 19:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc;
        bh=JigIeTAUpIGo5Sx6n/02YuDTFSNfEDPRg7cmcJpYSZ0=;
        b=St8xJBvA5In4At/7bLPaWXKY9iH42Xp5RNQZcFQ+LW5BnWVAR/KzgEc4x6TXqBB06Q
         FR+bgkfPq1VjGzSMNJ6wbeNmXNKwDqry5XZo2OuHZf+LeREJ6j94HSMzv89vSziIbg+z
         n7lrFwE+aWhsjHd5Hw4Qea9pqtbGaM5f1AwD/NYzsAykiZkiL6/xN6QyZaUPWILsY4dK
         mB4MuZNK9diXfu4hHFDhhV2UnEdmH1nvduvYXlFXOwMip3RvTKNeraDrBelYvg597AOH
         8qA5TGGUGxWFEpYGpA1pWM3/QnU2gVOnpDD4hOFdnd/5nXMJ9+lSsTxglvyLojZfQI2e
         1Ygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=JigIeTAUpIGo5Sx6n/02YuDTFSNfEDPRg7cmcJpYSZ0=;
        b=zoIzG1ngPEyxlsAXF2qlGwzLYPotEpehcR9L+7kIBIWIWUDWQBH0p9BYKMXxXRlEgz
         n9O3CC7uWgy2sMZdXkhVBrvpL5EEDeQGy6e/WPZigIXn5jdXGdGQZM6ZIt3Ab2TTWowh
         Us6WelhqomixZCunxBpu7FQ9B9rNylttRSUFZAl4YhJnyd49ckNqZGLyfQjZ95/ckIDa
         /8NGv4YUmW+Zx/5O5MDtsgxsTt8jWnPhojDdql3Kf2/MPmgr29VjhNml6JpHb3ez2MzO
         iAaTIysxFJlM6DMdRRPvieXztF9SjKXWCdHD6Ywk1CGGyt9ct6nhWHXoOAlHa+l5TB53
         QfIg==
X-Gm-Message-State: ACgBeo1zmHgmCEDusnpmE1ESRo5+24XqCTClEs46jRrm2zXD+Ihwxbcw
	kcKj4D4NquKtnNc1BC3hSG2p181UyYc=
X-Google-Smtp-Source: 
 AA6agR6ZAsLaA2qzcOkPd/b7P8pgTqoixo1qtCWkuuiAopF3NrY4CXNRKkyvwc08bldQcOJwMvpicg==
X-Received: by 2002:a05:622a:310:b0:344:89e4:cf8a with SMTP id
 q16-20020a05622a031000b0034489e4cf8amr6139983qtw.206.1661482341169;
        Thu, 25 Aug 2022 19:52:21 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 m26-20020a05620a215a00b006a6d7c3a82esm825652qkm.15.2022.08.25.19.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 19:52:20 -0700 (PDT)
Date: Thu, 25 Aug 2022 22:52:18 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Andrei Gherzan <andrei@gherzan.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: Re: [meta-virtualization][kirkstone][PATCH] podman: Rename
 podman-rootless.conf sysctl file to aid overrides
Message-ID: <20220826025217.GB23530@gmail.com>
References: <20220825163310.841981-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220825163310.841981-1-andrei@gherzan.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 26 Aug 2022 02:52:22 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7569

merged to kirkstone.

Bruce


In message: [meta-virtualization][kirkstone][PATCH] podman: Rename podman-rootless.conf sysctl file to aid overrides
on 25/08/2022 Andrei Gherzan wrote:

> From: Andrei Gherzan <andrei.gherzan@huawei.com>
> 
> Files are sorted in lexicographic order. Moving podman-rootless.conf to
> something greater then '00' would help with systems providing default
> values in other configuration files that can be overridden by
> podman-rootless.conf.
> 
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ---
>  .../{00-podman-rootless.conf => 50-podman-rootless.conf}      | 0
>  recipes-containers/podman/podman_git.bb                       | 4 ++--
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename recipes-containers/podman/podman/{00-podman-rootless.conf => 50-podman-rootless.conf} (100%)
> 
> diff --git a/recipes-containers/podman/podman/00-podman-rootless.conf b/recipes-containers/podman/podman/50-podman-rootless.conf
> similarity index 100%
> rename from recipes-containers/podman/podman/00-podman-rootless.conf
> rename to recipes-containers/podman/podman/50-podman-rootless.conf
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index e155c7b..aedb988 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -22,7 +22,7 @@ SRC_URI = " \
>      git://github.com/containers/libpod.git;branch=v4.0;protocol=https \
>      file://0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch;patchdir=src/import \
>      file://0002-Define-ActKillThread-equal-to-ActKill.patch;patchdir=src/import/vendor/github.com/seccomp/libseccomp-golang \
> -    ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://00-podman-rootless.conf', '', d)} \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-rootless.conf', '', d)} \
>  "
>  
>  LICENSE = "Apache-2.0"
> @@ -105,7 +105,7 @@ do_install() {
>  
>  	if ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'true', 'false', d)}; then
>  		install -d "${D}${sysconfdir}/sysctl.d"
> -		install -m 0644 "${WORKDIR}/00-podman-rootless.conf" "${D}${sysconfdir}/sysctl.d"
> +		install -m 0644 "${WORKDIR}/50-podman-rootless.conf" "${D}${sysconfdir}/sysctl.d"
>  	fi
>  }
>  
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7563): https://lists.yoctoproject.org/g/meta-virtualization/message/7563
> Mute This Topic: https://lists.yoctoproject.org/mt/93252176/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


