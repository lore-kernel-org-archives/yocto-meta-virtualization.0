Return-Path: <zhe.he@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DA010E00C77; Fri, 25 Jan 2019 00:10:29 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8F02AE009AA
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Jan 2019 00:10:29 -0800 (PST)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id x0P8ARuK000890;
	Fri, 25 Jan 2019 00:10:27 -0800 (PST)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Fri, 25 Jan 2019 00:10:27 -0800
From: He Zhe <zhe.he@windriver.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 25 Jan 2019 00:10:27 -0800
Message-Id: <20190125081027.36723-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] kernel: Add bbappend for linux-yocto-dev
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
X-List-Received-Date: Fri, 25 Jan 2019 08:10:29 -0000

linux-yocto-dev would also use virualization features.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 recipes-kernel/linux/linux-yocto-dev.bbappend | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 recipes-kernel/linux/linux-yocto-dev.bbappend

diff --git a/recipes-kernel/linux/linux-yocto-dev.bbappend b/recipes-kernel/linux/linux-yocto-dev.bbappend
new file mode 100644
index 0000000..20eeba9
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-dev.bbappend
@@ -0,0 +1 @@
+require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'linux-yocto_virtualization.inc', '', d)}
-- 
2.11.0


