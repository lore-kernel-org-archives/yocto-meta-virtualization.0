Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 001BAC25B7E
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 15:04:56 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.14854.1717167896510792289
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 31 May 2024 08:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IWiKB9Qa;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6ae1b32752aso9274946d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 31 May 2024 08:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717167895; x=1717772695; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PBjsu9qAtHEYXdQltAYxfzaUKXm3U2tfsLRJmwUjMxg=;
        b=IWiKB9QaL+gr9aSxsvZBUmWnPAH7iewYtl6b6/818MpIZN8rbpbJ7GshF2y7b6alCo
         0/QiWZd8S767s2Zs4znyGUMl5yGPdx2Hq9iSJOlzab5vREQVEwx1h/A7C8QK9ctPaXAO
         5bXaQt0W7z+Dq6RsnwNZk9Fos/4GPwhpuH9YOGKk6jNr6uMU8TCjeNZ/mSdWQC6bbc4O
         vpbsXRfXnMB/41VbK7goAlNhBfHnvGKlLP504dVka4G+7hZ2FVFx2EWcdHBsHOO3RoiP
         4Gga1s1KwYmTV/pzLUAd8orQI4iRMF5L39qH+t+dtubmMvfgQDrw/EOOOwNtzYJ545pC
         VCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717167895; x=1717772695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBjsu9qAtHEYXdQltAYxfzaUKXm3U2tfsLRJmwUjMxg=;
        b=tAKH8StTyGqN+H33HeZTDtXeC9Ypzh01k1K+NOokVYI6PtfPUuRECpJjUvHxh9u+s4
         eOxR/7JVgrZAHt6rhoYeHgkcJWkKJX2gWFWY6NTrWKWSp07fQBLDT3s6LIklTJRz+5Dq
         Spg8V5AshOGz0KZB77ranckQljAFhegAIvL1WaVQtjsnLsGn3dNaedtnsmhfXqi2AeVh
         0TSCA4ajS7rPQwv4PaMcUO2OYVBp9R1pazcEeGF+wEUz4CSXQnid7pTR7PjEBU8Svhkj
         xvuAVbUJpMYmXbGdRzMqNUOE3TpMXcQ89JIRsvXKD/2pst2qB+dwCU+3YQxnwM5W52gH
         CoEQ==
X-Gm-Message-State: AOJu0YzVSDLTGAe/APcySkdAKG9MqRargmA7nxzk5gB1UW3MT32BzX+c
	ynnikMIyE1IpNKA3lRlZ/zRSuNZuDd89/mewMGhpdJRKyplunzdH
X-Google-Smtp-Source: AGHT+IFjNqpFzd+9dToL8w359OWGc4xgFklci9DY2nA9RkhpEVnbDtImeQKXLUYNDDep1hBvm1uQqQ==
X-Received: by 2002:a05:6214:3b87:b0:6ab:8d18:6fa0 with SMTP id 6a1803df08f44-6aecd578534mr23207526d6.19.1717167895344;
        Fri, 31 May 2024 08:04:55 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ae4a745b7esm7104106d6.31.2024.05.31.08.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 08:04:54 -0700 (PDT)
Date: Fri, 31 May 2024 15:04:53 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: marcus.flyckt@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org,
	Marcus Flyckt <mafl@kvaser.com>
Subject: Re: [meta-virtualization][PATCH] podman: Use slirp4netns instead of
 pasta
Message-ID: <ZlnnFdbNsPMvIc37@gmail.com>
References: <20240531091316.339912-1-mafl@kvaser.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531091316.339912-1-mafl@kvaser.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 31 May 2024 15:04:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8791



In message: [meta-virtualization][PATCH] podman: Use slirp4netns instead of pasta
on 31/05/2024 Marcus Flyckt via lists.yoctoproject.org wrote:

> podman uses pasta as the default rootless network command since 5.0.0,
> but only slirp4netns is available when building for Yocto.
> 
> This commit adds a containers.conf file setting slirp4netns as default
> rootless command if 'rootless' is set in PACKAGECONFIG

That is also my preferred default.

That being said, I was doing a recipe for pasta, if anyone
knows of an existing recipe that I'm not aware of, let me
know!

Bruce

> 
> Signed-off-by: Marcus Flyckt <mafl@kvaser.com>
> ---
>  recipes-containers/podman/podman_git.bb | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index 32de3f0c..b8e90406 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -117,6 +117,11 @@ do_install() {
>  	if ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'true', 'false', d)}; then
>  		install -d "${D}${sysconfdir}/sysctl.d"
>  		install -m 0644 "${WORKDIR}/50-podman-rootless.conf" "${D}${sysconfdir}/sysctl.d"
> +		install -d "${D}${sysconfdir}/containers"
> +		cat <<-EOF >> "${D}${sysconfdir}/containers/containers.conf"
> +		[NETWORK]
> +		default_rootless_network_cmd="slirp4netns"
> +		EOF
>  	fi
>  }
>  
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8789): https://lists.yoctoproject.org/g/meta-virtualization/message/8789
> Mute This Topic: https://lists.yoctoproject.org/mt/106404631/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


