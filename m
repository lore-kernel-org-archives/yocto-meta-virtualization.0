Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00AFDC4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 06:17:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8812.1714457857032601562
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 29 Apr 2024 23:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JCcTBsF+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5850838629=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43U4upde029611
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Apr 2024 06:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=QDGb0
	DQ1l8Es3C837A0ANAbWhhCnrrli8cLcRoylNxA=; b=JCcTBsF+Wa38AaKhHYF18
	NrnD2xZ9A68v9ip49sLJt9IhhbjRuDIwoy2FZubeggwIuTLyfuGnZaZLf98G6xRK
	kAaPFDJ2IQmPETmzwVtMK5WBeqrXj0GBFNU0y1ncIISsjpJdnO1j3rdxozSLXUx+
	TsXdALDB2EFGg+dy7tjmEqj2rCuP3Itn0V+mG/0yYh9g/2xPN+bMQ6iXGPYcUuHp
	UvhuNYoeiA1W+4gZ8zSy37hHrBYgKRF7NUCfDdLcS83q9ICwFwDc7bFpk3kvv3cl
	VskzG+LYATHN9hqkSvQ9oFF/Y5dyVICzjezAl7dqFC4ghP8g4qeZpUGGBlU9qCHK
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xrpjxb64t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Apr 2024 06:17:36 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Mon, 29 Apr 2024 23:17:34 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Mon, 29 Apr 2024 23:17:34 -0700
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [master][scarthgap][meta-virtualization][PATCH] kubernetes: skip textrel QA warning
Date: Tue, 30 Apr 2024 14:17:33 +0800
Message-ID: <20240430061733.3518484-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 05Dh7q8u14vt88r3pcC6gBYs-QAeOiDu
X-Proofpoint-GUID: 05Dh7q8u14vt88r3pcC6gBYs-QAeOiDu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_02,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 spamscore=0 impostorscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300044
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Apr 2024 06:17:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8706

From: Changqing Li <changqing.li@windriver.com>

-buildmode=pie need cgo is enabled, but for kubernetes, some build
targets are static, and cgo is disable in build script directly, refer
[1]. If we add -buildmode=pie by default, will cause these static target
build failed with error "-buildmode=pie requires external (cgo) linking,
but cgo is not enabled".

This warning is acceptable, so just skip it.

[1] https://github.com/kubernetes/kubernetes/blob/master/hack/lib/golang.sh#L811

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-containers/kubernetes/kubernetes_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index d7874dfa..044175eb 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -126,7 +126,7 @@ PACKAGES =+ "kubeadm kubectl kubelet kube-proxy ${PN}-misc ${PN}-host"
 ALLOW_EMPTY:${PN} = "1"
 INSANE_SKIP:${PN} += "ldflags already-stripped"
 INSANE_SKIP:${PN}-misc += "ldflags already-stripped textrel"
-INSANE_SKIP:kubelet += "ldflags already-stripped"
+INSANE_SKIP:${MLPREFIX}kubelet += "ldflags already-stripped textrel"
 
 # Note: we are explicitly *not* adding docker to the rdepends, since we allow
 #       backends like cri-o to be used.
-- 
2.25.1


