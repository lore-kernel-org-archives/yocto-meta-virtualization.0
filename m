Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E46DD10389
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 07:29:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8408.1764142163218715700
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Nov 2025 23:29:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PLrrzMLh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3425c28bd0=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ0ePGj565056;
	Tue, 25 Nov 2025 23:29:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=/jJq7SnKe
	wmGb+FW9gYpHzxqVELpyyzMtXOQ3w/grFs=; b=PLrrzMLhkaERVRBbW0Z7gS7sf
	OeMW0AXQBCh070+xxpUG+of5v/VruclX6RB3PIcQ6d1xxSrNHpf1N9TpJiLZ2dPL
	xtPNv658GvDMF2Q+HmanrOeJORYS8pk4zC5b0UIMZtmy4zpWpZxzRselDgx1UvhE
	K+KLvmzS60SvsvvFCm25xPpuNN7ROdhCbi0wg1stWeBtu7lh8EmzNWAFKl2GpGxw
	sWp1Dv81lArxEQaeFGHeyxOx51F18WR/DLrQQBCXUdEL6W0pFtNUQnFjrY5w/4Lp
	UKm0+VJT5uKPN/oYepBp0SUxc/G8R9nTkLJi7i4a/swk50yPKvGZ0f4fW6IJA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4akdjjbwax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 25 Nov 2025 23:29:21 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 25 Nov 2025 23:29:21 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 25 Nov 2025 23:29:20 -0800
From: <kai.kang@windriver.com>
To: <bruce.ashfield@gmail.com>
CC: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] libvirt: set firewall backend priority
Date: Wed, 26 Nov 2025 15:29:14 +0800
Message-ID: <20251126072914.2711374-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA2MCBTYWx0ZWRfX4AeS/dytH4y8
 8qD5xTmlzD0a8GuDN1UWttU28vt5YbbxxONouOQSRMl9qfCcz3KlO23JJliG+enh7/xGPKs8Rrt
 sxpXlP7ZIDZcWqx3mEa2cFLxqqs37NHEDUdrt+D2AI3C1XlLEnzUepa8fnCHkwtdWBzAq4sWOHZ
 6n8Q4qmvxSp7qSwgvjmN8L1fgrwbej/4OIfp7JxqgkmU9khlDm2Pc5YndTLWos3erZpVaf2JBM5
 OSZ11owS8VeaFDt0yTDwJJbcuswKsGXogmkhRz4gUew+P7sfltUGcIBBSaNUI3YJuigh9heAAzn
 dXb2agMXZljQZoVVcxcv1LAszm/IQkwEpfIlHPDjENboVur5qY0cjU5ox6E5fy2Tn55iAqDsMiP
 l2kZwrOPsxWZeuF2jLAaIAnGlM0d7A==
X-Proofpoint-ORIG-GUID: DC-1MEXxPZbYk9RCPWEpLTO-rDBA6UXd
X-Authority-Analysis: v=2.4 cv=Wq8m8Nfv c=1 sm=1 tr=0 ts=6926ac51 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=swbG1lXfoDnfDkGqTj4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: DC-1MEXxPZbYk9RCPWEpLTO-rDBA6UXd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260060
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 26 Nov 2025 07:29:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9458

From: Kai Kang <kai.kang@windriver.com>

If firewall_backend isn't configured in the config file, libvirt will
choose the first available backend from the following list by default:

    [nftables, iptables]

so when nftables is installed in image, firewall backend nftables rather
than iptables is adopted.

Add a PACKAGECONFIG to set the firewall backend priority. And update
runtime dependencies for backend nftables.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 recipes-extended/libvirt/libvirt_git.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
index 681ceade..e9359e1e 100644
--- a/recipes-extended/libvirt/libvirt_git.bb
+++ b/recipes-extended/libvirt/libvirt_git.bb
@@ -15,7 +15,9 @@ DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux
 #
 RDEPENDS:${PN} = "gettext-runtime"
 
-RDEPENDS:libvirt-libvirtd += "bridge-utils iptables pm-utils dnsmasq netcat-openbsd ebtables"
+RDEPENDS:libvirt-libvirtd += "bridge-utils pm-utils dnsmasq netcat-openbsd ebtables \
+                              ${@bb.utils.contains('PACKAGECONFIG', 'nftables', 'nftables iproute2-tc', 'iptables', d)} \
+                              "
 RDEPENDS:libvirt-libvirtd:append:x86-64 = " dmidecode"
 RDEPENDS:libvirt-libvirtd:append:x86 = " dmidecode"
 RDEPENDS:libvirt-libvirtd:append:arm = " dmidecode"
@@ -175,6 +177,7 @@ PACKAGECONFIG[apparmor_profiles] = "-Dapparmor_profiles=enabled, -Dapparmor_prof
 PACKAGECONFIG[firewalld] = "-Dfirewalld=enabled, -Dfirewalld=disabled,"
 PACKAGECONFIG[libpcap] = "-Dlibpcap=enabled, -Dlibpcap=disabled,libpcap,libpcap"
 PACKAGECONFIG[numad] = "-Dnumad=enabled, -Dnumad=disabled,"
+PACKAGECONFIG[nftables] = ""
 
 # Enable the Python tool support
 require libvirt-python.inc
@@ -313,6 +316,7 @@ do_install:append() {
 
 EXTRA_OEMESON += " \
     -Dinit_script=${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','none', d)} \
+    -Dfirewall_backend_priority=${@bb.utils.contains('PACKAGECONFIG','nftables','nftables,iptables','iptables,nftables', d)} \
     -Drunstatedir=/run \
     -Dtests=enabled \
     "
-- 
2.34.1


