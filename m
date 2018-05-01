Return-Path: <kurt.bodiker@braintrust-us.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E9B0FE00C5B; Tue,  1 May 2018 07:05:54 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 08370E00B30
	for <meta-virtualization@yoctoproject.org>;
	Tue,  1 May 2018 07:05:51 -0700 (PDT)
Received: by mail-qt0-f195.google.com with SMTP id j42-v6so14644679qtj.12
	for <meta-virtualization@yoctoproject.org>;
	Tue, 01 May 2018 07:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=braintrust-us-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=VE/pGW6DE1fR5evhDiT5TBTVMNFQZzf8Z9e/ufEDSJI=;
	b=nopnU7kY0LP2UC6paixawV5qbV9wcAPjb91Qc92EhaSH1a+NTJi7Jiaz9Pj6B3/rrR
	Vlh8gcnt4hWCXojJV0QKe0/UPVewDzBkrZ8Th87Q7onnWG/HprbJzTSV+iWs7r6Oj+HM
	CHtiumwAoGl5gnbgI8Vm8clLDJSplDsaLeAOtI/khG3YoWnmHuMDttWzfPIvUWyKdgTm
	z8QcHUg39loXdCfaJ+Y5dm6fEJnIsz7G6mei35BPQ+y7h0zT/kOxDnJiWZ2o7A5yH+KU
	auJSTpvgrOX8XMdXN5YTMRWsI1gLrz9q49S9t24vAE8rUZt6AdX2hPwdXkVQ5dQ3SnaT
	UPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:references;
	bh=VE/pGW6DE1fR5evhDiT5TBTVMNFQZzf8Z9e/ufEDSJI=;
	b=LzDyFubz2x/GOktLuP6nXdeN9mtsyFN6XyX+9xP/Qh8/0wkuOpqKdczUn/KDLcu5kU
	BcZweEwADyIuKkqBRQ3MRTOGhbPnjo57wYWdGzapeWj6HEe42U3I/zFh/YWjLdEqwHq3
	L1L4uisZZrW92vcFDsijxf0I5M9aNG6r8KanVmHrE7zR0B6EzAnpqI5veXx+dosoBlfE
	J2wGZhsKfF0jBwZGwdC2okO+SGXO5AYEevDNyL+96tKmaSTkX1qfLiTk89jdRqlGtRae
	fH8RPetl7enDa6XUHzDmzKaZHPzG8p3e3OTTdHUMpOnXO0K0qzh8gc5/Ycm/ex66k4M+
	UoEA==
X-Gm-Message-State: ALQs6tDtsmnYMFj0ywGZrZzSB8Zi/G1+eWN0qOn3jgNe6k91SK1KNqkA
	Q6SEF2lDwJk+juF82vAQrAqehSCyxCWgnZXniTqJZV4y3snU67S9ZaFgc4ie711V+lqUqhkBY6h
	jKT+kkSdHw41PWrivlySgn6TkRjCgh4Q=
MIME-Version: 1.0
X-Google-Smtp-Source: AB8JxZp9QYbOwOWaJsIy84bpYJxy+/RhyTr/VtuLw6JflJrH27mX0+ESKh8pmmya8BucmBDAwhHz6g==
X-Received: by 2002:ac8:530d:: with SMTP id
	t13-v6mr14201041qtn.388.1525183550876; 
	Tue, 01 May 2018 07:05:50 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
	by smtp.gmail.com with ESMTPSA id
	i25-v6sm9048335qte.26.2018.05.01.07.05.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 01 May 2018 07:05:50 -0700 (PDT)
From: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
To: meta-virtualization@yoctoproject.org
Date: Tue,  1 May 2018 10:05:27 -0400
Message-Id: <ae02d6a33563cb23f2a47a7b81e08e84a4082c11.1525180972.git.kurt.bodiker@braintrust-us.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1525180972.git.kurt.bodiker@braintrust-us.com>
References: <cover.1525180972.git.kurt.bodiker@braintrust-us.com>
In-Reply-To: <cover.1525180972.git.kurt.bodiker@braintrust-us.com>
References: <cover.1525180972.git.kurt.bodiker@braintrust-us.com>
Cc: kurt.bodiker@braintrust-us.com
Subject: [PATCH v5 1/8] xen: Define standard values needed to build stubdomains
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
X-List-Received-Date: Tue, 01 May 2018 14:05:55 -0000
Content-Type: text/plain; charset="US-ASCII"

This commit introduces the stubdom.inc file that is required for each
recipe that is/will be built for Xen stubdomains. This file defines the
standard values to be used such as common dependencies, compiler and
linker flags, and unsets every flag and build tool that is exported into
the OE environment.

Signed-off-by: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
---
Changes in v5:
 - remove aarch64 from COMPATIBLE_HOST
Changes in v4:
 - none
Changes in v3:
 - Limit builds to 64-bit only through COMPATIBLE_HOST
 - Change cross-root-${XEN_TARGET_ARCH} to cross-root-${GNU_TARGET_ARCH}
Changes in v2:
 - Multi-line variables formatted to match OE style guide
---
 recipes-extended/xen/stubdom.inc | 152 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)
 create mode 100644 recipes-extended/xen/stubdom.inc

diff --git a/recipes-extended/xen/stubdom.inc b/recipes-extended/xen/stubdom.inc
new file mode 100644
index 0000000..bfc6752
--- /dev/null
+++ b/recipes-extended/xen/stubdom.inc
@@ -0,0 +1,152 @@
+# Copyright (C) 2017 Kurt Bodiker <kurt.bodiker@braintrust-us.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+COMPATIBLE_HOST = '(x86_64.*).*-linux'
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
+LWIP_SRCDIR = "${RECIPE_SYSROOT}/cross-root-${GNU_TARGET_ARCH}/lwip"
+MINIOS_SRCDIR = "${RECIPE_SYSROOT}/cross-root-${GNU_TARGET_ARCH}/mini-os"
+
+# Base set of CPPFLAGS, CFLAGS needed for each component used to build MiniOS-based stubdoms
+# LDFLAGS are only used when building stubdoms, so only used in stubdom recipes
+# Generic name given because each library uses DEF_, BUILD_, TARGET_, and xxxFLAGS differently
+CPPFLAGS_INCLUDE_DIR = "-isystem ${RECIPE_SYSROOT}/cross-root-${GNU_TARGET_ARCH}/${GNU_TARGET_ARCH}-xen-elf/include"
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
+    -L${RECIPE_SYSROOT}/cross-root-${GNU_TARGET_ARCH}/${GNU_TARGET_ARCH}-xen-elf/lib \
+"
+
+# Need to redefine these for stubdom-related builds. It all starts because of
+# the prefix used in newlib and then continues because we don't want to
+# cross-contaminate stubdom-related recipes with headers and libraries found in
+# the OE-defined locations
+export prefix="/cross-root-${GNU_TARGET_ARCH}"
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

