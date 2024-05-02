Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62004C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 17:56:50 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.1383.1714672607537434095
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 May 2024 10:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZaSuZ2Z/;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-790ff1fa7b3so370740685a.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 02 May 2024 10:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714672606; x=1715277406; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wGxI7lh2GyQi0EBUnhHKxMAswWF5VFo3RASDiI+0a+w=;
        b=ZaSuZ2Z/yIdLVTztBpWqJ4JyAaLOeznAEPn6p4wojt8zSVYx8o3NCb6vDCnrNqpJYY
         lrW/QlhB+mioZqDoaap/4bStzZWNlgCrwq93PaRpehGoDdjLMowwZqj8kh5PdbFNeixL
         RZiGasH0kavIZAD1qqnPkjNxj1EZ4MGJV2X4N22iPrOZnBlXMQPY3HrlaHx8NuB0tXdP
         Tv3qfAWAHwmYm3cTYmgC5ElA80A/x2ZR1yMNsrZ6bpraOq7SzRRc+H6BluPd4PdZ4ZMZ
         EfwUxe0phSA31+5AGzRkzDvMplIRxLROXgxh1jB5EqOGEJcxoIZvC+5Nk+uoKXIMqIBU
         ickQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714672606; x=1715277406;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wGxI7lh2GyQi0EBUnhHKxMAswWF5VFo3RASDiI+0a+w=;
        b=pkhNyeKaRT/ZwI74lbPoKStjw3amzpl9gvwXA3UsljFgpPe25PBPr4FERAe9B4sHuv
         VhYv18RjR3niJuS9FixNjqV51kEKJU8ZQxWPEOHOBhRDCeCdJIdYTukyEQtpjpYfOZIs
         e91eJktDoffUWZwC12QnuQcrSoK1LdHEVAtct68cCIs63Aw8kUkNcZEYQTmEND2rZT/D
         fG07y2HVx9jX/4L8ifkfasJ84Kr8rQCgk+lsHh/WaxOu6gA2+gI0OaikTlRlfKwSH0TE
         IobSNRJGsp3JBxzxOmScP178IBC6bTrVWurXLv5G5WjgFD9tGBsAlE4HkbOIbWpG8iLu
         2XKQ==
X-Gm-Message-State: AOJu0YyJITyhC1ZnJN5vPEEK9Uvjo5yTwgQ551K/q80rQR68FP1ag9dq
	q9a/8iTN4/Vzf9JH+sowV6iltfkK6oPIQChOgT+2H+yKBJCkN8MI4gfRGg==
X-Google-Smtp-Source: AGHT+IF7xu3PIHTg0CNpDhYNfzL2CGFP75Gb1PvpbZvNUgLt4woaglNWZwk3kgTlvXeBM/QUvlkybA==
X-Received: by 2002:ac8:5a83:0:b0:43c:56c6:b489 with SMTP id c3-20020ac85a83000000b0043c56c6b489mr267774qtc.59.1714672606410;
        Thu, 02 May 2024 10:56:46 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id fw4-20020a05622a4a8400b00434b1f4e371sm674457qtb.13.2024.05.02.10.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 10:56:45 -0700 (PDT)
Date: Thu, 2 May 2024 17:56:44 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: patrick.wicki@subset.ch
Cc: meta-virtualization@lists.yoctoproject.org,
	Patrick Wicki <patrick.wicki@siemens.com>
Subject: Re: [meta-virtualization][PATCH 1/2] podman: remove skopeo rdepends
Message-ID: <ZjPT3GyNRMsCJoxi@gmail.com>
References: <20240429172523.1635019-1-patrick.wicki@subset.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240429172523.1635019-1-patrick.wicki@subset.ch>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 02 May 2024 17:56:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8711

Hi Patrick,

In message: [meta-virtualization][PATCH 1/2] podman: remove skopeo rdepends
on 29/04/2024 Patrick Wicki via lists.yoctoproject.org wrote:

> From: Patrick Wicki <patrick.wicki@siemens.com>
> 
> Podman does not require skopeo to run. They are both independent tools.
> In distros like Debian, Fedora and Arch they don't depend on it either.
> 
> We do require some of its dependencies, so include those directly.
> Skopeo also seems to be used in some of podman's tests, so it makes
> sense to keep it around for the ptest.
> 
> Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
> ---
>  recipes-containers/podman/podman_git.bb | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index f69dec16..41f090f0 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -55,6 +55,7 @@ TOOLCHAIN = "gcc"
>  export BUILDFLAGS="${GOBUILDFLAGS}"
>  
>  inherit go goarch
> +inherit container-host

The addition of container-host configuration should be mentioned
in the commit log.

>  inherit systemd pkgconfig ptest
>  
>  do_configure[noexec] = "1"
> @@ -148,8 +149,13 @@ VIRTUAL-RUNTIME_base-utils-nsenter ?= "util-linux-nsenter"
>  
>  COMPATIBLE_HOST = "^(?!mips).*"
>  
> -RDEPENDS:${PN} += "\
> -	conmon ${VIRTUAL-RUNTIME_container_runtime} iptables ${VIRTUAL-RUNTIME_container_networking} skopeo ${VIRTUAL-RUNTIME_base-utils-nsenter} \
> +RDEPENDS:${PN} += " \
> +	conmon \
> +	iptables \
> +	libdevmapper \
> +	${VIRTUAL-RUNTIME_base-utils-nsenter} \
> +	${VIRTUAL-RUNTIME_container_networking} \
> +	${VIRTUAL-RUNTIME_container_runtime} \
>  	${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'fuse-overlayfs slirp4netns', '', d)} \

Many people know that I don't like mixing formatting and functional
changes. So in a v2, keep the formatting as is and make the change
without sorting or changing the list of rdepends.

Other than that, I agree with the logic of the change and thanks
for the patch!

Bruce

>  "
>  RRECOMMENDS:${PN} += "slirp4netns \
> @@ -172,5 +178,6 @@ RDEPENDS:${PN}-ptest += " \
>  	gnupg \
>  	jq \
>  	make \
> +	skopeo \
>  	tar \
>  "
> -- 
> 2.44.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8704): https://lists.yoctoproject.org/g/meta-virtualization/message/8704
> Mute This Topic: https://lists.yoctoproject.org/mt/105805579/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


