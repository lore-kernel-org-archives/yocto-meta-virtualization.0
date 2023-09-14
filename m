Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67AEEEDE98C
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 07:53:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6687.1694677989485308537
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 14 Sep 2023 00:53:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=L7z+6wn9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=76213d3f08=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38E50ul2029592
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Sep 2023 07:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=Ucgmd/d3PqDbBdqILkqMXUHfKMkL1kb3XhZf6AoksRE=; b=
	L7z+6wn9Licj2dUVunjYJKVALBB6IhnUmB9gayciPTQIxtIj3w22EVlHapcQtoR2
	cWGtegRaDBoDXOz1WhlADsUjySeCrK81leD75x87Nn9tVUzkmAucsrLeoU/BWILC
	bJ8PoVYv+g4pth+xSuwoxC7UKVc6k780xW/hVaEyNJWEgQJwzxxooTyE5GhLgbAv
	OBRHmTDcYcdsoKbMpheuWlfb3F6P8wMDJNpFAfklPAwXyGK4eMYAI7PywA3a76SZ
	gjA3aPuHdySUrgmSR3Y/fQC8SfY1dILZFbOjZKd7u/OiGttk4hGNcx3Z75GUw/hJ
	XqCGof7tCjEmvdIrXqsrpQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t2y8m9hwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Sep 2023 07:53:08 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 00:53:07 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 00:53:06 -0700
From: <kai.kang@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH v2 2/4] docker-compose: not compatible with mips
Date: Thu, 14 Sep 2023 15:52:58 +0800
Message-ID: <20230914075300.773380-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230914075300.773380-1-kai.kang@windriver.com>
References: <20230914075300.773380-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 7K7X3oDlzkESt6poTF0Cx9y5IAQaA8HK
X-Proofpoint-GUID: 7K7X3oDlzkESt6poTF0Cx9y5IAQaA8HK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_05,2023-09-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=562 spamscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309140069
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Sep 2023 07:53:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8306

From: Kai Kang <kai.kang@windriver.com>

docker-compose rdepends on docker which is not compatible with mips.
So set COMPATIBLE_HOST for docker-compose accordingly.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 recipes-containers/docker-compose/docker-compose_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-containers/docker-compose/docker-compose_git.bb b/recipes-containers/docker-compose/docker-compose_git.bb
index ca50abad..274fb520 100644
--- a/recipes-containers/docker-compose/docker-compose_git.bb
+++ b/recipes-containers/docker-compose/docker-compose_git.bb
@@ -32,6 +32,8 @@ COMPOSE_PKG = "github.com/docker/compose/v2"
 inherit go goarch
 inherit pkgconfig
 
+COMPATIBLE_HOST = "^(?!mips).*"
+
 do_configure[noexec] = "1"
 
 PACKAGECONFIG ?= ""
-- 
2.34.1


