Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB06EEEB595
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 05:49:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5460.1694584146195290684
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Sep 2023 22:49:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rNEX61TP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7620fdf48a=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38D5NiZL021751
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Sep 2023 22:49:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=7N5qn
	lUYOkpNIHQss70KcSvC3juZjYEfSUXgqZskv9I=; b=rNEX61TP/Ec4Y6na5FAYq
	PLjVtYInV3aP/qRpoeU6MZRYo/oeB/SglI24iXEzSbdwDm/xJBlZY9JAEY0R3r2U
	iWe0JGYXXVytiOCtja9DSXFU/obWSx+awQUSPz0ERifnskuXKOw1wOs5pVnOHEAm
	tdOiCIYLy2yOKD+EeAT+JYKunsyAFajbH01pNWwGibYdY0+ytC2CIoSkg2nZdFwy
	ofVRfYNd+FU9gFMr58twzbf2CkmUMPdg7Ibz5SeX+1D4yf3RbRLeOJwvIsqO+Y/f
	6yNIJ1vqxtZwCJvqmMG77+KAR4ioxsEieisP9xJTC27FjnWPHuljNYw1+3qN4oYg
	g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t2y828amc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Sep 2023 22:49:05 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 12 Sep 2023 22:49:04 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 22:49:03 -0700
From: <kai.kang@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] packagegroup-container: not compatible with mips and riscv
Date: Wed, 13 Sep 2023 13:49:02 +0800
Message-ID: <20230913054902.3010136-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: vl0TXadiCjCoD0qu7Yda4NIz4ebb57he
X-Proofpoint-ORIG-GUID: vl0TXadiCjCoD0qu7Yda4NIz4ebb57he
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_24,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1011 malwarescore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=457 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2308100000
 definitions=main-2309130048
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Sep 2023 05:49:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8299

From: Kai Kang <kai.kang@windriver.com>

The recipes which are rdepended by packagegroup-container, such as
docker-moby, containerd-opencontainers etc, are not compatible with mips
and riscv32. So update COMPATIBLE_HOST for packagegroup-container.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 recipes-core/packagegroups/packagegroup-container.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recipes-core/packagegroups/packagegroup-container.bb
index c41576a3..11a02d74 100644
--- a/recipes-core/packagegroups/packagegroup-container.bb
+++ b/recipes-core/packagegroups/packagegroup-container.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 inherit packagegroup
 
-COMPATIBLE_HOST:riscv64 = "null"
+COMPATIBLE_HOST = "^(?!(qemu)?(mips|riscv)).*"
 
 PACKAGES = "\
     packagegroup-container \
-- 
2.34.1


