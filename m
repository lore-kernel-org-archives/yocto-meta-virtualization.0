Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71AD7EB28FF
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 09:17:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7480.1770369426300587098
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Feb 2026 01:17:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bApj05NM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=64976eadc2=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6167tS0K315581
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 6 Feb 2026 09:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=IaFFUFBQJNFp9HyxGb+i7SvQowPcjioCMSlFGzJyDyY=; b=bApj05NMGJ1+
	fHmMmxPJ5a2Scd1Q93JZPFRJ6/GjwLt4OJo81gVDfZtImdnNUGPRrhzH2tIErFFV
	x4MF6BfqEgedoxM+6lMU/9/ZgGPJfSB0qeyHD5r36twhgTM+aRmQFFv2ydm63Pv0
	JaabGLVNtGsZClt8Wc7P489Y6ce+qkEjt+Id4KYkaRZGl9TVqy7daTaW+jy7YHA8
	BNA6YctN0WrHwiVrWC4wGAXoSanGunqzF+pKclbRF6aAAsiLY9GhUtjUniNhZW+a
	mJNANHIQTYT4FkIoPMXq13sKlAjpKxj7Oy9uokepG99ftWicBZYs2g2ItNCmUiFd
	gP9bsDD7BQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c4jbu1uxq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Feb 2026 09:17:05 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 6 Feb 2026 01:17:04 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 6 Feb 2026 01:17:03 -0800
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH 2/2] podman: improve reproducibility
Date: Fri, 6 Feb 2026 17:17:01 +0800
Message-ID: <20260206091701.3904742-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260206091701.3904742-1-changqing.li@windriver.com>
References: <20260206091701.3904742-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=IOsPywvG c=1 sm=1 tr=0 ts=6985b191 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=t7CeM3EgAAAA:8 a=IQqN-E_fqvswtDDXg70A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA2MCBTYWx0ZWRfXyM9QHFlQbNgn
 4G+9ShxtBwu0Sf/KlSakMwHAFnuDwUNLdkN8fniaQ1ludD0EZcnH73f3HPQRGzUhB67raXcyMQ2
 l7AQw7K3itw9GROPqBE2Dq3ePlVJSA9rZKJu5NOiC9CTOmZyQmLVjnQc6miLPRp7BCoZ4y2A3H7
 TxxZdwhxJkmFagJNhKZ2Zd59PqFdROjzCu5jap8x068WF8sf+cWeY7H0DxMqFKNwN/yQGBp8c2E
 1Zd6hZYH7b4tY+fcQrbv+hjGsxfwdFpQyTbzszkrLJJaKuJDOMPr7sHe3EESlbqN/ReZlbajHbP
 A8QDyrtQgLczO71EcrCPUP/EsPqcAENrPy786MEKaQK9kqy6MNdnTmU01CULpZh9X/6FWBqUtpl
 D3SztDWteTR4FN2a/ew8aJzM7mggt7czznz/1r3z1V912j+Zo4N/i6ZSWYBDVhKd7X1aUZJerXC
 hOixcEGPVs2bJAvYmDQ==
X-Proofpoint-ORIG-GUID: fioHW3TbJx428_KzSCET0v7bmm8wu7lT
X-Proofpoint-GUID: fioHW3TbJx428_KzSCET0v7bmm8wu7lT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_02,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060060
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Feb 2026 09:17:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9561

From: Changqing Li <changqing.li@windriver.com>

disable buildvcs to improve reproducibility

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-containers/podman/podman_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 5e5f1f9b..b7a5793f 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -48,7 +48,7 @@ export LDFLAGS = ""
 TOOLCHAIN = "gcc"
 
 # podmans Makefile expects BUILDFLAGS to be set but go.bbclass defines them in GOBUILDFLAGS
-export BUILDFLAGS = "${GOBUILDFLAGS}"
+export BUILDFLAGS = "${GOBUILDFLAGS} -buildvcs=false"
 
 inherit go goarch
 inherit container-host
-- 
2.34.1


