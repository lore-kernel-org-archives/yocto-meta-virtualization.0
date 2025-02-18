Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E8EC021AA
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 19:35:47 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.5039.1739907344055652850
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 Feb 2025 11:35:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i+mePPVE;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c0a4b030f2so199731785a.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 18 Feb 2025 11:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739907343; x=1740512143; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L9nRSAz9jDROazE7h7fu2AZ6rHfYsm0uR1W8p/Uxwwo=;
        b=i+mePPVEewe1uZIgXSQVcRRGeCMWfTIH3UXJjcRs2MbZFn2/fDKL5I4bWgmcHpKV60
         EAECrm+S6hpJD0CfTVKNM05J/94IyDfANgwgAlBcpXl8n8W+Jri/G0LUneddgekvOewK
         0IkQXDPuj6vUk5omk8D3YMUv0xDmh6sIDdk3yl30uU3QMqhWNRhe2FCDKj+cxypibVmm
         t3jvmdL/J4zGDQhP/MdGZVl5gQKBt365dKfBZ5UZhdAHM7/jyQ+24gl2txFr9DYMpmyq
         3E8/MzDgACMuCXdRqKonJ9oDi6L39rtykUN1ohVTJMMz41pdyOJX576TBK2Boq1OxwCI
         gb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739907343; x=1740512143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9nRSAz9jDROazE7h7fu2AZ6rHfYsm0uR1W8p/Uxwwo=;
        b=WkZx56tROP/Zh9TrUDXx55paLNqfO8x3Vf9FRkaTKe0U31T2dilqo37pyPYab30FHq
         ONFE5xV24ZJ5X6ig6kJDpCmI18kJRecz6fT1snSVreuBGBwgTs2V+JXUufed+n5oR8jR
         Uzb29bCvkdUasB+nvLsTDMBeomtnzSZxjJriVpUVI17a21rjhuSYzLEWPXhGgzdkHIRW
         8f/eAQGqbpHzi3mK06WAinKBAjJ5LV9grQ9D9fKmncPeXITG0ODYJKsKsYLoJVWtdNC+
         HgsO5kzCCKvB+LL24zACn5tVl0pSvqLReqMSAUnxWglqLZKEG0Ho/+XtjbeSRcQHk9ZG
         sxGg==
X-Gm-Message-State: AOJu0YwtMdy3lEMGwXgf8Ze0SrICR4iDU9y536htarCICqiLaRWBfM+V
	92G13kOjKzTE2eOdg1bBTXDZkrrRRs3u6wcYQEeKL4x5LLF3HzjV
X-Gm-Gg: ASbGncvNayQJQeRv2Na6wdXYp0mrkXYqiTWcAeGOhYxNntpObfB6MJLZVJEruafLqyL
	w/+67m9kxcMx5hQGL944RrAhJaggC/ev2LvOEy5ZekHZn2mmGnQx3jlS8gd0ZRBavY9QrWp1Bgq
	dPgc3IhIsAuQ3y5/dBkwir8NZU1hxfqTofC17qcuVaLBNhfNV669HRiLhRQNzEuy2sK9jeWxAzr
	aSGGgcMQvci/Rs2pYpEkww/iDPEwpsO05dZrx6VJx9/rIwxKjqaCiftWU8nr+8De25EI1FXRf3Z
	DoIkkmBPfHepYQixy5YCiOsJDOhn6PhC3sd/8oxtcjBLu9WvRj/25dkNppVCWR7S1biOQg==
X-Google-Smtp-Source: AGHT+IGUa9ZV6tT5fUQ7g/t0yJBPecLWHSdlC7Gi0n+5kv9KssK2ndYDLkWNXXn007TY7WZbpGUeww==
X-Received: by 2002:a05:620a:268d:b0:7c0:7ec5:374a with SMTP id af79cd13be357-7c08a9b00ccmr2049763685a.20.1739907342880;
        Tue, 18 Feb 2025 11:35:42 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c09d8d4fb4sm286356885a.55.2025.02.18.11.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:35:42 -0800 (PST)
Date: Tue, 18 Feb 2025 19:35:40 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: hongxu.jia@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH V2 1/3] nerdctl: fix do_compile
 failed
Message-ID: <Z7ThDBdZYfJFCRUv@gmail.com>
References: <20250210074700.1751058-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210074700.1751058-1-hongxu.jia@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 18 Feb 2025 19:35:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9147


I'm not quite ready to remove support for all 32bit arches, so
this is now staged on master-next.

Bruce

In message: [meta-virtualization][PATCH V2 1/3] nerdctl: fix do_compile failed
on 10/02/2025 hongxu via lists.yoctoproject.org wrote:

> Using latest poky + meta-virtualization + meta-openembedded, build multlib failed
> 
> ...local.conf...
> MACHINE = "qemux86-64"
> require conf/multilib.conf
> MULTILIBS = "multilib:lib32"
> DEFAULTTUNE:virtclass-multilib-lib32 = "x86"
> 
> $ bitbake lib32-nerdctl
> ...
> -buildmode=pie requires external (cgo) linking, but cgo is not enabled
> make: *** [Makefile:63: nerdctl] Error 1
> ...
> 
> Get back the patch to allow external specification of build settings and rebase to v2.0.2
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  ...xternal-specification-of-build-setti.patch | 28 +++++++++++--------
>  recipes-containers/nerdctl/nerdctl_git.bb     |  1 +
>  2 files changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specification-of-build-setti.patch b/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specification-of-build-setti.patch
> index ca7b3042..cf7037f3 100644
> --- a/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specification-of-build-setti.patch
> +++ b/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specification-of-build-setti.patch
> @@ -6,20 +6,26 @@ Subject: [PATCH] Makefile: allow external specification of build settings
>  Upstream-Status: Inappropriate [embedded specific]
>  
>  Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> +
> +Rebase to v2.0.2
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>  ---
> - Makefile | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> + src/import/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
>  
> -Index: nerdctl-v2.0.0-beta.1/src/import/Makefile
> -===================================================================
> ---- nerdctl-v2.0.0-beta.1.orig/src/import/Makefile
> -+++ nerdctl-v2.0.0-beta.1/src/import/Makefile
> -@@ -38,7 +38,7 @@
> +diff --git a/src/import/Makefile b/src/import/Makefile
> +index ae4e18c..eb22f9f 100644
> +--- a/src/import/Makefile
> ++++ b/src/import/Makefile
> +@@ -45,7 +45,7 @@ endif
>   
>   GO_BUILD_LDFLAGS ?= -s -w
>   GO_BUILD_FLAGS ?=
> --export GO_BUILD=GO111MODULE=on CGO_ENABLED=0 GOOS=$(GOOS) $(GO) build -ldflags "$(GO_BUILD_LDFLAGS) -X $(PACKAGE)/pkg/version.Version=$(VERSION) -X $(PACKAGE)/pkg/version.Revision=$(REVISION)"
> -+export GO_BUILD=$(GO) build -ldflags "$(GO_BUILD_LDFLAGS) -X $(PACKAGE)/pkg/version.Version=$(VERSION) -X $(PACKAGE)/pkg/version.Revision=$(REVISION)"
> +-export GO_BUILD=CGO_ENABLED=0 GOOS=$(GOOS) $(GO) -C $(MAKEFILE_DIR) build -ldflags "$(GO_BUILD_LDFLAGS) $(VERBOSE_FLAG) -X $(PACKAGE)/pkg/version.Version=$(VERSION) -X $(PACKAGE)/pkg/version.Revision=$(REVISION)"
> ++export GO_BUILD=GOOS=$(GOOS) $(GO) -C $(MAKEFILE_DIR) build -ldflags "$(GO_BUILD_LDFLAGS) $(VERBOSE_FLAG) -X $(PACKAGE)/pkg/version.Version=$(VERSION) -X $(PACKAGE)/pkg/version.Revision=$(REVISION)"
> + 
> + recursive_wildcard=$(wildcard $1$2) $(foreach e,$(wildcard $1*),$(call recursive_wildcard,$e/,$2))
>   
> - ifdef VERBOSE
> - 	VERBOSE_FLAG := -v
> +-- 
> +2.34.1
> +
> diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers/nerdctl/nerdctl_git.bb
> index 63b96846..84734c9f 100644
> --- a/recipes-containers/nerdctl/nerdctl_git.bb
> +++ b/recipes-containers/nerdctl/nerdctl_git.bb
> @@ -19,6 +19,7 @@ include src_uri.inc
>  
>  # patches and config
>  SRC_URI += " \
> +            file://0001-Makefile-allow-external-specification-of-build-setti.patch \
>              file://modules.txt \
>             "
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9131): https://lists.yoctoproject.org/g/meta-virtualization/message/9131
> Mute This Topic: https://lists.yoctoproject.org/mt/111098600/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


