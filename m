Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F296D5B16C
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 07:52:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43485.1765785129069991116
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 14 Dec 2025 23:52:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fVKealDI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44447d47c7=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BF7HPaO2132030
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Dec 2025 07:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=uugwd4vr0ImaG6fHcWcV
	d8pGzeHw7Nv6r1F+gQD07PE=; b=fVKealDIoi79kql+hKq+/m/8t8yn/Z91ivg3
	R8uF2oGiuVxxA7an+QCj65JUnLzA10fDaBzmC9xfdpp1MV3mnOaoCyc7XHb1GW7w
	kuNsoH2kZZE2R5X/sjh5jgOK/Ba1skyT8HKrfTa9kifgSM/5ZSrw5eDIcKVi6ODn
	BeIYTNVfZRwlwo/fKGe9cMbrxpDy9MEXexmEW9LonBmSwA7RkwUNkAGBiZIa/CRC
	zf/P1o/A+kGNKPw5PQDVPjUJGMymXFxO39URiq0UNfZoSzO0cdP9YCDNRtdi5LH4
	4/mDFXTJiuhl5be010Wo4dRndtd5dDFtDC836fKOY9GuIW+BcA==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b0y489j03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Dec 2025 07:52:07 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 14 Dec 2025 23:52:04 -0800
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 14 Dec 2025 23:52:04 -0800
From: <Qi.Chen@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] crun: fix CRUN_AS_RUNC checking
Date: Mon, 15 Dec 2025 07:52:04 +0000
Message-ID: <20251215075204.1048461-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA2NiBTYWx0ZWRfXy2W4P3ZSKUVb
 HKuwrbbJkiw9GSrXSYduMYYAwKrgUnFDv8JY4N6bqn988kSJGzBPTeF1817MqMgMb/smytrx3kb
 uL9MdLVWP+Pk0FsNEVJQBNiTYdDPlDBCNd+rCWXd+A95Csw5z1d6JMV91PTp93kVgh0aG91Ofic
 NGWQIjOReL27oy5ap/NfBKTijRS3qIBMrREqAWDevrxaoqw71tJLknJjFVHJFJ1ap56/zDR/TSm
 BYJQtHALpcSrwfppaxh/jFGO7WsZFMKOM6cCkbm1yuUbk0ijLMYCeTwQe0R9DZbO50ME9xVQ1KS
 yqMKl0ZgWxLXfAIUyjUoq+jGB3ZmXQV/Ul/Yo/R3R1Wg5Zh/scSsOPhCN+K8suLQaTjMUuI+g0c
 vJGcAj55K7Y24feIK+ps2dx9ykMhsw==
X-Proofpoint-GUID: I0dFI1IY9uXbkayKTD4Jp9D8CKkvF6Hq
X-Proofpoint-ORIG-GUID: I0dFI1IY9uXbkayKTD4Jp9D8CKkvF6Hq
X-Authority-Analysis: v=2.4 cv=e5ILiKp/ c=1 sm=1 tr=0 ts=693fbe27 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=sgUpLsjI5AlUBaKP8SgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1011 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512150066
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Dec 2025 07:52:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9480

From: Chen Qi <Qi.Chen@windriver.com>

We have in this recipe:
CRUN_AS_RUNC ?= "true"

The expected behavior is that if we set it to "false", the symlink
is not created.

Fix the check to achieve this expected behavior.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/crun/crun_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/crun/crun_git.bb b/recipes-containers/crun/crun_git.bb
index edaf15b8..25e76239 100644
--- a/recipes-containers/crun/crun_git.bb
+++ b/recipes-containers/crun/crun_git.bb
@@ -52,7 +52,7 @@ do_configure:prepend () {
 
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
-    if [ -n "${CRUN_AS_RUNC}" ]; then
+    if ${CRUN_AS_RUNC}; then
         ln -sr "${D}/${bindir}/crun" "${D}${bindir}/runc"
     fi
 }
-- 
2.43.0


