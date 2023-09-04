Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8049C71153
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 03:04:00 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.40757.1693796638676211373
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 03 Sep 2023 20:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=XRSLt0qA;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4122e42a76aso8675631cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 03 Sep 2023 20:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693796637; x=1694401437; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ws1AdASPMfvRZOx9zLorof0zgt1WezwyRl8llbrzqv4=;
        b=XRSLt0qAiFG9D92Pgz1eB0cgtx4D9o1g73Cc3WP3PHLTuYZYYnekeAHtaRIeT481bp
         NkojrOGSPI12TIrbBRrfv+fjdsYw70Buk+OdExynXqu08O39B6oPlVWnlIOWvx9sAWR9
         /fWFVHR1M/pPzDGK0T+E7rmw58CinZPxyMla9ezaHuVkNcKUkRUYlcIMEbG0QZg8su8I
         a5RjVTkBb+xjdjeOkm9Yqfv/RdCzUh9PuEUdsfSspCv36No00698lNmjKdTX493bc1PU
         +PcIVLeVFipNZhP9wsqw3nNLWuHfyVqRqSbS0VA+Y/IU1umaAX4gM5v7SlBiZBzRxtw8
         wJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693796637; x=1694401437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ws1AdASPMfvRZOx9zLorof0zgt1WezwyRl8llbrzqv4=;
        b=g925yk/Tu0cOKIjSmCOg+IIBZ2v6WsRl/SvskxkIvaSW8q+uDi5jvweZnC7bNTfZyv
         saqFdB8qQC1Hf1j3m6ShIFYmbHSYOHtwb8dGyyrMGdO6VZEn54B0yM6MwUFu+lgoZy1g
         BelKc4euxkypBawpS3sckufJr4uDpshJFvZWd0GP+hdADWsOD3js3Suc97Ak/JhJ5ti+
         ubKx/msqRFmcdMRsEkw+F26kRAQhgT908il/juzSwnaJ70LesAOcAbWEVT1CRQ7c6wLP
         iqzeivNOLLG43lUVIxVu//DgRFpLl2KTs0TKw+RmQrMNsA6Rc2FlU3TqXwxM3nRkB2Vq
         6gUw==
X-Gm-Message-State: AOJu0Yy1/7LIZ2L/p+bNVagjT86Uryp9go1WM4Soo0EeO3ickBgAAH04
	18qCXIMuUrGd2XNEm646Dko=
X-Google-Smtp-Source: AGHT+IGHiKKM8g3xoWlced1fKXz4gI3RBfazQlpfvizJbQWJ0J6eeCeEQzNBVPJ1dkn7+X/8WBgfoA==
X-Received: by 2002:ac8:598a:0:b0:403:aa78:e9c3 with SMTP id e10-20020ac8598a000000b00403aa78e9c3mr13405831qte.26.1693796637581;
        Sun, 03 Sep 2023 20:03:57 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id d20-20020ac847d4000000b00403b3156f18sm3289828qtr.8.2023.09.03.20.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 20:03:57 -0700 (PDT)
Date: Mon, 4 Sep 2023 03:03:55 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCHv2] libvirt-glib: fix introspection
 and documentation build
Message-ID: <ZPVJGypEsVRycQF2@gmail.com>
References: <20230829060759.80856-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829060759.80856-1-f_l_k@t-online.de>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 04 Sep 2023 03:04:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8266

v2 is staged.

Bruce

In message: [meta-virtualization][PATCHv2] libvirt-glib: fix introspection and documentation build
on 29/08/2023 Markus Volk wrote:

> Building Gobject introspection during cross-compilation is not an easy task.
> Therefore, the meson.build file disables the build for introspection and
> also for gtkdoc by default.
> This commit adds a patch to enable this, as introspection can be easily built
> on newer platforms with yocto/oe.
> 
> The options to enable/disable introspection/doc are defined as feature
> while the corresponding bbclass defines it as a boolean.
> Override this so that it should be possible to be enabled/disabled by using DISTRO_FEATURES.
> 
> Inherit  gettext bbclass as used in libvirt-glib.
> 
> Add a missing dependency on libxslt.
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...ild-allow-crosscompiling-gir-and-doc.patch | 37 +++++++++++++++++++
>  .../libvirt/libvirt-glib_4.0.0.bb             | 15 ++++++--
>  2 files changed, 48 insertions(+), 4 deletions(-)
>  create mode 100644 recipes-extended/libvirt/libvirt-glib/0001-meson.build-allow-crosscompiling-gir-and-doc.patch
> 
> diff --git a/recipes-extended/libvirt/libvirt-glib/0001-meson.build-allow-crosscompiling-gir-and-doc.patch b/recipes-extended/libvirt/libvirt-glib/0001-meson.build-allow-crosscompiling-gir-and-doc.patch
> new file mode 100644
> index 00000000..cd17bbbf
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt-glib/0001-meson.build-allow-crosscompiling-gir-and-doc.patch
> @@ -0,0 +1,37 @@
> +From 019d727990d41b5d7911895b75bcb021e4cca3c6 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Mon, 21 Aug 2023 10:23:08 +0200
> +Subject: [PATCH] meson.build: allow crosscompiling gir and doc
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +---
> + meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 134feb6..a089f42 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -58,7 +58,7 @@ includedir = join_paths(prefix, get_option('includedir'))
> + 
> + # gobject introspection
> + gir = find_program('g-ir-scanner', required: get_option('introspection'))
> +-enable_introspection = gir.found() and not meson.is_cross_build()
> ++enable_introspection = gir.found()
> + 
> + # vala
> + vapi_opt = get_option('vapi')
> +@@ -73,7 +73,7 @@ endif
> + # gtk-doc
> + if not get_option('docs').disabled()
> +   gtk_doc = find_program('gtkdoc-scan', required: get_option('docs'))
> +-  enable_doc = gtk_doc.found() and not meson.is_cross_build()
> ++  enable_doc = gtk_doc.found()
> + else
> +   enable_doc = false
> + endif
> +-- 
> +2.41.0
> +
> diff --git a/recipes-extended/libvirt/libvirt-glib_4.0.0.bb b/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
> index a5cd8276..7ca65a95 100644
> --- a/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
> +++ b/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
> @@ -3,12 +3,19 @@ HOMEPAGE = "http://libvirt.org"
>  LICENSE = "LGPL-2.1-only"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>  
> -DEPENDS = "glib-2.0 libvirt libxml2"
> +DEPENDS = "glib-2.0 libvirt libxml2 libxslt"
>  
> -SRC_URI = "git://gitlab.com/libvirt/libvirt-glib;protocol=https;branch=master"
> +SRC_URI = " \
> +	git://gitlab.com/libvirt/libvirt-glib;protocol=https;branch=master \
> +	file://0001-meson.build-allow-crosscompiling-gir-and-doc.patch \
> +"
>  
>  SRCREV = "e0bfc34682744a74b850fa217e9c206a9eb80612"
>  S = "${WORKDIR}/git"
>  
> -inherit meson pkgconfig gobject-introspection vala
> -GIR_MESON_OPTION = ''
> +inherit meson pkgconfig gobject-introspection gettext vala gtk-doc
> +
> +GIR_MESON_ENABLE_FLAG = 'enabled'
> +GIR_MESON_DISABLE_FLAG = 'disabled'
> +GTKDOC_MESON_ENABLE_FLAG = 'enabled'
> +GTKDOC_MESON_DISABLE_FLAG = 'disabled'
> -- 
> 2.41.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8259): https://lists.yoctoproject.org/g/meta-virtualization/message/8259
> Mute This Topic: https://lists.yoctoproject.org/mt/101026154/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


