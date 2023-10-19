Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86939CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 09:51:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.23914.1697709072198583621
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 02:51:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XVIrnL1d;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=865684daa5=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39J7QMnB027529
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 19 Oct 2023 02:51:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=aviF4
	APZMOGxoAvDhxJ34bgATPZh12EOLsX8IF06vEc=; b=XVIrnL1d4Qlch2JRK8fdB
	noXWnloMxaiAg6QxYS9aqK13W+hEQDbeoJI3DDRF3pqkcecdsSnpeL9RDKaSicWl
	d0YhD0KVYwt3jgT/hBtbirTKm+JgLtDh983cboyU7ps2bpuuvKP0g0Z8Fh3aadlb
	9Y8ZS1y3XZln73N81EbrV2UpFbAqLt4CIYIIZXTqCidhEOfztdQ4fkvELxYxcTIb
	liBSFffgMTlow1hPqFiBRU6RsAi5NZNy20JsGcEOLxZlx17omPPckNSsfuVpEM8g
	HYJ7eE6BGEaqPFB0RGmSaQ+fPhm/rqhhkIU4YHI/fOfSaF20Ptj8OtufAdHRGc2P
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ttsgtge6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 19 Oct 2023 02:51:11 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 02:51:09 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][mickledore][PATCH 1/1] kubernetes: Upgrade v1.27.1 -> v1.27.5
Date: Thu, 19 Oct 2023 09:50:52 +0000
Message-ID: <20231019095052.1389561-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: SMPP1LGM191-YTT4i5PZtF7Zh-r0AHkp
X-Proofpoint-GUID: SMPP1LGM191-YTT4i5PZtF7Zh-r0AHkp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_07,2023-10-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 clxscore=1011 lowpriorityscore=0
 mlxlogscore=896 mlxscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310190083
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 19 Oct 2023 09:51:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8381

From: Soumya Sambu <soumya.sambu@windriver.com>

Addresses CVE-2023-2431, CVE-2023-2727, CVE-2023-2728,
CVE-2023-3676, CVE-2023-3955 and few other bugs.

Changelog:
https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.27.md#v1275

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 recipes-containers/kubernetes/kubernetes_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index 3a6e7119..560fd8b7 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -5,8 +5,8 @@ applications across multiple hosts, providing basic mechanisms for deployment, \
 maintenance, and scaling of applications. \
 "
 
-PV = "v1.27.1+git${SRCREV_kubernetes}"
-SRCREV_kubernetes = "2555e0f90e80a13628f47eca5cde34decc89babb"
+PV = "v1.27.5+git${SRCREV_kubernetes}"
+SRCREV_kubernetes = "93e0d7146fb9c3e9f68aa41b2b4265b2fcdb0a4c"
 SRCREV_kubernetes-release = "21382abdbfa8e6a43fd417306fa649cb651cc06e"
 PE = "1"
 
-- 
2.40.0


