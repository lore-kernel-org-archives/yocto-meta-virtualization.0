Return-Path: <cjp256@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4326E0182F
	for <meta-virtualization@yoctoproject.org>;
	Thu,  7 Nov 2013 20:02:16 -0800 (PST)
Received: by mail-ie0-f170.google.com with SMTP id at1so2497832iec.29
	for <meta-virtualization@yoctoproject.org>;
	Thu, 07 Nov 2013 20:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SbqCmRLHRW3B7rU55eq3a8Q0v6pR36FPxO1NDjPOgl8=;
	b=bS8d1XfaADRaecG33PcrOR3rKfvR0NJSMoFGh84Td2a9OYY57tRJjukF+qFazeIQW7
	Bw81MY3ramBkHJ5zozKWmTTxWAx9izfLzXcPatshJMvLNLQ7r1YqJm20Petyl6l/iILF
	Z/WoLaHs0fWEnuYxyz73LW2aAiYVWmdS1QNFpU8hmu8jUK3mhzQj/PdoAVPfy9mrXaRR
	aQi82ZG9U6RrM8jmCz2KFT+b2JMJVtWMJy/7Im1BmK7SeHaE0GfBBT+qY1aBqeZdiy7z
	/d1DA7ieQPtnEQQNrpylDu3yDOv6fhxn2ZQxM0vS17eFxig0LqHDulGMXAzemc/FLu+f
	nEJg==
X-Received: by 10.50.128.72 with SMTP id nm8mr722624igb.10.1383883335937;
	Thu, 07 Nov 2013 20:02:15 -0800 (PST)
Received: from hatchery.local (cpe-74-71-215-22.twcny.res.rr.com.
	[74.71.215.22])
	by mx.google.com with ESMTPSA id hv5sm1230089igb.9.2013.11.07.20.02.14
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Nov 2013 20:02:14 -0800 (PST)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Thu,  7 Nov 2013 23:01:00 -0500
Message-Id: <1383883267-31992-4-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1383883267-31992-1-git-send-email-cjp256@gmail.com>
References: <1383883267-31992-1-git-send-email-cjp256@gmail.com>
Subject: [PATCH v2 03/10] xen: remove xen-hg recipe and patches
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
X-List-Received-Date: Fri, 08 Nov 2013 04:02:16 -0000

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-extended/xen/xen-hg.bb                     | 29 -------------
 .../xen/xen-hg/ioemu-cross-gl-check.patch          | 29 -------------
 .../xen/xen-hg/tools_qemu_xen_remove_CFLAGS.patch  | 48 ----------------------
 3 files changed, 106 deletions(-)
 delete mode 100644 recipes-extended/xen/xen-hg.bb
 delete mode 100644 recipes-extended/xen/xen-hg/ioemu-cross-gl-check.patch
 delete mode 100644 recipes-extended/xen/xen-hg/tools_qemu_xen_remove_CFLAGS.patch

diff --git a/recipes-extended/xen/xen-hg.bb b/recipes-extended/xen/xen-hg.bb
deleted file mode 100644
index bdb4d32..0000000
--- a/recipes-extended/xen/xen-hg.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-# A build of Xen Unstable from Mercurial
-
-# Build is not yet verified as functional
-# Setting BROKEN for now
-BROKEN = "1"
-
-inherit autotools
-
-require xen.inc
-
-DEPENDS += "yajl"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=e0f0f3ac55608719a82394cc353928df"
-
-SRCREV = "82db8de16530f016809264d3179823999d702849"
-
-SRC_URI = "hg://xenbits.xen.org;module=xen-unstable.hg;rev=d690c7e896a2 \
-        git://xenbits.xensource.com/qemu-xen-unstable.git \
-        file://ioemu-cross-gl-check.patch \
-	file://tools_qemu_xen_remove_CFLAGS.patch"
-
-SRC_URI[md5sum] = "2f3e36c96fe13cebc7475652c2803e14"
-SRC_URI[sha256sum] = "b63bc8d48aaf2688cff1417f99a140943e71de0777b28ed8cbba8aa018b4117c"
-
-S = "${WORKDIR}/xen-unstable.hg"
-
-#EXTRA_OECONF="--disable-pythontools"
-require xen-python.inc
-
diff --git a/recipes-extended/xen/xen-hg/ioemu-cross-gl-check.patch b/recipes-extended/xen/xen-hg/ioemu-cross-gl-check.patch
deleted file mode 100644
index 23497e2..0000000
--- a/recipes-extended/xen/xen-hg/ioemu-cross-gl-check.patch
+++ /dev/null
@@ -1,29 +0,0 @@
---- git/configure.sav	2012-04-06 12:08:07.891529546 -0600
-+++ xen-unstable.hg/../git/configure	2012-04-06 12:09:39.872923477 -0600
-@@ -289,7 +289,7 @@
-             kqemu="yes"
-         fi
-     fi
--    if test -f /usr/include/sys/soundcard.h ; then
-+    if test -f ${CROSS_SYS_ROOT}/usr/include/sys/soundcard.h ; then
-         audio_drv_list="oss"
-     fi
-     audio_possible_drivers="oss sdl"
-@@ -872,7 +872,7 @@
- #endif
- int main( void ) { return (int) glGetString(GL_EXTENSIONS); }
- EOF
--if $cc $ARCH_CFLAGS -o $TMPE `$sdl_config --cflags --libs 2> /dev/null` -I/usr/include/GL $TMPC -lXext -lGL 2> /dev/null
-+if $cc $ARCH_CFLAGS -o $TMPE `$sdl_config --cflags --libs 2> /dev/null` -I${CROSS_SYS_ROOT}/usr/include/GL $TMPC -lXext -lGL 2> /dev/null
- then
- opengl="yes"
- else
-@@ -1450,7 +1450,7 @@
- then
-     echo "#define CONFIG_OPENGL 1" >> $config_h
-     echo "CONFIG_OPENGL=yes" >> $config_mak
--    echo "SDL_CFLAGS+=-I/usr/include/GL" >> $config_mak
-+    echo "SDL_CFLAGS+=-I${CROSS_SYS_ROOT}/usr/include/GL" >> $config_mak
-     echo "SDL_LIBS+=-lXext" >> $config_mak
-     echo "SDL_LIBS+=-lGL" >> $config_mak
- fi
diff --git a/recipes-extended/xen/xen-hg/tools_qemu_xen_remove_CFLAGS.patch b/recipes-extended/xen/xen-hg/tools_qemu_xen_remove_CFLAGS.patch
deleted file mode 100644
index 5fd0148..0000000
--- a/recipes-extended/xen/xen-hg/tools_qemu_xen_remove_CFLAGS.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-# HG changeset patch
-# User Olaf Hering <olaf@xxxxxxxxx>
-# Date 1330015545 -3600
-# Node ID 5bdbdcb03d60a7b58f41306ef39cb988100efbe4
-# Parent  56214b978466914c1b9f8adb1158a3217a823e42
-tools/qemu-xen: remove CFLAGS for qemu build
-
-Currently qemu-xen gets build with CFLAGS only if CFLAGS was already in
-the environment during make invocation. If CFLAGS is in environment then
-make will append all of the various flags specified in xen Makefiles,
-which is then passed to qemu configure. If CFLAGS is not set, then
-configure will use just "-O2 -g" because make does not export its own
-CFLAGS variable.
-
-To make qemu-xen build consistent this change removes CFLAGS from the
-environment so that only the CFLAGS from qemu configure script will be
-used. This matches what is done in kvm.rpm and qemu.rpm where for
-example RPM_OPT_FLAGS is not passes as CFLAGS. Otherwise those packages
-would not build as well.
-
-Passing makes CFLAGS to configure will lead to build errors:
-- xen Makefiles append -std=gnu99, this breaks qemu build due to a bug
-  in header file:
-fpu/softfloat-specialize.h:107: error: initializer element is not constant
-- in 32bit builds, qemus configure script will append -mcpu=i486 in an
-  odd way, which leads to unknown gcc cmdline options due to a missing
-  space
-- xen Makefiles will append -Wall which will expose all sorts of style
-  issues in the qemu code
-- in one case some of the asm() blocks will not compile with gcc 4.6 in
-  openSuSE 12.1
-
-Until upstream qemu has fixed all these issues use no extra CFLAGS to
-configure qemu-xen.
-
-Signed-off-by: Olaf Hering <olaf@xxxxxxxxx>
-
-diff -r 56214b978466 -r 5bdbdcb03d60 tools/Makefile
---- a/tools/Makefile
-+++ b/tools/Makefile
-@@ -146,6 +146,7 @@
- 		source=.; \
- 	fi; \
- 	cd qemu-xen-dir; \
-+	env -u CFLAGS 
- 	$$source/configure --enable-xen --target-list=i386-softmmu \
- 		--source-path=$$source \
- 		--extra-cflags="-I$(XEN_ROOT)/tools/include \
-- 
1.8.4.rc3


