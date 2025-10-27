Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AAB6CCF9EA
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 08:43:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.27560.1761554608746318277
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 01:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=p/WWuXlv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=239549c8ef=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R4N2232229023
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Oct 2025 08:43:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=gQ0FhY8yPMTTyzU4rdBO
	iL++PP4qmEzlCskNaQxR/Ms=; b=p/WWuXlvOrJw3JrhdyhMAl2ay6Lq+gNmQD92
	56xEZjGotOqJZMKNm2ja8HN4FqnhssqHRAPAGPf9nbqsUYzXO6Z7+ci0L3aeJo9O
	O/TJHjsx2C2NCkGaGLnLgauB/fji+ujO4litg1FN8t6sZ/M2Dx5PuqLonkX6f0S5
	X5gdvp8GSDabMp/DnqRsgIkHP8vIfzRlpZjSbBgHulpzsy9L7X2TbywS9YE934Rm
	IdKwsOHaxuU6BgGbUNZjaEm7RpdEYcuU0z6HdP4kgVTzXzonkiwIDSzr6tTVdqF2
	td6/+GScYLRc5kbUbj48TdskzeFUU7FnMsttbakLCn7npR5Glw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a0ks01mvv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Oct 2025 08:43:27 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 27 Oct 2025 01:43:26 -0700
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 27 Oct 2025 01:43:25 -0700
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] layer.conf: add kubernetes into NON_MULTILIB_RECIPES for x86-64
Date: Mon, 27 Oct 2025 16:43:24 +0800
Message-ID: <20251027084324.2411594-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 0hRXe5jxjsppe1eRum1q18JQphl2gqp6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA3OSBTYWx0ZWRfX4gKZ1mNvEFTX
 z94pmWnXWFuR94sc6nzRmG8+oClzfAf3xGT9JyFNnRf4LJ5chiJNVBxVImVD09NV3lnzxrkCrXF
 JtzhEWHoBWXB7F4PSf++hdcSXzAYcJGsXi+3aAtCL9cKSLRlAoLxNfdMhRqet+Um3dBkEAoBpUs
 PiMTksKcbBtWzxH3EJESU00I764iyiCs522mafzOBNs6ycbcGTiCveNQOdKzQ61pHau+QUQzTeM
 fg6bnap39WonXY50fJ+yTf5L1zcL88INOkbYpTRq3QpWCNmx9Ncsmoo9Cp/niOb+TXcPZNsYOhx
 7eODrap14MkpUB9p+3IP79qULLOl4Fp2RLpfoldXTw1x5GqdOo8l50Eu3c/pKMm/nVpBejXBeXh
 vzegDjT6zWRygiyukr+7y8KlQl313g==
X-Authority-Analysis: v=2.4 cv=CIknnBrD c=1 sm=1 tr=0 ts=68ff30af cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=dpwPbqtU81Eo3-UiwVAA:9 a=zZCYzV9kfG8A:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 0hRXe5jxjsppe1eRum1q18JQphl2gqp6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270079
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Oct 2025 08:43:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9425

From: Changqing Li <changqing.li@windriver.com>

Here is the setting in recipe kubernetes:
COMPATIBLE_HOST = '(x86_64.*|arm.*|aarch64.*)-linux'

x86 is not support, so add kubernetes into NON_MULTILIB_RECIPES for
x86-64 to avoid extending lib32- variant

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 conf/layer.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/conf/layer.conf b/conf/layer.conf
index 9a443f9a..dbe66d8c 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -67,3 +67,5 @@ USER_CLASSES:append = " meta-virt-xen-cfg"
 USER_CLASSES:append = " meta-virt-hosts"
 
 HOSTTOOLS_NONFATAL += "getent"
+
+NON_MULTILIB_RECIPES:append:x86-64 = " kubernetes"
-- 
2.34.1


