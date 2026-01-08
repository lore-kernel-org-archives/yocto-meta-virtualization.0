Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16ACD148AF
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 06:26:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.937.1767853594631728212
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 22:26:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GVu6DCUh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54685ebb30=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6084ugnQ485994
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 8 Jan 2026 06:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=aqKEBIMIQWw0ea9VVbCTrqoVhYJBLrTgL2U4MdyWsWY=; b=GVu6DCUhza4e
	MqvIjubRejaxfxFSuuqA52v8gjkDvR53uypGIbXVFsjgmwimuFgQqyPNDwf9M5X+
	2tDyliSn56w3YpWovruVyDrgRTUR9c1KmekfdVbEVTHyLhoVdWYn3p589jfxYtPR
	b0D6xASffd7MFGfNSoVFez26GH6ho0UfrxJDIJWc0A87IVxm6GM9SoJbDVH4ayZh
	11FYAxdk3mLcN3/yweUe1SolVwKW3AX2e2fRwqinNRg0cJkfd5T/En8M1pRp+puW
	qTsQXgP2LlPnTkAwjM1aE/rNFYYMKpfzeZC4AMvWTDUH1t1B9kivURXFhMl+Nphx
	VSFD9GZ1+Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bet33d0g0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Jan 2026 06:26:33 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 7 Jan 2026 22:26:32 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 7 Jan 2026 22:26:31 -0800
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH 02/15] docker: set go buildid to empty for improving reproducibility
Date: Thu, 8 Jan 2026 14:26:15 +0800
Message-ID: <20260108062628.3636344-3-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108062628.3636344-1-changqing.li@windriver.com>
References: <20260108062628.3636344-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=cPTtc1eN c=1 sm=1 tr=0 ts=695f4e19 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=VYui-ZLe1udHCUZ1J0sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: mQhcsRIZDqCPjTxBXxD4ufeEV9pBA0Jg
X-Proofpoint-ORIG-GUID: mQhcsRIZDqCPjTxBXxD4ufeEV9pBA0Jg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA0MCBTYWx0ZWRfX5yB2waPLcu8U
 OUbMq5jaBezrhoS/kRmEtKGNsqlvyk8xTM8pzRGuQ5CWgfYUdkupUpOo9/WnLWEZAbH0+NreU1h
 PBtgxvHiqChKTm41+7XBKQxdyQHYgjU/owmIxSa9pwUfoK60VOweRfmgGca42jtRP5WOvVo5jQ9
 ROrQoFPvQM2P1sT4sanTtxMMh68CIXWOv9tTOJtBg6ROOFAP/37c6p4VpsaKDFyeBrZmtzdmSeD
 CHPs0BKq/6yTjm8hQ09UbP8+dHHTaSVk7sJgNZOUfeKQnbIBBnDWnPQQapCfHk1dOPqyesRmJvp
 9v5B/rAvikOXnDmXhQZMfFeaPYt+/eWBhmTe15mc5W6hPnkuYN54UWusZPAR3YJhEL+JqnO1xFO
 uwOum1iORqE+K9Dg5lPH6PvhiE+Uxrz5oXBOrpUxfg0kr1ZsbGtDe0H+rG3K0nJCfvOyX7BV0Ro
 4Mqt8GPe9r9kN4iTLUQ==
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
 <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Jan 2026 06:26:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9533

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-containers/docker/docker.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
index 99535a77..8da12aa6 100644
--- a/recipes-containers/docker/docker.inc
+++ b/recipes-containers/docker/docker.inc
@@ -89,6 +89,7 @@ do_compile() {
 
 	export DISABLE_WARN_OUTSIDE_CONTAINER=1
 	export BUILDFLAGS="-trimpath"
+	export DOCKER_LDFLAGS="-buildid="
 
 	cd ${S}/src/import/
 
@@ -103,6 +104,7 @@ do_compile() {
 	export LDFLAGS=""
 	export DOCKER_VERSION=${DOCKER_VERSION}
 	export BUILDFLAGS="-trimpath"
+	export GO_LDFLAGS="-buildid="
 	VERSION="${DOCKER_VERSION}" DOCKER_GITCOMMIT="${DOCKER_COMMIT}" make dynbinary
 }
 
-- 
2.34.1


