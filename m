Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.12541.1604933377029216289
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 06:49:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bertrand.marquis@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B25021435
	for <meta-virtualization@lists.yoctoproject.org>; Mon,  9 Nov 2020 06:49:36 -0800 (PST)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com [10.1.199.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5EF0F3F719
	for <meta-virtualization@lists.yoctoproject.org>; Mon,  9 Nov 2020 06:49:36 -0800 (PST)
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH 2/2] xen: Fix xenpmd compilation error on arm32
Date: Mon,  9 Nov 2020 14:49:27 +0000
Message-Id: <fe22da1f2e1be6076a47ac99189dcfbe321ff71a.1604933003.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <df132acec4c899d81d6a1b52746f0dc782c08e39.1604933003.git.bertrand.marquis@arm.com>
References: <df132acec4c899d81d6a1b52746f0dc782c08e39.1604933003.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1604933003.git.bertrand.marquis@arm.com>
References: <cover.1604933003.git.bertrand.marquis@arm.com>

Add patch merged in current Xen master to solve compilation errors on
xenmpd when Xen is compiled for arm32.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Change-Id: Ifd94aa30e1b3a1016156ead395688f594ad2711d
---
 ...ls-xenpmd-Fix-gcc10-snprintf-warning.patch | 60 +++++++++++++++++++
 recipes-extended/xen/xen-tools_4.14.bb        |  1 +
 recipes-extended/xen/xen-tools_git.bb         |  1 +
 3 files changed, 62 insertions(+)
 create mode 100644 recipes-extended/xen/files/0001-tools-xenpmd-Fix-gcc10-snprintf-warning.patch

diff --git a/recipes-extended/xen/files/0001-tools-xenpmd-Fix-gcc10-snprintf-warning.patch b/recipes-extended/xen/files/0001-tools-xenpmd-Fix-gcc10-snprintf-warning.patch
new file mode 100644
index 0000000..0a136c9
--- /dev/null
+++ b/recipes-extended/xen/files/0001-tools-xenpmd-Fix-gcc10-snprintf-warning.patch
@@ -0,0 +1,60 @@
+From 0dfddb2116e3757f77a691a3fe335173088d69dc Mon Sep 17 00:00:00 2001
+Message-Id: <0dfddb2116e3757f77a691a3fe335173088d69dc.1604734077.git.bertrand.marquis@arm.com>
+From: Bertrand Marquis <bertrand.marquis@arm.com>
+Date: Thu, 15 Oct 2020 10:16:09 +0100
+Subject: [PATCH] tools/xenpmd: Fix gcc10 snprintf warning
+
+Add a check for snprintf return code and ignore the entry if we get an
+error. This should in fact never happen and is more a trick to make gcc
+happy and prevent compilation errors.
+
+This is solving the following gcc warning when compiling for arm32 host
+platforms with optimization activated:
+xenpmd.c:92:37: error: '%s' directive output may be truncated writing
+between 4 and 2147483645 bytes into a region of size 271
+[-Werror=format-truncation=]
+
+This is also solving the following Debian bug:
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=970802
+
+Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
+Acked-by: Wei Liu <wl@xen.org>
+---
+Upstream-status: Backport from 4.15
+---
+ tools/xenpmd/xenpmd.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/tools/xenpmd/xenpmd.c b/tools/xenpmd/xenpmd.c
+index 35fd1c931a..12b82cf43e 100644
+--- a/tools/xenpmd/xenpmd.c
++++ b/tools/xenpmd/xenpmd.c
+@@ -102,6 +102,7 @@ FILE *get_next_battery_file(DIR *battery_dir,
+     FILE *file = 0;
+     struct dirent *dir_entries;
+     char file_name[284];
++    int ret;
+     
+     do 
+     {
+@@ -111,11 +112,15 @@ FILE *get_next_battery_file(DIR *battery_dir,
+         if ( strlen(dir_entries->d_name) < 4 )
+             continue;
+         if ( battery_info_type == BIF ) 
+-            snprintf(file_name, sizeof(file_name), BATTERY_INFO_FILE_PATH,
++            ret = snprintf(file_name, sizeof(file_name), BATTERY_INFO_FILE_PATH,
+                      dir_entries->d_name);
+         else 
+-            snprintf(file_name, sizeof(file_name), BATTERY_STATE_FILE_PATH,
++            ret = snprintf(file_name, sizeof(file_name), BATTERY_STATE_FILE_PATH,
+                      dir_entries->d_name);
++        /* This should not happen but is needed to pass gcc checks */
++        if (ret < 0)
++            continue;
++        file_name[sizeof(file_name) - 1] = '\0';
+         file = fopen(file_name, "r");
+     } while ( !file );
+ 
+-- 
+2.17.1
+
diff --git a/recipes-extended/xen/xen-tools_4.14.bb b/recipes-extended/xen/xen-tools_4.14.bb
index 4119190..73a52bc 100644
--- a/recipes-extended/xen/xen-tools_4.14.bb
+++ b/recipes-extended/xen/xen-tools_4.14.bb
@@ -7,6 +7,7 @@ SRC_URI = " \
     git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
     file://0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch \
     file://0001-xen-build-temporarily-inhibit-Werror-4.14.patch \
+    file://0001-tools-xenpmd-Fix-gcc10-snprintf-warning.patch \
     "
 
 LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xen/xen-tools_git.bb
index 71aeeed..1f6be1d 100644
--- a/recipes-extended/xen/xen-tools_git.bb
+++ b/recipes-extended/xen/xen-tools_git.bb
@@ -7,6 +7,7 @@ SRC_URI = " \
     git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
     file://0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch \
     file://0001-xen-build-temporarily-inhibit-Werror-4.14.patch \
+    file://0001-tools-xenpmd-Fix-gcc10-snprintf-warning.patch \
     "
 
 LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
-- 
2.17.1

