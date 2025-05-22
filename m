Return-Path: <patrick.vogelaar@belden.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3869DC54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 20:19:42 +0000 (UTC)
Received: from mx0a-00015a02.pphosted.com (mx0a-00015a02.pphosted.com [205.220.166.249])
 by mx.groups.io with SMTP id smtpd.web10.33172.1747945179024258294
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 May 2025 13:19:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@belden.com header.s=podpps1 header.b=wj8KruGn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: belden.com, ip: 205.220.166.249, mailfrom: noreply@belden.com)
Received: from pps.filterd (m0264209.ppops.net [127.0.0.1])
	by mx0a-00015a02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M71Sdr027965
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 May 2025 16:19:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=belden.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=podpps1; bh=RiuXgp56NfvGD4UqDxAW40iZ7oB6DZMBfNghV
	zp7F6o=; b=wj8KruGnxPx0ty757eGrdRXCiIsCCqCibo9hi6RZvOzmIynbmsUBH
	ymPqdPTocr7vmQyqQiSVu7y2I23zuyQxY8+z/u2ddxG1aPB+GXpgMu/xL2f9jTb9
	GoJcMvpehQ90JpcvG/KrKAU0s6WHOq4gKj6wFi7XMPZnljBLiocT2qmFxduJeIJx
	/E8iVf6iXUhPrre+lmHE575oLJBOvjzg6DhGI/bLK6+/3zCAbsXRJJSP+xZmda+S
	GVz1Hki5qxYQ8bi2cw2WIXx12GED4xSSa8soINgVFyRVM/gVMXlLxh76uv5Y6YYQ
	7xDa66zg4wBDYao3ING6XML1KXETDBpgA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-00015a02.pphosted.com (PPS) with ESMTPS id 46rweewjyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 May 2025 16:19:38 -0400 (EDT)
Received: from m0264209.ppops.net (m0264209.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54MKEuQd024713
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 May 2025 16:19:38 -0400
Received: from relay2.belden.com ([12.161.118.81])
	by mx0a-00015a02.pphosted.com (PPS) with ESMTPS id 46rweewjye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 May 2025 16:19:38 -0400 (EDT)
Received: from pps.filterd (dcric1ppa02pb.mcp.local [127.0.0.1])
	by dcric1ppa02pb.mcp.local (8.18.1.2/8.18.1.2) with ESMTP id 54MGv0ka028811;
	Thu, 22 May 2025 16:24:46 -0400
Received: from denec1rnd301p.tcn.gad.local ([10.1.2.194])
	by dcric1ppa02pb.mcp.local (PPS) with ESMTP id 46rxas2885-1;
	Thu, 22 May 2025 16:24:46 -0400
Received: from [10.115.249.111] (port=59896 helo=pxv03011-build-home.fritz.box)
	by denec1rnd301p.tcn.gad.local with esmtp (Exim 4.96)
	(envelope-from <noreply@belden.com>)
	id 1uICO6-0031Ng-3B;
	Thu, 22 May 2025 22:19:35 +0200
From: Patrick Vogelaar <patrick.vogelaar@belden.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Patrick Vogelaar <patrick.vogelaar@belden.com>
Subject: [meta-virtualization][PATCH] cni: make ca-certificates rrecommends
Date: Thu, 22 May 2025 22:19:32 +0200
Message-Id: <20250522201932.1481656-1-patrick.vogelaar@belden.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 mlxscore=0 mlxlogscore=485 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505220204
X-Authority-Analysis: v=2.4 cv=JbS8rVKV c=1 sm=1 tr=0 ts=682f86da cx=c_pps
 a=cuOCxa8MntS3/AsasmU/aA==:117 a=cuOCxa8MntS3/AsasmU/aA==:17
 a=dt9VzEwgFbYA:10 a=WDlp8lUfAAAA:8 a=C9ONvaxdfOac4VZauVkA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDIwNCBTYWx0ZWRfXypGRHQk+ZOHn
 R2dnv5GEel19dDjZp5+cBQoCUGCrGCz8v/OhVwVB3nRcXlfxRqWZNJWeWxAilrPCwGEnplh7w3Y
 5/CHKeDBXiVALPP1MGbWyKjOsetQ+xdRzrTSzswnKOCy4I2IZ+jr2jLSHu9DZUXhH5a2SOY1oCn
 P26hIhZV9MHSyqOYgka3NNVqxl3A6vaplEbJ2bRvH4+DhW0Ex7wKxDNqKwYocmbU0wAWbUveqAe
 07l4qkFDI62hYduLG7Z8LMEl3FXNl19HO2Vi32chSHquugSJXt0dMeqTbVT5ywwkAMPCfhvjQH0
 T+2t3hU5Pv9K4xLOsNxaYiiTlFml49FYET4O6bxdd01LjR8C6DVAyXR27/7YVmztUND1euPKfQZ
 m7xEnJ/aMdTFcqzyfXr8rYBLdAIPsOjOuvmUhDe+XhlxdpPQGYE5SvUE0513d4id7BlbFzss
X-Proofpoint-GUID: dJHAP9FRflAjKIM7ONhR28Z0h2VM1Ysw
X-Proofpoint-ORIG-GUID: h09uCOSf1FSHXM5iXZgHWIKMgC6rYtij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=493 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1011 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220204
X-Proofpoint-TriggeredRule: module.spam.rule.outbound_notspam
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 22 May 2025 20:19:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9256

Moving ca-certificates from RDEPENDS to RRECOMMENDS allows using cni without
installing all the certificates.

Signed-off-by: Patrick Vogelaar <patrick.vogelaar@belden.com>
---
 recipes-networking/cni/cni_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
index e6d71aa2..bd67cd0d 100644
--- a/recipes-networking/cni/cni_git.bb
+++ b/recipes-networking/cni/cni_git.bb
@@ -109,5 +109,4 @@ INSANE_SKIP:${PN} += "ldflags already-stripped"
 
 deltask compile_ptest_base
 
-RDEPENDS:${PN} += " ca-certificates"
-RRECOMMENDS:${PN} += "iptables iproute2"
+RRECOMMENDS:${PN} += "ca-certificates iptables iproute2"
-- 
2.34.1


**********************************************************************
DISCLAIMER:
Privileged and/or Confidential information may be contained in this message. If you are not the addressee of this message, you may not copy, use or deliver this message to anyone. In such event, you should destroy the message and kindly notify the sender by reply e-mail. It is understood that opinions or conclusions that do not relate to the official business of the company are neither given nor endorsed by the company. Thank You.

