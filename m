Return-Path: <B28495@freescale.com>
Received: from co9outboundpool.messaging.microsoft.com
	(co9ehsobe005.messaging.microsoft.com [207.46.163.28])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E1ACDE014A2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Mar 2013 08:25:30 -0700 (PDT)
Received: from mail12-co9-R.bigfish.com (10.236.132.250) by
	CO9EHSOBE033.bigfish.com (10.236.130.96) with Microsoft SMTP Server id
	14.1.225.23; Wed, 27 Mar 2013 15:25:29 +0000
Received: from mail12-co9 (localhost [127.0.0.1])	by mail12-co9-R.bigfish.com
	(Postfix) with ESMTP id DEEE832011A	for
	<meta-virtualization@yoctoproject.org>;
	Wed, 27 Mar 2013 15:25:29 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1fc6h1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail12-co9 (localhost.localdomain [127.0.0.1]) by mail12-co9
	(MessageSwitch) id 1364397928583236_2421;
	Wed, 27 Mar 2013 15:25:28 +0000 (UTC)
Received: from CO9EHSMHS021.bigfish.com (unknown [10.236.132.252])	by
	mail12-co9.bigfish.com (Postfix) with ESMTP id 82BA13C004C	for
	<meta-virtualization@yoctoproject.org>;
	Wed, 27 Mar 2013 15:25:28 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS021.bigfish.com
	(10.236.130.31) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 27 Mar 2013 15:25:21 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Wed, 27 Mar 2013 15:25:20 +0000
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id
	r2RFPJpE001837; Wed, 27 Mar 2013 08:25:19 -0700
From: <b28495@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 27 Mar 2013 10:25:12 -0500
Message-ID: <1364397914-17992-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-Mailman-Approved-At: Sat, 06 Apr 2013 13:19:54 -0700
Cc: b19537@freescale.com
Subject: [PATCH 0/2] patches for libvirt
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
X-List-Received-Date: Wed, 27 Mar 2013 15:25:31 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Based on:
commit e8b062e8f34f6c228566ca4d33a8c6100db2d168
Author: Olivia Yin <hong-hua.yin@freescale.com>
Date:   Wed Mar 13 13:28:13 2013 +0800

    libvirt: upgrade to 1.0.3

Ting Liu (2):
  libvirt: add dependency on libpciaccess
  libvirt: package .debug and .a files in lock-driver

 recipes-extended/libvirt/libvirt_1.0.3.bb |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
1.7.9.7



