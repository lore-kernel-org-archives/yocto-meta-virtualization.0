Return-Path: <kurt.bodiker@braintrust-us.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C25D7E00AE6; Fri,  6 Apr 2018 10:07:02 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A7D84E008D3
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Apr 2018 10:07:01 -0700 (PDT)
Received: by mail-qt0-f194.google.com with SMTP id w23so1861485qtn.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 06 Apr 2018 10:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=braintrust-us-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=EF6Z7shUbzdn+VM3qzn4m94/ojSv0t6XEKYj4zmJkEc=;
	b=S2VjYy90BY6vIsJtYJDuIBTf0eGnBRuJG6pbpAcpZXuOet6zEQK79tRATRxonp6xkA
	Cm3TIOpG/Uw4n7kttRqkfBAruNw0nryrczf+GHoM7/lWmlbvSMxOaa057iw+5jk0BeDq
	QkR3l5FrDT6VpJyxq4a9KObPjuau+6HI5ScxY4uxO2Z+BhOeujkZpG27mILQ7e9WsRZw
	Q+aJbFH3W4kOHi6LzXr74vQ8d9eiLGPi/OkZzCG5CyiM9VyPDi3n0nveN9PL8FP8CHIG
	x2YU2Jr/94XDwTUnspchVTi6b4rhWuR0wlDsch3oODJHX7S+aYsek87o7EFSTkgSVuLH
	PbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:references;
	bh=EF6Z7shUbzdn+VM3qzn4m94/ojSv0t6XEKYj4zmJkEc=;
	b=Yr1WE01rnzB/OkvFpfprIZIE0SeiCdgLOlat3DzDDvs7FR1cWa692IAsFg1Et0IO8o
	72ryJBlzOTAd4++3fBQCs0klw62rLNWi859hCeRGAI7NqGdKyo6F3P1lTCNihAJfMCoY
	ZunDRtNah28siZ8yTnnepjVTY5ksV6hE41qhcTGcdXA3zDaDE3TlsmhL06uKRr27petx
	UXDWLI1BWTP5jHPMM440IyCzrPP07wzewAfGz7nE88EFTyiT9GoC8pNPk601/G63si87
	kDcpTxWga68vvDuOKFB6Qk2QE6vxjWXNdx/544VcxY5LL69kK5sZ+7kN5ekXqh51B+1u
	mGZQ==
X-Gm-Message-State: ALQs6tBc9gxS1pMjCsKSXiTog4yeE9KUbAj7qCWA9WtVCR324ruV81Hu
	n7NRIHgmR7HS65Fdy2+LdChQS2dgIEF6LkFHYcaqqhrk0kU93MBhi0kcevONiyRjON+xp0ZNI5+
	6bVtMAjOxXyXzzJFz8hUf2Mi4v8oTeRA=
MIME-Version: 1.0
X-Google-Smtp-Source: AIpwx4+VrZwQ5Y0eoxJJEkix0ueHq731tkydW9jfqE8oOFOIp1udL/Y5KyJ/K4S6IPBGvfZ73A0Tlg==
X-Received: by 10.237.42.229 with SMTP id t92mr39988749qtd.275.1523034420662; 
	Fri, 06 Apr 2018 10:07:00 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
	by smtp.gmail.com with ESMTPSA id
	y66sm8290900qky.61.2018.04.06.10.06.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 06 Apr 2018 10:07:00 -0700 (PDT)
From: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
To: meta-virtualization@yoctoproject.org
Date: Fri,  6 Apr 2018 13:06:38 -0400
Message-Id: <8fc28ea0f3122abb4f1e8d6aa86f830438cfb8ee.1522956183.git.kurt.bodiker@braintrust-us.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1522956183.git.kurt.bodiker@braintrust-us.com>
References: <cover.1522956183.git.kurt.bodiker@braintrust-us.com>
In-Reply-To: <cover.1522956183.git.kurt.bodiker@braintrust-us.com>
References: <cover.1522956183.git.kurt.bodiker@braintrust-us.com>
Cc: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
Subject: [PATCH v2 1/8] xen: Define standard values needed to build stubdomains
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
X-List-Received-Date: Fri, 06 Apr 2018 17:07:02 -0000
Content-Type: text/plain; charset="US-ASCII"

This commit introduces the stubdom.inc file that is required for each
recipe that is/will be built for Xen stubdomains. This file defines the
standard values to be used such as common dependencies, compiler and
linker flags, and unsets every flag and build tool that is exported into
the OE environment.

Signed-off-by: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
---
Changes in v2:
 - Multi-line variables formatted to match OE style guide
---
 recipes-extended/xen/stubdom.inc | 150 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)
 create mode 100644 recipes-extended/xen/stubdom.inc

diff --git a/recipes-extended/xen/stubdom.inc b/recipes-extended/xen/stubdom.inc
new file mode 100644
index 0000000..fd24b80
--- /dev/null
+++ b/recipes-extended/xen/stubdom.inc
@@ -0,0 +1,150 @@
+# Copyright (C) 2017 Kurt Bodiker <kurt.bodiker@braintrust-us.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+require xen-arch.inc
+
+# many of the xen stubdom related recipes build and package static instead of shared libraries
+EXCLUDE_FROM_SHLIBS = "1"
+
+# base set of dependencies to be used for xen stubdom recipes
+DEPENDS += "\
+    lwip \
+    mini-os \
+"
+
+# unset EVERYTHING from the OE environment.
+# Weird things happen when these are exported into the environment.
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
+# Provide support to build both 32-bit and 64-bit stubdoms 
+python () {
+    gnu_dict = {
+            'x86_32': 'i686',
+            'x86_64': 'x86_64',
+        }
+        
+    if d.expand('${XEN_TARGET_ARCH}') == 'x86_32':
+        d.setVar("GNU_TARGET_ARCH",gnu_dict[d.expand('${XEN_TARGET_ARCH}')])
+        d.setVar("PACKAGE_ARCH","core2-32")
+    elif d.expand('${XEN_TARGET_ARCH}') == 'x86_64':
+        d.setVar("GNU_TARGET_ARCH",gnu_dict[d.expand('${XEN_TARGET_ARCH}')])
+}
+
+export GNU_TARGET_ARCH
+export XEN_TARGET_ARCH="${@map_xen_arch(d.getVar('TARGET_ARCH'), d)}"
+export XEN_COMPILE_ARCH="${@map_xen_arch(d.getVar('BUILD_ARCH'), d)}"
+
+LWIP_SRCDIR = "${RECIPE_SYSROOT}/cross-root-${XEN_TARGET_ARCH}/lwip"
+MINIOS_SRCDIR = "${RECIPE_SYSROOT}/cross-root-${XEN_TARGET_ARCH}/mini-os"
+
+# Base set of CPPFLAGS, CFLAGS needed for each component used to build MiniOS-based stubdoms
+# LDFLAGS are only used when building stubdoms, so only used in stubdom recipes
+# Generic name given because each library uses DEF_, BUILD_, TARGET_, and xxxFLAGS differently
+CPPFLAGS_INCLUDE_DIR = "-isystem ${RECIPE_SYSROOT}/cross-root-${XEN_TARGET_ARCH}/${GNU_TARGET_ARCH}-xen-elf/include"
+
+STUBDOM_CPPFLAGS += "\
+    -isystem ${MINIOS_SRCDIR}/include \
+    -D__MINIOS__ \
+    -DHAVE_LIBC \
+    -isystem ${MINIOS_SRCDIR}/include/posix \
+    -isystem ${MINIOS_SRCDIR}/include/xen \
+    -isystem ${MINIOS_SRCDIR}/include/x86 \
+    -isystem ${MINIOS_SRCDIR}/include/x86/${XEN_TARGET_ARCH} \
+    -U __linux__ \
+    -U __FreeBSD__ \
+    -U __sun__ \
+    -nostdinc \
+    ${CPPFLAGS_INCLUDE_DIR} \
+    -isystem ${LWIP_SRCDIR}/include \
+    -isystem ${LWIP_SRCDIR}/include/ipv4 \
+"
+
+STUBDOM_CFLAGS += "\
+    -mno-red-zone \
+    -O1 \
+    -fno-omit-frame-pointer \
+    -m64 \
+    -fno-reorder-blocks \
+    -fno-asynchronous-unwind-tables \
+    -DBUILD_ID \
+    -fno-strict-aliasing \
+    -std=gnu99 \
+    -Wall \
+    -Wstrict-prototypes \
+    -Wdeclaration-after-statement \
+    -Wno-unused-but-set-variable \
+    -Wno-unused-local-typedefs \
+    -fno-stack-protector \
+    -fno-exceptions \
+"
+
+STUBDOM_LDFLAGS = "\
+    -nostdlib \
+    -L${RECIPE_SYSROOT}/cross-root-${XEN_TARGET_ARCH}/${GNU_TARGET_ARCH}-xen-elf/lib \
+"
+
+# Need to redefine these for stubdom-related builds. It all starts because of
+# the prefix used in newlib and then continues because we don't want to
+# cross-contaminate stubdom-related recipes with headers and libraries found in
+# the OE-defined locations
+export prefix="/cross-root-${XEN_TARGET_ARCH}"
+export includedir="${prefix}/${GNU_TARGET_ARCH}-xen-elf/include"
+export libdir="${prefix}/${GNU_TARGET_ARCH}-xen-elf/lib"
+export libexecdir="${libdir}"
+export STAGING_INCDIR
+export STAGING_LIBDIR
+
+# Typically defined in Xen and Minios .mk files that aren't sourced/read,
+# defined to trigger some values and paths in Makefiles
+export debug="y"
+export stubdom="y"
+export XEN_OS="MiniOS"
-- 
2.14.2


-- 

*This email and all attachments are considered confidential and the 
proprietary information of BrainTrust Holdings.  Unauthorized disclosure is 
prohibited.  *

