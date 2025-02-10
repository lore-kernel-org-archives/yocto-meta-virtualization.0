Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F08CC02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 07:47:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.45865.1739173623776386997
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 09 Feb 2025 23:47:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=413644b4c0=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A6nnvU018875
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 9 Feb 2025 23:47:03 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44p7ns19hm-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 09 Feb 2025 23:47:03 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 9 Feb 2025 23:47:02 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 9 Feb 2025 23:47:01 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH V2 2/3] libvirt: add json-c for driver_qemu
Date: Mon, 10 Feb 2025 15:46:59 +0800
Message-ID: <20250210074700.1751058-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210074700.1751058-1-hongxu.jia@windriver.com>
References: <20250210074700.1751058-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: zSKwp8X9GdzB1w54NLwtrw4xeWSDqlpq
X-Proofpoint-ORIG-GUID: zSKwp8X9GdzB1w54NLwtrw4xeWSDqlpq
X-Authority-Analysis: v=2.4 cv=ULwnHDfy c=1 sm=1 tr=0 ts=67a9aef7 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=XsIDQxyrKH7oThKbmd8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_04,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 adultscore=0 mlxlogscore=851 impostorscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502100064
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Feb 2025 07:47:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9132

After upstreamm applied commit [meson: switch checks to depend on json-c as well
as yajl][1], json-c is required to build QEMU driver.

Using latest poky + meta-virtualization + meta-openembedded on master branch,
build libvirt failed at do_configure
$ bitbake libvirt
...
../git/meson.build:1672:6: ERROR: Problem encountered: json-c is required to build QEMU driver
...

[1] https://github.com/libvirt/libvirt/commit/28c987263980afc5b606a36a8d264b68cb01e9b9

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 recipes-extended/libvirt/libvirt_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
index 432b5da8..6a524977 100644
--- a/recipes-extended/libvirt/libvirt_git.bb
+++ b/recipes-extended/libvirt/libvirt_git.bb
@@ -149,7 +149,7 @@ PACKAGECONFIG:remove:armeb = "numactl"
 # enable,disable,depends,rdepends
 #
 PACKAGECONFIG[gnutls] = ",,,gnutls-bin"
-PACKAGECONFIG[qemu] = "-Ddriver_qemu=enabled -Dqemu_user=qemu -Dqemu_group=qemu,-Ddriver_qemu=disabled,qemu,"
+PACKAGECONFIG[qemu] = "-Ddriver_qemu=enabled -Dqemu_user=qemu -Dqemu_group=qemu,-Ddriver_qemu=disabled,qemu json-c,"
 PACKAGECONFIG[libxl] = "-Ddriver_libxl=enabled,-Ddriver_libxl=disabled,xen,"
 PACKAGECONFIG[openvz] = "-Ddriver_openvz=enabled,-Ddriver_openvz=disabled,,"
 PACKAGECONFIG[vmware] = "-Ddriver_vmware=enabled,-Ddriver_vmware=disabled,,"
-- 
2.34.1


