Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE74C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 05:46:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.30462.1741758396445146067
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 22:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5166245db1=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52C51HBK024671
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 11 Mar 2025 22:46:36 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0dur662-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 11 Mar 2025 22:46:35 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 11 Mar 2025 22:46:35 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 11 Mar 2025 22:46:34 -0700
From: <kai.kang@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] virt-manager: update for PACKAGECONFIG gui
Date: Wed, 12 Mar 2025 13:46:28 +0800
Message-ID: <20250312054628.3335246-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: vqdqTSJ9tWb9-7mSZUOYSUDG6Wh7uDpM
X-Proofpoint-GUID: vqdqTSJ9tWb9-7mSZUOYSUDG6Wh7uDpM
X-Authority-Analysis: v=2.4 cv=U9aSDfru c=1 sm=1 tr=0 ts=67d11fbb cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Vs1iUdzkB0EA:10 a=0RmIWSNrAAAA:8 a=t7CeM3EgAAAA:8 a=XqgmDw62cGRAJVsM86AA:9 a=bpb-zBxtA-vplS0jFjTW:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_02,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 spamscore=0 phishscore=0 impostorscore=0 mlxlogscore=753
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502280000 definitions=main-2503120038
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 12 Mar 2025 05:46:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9163

From: Kai Kang <kai.kang@windriver.com>

It turned to meson since virt-manager 5.0, so update for PACKAGECONFIG
gui accordingly. And merge the DEPENDS lines that the latter one uses
direct assign('=') which clears the content of DEPENDS set before.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 recipes-extended/virt-manager/virt-manager_git.bb | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/recipes-extended/virt-manager/virt-manager_git.bb b/recipes-extended/virt-manager/virt-manager_git.bb
index 71806077..a33f37a6 100644
--- a/recipes-extended/virt-manager/virt-manager_git.bb
+++ b/recipes-extended/virt-manager/virt-manager_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "virt-manager is a graphical tool for managing virtual machines vi
 HOMEPAGE = "https://virt-manager.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS += "python3-docutils-native"
+DEPENDS += "python3-docutils-native python3-pylint"
 SRCREV = "da2f65f9262fc18e2b05f527cf8886b1c6b9cde1"
 
 SRC_URI = " \
@@ -15,22 +15,18 @@ PV = "v5.0.0+git"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= "gui"
-PACKAGECONFIG[gui] = ",--no-update-icon-cache --no-compile-schemas,python3-pygobject"
+PACKAGECONFIG[gui] = ",-Dupdate-icon-cache=false -Dcompile-schemas=false,python3-pygobject"
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'gui', 'gtk-icon-cache', '', d)}
 inherit bash-completion gettext pkgconfig meson
 
-EXTRA_OEMESON += "-Dupdate-icon-cache=false \
-                   -Dtests=disabled \
-		 "
+EXTRA_OEMESON += "-Dtests=disabled"
 
 PACKAGES += " \
   ${PN}-common \
   ${PN}-install \
 "
 
-DEPENDS = "python3-pylint"
-
 RDEPENDS:${PN}-common += " \
   libvirt-python \
   libosinfo \
-- 
2.34.1


