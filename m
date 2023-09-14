Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6685BEDE990
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 07:53:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6753.1694677987884041108
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 14 Sep 2023 00:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=a7Pd05P1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=76213d3f08=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38E6nDK6022886
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Sep 2023 00:53:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=kJSIEZrnx4rK2ZjvcoV2ZXZS6qg0M9xcukWoAxG8hV4=; b=
	a7Pd05P1pFBHpWbmCZUMs5e3kFugRpTgppo26VlRGCfaLAOfWyyNtm6PZ4ftLtbx
	mkckBPX7RQgU3bVFRt7Tgld7KHqsERetizE5LcqwQGCUBV2CmSEQvYDgYSPsVCZx
	MOmhCt1drMdWjP2MRz/y1IpMHDobO99Th5hzQG2tXSvxiZvkvTx82Q8cHwoxKmyq
	IjegxnekTmdt8XnBCXqbJi4LtaKStQurTnbXRy6G1KQG/e9JBBQNhptCTvOuk+ea
	vZKDbeKsColoF+RHtpABly/dc9vhjtDKRSsEg2c3dURj6bpUUdUyakan1PXuvx0K
	fr6Qoi7ZPFx1cAIPt+0a1g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t2yafhgxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Sep 2023 00:53:07 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 00:53:06 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 00:53:05 -0700
From: <kai.kang@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH v2 1/4] packagegroup-container: not compatible with mips and riscv
Date: Thu, 14 Sep 2023 15:52:57 +0800
Message-ID: <20230914075300.773380-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230914075300.773380-1-kai.kang@windriver.com>
References: <20230914075300.773380-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: uSjgUwmvuOtkhsk2RNlGPFC6bSsxpvg9
X-Proofpoint-ORIG-GUID: uSjgUwmvuOtkhsk2RNlGPFC6bSsxpvg9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_05,2023-09-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0
 mlxlogscore=583 priorityscore=1501 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309140069
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Sep 2023 07:53:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8304

From: Kai Kang <kai.kang@windriver.com>

The recipe docker-moby which is required by packagegroup-container is
not compatible with mips. And it inherits goarch.bbclass, so it is not
compatible with riscv32 too. Update COMPATIBLE_HOST accordingly for
packagegroup-container.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 recipes-core/packagegroups/packagegroup-container.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recipes-core/packagegroups/packagegroup-container.bb
index c41576a3..38a64637 100644
--- a/recipes-core/packagegroups/packagegroup-container.bb
+++ b/recipes-core/packagegroups/packagegroup-container.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 inherit packagegroup
 
-COMPATIBLE_HOST:riscv64 = "null"
+COMPATIBLE_HOST = "^(?!(mips|riscv)).*"
 
 PACKAGES = "\
     packagegroup-container \
-- 
2.34.1


