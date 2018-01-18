Return-Path: <Liezhi.Yang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0361EE00EB1; Thu, 18 Jan 2018 01:23:19 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 50FCBE00D20
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Jan 2018 01:23:17 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w0I9NH9d007471
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Jan 2018 01:23:17 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Thu, 18 Jan 2018 01:23:16 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Thu, 18 Jan 2018 17:23:40 +0800
Message-ID: <1516267420-85807-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] conf/layer.conf: remove bbclass from BBFILES
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
X-List-Received-Date: Thu, 18 Jan 2018 09:23:19 -0000
Content-Type: text/plain

Add bbclass to BBFILES doesn't make any sense.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-openstack-aio-deploy/conf/layer.conf             | 2 +-
 meta-openstack-compute-deploy/conf/layer.conf         | 2 +-
 meta-openstack-compute-test-config/conf/layer.conf    | 2 +-
 meta-openstack-controller-deploy/conf/layer.conf      | 2 +-
 meta-openstack-controller-test-config/conf/layer.conf | 2 +-
 meta-openstack-swift-deploy/conf/layer.conf           | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-openstack-aio-deploy/conf/layer.conf b/meta-openstack-aio-deploy/conf/layer.conf
index 3943e76..b7d6002 100644
--- a/meta-openstack-aio-deploy/conf/layer.conf
+++ b/meta-openstack-aio-deploy/conf/layer.conf
@@ -2,7 +2,7 @@
 BBPATH .= ":${LAYERDIR}"
 
 # We have a recipes directory, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend ${LAYERDIR}/classes/*.bbclass"
+BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 
 BBFILE_COLLECTIONS += "openstack-aio-deploy-layer"
 BBFILE_PATTERN_openstack-aio-deploy-layer := "^${LAYERDIR}/"
diff --git a/meta-openstack-compute-deploy/conf/layer.conf b/meta-openstack-compute-deploy/conf/layer.conf
index ee88f42..177e1b5 100644
--- a/meta-openstack-compute-deploy/conf/layer.conf
+++ b/meta-openstack-compute-deploy/conf/layer.conf
@@ -2,7 +2,7 @@
 BBPATH .= ":${LAYERDIR}"
 
 # We have a recipes directory, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend ${LAYERDIR}/classes/*.bbclass"
+BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 
 BBFILE_COLLECTIONS += "openstack-compute-deploy-layer"
 BBFILE_PATTERN_openstack-compute-deploy-layer := "^${LAYERDIR}/"
diff --git a/meta-openstack-compute-test-config/conf/layer.conf b/meta-openstack-compute-test-config/conf/layer.conf
index e54c05d..186438d 100644
--- a/meta-openstack-compute-test-config/conf/layer.conf
+++ b/meta-openstack-compute-test-config/conf/layer.conf
@@ -2,7 +2,7 @@
 BBPATH .= ":${LAYERDIR}"
 
 # We have a recipes directory, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend ${LAYERDIR}/classes/*.bbclass"
+BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 
 BBFILE_COLLECTIONS += "openstack-compute-test-config-layer"
 BBFILE_PATTERN_openstack-compute-test-config-layer := "^${LAYERDIR}/"
diff --git a/meta-openstack-controller-deploy/conf/layer.conf b/meta-openstack-controller-deploy/conf/layer.conf
index e6c1c74..cda55da 100644
--- a/meta-openstack-controller-deploy/conf/layer.conf
+++ b/meta-openstack-controller-deploy/conf/layer.conf
@@ -2,7 +2,7 @@
 BBPATH .= ":${LAYERDIR}"
 
 # We have a recipes directory, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend ${LAYERDIR}/classes/*.bbclass"
+BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 
 BBFILE_COLLECTIONS += "openstack-controller-deploy-layer"
 BBFILE_PATTERN_openstack-controller-deploy-layer := "^${LAYERDIR}/"
diff --git a/meta-openstack-controller-test-config/conf/layer.conf b/meta-openstack-controller-test-config/conf/layer.conf
index 35c016d..9cf87e4 100644
--- a/meta-openstack-controller-test-config/conf/layer.conf
+++ b/meta-openstack-controller-test-config/conf/layer.conf
@@ -2,7 +2,7 @@
 BBPATH .= ":${LAYERDIR}"
 
 # We have a recipes directory, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend ${LAYERDIR}/classes/*.bbclass"
+BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 
 BBFILE_COLLECTIONS += "openstack-controller-test-config-layer"
 BBFILE_PATTERN_openstack-controller-test-config-layer := "^${LAYERDIR}/"
diff --git a/meta-openstack-swift-deploy/conf/layer.conf b/meta-openstack-swift-deploy/conf/layer.conf
index 9b5e785..6f9f588 100644
--- a/meta-openstack-swift-deploy/conf/layer.conf
+++ b/meta-openstack-swift-deploy/conf/layer.conf
@@ -2,7 +2,7 @@
 BBPATH .= ":${LAYERDIR}"
 
 # We have a recipes directory, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend ${LAYERDIR}/classes/*.bbclass"
+BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 
 BBFILE_COLLECTIONS += "openstack-swift-deploy-layer"
 BBFILE_PATTERN_openstack-swift-deploy-layer := "^${LAYERDIR}/"
-- 
2.7.4


