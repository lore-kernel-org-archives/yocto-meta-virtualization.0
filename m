Return-Path: <B28495@freescale.com>
Received: from db8outboundpool.messaging.microsoft.com
	(mail-db8lp0184.outbound.messaging.microsoft.com [213.199.154.184])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 178EBE014A6
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Mar 2013 08:25:28 -0700 (PDT)
Received: from mail169-db8-R.bigfish.com (10.174.8.240) by
	DB8EHSOBE031.bigfish.com (10.174.4.94) with Microsoft SMTP Server id
	14.1.225.23; Wed, 27 Mar 2013 15:25:26 +0000
Received: from mail169-db8 (localhost [127.0.0.1])	by
	mail169-db8-R.bigfish.com (Postfix) with ESMTP id D50B9200055	for
	<meta-virtualization@yoctoproject.org>;
	Wed, 27 Mar 2013 15:25:26 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1fc6h1ee6h1de0h1202h1e76h1d1ah1d2ahzz17326ah1954cbh8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail169-db8 (localhost.localdomain [127.0.0.1]) by mail169-db8
	(MessageSwitch) id 1364397924967074_31292;
	Wed, 27 Mar 2013 15:25:24 +0000 (UTC)
Received: from DB8EHSMHS031.bigfish.com (unknown [10.174.8.244])	by
	mail169-db8.bigfish.com (Postfix) with ESMTP id EA72DD80047	for
	<meta-virtualization@yoctoproject.org>;
	Wed, 27 Mar 2013 15:25:24 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB8EHSMHS031.bigfish.com
	(10.174.4.41) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 27 Mar 2013 15:25:22 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Wed, 27 Mar 2013 15:25:20 +0000
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id
	r2RFPJpF001837; Wed, 27 Mar 2013 08:25:20 -0700
From: <b28495@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 27 Mar 2013 10:25:13 -0500
Message-ID: <1364397914-17992-2-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1364397914-17992-1-git-send-email-b28495@freescale.com>
References: <1364397914-17992-1-git-send-email-b28495@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-Mailman-Approved-At: Sat, 06 Apr 2013 13:19:54 -0700
Cc: b19537@freescale.com
Subject: [PATCH 1/2] libvirt: add dependency on libpciaccess
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
X-List-Received-Date: Wed, 27 Mar 2013 15:25:28 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

The configure log:
| checking for UDEV... yes
| configure: error: You must install the pciaccess module to build with udev
| Configure failed. The contents of all config.log files follows to aid debugging

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 recipes-extended/libvirt/libvirt_1.0.3.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_1.0.3.bb b/recipes-extended/libvirt/libvirt_1.0.3.bb
index 372e874..ae2a9df 100644
--- a/recipes-extended/libvirt/libvirt_1.0.3.bb
+++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
@@ -3,10 +3,10 @@ HOMEPAGE = "http://libvirt.org"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb919cc88dbe06ec0b0bd50e001ccf1f"
 SECTION = "console/tools"
-PR = "r0"
+PR = "r1"
 
 DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
-	   iptables ebtables dnsmasq readline"
+	   iptables ebtables dnsmasq readline libpciaccess"
 
 # These might be included by PACKAGECONFIG
 #RRECOMMENDS+= "polkit qemu yajl libnl lxc netcf"
-- 
1.7.9.7



