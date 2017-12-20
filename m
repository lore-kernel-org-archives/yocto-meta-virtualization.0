Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5F563E00D81; Tue, 19 Dec 2017 20:03:18 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E0153E00D6B
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Dec 2017 20:03:17 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBK43Hir013075
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Dec 2017 20:03:17 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 19 Dec 2017 20:03:16 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Tue, 19 Dec 2017 23:03:10 -0500
Message-ID: <1513742590-8705-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] iptables: add to our list of RRECOMMENDS
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
X-List-Received-Date: Wed, 20 Dec 2017 04:03:18 -0000
Content-Type: text/plain

Extend the list of RRECOMMENDS to include some essential kernel
modules needed to make iptables minimally useful. Specifically include
the common tables and conntrack, all of which are used by even basic
iptables configurations. While at it I also made things more
consistent for ipv4 vs ipv6.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-extended/iptables/iptables_1.%.bbappend | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/iptables/iptables_1.%.bbappend b/recipes-extended/iptables/iptables_1.%.bbappend
index 52a4c4f..8fd521c 100644
--- a/recipes-extended/iptables/iptables_1.%.bbappend
+++ b/recipes-extended/iptables/iptables_1.%.bbappend
@@ -1,8 +1,19 @@
 RRECOMMENDS_${PN} += "kernel-module-ip6-tables \
+                      kernel-module-ip-tables \
                       kernel-module-ip6table-filter \
-                      kernel-module-xt-tcpudp \
+                      kernel-module-iptable-filter \
+                      kernel-module-ip6table-raw \
+                      kernel-module-iptable-raw \
+                      kernel-module-ip6table-nat \
+                      kernel-module-iptable-nat \
+                      kernel-module-ip6table-mangle \
+                      kernel-module-iptable-magle \
+                      kernel-module-ip6table-security \
+                      kernel-module-iptable-security \
                       kernel-module-ipt-reject \
                       kernel-module-iptable-mangle \
                       kernel-module-xt-checksum \
+                      kernel-module-xt-conntrack \
                       kernel-module-xt-state \
+                      kernel-module-xt-tcpudp \
                       "
-- 
2.7.4


