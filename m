Return-Path: <kurt.bodiker@braintrust-us.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 62F33E00C58; Fri, 27 Apr 2018 08:14:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.216.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1CC87E00BAA
	for <meta-virtualization@yoctoproject.org>;
	Fri, 27 Apr 2018 08:13:28 -0700 (PDT)
Received: by mail-qt0-f195.google.com with SMTP id q13-v6so1893716qtp.4
	for <meta-virtualization@yoctoproject.org>;
	Fri, 27 Apr 2018 08:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=braintrust-us-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=+8kKCFtIXGTits0vRI2iqZoqAQJyxs+9S6r79wpOmFE=;
	b=pYvhjSoqgIWtYCfGLYiJf0+Ntz0QvX/Ne/KEhQu60PEO5rPhfC1aIZLm+weQUVCODc
	etLRM4KrfYXdAeEIaWNYYOqbubsHwBN4XZS/7TF4b+W5dy2BbOJUZ/UOeEJsSUqc/LSR
	Mb/U8cUD8/p58cjqoEIaoS6RjrqMLFzQyHEU4mPCcTeO7ViPuKJN0UYEKwSN1B9VORo/
	VAClLc72JLLtb5tG76SwwEB5nBmFg10R1fKOeP+7oumhTmD5lLMd8ZrIefutWH1e0hhs
	20goElQ7mKlbltm1CuNI1RPzG6GFi2jOFRUMZO8ljYL6EH53rFHzI8c91smtkPmcFj2o
	MWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:references;
	bh=+8kKCFtIXGTits0vRI2iqZoqAQJyxs+9S6r79wpOmFE=;
	b=ZpdacHXuoLuLbxxHGhEeHkiDOVZHcr0kAbn1/gsnwz+pQuOiFSNK3Iej5QLzjBdLlx
	sKS9jGBAWttgXv13cal5YwDTNjddyOua5G6EZMwAkncQPxG3YTB0zsfCBFKKOjA4L1Cf
	zEfY9f/3qwIhfvvtXPNYMD5C6COIBAmnmYfAXjUfz+CGnFns0ce16i28DqJ54bYdLmSr
	mNuek461FLXHlMT57Wf6VPPFRkvQuWb/9N5W4rirBUwr8qNfFITirwkiwY/nqhgyl6Xt
	Ml0Dqu5uHk6yROkP2K09AiMqsJIGRB+Py0sHU34m1xN1upkkz9PyxK8dXsBMulKIPDk3
	C9Xw==
X-Gm-Message-State: ALQs6tCy9IJ4yVEAl0midIarLmV2xsWlte818JpHH4Ux6oFwHB4aRO5n
	pgBfC+MPvNhW8siMepdDXqyOkc/qN09AuY5+gEccORlR7RsHUFVnJoMxCHlFDvJf+yZAc7A+1PK
	VBFLKjxMXxo5ofJzTDCE67rtSiRqjXog=
MIME-Version: 1.0
X-Google-Smtp-Source: AB8JxZqrmWLJgFv+4L8XCJEtn5eKZ1uouJqoaoApexyplZL0sjPQ0De4vg4Pn74ht5Nq0T4lO5KuEQ==
X-Received: by 2002:ac8:24d4:: with SMTP id
	t20-v6mr2357024qtt.30.1524842008297; 
	Fri, 27 Apr 2018 08:13:28 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:a4e3:fceb:d802:a79e])
	by smtp.gmail.com with ESMTPSA id
	k50-v6sm1303157qtb.31.2018.04.27.08.13.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 27 Apr 2018 08:13:27 -0700 (PDT)
From: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 27 Apr 2018 11:12:09 -0400
Message-Id: <40f27d8dfc562c16282398c48ae71b02aa4980d6.1524834969.git.kurt.bodiker@braintrust-us.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1524834969.git.kurt.bodiker@braintrust-us.com>
References: <cover.1524834969.git.kurt.bodiker@braintrust-us.com>
In-Reply-To: <cover.1524834969.git.kurt.bodiker@braintrust-us.com>
References: <cover.1524834969.git.kurt.bodiker@braintrust-us.com>
Cc: kurt.bodiker@braintrust-us.com
Subject: [PATCH v4 6/8] xen: GMP recipe for Xen stubdoms
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
X-List-Received-Date: Fri, 27 Apr 2018 15:14:22 -0000
Content-Type: text/plain; charset="US-ASCII"

GMP is a fast precision arithmetic library targeted for cryptographic
applications. This GMP recipe creates a static library that is
cross-compiled against that is cross-compiled against MiniOS, Xen, LWIP,
Newlib, and PolarSSL headers and subsquently used during the
cross-compilation and linking of the TPM Emulator and the Xen vTPM and
vTPM Manager stubdomains.

Signed-off-by: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
---
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

