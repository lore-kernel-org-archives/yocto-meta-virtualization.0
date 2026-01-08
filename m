Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2830D148BD
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 06:26:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.933.1767853600032748721
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 22:26:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Q77Dhoo1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54685ebb30=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6084A1oU410522
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 8 Jan 2026 06:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Y/526LKHOOsVSljz10hdvxb7MUpZE91GAsm1XDazLFU=; b=Q77Dhoo1R6Ac
	GpkalK27tD31U94BweLyO2Yk81uiC9WYblMoxccpKojczJqzOmgtCvOapY6I6zns
	mEq9TpM5zCh6/dQwnyoLAbDqWa7bsAOa2QTonseYmOrlp154Aw9aQdDokco78OJS
	k10C1DuNm//tawYQY9s1PQqVRtd52znR4NQG/p1KbjY0JEWUWfK5zrS31uDGPU0D
	52PDO6wAkib0z+gA6vPkw6ws8+KyzoE3xdpE7ChjRrLrkv1dkUMBiSyiZgrTyaVz
	Sbnpuj4j6yDj60bwoApanRf4VYIMiOql+nL46siWA/bm1uFXILHMvc0BO4JiVBBi
	cl+rm+bXog==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bet33d0g6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Jan 2026 06:26:38 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 7 Jan 2026 22:26:37 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 7 Jan 2026 22:26:37 -0800
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH 07/15] umoci: set go buildid to empty for improving reproducibility
Date: Thu, 8 Jan 2026 14:26:20 +0800
Message-ID: <20260108062628.3636344-8-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108062628.3636344-1-changqing.li@windriver.com>
References: <20260108062628.3636344-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=cPTtc1eN c=1 sm=1 tr=0 ts=695f4e1e cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RK3ebuFzAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=N5_ppcHcDyRgGlnZ7zMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: KsuPfe1V2Z5R0j3qr4jgayZ_V0zUpma3
X-Proofpoint-ORIG-GUID: KsuPfe1V2Z5R0j3qr4jgayZ_V0zUpma3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA0MCBTYWx0ZWRfX/DsCaYtepHIt
 qckO9SoMUkTT9elM3g5uoHUUytJspjiPMIrJgRL4CMbGywvQKOR4eK7eMBlQ9xUwoCuJ0/dHCak
 q0js6aviiZ19oddP9/UkLVH5IdjiWs5NZpP5DoZ3aPIuU2I1YN1Npw34VrOiMZQt67CH17+EG+u
 a75rzQNEZqo3bK0uZ8cIvt0VomXOhD+CzNPyWTZt9jHRlTg5VzgrBqvXiivlL66cD4FCNLYQxKn
 bkSlTBDMr5k71i6Hr9wrSIcPpHkZL0sX1wLDdKVL3NvK9TSCPy8jXTX2RpJOvSGmgU4sxcCxyu3
 mlDmIX6gw2n4/Csxk5X2yjH9McYyIxa4I1jl9iGfZwpDG/1Y7Z40VY1WmUSWnFp4NV1zX6PxFG2
 iw6eFAwqm9YuyCCLlxBg4yXAamKSD+XQNhIZ+h8EB8mB0tkkatx9YbjOkGFLS3BbDKa0ZsmuWh0
 tjpuH6guMwa2EYNjO7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080040
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Jan 2026 06:26:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9538

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-containers/umoci/umoci_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/umoci/umoci_git.bb b/recipes-containers/umoci/umoci_git.bb
index f148b7fa..e26b4ead 100644
--- a/recipes-containers/umoci/umoci_git.bb
+++ b/recipes-containers/umoci/umoci_git.bb
@@ -50,7 +50,7 @@ do_compile:class-native () {
     # the executable (coredump)
     # https://forum.snapcraft.io/t/patchelf-broke-my-binary/4928
     # https://github.com/NixOS/patchelf/issues/146
-    oe_runmake umoci.static
+    oe_runmake umoci.static BASE_LDFLAGS="-s -w -X \${PROJECT}.gitCommit=\${COMMIT} -buildid="
 
     # so the common install can find our binary
     cp umoci.static umoci
@@ -73,7 +73,7 @@ do_compile() {
     export BUILD_FLAGS="-trimpath"
     cd ${S}
 
-    oe_runmake umoci
+    oe_runmake umoci BASE_LDFLAGS="-s -w -X \${PROJECT}.gitCommit=\${COMMIT} -buildid="
 }
 
 do_install() {
-- 
2.34.1


