Return-Path: <haiqing.bai@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED595C5DF71
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 08:49:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20267.1780390169530360196
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 02 Jun 2026 01:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WmOric5y;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=061335ca30=haiqing.bai@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6521u6kb663579
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 2 Jun 2026 08:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=DSYAm+vujUlBl0FajIf1
	pY9Nouy8rE8LBqxveu95f1M=; b=WmOric5yqATjX6VC0U6ylQjkzChK4ik4NnlZ
	+jTRzGiJfqZRYB5cA7oe1IC3atOQbYVYWM03FG6kHoh8ZSoIw6f/jZI0wMSdYqkD
	DsZWZgqHhPbPggd6lQwiqvPUcqvq2NJ/2xIuwHir634JKgLwndqII1SnjFi+24Rm
	1XH09GIK+oeKfedQoaRAt4cVYmqD1iaVr3PoCJBLd8iIwQoAYsXNvVvghIknnkep
	JKcymc5w9bqn+rTfXWl1+GgrPBhtCqY0ncB0mnmQ7r3QZiuAPN/zO3Y+Ykh8xVRY
	CmsMKfHeVtuw7w9/NoAPmCGTtyiiGQgnbhIR10LVDJ5IB0IwAQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efn404f30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 02 Jun 2026 08:49:28 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 2 Jun 2026 01:49:25 -0700
Received: from ala-lpd-susbld.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 2 Jun 2026 01:49:25 -0700
From: <haiqing.bai@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [wrynose][PATCH] sloci-image: upgrade v0.1.0 -> v0.1.2
Date: Tue, 2 Jun 2026 08:49:25 +0000
Message-ID: <20260602084925.1052813-1-haiqing.bai@windriver.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: CjyQC39grsA5WYuLEt4WSPuwwSEc4uIj
X-Proofpoint-GUID: CjyQC39grsA5WYuLEt4WSPuwwSEc4uIj
X-Authority-Analysis: v=2.4 cv=GI441ONK c=1 sm=1 tr=0 ts=6a1e9918 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=NEAV23lmAAAA:8
 a=sUjGZmjrdxG75p-aSnwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4MiBTYWx0ZWRfXyqMljnQEbGPm
 f+ceEzUzf/pDs4NKm6QDZZueLtHIAukdj5FfyLe1oEqXiJGjaLIdCo+9bxU4m5EexWvWtv7+4C5
 rHfA77Jl6+tPmAGYZPBSOCAHgL0DXX6D7FPkox7JOkIZxljxOyvmij8mchlBM89niTk9l8ofmm4
 CfHDn5ntGI0N0s3RCiYHRgkYs8WkCJwAXXJok10C3C2c24ZjRH+LNplBK0MHOL4MnC1rjdCHE7C
 1PNeoaBvRkImxnyNnIqgYUsaNUEB+Aj26qGX1+ofQPeV4bP62puiXqnezKwrHdrSRMsuFnt8Iy2
 ple8R/EZ2w0g83TCmYevZfQYpS5Fh6P1Tf2x+frhNtB2WLpx5/vajfhvIk6tbkc+3FbFmZpVOLu
 1jSwtw088qoxXzpnu7cSpZUziF7vKcBGmn8X5aTXzqy81vjmP/tk0SW0HIWQ+H1G4/sq3JAdr/O
 uY4kI27ym8FSByL6eHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020082
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 02 Jun 2026 08:49:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9839

From: Haiqing Bai <Haiqing.Bai@windriver.com>

Upgrade sloci-image to the latest stable release v0.1.2.

Key upstream changes since v0.1.0:
- Fix escaping issues when generating OCI image config files
- Don't create top-level directory in tar archive (containerd compat)
- Fix "--arch arm64" argument being incorrectly rewritten to "arm"

Recipe changes:
- Update SRCREV to b45be2e (tag v0.1.2)
- Update LIC_FILES_CHKSUM for updated LICENSE file

The existing variant quoting patch is retained as it remains
applicable and is not addressed upstream (Upstream-Status:
Inappropriate [embedded specific]).

Signed-off-by: Haiqing Bai <haiqing.bai@windriver.com>
---
 .../0001-sloci-image-fix-variant-quoting.patch        | 11 ++++++-----
 recipes-containers/sloci-image/sloci-image_git.bb     |  6 +++---
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/recipes-containers/sloci-image/sloci-image/0001-sloci-image-fix-variant-quoting.patch b/recipes-containers/sloci-image/sloci-image/0001-sloci-image-fix-variant-quoting.patch
index 85aa6205..e1749b63 100644
--- a/recipes-containers/sloci-image/sloci-image/0001-sloci-image-fix-variant-quoting.patch
+++ b/recipes-containers/sloci-image/sloci-image/0001-sloci-image-fix-variant-quoting.patch
@@ -1,4 +1,4 @@
-From 55aebd87ee81f851d088beea8688e3e599c2bced Mon Sep 17 00:00:00 2001
+From f153bc9b54b2d43e572873b7a5ca490b97d2353d Mon Sep 17 00:00:00 2001
 From: Bruce Ashfield <bruce.ashfield@gmail.com>
 Date: Fri, 17 Jul 2020 14:40:12 -0400
 Subject: [PATCH] sloci-image: fix variant quoting
@@ -14,12 +14,13 @@ when a variant is defined.
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+Signed-off-by: Haiqing Bai <haiqing.bai@windriver.com>
 ---
  sloci-image | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/sloci-image b/sloci-image
-index be8e79a..e0dc469 100755
+index 7c0c3bd..a9bcd44 100755
 --- a/sloci-image
 +++ b/sloci-image
 @@ -298,6 +298,7 @@ oci_image_config() {
@@ -34,11 +35,11 @@ index be8e79a..e0dc469 100755
  	      "digest": "$manifest_digest",
  	      "platform": {
  	        "architecture": "$(oci_arch $CFG_ARCH)",
--	        ${CFG_ARCH_VARIANT:+"\"variant\": $(json_string "$CFG_ARCH_VARIANT"),"}
-+		${CFG_ARCH_VARIANT:+$variant_string}
+-	        ${CFG_ARCH_VARIANT:+"$(echo \"variant\"): $(json_string "$CFG_ARCH_VARIANT"),"}
++	        ${CFG_ARCH_VARIANT:+$variant_string}
  	        "os": "$CFG_OS"
  	      },
  	      "annotations": {
 -- 
-2.19.1
+2.51.0
 
diff --git a/recipes-containers/sloci-image/sloci-image_git.bb b/recipes-containers/sloci-image/sloci-image_git.bb
index e0bdad39..7c72c7d6 100644
--- a/recipes-containers/sloci-image/sloci-image_git.bb
+++ b/recipes-containers/sloci-image/sloci-image_git.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A simple CLI tool for packing rootfs into a single-layer OCI image"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=948cd8e59069fad992b0469af9ad7966"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=896c8ffa3d0539d0d980d0217269969d"
 SRC_URI = "git://github.com/jirutka/sloci-image.git;branch=master;protocol=https \
            file://0001-sloci-image-fix-variant-quoting.patch \
           "
@@ -8,8 +8,8 @@ SRC_URI = "git://github.com/jirutka/sloci-image.git;branch=master;protocol=https
 
 DEPENDS = ""
 
-SRCREV = "4015e49763e5a738026a5bbfcf32b38b5a4fa650"
-PV = "v0.1.0+git"
+SRCREV = "b45be2e049c5c55acb04a5edb017b793d2d9e677"
+PV = "v0.1.2+git"
 
 do_compile() { 
 	:
-- 
2.53.0


