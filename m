Return-Path: <b43198@az84smr01.freescale.net>
Received: from co9outboundpool.messaging.microsoft.com
	(co9ehsobe003.messaging.microsoft.com [207.46.163.26])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 35E6BE014D5
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Apr 2013 07:22:20 -0700 (PDT)
Received: from mail21-co9-R.bigfish.com (10.236.132.247) by
	CO9EHSOBE026.bigfish.com (10.236.130.89) with Microsoft SMTP Server id
	14.1.225.23; Fri, 12 Apr 2013 14:22:19 +0000
Received: from mail21-co9 (localhost [127.0.0.1])	by mail21-co9-R.bigfish.com
	(Postfix) with ESMTP id 31F4AC019A	for
	<meta-virtualization@yoctoproject.org>;
	Fri, 12 Apr 2013 14:22:19 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 21
X-BigFish: VS21(z49a8vzdc36ozz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzz6d523h8275bhz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12a9h12bdh12e5h1354h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail21-co9 (localhost.localdomain [127.0.0.1]) by mail21-co9
	(MessageSwitch) id 1365776536641545_23413;
	Fri, 12 Apr 2013 14:22:16 +0000 (UTC)
Received: from CO9EHSMHS011.bigfish.com (unknown [10.236.132.245])	by
	mail21-co9.bigfish.com (Postfix) with ESMTP id 9A9D71C0394	for
	<meta-virtualization@yoctoproject.org>;
	Fri, 12 Apr 2013 14:22:16 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS011.bigfish.com
	(10.236.130.21) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 12 Apr 2013 14:22:15 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Fri, 12 Apr 2013 14:22:14 +0000
Received: from localhost.localdomain (fsr-fed1764-008.ea.freescale.net
	[10.171.73.92])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id r3CEMDDm031128;	Fri, 12 Apr 2013 07:22:13 -0700
Received: (from b43198@localhost)	by localhost.localdomain
	(8.14.5/8.14.5/Submit) id r3CEMCMR009003;
	Fri, 12 Apr 2013 17:22:12 +0300
From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 12 Apr 2013 17:22:10 +0300
Message-ID: <1365776531-8967-1-git-send-email-bogdan.purcareata@freescale.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.net
Subject: [PATCH 2/2] lxc: remove noldconfig.patch, since it is no longer used
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
X-List-Received-Date: Fri, 12 Apr 2013 14:22:20 -0000
Content-Type: text/plain

Patch is no longer needed since the removal of LXC 0.8.0 recipe.

Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
---
 recipes-containers/lxc/files/noldconfig.patch | 29 ---------------------------
 1 file changed, 29 deletions(-)
 delete mode 100644 recipes-containers/lxc/files/noldconfig.patch

diff --git a/recipes-containers/lxc/files/noldconfig.patch b/recipes-containers/lxc/files/noldconfig.patch
deleted file mode 100644
index 5edff46..0000000
--- a/recipes-containers/lxc/files/noldconfig.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From a8aa8d131a7140d5625c24c9f4c28c605213552c Mon Sep 17 00:00:00 2001
-From: Andrey Mazo <ahippo@yandex.ru>
-Date: Fri, 18 May 2012 21:11:22 +0400
-Subject: [PATCH] Avoid ldconfig due to cross-compilation problems.
-
-Make required symlinks manually.
-Otherwise, it cases problems on cbuild endianness != ctarget endianness
-setups because /sbin/ldconfig expects elf header in the wrong endianness.
----
- src/lxc/Makefile.am |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/src/lxc/Makefile.am b/src/lxc/Makefile.am
-index 1c26952..3b84c1a 100644
---- a/src/lxc/Makefile.am
-+++ b/src/lxc/Makefile.am
-@@ -125,8 +125,8 @@ lxc_kill_SOURCES = lxc_kill.c
- 
- install-exec-local: install-soPROGRAMS
- 	mv $(DESTDIR)$(libdir)/liblxc.so $(DESTDIR)$(libdir)/liblxc.so.$(VERSION)
--	/sbin/ldconfig -l $(DESTDIR)$(libdir)/liblxc.so.$(VERSION)
- 	cd $(DESTDIR)$(libdir); \
-+	ln -sf liblxc.so.$(VERSION) liblxc.so.$(firstword $(subst ., ,$(VERSION))); \
- 	ln -sf liblxc.so.$(firstword $(subst ., ,$(VERSION))) liblxc.so
- 
- uninstall-local:
--- 
-1.7.3.4
-
-- 
1.7.11.7



