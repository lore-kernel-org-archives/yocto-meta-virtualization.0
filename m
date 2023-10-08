Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D84E95A82
	for <webhook@archiver.kernel.org>; Sun,  8 Oct 2023 08:03:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.34222.1696752182279020985
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 08 Oct 2023 01:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JYtn82V8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8645fd0012=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3987w2Ej017335
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 8 Oct 2023 01:03:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=YGwvL
	O3bXokBU2KeEBkTwdDEgLyeaJ+amTnadxY83Wc=; b=JYtn82V8VDionzdfem1W5
	tZ2PnrIjkaxfNaIxEhp6eHk7r4vBMu72BVubbtUiUQ3mDUO1XNLJvijbRL2VKIhw
	jyRMlehPVWKD35eAvUJzQnzzThTQY3NtKBR7vQ5skhrPuJhSRoc98f+BTOLdqQUy
	L54D5RSVapBUZPhHRSl0nIUGIXNWZmKzpWTGFCwqJgob7QyeeSAA9e6yh2H0Un3W
	Ztac69aMdfNKo/AKPY3pL5+QYR8WicBe7NkZBDpJk2v3SNSV3to4FHhdGTSCWRho
	UDLhPakAoOac70RL3t204B2TKcoioYqv6pdyLtyR2k6Y7JdD6qfy+PlOU8FzabtY
	Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tk6ufgjm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 08 Oct 2023 01:03:01 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 8 Oct 2023 01:03:00 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Sun, 8 Oct 2023 01:03:00 -0700
From: <mingli.yu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] umoci: Remove the buildpath issue
Date: Sun, 8 Oct 2023 16:02:59 +0800
Message-ID: <20231008080259.3346765-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 4sLjSavZ1Uw0nH10ctxdzWDdLsfpiGGU
X-Proofpoint-ORIG-GUID: 4sLjSavZ1Uw0nH10ctxdzWDdLsfpiGGU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-08_06,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=629 clxscore=1011
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2309180000
 definitions=main-2310080071
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 08 Oct 2023 08:03:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8340

From: Mingli Yu <mingli.yu@windriver.com>

Pass -trimpath to the build to fix the below build path issue:
  WARNING: umoci-v0.4.7+git-r0 do_package_qa: QA Issue: File /usr/sbin/umoci in package umoci contains reference to TMPDIR [buildpaths]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 recipes-containers/umoci/umoci_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/umoci/umoci_git.bb b/recipes-containers/umoci/umoci_git.bb
index feaf6dff..e2116892 100644
--- a/recipes-containers/umoci/umoci_git.bb
+++ b/recipes-containers/umoci/umoci_git.bb
@@ -68,6 +68,7 @@ do_compile() {
 
     export GO111MODULE=off
 
+    export BUILD_FLAGS="-trimpath"
     cd ${S}
 
     oe_runmake umoci
-- 
2.25.1


