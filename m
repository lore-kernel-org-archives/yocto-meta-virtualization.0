Return-Path: <Hongxu.Jia@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4FA92E00920; Sun,  7 Oct 2018 19:58:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C5150E00826
	for <meta-virtualization@yoctoproject.org>;
	Sun,  7 Oct 2018 19:58:57 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w982w8HF011033
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sun, 7 Oct 2018 19:58:47 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sun, 7 Oct 2018 19:58:24 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Mon, 8 Oct 2018 11:07:47 +0800
Message-ID: <1538968067-28655-3-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1538968067-28655-1-git-send-email-hongxu.jia@windriver.com>
References: <1538968067-28655-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 3/3] layer.conf: Add thud to LAYERSERIES_COMPAT
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
X-List-Received-Date: Mon, 08 Oct 2018 02:58:58 -0000
Content-Type: text/plain

Since `9ec5a8a layer.conf: Drop sumo from LAYERSERIES_CORENAMES' and
`9867924 layer.conf: Add thud to LAYERSERIES_CORENAMES' applied in oe-core,
add thud to LAYERSERIES_COMPAT

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-openstack-aio-deploy/conf/layer.conf             | 2 +-
 meta-openstack-compute-deploy/conf/layer.conf         | 2 +-
 meta-openstack-compute-test-config/conf/layer.conf    | 2 +-
 meta-openstack-controller-deploy/conf/layer.conf      | 2 +-
 meta-openstack-controller-test-config/conf/layer.conf | 2 +-
 meta-openstack-qemu/conf/layer.conf                   | 2 +-
 meta-openstack-swift-deploy/conf/layer.conf           | 2 +-
 meta-openstack/conf/layer.conf                        | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-openstack-aio-deploy/conf/layer.conf b/meta-openstack-aio-deploy/conf/layer.conf
index 46622a6..89fede8 100644
--- a/meta-openstack-aio-deploy/conf/layer.conf
+++ b/meta-openstack-aio-deploy/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "openstack-aio-deploy-layer"
 BBFILE_PATTERN_openstack-aio-deploy-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_openstack-aio-deploy-layer = "6"
-LAYERSERIES_COMPAT_openstack-aio-deploy-layer = "sumo"
+LAYERSERIES_COMPAT_openstack-aio-deploy-layer = "sumo thud"
 
 LAYERDEPENDS_openstack-aio-deploy-layer = " \
 	core \
diff --git a/meta-openstack-compute-deploy/conf/layer.conf b/meta-openstack-compute-deploy/conf/layer.conf
index e2192a1..999e95e 100644
--- a/meta-openstack-compute-deploy/conf/layer.conf
+++ b/meta-openstack-compute-deploy/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "openstack-compute-deploy-layer"
 BBFILE_PATTERN_openstack-compute-deploy-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_openstack-compute-deploy-layer = "6"
-LAYERSERIES_COMPAT_openstack-compute-deploy-layer = "sumo"
+LAYERSERIES_COMPAT_openstack-compute-deploy-layer = "sumo thud"
 
 LAYERDEPENDS_openstack-compute-deploy-layer = " \
 	core \
diff --git a/meta-openstack-compute-test-config/conf/layer.conf b/meta-openstack-compute-test-config/conf/layer.conf
index 7fca615..a8c69d7 100644
--- a/meta-openstack-compute-test-config/conf/layer.conf
+++ b/meta-openstack-compute-test-config/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "openstack-compute-test-config-layer"
 BBFILE_PATTERN_openstack-compute-test-config-layer := "^${LAYERDIR}/"
 # We want this layer to have higher priority than any other meta-openstack layers
 BBFILE_PRIORITY_openstack-compute-test-config-layer = "100"
-LAYERSERIES_COMPAT_openstack-compute-test-config-layer = "sumo"
+LAYERSERIES_COMPAT_openstack-compute-test-config-layer = "sumo thud"
 
 LAYERDEPENDS_openstack-compute-test-config-layer = " \
 	openstack-compute-deploy-layer \
diff --git a/meta-openstack-controller-deploy/conf/layer.conf b/meta-openstack-controller-deploy/conf/layer.conf
index 73ac493..51f510f 100644
--- a/meta-openstack-controller-deploy/conf/layer.conf
+++ b/meta-openstack-controller-deploy/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "openstack-controller-deploy-layer"
 BBFILE_PATTERN_openstack-controller-deploy-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_openstack-controller-deploy-layer = "6"
-LAYERSERIES_COMPAT_openstack-controller-deploy-layer = "sumo"
+LAYERSERIES_COMPAT_openstack-controller-deploy-layer = "sumo thud"
 
 LAYERDEPENDS_openstack-controller-deploy-layer = " \
 	core \
diff --git a/meta-openstack-controller-test-config/conf/layer.conf b/meta-openstack-controller-test-config/conf/layer.conf
index 3734375..507b1ed 100644
--- a/meta-openstack-controller-test-config/conf/layer.conf
+++ b/meta-openstack-controller-test-config/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "openstack-controller-test-config-layer"
 BBFILE_PATTERN_openstack-controller-test-config-layer := "^${LAYERDIR}/"
 # We want this layer to have higher priority than any other meta-openstack layers
 BBFILE_PRIORITY_openstack-controller-test-config-layer = "100"
-LAYERSERIES_COMPAT_openstack-controller-test-config-layer = "sumo"
+LAYERSERIES_COMPAT_openstack-controller-test-config-layer = "sumo thud"
 
 LAYERDEPENDS_openstack-controller-test-config-layer = " \
 	openstack-controller-deploy-layer \
diff --git a/meta-openstack-qemu/conf/layer.conf b/meta-openstack-qemu/conf/layer.conf
index d3ddf82..9addb4a 100644
--- a/meta-openstack-qemu/conf/layer.conf
+++ b/meta-openstack-qemu/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "openstack-qemu-layer"
 BBFILE_PATTERN_openstack-qemu-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_openstack-qemu-layer = "6"
-LAYERSERIES_COMPAT_openstack-qemu-layer = "sumo"
+LAYERSERIES_COMPAT_openstack-qemu-layer = "sumo thud"
 
 LAYERDEPENDS_openstack-qemu-layer = " \
 	core \
diff --git a/meta-openstack-swift-deploy/conf/layer.conf b/meta-openstack-swift-deploy/conf/layer.conf
index 12108ef..bfe40fe 100644
--- a/meta-openstack-swift-deploy/conf/layer.conf
+++ b/meta-openstack-swift-deploy/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "openstack-swift-deploy-layer"
 BBFILE_PATTERN_openstack-swift-deploy-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_openstack-swift-deploy-layer = "6"
-LAYERSERIES_COMPAT_openstack-swift-deploy-layer = "sumo"
+LAYERSERIES_COMPAT_openstack-swift-deploy-layer = "sumo thud"
 
 LAYERDEPENDS_openstack-swift-deploy-layer = " \
 	core \
diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
index 0370c81..4ce6ea7 100644
--- a/meta-openstack/conf/layer.conf
+++ b/meta-openstack/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "openstack-layer"
 BBFILE_PATTERN_openstack-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_openstack-layer = "5"
-LAYERSERIES_COMPAT_openstack-layer = "sumo"
+LAYERSERIES_COMPAT_openstack-layer = "sumo thud"
 BB_DANGLINGAPPENDS_WARNONLY ?= "true"
 
 LAYERDEPENDS_openstack-layer = " \
-- 
2.7.4


