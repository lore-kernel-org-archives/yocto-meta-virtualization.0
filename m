Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF5ECD6E73
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 14:26:29 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25029.1763043987050278169
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 06:26:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=LYzsTkQJ;
 spf=pass (domain: mvista.com, ip: 209.85.210.173, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-782e93932ffso713619b3a.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 13 Nov 2025 06:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1763043986; x=1763648786; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H0Qr5QpHxdrkASJ9hfc1ZeDSmxDKttuAwJ87qkxgNJY=;
        b=LYzsTkQJW+E1iOJzxVgOCFTLmBu+uD4GvR/Zi+AD3oZBGm4YcBHGi29WA60z2YQNf6
         jhBWLO6L4/HAuZYQnU3FSSaTc9tYFyLbDZHjmpFnlZI6Kzyg8jqz6BuCs5NQCMHPcE83
         pQfh+Eqre9TTwTPOOa6mdEGotbVwovvUqOrQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763043986; x=1763648786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0Qr5QpHxdrkASJ9hfc1ZeDSmxDKttuAwJ87qkxgNJY=;
        b=TXk5Q8jelL+OfVa2vnCe4/w0ex1ms4+xUdV5IqiUTVDCENwqx+iiNMZYkslCQy/jj7
         P9QWOOGkmndM6wHrAER7uTMutKgewX7wisNse9kjYngw4j/+DsRupRix/ufH315sQ/Ck
         r4LrGYEwS4ocnrBsgQdKp4FjNS3DS6KjhYWAY/cWwDuuGg4keVY6pfjheLTCyqMzATFM
         JEBFiLNKHfZgn5BZdn1pKfgBniilRP35GhZ3B1wg5hnYJNOo7kqVnvfzTn7jRdSImCHN
         FQqvweqKmWqvrMUKPJNlNqcPq3F0S9MQ8cFRO2rPNnCyzhC3P6QV67E4pBdneqKV6EK3
         D8NA==
X-Gm-Message-State: AOJu0YyghiTEOO/Z9dowWCfcosoTRedga8OsTHX/K1R4Hp1WXva8iYq3
	sXhsSJXa36ZSfGscNBqGq4HpEQMtC9EGBaFPLuhFqyTsO241gMaLzPRi7WbuZQOj0tt/S08MRu6
	dtxUl
X-Gm-Gg: ASbGncsiNB6JcDTFlcEU1GtIDzQHjJw86DDXc8dVVo1LUyQHp1qbAJF61Wr+OGVvHIe
	celKFb4Wr1y18xdEMQcBK2X5YyGIaN3TESdz/reZI6i8jcKLxRSXnAcPtujPapThmm0pi8rrNY4
	pmzIHMojS1eNShNOC46yROkgu76YQae1NYsShAdFjoELl78ASpWLTGDfyMIk9xMOvM1qt+0XrY9
	iwm7cL7TLpj1MxIrqIoUwO6WdL8tBXkkcapa4FEod+gZTqCiTO0mN1u6czb7Ap4H9hWla9ct51c
	miLTd9FounMVDLnsUeeyFRBWskbok/jYvXDIbncoBRTAAwGj8xApECi/GBKzqZ7jrP0qmGZNXga
	B+VLm21wvuh4AzHL58EYRxRJy/JNQiKnCjjaeznjk8DAxp3nVBQcGTxWvUfhDoMcWWkSKYVKc/L
	NEi5gNhPdBFDYf
X-Google-Smtp-Source: AGHT+IFc2ufPjs1vazm8wI7RuGgmx88opsuROMrloqAGoJXx0PbW7fn1LQQGRC6HUAYIz7/40WVStQ==
X-Received: by 2002:a05:6a20:2447:b0:33e:eb7a:4465 with SMTP id adf61e73a8af0-35909f6d433mr8601709637.22.1763043985895;
        Thu, 13 Nov 2025 06:26:25 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:8fcc:9fc0:90f5:815:6543:22e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc375081023sm2404189a12.21.2025.11.13.06.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 06:26:25 -0800 (PST)
From: vanusuri@mvista.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [meta-virtualization][kirkstone][PATCH] cloud-init: Fix CVE-2024-11584
Date: Thu, 13 Nov 2025 19:56:17 +0530
Message-Id: <20251113142617.2403672-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 13 Nov 2025 14:26:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9439

From: Vijay Anusuri <vanusuri@mvista.com>

import patch from debian to fix
 CVE-2024-11584

Upstream-Status: Backport [import from debian 22.4.2-1+deb12u3
Upstream commit
https://github.com/canonical/cloud-init/commit/8b45006c4765fd75f20ce244571b563dbc49d4f2]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../cloud-init/CVE-2024-11584.patch           | 95 +++++++++++++++++++
 .../cloud-init/cloud-init_21.4.bb             |  1 +
 2 files changed, 96 insertions(+)
 create mode 100644 recipes-extended/cloud-init/cloud-init/CVE-2024-11584.patch

diff --git a/recipes-extended/cloud-init/cloud-init/CVE-2024-11584.patch b/recipes-extended/cloud-init/cloud-init/CVE-2024-11584.patch
new file mode 100644
index 00000000..aba34a0a
--- /dev/null
+++ b/recipes-extended/cloud-init/cloud-init/CVE-2024-11584.patch
@@ -0,0 +1,95 @@
+From 4839736429e9057a309ccd835cb3159fb51b1353 Mon Sep 17 00:00:00 2001
+From: James Falcon <therealfalcon@gmail.com>
+Date: Wed, 11 Jun 2025 16:22:32 -0500
+Subject: [PATCH] fix: Make hotplug socket writable only by root (#25)
+
+The 'hook-hotplug-cmd' was writable by all users, allowing any user
+to trigger the hotplug hook script. This script should only be run
+by root via a udev trigger.
+
+Also move socket into 'share' directory and update references
+accordingly. Since the 'share' directory is only readable by root,
+this adds another layer of security while also being in a consistent
+location with the other sockets used by cloud-init.
+
+CVE-2024-11584
+
+Upstream-Status: Backport [import from debain 22.4.2-1+deb12u3
+Upstream commit https://github.com/canonical/cloud-init/commit/8b45006c4765fd75f20ce244571b563dbc49d4f2]
+CVE: CVE-2024-11584
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ cloudinit/cmd/devel/logs.py         | 4 +---
+ systemd/cloud-init-hotplugd.service | 5 +++--
+ systemd/cloud-init-hotplugd.socket  | 8 +++++---
+ tools/hook-hotplug                  | 2 +-
+ 4 files changed, 10 insertions(+), 9 deletions(-)
+
+diff --git a/cloudinit/cmd/devel/logs.py b/cloudinit/cmd/devel/logs.py
+index d54b809ac..0830610d4 100644
+--- a/cloudinit/cmd/devel/logs.py
++++ b/cloudinit/cmd/devel/logs.py
+@@ -67,9 +67,7 @@ def get_parser(parser=None):
+ 
+ def _copytree_rundir_ignore_files(curdir, files):
+     """Return a list of files to ignore for /run/cloud-init directory"""
+-    ignored_files = [
+-        "hook-hotplug-cmd",  # named pipe for hotplug
+-    ]
++    ignored_files = []
+     if os.getuid() != 0:
+         # Ignore root-permissioned files
+         ignored_files.append(INSTANCE_JSON_SENSITIVE_FILE)
+diff --git a/systemd/cloud-init-hotplugd.service b/systemd/cloud-init-hotplugd.service
+index b64632efe..65243ff16 100644
+--- a/systemd/cloud-init-hotplugd.service
++++ b/systemd/cloud-init-hotplugd.service
+@@ -1,6 +1,7 @@
+ # Paired with cloud-init-hotplugd.socket to read from the FIFO
+-# /run/cloud-init/hook-hotplug-cmd which is created during a udev network
+-# add or remove event as processed by 10-cloud-init-hook-hotplug.rules.
++# /run/cloud-init/share/hook-hotplug-cmd which is created during a
++# udev network add or remove event as processed by
++# 10-cloud-init-hook-hotplug.rules.
+ 
+ # On start, read args from the FIFO, process and provide structured arguments
+ # to `cloud-init devel hotplug-hook` which will setup or teardown network
+diff --git a/systemd/cloud-init-hotplugd.socket b/systemd/cloud-init-hotplugd.socket
+index aa0930163..db83a65b2 100644
+--- a/systemd/cloud-init-hotplugd.socket
++++ b/systemd/cloud-init-hotplugd.socket
+@@ -1,13 +1,15 @@
+ # cloud-init-hotplugd.socket listens on the FIFO file
+-# /run/cloud-init/hook-hotplug-cmd which is created during a udev network
+-# add or remove event as processed by 10-cloud-init-hook-hotplug.rules.
++# /run/cloud-init/share/hook-hotplug-cmd which is created during a
++# udev network add or remove event as processed by
++# 10-cloud-init-hook-hotplug.rules.
+ 
+ # Known bug with an enforcing SELinux policy: LP: #1936229
+ [Unit]
+ Description=cloud-init hotplug hook socket
+ 
+ [Socket]
+-ListenFIFO=/run/cloud-init/hook-hotplug-cmd
++ListenFIFO=/run/cloud-init/share/hook-hotplug-cmd
++SocketMode=0600
+ 
+ [Install]
+ WantedBy=cloud-init.target
+diff --git a/tools/hook-hotplug b/tools/hook-hotplug
+index 35bd3da27..2a2ed4813 100755
+--- a/tools/hook-hotplug
++++ b/tools/hook-hotplug
+@@ -10,7 +10,7 @@ is_finished() {
+ 
+ if is_finished; then
+     # open cloud-init's hotplug-hook fifo rw
+-    exec 3<>/run/cloud-init/hook-hotplug-cmd
++    exec 3<>/run/cloud-init/share/hook-hotplug-cmd
+     env_params=(
+         --subsystem="${SUBSYSTEM}"
+         handle
+-- 
+2.25.1
+
diff --git a/recipes-extended/cloud-init/cloud-init_21.4.bb b/recipes-extended/cloud-init/cloud-init_21.4.bb
index 02a89a58..46c0d29a 100644
--- a/recipes-extended/cloud-init/cloud-init_21.4.bb
+++ b/recipes-extended/cloud-init/cloud-init_21.4.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://github.com/canonical/cloud-init;branch=main;protocol=https \
     file://0001-setup.py-check-for-install-anywhere-in-args.patch \
     file://0001-setup.py-respect-udevdir-variable.patch \
     file://CVE-2024-6174.patch \
+    file://CVE-2024-11584.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.25.1


