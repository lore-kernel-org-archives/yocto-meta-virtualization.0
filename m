Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 643DEEDE98F
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 07:53:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6752.1694677987747717461
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 14 Sep 2023 00:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=quDawLXF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=76213d3f08=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38E7r6La009530;
	Thu, 14 Sep 2023 07:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=/MChN
	RBz9uOz9Qy02z0OGHFUKyml9hBaygLlSqcaBHg=; b=quDawLXFjVgOyBiqNwkMG
	XBGaIiZFnZcUPr3qVinLsTTeFKL7/pJJGFz79UrkseDk67lKOSVvQnzVJeP242t2
	6bm70pPxdt0XEAoOJA/UcOJ4r0T0dwtBM6Y/Ke2eE7Gbh9ZfnU0QTWPHzus/Og6a
	gnZYXdmld9qgIEHKyzvOdKSy6YzMTVGFlct/VUuNFUAohqoPrg70sSqQviZm6ht6
	TeuiOUjiBafSK+bdg7wwe1FQBtOyKkH5xYV4eiiLEQGTf7ix/O62clss4Rfd673H
	hJmIaXtKDbfCV2bDsLyK2FPG31onz48g/FCr7CQmfoNd3jFOs48SE/3rpN44+Uct
	A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t2y8mshm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Sep 2023 07:53:06 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 14 Sep 2023 00:53:05 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 00:53:04 -0700
From: <kai.kang@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH v2 0/4] Update COMPATIBLE_HOST
Date: Thu, 14 Sep 2023 15:52:56 +0800
Message-ID: <20230914075300.773380-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 9WUhENYKawSQ2TEBWo0TJtGWVgLt1TIR
X-Proofpoint-ORIG-GUID: 9WUhENYKawSQ2TEBWo0TJtGWVgLt1TIR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_05,2023-09-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=388 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309140069
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Sep 2023 07:53:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8305

From: Kai Kang <kai.kang@windriver.com>

tested with
$ for m in qemuriscv32 qemuriscv64 qemumips qemux86; do
	  MACHINE=$m bitbake -n world
  done

Kai Kang (4):
  packagegroup-container: not compatible with mips and riscv
  docker-compose: not compatible with mips
  packagegroup-kubernetes: set COMPATIBLE_HOST
  k3s: not compatible with mips

 recipes-containers/docker-compose/docker-compose_git.bb | 2 ++
 recipes-containers/k3s/k3s_git.bb                       | 2 ++
 recipes-core/packagegroups/packagegroup-container.bb    | 2 +-
 recipes-core/packagegroups/packagegroup-kubernetes.bb   | 2 +-
 4 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.34.1


