Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ABE7D148AC
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 06:26:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.939.1767853596635225719
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 22:26:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YaCpDQuK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54685ebb30=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60850xiT2264063
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 8 Jan 2026 06:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Jh/AXRxz/RCrzagdImP+zP3doFktykQsBEyYDUTN/x4=; b=YaCpDQuKSDe2
	vW1VqNRbI/Lmp4LZeV2dYsATEFEG7miz93RZD5XNeQYdGyYjJHrT2XtC1inTzSV3
	2m0RK7q1/RT+nCur3wRJJlxDmbHYTUZlUaT0IlBnmaOQepTO8zr/W2RkXlZYZY63
	pQVtkGgZlcK6jPUSq54L3cjYFEads7vHxrjvDl+OyoFH+1h3amRJaim+VvuHcFBA
	SNMikcpP+xek5lO+Jo2QxjOwoOQuVxQtHvGy3yLi0NiCLU47q2WztNi4EtoqvvOu
	Pc3wsGvKgRuQ6fJKevme1fwan9jLcq6UqZuFkuOFSN3igSKmCr4rS8mJJE3/yB7n
	uW6mob7dwQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4beravd29r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Jan 2026 06:26:35 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 7 Jan 2026 22:26:34 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 7 Jan 2026 22:26:33 -0800
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH 04/15] nerdctl: set go buildid to empty for improving reproducibility
Date: Thu, 8 Jan 2026 14:26:17 +0800
Message-ID: <20260108062628.3636344-5-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108062628.3636344-1-changqing.li@windriver.com>
References: <20260108062628.3636344-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA0MCBTYWx0ZWRfX2ewk29uQCKyL
 chJJ3U70oB1faT+zsvCVqWNk8e6009ivhQUeZjW14XaYYCIkO5MLRABc8ypwb/SvjcjJhlNr9bB
 UKXYhPStHJj87O4JlAqFv25U0p0cjeDOyoGUR6W5Nwyd1Imkx9HQNCpI2Xz7PUDjrCvC2C51tST
 3nNmtP2+uH5Icxi3WRIzgS/8HnncPv5Ij6kCkS7HQ1wIjfAlxW6+hIPG3WuUYs9TOzISrj7Jrxi
 BCKZIfWIcyp8uz1mHztTNSsUaiDYU8/rokIWsnz3RQ89hTaj8u6NarRGAlvtEYszos1QYhbqAW0
 PMgONnuywGk2mZVIDaxHJPUkEkdpfUsCipH3Z8tXVa1lUhYxH/lkWpQD3I0pSXInQcyHYy8ZjUC
 TCMsdBRTy00EUkDiARTC61WERX/l0cBtovTPf3eMVHWYnKX3EbjkFGomF32iCBv3zWL2Zae/c+D
 Qx5WkrZtprpOS3N0RRg==
X-Proofpoint-GUID: 3mU5yrs5GDOcrCSeAXD4bapMX8C4Lis4
X-Proofpoint-ORIG-GUID: 3mU5yrs5GDOcrCSeAXD4bapMX8C4Lis4
X-Authority-Analysis: v=2.4 cv=PZjyRyhd c=1 sm=1 tr=0 ts=695f4e1b cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=880Hzrme4pSuv9t6iRsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080040
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Jan 2026 06:26:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9535

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-containers/nerdctl/nerdctl_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers/nerdctl/nerdctl_git.bb
index 8f63b48c..7c63f78e 100644
--- a/recipes-containers/nerdctl/nerdctl_git.bb
+++ b/recipes-containers/nerdctl/nerdctl_git.bb
@@ -76,6 +76,7 @@ do_compile() {
         export GOARCH=${TARGET_GOARCH}
         export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
         export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
+        export GO_BUILD_LDFLAGS="-s -w -buildid="
 
         # -trimpath removes build paths from the binary (required for reproducible builds)
         oe_runmake GO=${GO} BUILDTAGS="${BUILDTAGS}" GO_BUILD_FLAGS="-trimpath" binaries
-- 
2.34.1


