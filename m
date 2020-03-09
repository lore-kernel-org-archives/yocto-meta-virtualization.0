Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.50762.1583729834901658370
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 08 Mar 2020 21:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LCX1Ybxj;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 44FFEE01801; Sun,  8 Mar 2020 21:57:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.214.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0E5B6E007EE
	for <meta-virtualization@yoctoproject.org>; Sun,  8 Mar 2020 21:57:12 -0700 (PDT)
Received: by mail-pl1-f196.google.com with SMTP id w3so3479617plz.5
        for <meta-virtualization@yoctoproject.org>; Sun, 08 Mar 2020 21:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=7ftUd187NhEx+Ku9Jik6WtKJvElcS2Uz4j0nMEqpzpo=;
        b=LCX1YbxjWPTgJ1nkg1awSMVSY1va9/EUh01nwb6G/Lxg04fRIux5C+0JfBOT3z9t66
         Wdt6QBE3IFyhsEqWiQIrmqqYmbcQZL/3vAEplQA+/fP4iTqTWCGnP7cRlgKh3Noofrk+
         ncTQruqXu2kwhJG/43/TVPbh8WOUBtTK6Cyryb3RdxnSdzpixpKdXnN8Ul9AGxvIKzAd
         AFKwbXQLk31+PmsoTI2+63Ys1vUBovweaWx1kVFNIg40C05qOGXrWf+zg6SkL8QRH0BK
         j/6Mbg069s5Ao1B3dK2PJFDcQmpejE6skXsMpvGQcEOj4UZk6WYBJN6utTVwLLVGGDx5
         GI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=7ftUd187NhEx+Ku9Jik6WtKJvElcS2Uz4j0nMEqpzpo=;
        b=J3g8YO9JH695/em3qHOj2qNKqlslam85IfjTVjOQUy2Gq6Mdqxfa2Tp06PwfvID7zX
         natx8+eenxQBURb1DR/GPJrT5iWrX60MUnTz50DvzW0lgQijfMI55T6Nc5IYOjZWvpJe
         ybmPikRBZgUv9KQJDWDM56cAOG+zpzvoC0rMtjF7tudHya4nCipUncEp0oM0YEhCoZ3V
         TJjGzAfIcXHxZLmvLLYqLreLJA2/6eDdficYCSjvq8W5kF9BbdCDVUs8e8wFr0oYvfek
         E768xvrAeedX/L6HIMV4IqW6e2n0/lP6t7EydsoSWwC7EzPmqBurb5/xYcBU8uSFBv07
         iaXw==
X-Gm-Message-State: ANhLgQ08/r35eKpWbnFtl/RzkTKxqAO8CPBv6q7Sjs5peZ6Y1ovNvFxG
	zILWfTELqsaJQ+mBrYdBHou0K2ZB
X-Google-Smtp-Source: ADFU+vuuTjehuzqxZBhRBlRPQxfIgweyhCAbEXofyE0s8jTBs0Z/rmo3Xey5v/a40YIvSOSGWVEKKg==
X-Received: by 2002:a17:90b:142:: with SMTP id em2mr11111045pjb.24.1583729831960;
        Sun, 08 Mar 2020 21:57:11 -0700 (PDT)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id a22sm10282533pfo.56.2020.03.08.21.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2020 21:57:11 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH] xen, xen-tools: reproducible build compiler flags
Date: Sun,  8 Mar 2020 21:56:56 -0700
Message-Id: <20200309045656.16214-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Christopher Clark <christopher.w.clark@gmail.com>

The change to the method of passing compiler flags into the Xen build
system in 6b697676 omitted passing the compiler flags for improving
build reproducibility, so this commit returns them and includes a change
to use the -ffile-prefix-map compiler option to remove host filesystem
artefacts instead of the prior method of redefining the __FILE__ builtin
macro.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 recipes-extended/xen/xen.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index d863c8f..2a02805 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -101,12 +101,12 @@ export LDFLAGS=""
 #   It must not be compiled with SSE compiler options enabled and the Xen build
 #   explicitly clears CFLAGS to ensure that, so such options must not be passed
 #   in via the tool variable. hvmloader is required to run HVM-mode guest VMs.
-CC="${CCACHE}${HOST_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"
+CC="${CCACHE}${HOST_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${CC_REPRODUCIBLE_OPTIONS}"
 EXTRA_CFLAGS_XEN_CORE="${HOST_CC_ARCH} ${CFLAGS}"
 EXTRA_CFLAGS_XEN_TOOLS="${HOST_CC_ARCH} ${CFLAGS}"
 # 32-bit ARM needs the TUNE_CCARGS component of HOST_CC_ARCH to be passed
 # in CC to ensure that configure can compile binaries for the right arch.
-CC_arm="${CCACHE}${HOST_PREFIX}gcc ${TUNE_CCARGS} ${TOOLCHAIN_OPTIONS}"
+CC_arm="${CCACHE}${HOST_PREFIX}gcc ${TUNE_CCARGS} ${TOOLCHAIN_OPTIONS} ${CC_REPRODUCIBLE_OPTIONS}"
 EXTRA_CFLAGS_XEN_CORE_arm="${SECURITY_CFLAGS} ${CFLAGS}"
 EXTRA_CFLAGS_XEN_TOOLS_arm="${SECURITY_CFLAGS} ${CFLAGS}"
 
@@ -155,10 +155,10 @@ EXTRA_OEMAKE += "${@['', 'XEN_WHOAMI=${PF} XEN_DOMAIN=${DISTRO} XEN_BUILD_HOST=$
                     [d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1']}${@get_build_time_vars(d)}"
 
 # Improve build reproducibility: compiler flags to remove filesystem differences.
-# Suppress __FILE__ via an alternative builtin.
-CC += "${@['', '-gno-record-gcc-switches -Wno-builtin-macro-redefined -D__FILE__=__VERSION__ ' + \
-               '-fdebug-prefix-map=${WORKDIR}=${PN}'] \
-          [d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1']}"
+CC_REPRODUCIBLE_OPTIONS = "${@['', '-gno-record-gcc-switches ' + \
+                                   '-ffile-prefix-map=${S}=${PN}-source ' + \
+                                   '-fdebug-prefix-map=${WORKDIR}=${PN}'] \
+                             [d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1']}"
 
 # check for XSM in package config to allow XSM_ENABLE to be set
 python () {
-- 
2.17.1

