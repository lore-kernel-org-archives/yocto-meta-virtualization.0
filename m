Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CA258E00C5F; Wed,  9 Jan 2019 12:20:48 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AFD40E00950
	for <meta-virtualization@yoctoproject.org>;
	Wed,  9 Jan 2019 12:20:47 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x09KJpnn018394
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 9 Jan 2019 12:20:37 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 9 Jan 2019 12:20:05 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 9 Jan 2019 15:19:58 -0500
Message-ID: <1547065198-24974-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: bruce.ashfield@windriver.com
Subject: [PATCH] linux-yocto: cleanup lxc.cfg kernel config fragment
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
X-List-Received-Date: Wed, 09 Jan 2019 20:20:48 -0000
Content-Type: text/plain

fixes:
    WARNING: linux-yocto-4.18.21+gitAUTOINC+9e348b6f9d_db2d813869-r0
    do_kernel_configcheck: [kernel config]: This BSP sets config
    options that are not offered anywhere within this kernel:

    CONFIG_EXT3_FS_XATTR
    CONFIG_RESOURCE_COUNTERS
    CONFIG_CGROUP_MEM_RES_CTLR
    CONFIG_CLS_CGROUP
    CONFIG_NETPRIO_CGROUP
    CONFIG_DEVPTS_MULTIPLE_INSTANCES

Configs were either dropped or renamed according to the updates made
in the kernel, as capture below.

CONFIG_RESOURCE_COUNTERS gone since kernel v3.19 via mainline
commit 5b1efc027c0b51ca3e76f4e00c83358f8349f543.

CONFIG_CGROUP_MEM_RES_CTLR renamed since kernel v3.6 via mainline
commit c255a458055e459f65eb7b7f51dc5dbdd0caf1d8

CONFIG_CLS_CGROUP never existed AFAICT it should have always
been CONFIG_NET_CLS_CGROUP

CONFIG_NETPRIO_CGROUP renamed since kernel v3.14 via mainline
commit 86f8515f9721fa171483f0fe0391968fbb949cc9

CONFIG_DEVPTS_MULTIPLE_INSTANCES removed since kernel v4.7 via mainline
commit eedf265aa003b4781de24cfed40a655a664457e6

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-kernel/linux/linux-yocto/lxc.cfg | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto/lxc.cfg b/recipes-kernel/linux/linux-yocto/lxc.cfg
index e5f1edc..9ff49f1 100644
--- a/recipes-kernel/linux/linux-yocto/lxc.cfg
+++ b/recipes-kernel/linux/linux-yocto/lxc.cfg
@@ -1,8 +1,7 @@
 CONFIG_CGROUP_DEVICE=y
 CONFIG_CPUSETS=y
 CONFIG_PROC_PID_CPUSET=y
-CONFIG_RESOURCE_COUNTERS=y
-CONFIG_CGROUP_MEM_RES_CTLR=y
+CONFIG_MEMCG=y
 CONFIG_CGROUP_SCHED=y
 CONFIG_FAIR_GROUP_SCHED=y
 CONFIG_RT_GROUP_SCHED=y
@@ -14,11 +13,9 @@ CONFIG_USER_NS=y
 CONFIG_PID_NS=y
 CONFIG_NET_NS=y
 
-CONFIG_CLS_CGROUP=m
+CONFIG_NET_CLS_CGROUP=m
 CONFIG_BLK_CGROUP=y
-CONFIG_NETPRIO_CGROUP=m
-
-CONFIG_DEVPTS_MULTIPLE_INSTANCES=y
+CONFIG_CGROUP_NET_PRIO=m
 
 # Virtual drivers
 CONFIG_HVC_DRIVER=y
-- 
2.7.4


