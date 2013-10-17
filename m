Return-Path: <flihp@twobit.us>
Received: from www.twobit.us (www.twobit.us [50.19.210.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 75CBDE016D3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 17 Oct 2013 11:47:53 -0700 (PDT)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=longhaul.twobit.us)
	by www.twobit.us with esmtpsa (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.72) (envelope-from <flihp@twobit.us>)
	id 1VWsbw-0004rZ-CD; Thu, 17 Oct 2013 18:47:53 +0000
Received: from flihp by longhaul.twobit.us with local (Exim 4.80)
	(envelope-from <flihp@longhaul.twobit.us>)
	id 1VWsbo-0007uE-VD; Thu, 17 Oct 2013 18:47:44 +0000
From: flihp@twobit.us
To: meta-virtualization@yoctoproject.org
Date: Thu, 17 Oct 2013 18:47:34 +0000
Message-Id: <1382035656-30349-2-git-send-email-flihp@twobit.us>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1382035656-30349-1-git-send-email-flihp@twobit.us>
References: <1382035656-30349-1-git-send-email-flihp@twobit.us>
X-SA-Exim-Connect-IP: 76.24.20.220
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on www.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
X-SA-Exim-Version: 4.2.1 (built Mon, 22 Mar 2010 06:26:47 +0000)
X-SA-Exim-Scanned: Yes (on www.twobit.us)
Subject: [PATCH 1/3] xen: avoid installing flask policy file as '/boot'
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
X-List-Received-Date: Thu, 17 Oct 2013 18:47:53 -0000

From: Philip Tricca <flihp@twobit.us>

Upstream patch to fix race condition between creating /boot and
installing the XSM policy. Race would cause policy to be written
to /boot instead of into the /boot directory if it didn't already
exist.

Signed-off-by: Philip Tricca <flihp@twobit.us>
---
 ...lask-avoid-installing-policy-file-as-boot.patch |   26 ++++++++++++++++++++
 recipes-extended/xen/xen_4.3.0.bb                  |    5 +++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 recipes-extended/xen/xen-4.3.0/flask-avoid-installing-policy-file-as-boot.patch

diff --git a/recipes-extended/xen/xen-4.3.0/flask-avoid-installing-policy-file-as-boot.patch b/recipes-extended/xen/xen-4.3.0/flask-avoid-installing-policy-file-as-boot.patch
new file mode 100644
index 0000000..d980807
--- /dev/null
+++ b/recipes-extended/xen/xen-4.3.0/flask-avoid-installing-policy-file-as-boot.patch
@@ -0,0 +1,26 @@
+From 8bff3edead4318bfebc487f929f833d11922c238 Mon Sep 17 00:00:00 2001
+From: "Vadim A. Misbakh-Soloviov" <mva@mva.name>
+Date: Tue, 30 Jul 2013 16:34:38 +0400
+Subject: [PATCH] flask: avoid installing policy file as '/boot'
+
+Signed-off-by: Vadim A. Misbakh-Soloviov <mva@mva.name>
+Acked-by: Daniel De Graaf <dgdegra@tycho.nsa.gov>
+---
+ tools/flask/policy/Makefile |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/flask/policy/Makefile b/tools/flask/policy/Makefile
+index e666f3e..df1e8f3 100644
+--- a/tools/flask/policy/Makefile
++++ b/tools/flask/policy/Makefile
+@@ -103,6 +103,7 @@ POLICY_SECTIONS += $(USERS) $(CONSTRAINTS) $(ISID_DEFS)
+ all: $(POLICY_FILENAME)
+ 
+ install: $(POLICY_FILENAME)
++	$(INSTALL_DIR) $(POLICY_LOADPATH)
+ 	$(INSTALL_DATA) $^ $(POLICY_LOADPATH)
+ 
+ $(POLICY_FILENAME): policy.conf
+-- 
+1.7.10.4
+
diff --git a/recipes-extended/xen/xen_4.3.0.bb b/recipes-extended/xen/xen_4.3.0.bb
index e9a22cc..228f75f 100644
--- a/recipes-extended/xen/xen_4.3.0.bb
+++ b/recipes-extended/xen/xen_4.3.0.bb
@@ -6,7 +6,10 @@ PR = "r0"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e0f0f3ac55608719a82394cc353928df"
 
-SRC_URI = "http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz"
+SRC_URI = " \
+    http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \
+    file://flask-avoid-installing-policy-file-as-boot.patch \
+    "
 
 SRC_URI[md5sum] = "7b18cfb58f1ac2ce39cf35a1867f0c0a"
 SRC_URI[sha256sum] = "e1e9faabe4886e2227aacdbde74410653b233d66642ca1972a860cbec6439961"
-- 
1.7.10.4


