Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0284FCCA476
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 11:47:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.41655.1760356076971655372
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Oct 2025 04:47:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Fdrr6/5k;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=23817c5fde=divya.chellam@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59D6YJBK3955050
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Oct 2025 04:47:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=U9XNJg41kMfjAqkCwOra
	zRofxsdM7Y+jAQ0zPjOa9c8=; b=Fdrr6/5katBYx+B0uhRJ4Q2/QpS7h6QLcweW
	h5gj0K4mth9+wR1cIbMkGN46Sk16oP7rCpQAXSIEjIgDecrlfUbu05IlEs7+acHf
	4Qq5rE4UgR4H+i+FvMNnpTf7cTQSScMU2OIijZ42AqyPSVhbkGL6QJEdDQ0+LgeW
	r6gjiUvvtiux2i90HODnIomIcztmhiuZPpJ3Kzn89dWhowlOpQARBHrywTV3i1Vj
	1n5rGQ+eyNDnYBflCpNNKLjgoRLivEuBSFGME//e+/CE2jUUf/5Q2Ix7IE4/v+sb
	4BO0b+WSYLdTGFLt/GWw6/y47j49I+eWctRrLyx7V8PpHeNQbg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qprdseb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Oct 2025 04:47:56 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Mon, 13 Oct 2025 04:47:54 -0700
From: dchellam <divya.chellam@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][walnascar][PATCH 1/2] podman: remove ptest
Date: Mon, 13 Oct 2025 17:17:24 +0530
Message-ID: <20251013114725.2268483-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA1MyBTYWx0ZWRfX+5bPFdIBQRJD
 kIWsAnerfl0wXLmKl73LDbWV/ZqmbTOjIHLI53PrCBe08549I2C+soHwPwzCostGa6SmLJ5m0iD
 L8EJg5STgzRfSd+lhi7bAgnNiK6Schfn8+QPmeyXTk1OCbrlTTfy2MgMxSU3xiPwECggGae8VuS
 droDmHJIOs2cr6Z5m6otxrWzx9HQQKucVKLwerZa/TCWwBeUtW2v++b9qVtKtzKZk4CvcRwtMt5
 2j2DTPRprEgyE3GEZutHa1RPxXOifIDu87/YljEcZabHUiJ3F8g/6Z7BFKv7DXlF1VqX4jjYJca
 7V3HskQR/0C4K04xRxdF3MOGcOeRPDjhdp+trfVArhr3KA1GMF5Z0SK8IWxEAdlX6i/T6RIjsb8
 rtgfz7aFWHpIBXZ8zP+1p8Ux2mTvdg==
X-Proofpoint-GUID: MHaMcUsf-n2uSN5-9wvwvZNli5q64aZC
X-Authority-Analysis: v=2.4 cv=JaKxbEKV c=1 sm=1 tr=0 ts=68ece6ec cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=MkUnBrgfyNUA:10 a=gmxlzscTznEA:10 a=x6icFKpwvdMA:10 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=NEAV23lmAAAA:8 a=GGG8yvnbdUe2qA_yY_UA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=6_D5ljFcL1GZDUJyZucp:22
X-Proofpoint-ORIG-GUID: MHaMcUsf-n2uSN5-9wvwvZNli5q64aZC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510130053
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Oct 2025 11:47:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9414

From: Divya Chellam <divya.chellam@windriver.com>

The ptest was added almost three years ago and since then nobody
ever fixed anything. It's almost impossible that the ptest never
failed. As an evidence, for the current version, the test cases
cannot even run.

Remove this ptest. People who care about podman ptest should be
maintaining it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
(master rev: a8175deded4decb9b889901caabb48bf8c4edc73)

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
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
index d98521ba..a83764fc 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -20,7 +20,6 @@ SRCREV = "227df90eb7c021097c9ba5f8000c83648a598028"
 SRC_URI = " \
     git://github.com/containers/libpod.git;branch=v5.4;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
     ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-rootless.conf', '', d)} \
-    file://run-ptest \
     file://CVE-2025-6032.patch;patchdir=src/import \
 "
 
@@ -56,7 +55,7 @@ export BUILDFLAGS = "${GOBUILDFLAGS}"
 
 inherit go goarch
 inherit container-host
-inherit systemd pkgconfig ptest
+inherit systemd pkgconfig
 
 do_configure[noexec] = "1"
 
@@ -129,17 +128,6 @@ do_install() {
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
@@ -170,16 +158,3 @@ RRECOMMENDS:${PN} += "slirp4netns \
                       kernel-module-xt-tcpudp \
                       "
 RCONFLICTS:${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'docker', 'docker', '', d)}"
-
-RDEPENDS:${PN}-ptest += " \
-	bash \
-	bats \
-	buildah \
-	coreutils \
-	file \
-	gnupg \
-	jq \
-	make \
-	skopeo \
-	tar \
-"
-- 
2.40.0


