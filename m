Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web08.20196.1612705699589090656
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 07 Feb 2021 05:48:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YgV/IgBv;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id w20so8597852qta.0
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 07 Feb 2021 05:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZMsP+AV7R5c36pCREiUwI5qQjx/GLLEQH5wV0Vu00TE=;
        b=YgV/IgBvxIcKx7/Xtuf1I4HsRYtUk5uC17xuPQ5qvW4VgLyTNVSqJT2PAA+Oxw4PAJ
         pgmsQ06wIqCaPP03EILHpzff505VQQLMNizsEjnrwcEXOcLYcsLDBaSixmlrHOnqzEsr
         hLl3aaYK8goMJCrr4gkW+y3YLUEuOlqJF1eqNFTX6ce11qUMHgARShP7Bt6JYu9Fpjwt
         HIgc0JpIci5l9hrzQo8ZTnE1pPq+UxLLMShalmXvNNsQxEm4DjAoOfTlQVXKQedGCHD8
         lYvFIQ13wNWlvZ6n+vejcQXV50yiyYs3sO+U7+2SxVkz7D/wxVTJWh3ucBWUPDF7DYa5
         O9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZMsP+AV7R5c36pCREiUwI5qQjx/GLLEQH5wV0Vu00TE=;
        b=awI9/si0cJ6VCL6q4xAmzr9BpXQDmYJmlGzHljElj7+Z2XDDnQxjyQLObreYFYbtny
         FtD2KSfYX34NhLuK9+J5+iQo6ZQ2O8k7akxf+EV5SdNCD1EbY4IVkzL1NwVSdiv42LYy
         xvyZswvOdghHOv/cxqYwHjqk9IelXvVEpYSvrqvGRpjUYd1/A69QalwFXx7uSPNbABwf
         pFNxstLyjq+xxDKnkea9nwMKW8BSmRKfC1ImRkZJ77FfFJBHe4sTNVRbyiD/0elqu1JL
         HRKSKKALi1U4TVJOnKo3yCGPFt3Veb5Aluc9Izq6gAtLlu0JDPWX94f4YL85aq4ce+Tj
         72Xw==
X-Gm-Message-State: AOAM532zPi3XVGXTS5HmWAdqxaECpBQGMeA/fglWeoQHyVkgEc1ewf1a
	Z3VjLo9KRP1T2K40zMyz6vYHaVgLbTsyMrDd
X-Google-Smtp-Source: ABdhPJypSJmY3hmvJcxVIQMAlsJUMAdGSYPp0tSA6Yf6bLA0XKjuVtPl/UjvFc9YMNYho8Y4/UYZIg==
X-Received: by 2002:ac8:5047:: with SMTP id h7mr11494766qtm.25.1612705698717;
        Sun, 07 Feb 2021 05:48:18 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id t71sm14759009qka.86.2021.02.07.05.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 05:48:18 -0800 (PST)
Date: Sun, 7 Feb 2021 08:48:16 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] lxc: upgrade to 4.0.5
Message-ID: <20210207134816.GB48372@gmail.com>
References: <20210125033403.46162-1-mingli.yu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20210125033403.46162-1-mingli.yu@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

My apologies, I was doing a set of queued uprevs this weekend, and moved
lxc to 4.0.6, so I jumped right over this version before I checked my
pending queue.

Thanks for the version bump though, it is appreciated.

Bruce


In message: [meta-virtualization] [PATCH] lxc: upgrade to 4.0.5
on 25/01/2021 Yu, Mingli wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Remove 2 backported patches.
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  ...setting-regarding-the-Standard-Outpu.patch | 35 -------------------
>  ...ed-options-in-lxc.service-fixes-3527.patch | 31 ----------------
>  .../lxc/{lxc_4.0.4.bb => lxc_4.0.5.bb}        |  5 +--
>  3 files changed, 1 insertion(+), 70 deletions(-)
>  delete mode 100644 recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
>  delete mode 100644 recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
>  rename recipes-containers/lxc/{lxc_4.0.4.bb => lxc_4.0.5.bb} (95%)
> 
> diff --git a/recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch b/recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
> deleted file mode 100644
> index ab97422..0000000
> --- a/recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From a7a92a06a47322dee45664db5c7bfa68b2b95edb Mon Sep 17 00:00:00 2001
> -From: Mingli Yu <mingli.yu@windriver.com>
> -Date: Wed, 23 Sep 2020 07:03:02 +0000
> -Subject: [PATCH] Remove obsolete setting regarding the Standard Output
> -
> -The Standard output type "syslog" is obsolete, causing a warning since systemd
> -version 246 [1].
> -
> -Please consider using "journal" or "journal+console"
> -
> -[1] https://github.com/systemd/systemd/blob/master/NEWS#L202
> -
> -Upstream-Status: Submitted [https://github.com/lxc/lxc/pull/3541]
> -
> -Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ----
> - config/init/systemd/lxc@.service.in         | 2 --
> - 1 files changed, 2 deletions(-)
> -
> -diff --git a/config/init/systemd/lxc@.service.in b/config/init/systemd/lxc@.service.in
> -index a2aa2211f..21ce64aef 100644
> ---- a/config/init/systemd/lxc@.service.in
> -+++ b/config/init/systemd/lxc@.service.in
> -@@ -14,8 +14,6 @@ ExecStop=@BINDIR@/lxc-stop -n %i
> - # Environment=BOOTUP=serial
> - # Environment=CONSOLETYPE=serial
> - Delegate=yes
> --StandardOutput=syslog
> --StandardError=syslog
> - 
> - [Install]
> - WantedBy=multi-user.target
> --- 
> -2.26.2
> -
> diff --git a/recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch b/recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
> deleted file mode 100644
> index 2957680..0000000
> --- a/recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 0c4cd88d4a19d27ba9b5d2c8fa4d482d78211c35 Mon Sep 17 00:00:00 2001
> -From: graysky <graysky@archlinux.us>
> -Date: Fri, 21 Aug 2020 06:33:49 -0400
> -Subject: [PATCH] remove deprecated options in lxc.service fixes #3527
> -
> -Remove deprecated options in lxc.service fixes #3527
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: graysky <graysky@archlinux.us>
> -Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ----
> - config/init/systemd/lxc.service.in | 2 --
> - 1 file changed, 2 deletions(-)
> -
> -diff --git a/config/init/systemd/lxc.service.in b/config/init/systemd/lxc.service.in
> -index e3745dc2d..397a6c4d0 100644
> ---- a/config/init/systemd/lxc.service.in
> -+++ b/config/init/systemd/lxc.service.in
> -@@ -14,8 +14,6 @@ ExecReload=@LIBEXECDIR@/lxc/lxc-apparmor-load
> - # Environment=BOOTUP=serial
> - # Environment=CONSOLETYPE=serial
> - Delegate=yes
> --StandardOutput=syslog
> --StandardError=syslog
> - 
> - [Install]
> - WantedBy=multi-user.target
> --- 
> -2.26.2
> -
> diff --git a/recipes-containers/lxc/lxc_4.0.4.bb b/recipes-containers/lxc/lxc_4.0.5.bb
> similarity index 95%
> rename from recipes-containers/lxc/lxc_4.0.4.bb
> rename to recipes-containers/lxc/lxc_4.0.5.bb
> index 19b40f6..384736b 100644
> --- a/recipes-containers/lxc/lxc_4.0.4.bb
> +++ b/recipes-containers/lxc/lxc_4.0.5.bb
> @@ -47,14 +47,11 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>  	file://templates-use-curl-instead-of-wget.patch \
>  	file://tests-our-init-is-not-busybox.patch \
>  	file://tests-add-no-validate-when-using-download-template.patch \
> -	file://0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch \
> -	file://0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch \
>  	file://dnsmasq.conf \
>  	file://lxc-net \
>  	"
>  
> -SRC_URI[md5sum] = "6197096cf11da286b9f9ee02dee9dc50"
> -SRC_URI[sha256sum] = "3c65a8ba20ed2b66c2075dc914aa632f76d0137af707b851b62b5555fed7d995"
> +SRC_URI[sha256sum] = "af2cd616d5ab689e5d2305361c6571b5e632afd7eaab1754cca1670446a2e6a4"
>  
>  
>  
> -- 
> 2.17.1
> 

> 
> 
> 

