Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D475CE00B4C; Wed, 19 Sep 2018 13:58:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15653E00708
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Sep 2018 13:58:10 -0700 (PDT)
Received: by mail-pg1-f193.google.com with SMTP id 205-v6so2365031pgd.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Sep 2018 13:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=KeH/OWhcR05U2MNCMQQYetJcmWmCmgr5px1L5a6KMX0=;
	b=GXdy24fign3DZtD0G+2lrbT/AcDzsnrJdhtXL2B4uqQ0OA3c/0Xx2oJHawqIXTtpcG
	ZnK3B3hB4ZF7Z6ULC/jxHtEpY/dQC60RW+Yhz7/JgGjTITr677ZxGPbSdhf+hdVrqFix
	0TiQiBTNZhtu18bajoJgbHGooZ1aUYc5EHQ4rzgbjMT8lM4qnpz5suJcycGgl0g0eBUB
	dHhgM+zQDcvFQ2y5X92N/DjMJUsHNOoPKJoRKO1uOt3hXhRtcZhBwsV0hAkkOBVI75SV
	ABedmyb4xvwM94GU2uYAKSOBdphPGWtI9C9zHL9qS0cyWg/36IRilQDGYNvl49BNNvej
	6dCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KeH/OWhcR05U2MNCMQQYetJcmWmCmgr5px1L5a6KMX0=;
	b=q8JWOInzoVw0F5DAXUHrx5Xoh5wj83mBN7P+XCxF2uHN1M9qri7eAfpnHSbSMVSlJd
	Ztsx95H0trYhgMr8T3Uq4Ap0tO+5ijAfhUat9+m6PreHd6IR8aKf4w+dxkgPk8Z63t07
	hrtUbcl+OCsBCQtXGrEuAFKenD7j5oxQQsWcFzAj36Kj7HuyPjaKR0y1mDW4NNncTiM9
	mRNcyHcdcM33uQ+sBWU3bR2OpCoQ/6MwmOYzunwEgXvGt5wBzbsl10LHkMEKw/9/zX8H
	smuyeqshJ3ZyLtQyhf73Ga5u4Chzi/nbeDrDwKoP1chVQJ3LF5hNFEg4hZg+JZCqfkui
	m7Zw==
X-Gm-Message-State: APzg51AofVD168s2oQmnpLhPYKIWNQLge9fWsYmAxU4ayGFO5poknPzf
	amtUA43AG/o7vzmYBd5iKTWQEC0O
X-Google-Smtp-Source: ANB0VdaVQFEU0xxmUeHF3Ova4wbXxX/j+xHyrOS7g3sn6u2wcyrqtAuiKBGKpfB01N1Z8w7iavDeVA==
X-Received: by 2002:a65:41c6:: with SMTP id
	b6-v6mr34183101pgq.174.1537390689966; 
	Wed, 19 Sep 2018 13:58:09 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	r18-v6sm26324825pgj.51.2018.09.19.13.58.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 19 Sep 2018 13:58:08 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Wed, 19 Sep 2018 13:57:55 -0700
Message-Id: <1537390675-29637-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] seabios: update to 1.11.2 and use github for SRC_URI
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
X-List-Received-Date: Wed, 19 Sep 2018 20:58:11 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

Update to version 1.11.2 fixes compile errors encountered with 1.9.1.

Use the official QEMU github mirror of git.qemu.org/seabios as
a stable, maintained, available SRC_URI for seabios releases.

While downloads.seabios.org is documented as the official source,
it has not published tarballs for the most recent releases.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---

The prior version 1.9.1 was failing to build with current master of OE:

| src/stacks.c: Assembler messages:
| src/stacks.c:567: Error: found '(', expected: ')'
| src/stacks.c:567: Error: junk `(%ebp))' after expression
| src/stacks.c:568: Warning: indirect call without `*'
| Makefile:133: recipe for target 'out/src/stacks.o' failed
| make: *** [out/src/stacks.o] Error 1

 recipes-extended/seabios/seabios_1.11.2.bb | 44 ++++++++++++++++++++++++++++++
 recipes-extended/seabios/seabios_1.9.1.bb  | 43 -----------------------------
 2 files changed, 44 insertions(+), 43 deletions(-)
 create mode 100644 recipes-extended/seabios/seabios_1.11.2.bb
 delete mode 100644 recipes-extended/seabios/seabios_1.9.1.bb

diff --git a/recipes-extended/seabios/seabios_1.11.2.bb b/recipes-extended/seabios/seabios_1.11.2.bb
new file mode 100644
index 0000000..4ea9eb7
--- /dev/null
+++ b/recipes-extended/seabios/seabios_1.11.2.bb
@@ -0,0 +1,44 @@
+DESCRIPTION = "SeaBIOS"
+HOMEPAGE = "http://www.coreboot.org/SeaBIOS"
+LICENSE = "LGPLv3"
+SECTION = "firmware"
+
+SRC_URI = " \
+    https://github.com/qemu/seabios/archive/rel-${PV}.tar.gz \
+    file://hostcc.patch \
+    "
+S = "${WORKDIR}/${PN}-rel-${PV}"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504         \
+                    file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6  \
+                    "
+
+SRC_URI[md5sum] = "3f78065837dbd8873513a1b7d5276e78"
+SRC_URI[sha256sum] = "73e73c8e406d97265782f6c942b3c1d178ed4f4afc9f381b22336c3968291693"
+
+FILES_${PN} = "/usr/share/firmware"
+
+DEPENDS = "util-linux-native file-native bison-native flex-native gettext-native iasl-native python-native"
+
+TUNE_CCARGS = ""
+EXTRA_OEMAKE += "HOSTCC='${BUILD_CC}'"
+EXTRA_OEMAKE += "CROSS_PREFIX=${TARGET_PREFIX}"
+
+COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
+
+do_configure() {
+    oe_runmake defconfig
+}
+
+do_compile() {
+    unset CPP
+    unset CPPFLAGS
+    oe_runmake
+}
+
+do_install() {
+    oe_runmake
+    install -d ${D}/usr/share/firmware
+    install -m 0644 out/bios.bin ${D}/usr/share/firmware/
+}
+
diff --git a/recipes-extended/seabios/seabios_1.9.1.bb b/recipes-extended/seabios/seabios_1.9.1.bb
deleted file mode 100644
index 77e8f34..0000000
--- a/recipes-extended/seabios/seabios_1.9.1.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-DESCRIPTION = "SeaBIOS"
-HOMEPAGE = "http://www.coreboot.org/SeaBIOS"
-LICENSE = "LGPLv3"
-SECTION = "firmware"
-
-SRC_URI = " \
-    https://www.seabios.org/downloads/${PN}-${PV}.tar.gz \
-    file://hostcc.patch \
-    "
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504         \
-                    file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6  \
-                    "
-
-SRC_URI[md5sum] = "e21b6f3e54d492be837ef20d66617f81"
-SRC_URI[sha256sum] = "8a2a562fe5cfd37fe8327cdc4a60accdfe441e235b29e6999fdeb442ba98d608"
-
-FILES_${PN} = "/usr/share/firmware"
-
-DEPENDS = "util-linux-native file-native bison-native flex-native gettext-native iasl-native python-native"
-
-TUNE_CCARGS = ""
-EXTRA_OEMAKE += "HOSTCC='${BUILD_CC}'"
-EXTRA_OEMAKE += "CROSS_PREFIX=${TARGET_PREFIX}"
-
-COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
-
-do_configure() {
-    oe_runmake defconfig
-}
-
-do_compile() {
-    unset CPP
-    unset CPPFLAGS
-    oe_runmake
-}
-
-do_install() {
-    oe_runmake
-    install -d ${D}/usr/share/firmware
-    install -m 0644 out/bios.bin ${D}/usr/share/firmware/
-}
-
-- 
2.7.4


