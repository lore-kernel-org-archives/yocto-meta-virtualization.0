Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398C3C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 14:58:15 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web09.6544.1657205889065145194
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 07 Jul 2022 07:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AhNfT/25;
 spf=pass (domain: gmail.com, ip: 209.85.222.171,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id p17so1290245qkj.10
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 07 Jul 2022 07:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=EZLtmSkfvr0poVpNL3a3RPEJdW+qf+oVtgfdfRwwyOM=;
        b=AhNfT/25Ny/S319em/gtmgG1vslj9iHoE7O3UJb0byMwHcV0WyW9PdifoT7ZRBpIXR
         K8o1S8vjDTCmrNH5Sx8Hpn6P5/dAf+9HtAiBof5XzCLKu76+1DlJkScR8PAM5uyOe8mL
         FrPmHzC1j7vF3KibRDyCvFTBwRVjy6M19RMr+5+r6pEMNAVAVodEHoQPob7Y1FU+ep/w
         8575uCWOEDtFs6KGjzaHy6tRGEu45grM4vUrQ3w81V4TmOlCJL+0yRfUZevsgzFALpyR
         TNK/VYpym5hcd2/+tLSwAqZCflSwVm1vVVuhWRCuAf9FReZBHlXVsbRDmXgDYo9+VQD/
         oIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EZLtmSkfvr0poVpNL3a3RPEJdW+qf+oVtgfdfRwwyOM=;
        b=tEkuMNG73gG05hLIOsKrWdfpmrJmN3H7aqirBMX92VvmcZnpNs4S/hEiF805If06KU
         mvA+uYXtpl4o9vLiQVBS5Xsx52yv1lw+lGcA7+78bcwmIY+scyUgEi5xdTtxKcoi2RoQ
         px0kj5hohxyQn6MVdiBcPRqe7ashg4xsUhb8Bs9SANh6RISmNoeIqwIaqOR6Fkj8WY/E
         cekx3mRzUV+Ku4WKIgaXJNL3MqyUAgFhjhUl5jW5Cgp9XH+4OvpBhW0a6qXIOxu0Ol5K
         xLJaJMi7PzFS+cLt7L8AQnLhgxm2GrbxGa02m6lEYrJ9ys3NLobxStkI4+GPqakjiWKG
         Izyg==
X-Gm-Message-State: AJIora9WOxd+cwRxi0lCH/XhCpwFl1oxv15P0O5TMRD4n4iKnX4j750T
	Z31zm6cxqD1uh8i1dNFG9wE=
X-Google-Smtp-Source: 
 AGRyM1uf2mhNITrcpURkw5AHZZ1v4ZYwI9nNnlx5o0pzsLF9LFJ5wXVc2eHB5LSh2HDtbHsmyjAtnQ==
X-Received: by 2002:a05:620a:17a8:b0:6af:32f0:44bb with SMTP id
 ay40-20020a05620a17a800b006af32f044bbmr32504705qkb.271.1657205887870;
        Thu, 07 Jul 2022 07:58:07 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 fw3-20020a05622a4a8300b0031e7b06edbasm7250783qtb.67.2022.07.07.07.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 07:58:06 -0700 (PDT)
Date: Thu, 7 Jul 2022 10:58:05 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][kirkstone][PATCH 1/2] runc: update to 1.1.2
Message-ID: <20220707145804.GC40251@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707015246.14696-2-Qi.Chen@windriver.com>
 <20220707015246.14696-1-Qi.Chen@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 07 Jul 2022 14:58:15 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7418

merged.

Bruce

In message: [meta-virtualization][kirkstone][PATCH 1/2] runc: update to 1.1.2
on 06/07/2022 Chen Qi wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Bumping runc to version v1.1.2-9-gb507e2da, which comprises the following commits:
> 
>     bf1cd884 ci: use golangci-lint-action v3, GO_VERSION
>     1feafc31 ci: bump golangci-lint to v1.44
>     89f79ff0 libct: StartInitialization: fix %w related warning
>     3b7f2605 Format sources using gofumpt 0.2.1
>     eeac4e77 build(deps): bump actions/checkout from 2 to 3
>     cd7fa00d Vagrantfile.fedora: fix build wrt new git
>     cdfdbe55 VERSION: back to development
>     a916309f VERSION: release 1.1.2
>     364ec0f1 runc: do not set inheritable capabilities
>     8959e372 VERSION: back to development
>     52de29d7 VERSION: release 1.1.1
>     2636e1cb CHANGELOG.md: add 1.1.1 release notes
>     036cc348 CI/cirrus: add centos-stream-9
>     db953158 README.md: add cirrus-ci badge
>     ea19181e README,libct/README: fix pkg.go.dev badges
>     8290c4cf libct/cg: IsCgroup2HybridMode: don't panic
>     ee7ba6cb configs/validate: looser validation for RDT
>     96193422 libct/cg/sd/v2: fix ENOENT on cgroup delegation
>     35784a3e ensure the path is a sub-cgroup path
>     986e7c53 libct: fixStdioPermissions: ignore EROFS
>     5053a065 libct: fixStdioPermissions: skip chown if not needed
>     d2939b6b libct: fixStdioPermissions: minor refactoring
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/runc/runc-opencontainers_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
> index ab573107..14570b9d 100644
> --- a/recipes-containers/runc/runc-opencontainers_git.bb
> +++ b/recipes-containers/runc/runc-opencontainers_git.bb
> @@ -1,10 +1,10 @@
>  include runc.inc
>  
> -SRCREV = "b9460f26b49efa086b99f32557219d0f24bd23ae"
> +SRCREV = "b507e2da6c6a3a328f208fa415a56ad7cd58761b"
>  SRC_URI = " \
>      git://github.com/opencontainers/runc;branch=release-1.1;protocol=https \
>      file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
>      "
> -RUNC_VERSION = "1.1.0"
> +RUNC_VERSION = "1.1.2"
>  
>  CVE_PRODUCT = "runc"
> -- 
> 2.37.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7413): https://lists.yoctoproject.org/g/meta-virtualization/message/7413
> Mute This Topic: https://lists.yoctoproject.org/mt/92220360/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


In message: [meta-virtualization][kirkstone][PATCH 2/2] runc/docker: update to 1.1.2
on 06/07/2022 Chen Qi wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Bumping runc to version v1.1.2-9-gb507e2da, which comprises the following commits:
> 
>     bf1cd884 ci: use golangci-lint-action v3, GO_VERSION
>     1feafc31 ci: bump golangci-lint to v1.44
>     89f79ff0 libct: StartInitialization: fix %w related warning
>     3b7f2605 Format sources using gofumpt 0.2.1
>     eeac4e77 build(deps): bump actions/checkout from 2 to 3
>     cd7fa00d Vagrantfile.fedora: fix build wrt new git
>     cdfdbe55 VERSION: back to development
>     a916309f VERSION: release 1.1.2
>     364ec0f1 runc: do not set inheritable capabilities
>     8959e372 VERSION: back to development
>     52de29d7 VERSION: release 1.1.1
>     2636e1cb CHANGELOG.md: add 1.1.1 release notes
>     036cc348 CI/cirrus: add centos-stream-9
>     db953158 README.md: add cirrus-ci badge
>     ea19181e README,libct/README: fix pkg.go.dev badges
>     8290c4cf libct/cg: IsCgroup2HybridMode: don't panic
>     ee7ba6cb configs/validate: looser validation for RDT
>     96193422 libct/cg/sd/v2: fix ENOENT on cgroup delegation
>     35784a3e ensure the path is a sub-cgroup path
>     986e7c53 libct: fixStdioPermissions: ignore EROFS
>     5053a065 libct: fixStdioPermissions: skip chown if not needed
>     d2939b6b libct: fixStdioPermissions: minor refactoring
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/runc/runc-docker_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
> index dc93a7c0..f2c0613b 100644
> --- a/recipes-containers/runc/runc-docker_git.bb
> +++ b/recipes-containers/runc/runc-docker_git.bb
> @@ -2,13 +2,13 @@ include runc.inc
>  
>  # Note: this rev is before the required protocol field, update when all components
>  #       have been updated to match.
> -SRCREV_runc-docker = "b9460f26b49efa086b99f32557219d0f24bd23ae"
> +SRCREV_runc-docker = "b507e2da6c6a3a328f208fa415a56ad7cd58761b"
>  SRC_URI = "git://github.com/opencontainers/runc;branch=release-1.1;name=runc-docker;protocol=https \
>             file://0001-runc-Add-console-socket-dev-null.patch \
>             file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
>             file://0001-runc-docker-SIGUSR1-daemonize.patch \
>            "
>  
> -RUNC_VERSION = "1.1.0"
> +RUNC_VERSION = "1.1.2"
>  
>  CVE_PRODUCT = "runc"
> -- 
> 2.37.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7412): https://lists.yoctoproject.org/g/meta-virtualization/message/7412
> Mute This Topic: https://lists.yoctoproject.org/mt/92220359/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



