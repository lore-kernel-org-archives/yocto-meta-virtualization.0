Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A89D148BF
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 06:26:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.948.1767853608575939401
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 22:26:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qe/1LGcE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54685ebb30=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6084A1oX410522
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 8 Jan 2026 06:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=QdtoatN4Y3Wc8MB1gOTZipB8S4P4U8Uex0KK/+4qgcQ=; b=qe/1LGcEpDxq
	LSL1/4U+IBDNoFEzxnYPt4ApKa8TD+DhLInqVORQqYvlGCFJH7hpB0oHBHNui4yy
	haFNsFjLNTYOi6tFsV+8j2NGsvVmlor7kyblVXaJ7d9HKDdQtB8s9v4lBLhqD2y0
	xOesgrgP+e7DOSRaj1c+hUO2pDHWHyKftNOJN30nWfnFtMTkT6mvUI1GU0u+Xi9Q
	gqlzcviI5TpTHtzRBfQNb/vU24a+uPesO1MAEf0b7TRasZG6Ll+HL3OQ/H6UgzTR
	vqVE709oX0LiyXw80EmJnJVeplfSPhms1HO0FYLi/lbMV1Gsk+xP1PAXer9sedCm
	GQpcEM/LIg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bet33d0gc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Jan 2026 06:26:47 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 7 Jan 2026 22:26:46 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 7 Jan 2026 22:26:45 -0800
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH 15/15] podman: improve reproducibility
Date: Thu, 8 Jan 2026 14:26:28 +0800
Message-ID: <20260108062628.3636344-16-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108062628.3636344-1-changqing.li@windriver.com>
References: <20260108062628.3636344-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=cPTtc1eN c=1 sm=1 tr=0 ts=695f4e27 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=lcVpMcLD_ipajX-unVsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: XJaTog6FdhnqAL3tklWUhPMUGuMxqho4
X-Proofpoint-ORIG-GUID: XJaTog6FdhnqAL3tklWUhPMUGuMxqho4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA0MCBTYWx0ZWRfX9w+oNLojq4cw
 FSMJ53b79HgRkejJVYULnKifdzD8CgL1dryoigTanqvbFkxsL77tBY1qlT3llCeQrWsxvRaa0Nj
 F+rIkJZjNTl4Caq+jQvtZDD69UwpJs71jOcV+uEZFn73izel6eaO5qpzGx42Z3FBz5wJBHz08sR
 Oh41iMRtEwQ+vWlLYBGuDmx1C4/qhnT+wnyXTmT++wGi1KwebMrqmro/UenEqWyvYBnoPGp1yLt
 LwZp175Rde/JUqKHqmeVXrZN/FTFvA0JxvYHF65m9/sHVpRv3XysDwZJNv/x5uDf4fU72UzMwIM
 3ilR3Toy7qgEe4snSfm4+8Sd8AACPgPlbA4vh8OnWKzv8c8k/7k5BZ5bjEhmOYuRO0+Nq1QduRp
 qzxgQSyGEQhL9MY3jA5O45JczEB0X0smp3v4MM4mAftcjcKpodqV5l0lPVWAWl+ZoauzVB0PN+R
 6mXeifloHUj6ZewMVsA==
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
 <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Jan 2026 06:26:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9546

From: Changqing Li <changqing.li@windriver.com>

* set go buildid to empty for improving reproducibility
* set -buildvcs=false to improve reproducibility. do_compile will
  generate several binaries, when -buildvcs=true, check with command "go
version -m binray", some binraies with vcs.modified=false and clean mod
version,  some binaries with vcs.modified=true, and mod version append
with "+dirty", and the result is random. But actually, the git tree is
clean. It seems go have a different way to define clean repo. Just
disable buildvcs for improving reproducibility

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-containers/podman/podman_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index f09e01f8..06d1f3df 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -48,7 +48,7 @@ export LDFLAGS = ""
 TOOLCHAIN = "gcc"
 
 # podmans Makefile expects BUILDFLAGS to be set but go.bbclass defines them in GOBUILDFLAGS
-export BUILDFLAGS = "${GOBUILDFLAGS}"
+export BUILDFLAGS = "${GOBUILDFLAGS} -buildvcs=false"
 
 inherit go goarch
 inherit container-host
@@ -91,6 +91,8 @@ do_compile() {
 	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 
+	export EXTRA_LDFLAGS="-buildid="
+
 	# podman now builds go-md2man and requires the host/build details
 	export NATIVE_GOOS=${BUILD_GOOS}
 	export NATIVE_GOARCH=${BUILD_GOARCH}
-- 
2.34.1


