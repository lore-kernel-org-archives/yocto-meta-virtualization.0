Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A89EDC021B2
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 02:40:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14746.1740105609310146529
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Feb 2025 18:40:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4147d8631d=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L1uGwu006330
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Feb 2025 18:40:09 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00kb7xx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Feb 2025 18:40:08 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 20 Feb 2025 18:40:08 -0800
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 20 Feb 2025 18:40:07 -0800
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] nagios-core: WORKDIR -> UNPACKDIR transition
Date: Fri, 21 Feb 2025 10:40:06 +0800
Message-ID: <20250221024006.4178241-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=N67TF39B c=1 sm=1 tr=0 ts=67b7e788 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=T2h4t0Lz3GQA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=M0oUc96biby5s2p_6_UA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: r6kt6hdYyOu9sehldrPI75q_ygjJpQQi
X-Proofpoint-GUID: r6kt6hdYyOu9sehldrPI75q_ygjJpQQi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502210017
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 21 Feb 2025 02:40:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9148

From: Changqing Li <changqing.li@windriver.com>

This adapts to the oe-core rework to enforce a separate directory
for unpacking local sources (UNPACKDIR) instead of directly using
WORKDIR.

Follows the preliminary guideline from:
https://lists.openembedded.org/g/openembedded-architecture/message/2007

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-extended/nagios/nagios-core_4.4.6.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-extended/nagios/nagios-core_4.4.6.bb b/recipes-extended/nagios/nagios-core_4.4.6.bb
index 59b70895..7ec930cd 100644
--- a/recipes-extended/nagios/nagios-core_4.4.6.bb
+++ b/recipes-extended/nagios/nagios-core_4.4.6.bb
@@ -106,14 +106,14 @@ do_install() {
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${systemd_unitdir}/system
-        install -m 644 ${WORKDIR}/nagios-core.service ${D}${systemd_unitdir}/system/
+        install -m 644 ${UNPACKDIR}/nagios-core.service ${D}${systemd_unitdir}/system/
         # use our own service file
         rm -f ${D}${systemd_unitdir}/system/nagios.service
         install -d ${D}${sysconfdir}/tmpfiles.d
-        install -m 755 ${WORKDIR}/nagios-core-systemd-volatile.conf ${D}${sysconfdir}/tmpfiles.d/nagios-core-volatile.conf
+        install -m 755 ${UNPACKDIR}/nagios-core-systemd-volatile.conf ${D}${sysconfdir}/tmpfiles.d/nagios-core-volatile.conf
     else
         install -d ${D}${sysconfdir}/default/volatiles
-        install -m 0644 ${WORKDIR}/volatiles ${D}${sysconfdir}/default/volatiles/99_nagios
+        install -m 0644 ${UNPACKDIR}/volatiles ${D}${sysconfdir}/default/volatiles/99_nagios
     fi
 }
 
-- 
2.34.1


