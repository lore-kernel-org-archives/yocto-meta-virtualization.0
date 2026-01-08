Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29A3D148AE
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 06:26:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.940.1767853607123807061
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 22:26:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Qh62f1fW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54685ebb30=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608402Rp394420
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 8 Jan 2026 06:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=lkY8iRnD3R4EuArSnGCYiq4q1SlbzgRr4pjUy/6IrZw=; b=Qh62f1fWSJSr
	OnuLbu+kyhNRexHnZaxFwXm5wswsk091OFFi/CRFAYk95tvtsb+ESzuuaNc3J/ji
	M/TxA8gwUPkB2jfRI2yr3EUzQXQejEVTMoMl3h17DPFRZ/SBHAYDqjcAkvehXCWl
	f18UsrRHXhVuaap2ag5mCBxNw7TedImhnuiO2UWnAjpKDSXSQaVg/VGSiV1/qEFN
	WCOiT5r0i96/ZvZcXLDByoiq2jbDYPcUrPptev92DSj33P4xcPmpgDeyVVkpuYKS
	6DXh83Mh5XN0/nGoXO76TzAcYtp3pRmJi5N+W2Dc5a7QR+gq6sIJakPexoUkVGp1
	MLEry4hF9g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bet33d0gb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Jan 2026 06:26:45 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 7 Jan 2026 22:26:45 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 7 Jan 2026 22:26:44 -0800
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH 14/15] oci-runtime-tools: set go buildid to empty for improving reproducibility
Date: Thu, 8 Jan 2026 14:26:27 +0800
Message-ID: <20260108062628.3636344-15-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108062628.3636344-1-changqing.li@windriver.com>
References: <20260108062628.3636344-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=cPTtc1eN c=1 sm=1 tr=0 ts=695f4e26 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=DiKOuN3rqsFUJ31IPCwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: JKD1HL90n9cb7SEmBqNQCnqQnpogiLru
X-Proofpoint-ORIG-GUID: JKD1HL90n9cb7SEmBqNQCnqQnpogiLru
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA0MCBTYWx0ZWRfX699FJWYaANre
 J1wFc0LRN+l1EhVpbImVwLZTUUCeHSzesiIcSD1h28b+QX3kIGFYMAs9b1a2TYsJreyP+I2DB1o
 3mO4QGgUGLu2zuF9yPKpfvmCl5HA82CwdT0twjCx6ainkVQwXpNF0rmsmIr35eX4PIxchw/MTnJ
 duSNqJlUvFHor4sAP1wlnwFZyXQq8WMZ/5THga48Ts0s7KE1UuLSpfzi3GFu9JQwxVXWHnCeH8K
 LTiW+EzugDPL93oqpQR3L735jrxA9DgDosZrXhBDt6pccHvlqz4u0y5zYnFVgNIxg4O72LbnncQ
 xrO57yvIj3hkAbE+3AuCuLAteqyKV188J+4asM+/269FzwdOkbppMOk/rhdEFhALCY4jfB9D7/O
 nDOudFwRfLrzmvdJPT31POg1EpgfZp8o6j/hJ0hiAO7dQjjB0yFWboTZOhkDESq+SCJlJmM2mPO
 7Z5zCi0bTP4v7x4rrjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080040
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Jan 2026 06:26:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9545

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-Makefile-add-EXTRA_LDFLAGS.patch     | 33 +++++++++++++++++++
 .../oci-runtime-tools_git.bb                  |  2 ++
 2 files changed, 35 insertions(+)
 create mode 100644 recipes-containers/oci-runtime-tools/files/0001-Makefile-add-EXTRA_LDFLAGS.patch

diff --git a/recipes-containers/oci-runtime-tools/files/0001-Makefile-add-EXTRA_LDFLAGS.patch b/recipes-containers/oci-runtime-tools/files/0001-Makefile-add-EXTRA_LDFLAGS.patch
new file mode 100644
index 00000000..59ae82c5
--- /dev/null
+++ b/recipes-containers/oci-runtime-tools/files/0001-Makefile-add-EXTRA_LDFLAGS.patch
@@ -0,0 +1,33 @@
+From c8ceb663f7e27a786714d31abeb8da7e1e3d0984 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 7 Jan 2026 15:48:37 +0800
+Subject: [PATCH] Makefile: add EXTRA_LDFLAGS
+
+Add EXTRA_LDFLAGS to support add extra ldflags
+
+Upstream-Status: Submitted [https://github.com/opencontainers/runtime-tools/pull/803]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ Makefile | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index e79aa74..2827f54 100644
+--- a/Makefile
++++ b/Makefile
+@@ -6,8 +6,9 @@ BUILDTAGS=
+ RUNTIME ?= runc
+ COMMIT ?= $(shell git describe --dirty --long --always --tags 2> /dev/null)
+ VERSION := ${shell cat ./VERSION}
+-BUILD_FLAGS := -tags "$(BUILDTAGS)" -ldflags "-X main.gitCommit=$(COMMIT) -X main.version=$(VERSION)" $(EXTRA_FLAGS)
+-STATIC_BUILD_FLAGS := -tags "$(BUILDTAGS) netgo osusergo" -ldflags "-extldflags -static -X main.gitCommit=$(COMMIT) -X main.version=$(VERSION)" $(EXTRA_FLAGS)
++EXTRA_LDFLAGS ?= ""
++BUILD_FLAGS := -tags "$(BUILDTAGS)" -ldflags "-X main.gitCommit=$(COMMIT) -X main.version=$(VERSION) ${EXTRA_LDFLAGS}" $(EXTRA_FLAGS)
++STATIC_BUILD_FLAGS := -tags "$(BUILDTAGS) netgo osusergo" -ldflags "-extldflags -static -X main.gitCommit=$(COMMIT) -X main.version=$(VERSION) ${EXTRA_LDFLAGS}" $(EXTRA_FLAGS)
+ VALIDATION_TESTS ?= $(patsubst %.go,%.t,$(shell find ./validation/ -name *.go | grep -v util))
+ 
+ all: tool runtimetest validation-executables
+-- 
+2.34.1
+
diff --git a/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb b/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
index 81f51f9c..60c54ea8 100644
--- a/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
+++ b/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b355a61a394a504dacde901c958f662c"
 
 SRC_URI = "git://github.com/opencontainers/runtime-tools.git;branch=master;protocol=https;destsuffix=git/src/github.com/opencontainers/runtime-tools \
            file://0001-build-use-for-cross-compiler.patch \
+           file://0001-Makefile-add-EXTRA_LDFLAGS.patch \
            "
 
 SRCREV = "0105384f68e16803891d0a17d9067b1def6a2778"
@@ -39,6 +40,7 @@ do_compile() {
 	#        cannot open file : open : no such file or directory
 	# export GO_BUILD_FLAGS="-a -pkgdir dontusecurrentpkgs"
 	export EXTRA_FLAGS="-trimpath"
+	export EXTRA_LDFLAGS="-buildid="
 
 	cd ${S}
 
-- 
2.34.1


