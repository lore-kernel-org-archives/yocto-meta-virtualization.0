Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C5AD148BB
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 06:26:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.936.1767853602328225742
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 22:26:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EMNd5xnX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54685ebb30=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6085QDUf2305574
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 8 Jan 2026 06:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=87/W40B1vlIEuhChkSduG+cnM48NJyF7nyM4c+Ke18M=; b=EMNd5xnXJoOh
	tkC1AZ5yg5B9Yhhkp4/HeYA7DZbscZrHYD+E79L5xjz2nr+/DNGlzlKw+PNp62f+
	+XGsrHFMrKBIMe6vNKjjcF5Uhcal/qEOZR1cmSbVJo74TkpuhuGIxGXQdsZ3M/1l
	Xv+SJjKlMEUqH1N6EvVjyg/yg8kufBG44NZjZqY5ngpDZgIzYNEDOcSyAikFihxX
	en4TF2RMEDe4bsNYA1XDTytio3e+haPOQfzJ+K2/pxpRzYO6fO+7MWXdYcUzasTd
	zi3EbkNXznbCwLpLox/2v3jU/71WxF9Q2htwbp0CsWZtzHPBM0aZgG2nOtfaX8Oa
	nmzgGJQCLw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4beravd29v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Jan 2026 06:26:41 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 7 Jan 2026 22:26:40 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 7 Jan 2026 22:26:39 -0800
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH 09/15] oci-image-tools: set go buildid to empty for improving reproducibility
Date: Thu, 8 Jan 2026 14:26:22 +0800
Message-ID: <20260108062628.3636344-10-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108062628.3636344-1-changqing.li@windriver.com>
References: <20260108062628.3636344-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA0MCBTYWx0ZWRfXxj1DAEy+6dke
 2l1IIh3osFbkRqLBJcvmlGsorChloBxcz0GPwbd+udh6Qaje7OoW2aQSiC2Xa7cbKAUIXci2MIk
 B9EcAXGhVrR0yhJPT3gybttnXO98vggGXVcxQUHkR1Z6IqrEVO0HPszepzJKt+RPiQ5LDvZDVGI
 yVnlLlOqdTDtSj31bwFNcYObim8cDN23e/zGOqKqrJI01K0RBIfQ9zulkfySd4ieeEsbFZbV8A7
 pW2fg4ngqtEaoKpIVWHXskMiLcu1/03+fP0tRqdaBZrpX4W3/R9T4vKvjXZXfE0dnKdPuKPzsTO
 WdWIb8OqY8ibMq7lpxjRIUtecxqDVL204YrHy+f0/U4ViaXiRzkKUoP0TYe7mGBai5sT2dekm/l
 gplVeqOVkKTRQzh6thZY8sx6i6gUrYtFKUjTk43FVrqdGjCiTnqvOy/7G5bhE6KF+K1svcREkxr
 DQP+PRvyN2qwCJnFXhQ==
X-Proofpoint-GUID: jmPcTYUmD6eq9rAHNbAqs_vdW_zneU3w
X-Proofpoint-ORIG-GUID: jmPcTYUmD6eq9rAHNbAqs_vdW_zneU3w
X-Authority-Analysis: v=2.4 cv=PZjyRyhd c=1 sm=1 tr=0 ts=695f4e21 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=jhrmjlrxVr1sL9fIu0oA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080040
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Jan 2026 06:26:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9540

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-Makefile-add-EXTRA_LDFLAGS.patch     | 39 +++++++++++++++++++
 .../oci-image-tools/oci-image-tools_git.bb    |  5 ++-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 recipes-containers/oci-image-tools/files/0001-Makefile-add-EXTRA_LDFLAGS.patch

diff --git a/recipes-containers/oci-image-tools/files/0001-Makefile-add-EXTRA_LDFLAGS.patch b/recipes-containers/oci-image-tools/files/0001-Makefile-add-EXTRA_LDFLAGS.patch
new file mode 100644
index 00000000..d946c342
--- /dev/null
+++ b/recipes-containers/oci-image-tools/files/0001-Makefile-add-EXTRA_LDFLAGS.patch
@@ -0,0 +1,39 @@
+From 095e7a01a7d9f7a98650bc8a398daa291bf6d5d5 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Sun, 4 Jan 2026 17:24:31 +0800
+Subject: [PATCH] Makefile: add EXTRA_LDFLAGS
+
+add EXTRA_LDFLAGS to allow adding extra ldflags
+
+Upstream-Status: Submitted [https://github.com/opencontainers/image-tools/pull/243]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ Makefile | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 1bfe021..8b92b93 100644
+--- a/Makefile
++++ b/Makefile
+@@ -4,6 +4,8 @@ BINDIR ?= $(DESTDIR)/usr/bin
+ COMMIT=$(shell git rev-parse HEAD 2> /dev/null || true)
+ EPOCH_TEST_COMMIT ?= $(shell git tag | tail -1)
+ 
++EXTRA_LDFLAGS ?= ""
++
+ default: all
+ 
+ help:
+@@ -27,7 +29,7 @@ check-license:
+ 
+ .PHONY: tool
+ tool:
+-	$(GO) build $(GOBUILDFLAGS) $(EXTRA_FLAGS) -ldflags "-X main.gitCommit=${COMMIT}" -o oci-image-tool ./cmd/oci-image-tool
++	$(GO) build $(GOBUILDFLAGS) $(EXTRA_FLAGS) -ldflags "-X main.gitCommit=${COMMIT} ${EXTRA_LDFLAGS}" -o oci-image-tool ./cmd/oci-image-tool
+ 
+ 
+ all: tool man
+-- 
+2.34.1
+
diff --git a/recipes-containers/oci-image-tools/oci-image-tools_git.bb b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
index 36026214..71b01a5b 100644
--- a/recipes-containers/oci-image-tools/oci-image-tools_git.bb
+++ b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
@@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
 
 SRC_URI = "git://github.com/opencontainers/image-tools.git;branch=master;protocol=https;destsuffix=git/src/github.com/opencontainers/image-tools \
            file://0001-config-make-Config.User-mapping-errors-a-warning.patch \
-           file://0001-tool-respect-GO-and-GOBUILDFLAGS-when-building.patch"
+           file://0001-tool-respect-GO-and-GOBUILDFLAGS-when-building.patch \
+           file://0001-Makefile-add-EXTRA_LDFLAGS.patch"
 
 SRCREV = "11f9988298305d36f64248a6ee55318e60bf170b"
 PV = "1.0.0-rc3+git"
@@ -38,6 +39,8 @@ do_compile() {
 
 	export GOBUILDFLAGS="-trimpath"
 
+    export EXTRA_LDFLAGS="-buildid="
+
 	cd ${S}
 
 	oe_runmake tool
-- 
2.34.1


