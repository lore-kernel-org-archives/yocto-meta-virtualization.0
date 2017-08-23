Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D2CC6E00CB4; Wed, 23 Aug 2017 14:43:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.83.67 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.83.67 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94E9DE00CA6
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Aug 2017 14:43:49 -0700 (PDT)
Received: by mail-pg0-f67.google.com with SMTP id u9so875818pgn.5
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Aug 2017 14:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hT/znuyOuxhqrg3MLxgOH22/KyUUx5v2QVC865pJVcE=;
	b=hyULEQkCr2J5VX9Hptv05YQmEzEkrp+3TtRN90q7sVq7CGmTNj+3bg9NOloxjlXEAb
	vsEU6KbJMDYOW+hhOYhE8Ngdyw6n83NXtz83npstN8dewsVrOWCyXrLNlxaCHyeQYZ5l
	TxZ4tunfHXDKv3qcC6JJxwy7y1hqXhVC3CMRVHftQcLtbVAkBNn703/kPx8Ui6tktRm+
	PbcFViSlox72YH/FLGCsKcnVjPOwDTXya/wVb0ogZFY+Qhcu7WZNhJ7DSSbGTUbF0i6h
	ERKaDg6uxVAKvj97EuyVWwTwp8+fxUlZuLoi9WTY1aErvyN+WN+1iiRD/xg6QFTqPxv1
	texg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hT/znuyOuxhqrg3MLxgOH22/KyUUx5v2QVC865pJVcE=;
	b=P+aiqJtyS67ZVWU/PfDjLk2+5w0RNpYgDa0TXAC8hHuryaSooeSnyxIYvoh/sK07xt
	kQFSdB43AqzbrwbCfkyMdX3c7opxvaWTXm3O5PKErDuyKqm26txLQK/xmXFAWXjwWvwL
	sw8BcR2rvTmGX8Wo/eQhZBZM3bXjA4p11kbc/XZSrdRhKHwAZmppPKdr8iyvgDVt9SN+
	mud7o0Pl/x+uvIEq/lIpUGjspdF6RVnNEFHw8Yk3hp1h4jMiV12lq/PL/U+J4A3bs1bP
	af5Jc7clMO0CENLRRP1SsGN0vdd9qU1PWrJtNExhOLcQgCyMMe9ns7nf2wnC43OnE5VH
	eGDQ==
X-Gm-Message-State: AHYfb5h4+Qa/+tLIPuv6l0rwVSjTF/IVA3pYjw/g5ys9O4Jku5LuOX9f
	cBj5NEmsAOqW2hRWHeg=
X-Received: by 10.98.100.204 with SMTP id y195mr4152419pfb.303.1503524628992; 
	Wed, 23 Aug 2017 14:43:48 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id j1sm4221243pgs.77.2017.08.23.14.43.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Aug 2017 14:43:48 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Wed, 23 Aug 2017 14:43:32 -0700
Message-Id: <1503524615-27663-2-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503524615-27663-1-git-send-email-christopher.w.clark@gmail.com>
References: <1503524615-27663-1-git-send-email-christopher.w.clark@gmail.com>
Cc: cardoe@gentoo.org
Subject: [PATCH v2 1/4] vgabios : extract biossums tool and build it separately, native
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
X-List-Received-Date: Wed, 23 Aug 2017 21:43:50 -0000

From: Christopher Clark <christopher.clark6@baesystems.com>

The biossums tool is used to generate the vgabios build product.

This patch:
* adds a separate recipe "biossums" for the tool
* makes the vgabios recipe depend upon biossums-native 
* makes the vgabios recipe use the native binary rather than a locally built one

The upstream source tarball contains binaries so these are removed
before compiling proceeds.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
v2: updated commit message to explain "clean" in compile step.
    also added code comment to explain "clean" in the recipe.
    removed 'PR' from the recipe.

 recipes-extended/vgabios/biossums_0.7a.bb | 37 +++++++++++++++++++++++++++++++
 recipes-extended/vgabios/vgabios_0.7a.bb  |  6 +++--
 2 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 recipes-extended/vgabios/biossums_0.7a.bb

diff --git a/recipes-extended/vgabios/biossums_0.7a.bb b/recipes-extended/vgabios/biossums_0.7a.bb
new file mode 100644
index 0000000..276d037
--- /dev/null
+++ b/recipes-extended/vgabios/biossums_0.7a.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "biossums tool for building Plex86/Bochs LGPL VGABios"
+HOMEPAGE = "http://www.nongnu.org/vgabios/"
+LICENSE = "LGPLv2.1"
+SECTION = "firmware"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=dcf3c825659e82539645da41a7908589"
+
+SRC_URI =  "http://savannah.gnu.org/download/vgabios/vgabios-${PV}.tgz"
+
+SRC_URI[md5sum] = "2c0fe5c0ca08082a9293e3a7b23dc900"
+SRC_URI[sha256sum] = "9d24c33d4bfb7831e2069cf3644936a53ef3de21d467872b54ce2ea30881b865"
+
+BBCLASSEXTEND = "native"
+
+FILES_${PN} = "${bindir}/biossums"
+
+S = "${WORKDIR}/vgabios-${PV}"
+
+do_configure() {
+    # Don't override the compiler or its flags:
+    sed 's,^CC,DISABLED_CC,' -i Makefile
+    sed 's,^CFLAGS,DISABLED_CFLAGS,' -i Makefile
+    # Supply the C flags to the compiler:
+    sed 's,-o biossums,$(CFLAGS) -o biossums,' -i Makefile
+}
+
+do_compile() {
+    # clean removes binaries distributed with source
+    oe_runmake clean
+    oe_runmake biossums
+}
+
+do_install() {
+    mkdir -p "${D}${bindir}"
+    install -m 0755 biossums "${D}${bindir}"
+}
diff --git a/recipes-extended/vgabios/vgabios_0.7a.bb b/recipes-extended/vgabios/vgabios_0.7a.bb
index 0ed8bb4..8c89041 100644
--- a/recipes-extended/vgabios/vgabios_0.7a.bb
+++ b/recipes-extended/vgabios/vgabios_0.7a.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.nongnu.org/vgabios/"
 LICENSE = "LGPLv2.1"
 SECTION = "firmware"
 
-DEPENDS = "dev86-native"
+DEPENDS = "dev86-native biossums-native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=dcf3c825659e82539645da41a7908589"
 
@@ -20,7 +20,9 @@ FILES_${PN}-dbg = "/usr/share/firmware/${PN}-${PV}*.debug.bin"
 S = "${WORKDIR}/${PN}-${PV}"
 
 do_configure() {
-    echo "Skip do_configure"
+    # Override to use the native-built biossums tool:
+    sed 's,./biossums,biossums,' -i Makefile
+    sed 's,$(CC) -o biossums biossums.c,touch biossums,' -i Makefile
 }
 
 do_install() {
-- 
2.1.4


