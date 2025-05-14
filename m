Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42B2C3ABDA
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 07:59:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.97110.1747209568762624204
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 14 May 2025 00:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7229a91613=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E5iPGO014893
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 14 May 2025 00:59:28 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46mbca0s2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 14 May 2025 00:59:28 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 14 May 2025 00:59:25 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 14 May 2025 00:59:25 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] libvirt: fix compile failure while DEBUG_BUILD = 1
Date: Wed, 14 May 2025 15:59:26 +0800
Message-ID: <20250514075926.1831264-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: DqstzP5vkFf8q5oOxGCCxrgctsTiUIlg
X-Authority-Analysis: v=2.4 cv=P446hjAu c=1 sm=1 tr=0 ts=68244d60 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=dt9VzEwgFbYA:10 a=t7CeM3EgAAAA:8 a=d4wmoKv9Fkrp-o7OyhUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: DqstzP5vkFf8q5oOxGCCxrgctsTiUIlg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA2OCBTYWx0ZWRfX83xUMrbIvlWL uRbbnfyenzRSPwO9b78c6MerHj8TSD2fHf3QjH3X60GN2u6ZlpVmsz9ercnfMsQk+08xcFMDe09 lZHETMJzBE1KSHe7h6AHP/g73glO4pbz+pEu+DXFb8MDSFvGRasl9R/iraLHS8jBji8/xXci3Um
 CW+leI7Sn06DWRFlvswFj8ECyRpIVY/5R3cHKiMBYY5km2WaKm77mwW5gBVntixAdJAuSACQZE5 T6qm3kvzHo4sSi69lGI89x5D6mA2sjDyqNKvxtcaiYOJ01joT6drvSxMym0b/XOXQ23Q2/DCUtj 6+bP7L2W1pif2PugejcI+sDFXYoqcWroiEUIDeLonI8l2HvBZeGTsFOeiwqpgaG68QEjPSWfllo
 hzpZJC5fufLZ1RVRbm3ybEnntfvfluZE467BhMdygPaEybmscd4L/AmYurDtS+yuAKacFBYt
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 mlxscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=842 suspectscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505140068
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 14 May 2025 07:59:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9248

Build libvirt failed while DEBUG_BUILD = 1
[snip]
../git/src/cpu/cpu_x86.c: In function 'cpuidSetLeaf4':
../git/src/cpu/cpu_x86.c:2563:1: error: inlining failed in call to 'cpuidCall': function not considered for inlining [-Werror=inline]
 2563 | cpuidCall(virCPUx86CPUID *cpuid)
      | ^~~~~~~~~
[snip]

Explicitly add -Wno-error=inline to CFLAGS if DEBUG_BUILD = 1 to workaround

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 recipes-extended/libvirt/libvirt_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
index 4c6b3bdd..37a60562 100644
--- a/recipes-extended/libvirt/libvirt_git.bb
+++ b/recipes-extended/libvirt/libvirt_git.bb
@@ -50,6 +50,7 @@ USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM:${PN} = "-r qemu; -r kvm"
 USERADD_PARAM:${PN} = "-r -g qemu -G kvm qemu"
 
+CFLAGS += "${@oe.utils.vartrue('DEBUG_BUILD', '-Wno-error=inline', '', d)}"
 
 EXTRA_OEMESON += "--cross-file ${WORKDIR}/meson-${PN}.cross"
 do_write_config:append() {
-- 
2.34.1


