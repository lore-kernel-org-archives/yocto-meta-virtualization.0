Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6FFCC10F15
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:12:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11415.1713946320260700560
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Apr 2024 01:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OCpAa3Hz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48443a9d6c=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43O5imgT021014
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Apr 2024 01:12:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=VpYn0
	EimuzkEyodG4PVpKnULTM2K0/9Xii34ditBon4=; b=OCpAa3HzBIIXlBoKelJJa
	0MFsH0Gv4l2RYy5CM4wBKNj8CslFPe5cOkJptRhnwxH2x4nKRU3pkdv/RI9Hf/JS
	5+VuFXmmhKblm1iQkl7L2h+IR6ZlrkWACjNQP9tEfzC5Ac2BMoyS131LEj6YI2Mz
	zrLsTUxAguEOlxOJDe6o2ObDmmKmQClBwgmOpk252W/o8yDXdyyGPBEwDH3dEdT3
	wU03rirOjxG+pOi3ZhzZySlXsGSgjnoqxWZusXX9Rk9EQ7MW/R1mkHrA5jBa0vKr
	yEN5nUYcRXH4WhK92zPs3aBenn/ZjEZ2A6nztC0DDi2F4CyVgPQETLFUX49lVJDn
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xm900unr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Apr 2024 01:11:59 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 24 Apr 2024 01:11:58 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Wed, 24 Apr 2024 01:11:58 -0700
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [master][scarthgap][meta-virtualization][PATCH 1/3] cni: pass BuildVersion info to avoid runtime warning
Date: Wed, 24 Apr 2024 16:11:55 +0800
Message-ID: <20240424081157.2608243-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 3NKkFLeEYo7blz9ROnIoKSjpGUsWQ1-T
X-Proofpoint-ORIG-GUID: 3NKkFLeEYo7blz9ROnIoKSjpGUsWQ1-T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-24_05,2024-04-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404240035
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Apr 2024 08:12:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8695

From: Changqing Li <changqing.li@windriver.com>

The default value of BuildVersion is 'unknown' and it
requires an override at link time to embed such version
info into binary.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-networking/cni/cni_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
index fda7af60..b41b47cf 100644
--- a/recipes-networking/cni/cni_git.bb
+++ b/recipes-networking/cni/cni_git.bb
@@ -34,6 +34,7 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464
 GO_IMPORT = "import"
 
 PV = "v1.2.0-rc0+git${SRCREV_cni}"
+CNI_VERSION = "v1.2.0"
 
 inherit go
 inherit goarch
@@ -68,7 +69,7 @@ do_compile() {
 	for p in $PLUGINS; do
 	    plugin="$(basename "$p")"
 	    echo "building: $p"
-	    ${GO} build ${GOBUILDFLAGS} -o ${B}/plugins/bin/$plugin github.com/containernetworking/plugins/$p
+	    ${GO} build ${GOBUILDFLAGS} -ldflags '-X github.com/containernetworking/plugins/pkg/utils/buildversion.BuildVersion=${CNI_VERSION}' -o ${B}/plugins/bin/$plugin github.com/containernetworking/plugins/$p
 	done
 }
 
-- 
2.25.1


