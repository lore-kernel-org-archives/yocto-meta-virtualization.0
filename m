Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A29EB64DD
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 08:38:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.29802.1691397519934179774
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 07 Aug 2023 01:38:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZgAuw4hW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7583208e38=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37771Q8A005834
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 7 Aug 2023 08:38:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=uLr5T
	tD/myH8nQBDu7QX/BiBKOC+BD9uKBfSLEMU2HM=; b=ZgAuw4hWRq1Nz4fcitOqm
	X0svQ3/OrdSStX0AaPAhbL6RLrDbsCo7YIKJLdghe0Ul2k89wGZbOlxvceks4QVT
	fmIJgSBYBF/eOpOAhZgkKF/NB2KOkjHBmWa4ScQJ6JasvMS0o77xN/UiiHApsFrQ
	/jlI8IYYeGEZ3+Izbtsg42dbTyYYK5dKFinQsuY0K0izeOuAtjatC1Raus2ZVLH0
	kY1+we14hMRLOGo6kSA39xPfyJ5ymBcDVuY2gikJsUc4+W5kspdJmS2Hfs8Jz83G
	g1pv1SfaQ4npDbEPmewoA/JYMlcb8XP3jQaoZ2mlCpPNStB08cGK1E2eX740eB93
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s9dd61e9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 07 Aug 2023 08:38:38 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 01:38:36 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Mon, 7 Aug 2023 01:38:36 -0700
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [master][PATCH] libvirt: upgrade 9.2.0 -> 9.6.0
Date: Mon, 7 Aug 2023 16:38:35 +0800
Message-ID: <20230807083835.26844-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: do5YfnspF1V1lhGIaJWGp7vMYxUAWOs-
X-Proofpoint-ORIG-GUID: do5YfnspF1V1lhGIaJWGp7vMYxUAWOs-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_07,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=435 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308070079
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 07 Aug 2023 08:38:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8167

From: Changqing Li <changqing.li@windriver.com>

Refer the changes here:
https://gitlab.com/libvirt/libvirt/-/blob/master/NEWS.rst

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-extended/libvirt/libvirt-python.inc                     | 2 +-
 recipes-extended/libvirt/{libvirt_9.2.0.bb => libvirt_9.6.0.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename recipes-extended/libvirt/{libvirt_9.2.0.bb => libvirt_9.6.0.bb} (99%)

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index e4806df0..a8c31e6a 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -20,7 +20,7 @@ INSANE_SKIP:${PN}-dbg += "buildpaths"
 
 SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
 
-SRC_URI[libvirt_python.sha256sum] = "95cc190c57cb84e8ed2e1b8205b01a937e1a4bc19cc8865df19ca4470e6d7c1b"
+SRC_URI[libvirt_python.sha256sum] = "53422d8e3110139655c3d9c2ff2602b238f8a39b7bf61a92a620119b45550a99"
 
 export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
 export LIBVIRT_CFLAGS = "-I${S}/include"
diff --git a/recipes-extended/libvirt/libvirt_9.2.0.bb b/recipes-extended/libvirt/libvirt_9.6.0.bb
similarity index 99%
rename from recipes-extended/libvirt/libvirt_9.2.0.bb
rename to recipes-extended/libvirt/libvirt_9.6.0.bb
index 5e704704..6c5d3298 100644
--- a/recipes-extended/libvirt/libvirt_9.2.0.bb
+++ b/recipes-extended/libvirt/libvirt_9.6.0.bb
@@ -32,7 +32,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://0001-messon.build-remove-build-path-information-to-avoid-.patch \
           "
 
-SRC_URI[libvirt.sha256sum] = "a07f501e99093ac1374888312be32182e799de17407ed7547d0e469fae8188c5"
+SRC_URI[libvirt.sha256sum] = "10f2e52dbb5df90410594a8e36d0e0587d38f11efb64ff32cbec422b93b70c52"
 
 inherit meson gettext update-rc.d pkgconfig systemd useradd perlnative
 USERADD_PACKAGES = "${PN}"
-- 
2.25.1


