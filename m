Return-Path: <Hong-Hua.Yin@freescale.com>
Received: from tx2outboundpool.messaging.microsoft.com
	(tx2ehsobe004.messaging.microsoft.com [65.55.88.14])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 50673E009F7
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Mar 2014 17:39:57 -0700 (PDT)
Received: from mail148-tx2-R.bigfish.com (10.9.14.234) by
	TX2EHSOBE002.bigfish.com (10.9.40.22) with Microsoft SMTP Server id
	14.1.225.22; Thu, 13 Mar 2014 00:39:55 +0000
Received: from mail148-tx2 (localhost [127.0.0.1])	by
	mail148-tx2-R.bigfish.com (Postfix) with ESMTP id B2C371202A2	for
	<meta-virtualization@yoctoproject.org>;
	Thu, 13 Mar 2014 00:39:55 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zze0eahzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6hzz1de098h177df4h17326ah8275bh8275dh1de097h186068hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch25f6h2605h1155h)
Received: from mail148-tx2 (localhost.localdomain [127.0.0.1]) by mail148-tx2
	(MessageSwitch) id 1394671194690734_16496;
	Thu, 13 Mar 2014 00:39:54 +0000 (UTC)
Received: from TX2EHSMHS008.bigfish.com (unknown [10.9.14.225])	by
	mail148-tx2.bigfish.com (Postfix) with ESMTP id 979843A0081;
	Thu, 13 Mar 2014 00:39:54 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS008.bigfish.com
	(10.9.99.108) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Thu, 13 Mar 2014 00:39:54 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Thu, 13 Mar 2014 00:39:53 +0000
Received: from Tank.am.freescale.net (tank.ap.freescale.net [10.193.20.104])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s2D0doCv006200;
	Wed, 12 Mar 2014 17:39:51 -0700
From: Olivia Yin <hong-hua.yin@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 13 Mar 2014 07:56:11 +0800
Message-ID: <1394668571-8545-1-git-send-email-hong-hua.yin@freescale.com>
X-Mailer: git-send-email 1.8.4.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [PATCH] libvirt: uprev to v1.2.2
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
X-List-Received-Date: Thu, 13 Mar 2014 00:39:58 -0000
Content-Type: text/plain

Signed-off-by: Olivia Yin <hong-hua.yin@freescale.com>
---
 recipes-extended/libvirt/libvirt-python.inc                     | 4 ++--
 recipes-extended/libvirt/{libvirt_1.2.1.bb => libvirt_1.2.2.bb} | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename recipes-extended/libvirt/{libvirt_1.2.1.bb => libvirt_1.2.2.bb} (97%)

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index 2144a56..195a9de 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -18,8 +18,8 @@ FILES_${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
 SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
 SRC_URI += "file://libvirt_api_xml_path.patch;patchdir=../libvirt-python-${PV}"
 
-SRC_URI[libvirt_python.md5sum] = "e1effd6007b2ebd5d024c6c3838456fb"
-SRC_URI[libvirt_python.sha256sum] = "bce558606b157d0717ee7bd6537d85dd4c0321c59b4235c967db7a3aad80e246"
+SRC_URI[libvirt_python.md5sum] = "cd3b75c0eb64e933f0b648fbdca6e868"
+SRC_URI[libvirt_python.sha256sum] = "94d79d662b6010f6c688b8856b2d95077736d48ffa35feed5a339d7fafbf8c39"
 
 export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
 export LIBVIRT_CFLAGS = "-I${S}/include"
diff --git a/recipes-extended/libvirt/libvirt_1.2.1.bb b/recipes-extended/libvirt/libvirt_1.2.2.bb
similarity index 97%
rename from recipes-extended/libvirt/libvirt_1.2.1.bb
rename to recipes-extended/libvirt/libvirt_1.2.2.bb
index 4c9cf36..18a6df5 100644
--- a/recipes-extended/libvirt/libvirt_1.2.1.bb
+++ b/recipes-extended/libvirt/libvirt_1.2.2.bb
@@ -25,8 +25,8 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
 	   file://libvirtd.sh \
 	   file://libvirtd.conf"
 
-SRC_URI[libvirt.md5sum] = "cce374220f67895afb6331bd2ddedbfd"
-SRC_URI[libvirt.sha256sum] = "bc29b5751bf36753c17e2fdbb75e70c7b07df3d9527586d3426e90f5f4abb898"
+SRC_URI[libvirt.md5sum] = "592958ad1ddce7574d8cb0a31e635acd"
+SRC_URI[libvirt.sha256sum] = "a48377e307c5c21b67e43db99af909a23c33aff8cbbaa3361fd389eb047cbbc3"
 
 inherit autotools gettext update-rc.d pkgconfig
 
-- 
1.8.4.1



