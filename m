Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.3638.1600763707793699325
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Sep 2020 01:35:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: windriver.com, ip: 198.145.29.25, mailfrom: mingli.yu@windriver.com)
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 4477A38C08B9
	for <meta-virtualization@yoctoproject.org>; Tue, 22 Sep 2020 01:35:07 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 08M8YoRw013762
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>; Tue, 22 Sep 2020 01:34:51 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Tue, 22 Sep 2020
 01:34:28 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [PATCH] lxc: remove deprecated options in lxc.service
Date: Tue, 22 Sep 2020 01:34:28 -0700
Message-ID: <20200922083428.104889-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Remove deprecated options in lxc.service to silence below warning:
 # systemctl status lxc
 [snip]
 /usr/lib/systemd/system/lxc.service:17: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.
 /usr/lib/systemd/system/lxc.service:18: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ed-options-in-lxc.service-fixes-3527.patch | 31 +++++++++++++++++++
 recipes-containers/lxc/lxc_4.0.4.bb           |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch

diff --git a/recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch b/recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
new file mode 100644
index 0000000..2957680
--- /dev/null
+++ b/recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
@@ -0,0 +1,31 @@
+From 0c4cd88d4a19d27ba9b5d2c8fa4d482d78211c35 Mon Sep 17 00:00:00 2001
+From: graysky <graysky@archlinux.us>
+Date: Fri, 21 Aug 2020 06:33:49 -0400
+Subject: [PATCH] remove deprecated options in lxc.service fixes #3527
+
+Remove deprecated options in lxc.service fixes #3527
+
+Upstream-Status: Backport
+
+Signed-off-by: graysky <graysky@archlinux.us>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ config/init/systemd/lxc.service.in | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/config/init/systemd/lxc.service.in b/config/init/systemd/lxc.service.in
+index e3745dc2d..397a6c4d0 100644
+--- a/config/init/systemd/lxc.service.in
++++ b/config/init/systemd/lxc.service.in
+@@ -14,8 +14,6 @@ ExecReload=@LIBEXECDIR@/lxc/lxc-apparmor-load
+ # Environment=BOOTUP=serial
+ # Environment=CONSOLETYPE=serial
+ Delegate=yes
+-StandardOutput=syslog
+-StandardError=syslog
+ 
+ [Install]
+ WantedBy=multi-user.target
+-- 
+2.26.2
+
diff --git a/recipes-containers/lxc/lxc_4.0.4.bb b/recipes-containers/lxc/lxc_4.0.4.bb
index f526ab9..06e2fca 100644
--- a/recipes-containers/lxc/lxc_4.0.4.bb
+++ b/recipes-containers/lxc/lxc_4.0.4.bb
@@ -47,6 +47,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://templates-use-curl-instead-of-wget.patch \
 	file://tests-our-init-is-not-busybox.patch \
 	file://tests-add-no-validate-when-using-download-template.patch \
+	file://0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch \
 	file://dnsmasq.conf \
 	file://lxc-net \
 	"
-- 
2.17.1

