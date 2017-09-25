Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2753AE00CD8; Mon, 25 Sep 2017 01:27:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F085CE00CBA
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Sep 2017 01:27:54 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v8P8Rr60028149
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Sep 2017 01:27:53 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 25 Sep 2017 01:27:52 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 25 Sep 2017 16:26:46 +0800
Message-ID: <20170925082648.4382-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH 1/3] sanity-bbappend.bbclass: add class for bbappend files checking
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
X-List-Received-Date: Mon, 25 Sep 2017 08:27:56 -0000
Content-Type: text/plain

Add a new class, sanity-bbappend.bbclass, to check for whether necessary
settings are available for bbappend files in this layer to be effective,
and warn users if not.

In addition, a variable SKIP_SANITY_BBAPPEND_CHECK is added to enable users
to explicitly skip the checking to avoid unwanted warnings.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 classes/sanity-bbappend.bbclass | 11 +++++++++++
 conf/layer.conf                 |  4 ++++
 2 files changed, 15 insertions(+)
 create mode 100644 classes/sanity-bbappend.bbclass

diff --git a/classes/sanity-bbappend.bbclass b/classes/sanity-bbappend.bbclass
new file mode 100644
index 0000000..22eef3f
--- /dev/null
+++ b/classes/sanity-bbappend.bbclass
@@ -0,0 +1,11 @@
+addhandler virt_bbappend_distrocheck
+virt_bbappend_distrocheck[eventmask] = "bb.event.ConfigParsed"
+python virt_bbappend_distrocheck() {
+    import oe
+    skip_check = e.data.getVar('SKIP_SANITY_BBAPPEND_CHECK') == "1"
+    if 'virtualization' not in e.data.getVar('DISTRO_FEATURES').split() and not skip_check:
+        bb.warn("You have included the meta-virtualization layer, but \
+'virtualization' has not been enabled in your DISTRO_FEATURES. Some bbappend files \
+may not take effect. See the meta-virtualization README for details on enabling \
+virtualization support.")
+}
diff --git a/conf/layer.conf b/conf/layer.conf
index be08a98..341ad38 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -22,3 +22,7 @@ require conf/distro/include/virt_security_flags.inc
 
 PREFERRED_PROVIDER_virtual/runc ?= "runc-docker"
 PREFERRED_PROVIDER_virtual/containerd ?= "containerd-docker"
+
+# Sanity check for application of bbappend files.
+# Setting SKIP_SANITY_BBAPPEND_CHECK to "1" would skip the check.
+INHERIT += "sanity-bbappend"
-- 
2.11.0


