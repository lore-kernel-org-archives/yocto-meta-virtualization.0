Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B518BC4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:12:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11462.1713946321275898591
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Apr 2024 01:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZteZfWYr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48443a9d6c=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43O60Sm5015348
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Apr 2024 01:12:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=ayN0L22YgVezx4fU2B/ThQYOAfRXBxHMQLmTAy3YCrU=; b=
	ZteZfWYr8sZqRZ/g6Yyq/v+9/xpMqHTBe+4aWCqS8k/bKtnciksWB3TkWX0mp/ES
	17n7YDoTyqYd8LaEuv+NgpdlQOB62AAvvdl0li1A4NNIgTLQsZAtiChmCeJ9lZze
	EegAGJQ+5E+f1KQaKv8zBtGkRCpnHVm9iDwW+J/dogTxEN6jKPwn4ahnAZErZR/6
	JF/aVqtF+Aw9F5GAyqLTW/htIgdKiEPFJD0cuLaMd8zwiD/y1OYwWM8Pu4V1r8d5
	I8lilzYRS7AZWXt/yaa7f8rw8dlZjacUdFFaovfHzfMWWEuAi1Uj+9ASUtNCqTNg
	X0FNXVCXNGowxt8VZ6nmjg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xmd7gkhhr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Apr 2024 01:12:00 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 24 Apr 2024 01:11:59 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Wed, 24 Apr 2024 01:11:59 -0700
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [master][scarthgap][meta-virtualization][PATCH 2/3] containerd-opencontainers: fix wrong version display
Date: Wed, 24 Apr 2024 16:11:56 +0800
Message-ID: <20240424081157.2608243-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240424081157.2608243-1-changqing.li@windriver.com>
References: <20240424081157.2608243-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: WTJqeFxi1TwKTYpdxoLQAOO5d2YeRG_q
X-Proofpoint-GUID: WTJqeFxi1TwKTYpdxoLQAOO5d2YeRG_q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-24_05,2024-04-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404240035
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Apr 2024 08:12:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8696

From: Changqing Li <changqing.li@windriver.com>

Update Makefile to fix following containerd version:
containerd github.com/containerd/containerd/v2 2.0.0-beta.0+unknown
it should be like:
containerd github.com/containerd/containerd/v2 v2.0.0-beta.2-204-gb1624c362.m b1624c3628954e769dd50783b63823040b2db38c.m

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...file-update-PACKAGE-and-PKG-settings.patch | 41 +++++++++++++++++++
 .../containerd-opencontainers_git.bb          |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 recipes-containers/containerd/containerd-opencontainers/0001-Makefile-update-PACKAGE-and-PKG-settings.patch

diff --git a/recipes-containers/containerd/containerd-opencontainers/0001-Makefile-update-PACKAGE-and-PKG-settings.patch b/recipes-containers/containerd/containerd-opencontainers/0001-Makefile-update-PACKAGE-and-PKG-settings.patch
new file mode 100644
index 00000000..bc70c199
--- /dev/null
+++ b/recipes-containers/containerd/containerd-opencontainers/0001-Makefile-update-PACKAGE-and-PKG-settings.patch
@@ -0,0 +1,41 @@
+From 26b4a947ebd3ed50af46bf882009b53b92a9f094 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 24 Apr 2024 13:58:27 +0800
+Subject: [PATCH] Makefile: update PACKAGE and PKG settings
+
+Current settings make containerd version is displayed
+as "2.0.0-rc.1+unknown", update PACKAGE and PKG settings to
+correct the version
+
+Upstream-Status: Submitted [https://github.com/containerd/containerd/pull/10125]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index a5b244191..a68c07038 100644
+--- a/Makefile
++++ b/Makefile
+@@ -34,7 +34,7 @@ TEST_IMAGE_LIST ?=
+ # Used to populate variables in version package.
+ VERSION ?= $(shell git describe --match 'v[0-9]*' --dirty='.m' --always)
+ REVISION ?= $(shell git rev-parse HEAD)$(shell if ! git diff --no-ext-diff --quiet --exit-code; then echo .m; fi)
+-PACKAGE=github.com/containerd/containerd
++PACKAGE=github.com/containerd/containerd/v2
+ SHIM_CGO_ENABLED ?= 0
+ 
+ ifneq "$(strip $(shell command -v $(GO) 2>/dev/null))" ""
+@@ -81,7 +81,7 @@ STATICRELEASE=containerd-static-$(VERSION:v%=%)-${GOOS}-${GOARCH}
+ CRIRELEASE=cri-containerd-$(VERSION:v%=%)-${GOOS}-${GOARCH}
+ CRICNIRELEASE=cri-containerd-cni-$(VERSION:v%=%)-${GOOS}-${GOARCH}
+ 
+-PKG=github.com/containerd/containerd/v2
++PKG=github.com/containerd/containerd
+ 
+ # Project binaries.
+ COMMANDS=ctr containerd containerd-stress
+-- 
+2.25.1
+
diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
index 10d1ce8b..8df22432 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -9,6 +9,7 @@ SRCREV = "b1624c3628954e769dd50783b63823040b2db38c"
 SRC_URI = "git://github.com/containerd/containerd;branch=main;protocol=https;destsuffix=git/src/github.com/containerd/containerd \
            file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch \
            file://0001-build-don-t-use-gcflags-to-define-trimpath.patch \
+           file://0001-Makefile-update-PACKAGE-and-PKG-settings.patch \
           "
 
 # Apache-2.0 for containerd
-- 
2.25.1


