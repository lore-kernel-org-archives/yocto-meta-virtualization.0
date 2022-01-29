Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E32C433EF
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 07:15:03 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.3438.1643440502039800209
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 28 Jan 2022 23:15:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 20T7ExWX011887
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 28 Jan 2022 23:14:59 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 20T7EwlY016209
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 28 Jan 2022 23:14:59 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 28 Jan 2022 23:14:58 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 28 Jan 2022 23:14:57 -0800
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [hardknott][PATCH] libvirt: fix CVE-2021-3975
Date: Sat, 29 Jan 2022 15:14:57 +0800
Message-ID: <20220129071457.45838-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 29 Jan 2022 07:15:03 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7038

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libvirt/libvirt/CVE-2021-3975.patch       | 43 +++++++++++++++++++
 recipes-extended/libvirt/libvirt_6.3.0.bb     |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/CVE-2021-3975.patch

diff --git a/recipes-extended/libvirt/libvirt/CVE-2021-3975.patch b/recipes-extended/libvirt/libvirt/CVE-2021-3975.patch
new file mode 100644
index 0000000..72cee94
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/CVE-2021-3975.patch
@@ -0,0 +1,43 @@
+From 30de45c73106cacfc0aacc8f11c88e1aa5372d77 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Sat, 29 Jan 2022 13:25:54 +0800
+Subject: [PATCH] qemu: Add missing lock in qemuProcessHandleMonitorEOF
+
+qemuMonitorUnregister will be called in multiple threads (e.g. threads
+in rpc worker pool and the vm event thread).  In some cases, it isn't
+protected by the monitor lock, which may lead to call g_source_unref
+more than one time and a use-after-free problem eventually.
+
+Add the missing lock in qemuProcessHandleMonitorEOF (which is the only
+position missing lock of monitor I found).
+
+Suggested-by: Michal Privoznik <mprivozn@redhat.com>
+Signed-off-by: Peng Liang <liangpeng10@huawei.com>
+Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
+Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
+
+Upstream-Status: Backport [https://github.com/libvirt/libvirt/commit/1ac703a7d0789e46833f4013a3876c2e3af18ec7]
+CVE: CVE-2021-3975
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/qemu/qemu_process.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/qemu/qemu_process.c b/src/qemu/qemu_process.c
+index 8ea470f..64b8472 100644
+--- a/src/qemu/qemu_process.c
++++ b/src/qemu/qemu_process.c
+@@ -315,7 +315,9 @@ qemuProcessHandleMonitorEOF(qemuMonitorPtr mon,
+     /* We don't want this EOF handler to be called over and over while the
+      * thread is waiting for a job.
+      */
++    virObjectLock(mon);
+     qemuMonitorUnregister(mon);
++    virObjectUnlock(mon);
+ 
+     /* We don't want any cleanup from EOF handler (or any other
+      * thread) to enter qemu namespace. */
+-- 
+2.17.1
+
diff --git a/recipes-extended/libvirt/libvirt_6.3.0.bb b/recipes-extended/libvirt/libvirt_6.3.0.bb
index 091296e..8e95ad6 100644
--- a/recipes-extended/libvirt/libvirt_6.3.0.bb
+++ b/recipes-extended/libvirt/libvirt_6.3.0.bb
@@ -46,6 +46,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://CVE-2020-25637_4.patch \
            file://CVE-2021-3631.patch \
            file://0001-storage_driver-Unlock-object-on-ACL-fail-in-storageP.patch \
+           file://CVE-2021-3975.patch \
           "
 
 SRC_URI[libvirt.md5sum] = "1bd4435f77924f5ec9928b538daf4a02"
-- 
2.17.1


