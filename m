Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.9130.1630075916564902156
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 27 Aug 2021 07:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oO+7MfPA;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id 14so7438046qkc.4
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 27 Aug 2021 07:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yEiELB0QszfKWHkIrFy8DvBWv+0JeAdNQWs07N39y3g=;
        b=oO+7MfPAvDjwu6pDLv+gRqiO2wGz4oJn4SVXAyq7gOagtZcylAipW11lPl+MuVNOJv
         trXf8nJjWGU2KMKNtBYVizZ3vY6eoQEKhBfr32q0Jc2CPij250gW8S/YPLA+DRllLYjd
         hNPXSebcWU0fkWYdTVPDxW3qr+cBEI/b/XJEIRhleGb3+yFDWHWSbjZgGqXTae0tK0gm
         5YWeIZ29fXqPdaf7MNYDCTMsrI8Fy3c1YxhGUDFEHOHd9JY3/lnC67IxgMch5Fy53xQh
         s8rlNGP4+mVNqVlBFRgavRcNVrq0c7cwfeEG8+Yrk52WScL9Hv1EXjW8KURY6Po/HVgj
         skIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yEiELB0QszfKWHkIrFy8DvBWv+0JeAdNQWs07N39y3g=;
        b=qvhe1vLDge/F4JkkSxQfPzAYymDY3GC30QgywpgyHaZbKeMNTmkk58MHAiQaZlz7qP
         oA+bNgL/XHQps9BBYl/MpqW+ISgfqpZ281RFwo7E3/BhzNNSaWYXg1zUpQqBnx4ZBtlv
         +p85aspS4IxRXpX2+gboLPVDmgWztEgHDC2fQbXPw6Ny/+i4sFNXni8zpbkex/ib1dhQ
         pwZlFNAS0H6NgUtQE8m9SVypXJsyM1XK6gnXQnDdqIcGGnqf5si3PgnjUtNkie7ZBuF/
         orI9Oxl5ivds5MOQhIbHQ2Gf0r5CfjyXMEKKEiC48PBsni7grAfSJ/s+enmQA3DlQzwD
         DzaQ==
X-Gm-Message-State: AOAM5322zrMEuhY7Q+VKS2cppyrej9LQg9028APOFPoxsiznQKwjEGyB
	7LE8oZru2xKOQ5ATOdNCDQw=
X-Google-Smtp-Source: ABdhPJyx7mkXcx2/OZEBKaRtZTZsfh5qjoGQZclstSel7WOj2llOD1zofOm61RDXMj33Zo9Ou+e6qw==
X-Received: by 2002:a05:620a:2849:: with SMTP id h9mr9562861qkp.69.1630075915611;
        Fri, 27 Aug 2021 07:51:55 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id bi20sm4601209qkb.133.2021.08.27.07.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 07:51:54 -0700 (PDT)
Date: Fri, 27 Aug 2021 10:51:53 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, cardoe@gentoo.org
Subject: Re: [meta-virtualization][PATCH] xen, xen-tools: apply workaround for gnu linker error to fix x86 build
Message-ID: <20210827145150.GA23331@gmail.com>
References: <20210824051027.200287-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210824051027.200287-1-christopher.w.clark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged!

Bruce

In message: [meta-virtualization][PATCH] xen, xen-tools: apply workaround for gnu linker error to fix x86 build
on 23/08/2021 Christopher Clark wrote:

> Upstream patch applied to each Xen and Xen tools recipe to fix the build
> of the hypervisor and shim with GNU linker 2.37.
> 
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> ---
>  ...-around-build-issue-with-GNU-ld-2.37.patch | 36 +++++++++++++++++++
>  recipes-extended/xen/xen-tools_4.14.bb        |  1 +
>  recipes-extended/xen/xen-tools_4.15.bb        |  1 +
>  recipes-extended/xen/xen-tools_git.bb         |  1 +
>  recipes-extended/xen/xen_4.14.bb              |  1 +
>  recipes-extended/xen/xen_4.15.bb              |  1 +
>  recipes-extended/xen/xen_git.bb               |  1 +
>  7 files changed, 42 insertions(+)
>  create mode 100644 recipes-extended/xen/files/0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch
> 
> diff --git a/recipes-extended/xen/files/0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch b/recipes-extended/xen/files/0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch
> new file mode 100644
> index 0000000..f5108be
> --- /dev/null
> +++ b/recipes-extended/xen/files/0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch
> @@ -0,0 +1,36 @@
> +From 58ad654ebce7ccb272a3f4f3482c03aaad850d31 Mon Sep 17 00:00:00 2001
> +From: Jan Beulich <jbeulich@suse.com>
> +Date: Thu, 22 Jul 2021 11:20:38 +0200
> +Subject: [PATCH] x86: work around build issue with GNU ld 2.37
> +
> +I suspect it is commit 40726f16a8d7 ("ld script expression parsing")
> +which broke the hypervisor build, by no longer accepting section names
> +with a dash in them inside ADDR() (and perhaps other script directives
> +expecting just a section name, not an expression): .note.gnu.build-id
> +is such a section.
> +
> +Quoting all section names passed to ADDR() via DECL_SECTION() works
> +around the regression.
> +
> +Signed-off-by: Jan Beulich <jbeulich@suse.com>
> +Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> +---
> + xen/arch/x86/xen.lds.S | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> +index 9c6c1c8005..955d5cf4a0 100644
> +--- a/xen/arch/x86/xen.lds.S
> ++++ b/xen/arch/x86/xen.lds.S
> +@@ -18,7 +18,7 @@ ENTRY(efi_start)
> + #else /* !EFI */
> + 
> + #define FORMAT "elf64-x86-64"
> +-#define DECL_SECTION(x) x : AT(ADDR(x) - __XEN_VIRT_START)
> ++#define DECL_SECTION(x) x : AT(ADDR(#x) - __XEN_VIRT_START)
> + 
> + ENTRY(start_pa)
> + 
> +-- 
> +2.25.1
> +
> diff --git a/recipes-extended/xen/xen-tools_4.14.bb b/recipes-extended/xen/xen-tools_4.14.bb
> index 6fd6f7f..ce5dc2e 100644
> --- a/recipes-extended/xen/xen-tools_4.14.bb
> +++ b/recipes-extended/xen/xen-tools_4.14.bb
> @@ -9,6 +9,7 @@ SRC_URI = " \
>      file://0001-firmware-provide-a-stand-alone-set-of-headers-Xen-4.14.patch \
>      file://0001-tools-firmware-Build-firmware-as-ffreestanding-Xen-4.14.patch \
>      file://0001-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-pr.patch \
> +    file://0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch \
>      "
>  
>  LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
> diff --git a/recipes-extended/xen/xen-tools_4.15.bb b/recipes-extended/xen/xen-tools_4.15.bb
> index f3f9cd3..e9c3bd6 100644
> --- a/recipes-extended/xen/xen-tools_4.15.bb
> +++ b/recipes-extended/xen/xen-tools_4.15.bb
> @@ -7,6 +7,7 @@ SRC_URI = " \
>      git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
>      file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
>      file://0001-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-pr.patch \
> +    file://0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch \
>      "
>  
>  LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
> diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xen/xen-tools_git.bb
> index 0b2dce9..6926bd9 100644
> --- a/recipes-extended/xen/xen-tools_git.bb
> +++ b/recipes-extended/xen/xen-tools_git.bb
> @@ -7,6 +7,7 @@ SRC_URI = " \
>      git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
>      file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
>      file://0001-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-pr.patch \
> +    file://0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch \
>      "
>  
>  LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
> diff --git a/recipes-extended/xen/xen_4.14.bb b/recipes-extended/xen/xen_4.14.bb
> index 0dd9d3c..291ba16 100644
> --- a/recipes-extended/xen/xen_4.14.bb
> +++ b/recipes-extended/xen/xen_4.14.bb
> @@ -7,6 +7,7 @@ SRC_URI = " \
>      git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
>      file://xen-arm64-implement-atomic-fetch-add.patch \
>      file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
> +    file://0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch \
>      "
>  
>  LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
> diff --git a/recipes-extended/xen/xen_4.15.bb b/recipes-extended/xen/xen_4.15.bb
> index d0aa176..0605441 100644
> --- a/recipes-extended/xen/xen_4.15.bb
> +++ b/recipes-extended/xen/xen_4.15.bb
> @@ -8,6 +8,7 @@ SRC_URI = " \
>      file://xen-arm64-implement-atomic-fetch-add.patch \
>      file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
>      file://0001-x86-make-hypervisor-build-with-gcc11.patch \
> +    file://0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch \
>      "
>  
>  LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
> index 7ce7228..12c9403 100644
> --- a/recipes-extended/xen/xen_git.bb
> +++ b/recipes-extended/xen/xen_git.bb
> @@ -8,6 +8,7 @@ SRC_URI = " \
>      file://xen-arm64-implement-atomic-fetch-add.patch \
>      file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
>      file://0001-x86-make-hypervisor-build-with-gcc11.patch \
> +    file://0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch \
>      "
>  
>  LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
> -- 
> 2.25.1
> 
