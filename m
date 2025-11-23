Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FEADCFC518
	for <webhook@archiver.kernel.org>; Sun, 23 Nov 2025 16:44:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18030.1763916294071283869
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 23 Nov 2025 08:44:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OPCnKkPU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34223f3322=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ANGQu6U1808244
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 23 Nov 2025 16:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=r6ae4YFQ/gVtirN9dZwT
	sR4WkG+kRYmLfQNPXxNT5DI=; b=OPCnKkPUoJKXagDII1blhKlgZRvjCfqz6psx
	/87jx7eHIyKNraBm0nHIBX/pdlHbYybXU1eHN9okNbbjsgYnyav4/meXfmrIZjnR
	UqezAUvCAECqVmRJxQHQvCUiyTh9DyDA4nNzO5nFmUdJjuMFj+Pfrvl4ftqzYvJs
	s4zR1cVhbfl/dQnm9vFSxyigQZEflGm/b3M8N191i0hJBxaAiE9WObueXaT9BGrk
	N98Y/rxoFaVtEB1UU2W4bhg0BS25l5xJaaYIRln7JQXYHzpQVpyrDgrn9CbDskhA
	DcxYSny2GlrMKoMIIhjfZPA/AKdZvj9BUlWipY8OY27cJpbEwQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ak2d0s7w1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 23 Nov 2025 16:44:51 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 23 Nov 2025 08:44:50 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 23 Nov 2025 08:44:49 -0800
From: <kai.kang@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] libvirt: rdepends on iproute2-tc
Date: Mon, 24 Nov 2025 00:44:44 +0800
Message-ID: <20251123164444.3343229-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIzMDE1MSBTYWx0ZWRfX8cDBMXTrAcvw
 anus7FK0Iui7N49VoalWKUjowpsZ6M4F2xzSsqsUfbw4SDaHEnFiAc1yfARmfGcJSd94CnAbwUE
 PHSmH6+pdvUXw9MFBqyH6eoWjs5HNwaXN8PuZB8h16qIOsPSUYc0hMGFrSK0qA0GsETxTL6NBvj
 5yMmjX50hh/0D3EKF18Jcz8i0Q0x78ZEPFtQJCPWoXZV3Fiu9xOcH+os+Sd54b0E0xWl/qqJ6nw
 fI/C5225FWI5ElpLhLzlrWugCZ4m+5jTTZYM0/dkNdQlNeusdzmornZ19VB0cflfcQGpQr/mr0h
 +z7PEsrNSjZWiKCah6UYv2vEdL3vv6j5Ep6aFBVOagMxl7b1efRHggk6tUrIkwncv5/wfCIGkkg
 WsZgCqhGd0fz46H9LeEGqmsDvWzMrA==
X-Authority-Analysis: v=2.4 cv=JcCxbEKV c=1 sm=1 tr=0 ts=69233a03 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=SqMvC5kiAAAA:8 a=t7CeM3EgAAAA:8
 a=swbG1lXfoDnfDkGqTj4A:9 a=_o8VnCo6Hb5Oqlm6Mk7M:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: xuMzz_Z9c11-PLiFNk5Lmz01hHw-fdJC
X-Proofpoint-ORIG-GUID: xuMzz_Z9c11-PLiFNk5Lmz01hHw-fdJC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-23_06,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 phishscore=0 clxscore=1011 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511230151
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 23 Nov 2025 16:44:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9454

From: Kai Kang <kai.kang@windriver.com>

When nftables exists, libvirt uses it as default firewall backend. Then
it requires command `tc` to start default network interface:

libvirtd[653]: Cannot find 'tc' in path: No such file or directory

And tweak formats at same time, including replace tab with spaces for
indent and remove trailing whitespaces.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 recipes-extended/libvirt/libvirt_git.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
index 681ceade..552c5ffe 100644
--- a/recipes-extended/libvirt/libvirt_git.bb
+++ b/recipes-extended/libvirt/libvirt_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A toolkit to interact with the virtualization capabilities of recent versions of Linux." 
+DESCRIPTION = "A toolkit to interact with the virtualization capabilities of recent versions of Linux."
 HOMEPAGE = "http://libvirt.org"
 LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
@@ -6,16 +6,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SECTION = "console/tools"
 
 DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
-	   iptables dnsmasq readline libtasn1 libxslt-native acl libdevmapper libtirpc \
+           iptables dnsmasq readline libtasn1 libxslt-native acl libdevmapper libtirpc \
            python3-docutils-native \
-	   ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'shadow-native', '', d)} \
-	   ${@bb.utils.contains('PACKAGECONFIG', 'gnutls', 'gnutls-native', '', d)}"
+           ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'shadow-native', '', d)} \
+           ${@bb.utils.contains('PACKAGECONFIG', 'gnutls', 'gnutls-native', '', d)}"
 
 # libvirt-guests.sh needs gettext.sh
 #
 RDEPENDS:${PN} = "gettext-runtime"
 
-RDEPENDS:libvirt-libvirtd += "bridge-utils iptables pm-utils dnsmasq netcat-openbsd ebtables"
+RDEPENDS:libvirt-libvirtd += "bridge-utils iptables pm-utils dnsmasq netcat-openbsd ebtables iproute2-tc"
 RDEPENDS:libvirt-libvirtd:append:x86-64 = " dmidecode"
 RDEPENDS:libvirt-libvirtd:append:x86 = " dmidecode"
 RDEPENDS:libvirt-libvirtd:append:arm = " dmidecode"
@@ -232,7 +232,7 @@ do_install:append() {
 		   ${D}/${systemd_system_unitdir}/libvirtd.service
 	fi
 
-	# The /run/libvirt directories created by the Makefile are 
+	# The /run/libvirt directories created by the Makefile are
 	# wiped out in volatile, we need to create these at boot.
 	rm -rf ${D}/run
 	install -d ${D}${sysconfdir}/default/volatiles
-- 
2.34.1


