Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA7CCD4851
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 07:41:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16290.1779176508736308921
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 May 2026 00:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HQT0Wl7r;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=959923361d=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5F53H3123156;
	Tue, 19 May 2026 07:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Ab2yWd5CByZZq/5eC8YO
	vmhJ+kE/moRp4H5BRoxo3B8=; b=HQT0Wl7rplYEnNArLBFrUOYcp5qW/J7KLwz9
	s9uRpbntE193VvmJ4VN54ynus9ftYUm3MntkmTBaGJzxanzwcTdWCpY8aU019wwc
	b/a1qv8NW/mI8CZqETrQcRBvNsRhs74HaYPxAAB8LTtxRM+4J2Zp/GMcgPKNL/XK
	W+AGLKNxO9/0IEdqRQEVfYkWB+2sGFtQ7wLNRJ4KyHXTeV9slRo5Y6dIctzV2AtK
	bxI6p27Tq+LVUOs+JJgouF0zrnyA8r7+sNLs21R28dJVDx2r9mVFMtVzBAqE4aJY
	Wqk2PAzSOzTmPLz+QDkQw0A/QPnUOz5NvXFvEfGafQ0W1oUDAg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6ecf38fr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 19 May 2026 07:41:46 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 19 May 2026 00:41:46 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 19 May 2026 00:41:45 -0700
From: <jiaying.song.cn@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][meta-cloud-services][PATCH] layer: update LAYERSERIES_COMPAT to wrynose
Date: Tue, 19 May 2026 15:41:44 +0800
Message-ID: <20260519074144.602860-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: LPAZdO2iLx6Pa_KRsHf2rhrWfeZXIhBa
X-Proofpoint-GUID: LPAZdO2iLx6Pa_KRsHf2rhrWfeZXIhBa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3NSBTYWx0ZWRfX/ASXynbCGnLb
 5KPdsoYVk10nfVO24cJwvF20bpzxXk8Gl+r1BxNJ8CB4aQCV1SKfV8Cbrf9MPF8Z8/idfHCmZxQ
 DEcqf3XUNHqnMbr9JN0nWs2FbWWcxFavhSwSFYN+aEBDa9yEMh2ZgTegaSXA5HdnxJVtuUhYGdM
 D0Zh10gU8DGY6xXVZgDZShtKjVQh+aBSmphM+SCGszsFXrBAGBzF6c50ipCsRflcFXWe6Urk0+x
 4sWd7FrBXSxB1gk6ShBBtTvHO/mrW9p7xY4EI6Pot8RmD4S4YdwtlDI5ifUGOLpeIUqjjl3NcD8
 k4d5OwKV0yCv5ByTJ78ZRatB7Os8fPxKdJ797mGzeZoEz8EmnReF0Gpm12CUCsxJnUeytx0GUzY
 sfayNTHWNtnP6ozyfmu0DlakE4rYpdFX9wUiZrN/MwQ0oaXoD5UwEqeZUPVGEojf4f3WpiXf5Bh
 TZpaTIjBFThHWn3jFzQ==
X-Authority-Analysis: v=2.4 cv=dK2WXuZb c=1 sm=1 tr=0 ts=6a0c143a cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=5h67h_9zRmsA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=Dki1gSQhXkoWWISmaykA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1011 phishscore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190075
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 May 2026 07:41:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9797

From: Jiaying Song <jiaying.song.cn@windriver.com>

Update LAYERSERIES_COMPAT from 'thud warrior' to 'wrynose' in 7
sub-layers to match the main layer and fix compatibility errors
with the current core layer.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta-openstack-aio-deploy/conf/layer.conf             | 2 +-
 meta-openstack-compute-deploy/conf/layer.conf         | 2 +-
 meta-openstack-compute-test-config/conf/layer.conf    | 2 +-
 meta-openstack-controller-deploy/conf/layer.conf      | 2 +-
 meta-openstack-controller-test-config/conf/layer.conf | 2 +-
 meta-openstack-qemu/conf/layer.conf                   | 2 +-
 meta-openstack-swift-deploy/conf/layer.conf           | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-openstack-aio-deploy/conf/layer.conf b/meta-openstack-aio-deploy/conf/layer.conf
index 67a1ef01..fde31817 100644
--- a/meta-openstack-aio-deploy/conf/layer.conf
+++ b/meta-openstack-aio-deploy/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "openstack-aio-deploy-layer"
 BBFILE_PATTERN_openstack-aio-deploy-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_openstack-aio-deploy-layer = "6"
-LAYERSERIES_COMPAT_openstack-aio-deploy-layer = "thud warrior"
+LAYERSERIES_COMPAT_openstack-aio-deploy-layer = "wrynose"
 
 LAYERDEPENDS_openstack-aio-deploy-layer = " \
 	core \
diff --git a/meta-openstack-compute-deploy/conf/layer.conf b/meta-openstack-compute-deploy/conf/layer.conf
index 047d006e..4af5ef96 100644
--- a/meta-openstack-compute-deploy/conf/layer.conf
+++ b/meta-openstack-compute-deploy/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "openstack-compute-deploy-layer"
 BBFILE_PATTERN_openstack-compute-deploy-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_openstack-compute-deploy-layer = "6"
-LAYERSERIES_COMPAT_openstack-compute-deploy-layer = "thud warrior"
+LAYERSERIES_COMPAT_openstack-compute-deploy-layer = "wrynose"
 
 LAYERDEPENDS_openstack-compute-deploy-layer = " \
 	core \
diff --git a/meta-openstack-compute-test-config/conf/layer.conf b/meta-openstack-compute-test-config/conf/layer.conf
index 9525e202..90ed8dcb 100644
--- a/meta-openstack-compute-test-config/conf/layer.conf
+++ b/meta-openstack-compute-test-config/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "openstack-compute-test-config-layer"
 BBFILE_PATTERN_openstack-compute-test-config-layer := "^${LAYERDIR}/"
 # We want this layer to have higher priority than any other meta-openstack layers
 BBFILE_PRIORITY_openstack-compute-test-config-layer = "100"
-LAYERSERIES_COMPAT_openstack-compute-test-config-layer = "thud warrior"
+LAYERSERIES_COMPAT_openstack-compute-test-config-layer = "wrynose"
 
 LAYERDEPENDS_openstack-compute-test-config-layer = " \
 	openstack-compute-deploy-layer \
diff --git a/meta-openstack-controller-deploy/conf/layer.conf b/meta-openstack-controller-deploy/conf/layer.conf
index d1512b8e..a50e400d 100644
--- a/meta-openstack-controller-deploy/conf/layer.conf
+++ b/meta-openstack-controller-deploy/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "openstack-controller-deploy-layer"
 BBFILE_PATTERN_openstack-controller-deploy-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_openstack-controller-deploy-layer = "6"
-LAYERSERIES_COMPAT_openstack-controller-deploy-layer = "thud warrior"
+LAYERSERIES_COMPAT_openstack-controller-deploy-layer = "wrynose"
 
 LAYERDEPENDS_openstack-controller-deploy-layer = " \
 	core \
diff --git a/meta-openstack-controller-test-config/conf/layer.conf b/meta-openstack-controller-test-config/conf/layer.conf
index aa8a0ee3..71a9d014 100644
--- a/meta-openstack-controller-test-config/conf/layer.conf
+++ b/meta-openstack-controller-test-config/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "openstack-controller-test-config-layer"
 BBFILE_PATTERN_openstack-controller-test-config-layer := "^${LAYERDIR}/"
 # We want this layer to have higher priority than any other meta-openstack layers
 BBFILE_PRIORITY_openstack-controller-test-config-layer = "100"
-LAYERSERIES_COMPAT_openstack-controller-test-config-layer = "thud warrior"
+LAYERSERIES_COMPAT_openstack-controller-test-config-layer = "wrynose"
 
 LAYERDEPENDS_openstack-controller-test-config-layer = " \
 	openstack-controller-deploy-layer \
diff --git a/meta-openstack-qemu/conf/layer.conf b/meta-openstack-qemu/conf/layer.conf
index bf629d0b..1fbee947 100644
--- a/meta-openstack-qemu/conf/layer.conf
+++ b/meta-openstack-qemu/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "openstack-qemu-layer"
 BBFILE_PATTERN_openstack-qemu-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_openstack-qemu-layer = "6"
-LAYERSERIES_COMPAT_openstack-qemu-layer = "thud warrior"
+LAYERSERIES_COMPAT_openstack-qemu-layer = "wrynose"
 
 LAYERDEPENDS_openstack-qemu-layer = " \
 	core \
diff --git a/meta-openstack-swift-deploy/conf/layer.conf b/meta-openstack-swift-deploy/conf/layer.conf
index 5f7a7fa0..14e82fad 100644
--- a/meta-openstack-swift-deploy/conf/layer.conf
+++ b/meta-openstack-swift-deploy/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "openstack-swift-deploy-layer"
 BBFILE_PATTERN_openstack-swift-deploy-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_openstack-swift-deploy-layer = "6"
-LAYERSERIES_COMPAT_openstack-swift-deploy-layer = "thud warrior"
+LAYERSERIES_COMPAT_openstack-swift-deploy-layer = "wrynose"
 
 LAYERDEPENDS_openstack-swift-deploy-layer = " \
 	core \
-- 
2.34.1


