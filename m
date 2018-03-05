Return-Path: <kurt.bodiker@braintrust-us.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5FE9CE00E4F; Mon,  5 Mar 2018 07:37:21 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE,URI_NOVOWEL autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.216.195 listed in list.dnswl.org]
	*  0.5 URI_NOVOWEL URI: URI hostname has long non-vowel sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B5BBE00E83
	for <meta-virtualization@yoctoproject.org>;
	Mon,  5 Mar 2018 07:36:46 -0800 (PST)
Received: by mail-qt0-f195.google.com with SMTP id l25so20809825qtj.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 05 Mar 2018 07:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=braintrust-us-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:to:subject:date:message-id:in-reply-to:references
	:in-reply-to:references:content-transfer-encoding;
	bh=d2wsnb6tmQJqo3H/k33VSAYpX1tDi4EVIba1K00wwhI=;
	b=hjvLQjaNFbQp4hMCkmOdybjldoVgUEL1ixJkLh+QcVyzevbm1yM0ZzZfhLncHtSlxT
	hT+5RsRzPehQtlLnCHW0psQPpwiCxDKkyFCOVETrCv3ohPmOXU/5szB1UWSVAMxeUMi2
	xs8L0Gd8ptWKLNNmHYrIHz9vkNp5Bn9iTKlmSH8WZnPfu5Rrua0rTN9BtmNpSMxUISXQ
	uDkrEAy4fqgv8lKl85hN/ETlHIlwGUBqWqZ5nA0SEb7tkfuZybzaMmVSbMo/zytrccs6
	3oZo3DX0fK2VnQEqJl6iTD5vd0415GwEQzaM9iw41g9YadUM/PWJ2K2sBcu9LI3yjufB
	Ygjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:to:subject:date:message-id
	:in-reply-to:references:in-reply-to:references
	:content-transfer-encoding;
	bh=d2wsnb6tmQJqo3H/k33VSAYpX1tDi4EVIba1K00wwhI=;
	b=PLxJi+y6MQMM6DRWnDSkhtRhO5YOWvUlYVx3TW8R6Eak5QMgSXwSjn8P7kAyqkrHz5
	tmNyXODrJjKPUXaF+1iiyoZB0mf0zjDUyuD2G8CVXgDnHeO4gQCY3FWSTDdIpzz6KTF9
	JklO1a9HacQ4cEbV57EGSF9KaCxmOMgZN/83BEGfP+7g1KuGqimEjRL26rqWG/O4y/XW
	LX2KLy/PuNJK+8QPVDbra9jnJRmUfTWKOuv5EGFvN1ChFpdCZPLDAVsXbnS+PE90/ycf
	V92f9mMFR4OXak34hNN0q5X+X5MjFp2XVzjYY6iUwdQbuq7WNj4BCy8yjd9ck0+Hm0Oq
	BZfQ==
X-Gm-Message-State: AElRT7ECT9m35OYL6D+Vh1s1lK2Wb1RoI3GwmbfrwWMKEwoUBJxp3ohD
	qFVkC+DLqpWi0Jn2WdFuq+03gSPSUEj332YIPxzr2w+5ox/uxBt5irmI+y03EhCY8vQX904Dyq9
	bJvEnE6mlgVamROzbXwQs9Mtee0WZPOxHbA==
MIME-Version: 1.0
X-Google-Smtp-Source: AG47ELtde0VKdPkVldgm3ATGE0bh30SwsGLfpi0cLZ4HN7bYHUjgp5k9+cyThNwZ09rq9U/BpbCSvw==
X-Received: by 10.200.23.91 with SMTP id u27mr23828361qtk.209.1520264205642;
	Mon, 05 Mar 2018 07:36:45 -0800 (PST)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:1126:b99c:ee44:103c])
	by smtp.gmail.com with ESMTPSA id
	n29sm9474962qtf.18.2018.03.05.07.36.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 05 Mar 2018 07:36:45 -0800 (PST)
From: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
To: kurt.bodiker@braintrust-us.com,
	meta-virtualization@yoctoproject.org
Date: Mon,  5 Mar 2018 10:35:07 -0500
Message-Id: <466772c12f23ec5a2d692d4635db781d41960b12.1519915283.git.kurt.bodiker@braintrust-us.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1519915283.git.kurt.bodiker@braintrust-us.com>
References: <cover.1519915283.git.kurt.bodiker@braintrust-us.com>
In-Reply-To: <cover.1519915283.git.kurt.bodiker@braintrust-us.com>
References: <cover.1519915283.git.kurt.bodiker@braintrust-us.com>
Subject: [PATCH 7/7] xen: vTPM and vTPM Manager stubdoms for Xen
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
X-List-Received-Date: Mon, 05 Mar 2018 15:37:21 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

From: kebodiker <kurt.bodiker@braintrust-us.com>

The vTPM stubdomain allows a virtual TPM to be created and used to
provide TPM functionality to Xen guest domains. The vTPM Manager
stubdomain seals the secrets of each vTPM to the physical TPM, thereby
extending the chain of trust to the virtual machines in Xen.  More
information on Xen vTPMs found at
https://xenbits.xen.org/docs/unstable/man/xen-vtpm.7.html This xen-vtpm
recipe uses Xen/stubdom source tree to build the Xen vTPM and vTPM
Manager binaries and MiniOS source tree to build the Xen vTPM and vTPM
Manager stubdomains.

Signed-off-by: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
---
 recipes-extended/xen/xen-vtpm.inc    | 97 ++++++++++++++++++++++++++++++++=
++++
 recipes-extended/xen/xen-vtpm_1.0.bb | 16 ++++++
 2 files changed, 113 insertions(+)
 create mode 100644 recipes-extended/xen/xen-vtpm.inc
 create mode 100644 recipes-extended/xen/xen-vtpm_1.0.bb

diff --git a/recipes-extended/xen/xen-vtpm.inc b/recipes-extended/xen/xen-v=
tpm.inc
new file mode 100644
index 0000000..4337bb9
--- /dev/null
+++ b/recipes-extended/xen/xen-vtpm.inc
@@ -0,0 +1,97 @@
+# Copyright (C) 2017 Kurt Bodiker <kurt.bodiker@braintrust-us.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+require stubdom.inc
+
+DEPENDS +=3D "\
+    newlib \
+    lwip \
+    polarssl \
+    stubdom-gmp \
+    tpm-emulator \
+"
+
+# redefine everything ??? maybe just need to blank out HOST_CC_ARCH, HOST_=
LD_ARCH, HOST_AS_ARCH?
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
+# Required for some of the config stuff ---> still?
+export STUBDOM_TARGETS=3D"vtpm vtpmmgr"
+
+VTPM_CPPFLAGS =3D "-I${RECIPE_SYSROOT}/cross-root-${XEN_TARGET_ARCH}/${GNU=
_TARGET_ARCH}-xen-elf/include/tpm-emulator/build"
+VTPM_CPPFLAGS +=3D "-I${RECIPE_SYSROOT}/cross-root-${XEN_TARGET_ARCH}/${GN=
U_TARGET_ARCH}-xen-elf/include/tpm-emulator/crypto"
+VTPM_CPPFLAGS +=3D "-I${RECIPE_SYSROOT}/cross-root-${XEN_TARGET_ARCH}/${GN=
U_TARGET_ARCH}-xen-elf/include/tpm-emulator/tpm"
+VTPM_CPPFLAGS +=3D "-I${RECIPE_SYSROOT}/cross-root-${XEN_TARGET_ARCH}/${GN=
U_TARGET_ARCH}-xen-elf/include/tpm-emulator"
+
+# including from here instead of recipe sysroot prevents us from poisoning=
 our includes.
+STUBDOM_CPPFLAGS +=3D "-isystem ${WORKDIR}/xen/tools/xenstore/include/"
+
+do_configure() {
+
+    # GCC 7 fails linking header defined inlines if not declared 'static' =
or 'extern'
+    # This was fixed in Xen 4.10.0+, so we need to look at version of Xen =
source we're using
+    # to determine if we need to modify inline declarations.
+    # 'echo -e' to enable interpretation of backslashes
+    # 'sort -V' to natural sort version numbers
+    # 'head -n1' to capture the first line of output from sort command
+    if [ "${XEN_VERSION}" =3D `echo -e "${XEN_VERSION}\n4.9.999" | sort -V=
 | head -n1` ]; then
+        sed -i "s/^inline/static inline/g" ${WORKDIR}/xen/stubdom/vtpmmgr/=
*.h
+    fi
+
+    for i in AR AS NM RANLIB OBJDUMP OBJCOPY STRIP STRINGS READELF CXX LD =
LD_LTO CC CPP; do
+        sed -i "s/^\($i\s\s*\).*=3D/\1?=3D/" ${WORKDIR}/xen/config/StdGNU.=
mk
+        sed -i "s/^\($i\s\s*\).*=3D/\1?=3D/" ${WORKDIR}/mini-os/Config.mk
+    done
+
+    # replicate the TARGETS_MINIOS target in xen/stubdom/Makefile
+    for i in ${STUBDOM_TARGETS}; do
+        [ -d ${WORKDIR}/xen/stubdom/mini-os-${XEN_TARGET_ARCH}-$i ] ||
+        for j in $(cd ${WORKDIR}/mini-os ; find . -type d) ; do \
+                mkdir -p ${WORKDIR}/xen/stubdom/mini-os-${XEN_TARGET_ARCH}=
-$i/$j; \
+        done   =20
+    done
+
+    ${MAKE} MINIOS_CONFIG=3D"${WORKDIR}/xen/stubdom/vtpm/minios.cfg" CONFI=
G_FILE=3D"${WORKDIR}/xen/stubdom/vtpm-minios-config.mk" DESTDIR=3D -C ${WOR=
KDIR}/mini-os config
+    ${MAKE} MINIOS_CONFIG=3D"${WORKDIR}/xen/stubdom/vtpmmgr/minios.cfg" CO=
NFIG_FILE=3D"${WORKDIR}/xen/stubdom/vtpmmgr-minios-config.mk" DESTDIR=3D -C=
 ${WORKDIR}/mini-os config
+}
+
+do_compile() {
+
+   =20
+    CPPFLAGS=3D"`cat ${WORKDIR}/xen/stubdom/vtpm-minios-config.mk` ${STUBD=
OM_CPPFLAGS} ${VTPM_CPPFLAGS}" CFLAGS=3D"${STUBDOM_CFLAGS}" ${MAKE} -C ${WO=
RKDIR}/xen/stubdom/vtpm
+    DEF_CPPFLAGS=3D"${STUBDOM_CPPFLAGS}" DEF_CFLAGS=3D"${STUBDOM_CFLAGS}" =
DEF_LDFLAGS=3D"${STUBDOM_LDFLAGS}" MINIOS_CONFIG=3D"${WORKDIR}/xen/stubdom/=
vtpm/minios.cfg" ${MAKE} -C ${WORKDIR}/mini-os OBJ_DIR=3D${WORKDIR}/xen/stu=
bdom/mini-os-x86_64-vtpm APP_OBJS=3D"${WORKDIR}/xen/stubdom/vtpm/vtpm.a" AP=
P_LDLIBS=3D"-ltpm -ltpm_crypto -lgmp -lpolarssl"
+
+    CPPFLAGS=3D"`cat ${WORKDIR}/xen/stubdom/vtpmmgr-minios-config.mk` ${ST=
UBDOM_CPPFLAGS}" CFLAGS=3D"${STUBDOM_CFLAGS}" ${MAKE} -C ${WORKDIR}/xen/stu=
bdom/vtpmmgr
+    DEF_CPPFLAGS=3D"${STUBDOM_CPPFLAGS}" DEF_CFLAGS=3D"${STUBDOM_CFLAGS}" =
DEF_LDFLAGS=3D"${STUBDOM_LDFLAGS}" MINIOS_CONFIG=3D"${WORKDIR}/xen/stubdom/=
vtpmmgr/minios.cfg" ${MAKE} -C ${WORKDIR}/mini-os OBJ_DIR=3D${WORKDIR}/xen/=
stubdom/mini-os-x86_64-vtpmmgr APP_OBJS=3D"${WORKDIR}/xen/stubdom/vtpmmgr/v=
tpmmgr.a" APP_LDLIBS=3D"-lm -lpolarssl"
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
+    install -m 644 -D ${B}/stubdom/mini-os-${XEN_TARGET_ARCH}-vtpm/mini-os=
.gz ${D}${libdir}/xen/boot/vtpm-stubdom.gz
+    install -m 644 -D ${B}/stubdom/mini-os-${XEN_TARGET_ARCH}-vtpmmgr/mini=
-os.gz ${D}${libdir}/xen/boot/vtpmmgr-stubdom.gz
+}
diff --git a/recipes-extended/xen/xen-vtpm_1.0.bb b/recipes-extended/xen/xe=
n-vtpm_1.0.bb
new file mode 100644
index 0000000..f5b21b4
--- /dev/null
+++ b/recipes-extended/xen/xen-vtpm_1.0.bb
@@ -0,0 +1,16 @@
+# Copyright (C) 2017 Kurt Bodiker <kurt.bodiker@braintrust-us.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION =3D "MiniOS-based vTPMs for Xen"
+HOMEPAGE =3D "https://www.xenproject.org"
+LICENSE =3D "GPLv2"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbb4b1bdc2c3b6743da3c39d0324909=
5"
+
+SRC_URI +=3D "\
+    git://xenbits.xen.org/xen.git;protocol=3Dgit;rev=3DRELEASE-${XEN_VERSI=
ON};nobranch=3D1;destsuffix=3Dxen;name=3Dxen \
+"
+
+S=3D"${WORKDIR}/xen"
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

