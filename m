Return-Path: <cosmin.paraschiv@freescale.com>
Received: from tx2outboundpool.messaging.microsoft.com
	(tx2ehsobe004.messaging.microsoft.com [65.55.88.14])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CCB41E00BAB
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 Apr 2014 01:05:40 -0700 (PDT)
Received: from mail216-tx2-R.bigfish.com (10.9.14.246) by
	TX2EHSOBE015.bigfish.com (10.9.40.35) with Microsoft SMTP Server id
	14.1.225.22; Wed, 2 Apr 2014 08:05:39 +0000
Received: from mail216-tx2 (localhost [127.0.0.1])	by
	mail216-tx2-R.bigfish.com (Postfix) with ESMTP id 849E15C01F1	for
	<meta-virtualization@yoctoproject.org>;
	Wed,  2 Apr 2014 08:05:39 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h2148h1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6h208chzz1de098h8275bh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch25f6h2605h268bh26d3h1155h)
Received: from mail216-tx2 (localhost.localdomain [127.0.0.1]) by mail216-tx2
	(MessageSwitch) id 1396425937530897_14468;
	Wed,  2 Apr 2014 08:05:37 +0000 (UTC)
Received: from TX2EHSMHS005.bigfish.com (unknown [10.9.14.247])	by
	mail216-tx2.bigfish.com (Postfix) with ESMTP id 7C95A3400CE;
	Wed,  2 Apr 2014 08:05:37 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS005.bigfish.com
	(10.9.99.105) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Wed, 2 Apr 2014 08:05:36 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Wed, 2 Apr 2014 08:05:36 +0000
Received: from fsr-ub1264-104.ea.freescale.net
	(fsr-ub1264-104.ea.freescale.net [10.171.73.71])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s3285YfI017060;
	Wed, 2 Apr 2014 01:05:35 -0700
From: Cosmin Paraschiv <cosmin.paraschiv@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 2 Apr 2014 11:05:32 +0300
Message-ID: <1396425932-16233-1-git-send-email-cosmin.paraschiv@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [PATCH] linux-yocto: Remove 3.8 kernel bbappend
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
X-List-Received-Date: Wed, 02 Apr 2014 08:05:42 -0000
Content-Type: text/plain

Commit c565d76c from poky removed the 3.8 kernel
from the list of supported kernels in Yocto 1.6.

Signed-off-by: Cosmin Paraschiv <cosmin.paraschiv@freescale.com>
---
 recipes-kernel/linux/linux-yocto_3.8.bbappend |   19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-yocto_3.8.bbappend

diff --git a/recipes-kernel/linux/linux-yocto_3.8.bbappend b/recipes-kernel/linux/linux-yocto_3.8.bbappend
deleted file mode 100644
index c029c05..0000000
--- a/recipes-kernel/linux/linux-yocto_3.8.bbappend
+++ /dev/null
@@ -1,19 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://xt-checksum.scc \
-            file://ebtables.scc \
-	    file://vswitch.scc \
-	    file://lxc.scc \
-	    "
-module_autoload_openvswitch = "openvswitch"
-KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
-
-module_autoload_kvm = "kvm"
-module_autoload_kvm-amd = "kvm-amd"
-module_autoload_kvm-intel = "kvm-intel"
-
-# aufs kernel support required for xen-image-minimal
-KERNEL_FEATURES_append += "${@base_contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
-
-# xen kernel support
-SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc', '', d)}"
-- 
1.7.9.5



