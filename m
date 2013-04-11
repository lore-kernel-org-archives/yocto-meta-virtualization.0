Return-Path: <b43198@az84smr01.freescale.net>
Received: from co1outboundpool.messaging.microsoft.com
	(co1ehsobe004.messaging.microsoft.com [216.32.180.187])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 35EECE014B9
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Apr 2013 02:19:59 -0700 (PDT)
Received: from mail98-co1-R.bigfish.com (10.243.78.249) by
	CO1EHSOBE022.bigfish.com (10.243.66.85) with Microsoft SMTP Server id
	14.1.225.23; Thu, 11 Apr 2013 09:19:58 +0000
Received: from mail98-co1 (localhost [127.0.0.1])	by mail98-co1-R.bigfish.com
	(Postfix) with ESMTP id 80526500077	for
	<meta-virtualization@yoctoproject.org>;
	Thu, 11 Apr 2013 09:19:58 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzz17326ah8275bh8275chz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12a9h12bdh12e5h1354h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail98-co1 (localhost.localdomain [127.0.0.1]) by mail98-co1
	(MessageSwitch) id 1365671996829011_12406;
	Thu, 11 Apr 2013 09:19:56 +0000 (UTC)
Received: from CO1EHSMHS005.bigfish.com (unknown [10.243.78.245])	by
	mail98-co1.bigfish.com (Postfix) with ESMTP id BE6A9C00059	for
	<meta-virtualization@yoctoproject.org>;
	Thu, 11 Apr 2013 09:19:56 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS005.bigfish.com
	(10.243.66.15) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 11 Apr 2013 09:19:56 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Thu, 11 Apr 2013 09:19:55 +0000
Received: from localhost.localdomain (fsr-fed1764-008.ea.freescale.net
	[10.171.73.92])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id r3B9JsMk030033;	Thu, 11 Apr 2013 02:19:54 -0700
Received: (from b43198@localhost)	by localhost.localdomain
	(8.14.5/8.14.5/Submit) id r3B9JrSD010958;
	Thu, 11 Apr 2013 12:19:53 +0300
From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 11 Apr 2013 12:19:51 +0300
Message-ID: <1365671992-10838-1-git-send-email-bogdan.purcareata@freescale.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.net
Subject: [PATCH v2] Add disable udhcp patch to LXC recipe
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
X-List-Received-Date: Thu, 11 Apr 2013 09:19:59 -0000
Content-Type: text/plain

The provided patch makes a modification to the LXC busybox template (the
template that creates a minimal container with Busybox).

This type of container will start the udhcpc service - the DHCP client - on
init. For an embedded Linux image, we might assume that the majority of
containers will have manual / static networking configuration on start.
Considering this, starting the udhcpc service by default is useless, since
the service will then has to be killed. The containers that use DHCP for
networking can start udhcpc after container boot, or alter the busybox
template locally to do so by default.

The patch deactivates the default start of the DHCP client on a Busybox
container init.

Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
---
 ...0.9.0-disable-udhcp-from-busybox-template.patch | 24 ++++++++++++++++++++++
 recipes-containers/lxc/lxc_0.9.0.bb                |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 recipes-containers/lxc/files/lxc-0.9.0-disable-udhcp-from-busybox-template.patch

diff --git a/recipes-containers/lxc/files/lxc-0.9.0-disable-udhcp-from-busybox-template.patch b/recipes-containers/lxc/files/lxc-0.9.0-disable-udhcp-from-busybox-template.patch
new file mode 100644
index 0000000..723be27
--- /dev/null
+++ b/recipes-containers/lxc/files/lxc-0.9.0-disable-udhcp-from-busybox-template.patch
@@ -0,0 +1,24 @@
+From d7e07e7acb1cbad33806f49143a2a30b4468c369 Mon Sep 17 00:00:00 2001
+From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
+Date: Mon, 8 Apr 2013 18:30:19 +0300
+Subject: [PATCH] lxc-0.9.0-disable-udhcp-from-busybox-template
+
+---
+ templates/lxc-busybox.in | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
+index cb425ec..bb8c951 100644
+--- a/templates/lxc-busybox.in
++++ b/templates/lxc-busybox.in
+@@ -84,7 +84,6 @@ EOF
+ #!/bin/sh
+ /bin/syslogd
+ /bin/mount -a
+-/bin/udhcpc
+ EOF
+ 
+     # executable
+-- 
+1.7.11.7
+
diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/lxc/lxc_0.9.0.bb
index 292285d..1d6ce71 100644
--- a/recipes-containers/lxc/lxc_0.9.0.bb
+++ b/recipes-containers/lxc/lxc_0.9.0.bb
@@ -22,6 +22,7 @@ RDEPENDS_${PN} = " \
 "
 
 SRC_URI = "http://lxc.sourceforge.net/download/lxc/${PN}-${PV}.tar.gz \
+	file://lxc-0.9.0-disable-udhcp-from-busybox-template.patch \
 	"
 SRC_URI[md5sum] = "8552a4479090616f4bc04d8473765fc9"
 SRC_URI[sha256sum] = "1e1767eae6cc5fbf892c0e193d25da420ba19f2db203716c38f7cdea3b654120"
-- 
1.7.11.7



