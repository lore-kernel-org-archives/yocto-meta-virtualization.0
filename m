Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FB7CCF9E3
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 13:19:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10876.1761311961129998093
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 06:19:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hwXrKV73;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23922b9735=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59O5wTjG2887757
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Oct 2025 13:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=+YVgZffKi1EG2RPpRVYi
	5yVcXP1kZ8tnpWWEMV2mihU=; b=hwXrKV7300Jk2ByjbbLdxlwugAfLhXiuTl1q
	1utfyLvDPVx0mMT4AMaJ59UDQAKvqTTo/4tfE+TI9ami2piWVRg0XLcPyD426ksK
	2gCxVp3SnWBkVuoLf5BIe/cesk886iTZKEhmpsLYRRP6dX0SLhkJVH8knfkBOOVw
	dIT8qiwOTPWhZtG1TriVbHp4Q1d3wudLHq2uV+eMXHVH7wV0XEXmrUhjRBW3E2JW
	t6PFBJ09Uk3X3ivMiTOJVx9rHEu82B1q20/UI7SzXvZoYZRd/UBRlWNQtpjSh1b7
	OPkZLOqgxtYr5KPJ3J8xPSNQj0jJbZzERXCge4FO06fJhr6Zkw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49y8athxdk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Oct 2025 13:19:19 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 24 Oct 2025 06:19:18 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 24 Oct 2025 06:19:17 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][meta-cloud-services][kirkstone][PATCH 1/1]  python3-ansible: Upgrade 2.14.11 -> 2.14.18
Date: Fri, 24 Oct 2025 18:49:12 +0530
Message-ID: <20251024131912.1227742-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=N9ck1m9B c=1 sm=1 tr=0 ts=68fb7cd8 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=5h67h_9zRmsA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=JbN0BoUleDxAYiGwU_kA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=6_D5ljFcL1GZDUJyZucp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI0MDExOSBTYWx0ZWRfXyfyAJyt7k+QT
 QNLH+V9KP79CLlX2svkxnmJuBXf62d9MpppZ2S+AEPBMFYsWT4weeiJ/1KcaZLnNjj1S4x6oObc
 pYJkCgVkItgUGX/gO2AVBqca3mU6TQxNvyMpzCHmDEYevH8UDPY3YcRKNFAV7AhpOW+vYVpQwxY
 fMkSSQ7ViTzcMtYYkBQLkVUkqBaSZ7TIPuxzQrL0nwVUMQZyt5NRlv+TncCYn79EoGarwvXOJJZ
 Agi7L44Yll47vwB0eX4HvZrzlOkijAVB17p0fSdGqo97eIvs7lo2H1xVz/5XGG8ZnB4ImKQLW7W
 zAjOmXn1QyVQ4KJcgQjw8LG+WvwyIqSo3torsMD/VAUzi8P9e1IGvdpL4HSy3qHE8RgnypCGsQ+
 yBWBXj+3NxXvRmlszrVDA5WDmjquBw==
X-Proofpoint-ORIG-GUID: -hXBEbKB3piIZ8DKEg_rkfWxj-a9uN-q
X-Proofpoint-GUID: -hXBEbKB3piIZ8DKEg_rkfWxj-a9uN-q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 phishscore=0 suspectscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510240119
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Oct 2025 13:19:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9423

From: Soumya Sambu <soumya.sambu@windriver.com>

Includes fixes for - CVE-2023-5764, CVE-2024-0690, CVE-2024-9902 and
CVE-2024-8775

Release notes:
https://github.com/ansible/ansible/blob/v2.14.18/changelogs/CHANGELOG-v2.14.rst#v2-14-18

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 recipes-devtools/python/python-ansible.inc                      | 2 +-
 .../{python3-ansible_2.14.11.bb => python3-ansible_2.14.18.bb}  | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename recipes-devtools/python/{python3-ansible_2.14.11.bb => python3-ansible_2.14.18.bb} (100%)

diff --git a/recipes-devtools/python/python-ansible.inc b/recipes-devtools/python/python-ansible.inc
index c31d10ed..a8b5e099 100644
--- a/recipes-devtools/python/python-ansible.inc
+++ b/recipes-devtools/python/python-ansible.inc
@@ -8,7 +8,7 @@ SRCNAME = "ansible"
 
 SRC_URI = "git://github.com/ansible/ansible.git;protocol=https;branch=stable-2.14"
 
-SRCREV = "dcdb718f7a4c03f174030db425eee2a551ab2698"
+SRCREV = "b670a4ca81b6712535973b9e9aaaff58dd22bf91"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-devtools/python/python3-ansible_2.14.11.bb b/recipes-devtools/python/python3-ansible_2.14.18.bb
similarity index 100%
rename from recipes-devtools/python/python3-ansible_2.14.11.bb
rename to recipes-devtools/python/python3-ansible_2.14.18.bb
-- 
2.40.0


