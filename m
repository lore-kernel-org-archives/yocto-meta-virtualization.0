Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 605B5C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 13:15:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.49865.1671542132538178805
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 20 Dec 2022 05:15:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9353b7948e=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BKBEMQD002450;
	Tue, 20 Dec 2022 05:15:31 -0800
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mh9x8t4xv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 20 Dec 2022 05:15:31 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 20 Dec 2022 05:15:30 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 20 Dec 2022 05:15:29 -0800
From: <mingli.yu@eng.windriver.com>
To: <bruce.ashfield@gmail.com>, <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] virt-viewer: add opengl to REQUIRED_DISTRO_FEATURES
Date: Tue, 20 Dec 2022 21:15:29 +0800
Message-ID: <20221220131529.3468877-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: las1bQNSvh_efZrQkWBmZQ32AXznJQeo
X-Proofpoint-ORIG-GUID: las1bQNSvh_efZrQkWBmZQ32AXznJQeo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-20_05,2022-12-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=741 malwarescore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212200109
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 20 Dec 2022 13:15:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7776

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  ERROR: Nothing PROVIDES 'spice-gtk' (but /build/layers/meta-virtualization/recipes-extended/virt-viewer/virt-viewer_11.0.bb DEPENDS on or otherwise requires it)
spice-gtk was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'virt-viewer', 'spice-gtk']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 recipes-extended/virt-viewer/virt-viewer_11.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/virt-viewer/virt-viewer_11.0.bb b/recipes-extended/virt-viewer/virt-viewer_11.0.bb
index 55ca57aa..5799f48f 100644
--- a/recipes-extended/virt-viewer/virt-viewer_11.0.bb
+++ b/recipes-extended/virt-viewer/virt-viewer_11.0.bb
@@ -16,6 +16,8 @@ SRCREV = "1e99e5e4f409da91638eb79067ec738994c28ef5"
 PV = "11.0+git${SRCPV}"
 S = "${WORKDIR}/git"
 
+REQUIRED_DISTRO_FEATURES = "opengl"
+
 PACKAGECONFIG ?= "libvirt spice vte"
 
 PACKAGECONFIG[libvirt] = "-Dlibvirt=enabled,-Dlibvirt=disabled,libvirt libvirt-glib"
@@ -23,7 +25,7 @@ PACKAGECONFIG[spice] = "-Dspice=enabled,-Dspice=disabled,spice-gtk spice-protoco
 PACKAGECONFIG[vnc] = "-Dvnc=enabled,-Dvnc=disabled,gtk-vnc"
 PACKAGECONFIG[vte] = "-Dvte=enabled,-Dvte=disabled,vte"
 
-inherit meson pkgconfig gtk-icon-cache mime mime-xdg gobject-introspection
+inherit meson pkgconfig gtk-icon-cache mime mime-xdg gobject-introspection features_check
 
 FILES:${PN} += "${datadir}"
 GIR_MESON_OPTION = ''
-- 
2.25.1


