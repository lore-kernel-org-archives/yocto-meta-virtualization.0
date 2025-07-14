Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3942AC83F20
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 05:36:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.71979.1752471377780371577
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 13 Jul 2025 22:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=92904b5727=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56E4tL50721533
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Jul 2025 05:36:16 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47ufb1sp2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Jul 2025 05:36:16 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Sun, 13 Jul 2025 22:36:15 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Sun, 13 Jul 2025 22:36:13 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>
Subject: [oe-core][walnascar][PATCH 1/1] git: upgrade 2.49.0 -> 2.49.1
Date: Mon, 14 Jul 2025 11:06:07 +0530
Message-ID: <20250714053607.2630780-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: nWeB2CqgrCunGYq7qa9uMa2JUjuAM9X_
X-Proofpoint-ORIG-GUID: nWeB2CqgrCunGYq7qa9uMa2JUjuAM9X_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAyMSBTYWx0ZWRfX1KwqpBSrKdLR
 uBVHqf5PS4rXJqWCI7HPTldgKn2x30ucRRM0+RjrMrdPM0tsWTMcDfXbBmiRZ5ZJb0CM7ktus4X
 lIsFcks+sysMlsOJuUuelRJ5BFxVnVWNAB7aoEwbpN3pglBgAB1xWdshYrwNiiYabkz+4lPPoF6
 EcBEgVpiZtvkca8+AI9SzRa0sRLXFYoxi6FpEZZL5r5sV35FjqrKWq93CHncLzHL+EUNt6q0qxE
 Z5YPCHINSyxojmd6Aqa8assPmfWs7OVia7SgoGZAdFxJYzWMvZZkpv9OYJ6v+9vn8FY73qB2o0K
 6npgPKCNaErX+qskJ6Wcr63W5AoIsTCWqc04jxdddjKNy8xFigd4IkNNPikAX+TOY2fm3IDiSPR
 ner3ZUSe
X-Authority-Analysis: v=2.4 cv=bOMWIO+Z c=1 sm=1 tr=0 ts=68749750 cx=c_pps
 a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17
 a=Wb1JkmetP80A:10 a=t7CeM3EgAAAA:8 a=9l0yIatMPKDccmscLj0A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507120021
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Jul 2025 05:36:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9307

Git v2.49.1 Release Notes
=========================
This release merges up the fixes that appear in v2.43.7, v2.44.4,
v2.45.4, v2.46.4, v2.47.3, and v2.48.2 to address the following CVEs:
CVE-2025-27613, CVE-2025-27614, CVE-2025-46334, CVE-2025-46835,
CVE-2025-48384, CVE-2025-48385, and CVE-2025-48386. See the release
notes for v2.43.7 for details.

It also contains some updates to various CI bits to work around and/or
to adjust to the deprecation of use of Ubuntu 20.04 GitHub Actions CI,
updates to to Fedora base image.

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 meta/recipes-devtools/git/{git_2.49.0.bb => git_2.49.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.49.0.bb => git_2.49.1.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.49.0.bb b/meta/recipes-devtools/git/git_2.49.1.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.49.0.bb
rename to meta/recipes-devtools/git/git_2.49.1.bb
index 3538170d08..2b310ded7a 100644
--- a/meta/recipes-devtools/git/git_2.49.0.bb
+++ b/meta/recipes-devtools/git/git_2.49.1.bb
@@ -170,4 +170,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "f8047f572f665bebeb637fd5f14678f31b3ca5d2ff9a18f20bd925bd48f75d3c"
+SRC_URI[tarball.sha256sum] = "84a8383ffc77146133bc128a544450cf8ce5166cbea5056c98033d2f0c454794"
-- 
2.40.0


