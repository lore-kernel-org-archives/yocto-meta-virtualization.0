Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B1ECE7A8E
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 19:41:20 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web10.18794.1725565272094001402
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 05 Sep 2024 12:41:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XVUsChrm;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e05f25fb96eso1335709276.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Sep 2024 12:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725565271; x=1726170071; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WL6gJskrnsIAFRrDBPrVKQNWPwAvdpPjuoQ47agGJUA=;
        b=XVUsChrmNDG3uknMffZd6L1HJr0MVKzgoKdJhw3piWaocwUI+B8jhwIA/SJe/Lt6m4
         vykldGU2hjqCCO+s7NqbdQ59UiOuau/r8OUvWLNazahQWARwtzDiQW3ddF516iHaoUpL
         jUImJhloud9rrXl+UaivUfIrvmn+jyMT5qGs69TlwnkwVi2BUya/x9l0sMViATWJEJc8
         jFOwFCnibFnXfZAy+8WYbCEfHhUOL17VZkdR8W2ZoNirlzlw4JObQt57mMuF49q5vYG1
         q+rDnvLDWOvbPxXSoGRu7Um77PQCn/nvfMRsSspMHWCN/OCD+e0I+pjhRKPaXzBGUn3B
         Ib7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725565271; x=1726170071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WL6gJskrnsIAFRrDBPrVKQNWPwAvdpPjuoQ47agGJUA=;
        b=uEd7GhnNGfsSejYRJAjKqj2HEhfeOAFlurkkIk9h5OntWdY9A/ILVV8PiH4EGWw09l
         8YQirJZtiM6sgDaV2i4U+5t6F77xU2HK/2Yu1zS+HiQTP5uihUqy1ZNoCgzV9/bNWyEG
         lPdX1GWmwX2+DgBjFQ4pp3gKr0wxGXHzeBWfOB1sYIVX+AHejEvMurkQEGBBYeziBjNy
         8hGcmGEAVcgJ9d6BbKP87XVsqM+x6jRLdXlOYX64yYBlFpPffVVIss3q4GPH1LmhCMGB
         L35KUSR2neb+KBQ5eze7OtUQRAoyk1g+dFEK/uc9jQ+FuD/59ntDLNybCGSpKm0FLBdD
         h94A==
X-Gm-Message-State: AOJu0YwNsmYfdfNf5bkljifQsDBCgpyVnwl/DIrIPCzXF70honO00cXG
	5vHq8KewNQzHAXEXm3aMfkKrMGk4ckyuwuv0ljQVNdV7pLOY8gWd8jjNJA==
X-Google-Smtp-Source: AGHT+IE8F5IVhhKI8I/ZXnBqki8xXSqMc3nQYos4fb5SgCep0qJgErMC4oP0zRFRd5xR0eKQPUpv1w==
X-Received: by 2002:a05:6902:1549:b0:e12:aacb:e534 with SMTP id 3f1490d57ef6-e1d349e007fmr509062276.45.1725565271106;
        Thu, 05 Sep 2024 12:41:11 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c5201e4320sm10315906d6.43.2024.09.05.12.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 12:41:10 -0700 (PDT)
Date: Thu, 5 Sep 2024 19:41:08 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] libvirt: fix build on qemuarm
Message-ID: <ZtoJVIj3GSDD1qEM@gmail.com>
References: <20240904013050.1629475-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904013050.1629475-1-Qi.Chen@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Sep 2024 19:41:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8869

I'm not sure that I want to support libvirt on qemuarm .. but
since the patch isn't too complicated, I've gone ahead and
merged it

Bruce

In message: [meta-virtualization][PATCH] libvirt: fix build on qemuarm
on 03/09/2024 Chen Qi via lists.yoctoproject.org wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
> 
> On qemuarm, time_t is 'long long int', so using '%lu' to print
> it out will give us the following error:
> 
>     error: format '%lu' expects argument of type 'long unsigned int',
>     but argument 10 has type 'time_t' {aka 'long long int'} [-Werror=format=]
> 
> So use %llu to print it out.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ...emu_nbdkit.c-use-llu-to-print-time_t.patch | 76 +++++++++++++++++++
>  recipes-extended/libvirt/libvirt_git.bb       |  1 +
>  2 files changed, 77 insertions(+)
>  create mode 100644 recipes-extended/libvirt/libvirt/0001-qemu_nbdkit.c-use-llu-to-print-time_t.patch
> 
> diff --git a/recipes-extended/libvirt/libvirt/0001-qemu_nbdkit.c-use-llu-to-print-time_t.patch b/recipes-extended/libvirt/libvirt/0001-qemu_nbdkit.c-use-llu-to-print-time_t.patch
> new file mode 100644
> index 00000000..7263666a
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/0001-qemu_nbdkit.c-use-llu-to-print-time_t.patch
> @@ -0,0 +1,76 @@
> +From c4636402c06ab5ae436176daf0ef17005346e27d Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Mon, 2 Sep 2024 22:15:51 -0700
> +Subject: [PATCH] qemu_nbdkit.c: use %llu to print time_t
> +
> +Use %lu to print time_t will give use the following error:
> +
> +  error: format '%lu' expects argument of type 'long unsigned int',
> +  but argument 10 has type 'time_t' {aka 'long long int'} [-Werror=format=]
> +
> +So use %llu to print time_t.
> +
> +Upstream-Status: Submitted [https://lists.libvirt.org/archives/list/devel@lists.libvirt.org/thread/FQSQMML6VWMHNWBYP67OLCUTJY5LJQST/]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + src/qemu/qemu_nbdkit.c | 24 ++++++++++++------------
> + 1 file changed, 12 insertions(+), 12 deletions(-)
> +
> +diff --git a/src/qemu/qemu_nbdkit.c b/src/qemu/qemu_nbdkit.c
> +index f099f35e1e..fe660c78e5 100644
> +--- a/src/qemu/qemu_nbdkit.c
> ++++ b/src/qemu/qemu_nbdkit.c
> +@@ -544,18 +544,18 @@ qemuNbdkitCapsFormatCache(qemuNbdkitCaps *nbdkitCaps)
> + 
> +     virBufferEscapeString(&buf, "<path>%s</path>\n",
> +                           nbdkitCaps->path);
> +-    virBufferAsprintf(&buf, "<nbdkitctime>%lu</nbdkitctime>\n",
> +-                      nbdkitCaps->ctime);
> ++    virBufferAsprintf(&buf, "<nbdkitctime>%llu</nbdkitctime>\n",
> ++                      (long long)nbdkitCaps->ctime);
> +     virBufferEscapeString(&buf, "<plugindir>%s</plugindir>\n",
> +                           nbdkitCaps->pluginDir);
> +-    virBufferAsprintf(&buf, "<plugindirmtime>%lu</plugindirmtime>\n",
> +-                      nbdkitCaps->pluginDirMtime);
> ++    virBufferAsprintf(&buf, "<plugindirmtime>%llu</plugindirmtime>\n",
> ++                      (long long)nbdkitCaps->pluginDirMtime);
> +     virBufferEscapeString(&buf, "<filterdir>%s</filterdir>\n",
> +                           nbdkitCaps->filterDir);
> +-    virBufferAsprintf(&buf, "<filterdirmtime>%lu</filterdirmtime>\n",
> +-                      nbdkitCaps->filterDirMtime);
> +-    virBufferAsprintf(&buf, "<selfctime>%lu</selfctime>\n",
> +-                      nbdkitCaps->libvirtCtime);
> ++    virBufferAsprintf(&buf, "<filterdirmtime>%llu</filterdirmtime>\n",
> ++                      (long long)nbdkitCaps->filterDirMtime);
> ++    virBufferAsprintf(&buf, "<selfctime>%llu</selfctime>\n",
> ++                      (long long)nbdkitCaps->libvirtCtime);
> +     virBufferAsprintf(&buf, "<selfvers>%u</selfvers>\n",
> +                       nbdkitCaps->libvirtVersion);
> + 
> +@@ -593,10 +593,10 @@ virNbdkitCapsSaveFile(void *data,
> +         return -1;
> +     }
> + 
> +-    VIR_DEBUG("Saved caps '%s' for '%s' with (%lu, %lu)",
> ++    VIR_DEBUG("Saved caps '%s' for '%s' with (%llu, %llu)",
> +               filename, nbdkitCaps->path,
> +-              nbdkitCaps->ctime,
> +-              nbdkitCaps->libvirtCtime);
> ++              (long long)nbdkitCaps->ctime,
> ++              (long long)nbdkitCaps->libvirtCtime);
> + 
> +     return 0;
> + }
> +@@ -1054,7 +1054,7 @@ qemuNbdkitProcessBuildCommandCurl(qemuNbdkitProcess *proc,
> +     }
> + 
> +     if (proc->source->timeout > 0) {
> +-        g_autofree char *timeout = g_strdup_printf("%llu", proc->source->timeout);
> ++        g_autofree char *timeout = g_strdup_printf("%llu", (long long)proc->source->timeout);
> +         virCommandAddArgPair(cmd, "timeout", timeout);
> +     }
> + 
> +-- 
> +2.25.1
> +
> diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
> index 706d4a40..d57bdc11 100644
> --- a/recipes-extended/libvirt/libvirt_git.bb
> +++ b/recipes-extended/libvirt/libvirt_git.bb
> @@ -39,6 +39,7 @@ SRC_URI = "gitsm://github.com/libvirt/libvirt.git;name=libvirt;protocol=https;br
>             file://0001-messon.build-remove-build-path-information-to-avoid-.patch \
>             file://0001-meson.build-clear-abs_top_builddir-to-avoid-QA-warni.patch \
>             file://0001-tests-meson-clear-absolute-directory-paths.patch \
> +           file://0001-qemu_nbdkit.c-use-llu-to-print-time_t.patch \
>            "
>  
>  S = "${WORKDIR}/git"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8866): https://lists.yoctoproject.org/g/meta-virtualization/message/8866
> Mute This Topic: https://lists.yoctoproject.org/mt/108257527/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


