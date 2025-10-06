Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 237CDCCD182
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 04:49:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.26211.1759726191572254560
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 05 Oct 2025 21:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=h/a1BRfX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2374801d94=divya.chellam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5964dLa64050230
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 6 Oct 2025 04:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=VzslH6K4Heq2lYzKzBwFkZQ0v3lxaWlYHWbCu2chsiE=; b=h/a1BRfXhhuj
	3yumOqy6utXJDGVqhHGXEcl2pT8HugRgBRZujnqWtfCioseKT8oRurWzFRdxjeWz
	Zu6SYnwmHJDZWyWdJ24ZJpl3NQ1qWmLKxxjkFSMQRzWL+q4W3p3Yy5xDcv+H/QQt
	5rR0JjmpC6ynlifAkyDrRExWLShSJtqJBgywUGTqeejjs0GpztTM9pz/HlY0Riyt
	RKudaeZ/83AsBj8d7IBCeo9pmrxm/Q9gd8uCNxqWylecRzdyJNwz7NeSOkUV3GPt
	Ge4bfoggTmJjcjeTBEiulEx6vtU93Y4Jb5blh6lBpcMAgs0kj2i2woo+3vv8qEVs
	iEnQzhID2g==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49jtj39c4k-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Oct 2025 04:49:50 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Sun, 5 Oct 2025 21:49:48 -0700
From: dchellam <divya.chellam@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] podman: update to v5.6.2
Date: Mon, 6 Oct 2025 10:19:24 +0530
Message-ID: <20251006044924.875740-2-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251006044924.875740-1-divya.chellam@windriver.com>
References: <20251006044924.875740-1-divya.chellam@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-GUID: JiAcC2xVceGQtrkWgskQslvjal5mgLki
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDAzNiBTYWx0ZWRfXxnHoSn13B2Yr
 zhDauKhXJtFTZ06Ugg7LsCWekrRHcEkBsZLV7l9ARMT3fIjTmIaMZBpgURQ7JNBga4iVXtei/bs
 WS5LKdxdCfOtabJ5lDklx6hWLUSA5/ucwroEKmpbp+sZiA17Ns7P9B5cktkQDOdOvWtya2epz2r
 tyi6p6uBxp3C/ENUM+Tu7p+WjWYuilvIXhBN682Kdv6dy4Chjd6UXMPRZ5PFhS24WjhoINscANq
 4Rqi0exgkALqRiUihBGNUgphaewwwufpRFagReWrBo9C1yyDMtXKDVlNq8cRm9uveuKTTv96dx4
 E+HYrbfUNA3c3fvHhl6kLRxfhf3ijjpYAVtBKveMkqiLQX/Lk6BQkIhD7iBTsNn5ZL2HJ2WoBOm
 b/tZ7uDW2E1pG4ZVssBD3jfDy7HSug==
X-Proofpoint-ORIG-GUID: JiAcC2xVceGQtrkWgskQslvjal5mgLki
X-Authority-Analysis: v=2.4 cv=CqCys34D c=1 sm=1 tr=0 ts=68e34a6e cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=x6icFKpwvdMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=FtxsoFlTb1KdryurmSoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_02,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2510060036
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Oct 2025 04:49:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9412

From: Divya Chellam <divya.chellam@windriver.com>

This includes cve for CVE-2025-9566

Changelog:
==========
https://github.com/containers/podman/releases/tag/v5.6.1
https://github.com/containers/podman/releases/tag/v5.6.2

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 recipes-containers/podman/podman_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index c5e7b49d..89ee9a7c 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -16,7 +16,7 @@ DEPENDS = " \
     gettext-native \
 "
 
-SRCREV = "41224eb949be6fa380c11d8ef66c099462d2507f"
+SRCREV = "9dd5e1ed33830612bc200d7a13db00af6ab865a4"
 SRC_URI = " \
     git://github.com/containers/libpod.git;branch=v5.6;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
     ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-rootless.conf', '', d)} \
@@ -27,7 +27,7 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=3d9b931fa23ab1cacd0087f9e2ee12
 
 GO_IMPORT = "import"
 
-PV = "v5.6.0"
+PV = "v5.6.2"
 
 CVE_STATUS[CVE-2022-2989] = "fixed-version: fixed since v4.3.0"
 CVE_STATUS[CVE-2023-0778] = "fixed-version: fixed since v4.5.0"
-- 
2.40.0


