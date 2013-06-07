Return-Path: <B28495@freescale.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe001.messaging.microsoft.com [216.32.180.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DF822E01568
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Jun 2013 19:45:17 -0700 (PDT)
Received: from mail76-va3-R.bigfish.com (10.7.14.242) by
	VA3EHSOBE009.bigfish.com (10.7.40.29) with Microsoft SMTP Server id
	14.1.225.23; Fri, 7 Jun 2013 02:45:15 +0000
Received: from mail76-va3 (localhost [127.0.0.1])	by mail76-va3-R.bigfish.com
	(Postfix) with ESMTP id AFC341C00EF	for
	<meta-virtualization@yoctoproject.org>;
	Fri,  7 Jun 2013 02:45:15 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzz17326ah1954cbh8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1155h)
Received: from mail76-va3 (localhost.localdomain [127.0.0.1]) by mail76-va3
	(MessageSwitch) id 1370573113916280_24478;
	Fri,  7 Jun 2013 02:45:13 +0000 (UTC)
Received: from VA3EHSMHS012.bigfish.com (unknown [10.7.14.250])	by
	mail76-va3.bigfish.com (Postfix) with ESMTP id DBE2546088A	for
	<meta-virtualization@yoctoproject.org>;
	Fri,  7 Jun 2013 02:45:13 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS012.bigfish.com
	(10.7.99.22) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 7 Jun 2013 02:45:13 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Fri, 7 Jun 2013 02:46:30 +0000
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	r572jBdm030724; Thu, 6 Jun 2013 19:45:12 -0700
From: <b28495@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 6 Jun 2013 21:45:11 -0500
Message-ID: <1370573111-13102-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: b19537@freescale.com
Subject: [PATCH] libvirt: use libexecdir instead of hard code path
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Jun 2013 02:45:18 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 recipes-extended/libvirt/libvirt_1.0.3.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_1.0.3.bb b/recipes-extended/libvirt/libvirt_1.0.3.bb
index b29c055..479ce7e 100644
--- a/recipes-extended/libvirt/libvirt_1.0.3.bb
+++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://libvirt.org"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb919cc88dbe06ec0b0bd50e001ccf1f"
 SECTION = "console/tools"
-PR = "r5"
+PR = "r6"
 
 DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
 	   iptables ebtables dnsmasq readline"
@@ -149,5 +149,5 @@ do_install_append() {
 
 	# This will wind up in the libvirtd package, but will NOT be invoked by default.
 	#
-	mv ${D}/usr/libexec/libvirt-guests.sh ${D}/${sysconfdir}/init.d
+	mv ${D}/${libexecdir}/libvirt-guests.sh ${D}/${sysconfdir}/init.d
 }
-- 
1.7.9.7



