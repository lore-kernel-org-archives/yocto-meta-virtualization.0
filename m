Return-Path: <kurt.bodiker@braintrust-us.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A98A1E00CE2; Mon,  5 Mar 2018 07:37:20 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6763BE00CE2
	for <meta-virtualization@yoctoproject.org>;
	Mon,  5 Mar 2018 07:36:33 -0800 (PST)
Received: by mail-qk0-f194.google.com with SMTP id v124so21037310qkh.11
	for <meta-virtualization@yoctoproject.org>;
	Mon, 05 Mar 2018 07:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=braintrust-us-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:to:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=AHkTNAXIEw+01yKA16v/QEU2lYlcHn9kRYd7Xzccleg=;
	b=FKMWcgHIRHs23C37Zz8LGOnbA/x8UE5h0nEbAYPQ9UfxIedEQ+ZAJzlRL4RNQdeleK
	wsFG0Zr2zYJBenWKljb6TBI2d8Stn1mt0ShJuAMuPCGYmYQvRtDDdsrHqMAbA9DpXt5S
	yUvB87L/SEnrImyOzZagXWVD3RFJQG0aQZooyVjYGEEsGFgYXGCnb84XAxKX4ulvhxFu
	ohIszMdfz/yGe9z0VI0iTc1ioSLuTJnVQDH57xbyXGBIbcLN3ntyXidvGTvCwE+5w17v
	5iiQqDzaqiaKjx2tlBdpaG3E7QeCtndikTKAJgzXzCXyHJqD2cm0FF61pj0aVGC6b8Z9
	i/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:to:subject:date:message-id
	:in-reply-to:references:in-reply-to:references;
	bh=AHkTNAXIEw+01yKA16v/QEU2lYlcHn9kRYd7Xzccleg=;
	b=Z5NQMgIQbiryOvvZDLUT33sIy3EEG40hxqGlzOPbvuv8cRE4FXbH1Yg2l44UExZHGR
	zNrjg19yNGmezSoSBX5p3J/nWz2jp5ihsY8iOLBN+43vgIA3vEVa9Azs/nq5HiebCocZ
	8yh9HVpgAC2x+SoAtj56RbVq1nD9TACLy2kUraWq4xWUcBCdAAxsFE2vjrv3rndFoZRK
	CnpOkXECFXO4wLrqTVMot7m5/IDNPUw8/WC09UaItw/cgv7Z7youdForyipVLJRAJa0j
	mQBSw+gABsIQN9jQQwF1XHUv8vYPs1N4i2kPkg1sIYnwjdKktayQSNVRgVu7Evpmh/n4
	CgxQ==
X-Gm-Message-State: AElRT7EGORmAFRZPP4OSTsTPcWbBquLbuBYWhbHEFCqDDlEe3jiWSzPU
	vRNacbbDfj+9HP7+FxAb2F/6QLywcqJUgIWQzDjXwJigov/d7XkyNRp6Y5Ergr4X+BawFBrISS2
	RqZSIaK5Ee2u7Hbk07/GNeHLj2tDqSO9YFg==
MIME-Version: 1.0
X-Google-Smtp-Source: AG47ELuuMs+SwmipXp/jVTjBPedHtkLfTOFXK1gfqgEv97RkUluos3vWjbGPuPpSfG8tglUFRpfsLw==
X-Received: by 10.55.49.74 with SMTP id x71mr21189016qkx.310.1520264191575;
	Mon, 05 Mar 2018 07:36:31 -0800 (PST)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:1126:b99c:ee44:103c])
	by smtp.gmail.com with ESMTPSA id
	n29sm9474962qtf.18.2018.03.05.07.36.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 05 Mar 2018 07:36:31 -0800 (PST)
From: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
To: kurt.bodiker@braintrust-us.com,
	meta-virtualization@yoctoproject.org
Date: Mon,  5 Mar 2018 10:35:05 -0500
Message-Id: <f136ff553cb449b3f28c3bd024975fd60216191c.1519915283.git.kurt.bodiker@braintrust-us.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1519915283.git.kurt.bodiker@braintrust-us.com>
References: <cover.1519915283.git.kurt.bodiker@braintrust-us.com>
In-Reply-To: <cover.1519915283.git.kurt.bodiker@braintrust-us.com>
References: <cover.1519915283.git.kurt.bodiker@braintrust-us.com>
Subject: [PATCH 5/7] xen: GMP recipe for Xen stubdoms
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

I didn't want to replicate a GMP recipe, but I couldn't figure out how
to append or extend the existing GMP recipe without messing up GMP for
the rest of the system.

GMP is a fast precision arithmetic library targeted for cryptographic
applications.  This GMP recipe creates a static library that is
cross-compiled against that is cross-compiled against MiniOS, Xen, LWIP,
Newlib, and PolarSSL headers and subsquently used during the
cross-compilation and linking of the TPM Emulator and the Xen vTPM and
vTPM Manager stubdomains.

The current Xen source code is hardcoded to fetch a specific version of
this package.  Xen does not currently apply any patches to this package.
This recipe provides the flexibility to change version or create patches
if necessary.

Signed-off-by: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
---
 recipes-extended/xen/stubdom-gmp.inc      | 36 +++++++++++++++++++++++++++++++
 recipes-extended/xen/stubdom-gmp_4.3.2.bb | 20 +++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 recipes-extended/xen/stubdom-gmp.inc
 create mode 100644 recipes-extended/xen/stubdom-gmp_4.3.2.bb

diff --git a/recipes-extended/xen/stubdom-gmp.inc b/recipes-extended/xen/stubdom-gmp.inc
new file mode 100644
index 0000000..c4dd3f8
--- /dev/null
+++ b/recipes-extended/xen/stubdom-gmp.inc
@@ -0,0 +1,36 @@
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
+    # need to modify prefix here otherwise OE-level variables (prefix, libdir, includedir) defined in stubdom.inc get messed up
+    CPPFLAGS="-isystem ${STAGING_DIR_HOST}/cross-root-${XEN_TARGET_ARCH}/${GNU_TARGET_ARCH}-xen-elf/include ${STUBDOM_CPPFLAGS}" CFLAGS="${STUBDOM_CFLAGS}" CC="${HOST_PREFIX}gcc --sysroot=${RECIPE_SYSROOT} ${GMPEXT}" ${S}/configure \
+        --disable-shared \
+        --enable-static \
+        --disable-fft \
+        --without-readline \
+        --prefix=${prefix}/${GNU_TARGET_ARCH}-xen-elf \
+        --libdir=${libdir} \
+        --build=`$(CC) -dumpmachine` \
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
index 0000000..bac3415
--- /dev/null
+++ b/recipes-extended/xen/stubdom-gmp_4.3.2.bb
@@ -0,0 +1,20 @@
+# Copyright (C) 2017 Kurt Bodiker <kurt.bodiker@braintrust-us.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "GMP library for Xen vTPM's."
+HOMEPAGE = "http://gmp"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+PROVIDES = "stubdom-gmp"
+RPROVIDES_${PN} = "stubdom-gmp"
+SRC_URI += "\
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

