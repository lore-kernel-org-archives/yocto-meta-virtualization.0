Return-Path: <Mingli.Yu@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 07E5BE00AB9; Wed, 10 Oct 2018 20:50:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 80D61E00718
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Oct 2018 20:50:22 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9B3oLVl017544
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 Oct 2018 20:50:21 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 10 Oct 2018 20:50:20 -0700
From: <mingli.yu@windriver.com>
To: <bruce.ashfield@gmail.com>, <meta-virtualization@yoctoproject.org>
Date: Thu, 11 Oct 2018 11:50:17 +0800
Message-ID: <1539229819-322989-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-openstack][PATCH 1/3] sanity-meta-openstack.bbclass: add class for bbappend files checking
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
X-List-Received-Date: Thu, 11 Oct 2018 03:50:24 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Add a new class sanity-meta-openstack.bbclass,
to check whether necessary settings are available
for bbappend files and preferred version setting
in this layer to be effective and warn users if not.

In addition, a variable SKIP_SANITY_META_OPENSTACK_CHECK
is added to enable users to explicitly skip the
checking to avoid unwanted warnings.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-openstack/README                                | 19 +++++++++++++++++++
 meta-openstack/classes/sanity-meta-openstack.bbclass | 10 ++++++++++
 meta-openstack/conf/layer.conf                       |  4 ++++
 3 files changed, 33 insertions(+)
 create mode 100644 meta-openstack/classes/sanity-meta-openstack.bbclass

diff --git a/meta-openstack/README b/meta-openstack/README
index 81b843b..8506250 100644
--- a/meta-openstack/README
+++ b/meta-openstack/README
@@ -5,6 +5,25 @@ This layer provides support for building the packages from the OpenStack project
 The layer contains recipes for the nova, glance, keystone, cinder, quantum, swift
 and horizon components.
 
+The bbappend files for some recipes (e.g. postgresql) and preferred version setting
+(e.g. python-networkx)in this layer need to have 'openstack' in DISTRO_FEATURES to
+have effect. To enable them, add in configuration file the following line.
+
+  DISTRO_FEATURES_append = " openstack"
+
+If meta-openstack is included, but openstack is not enabled as a
+distro feature a warning is printed at parse time:
+
+    You have included the meta-openstack layer, but
+    'openstack' has not been enabled in your DISTRO_FEATURES. Some bbappend files
+    and preferred version setting may not take effect. See the meta-openstack README
+    for details on enabling openstack support.
+
+If you know what you are doing, this warning can be disabled by setting the following
+variable in your configuration:
+
+  SKIP_META_OPENSTACK_SANITY_CHECK = 1
+
 Dependencies
 ------------
 
diff --git a/meta-openstack/classes/sanity-meta-openstack.bbclass b/meta-openstack/classes/sanity-meta-openstack.bbclass
new file mode 100644
index 0000000..3d5e57b
--- /dev/null
+++ b/meta-openstack/classes/sanity-meta-openstack.bbclass
@@ -0,0 +1,10 @@
+addhandler openstack_bbappend_distrocheck
+openstack_bbappend_distrocheck[eventmask] = "bb.event.SanityCheck"
+python openstack_bbappend_distrocheck() {
+    skip_check = e.data.getVar('SKIP_META_OPENSTACK_SANITY_CHECK') == "1"
+    if 'openstack' not in e.data.getVar('DISTRO_FEATURES').split() and not skip_check:
+        bb.warn("You have included the meta-openstack layer, but \
+'openstack' has not been enabled in your DISTRO_FEATURES. Some bbappend files \
+and preferred version setting may not take effect. See the meta-openstack README \
+for details on enabling openstack support.")
+}
diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
index 126f37f..f322bcd 100644
--- a/meta-openstack/conf/layer.conf
+++ b/meta-openstack/conf/layer.conf
@@ -35,5 +35,9 @@ PREFERRED_VERSION_python-jsonschema = "2.6.0"
 PREFERRED_VERSION_python-networkx = "1.11"
 PREFERRED_VERSION_python-oslo.i18n = "3.17.0+gitAUTOINC+f2729cd36f"
 
+# Sanity check for meta-openstack layer.
+# Setting SKIP_META_OPENSTACK_SANITY_CHECK to "1" would skip the bbappend files check.
+INHERIT += "sanity-meta-openstack"
+
 LICENSE_PATH += "${LAYERDIR}/licenses"
 LAYERRECOMMENDS_openstack-layer = "meta-openstack-dl (= 2.6)"
-- 
2.7.4


