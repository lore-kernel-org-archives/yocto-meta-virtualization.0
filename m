Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B38F9D148AF
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 06:26:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.942.1767853598717686989
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 22:26:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=InTPHpfY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54685ebb30=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6080cVAF070362
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 8 Jan 2026 06:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=+zktzO1THtivE8RtTDtfmTZ31+mDLTKCChJg4LAmWAY=; b=InTPHpfYTJ0z
	d3+OKSgjA2ktMFYtkh86BCaYXoQqMVfIXctO0yrfsyOzjNYdH5SQj/4jIqgiiNzF
	Kxd+iz+UH5glwLEPlANkh64WT+qBfQZqeaJZvfk8Z/a6o/lAt5dZtdB/R29L5OCR
	JK4YJJkePWDkh7kNu8hwb4QD86BCr4nCs2HkcW9uwTKiFMcoy3BPE/csZDLlKp0W
	kaMDbyXRQZ+vaYA/c5OWZIDGxuPe8SNCRmWGS4tWtMYELQjJTcqZPc2rGJkGs9L5
	gCvrRQ80A1DBpn1a0LHHPzX82Mx39ideiYFwANbjoUY2hRzU+o/zY9HxixPivx4p
	Os2aawALPA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bet33d0g5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Jan 2026 06:26:37 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 7 Jan 2026 22:26:36 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 7 Jan 2026 22:26:35 -0800
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH 06/15] skopeo: set go buildid to empty for improving reproducibility
Date: Thu, 8 Jan 2026 14:26:19 +0800
Message-ID: <20260108062628.3636344-7-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108062628.3636344-1-changqing.li@windriver.com>
References: <20260108062628.3636344-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=cPTtc1eN c=1 sm=1 tr=0 ts=695f4e1d cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=880Hzrme4pSuv9t6iRsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: gHCjzpLuxoVB6KUi3FbeFh7MxGq2ZmmK
X-Proofpoint-ORIG-GUID: gHCjzpLuxoVB6KUi3FbeFh7MxGq2ZmmK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA0MCBTYWx0ZWRfXwRxvw7333qoi
 DVD53o9q3ReZ8m8zvnm3Id+NAfov5y69UH4XZDJ+inuVq4YcMYpOUyJyoI0PHl0G1HmTswd1Zd5
 Ze93mkJOZcux+BOg9SKhnhpHp3bQ4tUdJ8E3jabpCSh1ujobP4ZOpM58CdpwK55Y9/y/abHg6CY
 aOCQeeH0UVI9PU3DSVqbgnDwny86aPU0Djbf7azYH9G8PKqkIG4PY8KS316BSFFtF2FBfmbHZt3
 IXacboU5ZvENX4SEILZca1V5BZsXrySX5Hilhe0yEXr1WfMSxl+WC/qIu5W8tT5ijpBEq9RxAMR
 B82n5mFluiGrGX7IOzIX+U3TUiYLRB2phoeASn7OOI/qQzKjoOfkkZF3oOKnmvp+dHLIxcedZhY
 BWWos4poHnIOa1FRDjjarOYMywDxHoPnW556qLtVi6Iz6IpVUnueKMfhA+lvgOjossxBxIeAy/n
 VYqylE3tVFctt88FmyQ==
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9537

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-containers/skopeo/skopeo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
index 936d2c3d..c07ef6ed 100644
--- a/recipes-containers/skopeo/skopeo_git.bb
+++ b/recipes-containers/skopeo/skopeo_git.bb
@@ -60,7 +60,7 @@ do_compile() {
 	export CGO_LDFLAGS="${TARGET_LDFLAGS}"
 
 	export GO111MODULE=off
-	export EXTRA_LDFLAGS="-s -w"
+	export EXTRA_LDFLAGS="-s -w -buildid="
 
 	oe_runmake bin/skopeo
 }
-- 
2.34.1


