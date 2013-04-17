Return-Path: <B28495@freescale.com>
Received: from co9outboundpool.messaging.microsoft.com
	(co9ehsobe001.messaging.microsoft.com [207.46.163.24])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D4D5E014DF
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 Apr 2013 00:43:40 -0700 (PDT)
Received: from mail96-co9-R.bigfish.com (10.236.132.242) by
	CO9EHSOBE009.bigfish.com (10.236.130.72) with Microsoft SMTP Server id
	14.1.225.23; Wed, 17 Apr 2013 07:43:39 +0000
Received: from mail96-co9 (localhost [127.0.0.1])	by mail96-co9-R.bigfish.com
	(Postfix) with ESMTP id 071C0D0008D	for
	<meta-virtualization@yoctoproject.org>;
	Wed, 17 Apr 2013 07:43:39 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzz17326ah1954cbh8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail96-co9 (localhost.localdomain [127.0.0.1]) by mail96-co9
	(MessageSwitch) id 1366184616157696_26006;
	Wed, 17 Apr 2013 07:43:36 +0000 (UTC)
Received: from CO9EHSMHS002.bigfish.com (unknown [10.236.132.244])	by
	mail96-co9.bigfish.com (Postfix) with ESMTP id 24D941C005A	for
	<meta-virtualization@yoctoproject.org>;
	Wed, 17 Apr 2013 07:43:36 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS002.bigfish.com
	(10.236.130.12) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 17 Apr 2013 07:43:36 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Wed, 17 Apr 2013 07:43:35 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r3H7hWnP026035;	Wed, 17 Apr 2013 00:43:33 -0700
From: <b28495@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 17 Apr 2013 15:43:31 +0800
Message-ID: <1366184611-14137-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: b19537@freescale.com
Subject: [PATCH] libvirt: add udev pkgconfig option
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
X-List-Received-Date: Wed, 17 Apr 2013 07:43:40 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

libvirt depends on libpciaccess when udev was enabled.

The configure log:
| checking for UDEV... yes
| configure: error: You must install the pciaccess module to build with udev
| Configure failed. The contents of all config.log files follows to aid debugging

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 recipes-extended/libvirt/libvirt_1.0.3.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_1.0.3.bb b/recipes-extended/libvirt/libvirt_1.0.3.bb
index c1c000e..f8bf79a 100644
--- a/recipes-extended/libvirt/libvirt_1.0.3.bb
+++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://libvirt.org"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb919cc88dbe06ec0b0bd50e001ccf1f"
 SECTION = "console/tools"
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
 	   iptables ebtables dnsmasq readline"
@@ -129,6 +129,7 @@ PACKAGECONFIG[macvtap] = "--with-macvtap=yes,--with-macvtap=no,libnl,libnl"
 PACKAGECONFIG[libvirtd] = "--with-libvirtd,--without-libvirtd"
 PACKAGECONFIG[netcf] = "--with-netcf,--without-netcf,netcf,netcf"
 PACKAGECONFIG[dtrace] = "--with-dtrace,--without-dtrace,,"
+PACKAGECONFIG[udev] = "--with-udev,--without-udev,libpciaccess,"
 
 # Enable the Python tool support
 require libvirt-python.inc
-- 
1.7.5.4



