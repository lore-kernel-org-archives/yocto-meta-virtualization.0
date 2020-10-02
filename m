Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.3950.1601608107729867212
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Oct 2020 20:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Yu3DcR3X;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
	by mail.yoctoproject.org (Postfix) with ESMTPS id C2CCE38C07FA
	for <meta-virtualization@yoctoproject.org>; Thu,  1 Oct 2020 20:08:26 -0700 (PDT)
Received: by mail-qt1-f196.google.com with SMTP id e7so122255qtj.11
        for <meta-virtualization@yoctoproject.org>; Thu, 01 Oct 2020 20:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Iefa3yv/DHZyYdPTDHt6fuLq9apWx3cFpM0ktOBoxXY=;
        b=Yu3DcR3XnBO3Em1y84mnLzaR7YdfWzRaBckn+ewrXS6FpDvHmYO84gO0UK6EUFQOsj
         CeQYB9Ush0l93dL2yzxc6uHRHx9gRhzt1/2l/CthSJiJskOqkrfhF9iAOO1lkI8xmoNL
         V0frEc/gXyCPUMVGPPbp65aCBIrjx2ZaFjmjs0vnYDQnjX/FO7Iv8YFUPX7CmmmGu9OL
         E7bGSn00bAsPDuEztCnI0NkiimWByog6BOzUzmJZfm0+YYemTJiHOm5TKMpxJ++bFVBh
         F+5XKmRTqhzJgp8o9mvfkOubNA+cFQ6RtYuo2yY7nUWcpEdcCt7k6DJM5bgxauXjg172
         lNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Iefa3yv/DHZyYdPTDHt6fuLq9apWx3cFpM0ktOBoxXY=;
        b=Fa7jp6WwDHpQ8oER1KqCASGo0Iz+R9x1MfSQCB3n5uFLtp0NewbOz3AvBv996M2wzB
         5NdwHGd3VaB8l1Snyj2jhN18ywo8ENivUQXPnFDoxRxNlAGq+ZBUOGN/iQhQDt3LF0Uv
         gtncqINGA2k0zgVptyxLjEPTiJ218LH++Iz2JwTOiLDq+nGWgR/JUEkeIAWti3aoKxfh
         s+ylSXk0ziq2TgADKBhWZ+7ZWMV8MyDDeXTF7XMMA8DSN3pxZ7qPKkvocDd2P7TRXi51
         i46i2C++hFCKg9QffYj/8q9xq7Whcu3XxwD8V1MUP/m35Yw4WPODIjxdA0BgY7ufNmmm
         CNzQ==
X-Gm-Message-State: AOAM533BBC0i4m0WUKOQLA8fz0zMKF9ooAKhWJrMFHHFQgQf2BKAbmH+
	9mkAixwNStPwlCRJUSKKDc0=
X-Google-Smtp-Source: ABdhPJyWUpwbzqmnv4O1cKwSyzJkbu0AwpNvThs6ST57LOJ8bIM0mvyi2LBSeCUu3kLnx3JwMq/qBQ==
X-Received: by 2002:aed:3162:: with SMTP id 89mr380615qtg.315.1601608105646;
        Thu, 01 Oct 2020 20:08:25 -0700 (PDT)
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id x18sm152355qth.47.2020.10.01.20.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 20:08:25 -0700 (PDT)
Date: Thu, 1 Oct 2020 23:08:23 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: mingli.yu@windriver.com
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH v3] lxc: remove deprecated options in lxc*.service
Message-ID: <20201002030820.GA52950@gmail.com>
References: <1638DCB9C95B4ECB.17423@lists.yoctoproject.org>
 <20200929020656.39793-1-mingli.yu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20200929020656.39793-1-mingli.yu@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

v3 is merged!

Bruce

In message: [PATCH v3] lxc: remove deprecated options in lxc*.service
on 29/09/2020 mingli.yu@windriver.com wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Remove deprecated options in lxc*.service to silence below warning:
>  # systemctl status lxc
>  [snip]
>  /usr/lib/systemd/system/lxc.service:17: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.
>  /usr/lib/systemd/system/lxc.service:18: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  ...setting-regarding-the-Standard-Outpu.patch | 35 +++++++++++++++++++
>  ...ed-options-in-lxc.service-fixes-3527.patch | 31 ++++++++++++++++
>  recipes-containers/lxc/lxc_4.0.4.bb           |  2 ++
>  3 files changed, 68 insertions(+)
>  create mode 100644 recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
>  create mode 100644 recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
> 
> diff --git a/recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch b/recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
> new file mode 100644
> index 0000000..ab97422
> --- /dev/null
> +++ b/recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
> @@ -0,0 +1,35 @@
> +From a7a92a06a47322dee45664db5c7bfa68b2b95edb Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Wed, 23 Sep 2020 07:03:02 +0000
> +Subject: [PATCH] Remove obsolete setting regarding the Standard Output
> +
> +The Standard output type "syslog" is obsolete, causing a warning since systemd
> +version 246 [1].
> +
> +Please consider using "journal" or "journal+console"
> +
> +[1] https://github.com/systemd/systemd/blob/master/NEWS#L202
> +
> +Upstream-Status: Submitted [https://github.com/lxc/lxc/pull/3541]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + config/init/systemd/lxc@.service.in         | 2 --
> + 1 files changed, 2 deletions(-)
> +
> +diff --git a/config/init/systemd/lxc@.service.in b/config/init/systemd/lxc@.service.in
> +index a2aa2211f..21ce64aef 100644
> +--- a/config/init/systemd/lxc@.service.in
> ++++ b/config/init/systemd/lxc@.service.in
> +@@ -14,8 +14,6 @@ ExecStop=@BINDIR@/lxc-stop -n %i
> + # Environment=BOOTUP=serial
> + # Environment=CONSOLETYPE=serial
> + Delegate=yes
> +-StandardOutput=syslog
> +-StandardError=syslog
> + 
> + [Install]
> + WantedBy=multi-user.target
> +-- 
> +2.26.2
> +
> diff --git a/recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch b/recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
> new file mode 100644
> index 0000000..2957680
> --- /dev/null
> +++ b/recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
> @@ -0,0 +1,31 @@
> +From 0c4cd88d4a19d27ba9b5d2c8fa4d482d78211c35 Mon Sep 17 00:00:00 2001
> +From: graysky <graysky@archlinux.us>
> +Date: Fri, 21 Aug 2020 06:33:49 -0400
> +Subject: [PATCH] remove deprecated options in lxc.service fixes #3527
> +
> +Remove deprecated options in lxc.service fixes #3527
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: graysky <graysky@archlinux.us>
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + config/init/systemd/lxc.service.in | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/config/init/systemd/lxc.service.in b/config/init/systemd/lxc.service.in
> +index e3745dc2d..397a6c4d0 100644
> +--- a/config/init/systemd/lxc.service.in
> ++++ b/config/init/systemd/lxc.service.in
> +@@ -14,8 +14,6 @@ ExecReload=@LIBEXECDIR@/lxc/lxc-apparmor-load
> + # Environment=BOOTUP=serial
> + # Environment=CONSOLETYPE=serial
> + Delegate=yes
> +-StandardOutput=syslog
> +-StandardError=syslog
> + 
> + [Install]
> + WantedBy=multi-user.target
> +-- 
> +2.26.2
> +
> diff --git a/recipes-containers/lxc/lxc_4.0.4.bb b/recipes-containers/lxc/lxc_4.0.4.bb
> index f526ab9..4ef5fc0 100644
> --- a/recipes-containers/lxc/lxc_4.0.4.bb
> +++ b/recipes-containers/lxc/lxc_4.0.4.bb
> @@ -47,6 +47,8 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>  	file://templates-use-curl-instead-of-wget.patch \
>  	file://tests-our-init-is-not-busybox.patch \
>  	file://tests-add-no-validate-when-using-download-template.patch \
> +	file://0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch \
> +	file://0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch \
>  	file://dnsmasq.conf \
>  	file://lxc-net \
>  	"
> -- 
> 2.26.2
> 
