Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.6098.1604766283677173236
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 07 Nov 2020 08:24:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DR0mOs2/;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id c16so4103920wmd.2
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 07 Nov 2020 08:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ft12BMC2vRkR9LktM9tPL27BsEZRpaBkDkDwdYSpof0=;
        b=DR0mOs2//gIrBZqYLh4rr/OkWSYqpAxlLrHjZ+7AxTUXaI9uX+wDxUUvUcRR3wwccj
         UwA3gkOe2ZQz/Up/sPd0PqYu+51Ut3V1QcsxSi4smaYplh9+0iYz6Qc0R4KkarHOUuWk
         D3NFNMyr9DSNdFUW9yj4Bx+ZACHr0V9yWC3+CJqJGIz5jwGM1GrEFtRYPPjuN2YqGUF7
         QIGNkOBHkHs6sNdB2fEhiMDeU0yGmdl3TkPDNbtY94RgiJdmC5lbgxa+PIm1zLy1T6gq
         5vWEvgQvQ5yNzLL2FS/VXJyxuCc4P3QjjHz6QWzpTHonKGOrnLM+nSTvQYzsdgzfl9q+
         NohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ft12BMC2vRkR9LktM9tPL27BsEZRpaBkDkDwdYSpof0=;
        b=rhHA0VypSiU7WYClsH46ioJHjVfOC724z13RZUtfggc8xu7j6l4fUTveCosOybQAh/
         YEkWF+HxVl4+J0kp4ssa40qzdu+/PzLZqeq+3IsqoFTbw4g89eCA3lu9NuvX7eR0q8h3
         ZHY8qcn0Y2NSWHT6CffKgssvfcF1i+JYYa7yO8S/eZRrAbb13P9SH5t1EKbHaDihwJqJ
         VP1w6hX2TDw5WWHOA+/wgdfXyg1CRya0i6nLZ2LQshjlu73ubwrLDXqhKuQzNlUMLR4V
         rWrYYETcm4DWAZsOBFDpHSU2DL+Y9d9YHCOPwr3EDHGsoqGtXPakpZdY11TBcbvZpfSV
         RKsA==
X-Gm-Message-State: AOAM532cU+SuV4DtDrEGiviLP1uoP+AIcHhSh/NKXBJb8x0BmPc95t1A
	xq35urgXQfUXx7nkUV5BqBZzsGsg6pU=
X-Google-Smtp-Source: ABdhPJyz1KpVBsZAPHZU/KLsIUtznfYLdlZHJSj/G2kqe+vh0mNAS5TuTLMQMcKAgD+NJG0naCK4bQ==
X-Received: by 2002:a1c:7515:: with SMTP id o21mr5728607wmc.5.1604766281812;
        Sat, 07 Nov 2020 08:24:41 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id o7sm7445623wrp.23.2020.11.07.08.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2020 08:24:41 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH 2/2] cloud-init: fix usrmerge QA error:
Date: Sat,  7 Nov 2020 17:24:37 +0100
Message-Id: <20201107162437.1786961-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201107162437.1786961-1-Martin.Jansa@gmail.com>
References: <20201107162437.1786961-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* respect udevdir variable
* with usrmerge cloud-init triggers QA error:
  ERROR: cloud-init-20.3-r0 do_package_qa: QA Issue: cloud-init package is not obeying usrmerge distro feature. /lib should be relocated to /usr. [usrmerge]
  ERROR: cloud-init-20.3-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.
  because of:
  /lib/udev/rules.d/66-azure-ephemeral.rules

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...01-setup.py-respect-udevdir-variable.patch | 42 +++++++++++++++++++
 .../cloud-init/cloud-init_20.3.bb             |  7 ++--
 2 files changed, 46 insertions(+), 3 deletions(-)
 create mode 100644 recipes-extended/cloud-init/cloud-init/0001-setup.py-respect-udevdir-variable.patch

diff --git a/recipes-extended/cloud-init/cloud-init/0001-setup.py-respect-udevdir-variable.patch b/recipes-extended/cloud-init/cloud-init/0001-setup.py-respect-udevdir-variable.patch
new file mode 100644
index 0000000..94ec98a
--- /dev/null
+++ b/recipes-extended/cloud-init/cloud-init/0001-setup.py-respect-udevdir-variable.patch
@@ -0,0 +1,42 @@
+From d7a6b8f765e9a08a8811331298e76ebd7a0c7076 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 7 Nov 2020 15:55:23 +0000
+Subject: [PATCH] setup.py respect udevdir variable
+
+* with usrmerge cloud-init triggers QA error:
+  ERROR: cloud-init-20.3-r0 do_package_qa: QA Issue: cloud-init package is not obeying usrmerge distro feature. /lib should be relocated to /usr. [usrmerge]
+  ERROR: cloud-init-20.3-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.
+  because of:
+  /lib/udev/rules.d/66-azure-ephemeral.rules
+
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ setup.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index cbacf48e..5e137a6d 100755
+--- a/setup.py
++++ b/setup.py
+@@ -142,6 +142,7 @@ INITSYS_ROOTS = {
+     'sysvinit_deb': 'etc/init.d',
+     'sysvinit_openrc': 'etc/init.d',
+     'sysvinit_suse': 'etc/init.d',
++    'udevdir': pkg_config_read('udev', 'udevdir'),
+     'systemd': pkg_config_read('systemd', 'systemdsystemunitdir'),
+     'systemd.generators': pkg_config_read('systemd',
+                                           'systemdsystemgeneratordir'),
+@@ -264,7 +265,7 @@ if not platform.system().endswith('BSD'):
+         (ETC + '/NetworkManager/dispatcher.d/',
+          ['tools/hook-network-manager']),
+         (ETC + '/dhcp/dhclient-exit-hooks.d/', ['tools/hook-dhclient']),
+-        (LIB + '/udev/rules.d', [f for f in glob('udev/*.rules')])
++        ('udevdir' + '/rules.d', [f for f in glob('udev/*.rules')])
+     ])
+ # Use a subclass for install that handles
+ # adding on the right init system configuration files
+-- 
+2.27.0
+
diff --git a/recipes-extended/cloud-init/cloud-init_20.3.bb b/recipes-extended/cloud-init/cloud-init_20.3.bb
index 53d71a6..b9efb31 100644
--- a/recipes-extended/cloud-init/cloud-init_20.3.bb
+++ b/recipes-extended/cloud-init/cloud-init_20.3.bb
@@ -6,9 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c6dd79b6ec2130a3364f6fa9d6380408"
 
 SRCREV = "1431c8a1bddaabf85e1bbb32bf316a3aef20036e"
 SRC_URI = "git://github.com/canonical/cloud-init \
-           file://cloud-init-source-local-lsb-functions.patch \
-           file://0001-setup.py-check-for-install-anywhere-in-args.patch \
-          "
+    file://cloud-init-source-local-lsb-functions.patch \
+    file://0001-setup.py-check-for-install-anywhere-in-args.patch \
+    file://0001-setup.py-respect-udevdir-variable.patch \
+"
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0

