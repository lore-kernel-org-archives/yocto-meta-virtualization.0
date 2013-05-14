Return-Path: <r63875@freescale.com>
Received: from ch1outboundpool.messaging.microsoft.com
	(ch1ehsobe006.messaging.microsoft.com [216.32.181.186])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 384F4E014F5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 May 2013 03:30:25 -0700 (PDT)
Received: from mail137-ch1-R.bigfish.com (10.43.68.250) by
	CH1EHSOBE014.bigfish.com (10.43.70.64) with Microsoft SMTP Server id
	14.1.225.23; Tue, 14 May 2013 10:30:23 +0000
Received: from mail137-ch1 (localhost [127.0.0.1])	by
	mail137-ch1-R.bigfish.com (Postfix) with ESMTP id 91EB2400C98	for
	<meta-virtualization@yoctoproject.org>;
	Tue, 14 May 2013 10:30:23 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzz17326ah1954cbh8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h1354h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1155h)
Received: from mail137-ch1 (localhost.localdomain [127.0.0.1]) by mail137-ch1
	(MessageSwitch) id 1368527421198167_23187;
	Tue, 14 May 2013 10:30:21 +0000 (UTC)
Received: from CH1EHSMHS002.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.237])	by mail137-ch1.bigfish.com (Postfix) with ESMTP id
	2CD9A4A004B	for <meta-virtualization@yoctoproject.org>; Tue, 14 May 2013
	10:30:21 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS002.bigfish.com
	(10.43.70.2) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 14 May 2013 10:30:21 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Tue, 14 May 2013 10:30:42 +0000
Received: from localhost.localdomain (tank.ap.freescale.net [10.193.20.104])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	r4EAUHem025804; Tue, 14 May 2013 03:30:19 -0700
From: Olivia Yin <hong-hua.yin@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 14 May 2013 17:48:31 +0800
Message-ID: <1368524911-9993-1-git-send-email-hong-hua.yin@freescale.com>
X-Mailer: git-send-email 1.5.6.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Olivia Yin <hong-hua.yin@freescale.com>
Subject: [PATCH] libvirt: fix warning of sysctl.d/libvirtd.conf
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
X-List-Received-Date: Tue, 14 May 2013 10:30:25 -0000
Content-Type: text/plain

WARNING: QA Issue: libvirt: Files/directories were installed but not shipped
  /usr/lib
  /usr/lib/sysctl.d
  /usr/lib/sysctl.d/libvirtd.conf

$(DESTDIR)$(prefix)/lib is hardcoded in libvirt Makefile due to following
reason that is stated in the daemon/Makefile.in of libvirt.
    # Use $(prefix)/lib rather than $(libdir), since man sysctl.d insists on
    # /usr/lib/sysctl.d/ even when libdir is /usr/lib64
    @WITH_LIBVIRTD_TRUE@@WITH_SYSCTL_TRUE@install-sysctl:
    @WITH_LIBVIRTD_TRUE@@WITH_SYSCTL_TRUE@  $(MKDIR_P) $(DESTDIR)$(prefix)/lib/sysctl.d
    @WI TH_LIBVIRTD_TRUE@@WITH_SYSCTL_TRUE@  $(INSTALL_DATA) $(srcdir)/libvirtd.sysctl \
    @WITH_LIBVIRTD_TRUE@@WITH_SYSCTL_TRUE@    $(DESTDIR)$(prefix)/lib/sysctl.d/libvirtd.conf

Signed-off-by: Olivia Yin <hong-hua.yin@freescale.com>
---
 recipes-extended/libvirt/libvirt_1.0.3.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_1.0.3.bb b/recipes-extended/libvirt/libvirt_1.0.3.bb
index 88cb018..f0683c8 100644
--- a/recipes-extended/libvirt/libvirt_1.0.3.bb
+++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://libvirt.org"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb919cc88dbe06ec0b0bd50e001ccf1f"
 SECTION = "console/tools"
-PR = "r2"
+PR = "r333"
 
 DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
 	   iptables ebtables dnsmasq readline"
@@ -87,6 +87,7 @@ FILES_${PN}-libvirtd = "${sysconfdir}/init.d \
 	${sysconfdir}/sysctl.d \
 	${sysconfdir}/logrotate.d \
 	${sysconfdir}/libvirt/libvirtd.conf \
+        /usr/lib/sysctl.d/libvirtd.conf \
 	${sbindir}/libvirtd"
 
 FILES_${PN}-virsh = "${bindir}/virsh"
-- 
1.7.0.4



