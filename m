Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.1289.1582840830981792475
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Feb 2020 14:00:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kJw1cUrj;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D096FE0170D; Thu, 27 Feb 2020 14:00:30 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,FREEMAIL_REPLY,FSL_HELO_FAKE,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  3.0 FSL_HELO_FAKE FSL_HELO_FAKE
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.160.172 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  1.0 FREEMAIL_REPLY From and body contain different freemails
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8FA9DE008D9
	for <meta-virtualization@yoctoproject.org>; Thu, 27 Feb 2020 14:00:29 -0800 (PST)
Received: by mail-qt1-f172.google.com with SMTP id j23so535366qtr.11
        for <meta-virtualization@yoctoproject.org>; Thu, 27 Feb 2020 14:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vnafcRqI7vURgA4oyYy9MiE2AU4gRbx2jEoPcyLdLcQ=;
        b=kJw1cUrjBJNxEIyXVg3ZlZRSUM++7yDyFJN6fLcJz82GqjJw/JbJeyZBV78a91Gjz6
         PWYqXEthmh3YpUqyd905R525O4cEZSTIudxB+2zMIusJsKlxlfj5PktdRfUuiBfaY+Zn
         /hEztjnuiW1+CnJ9mEH+pN5XngaRar6kocilPM5CLYu3uyt+KfNoUgDsCElcLE36ApaY
         C4nR+VIT5dpwoiIFcYHRSGtgb8WoN6EfSnUE8TwGKmqR8w4S7SbtRMuSwX6V/kHgA5U7
         UGIadkMvR6gdpnFIzukeh8C0yZuSxbHbcqJyO+My2JtzXD42/Cl6V6ugy2Tmpchd8afc
         XJ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vnafcRqI7vURgA4oyYy9MiE2AU4gRbx2jEoPcyLdLcQ=;
        b=DCcJISRDeOloMqy17dG6sJ3MaW4/Gwqw1BBaijxZmxfZAig/itwqQ+reDP2PRgr2jP
         4fF7eo1tSHJD77PNLGz1+rwUfFrzLieWlrSzhmu3K6Bp2KIgvJdeXVaxZcHrPWoxn2Sz
         w0XL7IKJNp88U1JLu+zLjQkC5VPGvAO1DlddLhSfMmFqQLNJ8RbYELTqs1WZ20V6TY6T
         27S/QZIig/G2zUalqAllUtpLLZvADuozMdh0N0PoG996MtUAWN+f9VQo48Z73/j01D6X
         xupOPdaeFmSvGh3P+AiJhzB3zo24zp7kUuKdYaUqOUY5F3H5nRyT7tzn+Ci1V+BM/JRn
         LjHQ==
X-Gm-Message-State: APjAAAWaHnii8mriopFXBPVOnd0IJ2bRr5j5f12WWXm2sN5IwrUqk/8j
	63Qt9ARfoskoqRXyd3XYeko=
X-Google-Smtp-Source: APXvYqwUwqIYHEHp+NSCj8nsgjinakAys571DONe+Rm4xapNtA9kaqr+DRIBVMYKh1GpmSe3vFmNkQ==
X-Received: by 2002:ac8:7103:: with SMTP id z3mr1546180qto.172.1582840828801;
        Thu, 27 Feb 2020 14:00:28 -0800 (PST)
Received: from gmail.com (CPE98dac44fc29f-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.255.134])
        by smtp.gmail.com with ESMTPSA id k7sm3791723qtd.79.2020.02.27.14.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 14:00:28 -0800 (PST)
Date: Thu, 27 Feb 2020 17:00:26 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: christopher.w.clark@gmail.com
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] uxen-guest-tools, image: package the Linux VM tools for uXen hypervisor
Message-ID: <20200227220025.GE36079@gmail.com>
References: <20200225003700.14858-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200225003700.14858-1-christopher.w.clark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: [meta-virtualization][PATCH] uxen-guest-tools, image: package the Linux VM tools for uXen hypervisor
on 24/02/2020 christopher.w.clark@gmail.com wrote:

> From: Christopher Clark <christopher.w.clark@gmail.com>
> 
> uXen is a type-2 Open Source hypervisor from Bromium/HP.
>     https://www.bromium.com/opensource/
> 
> This adds packaging for the Linux guest support software, enabling OE
> to produce VM images to run on the uXen hypervisor.
> 
>     uxen-guest-tools: in-guest software device drivers
>     uxen-guest-image-minimal : minimal core image with uXen drivers

merged.

Bruce

> 
> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> ---
>  .../images/uxen-guest-image-minimal.bb        |  9 ++++
>  recipes-extended/uxen/README.md               | 48 +++++++++++++++++++
>  .../fix-Makefile-for-OE-kernel-build.patch    | 36 ++++++++++++++
>  .../uxen/uxen-guest-tools_4.1.7.bb            | 22 +++++++++
>  4 files changed, 115 insertions(+)
>  create mode 100644 recipes-extended/images/uxen-guest-image-minimal.bb
>  create mode 100644 recipes-extended/uxen/README.md
>  create mode 100644 recipes-extended/uxen/uxen-guest-tools/fix-Makefile-for-OE-kernel-build.patch
>  create mode 100644 recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
> 
> diff --git a/recipes-extended/images/uxen-guest-image-minimal.bb b/recipes-extended/images/uxen-guest-image-minimal.bb
> new file mode 100644
> index 0000000..d37a95b
> --- /dev/null
> +++ b/recipes-extended/images/uxen-guest-image-minimal.bb
> @@ -0,0 +1,9 @@
> +DESCRIPTION = "A Linux guest image for the uXen type-2 hypervisor."
> +LICENSE = "MIT"
> +
> +inherit core-image
> +
> +IMAGE_INSTALL += " \
> +    packagegroup-core-boot \
> +    uxen-guest-tools \
> +    "
> diff --git a/recipes-extended/uxen/README.md b/recipes-extended/uxen/README.md
> new file mode 100644
> index 0000000..0973383
> --- /dev/null
> +++ b/recipes-extended/uxen/README.md
> @@ -0,0 +1,48 @@
> +# uXen : Open Source type-2 hypervisor support
> +
> +For any issues with the uXen recipes please make sure you CC:
> +
> +    christopher.w.clark@gmail.com
> +
> +## uxen-guest-tools : software for within guest VMs, kernel modules
> +
> +* uxenhc        : hypercall driver
> +* uxenfb        : framebuffer driver
> +* uxenhid       : Human Input Device driver
> +* uxennet       : virtual network device driver
> +* uxenplatform  : uXen platform device driver
> +* uxenstor      : virtual storage device driver
> +* uxenv4vlib    : v4v, Hypervisor-Mediated data eXchange
> +* v4vvsock      : v4v vsock virtual network device driver
> +* v4vtest       : basic v4v vsock test
> +
> +To produce a bootable VM disk image file:
> +
> +    wic create directdisk -e uxen-guest-image-minimal
> +
> +To test, copy the .direct file that wic produces to the host with uXen installed and write the following to a new file: `linux-vm.json`. Update the file path within it to point to your wic-generated disk image:
> +
> +    {
> +      "name" : "Linux Virtual Machine",
> +      "boot-order" : "c",
> +      "block" :
> +        { "id": "ich0", "proto" : "raw", "xsnapshot" : true,
> +          "path" : "c:/Users/Yocto/directdisk-202001010100-sda.direct" },
> +      "memory" : 768,
> +      "net" : { "type" : "nic", "model" : "e1000" },
> +      "hpet" : 1,
> +      "vcpus" : 1,
> +      "use-v4v-net" : 1,
> +      "v4v-storage" : true,
> +
> +      "" : ""
> +    }
> +
> +and then boot it:
> +
> +    uxendm -F linux-vm.json
> +
> +References:
> +  https://www.bromium.com/opensource
> +  https://github.com/uxen-virt
> +  https://www.platformsecuritysummit.com/2018/speaker/pratt/
> diff --git a/recipes-extended/uxen/uxen-guest-tools/fix-Makefile-for-OE-kernel-build.patch b/recipes-extended/uxen/uxen-guest-tools/fix-Makefile-for-OE-kernel-build.patch
> new file mode 100644
> index 0000000..651d991
> --- /dev/null
> +++ b/recipes-extended/uxen/uxen-guest-tools/fix-Makefile-for-OE-kernel-build.patch
> @@ -0,0 +1,36 @@
> +# OpenEmbedded uses KERNEL_SRC instead of KDIR
> +# and enable the modules_install target.
> +# Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> +diff --git a/Makefile b/Makefile
> +index 3fd3075..80cf0fe 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -1,10 +1,13 @@
> + ifneq ($(KERNELRELEASE),)
> + # kbuild part of makefile
> +-else
> ++include Kbuild
> + 
> +-KVERSION ?= $(shell uname -r)
> +-KDIR := /lib/modules/${KVERSION}/build
> ++else
> ++#normal makefile
> ++KERNEL_VERSION ?= $(shell uname -r)
> ++KERNEL_SRC ?= /lib/modules/${KERNEL_VERSION}/build
> + UXENDIR ?= $(shell pwd)/include/uxen
> ++INSTALL_HDR_PATH ?= /usr
> + 
> + LX_TARGET_FLAGS= -DLX_TARGET_STANDARDVM
> + LX_TARGET_ATTOVM=n
> +@@ -19,7 +22,9 @@ EXTRA_CFLAGS=$(LX_TARGET_FLAGS) -g -Wall
> + NOSTDINC_FLAGS=-I$(shell pwd)/include/ -I$(UXENDIR) -I$(UXENDIR)/xen
> + 
> + all:
> +-	make -C $(KDIR) $(LX_TARGET) M=$(shell pwd) EXTRA_CFLAGS="$(EXTRA_CFLAGS)" NOSTDINC_FLAGS="$(NOSTDINC_FLAGS)"
> ++	make -C $(KERNEL_SRC) $(LX_TARGET) M=$(shell pwd) EXTRA_CFLAGS="$(EXTRA_CFLAGS)" NOSTDINC_FLAGS="$(NOSTDINC_FLAGS)"
> + clean:
> +-	make -C $(KDIR) $(LX_TARGET) M=$(shell pwd) clean
> ++	make -C $(KERNEL_SRC) $(LX_TARGET) M=$(shell pwd) clean
> ++modules_install:
> ++	make -C $(KERNEL_SRC) $(LX_TARGET) M=$(shell pwd) modules_install
> + endif
> diff --git a/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb b/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
> new file mode 100644
> index 0000000..757f1e3
> --- /dev/null
> +++ b/recipes-extended/uxen/uxen-guest-tools_4.1.7.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "uXen type-2 Open Source hypervisor Linux guest tools"
> +DESCRIPTION = "Linux guest virtual machine tools for the uXen hypervisor"
> +HOMEPAGE = "https://www.bromium.com/opensource"
> +LICENSE = "GPLv2"
> +
> +COMPATIBLE_HOST = '(x86_64.*).*-linux'
> +
> +SRC_URI = " \
> +    https://www.bromium.com/wp-content/uploads/2019/06/uxen-vmsupport-linux-${PV}.zip;name=uxen \
> +    https://www.bromium.com/wp-content/uploads/2019/11/Bromium-4.1.8-Open-Source-Software.pdf;name=license \
> +    file://fix-Makefile-for-OE-kernel-build.patch \
> +    "
> +
> +SRC_URI[uxen.sha384sum] = "d9d7a1fa5c44ac77eea3d8d4756f9e07fc02acfe12606325ff0bb8a60c07abc3e9ddb80c2039797fb2122d750219722f"
> +SRC_URI[license.sha384sum] = "92e48c614df3094cb52321d4c4e01f6df5526d46aee5c6fa36c43ee23d4c33f03baa1fc5f6f29efafff636b6d13bc92c"
> +
> +# The software license is GPLv2: please see page 199 of the pdf document
> +LIC_FILES_CHKSUM = "file://../Bromium-4.1.8-Open-Source-Software.pdf;md5=cf120df6ffa417b36f870a9997650049"
> +
> +S = "${WORKDIR}/uxen-vmsupport-linux-${PV}"
> +
> +inherit module
> -- 
> 2.17.1
> 
