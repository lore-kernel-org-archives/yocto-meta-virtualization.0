Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5767AE78D44
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 08:30:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43109.1770625848239225291
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Feb 2026 00:30:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Rh95ZeYW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=650090017b=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6196qWuD3522742
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 9 Feb 2026 00:30:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=0afliPQgXq8h3yRJIPetc9JnRy+S5Fj8rG9lB2KTBqg=; b=Rh95ZeYWS7mi
	hq+aKcjb3CwnY4kfjWK/dLqB38CuE+k0OX25hCFyRHMXF2DwVTr5f6ufokCMxVbI
	qKMFb6WS3MXvr0bo1Gc95bbSyB3vtKbX/jK4pNJyy5A6buszwgwnPbfgsTfYDSnf
	qL+s3VbTj4+yZevOqSpCbzQCuraa2t8RvwJr0cGYWXYQEK6cjrilOtCJ+8QqoFr1
	x2kBpcph6hbaEuJaR4bedbPnlCYz0z5K3JsZeANvvNi7nms0RVDBNobnJTCOnHBA
	/VPLZxkujuDku7HekvYSlVucAeiKv4tMwKemqOjOSbowObEUTnc9qrAxn1zvCLGN
	serOBwehLQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c65sj19nv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Feb 2026 00:30:47 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 9 Feb 2026 00:30:47 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 9 Feb 2026 00:30:46 -0800
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH V2 2/2] podman: improve reproducibility
Date: Mon, 9 Feb 2026 16:30:44 +0800
Message-ID: <20260209083044.394768-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260209083044.394768-1-changqing.li@windriver.com>
References: <20260209083044.394768-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: inw-0s8c-T0LB7J6ctoyJc4mr4NTPk_p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA2OCBTYWx0ZWRfXwOPQOqjUXax/
 STZ8e7TBGq+Jy56Cd4Ldl15Hp6KfdAWIimW8Y3vfKt9T/IaWZVeugpP+PMIZiQp+4P42dC0ynz+
 wqJHnID8W8DQt1kRqR+TSPhREDJgTkKq4uN3wiyDitHP76gmKsSZeeQQE9mq5vTdGU/0UoDgdYY
 2fJHtvLuByLCMrwOf2gDtu+MdGYAvNw02Vd1B9jMLjJy6i1G0AuCrZ85idoWR2zOR9J/dK8WMWC
 BqgbUQBsmoylvCqTq0syrFjg9hVSGJR+e66EAnJ5yrdJ86QIfmoN6c+aIerM7XO9dCEVVMHEdRo
 /oTj9NXaZFiV6V40cUsz9L888V9BWss3KmHvcEkE7O59GhCFPnsgjv9tyExMMiGrgoDpV5JVDUp
 qgt+gxqzVvTPer6J5gkbuzSGTgrqJn/u5egwJgRi77yUHOecjVExFpviCBERm2+WWqPGOIL5o76
 fYyAz6EE3GKHodPtI2Q==
X-Proofpoint-GUID: inw-0s8c-T0LB7J6ctoyJc4mr4NTPk_p
X-Authority-Analysis: v=2.4 cv=Cpyys34D c=1 sm=1 tr=0 ts=69899b37 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=t7CeM3EgAAAA:8 a=IQqN-E_fqvswtDDXg70A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090068
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Feb 2026 08:30:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9569

From: Changqing Li <changqing.li@windriver.com>

disable buildvcs to improve reproducibility

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-containers/podman/podman_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 87e694e5..e6410a0d 100644
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


