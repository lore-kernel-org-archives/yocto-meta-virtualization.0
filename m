Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D2D2EDE995
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 07:53:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6688.1694677989991999929
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 14 Sep 2023 00:53:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=muNxO2G2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=76213d3f08=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38E50ul3029592
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Sep 2023 07:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=c6F119fLUhj2KNEuAWSVjpUfm8GQHqIOSWCXBBnQDmc=; b=
	muNxO2G2kDKHYmczmqV8rouGNcHrbu+9D0uVeZqpVxnMFml9dwZSUGl8m4K2sIDh
	AvgXw8o0fvkwQv1Wz6zKslm/ddM0sOEkz5kmrHfh2QZOojhYd3MGGTWS9tkIXBH2
	DhH/WpDdPFvLbKs0+WdUekzMZyFwkynRrHj1Gu7TNjlN9vgNN45bteMKR9m0JO9T
	Qv/bT91aOqi1P5ooOhSwQJgCW5rrrgmlQHv/494WBQ1IbaBxKlFiEKamkqU94K/I
	V6iir85Uf4QnV0tWvL6gpiqhRj8lePt0dPXocaTo67QruAdhtFgh98EjxMZEW3It
	GNZM1aJ3SgdyHCaYgTc/DQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t2y8m9hwa-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Sep 2023 07:53:09 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 00:53:08 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 00:53:07 -0700
From: <kai.kang@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH v2 3/4] packagegroup-kubernetes: set COMPATIBLE_HOST
Date: Thu, 14 Sep 2023 15:52:59 +0800
Message-ID: <20230914075300.773380-4-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230914075300.773380-1-kai.kang@windriver.com>
References: <20230914075300.773380-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: FzUT670bFczkOR5AtLZsecTywgPBsVuL
X-Proofpoint-GUID: FzUT670bFczkOR5AtLZsecTywgPBsVuL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_05,2023-09-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=486 spamscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309140069
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Sep 2023 07:53:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8307

From: Kai Kang <kai.kang@windriver.com>

packagegroup-kubernetes requires kubernetes which is only compatible
with x86_64, arm and aarch64, so set COMPATIBLE_HOST for
packagegroup-kubernetes to align with it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 recipes-core/packagegroups/packagegroup-kubernetes.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-kubernetes.bb b/recipes-core/packagegroups/packagegroup-kubernetes.bb
index 7e6937b1..d518fc15 100644
--- a/recipes-core/packagegroups/packagegroup-kubernetes.bb
+++ b/recipes-core/packagegroups/packagegroup-kubernetes.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 inherit packagegroup
 
-COMPATIBLE_HOST:riscv64 = "null"
+COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
 
 # k3s has this restriction
 inherit features_check
-- 
2.34.1


