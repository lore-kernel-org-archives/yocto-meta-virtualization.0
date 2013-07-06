Return-Path: <B28495@freescale.com>
Received: from db8outboundpool.messaging.microsoft.com
	(mail-db8lp0184.outbound.messaging.microsoft.com [213.199.154.184])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8E655E0155E
	for <meta-virtualization@yoctoproject.org>;
	Fri,  5 Jul 2013 19:34:38 -0700 (PDT)
Received: from mail37-db8-R.bigfish.com (10.174.8.249) by
	DB8EHSOBE010.bigfish.com (10.174.4.73) with Microsoft SMTP Server id
	14.1.225.22; Sat, 6 Jul 2013 02:34:37 +0000
Received: from mail37-db8 (localhost [127.0.0.1])	by mail37-db8-R.bigfish.com
	(Postfix) with ESMTP id 2C617A402C7	for
	<meta-virtualization@yoctoproject.org>;
	Sat,  6 Jul 2013 02:34:37 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1155h)
Received: from mail37-db8 (localhost.localdomain [127.0.0.1]) by mail37-db8
	(MessageSwitch) id 1373078075631966_7521;
	Sat,  6 Jul 2013 02:34:35 +0000 (UTC)
Received: from DB8EHSMHS003.bigfish.com (unknown [10.174.8.238])	by
	mail37-db8.bigfish.com (Postfix) with ESMTP id 95AF8340047	for
	<meta-virtualization@yoctoproject.org>;
	Sat,  6 Jul 2013 02:34:35 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB8EHSMHS003.bigfish.com
	(10.174.4.13) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Sat, 6 Jul 2013 02:34:35 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Sat, 6 Jul 2013 02:34:33 +0000
Received: from b28495.ap.freescale.net ([10.192.208.202])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id r662YT0A019349;
	Fri, 5 Jul 2013 19:34:30 -0700
From: <b28495@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Sat, 6 Jul 2013 10:34:29 +0800
Message-ID: <1373078069-9032-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: b19537@freescale.com
Subject: [PATCH v2] busybox: Follow OE-Core update to 1.12.1 version
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
X-List-Received-Date: Sat, 06 Jul 2013 02:34:42 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 ...box_1.20.2.bbappend => busybox_1.21.1.bbappend} |    0
 .../busybox-awk-make--F-STR-interpret-escape.patch |    0
 .../{busybox_1.20.2 => busybox_1.21.1}/defconfig   |    0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename recipes-core/busybox/{busybox_1.20.2.bbappend => busybox_1.21.1.bbappend} (100%)
 rename recipes-core/busybox/{busybox_1.20.2 => busybox_1.21.1}/busybox-awk-make--F-STR-interpret-escape.patch (100%)
 rename recipes-core/busybox/{busybox_1.20.2 => busybox_1.21.1}/defconfig (100%)

diff --git a/recipes-core/busybox/busybox_1.20.2.bbappend b/recipes-core/busybox/busybox_1.21.1.bbappend
similarity index 100%
rename from recipes-core/busybox/busybox_1.20.2.bbappend
rename to recipes-core/busybox/busybox_1.21.1.bbappend
diff --git a/recipes-core/busybox/busybox_1.20.2/busybox-awk-make--F-STR-interpret-escape.patch b/recipes-core/busybox/busybox_1.21.1/busybox-awk-make--F-STR-interpret-escape.patch
similarity index 100%
rename from recipes-core/busybox/busybox_1.20.2/busybox-awk-make--F-STR-interpret-escape.patch
rename to recipes-core/busybox/busybox_1.21.1/busybox-awk-make--F-STR-interpret-escape.patch
diff --git a/recipes-core/busybox/busybox_1.20.2/defconfig b/recipes-core/busybox/busybox_1.21.1/defconfig
similarity index 100%
rename from recipes-core/busybox/busybox_1.20.2/defconfig
rename to recipes-core/busybox/busybox_1.21.1/defconfig
-- 
1.7.3.4



