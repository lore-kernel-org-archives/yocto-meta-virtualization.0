Return-Path: <B28495@freescale.com>
Received: from ch1outboundpool.messaging.microsoft.com
	(ch1ehsobe003.messaging.microsoft.com [216.32.181.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2B198E014BF
	for <meta-virtualization@yoctoproject.org>;
	Fri,  5 Jul 2013 19:20:34 -0700 (PDT)
Received: from mail203-ch1-R.bigfish.com (10.43.68.241) by
	CH1EHSOBE004.bigfish.com (10.43.70.54) with Microsoft SMTP Server id
	14.1.225.22; Sat, 6 Jul 2013 02:20:31 +0000
Received: from mail203-ch1 (localhost [127.0.0.1])	by
	mail203-ch1-R.bigfish.com (Postfix) with ESMTP id 5F78426009F	for
	<meta-virtualization@yoctoproject.org>;
	Sat,  6 Jul 2013 02:20:31 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(z21eIzzz1f42h1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1155h)
Received: from mail203-ch1 (localhost.localdomain [127.0.0.1]) by mail203-ch1
	(MessageSwitch) id 1373077230292770_20384;
	Sat,  6 Jul 2013 02:20:30 +0000 (UTC)
Received: from CH1EHSMHS024.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.253])	by mail203-ch1.bigfish.com (Postfix) with ESMTP id
	3A51DA0052 for <meta-virtualization@yoctoproject.org>;
	Sat,  6 Jul 2013 02:20:30 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS024.bigfish.com
	(10.43.70.24) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Sat, 6 Jul 2013 02:20:29 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Sat, 6 Jul 2013 02:20:28 +0000
Received: from b28495.ap.freescale.net ([10.192.208.202])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id r662KOP9016228;
	Fri, 5 Jul 2013 19:20:26 -0700
From: <b28495@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Sat, 6 Jul 2013 10:20:23 +0800
Message-ID: <1373077224-8733-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: b19537@freescale.com
Subject: [PATCH 1/2] iptables: Follow OE-Core update to 1.4.19.1 version
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
 ..._1.4.18.bbappend => iptables_1.4.19.1.bbappend} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename recipes-extended/iptables/{iptables_1.4.18.bbappend => iptables_1.4.19.1.bbappend} (100%)

diff --git a/recipes-extended/iptables/iptables_1.4.18.bbappend b/recipes-extended/iptables/iptables_1.4.19.1.bbappend
similarity index 100%
rename from recipes-extended/iptables/iptables_1.4.18.bbappend
rename to recipes-extended/iptables/iptables_1.4.19.1.bbappend
-- 
1.7.3.4



