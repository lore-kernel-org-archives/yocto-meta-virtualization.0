Return-Path: <Hongxu.Jia@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2BFD7E00B9D; Sun,  7 Oct 2018 19:58:35 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8B54AE00901
	for <meta-virtualization@yoctoproject.org>;
	Sun,  7 Oct 2018 19:58:34 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w982w8HC011033
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sun, 7 Oct 2018 19:58:24 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sun, 7 Oct 2018 19:58:11 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Mon, 8 Oct 2018 11:07:46 +0800
Message-ID: <1538968067-28655-2-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1538968067-28655-1-git-send-email-hongxu.jia@windriver.com>
References: <1538968067-28655-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 2/3] */layer.conf: Update LAYERDEPENDS
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
X-List-Received-Date: Mon, 08 Oct 2018 02:58:35 -0000
Content-Type: text/plain

From: Mark Hatle <mark.hatle@windriver.com>

The ruby layer is no longer in meta-openembedded, remove references to that
from the README.

Implement the LAYERDEPENDS for each of the layers so that the layerindex
will populate properly.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta-openstack-aio-deploy/README                      |  1 -
 meta-openstack-aio-deploy/conf/layer.conf             |  9 +++++++++
 meta-openstack-compute-deploy/README                  |  1 -
 meta-openstack-compute-deploy/conf/layer.conf         |  9 +++++++++
 meta-openstack-compute-test-config/README             |  1 -
 meta-openstack-compute-test-config/conf/layer.conf    |  4 ++++
 meta-openstack-controller-deploy/README               |  1 -
 meta-openstack-controller-deploy/conf/layer.conf      |  9 +++++++++
 meta-openstack-controller-test-config/README          |  1 -
 meta-openstack-controller-test-config/conf/layer.conf |  4 ++++
 meta-openstack-qemu/README                            |  1 -
 meta-openstack-qemu/conf/layer.conf                   |  9 +++++++++
 meta-openstack-swift-deploy/README                    |  1 -
 meta-openstack-swift-deploy/conf/layer.conf           |  9 +++++++++
 meta-openstack/conf/layer.conf                        | 11 +++++++++++
 15 files changed, 64 insertions(+), 7 deletions(-)

diff --git a/meta-openstack-aio-deploy/README b/meta-openstack-aio-deploy/README
index 3603739..19a1bf5 100644
--- a/meta-openstack-aio-deploy/README
+++ b/meta-openstack-aio-deploy/README
@@ -19,7 +19,6 @@ patches: 0001-python-sqlalchemy-update-to-0.7.9.patch
 revision: HEAD
 layers: meta-oe
 	meta-networking
-        meta-ruby
 
 URI: git://git.yoctoproject.org/meta-virtualization
 branch: master
diff --git a/meta-openstack-aio-deploy/conf/layer.conf b/meta-openstack-aio-deploy/conf/layer.conf
index 6d256c4..46622a6 100644
--- a/meta-openstack-aio-deploy/conf/layer.conf
+++ b/meta-openstack-aio-deploy/conf/layer.conf
@@ -8,3 +8,12 @@ BBFILE_COLLECTIONS += "openstack-aio-deploy-layer"
 BBFILE_PATTERN_openstack-aio-deploy-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_openstack-aio-deploy-layer = "6"
 LAYERSERIES_COMPAT_openstack-aio-deploy-layer = "sumo"
+
+LAYERDEPENDS_openstack-aio-deploy-layer = " \
+	core \
+	cloud-services-layer \
+	openembedded-layer \
+	networking-layer \
+        virtualization-layer \
+	openstack-layer \
+	"
diff --git a/meta-openstack-compute-deploy/README b/meta-openstack-compute-deploy/README
index 12c2bae..1328598 100644
--- a/meta-openstack-compute-deploy/README
+++ b/meta-openstack-compute-deploy/README
@@ -19,7 +19,6 @@ patches: 0001-python-sqlalchemy-update-to-0.7.9.patch
 revision: HEAD
 layers: meta-oe
 	meta-networking
-        meta-ruby
 
 URI: git://git.yoctoproject.org/meta-virtualization
 branch: master
diff --git a/meta-openstack-compute-deploy/conf/layer.conf b/meta-openstack-compute-deploy/conf/layer.conf
index 91a83e6..e2192a1 100644
--- a/meta-openstack-compute-deploy/conf/layer.conf
+++ b/meta-openstack-compute-deploy/conf/layer.conf
@@ -8,3 +8,12 @@ BBFILE_COLLECTIONS += "openstack-compute-deploy-layer"
 BBFILE_PATTERN_openstack-compute-deploy-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_openstack-compute-deploy-layer = "6"
 LAYERSERIES_COMPAT_openstack-compute-deploy-layer = "sumo"
+
+LAYERDEPENDS_openstack-compute-deploy-layer = " \
+	core \
+	cloud-services-layer \
+	openembedded-layer \
+	networking-layer \
+	virtualization-layer \
+	openstack-layer \
+	"
diff --git a/meta-openstack-compute-test-config/README b/meta-openstack-compute-test-config/README
index 9e9b11f..e504f0f 100644
--- a/meta-openstack-compute-test-config/README
+++ b/meta-openstack-compute-test-config/README
@@ -20,7 +20,6 @@ patches: 0001-python-sqlalchemy-update-to-0.7.9.patch
 revision: HEAD
 layers: meta-oe
 	meta-networking
-        meta-ruby
 
 URI: git://git.yoctoproject.org/meta-virtualization
 branch: master
diff --git a/meta-openstack-compute-test-config/conf/layer.conf b/meta-openstack-compute-test-config/conf/layer.conf
index bc070d8..7fca615 100644
--- a/meta-openstack-compute-test-config/conf/layer.conf
+++ b/meta-openstack-compute-test-config/conf/layer.conf
@@ -9,3 +9,7 @@ BBFILE_PATTERN_openstack-compute-test-config-layer := "^${LAYERDIR}/"
 # We want this layer to have higher priority than any other meta-openstack layers
 BBFILE_PRIORITY_openstack-compute-test-config-layer = "100"
 LAYERSERIES_COMPAT_openstack-compute-test-config-layer = "sumo"
+
+LAYERDEPENDS_openstack-compute-test-config-layer = " \
+	openstack-compute-deploy-layer \
+	"
diff --git a/meta-openstack-controller-deploy/README b/meta-openstack-controller-deploy/README
index 0e31c17..d4172a7 100644
--- a/meta-openstack-controller-deploy/README
+++ b/meta-openstack-controller-deploy/README
@@ -19,7 +19,6 @@ patches: 0001-python-sqlalchemy-update-to-0.7.9.patch
 revision: HEAD
 layers: meta-oe
 	meta-networking
-        meta-ruby
 
 URI: git://git.yoctoproject.org/meta-virtualization
 branch: master
diff --git a/meta-openstack-controller-deploy/conf/layer.conf b/meta-openstack-controller-deploy/conf/layer.conf
index a2c9d16..73ac493 100644
--- a/meta-openstack-controller-deploy/conf/layer.conf
+++ b/meta-openstack-controller-deploy/conf/layer.conf
@@ -8,3 +8,12 @@ BBFILE_COLLECTIONS += "openstack-controller-deploy-layer"
 BBFILE_PATTERN_openstack-controller-deploy-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_openstack-controller-deploy-layer = "6"
 LAYERSERIES_COMPAT_openstack-controller-deploy-layer = "sumo"
+
+LAYERDEPENDS_openstack-controller-deploy-layer = " \
+	core \
+	cloud-services-layer \
+	openembedded-layer \
+	networking-layer \
+	virtualization-layer \
+	openstack-layer \
+"
diff --git a/meta-openstack-controller-test-config/README b/meta-openstack-controller-test-config/README
index 4217997..471b2e8 100644
--- a/meta-openstack-controller-test-config/README
+++ b/meta-openstack-controller-test-config/README
@@ -20,7 +20,6 @@ patches: 0001-python-sqlalchemy-update-to-0.7.9.patch
 revision: HEAD
 layers: meta-oe
 	meta-networking
-        meta-ruby
 
 URI: git://git.yoctoproject.org/meta-virtualization
 branch: master
diff --git a/meta-openstack-controller-test-config/conf/layer.conf b/meta-openstack-controller-test-config/conf/layer.conf
index dcae15d..3734375 100644
--- a/meta-openstack-controller-test-config/conf/layer.conf
+++ b/meta-openstack-controller-test-config/conf/layer.conf
@@ -9,3 +9,7 @@ BBFILE_PATTERN_openstack-controller-test-config-layer := "^${LAYERDIR}/"
 # We want this layer to have higher priority than any other meta-openstack layers
 BBFILE_PRIORITY_openstack-controller-test-config-layer = "100"
 LAYERSERIES_COMPAT_openstack-controller-test-config-layer = "sumo"
+
+LAYERDEPENDS_openstack-controller-test-config-layer = " \
+	openstack-controller-deploy-layer \
+	"
diff --git a/meta-openstack-qemu/README b/meta-openstack-qemu/README
index 63ef70a..81ce86b 100644
--- a/meta-openstack-qemu/README
+++ b/meta-openstack-qemu/README
@@ -19,7 +19,6 @@ patches: 0001-python-sqlalchemy-update-to-0.7.9.patch
 revision: HEAD
 layers: meta-oe
 	meta-networking
-        meta-ruby
 
 URI: git://git.yoctoproject.org/meta-virtualization
 branch: master
diff --git a/meta-openstack-qemu/conf/layer.conf b/meta-openstack-qemu/conf/layer.conf
index b6d45ba..d3ddf82 100644
--- a/meta-openstack-qemu/conf/layer.conf
+++ b/meta-openstack-qemu/conf/layer.conf
@@ -8,3 +8,12 @@ BBFILE_COLLECTIONS += "openstack-qemu-layer"
 BBFILE_PATTERN_openstack-qemu-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_openstack-qemu-layer = "6"
 LAYERSERIES_COMPAT_openstack-qemu-layer = "sumo"
+
+LAYERDEPENDS_openstack-qemu-layer = " \
+	core \
+	cloud-services-layer \
+	openembedded-layer \
+	networking-layer \
+	virtualization-layer \
+	openstack-layer \
+	"
diff --git a/meta-openstack-swift-deploy/README b/meta-openstack-swift-deploy/README
index 9c8acb3..07ba5f9 100644
--- a/meta-openstack-swift-deploy/README
+++ b/meta-openstack-swift-deploy/README
@@ -19,7 +19,6 @@ patches: 0001-python-sqlalchemy-update-to-0.7.9.patch
 revision: HEAD
 layers: meta-oe
 	meta-networking
-        meta-ruby
 
 URI: git://git.yoctoproject.org/meta-virtualization
 branch: master
diff --git a/meta-openstack-swift-deploy/conf/layer.conf b/meta-openstack-swift-deploy/conf/layer.conf
index d021fcc..12108ef 100644
--- a/meta-openstack-swift-deploy/conf/layer.conf
+++ b/meta-openstack-swift-deploy/conf/layer.conf
@@ -8,3 +8,12 @@ BBFILE_COLLECTIONS += "openstack-swift-deploy-layer"
 BBFILE_PATTERN_openstack-swift-deploy-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_openstack-swift-deploy-layer = "6"
 LAYERSERIES_COMPAT_openstack-swift-deploy-layer = "sumo"
+
+LAYERDEPENDS_openstack-swift-deploy-layer = " \
+	core \
+	cloud-services-layer \
+	openembedded-layer \
+	networking-layer \
+	virtualization-layer \
+	openstack-layer \
+	"
diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
index ac4f055..0370c81 100644
--- a/meta-openstack/conf/layer.conf
+++ b/meta-openstack/conf/layer.conf
@@ -10,6 +10,17 @@ BBFILE_PRIORITY_openstack-layer = "5"
 LAYERSERIES_COMPAT_openstack-layer = "sumo"
 BB_DANGLINGAPPENDS_WARNONLY ?= "true"
 
+LAYERDEPENDS_openstack-layer = " \
+	core \
+        cloud-services-layer \
+	openembedded-layer \
+	networking-layer \
+	filesystems-layer \
+	webserver \
+	meta-python \
+	virtualization-layer \
+	"
+
 # pre 0.4.0 greenlet versions segfault python
 PREFERRED_VERSION_python-greenlet = "0.4.5"
 PREFERRED_VERSION_python-sqlalchemy = "1.0.8"
-- 
2.7.4


