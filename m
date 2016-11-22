Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D0725E00CE5; Tue, 22 Nov 2016 10:56:46 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EB9CDE00CC0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Nov 2016 10:56:44 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAMIuhGM024019
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Nov 2016 10:56:43 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 22 Nov 2016 10:56:42 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Tue, 22 Nov 2016 13:56:14 -0500
Message-ID: <1479840976-10540-3-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479840976-10540-1-git-send-email-mark.asselstine@windriver.com>
References: <1479840976-10540-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH 2/4] dnsmasq: don't mess with the system config file
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
X-List-Received-Date: Tue, 22 Nov 2016 18:56:46 -0000
Content-Type: text/plain

The system/default config file for dnsmasq is used by several
different packages to configure various instances of dnsmasq. Ideally
this file should be 'empty' allowing the dnsmasq to start with the
settings it has built in to it. If specific settings are required
instead of using the system/default config file a package specific
config should be created and used, we see this with libvirt for
example.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-support/dnsmasq/dnsmasq_2.%.bbappend | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 recipes-support/dnsmasq/dnsmasq_2.%.bbappend

diff --git a/recipes-support/dnsmasq/dnsmasq_2.%.bbappend b/recipes-support/dnsmasq/dnsmasq_2.%.bbappend
deleted file mode 100644
index 8d66ca6..0000000
--- a/recipes-support/dnsmasq/dnsmasq_2.%.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-# dnsmasq is greedy with interfaces by default using bind-dynamic will
-# make it less greedy but still function as it did by default.
-do_install_append() {
-    sed -i '/#bind-interfaces/a # Play nice with libvirt\nbind-dynamic' ${D}${sysconfdir}/dnsmasq.conf
-}
-- 
2.7.4


