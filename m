Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 106DDEB64DD
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 11:22:03 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.105279.1692012112840468115
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Aug 2023 04:21:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=lL4hWvJA;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-523100882f2so5528514a12.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Aug 2023 04:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692012111; x=1692616911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFKGQhTir6rwwJYN4ADFKBkXEs5/bP6ZQXKX93vQe8o=;
        b=lL4hWvJAPPPjtelDVJ0/VUmtuNrMaHQo3C/WCubXC9Z4PAjQ2aP08UPvjPfDTKLBtv
         gH4W+/RBC1z65pu5Q6/8OUpb6E9pWSEnzqvjzjXxVpac48hWQ7lKh9lM8LanBCKGK0rf
         JdtL8yaj4jwINrvo3IJObTEPyZ8rbcG4LAlEr526GrHeA+n5Tpu/mm0LI8vaK16eYNcy
         I8EaP9ZU1uM4mCICh56F18JEywDqp8TJyc44srawhjlLcTop6Zh/N7kwJbH6XL6Tces2
         oUBgz5lRNumX5hqgAVub8liSPTos4MrjS3BU5q048YtqhKyXsADzRl8j3PGr/D3tkEyG
         IfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692012111; x=1692616911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bFKGQhTir6rwwJYN4ADFKBkXEs5/bP6ZQXKX93vQe8o=;
        b=lgZPT3RFYmdfp0ihsHLneYI0PyvH68HPzIW+N1V97VztWzqWfDZV+JogkYCiYSksRO
         Tiwah1nfzeUYnlODopUPMdUPG5WIlM3ALvxlV7KlQEdmf61tMgYmxgxr1QHggNoxQsyO
         0Rd2f7+RzUN2BBdR4LJKNfrjngotTTlfypj+kI57b7iHzcUQJKAlCie7Lit4dLH7CAI2
         T1/7ryqOWEH9nt96UXAZa6gQDL3GWmHRJC5zLDCUHAbXHUvXIKDPk689vdVTHADbvKKM
         CgRqSKk62DUI/3MJPoXksJLnu1RDvoBQceBKCF20MCmFNZh4M1jSetaFvLrWym/F9UQT
         7vAw==
X-Gm-Message-State: AOJu0Yyevgl89teLfdqFvUN7CDl6DlnV/p8r2yozKm4DpyhyvI7CRK3Y
	HwFQs03qMTDHaj3OFGdxgm0BsrJ6fGM=
X-Google-Smtp-Source: AGHT+IE9z+m1c5RgDCbEzbNyzLwC4PbyklMFpSIG19TuEwW/+SaVjua3yjLK19RYYTZRga7kohim6g==
X-Received: by 2002:a05:6402:138a:b0:522:3ce6:4473 with SMTP id b10-20020a056402138a00b005223ce64473mr7324351edv.16.1692012111258;
        Mon, 14 Aug 2023 04:21:51 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id v17-20020aa7d9d1000000b0052563bff34bsm1433119eds.63.2023.08.14.04.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 04:21:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [master-next][PATCH 3/3] cloud-init: fix usrmerge QA issue
Date: Mon, 14 Aug 2023 13:21:40 +0200
Message-ID: <20230814112140.1048354-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230814112140.1048354-1-Martin.Jansa@gmail.com>
References: <20230814112140.1048354-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Aug 2023 11:22:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8182

* backport a fix from 23.2 version (notice that the recipe claims to be:
  v23.2.2+git, but the commit in master-next which updated PV only changed
  the branch name, not the SRCREV, so it's still 23.1 and missing this fix

  cloud-init/v23.2.2+git/git $ git describe --tags
  23.1-53-g57752970e

* fixes:
  ERROR: cloud-init-v23.2.2+git-r0 do_package_qa: QA Issue: cloud-init package is not obeying usrmerge distro feature. /lib should be relocated to /usr. [usrmerge]

  caused by udev rules:
  $ find cloud-init/v23.2.2+git/image/lib/
  cloud-init/v23.2.2+git/image/lib/
  cloud-init/v23.2.2+git/image/lib/udev
  cloud-init/v23.2.2+git/image/lib/udev/rules.d
  cloud-init/v23.2.2+git/image/lib/udev/rules.d/66-azure-ephemeral.rules

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...-pkg-config-for-udev-rules-path-2137.patch | 50 +++++++++++++++++++
 recipes-extended/cloud-init/cloud-init_git.bb |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 recipes-extended/cloud-init/cloud-init/0002-setup.py-use-pkg-config-for-udev-rules-path-2137.patch

diff --git a/recipes-extended/cloud-init/cloud-init/0002-setup.py-use-pkg-config-for-udev-rules-path-2137.patch b/recipes-extended/cloud-init/cloud-init/0002-setup.py-use-pkg-config-for-udev-rules-path-2137.patch
new file mode 100644
index 0000000..9f3760c
--- /dev/null
+++ b/recipes-extended/cloud-init/cloud-init/0002-setup.py-use-pkg-config-for-udev-rules-path-2137.patch
@@ -0,0 +1,50 @@
+From 57752970ebea017820343aadf11b65c537bef336 Mon Sep 17 00:00:00 2001
+From: dankm <dan.mcgregor@usask.ca>
+Date: Fri, 28 Apr 2023 15:10:34 -0600
+Subject: [PATCH] setup.py: use pkg-config for udev/rules path (#2137)
+
+Distributions other than RHEL also use /usr/lib/udev for the rules
+path. Instead of hardcoding the udev rules path for RedHat, check
+pkg-config for the proper location.
+
+Upstream-Status: Backport [23.2 https://github.com/canonical/cloud-init/commit/5abf5f5f2cf93c57ac74220251d2a2acce5f7099]
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ setup.py | 14 ++++++++------
+ 1 file changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index a6dbc5c23..66e618d3a 100644
+--- a/setup.py
++++ b/setup.py
+@@ -46,7 +46,10 @@ def pkg_config_read(library, var):
+             "systemdsystemconfdir": "/etc/systemd/system",
+             "systemdsystemunitdir": "/lib/systemd/system",
+             "systemdsystemgeneratordir": "/lib/systemd/system-generators",
+-        }
++        },
++        "udev": {
++            "udevdir": "/lib/udev",
++        },
+     }
+     cmd = ["pkg-config", "--variable=%s" % var, library]
+     try:
+@@ -309,14 +312,13 @@ data_files = [
+     ),
+ ]
+ if not platform.system().endswith("BSD"):
+-
+-    RULES_PATH = LIB
+-    if os.path.isfile("/etc/redhat-release"):
+-        RULES_PATH = "/usr/lib"
++    RULES_PATH = pkg_config_read("udev", "udevdir")
++    if not in_virtualenv():
++        RULES_PATH = "/" + RULES_PATH
+ 
+     data_files.extend(
+         [
+-            (RULES_PATH + "/udev/rules.d", [f for f in glob("udev/*.rules")]),
++            (RULES_PATH + "/rules.d", [f for f in glob("udev/*.rules")]),
+             (
+                 ETC + "/systemd/system/sshd-keygen@.service.d/",
+                 ["systemd/disable-sshd-keygen-if-cloud-init-active.conf"],
diff --git a/recipes-extended/cloud-init/cloud-init_git.bb b/recipes-extended/cloud-init/cloud-init_git.bb
index f07bcf7..b5c2d71 100644
--- a/recipes-extended/cloud-init/cloud-init_git.bb
+++ b/recipes-extended/cloud-init/cloud-init_git.bb
@@ -11,6 +11,7 @@ SRCREV = "e02c4607923af64311c70ae9a06d6794355e9a61"
 SRC_URI = "git://github.com/canonical/cloud-init;branch=23.2.x;protocol=https \
     file://cloud-init-source-local-lsb-functions.patch \
     file://0001-setup.py-check-for-install-anywhere-in-args.patch \
+    file://0002-setup.py-use-pkg-config-for-udev-rules-path-2137.patch \
 "
 
 PV = "v23.2.2+git"
-- 
2.41.0


