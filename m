Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65843C433FE
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 18:41:41 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.124.1649263371613902474
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 06 Apr 2022 09:42:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aRbuDYko;
 spf=pass (domain: gmail.com, ip: 209.85.160.171,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id i4so5254353qti.7
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 06 Apr 2022 09:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RqkeCWg8nKMk9G+jxMfADgwqMRJfYd1QAF9mm3h2tb0=;
        b=aRbuDYkoYLLGdHRF4xmO/4OX9RDXGI/Sxmi9fFKymvGyXdeUY57ICUktoklAYWwt2g
         ihYMEf2vHBQ0jILSh5/jRbPVvWxKcViVOq7hi/fhA1NIiWvLXxDAafRSePEeO1HUMlv+
         flzro+uWQJeCeLCNuiqT8TpF0mCAWfD0+9UB4q7qy9EAK0SHF+rodNBgPPgSfV3K7+82
         uMORplXYbHVMeGMjl4+TQH0K5uHaumL4GymdX8N4EtDd65LKlcAVzyQiu6DDf1VtP4sC
         W4LSlnnoUOJ85aw5Bpp1VXsig4TwFxBq6YKYWwtP2dStSehpGJRMal0aO0P28pOu4vHr
         voqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RqkeCWg8nKMk9G+jxMfADgwqMRJfYd1QAF9mm3h2tb0=;
        b=dm1Rac5hMLyqFEPoVIfkKyIjALcAENtHmmfbYj3E3jafzxnbOKWXk9y653HYX1khEg
         6M0N23xx0b9eJj7CzDaEwKvDBtkaqMKoPpAhz8Nmjwtxrpy4hdKRoe0BEkwcNJxmMNvy
         3nvXjjLlUglrhPhcMQm95YxRoBvlx9awrz9SZ5nQBWd9ZhKeRMvp8QjDTeRVAkEtxuHi
         jL3R64gX+tALI8F3a6G8uDcizGeXTR5gyt2vE/PI90Asv6NiBnkqIq4zPZjqV+WRgCe5
         DNxXvKvcdJbHB8ghEsAoMz4oDBXoCUNts6bbBq+5zZYA0tCw8COqqLKBfak8RirmYcTL
         F80Q==
X-Gm-Message-State: AOAM530Y1YlmGHgdfvReFuMLbfnnjrzxzFcnAYxVqtbTh1m4q5Q8FDc9
	C1HJTEvxTb077Az58birJjw=
X-Google-Smtp-Source: 
 ABdhPJwfbX4Mnf7rpSFRXt+ehHVVyrvQHPac9jydo6Y4MzM31J9kAjdOhVlgMx9nPuyPVfs5pRJN7g==
X-Received: by 2002:a37:a308:0:b0:67e:428:bfa with SMTP id
 m8-20020a37a308000000b0067e04280bfamr6340924qke.546.1649263370546;
        Wed, 06 Apr 2022 09:42:50 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 t19-20020ac85893000000b002e1afa26591sm15123430qta.52.2022.04.06.09.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 09:42:50 -0700 (PDT)
Date: Wed, 6 Apr 2022 12:42:48 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][dunfell][PATCH] containerd-opencontainers:
 add EXTRA_EXTLDFLAGS and use it to fix build with gold
Message-ID: <20220406164245.GA41737@gmail.com>
References: <20220401190740.2179656-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401190740.2179656-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 06 Apr 2022 18:41:41 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7126

Sorry for the delay, this is now merged to dunfell.

Bruce

In message: [meta-virtualization][dunfell][PATCH] containerd-opencontainers: add EXTRA_EXTLDFLAGS and use it to fix build with gold
on 01/04/2022 Martin Jansa wrote:

> * Work around internal error in gold triggered due to DWARF-5 by forcing to use bfd even with ld-is-gold:
>   _/OE/lge/build/webosose/dunfell/BUILD/work/qemux86_64-webos-linux/containerd-opencontainers/v1.2.14+gitAUTOINC+3b3e9d5f62-r0/git/src/import/cmd/containerd-shim
>   /OE/lge/build/webosose/dunfell/BUILD/work/qemux86_64-webos-linux/containerd-opencontainers/v1.2.14+gitAUTOINC+3b3e9d5f62-r0/recipe-sysroot-native/usr/lib/x86_64-webos-linux/go/pkg/tool/linux_amd64/link: running x86_64-webos-linux-gcc failed: exit status 1
>   /OE/lge/build/webosose/dunfell/BUILD/work/qemux86_64-webos-linux/containerd-opencontainers/v1.2.14+gitAUTOINC+3b3e9d5f62-r0/recipe-sysroot-native/usr/bin/x86_64-webos-linux/../../libexec/x86_64-webos-linux/gcc/x86_64-webos-linux/9.3.0/ld: internal error in read_header_prolog, at ../../gold/dwarf_reader.cc:1678
>   collect2: error: ld returned 1 exit status
> 
> * alternatively we can backport DWARF-5 support to binutils-2.34 used in dunfell like in:
>   https://git.openembedded.org/openembedded-core/commit/?id=d07d4d739ae17787017f771dd2068fda0e836722
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../0001-Add-build-option-GODEBUG-1.patch             |  2 +-
>  .../0001-build-use-oe-provided-GO-and-flags.patch     |  0
>  .../containerd/containerd-opencontainers_git.bb       | 11 ++++++++++-
>  3 files changed, 11 insertions(+), 2 deletions(-)
>  rename recipes-containers/containerd/{files => containerd-opencontainers}/0001-build-use-oe-provided-GO-and-flags.patch (100%)
> 
> diff --git a/recipes-containers/containerd/containerd-opencontainers/0001-Add-build-option-GODEBUG-1.patch b/recipes-containers/containerd/containerd-opencontainers/0001-Add-build-option-GODEBUG-1.patch
> index 05c4f15..fec9ea6 100644
> --- a/recipes-containers/containerd/containerd-opencontainers/0001-Add-build-option-GODEBUG-1.patch
> +++ b/recipes-containers/containerd/containerd-opencontainers/0001-Add-build-option-GODEBUG-1.patch
> @@ -33,7 +33,7 @@ index 4355395..4fb5d3b 100644
>  -GO_LDFLAGS=-ldflags '-s -w -X $(PKG)/version.Version=$(VERSION) -X $(PKG)/version.Revision=$(REVISION) -X $(PKG)/version.Package=$(PACKAGE) $(EXTRA_LDFLAGS)'
>  -SHIM_GO_LDFLAGS=-ldflags '-s -w -X $(PKG)/version.Version=$(VERSION) -X $(PKG)/version.Revision=$(REVISION) -X $(PKG)/version.Package=$(PACKAGE) -extldflags "-static"'
>  +GO_LDFLAGS=-ldflags '-X $(PKG)/version.Version=$(VERSION) -X $(PKG)/version.Revision=$(REVISION) -X $(PKG)/version.Package=$(PACKAGE) $(EXTRA_LDFLAGS)'
> -+SHIM_GO_LDFLAGS=-ldflags '-X $(PKG)/version.Version=$(VERSION) -X $(PKG)/version.Revision=$(REVISION) -X $(PKG)/version.Package=$(PACKAGE) -extldflags "-static" $(EXTRA_LDFLAGS)'
> ++SHIM_GO_LDFLAGS=-ldflags '-X $(PKG)/version.Version=$(VERSION) -X $(PKG)/version.Revision=$(REVISION) -X $(PKG)/version.Package=$(PACKAGE) -extldflags "-static $(EXTRA_EXTLDFLAGS)" $(EXTRA_LDFLAGS)'
>   
>   #Replaces ":" (*nix), ";" (windows) with newline for easy parsing
>   GOPATHS=$(shell echo ${GOPATH} | tr ":" "\n" | tr ";" "\n")
> diff --git a/recipes-containers/containerd/files/0001-build-use-oe-provided-GO-and-flags.patch b/recipes-containers/containerd/containerd-opencontainers/0001-build-use-oe-provided-GO-and-flags.patch
> similarity index 100%
> rename from recipes-containers/containerd/files/0001-build-use-oe-provided-GO-and-flags.patch
> rename to recipes-containers/containerd/containerd-opencontainers/0001-build-use-oe-provided-GO-and-flags.patch
> diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
> index a52a5c3..5f697ed 100644
> --- a/recipes-containers/containerd/containerd-opencontainers_git.bb
> +++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
> @@ -10,7 +10,16 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=1269f40c0d099c21a871163984590d
>  
>  CONTAINERD_VERSION = "v1.2.14"
>  
> -EXTRA_OEMAKE += "GODEBUG=1"
> +# Work around internal error in gold triggered due to DWARF-5 by forcing to use bfd even with ld-is-gold:
> +# _/OE/lge/build/webosose/dunfell/BUILD/work/qemux86_64-webos-linux/containerd-opencontainers/v1.2.14+gitAUTOINC+3b3e9d5f62-r0/git/src/import/cmd/containerd-shim
> +# /OE/lge/build/webosose/dunfell/BUILD/work/qemux86_64-webos-linux/containerd-opencontainers/v1.2.14+gitAUTOINC+3b3e9d5f62-r0/recipe-sysroot-native/usr/lib/x86_64-webos-linux/go/pkg/tool/linux_amd64/link: running x86_64-webos-linux-gcc failed: exit status 1
> +# /OE/lge/build/webosose/dunfell/BUILD/work/qemux86_64-webos-linux/containerd-opencontainers/v1.2.14+gitAUTOINC+3b3e9d5f62-r0/recipe-sysroot-native/usr/bin/x86_64-webos-linux/../../libexec/x86_64-webos-linux/gcc/x86_64-webos-linux/9.3.0/ld: internal error in read_header_prolog, at ../../gold/dwarf_reader.cc:1678
> +# collect2: error: ld returned 1 exit status
> +# alternatively we can backport DWARF-5 support to binutils-2.34 used in dunfell like in:
> +# https://git.openembedded.org/openembedded-core/commit/?id=d07d4d739ae17787017f771dd2068fda0e836722
> +EXTRA_EXTLDFLAGS = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
> +
> +EXTRA_OEMAKE += "GODEBUG=1 EXTRA_EXTLDFLAGS='${EXTRA_EXTLDFLAGS}'"
>  
>  PROVIDES += "virtual/containerd"
>  RPROVIDES_${PN} = "virtual/containerd"
> -- 
> 2.35.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7124): https://lists.yoctoproject.org/g/meta-virtualization/message/7124
> Mute This Topic: https://lists.yoctoproject.org/mt/90186767/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


