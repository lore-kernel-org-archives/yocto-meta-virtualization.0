Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 333D6C021A1
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 02:46:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.42380.1739155560471077132
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 09 Feb 2025 18:46:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=413644b4c0=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A2eHS2016141
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 9 Feb 2025 18:46:00 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44p7ns14ak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 09 Feb 2025 18:45:59 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 9 Feb 2025 18:45:59 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 9 Feb 2025 18:45:58 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH 1/2] nerdctl: fix do_compile failed
Date: Mon, 10 Feb 2025 10:45:56 +0800
Message-ID: <20250210024557.670568-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 05jsDYEuh9hYIX1C3eF7dlMbsKDuAG0e
X-Proofpoint-ORIG-GUID: 05jsDYEuh9hYIX1C3eF7dlMbsKDuAG0e
X-Authority-Analysis: v=2.4 cv=ULwnHDfy c=1 sm=1 tr=0 ts=67a96867 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=T2h4t0Lz3GQA:10 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=mdhTVFBBmYRi_-62aD0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_01,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 adultscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502100021
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Feb 2025 02:46:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9125

$ bitbake lib32-nerdctl
...
-buildmode=pie requires external (cgo) linking, but cgo is not enabled
make: *** [Makefile:63: nerdctl] Error 1
...

Get back the patch to allow external specification of build settings and rebase to v2.0.2

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...xternal-specification-of-build-setti.patch | 34 +++++++++++--------
 recipes-containers/nerdctl/nerdctl_git.bb     |  1 +
 2 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specification-of-build-setti.patch b/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specification-of-build-setti.patch
index ca7b3042..a384b9e6 100644
--- a/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specification-of-build-setti.patch
+++ b/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specification-of-build-setti.patch
@@ -1,25 +1,31 @@
-From 0e6809ea075acd3edf7de197cd4e190ccdad6361 Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@gmail.com>
-Date: Mon, 29 Mar 2021 20:50:47 -0400
+From d254c922f14ca20d09d5258aa908a1105c6acd73 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sun, 9 Feb 2025 21:06:29 +0800
 Subject: [PATCH] Makefile: allow external specification of build settings
 
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+
+Rebase to v2.0.2
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- Makefile | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
+ src/import/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: nerdctl-v2.0.0-beta.1/src/import/Makefile
-===================================================================
---- nerdctl-v2.0.0-beta.1.orig/src/import/Makefile
-+++ nerdctl-v2.0.0-beta.1/src/import/Makefile
-@@ -38,7 +38,7 @@
+diff --git a/src/import/Makefile b/src/import/Makefile
+index ae4e18c..eb22f9f 100644
+--- a/src/import/Makefile
++++ b/src/import/Makefile
+@@ -45,7 +45,7 @@ endif
  
  GO_BUILD_LDFLAGS ?= -s -w
  GO_BUILD_FLAGS ?=
--export GO_BUILD=GO111MODULE=on CGO_ENABLED=0 GOOS=$(GOOS) $(GO) build -ldflags "$(GO_BUILD_LDFLAGS) -X $(PACKAGE)/pkg/version.Version=$(VERSION) -X $(PACKAGE)/pkg/version.Revision=$(REVISION)"
-+export GO_BUILD=$(GO) build -ldflags "$(GO_BUILD_LDFLAGS) -X $(PACKAGE)/pkg/version.Version=$(VERSION) -X $(PACKAGE)/pkg/version.Revision=$(REVISION)"
+-export GO_BUILD=CGO_ENABLED=0 GOOS=$(GOOS) $(GO) -C $(MAKEFILE_DIR) build -ldflags "$(GO_BUILD_LDFLAGS) $(VERBOSE_FLAG) -X $(PACKAGE)/pkg/version.Version=$(VERSION) -X $(PACKAGE)/pkg/version.Revision=$(REVISION)"
++export GO_BUILD=GOOS=$(GOOS) $(GO) -C $(MAKEFILE_DIR) build -ldflags "$(GO_BUILD_LDFLAGS) $(VERBOSE_FLAG) -X $(PACKAGE)/pkg/version.Version=$(VERSION) -X $(PACKAGE)/pkg/version.Revision=$(REVISION)"
+ 
+ recursive_wildcard=$(wildcard $1$2) $(foreach e,$(wildcard $1*),$(call recursive_wildcard,$e/,$2))
  
- ifdef VERBOSE
- 	VERBOSE_FLAG := -v
+-- 
+2.34.1
+
diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers/nerdctl/nerdctl_git.bb
index 63b96846..84734c9f 100644
--- a/recipes-containers/nerdctl/nerdctl_git.bb
+++ b/recipes-containers/nerdctl/nerdctl_git.bb
@@ -19,6 +19,7 @@ include src_uri.inc
 
 # patches and config
 SRC_URI += " \
+            file://0001-Makefile-allow-external-specification-of-build-setti.patch \
             file://modules.txt \
            "
 
-- 
2.34.1


