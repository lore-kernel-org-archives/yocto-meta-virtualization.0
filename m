Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85543C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 08:40:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.38003.1669884045199842567
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Dec 2022 00:40:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=EtxKgQAB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9334f0b321=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B18NFEC021975
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 1 Dec 2022 08:40:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=QKEKKQLxg+obwc2DQw6oT1JnbPPK0ylCM9K3USk30Qs=;
 b=EtxKgQABYhMlw1p/aysKNyfOp9ySH0qsG3Fx03QBN1+LK0/oQ+HzjlcTJNxm+2s+osrt
 gmfG0ZL41jXFvU4haAUI8ZoLtAH7zFeIC1oBP8KZFzbaxPkJq/VHWVZoHWFLuhCP3Hvc
 exC6+CUzbDPdRJUUkmfb0Csr3PHoX4qWmobQjVuykCtn3HSP6sEXfcxaoQjSvGoHStMK
 G7CZgTHIXBpH3ZZOeEECd+CRbks90KrcLmzGAaV+DVOdaBprT+JpTQBGCriRErXSJKnu
 IA6PunaY80c4EN/7JXCkTAz+DtFzWQiAtqV8AVKHob2n+YhjDjhIybVyBZ1N6pv3QyWB jA== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m38134648-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Dec 2022 08:40:44 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 1 Dec 2022 00:40:42 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 1 Dec 2022 00:40:42 -0800
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] conmon: avoid host contamination by GOCACHE
Date: Thu, 1 Dec 2022 16:40:41 +0800
Message-ID: <20221201084041.2312838-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Cjpc4tQKigvYTBCxGUQiY129Nu5-1SNJ
X-Proofpoint-ORIG-GUID: Cjpc4tQKigvYTBCxGUQiY129Nu5-1SNJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_04,2022-11-30_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=962 impostorscore=0 adultscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212010058
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Dec 2022 08:40:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7719

From: Changqing Li <changqing.li@windriver.com>

By default GOCACHE is set to $HOME/.cache.

Fix:
make[1]: Entering directory '/mnt/tmp-glibc/work/core2-64-wrs-linux/conmon/2.1.3+gitAUTOINC+19110c9746-r0/git/tools'
| failed to initialize build cache at /home/build/.cache/go-build: mkdir /home/build: permission denied

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-containers/conmon/conmon_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-containers/conmon/conmon_git.bb b/recipes-containers/conmon/conmon_git.bb
index a20af04..4c58dab 100644
--- a/recipes-containers/conmon/conmon_git.bb
+++ b/recipes-containers/conmon/conmon_git.bb
@@ -20,6 +20,8 @@ S = "${WORKDIR}/git"
 
 inherit pkgconfig
 
+export GOCACHE = "${B}/.cache"
+
 EXTRA_OEMAKE = "PREFIX=${prefix} BINDIR=${bindir} LIBEXECDIR=${libexecdir}"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
-- 
2.25.1


