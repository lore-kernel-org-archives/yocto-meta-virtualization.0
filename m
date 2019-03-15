Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 23ED1E00D28; Thu, 14 Mar 2019 20:04:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D185DE00AB0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Mar 2019 20:04:28 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2F34Ri0009376
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Mar 2019 20:04:27 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 14 Mar 2019 20:04:26 -0700
From: <zhe.he@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@gmail.com>
Date: Fri, 15 Mar 2019 11:04:25 +0800
Message-ID: <1552619065-53429-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] lxc: Correct CONFIG_CGROUP_NET_PRIO setting
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
X-List-Received-Date: Fri, 15 Mar 2019 03:04:30 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Since af6363374cbd ("cgroup: make CONFIG_CGROUP_NET_PRIO bool and drop unnecessary init_netclassid_cgroup()"),
CONFIG_CGROUP_NET_PRIO has become a bool option. Forcedly setting it to "m"
would end up with "n". Change it to "y" here.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 recipes-kernel/linux/linux-yocto/lxc.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-yocto/lxc.cfg b/recipes-kernel/linux/linux-yocto/lxc.cfg
index 9ff49f1..adaad3a 100644
--- a/recipes-kernel/linux/linux-yocto/lxc.cfg
+++ b/recipes-kernel/linux/linux-yocto/lxc.cfg
@@ -15,7 +15,7 @@ CONFIG_NET_NS=y
 
 CONFIG_NET_CLS_CGROUP=m
 CONFIG_BLK_CGROUP=y
-CONFIG_CGROUP_NET_PRIO=m
+CONFIG_CGROUP_NET_PRIO=y
 
 # Virtual drivers
 CONFIG_HVC_DRIVER=y
-- 
2.7.4


