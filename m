Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AECFCD11C2
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 03:03:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8766.1712804633109177107
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 10 Apr 2024 20:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=daKfPlkV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=48316bf1d1=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43B20i9t014460
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 11 Apr 2024 03:03:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=hFAS3
	8y57n/FO/FcM26H3YEAaTFN8FgQpwYtuRAu3lY=; b=daKfPlkV1OMQsgUn3zA4q
	dQjxPe735oHvxgP2SBBnj7+8kM34WuFg8IVUb7VKpjT+G5cs4z5jIPinDVDwxeQ8
	y6iRiu+tpPTgBQxYWZwekFjDAzWIbeeP2tf2luRl+YkHPoXIkmwRrOvIGvn1y6mi
	PUNkYF5V3ijpVwxxaxxkeh4h8F8pSUFGPBvKzzD/kz5JcKEhNX79BreoRbCC3n3t
	C67eSBkrWsezIAwR+DMkWV9CGnjpGBr2hVzmufM4iUI/6f5/LKgE2FJx55/6pgjt
	DvHrXhvxuUHsHT86biMZ76GB+M4OkQkBvJkSiqSg7omscIkQ0P1lKYa4xLWuasds
	Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xaukxwm44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 11 Apr 2024 03:03:52 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 10 Apr 2024 20:03:50 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Wed, 10 Apr 2024 20:03:50 -0700
From: <mingli.yu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-cloud-services][PATCH] python3-ansible-collections: Add new recipe
Date: Thu, 11 Apr 2024 11:03:49 +0800
Message-ID: <20240411030349.3378190-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: vp2yTsW4buQ6rVAdsSCv8qMwOvr85wi6
X-Proofpoint-ORIG-GUID: vp2yTsW4buQ6rVAdsSCv8qMwOvr85wi6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-10_08,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404110021
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 11 Apr 2024 03:03:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8673

From: Mingli Yu <mingli.yu@windriver.com>

Ansible is a radically simple model-driven configuration management,
multi-node deployment, and remote task execution system. Ansible works
over SSH and does not require any software or daemons to be installed
on remote nodes. Extension modules can be written in any language and
are transferred to managed machines automatically.

This recipe provides a curated set of Ansible collections included in
addition to ansible-core which provided by python3-ansible.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../python3-ansible-collections_9.4.0.bb      | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 recipes-devtools/python/python3-ansible-collections_9.4.0.bb

diff --git a/recipes-devtools/python/python3-ansible-collections_9.4.0.bb b/recipes-devtools/python/python3-ansible-collections_9.4.0.bb
new file mode 100644
index 00000000..94f1af05
--- /dev/null
+++ b/recipes-devtools/python/python3-ansible-collections_9.4.0.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Curated set of Ansible collections included in addition to ansible-core"
+DESCRIPTION = "Ansible is a radically simple model-driven configuration management, \
+multi-node deployment, and remote task execution system. Ansible works \
+over SSH and does not require any software or daemons to be installed \
+on remote nodes. Extension modules can be written in any language and \
+are transferred to managed machines automatically. \
+This package provides a curated set of Ansible collections included in addition \
+to ansible-core."
+HOMEPAGE = "https://pypi.org/project/ansible/"
+LICENSE = "GPL-3.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
+
+PYPI_PACKAGE = "ansible"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "dd431c63380e18c3faca3288ebde8ce2f4f992363ab558a3c11c8f2032d90867"
+
+RDEPENDS:${PN} = " \
+    bash \
+    python3-ansible \
+"
-- 
2.25.1


