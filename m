Return-Path: <bostancioglucevat@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 01A28E00D2C; Sat, 15 Jun 2019 12:55:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.221.68 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bostancioglucevat[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2464E00B1A
	for <meta-virtualization@yoctoproject.org>;
	Sat, 15 Jun 2019 12:55:41 -0700 (PDT)
Received: by mail-wr1-f68.google.com with SMTP id m3so5882553wrv.2
	for <meta-virtualization@yoctoproject.org>;
	Sat, 15 Jun 2019 12:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=V7klzeXlPh+K/NSeK3wb23oOBJ7sag5uOZ/zff1UTaE=;
	b=mBIy2XAchxb8UxO5phg5FHwS6/xNA2rSQO/C1DEyoM9YTx/8lsmXZhWqVvvkS+BKxO
	17O9JyKR9oI9dOSl2XQcPrpfli5cFYnKrQqrK4WCvIPVXErWtdvLMnAvKsusfzaQGmEh
	Ph+4XZiqkN+KrTB2a7W6U2qXDm+BHJIUUUEXzLLM1OsfP0OgQ4F19hbv/6EiLvNukXC4
	H4BkTsmC6+0Jnb3fdcMdFdzIGjF0yT3Yp9xpVuKHy90B+9Tzjx5hRGxU/2iO6JxmapXZ
	e08ONswIP6HRKQqyrJr6Sy9noFyjBW73R2hMOJltKxNCib+fVPXBrU4PT130Jp6W0z64
	cBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=V7klzeXlPh+K/NSeK3wb23oOBJ7sag5uOZ/zff1UTaE=;
	b=GHJZT4CqxRQgjC8wPWHXn/+qyqFp2rc6y37Kncz+Oy+W65YtMzqCKrs1cHwa1Y6YHE
	zcEdeBF8AtjT+qoEdNfBdYAlCE6vNTBZa6yiEMUBKAyYni2ubS1IVHgyfYaVU0WSvc9p
	fNJOe1xk0s+NC1vRQJEz64X2KgTnB9Gj104mbGbwkw4v03EeiB7/P24hEnc8e5XWKghc
	gPKo11LdSWI/CI5hOA1lNf3fOocfWP/55AswwIytXPw7ilziG9jz/zMgUPStses9AK3d
	BpfMgmgeIRzgPKcqRy9zmKbGM4GR0TboUhQXAgFSwxevsZoVhnTuVCAiOylY4anuUu5S
	SWPQ==
X-Gm-Message-State: APjAAAVsgSdbNUUdJTDtJqgQhPooHMZ76aPJ5D4obOhc2H+iZmll/46j
	5QCPlo5dAfihOtyZq+ADLO+fZ3snSmo=
X-Google-Smtp-Source: APXvYqzjR/AI8THYpG/Yl3yA+g+GrGlSBOrFatjgkPdqHseGp40q0u6bf7zAft4TDhIHecYbTQwqAg==
X-Received: by 2002:adf:81c8:: with SMTP id 66mr66682710wra.261.1560628539839; 
	Sat, 15 Jun 2019 12:55:39 -0700 (PDT)
Received: from localhost.localdomain ([78.176.91.117])
	by smtp.gmail.com with ESMTPSA id v3sm4492375wmh.31.2019.06.15.12.55.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Jun 2019 12:55:39 -0700 (PDT)
From: Cevat Bostancioglu <bostancioglucevat@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Sat, 15 Jun 2019 22:55:31 +0300
Message-Id: <1560628531-12119-1-git-send-email-bostancioglucevat@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] kvmtool: Werror Disabled Patch
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
X-List-Received-Date: Sat, 15 Jun 2019 19:55:46 -0000

Couple of compile time warnings turned into errors with Werror command, this patch disables this feature.

Signed-off-by: Cevat Bostancioglu <bostancioglucevat@gmail.com>
---
 .../files/0003-kvmtool-Werror-disabled.patch       | 640 +++++++++++++++++++++
 1 file changed, 640 insertions(+)
 create mode 100644 recipes-extended/kvmtool/files/0003-kvmtool-Werror-disabled.patch

diff --git a/recipes-extended/kvmtool/files/0003-kvmtool-Werror-disabled.patch b/recipes-extended/kvmtool/files/0003-kvmtool-Werror-disabled.patch
new file mode 100644
index 0000000..46f5be1
--- /dev/null
+++ b/recipes-extended/kvmtool/files/0003-kvmtool-Werror-disabled.patch
@@ -0,0 +1,640 @@
+From 21b712587a3c424ddf4df897a28dfda7e2af0bd9 Mon Sep 17 00:00:00 2001
+From: Cevat Bostancioglu <bostancioglucevat@gmail.com>
+Date: Sat, 15 Jun 2019 19:41:16 +0000
+Subject: [PATCH] kvmtool: Werror disabled "DEBUG: Executing shell function
+ do_compile NOTE: make -j 8 V=1
+ EXTRA_CFLAGS=-I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ Makefile:310: Skipping optional libraries: bfd KVMTOOLS_VERSION = 3.18.0
+ Makefile:310: Skipping optional libraries: bfd arm-poky-linux-gnueabi-gcc 
+ -march=armv5e -marm -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat
+ -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,./.builtin-balloon.o.d  -O2 -pipe -g
+ -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-balloon.c -o builtin-balloon.o
+ arm-poky-linux-gnueabi-gcc  -march=armv5e -marm -fstack-protector-strong 
+ -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,./.builtin-debug.o.d  -O2 -pipe -g -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-debug.c -o builtin-debug.o
+ arm-poky-linux-gnueabi-gcc  -march=armv5e -marm -fstack-protector-strong 
+ -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,./.builtin-help.o.d  -O2 -pipe -g -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-help.c -o builtin-help.o
+ arm-poky-linux-gnueabi-gcc  -march=armv5e -marm -fstack-protector-strong 
+ -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,./.builtin-list.o.d  -O2 -pipe -g -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-list.c -o builtin-list.o
+ arm-poky-linux-gnueabi-gcc  -march=armv5e -marm -fstack-protector-strong 
+ -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,./.builtin-stat.o.d  -O2 -pipe -g -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-stat.c -o builtin-stat.o
+ arm-poky-linux-gnueabi-gcc  -march=armv5e -marm -fstack-protector-strong 
+ -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,./.builtin-pause.o.d  -O2 -pipe -g -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-pause.c -o builtin-pause.o
+ arm-poky-linux-gnueabi-gcc  -march=armv5e -marm -fstack-protector-strong 
+ -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,./.builtin-resume.o.d  -O2 -pipe -g -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-resume.c -o builtin-resume.o
+ arm-poky-linux-gnueabi-gcc  -march=armv5e -marm -fstack-protector-strong 
+ -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,./.builtin-run.o.d  -O2 -pipe -g -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-run.c -o builtin-run.o
+ arm-poky-linux-gnueabi-gcc  -march=armv5e -marm -fstack-protector-strong 
+ -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,./.builtin-setup.o.d  -O2 -pipe -g -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-setup.c -o builtin-setup.o
+ arm-poky-linux-gnueabi-gcc  -march=armv5e -marm -fstack-protector-strong 
+ -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,./.builtin-stop.o.d  -O2 -pipe -g -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-stop.c -o builtin-stop.o
+ arm-poky-linux-gnueabi-gcc  -march=armv5e -marm -fstack-protector-strong 
+ -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,./.devices.o.d  -O2 -pipe -g -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT devices.c -o devices.o
+ arm-poky-linux-gnueabi-gcc  -march=armv5e -marm -fstack-protector-strong 
+ -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,disk/.core.o.d  -O2 -pipe -g -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT disk/core.c -o disk/core.o
+ arm-poky-linux-gnueabi-gcc  -march=armv5e -marm -fstack-protector-strong 
+ -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,./.builtin-version.o.d  -O2 -pipe -g
+ -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-version.c -o builtin-version.o
+ arm-poky-linux-gnueabi-gcc  -march=armv5e -marm -fstack-protector-strong 
+ -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,./.framebuffer.o.d  -O2 -pipe -g -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT framebuffer.c -o framebuffer.o
+ arm-poky-linux-gnueabi-gcc  -march=armv5e -marm -fstack-protector-strong 
+ -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,./.guest_compat.o.d  -O2 -pipe -g -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT guest_compat.c -o guest_compat.o
+ arm-poky-linux-gnueabi-gcc  -march=armv5e -marm -fstack-protector-strong 
+ -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,hw/.rtc.o.d  -O2 -pipe -g -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT hw/rtc.c -o hw/rtc.o
+ arm-poky-linux-gnueabi-gcc  -march=armv5e -marm -fstack-protector-strong 
+ -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,hw/.serial.o.d  -O2 -pipe -g -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT hw/serial.c -o hw/serial.o
+ builtin-run.c: In function 'kvm_run_write_sandbox_cmd.isra.1':
+ builtin-run.c:412:28: error: '%s' directive output may be truncated writing
+ up to 4095 bytes into a region of size 4091 [-Werror=format-truncation=]   
+ snprintf(dst, len, "/host%s", resolved_path);                             ^~ 
+  ~~~~~~~~~~~~~ In file included from
+ /home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot/usr/include/stdio.h:873,
+                  from include/kvm/util.h:13,                  from
+ include/kvm/builtin-run.h:4,                  from builtin-run.c:1:
+ /home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot/usr/include/bits/stdio2.h:67:10:
+ note: '__builtin___snprintf_chk' output between 6 and 4101 bytes into a
+ destination of size 4096    return __builtin___snprintf_chk (__s, __n,
+ __USE_FORTIFY_LEVEL - 1,          
+ ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~         __bos
+ (__s), __fmt, __va_arg_pack ());        
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ arm-poky-linux-gnueabi-gcc 
+ -march=armv5e -marm -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat
+ -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,./.ioport.o.d  -O2 -pipe -g -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT ioport.c -o ioport.o
+ arm-poky-linux-gnueabi-gcc  -march=armv5e -marm -fstack-protector-strong 
+ -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,./.irq.o.d  -O2 -pipe -g -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT irq.c -o irq.o
+ arm-poky-linux-gnueabi-gcc  -march=armv5e -marm -fstack-protector-strong 
+ -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,./.kvm-cpu.o.d  -O2 -pipe -g -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT kvm-cpu.c -o kvm-cpu.o
+ arm-poky-linux-gnueabi-gcc  -march=armv5e -marm -fstack-protector-strong 
+ -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,./.kvm.o.d  -O2 -pipe -g -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT kvm.c -o kvm.o
+ arm-poky-linux-gnueabi-gcc  -march=armv5e -marm -fstack-protector-strong 
+ -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,./.main.o.d  -O2 -pipe -g -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT main.c -o main.o
+ arm-poky-linux-gnueabi-gcc  -march=armv5e -marm -fstack-protector-strong 
+ -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,./.mmio.o.d  -O2 -pipe -g -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT mmio.c -o mmio.o
+ arm-poky-linux-gnueabi-gcc  -march=armv5e -marm -fstack-protector-strong 
+ -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,./.pci.o.d  -O2 -pipe -g -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT pci.c -o pci.o
+ arm-poky-linux-gnueabi-gcc  -march=armv5e -marm -fstack-protector-strong 
+ -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,./.term.o.d  -O2 -pipe -g -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT term.c -o term.o
+ arm-poky-linux-gnueabi-gcc  -march=armv5e -marm -fstack-protector-strong 
+ -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,virtio/.blk.o.d  -O2 -pipe -g -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT virtio/blk.c -o virtio/blk.o
+ arm-poky-linux-gnueabi-gcc  -march=armv5e -marm -fstack-protector-strong 
+ -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,virtio/.scsi.o.d  -O2 -pipe -g -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT virtio/scsi.c -o virtio/scsi.o
+ arm-poky-linux-gnueabi-gcc  -march=armv5e -marm -fstack-protector-strong 
+ -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,virtio/.console.o.d  -O2 -pipe -g -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT virtio/console.c -o virtio/console.o
+ arm-poky-linux-gnueabi-gcc  -march=armv5e -marm -fstack-protector-strong 
+ -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,virtio/.core.o.d  -O2 -pipe -g -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT virtio/core.c -o virtio/core.o
+ arm-poky-linux-gnueabi-gcc  -march=armv5e -marm -fstack-protector-strong 
+ -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,virtio/.net.o.d  -O2 -pipe -g -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT virtio/net.c -o virtio/net.o
+ arm-poky-linux-gnueabi-gcc  -march=armv5e -marm -fstack-protector-strong 
+ -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,virtio/.rng.o.d  -O2 -pipe -g -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT virtio/rng.c -o virtio/rng.o
+ arm-poky-linux-gnueabi-gcc  -march=armv5e -marm -fstack-protector-strong 
+ -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security
+ --sysroot=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot
+ -c -Wp,-MD,virtio/.balloon.o.d  -O2 -pipe -g -feliminate-unused-debug-types
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0=/usr/src/debug/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=
+ -fdebug-prefix-map=/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=
+ 
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
+ -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated
+ -march=armv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BITS=64
+ -D_GNU_SOURCE -DKVMTOOLS_VERSION='"3.18.0"' -DBUILD_ARCH='"arm"' -Iinclude
+ -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
+ -Wformat=2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
+ -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredundant-decls
+ -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
+ -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
+ -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT virtio/balloon.c -o virtio/balloon.o
+ cc1: all warnings being treated as errors Makefile:431: recipe for target
+ 'builtin-run.o' failed make: *** [builtin-run.o] Error 1 make: *** Waiting
+ for unfinished jobs.... virtio/net.c: In function 'virtio_net__tap_init':
+ virtio/net.c:336:47: error: argument to 'sizeof' in 'strncpy' call is the
+ same expression as the source; did you mean to use the size of the
+ destination? [-Werror=sizeof-pointer-memaccess]    strncpy(ifr.ifr_name,
+ ndev->tap_name, sizeof(ndev->tap_name));                                     
+           ^ virtio/net.c:348:47: error: argument to 'sizeof' in 'strncpy'
+ call is the same expression as the source; did you mean to use the size of
+ the destination? [-Werror=sizeof-pointer-memaccess]    strncpy(ifr.ifr_name,
+ ndev->tap_name, sizeof(ndev->tap_name));                                     
+           ^ cc1: all warnings being treated as errors Makefile:431: recipe
+ for target 'virtio/net.o' failed make: *** [virtio/net.o] Error 1 ERROR:
+ oe_runmake failed WARNING: exit code 1 from a shell command. ERROR: Function
+ failed: do_compile (log file is located at
+ /home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26eecc-r0/temp/log.do_compile.7489)
+ "
+
+Signed-off-by: Cevat Bostancioglu <bostancioglucevat@gmail.com>
+---
+ Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile b/Makefile
+index 030ff4e..fc5e177 100644
+--- a/Makefile
++++ b/Makefile
+@@ -2,6 +2,7 @@
+ # Define WERROR=0 to disable -Werror.
+ #
+ 
++WERROR = 0
+ ifeq ($(strip $(V)),)
+ 	E = @echo
+ 	Q = @
+-- 
+2.7.4
+
-- 
2.7.4


