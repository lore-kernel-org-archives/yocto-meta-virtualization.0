Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 172AFC38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 01:46:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.2482.1666748787566455807
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Oct 2022 18:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=XLBhMf3A;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=72987a02a2=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 29Q1RgQ5020330
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 26 Oct 2022 01:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=dIDERSsRDsJKyd7ENSEQgWxwPMoxR+NZblXj0d6HRUY=;
 b=XLBhMf3ANRg48zPgMCpeVmj3gEqsbmZHwM5zen645ID+TEbREubwQwuyTp5KsHMXbNhz
 Ven154FVd8KQhqhEl9y3+TSdt0q0WAYG292uOAz8qSUg5wHdCkrF51V6h7MYgUUOTHCi
 YyfySzrf8dgZhchEdzSXgMJLasfqmWqrCd1NwyOvOrnruVV6B9micbLqqUbpn5OWG+CA
 qSHbi1SAAflHGQmfM5ee3SGre+zqnE4uhDB8Y6NunrqpJcFAWHa7ngTHr58aQzhQm9l6
 yNtGM9wxw6vEbN0iKbUggNllRpYUAqYLmcDmfUcUpZgSiIspcCrqNRvrnMPwlPEAp8pX Gw== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kc5r2uwj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 26 Oct 2022 01:46:26 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 25 Oct 2022 18:46:25 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 25 Oct 2022 18:46:24 -0700
From: <kai.kang@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] libvirt: remove package config qemu for powerpc and riscv32
Date: Wed, 26 Oct 2022 09:46:22 +0800
Message-ID: <20221026014622.19960-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Vuu1vdwmN8bz5NLQIl9LoB3KDnNzt9zJ
X-Proofpoint-GUID: Vuu1vdwmN8bz5NLQIl9LoB3KDnNzt9zJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-25_15,2022-10-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=805 mlxscore=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 clxscore=1011
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210260006
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 26 Oct 2022 01:46:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7664

From: Kai Kang <kai.kang@windriver.com>

qemu is not compatible with ppc32 and riscv32, so remove libvirt's
package config 'qemu' for them.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 recipes-extended/libvirt/libvirt_8.1.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt_8.1.0.bb b/recipes-extended/libvirt/libvirt_8.1.0.bb
index 89f82bf..1de2988 100644
--- a/recipes-extended/libvirt/libvirt_8.1.0.bb
+++ b/recipes-extended/libvirt/libvirt_8.1.0.bb
@@ -122,9 +122,11 @@ PACKAGECONFIG ??= "gnutls qemu yajl openvz vmware vbox esx lxc test remote \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'polkit', '', d)} \
                   "
 
-# qemu is NOT compatible with mips64
+# qemu is NOT compatible with mips64, powerpc and riscv32
 PACKAGECONFIG:remove:mipsarchn32 = "qemu"
 PACKAGECONFIG:remove:mipsarchn64 = "qemu"
+PACKAGECONFIG:remove:powerpc = "qemu"
+PACKAGECONFIG:remove:riscv32 = "qemu"
 
 # numactl is NOT compatible with arm
 PACKAGECONFIG:remove:arm = "numactl"
-- 
2.17.1


