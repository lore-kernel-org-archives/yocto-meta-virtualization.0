Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80CD7C7EE23
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 11:00:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.18951.1684839644683276020
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 23 May 2023 04:00:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=pEdI5V70;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4507836b8c=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34N7cwJC004121
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 23 May 2023 11:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=Cdb1SLXSea1+6y9wQC/mpa5/nVbLDZN0iUsHvsMtE0E=;
 b=pEdI5V708gkIWJ2Eb3fDI9GKDuKH4Ci+dGJZkNz/cOmjaAJbVTuatEbKrpFgU1RmIL+i
 VFhx7phT3FXgi5n/sq3h59KDitaoTX2gWGJOc1RFcqHgddpEpMvVW1NUGcHhpibjV3My
 q8TK3L5yLL/lFbSPZEoa0CaielfwqFeAY90fg5u6Z+OpaIcBlIwp1gWB7s616nFr3/Ho
 FZijdVO1az+Xxey31CsPRyYKHRBQAe+nZ1lNnGG6/4QcpGrazdm/JgIaX5HFNLjxA6fq
 LrsB0nBXIRBXTwYKBJe9ZvWmTZKeIZ5IoqWAYEv0ClVsI/geDiBqAH2PTf6vathsbsVb AA== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpkn1jqxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 23 May 2023 11:00:43 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 23 May 2023 04:00:42 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Tue, 23 May 2023 04:00:41 -0700
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [mickledore][master][PATCH] libvirt: upgrade 9.2.0 -> 9.3.0
Date: Tue, 23 May 2023 19:00:41 +0800
Message-ID: <20230523110041.3166571-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: OsEAj5BY_nAUbgMhmEeNcaZsCV_bGq1z
X-Proofpoint-GUID: OsEAj5BY_nAUbgMhmEeNcaZsCV_bGq1z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-23_06,2023-05-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=433 priorityscore=1501 adultscore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 bulkscore=0 clxscore=1011 spamscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305230088
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 23 May 2023 11:00:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8073

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-extended/libvirt/libvirt-python.inc                     | 2 +-
 recipes-extended/libvirt/{libvirt_9.2.0.bb => libvirt_9.3.0.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename recipes-extended/libvirt/{libvirt_9.2.0.bb => libvirt_9.3.0.bb} (99%)

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index e4806df..b77df3b 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -20,7 +20,7 @@ INSANE_SKIP:${PN}-dbg += "buildpaths"
 
 SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
 
-SRC_URI[libvirt_python.sha256sum] = "95cc190c57cb84e8ed2e1b8205b01a937e1a4bc19cc8865df19ca4470e6d7c1b"
+SRC_URI[libvirt_python.sha256sum] = "9c761d88b4ddcf65b324043944da4f18f82471c74d9371d2372d3b4e0f19861b"
 
 export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
 export LIBVIRT_CFLAGS = "-I${S}/include"
diff --git a/recipes-extended/libvirt/libvirt_9.2.0.bb b/recipes-extended/libvirt/libvirt_9.3.0.bb
similarity index 99%
rename from recipes-extended/libvirt/libvirt_9.2.0.bb
rename to recipes-extended/libvirt/libvirt_9.3.0.bb
index 5e70470..e1bfb94 100644
--- a/recipes-extended/libvirt/libvirt_9.2.0.bb
+++ b/recipes-extended/libvirt/libvirt_9.3.0.bb
@@ -32,7 +32,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://0001-messon.build-remove-build-path-information-to-avoid-.patch \
           "
 
-SRC_URI[libvirt.sha256sum] = "a07f501e99093ac1374888312be32182e799de17407ed7547d0e469fae8188c5"
+SRC_URI[libvirt.sha256sum] = "751179b08e5a73b6cfd93200d110df199eaa3973f3554ba2ebcbd71e272bebe1"
 
 inherit meson gettext update-rc.d pkgconfig systemd useradd perlnative
 USERADD_PACKAGES = "${PN}"
-- 
2.25.1


