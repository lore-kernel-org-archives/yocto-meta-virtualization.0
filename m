Return-Path: <kurt.bodiker@braintrust-us.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E5E5FE00C77; Tue,  1 May 2018 07:06:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE,URI_NOVOWEL autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.216.196 listed in list.dnswl.org]
	*  0.5 URI_NOVOWEL URI: URI hostname has long non-vowel sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 851EEE00C6B
	for <meta-virtualization@yoctoproject.org>;
	Tue,  1 May 2018 07:06:54 -0700 (PDT)
Received: by mail-qt0-f196.google.com with SMTP id c2-v6so14664294qtn.9
	for <meta-virtualization@yoctoproject.org>;
	Tue, 01 May 2018 07:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=braintrust-us-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=FMQ0NORhZlmYVroAIbopzmdxQPxzZ3Qsi4HVfZjIqqM=;
	b=iymLCHgUVrZb2IfqwC1/WVmNDqtL5UMMS0Vt+Gox9bwCyLBONw9ECjiSEGsLJGWM3Z
	sSV9tIGnofY3/e1kYRKgjzkhGyYfAPeqgd3EK4X/UBKe3hkgKjtif5/K4rpiBhtboIOF
	Sg8ztwL5KGFnNkrW+xgBsrc0ZTKxXxSy4Cq1/8XHgSw3RRhHjdsnfiImf4lxdQYm1VKt
	85DIKM86s2pqAWajMPrJtiXPrgMkn2Kwl1ueLWVtjw+fFo+j5w9BBpP8IOFlRihaC+k9
	/iBZk4kUlBCoJVLytYt5gUOQt74J0gGykalF35gvm4hR+VlfFqar/HpYrDzuRXLB1PWD
	z7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:references;
	bh=FMQ0NORhZlmYVroAIbopzmdxQPxzZ3Qsi4HVfZjIqqM=;
	b=g6mrE80EMDMXP3EEuwgYZclZ7EaKpq5UsOQUKpyf+ZjhhMfiOzfYsu6XGly+J4vzOp
	0hWNkvML29SUoY3E7+dUgda+kKFGzsx/fJEGsDEgeqbBXs2D7kRxqcSRj3fKd/k5QExa
	wFwzNrwSvbpv/LMJiB/x9s6EagMkECL0sMf4pLHKopff6EtOhK7utLIO4pUdan4VjGCS
	/nPCpB2P0STI72F3MhNcg9o6bv/UdM4ISoVICIBzihTh7WFK3vhX2+wkP8PT4QEo2EfF
	Pbed1DYisH4305RF1BUEBwXx8gxTx6Pm9vWs6Y0o/8h9GDDwYZ/FFBE+z5y/wkd36fP5
	jTaQ==
X-Gm-Message-State: ALQs6tB4mhXdhHxsD7I2GDoRguQwMtE5QbaiRO+kZAw0qSawxuB0xXbU
	yCggddNfmrwXveTjMzM3KvxuZj/WA4kdhGn2FGXFIJEsqjwzVNWKangD/i6rX7WQfUkmhhnNdQS
	NFnihtDsOsMOuhIzFPTe9Et8pz+GTTZI=
MIME-Version: 1.0
X-Google-Smtp-Source: AB8JxZpczJ1xMXGpcrzHXwW8QpWo+T6Xo6rmzJwIDPBQDYiDLov405f1K8iEJ5DWnaqnsiXHBfbxsQ==
X-Received: by 2002:ac8:26f5:: with SMTP id
	50-v6mr14134382qtp.155.1525183613577; 
	Tue, 01 May 2018 07:06:53 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
	by smtp.gmail.com with ESMTPSA id
	i25-v6sm9048335qte.26.2018.05.01.07.06.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 01 May 2018 07:06:53 -0700 (PDT)
From: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
To: meta-virtualization@yoctoproject.org
Date: Tue,  1 May 2018 10:05:34 -0400
Message-Id: <d0c496fba71d62975916521782327c93fd1d4b16.1525180972.git.kurt.bodiker@braintrust-us.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1525180972.git.kurt.bodiker@braintrust-us.com>
References: <cover.1525180972.git.kurt.bodiker@braintrust-us.com>
In-Reply-To: <cover.1525180972.git.kurt.bodiker@braintrust-us.com>
References: <cover.1525180972.git.kurt.bodiker@braintrust-us.com>
Cc: kurt.bodiker@braintrust-us.com
Subject: [PATCH v5 8/8] xen: vTPM and vTPM Manager stubdoms
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
X-List-Received-Date: Tue, 01 May 2018 14:06:56 -0000
Content-Type: text/plain; charset="US-ASCII"

The vTPM stubdomain allows a virtual TPM to be created and used to
provide TPM functionality to Xen guest domains. The vTPM Manager
stubdomain seals the secrets of each vTPM to the physical TPM, thereby
extending the chain of trust to the virtual machines in Xen. More
information on Xen vTPMs found at
https://xenbits.xen.org/docs/unstable/man/xen-vtpm.7.html This xen-vtpm
recipe uses Xen/stubdom source tree to build the Xen vTPM and vTPM
Manager binaries and MiniOS source tree to build the Xen vTPM and vTPM
Manager stubdomains.

This recipe provides the ability to modify how the vTPM stubdomains are
created and the ability to independently patch the vTPM stubdomain
source code as necessary.

Signed-off-by: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
---
Changes in v5:
 - none
Changes in v4:
 - none
Changes in v3:
 - make commands in do_compile formatted as multi-line for readability
 - cross-root-${XEN_TARGET_ARCH} changed to cross-root-${GNU_TARGET_ARCH}
Changes in v2:
 - Multi-line variables formatted to match OE style guide
 - SRC_URI formatted to use SRCREV rather than git tag
 - SRC_URI modified to fetch only stubdom and tools/xenstore/include directories
---
 recipes-extended/xen/xen-vtpm.inc      | 111 +++++++++++++++++++++++++++++++++
 recipes-extended/xen/xen-vtpm_4.9.0.bb |  21 +++++++
 2 files changed, 132 insertions(+)
 create mode 100644 recipes-extended/xen/xen-vtpm.inc
 create mode 100644 recipes-extended/xen/xen-vtpm_4.9.0.bb

diff --git a/recipes-extended/xen/xen-vtpm.inc b/recipes-extended/xen/xen-vtpm.inc
new file mode 100644
index 0000000..a94c750
--- /dev/null
+++ b/recipes-extended/xen/xen-vtpm.inc
@@ -0,0 +1,111 @@
+# Copyright (C) 2017 Kurt Bodiker <kurt.bodiker@braintrust-us.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+require stubdom.inc
+
+DEPENDS = "\
+    newlib \
+    lwip \
+    mini-os \
+    polarssl \
+    stubdom-gmp \
+    tpm-emulator \
+"
+# These were unset by stubdom.inc to allow us to scope them per recipe
+export CC="${HOST_PREFIX}gcc --sysroot=${RECIPE_SYSROOT}"
+export CCLD="${HOST_PREFIX}gcc --sysroot=${RECIPE_SYSROOT}"
+export CXX="${HOST_PREFIX}g++ --sysroot=${RECIPE_SYSROOT}"
+export CPP="${HOST_PREFIX}gcc -E --sysroot=${RECIPE_SYSROOT}"
+export LD="${HOST_PREFIX}ld --sysroot=${RECIPE_SYSROOT}"
+export LD_LTO="${HOST_PREFIX}ld --sysroot=${RECIPE_SYSROOT}"
+export AS="${HOST_PREFIX}as"
+export AR="${HOST_PREFIX}ar"
+export NM="${HOST_PREFIX}nm"
+export RANLIB="${HOST_PREFIX}ranlib"
+export OBJDUMP="${HOST_PREFIX}objdump"
+export OBJCOPY="${HOST_PREFIX}objcopy"
+export STRIP="${HOST_PREFIX}strip"
+export STRINGS="${HOST_PREFIX}strings"
+export READELF="${HOST_PREFIX}readelf"
+
+
+# Required for some of the config stuff
+export STUBDOM_TARGETS="vtpm vtpmmgr"
+
+VTPM_CPPFLAGS = "\
+    -I${RECIPE_SYSROOT}/cross-root-${GNU_TARGET_ARCH}/${GNU_TARGET_ARCH}-xen-elf/include/tpm-emulator/build \
+    -I${RECIPE_SYSROOT}/cross-root-${GNU_TARGET_ARCH}/${GNU_TARGET_ARCH}-xen-elf/include/tpm-emulator/crypto \
+    -I${RECIPE_SYSROOT}/cross-root-${GNU_TARGET_ARCH}/${GNU_TARGET_ARCH}-xen-elf/include/tpm-emulator/tpm \
+    -I${RECIPE_SYSROOT}/cross-root-${GNU_TARGET_ARCH}/${GNU_TARGET_ARCH}-xen-elf/include/tpm-emulator \
+"
+
+# The includes from this Xen directory are not in the MiniOS repo, although they probably should be.
+STUBDOM_CPPFLAGS += "-isystem ${B}/include/"
+
+do_configure() {
+
+    # GCC 7 fails linking header defined inlines if not declared 'static' or 'extern'
+    # This appears to be fixed in Xen 4.10.0+, so let's look at version of Xen source
+    # to determine if we need to modify inline declarations.
+    #
+    # 'echo -e' to enable interpretation of backslashes
+    # 'sort -V' to natural sort version numbers
+    # 'head -n1' to capture the first line of output from sort command
+
+    if [ "${PV}" = "$(echo "${PV};4.9.999" | sed 's/;/\n/' | sort -V | head -n1)" ]; then
+        sed -i "s/^inline/static inline/g" ${B}/vtpmmgr/*.h
+    fi
+
+    for i in AR AS NM RANLIB OBJDUMP OBJCOPY STRIP STRINGS READELF CXX LD LD_LTO CC CPP; do
+        sed -i "s/^\($i\s\s*\).*=/\1?=/" ${MINIOS_SRCDIR}/Config.mk
+    done
+
+    # replicate the TARGETS_MINIOS target in xen/stubdom/Makefile
+    for i in ${STUBDOM_TARGETS}; do
+        [ -d ${B}/mini-os-${XEN_TARGET_ARCH}-$i ] ||
+        for j in $(cd ${MINIOS_SRCDIR} ; find . -type d) ; do \
+                mkdir -p ${B}/mini-os-${XEN_TARGET_ARCH}-$i/$j; \
+        done
+    done
+}
+
+do_compile() {
+    ${MAKE} MINIOS_CONFIG="${B}/vtpm/minios.cfg" CONFIG_FILE="${B}/vtpm-minios-config.mk" DESTDIR= -C ${MINIOS_SRCDIR} config
+    CPPFLAGS="`cat ${B}/vtpm-minios-config.mk` ${STUBDOM_CPPFLAGS} ${VTPM_CPPFLAGS}" CFLAGS="${STUBDOM_CFLAGS}" ${MAKE} -C ${B}/vtpm
+    DEF_CPPFLAGS="${STUBDOM_CPPFLAGS}" \
+        DEF_CFLAGS="${STUBDOM_CFLAGS}" \
+        DEF_LDFLAGS="${STUBDOM_LDFLAGS}" \
+        MINIOS_CONFIG="${B}/vtpm/minios.cfg" \
+        ${MAKE} -C ${MINIOS_SRCDIR} \
+        OBJ_DIR=${B}/mini-os-${XEN_TARGET_ARCH}-vtpm \
+        APP_OBJS="${B}/vtpm/vtpm.a" \
+        APP_LDLIBS="-ltpm -ltpm_crypto -lgmp -lpolarssl"
+
+    ${MAKE} MINIOS_CONFIG="${B}/vtpmmgr/minios.cfg" CONFIG_FILE="${B}/vtpmmgr-minios-config.mk" DESTDIR= -C ${MINIOS_SRCDIR} config
+    CPPFLAGS="`cat ${B}/vtpmmgr-minios-config.mk` ${STUBDOM_CPPFLAGS}" CFLAGS="${STUBDOM_CFLAGS}" ${MAKE} -C ${B}/vtpmmgr
+    DEF_CPPFLAGS="${STUBDOM_CPPFLAGS}" \
+        DEF_CFLAGS="${STUBDOM_CFLAGS}" \
+        DEF_LDFLAGS="${STUBDOM_LDFLAGS}" \
+        MINIOS_CONFIG="${B}/vtpmmgr/minios.cfg" \
+        ${MAKE} -C ${MINIOS_SRCDIR} \
+        OBJ_DIR=${B}/mini-os-${XEN_TARGET_ARCH}-vtpmmgr \
+        APP_OBJS="${B}/vtpmmgr/vtpmmgr.a" \
+        APP_LDLIBS="-lm -lpolarssl"
+}
+
+PACKAGES = "\
+    ${PN}-vtpm-stubdom \
+    ${PN}-vtpmmgr-stubdom \
+"
+FILES_${PN}-vtpm-stubdom="\
+    ${libdir}/xen/boot/vtpm-stubdom.gz \
+"
+
+FILES_${PN}-vtpmmgr-stubdom="\
+    ${libdir}/xen/boot/vtpmmgr-stubdom.gz \
+"
+
+do_install() {
+    install -m 644 -D ${B}/mini-os-${XEN_TARGET_ARCH}-vtpm/mini-os.gz ${D}${libdir}/xen/boot/vtpm-stubdom.gz
+    install -m 644 -D ${B}/mini-os-${XEN_TARGET_ARCH}-vtpmmgr/mini-os.gz ${D}${libdir}/xen/boot/vtpmmgr-stubdom.gz
+}
diff --git a/recipes-extended/xen/xen-vtpm_4.9.0.bb b/recipes-extended/xen/xen-vtpm_4.9.0.bb
new file mode 100644
index 0000000..c58a02d
--- /dev/null
+++ b/recipes-extended/xen/xen-vtpm_4.9.0.bb
@@ -0,0 +1,21 @@
+# Copyright (C) 2017 Kurt Bodiker <kurt.bodiker@braintrust-us.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "MiniOS-based vTPMs for Xen"
+HOMEPAGE = "https://www.xenproject.org"
+LICENSE = "GPLv2 & BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b1ceb1b03a49b202ee6f41ffd1ed0155 \
+                    file://vtpm/COPYING;md5=75a98062ab0322ded060d9026a1bda61 \
+"
+
+# git commit hash for Xen's RELEASE-4.9.0 tag
+SRCREV_xen = "c30bf55594a53fae8aae08aabf16fc192faad7da"
+SRC_URI = "\
+    git://xenbits.xen.org/xen.git;protocol=git;nobranch=1;name=xen;subpath=stubdom \
+    git://xenbits.xen.org/xen.git;protocol=git;nobranch=1;name=xen;destsuffix=stubdom/include;subpath=tools/xenstore/include \
+"
+
+S="${WORKDIR}/stubdom"
+B="${S}"
+
+require xen-vtpm.inc
-- 
2.14.2


-- 

*This email and all attachments are considered confidential and the 
proprietary information of BrainTrust Holdings.  Unauthorized disclosure is 
prohibited.  *

