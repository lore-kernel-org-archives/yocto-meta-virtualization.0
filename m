Return-Path: <jpuhlman@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A81BDE00CA7; Mon, 21 May 2018 12:36:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.216.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E4038E00CA3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 May 2018 12:36:04 -0700 (PDT)
Received: by mail-qt0-f193.google.com with SMTP id d3-v6so20406563qtp.11
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 May 2018 12:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=qTIkcT389ZNJ+0stdYt8V/qcgoCPrHABi5wUMWA0xqU=;
	b=CLwbiDLGz8Lcm6/QfaMqhuWKQ+wzRpL+qQykAAz36ClGbxqxERuUhQf9NJDrI2J8Ge
	ZUQhfthSnm3Rx/A6ctPr9XEtuI4vHpQUmlkfSFpbhgkoBA7Pgsq5pyctXHtzzx9r7CqF
	j03OAZTs0R5jLJMKCX837dPRcpgN3RJ7r8klYtgiexG7L53hSSUFw/yqHmufBBoDqEVi
	VkOQgL6i9koBoxm4F8ACbmgurEh2MoOS/pQ/OKjyND4Gw3Yq22ZDdRcxztVfyO4ooSXz
	yDyPopCa5dLuGPqVUYQsHzIKP6vs/W6IhBekT8AI1NCO8knjbIT6dQahvarmjDnI53is
	v4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qTIkcT389ZNJ+0stdYt8V/qcgoCPrHABi5wUMWA0xqU=;
	b=kpdv78mdCl2O/oIfkH+rFkKTAe35GR0bxSb9qWDD3XHfZNHU+cj3Z34VNrl7pOpap9
	llNzlpgx9P8ZOHLkNLM3xJGRUlY5XGDcEZQxSL/ubPEy2YYkPpabjbi5oU1tqaDs19Wz
	h2HTr2hYqW85xtYzOf1GlsjhnGHEgpmjmhm/aRbB9pwCb7sJFMw+OyEio38cPTldg/Yn
	bbpJZRaiHbwe558bTPE/8edIZ+OUmsLXRljQi+tMAyoqNySXE+zHFcN5lyNfrzdcVMdn
	42jwFgmzgy8Cvb6STXJdvyZ1cRatTDU3VSO0KIrquBwvADg/Xwy0uoHugdPfoylgZtis
	1KIg==
X-Gm-Message-State: ALKqPweMvmOGyi87i52TwMm1n1y0XsYmRb0pHWffYBVcMuhHvbFPcgNY
	7Z8Cu8ucRzjOPaXBgPkpHV1h1Wck
X-Google-Smtp-Source: AB8JxZrrMtweIloP10kmZgc9xYU7iLoPDTm8CYsrT9MCtbQPRBngY4nJ5KyaAyUF89wy87Pff/qN/A==
X-Received: by 2002:a0c:95dd:: with SMTP id
	t29-v6mr15526453qvt.23.1526931363536; 
	Mon, 21 May 2018 12:36:03 -0700 (PDT)
Received: from workhorse.mvista.com
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	n78-v6sm10336198qke.52.2018.05.21.12.36.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 May 2018 12:36:02 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 21 May 2018 12:35:57 -0700
Message-Id: <1526931357-7652-1-git-send-email-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.6.2
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [m-c-s][PATCH] Add LAYERSERIES_COMPAT
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
X-List-Received-Date: Mon, 21 May 2018 19:36:06 -0000

From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 conf/layer.conf                                       | 1 +
 meta-openstack-aio-deploy/conf/layer.conf             | 2 +-
 meta-openstack-compute-deploy/conf/layer.conf         | 1 +
 meta-openstack-compute-test-config/conf/layer.conf    | 1 +
 meta-openstack-controller-deploy/conf/layer.conf      | 1 +
 meta-openstack-controller-test-config/conf/layer.conf | 1 +
 meta-openstack-qemu/conf/layer.conf                   | 1 +
 meta-openstack-swift-deploy/conf/layer.conf           | 1 +
 meta-openstack/conf/layer.conf                        | 2 +-
 9 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index b30a99f..f69e8b1 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -7,3 +7,4 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "cloud-services-layer"
 BBFILE_PATTERN_cloud-services-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_cloud-services-layer = "5"
+LAYERSERIES_COMPAT_cloud-services-layer = "sumo"
diff --git a/meta-openstack-aio-deploy/conf/layer.conf b/meta-openstack-aio-deploy/conf/layer.conf
index 154a98d..6d256c4 100644
--- a/meta-openstack-aio-deploy/conf/layer.conf
+++ b/meta-openstack-aio-deploy/conf/layer.conf
@@ -7,4 +7,4 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "openstack-aio-deploy-layer"
 BBFILE_PATTERN_openstack-aio-deploy-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_openstack-aio-deploy-layer = "6"
-
+LAYERSERIES_COMPAT_openstack-aio-deploy-layer = "sumo"
diff --git a/meta-openstack-compute-deploy/conf/layer.conf b/meta-openstack-compute-deploy/conf/layer.conf
index 44a035b..91a83e6 100644
--- a/meta-openstack-compute-deploy/conf/layer.conf
+++ b/meta-openstack-compute-deploy/conf/layer.conf
@@ -7,3 +7,4 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "openstack-compute-deploy-layer"
 BBFILE_PATTERN_openstack-compute-deploy-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_openstack-compute-deploy-layer = "6"
+LAYERSERIES_COMPAT_openstack-compute-deploy-layer = "sumo"
diff --git a/meta-openstack-compute-test-config/conf/layer.conf b/meta-openstack-compute-test-config/conf/layer.conf
index f3b7bcb..bc070d8 100644
--- a/meta-openstack-compute-test-config/conf/layer.conf
+++ b/meta-openstack-compute-test-config/conf/layer.conf
@@ -8,3 +8,4 @@ BBFILE_COLLECTIONS += "openstack-compute-test-config-layer"
 BBFILE_PATTERN_openstack-compute-test-config-layer := "^${LAYERDIR}/"
 # We want this layer to have higher priority than any other meta-openstack layers
 BBFILE_PRIORITY_openstack-compute-test-config-layer = "100"
+LAYERSERIES_COMPAT_openstack-compute-test-config-layer = "sumo"
diff --git a/meta-openstack-controller-deploy/conf/layer.conf b/meta-openstack-controller-deploy/conf/layer.conf
index de8f435..a2c9d16 100644
--- a/meta-openstack-controller-deploy/conf/layer.conf
+++ b/meta-openstack-controller-deploy/conf/layer.conf
@@ -7,3 +7,4 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "openstack-controller-deploy-layer"
 BBFILE_PATTERN_openstack-controller-deploy-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_openstack-controller-deploy-layer = "6"
+LAYERSERIES_COMPAT_openstack-controller-deploy-layer = "sumo"
diff --git a/meta-openstack-controller-test-config/conf/layer.conf b/meta-openstack-controller-test-config/conf/layer.conf
index 8a6cfcb..dcae15d 100644
--- a/meta-openstack-controller-test-config/conf/layer.conf
+++ b/meta-openstack-controller-test-config/conf/layer.conf
@@ -8,3 +8,4 @@ BBFILE_COLLECTIONS += "openstack-controller-test-config-layer"
 BBFILE_PATTERN_openstack-controller-test-config-layer := "^${LAYERDIR}/"
 # We want this layer to have higher priority than any other meta-openstack layers
 BBFILE_PRIORITY_openstack-controller-test-config-layer = "100"
+LAYERSERIES_COMPAT_openstack-controller-test-config-layer = "sumo"
diff --git a/meta-openstack-qemu/conf/layer.conf b/meta-openstack-qemu/conf/layer.conf
index 6761143..b6d45ba 100644
--- a/meta-openstack-qemu/conf/layer.conf
+++ b/meta-openstack-qemu/conf/layer.conf
@@ -7,3 +7,4 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "openstack-qemu-layer"
 BBFILE_PATTERN_openstack-qemu-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_openstack-qemu-layer = "6"
+LAYERSERIES_COMPAT_openstack-qemu-layer = "sumo"
diff --git a/meta-openstack-swift-deploy/conf/layer.conf b/meta-openstack-swift-deploy/conf/layer.conf
index 45f9ee8..d021fcc 100644
--- a/meta-openstack-swift-deploy/conf/layer.conf
+++ b/meta-openstack-swift-deploy/conf/layer.conf
@@ -7,3 +7,4 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "openstack-swift-deploy-layer"
 BBFILE_PATTERN_openstack-swift-deploy-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_openstack-swift-deploy-layer = "6"
+LAYERSERIES_COMPAT_openstack-swift-deploy-layer = "sumo"
diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
index 2565b92..f9443e2 100644
--- a/meta-openstack/conf/layer.conf
+++ b/meta-openstack/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "openstack-layer"
 BBFILE_PATTERN_openstack-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_openstack-layer = "5"
-
+LAYERSERIES_COMPAT_openstack-layer = "sumo"
 BB_DANGLINGAPPENDS_WARNONLY ?= "true"
 
 # pre 0.4.0 greenlet versions segfault python
-- 
2.6.2


