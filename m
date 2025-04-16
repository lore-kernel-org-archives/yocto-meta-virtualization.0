Return-Path: <wojciech.slenska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E5E8C369BD
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 08:39:42 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.14333.1744792778010227226
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 16 Apr 2025 01:39:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jDwjVesg;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: wojciech.slenska@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54b10956398so597977e87.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Apr 2025 01:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744792776; x=1745397576; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cZQZN7nFJ08dgisQCC6NTsXmD8olOP4RWL6PksB6QPM=;
        b=jDwjVesgsIi9Hi7/9cjNBFX3vIMHAgClyrkCu7UqMBY2ME1W7HRD+OAuQpwy4zAvsb
         0Nuebh+XmhI2M7PaYoxhN2acSz1kW5bBc21BrajxVNFCT8Cfk3u5C1wnPyVD0Lgqm27A
         UF27/LQovA96AxytY8OXicRZgtlAKsYmhB78nL9MQg0XDEqZ4yM69NB+TEdJHpOM1fXs
         CsgB6rAKq3vtBXdjnFRg0TaLL6/9fsW04a6euDcoZa6mIH24uRnKtMVfRfoZmQZ04sgC
         Gou0jOIKUEIniRLXQaNYnJH2dLzV/uyanKS9E+nt2Yf98e9E+oaZvpHDzoB3GZQ3Bnln
         FsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744792776; x=1745397576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cZQZN7nFJ08dgisQCC6NTsXmD8olOP4RWL6PksB6QPM=;
        b=jKOArVQ6hRlvEtnK0Lqr9KrSPxRLVrWqvkTn2KTcQKPEtRFoqrG7BFKzbAeBw0ORGN
         1p5VhvuU9asy+cLWGE+L3ST0Fpn6TW8STu2xbr+QdS03Q/+4uSSditaDr16T6YppZMdo
         otVOWUohSQMc3vuZu85Z+GG0rw4Hny4G5ZdGZZc0svj333ilgOIsjFZyhJuzG1LKh4gm
         BMtKW5wP0d1utw2ep8hR2iC53YwN0Cj/A/rD4KvpBJezcCQxUZTorQ0siUqVK7MBmcW8
         V1ct/R+Q6To9g3oJmY9u1XOzBQrPV83OCpXNJttvXp5WyZ/PfaWq9j9kQmzGNZDNTYT5
         vjKw==
X-Gm-Message-State: AOJu0YzsQoi0CNXByIQeCyuAKfVo3cW/lILDUTLfoD43Fdpl/Z1d4jc/
	Asx4gY7ip8GrmSeZ2R6Qc04bySXjFQkTkYzCInxKPfgWCgsHqo/ji7IoVQ==
X-Gm-Gg: ASbGncvdiO6bFapJzjWvKKh+dIi1XJdopGUeE3eltn9/oEJg2nISbqG/vwXUgyv8J1k
	E9kg17QiLQbWeXyX15OMamllZqPK7lzUlFFCDJ1eytjJ7Pn3b9urFMSCdZvw8XOMNrMrpschH1O
	Nz6653BuVwjDeBeiPHl/zcIsz3+ovKX3y7ODAq6KdsSkBZXhWSMD6cHroFmSHCz4irqPDLVc+JB
	sRnQZiON+xvgogy1h6SM+LM3dm8+NbxSuFR4YhoLDOTRk7Sb8TwBVF/sXl8hGgSqy0ltHInt9JU
	tf68JNg0sbk+/ASwVk9ZnTeJPcTYEx6fYE6LBBHA
X-Google-Smtp-Source: AGHT+IG3ejJZdSx8f0z4b+99KUq+77l9XZ9VWnGkeVRBHnXBYCF+U1Y3q0H8dVbTIx3TI66EuLbFmQ==
X-Received: by 2002:ac2:4c49:0:b0:549:8c0c:f059 with SMTP id 2adb3069b0e04-54d64b93febmr250464e87.10.1744792775548;
        Wed, 16 Apr 2025 01:39:35 -0700 (PDT)
Received: from T15.. ([46.175.113.10])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-54d3d238d80sm1626168e87.71.2025.04.16.01.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:39:35 -0700 (PDT)
From: Wojciech Slenska <wojciech.slenska@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Wojciech Slenska <wojciech.slenska@gmail.com>
Subject: [meta-virtualization][PATCH] fuse-overlayfs: update to v1.14
Date: Wed, 16 Apr 2025 10:39:32 +0200
Message-Id: <20250416083932.36075-1-wojciech.slenska@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Apr 2025 08:39:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9228

* fuse-overlayfs-1.14
    - isolate security xattrs for STAT_OVERRIDE_CONTAINERS.  Prefix all
      security xattrs with XATTR_CONTAINERS_OVERRIDE_PREFIX.
    - prefer user.containers.override_stat over user.fuseoverlayfs.
    - do not force -1 for owner overriding extended attributes.  Otherwise
      the value is written to the override extended attribute.
    - fix file owner retrieval for chmod.
    - honor umask with xattr_permissions.
    - honor mode for devices with xattr_permissions.
    - propagate extended attributes permissions with copyup.

* fuse-overlayfs-1.13
    - fix a performance issue when dealing with big directories.

* fuse-overlayfs-1.12
    - change license to GPL-2.0-or-later.

* fuse-overlayfs-1.11
    - main: if a lower layer doesn't support ACLs do not enable them.

* fuse-overlayfs-1.10
    - main: use /proc/self/fd to read xattrs.
    - main: inherit ACLs for new files/dirs.
    - main: fix passing noatime.
    - main: add checks for valid /proc mount.
    - main: fix copy_file_range for deleted files.
    - main: fix creating links of just deleted files.

Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
---
 ...tils-Add-missing-include-on-limits.h.patch | 36 -------------------
 .../fuse-overlayfs/fuse-overlayfs_1.14.bb     | 15 ++++++++
 .../fuse-overlayfs/fuse-overlayfs_1.9.bb      | 18 ----------
 3 files changed, 15 insertions(+), 54 deletions(-)
 delete mode 100644 recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-utils-Add-missing-include-on-limits.h.patch
 create mode 100644 recipes-extended/fuse-overlayfs/fuse-overlayfs_1.14.bb
 delete mode 100644 recipes-extended/fuse-overlayfs/fuse-overlayfs_1.9.bb

diff --git a/recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-utils-Add-missing-include-on-limits.h.patch b/recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-utils-Add-missing-include-on-limits.h.patch
deleted file mode 100644
index cd504ce5..00000000
--- a/recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-utils-Add-missing-include-on-limits.h.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From b48e958aaecfdfc3bb48db082a548a09d6487181 Mon Sep 17 00:00:00 2001
-From: Andrei Gherzan <andrei.gherzan@huawei.com>
-Date: Wed, 13 Jul 2022 12:05:07 +0200
-Subject: [PATCH] utils: Add missing include on limits.h
-
-This happens to not be an issue with glibc because it gets indirectly
-included via dirent.h:
-
-.. /usr/include/dirent.h
-[...]
-..... /usr/include/linux/limits.h
-
-When using the musl libc implementation, that is not the case anymore
-and the build fails.
-
-Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
-Upstream-Status: Submitted [https://github.com/containers/fuse-overlayfs/pull/362]
----
- utils.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/utils.h b/utils.h
-index 13a177e..6fbc328 100644
---- a/utils.h
-+++ b/utils.h
-@@ -32,6 +32,7 @@
- # include <sys/types.h>
- # include <fcntl.h>
- # include "fuse-overlayfs.h"
-+# include <limits.h>
- 
- # define XATTR_OVERRIDE_STAT "user.fuseoverlayfs.override_stat"
- # define XATTR_PRIVILEGED_OVERRIDE_STAT "security.fuseoverlayfs.override_stat"
--- 
-2.25.1
-
diff --git a/recipes-extended/fuse-overlayfs/fuse-overlayfs_1.14.bb b/recipes-extended/fuse-overlayfs/fuse-overlayfs_1.14.bb
new file mode 100644
index 00000000..0f6d0fb6
--- /dev/null
+++ b/recipes-extended/fuse-overlayfs/fuse-overlayfs_1.14.bb
@@ -0,0 +1,15 @@
+SUMMARY = "FUSE implementation of overlayfs."
+DESCRIPTION = "An implementation of overlay+shiftfs in FUSE for rootless \
+containers."
+
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRCREV = "33cb788edc05f5e3cbb8a7a241f5a04bee264730"
+SRC_URI = "git://github.com/containers/fuse-overlayfs.git;nobranch=1;protocol=https"
+
+DEPENDS = "fuse3"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
diff --git a/recipes-extended/fuse-overlayfs/fuse-overlayfs_1.9.bb b/recipes-extended/fuse-overlayfs/fuse-overlayfs_1.9.bb
deleted file mode 100644
index 31199928..00000000
--- a/recipes-extended/fuse-overlayfs/fuse-overlayfs_1.9.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "FUSE implementation of overlayfs."
-DESCRIPTION = "An implementation of overlay+shiftfs in FUSE for rootless \
-containers."
-
-LICENSE = "GPL-3.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-SRCREV = "51592ea406f48faeccab288f65dcba6c4a67cd90"
-SRC_URI = " \
-	git://github.com/containers/fuse-overlayfs.git;nobranch=1;protocol=https \
-	file://0001-utils-Add-missing-include-on-limits.h.patch \
-"
-
-DEPENDS = "fuse3"
-
-S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig
-- 
2.34.1


