Return-Path: <kurt.bodiker@braintrust-us.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 56457E00C6F; Tue,  1 May 2018 07:06:41 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2B62AE00C6B
	for <meta-virtualization@yoctoproject.org>;
	Tue,  1 May 2018 07:06:40 -0700 (PDT)
Received: by mail-qt0-f196.google.com with SMTP id d3-v6so14639592qtp.11
	for <meta-virtualization@yoctoproject.org>;
	Tue, 01 May 2018 07:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=braintrust-us-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=eAVUZEb0jl3XOHB+gwiD8zcs1czFwRqV2kpd8y+xoFg=;
	b=WcMpDqGfoesA8u4zp0wRAleRQGwH6oMQHBl6wf1qU/0//4QRC6GVTJkWRpiK9i/5Uh
	Sk5NwpE9UpONvDX0qsFekoJP2L8zLlQIFTo8Zu4AReYo2p+a+OtSxi3Vh5IiEJrOywbZ
	oDib4yMk4kdyP5RxoI8KMUcAcS6OnkOd+746lVl+R8eYeutRvWZu2qeQdJ4Sez2ZmOgI
	k8jx2Iiamoq9Fv8zddngimhHdEXgpbfFUIKX8MjQTfDlHiw3eDBtcJglCKguRWZ/V4rf
	fowzu9GrkQuENcohiObwb340LDgLB5XYLpuTb0JGv+YVh9yJ8iy1XQdzT+yGn/S476YC
	zNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:references;
	bh=eAVUZEb0jl3XOHB+gwiD8zcs1czFwRqV2kpd8y+xoFg=;
	b=Ya/tJtVYxfDCETsvFcy5ypwFN5lCvl6g3u6shNqjPndkfjWAgk8bu4B0JxzYMOg1lu
	71OP5YEnbGURb5XUfpgajpGNdCZwiSOpPtwDHDd9vHsC0+GPw4GR+YgqxhuQ9QIGRIGD
	1ajPlBoh1nSBGuFVMgm6b99Q5P8yIUnH/iJ3IiKT7J2VpZbDN50sWzST6nNEg5K+m9I3
	VmoCfC+xv9DG3yfhaCZFNoFfuElyaE1JFtPwqfj0cuPLlIBaumFZsjB6nWP6422jtlRv
	cm0uHrdly5m1amzQlbnEiT4kyU1qIysunOd4LJtPwFT+Vt1fxKjesNXdyxOazFvGlkgE
	zPkA==
X-Gm-Message-State: ALQs6tCp2iMvqDwnhO19fvArZotq6FD82lUhU076CsBtuqW2JwY4Efut
	kX6T0DN84CVEkoIZVu440PVYP7JxZvw0VGZ9BeyELmWY55ev8PrMX75nteDmYkeM9BxND6ieUbt
	kmc3Q0MlyOESojaSJiPsi5EXfpjtvH38=
MIME-Version: 1.0
X-Google-Smtp-Source: AB8JxZruRjbJdL8pGgqparSD5iV7xz0E3GRi29KAHZCGxDdwBJPM2WcngJwF/fqI5srp+dkv5cmYLQ==
X-Received: by 2002:ac8:7159:: with SMTP id
	h25-v6mr13821336qtp.206.1525183599376; 
	Tue, 01 May 2018 07:06:39 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
	by smtp.gmail.com with ESMTPSA id
	i25-v6sm9048335qte.26.2018.05.01.07.06.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 01 May 2018 07:06:38 -0700 (PDT)
From: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
To: meta-virtualization@yoctoproject.org
Date: Tue,  1 May 2018 10:05:32 -0400
Message-Id: <5c014fae06e46c88dd413a97b2213c5750ccf6fc.1525180972.git.kurt.bodiker@braintrust-us.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1525180972.git.kurt.bodiker@braintrust-us.com>
References: <cover.1525180972.git.kurt.bodiker@braintrust-us.com>
In-Reply-To: <cover.1525180972.git.kurt.bodiker@braintrust-us.com>
References: <cover.1525180972.git.kurt.bodiker@braintrust-us.com>
Cc: kurt.bodiker@braintrust-us.com
Subject: [PATCH v5 6/8] xen: GMP recipe for Xen stubdoms
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
X-List-Received-Date: Tue, 01 May 2018 14:06:41 -0000
Content-Type: text/plain; charset="US-ASCII"

GMP is a fast precision arithmetic library targeted for cryptographic
applications. This GMP recipe creates a static library that is
cross-compiled against that is cross-compiled against MiniOS, Xen, LWIP,
Newlib, and PolarSSL headers and subsquently used during the
cross-compilation and linking of the TPM Emulator and the Xen vTPM and
vTPM Manager stubdomains.

Signed-off-by: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
---
Changes in v5:
 - none
Changes in v4:
 - none
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
index 0000000..ef6473d
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

