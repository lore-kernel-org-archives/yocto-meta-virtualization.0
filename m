Return-Path: <kurt.bodiker@braintrust-us.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D84ADE00831; Thu, 26 Apr 2018 13:17:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.216.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B5EEE00831
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Apr 2018 13:16:36 -0700 (PDT)
Received: by mail-qt0-f193.google.com with SMTP id j42-v6so5378070qtj.12
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Apr 2018 13:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=braintrust-us-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=zciPc0iU+OwAtuValzgafX2IwVN5yXQiuBgNZ2KLMnc=;
	b=uNuGUjynNFx3Gqcj3+qECUwPlRb1jxDKQ3GfR+47502sKsaNPNM4ihtJUIOESwICzW
	jdJ4MMuvCRu1NYxq7CsPGpan83VjdHuzrYHkVtiY5cKcZWBgEEnYdCaFQpHef6/Hy9sW
	X09Mnol2BUZq745jPEeW8v9YpuG/asQAqFz+UTbOVacU5+jqR/6Uw4iMz/Ox/3sujNos
	aYuv8YjRxqkIaTPL9z2lVJ6Y0LP/mkBcEf87M20jYCpGPIzwsGLn/KvMn6UBzmSnAjFq
	wuHCwgsz3TTRkndOcRpjBCVltN1mzIgQUyeNrfcthFZ/M8DHEjJ5MEejOcGKpWETghdj
	b7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:references;
	bh=zciPc0iU+OwAtuValzgafX2IwVN5yXQiuBgNZ2KLMnc=;
	b=X9z6E7XmUV+BUSzlEWx0SMVJqztwmjQTAH/GLxvbQxxrEoSgBrAzOAUYirbkqzVvJW
	cMzPELKOaiHwj5eLVlPaFiupJeBOr7HTh6G5vrkq3fAUbK1QL4Zmjos34z/vUCDuR/nE
	cv70b6q6ZWd5e/DNO+0nC86HYzkAUCS2gSDvvbqhMG6hOFBqYVMjoZuIOQA7RrdeBVDv
	yKvXbEbtEdGNxJdcj8JSN20nUNP/0fKkOCk15L2+rsoPEAKd5n/nZGkJG4UxwIpDrCzc
	VzgwNInRiPXiX2jhpukD+R/MiISJN5WzxZxZOoCCRwLiJoIZufIQO91PgqhDnH6jOQPS
	+Jvw==
X-Gm-Message-State: ALQs6tC+VzVzcOgxSZxOuLdV4MTOeNRDFavWPQbGp+m/wpAAeRJJ5Nhm
	ZLg8WcJoXTyGYFWZ8Lnvu+ar6oBiwnEEBssmwa9lTtroD6p4t9a6y3xG9zVxpTxxTF2gRhieGl1
	0TZpvXT+dwbK3WS4G8QIp7ynIVks8JzA=
MIME-Version: 1.0
X-Google-Smtp-Source: AIpwx49qpyyJcdrATjo79EQHM1bWsI9JR+w2d5KFjwLHY/RRNi7Y2bFyAZHgGTHfbNEUc2oDr5tkIA==
X-Received: by 2002:ac8:205:: with SMTP id
	k5-v6mr37380695qtg.351.1524773795392; 
	Thu, 26 Apr 2018 13:16:35 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:45bb:d6b2:8a14:4857])
	by smtp.gmail.com with ESMTPSA id
	j66sm15392647qkf.84.2018.04.26.13.16.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 26 Apr 2018 13:16:34 -0700 (PDT)
From: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 26 Apr 2018 16:15:13 -0400
Message-Id: <71f740bf6f89fc38c0055dada5c621662a2664ef.1524769930.git.kurt.bodiker@braintrust-us.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1524769930.git.kurt.bodiker@braintrust-us.com>
References: <cover.1524769930.git.kurt.bodiker@braintrust-us.com>
In-Reply-To: <cover.1524769930.git.kurt.bodiker@braintrust-us.com>
References: <cover.1524769930.git.kurt.bodiker@braintrust-us.com>
Cc: kurt.bodiker@braintrust-us.com
Subject: [PATCH v3 6/8] xen: GMP recipe for Xen stubdoms
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
X-List-Received-Date: Thu, 26 Apr 2018 20:17:36 -0000
Content-Type: text/plain; charset="US-ASCII"

GMP is a fast precision arithmetic library targeted for cryptographic
applications. This GMP recipe creates a static library that is
cross-compiled against that is cross-compiled against MiniOS, Xen, LWIP,
Newlib, and PolarSSL headers and subsquently used during the
cross-compilation and linking of the TPM Emulator and the Xen vTPM and
vTPM Manager stubdomains.

Signed-off-by: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
---
Changes in v3:
 - Removed GMPEXT/ABI definition and usage because it's locked to 64-bit
 - change cross-root-${XEN_TARGET_ARCH} to cross-root-${GNU_TARGET_ARCH}
Changes in v2:
 - none
---
 recipes-extended/xen/stubdom-gmp.inc      | 37 +++++++++++++++++++++++++++++++
 recipes-extended/xen/stubdom-gmp_4.3.2.bb | 20 +++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 recipes-extended/xen/stubdom-gmp.inc
 create mode 100644 recipes-extended/xen/stubdom-gmp_4.3.2.bb

diff --git a/recipes-extended/xen/stubdom-gmp.inc b/recipes-extended/xen/stubdom-gmp.inc
new file mode 100644
index 0000000..c68cc22
--- /dev/null
+++ b/recipes-extended/xen/stubdom-gmp.inc
@@ -0,0 +1,37 @@
+# Copyright (C) 2017 Kurt Bodiker <kurt.bodiker@braintrust-us.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+require stubdom.inc
+
+DEPENDS += "\
+    newlib \
+"
+
+do_configure() {
+    # need to modify prefix here during configure otherwise OE-level variables
+    # (prefix, libdir, includedir, etc...) defined in stubdom.inc get messed up
+    CPPFLAGS="-isystem ${RECIPE_SYSROOT}/cross-root-${GNU_TARGET_ARCH}/${GNU_TARGET_ARCH}-xen-elf/include ${STUBDOM_CPPFLAGS}" \
+    CFLAGS="${STUBDOM_CFLAGS}" \
+    CC="${HOST_PREFIX}gcc --sysroot=${RECIPE_SYSROOT}" \
+    ${S}/configure \
+        --disable-shared \
+        --enable-static \
+        --disable-fft \
+        --without-readline \
+        --with-gnu-ld \
+        --prefix=${prefix}/${GNU_TARGET_ARCH}-xen-elf \
+        --libdir=${libdir} \
+        --build=`${HOST_PREFIX}gcc -dumpmachine` \
+        --host=${GNU_TARGET_ARCH}-xen-elf
+
+    sed -i 's/#define HAVE_OBSTACK_VPRINTF 1/\/\/#define HAVE_OBSTACK_VPRINTF 1/' ${S}/config.h
+}
+
+do_compile() {
+    ${MAKE}
+}
+
+do_install() {
+    ${MAKE} DESTDIR=${D} install
+    rm -rf ${D}${prefix}/${GNU_TARGET_ARCH}-xen-elf/share
+}
diff --git a/recipes-extended/xen/stubdom-gmp_4.3.2.bb b/recipes-extended/xen/stubdom-gmp_4.3.2.bb
new file mode 100644
index 0000000..d9a2adb
--- /dev/null
+++ b/recipes-extended/xen/stubdom-gmp_4.3.2.bb
@@ -0,0 +1,20 @@
+# Copyright (C) 2017 Kurt Bodiker <kurt.bodiker@braintrust-us.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "GMP library for Xen vTPM's."
+HOMEPAGE = "http://gmp"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
+"
+
+SRC_URI = "\
+    https://gmplib.org/download/gmp/archive/gmp-${PV}.tar.bz2 \
+"
+SRC_URI[md5sum] = "dd60683d7057917e34630b4a787932e8"
+SRC_URI[sha256sum] = "936162c0312886c21581002b79932829aa048cfaf9937c6265aeaa14f1cd1775"
+
+S="${WORKDIR}/gmp-${PV}"
+B="${S}"
+
+require stubdom-gmp.inc
-- 
2.14.2


-- 

*This email and all attachments are considered confidential and the 
proprietary information of BrainTrust Holdings.  Unauthorized disclosure is 
prohibited.  *

