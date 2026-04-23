Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63A4FAD41F
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 06:35:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13859.1776926152356622148
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 23:35:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lr3ZhoNV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8573a3976f=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N5rPdB2100031
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 22 Apr 2026 23:35:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=J2heMWjjf92WrBZ1YM75
	arEDH+nvD44nlHdx9Oe38Xw=; b=lr3ZhoNVCqhqus+rlcKCh8s0TVp3ouAVtmSz
	ZezdZzXBybA5LnjpyxQGXOqX1UYqEguWSTd7ai1pSJVE++ozGyzwBfVvVUrdlM5c
	3WpFwxCA/rl1Q0NcrEVBhv1PrSovAWzaQ1luWUsBQ9k+DpoSEzph4bftEEj/B/dI
	URFj50KjFeABwoI1mH9Xg01aFSu4f2BssEVZ3ndheLa6KkRgfl3/P/ba+c/Cl4T5
	bCS7y9q+qLNlrg4jLkj+PRlzzKZSKIAAQCCNAYprp9rwlLzyIAIDtB1OQ1cJ40jz
	PUgJVAFifRSpI5tuDgBBW39lWzica+MYuNjewXLMLJ0j+tMSSA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dq8sr08kj-20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 22 Apr 2026 23:35:51 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 22 Apr 2026 23:35:51 -0700
Received: from ala-lpggp9.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 22 Apr 2026 23:35:50 -0700
From: <mingli.yu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [scarthgap][PATCH] podman: Upgrade 5.0.1 -> 5.0.3
Date: Wed, 22 Apr 2026 23:35:50 -0700
Message-ID: <20260423063550.2973613-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA2MCBTYWx0ZWRfXzUAayS25dM8f
 ZB4wg6fpCWgTTVcC1tUJ/ipl2LmRt4ny5T5n1FuJJPLVAvJeRMa2Gzdj6VPX0f/yXVfsxKmXfEF
 U8U3ump89T5ojhmiG02ddNy16d/7HaVjjKF4We4JLDKcyU/igEExuTh7s1S3HFAa+fTpwDkD6j1
 seY62DAmUabiztg2HwKC/W39TEBsN5RGpUZjTkXoE1TIhlWSaRgfS734PBgcTn6MqsqKSXUdUq7
 Gt58yRDqcBbG0HiUM8cTJB/cNeSusLs1YPLpcy0I07kBwZLKUHx3uBXB/oS7GE+uJWR+gNKxB1N
 T061IaemDF4UyM0wRq1ZBUMMGOkIyVo3bQsvJROCRFij7P9vZAv0SSbdd/MUanX/PcbuyPyTItL
 O+WfQHrO8/n++nzie3ZV6umC2UCEbP81wydrwz+IxCUCYGFpIS00f9ll6Pd31J18sW4RZRMDAzH
 7cXq0SW7rOyFuJZEJSw==
X-Proofpoint-GUID: OZy6tEFDWoXr86a3YRLAqYhNGG6Wkz3v
X-Authority-Analysis: v=2.4 cv=PfPPQChd c=1 sm=1 tr=0 ts=69e9bdc7 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=8hG23R3pAAAA:20 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=Y25gXyiYs1xNr7-9NcIA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: OZy6tEFDWoXr86a3YRLAqYhNGG6Wkz3v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1011 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230060
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Apr 2026 06:35:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9726

From: Mingli Yu <mingli.yu@windriver.com>

Upgrade podman to 5.0.3 to include some bugfixes and some security fix
such as CVE-2024-3727 [1].

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


