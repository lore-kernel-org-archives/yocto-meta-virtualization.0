Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E93E8FDB1
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 06:19:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38665.1766989181317132669
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 28 Dec 2025 22:19:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aab3VijC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54583b23f8=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BT5S5mU502495
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 28 Dec 2025 22:19:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=4Jb0S8fs7SgRUWz648iB
	4on339fQTOETI0OYs2wLa6M=; b=aab3VijC0FtDFuAgBed8QSCPQaW06PnS94NY
	WC85iEUNsQkMFnzF3646zpqEJIOZRf0v8cS9mVIkJO5sCe4kCyKGHqDB33vzhE/p
	cnDOQsSeHKMEXACv8jsNqvcDMGZn6sGI0RCD0HEeEYQe6g5AT1eHx3tDbozd2Ofg
	hkS2q2KAQQGpGfnzhPxGJsSO7tpyvGLW/WXosCx4xtzSaZq0h2dCEfunZa+F+9PU
	1wJSU+UYB7WRARfE1m1/57eOk32ZfmMG7C7bEskMYcjOwl0ONbkHY1gX435dMydx
	Sq7kfLusQy1ZMBZtggc2m+wuYCWHHidt/vfmRa3n8FquF2spTQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bafuk95k9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 28 Dec 2025 22:19:40 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 28 Dec 2025 22:19:40 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 28 Dec 2025 22:19:39 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] irqbalance: correct to install /etc/default for systemd
Date: Mon, 29 Dec 2025 14:19:21 +0800
Message-ID: <20251229061921.751807-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=ccjfb3DM c=1 sm=1 tr=0 ts=69521d7c cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=9MTI_IXfLANh1iOVPlYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: kEO-Z018LdOCRQYnEMdi1djT-Xa5rxz0
X-Proofpoint-ORIG-GUID: kEO-Z018LdOCRQYnEMdi1djT-Xa5rxz0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA1NiBTYWx0ZWRfX/vjTmytXMI8n
 esz2k/vY3Y5SLWtvx9NgKoe4wW6vbWH369RWIm6g9dTGPR95yCnyJOSKzeV4tmTvzrWNrRslAfd
 71JZiUgraD1hCkUMt6ouKk79ls+K5fpqR7g1G5a78kI+FHSqkIERZjdj8t5gbtmULMRRzTvDrU/
 nlfgOACVAvDdv/dugnA7s+lkrO/1c5dX5lRTSjVUonevBKvM2kbmIWGpzeMMuDUPO0Laot/Z4ku
 +XmwI4anp3CR+MljhoYywfMimcec71884IJ7uHXNR6naPXRJMQ4e26OwBoAFKqrAODpHJkpowz5
 AjJ66MGRqe9C1IuVWxMTX9y04V/CWOiWjFh2aFtC9JVn8lvp9wk/SiFYP67ehD4d4H5ukAztZJx
 AtZIVVZXprlJ0aj7TrNDd9v5OvOUat1HKNFhXeUXqnFAdXP/Tl1sBZymuqE8bk/oTbbX9aYwGWE
 nuk7hSuGFGCQ0/aG6mA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290056
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 29 Dec 2025 06:19:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9509

Due to upstream commit [Properly embed EnvironmentFile sourced systemd
configs into meson and autonconf][1], introduced 2 configurable directories,
defaults set to: /usr/etc/default.

This commit uses option --with-pkgconfdir to correct to install /etc/default
for systemd as usual

[1] https://github.com/Irqbalance/irqbalance/commit/41cb97c714e6216ab7f10f8aaa51a2548da3acc7

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 recipes-extended/irqbalance/irqbalance.inc | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/recipes-extended/irqbalance/irqbalance.inc b/recipes-extended/irqbalance/irqbalance.inc
index a145a3b3..35b6388e 100644
--- a/recipes-extended/irqbalance/irqbalance.inc
+++ b/recipes-extended/irqbalance/irqbalance.inc
@@ -34,7 +34,7 @@ PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd',
 #
 PACKAGECONFIG[numa] = "--enable-numa,--disable-numa,numactl,"
 PACKAGECONFIG[libcap-ng] = "--with-libcap-ng,--without-libcap-ng,libcap-ng,"
-PACKAGECONFIG[systemd] = "--with-systemd,,,"
+PACKAGECONFIG[systemd] = "--with-systemd --with-pkgconfdir=${sysconfdir},,,"
 
 do_install () {
         oe_runmake 'DESTDIR=${D}' install
@@ -48,5 +48,3 @@ do_install () {
 	fi
 }
 
-# in case systemd support files are installed
-FILES:${PN} += "${prefix}${sysconfdir}/default/"
\ No newline at end of file
-- 
2.34.1


