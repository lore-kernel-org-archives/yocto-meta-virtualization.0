Return-Path: <B28495@freescale.com>
Received: from co9outboundpool.messaging.microsoft.com
	(co9ehsobe001.messaging.microsoft.com [207.46.163.24])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5693CE013A3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 May 2013 01:42:05 -0700 (PDT)
Received: from mail170-co9-R.bigfish.com (10.236.132.246) by
	CO9EHSOBE008.bigfish.com (10.236.130.71) with Microsoft SMTP Server id
	14.1.225.23; Wed, 15 May 2013 08:42:04 +0000
Received: from mail170-co9 (localhost [127.0.0.1])	by
	mail170-co9-R.bigfish.com (Postfix) with ESMTP id 3BE4AD40272	for
	<meta-virtualization@yoctoproject.org>;
	Wed, 15 May 2013 08:42:04 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1155h)
Received: from mail170-co9 (localhost.localdomain [127.0.0.1]) by mail170-co9
	(MessageSwitch) id 136860732329600_28235;
	Wed, 15 May 2013 08:42:03 +0000 (UTC)
Received: from CO9EHSMHS013.bigfish.com (unknown [10.236.132.254])	by
	mail170-co9.bigfish.com (Postfix) with ESMTP id EF0EF200081	for
	<meta-virtualization@yoctoproject.org>;
	Wed, 15 May 2013 08:42:02 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS013.bigfish.com
	(10.236.130.23) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 15 May 2013 08:42:02 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Wed, 15 May 2013 08:42:25 +0000
Received: from b28495.ap.freescale.net ([10.192.208.202])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id r4F8fuwQ017438;
	Wed, 15 May 2013 01:41:58 -0700
From: <b28495@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 15 May 2013 16:41:56 +0800
Message-ID: <1368607316-17468-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: b19537@freescale.com
Subject: [PATCH] iptables: update bbappend to match oe-core
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
X-List-Received-Date: Wed, 15 May 2013 08:42:05 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 ...es_1.4.17.bbappend => iptables_1.4.18.bbappend} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename recipes-extended/iptables/{iptables_1.4.17.bbappend => iptables_1.4.18.bbappend} (100%)

diff --git a/recipes-extended/iptables/iptables_1.4.17.bbappend b/recipes-extended/iptables/iptables_1.4.18.bbappend
similarity index 100%
rename from recipes-extended/iptables/iptables_1.4.17.bbappend
rename to recipes-extended/iptables/iptables_1.4.18.bbappend
-- 
1.7.3.4



