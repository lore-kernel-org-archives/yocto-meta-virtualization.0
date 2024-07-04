Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EEE5C30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 06:02:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4155.1720072926116134896
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 03 Jul 2024 23:02:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=79153d41e2=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4644mHLp030555
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 3 Jul 2024 23:02:05 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 405jsj04m4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 03 Jul 2024 23:02:05 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 23:02:03 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Wed, 3 Jul 2024 23:02:03 -0700
From: <kai.kang@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] virt-manager: update RDEPENDS
Date: Thu, 4 Jul 2024 14:01:58 +0800
Message-ID: <20240704060158.282957-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: wgv2GC8bPHIo_YaP12rw2hlz8L__Megn
X-Proofpoint-ORIG-GUID: wgv2GC8bPHIo_YaP12rw2hlz8L__Megn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_18,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0
 priorityscore=1501 clxscore=1011 phishscore=0 mlxscore=0 mlxlogscore=686
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2406140001
 definitions=main-2407040042
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Jul 2024 06:02:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8817

From: Kai Kang <kai.kang@windriver.com>

Update RDEPENDS to fix following errors when run virt-manager:

|   File "/usr/share/virt-manager/virtManager/virtmanager.py", line 13, in <module>
|     import gi
| ModuleNotFoundError: No module named 'gi'

|   File "/usr/lib/python3.12/site-packages/gi/__init__.py", line 122, in require_version
|     raise ValueError('Namespace %s not available' % namespace)
| ValueError: Namespace LibvirtGLib not available

|   File "/usr/share/virt-manager/virtinst/xmlapi.py", line 7, in <module>
|     import libxml2
| ModuleNotFoundError: No module named 'libxml2'

|   File "/usr/share/virt-manager/virtinst/install/urlfetcher.py", line 16, in <module>
|      import requests
| ModuleNotFoundError: No module named 'requests'

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 recipes-extended/virt-manager/virt-manager_4.1.0.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/virt-manager/virt-manager_4.1.0.bb b/recipes-extended/virt-manager/virt-manager_4.1.0.bb
index a2395012..aa3df215 100644
--- a/recipes-extended/virt-manager/virt-manager_4.1.0.bb
+++ b/recipes-extended/virt-manager/virt-manager_4.1.0.bb
@@ -28,7 +28,13 @@ RDEPENDS:${PN}-common += " \
   libosinfo \
 "
 
-RDEPENDS:${PN} = "${PN}-common"
+RDEPENDS:${PN} = " \
+  ${PN}-common \
+  libvirt-glib \
+  libxml2-python \
+  python3-pygobject \
+  python3-requests \
+"
 RDEPENDS:${PN}-install = "${PN}-common"
 
 SETUPTOOLS_INSTALL_ARGS += "${PACKAGECONFIG_CONFARGS}"
-- 
2.34.1


