Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.22729.1591587742972405565
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 07 Jun 2020 20:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: qi.chen@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0583gKN5022609
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 7 Jun 2020 20:42:21 -0700 (PDT)
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Sun, 7 Jun 2020
 20:42:08 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][m-c-s][PATCH] meta-openstack: be compatible with dunfell
Date: Sun, 7 Jun 2020 20:42:08 -0700
Message-ID: <20200608034208.112106-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-openstack-aio-deploy/conf/layer.conf             | 2 +-
 meta-openstack-compute-deploy/conf/layer.conf         | 2 +-
 meta-openstack-compute-test-config/conf/layer.conf    | 2 +-
 meta-openstack-controller-deploy/conf/layer.conf      | 2 +-
 meta-openstack-controller-test-config/conf/layer.conf | 2 +-
 meta-openstack-qemu/conf/layer.conf                   | 2 +-
 meta-openstack-swift-deploy/conf/layer.conf           | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-openstack-aio-deploy/conf/layer.conf b/meta-openstack-aio-deploy/conf/layer.conf
index f3d2c5f2..c8bdaff5 100644
--- a/meta-openstack-aio-deploy/conf/layer.conf
+++ b/meta-openstack-aio-deploy/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "openstack-aio-deploy-layer"
 BBFILE_PATTERN_openstack-aio-deploy-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_openstack-aio-deploy-layer = "6"
-LAYERSERIES_COMPAT_openstack-aio-deploy-layer = "thud warrior zeus"
+LAYERSERIES_COMPAT_openstack-aio-deploy-layer = "thud warrior zeus dunfell"
 
 LAYERDEPENDS_openstack-aio-deploy-layer = " \
 	core \
diff --git a/meta-openstack-compute-deploy/conf/layer.conf b/meta-openstack-compute-deploy/conf/layer.conf
index e25cf3e0..3d700330 100644
--- a/meta-openstack-compute-deploy/conf/layer.conf
+++ b/meta-openstack-compute-deploy/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "openstack-compute-deploy-layer"
 BBFILE_PATTERN_openstack-compute-deploy-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_openstack-compute-deploy-layer = "6"
-LAYERSERIES_COMPAT_openstack-compute-deploy-layer = "thud warrior zeus"
+LAYERSERIES_COMPAT_openstack-compute-deploy-layer = "thud warrior zeus dunfell"
 
 LAYERDEPENDS_openstack-compute-deploy-layer = " \
 	core \
diff --git a/meta-openstack-compute-test-config/conf/layer.conf b/meta-openstack-compute-test-config/conf/layer.conf
index dfa5f31b..b082d609 100644
--- a/meta-openstack-compute-test-config/conf/layer.conf
+++ b/meta-openstack-compute-test-config/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "openstack-compute-test-config-layer"
 BBFILE_PATTERN_openstack-compute-test-config-layer := "^${LAYERDIR}/"
 # We want this layer to have higher priority than any other meta-openstack layers
 BBFILE_PRIORITY_openstack-compute-test-config-layer = "100"
-LAYERSERIES_COMPAT_openstack-compute-test-config-layer = "thud warrior zeus"
+LAYERSERIES_COMPAT_openstack-compute-test-config-layer = "thud warrior zeus dunfell"
 
 LAYERDEPENDS_openstack-compute-test-config-layer = " \
 	openstack-compute-deploy-layer \
diff --git a/meta-openstack-controller-deploy/conf/layer.conf b/meta-openstack-controller-deploy/conf/layer.conf
index e8be8321..e9786313 100644
--- a/meta-openstack-controller-deploy/conf/layer.conf
+++ b/meta-openstack-controller-deploy/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "openstack-controller-deploy-layer"
 BBFILE_PATTERN_openstack-controller-deploy-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_openstack-controller-deploy-layer = "6"
-LAYERSERIES_COMPAT_openstack-controller-deploy-layer = "thud warrior zeus"
+LAYERSERIES_COMPAT_openstack-controller-deploy-layer = "thud warrior zeus dunfell"
 
 LAYERDEPENDS_openstack-controller-deploy-layer = " \
 	core \
diff --git a/meta-openstack-controller-test-config/conf/layer.conf b/meta-openstack-controller-test-config/conf/layer.conf
index b81f21e0..695767d1 100644
--- a/meta-openstack-controller-test-config/conf/layer.conf
+++ b/meta-openstack-controller-test-config/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "openstack-controller-test-config-layer"
 BBFILE_PATTERN_openstack-controller-test-config-layer := "^${LAYERDIR}/"
 # We want this layer to have higher priority than any other meta-openstack layers
 BBFILE_PRIORITY_openstack-controller-test-config-layer = "100"
-LAYERSERIES_COMPAT_openstack-controller-test-config-layer = "thud warrior zeus"
+LAYERSERIES_COMPAT_openstack-controller-test-config-layer = "thud warrior zeus dunfell"
 
 LAYERDEPENDS_openstack-controller-test-config-layer = " \
 	openstack-controller-deploy-layer \
diff --git a/meta-openstack-qemu/conf/layer.conf b/meta-openstack-qemu/conf/layer.conf
index 98a35b40..8f6378d9 100644
--- a/meta-openstack-qemu/conf/layer.conf
+++ b/meta-openstack-qemu/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "openstack-qemu-layer"
 BBFILE_PATTERN_openstack-qemu-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_openstack-qemu-layer = "6"
-LAYERSERIES_COMPAT_openstack-qemu-layer = "thud warrior zeus"
+LAYERSERIES_COMPAT_openstack-qemu-layer = "thud warrior zeus dunfell"
 
 LAYERDEPENDS_openstack-qemu-layer = " \
 	core \
diff --git a/meta-openstack-swift-deploy/conf/layer.conf b/meta-openstack-swift-deploy/conf/layer.conf
index e9675e28..e48aa601 100644
--- a/meta-openstack-swift-deploy/conf/layer.conf
+++ b/meta-openstack-swift-deploy/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "openstack-swift-deploy-layer"
 BBFILE_PATTERN_openstack-swift-deploy-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_openstack-swift-deploy-layer = "6"
-LAYERSERIES_COMPAT_openstack-swift-deploy-layer = "thud warrior zeus"
+LAYERSERIES_COMPAT_openstack-swift-deploy-layer = "thud warrior zeus dunfell"
 
 LAYERDEPENDS_openstack-swift-deploy-layer = " \
 	core \
-- 
2.21.0

