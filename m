Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C298C3DA4A
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 09:11:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.14322.1724145053659654732
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 20 Aug 2024 02:10:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8962e10d81=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47K5V14x001756
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 20 Aug 2024 02:10:53 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412q542k61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 20 Aug 2024 02:10:53 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 02:10:52 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 02:10:51 -0700
From: <kai.kang@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH 1/2] libvirt-virsh: rdepends on libvirt-libvirtd
Date: Tue, 20 Aug 2024 17:10:43 +0800
Message-ID: <20240820091044.1815464-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 3NE_t4OoNYD46DCaKrZWdAe44cBYudSN
X-Proofpoint-ORIG-GUID: 3NE_t4OoNYD46DCaKrZWdAe44cBYudSN
X-Authority-Analysis: v=2.4 cv=b+3g4cGx c=1 sm=1 tr=0 ts=66c45d9d cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=yoJbH4e0A30A:10 a=t7CeM3EgAAAA:8 a=_QAoyIkaNk5RxOXkt5EA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_09,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 mlxlogscore=691 lowpriorityscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408200067
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 20 Aug 2024 09:11:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8861

From: Kai Kang <kai.kang@windriver.com>

virsh can not do anything without libvirt daemon running, such as

$ virsh list
error: failed to connect to the hypervisor
error: Operation not supported: Cannot use direct socket mode if no URI is set

So add libvirt-libvirtd to RDEPENDS of libvirt-virsh.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 recipes-extended/libvirt/libvirt_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
index 706d4a40..d01eaaa4 100644
--- a/recipes-extended/libvirt/libvirt_git.bb
+++ b/recipes-extended/libvirt/libvirt_git.bb
@@ -85,6 +85,7 @@ FILES:${PN}-virsh = " \
     ${bindir}/virsh \
     ${datadir}/bash-completion/completions/virsh \
 "
+RDEPENDS:${PN}-virsh = "${PN}-libvirtd"
 
 FILES:${PN} += "${libdir}/libvirt/connection-driver \
 	    ${datadir}/augeas \
-- 
2.34.1


