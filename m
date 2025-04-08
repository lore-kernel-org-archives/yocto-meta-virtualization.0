Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADBE3C3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 10:57:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.71904.1744109821515728615
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 08 Apr 2025 03:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6193c270de=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5385ASnS016454
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 8 Apr 2025 03:57:01 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tyt4bfcm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Apr 2025 03:57:00 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 8 Apr 2025 03:57:00 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 8 Apr 2025 03:56:58 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][meta-cloud-services][master][scarthgap][PATCH 1/1]  python3-ansible: Upgrade 2.17.6 -> 2.17.7
Date: Tue, 8 Apr 2025 10:56:54 +0000
Message-ID: <20250408105654.1933617-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: PFhqA1l-_9UXzUyVDXpHSOBFgw-zIy5U
X-Authority-Analysis: v=2.4 cv=RMSzH5i+ c=1 sm=1 tr=0 ts=67f500fc cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=5h67h_9zRmsA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=BADSVSjyLGGMyzrP4KcA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: PFhqA1l-_9UXzUyVDXpHSOBFgw-zIy5U
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_03,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1011
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504080078
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Apr 2025 10:57:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9207

From: Soumya Sambu <soumya.sambu@windriver.com>

Fixes CVE-2024-11079 and other bugs

Changelog:
==========
https://github.com/ansible/ansible/blob/v2.17.7/changelogs/CHANGELOG-v2.17.rst#v2-17-7

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 recipes-devtools/python/python-ansible.inc                      | 2 +-
 .../{python3-ansible_2.17.6.bb => python3-ansible_2.17.7.bb}    | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename recipes-devtools/python/{python3-ansible_2.17.6.bb => python3-ansible_2.17.7.bb} (100%)

diff --git a/recipes-devtools/python/python-ansible.inc b/recipes-devtools/python/python-ansible.inc
index a528f246..4bb90cb7 100644
--- a/recipes-devtools/python/python-ansible.inc
+++ b/recipes-devtools/python/python-ansible.inc
@@ -8,7 +8,7 @@ SRCNAME = "ansible"
 
 SRC_URI = "git://github.com/ansible/ansible.git;protocol=https;branch=stable-2.17"
 
-SRCREV = "05e01efa8534d19956133e19e9e84aad720abb0d"
+SRCREV = "dc0e3bd16cc7ded081bc46c88e4e3d1997ca9bb0"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-devtools/python/python3-ansible_2.17.6.bb b/recipes-devtools/python/python3-ansible_2.17.7.bb
similarity index 100%
rename from recipes-devtools/python/python3-ansible_2.17.6.bb
rename to recipes-devtools/python/python3-ansible_2.17.7.bb
-- 
2.40.0


