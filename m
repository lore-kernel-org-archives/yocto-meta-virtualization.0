Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DD3C3ABB2
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 05:48:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9381.1748411328289833090
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 May 2025 22:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7243e38fb1=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S1KipF009652
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 28 May 2025 05:48:47 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u3b13qeq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 28 May 2025 05:48:47 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 27 May 2025 22:48:46 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 27 May 2025 22:48:43 -0700
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][walnascar][master][PATCH] containerd: make cni_networking conditional
Date: Wed, 28 May 2025 13:48:41 +0800
Message-ID: <20250528054841.2516534-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: e53d-VFYZigZZpz5u6DCFyA1GiOXLbFP
X-Authority-Analysis: v=2.4 cv=VpYjA/2n c=1 sm=1 tr=0 ts=6836a3bf cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RTWaOWMY450A:10 a=dt9VzEwgFbYA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=d3_xJdbfi20hw_gwof4A:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: e53d-VFYZigZZpz5u6DCFyA1GiOXLbFP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA0OSBTYWx0ZWRfX3SL4NM/G4SIf gmmFpx0JS/Ogmsxpictyi+jAnDBlWonyIsX5H/VX+YDvX4SmiJz3jyjT3k7KJA3tsRlqQaNKZa7 6iQyWfZQJab1YwaNAr0+rIQwqP4ebLYyVoKpGw/tmPw0mdM6vDor5ejGhEtMo62b1e+qG0s7L9o
 5nGt8PpHNKkSn6kETXRjj7OL/qsrXyRP5vtlGcTkW7UAV4uxjokDu6/obKbPBaKwrhqXJQ8mWVW ilBX/0yVnhnRbP85P0aMyf+tIlev4KYp6NwdT+LnxD6hn97eumZL+hKWht3IPUeu5F7TiZLN2UQ AUs+NqYkzqnMLvUdG6299KLh19GenlTmvF0JugLA5JtWgig76lHrBJmLKFp0bhMuLIb5nGEpCRh
 RyJED+SCmR0EDbkIAwFly8xfMJ3XQelnbqqb9ueUCYuyWvlCWbsnmFTeGG+KuqFFhscRzVUZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_03,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=995 malwarescore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1011
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505280049
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 28 May 2025 05:48:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9261

From: Changqing Li <changqing.li@windriver.com>

make cni_networking conditional, when k3s, k8s is enabled, the
networking configuration will be provided by the orchestration package,
containerd-cni is not needed. This is for fix the following error:
PACKAGE_CLASSES = "package_deb"
do_rootfs failed with error:
dpkg: error processing archive /path/to/oe-rootfs-repo/corei7-64/./kubernetes-cni_v1.32.0+git0+5fe148234f_release-r0.deb (--unpack):
trying to overwrite '/etc/cni/net.d/cni-containerd-net.conflist', which is also in package containerd-cni v2.0.5-r0

Refer [1], "--no-force-overwrite" is set for dpkg, so above error
occurred.

[1] https://git.openembedded.org/openembedded-core/commit/?id=cb95ba079960411775c57ab864d266e15a6292d1

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-containers/containerd/containerd_git.bb      | 2 +-
 recipes-core/packagegroups/packagegroup-container.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-containers/containerd/containerd_git.bb
index c683fbeb..def7591a 100644
--- a/recipes-containers/containerd/containerd_git.bb
+++ b/recipes-containers/containerd/containerd_git.bb
@@ -102,4 +102,4 @@ RDEPENDS:${PN} += " ${VIRTUAL-RUNTIME_container_runtime}"
 ## This may need to be made conditional on K3S or similar being
 ## configured in the distro, since we may have collisions.
 CNI_NETWORKING_FILES ?= "${UNPACKDIR}/cni-containerd-net.conflist"
-inherit cni_networking
+inherit_defer ${@bb.utils.contains_any('DISTRO_FEATURES', 'k3s k8s', '', 'cni_networking', d)}
diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recipes-core/packagegroups/packagegroup-container.bb
index f5e20344..8cbcf28e 100644
--- a/recipes-core/packagegroups/packagegroup-container.bb
+++ b/recipes-core/packagegroups/packagegroup-container.bb
@@ -69,7 +69,7 @@ RDEPENDS:packagegroup-oci = " \
 RDEPENDS:packagegroup-containerd = " \
     virtual-containerd \
     packagegroup-cni \
-    containerd-cni \
+    ${@bb.utils.contains_any('DISTRO_FEATURES','k3s k8s','','containerd-cni',d)} \
     nerdctl \
     tini \
 "
-- 
2.34.1


