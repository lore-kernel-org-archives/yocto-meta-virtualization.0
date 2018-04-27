Return-Path: <kurt.bodiker@braintrust-us.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D8F61E00C4B; Fri, 27 Apr 2018 08:14:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE,URI_NOVOWEL autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.220.194 listed in list.dnswl.org]
	*  0.5 URI_NOVOWEL URI: URI hostname has long non-vowel sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 771F0E00BFD
	for <meta-virtualization@yoctoproject.org>;
	Fri, 27 Apr 2018 08:13:45 -0700 (PDT)
Received: by mail-qk0-f194.google.com with SMTP id j10so1636020qke.9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 27 Apr 2018 08:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=braintrust-us-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=KS37bFqqmn28Zp4ySsNW4RC1/sx3CaSeLJWpfj62MuQ=;
	b=atqFqxEzi6/vwhtN87lVcUJhfNpv7RiTFAe0Pcx4ZaLxnyjnXla9tU2Kb+3pAI6Cyd
	mH3vtPdLA7C+Lgb5DTapOZdDdbwDdUEPqlSSlWRUQNKn2fuUo1k61wLtf5nF9pd5La7V
	dup8bn8m4u+KNL2Emx4KmC79EJyndOBojXNk4A/Fxn78wYoon1InNyOOCL+OzJzWIx4I
	P2Lmo6JlKMieF02b2WGvF9/PVF/x1k4qvrLuYRfEbrNyV10ku5F/EqKyKnL1qGeItjqe
	nVgs0esvqqVf/DCqnCgvfxj1h25NvT2KMuM/aSfJCDGjNL0g5GCaeHpwjAP6cBUxS0VY
	vVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:references;
	bh=KS37bFqqmn28Zp4ySsNW4RC1/sx3CaSeLJWpfj62MuQ=;
	b=B5X4QXqW5cnNGouPzMnAwRncbXRV9SvoJGBvId5E8hyuq+w3lfr6thXlLEWux3jeJZ
	Q7frfx3zXrOUztgxi5q78WqXZvJSego6ARukGB3J6mZ3+NtI6aQDoMzM9/LftUd/Kqa5
	iUJ1lR36vuXgHnLm1FtIzv7RpLVQAw54yNSbHL7SYCIM2l0gxzsSDCuWYvZm7VQxx2Ku
	PGqz+2Y/n9/5Vhq3uRoAWnhlsCfTR7rbkac/hegyrsHZc9C5g+o/uzFRCONV3jWo1lf9
	pBpTVDxK5M43bm4wbdq111nWo+12mBFLqIB3tDWDxfm7TQW50Tg1jc+oedsi1NngNG2t
	6E5Q==
X-Gm-Message-State: ALQs6tABlXhZs49LQY54LAU4x23KvPL9rtsLdGuY+DAUdMV571PM9J7d
	mA4BQjWEyqkMqEmHYc7PNNP5XiyIC/BBhx4uqRyaD6HdslIs+ESxt/ifPJgc9uVdNyy5suPTExl
	dBe0I372V+zcLbDOOBnjTJeMQ1j6JLks=
MIME-Version: 1.0
X-Google-Smtp-Source: AB8JxZoYFLb3ZhZNZKQgpx5rs0N1cs8EJ1phkeAyYEUlRG6ERakkDy+RGy/rMP35gYlB1eGS0VCzCA==
X-Received: by 10.55.43.153 with SMTP id r25mr2232800qkr.422.1524842024313;
	Fri, 27 Apr 2018 08:13:44 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:a4e3:fceb:d802:a79e])
	by smtp.gmail.com with ESMTPSA id
	k50-v6sm1303157qtb.31.2018.04.27.08.13.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 27 Apr 2018 08:13:43 -0700 (PDT)
From: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 27 Apr 2018 11:12:11 -0400
Message-Id: <ec8763e33a430456e66c480fbfb57b8d2b3e97c7.1524834969.git.kurt.bodiker@braintrust-us.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1524834969.git.kurt.bodiker@braintrust-us.com>
References: <cover.1524834969.git.kurt.bodiker@braintrust-us.com>
In-Reply-To: <cover.1524834969.git.kurt.bodiker@braintrust-us.com>
References: <cover.1524834969.git.kurt.bodiker@braintrust-us.com>
Cc: kurt.bodiker@braintrust-us.com
Subject: [PATCH v4 8/8] xen: vTPM and vTPM Manager stubdoms
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
X-List-Received-Date: Fri, 27 Apr 2018 15:14:25 -0000
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

