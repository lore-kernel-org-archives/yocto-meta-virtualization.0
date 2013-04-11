Return-Path: <b43198@az84smr01.freescale.net>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe001.messaging.microsoft.com [216.32.180.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1D978E014CB
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Apr 2013 02:20:15 -0700 (PDT)
Received: from mail168-va3-R.bigfish.com (10.7.14.243) by
	VA3EHSOBE002.bigfish.com (10.7.40.22) with Microsoft SMTP Server id
	14.1.225.23; Thu, 11 Apr 2013 09:20:14 +0000
Received: from mail168-va3 (localhost [127.0.0.1])	by
	mail168-va3-R.bigfish.com (Postfix) with ESMTP id 661292A0063	for
	<meta-virtualization@yoctoproject.org>;
	Thu, 11 Apr 2013 09:20:14 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12a9h12bdh12e5h1354h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail168-va3 (localhost.localdomain [127.0.0.1]) by mail168-va3
	(MessageSwitch) id 1365672011587049_8690;
	Thu, 11 Apr 2013 09:20:11 +0000 (UTC)
Received: from VA3EHSMHS025.bigfish.com (unknown [10.7.14.237])	by
	mail168-va3.bigfish.com (Postfix) with ESMTP id 8A8B6100061	for
	<meta-virtualization@yoctoproject.org>;
	Thu, 11 Apr 2013 09:20:11 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS025.bigfish.com
	(10.7.99.35) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 11 Apr 2013 09:20:11 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Thu, 11 Apr 2013 09:20:10 +0000
Received: from localhost.localdomain (fsr-fed1764-008.ea.freescale.net
	[10.171.73.92])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id r3B9K9gg030064;	Thu, 11 Apr 2013 02:20:09 -0700
Received: (from b43198@localhost)	by localhost.localdomain
	(8.14.5/8.14.5/Submit) id r3B9K8B2011009;
	Thu, 11 Apr 2013 12:20:08 +0300
From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 11 Apr 2013 12:20:06 +0300
Message-ID: <1365672007-10960-1-git-send-email-bogdan.purcareata@freescale.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.net
Subject: [PATCH v2] Update LXC recipe to include config examples in main package
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
X-List-Received-Date: Thu, 11 Apr 2013 09:20:15 -0000
Content-Type: text/plain

The patch configures the LXC recipe to include configuration examples
or containers in the default package - lxc, not in the documentation
one - lxc-doc.

By default, bitbake will split a specific package into multiple sections,
based on meaning - binaries, libraries, documentation, configs, etc. The 
sections will then be assembled into individual packages, such as e.g lxc,
lxc-doc, lxc-dbg and so on. The packages are mutually exclusive with
respect to the sections they contain.

LXC installation provides several example configuration files for various
usage scenarios. The twist is that LXC build scripts place these config
examples in a relative path that is identified by bitbake as belonging to
documentation. This patch places these configuration files in the main
package, where they normally belong.

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



