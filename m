Return-Path: <b43198@az84smr01.freescale.net>
Received: from db3outboundpool.messaging.microsoft.com
	(db3ehsobe003.messaging.microsoft.com [213.199.154.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B7475E01474
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Apr 2013 02:50:25 -0700 (PDT)
Received: from mail56-db3-R.bigfish.com (10.3.81.248) by
	DB3EHSOBE003.bigfish.com (10.3.84.23) with Microsoft SMTP Server id
	14.1.225.23; Wed, 10 Apr 2013 09:50:24 +0000
Received: from mail56-db3 (localhost [127.0.0.1])	by mail56-db3-R.bigfish.com
	(Postfix) with ESMTP id A1212180197	for
	<meta-virtualization@yoctoproject.org>;
	Wed, 10 Apr 2013 09:50:24 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzz17326ah8275chz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12a9h12bdh12e5h1354h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail56-db3 (localhost.localdomain [127.0.0.1]) by mail56-db3
	(MessageSwitch) id 13655874224199_31302; Wed, 10 Apr 2013 09:50:22 +0000
	(UTC)
Received: from DB3EHSMHS006.bigfish.com (unknown [10.3.81.225])	by
	mail56-db3.bigfish.com (Postfix) with ESMTP id F1D3AA0080	for
	<meta-virtualization@yoctoproject.org>;
	Wed, 10 Apr 2013 09:50:21 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS006.bigfish.com
	(10.3.87.106) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 10 Apr 2013 09:50:13 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Wed, 10 Apr 2013 09:50:11 +0000
Received: from localhost.localdomain (fsr-fed1764-008.ea.freescale.net
	[10.171.73.92])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id r3A9o5cN005968;	Wed, 10 Apr 2013 02:50:05 -0700
Received: (from b43198@localhost)	by localhost.localdomain
	(8.14.5/8.14.5/Submit) id r3A9o468008319;
	Wed, 10 Apr 2013 12:50:04 +0300
From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 10 Apr 2013 12:50:00 +0300
Message-ID: <1365587401-8284-1-git-send-email-bogdan.purcareata@freescale.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.net
Subject: [PATCH] Add LXC 0.9.0 recipe
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
X-List-Received-Date: Wed, 10 Apr 2013 09:50:26 -0000
Content-Type: text/plain

---
 recipes-containers/lxc/lxc_0.9.0.bb | 38 +++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 recipes-containers/lxc/lxc_0.9.0.bb

diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/lxc/lxc_0.9.0.bb
new file mode 100644
index 0000000..292285d
--- /dev/null
+++ b/recipes-containers/lxc/lxc_0.9.0.bb
@@ -0,0 +1,38 @@
+DESCRIPTION = "lxc aims to use these new functionnalities to provide an userspace container object"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+PRIORITY = "optional"
+PR = "r1"
+DEPENDS = "libxml2 libcap"
+RDEPENDS_${PN} = " \
+		rsync \
+		gzip \
+		libcap-bin \
+		bridge-utils \
+		dnsmasq \
+		perl-module-strict \
+		perl-module-getopt-long \
+		perl-module-vars \
+		perl-module-warnings-register \
+		perl-module-exporter \
+		perl-module-constant \
+		perl-module-overload \
+		perl-module-exporter-heavy \
+"
+
+SRC_URI = "http://lxc.sourceforge.net/download/lxc/${PN}-${PV}.tar.gz \
+	"
+SRC_URI[md5sum] = "8552a4479090616f4bc04d8473765fc9"
+SRC_URI[sha256sum] = "1e1767eae6cc5fbf892c0e193d25da420ba19f2db203716c38f7cdea3b654120"
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[doc] = "--enable-doc,--disable-doc"
+PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath"
+PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
+
+inherit autotools
+
+FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
-- 
1.7.11.7



