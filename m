Return-Path: <b43198@az84smr01.freescale.net>
Received: from db8outboundpool.messaging.microsoft.com
	(mail-db8lp0187.outbound.messaging.microsoft.com [213.199.154.187])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73159E014B5
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Apr 2013 04:19:23 -0700 (PDT)
Received: from mail118-db8-R.bigfish.com (10.174.8.236) by
	DB8EHSOBE007.bigfish.com (10.174.4.70) with Microsoft SMTP Server id
	14.1.225.23; Wed, 10 Apr 2013 11:19:22 +0000
Received: from mail118-db8 (localhost [127.0.0.1])	by
	mail118-db8-R.bigfish.com (Postfix) with ESMTP id 2CA6C4018D	for
	<meta-virtualization@yoctoproject.org>;
	Wed, 10 Apr 2013 11:19:22 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzz17326ah8275bh8275chz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12a9h12bdh12e5h1354h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail118-db8 (localhost.localdomain [127.0.0.1]) by mail118-db8
	(MessageSwitch) id 1365592759984118_32673;
	Wed, 10 Apr 2013 11:19:19 +0000 (UTC)
Received: from DB8EHSMHS024.bigfish.com (unknown [10.174.8.246])	by
	mail118-db8.bigfish.com (Postfix) with ESMTP id EB0273E004E	for
	<meta-virtualization@yoctoproject.org>;
	Wed, 10 Apr 2013 11:19:19 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB8EHSMHS024.bigfish.com
	(10.174.4.34) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 10 Apr 2013 11:19:19 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Wed, 10 Apr 2013 11:19:18 +0000
Received: from localhost.localdomain (fsr-fed1764-008.ea.freescale.net
	[10.171.73.92])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id r3ABJGsg002650;	Wed, 10 Apr 2013 04:19:17 -0700
Received: (from b43198@localhost)	by localhost.localdomain
	(8.14.5/8.14.5/Submit) id r3ABJA4q024524;
	Wed, 10 Apr 2013 14:19:10 +0300
From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 10 Apr 2013 14:19:02 +0300
Message-ID: <1365592743-24488-1-git-send-email-bogdan.purcareata@freescale.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1365586806-8155-1-git-send-email-bogdan.purcareata@freescale.com>
References: <1365586806-8155-1-git-send-email-bogdan.purcareata@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.net
Subject: [PATCH] Add disable udhcp patch to LXC recipe
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
X-List-Received-Date: Wed, 10 Apr 2013 11:19:24 -0000
Content-Type: text/plain

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



