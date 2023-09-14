Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D20AEDE994
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 07:53:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6754.1694677991470965253
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 14 Sep 2023 00:53:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Sy9EGAPu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=76213d3f08=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38E6e44a010256
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Sep 2023 07:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=P8LX11Tbx5BSAP6ByLiVzuOrTePmNG9aKyFCw8jlsdU=; b=
	Sy9EGAPu970ZxrshnZxgHQ5K7fljMBQuz2Vpu7K/fPvH0UG5OQvVfqIFzOSvi7fA
	CNmzDY8+uWE8YHrUVz7G46FbV71n+TJa3/OHb5mERsQL3CCW0CBHNcG5b0bcl4Gr
	j7LGI2EiBt05ZHNzw3gWK3UWfipTiecv1ChgjDAqwisutPvN9rPEuaspwqpbR340
	XaYBDh5G4RALyc+kBzkFQfgHJpqF/vGYLLTQ+0AStMMFvkJSVyZ6ERJMxuAoMyZ/
	QLkB42+uEmgTrpMt1rjkgSAXPL8hnoYrkAqZoqWkGnDRHJANCWZMDuplwlu7tdmt
	eJe7OiLjrK9EkkjeeGIqNA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t2y8mshm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Sep 2023 07:53:10 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 14 Sep 2023 00:53:09 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 00:53:08 -0700
From: <kai.kang@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH v2 4/4] k3s: not compatible with mips
Date: Thu, 14 Sep 2023 15:53:00 +0800
Message-ID: <20230914075300.773380-5-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230914075300.773380-1-kai.kang@windriver.com>
References: <20230914075300.773380-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: bwqDG9abcsT95GE99BmH3uYqIJ4FdiZJ
X-Proofpoint-ORIG-GUID: bwqDG9abcsT95GE99BmH3uYqIJ4FdiZJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_05,2023-09-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=424 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309140069
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Sep 2023 07:53:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8308

From: Kai Kang <kai.kang@windriver.com>

k3s depends on 'virtual-containerd' provided by containerd-opencontainers
which is not compatible with mips. So set COMPATIBLE_HOST for k3s that
not compatible with mips to align with containerd-opencontainers.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 recipes-containers/k3s/k3s_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k3s_git.bb
index 9a8ff8b7..90718e98 100644
--- a/recipes-containers/k3s/k3s_git.bb
+++ b/recipes-containers/k3s/k3s_git.bb
@@ -30,6 +30,8 @@ inherit goarch
 inherit systemd
 inherit cni_networking
 
+COMPATIBLE_HOST = "^(?!mips).*"
+
 PACKAGECONFIG = ""
 PACKAGECONFIG[upx] = ",,upx-native"
 GO_IMPORT = "import"
-- 
2.34.1


