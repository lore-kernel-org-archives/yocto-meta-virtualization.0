Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8646FCA1012
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 01:14:16 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.29226.1756948449414061423
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 03 Sep 2025 18:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hbjjgef2;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-7211b09f649so3883076d6.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 03 Sep 2025 18:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756948448; x=1757553248; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qFB+F719ExtdAJby5tpkyiyhQAa6hb3FlWkspUoovFc=;
        b=hbjjgef2hynbBH47ovqeRlVHwV0QUHnVFEvSmXy3ZfbIg8+YaZ0FiULwEi4g5En1Wa
         GZSFzQCbjkuBYbHT6e/06RvINAxTICmtVEJTAmYMev2BKgooi4tBW4BStxX7NTejeE8c
         GjuXI8q9AofVrJY7WB5dE0+lqtmsP/1IjWkvYUA2YW6yz99Cmfrog8PjbGzFRAbit2wB
         jB7KiL2v2hwnP+X33vLfAueYxUVDwydASDWEpkp9qaHMJyDwhgVpA+bPa2bqrLhK2UoE
         7FgOMG4cODt7TnuaCudR6TwEovhjWR15oV8DayL3ZfrgDUmDNXBfCqrJt05TNu6AzgYw
         Bo4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756948448; x=1757553248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFB+F719ExtdAJby5tpkyiyhQAa6hb3FlWkspUoovFc=;
        b=r0XQkUeALhFkVkFVbCh6TeK1ub1JKcy9M1O7lHpP65OhjQ79NiZEOnkQWIwMsK9EUT
         ZDCKMyguYnEPaghtcy9TmnDM1iPVckfAKY77Vt91DCDn79apbUa41qZq7JEVWcDAAHT1
         iCK/S38B5e6vooe43eZ6pqbaWbyzdSnkANidImlJC6aBwjoiiEap3zOdx0LHTNqkjOZb
         UBlO5a2522MBurDFeEvOUtS9+POQsTaaOF5rP7E4L1BkI++FFryR7wkbaVAcAIbPSoFt
         S9rs8nTHa5FS+XkssU+XZ0bl+MZa7t05j+5vSUXa1eEmWMrw3nk/ycXESsIID3g84ZRN
         +D9A==
X-Gm-Message-State: AOJu0YxiguWVD4A5D1chKvpP5s+3B7KBQvgVa1mX+Ak1gkIQgsmugY8w
	BoVxuYQoz6ct+yYNebhx8zoEBYSKUdk5K8RI04fmZ9iSjpDk8RWfb4a1
X-Gm-Gg: ASbGnctR4QYp6bfY3fM7ziNvcsQkF0ibUGCq+SrjO1R8yYFzMQO3rUGb6GSs5VeMjtu
	EkodUoub/XAbfnSmhn5fZLb+Ayb2hMQHnGi0Mj6nsbQqQXMbE+l2UvjD+xIZfKFZba65LWoSSAC
	DAN9ww3zP5OE56l/zZAm8Pm5XLJLQXLcIyiDHVG8pHHm5NJgxYOQU0ERFkisTdxey5q64nSy2rw
	/DjCcDuWXCke8nxFGHLRl4Ng7VEpV1nxa3bEEB2SinvGd3lBZRnstNmig75gunoWOrmujyHPxK0
	Jueyd3ZNE73hVcHDJKeAL0ispAkybvngeWruM7BtXFh9CltKNkVEMYe2Xb9Sly/YZWtzY0qZXL0
	1n3d2wcU+5qVqPydKxwJP1Fp1vqt7mhlcVXRqxR2Pd5jnvFN3ylIgKNcanQOYB3FofSdAwenLsW
	WFPXCJI1RRKxpc+zvqPhnkIPxqMGiM8w8uNrSiXgHQchs=
X-Google-Smtp-Source: AGHT+IGaYfCYRnT6jkudMU1XQlTwt9N2ateSwfUuNzxDzZIL+wUH9wewe2CO+T8Of1zhKfa1L4640g==
X-Received: by 2002:a05:6214:400c:b0:70d:def5:9574 with SMTP id 6a1803df08f44-70fac6f8105mr199844266d6.2.1756948448213;
        Wed, 03 Sep 2025 18:14:08 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b57c3240sm37279796d6.50.2025.09.03.18.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 18:14:07 -0700 (PDT)
Date: Wed, 3 Sep 2025 21:14:06 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: patrick.vogelaar@belden.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] docker: make ca-certificates a
 packageconfig
Message-ID: <aLjn3mCCaI8wCYlR@gmail.com>
References: <20250824121414.293436-1-patrick.vogelaar@belden.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250824121414.293436-1-patrick.vogelaar@belden.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Sep 2025 01:14:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9370


In message: [meta-virtualization][PATCH] docker: make ca-certificates a packageconfig
on 24/08/2025 Patrick Vogelaar via B4 Relay via lists.yoctoproject.org wrote:

> Moving ca-certificates into a packageconfig allows using docker without
> installing all the certificates.

I don't have (many) issues with the patch, but in my experience you
can't work with any registries or services with the certs being present.

Are you installing them some other way ? or using some alternative ?

Since the defaults aren't changed by this patch, I'll definitely merge
it. I'd just like to make sure that it won't create a hidden/non-working
configuration.

Bruce

> 
> Signed-off-by: Patrick Vogelaar <patrick.vogelaar@belden.com>
> ---
>  recipes-containers/docker/docker.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
> index 94ee34db..c464bc3c 100644
> --- a/recipes-containers/docker/docker.inc
> +++ b/recipes-containers/docker/docker.inc
> @@ -10,7 +10,6 @@ RDEPENDS:${PN} = "util-linux util-linux-unshare iptables \
>                    ${@bb.utils.contains('DISTRO_FEATURES', 'aufs', 'aufs-util', '', d)} \
>                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'cgroup-lite', d)} \
>                    bridge-utils \
> -                  ca-certificates \
>                   "
>  RDEPENDS:${PN} += "virtual-containerd ${VIRTUAL-RUNTIME_container_runtime}"
>  
> @@ -37,10 +36,11 @@ RPROVIDES:${PN}-dev += "docker-dev"
>  RPROVIDES:${PN}-contrip += "docker-dev"
>  
>  inherit pkgconfig
> -PACKAGECONFIG ??= "docker-init seccomp"
> +PACKAGECONFIG ??= "docker-init seccomp ca-certs"
>  PACKAGECONFIG[seccomp] = "seccomp,,libseccomp"
>  PACKAGECONFIG[docker-init] = ",,,docker-init"
>  PACKAGECONFIG[transient-config] = "transient-config"
> +PACKAGECONFIG[ca-certs] = ",,,ca-certificates"
>  
>  GO_IMPORT = "import"
>  
> -- 
> 2.34.1
> 
> 
> **********************************************************************
> DISCLAIMER:
> Privileged and/or Confidential information may be contained in this message. If you are not the addressee of this message, you may not copy, use or deliver this message to anyone. In such event, you should destroy the message and kindly notify the sender by reply e-mail. It is understood that opinions or conclusions that do not relate to the official business of the company are neither given nor endorsed by the company. Thank You.

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9357): https://lists.yoctoproject.org/g/meta-virtualization/message/9357
> Mute This Topic: https://lists.yoctoproject.org/mt/114864158/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


