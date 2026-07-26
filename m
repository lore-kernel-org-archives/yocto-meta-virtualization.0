Return-Path: <kraghava@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1051C531C9
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 20:21:00 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17266.1785097253565494170
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 26 Jul 2026 13:20:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=MJp6pWCM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: kraghava@qti.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QJxwGA1684340;
	Sun, 26 Jul 2026 20:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=f6mb7BwMqjgZEGbUUXBOlk
	gq+6pGu8ksfkE2h+KlE/8=; b=MJp6pWCMmNgSG/p5RTorox6YTHtMownnasGF1E
	jsdkwsAbZxh9/hOq2mkAKzBe9f0nHxA65ksuChumOUxG6+UwVs58VvJHZUl4DyeH
	tj7oUzbS3FYgBSmxbgl9h36AyQ2SBPPV41i0kweMKQvgbdeOxg69gLS7/3Sq6IV6
	nyVf//LCK7yOgvufrhz/v0riaQ9nyBmlw01jfbnY1Cd+G5/ZbpPfiON+qQjAetK7
	pqlK3xcMwjKxMMW3kxS3ib5CoH8CifWasU/x+GQ062SWA4hkDcrNNfp9oMhFHYEF
	UoTgQlVS95oNICpemqyu0VhJyk/XbCwfWDfb0ImxM8hEJcvw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmn7vbm3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 26 Jul 2026 20:20:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 66QKKocp016725
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 26 Jul 2026 20:20:50 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 26 Jul 2026 13:20:47 -0700
From: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
To: <anujmitt@qti.qualcomm.com>, <vkraleti@qti.qualcomm.com>,
        <sbanerje@qti.qualcomm.com>, <bruce.ashfield@gmail.com>,
        <meta-virtualization@lists.yoctoproject.org>
CC: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
Subject: [PATCH v1] crosvm: replace monolithic DEPENDS with PACKAGECONFIG flags
Date: Mon, 27 Jul 2026 01:50:28 +0530
Message-ID: <20260726202028.509096-1-kraghava@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=GKk41ONK c=1 sm=1 tr=0 ts=6a666c23 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=FQiW_UHFh4AN-bGlyvsA:9
X-Proofpoint-GUID: tZwAP6yQaKpqcsIVpJydN1h7zaUkhQln
X-Proofpoint-ORIG-GUID: tZwAP6yQaKpqcsIVpJydN1h7zaUkhQln
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwNiBTYWx0ZWRfX5iHtsJtq6jzO
 zSuDXGt2M884G5kCPD2c6Q+oix/9FZIclslwB074CkrUCiBJ5+AzY+k6cFu96lEKHOgV4aDQiOE
 Kv7BoVMmbiUXhTdsLd7KGfKJwvSAuu0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwNiBTYWx0ZWRfXzZekY7ZH9h7s
 3jEhKFJoEaI/h/+6tqJsLlSTAUCfrdnGKtkJhQejc/tnqPTmRXHkrbZ2b+vw9QYIKpQWWAiiBXm
 M3cAef04QzU4cmRzdVINNN9X8E+MB52o+d3PahPHlWFMcMq//4fA1A38zTSg1PMYATkgtTttZR/
 wRhmDJ4bzL7etvnWCChcwJyWOLKvM9EJ7lfo6XRcfY+eFOVr4gj4H/7ldzrZHRDqPZ4O5yYVCUW
 AodZ36xTi3KjDNB5TvnlMnSAFfDcDfbmo+xPyLKv5ZFLB4WV1MPmRT4rcI+7mW3gxXZdULLqwBJ
 buSx6XhP6z64APOP5RsCWt19ByqMPQpglDnk6HjR5BuaaJgKYAcdK9kyaL196Kn8lMLwPBdDhZp
 EOViYcDG2ksgJ7Ncw35IMZsagnotTm5RKcre6ZsOE3jsfi0cQEH5QiIIIAcZuBs6wVZAt2gAZu+
 w8RxxRfZWqBJ+zqPt9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_06,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260206
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 26 Jul 2026 20:21:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9979

Previously, all crosvm feature dependencies were unconditionally added
to DEPENDS, with no way to enable or disable individual Cargo features
at the distro or machine level. Replace this with PACKAGECONFIG entries
that map each feature to its build-time dependencies. The default set
mirrors upstream crosvm defaults minus GPU, preserving existing
behaviour while allowing GPU (and its wayland pull-in) to be opted in
explicitly. Pass --no-default-features with the resolved PACKAGECONFIG
flags so Cargo feature selection is driven entirely from the recipe.

Tested by inspecting crosvm-image-minimal-qemux86-64.rootfs.manifest
to verify that installed packages match the expected PACKAGECONFIG and
dependency settings. Boot-to-shell into a crosvm guest was verified on
qemu x86-64 to confirm correct runtime behaviour. Build was also
verified on qemu aarch64.

Signed-off-by: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
---
 recipes-extended/crosvm/crosvm_0.1.0.bb | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/recipes-extended/crosvm/crosvm_0.1.0.bb b/recipes-extended/crosvm/crosvm_0.1.0.bb
index c192ae25..6a876fa3 100644
--- a/recipes-extended/crosvm/crosvm_0.1.0.bb
+++ b/recipes-extended/crosvm/crosvm_0.1.0.bb
@@ -28,9 +28,25 @@ SRCREV_FORMAT = "crosvm_minijail"
 # consistency, not an upstream project release.
 PV = "0.1.0+git"
 
-# TODO: Break this down into pkgconfig flags mapped to
-# rust cargo feature flags.
-DEPENDS += "libcap wayland wayland-native protobuf-native wayland-protocols clang-native"
+
+DEPENDS += "libcap clang-native"
+
+# The default set of packageconfig has been mapped to
+# crosvm default features with gpu removed.
+PACKAGECONFIG ??= "audio balloon document-features qcow usb libvda-stub net slirp"
+
+PACKAGECONFIG[audio]             = "--features audio,,"
+PACKAGECONFIG[balloon]           = "--features balloon,,"
+PACKAGECONFIG[document-features] = "--features document-features,,"
+PACKAGECONFIG[gpu]               = "--features gpu,,wayland wayland-native wayland-protocols,"
+PACKAGECONFIG[qcow]              = "--features qcow,,"
+PACKAGECONFIG[usb]               = "--features usb,,"
+PACKAGECONFIG[libvda-stub]       = "--features libvda-stub,,"
+PACKAGECONFIG[net]               = "--features net,,"
+PACKAGECONFIG[slirp]             = "--features slirp,,"
+
+# Disable upstream Cargo defaults and drive features entirely via PACKAGECONFIG
+CARGO_BUILD_FLAGS:append = " --no-default-features ${PACKAGECONFIG_CONFARGS}"
 
 REQUIRED_DISTRO_FEATURES = "kvm"
 
-- 
2.34.1


