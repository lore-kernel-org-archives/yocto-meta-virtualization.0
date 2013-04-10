Return-Path: <b43198@az84smr01.freescale.net>
Received: from db8outboundpool.messaging.microsoft.com
	(mail-db8lp0186.outbound.messaging.microsoft.com [213.199.154.186])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37524E014B5
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Apr 2013 04:21:49 -0700 (PDT)
Received: from mail56-db8-R.bigfish.com (10.174.8.232) by
	DB8EHSOBE023.bigfish.com (10.174.4.86) with Microsoft SMTP Server id
	14.1.225.23; Wed, 10 Apr 2013 11:21:48 +0000
Received: from mail56-db8 (localhost [127.0.0.1])	by mail56-db8-R.bigfish.com
	(Postfix) with ESMTP id 29B2264013B	for
	<meta-virtualization@yoctoproject.org>;
	Wed, 10 Apr 2013 11:21:48 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12a9h12bdh12e5h1354h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail56-db8 (localhost.localdomain [127.0.0.1]) by mail56-db8
	(MessageSwitch) id 1365592905796565_893; Wed, 10 Apr 2013 11:21:45 +0000
	(UTC)
Received: from DB8EHSMHS029.bigfish.com (unknown [10.174.8.228])	by
	mail56-db8.bigfish.com (Postfix) with ESMTP id BF68680045	for
	<meta-virtualization@yoctoproject.org>;
	Wed, 10 Apr 2013 11:21:45 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB8EHSMHS029.bigfish.com
	(10.174.4.39) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 10 Apr 2013 11:21:45 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Wed, 10 Apr 2013 11:21:44 +0000
Received: from localhost.localdomain (fsr-fed1764-008.ea.freescale.net
	[10.171.73.92])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id r3ABLgoe002911;	Wed, 10 Apr 2013 04:21:43 -0700
Received: (from b43198@localhost)	by localhost.localdomain
	(8.14.5/8.14.5/Submit) id r3ABLfPO024595;
	Wed, 10 Apr 2013 14:21:41 +0300
From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 10 Apr 2013 14:21:36 +0300
Message-ID: <1365592897-24559-1-git-send-email-bogdan.purcareata@freescale.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1365586806-8155-1-git-send-email-bogdan.purcareata@freescale.com>
References: <1365586806-8155-1-git-send-email-bogdan.purcareata@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.net
Subject: [PATCH] Update LXC recipe to include config examples in main package
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
X-List-Received-Date: Wed, 10 Apr 2013 11:21:49 -0000
Content-Type: text/plain

Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
---
 recipes-containers/lxc/lxc_0.9.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/lxc/lxc_0.9.0.bb
index a5bfa3e..14f8a07 100644
--- a/recipes-containers/lxc/lxc_0.9.0.bb
+++ b/recipes-containers/lxc/lxc_0.9.0.bb
@@ -37,4 +37,7 @@ PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparm
 
 inherit autotools
 
+FILES_${PN}-doc = "${mandir} ${infodir}"
+# For LXC the docdir only contains example configuration files and should be included in the lxc package
+FILES_${PN} += "${docdir}"
 FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
-- 
1.7.11.7



