Return-Path: <stefan@agner.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 02AF9E00DA9; Fri, 20 Sep 2019 00:18:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [178.209.48.109 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 72373E00D60
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Sep 2019 00:18:14 -0700 (PDT)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id B59EB5C08A5;
	Fri, 20 Sep 2019 09:18:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1568963893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=QWak7V0j/uJbvTXj8Vb275mdp3UXGO9m82dDmd1cZpQ=;
	b=a7XavPOi8LZdqAt6Bmt3m5KtdYVNvcFVbiCkCKmkP6+o1LErBECspSR/lOElgqfRpmv6hN
	dQpGNWB2TGjPZOgEB96rH5eZBRe2e1H4RElzihbYOTT53iTE2ogYQJjUpXzTH6z9R/r8nb
	d1btsqlSB8Sfpgu0UjwEOUZsKXqHEb8=
From: Stefan Agner <stefan@agner.ch>
To: meta-virtualization@yoctoproject.org
Date: Fri, 20 Sep 2019 09:18:01 +0200
Message-Id: <20190920071807.13139-2-stefan@agner.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190920071807.13139-1-stefan@agner.ch>
References: <20190920071807.13139-1-stefan@agner.ch>
MIME-Version: 1.0
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH v2 1/7] conmon: initial add
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
X-List-Received-Date: Fri, 20 Sep 2019 07:18:16 -0000
Content-Transfer-Encoding: 8bit

From: Stefan Agner <stefan.agner@toradex.com>

Add conmon, a OCI container runtime monitor.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 recipes-containers/conmon/conmon_2.0.0.bb     | 30 ++++++++++++++++++
 ...ail-if-clean-is-called-without-a-bui.patch | 31 +++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 recipes-containers/conmon/conmon_2.0.0.bb
 create mode 100644 recipes-containers/conmon/files/0001-Makefile-don-t-fail-if-clean-is-called-without-a-bui.patch

diff --git a/recipes-containers/conmon/conmon_2.0.0.bb b/recipes-containers/conmon/conmon_2.0.0.bb
new file mode 100644
index 0000000..f4e2cd6
--- /dev/null
+++ b/recipes-containers/conmon/conmon_2.0.0.bb
@@ -0,0 +1,30 @@
+SUMMARY = "An OCI container runtime monitor"
+SECTION = "console/utils"
+HOMEPAGE = "https://github.com/containers/conmon"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=61af0b6932ea7b12fb9142721043bc77"
+
+DEPENDS = "glib-2.0"
+
+SRCREV = "e217fdff82e0b1a6184a28c43043a4065083407f"
+SRC_URI = "\
+    git://github.com/containers/conmon.git \
+    file://0001-Makefile-don-t-fail-if-clean-is-called-without-a-bui.patch \
+"
+
+SRC_URI[md5sum] = "5c711911d766d76813333c3812277574"
+SRC_URI[sha256sum] = "4c31278b2c03e5be5a696c3088bc86cf2557a70e00f697799c163aba18e3c40e"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig
+
+EXTRA_OEMAKE = "PREFIX=${prefix} BINDIR=${bindir} LIBEXECDIR=${libexecdir}"
+
+do_install() {
+    oe_runmake 'DESTDIR=${D}' install
+}
+
+FILES_${PN} += " \
+    ${bindir}/conmon \
+"
diff --git a/recipes-containers/conmon/files/0001-Makefile-don-t-fail-if-clean-is-called-without-a-bui.patch b/recipes-containers/conmon/files/0001-Makefile-don-t-fail-if-clean-is-called-without-a-bui.patch
new file mode 100644
index 0000000..8d2b473
--- /dev/null
+++ b/recipes-containers/conmon/files/0001-Makefile-don-t-fail-if-clean-is-called-without-a-bui.patch
@@ -0,0 +1,31 @@
+From 6ef63dfcc65d5401bc7cc7170d569cefcdadcb38 Mon Sep 17 00:00:00 2001
+From: Stefan Agner <stefan@agner.ch>
+Date: Fri, 30 Aug 2019 17:49:22 +0200
+Subject: [PATCH] Makefile: don't fail if clean is called without a build
+
+Do not fail when calling the clean target without building first.
+
+Upstream-Status: Backport
+
+Signed-off-by: Stefan Agner <stefan@agner.ch>
+---
+ Makefile | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index fb0e4fb..b525595 100644
+--- a/Makefile
++++ b/Makefile
+@@ -66,8 +66,7 @@ bin:
+ 
+ .PHONY: clean
+ clean:
+-	rm -f bin/conmon src/*.o
+-	rmdir bin
++	rm -rf bin/ src/*.o
+ 
+ .PHONY: install install.bin install.crio install.podman podman crio
+ install: install.bin
+-- 
+2.23.0
+
-- 
2.20.1


