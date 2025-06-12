Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D53DC61CE8
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 05:59:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6165.1749707947671484651
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Jun 2025 22:59:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=825899a195=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C3J3Dh004793
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Jun 2025 05:59:06 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474cd955bm-15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Jun 2025 05:59:06 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 11 Jun 2025 22:59:05 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 11 Jun 2025 22:59:04 -0700
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [walnascar][master][PATCH] kubernetes: rename CNI_NETWORKING_FILES
Date: Thu, 12 Jun 2025 13:59:03 +0800
Message-ID: <20250612055903.1420319-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=f+xIBPyM c=1 sm=1 tr=0 ts=684a6caa cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=jzPq6jXSiEYb0Cd_cTMA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA0MyBTYWx0ZWRfX4KZuNLSoyWXR /lvu3jmkFbPFuQLVroL4g78nj2OvWSqzWJMhgg4lhpFT8UOKa+EItg7oBiAmM8EURvfwwSJK6AH QWUnfSYozDm6bMvPfFmsX067X/Dao+9TeDXe0gwA+n1Ek2PMb8YzcAZRtdsHu+ZjZl+dPKXqMiO
 Odgmij/TWmWQcbZy2MQkM/7VKTfcdG+DVgGjNbnY0MLAWDyAcQbg/IsZ/4MIWcTk8aj2HnR7WCe XY/l6Mcdd4YN20nf0X5Ijuf1dPzkSeCeqsdlNtUVaQTQNmAjDvlsxbzOUB6JLxqdkyBJRy6TPK3 QQnmKtHZC0qq7cv1ncbhNYTg5jOpP6W+rR2wXzu0tWUHum8drc8oEeKGnoPDE6tdBwkHg/CFX+m
 +5gndDd7a/u65idQWD1MT9d4RCYA6HN5hJEL39C1PJ98tmPIdz5/MuvUioh2hEn4j7u7/VeD
X-Proofpoint-ORIG-GUID: fYOhemMwmqTRs-KFCn-hppty20uNnRdt
X-Proofpoint-GUID: fYOhemMwmqTRs-KFCn-hppty20uNnRdt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_03,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=987
 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506120043
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Jun 2025 05:59:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9280

From: Changqing Li <changqing.li@windriver.com>

Rename CNI_NETWORKING_FILES to 00_cni-containerd-net.conflist.
According to the following k8s doc, k8s networking file will be used
when both containerd-cni and kubernetes-cni both installed.

"If there are multiple CNI configuration files in the directory, the
kubelet uses the configuration file that comes first by name in
lexicographic order."

This commit can fix following issue:
PACKAGE_CLASSES = "package_deb"
do_rootfs failed with error:
dpkg: error processing archive /path/to/oe-rootfs-repo/corei7-64/./kubernetes-cni_v1.32.0+git0+5fe148234f_release-r0.deb (--unpack):
trying to overwrite '/etc/cni/net.d/cni-containerd-net.conflist', which is also in package containerd-cni v2.0.5-r0

Refer [1], "--no-force-overwrite" is set for dpkg, so above error
occurred.

[1] https://git.openembedded.org/openembedded-core/commit/?id=cb95ba079960411775c57ab864d266e15a6292d1

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...containerd-net.conflist => 00_cni-containerd-net.conflist} | 0
 recipes-containers/kubernetes/kubernetes_git.bb               | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename recipes-containers/kubernetes/kubernetes/{cni-containerd-net.conflist => 00_cni-containerd-net.conflist} (100%)

diff --git a/recipes-containers/kubernetes/kubernetes/cni-containerd-net.conflist b/recipes-containers/kubernetes/kubernetes/00_cni-containerd-net.conflist
similarity index 100%
rename from recipes-containers/kubernetes/kubernetes/cni-containerd-net.conflist
rename to recipes-containers/kubernetes/kubernetes/00_cni-containerd-net.conflist
diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index fea48bca..b6eb4946 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -31,7 +31,7 @@ SRC_URI:append = " \
            file://0001-cross-don-t-build-tests-by-default.patch \
            file://0001-build-golang.sh-convert-remaining-go-calls-to-use.patch \
            file://0001-build-hack-allow-go-1.20-building.patch \
-           file://cni-containerd-net.conflist \
+           file://00_cni-containerd-net.conflist \
            file://k8s-init \
            file://99-kubernetes.conf \
           "
@@ -119,7 +119,7 @@ do_install() {
     fi
 }
 
-CNI_NETWORKING_FILES ?= "${UNPACKDIR}/cni-containerd-net.conflist"
+CNI_NETWORKING_FILES ?= "${UNPACKDIR}/00_cni-containerd-net.conflist"
 
 PACKAGES =+ "kubeadm kubectl kubelet kube-proxy ${PN}-misc ${PN}-host"
 
-- 
2.34.1


