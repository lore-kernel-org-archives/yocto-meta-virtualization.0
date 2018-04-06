Return-Path: <kurt.bodiker@braintrust-us.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8EDE6E00C59; Fri,  6 Apr 2018 10:08:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE,URI_NOVOWEL autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.216.194 listed in list.dnswl.org]
	*  0.5 URI_NOVOWEL URI: URI hostname has long non-vowel sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B4D5E00BEF
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Apr 2018 10:08:04 -0700 (PDT)
Received: by mail-qt0-f194.google.com with SMTP id d3so1858824qth.8
	for <meta-virtualization@yoctoproject.org>;
	Fri, 06 Apr 2018 10:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=braintrust-us-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references:content-transfer-encoding;
	bh=wpQ47LVRvJZSvzMG0BnKRa2wVn6513s9368Rp+GqDIc=;
	b=SCrzCFS57uV3QrXv1aZ7Us9p+ndN3rnxYMcnm+UzsKapfVgU/RtzihnJiFgEPW15QM
	NU01qEdB4XVEyYbtfkJvyMwQOyvmGBjhBH9GQVvCJQCuApd7oiLMM3+GRzhzKNzB9tpf
	Toz+MpHeNcq3310Bk8m2dex3u79+Vo1BWTtyKoivyzaW5zXF2bVix9oGnMXhLfMbTwlh
	O4xzQZwph81WbQMSbYADSQ6XNcVjf1pA9X61X7EXkFRVCk7iSn0fsHeKs/xQNpwhCNTX
	SLUK5Rxg+mBNQSpuWn29b0ZYZeATNSI3+MeYVcowlNJqwrS0xmfQvEXPnvqmlkPY5tDe
	uaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:references
	:content-transfer-encoding;
	bh=wpQ47LVRvJZSvzMG0BnKRa2wVn6513s9368Rp+GqDIc=;
	b=ITu6gv/EhUPny5vN2Fhku2qNbaA86M/W5ICwVxMKRbG9gWxmd1GxhB+RFU/BhRHem5
	x3XJK1djtc62qvSrsHpFGgwPYVJ4ieteJRtWA9h01NwMdAxvIH4eG8bHMPFdyNZlycDo
	Gthd+t9qnQn8fd9cXfsyxcnCD5TIIkVw+FfYBdiUN/AXxxHBSafIyU1vlB0c+Z7Aaik0
	cRVK4XnyA7iKvMHD28fZ4I3Hu/5KiAkiG/Gr8B0uWNk2Wb3pD7dY+B9vQwD570s0YbYg
	fsHjFToaegOsG74lkXevE41J4RGBiTrBs+Buvmz/QYqyI1ZXEpAZK5RpGKMkLXlaCUyb
	YIYA==
X-Gm-Message-State: ALQs6tDecf7fQHLjWiZeVCuKIvJ+DttkxrVrbe/et/wBUZ+THhDbzZEf
	shxh0X2mBpP8P4fwIyLu6W1UI4XK/xcXabonN9ez0+smIZmhXx4Q+zGM4xzlENKQH5dlqhviKsU
	tRxQ1LndIXxp/7e6QGAYw4tR2mMnM5Ls=
MIME-Version: 1.0
X-Google-Smtp-Source: AIpwx487CO0YHMfSJu71Nued3AuUfpG9XUlahH2qzTYeL8w1bFnlq+Z11HsTzqoCND7BC7tzwUToUw==
X-Received: by 10.200.8.205 with SMTP id y13mr38960696qth.148.1523034483490;
	Fri, 06 Apr 2018 10:08:03 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
	by smtp.gmail.com with ESMTPSA id
	y66sm8290900qky.61.2018.04.06.10.08.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 06 Apr 2018 10:08:02 -0700 (PDT)
From: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
To: meta-virtualization@yoctoproject.org
Date: Fri,  6 Apr 2018 13:06:45 -0400
Message-Id: <a2998fa5a826faf5a287b3212e9ff2c5082e3491.1522956183.git.kurt.bodiker@braintrust-us.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1522956183.git.kurt.bodiker@braintrust-us.com>
References: <cover.1522956183.git.kurt.bodiker@braintrust-us.com>
In-Reply-To: <cover.1522956183.git.kurt.bodiker@braintrust-us.com>
References: <cover.1522956183.git.kurt.bodiker@braintrust-us.com>
Cc: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
Subject: [PATCH v2 8/8] xen: vTPM and vTPM Manager stubdoms
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
X-List-Received-Date: Fri, 06 Apr 2018 17:08:45 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

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
Changes in v2:
 - Multi-line variables formatted to match OE style guide
 - SRC_URI formatted to use SRCREV rather than git tag
 - SRC_URI modified to fetch only stubdom and tools/xenstore/include
   directories
---
 recipes-extended/xen/xen-vtpm.inc      | 98 ++++++++++++++++++++++++++++++=
++++
 recipes-extended/xen/xen-vtpm_4.9.0.bb | 21 ++++++++
 2 files changed, 119 insertions(+)
 create mode 100644 recipes-extended/xen/xen-vtpm.inc
 create mode 100644 recipes-extended/xen/xen-vtpm_4.9.0.bb

diff --git a/recipes-extended/xen/xen-vtpm.inc b/recipes-extended/xen/xen-v=
tpm.inc
new file mode 100644
index 0000000..4793d3f
--- /dev/null
+++ b/recipes-extended/xen/xen-vtpm.inc
@@ -0,0 +1,98 @@
+# Copyright (C) 2017 Kurt Bodiker <kurt.bodiker@braintrust-us.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+require stubdom.inc
+
+DEPENDS =3D "\
+    newlib \
+    lwip \
+    mini-os \
+    polarssl \
+    stubdom-gmp \
+    tpm-emulator \
+"
+# These were unset by stubdom.inc to allow us to scope them per recipe
+export CC=3D"${HOST_PREFIX}gcc --sysroot=3D${RECIPE_SYSROOT}"
+export CCLD=3D"${HOST_PREFIX}gcc --sysroot=3D${RECIPE_SYSROOT}"
+export CXX=3D"${HOST_PREFIX}g++ --sysroot=3D${RECIPE_SYSROOT}"
+export CPP=3D"${HOST_PREFIX}gcc -E --sysroot=3D${RECIPE_SYSROOT}"
+export LD=3D"${HOST_PREFIX}ld --sysroot=3D${RECIPE_SYSROOT}"
+export LD_LTO=3D"${HOST_PREFIX}ld --sysroot=3D${RECIPE_SYSROOT}"
+export AS=3D"${HOST_PREFIX}as"
+export AR=3D"${HOST_PREFIX}ar"
+export NM=3D"${HOST_PREFIX}nm"
+export RANLIB=3D"${HOST_PREFIX}ranlib"
+export OBJDUMP=3D"${HOST_PREFIX}objdump"
+export OBJCOPY=3D"${HOST_PREFIX}objcopy"
+export STRIP=3D"${HOST_PREFIX}strip"
+export STRINGS=3D"${HOST_PREFIX}strings"
+export READELF=3D"${HOST_PREFIX}readelf"
+
+
+# Required for some of the config stuff
+export STUBDOM_TARGETS=3D"vtpm vtpmmgr"
+
+VTPM_CPPFLAGS =3D "\
+    -I${RECIPE_SYSROOT}/cross-root-${XEN_TARGET_ARCH}/${GNU_TARGET_ARCH}-x=
en-elf/include/tpm-emulator/build \
+    -I${RECIPE_SYSROOT}/cross-root-${XEN_TARGET_ARCH}/${GNU_TARGET_ARCH}-x=
en-elf/include/tpm-emulator/crypto \
+    -I${RECIPE_SYSROOT}/cross-root-${XEN_TARGET_ARCH}/${GNU_TARGET_ARCH}-x=
en-elf/include/tpm-emulator/tpm \
+    -I${RECIPE_SYSROOT}/cross-root-${XEN_TARGET_ARCH}/${GNU_TARGET_ARCH}-x=
en-elf/include/tpm-emulator \
+"
+
+# The includes from this Xen directory are not in the MiniOS repo, althoug=
h they probably should be.
+STUBDOM_CPPFLAGS +=3D "-isystem ${B}/include/"
+
+do_configure() {
+
+    # GCC 7 fails linking header defined inlines if not declared 'static' =
or 'extern'
+    # This appears to be fixed in Xen 4.10.0+, so let's look at version of=
 Xen source
+    # to determine if we need to modify inline declarations.
+    #=20
+    # 'echo -e' to enable interpretation of backslashes
+    # 'sort -V' to natural sort version numbers
+    # 'head -n1' to capture the first line of output from sort command
+   =20
+    if [ "${PV}" =3D `echo -e "${PV}\n4.9.999" | sort -V | head -n1` ]; th=
en
+        sed -i "s/^inline/static inline/g" ${B}/vtpmmgr/*.h
+    fi
+
+    for i in AR AS NM RANLIB OBJDUMP OBJCOPY STRIP STRINGS READELF CXX LD =
LD_LTO CC CPP; do
+        #sed -i "s/^\($i\s\s*\).*=3D/\1?=3D/" ${WORKDIR}/xen/config/StdGNU=
.mk
+        sed -i "s/^\($i\s\s*\).*=3D/\1?=3D/" ${MINIOS_SRCDIR}/Config.mk
+    done
+
+    # replicate the TARGETS_MINIOS target in xen/stubdom/Makefile
+    for i in ${STUBDOM_TARGETS}; do
+        [ -d ${B}/mini-os-${XEN_TARGET_ARCH}-$i ] ||
+        for j in $(cd ${MINIOS_SRCDIR} ; find . -type d) ; do \
+                mkdir -p ${B}/mini-os-${XEN_TARGET_ARCH}-$i/$j; \
+        done   =20
+    done
+}
+
+do_compile() {
+    ${MAKE} MINIOS_CONFIG=3D"${B}/vtpm/minios.cfg" CONFIG_FILE=3D"${B}/vtp=
m-minios-config.mk" DESTDIR=3D -C ${MINIOS_SRCDIR} config
+    CPPFLAGS=3D"`cat ${B}/vtpm-minios-config.mk` ${STUBDOM_CPPFLAGS} ${VTP=
M_CPPFLAGS}" CFLAGS=3D"${STUBDOM_CFLAGS}" ${MAKE} -C ${B}/vtpm
+    DEF_CPPFLAGS=3D"${STUBDOM_CPPFLAGS}" DEF_CFLAGS=3D"${STUBDOM_CFLAGS}" =
DEF_LDFLAGS=3D"${STUBDOM_LDFLAGS}" MINIOS_CONFIG=3D"${B}/vtpm/minios.cfg" $=
{MAKE} -C ${MINIOS_SRCDIR} OBJ_DIR=3D${B}/mini-os-x86_64-vtpm APP_OBJS=3D"$=
{B}/vtpm/vtpm.a" APP_LDLIBS=3D"-ltpm -ltpm_crypto -lgmp -lpolarssl"
+
+    ${MAKE} MINIOS_CONFIG=3D"${B}/vtpmmgr/minios.cfg" CONFIG_FILE=3D"${B}/=
vtpmmgr-minios-config.mk" DESTDIR=3D -C ${MINIOS_SRCDIR} config
+    CPPFLAGS=3D"`cat ${B}/vtpmmgr-minios-config.mk` ${STUBDOM_CPPFLAGS}" C=
FLAGS=3D"${STUBDOM_CFLAGS}" ${MAKE} -C ${B}/vtpmmgr
+    DEF_CPPFLAGS=3D"${STUBDOM_CPPFLAGS}" DEF_CFLAGS=3D"${STUBDOM_CFLAGS}" =
DEF_LDFLAGS=3D"${STUBDOM_LDFLAGS}" MINIOS_CONFIG=3D"${B}/vtpmmgr/minios.cfg=
" ${MAKE} -C ${MINIOS_SRCDIR} OBJ_DIR=3D${B}/mini-os-x86_64-vtpmmgr APP_OBJ=
S=3D"${B}/vtpmmgr/vtpmmgr.a" APP_LDLIBS=3D"-lm -lpolarssl"
+}
+
+PACKAGES =3D "\
+    ${PN}-vtpm-stubdom \
+    ${PN}-vtpmmgr-stubdom \
+"
+FILES_${PN}-vtpm-stubdom=3D"\
+    ${libdir}/xen/boot/vtpm-stubdom.gz \
+"
+   =20
+FILES_${PN}-vtpmmgr-stubdom=3D"\
+    ${libdir}/xen/boot/vtpmmgr-stubdom.gz \
+"
+   =20
+do_install() {
+    install -m 644 -D ${B}/mini-os-${XEN_TARGET_ARCH}-vtpm/mini-os.gz ${D}=
${libdir}/xen/boot/vtpm-stubdom.gz
+    install -m 644 -D ${B}/mini-os-${XEN_TARGET_ARCH}-vtpmmgr/mini-os.gz $=
{D}${libdir}/xen/boot/vtpmmgr-stubdom.gz
+}
diff --git a/recipes-extended/xen/xen-vtpm_4.9.0.bb b/recipes-extended/xen/=
xen-vtpm_4.9.0.bb
new file mode 100644
index 0000000..c58a02d
--- /dev/null
+++ b/recipes-extended/xen/xen-vtpm_4.9.0.bb
@@ -0,0 +1,21 @@
+# Copyright (C) 2017 Kurt Bodiker <kurt.bodiker@braintrust-us.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION =3D "MiniOS-based vTPMs for Xen"
+HOMEPAGE =3D "https://www.xenproject.org"
+LICENSE =3D "GPLv2 & BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db1ceb1b03a49b202ee6f41ffd1ed015=
5 \
+                    file://vtpm/COPYING;md5=3D75a98062ab0322ded060d9026a1b=
da61 \
+"
+
+# git commit hash for Xen's RELEASE-4.9.0 tag
+SRCREV_xen =3D "c30bf55594a53fae8aae08aabf16fc192faad7da"
+SRC_URI =3D "\
+    git://xenbits.xen.org/xen.git;protocol=3Dgit;nobranch=3D1;name=3Dxen;s=
ubpath=3Dstubdom \
+    git://xenbits.xen.org/xen.git;protocol=3Dgit;nobranch=3D1;name=3Dxen;d=
estsuffix=3Dstubdom/include;subpath=3Dtools/xenstore/include \
+"
+
+S=3D"${WORKDIR}/stubdom"
+B=3D"${S}"
+
+require xen-vtpm.inc
--=20
2.14.2


--=20

*This email and all attachments are considered confidential and the=20
proprietary information of BrainTrust Holdings.  Unauthorized disclosure is=
=20
prohibited.  *

