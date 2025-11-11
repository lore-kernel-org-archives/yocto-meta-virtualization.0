Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C99CCF9E3
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 08:41:17 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13261.1762850473046193008
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 11 Nov 2025 00:41:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KPkv06wy;
 spf=pass (domain: mvista.com, ip: 209.85.210.172, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso3195006b3a.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 11 Nov 2025 00:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1762850472; x=1763455272; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RNe4hOITl5W1+Io5bIj+d2SUwaC2By6xuTWIbWls90g=;
        b=KPkv06wyZ0os+woeNjPddbMaAnoQclbbMvfUGfJU6ysKCHkTdaoGeGB6LlR1ovQmzo
         Um/9JDVQR2V0mnpI+bj511IftFZUCSIQe2SxaiKwi/MsGp7l2WjvBkHkY4qIMVUsD/cE
         bhBcTvcR+biswBRhDTpKU3rVE9wfGR8R1uW1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762850472; x=1763455272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNe4hOITl5W1+Io5bIj+d2SUwaC2By6xuTWIbWls90g=;
        b=opMQKXQYwqtdCQxSu4QEsgdBe3Lzr/bbFIi+D8dr9IadxZv0+eImJrbX/CmQVflQ1B
         nAj4Fe09Iic6h3/K/cCpslkn/tTjolw8X98yk/hfc3707Z1oR3Row54cAh3ZkfHD2MPa
         q6cRltyvOUE3RFr7yiyS4BnFaaDuwIqSm/4e1eEHFzU0KJ3gb16Lcp2r1dEP3XLlJREN
         PS/ORHIw4OYGxWAW8+eN2NEJkt1l22zv30sV7eJQNkzEc/kMDJVYGjUjteNWbGXHDUmU
         e/kboOmLQSVRT1ue6kbORxhdt8TJPmC0Foz8yn+vM64Q4KDzVPx8h/wBBktJOMeS3oN1
         8zAA==
X-Gm-Message-State: AOJu0YzNwJ1NCL9y4T62lCfaVZDwrDHoY8qONkNl3QpCVMJC5i9+4Nag
	Ak/KNoy3WV+s1J2OGiVUTLTXwTunolVu1C7pKkA/TjeosxZeUNOlMy0AAw2RxrpIUA+VEkBPbmC
	gylGw
X-Gm-Gg: ASbGncuB/JUSoGvYKkqHKeetPINqkcxt4kQBDKQkmrWm9E3yoUTBTQsNzXu0Sg9rLuR
	d1tJDvYr/x8Eg7AzYf2nwQjYZIqnJrcx4iKdl5IWt2SHXdysBMkqaLLyDXARtKfFrV53Si7+bqC
	vrD5wJ9PMXwAAl78Scfpmk6/Qsih42oMu3dWlxoDMFid8CeKsM2IFXvmdInqQHP1W40y1L37Syp
	GW6kS6PwxNN5BvsRB9WK7Lt7fIiPzjOYtmXV9Tpt5Rq6oQb26sYHSb9glUBvH89qN6OcXXKpSCB
	vg+3kaw9gF+ruIZ+qlfxGF9NsP4D5zI2kglr/eOnvfsxNNlLZaa2p0k/l2iSlNoFwLWestujWmW
	f+oaf88VqdnJOrDKrvju1idnNyFZHNce9yZOrDw+N3GP634NgLAWoET7AI2WHTxhNIDklHw6pIq
	TfhdfEaYoZuBM+3m71lM3JGA==
X-Google-Smtp-Source: AGHT+IGr6iL4JlCoBPtgnXJvJd8G1wyTPQ3LjyjOgT9xnnDBpCoMpB5SnVnbiP2UjBLtxA3sJlh6tg==
X-Received: by 2002:a05:6a20:2585:b0:350:31b3:219c with SMTP id adf61e73a8af0-353a375f4ddmr15656727637.31.1762850471814;
        Tue, 11 Nov 2025 00:41:11 -0800 (PST)
Received: from MVIN00352.mvista.com ([2401:4900:8fcc:9fc0:328:7d88:e6f4:1f4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc17a252sm14855407b3a.41.2025.11.11.00.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 00:41:11 -0800 (PST)
From: Vijay Anusuri <vanusuri@mvista.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [meta-vitualization][scarthgap][patch] cloud-init: Fix CVE-2024-11584
Date: Tue, 11 Nov 2025 14:11:02 +0530
Message-ID: <20251111084102.149727-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 11 Nov 2025 08:41:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9438

import patch from debian to fix
 CVE-2024-11584

Upstream-Status: Backport [import from debian 22.4.2-1+deb12u3
Upstream commit
https://github.com/canonical/cloud-init/commit/8b45006c4765fd75f20ce244571b563dbc49d4f2]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../cloud-init/CVE-2024-11584.patch           | 104 ++++++++++++++++++
 recipes-extended/cloud-init/cloud-init_git.bb |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 recipes-extended/cloud-init/cloud-init/CVE-2024-11584.patch

diff --git a/recipes-extended/cloud-init/cloud-init/CVE-2024-11584.patch b/recipes-extended/cloud-init/cloud-init/CVE-2024-11584.patch
new file mode 100644
index 00000000..fa94ff53
--- /dev/null
+++ b/recipes-extended/cloud-init/cloud-init/CVE-2024-11584.patch
@@ -0,0 +1,104 @@
+From 8b45006c4765fd75f20ce244571b563dbc49d4f2 Mon Sep 17 00:00:00 2001
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
+ systemd/cloud-init-hotplugd.service | 2 +-
+ systemd/cloud-init-hotplugd.socket  | 5 +++--
+ tools/cloud-init-hotplugd           | 2 +-
+ tools/hook-hotplug                  | 2 +-
+ 5 files changed, 7 insertions(+), 8 deletions(-)
+
+diff --git a/cloudinit/cmd/devel/logs.py b/cloudinit/cmd/devel/logs.py
+index 83f574c10..f59e8047c 100755
+--- a/cloudinit/cmd/devel/logs.py
++++ b/cloudinit/cmd/devel/logs.py
+@@ -139,9 +139,7 @@ def get_parser(parser=None):
+ 
+ def _copytree_rundir_ignore_files(curdir, files):
+     """Return a list of files to ignore for /run/cloud-init directory"""
+-    ignored_files = [
+-        "hook-hotplug-cmd",  # named pipe for hotplug
+-    ]
++    ignored_files = []
+     if os.getuid() != 0:
+         # Ignore root-permissioned files
+         ignored_files.append(Paths({}).lookups["instance_data_sensitive"])
+diff --git a/systemd/cloud-init-hotplugd.service b/systemd/cloud-init-hotplugd.service
+index 0aeeeaff5..e3a5a74d9 100644
+--- a/systemd/cloud-init-hotplugd.service
++++ b/systemd/cloud-init-hotplugd.service
+@@ -1,5 +1,5 @@
+ # Paired with cloud-init-hotplugd.socket to read from the FIFO
+-# /run/cloud-init/hook-hotplug-cmd which is created during a udev network
++# hook-hotplug-cmd which is created during a udev network
+ # add or remove event as processed by 90-cloud-init-hook-hotplug.rules.
+ 
+ # On start, read args from the FIFO, process and provide structured arguments
+diff --git a/systemd/cloud-init-hotplugd.socket b/systemd/cloud-init-hotplugd.socket
+index acf53f12c..00ad5dead 100644
+--- a/systemd/cloud-init-hotplugd.socket
++++ b/systemd/cloud-init-hotplugd.socket
+@@ -1,5 +1,5 @@
+ # cloud-init-hotplugd.socket listens on the FIFO file
+-# /run/cloud-init/hook-hotplug-cmd which is created during a udev network
++# hook-hotplug-cmd which is created during a udev network
+ # add or remove event as processed by 90-cloud-init-hook-hotplug.rules.
+ 
+ # Known bug with an enforcing SELinux policy: LP: #1936229
+@@ -7,7 +7,8 @@
+ Description=cloud-init hotplug hook socket
+ 
+ [Socket]
+-ListenFIFO=/run/cloud-init/hook-hotplug-cmd
++ListenFIFO=/run/cloud-init/share/hook-hotplug-cmd
++SocketMode=0600
+ 
+ [Install]
+ WantedBy=cloud-init.target
+diff --git a/tools/cloud-init-hotplugd b/tools/cloud-init-hotplugd
+index 70977d48e..3d56fffa7 100755
+--- a/tools/cloud-init-hotplugd
++++ b/tools/cloud-init-hotplugd
+@@ -9,7 +9,7 @@
+ # upon a network device event). Anything received via the pipe is then
+ # passed on via the "cloud-init devel hotplug-hook handle" command.
+ 
+-PIPE="/run/cloud-init/hook-hotplug-cmd"
++PIPE="/run/cloud-init/share/hook-hotplug-cmd"
+ 
+ mkfifo -m700 $PIPE
+ 
+diff --git a/tools/hook-hotplug b/tools/hook-hotplug
+index 3085ba86d..f7d530d1c 100755
+--- a/tools/hook-hotplug
++++ b/tools/hook-hotplug
+@@ -10,7 +10,7 @@ is_finished() {
+ 
+ if is_finished; then
+     # open cloud-init's hotplug-hook fifo rw
+-    exec 3<>/run/cloud-init/hook-hotplug-cmd
++    exec 3<>/run/cloud-init/share/hook-hotplug-cmd
+     env_params=" \
+         --subsystem=${SUBSYSTEM} \
+         handle \
+-- 
+2.43.0
+
diff --git a/recipes-extended/cloud-init/cloud-init_git.bb b/recipes-extended/cloud-init/cloud-init_git.bb
index 4cf74efd..66462a51 100644
--- a/recipes-extended/cloud-init/cloud-init_git.bb
+++ b/recipes-extended/cloud-init/cloud-init_git.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/canonical/cloud-init;branch=24.1.x;protocol=https \
     file://cloud-init-source-local-lsb-functions.patch \
     file://0001-setup.py-check-for-install-anywhere-in-args.patch \
     file://CVE-2024-6174.patch \
+    file://CVE-2024-11584.patch \
 "
 
 PV = "v23.4.1+git"
-- 
2.43.0


