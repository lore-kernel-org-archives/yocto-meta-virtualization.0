Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BFE36E00D67; Mon, 10 Jun 2019 20:11:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 744EDE00D53
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Jun 2019 20:11:27 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5B3BQgE011378
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Jun 2019 20:11:26 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Mon, 10 Jun 2019 20:11:25 -0700
From: <zhe.he@windriver.com>
To: <bruce.ashfield@gmail.com>, <meta-virtualization@yoctoproject.org>
Date: Tue, 11 Jun 2019 11:11:24 +0800
Message-ID: <1560222684-412783-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] kernel: Add conditional inclusion of linux-yocto_virtualization.inc for rt kernel
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
X-List-Received-Date: Tue, 11 Jun 2019 03:11:27 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

This is the same as other kernel bbappend.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 recipes-kernel/linux/linux-yocto-rt_%.bbappend | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 recipes-kernel/linux/linux-yocto-rt_%.bbappend

diff --git a/recipes-kernel/linux/linux-yocto-rt_%.bbappend b/recipes-kernel/linux/linux-yocto-rt_%.bbappend
new file mode 100644
index 0000000..20eeba9
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-rt_%.bbappend
@@ -0,0 +1 @@
+require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'linux-yocto_virtualization.inc', '', d)}
-- 
2.7.4


