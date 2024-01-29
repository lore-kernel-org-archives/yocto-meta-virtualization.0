Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1FDC48285
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 17:41:46 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.1106.1706550100915103831
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 29 Jan 2024 09:41:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SAgzuN+T;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-51032e62171so2671051e87.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 29 Jan 2024 09:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706550098; x=1707154898; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=micdPaMwBqWJ41HeXHOiYQg88loATVmhLNs5YqNc1ck=;
        b=SAgzuN+Tk3oE2z74n9KDOuNI79LpeF8vdEv0t1ynukcSwEaJiX3MXjZ0na2m86B8F+
         n53tYJmySYz/idkP5fFs8h7zdFlbQYFMdybi5K5wkhPTLb+NUM0RgDBNN/E8hYpHUeLw
         HdVjDg+6gzdnIfPkeRj+1qD1+naVGfPk9bcgf2FI1u2bv8JC8evqF1XKNqxZg/QYtU73
         gCFP42ucRSETEG+2h05pSGXKbca9crsueclW5sYF5zd/v6U7a7e5BV4OlnGdfOr2PhZx
         H+sxQKDJtArMlL/j71q1LRqSivPNLc3UBYnfh0j8DAmwB85VKufqpIw1xS9gC1kAfQK1
         ArRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706550098; x=1707154898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=micdPaMwBqWJ41HeXHOiYQg88loATVmhLNs5YqNc1ck=;
        b=MbJZPIxpOBCmQuXXd05cAlTKDAqaUJrDCJ2IMCG3j3jLkbJ6BysZIjnFV2gzy1h46/
         s7/5CwXmuQCxQaJpGnirW186u7aWSkNdfPH0JIlV2aoIMVHTgKrby5n4IOt+QJay9i/b
         siYAWFe9GPrw0eaLBXwjomjdFXJDMrHB6NcPAnSs7Vv/RC0hi00thkSe5AFmoE/kOB2Q
         zfGN+v5JIzg3lXW5ppsuWgrnFW8D8UWWiP5H1sWSBgOOPggMEXpxmSy5gv2FnaRCaEjx
         dL17Ka6y3SQ+KX9sqcwZyJOGAi5YU0OeGENqLDYnx3fQfdeXaQ1zp25xnz2x0ePeXBnO
         9O6Q==
X-Gm-Message-State: AOJu0YyQwHMSq8Wc2c79+eMPr5LT/5q0WsTNvoWD6f4W7kHRcwZPh6UB
	3FTGieU98DWNkbNLHHFSN1EOmshiFWiHTHn3lehQAndM4jCl1yKx/D1d6IiX
X-Google-Smtp-Source: AGHT+IGwl98HtIwDzymrwvpR7NpChiiYKCeycctyjmr3uxDubmScSOE48W0SLfHeFy7Y+0pfpNkHtA==
X-Received: by 2002:a05:6512:3241:b0:510:1799:b1fd with SMTP id c1-20020a056512324100b005101799b1fdmr3618120lfr.27.1706550098007;
        Mon, 29 Jan 2024 09:41:38 -0800 (PST)
Received: from peterliu-Precision-7530.. (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id o17-20020a056512231100b00510f52c332fsm663661lfu.213.2024.01.29.09.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 09:41:37 -0800 (PST)
From: liu.ming50@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-virtualization][PATCH] container-host-config:storage.conf: sync with libpod v4.8.2
Date: Mon, 29 Jan 2024 18:41:32 +0100
Message-Id: <20240129174132.24445-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 29 Jan 2024 17:41:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8556

From: Ming Liu <liu.ming50@gmail.com>

The current storage.conf is based on v1.33.0 of:
https://github.com/containers/storage.git

while in podman v4.8.2, it has been upgraded to
v1.50.3-0.20231005112617-44418abb2d89 of:
https://github.com/containers/storage.git

let's sync it with podman v4.8.2.

which comprises the following commits in storage.conf:

```
42d1d9637 Run codespell on code
91da0c2be add documentation on imagestore and add a warning if set
01fccaa58 options: enable Remap-User/Group setting
e125790e9 Fix typo in storage.conf
57582350c Document transient_store in man page
522b67c94 Add new storage.conf option "transient_store"
5e9e2ba6b Revert incorrect "heeded" -> "needed" typo fix
cffa19709 fix typos and spelling
268af0001 chunked: drop host dedup feature
b64cfb4f4 Document the pull_options
17fccdc2d Clearup inheritance rules for storage.conf
3c76f174d Tell users who change graphroot location to fix the SELinux labels
```

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 .../container-host-config/storage.conf        | 62 ++++++++++++++++---
 1 file changed, 55 insertions(+), 7 deletions(-)

diff --git a/recipes-containers/container-host-config/container-host-config/storage.conf b/recipes-containers/container-host-config/container-host-config/storage.conf
index 722750c0..cb4525f2 100644
--- a/recipes-containers/container-host-config/container-host-config/storage.conf
+++ b/recipes-containers/container-host-config/container-host-config/storage.conf
@@ -1,5 +1,14 @@
-# This file is is the configuration file for all tools
-# that use the containers/storage library.
+# This file is the configuration file for all tools
+# that use the containers/storage library. The storage.conf file
+# overrides all other storage.conf files. Container engines using the
+# container/storage library do not inherit fields from other storage.conf
+# files.
+#
+#  Note: The storage.conf file overrides other storage.conf files based on this precedence:
+#      /usr/containers/storage.conf
+#      /etc/containers/storage.conf
+#      $HOME/.config/containers/storage.conf
+#      $XDG_CONFIG_HOME/containers/storage.conf (If XDG_CONFIG_HOME is set)
 # See man 5 containers-storage.conf for more information
 # The "container storage" table contains all of the server options.
 [storage]
@@ -11,12 +20,28 @@ driver = "overlay"
 runroot = "/run/containers/storage"
 
 # Primary Read/Write location of container storage
+# When changing the graphroot location on an SELINUX system, you must
+# ensure  the labeling matches the default locations labels with the
+# following commands:
+# semanage fcontext -a -e /var/lib/containers/storage /NEWSTORAGEPATH
+# restorecon -R -v /NEWSTORAGEPATH
 graphroot = "/var/lib/containers/storage"
 
+# Optional alternate location of image store if a location separate from the
+# container store is required. If set, it must be different than graphroot.
+# imagestore = ""
+
+
 # Storage path for rootless users
 #
 # rootless_storage_path = "$HOME/.local/share/containers/storage"
 
+# Transient store mode makes all container metadata be saved in temporary storage
+# (i.e. runroot above). This is faster, but doesn't persist across reboots.
+# Additional garbage collection must also be performed at boot-time, so this
+# option should remain disabled in most configurations.
+# transient_store = true
+
 [storage.options]
 # Storage options to be passed to underlying storage drivers
 
@@ -25,6 +50,28 @@ graphroot = "/var/lib/containers/storage"
 additionalimagestores = [
 ]
 
+# Allows specification of how storage is populated when pulling images. This
+# option can speed the pulling process of images compressed with format
+# zstd:chunked. Containers/storage looks for files within images that are being
+# pulled from a container registry that were previously pulled to the host.  It
+# can copy or create a hard link to the existing file when it finds them,
+# eliminating the need to pull them from the container registry. These options
+# can deduplicate pulling of content, disk storage of content and can allow the
+# kernel to use less memory when running containers.
+
+# containers/storage supports three keys
+#   * enable_partial_images="true" | "false"
+#     Tells containers/storage to look for files previously pulled in storage
+#     rather then always pulling them from the container registry.
+#   * use_hard_links = "false" | "true"
+#     Tells containers/storage to use hard links rather then create new files in
+#     the image, if an identical file already existed in storage.
+#   * ostree_repos = ""
+#     Tells containers/storage where an ostree repository exists that might have
+#     previously pulled content which can be used when attempting to avoid
+#     pulling content from the container registry
+pull_options = {enable_partial_images = "false", use_hard_links = "false", ostree_repos=""}
+
 # Remap-UIDs/GIDs is the mapping from UIDs/GIDs as they should appear inside of
 # a container, to the UIDs/GIDs as they should appear outside of the container,
 # and the length of the range of UIDs/GIDs.  Additional mapped sets can be
@@ -32,8 +79,8 @@ additionalimagestores = [
 # mappings which the kernel will allow when you later attempt to run a
 # container.
 #
-# remap-uids = 0:1668442479:65536
-# remap-gids = 0:1668442479:65536
+# remap-uids = "0:1668442479:65536"
+# remap-gids = "0:1668442479:65536"
 
 # Remap-User/Group is a user name which can be used to look up one or more UID/GID
 # ranges in the /etc/subuid or /etc/subgid file.  Mappings are set up starting
@@ -41,7 +88,8 @@ additionalimagestores = [
 # range that matches the specified name, and using the length of that range.
 # Additional ranges are then assigned, using the ranges which specify the
 # lowest host-level IDs first, to the lowest not-yet-mapped in-container ID,
-# until all of the entries have been used for maps.
+# until all of the entries have been used for maps. This setting overrides the
+# Remap-UIDs/GIDs setting.
 #
 # remap-user = "containers"
 # remap-group = "containers"
@@ -57,7 +105,7 @@ additionalimagestores = [
 # Auto-userns-min-size is the minimum size for a user namespace created automatically.
 # auto-userns-min-size=1024
 #
-# Auto-userns-max-size is the minimum size for a user namespace created automatically.
+# Auto-userns-max-size is the maximum size for a user namespace created automatically.
 # auto-userns-max-size=65536
 
 [storage.options.overlay]
@@ -113,7 +161,7 @@ mountopt = "nodev"
 #  future.  When "force_mask" is set the original permission mask is stored in
 #  the "user.containers.override_stat" xattr and the "mount_program" option must
 #  be specified. Mount programs like "/usr/bin/fuse-overlayfs" present the
-#  extended attribute permissions to processes within containers rather then the
+#  extended attribute permissions to processes within containers rather than the
 #  "force_mask"  permissions.
 #
 # force_mask = ""
-- 
2.34.1


