Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62E6FE51FA
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 09:47:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17773.1777024064763565402
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 02:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BEYQAjcu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8574f8b4ec=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O5QY6T4120347
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Apr 2026 02:47:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=MTWkq45mV985dJ0PQjt0
	hWpiMVNDXD7osHozy0IyC2g=; b=BEYQAjculifzaCejJvYAQS8cisFBbE/BdIDR
	2TU1NujfyfjW1mgXbRQmUr5HVQveN3DZ62U8MpGIGsdJjTt7HsFoTpL01DWN+Sxw
	VbVP/sfjxC5Q4izR5uCnE3T4IgEWizk038yqEbhvZcw7+PSkW8NpI1BR1H0io/Eg
	6S0UBBAE6/W/ll4kFCxrIWYRRjO33w7vXIH0jCUQ2Cyzq64aQNbz1MksRowXwZKb
	UU5dzkmDrPnq5iTZ+rDwBpNrzCMTbNWwxSHryp2dH53c/R6BusGhNd7zdaaggofO
	Enea+S6xXWsWCUD3SI9lJZXVe1lTdizdCIQ1a9axscf0BU8l0w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dq8rcsuat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Apr 2026 02:47:43 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 24 Apr 2026 02:47:43 -0700
Received: from ala-lpggp9.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 24 Apr 2026 02:47:43 -0700
From: <mingli.yu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [scarthgap][PATCH v2] podman: Upgrade 5.0.1 -> 5.0.3
Date: Fri, 24 Apr 2026 02:47:38 -0700
Message-ID: <20260424094738.2143616-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ZhLZY2antFFrTk8qACuraNJGaAZJDSvL
X-Authority-Analysis: v=2.4 cv=MYhcfZ/f c=1 sm=1 tr=0 ts=69eb3c40 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=8hG23R3pAAAA:20 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=PSyxYiHzna0yrPD1X3YA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: ZhLZY2antFFrTk8qACuraNJGaAZJDSvL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA5MSBTYWx0ZWRfX3HIUGlxjsB1f
 +diNfpuwdfurxXS/f4JgkbRrU04BpifVEKMH31c3b9ZMqhpevisAiJtnUK4WhT9GSqmgfEfw7Pw
 LQRGtB02HjOt3OJXwnLWkXdk1aJzGUdAGJ7Z2NtsiotYaLmOQSMD8lSoFf1flT+7PBQ5mgBH1VI
 UzcSxiHS5nRV3S/oGI3sLvT2C0kiTva1YcuXSFqvJXyz4rx0dcRmNTQznLM/kYYCeISmu5VyCh1
 fh3U+X6nUO0z3jiCddfE126dKbomLz6iJ6TMWSRKDCaBVzxt8s97XeX5+HkHAvOg1U6mtVBdWjZ
 mRGIJGJxlgZ7W28xtnkoJwwexZmMsSX6pKZCF0ItENtBzT9Bb03sQxr8SXW9SJkChVsUH2bMrNA
 IwAEJK8teqg5OUQP8tIX+Pb1QsGtW6/0O+lS60Db+YkD+1/Ax48jwP8PrJK25L1gWA0XuxYmd/P
 X+5VC2wz4MqxxYQVCoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240091
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Apr 2026 09:47:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9742

From: Mingli Yu <mingli.yu@windriver.com>

Upgrade podman to 5.0.3 to include some bugfixes and some security fix
such as CVE-2024-3727 [1].

Release notes:
Security
  This release addresses CVE-2024-3727, a vulnerability in the
containers/image library which allows attackers to trigger authenticated
registry access on behalf of the victim user.

Bugfixes
  Fixed a bug where podman machine start would fail if the machine
had a volume with a long target path (#22226).
  Fixed a bug where podman machine start mounted volumes with paths
that included dashes in the wrong location (#22505).

Misc
  Updated Buildah to v1.35.4
  Updated the containers/common library to v0.58.3
  Updated the containers/image library to v5.30.1

[1] https://github.com/containers/podman/releases/tag/v5.0.3

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 recipes-containers/podman/podman_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index ef9798f0..b80b8d5b 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -17,7 +17,7 @@ DEPENDS = " \
     gettext-native \
 "
 
-SRCREV = "bb81e85a430fa95d23a15b77c717fd68bf06ebf2"
+SRCREV = "d08315df35cb6e95f65bf3935f529295c6e54742"
 SRC_URI = " \
     git://github.com/containers/libpod.git;branch=v5.0;protocol=https \
     ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-rootless.conf', '', d)} \
@@ -33,7 +33,7 @@ GO_IMPORT = "import"
 
 S = "${WORKDIR}/git"
 
-PV = "5.0.1+git"
+PV = "5.0.3+git"
 
 CVE_STATUS[CVE-2022-2989] = "fixed-version: fixed since v4.3.0"
 CVE_STATUS[CVE-2023-0778] = "fixed-version: fixed since v4.5.0"
-- 
2.49.0


