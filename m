Return-Path: <kurt.bodiker@braintrust-us.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E795CE00994; Thu, 26 Apr 2018 13:17:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.216.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 675F3E00A38
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Apr 2018 13:16:33 -0700 (PDT)
Received: by mail-qt0-f194.google.com with SMTP id j42-v6so5377882qtj.12
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Apr 2018 13:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=braintrust-us-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=JDKf24C+FMzBvVPegNrpxwGIDldNBSuGJBhX/P1ziSQ=;
	b=pyTjNr2MHykkAcYnv459VlLE5phuLawHXnpaby/d1D5xqpsMwoANS07yYJXBqvOQj/
	iPAPgLj8dHRe0EjOK+bRLhp9Vet/wa1O3S8k+NQbiR+N8uMYrvSSO9XI41CeMeIaybPB
	AUeSAe/JoXjdDKS4Ye3enMwlEpvIlWe8NIMW2lMHBf+19vSvp9Tsm5CTbPuTYlFOEhXB
	L7uP/svj+MPOwqJKW+Llj3LqtD1LiPsQEywHXtMQ9SZP5VLZupLunnALlr7DHbC5Mvmp
	mICrKYo2nvt8JiylumcN+YD8qx9p3rnVDVsycnl5dMk1N5xzCPzt/XiXwyFhoJl4nhyp
	xSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:references;
	bh=JDKf24C+FMzBvVPegNrpxwGIDldNBSuGJBhX/P1ziSQ=;
	b=ilsL6qTJI0HfybC40hPKhchY5FcuS/rSqFRU6k73uZPyFXtstwqKmlr7wpaqeIdHTE
	vdGQfj6ci3oo2SasCfwtwmR4yH5rd+fuJxduGXVlS4JHFBqZIQqQ/XlRJWzMLMGpACMW
	Mo7U6zymBi0eGDrAELh0zWyJvU7f6/bRHyqOjMPAJxofI8KOWIdbdHr6eVgh6uE1hzaq
	kM2YMIxtUKTjVbvbVc2JTIO4c3ZY22u3uGs4XFlndJ9nnl7t5YukMz7jw3utpUCb49Fk
	12XXd4ZDpw7zbNHcQQOKvVn7lpQkoYTo+suFnCsLpvLcj/i8OG7Sf6gAaWqWjObOGHX3
	g0IQ==
X-Gm-Message-State: ALQs6tArPIrzYWR7OlsDHZqhvWXPjsG2BFL3hsABAME+IrqtJcsZ+jof
	eVIXmrYXhtMRVsWwk8yOXOlIL4lGB74icefQJTwBvT2F7bsb2S+OdUazQS+8wqxJhkpIbZHL7sM
	ghnjRK3lC+kXNcaXmurnyFqoO8CybQMQ=
MIME-Version: 1.0
X-Google-Smtp-Source: AB8JxZp4RuyUWaol4/XHr482sT8tCuK8JlXaY20hvk7y+5Ru3pFuN5NATkh/6UxYd3U/QYFvv/gM5w==
X-Received: by 10.12.154.237 with SMTP id k45mr13784635qvf.68.1524773792640;
	Thu, 26 Apr 2018 13:16:32 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:45bb:d6b2:8a14:4857])
	by smtp.gmail.com with ESMTPSA id
	j66sm15392647qkf.84.2018.04.26.13.16.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 26 Apr 2018 13:16:32 -0700 (PDT)
From: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 26 Apr 2018 16:15:12 -0400
Message-Id: <9cb15f6c5a2cab77f190f5e43d3a47e01eebdaed.1524769930.git.kurt.bodiker@braintrust-us.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1524769930.git.kurt.bodiker@braintrust-us.com>
References: <cover.1524769930.git.kurt.bodiker@braintrust-us.com>
In-Reply-To: <cover.1524769930.git.kurt.bodiker@braintrust-us.com>
References: <cover.1524769930.git.kurt.bodiker@braintrust-us.com>
Cc: kurt.bodiker@braintrust-us.com
Subject: [PATCH v3 5/8] xen: PolarSSL recipe and patches for Xen stubdoms
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
X-List-Received-Date: Thu, 26 Apr 2018 20:17:35 -0000
Content-Type: text/plain; charset="US-ASCII"

PolarSSL (now mbedTLS) is a lightweight SSL library optimized for
embedded systems. In the case of Xen stubdomains, we are using MiniOS.
This PolarSSL recipe creates a static library that is cross-compiled
against MiniOS, Xen, LWIP, and Newlib headers and subsequently used
during the cross-compilation and linking of the stubdom specific GMP,
TPM Emulator, and the Xen vTPM and vTPM Manager stubdomains. The
current Xen source code is hardcoded to fetch a specific version of this
package. The patch files originate from the Xen/stubdom source tree.
This recipe provides the flexibility to change version or modify the
patches.

Signed-off-by: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
---
Changes in v3:
 - none
Changes in v2:
 - Multi-line variables formatted to match OE style guide
 - SRC_URI formatted to use SRCREV rather than git tag
 - patches formatted to striplevel=1
---
 recipes-extended/xen/files/polarssl.patch | 64 +++++++++++++++++++++++++++++++
 recipes-extended/xen/polarssl.inc         | 27 +++++++++++++
 recipes-extended/xen/polarssl_1.1.4.bb    | 19 +++++++++
 3 files changed, 110 insertions(+)
 create mode 100644 recipes-extended/xen/files/polarssl.patch
 create mode 100644 recipes-extended/xen/polarssl.inc
 create mode 100644 recipes-extended/xen/polarssl_1.1.4.bb

diff --git a/recipes-extended/xen/files/polarssl.patch b/recipes-extended/xen/files/polarssl.patch
new file mode 100644
index 0000000..9548730
--- /dev/null
+++ b/recipes-extended/xen/files/polarssl.patch
@@ -0,0 +1,64 @@
+diff -Naur polarssl-1.1.4/include/polarssl/config.h polarssl-x86_64/include/polarssl/config.h
+--- a/include/polarssl/config.h	2011-12-22 05:06:27.000000000 -0500
++++ b/include/polarssl/config.h	2012-10-30 17:18:07.567001000 -0400
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
+--- a/library/bignum.c	2012-04-29 16:15:55.000000000 -0400
++++ b/library/bignum.c	2012-10-30 17:21:52.135000999 -0400
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
index 0000000..eae95f4
--- /dev/null
+++ b/recipes-extended/xen/polarssl.inc
@@ -0,0 +1,27 @@
+# Copyright (C) 2017 Kurt Bodiker <kurt.bodiker@braintrust-us.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+require stubdom.inc
+
+DEPENDS += "\
+    newlib \
+"
+STUBDOM_CFLAGS += "\
+    -Wno-memset-elt-size \
+    -Wno-implicit-fallthrough \
+"
+
+# nothing to configure
+do_configure[noexec] = "1"
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
index 0000000..80ea45a
--- /dev/null
+++ b/recipes-extended/xen/polarssl_1.1.4.bb
@@ -0,0 +1,19 @@
+# Copyright (C) 2017 Kurt Bodiker <kurt.bodiker@braintrust-us.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "PolarSSL (now 'mbed TLS') is an open source, portable, easy to use, readable and flexible SSL library."
+HOMEPAGE = "https://tls.mbed.org"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
+
+# git hash for release tag polarssl-1.1.4
+SRCREV_polarssl = "d36da11125a9c85c572a4fdf63e0a25e76d7bb18"
+SRC_URI = "\
+    git://github.com/ARMmbed/mbedtls.git;protocol=https;nobranch=1;destsuffix=polarssl;name=polarssl \
+    file://polarssl.patch; \
+"
+
+S="${WORKDIR}/${PN}"
+B="${S}/library"
+
+require polarssl.inc
-- 
2.14.2


-- 

*This email and all attachments are considered confidential and the 
proprietary information of BrainTrust Holdings.  Unauthorized disclosure is 
prohibited.  *

