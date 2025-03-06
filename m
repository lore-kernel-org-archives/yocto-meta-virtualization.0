Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17BD2C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 17:42:54 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.20418.1741282968596138664
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 06 Mar 2025 09:42:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QSEWAHZu;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e8fd49b85eso5747376d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Mar 2025 09:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741282967; x=1741887767; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SrRalHIrbmhYKc8zrcOt1yYg/ugDaAmpdUIE9/y9Z98=;
        b=QSEWAHZu+izQKkEGYty93/su7BJft6+X9RmFo/Gxw82JBn3vsgT9zcGGzloT57xaHr
         w5/wYWRhE1vGoT+PZAS2gSNT0VKtAqGPnrA0nx/Wr6WAliX4W3AY/XQgoJDaQ3V2PitB
         RkJ8AYlVayHJAfDs5o+AtlkQ1RaJlRhsP9NOXrzZ8lMH61Kc/jBYL8stY8ZRMCwPMqoe
         bRgE9qUO48Lc3er0m7beiZBDeGmq9z05IyjGtMMj8WXVbiP0AO51Jfh+v7/wj+QFoOpQ
         AfRKYXtcEICae8Pzu1ek6bFu3LqZnvn2pe2MkGI8bKQfDAnQgfOP467jFPoI/0Cz8HvR
         ioaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741282967; x=1741887767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SrRalHIrbmhYKc8zrcOt1yYg/ugDaAmpdUIE9/y9Z98=;
        b=dpUCPqwTuWi8EgBQ303gorsml3TtB4IwDT0GHwjiNjXF68+Y8NMdd2LWDe6ZUc0kdu
         QKwwtU7RVRumN5MdcUKy1zn2dVZy9RrbibrzzoGUEO0MS55m6ZTlme5f52QATEvXzGfx
         ZltmkPMFTO9jaxWKMgNe8nqw0dP1kGXenQ2bI7nprY1MoRIKsmx8yw4VaBUAbUUxh62S
         KJsJH2CMIdHk7N9W/cPvSJdD46y7xRC9vIXpsj5gPbvlz6tTgyFCkaqJsU3uJCpv9eIx
         IJtUhCI/VOweHoVot7cG2aTJU2zoZzHABoZmdi9sDF0MjTjTdtlpbufJFtk40aBVL0AJ
         D67g==
X-Gm-Message-State: AOJu0YxiwlhnO1UWRZvBrlKDUbMZjRzzAgz6YZQ0nvd9qSWPUTLZQMF5
	9b8Mai7pXiaVl/98v3mDzMmqTELyHjI24zwtpWVHRpuLP087sj5j
X-Gm-Gg: ASbGncv30r47BFItspdvnoHvvTiIJTNkB3uiM9WZZoLYLDrO2NFg6ovdbzUGa11M94K
	msUGU08RFcIJhmcnXJ/Mkeh7y2ePa+/sEoOP6k2g8pijE3wH1J+Od+eNExkveBuCc8dN6pClUYt
	7DZyPTM3+GFjcO4ZHLa+71ftzE0lUIF/j9NQ/euY5cYViCWzAa7ikzL0TTx2D53+zw52SsWP3I6
	2fqIBYPyXmkkzhZQ4Hj0+tjN9dGFDi1TR0TtVnrRO9pMppl9FNnM38YclgBkfApXVVeFEH7vXcl
	Q/MZaoBVF+mmDHqg6y1fQXr/2pGSHCdbOS7AXGmt2xivMm5OXwzfB6vJQuXKG6suOkX0qG257c1
	wyQY0ap874R1cnc/Po2n+H04=
X-Google-Smtp-Source: AGHT+IErnAFgxReTdbQggQ2uyHIjbmj5fxXqHSDC34/RWssKENPkv5mF/FqXQ6IAOZRn15UtLKhZ0A==
X-Received: by 2002:a05:6214:1d24:b0:6e8:fbe2:2db0 with SMTP id 6a1803df08f44-6e8fbe23702mr27503536d6.30.1741282966671;
        Thu, 06 Mar 2025 09:42:46 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8f7090c27sm9505186d6.44.2025.03.06.09.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 09:42:46 -0800 (PST)
Date: Thu, 6 Mar 2025 17:42:44 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: peter.marko@siemens.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][scarthgap][PATCH] crun: patch
 CVE-2025-24965
Message-ID: <Z8nelIwqCGlwBdmS@gmail.com>
References: <20250228194421.54366-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228194421.54366-1-peter.marko@siemens.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Mar 2025 17:42:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9159

merged.

Bruce

In message: [meta-virtualization][scarthgap][PATCH] crun: patch CVE-2025-24965
on 28/02/2025 Peter Marko via lists.yoctoproject.org wrote:

> From: Peter Marko <peter.marko@siemens.com>
> 
> Pick commit https://github.com/containers/crun/commit/0aec82c2b686f0b1793deed43b46524fe2e8b5a7
> 
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../crun/crun/CVE-2025-24965.patch            | 45 +++++++++++++++++++
>  recipes-containers/crun/crun_git.bb           |  1 +
>  2 files changed, 46 insertions(+)
>  create mode 100644 recipes-containers/crun/crun/CVE-2025-24965.patch
> 
> diff --git a/recipes-containers/crun/crun/CVE-2025-24965.patch b/recipes-containers/crun/crun/CVE-2025-24965.patch
> new file mode 100644
> index 00000000..8a8a8f64
> --- /dev/null
> +++ b/recipes-containers/crun/crun/CVE-2025-24965.patch
> @@ -0,0 +1,45 @@
> +From 0aec82c2b686f0b1793deed43b46524fe2e8b5a7 Mon Sep 17 00:00:00 2001
> +From: Giuseppe Scrivano <gscrivan@redhat.com>
> +Date: Tue, 4 Feb 2025 10:19:07 +0100
> +Subject: [PATCH] krun: fix CVE-2025-24965
> +
> +make sure the opened .krun_config.json is below the rootfs directory
> +and we don't follow any symlink.
> +
> +Signed-off-by: Giuseppe Scrivano <gscrivan@redhat.com>
> +
> +CVE: CVE-2025-24965
> +Upstream-Status: Backport [https://github.com/containers/crun/commit/0aec82c2b686f0b1793deed43b46524fe2e8b5a7]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + src/libcrun/handlers/krun.c | 10 +++++++++-
> + 1 file changed, 9 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/libcrun/handlers/krun.c b/src/libcrun/handlers/krun.c
> +index 804a17cb..3c7766ba 100644
> +--- a/src/libcrun/handlers/krun.c
> ++++ b/src/libcrun/handlers/krun.c
> +@@ -43,6 +43,8 @@
> + /* libkrun has a hard-limit of 8 vCPUs per microVM. */
> + #define LIBKRUN_MAX_VCPUS 8
> + 
> ++#define KRUN_CONFIG_FILE ".krun_config.json"
> ++
> + struct krun_config
> + {
> +   void *handle;
> +@@ -207,7 +209,13 @@ libkrun_configure_container (void *cookie, enum handler_configure_phase phase,
> +       if (UNLIKELY (ret < 0))
> +         return ret;
> + 
> +-      ret = write_file_at (rootfsfd, ".krun_config.json", config, config_size, err);
> ++      /* CVE-2025-24965: the content below rootfs cannot be trusted because it is controlled by the user.  We
> ++         must ensure the file is opened below the rootfs directory.  */
> ++      fd = safe_openat (rootfsfd, rootfs, KRUN_CONFIG_FILE, WRITE_FILE_DEFAULT_FLAGS | O_NOFOLLOW, 0700, err);
> ++      if (UNLIKELY (fd < 0))
> ++        return fd;
> ++
> ++      ret = safe_write (fd, KRUN_CONFIG_FILE, config, config_size, err);
> +       if (UNLIKELY (ret < 0))
> +         return ret;
> +     }
> diff --git a/recipes-containers/crun/crun_git.bb b/recipes-containers/crun/crun_git.bb
> index 89ba21b4..8d72e5f6 100644
> --- a/recipes-containers/crun/crun_git.bb
> +++ b/recipes-containers/crun/crun_git.bb
> @@ -15,6 +15,7 @@ SRC_URI = "git://github.com/containers/crun.git;branch=main;name=crun;protocol=h
>             git://github.com/opencontainers/runtime-spec.git;branch=main;name=rspec;destsuffix=git/libocispec/runtime-spec;protocol=https \
>             git://github.com/opencontainers/image-spec.git;branch=main;name=ispec;destsuffix=git/libocispec/image-spec;protocol=https \
>             git://github.com/containers/yajl.git;branch=main;name=yajl;destsuffix=git/libocispec/yajl;protocol=https \
> +           file://CVE-2025-24965.patch \
>            "
>  
>  PV = "v1.14.3+git${SRCREV_crun}"

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9152): https://lists.yoctoproject.org/g/meta-virtualization/message/9152
> Mute This Topic: https://lists.yoctoproject.org/mt/111440786/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


