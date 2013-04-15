Return-Path: <r63875@freescale.com>
Received: from co9outboundpool.messaging.microsoft.com
	(co9ehsobe002.messaging.microsoft.com [207.46.163.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 584CDE0140A
	for <meta-virtualization@yoctoproject.org>;
	Sun, 14 Apr 2013 20:55:01 -0700 (PDT)
Received: from mail196-co9-R.bigfish.com (10.236.132.247) by
	CO9EHSOBE035.bigfish.com (10.236.130.98) with Microsoft SMTP Server id
	14.1.225.23; Mon, 15 Apr 2013 03:55:00 +0000
Received: from mail196-co9 (localhost [127.0.0.1])	by
	mail196-co9-R.bigfish.com (Postfix) with ESMTP id 1A4527C051B	for
	<meta-virtualization@yoctoproject.org>;
	Mon, 15 Apr 2013 03:55:00 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzzz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h1354h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail196-co9 (localhost.localdomain [127.0.0.1]) by mail196-co9
	(MessageSwitch) id 1365998097275157_4316;
	Mon, 15 Apr 2013 03:54:57 +0000 (UTC)
Received: from CO9EHSMHS010.bigfish.com (unknown [10.236.132.239])	by
	mail196-co9.bigfish.com (Postfix) with ESMTP id 4100D90004A	for
	<meta-virtualization@yoctoproject.org>;
	Mon, 15 Apr 2013 03:54:57 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS010.bigfish.com
	(10.236.130.20) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 15 Apr 2013 03:54:57 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Mon, 15 Apr 2013 03:54:56 +0000
Received: from localhost.localdomain (tank.ap.freescale.net [10.193.20.104])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	r3F3srCq016457; Sun, 14 Apr 2013 20:54:54 -0700
From: Olivia Yin <hong-hua.yin@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 15 Apr 2013 11:18:44 +0800
Message-ID: <1365995924-17342-1-git-send-email-hong-hua.yin@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Olivia Yin <hong-hua.yin@freescale.com>
Subject: [PATCH] update libvirt DEPENDS and FILES
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
X-List-Received-Date: Mon, 15 Apr 2013 03:55:01 -0000
Content-Type: text/plain

---
 recipes-extended/libvirt/libvirt_1.0.3.bb |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_1.0.3.bb b/recipes-extended/libvirt/libvirt_1.0.3.bb
index c1c000e..3ce9743 100644
--- a/recipes-extended/libvirt/libvirt_1.0.3.bb
+++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
@@ -6,7 +6,7 @@ SECTION = "console/tools"
 PR = "r1"
 
 DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
-	   iptables ebtables dnsmasq readline"
+	   iptables ebtables dnsmasq readline libpciaccess augeas"
 
 # These might be included by PACKAGECONFIG
 #RRECOMMENDS+= "polkit qemu yajl libnl lxc netcf"
@@ -94,8 +94,10 @@ FILES_${PN} += "${libdir}/libvirt/connection-driver \
 	    ${datadir}/augeas \
 	    ${datadir}/polkit-1"
 
-FILES_${PN}-dbg += "${libdir}/libvirt/connection-driver/.debug ${libdir}/libvirt/lock-driver/.debug"
-FILES_${PN}-staticdev += "${libdir}/*.a ${libdir}/libvirt/connection-driver/*.a ${libdir}/libvirt/lock-driver/*.a"
+FILES_${PN}-dbg += "${libdir}/libvirt/connection-driver/.debug \
+                    ${libdir}/libvirt/lock-driver/.debug"
+FILES_${PN}-staticdev += "${libdir}/*.a ${libdir}/libvirt/connection-driver/*.a \
+                           ${libdir}/libvirt/lock-driver/*.a"
 
 INITSCRIPT_PACKAGES = "${PN}-libvirtd"
 INITSCRIPT_NAME_${PN}-libvirtd = "libvirtd"
-- 
1.5.6.5



