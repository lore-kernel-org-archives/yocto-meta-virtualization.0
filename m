Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA82C433EF
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 18:08:17 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web09.680.1651514889152401446
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 May 2022 11:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eaj0J577;
 spf=pass (domain: gmail.com, ip: 209.85.160.170,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id t11so11665238qto.11
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 May 2022 11:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2m9ba0v26iSjIF/Z0s3Rx0u2JMKl2lZ5knn5r1J+mTQ=;
        b=eaj0J577gQCxtcZ6qK45wFW34fk+KcDqCkCONS64ti9H19rEAWDffjzgcNd43P1jVE
         Q8HN5vB2ywB+1gxhxaGbsPRbEsJKn5UvIfcHVpahkLOXN2zU5qu9YWagD88NTYYaEjjE
         gcSYimb+3ZmE7AwI8zrsfoWCFNDjSMwE/BNDe22gAG8A2nLyAtcI+cJ5hIAUpyykZ+Md
         Euq+oAZqQby7oQ91Z28IdM+Z6kxa2PsMWYiM7JqVdkilUoMg/RsEG1dUi4moAzoy7J1Z
         9I6b8RK6X1G63QilXeb33eOegNfP7AaS454dKqvfuX/zD9x/G8qYDoMQGKrOLCB6EvpF
         7Gnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2m9ba0v26iSjIF/Z0s3Rx0u2JMKl2lZ5knn5r1J+mTQ=;
        b=UBA5oIZ3BpxXeSHC/BJUgBVvAHKpvDG6G/0YFpKVr7yQrhDHynD9oEOuvLJYU812qI
         q5+/lpIPKl+u8mYjiMpHDsHrEe02OaLQlbum4KkZ3gudlgvqydO8s28HRbZQwSAaMkGy
         WwtnaeSuGTE3MdAwxOxuq+jiKWMW1DXqA2wjrgCcJc/HAoY+mmCMVX+7G0gWEOj55Hpg
         cN9bKAC0+y3eUoLdErhissRR+SCj9NZV5GJntaF2Blm4fhAMxkqd6ahJ6+JDSLTo4Ik6
         +v6FJXQ1qQdxyyFxpXEU/X0s/xQ4M1wmXVoC3Av16esmNeF/hANOLUH28SkD+uhbuwwz
         iBgQ==
X-Gm-Message-State: AOAM5301U7GLUgzT+QVRXFFwaZl+HYurDCcVSzfiNJFsh1sAqDiJZDdv
	SaPgSKPJOyibUEbe0CxU11k=
X-Google-Smtp-Source: 
 ABdhPJykIVVE0GHqVL4yo1Mr8+O9vUBQ9ODcRhUx28eqHriMuHqYY7IonzTJn+eHwCAuVGp5ZZ4yuA==
X-Received: by 2002:ac8:5895:0:b0:2e1:c997:a629 with SMTP id
 t21-20020ac85895000000b002e1c997a629mr11358303qta.124.1651514888118;
        Mon, 02 May 2022 11:08:08 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 q25-20020ac84519000000b002f39b99f6c7sm4602338qtn.97.2022.05.02.11.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 11:08:07 -0700 (PDT)
Date: Mon, 2 May 2022 14:08:06 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Ross Burton <ross.burton@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-virtualization] [PATCH 1/2] vgabios: upgrade to 0.8a and
 cleanup recipe
Message-ID: <20220502180805.GB33182@gmail.com>
References: <20220429121136.2287359-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220429121136.2287359-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 02 May 2022 18:08:17 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7240

both patches are merged.

Bruce

In message: [meta-virtualization] [PATCH 1/2] vgabios: upgrade to 0.8a and cleanup recipe
on 29/04/2022 Ross Burton wrote:

> Upgrade to 0.8a.
> 
> License checksum updated as the FSF street address changed.
> 
> Apply a patch to use the correct host compiler when building biossums,
> removing the need for a separate biossums-native recipe.
> 
> Don't hardcode /usr/share, use ${datadir}.
> 
> Install all found firmware (including the new Banshee BIOS in 0.8a) and
> the debug files which were not installed but intended to be packaged.
> 
> Remove redundant PR and S assignments, as these are the default values.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  recipes-extended/vgabios/biossums_0.7a.bb     | 37 -------------------
>  recipes-extended/vgabios/files/build-cc.patch | 30 +++++++++++++++
>  recipes-extended/vgabios/vgabios_0.7a.bb      | 33 -----------------
>  recipes-extended/vgabios/vgabios_0.8a.bb      | 25 +++++++++++++
>  4 files changed, 55 insertions(+), 70 deletions(-)
>  delete mode 100644 recipes-extended/vgabios/biossums_0.7a.bb
>  create mode 100644 recipes-extended/vgabios/files/build-cc.patch
>  delete mode 100644 recipes-extended/vgabios/vgabios_0.7a.bb
>  create mode 100644 recipes-extended/vgabios/vgabios_0.8a.bb
> 
> diff --git a/recipes-extended/vgabios/biossums_0.7a.bb b/recipes-extended/vgabios/biossums_0.7a.bb
> deleted file mode 100644
> index 95483ff..0000000
> --- a/recipes-extended/vgabios/biossums_0.7a.bb
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -DESCRIPTION = "biossums tool for building Plex86/Bochs LGPL VGABios"
> -HOMEPAGE = "http://www.nongnu.org/vgabios/"
> -LICENSE = "LGPL-2.1-only"
> -SECTION = "firmware"
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=dcf3c825659e82539645da41a7908589"
> -
> -SRC_URI =  "http://savannah.gnu.org/download/vgabios/vgabios-${PV}.tgz"
> -
> -SRC_URI[md5sum] = "2c0fe5c0ca08082a9293e3a7b23dc900"
> -SRC_URI[sha256sum] = "9d24c33d4bfb7831e2069cf3644936a53ef3de21d467872b54ce2ea30881b865"
> -
> -BBCLASSEXTEND = "native"
> -
> -FILES:${PN} = "${bindir}/biossums"
> -
> -S = "${WORKDIR}/vgabios-${PV}"
> -
> -do_configure() {
> -    # Don't override the compiler or its flags:
> -    sed 's,^CC,DISABLED_CC,' -i Makefile
> -    sed 's,^CFLAGS,DISABLED_CFLAGS,' -i Makefile
> -    sed 's,^LDFLAGS,DISABLED_LDFLAGS,' -i Makefile
> -    # Supply the C flags to the compiler:
> -    sed 's,-o biossums,$(CFLAGS) -o biossums,' -i Makefile
> -}
> -
> -do_compile() {
> -    # clean removes binaries distributed with source
> -    oe_runmake clean
> -    oe_runmake biossums
> -}
> -
> -do_install() {
> -    mkdir -p "${D}${bindir}"
> -    install -m 0755 biossums "${D}${bindir}"
> -}
> diff --git a/recipes-extended/vgabios/files/build-cc.patch b/recipes-extended/vgabios/files/build-cc.patch
> new file mode 100644
> index 0000000..b64e5ef
> --- /dev/null
> +++ b/recipes-extended/vgabios/files/build-cc.patch
> @@ -0,0 +1,30 @@
> +Use the host compiler to build the tools we need at runtime.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +Index: Makefile
> +===================================================================
> +--- a/Makefile	(revision 298)
> ++++ b/Makefile	(working copy)
> +@@ -5,6 +5,7 @@
> + SHELL = /bin/sh
> + 
> + CC      = gcc
> ++HOSTCC = gcc
> + CFLAGS  = -g -O2 -Wall -Wstrict-prototypes
> + LDFLAGS = 
> + 
> +@@ -79,10 +80,10 @@
> + 	tar czvf ../$(RELEASE).tgz --exclude .svn -C .. $(RELEASE)/
> + 
> + biossums: biossums.c
> +-	$(CC) -o biossums biossums.c
> ++	$(HOSTCC) -o biossums biossums.c
> + 
> + vbetables-gen: vbetables-gen.c
> +-	$(CC) -o vbetables-gen vbetables-gen.c
> ++	$(HOSTCC) -o vbetables-gen vbetables-gen.c
> + 
> + vbetables.h: vbetables-gen
> + 	./vbetables-gen > $@
> diff --git a/recipes-extended/vgabios/vgabios_0.7a.bb b/recipes-extended/vgabios/vgabios_0.7a.bb
> deleted file mode 100644
> index f443aed..0000000
> --- a/recipes-extended/vgabios/vgabios_0.7a.bb
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -DESCRIPTION = "Plex86/Bochs LGPL VGABios"
> -HOMEPAGE = "http://www.nongnu.org/vgabios/"
> -LICENSE = "LGPL-2.1-only"
> -SECTION = "firmware"
> -
> -DEPENDS = "dev86-native biossums-native"
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=dcf3c825659e82539645da41a7908589"
> -
> -SRC_URI =  "http://savannah.gnu.org/download/vgabios/${BPN}-${PV}.tgz"
> -
> -SRC_URI[md5sum] = "2c0fe5c0ca08082a9293e3a7b23dc900"
> -SRC_URI[sha256sum] = "9d24c33d4bfb7831e2069cf3644936a53ef3de21d467872b54ce2ea30881b865"
> -
> -PR = "r0"
> -
> -FILES:${PN} = "/usr/share/firmware/${PN}-${PV}*.bin"
> -FILES:${PN}-dbg = "/usr/share/firmware/${PN}-${PV}*.debug.bin"
> -
> -S = "${WORKDIR}/${PN}-${PV}"
> -
> -do_configure() {
> -    # Override to use the native-built biossums tool:
> -    sed 's,./biossums,biossums,' -i Makefile
> -    sed 's,$(CC) -o biossums biossums.c,touch biossums,' -i Makefile
> -}
> -
> -do_install() {
> -    install -d ${D}/usr/share/firmware
> -    install -m 0644 VGABIOS-lgpl-latest.bin ${D}/usr/share/firmware/${PN}-${PV}.bin
> -    install -m 0644 VGABIOS-lgpl-latest.cirrus.bin ${D}/usr/share/firmware/${PN}-${PV}.cirrus.bin
> -}
> -
> diff --git a/recipes-extended/vgabios/vgabios_0.8a.bb b/recipes-extended/vgabios/vgabios_0.8a.bb
> new file mode 100644
> index 0000000..044bb4e
> --- /dev/null
> +++ b/recipes-extended/vgabios/vgabios_0.8a.bb
> @@ -0,0 +1,25 @@
> +DESCRIPTION = "Plex86/Bochs LGPL VGABios"
> +HOMEPAGE = "http://www.nongnu.org/vgabios/"
> +LICENSE = "LGPL-2.1-only"
> +SECTION = "firmware"
> +
> +DEPENDS = "dev86-native"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=fae731a3adbc92fd8bb1730d1f2455bc"
> +
> +SRC_URI =  "http://savannah.gnu.org/download/vgabios/${BP}.tgz \
> +            file://build-cc.patch"
> +SRC_URI[sha256sum] = "481042240ef0f1c918780c92a6bb42ad4d3f5d989b29502fa7ee7faf13a041b9"
> +
> +EXTRA_OEMAKE = "HOSTCC="${BUILD_CC}""
> +
> +do_install() {
> +    install -d ${D}${datadir}/firmware
> +    for file in VGABIOS*.bin; do
> +        target=$(echo $file | sed s/VGABIOS-lgpl-latest/${BP}/)
> +        install -m0644 $file ${D}${datadir}/firmware/$target
> +    done
> +}
> +
> +FILES:${PN} = "${datadir}/firmware/${BP}*.bin"
> +FILES:${PN}-dbg = "${datadir}/firmware/${BP}*.debug.bin"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7230): https://lists.yoctoproject.org/g/meta-virtualization/message/7230
> Mute This Topic: https://lists.yoctoproject.org/mt/90774353/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


