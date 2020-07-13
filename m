Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.12403.1594611669198891942
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jul 2020 20:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: zhe.he@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 06D3f4c8006040
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Sun, 12 Jul 2020 20:41:05 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Sun, 12 Jul 2020 20:41:04 -0700
From: "He Zhe" <zhe.he@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>, <bruce.ashfield@gmail.com>
Subject: [meta-virtualization] [PATCH] linux-yocto: Drop RT_GROUP_SCHED
Date: Mon, 13 Jul 2020 11:37:57 +0800
Message-ID: <20200713033757.3055953-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Systemd doesn't support RT group scheduling.
https://github.com/systemd/systemd/issues/13781#issuecomment-549164383

And lxc doesn't necessarily use this feature.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 recipes-kernel/linux/linux-yocto/lxc.cfg | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-yocto/lxc.cfg b/recipes-kernel/linux/linux-yocto/lxc.cfg
index 3fefc03..e195c15 100644
--- a/recipes-kernel/linux/linux-yocto/lxc.cfg
+++ b/recipes-kernel/linux/linux-yocto/lxc.cfg
@@ -4,7 +4,6 @@ CONFIG_PROC_PID_CPUSET=y
 CONFIG_MEMCG=y
 CONFIG_CGROUP_SCHED=y
 CONFIG_FAIR_GROUP_SCHED=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_NAMESPACES=y
 CONFIG_UTS_NS=y
-- 
2.17.1

