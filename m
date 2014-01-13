Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D9868E0079B
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Jan 2014 11:42:13 -0800 (PST)
Received: by mail-wi0-f176.google.com with SMTP id hq4so2767324wib.9
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Jan 2014 11:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=hm3oA/0V4pgzD12rDjr11h3v+/2wVEQNLmCRngkOASY=;
	b=RfsOPKr55zsG5BG48z4Gqh+bxp8jwPGBGgOPZJ1HyziI7AVjjQGRCSQC7BGqjamf+7
	HoB1y0aYGggBJj1yqUlxw2W81AXKgTrMyx7G9oMdqUHcjLfLj4aPLklbKdPQDU2waZ59
	T9S9Q47ovjlN4FMoP6JTa9LBxm6gua1/CXMQ1U+Z8MCN5SNZQA2arZdpnzYSxXe9Nyyq
	jBAo6Bjb3cG8fVDdkopoiUu4a4H7OQ9jI3qsZek+G6FaLTxic43JVmsRiu79cqgh4F3z
	qbuHGOKmg/XU4hRdAGh26ST/YpBDM0j1oT/SA9L2IeJasOeZ/ByGJnkJUezNJNeHolcp
	nJ4Q==
X-Received: by 10.180.221.129 with SMTP id qe1mr7610394wic.17.1389642131993;
	Mon, 13 Jan 2014 11:42:11 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	bj3sm12375800wjb.14.2014.01.13.11.42.09
	for <meta-virtualization@yoctoproject.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 13 Jan 2014 11:42:11 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 13 Jan 2014 12:42:02 -0700
Message-Id: <1389642122-32348-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [PATCH] iptables: 1.4.19.1 -> 1.4.21
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
X-List-Received-Date: Mon, 13 Jan 2014 19:42:22 -0000

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 .../iptables/{iptables_1.4.19.1.bbappend => iptables_1.4.21.bbappend}     | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-extended/iptables/{iptables_1.4.19.1.bbappend => iptables_1.4.21.bbappend} (100%)

diff --git a/recipes-extended/iptables/iptables_1.4.19.1.bbappend b/recipes-extended/iptables/iptables_1.4.21.bbappend
similarity index 100%
rename from recipes-extended/iptables/iptables_1.4.19.1.bbappend
rename to recipes-extended/iptables/iptables_1.4.21.bbappend
-- 
1.8.3.4


