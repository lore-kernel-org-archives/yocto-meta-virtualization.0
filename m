Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1EDC25B78
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 02:31:19 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.5906.1715653872775122990
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 May 2024 19:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z9D0w1il;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-792b8efed93so488493785a.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 13 May 2024 19:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715653872; x=1716258672; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9aakaG7eBKqvYizQTiv0/EvyuvsUI7fcatOP4sOpork=;
        b=Z9D0w1ilOGOhpOSR7ajtL5BKv/we15HEstQRfxf4duJiTo3KsaziymvmhQvp64Va+3
         uTwSm5A7vG8gtjdp1eJNCGcGB781EixzhvakfMxPQCAAFES/0LhYZ9MWhK/YbnWuMfMw
         7Zymdt6upmFtv79S5nHjmTeybt+pRxU8H8DCVrJ0hURegNw9VGdM+WYRQYmjLvR8hhvK
         dmuNepbJWy9OGSFDRzXcJUxq6Qto16de6ycgW7pFA9uLv7D48v+x0J05F4oaKuHyCUO4
         ORt50NIirCRbH4s4dT8KUPzmUPeEv6F42H+gEj/st7Hw5ETygqhoEinDglpEgY3BiBih
         EVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715653872; x=1716258672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9aakaG7eBKqvYizQTiv0/EvyuvsUI7fcatOP4sOpork=;
        b=weE3d5YaPaxUvhNAuTJbt6aKqCB2C2VTLSQE3v1y8TACI419c2PvrPT21db6LKmsEn
         idnM2FpqTPoXekPZXE5nV+iRCCZUELP42asDd2hXVj5pVfn5/ol8melqyNjXhgT+BvaY
         797lBzzS2mNmJKSVna2Y5jZFl3t4RvIf9j1y8lJ4wxKm0vLOD/cYJX1i89CNefCoOI8q
         kIlFMwICzYDEITk1SLeNh6vIuQlGw/6dvuTyE6SK5aaMaBtSpIGsoTigOujZBgs7+IZk
         GmrcLW7wrloWkH8sZAPkECv2dgahJa3q20w5XbqOjgqw59d2TcCCwzMjHhI/xj1MantM
         tOCg==
X-Gm-Message-State: AOJu0YwtkxUbtW8OwWsc3Es7S0LOyFdAy26p7ycuOoj9KarKsrgH2S7C
	OXkR9y4JcGQH2GyrAQwFZgMmtS/C1aFObKkf9oSd2Wb4wqlhyGIy
X-Google-Smtp-Source: AGHT+IFeC9vSe72Ea5RsYQwYvDPwLm16F9XQPLPXMR1hQLlwBAw55t45HssEhQKWasnDtrHdwfw+7w==
X-Received: by 2002:a05:620a:21c2:b0:792:9e07:de72 with SMTP id af79cd13be357-792c75f438cmr1228024385a.59.1715653871627;
        Mon, 13 May 2024 19:31:11 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792bf33f1a5sm510328985a.131.2024.05.13.19.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 19:31:11 -0700 (PDT)
Date: Mon, 13 May 2024 22:31:09 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: patrick.wicki@subset.ch
Cc: meta-virtualization@lists.yoctoproject.org,
	Patrick Wicki <patrick.wicki@siemens.com>
Subject: Re: [meta-virtualization][PATCH v2 1/2] podman: remove skopeo
 rdepends
Message-ID: <ZkLM7SjogJVi68Qx@gmail.com>
References: <20240506082806.292832-1-patrick.wicki@subset.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506082806.292832-1-patrick.wicki@subset.ch>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 14 May 2024 02:31:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8721

v2 of the patches are on master-next

Bruce

In message: [meta-virtualization][PATCH v2 1/2] podman: remove skopeo rdepends
on 06/05/2024 Patrick Wicki via lists.yoctoproject.org wrote:

> From: Patrick Wicki <patrick.wicki@siemens.com>
> 
> Podman does not require skopeo to run. They are both independent tools.
> In distros like Debian, Fedora and Arch they don't depend on it either.
> Skopeo also seems to be used in some of podman's tests, so it makes
> sense to keep it around for the ptest.
> 
> We do require skopeo's libdevmapper dependency, so include that
> directly. And inherit container-host to make sure the container configs
> are present on the device.
> 
> Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
> ---
>  recipes-containers/podman/podman_git.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index 32de3f0c..07c17449 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -55,6 +55,7 @@ TOOLCHAIN = "gcc"
>  export BUILDFLAGS="${GOBUILDFLAGS}"
>  
>  inherit go goarch
> +inherit container-host
>  inherit systemd pkgconfig ptest
>  
>  do_configure[noexec] = "1"
> @@ -149,7 +150,7 @@ VIRTUAL-RUNTIME_base-utils-nsenter ?= "util-linux-nsenter"
>  COMPATIBLE_HOST = "^(?!mips).*"
>  
>  RDEPENDS:${PN} += "\
> -	conmon ${VIRTUAL-RUNTIME_container_runtime} iptables ${VIRTUAL-RUNTIME_container_networking} skopeo ${VIRTUAL-RUNTIME_base-utils-nsenter} \
> +	conmon ${VIRTUAL-RUNTIME_container_runtime} iptables libdevmapper ${VIRTUAL-RUNTIME_container_networking} ${VIRTUAL-RUNTIME_base-utils-nsenter} \
>  	${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'fuse-overlayfs slirp4netns', '', d)} \
>  "
>  RRECOMMENDS:${PN} += "slirp4netns \
> @@ -172,5 +173,6 @@ RDEPENDS:${PN}-ptest += " \
>  	gnupg \
>  	jq \
>  	make \
> +	skopeo \
>  	tar \
>  "
> -- 
> 2.45.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8716): https://lists.yoctoproject.org/g/meta-virtualization/message/8716
> Mute This Topic: https://lists.yoctoproject.org/mt/105935939/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


