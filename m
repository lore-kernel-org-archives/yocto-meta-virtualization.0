Return-Path: <B28495@freescale.com>
Received: from ch1outboundpool.messaging.microsoft.com
	(ch1ehsobe003.messaging.microsoft.com [216.32.181.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2C4F3E0155E
	for <meta-virtualization@yoctoproject.org>;
	Fri,  5 Jul 2013 19:20:34 -0700 (PDT)
Received: from mail53-ch1-R.bigfish.com (10.43.68.236) by
	CH1EHSOBE013.bigfish.com (10.43.70.63) with Microsoft SMTP Server id
	14.1.225.22; Sat, 6 Jul 2013 02:20:32 +0000
Received: from mail53-ch1 (localhost [127.0.0.1])	by mail53-ch1-R.bigfish.com
	(Postfix) with ESMTP id 4D45E421265	for
	<meta-virtualization@yoctoproject.org>;
	Sat,  6 Jul 2013 02:20:32 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dfeh1dffh1e23h1155h)
Received: from mail53-ch1 (localhost.localdomain [127.0.0.1]) by mail53-ch1
	(MessageSwitch) id 1373077230823699_26374;
	Sat,  6 Jul 2013 02:20:30 +0000 (UTC)
Received: from CH1EHSMHS011.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.235])	by mail53-ch1.bigfish.com (Postfix) with ESMTP id
	BC6C62C00E4 for <meta-virtualization@yoctoproject.org>;
	Sat,  6 Jul 2013 02:20:30 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS011.bigfish.com
	(10.43.70.11) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Sat, 6 Jul 2013 02:20:30 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Sat, 6 Jul 2013 02:20:29 +0000
Received: from b28495.ap.freescale.net ([10.192.208.202])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id r662KOPA016228;
	Fri, 5 Jul 2013 19:20:28 -0700
From: <b28495@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Sat, 6 Jul 2013 10:20:24 +0800
Message-ID: <1373077224-8733-2-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1373077224-8733-1-git-send-email-b28495@freescale.com>
References: <1373077224-8733-1-git-send-email-b28495@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: b19537@freescale.com
Subject: [PATCH 2/2] busybox: Follow OE-Core update to 1.12.1 version
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
X-List-Received-Date: Sat, 06 Jul 2013 02:20:36 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 ...box_1.20.2.bbappend => busybox_1.21.1.bbappend} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename recipes-core/busybox/{busybox_1.20.2.bbappend => busybox_1.21.1.bbappend} (100%)

diff --git a/recipes-core/busybox/busybox_1.20.2.bbappend b/recipes-core/busybox/busybox_1.21.1.bbappend
similarity index 100%
rename from recipes-core/busybox/busybox_1.20.2.bbappend
rename to recipes-core/busybox/busybox_1.21.1.bbappend
-- 
1.7.3.4



