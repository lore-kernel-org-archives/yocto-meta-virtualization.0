Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 308FFE00C39; Mon, 21 Dec 2015 17:24:02 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_LOW,
	UPPERCASE_50_75 autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.175 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.0 UPPERCASE_50_75 message body is 50-75% uppercase
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BF6BEE00863
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Dec 2015 17:23:59 -0800 (PST)
Received: by mail-qk0-f175.google.com with SMTP id n135so24418188qka.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Dec 2015 17:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6hPL36u9hLUzd1CUCabST+pXL/ZcuY81zTHCXVovRFM=;
	b=EjPIWzi2mP7yyRooQkxQPA961dhccEUL+GkiUrmPXc370M09aEqacSM3sLhYUK0mGG
	NOHroVQpjz1DYVvLYQDcjJ6I+d8jT94hooYWFjGKxv35/RS9wr0u++vP1n6B11lIE4nI
	bMQ6/E6YeN6y0TRXeJNLcwIpAt9ABNqLVG+TbuhWTRLYa1OoiwmAKLjIYxuYKmVVfVZG
	orEpmy3UeoSkD8E0CvDuYlE2ur68/VXrOvSalJlaRWucpHBKeoTyc/5JHYWto4/9bgVo
	IBpokhgy1PpvALphkLYAoN2bq2WyK/PJxVDUuYlZZNRHCejrQEyAPUw2AgqLHjsEWdTF
	1b5A==
X-Received: by 10.55.74.197 with SMTP id x188mr29390930qka.104.1450747439400; 
	Mon, 21 Dec 2015 17:23:59 -0800 (PST)
Received: from roost.members.linode.com (chrispatterson.net. [66.175.209.160])
	by smtp.gmail.com with ESMTPSA id
	o51sm6344305qge.34.2015.12.21.17.23.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Dec 2015 17:23:58 -0800 (PST)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 21 Dec 2015 20:23:52 -0500
Message-Id: <1450747435-5738-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/4] xen.cfg: update for linux 4.1 and add some newer config options
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
X-List-Received-Date: Tue, 22 Dec 2015 01:24:02 -0000

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-kernel/linux/linux-yocto/xen.cfg |   20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto/xen.cfg b/recipes-kernel/linux/linux-yocto/xen.cfg
index 4e796b9..206b162 100644
--- a/recipes-kernel/linux/linux-yocto/xen.cfg
+++ b/recipes-kernel/linux/linux-yocto/xen.cfg
@@ -1,27 +1,18 @@
-###
-# linux 3.4, 3.8
-CONFIG_PARAVIRT_GUEST=y
-###
-
-###
-# linux 3.10
-CONFIG_HYPERVISOR_GUEST=y
-###
-
-CONFIG_PARAVIRT=y
 CONFIG_XEN=y
 CONFIG_XEN_DOM0=y
-CONFIG_XEN_PRIVILEGED_GUEST=y
 CONFIG_XEN_PVHVM=y
 CONFIG_XEN_MAX_DOMAIN_MEMORY=500
 CONFIG_XEN_SAVE_RESTORE=y
-CONFIG_PARAVIRT_CLOCK=y
+# CONFIG_XEN_DEBUG_FS is not set
+CONFIG_XEN_PVH=y
+CONFIG_MMU_NOTIFIER=y
 CONFIG_HIBERNATE_CALLBACKS=y
 CONFIG_PCI_XEN=y
 CONFIG_XEN_PCIDEV_FRONTEND=y
 CONFIG_SYS_HYPERVISOR=y
 CONFIG_XEN_BLKDEV_FRONTEND=y
 CONFIG_XEN_BLKDEV_BACKEND=m
+CONFIG_XEN_SCSI_FRONTEND=m
 CONFIG_XEN_NETDEV_FRONTEND=y
 CONFIG_XEN_NETDEV_BACKEND=m
 CONFIG_INPUT_MISC=y
@@ -52,3 +43,6 @@ CONFIG_XEN_PRIVCMD=y
 CONFIG_XEN_ACPI_PROCESSOR=m
 CONFIG_XEN_MCE_LOG=y
 CONFIG_XEN_HAVE_PVMMU=y
+CONFIG_XEN_EFI=y
+CONFIG_XEN_AUTO_XLATE=y
+CONFIG_XEN_ACPI=y
-- 
1.7.10.4


