Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E63FC2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 10:17:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9613.1720520221231153441
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Jul 2024 03:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7920c6e60c=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4694XCW7017879
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 9 Jul 2024 10:17:00 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 406u4x2mha-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Jul 2024 10:17:00 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 03:16:59 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 03:16:59 -0700
From: <mingli.yu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH 2/2] docker-distribution: Use dup3 for riscv64
Date: Tue, 9 Jul 2024 18:16:57 +0800
Message-ID: <20240709101657.601908-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240709101657.601908-1-mingli.yu@windriver.com>
References: <20240709101657.601908-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Mo-hJn_OUYOvLGNGd7gImyNFqrLNHqzz
X-Proofpoint-GUID: Mo-hJn_OUYOvLGNGd7gImyNFqrLNHqzz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_01,2024-07-08_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407090069
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Jul 2024 10:17:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8821

From: Mingli Yu <mingli.yu@windriver.com>

Use dup3 instead for riscv64 as there is no dup2 on riscv64 linux
to fix the below build failure:
  vendor/github.com/bugsnag/panicwrap/dup2.go:10:9: undefined: syscall.Dup2

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../docker-distribution_git.bb                |  1 +
 ...-panicwrap-Use-dup3-on-riscv64-linux.patch | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 recipes-containers/docker-distribution/files/0001-panicwrap-Use-dup3-on-riscv64-linux.patch

diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index 4e64df4f..bb4a7cbf 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -7,6 +7,7 @@ SRCREV_distribution= "d607c6ccb9372e05556624f973119a23d3a42987"
 SRC_URI = "git://github.com/docker/distribution.git;branch=release/2.8;name=distribution;destsuffix=git/src/github.com/docker/distribution;protocol=https \
            file://docker-registry.service \
            file://0001-build-use-to-use-cross-go-compiler.patch \
+           file://0001-panicwrap-Use-dup3-on-riscv64-linux.patch \
           "
 
 PACKAGES =+ "docker-registry"
diff --git a/recipes-containers/docker-distribution/files/0001-panicwrap-Use-dup3-on-riscv64-linux.patch b/recipes-containers/docker-distribution/files/0001-panicwrap-Use-dup3-on-riscv64-linux.patch
new file mode 100644
index 00000000..753afef7
--- /dev/null
+++ b/recipes-containers/docker-distribution/files/0001-panicwrap-Use-dup3-on-riscv64-linux.patch
@@ -0,0 +1,42 @@
+From 21d54c68751760b1f8915807794a432cf01fb733 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Tue, 9 Jul 2024 16:28:14 +0800
+Subject: [PATCH] panicwrap: Use dup3 on riscv64 linux
+
+Use dup3 instead for riscv64 as there is no dup2 on riscv64 linux
+to fix the below failure:
+  vendor/github.com/bugsnag/panicwrap/dup2.go:10:9: undefined: syscall.Dup2
+
+Upstream-Status: Inappropriate [The upstream has removed the panicwrap as [1]]
+
+[1] https://github.com/distribution/distribution/commit/3e4c4ead4c3aa07c27f95f2a5c92c6d5c2f9dcdb
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ vendor/github.com/bugsnag/panicwrap/dup2.go | 2 +-
+ vendor/github.com/bugsnag/panicwrap/dup3.go | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/vendor/github.com/bugsnag/panicwrap/dup2.go b/vendor/github.com/bugsnag/panicwrap/dup2.go
+index de523c83..c68ce5ff 100644
+--- a/vendor/github.com/bugsnag/panicwrap/dup2.go
++++ b/vendor/github.com/bugsnag/panicwrap/dup2.go
+@@ -1,4 +1,4 @@
+-// +build darwin dragonfly freebsd linux,!arm64 netbsd openbsd
++// +build darwin dragonfly freebsd linux,!arm64,!riscv64 netbsd openbsd
+ 
+ package panicwrap
+ 
+diff --git a/vendor/github.com/bugsnag/panicwrap/dup3.go b/vendor/github.com/bugsnag/panicwrap/dup3.go
+index 9721b36c..c664da85 100644
+--- a/vendor/github.com/bugsnag/panicwrap/dup3.go
++++ b/vendor/github.com/bugsnag/panicwrap/dup3.go
+@@ -1,4 +1,4 @@
+-// +build linux,arm64
++// +build linux,arm64 linux,riscv64
+ 
+ package panicwrap
+ 
+-- 
+2.34.1
+
-- 
2.34.1


