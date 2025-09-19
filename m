Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E18CA1013
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 02:41:53 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.6806.1758249711941378979
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 19:41:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZeWIWpVl;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-721504645aaso9221056d6.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Sep 2025 19:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758249711; x=1758854511; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dEeRYa0hvBC3vzgLyRptkEmxpYYt2mx/05/mloq18so=;
        b=ZeWIWpVlMR7DQx7pNtiMusdrPBCmvJDfpjsh17N0n5UUfvuDvCqdGpaqFIAjdobkS1
         YsW68DnU1ZMaq1Y16+JDtuXm0jP03jxwh07aZtxdE6/AaHmFojvEbfP6MtNvj/OAX6N9
         qcdI04ILhuMm100gXsjMdp+Wqfr82LE9oNGOyI7OR7gsqCXIOZsCSCw7vc0GwM/sgAft
         myfwCLNeHM5ZQ26wwxj5GSJR+DQoiqfFJvvua3PL5gaFlSR/XSuvObmbUP4w7R7Me1cZ
         W1ZGauuYWrk75Ogc9G9XyZaU2vt5IUmNJ2MMjBr8ARAjdrzmzA2IrvrBFqkber3UXmbM
         uFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758249711; x=1758854511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dEeRYa0hvBC3vzgLyRptkEmxpYYt2mx/05/mloq18so=;
        b=jdBdfwalecdNR48D3Um5IxdYgWUH+0Bx3mgLE8F9uJLf1ErcZj+Zu/FlrcV+DuwC9I
         Pdl/adwu7Rsdlxgo9MIX7tuRB+0zfpkJ28j/QNf10/EqO7oOdcDMF7GtKL7FPiH4Oq+E
         pVOipniwjNzW7r6hD4oX0snjVi78YM1knnYTvd0rt6Q6Ky3hO1j7DHbsPnhuX31h3hyD
         kXguvUOx13TNAbLY8LR4oCLV9BK3NuXKUZDLCJhYLpwhxavz91eduwKTq4uH4aRCeUNv
         la47eUc+q45x8xLW9ddyI0445VtYXNhfPnzcPleQGPsbTPD+Gh74ePYwgG+lOvtISm3P
         L6Jw==
X-Gm-Message-State: AOJu0YwXRIze6V771TVhLE8cCSbq1Bg6AKtglXMuBHVqCXbdEyeINrA/
	xCruTPWKajIkjzMI7aUCDc1uTBNqPD+wQMtb4cD74h4be3jUMEzA2dP00Sp6nhKDz20=
X-Gm-Gg: ASbGncsRLlGtlvvVhAOdzIuSVuj6J5HibDX19n5bXAJfh1BlX1wBgaz7UCM+YcgwUhL
	3AivLSqkI7yhWE4n+ooE+NBqlwtAROZ2Hxn8pKKOnPu+5DDVP6cefdZOINGWVqL6gvRjT4HcSqO
	Zuym5EKKTbMh+EIxaioCPkd1k7mzX+A+E+yuKa5qpzrBDJG4T/A62z2juO+lVheo2/8v4KLgfqg
	3YEH5eZy3HB5o7fA8g16I44+Rd3TEJ7M6xhXY1l4PYPr81nsrEfAAu6yx04RQiMIPsDUlMPxc8l
	GzWvZuSrZy2i/PE/mabtKEPM2AL86LRkp1OorgpJ+QskJ3O1EYj3x+yNpoCRwq09OuTisHTxp2L
	CFZ8Sof1hWygCPpJW1edhK4tgatqHbnbSJyqW+4GML/kDaRQb9ZRw6L9L82Sbe0Q2h9+JS9JJmQ
	RmZw73Lohr94wobhwNsNyduvXxXsqfm+7x
X-Google-Smtp-Source: AGHT+IE2DrwtjGMYyDUQYjBYYr4U2SXFDakm+57TKgEHRgY6gngLYktpsKP2om1bQYiQi1yrpFjv5g==
X-Received: by 2002:a05:6214:1c4e:b0:71a:e4c5:72c7 with SMTP id 6a1803df08f44-7990f96c406mr20397386d6.7.1758249710433;
        Thu, 18 Sep 2025 19:41:50 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-793443cfee2sm22483326d6.13.2025.09.18.19.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 19:41:49 -0700 (PDT)
Date: Thu, 18 Sep 2025 22:41:48 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Yogita.Urade@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][kirkstone][PATCH 1/2] podman: fix
 CVE-2024-9341
Message-ID: <aMzC7Gjti8wqxBCh@gmail.com>
References: <20250917095758.1036133-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917095758.1036133-1-yogita.urade@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 19 Sep 2025 02:41:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9406

See my comment on the other CVE patch, we need some information
about the versions and package -stable branches.

Bruce


In message: [meta-virtualization][kirkstone][PATCH 1/2] podman: fix CVE-2024-9341
on 17/09/2025 Urade, Yogita via lists.yoctoproject.org wrote:

> From: Yogita Urade <yogita.urade@windriver.com>
> 
> A flaw was found in Go. When FIPS mode is enabled on a system,
> container runtimes may incorrectly handle certain file paths due to
> improper validation in the containers/common Go library. This flaw
> allows an attacker to exploit symbolic links and trick the system
> into mounting sensitive host directories inside a container. This
> issue also allows attackers to access critical host files, bypassing
> the intended isolation between containers and the host system.
> 
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2024-9341
> 
> Upstream-patch:
> https://github.com/containers/common/commit/e7db06585c32e1a782c1d9aa3b71ccd708f5e23f
> 
> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> ---
>  .../podman/podman/CVE-2024-9341.patch         | 50 +++++++++++++++++++
>  recipes-containers/podman/podman_git.bb       |  1 +
>  2 files changed, 51 insertions(+)
>  create mode 100644 recipes-containers/podman/podman/CVE-2024-9341.patch
> 
> diff --git a/recipes-containers/podman/podman/CVE-2024-9341.patch b/recipes-containers/podman/podman/CVE-2024-9341.patch
> new file mode 100644
> index 00000000..ddba4e73
> --- /dev/null
> +++ b/recipes-containers/podman/podman/CVE-2024-9341.patch
> @@ -0,0 +1,50 @@
> +From e7db06585c32e1a782c1d9aa3b71ccd708f5e23f Mon Sep 17 00:00:00 2001
> +From: Paul Holzinger <pholzing@redhat.com>
> +Date: Fri, 27 Sep 2024 14:01:56 +0200
> +Subject: [PATCH] pkg/subscriptions: use securejoin for the container path
> +
> +If we join a path from the container image we must always use securejoin
> +to prevent us from following a symlink onto the host.
> +
> +Fixes CVE-2024-9341
> +
> +Signed-off-by: Paul Holzinger <pholzing@redhat.com>
> +
> +CVE: CVE-2024-9341
> +Upstream-status: Backport [https://github.com/containers/common/commit/e7db06585c32e1a782c1d9aa3b71ccd708f5e23f]
> +
> +Changes:
> +- Used old API errors.Wrapf instead of new fmt.Errorf API and
> +  modified code accordingly.
> +
> +Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> +---
> + .../containers/common/pkg/subscriptions/subscriptions.go    | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/vendor/github.com/containers/common/pkg/subscriptions/subscriptions.go b/vendor/github.com/containers/common/pkg/subscriptions/subscriptions.go
> +index 3c0d2b237d..ec42fbe197 100644
> +--- a/vendor/github.com/containers/common/pkg/subscriptions/subscriptions.go
> ++++ b/vendor/github.com/containers/common/pkg/subscriptions/subscriptions.go
> +@@ -9,6 +9,7 @@ import (
> +
> +	"github.com/containers/common/pkg/umask"
> +	"github.com/containers/storage/pkg/idtools"
> ++        securejoin "github.com/cyphar/filepath-securejoin"
> +	rspec "github.com/opencontainers/runtime-spec/specs-go"
> +	"github.com/opencontainers/selinux/go-selinux/label"
> +	"github.com/pkg/errors"
> +@@ -342,7 +343,10 @@ func addFIPSModeSubscription(mounts *[]rspec.Mount, containerRunDir, mountPoint,
> +
> +	srcBackendDir := "/usr/share/crypto-policies/back-ends/FIPS"
> +	destDir := "/etc/crypto-policies/back-ends"
> +-	srcOnHost := filepath.Join(mountPoint, srcBackendDir)
> ++	srcOnHost, err := securejoin.SecureJoin(mountPoint, srcBackendDir)
> ++        if err != nil {
> ++		return errors.Wrapf(err, "resolve %s in the container", srcBackendDir)
> ++	}
> +	if _, err := os.Stat(srcOnHost); err != nil {
> +		if os.IsNotExist(err) {
> +			return nil
> +--
> +2.40.0
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index 6d9e4749..3011c38d 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -24,6 +24,7 @@ SRC_URI = " \
>      file://0002-Define-ActKillThread-equal-to-ActKill.patch;patchdir=src/import/vendor/github.com/seccomp/libseccomp-golang \
>      file://CVE-2022-27649.patch;patchdir=src/import \
>      file://0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch;patchdir=src/import/vendor/github.com/containers/storage \
> +    file://CVE-2024-9341.patch;patchdir=src/import \
>      ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-rootless.conf', '', d)} \
>  "
>  
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9396): https://lists.yoctoproject.org/g/meta-virtualization/message/9396
> Mute This Topic: https://lists.yoctoproject.org/mt/115288578/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


