Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35266C4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 08:57:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15954.1714381021542165315
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 29 Apr 2024 01:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Yo42DYM2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=584906f8e5=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43T7CWq4008095
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 29 Apr 2024 08:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=EOAMN
	OllvbHU+pycVvogMxGnzIQfyLbHNr7Cb10fUAw=; b=Yo42DYM2goaeyT/VCaSop
	T6UbExDVsyuEGkHlBoHZcevT4V8b5QSYd7yRA/Zyy12sLbFcIG0/oDcEGQkw+IUu
	Ihbdz0iNBgwsW9Pj+UrkuGam/M4jWplyh8Z7NPlh2dhrLar8pSaNn9b7ST7uWE4e
	M/euk6VXvd/uS6ZGQH3Ucy0ud6AgoSODE+FaLOGMUuiA5HpkFk74xAgpWYfZnv8G
	IyhivHOT76HBIw55Pez+afJ+iUEVErkbO6B4RM1qjpZX9UF0gB2h4UYCaW9xhUbj
	knaxXPn2YtQRvlhXQO8INq+5q3FgVf1pRyBm7uteWcBoGz5NNjcQoUv+/DXTmjGa
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xrrb69gha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 29 Apr 2024 08:57:00 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Mon, 29 Apr 2024 01:56:59 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Mon, 29 Apr 2024 01:56:58 -0700
From: <mingli.yu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] ceph: Add the missing Upstream-Status Field
Date: Mon, 29 Apr 2024 16:56:57 +0800
Message-ID: <20240429085657.1280729-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: qH5dbRk7VjccSYTM7qIB3tyRTaBe170Y
X-Proofpoint-GUID: qH5dbRk7VjccSYTM7qIB3tyRTaBe170Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_06,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxlogscore=813 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404290055
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 29 Apr 2024 08:57:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8703

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  INFO: Traceback (most recent call last):
    File "/build/layers/oe-core/scripts/lib/checklayer/cases/common.py", line 87, in test_patches_upstream_status
      self.assertEqual(len(patches), 0 , \
  AssertionError: 1 != 0 : Found following patches with malformed or missing upstream status:
/build/layers/meta-virtualization/recipes-extended/ceph/ceph/0001-delete-install-layout-deb.patch

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 recipes-extended/ceph/ceph/0001-delete-install-layout-deb.patch | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-extended/ceph/ceph/0001-delete-install-layout-deb.patch b/recipes-extended/ceph/ceph/0001-delete-install-layout-deb.patch
index 91eacfa9..3cd8edba 100644
--- a/recipes-extended/ceph/ceph/0001-delete-install-layout-deb.patch
+++ b/recipes-extended/ceph/ceph/0001-delete-install-layout-deb.patch
@@ -3,6 +3,8 @@ From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 13 Mar 2024 03:41:47 -0700
 Subject: [PATCH] delete install-layout=deb
 
+Upstream-Status: Pending
+
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
  cmake/modules/Distutils.cmake | 6 ------
-- 
2.25.1


