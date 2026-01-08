Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D826AD148B9
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 06:26:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.937.1767853602847457207
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 22:26:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sIWQDMWX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54685ebb30=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6085QDUg2305574
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 8 Jan 2026 06:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=KballuIIpATPH2hRQpeNm6d2p5xITKLTjhBRBnrkx4o=; b=sIWQDMWXEjXW
	3aibaYOBXV7brAyhl/LQ/cS5HYZHtcu0FRq+bw0ZhBdX+ZVExq+0THgIGuZi1zA6
	Mnoq0TrJI3M/Jku9d5NsVhIH7Utmgha+wXV0HFns6nUZmcR7jvceDvLoGQqkPPg+
	h8BqfWQabJOqVSxSdJrQRG8+ahO2OkAUfzJMU88/dd5ciCiqyDL/eDBeuDnLMP3s
	Io3999cg+mCVClT1Xz8Lvt2LcL4nhw9tF5AB9ocqlTAhiG9QqMQTjP9b+qtJjK+S
	EBH86bH0526SRz7M57BtAuU292kfBih/b/Uk4FrPxk8xADoo6sewGcOyRM8KsbEO
	LTYZbKshqw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4beravd29v-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Jan 2026 06:26:41 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 7 Jan 2026 22:26:41 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 7 Jan 2026 22:26:40 -0800
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH 10/15] docker-distribution: set go buildid to empty for improving reproducibility
Date: Thu, 8 Jan 2026 14:26:23 +0800
Message-ID: <20260108062628.3636344-11-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108062628.3636344-1-changqing.li@windriver.com>
References: <20260108062628.3636344-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA0MCBTYWx0ZWRfXymgMWJcfK53j
 r7oCv8tSXtaSIFOiuphB/af+ACCuKvHbzUaPEcm+TWpjw0sCA8jKzrIXWMd136AaOqGNKViAON+
 bJ6b1af6UngsXdhRZ8IX/BDhxmAIbKpudSe95sXCqTG5Sf4d1qHWyYNAWzzoJXFPFzoZ7Y9kKCG
 dLpPE0hVIhSMqkZ1lwdEsGSA3YNqyLT5cUgoFXYTAZbu4ZydAjfSOzne0uj2aCcWlfShHhtOFOj
 a9LBbX5Gxvt7IGRbrU4Hi5EgDsAeYZ//lxi/Vwtyr3t2UNy9xqHBaxxJ7xJT9s1xbIACX1Tao5C
 2gZDGtcNHTwSaxdj9Hget/0QLj739s92SigHtA7hPwccV2KcnX5zbpCDUkLPBCgDDohd4SYZNzl
 Eff4XsAc5hMgo/RZPK+t3E3a3KnyxMAMeZGYNp1XbDG13hsVceFAYtvAJjAzk9uwzNCHScj8/sX
 7YHfpzfmG3fA9Kimytw==
X-Proofpoint-GUID: _PC6yDOOZvpSgUoEZb1wEbl636fespe2
X-Proofpoint-ORIG-GUID: _PC6yDOOZvpSgUoEZb1wEbl636fespe2
X-Authority-Analysis: v=2.4 cv=PZjyRyhd c=1 sm=1 tr=0 ts=695f4e21 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=4SglPn464jzajAQkZygA:9 a=FdTzh2GWekK77mhwV6Dw:22
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9541

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../docker-distribution_git.bb                |  2 +
 ...01-Makefile-remove-duplicate-ldflags.patch | 39 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 recipes-containers/docker-distribution/files/0001-Makefile-remove-duplicate-ldflags.patch

diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index 5e37fe74..90ad5680 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -7,6 +7,7 @@ SRCREV_distribution = "76fe6170526f0a1046c340c20b041a090d8dbfc9"
 SRC_URI = "git://github.com/docker/distribution.git;branch=main;name=distribution;destsuffix=git/src/github.com/distribution/distribution/v3;protocol=https \
            file://docker-registry.service \
            file://0001-build-use-to-use-cross-go-compiler.patch \
+           file://0001-Makefile-remove-duplicate-ldflags.patch \
           "
 
 PACKAGES =+ "docker-registry"
@@ -36,6 +37,7 @@ do_compile() {
 	export CGO_LDFLAGS="${TARGET_LDFLAGS}"
 	export GO111MODULE=off
 	export GO_BUILD_FLAGS="-trimpath"
+    export EXTRA_LDFLAGS="-buildid="
 
 	cd ${S}
 
diff --git a/recipes-containers/docker-distribution/files/0001-Makefile-remove-duplicate-ldflags.patch b/recipes-containers/docker-distribution/files/0001-Makefile-remove-duplicate-ldflags.patch
new file mode 100644
index 00000000..5f01e0b8
--- /dev/null
+++ b/recipes-containers/docker-distribution/files/0001-Makefile-remove-duplicate-ldflags.patch
@@ -0,0 +1,39 @@
+From 06af6fa59fc39e15aac8f57f2c9f0b87a47ef125 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Sun, 4 Jan 2026 17:30:46 +0800
+Subject: [PATCH] Makefile: remove duplicate ldflags
+
+The second ldflags will override the first one in GO_LDFLAGS, and make
+user cannot set GO_LDFLAGS by passing this variable
+
+Upstream-Status: Submitted [https://github.com/distribution/distribution/pull/4762]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index d958e75..b987bb1 100644
+--- a/Makefile
++++ b/Makefile
+@@ -60,14 +60,14 @@ version/version.go:
+ 
+ bin/%: cmd/% FORCE ## build individual binary
+ 	@echo "$(WHALE) $@${BINARY_SUFFIX}"
+-	@${GO} build -buildmode=pie ${GO_GCFLAGS} ${GO_BUILD_FLAGS} -o $@${BINARY_SUFFIX} ${GO_LDFLAGS} --ldflags '-extldflags "-Wl,-z,now" -s' ${GO_TAGS}  ./$<
++	@${GO} build -buildmode=pie ${GO_GCFLAGS} ${GO_BUILD_FLAGS} -o $@${BINARY_SUFFIX} ${GO_LDFLAGS} ${GO_TAGS}  ./$<
+ 
+ binaries: $(BINARIES) ## build binaries
+ 	@echo "$(WHALE) $@"
+ 
+ build: ## build go packages
+ 	@echo "$(WHALE) $@"
+-	@go build -buildmode=pie ${GO_GCFLAGS} ${GO_BUILD_FLAGS} ${GO_LDFLAGS} --ldflags '-extldflags "-Wl,-z,now" -s' ${GO_TAGS} $(PACKAGES)
++	@go build -buildmode=pie ${GO_GCFLAGS} ${GO_BUILD_FLAGS} ${GO_LDFLAGS} ${GO_TAGS} $(PACKAGES)
+ 
+ image: ## build docker image IMAGE_NAME=<name>
+ 	docker buildx bake --set "*.tags=${IMAGE_NAME}" image-local
+-- 
+2.34.1
+
-- 
2.34.1


