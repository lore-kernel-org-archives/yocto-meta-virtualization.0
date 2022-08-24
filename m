Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64471C32793
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 01:48:29 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web08.6333.1661305699024860722
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 23 Aug 2022 18:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M3rvVpph;
 spf=pass (domain: gmail.com, ip: 209.85.219.47,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id d1so11916418qvs.0
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 23 Aug 2022 18:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc;
        bh=3AjONt7xNqWk0g6slMGv9yh7bkd8QSvGahWZLA2z6Og=;
        b=M3rvVpph5uitjveV/YkznBRQJ2HH22tLCvm1WYZvYLaCYxB7M+taS/Yb2oXjFaor6d
         qihAiGRsnCgWxnhMvhuUGwvqnHOYntsI5GMdl3Bg+ZY0OKc846YjzHYomUJNnEq+2baA
         k2wGqOtbgGRVhO7dLFyaXPJJgs4qTOxXbR6ccZbMUkk+2Ybxl7wxKLU1N/3nu71seun4
         G46ygApOCwDG6zHASM84qRL6WAUWLUEC1Arjr4cr9QbfXSnRiN0NS2vMUSqA+d8F80t1
         2cFOAY2odDY0GL7bnzglwUDf2MqG85nywS1zIXIZs3j4mBEaT5qXCYfDd6C7liv8nYRK
         xKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=3AjONt7xNqWk0g6slMGv9yh7bkd8QSvGahWZLA2z6Og=;
        b=z6lFGjKlWmHtGEtxcJJNl/Idntq3qYgqeygTXNOFCS88xFaGLHFhpwjRWNE51RG8+Y
         bqjyw2KUGhxqT3TCgxNHhWEUVY22gs9UqboF4FcU07LVlN1x9roWjbyuDZRY7NxT1ku/
         J/aLYVVqhEyGW8V9rC0NxWIV4iUNqVMTWyZ9GzeccGXOv1txBmvfkXHzE2S7Zs+EKYHP
         aQO9k1xh6VdOVOMQJazAZLgOsb9HobwRbqRogZDC3IU0VXUhkGEtE6o064QaEwooJGUJ
         yPGVrq50PQI236JHVL52dROm77PnbBhFGX7mPT3lNZIkRtQqTBr1zcIRxZbGJUKm9y10
         v7zg==
X-Gm-Message-State: ACgBeo2YPwT0bTEQqZ8i2QSy9eDU/GOoq/J7pw5Of2z5YgnSQF93rJQy
	HC1lPghQKB3iWvpkYDHcKKc=
X-Google-Smtp-Source: 
 AA6agR7B6V9mZh2jACJvt4DCeiF65XZ62inT2m/ryFaHdvm72EnsXKE6SwsjTH5vh2yqJr7VXiPgoQ==
X-Received: by 2002:a05:6214:b6e:b0:496:c4de:c014 with SMTP id
 ey14-20020a0562140b6e00b00496c4dec014mr19052318qvb.23.1661305697979;
        Tue, 23 Aug 2022 18:48:17 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 q11-20020a05622a030b00b00342fb07944fsm12880299qtw.82.2022.08.23.18.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 18:48:17 -0700 (PDT)
Date: Tue, 23 Aug 2022 21:48:15 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Andrei Gherzan <andrei@gherzan.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: Re: [meta-virtualization][PATCH] podman: Rename podman-rootless.conf
 sysctl file to aid overrides
Message-ID: <20220824014814.GB3948@gmail.com>
References: <20220824000719.2495588-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220824000719.2495588-1-andrei@gherzan.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Aug 2022 01:48:29 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7558

merged.

Bruce

In message: [meta-virtualization][PATCH] podman: Rename podman-rootless.conf sysctl file to aid overrides
on 24/08/2022 Andrei Gherzan wrote:

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
> index 9b92094..e999192 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -22,7 +22,7 @@ SRC_URI = " \
>      git://github.com/containers/libpod.git;branch=v4.1;protocol=https \
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
> View/Reply Online (#7556): https://lists.yoctoproject.org/g/meta-virtualization/message/7556
> Mute This Topic: https://lists.yoctoproject.org/mt/93217340/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


