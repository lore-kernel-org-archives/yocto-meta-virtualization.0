Return-Path: <B28495@freescale.com>
Received: from tx2outboundpool.messaging.microsoft.com
	(tx2ehsobe003.messaging.microsoft.com [65.55.88.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 039C6E0146E
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Mar 2013 08:25:25 -0700 (PDT)
Received: from mail165-tx2-R.bigfish.com (10.9.14.240) by
	TX2EHSOBE004.bigfish.com (10.9.40.24) with Microsoft SMTP Server id
	14.1.225.23; Wed, 27 Mar 2013 15:25:24 +0000
Received: from mail165-tx2 (localhost [127.0.0.1])	by
	mail165-tx2-R.bigfish.com (Postfix) with ESMTP id 064502200C3	for
	<meta-virtualization@yoctoproject.org>;
	Wed, 27 Mar 2013 15:25:24 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 4
X-BigFish: VS4(z37d4lzzz1f42h1fc6h1ee6h1de0h1202h1e76h1d1ah1d2ahzz17326ah1954cbh8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail165-tx2 (localhost.localdomain [127.0.0.1]) by mail165-tx2
	(MessageSwitch) id 1364397921747954_14879;
	Wed, 27 Mar 2013 15:25:21 +0000 (UTC)
Received: from TX2EHSMHS019.bigfish.com (unknown [10.9.14.232])	by
	mail165-tx2.bigfish.com (Postfix) with ESMTP id AE74440177	for
	<meta-virtualization@yoctoproject.org>;
	Wed, 27 Mar 2013 15:25:21 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS019.bigfish.com
	(10.9.99.119) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 27 Mar 2013 15:25:21 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Wed, 27 Mar 2013 15:25:20 +0000
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id
	r2RFPJpG001837; Wed, 27 Mar 2013 08:25:20 -0700
From: <b28495@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 27 Mar 2013 10:25:14 -0500
Message-ID: <1364397914-17992-3-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1364397914-17992-1-git-send-email-b28495@freescale.com>
References: <1364397914-17992-1-git-send-email-b28495@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-Mailman-Approved-At: Sat, 06 Apr 2013 13:19:54 -0700
Cc: b19537@freescale.com
Subject: [PATCH 2/2] libvirt: package .debug and .a files in lock-driver
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
X-List-Received-Date: Wed, 27 Mar 2013 15:25:25 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Fix ERROR: QA Issue: non -staticdev package contains static .a
library: libvirt path '.../packages-split/libvirt/usr/lib/libvirt/lock-driver/lockd.a'
ERROR: QA Issue: non debug package contains .debug directory:
libvirt path .../packages-split/libvirt/usr/lib/libvirt/lock-driver/.debug/lockd.so
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 recipes-extended/libvirt/libvirt_1.0.3.bb |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_1.0.3.bb b/recipes-extended/libvirt/libvirt_1.0.3.bb
index ae2a9df..e3cc22f 100644
--- a/recipes-extended/libvirt/libvirt_1.0.3.bb
+++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://libvirt.org"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb919cc88dbe06ec0b0bd50e001ccf1f"
 SECTION = "console/tools"
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
 	   iptables ebtables dnsmasq readline libpciaccess"
@@ -94,8 +94,8 @@ FILES_${PN} += "${libdir}/libvirt/connection-driver \
 	    ${datadir}/augeas \
 	    ${datadir}/polkit-1"
 
-FILES_${PN}-dbg += "${libdir}/libvirt/connection-driver/.debug"
-FILES_${PN}-staticdev += "${libdir}/*.a ${libdir}/libvirt/connection-driver/*.a"
+FILES_${PN}-dbg += "${libdir}/libvirt/connection-driver/.debug ${libdir}/libvirt/lock-driver/.debug"
+FILES_${PN}-staticdev += "${libdir}/*.a ${libdir}/libvirt/connection-driver/*.a ${libdir}/libvirt/lock-driver/*.a"
 
 INITSCRIPT_PACKAGES = "${PN}-libvirtd"
 INITSCRIPT_NAME_${PN}-libvirtd = "libvirtd"
-- 
1.7.9.7



