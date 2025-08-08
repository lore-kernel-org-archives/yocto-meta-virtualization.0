Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E342C87FD3
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 15:40:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.25622.1754667605907946942
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 08 Aug 2025 08:40:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0315a3a500=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 578Akjnl3889086;
	Fri, 8 Aug 2025 15:40:04 GMT
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48bpyeu81v-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 08 Aug 2025 15:40:04 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Fri, 8 Aug 2025 08:40:03 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Fri, 8 Aug 2025 08:40:00 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Chen Qi <Qi.Chen@windriver.com>,
        Bruce Ashfield
	<bruce.ashfield@gmail.com>,
        Praveen Kumar <praveen.kumar@windriver.com>
Subject: [meta-virtualization][scarthgap][PATCH 3/3] podman: remove ptest
Date: Fri, 8 Aug 2025 21:09:40 +0530
Message-ID: <20250808153940.331823-3-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250808153940.331823-1-praveen.kumar@windriver.com>
References: <20250808153940.331823-1-praveen.kumar@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA4MDEyNyBTYWx0ZWRfX0Has0wxV+mKO
 WQdNNRHivb2HuoNWCgVcAcQYwOygBUEe8QqtwCyHHXZEG373FSa80+TqeBgP6y2xMITDCf130a0
 5E/krrdTSrUGU6FLD2opLGHW6zaH/0/EO4F6E17mbUVqph9Okt6NjbIdwS6yfGg4k53bMGopKLI
 1f2iUdi6rjuOoevW7g61jzd8E9aiL8oOFw9lw7/n7Mv68Zw52PCd7aVrQj3L2FI1BfIcb4Veeuy
 Oa+8dmKAOhHea3z4gGmtR4pzMxPDM6BrGpXrjQWaFlQDJP+QSFUia35RBFufZHMDNHI3lTv6Usn
 M6hza49oxkjQf9l0iqFDA/tjg6R5MpZSDrg8MThslvWKfSTFpUA0jLJEAlPs30=
X-Proofpoint-GUID: G8GpNKrH3bLYNrHlZVYVytbFVtZ3OSP1
X-Proofpoint-ORIG-GUID: G8GpNKrH3bLYNrHlZVYVytbFVtZ3OSP1
X-Authority-Analysis: v=2.4 cv=GdwXnRXL c=1 sm=1 tr=0 ts=68961a54 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=VZzbbjECq-QA:10 a=2OwXVqhp2XgA:10 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=NEAV23lmAAAA:8 a=GGG8yvnbdUe2qA_yY_UA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 bulkscore=0 impostorscore=0 suspectscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Aug 2025 15:40:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9347

From: Chen Qi <Qi.Chen@windriver.com>

The ptest was added almost three years ago and since then nobody
ever fixed anything. It's almost impossible that the ptest never
failed. As an evidence, for the current version, the test cases
cannot even run.

Remove this ptest. People who care about podman ptest should be
maintaining it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit a8175deded4decb9b889901caabb48bf8c4edc73)

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 recipes-containers/podman/podman/run-ptest | 13 -----------
 recipes-containers/podman/podman_git.bb    | 27 +---------------------
 2 files changed, 1 insertion(+), 39 deletions(-)
 delete mode 100644 recipes-containers/podman/podman/run-ptest

diff --git a/recipes-containers/podman/podman/run-ptest b/recipes-containers/podman/podman/run-ptest
deleted file mode 100644
index 108ff451..00000000
--- a/recipes-containers/podman/podman/run-ptest
+++ /dev/null
@@ -1,13 +0,0 @@
-#!/bin/sh
-
-# SPDX-FileCopyrightText: Huawei Inc.
-#
-# SPDX-License-Identifier: MIT
-
-#
-# Podman system tests
-#
-
-# The system tests don't need any go related variables. Dummy-define them to
-# avoid useless warnings/errors.
-GOOS=undefined GO=true BUILDTAGS= make localsystem
diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index d3fa38ed..36c44dc6 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -21,7 +21,6 @@ SRCREV = "bb81e85a430fa95d23a15b77c717fd68bf06ebf2"
 SRC_URI = " \
     git://github.com/containers/libpod.git;branch=v5.0;protocol=https \
     ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-rootless.conf', '', d)} \
-    file://run-ptest \
     file://0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch;patchdir=src/import/vendor/github.com/containers/storage \
     file://CVE-2025-6032.patch;patchdir=src/import \
     file://CVE-2024-9341.patch;patchdir=src/import \
@@ -58,7 +57,7 @@ TOOLCHAIN = "gcc"
 export BUILDFLAGS="${GOBUILDFLAGS}"
 
 inherit go goarch
-inherit systemd pkgconfig ptest
+inherit systemd pkgconfig
 
 do_configure[noexec] = "1"
 
@@ -123,17 +122,6 @@ do_install() {
 	fi
 }
 
-do_install_ptest () {
-	cp ${S}/src/import/Makefile ${D}${PTEST_PATH}
-	install -d ${D}${PTEST_PATH}/test
-	cp -r ${S}/src/import/test/system ${D}${PTEST_PATH}/test
-
-	# Some compatibility links for the Makefile assumptions.
-	install -d ${D}${PTEST_PATH}/bin
-	ln -s ${bindir}/podman ${D}${PTEST_PATH}/bin/podman
-	ln -s ${bindir}/podman-remote ${D}${PTEST_PATH}/bin/podman-remote
-}
-
 FILES:${PN} += " \
     ${systemd_unitdir}/system/* \
     ${nonarch_libdir}/systemd/* \
@@ -164,16 +152,3 @@ RRECOMMENDS:${PN} += "slirp4netns \
                       kernel-module-xt-tcpudp \
                       "
 RCONFLICTS:${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'docker', 'docker', '', d)}"
-
-RDEPENDS:${PN}-ptest += " \
-	bash \
-	bats \
-	buildah \
-	catatonit \
-	coreutils \
-	file \
-	gnupg \
-	jq \
-	make \
-	tar \
-"
-- 
2.40.0


