Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88B4ACD98CF
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 09:36:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.150242.1781602574769590208
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 02:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nhQSFcI+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0627f155f3=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G9U1AP3210900
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 16 Jun 2026 02:36:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=HT/H1mnZ++WO7dObSQHg
	govQVR6gjCe9UW+RK3FS4mo=; b=nhQSFcI+DbtTkYtnzgSBqa0GW+AVHdB2OpPB
	3WE5nhhY2S0u1rpPVPvWBpzgkN/JwOKiqXq3yK3ZMxDbHmLqxY8KOZ4aWIyyZz78
	0wZnTF+/KmKwRne82YgB2nK5vJ/6QU9ufcIrP5K7kS0oNgYxv+Ohq3pSj6iXsS30
	EE4MVnX9x5Q+ku/LjjxuO6EtWgo8zAls3o9SJ9pcYv/b4nkQoNZF2bjok2kzsFlF
	71p5nLvrhaWYVgqPr2LFTvWMoFMVKKZX+sxQhnAS1j0oM95dnBkNYljZ/tT6RDjL
	SnJPV6DjcmVFA8cAEaARaSneOvfGFEDIwLTeSaZ1Mvkm6v2RDQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4es2g0c8wb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 16 Jun 2026 02:36:14 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 16 Jun 2026 02:36:13 -0700
Received: from ala-lpggp9.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 16 Jun 2026 02:36:13 -0700
From: <mingli.yu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] libvirt: Set COMPATIBLE_HOST to 64bit arch
Date: Tue, 16 Jun 2026 02:36:13 -0700
Message-ID: <20260616093613.1817112-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=ZJ/nX37b c=1 sm=1 tr=0 ts=6a31190e cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=3XN8_AUbtmPkmUkPTvUA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA5NiBTYWx0ZWRfX3JZ5cI98U07b
 HfcOEMPlsV8+qKRSaFyBOeJdJKl1NXfWcTVTW1rVgkib7Zk5P1y6WbGqd3WrtH50CcW8oFZxROv
 QtsAN1WIq2isL6+pwykwRbP4zeoGYp2EE8F7w77AhB3hrgfDqcIGDH+EVucEt2j/XsLVv93IiIU
 6uTRJwo0BkCeHzXqgIhSADJSF9p1wzyEXML3nXbGUWxNSXKrBpp/Hc52VOMKz/YlUqad1/wXW27
 vXfPnHaIJOTqLfRzEiwkWBIM05vsPFDW6y/iJeGn+YmXCGs7vLAlpBtEYcMNLRvPhEkNoZM53/5
 nbAjKW7bsHM5f3D2wiOIVMGc1OE85m4jfl5MibMzENLnF1BDAtfCD4Auo8TR6PFWOlzMAu9pdK5
 5X1YZOrHqoZmOJO7gG1crqIquwszME3fblrA/XbWe/XDdAYPLBDtlEWoCz7TUn65rhwoyjpZiy2
 Z5YsSv1X3zPXm/74p5Q==
X-Proofpoint-ORIG-GUID: wNpwahaBlp74A2tPfust7B_oGocZ4Zi2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA5NiBTYWx0ZWRfX4XwLR7L2bk3E
 mkMmVzX2BLOyE+3bpWFGuqM4+aOtmGw2/gZ/LbCOP6XSUkAHZxelygV7WQUKGIyDdi3eZb3cCc8
 HovYKygUCc5086xfUbZ32XZwe9EMkwVcU1E9KHKxriAcDyPSjjPU
X-Proofpoint-GUID: wNpwahaBlp74A2tPfust7B_oGocZ4Zi2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160096
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 16 Jun 2026 09:36:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9893

From: Mingli Yu <mingli.yu@windriver.com>

qemu sets COMPATIBLE_HOST to 64bit arch [1], so set the COMPATIBLE_HOST
accordingly to fix the build failure.
ERROR: Nothing PROVIDES 'qemu' (but /build/layers/meta-virtualization/recipes-extended/libvirt/libvirt_git.bb DEPENDS on or otherwise requires it)
qemu was skipped: incompatible with host arm-wrs-linux-gnueabi (not in COMPATIBLE_HOST)

[1] https://git.openembedded.org/openembedded-core/commit/?id=f74d4025

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 recipes-extended/libvirt/libvirt_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
index fb7e5293..837f9660 100644
--- a/recipes-extended/libvirt/libvirt_git.bb
+++ b/recipes-extended/libvirt/libvirt_git.bb
@@ -139,6 +139,11 @@ PACKAGECONFIG:remove:mipsarchn32 = "qemu"
 PACKAGECONFIG:remove:mipsarchn64 = "qemu"
 PACKAGECONFIG:remove:powerpc = "qemu"
 PACKAGECONFIG:remove:riscv32 = "qemu"
+# QEMU 11.0.0+ requires 64-bit host architecture
+PACKAGECONFIG:remove:arm = "qemu"
+PACKAGECONFIG:remove:armeb = "qemu"
+PACKAGECONFIG:remove:mipsarch = "qemu"
+PACKAGECONFIG:remove:x86 = "qemu"
 
 # numactl is NOT compatible with arm
 PACKAGECONFIG:remove:arm = "numactl"
-- 
2.54.0


