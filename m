Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD66C07E8E
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 10:47:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13362.1713955662743512185
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Apr 2024 03:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=N+OLyueL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=48443a9d6c=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43O4Kf4B005318
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Apr 2024 10:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=yPyMpmbvj6tzHoYPQ+YWUQ4gYOYjKVJsgES1cpV6uo4=; b=
	N+OLyueLHESsZnkD0WdV9yli+zTvDDQ/8RVnBUet4dHC4mWD2ApAqYsh72NZjnfp
	oL36Aq6BVxo37ahsK/oGnbJZ8SfkC7kIRU2bUPQt8s4ahGrRkU/7apWHBuU8iHDL
	bC+uB0OqXyzcjJrOyQOinLa+MkDDuscARlYXn3r/fdJH8LBGPveECULyNhJZOR2U
	IUo6TaWC3t6DT9c31UemZJB92sn4qM3uXY6ceY0XWDUsAQpqF/oK9Db1wCeGvnPm
	jDq4SuKWy2DuQWw9J7bVAFwUpwTt1v2Sn+wDdjR02LH+IRmwbyTf63EVKRg/F3+U
	g2Ziytih6XgLB0EyU2yqFQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xm4p7c1cw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Apr 2024 10:47:41 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 24 Apr 2024 03:47:40 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Wed, 24 Apr 2024 03:47:39 -0700
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [master][scarthgap][meta-virtualization][PATCH V2 2/3] containerd-opencontainers: fix wrong version display
Date: Wed, 24 Apr 2024 18:47:38 +0800
Message-ID: <20240424104738.51167-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <17C929193068BD98.1247@lists.yoctoproject.org>
References: <17C929193068BD98.1247@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: g-PH67ykzotagXTGaAGFSA1HnDpJwmwh
X-Proofpoint-GUID: g-PH67ykzotagXTGaAGFSA1HnDpJwmwh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-24_08,2024-04-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404240044
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Apr 2024 10:47:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8701

From: Changqing Li <changqing.li@windriver.com>

* Update containerd to v2 to fix following containerd version:
containerd github.com/containerd/containerd/v2 2.0.0-beta.0+unknown
it should be like:
containerd github.com/containerd/containerd/v2 v2.0.0-beta.2-204-gb1624c362.m b1624c3628954e769dd50783b63823040b2db38c.m

* Remove CONTAINERD_PKG, it is not used

* Update default PACKAGE in Makefile to v2

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...akefile-update-default-PACKAGE-to-v2.patch | 28 +++++++++++++++++++
 .../containerd-opencontainers_git.bb          |  7 ++---
 2 files changed, 31 insertions(+), 4 deletions(-)
 create mode 100644 recipes-containers/containerd/containerd-opencontainers/0001-Makefile-update-default-PACKAGE-to-v2.patch

diff --git a/recipes-containers/containerd/containerd-opencontainers/0001-Makefile-update-default-PACKAGE-to-v2.patch b/recipes-containers/containerd/containerd-opencontainers/0001-Makefile-update-default-PACKAGE-to-v2.patch
new file mode 100644
index 00000000..74e313b5
--- /dev/null
+++ b/recipes-containers/containerd/containerd-opencontainers/0001-Makefile-update-default-PACKAGE-to-v2.patch
@@ -0,0 +1,28 @@
+From eb39888898a9d196e3eb63724c6c07777f3b9402 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 24 Apr 2024 14:10:11 +0800
+Subject: [PATCH] Makefile: update default PACKAGE to v2
+
+Upstream-Status: Submitted [https://github.com/containerd/containerd/pull/10125]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index a5b244191..cb9ff4172 100644
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
+-- 
+2.25.1
+
diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
index 10d1ce8b..ed73e398 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -6,9 +6,10 @@ DESCRIPTION = "containerd is a daemon to control runC, built for performance and
 
 
 SRCREV = "b1624c3628954e769dd50783b63823040b2db38c"
-SRC_URI = "git://github.com/containerd/containerd;branch=main;protocol=https;destsuffix=git/src/github.com/containerd/containerd \
+SRC_URI = "git://github.com/containerd/containerd;branch=main;protocol=https;destsuffix=git/src/github.com/containerd/containerd/v2 \
            file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch \
            file://0001-build-don-t-use-gcflags-to-define-trimpath.patch \
+           file://0001-Makefile-update-default-PACKAGE-to-v2.patch \
           "
 
 # Apache-2.0 for containerd
@@ -23,7 +24,7 @@ CVE_VERSION = "v2.0.0-beta.0"
 PROVIDES += "virtual/containerd"
 RPROVIDES:${PN} = "virtual-containerd"
 
-S = "${WORKDIR}/git/src/github.com/containerd/containerd"
+S = "${WORKDIR}/git/src/github.com/containerd/containerd/v2"
 
 PV = "${CONTAINERD_VERSION}+git"
 
@@ -32,8 +33,6 @@ inherit goarch
 
 GO_IMPORT = "import"
 
-CONTAINERD_PKG="github.com/containerd/containerd"
-
 INSANE_SKIP:${PN} += "ldflags"
 
 do_configure[noexec] = "1"
-- 
2.25.1


