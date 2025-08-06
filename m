Return-Path: <darshan.patel@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09EA5C87FD1
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 08:39:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20338.1754469573041284460
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 06 Aug 2025 01:39:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: darshan.patel@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0497F176C;
	Wed,  6 Aug 2025 01:39:24 -0700 (PDT)
Received: from e135241.manchester.arm.com (e135241.arm.com [10.32.100.56])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 696393F5A1;
	Wed,  6 Aug 2025 01:39:31 -0700 (PDT)
From: Darshan Patel <darshan.patel@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Darshan Patel <darshan.patel@arm.com>
Subject: [PATCH] doc: Fix typo in README
Date: Wed,  6 Aug 2025 09:39:18 +0100
Message-Id: <20250806083918.848371-1-darshan.patel@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 06 Aug 2025 08:39:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9344

- Corrected minor typographical error(s) in the documentation for clarity=
.

Signed-off-by: Darshan Patel <darshan.patel@arm.com>
---
 README.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/README.md b/README.md
index c26c0955..cacce30b 100644
--- a/README.md
+++ b/README.md
@@ -28,7 +28,7 @@ that may also be enabled:
=20
  - xen: enables xen functionality in various packages (kernel, libvirt, =
etc)
  - kvm: enables KVM configurations in the kernel and autoloads modules
- - k8s: enables kubernets configurations in the kernel, tools and config=
uration
+ - k8s: enables kubernetes configurations in the kernel, tools and confi=
guration
  - aufs: enables aufs support in docker and linux-yocto
  - x11: enable xen and libvirt functionality related to x11
  - selinux: enables functionality in libvirt and lxc
@@ -71,7 +71,7 @@ branch: master
 revision: HEAD
 prio: default
=20
-Community / Colaboration
+Community / Collaboration
 ------------------------
=20
 Repository: https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualizati=
on/
--=20
2.34.1


