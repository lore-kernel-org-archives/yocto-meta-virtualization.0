Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F607C25B72
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 15:29:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.21115.1698161386933930399
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 08:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Z1lFxtOF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=86611b9e41=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39OCoPT7023392
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 24 Oct 2023 08:29:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=lg/l2uw6HfHk1CwWraqmAA8YFuGN+wRCCrKARwdEZVs=; b=
	Z1lFxtOFN9sqJDGEDsuWjeIIRuaTpzkqjd8DoZJUSQm+pJwFD9mAzNiV6NEfCYng
	7k+KRUk8POKFFOcBRvBPlJ/eE8pqLdh+Uw93Ne2vkUowmEXDe7LlxtiSMO81SbEd
	LqpwOwZzs3360+qUdkvXW2miMyOm2iMqCBiM61H+ZLM7imx0q7Pt6uouj1u0ADpg
	roisVCa5Hx7xK/fmPqGSR5setHUAmXW3lOMpDDb8sZBJQBYmfuFRETZPKotF4MTU
	m9+wuxtXeUtJfBWjzWUzb7omOmwXrRpVGOyV38Q9WJauvooj/g2t6FqR6nhnPtKZ
	hDqw7at+wfNzMl+E+B+aOQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tve5fb59d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 24 Oct 2023 08:29:46 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 24 Oct 2023 08:29:46 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.34 via Frontend Transport; Tue, 24 Oct 2023 08:29:45 -0700
From: <kai.kang@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH 2/2] runv: set COMPATIBLE_HOST
Date: Tue, 24 Oct 2023 23:24:15 +0800
Message-ID: <20231024152415.1259420-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024152415.1259420-1-kai.kang@windriver.com>
References: <20231024152415.1259420-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: s0r2H-2u9Koli5MMe9NeMrxirxzKLxZv
X-Proofpoint-GUID: s0r2H-2u9Koli5MMe9NeMrxirxzKLxZv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-24_16,2023-10-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=600 clxscore=1015 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2310170000 definitions=main-2310240133
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 24 Oct 2023 15:29:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8385

From: Kai Kang <kai.kang@windriver.com>

runv rdepends on qemu, so update COMPATIBLE_HOST for runv to accord with qemu.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 recipes-core/runv/runv_git.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-core/runv/runv_git.bb b/recipes-core/runv/runv_git.bb
index e5a5abd3..73cd81a6 100644
--- a/recipes-core/runv/runv_git.bb
+++ b/recipes-core/runv/runv_git.bb
@@ -19,6 +19,12 @@ inherit goarch
 inherit pkgconfig
 inherit autotools-brokensep
 
+# accord with qemu
+COMPATIBLE_HOST:mipsarchn32 = "null"
+COMPATIBLE_HOST:mipsarchn64 = "null"
+COMPATIBLE_HOST:riscv32 = "null"
+COMPATIBLE_HOST:powerpc = "null"
+
 PACKAGECONFIG[xen] = "--with-xen,--without-xen,"
 AUTOTOOLS_SCRIPT_PATH = "${S}/src/import/"
 
-- 
2.34.1


