Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF3BAD148B7
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 06:26:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.938.1767853604256360308
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 22:26:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NzzLkKRT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54685ebb30=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6085GHQ82288958
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 8 Jan 2026 06:26:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=VTLXDXNIASmJf9FCceJU+gcGrK58a9TPJA3XBW8Gpww=; b=NzzLkKRTszuf
	nB0rhdbrFf1M2V0LRHwK5Cq8Nxs3eHMphXezWdvYVbn88duF5chsITjPoAyl1/eh
	mfWu29d84d/Xjx33A1GP/xIZc8AZZfYEvQSRJkXsCiN8WC7WjuZxzjYqlg8HbWr3
	r2M/fEJ1o247ZGeqLHFXi6FGJr8j10kz4jOkS2zDMnlqloqqDuejlemnOiEZzE5+
	EbdSSKFKX4mrhxywBEf1y+Owj6uWNVWYg/nR9ol1QtFdFwxYMdUqd7hPnoz1LxQ1
	ft1tfVAUxTq1pem0b5WdwOxesrDcLBoySALyLdsox7WNlbmDIcu2VEXWFXGp4O0F
	OEFDUnAzrg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4beravd29y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Jan 2026 06:26:43 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 7 Jan 2026 22:26:42 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 7 Jan 2026 22:26:41 -0800
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH 11/15] containerd: set go buildid to empty for improving reproducibility
Date: Thu, 8 Jan 2026 14:26:24 +0800
Message-ID: <20260108062628.3636344-12-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108062628.3636344-1-changqing.li@windriver.com>
References: <20260108062628.3636344-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA0MCBTYWx0ZWRfX8qtmya6xuwLb
 pJtXktDk3ZwCUJySjmS5n/YhbsyFVMHezrBavH7U5606pBEynVhLhVWxvT9bhnH9n5opIGbpGmO
 Vu0cH5xPMWnjiEG+tMWYiiNDPpUqYKWYjG5dMBTUBNwbPKqO7ZviKteW6mCEOFfyAZZtjhKkPjn
 8xJ/1yM+7xOgohxVVKOxzXxvwj8q/yhCyaosVuErKIz3q4SxMCLIs2kXyf+U3INPWjTHQaZLBM/
 Hw+2OsjFS5nsNrhLretKf2hgRTw4LVieAQlvqsI6S2Sr3VVP4twLSdcM+to5y8r5jL0ihwDnkJW
 GyZWxiQGC4zCMgstDeJ8EyW7iqgBZ342eZYlWJ2laYpTG8zHgBKESYT9feCdPc+XAPOwlbRnqKr
 VpafXV5SMvMDm8rJMiDeMdGl+ovF1/jP8xdn78I4a3/Oz2bg93eW2kzm56qz8Tx1P6RAGLkRYUZ
 3vyzBS2o5UxTZDzWQ0Q==
X-Proofpoint-GUID: QPvX4VTpst8P0eZ4WxOs-SjpVXZIbfok
X-Proofpoint-ORIG-GUID: QPvX4VTpst8P0eZ4WxOs-SjpVXZIbfok
X-Authority-Analysis: v=2.4 cv=PZjyRyhd c=1 sm=1 tr=0 ts=695f4e23 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=cVNO3GcpWaeg5nAiAZ0A:9 a=FdTzh2GWekK77mhwV6Dw:22
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
 <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Jan 2026 06:26:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9542

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-containers/containerd/containerd_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-containers/containerd/containerd_git.bb
index 081cf354..79e288bf 100644
--- a/recipes-containers/containerd/containerd_git.bb
+++ b/recipes-containers/containerd/containerd_git.bb
@@ -54,6 +54,7 @@ do_compile() {
     export CFLAGS="${CFLAGS}"
     export LDFLAGS="${LDFLAGS}"
     export SHIM_CGO_ENABLED="${CGO_ENABLED}"
+    export EXTRA_LDFLAGS="-buildid="
     # fixes:
     # cannot find package runtime/cgo (using -importcfg)
     #        ... recipe-sysroot-native/usr/lib/aarch64-poky-linux/go/pkg/tool/linux_amd64/link:
-- 
2.34.1


