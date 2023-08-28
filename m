Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A909CC71153
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 14:39:19 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.15648.1693233555822987593
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 07:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=jnj/vd0z;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so8785037a12.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Aug 2023 07:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693233554; x=1693838354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X9RhC9OVuvJza4s+UgBQLoNjkjixQUXJKxXQM1w3pgw=;
        b=jnj/vd0zwUOqZom61sblTayMpe1YdWYbzWupKX9soyUfN3WHdjpIK47pbI4vIfRDNz
         AZL+f0i0d/I4dnuZz8bFcvALTAnPefOmnQvIPT0H3SL2UiAoOcXI7kaAaQgZT65wnTwc
         ScwcZl9ijmizPy1joDxPN4Olbl26PfjtYZA6kbn2CTQ9rr6HvUn0XFB62DPEr5eaPkZK
         GY+t/Va5UrJwQBjklx9rATCRvFWfq3NCmXOob4EPf2Rs+/NiAC7APw9kxpahjWpvovzi
         Cm4Pk9R+8kcmQvn09yeq0CPSOqw+Fek40mvKN+Ky+Ym3iwuvxhoXS8xq3qa5lAiWRlB1
         wWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693233554; x=1693838354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X9RhC9OVuvJza4s+UgBQLoNjkjixQUXJKxXQM1w3pgw=;
        b=Ioz3OAZ8wkbEzinfDRRCIVqzkTZvMNYAS5OvGXWP6E38I8R+hvMDjiOVRMAqiFJZ7W
         z2o1l/B951rf7cKWsXYgI2mMuDWqfwLSs3vf1sqnMmh0zmqlHPGi/XvNTKnq6Kawo4C8
         4Blg/DskF1vKHU/AHDO+tmPOzZWdVBEoPQQqtPcURvpuExOw+naIOmh+SFOLUjv/NhnR
         6SUJYphkf0W+GA/iQoh9MVohufZUQH9/lsUBnSAN324LTpcvNtX1STqqYj0dq7S6DaOY
         WWvparS5YGTlh9+x1VSl813nDWgksNpSgtYFRlqWc2KJE/IEhHnBaJCQ8EBL0O82/v+w
         3bJg==
X-Gm-Message-State: AOJu0Ywio6SL3N4tfiDuZ+gJzREZfby2wcR+XTY6igDSAZEs1gqu+VhG
	QSRDC5iv9k/NUPjq/TZBAxQHBXOg5YE=
X-Google-Smtp-Source: AGHT+IGvm5ug/JnoK3Oe+ObDf3/WQ0rvz3gQlsspExLxrPD6ojp2WKTghuNPQAqZZhdCsi1w10n+Tg==
X-Received: by 2002:a05:6402:440f:b0:525:4696:336d with SMTP id y15-20020a056402440f00b005254696336dmr31136202eda.8.1693233554030;
        Mon, 28 Aug 2023 07:39:14 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n25-20020aa7c459000000b005259dd903e5sm4487923edr.67.2023.08.28.07.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 07:39:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] cloud-init: bump SRCREV to fix update to 23.2.2
Date: Mon, 28 Aug 2023 16:38:56 +0200
Message-ID: <20230828143856.549539-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Aug 2023 14:39:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8247

* the update from
  commit 0f1601d98f2c926a109b7beb7df21a5dfe6188d9
  Author: Bruce Ashfield <bruce.ashfield@gmail.com>
  Date:   Thu Aug 3 20:15:04 2023 +0000
  Subject: cloud-init: update to 23.2.2

    Bumping cloud-init to version 23.2.2, which comprises the following commits:

        e65a715d Release 23.2.2

  was missing the SRCREV update, so it was still 23.1:

  cloud-init/v23.2.2+git/git $ git describe --tags
  23.1-52-ge02c46079

  fix that by using the right one of the 23.2.2 tag:

  cloud-init/v23.2.2+git/git $ git show-ref -d 23.2.2
  293c6546f038ef4da98910dfeb8d0ade65707952 refs/tags/23.2.2
  e65a715d524456285e07ac521457424713ea4aa5 refs/tags/23.2.2^{}

* this fix also allows up to drop the patch backported from 23.2

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...-pkg-config-for-udev-rules-path-2137.patch | 50 -------------------
 recipes-extended/cloud-init/cloud-init_git.bb |  3 +-
 2 files changed, 1 insertion(+), 52 deletions(-)
 delete mode 100644 recipes-extended/cloud-init/cloud-init/0002-setup.py-use-pkg-config-for-udev-rules-path-2137.patch

diff --git a/recipes-extended/cloud-init/cloud-init/0002-setup.py-use-pkg-config-for-udev-rules-path-2137.patch b/recipes-extended/cloud-init/cloud-init/0002-setup.py-use-pkg-config-for-udev-rules-path-2137.patch
deleted file mode 100644
index 9f3760c..0000000
--- a/recipes-extended/cloud-init/cloud-init/0002-setup.py-use-pkg-config-for-udev-rules-path-2137.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 57752970ebea017820343aadf11b65c537bef336 Mon Sep 17 00:00:00 2001
-From: dankm <dan.mcgregor@usask.ca>
-Date: Fri, 28 Apr 2023 15:10:34 -0600
-Subject: [PATCH] setup.py: use pkg-config for udev/rules path (#2137)
-
-Distributions other than RHEL also use /usr/lib/udev for the rules
-path. Instead of hardcoding the udev rules path for RedHat, check
-pkg-config for the proper location.
-
-Upstream-Status: Backport [23.2 https://github.com/canonical/cloud-init/commit/5abf5f5f2cf93c57ac74220251d2a2acce5f7099]
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- setup.py | 14 ++++++++------
- 1 file changed, 8 insertions(+), 6 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index a6dbc5c23..66e618d3a 100644
---- a/setup.py
-+++ b/setup.py
-@@ -46,7 +46,10 @@ def pkg_config_read(library, var):
-             "systemdsystemconfdir": "/etc/systemd/system",
-             "systemdsystemunitdir": "/lib/systemd/system",
-             "systemdsystemgeneratordir": "/lib/systemd/system-generators",
--        }
-+        },
-+        "udev": {
-+            "udevdir": "/lib/udev",
-+        },
-     }
-     cmd = ["pkg-config", "--variable=%s" % var, library]
-     try:
-@@ -309,14 +312,13 @@ data_files = [
-     ),
- ]
- if not platform.system().endswith("BSD"):
--
--    RULES_PATH = LIB
--    if os.path.isfile("/etc/redhat-release"):
--        RULES_PATH = "/usr/lib"
-+    RULES_PATH = pkg_config_read("udev", "udevdir")
-+    if not in_virtualenv():
-+        RULES_PATH = "/" + RULES_PATH
- 
-     data_files.extend(
-         [
--            (RULES_PATH + "/udev/rules.d", [f for f in glob("udev/*.rules")]),
-+            (RULES_PATH + "/rules.d", [f for f in glob("udev/*.rules")]),
-             (
-                 ETC + "/systemd/system/sshd-keygen@.service.d/",
-                 ["systemd/disable-sshd-keygen-if-cloud-init-active.conf"],
diff --git a/recipes-extended/cloud-init/cloud-init_git.bb b/recipes-extended/cloud-init/cloud-init_git.bb
index b5c2d71..9d84f47 100644
--- a/recipes-extended/cloud-init/cloud-init_git.bb
+++ b/recipes-extended/cloud-init/cloud-init_git.bb
@@ -7,11 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c6dd79b6ec2130a3364f6fa9d6380408 \
     file://LICENSE-Apache2.0;md5=3b83ef96387f14655fc854ddc3c6bd57 \
 "
 
-SRCREV = "e02c4607923af64311c70ae9a06d6794355e9a61"
+SRCREV = "293c6546f038ef4da98910dfeb8d0ade65707952"
 SRC_URI = "git://github.com/canonical/cloud-init;branch=23.2.x;protocol=https \
     file://cloud-init-source-local-lsb-functions.patch \
     file://0001-setup.py-check-for-install-anywhere-in-args.patch \
-    file://0002-setup.py-use-pkg-config-for-udev-rules-path-2137.patch \
 "
 
 PV = "v23.2.2+git"
-- 
2.42.0


