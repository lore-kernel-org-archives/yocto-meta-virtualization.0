Return-Path: <kurt.bodiker@braintrust-us.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 32476E00BEC; Fri,  6 Apr 2018 10:08:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.216.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EF12BE00BEC
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Apr 2018 10:07:48 -0700 (PDT)
Received: by mail-qt0-f196.google.com with SMTP id j3so1859396qtn.9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 06 Apr 2018 10:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=braintrust-us-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=2Hohlu/BBf7dqgTm/Qo22lp7wYTVukR3k37SdenrTm8=;
	b=UnhzFdk+2oUQyluF49XSRiG5PaPc33CDS1sGFlWMLQmnFO5iVsoLbF/ELuc35Db7bE
	GXb9qibz781O/wpj9D0Sjl+HDMX+Lc1gsuRv9XRaciUDjzpPjJvteZNY/WVRczqMnTx9
	gGlPwJuc6c3aWtmBydWOg4tkdRsCSrXSXbecB9/JVCBkDWxMFsLPD/f/Ew+lSns64XUF
	39zlPfVsypFuSFddgsEmxBEwu0m1GqzcT2i+BxyDgJ92h725hvjTrM2aO6/O4pMH7U5e
	ZZHDbgbOvmpP4nicXZZu9YVCCokDgCWhhegJVO01zcn7s6Lk3vt/U7AdGgQb1/g/AhDL
	xkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:references;
	bh=2Hohlu/BBf7dqgTm/Qo22lp7wYTVukR3k37SdenrTm8=;
	b=g8UIW4ksoLNKYXyvsvIlQehYgWgzzOiX6jshtU/YU8q52VSo9f9GPiw06duhgwA9O+
	VvRoAXTgRqc8AC6h7l2ftuo9+oh53h1zhACf2B85HoK+m0blIfv7PtRbngM4cMqTzQoc
	nh/ZOsr4WjhFxmaeP+Mrm0G9s+WqTWvpBEuKZ0C+djBY0tdP4c5uaWd2XVIZwB02w34O
	oBFIOknnNrTHvdmpItFekS8xUOC//6CcKyFwGFXFU7IaAx8kRiedZgx1A12Rz8DHIcbI
	5PwbixLlIxn6RT3CavfopIUEW4DqPusDhjoNwJLs57IBWJjnQNfTw5lEl1ClSKB+hBrq
	xF1w==
X-Gm-Message-State: ALQs6tAXplEsXCSnJvzaX9fB1dM4GOJioqs6TfI9tHFpTbLA4R1WeHgs
	6F8OZMPxGeEANVvY194Bgs17SjNkYaQbI68vOP2GWGKx7bGH08Z21uWiLNSvfxSt1f73JeSut3r
	JdTosFiMVHADD/eACAozb/KuTplyLvYQ=
MIME-Version: 1.0
X-Google-Smtp-Source: AIpwx48o2G8NxSelYh+ZCaF/B3ayLwRj+MQfdpLrTSkJZpGoch7MjN37qRAXtnIm/soGEoIA0zcN1A==
X-Received: by 10.200.53.110 with SMTP id z43mr39796726qtb.278.1523034467943; 
	Fri, 06 Apr 2018 10:07:47 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
	by smtp.gmail.com with ESMTPSA id
	y66sm8290900qky.61.2018.04.06.10.07.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 06 Apr 2018 10:07:47 -0700 (PDT)
From: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
To: meta-virtualization@yoctoproject.org
Date: Fri,  6 Apr 2018 13:06:43 -0400
Message-Id: <5710d979c92f7894d2cb89127d3409f535d8c09f.1522956183.git.kurt.bodiker@braintrust-us.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1522956183.git.kurt.bodiker@braintrust-us.com>
References: <cover.1522956183.git.kurt.bodiker@braintrust-us.com>
In-Reply-To: <cover.1522956183.git.kurt.bodiker@braintrust-us.com>
References: <cover.1522956183.git.kurt.bodiker@braintrust-us.com>
Cc: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
Subject: [PATCH v2 6/8] xen: GMP recipe for Xen stubdoms
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
X-List-Received-Date: Fri, 06 Apr 2018 17:08:43 -0000
Content-Type: text/plain; charset="US-ASCII"

GMP is a fast precision arithmetic library targeted for cryptographic
applications. This GMP recipe creates a static library that is
cross-compiled against that is cross-compiled against MiniOS, Xen, LWIP,
Newlib, and PolarSSL headers and subsquently used during the
cross-compilation and linking of the TPM Emulator and the Xen vTPM and
vTPM Manager stubdomains.

The current Xen source code is hardcoded to fetch a specific version of
this package. Xen does not currently apply any patches to this package.
This recipe provides the flexibility to change version or create patches
if necessary.

Signed-off-by: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
---
 recipes-extended/xen/stubdom-gmp.inc      | 42 +++++++++++++++++++++++++++++++
 recipes-extended/xen/stubdom-gmp_4.3.2.bb | 20 +++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 recipes-extended/xen/stubdom-gmp.inc
 create mode 100644 recipes-extended/xen/stubdom-gmp_4.3.2.bb

diff --git a/recipes-extended/xen/stubdom-gmp.inc b/recipes-extended/xen/stubdom-gmp.inc
new file mode 100644
index 0000000..af4d125
--- /dev/null
+++ b/recipes-extended/xen/stubdom-gmp.inc
@@ -0,0 +1,42 @@
+# Copyright (C) 2017 Kurt Bodiker <kurt.bodiker@braintrust-us.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+require stubdom.inc
+
+DEPENDS += "\
+    newlib \
+"
+
+# set ABI for x86_32 builds. Ripped from Xen/stubdom/Makefile.
+GMPEXT=""
+GMPEXT_gnutargetarch-i686 = "ABI=32"
+
+do_configure() {
+    #export BUILD_MACHINE=
+    # need to modify prefix here during configure otherwise OE-level variables
+    # (prefix, libdir, includedir, etc...) defined in stubdom.inc get messed up
+    CPPFLAGS="-isystem ${RECIPE_SYSROOT}/cross-root-${XEN_TARGET_ARCH}/${GNU_TARGET_ARCH}-xen-elf/include ${STUBDOM_CPPFLAGS}" \
+    CFLAGS="${STUBDOM_CFLAGS}" \
+    CC="${HOST_PREFIX}gcc --sysroot=${RECIPE_SYSROOT} ${GMPEXT}" \
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

