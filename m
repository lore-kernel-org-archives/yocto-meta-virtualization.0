Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67299C04A94
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 21:12:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4565.1690837939610407696
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 31 Jul 2023 14:12:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=he+u1I/J;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75768610ed=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36VL214F021752
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 31 Jul 2023 21:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=1V0NJ
	qEBRlgoP6+5zntq6eQml+N1QUyLE+qDKM+ny+0=; b=he+u1I/JsrbAhUWRvkm2y
	B4937iGOYgHQHQxhznknKhYfi1SNDrk3zpZ7w9jLkfs2duEbDJcK6tYZoLFAeBs9
	t0X0W7Rtcz3X4jcsMhGInCHL7TSlfDinxPnjrfSszd3zeduLRmMS0bMy512uF10Q
	3IdUI0hysS9gKLRNx5ZYohgsaLAlaOXqhoWoTGQzlQNkNwyAH4IA/ge8aIrdVuol
	t2AkBmKP/IjGe393tPXYSQVmno2potuhJ+oWoNQHlFRZS8XM9a24coJlvHK0qH3R
	GjnOrNy/l7n2SYzSGtMqH1am+vYh9ai+Egz1RbMN6U8zOcCxyKM3EQCCZyZPsrKX
	A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s4qyx24un-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 31 Jul 2023 21:12:18 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 14:12:17 -0700
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Mon, 31 Jul 2023 14:12:17 -0700
From: <joe.slater@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-virt][PATCH 1/1] python3-nacl: add RCONFLICTS
Date: Mon, 31 Jul 2023 14:12:17 -0700
Message-ID: <20230731211217.2154738-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ilc8o4P32UtoRohEe7qYU5qqzWpzbpDM
X-Proofpoint-ORIG-GUID: ilc8o4P32UtoRohEe7qYU5qqzWpzbpDM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-31_15,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 priorityscore=1501 mlxlogscore=529 suspectscore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307310192
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 31 Jul 2023 21:12:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8153

From: Joe Slater <joe.slater@windriver.com>

We conflict with python3-pynacl in the meta-python layer.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 recipes-devtools/python/python3-nacl_1.3.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-devtools/python/python3-nacl_1.3.0.bb b/recipes-devtools/python/python3-nacl_1.3.0.bb
index 42a3cd9d..e6a844bc 100644
--- a/recipes-devtools/python/python3-nacl_1.3.0.bb
+++ b/recipes-devtools/python/python3-nacl_1.3.0.bb
@@ -21,6 +21,10 @@ RDEPENDS:${PN}:class-target += " \
     python3-pycparser \
 "
 
+# We conflict with a package in meta-python.
+#
+RCONFLICTS:${PN} += "python3-pynacl"
+
 export SODIUM_INSTALL = "system"
 
 BBCLASSEXTEND = "native"
-- 
2.25.1


