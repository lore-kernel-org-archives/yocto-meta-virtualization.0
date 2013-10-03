Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1EB06E01694
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 Oct 2013 18:17:06 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r931H483022957
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 2 Oct 2013 18:17:04 -0700 (PDT)
Received: from yow-masselst-d1.wrs.com (128.224.146.23) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 2 Oct 2013 18:17:02 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Wed, 2 Oct 2013 21:17:13 -0400
Message-ID: <1380763033-11106-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-Originating-IP: [128.224.146.23]
Subject: [PATCH] libvirt: don't mount securityfs or selinux if userns enabled
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Oct 2013 01:17:10 -0000
Content-Type: text/plain

commit 6807238d87fd [Ensure securityfs is mounted readonly in
container] from upstream libvirt requires securityfs to be mounted,
always. Failing to use a kernel without SECURITYFS support results in
the following error when you attempt to start a lxc guest:

error : lxcContainerMountBasicFS:807 : Failed to mkdir securityfs: No
such file or directory Input/output error

Here we apply an upstream fix for this which allows you to use userns
support instead of SECURITYFS, by using <idmap> in your guest config.

A similar situation exists for SELINUX so here we are bringing in 2
more upstream commits, the first for context and the second, which
like the securityfs patch, doesn't force selinux to be mounted if
userns is used.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
Cc: Bogdan Purcareata <bogdan.purcareata@freescale.com>
---
 ...ount-securityfs-when-user-namespace-enabl.patch |  52 ++++++++
 ...ry-to-mount-selinux-filesystem-when-user-.patch |  48 +++++++
 ...of-mounts-out-of-lxcContainerMountBasicFS.patch | 147 +++++++++++++++++++++
 recipes-extended/libvirt/libvirt_1.1.2.bb          |   3 +
 4 files changed, 250 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/LXC-Don-t-mount-securityfs-when-user-namespace-enabl.patch
 create mode 100644 recipes-extended/libvirt/libvirt/LXC-don-t-try-to-mount-selinux-filesystem-when-user-.patch
 create mode 100644 recipes-extended/libvirt/libvirt/Move-array-of-mounts-out-of-lxcContainerMountBasicFS.patch

diff --git a/recipes-extended/libvirt/libvirt/LXC-Don-t-mount-securityfs-when-user-namespace-enabl.patch b/recipes-extended/libvirt/libvirt/LXC-Don-t-mount-securityfs-when-user-namespace-enabl.patch
new file mode 100644
index 0000000..40f8dd9
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/LXC-Don-t-mount-securityfs-when-user-namespace-enabl.patch
@@ -0,0 +1,52 @@
+From 1583dfda7c4e5ad71efe0615c06e5676528d8203 Mon Sep 17 00:00:00 2001
+From: Gao feng <gaofeng@cn.fujitsu.com>
+Date: Thu, 5 Sep 2013 11:50:40 +0100
+Subject: [PATCH] LXC: Don't mount securityfs when user namespace enabled
+
+commit 1583dfda7c4e5ad71efe0615c06e5676528d8203 from
+git://libvirt.org/libvirt.git
+
+Right now, securityfs is disallowed to be mounted in non-initial
+user namespace, so we must avoid trying to mount securityfs in
+a container which has user namespace enabled.
+
+Signed-off-by: Gao feng <gaofeng@cn.fujitsu.com>
+---
+ src/lxc/lxc_container.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/src/lxc/lxc_container.c b/src/lxc/lxc_container.c
+index 8abaea0..c41ab40 100644
+--- a/src/lxc/lxc_container.c
++++ b/src/lxc/lxc_container.c
+@@ -750,7 +750,7 @@ err:
+ }
+ 
+ 
+-static int lxcContainerMountBasicFS(void)
++static int lxcContainerMountBasicFS(bool userns_enabled)
+ {
+     const struct {
+         const char *src;
+@@ -801,6 +801,9 @@ static int lxcContainerMountBasicFS(void)
+             continue;
+ #endif
+ 
++        if (STREQ(mnts[i].src, "securityfs") && userns_enabled)
++            continue;
++
+         if (virFileMakePath(mnts[i].dst) < 0) {
+             virReportSystemError(errno,
+                                  _("Failed to mkdir %s"),
+@@ -1530,7 +1533,7 @@ static int lxcContainerSetupPivotRoot(virDomainDefPtr vmDef,
+         goto cleanup;
+ 
+     /* Mounts the core /proc, /sys, etc filesystems */
+-    if (lxcContainerMountBasicFS() < 0)
++    if (lxcContainerMountBasicFS(vmDef->idmap.nuidmap) < 0)
+         goto cleanup;
+ 
+     /* Mounts /proc/meminfo etc sysinfo */
+-- 
+1.8.1.2
+
diff --git a/recipes-extended/libvirt/libvirt/LXC-don-t-try-to-mount-selinux-filesystem-when-user-.patch b/recipes-extended/libvirt/libvirt/LXC-don-t-try-to-mount-selinux-filesystem-when-user-.patch
new file mode 100644
index 0000000..f058293
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/LXC-don-t-try-to-mount-selinux-filesystem-when-user-.patch
@@ -0,0 +1,48 @@
+From 1c7037cff42dde35913dde533b31ee1da8c2d6e0 Mon Sep 17 00:00:00 2001
+From: Gao feng <gaofeng@cn.fujitsu.com>
+Date: Thu, 12 Sep 2013 11:51:31 +0800
+Subject: [PATCH] LXC: don't try to mount selinux filesystem when user namespace enabled
+
+commit 1c7037cff42dde35913dde533b31ee1da8c2d6e0 from
+git://libvirt.org/libvirt.git
+                                
+Right now we mount selinuxfs even user namespace is enabled and
+ignore the error. But we shouldn't ignore these errors when user
+namespace is not enabled.
+
+This patch skips mounting selinuxfs when user namespace enabled.
+
+Signed-off-by: Gao feng <gaofeng@cn.fujitsu.com>
+---
+ src/lxc/lxc_container.c | 8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/src/lxc/lxc_container.c b/src/lxc/lxc_container.c
+index ddc6e3d..a979452 100644
+--- a/src/lxc/lxc_container.c
++++ b/src/lxc/lxc_container.c
+@@ -868,7 +868,7 @@ static int lxcContainerMountBasicFS(bool userns_enabled)
+ 
+ #if WITH_SELINUX
+         if (STREQ(mnt->src, SELINUX_MOUNT) &&
+-            !is_selinux_enabled())
++            (!is_selinux_enabled() || userns_enabled))
+             continue;
+ #endif
+ 
+@@ -885,12 +885,6 @@ static int lxcContainerMountBasicFS(bool userns_enabled)
+         VIR_DEBUG("Mount %s on %s type=%s flags=%x, opts=%s",
+                   srcpath, mnt->dst, mnt->type, mnt->mflags, mnt->opts);
+         if (mount(srcpath, mnt->dst, mnt->type, mnt->mflags, mnt->opts) < 0) {
+-#if WITH_SELINUX
+-            if (STREQ(mnt->src, SELINUX_MOUNT) &&
+-                (errno == EINVAL || errno == EPERM))
+-                continue;
+-#endif
+-
+             virReportSystemError(errno,
+                                  _("Failed to mount %s on %s type %s flags=%x opts=%s"),
+                                  srcpath, mnt->dst, NULLSTR(mnt->type),
+-- 
+1.8.1.2
+
diff --git a/recipes-extended/libvirt/libvirt/Move-array-of-mounts-out-of-lxcContainerMountBasicFS.patch b/recipes-extended/libvirt/libvirt/Move-array-of-mounts-out-of-lxcContainerMountBasicFS.patch
new file mode 100644
index 0000000..2c7b0ee
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/Move-array-of-mounts-out-of-lxcContainerMountBasicFS.patch
@@ -0,0 +1,147 @@
+From f27f5f7eddf531159d791a2b5ac438ca011b5f26 Mon Sep 17 00:00:00 2001
+From: "Daniel P. Berrange" <berrange@redhat.com>
+Date: Tue, 10 Sep 2013 13:35:12 +0100
+Subject: [PATCH] Move array of mounts out of lxcContainerMountBasicFS
+
+commit f27f5f7eddf531159d791a2b5ac438ca011b5f26 from
+git://libvirt.org/libvirt.git
+
+Move the array of basic mounts out of the lxcContainerMountBasicFS
+function, to a global variable. This is to allow it to be referenced
+by other methods wanting to know what the basic mount paths are.
+
+Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
+---
+ src/lxc/lxc_container.c | 79 ++++++++++++++++++++++++++-----------------------
+ 1 file changed, 42 insertions(+), 37 deletions(-)
+
+diff --git a/src/lxc/lxc_container.c b/src/lxc/lxc_container.c
+index 661ac52..6f241d3 100644
+--- a/src/lxc/lxc_container.c
++++ b/src/lxc/lxc_container.c
+@@ -750,45 +750,50 @@ err:
+ }
+ 
+ 
+-static int lxcContainerMountBasicFS(bool userns_enabled)
+-{
+-    const struct {
+-        const char *src;
+-        const char *dst;
+-        const char *type;
+-        const char *opts;
+-        int mflags;
+-    } mnts[] = {
+-        /* When we want to make a bind mount readonly, for unknown reasons,
+-         * it is currently necessary to bind it once, and then remount the
+-         * bind with the readonly flag. If this is not done, then the original
+-         * mount point in the main OS becomes readonly too which is not what
+-         * we want. Hence some things have two entries here.
+-         */
+-        { "proc", "/proc", "proc", NULL, MS_NOSUID|MS_NOEXEC|MS_NODEV },
+-        { "/proc/sys", "/proc/sys", NULL, NULL, MS_BIND },
+-        { "/proc/sys", "/proc/sys", NULL, NULL, MS_BIND|MS_REMOUNT|MS_RDONLY },
+-        { "sysfs", "/sys", "sysfs", NULL, MS_NOSUID|MS_NOEXEC|MS_NODEV },
+-        { "sysfs", "/sys", "sysfs", NULL, MS_BIND|MS_REMOUNT|MS_RDONLY },
+-        { "securityfs", "/sys/kernel/security", "securityfs", NULL, MS_NOSUID|MS_NOEXEC|MS_NODEV },
+-        { "securityfs", "/sys/kernel/security", "securityfs", NULL, MS_BIND|MS_REMOUNT|MS_RDONLY },
++typedef struct {
++    const char *src;
++    const char *dst;
++    const char *type;
++    const char *opts;
++    int mflags;
++} virLXCBasicMountInfo;
++
++static const virLXCBasicMountInfo lxcBasicMounts[] = {
++    /* When we want to make a bind mount readonly, for unknown reasons,
++     * it is currently necessary to bind it once, and then remount the
++     * bind with the readonly flag. If this is not done, then the original
++     * mount point in the main OS becomes readonly too which is not what
++     * we want. Hence some things have two entries here.
++     */
++    { "proc", "/proc", "proc", NULL, MS_NOSUID|MS_NOEXEC|MS_NODEV },
++    { "/proc/sys", "/proc/sys", NULL, NULL, MS_BIND },
++    { "/proc/sys", "/proc/sys", NULL, NULL, MS_BIND|MS_REMOUNT|MS_RDONLY },
++    { "sysfs", "/sys", "sysfs", NULL, MS_NOSUID|MS_NOEXEC|MS_NODEV },
++    { "sysfs", "/sys", "sysfs", NULL, MS_BIND|MS_REMOUNT|MS_RDONLY },
++    { "securityfs", "/sys/kernel/security", "securityfs", NULL, MS_NOSUID|MS_NOEXEC|MS_NODEV },
++    { "securityfs", "/sys/kernel/security", "securityfs", NULL, MS_BIND|MS_REMOUNT|MS_RDONLY },
+ #if WITH_SELINUX
+-        { SELINUX_MOUNT, SELINUX_MOUNT, "selinuxfs", NULL, MS_NOSUID|MS_NOEXEC|MS_NODEV },
+-        { SELINUX_MOUNT, SELINUX_MOUNT, NULL, NULL, MS_BIND|MS_REMOUNT|MS_RDONLY },
++    { SELINUX_MOUNT, SELINUX_MOUNT, "selinuxfs", NULL, MS_NOSUID|MS_NOEXEC|MS_NODEV },
++    { SELINUX_MOUNT, SELINUX_MOUNT, NULL, NULL, MS_BIND|MS_REMOUNT|MS_RDONLY },
+ #endif
+-    };
++};
++
++
++static int lxcContainerMountBasicFS(bool userns_enabled)
++{
+     size_t i;
+     int rc = -1;
+ 
+     VIR_DEBUG("Mounting basic filesystems");
+ 
+-    for (i = 0; i < ARRAY_CARDINALITY(mnts); i++) {
++    for (i = 0; i < ARRAY_CARDINALITY(lxcBasicMounts); i++) {
++        virLXCBasicMountInfo const *mnt = &lxcBasicMounts[i];
+         const char *srcpath = NULL;
+ 
+         VIR_DEBUG("Processing %s -> %s",
+-                  mnts[i].src, mnts[i].dst);
++                  mnt->src, mnt->dst);
+ 
+-        srcpath = mnts[i].src;
++        srcpath = mnt->src;
+ 
+         /* Skip if mount doesn't exist in source */
+         if ((srcpath[0] == '/') &&
+@@ -796,34 +801,34 @@ static int lxcContainerMountBasicFS(bool userns_enabled)
+             continue;
+ 
+ #if WITH_SELINUX
+-        if (STREQ(mnts[i].src, SELINUX_MOUNT) &&
++        if (STREQ(mnt->src, SELINUX_MOUNT) &&
+             !is_selinux_enabled())
+             continue;
+ #endif
+ 
+-        if (STREQ(mnts[i].src, "securityfs") && userns_enabled)
++        if (STREQ(mnt->src, "securityfs") && userns_enabled)
+             continue;
+ 
+-        if (virFileMakePath(mnts[i].dst) < 0) {
++        if (virFileMakePath(mnt->dst) < 0) {
+             virReportSystemError(errno,
+                                  _("Failed to mkdir %s"),
+-                                 mnts[i].src);
++                                 mnt->src);
+             goto cleanup;
+         }
+ 
+         VIR_DEBUG("Mount %s on %s type=%s flags=%x, opts=%s",
+-                  srcpath, mnts[i].dst, mnts[i].type, mnts[i].mflags, mnts[i].opts);
+-        if (mount(srcpath, mnts[i].dst, mnts[i].type, mnts[i].mflags, mnts[i].opts) < 0) {
++                  srcpath, mnt->dst, mnt->type, mnt->mflags, mnt->opts);
++        if (mount(srcpath, mnt->dst, mnt->type, mnt->mflags, mnt->opts) < 0) {
+ #if WITH_SELINUX
+-            if (STREQ(mnts[i].src, SELINUX_MOUNT) &&
++            if (STREQ(mnt->src, SELINUX_MOUNT) &&
+                 (errno == EINVAL || errno == EPERM))
+                 continue;
+ #endif
+ 
+             virReportSystemError(errno,
+                                  _("Failed to mount %s on %s type %s flags=%x opts=%s"),
+-                                 srcpath, mnts[i].dst, NULLSTR(mnts[i].type),
+-                                 mnts[i].mflags, NULLSTR(mnts[i].opts));
++                                 srcpath, mnt->dst, NULLSTR(mnt->type),
++                                 mnt->mflags, NULLSTR(mnt->opts));
+             goto cleanup;
+         }
+     }
+-- 
+1.8.1.2
+
diff --git a/recipes-extended/libvirt/libvirt_1.1.2.bb b/recipes-extended/libvirt/libvirt_1.1.2.bb
index cfb406d..a12147a 100644
--- a/recipes-extended/libvirt/libvirt_1.1.2.bb
+++ b/recipes-extended/libvirt/libvirt_1.1.2.bb
@@ -24,6 +24,9 @@ RCONFLICTS_${PN}_libvirtd = "connman"
 
 SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz \
            file://tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch \
+           file://LXC-Don-t-mount-securityfs-when-user-namespace-enabl.patch \
+           file://Move-array-of-mounts-out-of-lxcContainerMountBasicFS.patch \
+           file://LXC-don-t-try-to-mount-selinux-filesystem-when-user-.patch \
 	   file://libvirtd.sh \
 	   file://libvirtd.conf"
 
-- 
1.8.1.2


