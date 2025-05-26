Return-Path: <patrick.vogelaar@belden.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B5B2C54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 21:07:24 +0000 (UTC)
Received: from mx0a-00015a02.pphosted.com (mx0a-00015a02.pphosted.com [205.220.166.249])
 by mx.groups.io with SMTP id smtpd.web10.37580.1748293634467113297
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 May 2025 14:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@belden.com header.s=podpps1 header.b=NvPJoBpO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: belden.com, ip: 205.220.166.249, mailfrom: noreply@belden.com)
Received: from pps.filterd (m0382794.ppops.net [127.0.0.1])
	by mx0a-00015a02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54QK1sER007145
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 May 2025 17:07:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=belden.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=podpps1; bh=g1fjA1U7IWXEFqJXVPBbKbtincmljtGNidr/D
	ht3tQA=; b=NvPJoBpOiJ46leaIOvgC+jVgdnClHEo7r0IeyLmy2gMh92Duwb1Tk
	cCQzH0CEkxyWcr9FvHrMifkAfbJPJQwJn9V3X53AU4Mdh/8cgyTSFEefJ5MJ3Dfz
	ILWDMCWzGSTu/6/owvuED2kj9BWvXIqauPj1KGGH2/MNWEq7EqUIAGy6Yl2uFCq4
	I9HlMVZ8iCwWe86MmHzHHLDq8XAtTYqsSswjZ+tT7udG+19utSuWOvYINzM/hndx
	DBqssAAf9kZI4LZhb4NnHhAybCy/mk93XfDtyVBlIauZmmSmvSZXdltB9QZkidpX
	C8YHiQiOXkQb9wapoU5FlOCLWQEMLCX3Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-00015a02.pphosted.com (PPS) with ESMTPS id 46uxjyads2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 May 2025 17:07:13 -0400 (EDT)
Received: from m0382794.ppops.net (m0382794.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54QL7DKY021748;
	Mon, 26 May 2025 17:07:13 -0400
Received: from relay2.belden.com ([12.161.118.81])
	by mx0a-00015a02.pphosted.com (PPS) with ESMTPS id 46uxjyads0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 26 May 2025 17:07:13 -0400 (EDT)
Received: from pps.filterd (dcric1ppa02pb.mcp.local [127.0.0.1])
	by dcric1ppa02pb.mcp.local (8.18.1.2/8.18.1.2) with ESMTP id 54QJ5ChB000438;
	Mon, 26 May 2025 17:12:23 -0400
Received: from denec1rnd301p.tcn.gad.local ([10.1.2.1])
	by dcric1ppa02pb.mcp.local (PPS) with ESMTP id 46u9exa231-1;
	Mon, 26 May 2025 17:12:22 -0400
Received: from [10.115.248.254] (port=50860 helo=pxv03011-build-home.fritz.box)
	by denec1rnd301p.tcn.gad.local with esmtp (Exim 4.96)
	(envelope-from <noreply@belden.com>)
	id 1uJf2M-004BHY-1h;
	Mon, 26 May 2025 23:07:10 +0200
From: Patrick Vogelaar <patrick.vogelaar@belden.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Patrick Vogelaar <patrick.vogelaar@belden.com>
Subject: [meta-virtualization][PATCH v2] cni: make ca-certificates a packageconfig
Date: Mon, 26 May 2025 23:07:08 +0200
Message-Id: <20250526210708.3721789-1-patrick.vogelaar@belden.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_10,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=569 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505260181
X-Authority-Analysis: v=2.4 cv=SLxCVPvH c=1 sm=1 tr=0 ts=6834d801 cx=c_pps
 a=cuOCxa8MntS3/AsasmU/aA==:117 a=cuOCxa8MntS3/AsasmU/aA==:17
 a=dt9VzEwgFbYA:10 a=WDlp8lUfAAAA:8 a=nAiqwprkte2nXuFNCMUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDE3OSBTYWx0ZWRfXzICcORtb2b54
 B6ILqcmvNjHymj+haGEIJ5mLCYqehU8cnGkOKC6uitZpy3AOeeRlP2GC+n7o6tfBkbnlk+Mvcme
 isV0ozdXhFyiAvCynnA9IjhjiCJr6fs3wEbJGcn14WP/uYEh+xMZxCgt46F1OLQM0MQj3FTUmUf
 fct2H+ZmOMpNgF7jAePt57DEyrv3qMpVzO2eNzlJsyEDxHLZwdKfO+z9p57jnYKVewIikFrrDoI
 iAOQGQHUi4TLJWzoFDHrMfYBc0nytGpdWK868hb19DDLQfYT5src6JG4nUjE+YqsgTkllFkIWwx
 QwZKTXDMk0Z74WRVEGO5GySrBYarxb4LcXcmSoBMkNKoFCLVoHoByym5gyXcAI6f79700d/Ufyw
 78yyC/hs1qfR2EhpSn+pnCHWrRGkxYU/VfmlIRPmlVIzRIufEtGN3vQ/XaDLTsy1O9odXPCQ
X-Proofpoint-GUID: bxEagJXu3OeQTo_xTGHYksmeoy0F3Z08
X-Proofpoint-ORIG-GUID: elOuwpIbGj2YLitVwCrRDPJ2ZuVeMLH-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_10,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 mlxlogscore=577 bulkscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505260179
X-Proofpoint-TriggeredRule: module.spam.rule.outbound_notspam
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 26 May 2025 21:07:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9260

Moving ca-certificates into a packageconfig allows using cni without
installing all the certificates.

Signed-off-by: Patrick Vogelaar <patrick.vogelaar@belden.com>
---
 recipes-networking/cni/cni_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
index b41b47cf..2cdbb169 100644
--- a/recipes-networking/cni/cni_git.bb
+++ b/recipes-networking/cni/cni_git.bb
@@ -89,10 +89,11 @@ do_install() {
     ln -sf ${libexecdir}/cni/ ${D}/opt/cni/bin
 }
 
+PACKAGECONFIG ?= "ca-certs"
+PACKAGECONFIG[ca-certs] = ",,,ca-certificates"
+
 FILES:${PN} += "${libexecdir}/cni/* /opt/cni/bin"
 
 INSANE_SKIP:${PN} += "ldflags already-stripped"
 
 deltask compile_ptest_base
-
-RDEPENDS:${PN} += " ca-certificates"
-- 
2.34.1


**********************************************************************
DISCLAIMER:
Privileged and/or Confidential information may be contained in this message. If you are not the addressee of this message, you may not copy, use or deliver this message to anyone. In such event, you should destroy the message and kindly notify the sender by reply e-mail. It is understood that opinions or conclusions that do not relate to the official business of the company are neither given nor endorsed by the company. Thank You.

