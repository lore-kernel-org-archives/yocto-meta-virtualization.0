Return-Path: <kurt.bodiker@braintrust-us.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2D97BE00EAF; Mon,  5 Mar 2018 07:37:20 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.220.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DE0D6E00E7D
	for <meta-virtualization@yoctoproject.org>;
	Mon,  5 Mar 2018 07:36:30 -0800 (PST)
Received: by mail-qk0-f194.google.com with SMTP id l206so21089333qke.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 05 Mar 2018 07:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=braintrust-us-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:to:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=3oIWSG3gtbL9R8EJrcLGERrQv4UBXmzX6XbsGQtOZMU=;
	b=tg7XVFPDJimhbXnscF0fkDLfx88N6xRLbYosECROgrWQtHGt6cQBsDiJBr0IoVRuYp
	C6qQ+RKGgQumZ8HkwsKNrAaGHnUME/mJ5laCit4Z8L52MDuZj4nS/Iky4fHFttHVU4/p
	CEdsK3k222b9/0OpomzOALcJoTBe2owMpmmTJj+nF3DueNI76NEQazg1NcolBD+yii/H
	hggMySkPuA06GS9On2Xbf2VaHOKmYWhUWWYnqa2uecnI4d+0KJmcbHcf3INQnu1+VblO
	rc4Lg1rg42lwpWuez7y2tTvDtvVNf4JFbqAiZkEkeCTqbk3m5ynXdWkELSoglZ2R5kX2
	e4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:to:subject:date:message-id
	:in-reply-to:references:in-reply-to:references;
	bh=3oIWSG3gtbL9R8EJrcLGERrQv4UBXmzX6XbsGQtOZMU=;
	b=mBWKs7hqXI6gxCX15T/5GJs2sJvVoD4nwYdECsQkUkPuYWDV3zbPv6X9rCi0d/Uphp
	zKPsc1h2p6E4du/rUFLL6ZEARhwQ4NcjseMyMcO2xz/xfgy1PCU2a6phziiShd00Wrtu
	nu2jjBRgpZuozSwQjmkOJHfUOiFXpBUdm6Xkq4iPOkfRxNj8GeBlnkQKVFjhQghjF+DP
	J3B9B9wtvkWKgGLBVYMC6T/nx/QW7VxiaXdSbXlGtQOIyqSFSTtnHfDb7hfpaMTwcEzj
	EbP3RC7kHM7rNot/6n6vi8HCuUDLTkpBFe+ZR7SmOB++Y5ivPoMM07iOFvTrBSd/twak
	l+uQ==
X-Gm-Message-State: AElRT7GDgaDATOfnY8zwGrnnSp2538P4soRXiGuUKoRfo4h0oY15M2tl
	UZ0GURPsecCyzu3HgoHHLT9qvpxYusK8twWzt5wLG9JqKrWHHdj3e5EqaphKW0Halg6iz4ZX2f4
	ttfxp8yJHxGXsGEc+SHWBnbGN3JAH
MIME-Version: 1.0
X-Google-Smtp-Source: AG47ELsTHz1+eWA7jCJefVcI24i1JgD/fpjRTc3sE6SP/GcYHP+maG1BySP1m1pzo39EqO6KOwuPIA==
X-Received: by 10.55.104.138 with SMTP id d132mr21721594qkc.306.1520264190105; 
	Mon, 05 Mar 2018 07:36:30 -0800 (PST)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:1126:b99c:ee44:103c])
	by smtp.gmail.com with ESMTPSA id
	n29sm9474962qtf.18.2018.03.05.07.36.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 05 Mar 2018 07:36:29 -0800 (PST)
From: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
To: kurt.bodiker@braintrust-us.com,
	meta-virtualization@yoctoproject.org
Date: Mon,  5 Mar 2018 10:35:04 -0500
Message-Id: <ff49a2ee32a8f0593c308fa95f0ea39c8946ab2c.1519915283.git.kurt.bodiker@braintrust-us.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1519915283.git.kurt.bodiker@braintrust-us.com>
References: <cover.1519915283.git.kurt.bodiker@braintrust-us.com>
In-Reply-To: <cover.1519915283.git.kurt.bodiker@braintrust-us.com>
References: <cover.1519915283.git.kurt.bodiker@braintrust-us.com>
Subject: [PATCH 4/7] xen: PolarSSL recipe and patches for Xen stubdoms
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
X-List-Received-Date: Mon, 05 Mar 2018 15:37:20 -0000
Content-Type: text/plain; charset="US-ASCII"

From: kebodiker <kurt.bodiker@braintrust-us.com>

PolarSSL (now mbedTLS) is a lightweight SSL library optimized for
embedded systems.  In the case of Xen stubdomains, we are using MiniOS.
This PolarSSL recipe creates a static library that is cross-compiled
against MiniOS, Xen, LWIP, and Newlib headers and subsequently used
during the cross-compilation and linking of the stubdom specific GMP,
TPM Emulator, and the Xen vTPM and vTPM Manager stubdomains.

The current Xen source code is hardcoded to fetch a specific version of
this package.  The patch files originate from the Xen/stubdom source
tree. This recipe provides the flexibility to change version or modify
the patches.

Signed-off-by: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
---
 recipes-extended/xen/files/polarssl.patch | 64 +++++++++++++++++++++++++++++++
 recipes-extended/xen/polarssl.inc         | 25 ++++++++++++
 recipes-extended/xen/polarssl_1.1.4.bb    | 17 ++++++++
 3 files changed, 106 insertions(+)
 create mode 100644 recipes-extended/xen/files/polarssl.patch
 create mode 100644 recipes-extended/xen/polarssl.inc
 create mode 100644 recipes-extended/xen/polarssl_1.1.4.bb

diff --git a/recipes-extended/xen/files/polarssl.patch b/recipes-extended/xen/files/polarssl.patch
new file mode 100644
index 0000000..d387d4e
--- /dev/null
+++ b/recipes-extended/xen/files/polarssl.patch
@@ -0,0 +1,64 @@
+diff -Naur polarssl-1.1.4/include/polarssl/config.h polarssl-x86_64/include/polarssl/config.h
+--- polarssl-1.1.4/include/polarssl/config.h	2011-12-22 05:06:27.000000000 -0500
++++ polarssl-x86_64/include/polarssl/config.h	2012-10-30 17:18:07.567001000 -0400
+@@ -164,8 +164,8 @@
+  * application.
+  *
+  * Uncomment this macro to prevent loading of default entropy functions.
+-#define POLARSSL_NO_DEFAULT_ENTROPY_SOURCES
+  */
++#define POLARSSL_NO_DEFAULT_ENTROPY_SOURCES
+
+ /**
+  * \def POLARSSL_NO_PLATFORM_ENTROPY
+@@ -175,8 +175,8 @@
+  * standards like the /dev/urandom or Windows CryptoAPI.
+  *
+  * Uncomment this macro to disable the built-in platform entropy functions.
+-#define POLARSSL_NO_PLATFORM_ENTROPY
+  */
++#define POLARSSL_NO_PLATFORM_ENTROPY
+
+ /**
+  * \def POLARSSL_PKCS1_V21
+@@ -426,8 +426,8 @@
+  * Requires: POLARSSL_TIMING_C
+  *
+  * This module enables the HAVEGE random number generator.
+- */
+ #define POLARSSL_HAVEGE_C
++ */
+
+ /**
+  * \def POLARSSL_MD_C
+@@ -490,7 +490,7 @@
+  *
+  * This module provides TCP/IP networking routines.
+  */
+-#define POLARSSL_NET_C
++//#define POLARSSL_NET_C
+
+ /**
+  * \def POLARSSL_PADLOCK_C
+@@ -644,8 +644,8 @@
+  * Caller:  library/havege.c
+  *
+  * This module is used by the HAVEGE random number generator.
+- */
+ #define POLARSSL_TIMING_C
++ */
+
+ /**
+  * \def POLARSSL_VERSION_C
+diff -Naur polarssl-1.1.4/library/bignum.c polarssl-x86_64/library/bignum.c
+--- polarssl-1.1.4/library/bignum.c	2012-04-29 16:15:55.000000000 -0400
++++ polarssl-x86_64/library/bignum.c	2012-10-30 17:21:52.135000999 -0400
+@@ -1101,7 +1101,7 @@
+             Z.p[i - t - 1] = ~0;
+         else
+         {
+-#if defined(POLARSSL_HAVE_LONGLONG)
++#if 0 //defined(POLARSSL_HAVE_LONGLONG)
+             t_udbl r;
+
+             r  = (t_udbl) X.p[i] << biL;
diff --git a/recipes-extended/xen/polarssl.inc b/recipes-extended/xen/polarssl.inc
new file mode 100644
index 0000000..f90cd2f
--- /dev/null
+++ b/recipes-extended/xen/polarssl.inc
@@ -0,0 +1,25 @@
+# Copyright (C) 2017 Kurt Bodiker <kurt.bodiker@braintrust-us.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+require stubdom.inc
+
+DEPENDS += "\
+    newlib \
+"
+STUBDOM_CFLAGS += "-Wno-memset-elt-size -Wno-implicit-fallthrough"
+
+# even though there's nothing to configure, we still need this to run the "make links" target in mini-os
+do_configure(){
+}
+
+do_compile() {
+    ${MAKE} CC="${HOST_PREFIX}gcc --sysroot=${RECIPE_SYSROOT} ${STUBDOM_CPPFLAGS} ${STUBDOM_CFLAGS}"
+}
+
+do_install() {
+    install -d ${D}${includedir}
+    cp -r -t ${D}${includedir} ${S}/include/polarssl
+
+    install -d ${D}/${libdir}
+    install -m 644 -t ${D}/${libdir} ${S}/library/libpolarssl.a
+}
diff --git a/recipes-extended/xen/polarssl_1.1.4.bb b/recipes-extended/xen/polarssl_1.1.4.bb
new file mode 100644
index 0000000..2d4c2e0
--- /dev/null
+++ b/recipes-extended/xen/polarssl_1.1.4.bb
@@ -0,0 +1,17 @@
+# Copyright (C) 2017 Kurt Bodiker <kurt.bodiker@braintrust-us.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "PolarSSL (now 'mbed TLS') is an open source, portable, easy to use, readable and flexible SSL library."
+HOMEPAGE = "https://tls.mbed.org"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
+
+S="${WORKDIR}/${PN}"
+B="${S}/library"
+
+SRC_URI += "\
+    git://github.com/ARMmbed/mbedtls.git;protocol=https;rev=${PN}-${PV};destsuffix=${PN};nobranch=1;name=${PN} \
+    file://polarssl.patch;striplevel=1 \
+"
+
+require polarssl.inc
-- 
2.14.2


-- 

*This email and all attachments are considered confidential and the 
proprietary information of BrainTrust Holdings.  Unauthorized disclosure is 
prohibited.  *

