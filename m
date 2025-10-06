Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22AACCCA470
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 04:49:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.26332.1759726191299962153
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 05 Oct 2025 21:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=H9EOKwro;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2374801d94=divya.chellam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5964dLa54050230
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 6 Oct 2025 04:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=bK50OPlMzRsrE23icbNW
	mn/yaYMj5UVAeZx7FTuMg8Y=; b=H9EOKwrouSeK2SKn1nuW+vTUiJGjBsW3l5Zu
	1A/8MaR/qcdG0Zphf5flb1LPGgb2cUx5RPGYllLkB4t4tCLy2rvOw4qIsHyR24VS
	5gJF8r2wkDroYG6bUKfMWkH7OUtauXvLyPvq0DBGHgS87rRimYOa3a3UqvsC67+Y
	cuqN1TKLZ/fk1yDRC5ZuDtg9N/7JLbaPtlCmcbypyDtUH0y5pHjUiGSJfesPJBrs
	YIW+4uYS9LaSaLmmGHcdBnpziJ94HJejV8gFM4Fj0WNog4UKj6W8vMI2HCSy7iX4
	S7c0iooC4W4YV0siV/o1aV3QQYKPvvUCTHCuzAmKOZ0vhciZLg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49jtj39c4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Oct 2025 04:49:49 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Sun, 5 Oct 2025 21:49:47 -0700
From: dchellam <divya.chellam@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] buildah: update to v1.41.5
Date: Mon, 6 Oct 2025 10:19:23 +0530
Message-ID: <20251006044924.875740-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-GUID: APr02X1PMVAH68UQO2xX2ybNFtFDQSSn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDAzNiBTYWx0ZWRfXybGsvg1MHJYU
 Md7GPwZpRnX7zlzP3MC9RhZEjLZEuCg8YmDXQfdh7tzrwxUWDoztKQuBdIAg8sdLKtydk3velDS
 XwykKNO0KuTx7bL/Ua1ZbrTEagHNC8TPt4i9++i5t5lrTGA1QyH+OSia/yXEZ9DYNzTTZu8+36J
 D0mRThOyjDvjjDIzdy/GjklIvsa+xtgl5GPZ+RR+E4kPCvsBrxU7KoP8mqHmEWoGd1Fh7Fw4x5k
 LmLc/X3YB5qeH1O4y+8xN8wKKAjcz65hPB4EvchdqWQp4taoP05ZaU+44QxO7OsHqpXDBxIYysT
 i5j3p30As2I/1YAYwH9uF8OwjQ2Ac4uwxms1JGhTx4PCp9UjL9gAAHYz1R0UURvbXl2DyUn2UwW
 8IHOTVGQR8SLYVCg9tBJlOYDcqxXzg==
X-Proofpoint-ORIG-GUID: APr02X1PMVAH68UQO2xX2ybNFtFDQSSn
X-Authority-Analysis: v=2.4 cv=CqCys34D c=1 sm=1 tr=0 ts=68e34a6e cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=x6icFKpwvdMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=4vTCAgI0kX3C3dbd-RcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_02,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1011 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2510060036
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Oct 2025 04:49:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9411

From: Divya Chellam <divya.chellam@windriver.com>

Changelog:
==========
https://github.com/containers/buildah/compare/v1.41.3...v1.41.5

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 recipes-containers/buildah/buildah_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
index ff46f6cd..f1acc33a 100644
--- a/recipes-containers/buildah/buildah_git.bb
+++ b/recipes-containers/buildah/buildah_git.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "A tool that facilitates building OCI container images."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/github.com/containers/buildah/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
 
-BUILDAH_VERSION = "1.41.3"
+BUILDAH_VERSION = "1.41.5"
 
 PV = "${BUILDAH_VERSION}"
 
@@ -25,7 +25,7 @@ GO_INSTALL = "${GO_IMPORT}"
 GO_WORKDIR = "${GO_INSTALL}"
 GOBUILDFLAGS += "-mod vendor"
 
-SRCREV = "a56e4970194e2f3b2c351620f1ae4a7fc50756bd"
+SRCREV = "7d95c695cdc187a1d6e7b152037dd52c8d2b0904"
 
 SRC_URI = " \
     git://github.com/containers/buildah;branch=release-1.41;name=buildah;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
-- 
2.40.0


