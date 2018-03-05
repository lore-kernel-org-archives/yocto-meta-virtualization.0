Return-Path: <kurt.bodiker@braintrust-us.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0CA7AE00E46; Mon,  5 Mar 2018 07:35:47 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.220.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 843E2E0074C
	for <meta-virtualization@yoctoproject.org>;
	Mon,  5 Mar 2018 07:35:45 -0800 (PST)
Received: by mail-qk0-f195.google.com with SMTP id w142so21046372qkb.8
	for <meta-virtualization@yoctoproject.org>;
	Mon, 05 Mar 2018 07:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=braintrust-us-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:to:subject:date:message-id:in-reply-to:references
	:in-reply-to:references:content-transfer-encoding;
	bh=gvtlSqg3IIGHobddwYldONrFmd20PzRGayPUWK8i7KA=;
	b=SnscQWWnLMWA1uCHygvMfiNxuT0/8g6v3al2tDXzXXq/d3S0xLlFI1Je+wEYipiX36
	c09uc54akG7Wk6jRaFxBDld89oFJCQQZ4JbRL38fBw6dGHVLF6ZT8iKrVB7m2CdYDrpp
	xUxOpf+cxmrqMI/Ae3IBdhE9ATSd9gNg/Cs8j4C9AEY/OS/JarhFyDBpmm5gXQYRqYAs
	sfo1/eg+Qouxrf+59JWCeCYspeUrZwKBA6+nDLPonSoyUR6iwWn7pOmY/kgmKO8tPOZl
	fOvkwbdPAml0TVisBjlXrAtNrJ7GCL6v8XY9xOV5egzmeOP5RpXG5maI16QXMM3Zy/I5
	c1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:to:subject:date:message-id
	:in-reply-to:references:in-reply-to:references
	:content-transfer-encoding;
	bh=gvtlSqg3IIGHobddwYldONrFmd20PzRGayPUWK8i7KA=;
	b=taPnUXmRSK+4wkVDfKEwcviL0gu6P+hMnxLWynfAn9OgWN5iWcqHidmdWnqaEe4fyw
	JMfsUe1P2PYSXhx4nsTQjqmxoF8VtF+lxKhCR8TmYYIoaz21gw9ScZhF8V38J8MKyRiJ
	PoyR5/AJmr662BGXxXDzgSc/AjbQh/SyKNKF0UmhkBotOEf8PIWMeYwrYgrdht8+Fr3/
	pUt4Ayb8Ha1I53Nqa7he4SDiYab1qqee8HgVf9jrRawoONor2G+3Z4F1IoeLHxpuQW6i
	k9Nra/2CjNYGTjQSS1TLnnfZ+8uYkkqFjDJPeixyDY0jX6hl/KNV8N77U83DlA5725oe
	n+xw==
X-Gm-Message-State: AElRT7Fz/xEtTP57DzZ0PozN8aNIxZrOEgblUrkC23501lXn0+My9F2K
	t0ixOpYY9lj5WzI9JQWcCQ28gQuQdl5cQdcvV6DHFgzs/tK7BlEJI2QGzVUMDqLB59jRbLfF5lE
	XUrlq5MJ3eXbNNhHKMU40HUFNJmi4FFKDBg==
MIME-Version: 1.0
X-Google-Smtp-Source: AG47ELuh5TBpH7sBwP0G3wnJTuN/rw3nW3zUsLYkisfHKPBP/RFEsPtR0Oi7VHygcxnUneYH2WwVvw==
X-Received: by 10.55.134.135 with SMTP id i129mr21272695qkd.177.1520264144592; 
	Mon, 05 Mar 2018 07:35:44 -0800 (PST)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:1126:b99c:ee44:103c])
	by smtp.gmail.com with ESMTPSA id
	n29sm9474962qtf.18.2018.03.05.07.35.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 05 Mar 2018 07:35:44 -0800 (PST)
From: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
To: kurt.bodiker@braintrust-us.com,
	meta-virtualization@yoctoproject.org
Date: Mon,  5 Mar 2018 10:35:01 -0500
Message-Id: <d59c1a4b1f58515ff9d4db9470019c630da4df5e.1519915283.git.kurt.bodiker@braintrust-us.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1519915283.git.kurt.bodiker@braintrust-us.com>
References: <cover.1519915283.git.kurt.bodiker@braintrust-us.com>
In-Reply-To: <cover.1519915283.git.kurt.bodiker@braintrust-us.com>
References: <cover.1519915283.git.kurt.bodiker@braintrust-us.com>
Subject: [PATCH 1/7] xen: Define the standard values needed for stubdoms
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
X-List-Received-Date: Mon, 05 Mar 2018 15:35:47 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

From: kebodiker <kurt.bodiker@braintrust-us.com>

This commit introduces the stubdom.inc file that is required for each
recipe that is/will be built for Xen stubdomains. This file defines the
standard values to be used such as common dependencies, the version of
Xen that is being built by the separate Xen recipe, and unsets every
flag and build tool that is exported into the OE environment.

Xen stubdomains are cross-compiled with the MiniOS, which creates some
issues when trying to compile stubdomains in an OpenEmbedded
environment. To address these issues and to ensure the stubdoms are
built as Xen had intended, all of the build flags and build tools that
are exported into the environment by OE have been unset. Each of the new
recipes introduced here then implements the build flags and the tools as
though the build had been run in the bare-metal environment.

Signed-off-by: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
---
 recipes-extended/xen/stubdom.inc | 141 +++++++++++++++++++++++++++++++++++=
++++
 1 file changed, 141 insertions(+)
 create mode 100644 recipes-extended/xen/stubdom.inc

diff --git a/recipes-extended/xen/stubdom.inc b/recipes-extended/xen/stubdo=
m.inc
new file mode 100644
index 0000000..4bc556d
--- /dev/null
+++ b/recipes-extended/xen/stubdom.inc
@@ -0,0 +1,141 @@
+# Copyright (C) 2017 Kurt Bodiker <kurt.bodiker@braintrust-us.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+require xen-arch.inc
+
+# Don't want to use the default tools and dependencies from OE
+# and many of these recipes build static instead of shared libraries
+INHIBIT_DEFAULT_DEPS =3D "1"
+INHIBIT_PACKAGE_STRIP =3D "0"
+EXCLUDE_FROM_SHLIBS =3D "1"
+
+# Couldn't find any other way to access the version of Xen used as a depen=
dency.=20
+# This version number needs changed to match version of Xen recipe  used i=
n builds.
+XEN_VERSION =3D "4.9.0"
+
+
+# convenience variable that may or may not be needed for each recipe
+TRANSLATED_PV =3D "${@d.getVar('PV').replace('.', '_')}"
+
+# mini-os source code for everyone
+SRC_URI +=3D "\
+    git://xenbits.xen.org/mini-os.git;protocol=3Dgit;rev=3Dxen-RELEASE-${X=
EN_VERSION};nobranch=3D1;destsuffix=3Dmini-os;name=3Dmini-os \
+"
+
+# base set of dependencies
+DEPENDS +=3D "\
+    xen \
+    lwip \
+    virtual/${TARGET_PREFIX}gcc \
+"
+
+
+export XEN_TARGET_ARCH=3D"${@map_xen_arch(d.getVar('TARGET_ARCH'), d)}"
+export XEN_COMPILE_ARCH=3D"${@map_xen_arch(d.getVar('BUILD_ARCH'), d)}"
+
+# Not sure if we need to (or even can) support 32-bit stubdoms
+# If we we do not need to support the 32-bit environment, then this sectio=
n and the=20
+# export statement afterwards can be removed.=20
+python () {
+    gnu_dict =3D {
+            'x86_32': 'i686',
+            'x86_64': 'x86_64',
+        }
+       =20
+    if d.expand('${XEN_TARGET_ARCH}') =3D=3D 'x86_32':
+        d.setVar("GNU_TARGET_ARCH",gnu_dict[d.expand('${XEN_TARGET_ARCH}')=
])
+        d.setVar("PACKAGE_ARCH","core2-32")
+    elif d.expand('${XEN_TARGET_ARCH}') =3D=3D 'x86_64':
+        d.setVar("GNU_TARGET_ARCH",gnu_dict[d.expand('${XEN_TARGET_ARCH}')=
])
+}
+export GNU_TARGET_ARCH
+
+# Base set of CPPFLAGS, CFLAGS needed for each component used to build Min=
iOS-based stubdoms
+# LDFLAGS are only used when building stubdoms, so only used in stubdom re=
cipes
+# Generic name given because each library uses DEF_, BUILD_, TARGET_, and =
xxxFLAGS differently
+STUBDOM_CPPFLAGS +=3D "-isystem ${WORKDIR}/mini-os/include"
+STUBDOM_CPPFLAGS +=3D "-D__MINIOS__ -DHAVE_LIBC"
+STUBDOM_CPPFLAGS +=3D "-isystem ${WORKDIR}/mini-os/include/posix"
+STUBDOM_CPPFLAGS +=3D "-isystem ${RECIPE_SYSROOT}/usr/include/xenstore-com=
pat"
+STUBDOM_CPPFLAGS +=3D "-isystem ${WORKDIR}/mini-os/include/x86 -isystem ${=
WORKDIR}/mini-os/include/x86/${XEN_TARGET_ARCH}"
+STUBDOM_CPPFLAGS +=3D "-U __linux__ -U __FreeBSD__ -U __sun__"
+STUBDOM_CPPFLAGS +=3D "-nostdinc"
+CPPFLAGS_INCLUDE_DIR =3D "-isystem ${RECIPE_SYSROOT}/cross-root-${XEN_TARG=
ET_ARCH}/${GNU_TARGET_ARCH}-xen-elf/include"
+STUBDOM_CPPFLAGS +=3D "${CPPFLAGS_INCLUDE_DIR}"
+STUBDOM_CPPFLAGS +=3D "-isystem ${RECIPE_SYSROOT}/cross-root-${XEN_TARGET_=
ARCH}/lwip/include -isystem ${RECIPE_SYSROOT}/cross-root-${XEN_TARGET_ARCH}=
/lwip/include/ipv4"
+STUBDOM_CPPFLAGS +=3D "-isystem ${RECIPE_SYSROOT}/usr/include/xen"
+
+STUBDOM_CFLAGS +=3D "-mno-red-zone -O1 -fno-omit-frame-pointer -m64 -fno-r=
eorder-blocks -fno-asynchronous-unwind-tables -DBUILD_ID -fno-strict-aliasi=
ng -std=3Dgnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wn=
o-unused-but-set-variable -Wno-unused-local-typedefs -fno-stack-protector -=
fno-exceptions"
+
+STUBDOM_LDFLAGS =3D "-nostdlib -L${RECIPE_SYSROOT}/cross-root-${XEN_TARGET=
_ARCH}/${GNU_TARGET_ARCH}-xen-elf/lib"
+
+# unset EVERYTHING from the OE environment. Weird things happen when these=
 are exported into the environment.
+unset CFLAGS
+unset BUILD_CFLAGS
+unset TARGET_CFLAGS
+unset CFLAGS_FOR_BUILD
+
+unset CPPFLAGS
+unset BUILD_CPPFLAGS
+unset TARGET_CPPFLAGS
+unset CPPFLAGS_FOR_BUILD
+
+unset LDFLAGS
+unset BUILD_LDFLAGS
+unset TARGET_LDFLAGS
+unset LDFLAGS_FOR_BUILD
+
+unset CXXFLAGS
+unset TARGET_CXXFLAGS
+unset BUILD_CXXFLAGS
+unset CXXFLAGS_FOR_BUILD
+
+unset BUILD_CC
+unset BUILD_CPP
+unset BUILD_CXX
+unset BUILD_LD
+unset BUILD_AR
+unset BUILD_AS
+unset BUILD_CCLD
+unset BUILD_FC
+unset BUILD_RANLIB
+unset BUILD_NM
+unset BUILD_STRIP
+unset BUILD_READELF
+unset BUILD_OBJCOPY
+unset BUILD_OBJDUMP
+unset CC
+unset CPP
+unset CXX
+unset LD
+unset AR
+unset AS
+unset NM
+unset RANLIB
+unset STRIP
+unset STRINGS
+unset READELF
+unset OBJCOPY
+unset OBJDUMP
+unset READELF
+unset CCLD
+unset FC
+
+# Need to redefine these for stubdom-related builds. It all starts because=
 of the prefix newlib=20
+# and then continues because we don't want to cross-contaminate stubdom-re=
lated recipes with=20
+# headers and libraries in the OE-defined locations
+export prefix=3D"/cross-root-${XEN_TARGET_ARCH}"
+export includedir=3D"${prefix}/${GNU_TARGET_ARCH}-xen-elf/include"
+export libdir=3D"${prefix}/${GNU_TARGET_ARCH}-xen-elf/lib"
+export libexecdir=3D"${libdir}"
+export STAGING_INCDIR
+export STAGING_LIBDIR
+
+# These values need defined to trigger some values in the Makefiles
+export debug=3D"y"
+export stubdom=3D"y"
+export XEN_OS=3D"MiniOS"
+
+do_configure_prepend() {
+    ${MAKE} -C ${WORKDIR}/mini-os links
+}
--=20
2.14.2


--=20

*This email and all attachments are considered confidential and the=20
proprietary information of BrainTrust Holdings.  Unauthorized disclosure is=
=20
prohibited.  *

