Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C863EC07E8E
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:12:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11464.1713946322085156463
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Apr 2024 01:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ILjn41RU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48443a9d6c=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43O5imgU021014
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Apr 2024 01:12:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=NoqD3O7tmwb63MHPt8jD+SkUFcLlslqeKZyk51jBB2w=; b=
	ILjn41RUXFOoM1FEEzMSPpWxTMB6sC/ZZxU6ktzrljqyDZa++Vxkzjd7dtP5goG8
	WjLyeNra7QF97MNteqP2d9Wwe3mwTdVuOLbhUGA8YcJg2DV7ozyiGHRD3zd3JmTM
	Hr12cFWrCN9AYJNOdLFjC54K7XcG0dkaBL5P0BWGAFbzBLFCNSq6gSY+so1StPYu
	gPh9I3sB9yqxvCpaUGWpA0P2JhE3l4ZCg2E1b2sWilbungsfVK0eiHWjk89nQB+H
	8vk8AY2JJWSaEMix3qj2QmjwldY22QDZh2XeDLt2jx/zScz9yHNg0N4mrHcvGk6z
	lWEY56vQZ705iZE4uBFlVA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xm900unr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Apr 2024 01:12:01 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 24 Apr 2024 01:12:00 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Wed, 24 Apr 2024 01:12:00 -0700
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [master][scarthgap][meta-virtualization][PATCH 3/3] kubernetes: Pass -trimpath to build
Date: Wed, 24 Apr 2024 16:11:57 +0800
Message-ID: <20240424081157.2608243-3-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240424081157.2608243-1-changqing.li@windriver.com>
References: <20240424081157.2608243-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: A8xq2Bib3KSX3BHbmaJ2gZ-YBaBINWEG
X-Proofpoint-ORIG-GUID: A8xq2Bib3KSX3BHbmaJ2gZ-YBaBINWEG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-24_05,2024-04-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=961 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404240035
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Apr 2024 08:12:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8697

From: Changqing Li <changqing.li@windriver.com>

Fix following QA WARNING:
WARNING: QA Issue: File /usr/bin/kubectl in package kubectl contains reference to TMPDIR [buildpaths]
WARNING: QA Issue: File /usr/bin/kubeadm in package kubeadm contains reference to TMPDIR [buildpaths]
WARNING: QA Issue: File /usr/bin/kube-proxy in package kube-proxy contains reference to TMPDIR [buildpaths]
WARNING: QA Issue: File /usr/bin/kube-apiserver in package kubernetes-misc contains reference to TMPDIR
WARNING: QA Issue: File /usr/bin/kubelet in package kubelet contains reference to TMPDIR [buildpaths]

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-containers/kubernetes/kubernetes_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index caa5ec17..d7874dfa 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -92,6 +92,7 @@ do_compile() {
 	export CC="${CC}"
 	export LD="${LD}"
 	export GOBIN=""
+	export GOFLAGS="-trimpath"
 
 	# to limit what is built, use 'WHAT', i.e. make WHAT=cmd/kubelet
 	make cross CGO_FLAGS=${CGO_FLAGS} GO=${GO} KUBE_BUILD_PLATFORMS=${GOOS}/${GOARCH} GOLDFLAGS="" DBG=1
-- 
2.25.1


