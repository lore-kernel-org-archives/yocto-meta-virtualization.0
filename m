Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33BDEC43602
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 15:28:57 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.95669.1783092535838638456
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 08:28:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iiYYQZhK;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2caced6038eso7700325ad.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Jul 2026 08:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783092535; x=1783697335; darn=lists.yoctoproject.org;
        h=message-id:date:references:in-reply-to:cc:to:subject
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMT8Mhf9JsZEtEeouT2TCAYynV41oInuYkMb62H2Dok=;
        b=iiYYQZhKmCL3HzYpivuhFhr6NqmAp6F2EYrUFOV0DnzDVZ+KQbZ/DRYj2vKUx46UUh
         W3LSDOZio48pJS3U509606diQZ9GG0s5mydtJR8KvGmDbBgX937Te0AClmNrFDYOmGQr
         kxNblxu5Xp7LqC5yZuWxopmNJOTwowOVDKIY/jJ4H3cb4USEJAR7lwvNBs4EZ4hOQ2/K
         7+Br5szV4vXdlq0lwZPyF9adK3oQhKt1QC4zK3OKH7bJEibIESA+lQfHkiisplvYBIGT
         4Ewnr15uKKIKINXXNLh3G79ELwFfv0/dc+cfLikgpbc3m/gxTMC5C7rqt3GpN1q9aufp
         wkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783092535; x=1783697335;
        h=message-id:date:references:in-reply-to:cc:to:subject
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TMT8Mhf9JsZEtEeouT2TCAYynV41oInuYkMb62H2Dok=;
        b=TOnRAQUC6kDs1JLBX6IgVi/XjhyQtX+7ERHdGS+YZQlL639OCVyLR4NcFCu5O5I2BE
         Mr1UikezHeZ9pwfcXt0V0LkoIq+0NGja7TFKNHMNyJUXYzU5SNpKmPS4dWkqtDF3qhOI
         iqFx4XnQ4QDbD+Aajpj2oJcorr1wuv9n+Hzzyxf5f+/OaiBDlt0RDVpN4gFJNAoADD47
         pYFAK5pnH7yultN6XLk6meHGPd/XSiR0IZ1rkCHle9oiQVgLY8LqxGLbelzczmxH+gPv
         w2S8HF2hVuGLNaF10BOqUeSfNiGW9hJb8Lk7fk/HNxL+FpiCUL0hSkWZ2VfZdBIr1m9x
         Z1oA==
X-Forwarded-Encrypted: i=1; AHgh+Ro8CACLBnjG+1idnGky1YNJhICGFRo7itRyQiNFe/Y8V7+cJobkiGX1jBW8ihejdXJEDqpkst7roa5vQ2/xgDN2mUU9@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzhX0q6Q3R1eOu/SppXfqqswgsRYzEpqoTH/DUMFxn+S15lzBAR
	KrMu4xrDYyHQBrKLX+1iG6VgCXxuaaAUw0ILC1c8+3iYczYRxp+ByMWG67txIQ==
X-Gm-Gg: AfdE7ckwDGVsv6GJ38pZbbHhpmqeThHIplzcB7iT3Aq/lDSAJLplzMUQ1vYaU7G3LhP
	O9XXuGCnoVNzS+rSsEdPSnKfaF0kEXg0rPxfKzdwDGASultD2fH913ioiNYCRMTF5b7Q/76rEui
	hdlGTE+pO5Q4hnts/k0PK9PJeJodv4d8iDkhKgYXJ7rp7z8zd6eiCHRKtk1j+KpYsNRPkx3SxTr
	jfoZcQenkMcbMUUU+tPN2SSyMLW4qQ/nVB8sh0AxbUVSP9xlPAGbqfELEzek01IC803yKXM889G
	JkITAnC1RxLNJz0hSQLbDsi6Q2glYBg2tWWH64LywnPGVT3bQD+xJcC+l/1gXdcKs88jMLqZg5j
	LrOg8kFD4X5h+XlyAjMwB2sAflPLvd37/8pxtY6toBHSPYJDCOcgrdSmnnag3iBkvZ+1LSU3EXS
	pNOEabsPiys3S7H8jgQD99WKEQw5F/OLHeRCDwXvJV2YII/w==
X-Received: by 2002:a17:902:ebcb:b0:2ca:d4f:adab with SMTP id d9443c01a7336-2cacb06fac6mr46603505ad.19.1783092535089;
        Fri, 03 Jul 2026 08:28:55 -0700 (PDT)
Received: from macbookpro.home.local ([69.9.132.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25cffsm11323055ad.17.2026.07.03.08.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:28:54 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [meta-virtualization][PATCH 7/7] app-container-curl: use
 multilayer mode; container-nonroot-user
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: ticotimo@gmail.com, meta-virtualization@lists.yoctoproject.org
In-Reply-To: <6a2c4eb7.b63906d5.2d75f7.312b@mx.google.com>
References: <cover.1780104071.git.tim.orling@konsulko.com>
 <f3106949b40e31f8a993419a0fd8c463ed7a642c.1780104071.git.tim.orling@konsulko.com>
 <6a2c4eb7.b63906d5.2d75f7.312b@mx.google.com>
Date: Fri, 03 Jul 2026 08:28:53 -0700
Message-Id: <178309253300.29524.1959660853411369631.b4-reply@b4>
X-Mailer: b4 0.16-dev
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Jul 2026 15:28:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9923

On 2026-06-12 11:23:51-07:00, Bruce Ashfield wrote:
> Hi Tim,
> 
> Wrap-up patch, mostly aligns curl with the new conventions. One real
> question, one observation.
> 
> On Fri, May 29, 2026 at 18:31 -0700, Tim Orling wrote:
> 
> > * Move to recipes-containers/images to show maintenance intent
> > * Switch to multilayer mode to more like the other "library"/"official"
> >   container recipes.
> > * Change OCI_IMAGE_TAG to "latest" for similar reasons.
> > * Change OCI_IMAGE_ENTRYPOINT_ARGS to "--help" to be more like upstream
> >   containers.
> 
> The directory move right. no issues. recipes-demo was always
> "here's an example", recipes-containers/images is "this is supported".
> Same for "easy" → "latest"; matches Docker convention.
> 
> The "--help" default is a small but a win ... running the image with
> no args now self-documents instead of trying to hit a probably-absent
> localhost:80.
> 
> > +OCI_LAYERS = "\
> > +    base:packages:base-files+base-passwd+netbase \
> > +    ${@bb.utils.contains('PACKAGECONFIG', 'dev', 'shell:packages:${CONTAINER_SHELL}', '', d)} \
> > +    curl:packages:curl+ca-certificates \
> > +"
> 
> [...]
> 
> > -CONTAINER_SHELL = "busybox"
> 
> This worries me. The old recipe had CONTAINER_SHELL = "busybox" at
> the top level, so the variable always had a value. The new recipe
> removes that line and only references ${CONTAINER_SHELL} inside the
> conditional shell layer.
> 
> In non-dev mode that's fine because the whole bb.utils.contains
> expression resolves to the empty string and the layer doesn't appear.
> 
> In dev mode the OCI_LAYERS line expands to:
> 
>     shell:packages:
> 
> …because nothing in the recipe (or in container-nonroot-user.bbclass)
> sets CONTAINER_SHELL. image-oci.bbclass's validator parses this as a
> three-field entry with empty content, so it doesn't bb.fatal — but no
> packages get added to the auto-derived IMAGE_INSTALL, and the
> resulting layer is empty. The container is silently shipped without
> a shell, which is exactly the thing dev mode is supposed to provide.
> 
> Two ways to fix:
> 
>   a) Add a default in the recipe near the PACKAGECONFIG declaration:
> 
>          CONTAINER_SHELL ??= "busybox"
> 
>      Then anyone enabling dev gets busybox by default and the variable
>      remains overridable.
> 
>   b) Push the default into container-nonroot-user.bbclass so every
>      recipe that inherits it gets a consistent shell value.
> 
> I'd lean (a) — the class shouldn't carry a shell concept; that's a
> per-recipe choice — but either works.
> 

Added classes/container-dev-mode.bbclass which sets CONTAINER_SHELL to
'busybox' when PACKAGECONFIG contains 'dev'. For hardened/production mode
it is recommended to add 'container-dummy-provides' to PACKAGE_EXTRA_ARCHS
and then the class falls back to 'busybox' if that is not set.

> > +OCI_IMAGE_RUNTIME_UID = "${@bb.utils.contains('PACKAGECONFIG', 'dev', '0', '${NONROOT_UID}', d)}"
> 
> This dev-mode-overrides-uid pattern also appears in 2/7 (python). It's
> clean here, and identical there — another candidate for the helper
> class refactor whenever the rootfs_fixup_var_volatile factor-out
> happens, since it's the same shape of "PACKAGECONFIG dev means root".
> 

Good point and this was refactored into container-dev-mode.bbclass.

> > +IMAGE_INSTALL:append = " curl ca-certificates"
> 
> Same series-level point as the earlier recipes — image-oci.bbclass
> now auto-derives this from OCI_LAYERS in v2 / master-next, so the
> line can go.

IMAGE_INSTALL lines removed in v2.

> 
> Bruce



