Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9D4CEE00478; Mon,  1 Dec 2014 05:51:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 45C47E0030B
	for <meta-virtualization@yoctoproject.org>;
	Mon,  1 Dec 2014 05:51:33 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.175) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1; Mon, 1 Dec 2014
	14:51:27 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 1 Dec 2014 14:51:17 +0100
Message-ID: <1417441877-639-1-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH] lxc.cfg: remove unnecessary kernel configuraitons.
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
X-List-Received-Date: Mon, 01 Dec 2014 13:51:36 -0000
Content-Type: text/plain

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 recipes-kernel/linux/linux-yocto/lxc.cfg | 2 --
 1 file changed, 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto/lxc.cfg b/recipes-kernel/linux/linux-yocto/lxc.cfg
index f720ca6..e8aae6c 100644
--- a/recipes-kernel/linux/linux-yocto/lxc.cfg
+++ b/recipes-kernel/linux/linux-yocto/lxc.cfg
@@ -13,8 +13,6 @@ CONFIG_IPC_NS=y
 CONFIG_USER_NS=y
 CONFIG_PID_NS=y
 CONFIG_NET_NS=y
-CONFIG_SECCOMP=y
-CONFIG_SECURITY_APPARMOR=y
 
 CONFIG_CLS_CGROUP=m
 CONFIG_BLK_CGROUP=m
-- 
1.9.3


