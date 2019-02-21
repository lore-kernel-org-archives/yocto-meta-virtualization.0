Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 79227E00BB7; Wed, 20 Feb 2019 16:52:17 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.166.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 43D70E00B5C
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Feb 2019 16:52:15 -0800 (PST)
Received: by mail-it1-f194.google.com with SMTP id g137so7969792ita.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Feb 2019 16:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=I64mNL1Fk9tB2bcRoSFYFMI08LIm2xKAjMCfJo2ovPU=;
	b=kdJPLYsEiWLyH14wBadkCFkeGlg+3OXIv8xkP3zrkyvArqT1KQ0GO2ZXLzUUWTVaPV
	/r8aajelz4sEKZyVqeakAo+OG5hGFdN7PkJm4+J+TBl6ECoSqJxrjX1bjQl8uhqKZUON
	z3RCFn9Y7NBy6fDFawsGn++4sZshR4XMjFpZ2Mk2rBvc+R0ursKnAn1UNQBK6imElUN+
	v77yGQjRjoyJw7S/kS4QoSDbg/721zwAO6VOalzKwz/MxfFctaCATq42uiCrmkXRoUIV
	7f92kImqC60vTU+Ux7VIT3E7aQnJE+ogzpotrGVMY1JZcDTMV0ER6W45lPHs6VkXo4Mt
	T/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=I64mNL1Fk9tB2bcRoSFYFMI08LIm2xKAjMCfJo2ovPU=;
	b=LuWlTwOa/5sPdMsS5PQq5m/fmh/m6j2TYQZ8EYclJD4P9F2kOFxlrHIuQDMeL8Q8I+
	u3eVRf/HReGYNryvmWF+bADx3quUDKwoy18trX7cDGoDR1nrbbAMrJDMvuAvM1bS3K42
	TWJKTrVN2tv0NrOAYkLXqd8TXZ6NzQm35kf6j2dZxAJ+q7lVogk3Q7TfbsJOr59kKGTF
	hGTmkSK1y3Ky9jxW7uyChV671cJr8yeOC97T/pme1+0N4u41AWn3apv7T+m94w/iMSeP
	cfwu1/gD9L1gqtOuSKUiCUkTyTrbpvv6H3R4s04Gvuc3sM+ss0q+NSXYbY7881a32ZUJ
	s+sw==
X-Gm-Message-State: AHQUAubJ3Or/y8KMCwxSa8g/jF2HL0fGGTPHauZO3UyU0ECxAEk4BvMg
	k0NxWxuJob12Uf+fK/j3fAM9M++E
X-Google-Smtp-Source: AHgI3IaZd2rzMLNYVxh5fQ72NUQ8KBkhIYtuaGwF3+ei/doPTxm6J8N0F7jPmWFc7gtMLLAbeJsXEA==
X-Received: by 2002:a02:117:: with SMTP id c23mr20198390jad.71.1550710335005; 
	Wed, 20 Feb 2019 16:52:15 -0800 (PST)
Received: from desktop.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	u126sm3218407ita.1.2019.02.20.16.52.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 16:52:13 -0800 (PST)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Wed, 20 Feb 2019 16:52:03 -0800
Message-Id: <20190221005203.29272-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] ipxe: Uprev and fix host compiler and linker flags.
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
X-List-Received-Date: Thu, 21 Feb 2019 00:52:17 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

Adds patch to fix detection of the "no-pie" vs "nopie" flag, which needs
to be performed for both the host and target compilers; cannot assume
that one works for the other.

Use EXTRA_HOST_CFLAGS and EXTRA_HOST_LDFLAGS variables for passing
the host tool build parameters: BUILD_CFLAGS and BUILD_LDFLAGS.

Drop unneeded 'NO_WERROR=1' from the recipe and rewrap line.

Uprev commit to latest git revision.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 .../files/ipxe-fix-hostcc-nopie-cflags.patch  | 68 +++++++++++++++++++
 recipes-extended/ipxe/ipxe_git.bb             | 15 +++-
 2 files changed, 80 insertions(+), 3 deletions(-)
 create mode 100644 recipes-extended/ipxe/files/ipxe-fix-hostcc-nopie-cflags.patch

diff --git a/recipes-extended/ipxe/files/ipxe-fix-hostcc-nopie-cflags.patch b/recipes-extended/ipxe/files/ipxe-fix-hostcc-nopie-cflags.patch
new file mode 100644
index 0000000..da154a6
--- /dev/null
+++ b/recipes-extended/ipxe/files/ipxe-fix-hostcc-nopie-cflags.patch
@@ -0,0 +1,68 @@
+Fix detection of host compiler "no-pie"/"nopie" and link flags.
+
+Detection of the "no-pie" vs "nopie" flag needs to be performed for both
+the host and target compilers; cannot assume that one works for the other.
+
+Use EXTRA_HOST_CFLAGS and EXTRA_HOST_LDFLAGS variables for passing
+host tool parameters if required. Removes previous hardcoded "-O2 -g".
+
+Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
+diff --git a/Makefile.housekeeping b/Makefile.housekeeping
+index f833492..5451c39 100644
+--- a/Makefile.housekeeping
++++ b/Makefile.housekeeping
+@@ -133,6 +133,7 @@ eval :
+ WORKAROUND_CFLAGS :=
+ WORKAROUND_ASFLAGS :=
+ WORKAROUND_LDFLAGS :=
++WORKAROUND_HOST_CFLAGS :=
+ 
+ # Make syntax does not allow use of comma or space in certain places.
+ # This ugly workaround is suggested in the manual.
+@@ -445,7 +446,7 @@ endif
+ CFLAGS		+= $(WORKAROUND_CFLAGS) $(EXTRA_CFLAGS)
+ ASFLAGS		+= $(WORKAROUND_ASFLAGS) $(EXTRA_ASFLAGS)
+ LDFLAGS		+= $(WORKAROUND_LDFLAGS) $(EXTRA_LDFLAGS)
+-HOST_CFLAGS	+= $(WORKAROUND_CFLAGS) -O2 -g
++HOST_CFLAGS	+= $(WORKAROUND_HOST_CFLAGS) $(EXTRA_HOST_CFLAGS)
+ 
+ # Inhibit -Werror if NO_WERROR is specified on make command line
+ #
+@@ -1375,7 +1376,7 @@ endif # defined(BIN)
+ # The compression utilities
+ #
+ 
+-ZBIN_LDFLAGS := -llzma
++ZBIN_LDFLAGS := -llzma $(EXTRA_HOST_LDFLAGS)
+ 
+ $(ZBIN) : util/zbin.c $(MAKEDEPS)
+ 	$(QM)$(ECHO) "  [HOSTCC] $@"
+diff --git a/arch/i386/Makefile b/arch/i386/Makefile
+index b7c2792..4a637ad 100644
+--- a/arch/i386/Makefile
++++ b/arch/i386/Makefile
+@@ -78,11 +78,20 @@ CFLAGS			+= -Ui386
+ # -nopie.  We therefore test for both.
+ #
+ ifeq ($(CCTYPE),gcc)
+-PIE_TEST = [ -z "`$(CC) -fno-PIE -no-pie -x c -c /dev/null -o /dev/null 2>&1`" ]
+-PIE_FLAGS := $(shell $(PIE_TEST) && $(ECHO) '-fno-PIE -no-pie')
+-PIE_TEST2 = [ -z "`$(CC) -fno-PIE -nopie -x c -c /dev/null -o /dev/null 2>&1`" ]
++PIE_TEST1_FLAGS = "-fno-PIE -no-pie -x c -c /dev/null -o /dev/null 2>&1"
++PIE_TEST2_FLAGS = "-fno-PIE -nopie -x c -c /dev/null -o /dev/null 2>&1"
++
++PIE_TEST1 = [ -z "`$(CC) "$(PIE_TEST1_FLAGS)"`" ]
++PIE_TEST2 = [ -z "`$(CC) "$(PIE_TEST2_FLAGS)"`" ]
++PIE_FLAGS1 := $(shell $(PIE_TEST1) && $(ECHO) '-fno-PIE -no-pie')
+ PIE_FLAGS2 := $(shell $(PIE_TEST2) && $(ECHO) '-fno-PIE -nopie')
+-WORKAROUND_CFLAGS += $(PIE_FLAGS) $(PIE_FLAGS2)
++WORKAROUND_CFLAGS += $(PIE_FLAGS1) $(PIE_FLAGS2)
++
++HOST_PIE_TEST1 = [ -z "`$(HOSTCC) "$(PIE_TEST1_FLAGS)"`" ]
++HOST_PIE_TEST2 = [ -z "`$(HOSTCC) "$(PIE_TEST2_FLAGS)"`" ]
++HOST_PIE_FLAGS1 := $(shell $(HOST_PIE_TEST1) && $(ECHO) '-fno-PIE -no-pie')
++HOST_PIE_FLAGS2 := $(shell $(HOST_PIE_TEST2) && $(ECHO) '-fno-PIE -nopie')
++WORKAROUND_HOST_CFLAGS += $(HOST_PIE_FLAGS1) $(HOST_PIE_FLAGS2)
+ endif
+ 
+ # i386-specific directories containing source files
diff --git a/recipes-extended/ipxe/ipxe_git.bb b/recipes-extended/ipxe/ipxe_git.bb
index 18c92d2..1de0f21 100644
--- a/recipes-extended/ipxe/ipxe_git.bb
+++ b/recipes-extended/ipxe/ipxe_git.bb
@@ -4,15 +4,24 @@ LICENSE = "GPLv2"
 DEPENDS = "binutils-native perl-native syslinux mtools-native cdrtools-native xz"
 LIC_FILES_CHKSUM = "file://../COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "133f4c47baef6002b2ccb4904a035cda2303c6e5"
+SRCREV = "64b4452bca04af433f1c98ab782c0e93cd5c88c0"
 PV = "gitr${SRCPV}"
 PR = "r0"
 
-SRC_URI = "git://git.ipxe.org/ipxe.git;protocol=https"
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+SRC_URI = " \
+    git://git.ipxe.org/ipxe.git;protocol=https \
+    file://ipxe-fix-hostcc-nopie-cflags.patch \
+    "
 
 FILES_${PN} = "/usr/share/firmware/*.rom"
 
-EXTRA_OEMAKE = "NO_WERROR=1 ISOLINUX_BIN="${STAGING_DIR_TARGET}/usr/share/syslinux/isolinux.bin" CROSS_COMPILE="${TARGET_PREFIX}""
+EXTRA_OEMAKE = " \
+    ISOLINUX_BIN="${STAGING_DIR_TARGET}/usr/share/syslinux/isolinux.bin" \
+    CROSS_COMPILE="${TARGET_PREFIX}" \
+    EXTRA_HOST_CFLAGS="${BUILD_CFLAGS}" \
+    EXTRA_HOST_LDFLAGS="${BUILD_LDFLAGS}""
 
 S = "${WORKDIR}/git/src"
 
-- 
2.17.1


