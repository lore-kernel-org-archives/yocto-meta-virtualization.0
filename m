Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.7741.1589874958471135948
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 May 2020 00:55:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 04J7tu5r005847
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 19 May 2020 00:55:56 -0700 (PDT)
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Tue, 19 May 2020
 00:55:34 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] lxc: fix compile failure on gcc10
Date: Tue, 19 May 2020 00:55:34 -0700
Message-ID: <20200519075534.46799-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Since oe-core is upgrading gcc to 10.1, there is
a compile failure
...
|../../../lxc-4.0.2/src/lxc/cgroups/cgfsng.c:2100:10: error: writing
1 byte into a region of size 0 [-Werror=stringop-overflow=]
| 2100 |   *slash = '\0';
...

Add gcc option `-Werror=stringop-overflow' to workaround the issue

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 recipes-containers/lxc/lxc_4.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/lxc/lxc_4.0.2.bb b/recipes-containers/lxc/lxc_4.0.2.bb
index 441cf96..d0ead81 100644
--- a/recipes-containers/lxc/lxc_4.0.2.bb
+++ b/recipes-containers/lxc/lxc_4.0.2.bb
@@ -67,7 +67,7 @@ ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
 EXTRA_OECONF += "--enable-log-src-basename"
 
-CFLAGS_append = " -Wno-error=deprecated-declarations"
+CFLAGS_append = " -Wno-error=deprecated-declarations -Wno-error=stringop-overflow"
 
 PACKAGECONFIG ??= "templates \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
-- 
2.21.0

