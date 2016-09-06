Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8FB63E00DC2; Tue,  6 Sep 2016 11:51:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [178.209.48.109 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0F088E00CD5
	for <meta-virtualization@yoctoproject.org>;
	Tue,  6 Sep 2016 11:51:23 -0700 (PDT)
Received: from seahawk.toradex.int
	(75-146-58-181-Washington.hfc.comcastbusiness.net [75.146.58.181])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 8EAD85C0C2C;
	Tue,  6 Sep 2016 20:46:10 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: meta-virtualization@yoctoproject.org
Date: Tue,  6 Sep 2016 11:51:40 -0700
Message-Id: <1473187900-1335-1-git-send-email-stefan@agner.ch>
X-Mailer: git-send-email 1.9.1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1473187571; bh=4VUhoMQ2hQic5cRkBdgzniGQ4NxM3y8sImn9I8H8SgQ=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=HvG7Rnxnnb8AJrxdx1rP1URdQncWFJ1XL0KXYiQmluW02Xgz+RYBzgt1Ubb8dq8Rg4xmIz3lPoCTvH+07yO6X6q5erQ9tQ6/qpQB7W1ftIoc8E5TK1CgJwrZulgKnt2btK5ig0ha+psOsfDCiD7AmDo2EOcTWSEG0KyJo/s1Q/4=
Subject: [PATCH] kvmtool: add lightweight hypervisor native Linux KVM tool
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
X-List-Received-Date: Tue, 06 Sep 2016 18:51:25 -0000

Add Native Linux KVM tool, a lightweight tool for hosting KVM guests
maintained by the Linux kernel community.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 .../kvmtool/files/external-crosscompiler.patch     | 31 ++++++++++++++++++++++
 recipes-extended/kvmtool/kvmtool.bb                | 23 ++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 recipes-extended/kvmtool/files/external-crosscompiler.patch
 create mode 100644 recipes-extended/kvmtool/kvmtool.bb

diff --git a/recipes-extended/kvmtool/files/external-crosscompiler.patch b/recipes-extended/kvmtool/files/external-crosscompiler.patch
new file mode 100644
index 0000000..75cef3b
--- /dev/null
+++ b/recipes-extended/kvmtool/files/external-crosscompiler.patch
@@ -0,0 +1,31 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+This allows OpenEmbedded to pass in cross compiler configuration using
+the default envirnment variables. It is required so that kvmtool can
+be linked against the cross-compiled libfdt library.
+
+diff --git a/Makefile b/Makefile
+index 1f0196f..8bfb068 100644
+--- a/Makefile
++++ b/Makefile
+@@ -14,11 +14,6 @@ export E Q
+ include config/utilities.mak
+ include config/feature-tests.mak
+ 
+-CC	:= $(CROSS_COMPILE)gcc
+-CFLAGS	:=
+-LD	:= $(CROSS_COMPILE)ld
+-LDFLAGS	:=
+-
+ FIND	:= find
+ CSCOPE	:= cscope
+ TAGS	:= ctags
+@@ -297,7 +292,7 @@ $(warning No static libc found. Skipping guest init)
+ endif
+ 
+ ifeq (y,$(ARCH_WANT_LIBFDT))
+-	ifneq ($(call try-build,$(SOURCE_LIBFDT),$(CFLAGS),-lfdt),y)
++	ifneq ($(call try-build,$(SOURCE_LIBFDT),$(CPPFLAGS) $(CFLAGS),-lfdt),y)
+           $(error No libfdt found. Please install libfdt-dev package)
+ 	else
+ 		CFLAGS_DYNOPT	+= -DCONFIG_HAS_LIBFDT
diff --git a/recipes-extended/kvmtool/kvmtool.bb b/recipes-extended/kvmtool/kvmtool.bb
new file mode 100644
index 0000000..3f299dd
--- /dev/null
+++ b/recipes-extended/kvmtool/kvmtool.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Native Linux KVM tool"
+DESCRIPTION = "kvmtool is a lightweight tool for hosting KVM guests."
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
+
+DEPENDS = "dtc libaio zlib"
+
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git \
+           file://external-crosscompiler.patch \
+    "
+
+SRCREV = "0093df80d754e1a05b016e5a4ccd4b51a00c562c"
+PV = "3.18.0+git${SRCREV}"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE='ARCH="${TARGET_ARCH}" V=1'
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${S}/lkvm ${D}${bindir}/
+}
-- 
1.9.1


