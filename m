Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 11D59E00B3D; Thu, 24 Aug 2017 11:46:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.83.66 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.83.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 61ADAE0090A
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Aug 2017 11:46:25 -0700 (PDT)
Received: by mail-pg0-f66.google.com with SMTP id q16so302147pgc.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Aug 2017 11:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=eVvkmo51VUH43/B5XKRGfFD1V+26rOVVDIJDjTBSZ7A=;
	b=lGpHKIW/TnOmGlkGsqbHsUw+4SPA25Q2THznbfXw2/8MqzKq7Gf/6Zp51gbOBMD1mq
	Wk+6/rSMMWB7MzlEtI4h8tg6i1DplFJ6f1iueKBrUHyLwKsn+yhd6j/qIp2I/H1sj+xo
	cd4OJrZmBZARjIk9RRlDcnYhvgeu2KkvpmJREyD3eY+bLqKZ7bMh5zsqudjS+KbUG6K9
	FWGeIp/9+Rtdfs5ZmAYtdh65HEfeQo42oTfTfFUnoyb6oregdnjHYMQAD4umf676mpZA
	WclxU6WYI0ezbFCPxqfayohypPbdUWtayPvDq/WaFfybAGyG4WvygQZ63+eUaW3ygx4k
	4KMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eVvkmo51VUH43/B5XKRGfFD1V+26rOVVDIJDjTBSZ7A=;
	b=nRzHO1abTX2h4DWGRP1pb7wB3wND5bb3xV5aMLQsDJi42YA0fpi8bzdK7I8iYEGJWF
	3K2zj83JoeyoYGV9fITICI7yOmc5j3UNww23h46bQexBDfDhPnbiph4tcv6rC/o3PSmR
	8vV/KxdG8cD7Spj7rq24+VtEPBRp9k3sRC/87A0bOsECD55YvztWXBECSh5WDAaUAbXT
	z9KFwR9ECmiPyrdBMCFerO+9uA0p9mIRKRujrTPo1lFTnJ5ybqT1DoVoUnZmiXs0Nh/p
	PmFnzXCVp0DZEelYRTeAe0LnkjLPTlIY5Ypj3CB3PyB6PoquWx6Grqu5jE/ydaOOq4Yz
	mVUw==
X-Gm-Message-State: AHYfb5jF2QiWdwcyIXshEgxioHtqz1qtR+mzyNwf4sn3YSz1YTimvLY2
	+OiThFt8ssh1Iyx79/A=
X-Received: by 10.99.165.83 with SMTP id r19mr7291073pgu.269.1503600385423;
	Thu, 24 Aug 2017 11:46:25 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	q17sm8288192pge.71.2017.08.24.11.46.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Aug 2017 11:46:24 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu, 24 Aug 2017 11:46:14 -0700
Message-Id: <1503600374-19479-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: cardoe@gentoo.org
Subject: RFC : [PATCH] xen: remove xen-bootimg.inc
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Aug 2017 18:46:27 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

This inc file has not been used within meta-virtualization since:
    Date:   Tue Sep 10 21:02:41 2013 -0400
    commit 214c4715f0ed53ba9c499932b0b6ee3f602ff89f

and has needed updating since the changes in:
    Date:   Wed Feb 24 01:23:58 2016 -0800
    git://git.openembedded.org/openembedded-core
    commit e38c94d6bf83ed3ca7f046d9503e81b927487bf2

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---

This inc file either needs updating to change SYSLINUXCFG to SYSLINUX_CFG
or alternatively it could be removed. Since it is no longer used within
meta-virtualization, and I cannot find a reference to it elsewhere via
web search engine, it requires further work to test any change to this file.
This patch just removes it.


 recipes-extended/images/xen-bootimg.inc | 35 ---------------------------------
 1 file changed, 35 deletions(-)
 delete mode 100644 recipes-extended/images/xen-bootimg.inc

diff --git a/recipes-extended/images/xen-bootimg.inc b/recipes-extended/images/xen-bootimg.inc
deleted file mode 100644
index 093aa68..0000000
--- a/recipes-extended/images/xen-bootimg.inc
+++ /dev/null
@@ -1,35 +0,0 @@
-SYSLINUX_TIMEOUT = "10"
-SYSLINUX_LABEL = "boot"
-SYSLINUX_XEN_APPEND = "dom0_mem=1048576"
-SYSLINUX_KERNEL_APPEND = "ramdisk_size=32768 root=/dev/ram0 rw console=tty0 console=ttyS0,115200n8"
-#LABELS_append = " ${SYSLINUX_LABEL} "
-
-INITRD = "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.cpio.lzma"
-
-do_bootimg[depends] += "${IMAGE_BASENAME}:do_rootfs"
-
-inherit bootimg
-
-syslinux_populate_append() {
-	install -m 0444 ${STAGING_LIBDIR}/syslinux/mboot.c32 ${HDDDIR}${SYSLINUXDIR}/mboot.c32
-}
-
-grubefi_populate_append() {
-	install -m 0644 ${DEPLOY_DIR_IMAGE}/xen-${MACHINE}.gz ${DEST}${EFIDIR}/xen.gz
-}
-
-populate_append() {
-	install -m 0644 ${DEPLOY_DIR_IMAGE}/xen-${MACHINE}.gz ${DEST}/xen.gz
-}
-
-build_syslinux_cfg() {
-	echo ALLOWOPTIONS 1 > ${SYSLINUXCFG}
-	echo SERIAL 0 115200 > ${SYSLINUXCFG}
-	echo DEFAULT ${SYSLINUX_LABEL} >> ${SYSLINUXCFG}
-	echo TIMEOUT ${SYSLINUX_TIMEOUT} >> ${SYSLINUXCFG}
-	echo PROMPT 1 >> ${SYSLINUXCFG}
-	echo LABEL ${SYSLINUX_LABEL} >> ${SYSLINUXCFG}
-	echo KERNEL mboot.c32 >> ${SYSLINUXCFG}
-	echo APPEND xen.gz ${SYSLINUX_XEN_APPEND} --- vmlinuz ${SYSLINUX_KERNEL_APPEND} --- initrd >> ${SYSLINUXCFG}
-}
-
-- 
2.7.4


