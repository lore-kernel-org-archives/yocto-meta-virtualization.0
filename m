Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A04C05027
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 06:45:08 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.7399.1676875499777781883
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 19 Feb 2023 22:44:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l3bw4+E8;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id il18-20020a17090b165200b0023127b2d602so365839pjb.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 19 Feb 2023 22:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dZ6uhbyU4TBMXotSawXkZvn+z1EQmJqIRidenFDh+OE=;
        b=l3bw4+E80hJ14rV/pazoEhkoiz+CUIPjxXIWlBWgk+0pEZYLAK4wM3ydeca+54bUYl
         b+s+ulOvbqec1dElprGalfcgZxQIhk+bRSmbzCffPVYu/yIz0N9KLuxnopJqMx97ehxf
         WmxUC09FgILk1qnwLDMr4he5GmNxvJ7G7yUPSbDpO/xchOhjIKpSBzkeZOXWvWr3Bj5A
         TfxnVNrwnMg2xAP/Q/eJlil0GRzll5wNStwdRtDnThsbnKm3d0rpz7mkzcYZHtAabzSz
         AXRfXsuPZfBhK2wjD4+tjjL0zyoYL3Pzi2EL0FyMVg6h7tsOmCqqrv6TgyePt2rF0KUd
         tMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZ6uhbyU4TBMXotSawXkZvn+z1EQmJqIRidenFDh+OE=;
        b=SRl+nvaN222b0Q3vJihSHm3terrYikOMo1Pcigc/ylbeHk+rI5/ZrtT4Bf9LmhX/dS
         TlwySfY1k19O6QIxNlwYetcpOFsJyAZSjzUs7wsezs3uG0HyO1nNAayHZASjAi1Cs+qL
         +hhv6lJw5ibzvrQW647Yv7dN//uU/jXmMgf3+CJP/M26GPBP36YpCT1whW9HQuTzrzdO
         0QGQBolvuRGLuEIM1f9gbzTeaDoeYB4mxjKgHP0Wi3M/QNPO60HR6vIuLZehsGoH8U/1
         j+nKvIfgkSOvoRvwrtxcOXEgJQUYME61Q6OAjlriWpUrMtUdIEFbJHnj4AcmnSMVLRbN
         dT7w==
X-Gm-Message-State: AO0yUKUhYthxJUV7XOT1WYpt7LZxK5R7cyJ0m6r4eF4CKuY9FrxpAB7l
	2rgYlh72J8uY1tVlJcgnYczcKpP5k8JXOw==
X-Google-Smtp-Source: AK7set87b287SXq3tg1MC9ldTnAfjQlASsiKuy6awuLgWKIWNgpCo2JRkyHKpNkpmBRATz5fVBjDNw==
X-Received: by 2002:a17:902:f68f:b0:19c:1433:5fba with SMTP id l15-20020a170902f68f00b0019c14335fbamr710948plg.0.1676875498951;
        Sun, 19 Feb 2023 22:44:58 -0800 (PST)
Received: from localhost.localdomain ([122.171.165.129])
        by smtp.gmail.com with ESMTPSA id p23-20020a170902a41700b0018099c9618esm1976078plq.231.2023.02.19.22.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 22:44:58 -0800 (PST)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
To: meta-virtualization@lists.yoctoproject.org,
	virendrak@kpit.com
Cc: akash.hadke@kpit.com,
	bruce.ashfield@gmail.com,
	Omkar Patil <omkar.patil@kpit.com>
Subject: [meta-virtualization][dunfell][PATCH] lxc: Fix CVE-2022-47952
Date: Mon, 20 Feb 2023 12:14:49 +0530
Message-Id: <20230220064449.337-1-bindudaniel1996@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Feb 2023 06:45:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7885

From: Omkar Patil <omkar.patil@kpit.com>

lxc-user-nic install setuid root, and may allow local users to infer
whether any file exists, even within a protected directory tree, because
“Failed to open” often indicates that a file does not exist, whereas
“does not refer to a network namespace path” often indicates that a file
exists.

Reference: https://bugs.launchpad.net/ubuntu/+source/lxc/+bug/1783591

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
---
 .../lxc/files/CVE-2022-47952.patch            | 74 +++++++++++++++++++
 recipes-containers/lxc/lxc_4.0.9.bb           |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 recipes-containers/lxc/files/CVE-2022-47952.patch

diff --git a/recipes-containers/lxc/files/CVE-2022-47952.patch b/recipes-containers/lxc/files/CVE-2022-47952.patch
new file mode 100644
index 0000000..eca2ad6
--- /dev/null
+++ b/recipes-containers/lxc/files/CVE-2022-47952.patch
@@ -0,0 +1,74 @@
+From 1b0469530d7a38b8f8990e114b52530d1bf7f3b8 Mon Sep 17 00:00:00 2001
+From: Maher Azzouzi <maherazz04@gmail.com>
+Date: Sun, 25 Dec 2022 13:50:25 +0100
+Subject: [PATCH] Patching an incoming CVE (CVE-2022-47952)
+
+lxc-user-nic in lxc through 5.0.1 is installed setuid root, and may
+allow local users to infer whether any file exists, even within a
+protected directory tree, because "Failed to open" often indicates
+that a file does not exist, whereas "does not refer to a network
+namespace path" often indicates that a file exists. NOTE: this is
+different from CVE-2018-6556 because the CVE-2018-6556 fix design was
+based on the premise that "we will report back to the user that the
+open() failed but the user has no way of knowing why it failed";
+however, in many realistic cases, there are no plausible reasons for
+failing except that the file does not exist.
+
+PoC:
+> % ls /l
+> ls: cannot open directory '/l': Permission denied
+> % /usr/lib/x86_64-linux-gnu/lxc/lxc-user-nic delete lol lol /l/h/tt h h
+> cmd/lxc_user_nic.c: 1096: main: Failed to open "/l/h/tt" <----- file does not exist.
+> % /usr/lib/x86_64-linux-gnu/lxc/lxc-user-nic delete lol lol /l/h/t h h
+> cmd/lxc_user_nic.c: 1101: main: Path "/l/h/t" does not refer to a network namespace path <---- file exist!
+
+Signed-off-by: MaherAzzouzi <maherazz04@gmail.com>
+Acked-by: Serge Hallyn <serge@hallyn.com>
+
+Upstream-Status: Backport [https://github.com/lxc/lxc/commit/1b0469530d7a38b8f8990e114b52530d1bf7f3b8]
+CVE: CVE-2022-47952
+Comment: No Hunk refreshed
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+---
+ src/lxc/cmd/lxc_user_nic.c | 15 ++++++---------
+ 1 file changed, 6 insertions(+), 9 deletions(-)
+
+diff --git a/src/lxc/cmd/lxc_user_nic.c b/src/lxc/cmd/lxc_user_nic.c
+index a91e2259d5..69bc6f17d1 100644
+--- a/src/lxc/cmd/lxc_user_nic.c
++++ b/src/lxc/cmd/lxc_user_nic.c
+@@ -1085,20 +1085,17 @@ int main(int argc, char *argv[])
+ 	} else if (request == LXC_USERNIC_DELETE) {
+ 		char opath[LXC_PROC_PID_FD_LEN];
+ 
+-		/* Open the path with O_PATH which will not trigger an actual
+-		 * open(). Don't report an errno to the caller to not leak
+-		 * information whether the path exists or not.
+-		 * When stracing setuid is stripped so this is not a concern
+-		 * either.
+-		 */
++		// Keep in mind CVE-2022-47952: It's crucial not to leak any
++		// information whether open() succeeded of failed.
++
+ 		netns_fd = open(args.pid, O_PATH | O_CLOEXEC);
+ 		if (netns_fd < 0) {
+-			usernic_error("Failed to open \"%s\"\n", args.pid);
++			usernic_error("Failed while opening netns file for \"%s\"\n", args.pid);
+ 			_exit(EXIT_FAILURE);
+ 		}
+ 
+ 		if (!fhas_fs_type(netns_fd, NSFS_MAGIC)) {
+-			usernic_error("Path \"%s\" does not refer to a network namespace path\n", args.pid);
++			usernic_error("Failed while opening netns file for \"%s\"\n", args.pid);
+ 			close(netns_fd);
+ 			_exit(EXIT_FAILURE);
+ 		}
+@@ -1112,7 +1109,7 @@ int main(int argc, char *argv[])
+ 		/* Now get an fd that we can use in setns() calls. */
+ 		ret = open(opath, O_RDONLY | O_CLOEXEC);
+ 		if (ret < 0) {
+-			CMD_SYSERROR("Failed to open \"%s\"\n", args.pid);
++			CMD_SYSERROR("Failed while opening netns file for \"%s\"\n", args.pid);
+ 			close(netns_fd);
+ 			_exit(EXIT_FAILURE);
+ 		}
diff --git a/recipes-containers/lxc/lxc_4.0.9.bb b/recipes-containers/lxc/lxc_4.0.9.bb
index f7cab78..7240589 100644
--- a/recipes-containers/lxc/lxc_4.0.9.bb
+++ b/recipes-containers/lxc/lxc_4.0.9.bb
@@ -55,6 +55,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz \
         file://skip_rootfs_pinning_for_read_only_filesystem.patch \
         file://add_lxc_init_groups_config_key.patch \
         file://lxc-conf-improve-read-only-sys-with-read-write-sys-devic.patch \
+        file://CVE-2022-47952.patch \
 	"
 
 SRC_URI[md5sum] = "365fcca985038910e19a1e0fff15ed07"
-- 
2.17.1


