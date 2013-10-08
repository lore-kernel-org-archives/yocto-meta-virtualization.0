Return-Path: <b43198@fsr-fed1764-008.ea.freescale.net>
Received: from db8outboundpool.messaging.microsoft.com
	(mail-db8lp0185.outbound.messaging.microsoft.com [213.199.154.185])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CC9A6E01664
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Oct 2013 07:17:32 -0700 (PDT)
Received: from mail201-db8-R.bigfish.com (10.174.8.228) by
	DB8EHSOBE001.bigfish.com (10.174.4.64) with Microsoft SMTP Server id
	14.1.225.22; Tue, 8 Oct 2013 14:17:30 +0000
Received: from mail201-db8 (localhost [127.0.0.1])	by
	mail201-db8-R.bigfish.com (Postfix) with ESMTP id 4D5CABA004A	for
	<meta-virtualization@yoctoproject.org>;
	Tue,  8 Oct 2013 14:17:30 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h177df4h17326ah1de097h186068h8275bh8275dhz2dh2a8h839hd24he5bhf0ah107ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e1dh1e23h1fe8h1ff5h1155h)
Received: from mail201-db8 (localhost.localdomain [127.0.0.1]) by mail201-db8
	(MessageSwitch) id 1381241846260028_6709;
	Tue,  8 Oct 2013 14:17:26 +0000 (UTC)
Received: from DB8EHSMHS026.bigfish.com (unknown [10.174.8.250])	by
	mail201-db8.bigfish.com (Postfix) with ESMTP id 3B677980062	for
	<meta-virtualization@yoctoproject.org>;
	Tue,  8 Oct 2013 14:17:26 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB8EHSMHS026.bigfish.com
	(10.174.4.36) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Tue, 8 Oct 2013 14:17:25 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Tue, 8 Oct 2013 14:17:24 +0000
Received: from fsr-fed1764-008.ea.freescale.net
	(fsr-fed1764-008.ea.freescale.net [10.171.73.92])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id r98EHN7A011948;
	Tue, 8 Oct 2013 07:17:24 -0700
Received: (from b43198@localhost)	by fsr-fed1764-008.ea.freescale.net
	(8.14.5/8.14.5/Submit) id r98EHMrm021922; Tue, 8 Oct 2013 17:17:22 +0300
From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 8 Oct 2013 17:17:20 +0300
Message-ID: <1381241840-21887-1-git-send-email-bogdan.purcareata@freescale.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.net
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [PATCH] libvirt: Try to fix selinux/securityfs mount handling in LXC
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
X-List-Received-Date: Tue, 08 Oct 2013 14:17:33 -0000
Content-Type: text/plain

The current behavior for libvirt containers is to
configure a set of "basic" mounts in the new container
environment by default. Some of these mounts, such as
securityfs or selinux, might not have kernel support on
all running platforms. The added patchset implements
proper handling for this case and makes some additional
cleanups and refactoring.

The patchset is taken from the upstream libvirt mailing
list. Please refer to:

https://www.redhat.com/archives/libvir-list/2013-October/msg00270.html

Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
---
 .../0001-Add-virFileIsMountPoint-function.patch    | 135 +++++++++++++++++++++
 ...2-Remove-unused-opts-field-from-LXC-basic.patch |  97 +++++++++++++++
 ...path-variable-in-lxcContainerMountBasicFS.patch |  78 ++++++++++++
 ...duplicate-entries-in-lxcBasicMounts-array.patch | 117 ++++++++++++++++++
 ...cMounts-to-control-use-in-user-namespaces.patch |  83 +++++++++++++
 ...y-files-which-are-not-mounted-on-the-host.patch | 106 ++++++++++++++++
 recipes-extended/libvirt/libvirt_1.1.2.bb          |   6 +
 7 files changed, 622 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/0001-Add-virFileIsMountPoint-function.patch
 create mode 100644 recipes-extended/libvirt/libvirt/0002-Remove-unused-opts-field-from-LXC-basic.patch
 create mode 100644 recipes-extended/libvirt/libvirt/0003-Remove-pointless-srcpath-variable-in-lxcContainerMountBasicFS.patch
 create mode 100644 recipes-extended/libvirt/libvirt/0004-Remove-duplicate-entries-in-lxcBasicMounts-array.patch
 create mode 100644 recipes-extended/libvirt/libvirt/0005-Add-flag-to-lxcBasicMounts-to-control-use-in-user-namespaces.patch
 create mode 100644 recipes-extended/libvirt/libvirt/0006-Skip-any-files-which-are-not-mounted-on-the-host.patch

diff --git a/recipes-extended/libvirt/libvirt/0001-Add-virFileIsMountPoint-function.patch b/recipes-extended/libvirt/libvirt/0001-Add-virFileIsMountPoint-function.patch
new file mode 100644
index 0000000..0affcbe
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/0001-Add-virFileIsMountPoint-function.patch
@@ -0,0 +1,135 @@
+From: "Daniel P. Berrange" <berrange@redhat.com>
+To: libvir-list@redhat.com
+Date: Mon,  7 Oct 2013 14:06:46 +0100
+Message-Id: <1381151211-27111-2-git-send-email-berrange@redhat.com>
+In-Reply-To: <1381151211-27111-1-git-send-email-berrange@redhat.com>
+References: <1381151211-27111-1-git-send-email-berrange@redhat.com>
+X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
+X-loop: libvir-list@redhat.com
+Subject: [libvirt] [PATCH 1/6] Add virFileIsMountPoint function
+X-BeenThere: libvir-list@redhat.com
+X-Mailman-Version: 2.1.12
+Precedence: junk
+List-Id: Development discussions about the libvirt library & tools
+	<libvir-list.redhat.com>
+List-Unsubscribe: <https://www.redhat.com/mailman/options/libvir-list>,
+	<mailto:libvir-list-request@redhat.com?subject=unsubscribe>
+List-Archive: <https://www.redhat.com/archives/libvir-list>
+List-Post: <mailto:libvir-list@redhat.com>
+List-Help: <mailto:libvir-list-request@redhat.com?subject=help>
+List-Subscribe: <https://www.redhat.com/mailman/listinfo/libvir-list>,
+	<mailto:libvir-list-request@redhat.com?subject=subscribe>
+X-List-Received-Date: Mon, 07 Oct 2013 13:06:56 -0000
+
+From: "Daniel P. Berrange" <berrange@redhat.com>
+
+Add a function for efficiently checking if a path is a filesystem
+mount point.
+
+NB will not work for bind mounts, only true filesystem mounts.
+
+Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
+---
+ src/libvirt_private.syms |  1 +
+ src/util/virfile.c       | 58 ++++++++++++++++++++++++++++++++++++++++++++++++
+ src/util/virfile.h       |  2 ++
+ 3 files changed, 61 insertions(+)
+
+diff --git a/src/libvirt_private.syms b/src/libvirt_private.syms
+index fe40834..31fa604 100644
+--- a/src/libvirt_private.syms
++++ b/src/libvirt_private.syms
+@@ -1182,6 +1182,7 @@ virFileIsAbsPath;
+ virFileIsDir;
+ virFileIsExecutable;
+ virFileIsLink;
++virFileIsMountPoint;
+ virFileLinkPointsTo;
+ virFileLock;
+ virFileLoopDeviceAssociate;
+diff --git a/src/util/virfile.c b/src/util/virfile.c
+index e10de5a..fa21aeb 100644
+--- a/src/util/virfile.c
++++ b/src/util/virfile.c
+@@ -1513,6 +1513,64 @@ virFileIsExecutable(const char *file)
+     return false;
+ }
+ 
++
++/*
++ * Check that a file refers to a mount point. Trick is that for
++ * a mount point, the st_dev field will differ from the parent
++ * directory.
++ *
++ * Note that this will not detect bind mounts of dirs/files,
++ * only true filesystem mounts.
++ */
++int virFileIsMountPoint(const char *file)
++{
++    char *parent = NULL;
++    char *tmp;
++    int ret = -1;
++    struct stat sb1, sb2;
++
++    if (VIR_STRDUP_QUIET(parent, file) < 0)
++        goto cleanup;
++
++    if (!(tmp = strrchr(parent, '/'))) {
++        virReportError(VIR_ERR_INTERNAL_ERROR,
++                       _("Could not find '/' in '%s'"),
++                       file);
++        goto cleanup;
++    }
++
++    *tmp = '\0';
++
++    VIR_DEBUG("Comparing '%s' to '%s'", file, parent);
++
++    if (stat(file, &sb1) < 0) {
++        if (errno == ENOENT)
++            ret = 0;
++        else
++            virReportSystemError(errno,
++                                 _("Cannot stat '%s'"),
++                                 file);
++        goto cleanup;
++    }
++
++    if (stat(parent, &sb2) < 0) {
++        virReportSystemError(errno,
++                             _("Cannot stat '%s'"),
++                             parent);
++        goto cleanup;
++    }
++
++    if (!S_ISDIR(sb1.st_mode))
++        return false;
++
++    ret = sb1.st_dev != sb2.st_dev;
++    VIR_DEBUG("Is mount %d", ret);
++
++ cleanup:
++    VIR_FREE(parent);
++    return ret;
++}
++
+ #ifndef WIN32
+ /* Check that a file is accessible under certain
+  * user & gid.
+diff --git a/src/util/virfile.h b/src/util/virfile.h
+index 72d35ce..ff84719 100644
+--- a/src/util/virfile.h
++++ b/src/util/virfile.h
+@@ -156,6 +156,8 @@ bool virFileIsDir (const char *file) ATTRIBUTE_NONNULL(1);
+ bool virFileExists(const char *file) ATTRIBUTE_NONNULL(1);
+ bool virFileIsExecutable(const char *file) ATTRIBUTE_NONNULL(1);
+ 
++int virFileIsMountPoint(const char *file) ATTRIBUTE_NONNULL(1);
++
+ char *virFileSanitizePath(const char *path);
+ 
+ enum {
+-- 
+1.8.3.1
+
+
diff --git a/recipes-extended/libvirt/libvirt/0002-Remove-unused-opts-field-from-LXC-basic.patch b/recipes-extended/libvirt/libvirt/0002-Remove-unused-opts-field-from-LXC-basic.patch
new file mode 100644
index 0000000..2a3d3ef
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/0002-Remove-unused-opts-field-from-LXC-basic.patch
@@ -0,0 +1,97 @@
+From: "Daniel P. Berrange" <berrange@redhat.com>
+To: libvir-list@redhat.com
+Date: Mon,  7 Oct 2013 14:06:47 +0100
+Message-Id: <1381151211-27111-3-git-send-email-berrange@redhat.com>
+In-Reply-To: <1381151211-27111-1-git-send-email-berrange@redhat.com>
+References: <1381151211-27111-1-git-send-email-berrange@redhat.com>
+X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
+X-loop: libvir-list@redhat.com
+Subject: [libvirt] [PATCH 2/6] Remove unused 'opts' field from LXC basic
+	mounts struct
+X-BeenThere: libvir-list@redhat.com
+X-Mailman-Version: 2.1.12
+Precedence: junk
+List-Id: Development discussions about the libvirt library & tools
+	<libvir-list.redhat.com>
+List-Unsubscribe: <https://www.redhat.com/mailman/options/libvir-list>,
+	<mailto:libvir-list-request@redhat.com?subject=unsubscribe>
+List-Archive: <https://www.redhat.com/archives/libvir-list>
+List-Post: <mailto:libvir-list@redhat.com>
+List-Help: <mailto:libvir-list-request@redhat.com?subject=help>
+List-Subscribe: <https://www.redhat.com/mailman/listinfo/libvir-list>,
+	<mailto:libvir-list-request@redhat.com?subject=subscribe>
+X-List-Received-Date: Mon, 07 Oct 2013 13:06:57 -0000
+
+From: "Daniel P. Berrange" <berrange@redhat.com>
+
+The virLXCBasicMountInfo struct contains a 'char *opts'
+field passed onto the mount() syscall. Every entry in the
+list sets this to NULL though, so it can be removed to
+simplify life.
+
+Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
+---
+ src/lxc/lxc_container.c | 29 ++++++++++++++---------------
+ 1 file changed, 14 insertions(+), 15 deletions(-)
+
+diff --git a/src/lxc/lxc_container.c b/src/lxc/lxc_container.c
+index b1f429c..3c89ed7 100644
+--- a/src/lxc/lxc_container.c
++++ b/src/lxc/lxc_container.c
+@@ -752,7 +752,6 @@ typedef struct {
+     const char *src;
+     const char *dst;
+     const char *type;
+-    const char *opts;
+     int mflags;
+ } virLXCBasicMountInfo;
+ 
+@@ -763,16 +762,16 @@ static const virLXCBasicMountInfo lxcBasicMounts[] = {
+      * mount point in the main OS becomes readonly too which is not what
+      * we want. Hence some things have two entries here.
+      */
+-    { "proc", "/proc", "proc", NULL, MS_NOSUID|MS_NOEXEC|MS_NODEV },
+-    { "/proc/sys", "/proc/sys", NULL, NULL, MS_BIND },
+-    { "/proc/sys", "/proc/sys", NULL, NULL, MS_BIND|MS_REMOUNT|MS_RDONLY },
+-    { "sysfs", "/sys", "sysfs", NULL, MS_NOSUID|MS_NOEXEC|MS_NODEV },
+-    { "sysfs", "/sys", "sysfs", NULL, MS_BIND|MS_REMOUNT|MS_RDONLY },
+-    { "securityfs", "/sys/kernel/security", "securityfs", NULL, MS_NOSUID|MS_NOEXEC|MS_NODEV },
+-    { "securityfs", "/sys/kernel/security", "securityfs", NULL, MS_BIND|MS_REMOUNT|MS_RDONLY },
++    { "proc", "/proc", "proc", MS_NOSUID|MS_NOEXEC|MS_NODEV },
++    { "/proc/sys", "/proc/sys", NULL, MS_BIND },
++    { "/proc/sys", "/proc/sys", NULL, MS_BIND|MS_REMOUNT|MS_RDONLY },
++    { "sysfs", "/sys", "sysfs", MS_NOSUID|MS_NOEXEC|MS_NODEV },
++    { "sysfs", "/sys", "sysfs", MS_BIND|MS_REMOUNT|MS_RDONLY },
++    { "securityfs", "/sys/kernel/security", "securityfs", MS_NOSUID|MS_NOEXEC|MS_NODEV },
++    { "securityfs", "/sys/kernel/security", "securityfs", MS_BIND|MS_REMOUNT|MS_RDONLY },
+ #if WITH_SELINUX
+-    { SELINUX_MOUNT, SELINUX_MOUNT, "selinuxfs", NULL, MS_NOSUID|MS_NOEXEC|MS_NODEV },
+-    { SELINUX_MOUNT, SELINUX_MOUNT, NULL, NULL, MS_BIND|MS_REMOUNT|MS_RDONLY },
++    { SELINUX_MOUNT, SELINUX_MOUNT, "selinuxfs", MS_NOSUID|MS_NOEXEC|MS_NODEV },
++    { SELINUX_MOUNT, SELINUX_MOUNT, NULL, MS_BIND|MS_REMOUNT|MS_RDONLY },
+ #endif
+ };
+ 
+@@ -882,13 +881,13 @@ static int lxcContainerMountBasicFS(bool userns_enabled)
+             goto cleanup;
+         }
+ 
+-        VIR_DEBUG("Mount %s on %s type=%s flags=%x, opts=%s",
+-                  srcpath, mnt->dst, mnt->type, mnt->mflags, mnt->opts);
+-        if (mount(srcpath, mnt->dst, mnt->type, mnt->mflags, mnt->opts) < 0) {
++        VIR_DEBUG("Mount %s on %s type=%s flags=%x",
++                  srcpath, mnt->dst, mnt->type, mnt->mflags);
++        if (mount(srcpath, mnt->dst, mnt->type, mnt->mflags, NULL) < 0) {
+             virReportSystemError(errno,
+-                                 _("Failed to mount %s on %s type %s flags=%x opts=%s"),
++                                 _("Failed to mount %s on %s type %s flags=%x"),
+                                  srcpath, mnt->dst, NULLSTR(mnt->type),
+-                                 mnt->mflags, NULLSTR(mnt->opts));
++                                 mnt->mflags);
+             goto cleanup;
+         }
+     }
+-- 
+1.8.3.1
+
+
diff --git a/recipes-extended/libvirt/libvirt/0003-Remove-pointless-srcpath-variable-in-lxcContainerMountBasicFS.patch b/recipes-extended/libvirt/libvirt/0003-Remove-pointless-srcpath-variable-in-lxcContainerMountBasicFS.patch
new file mode 100644
index 0000000..5135fb0
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/0003-Remove-pointless-srcpath-variable-in-lxcContainerMountBasicFS.patch
@@ -0,0 +1,78 @@
+From: "Daniel P. Berrange" <berrange@redhat.com>
+To: libvir-list@redhat.com
+Date: Mon,  7 Oct 2013 14:06:48 +0100
+Message-Id: <1381151211-27111-4-git-send-email-berrange@redhat.com>
+In-Reply-To: <1381151211-27111-1-git-send-email-berrange@redhat.com>
+References: <1381151211-27111-1-git-send-email-berrange@redhat.com>
+X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
+X-loop: libvir-list@redhat.com
+Subject: [libvirt] [PATCH 3/6] Remove pointless 'srcpath' variable in
+	lxcContainerMountBasicFS
+X-BeenThere: libvir-list@redhat.com
+X-Mailman-Version: 2.1.12
+Precedence: junk
+List-Id: Development discussions about the libvirt library & tools
+	<libvir-list.redhat.com>
+List-Unsubscribe: <https://www.redhat.com/mailman/options/libvir-list>,
+	<mailto:libvir-list-request@redhat.com?subject=unsubscribe>
+List-Archive: <https://www.redhat.com/archives/libvir-list>
+List-Post: <mailto:libvir-list@redhat.com>
+List-Help: <mailto:libvir-list-request@redhat.com?subject=help>
+List-Subscribe: <https://www.redhat.com/mailman/listinfo/libvir-list>,
+	<mailto:libvir-list-request@redhat.com?subject=subscribe>
+X-List-Received-Date: Mon, 07 Oct 2013 13:06:59 -0000
+
+From: "Daniel P. Berrange" <berrange@redhat.com>
+
+The 'srcpath' variable is initialized from 'mnt->src' and never
+changed thereafter. Some places continue to use 'mnt->src' and
+others use 'srcpath'. Remove the pointless 'srcpath' variable
+and use 'mnt->src' everywhere.
+
+Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
+---
+ src/lxc/lxc_container.c | 13 +++++--------
+ 1 file changed, 5 insertions(+), 8 deletions(-)
+
+diff --git a/src/lxc/lxc_container.c b/src/lxc/lxc_container.c
+index 3c89ed7..1b1c93b 100644
+--- a/src/lxc/lxc_container.c
++++ b/src/lxc/lxc_container.c
+@@ -853,16 +853,13 @@ static int lxcContainerMountBasicFS(bool userns_enabled)
+ 
+     for (i = 0; i < ARRAY_CARDINALITY(lxcBasicMounts); i++) {
+         virLXCBasicMountInfo const *mnt = &lxcBasicMounts[i];
+-        const char *srcpath = NULL;
+ 
+         VIR_DEBUG("Processing %s -> %s",
+                   mnt->src, mnt->dst);
+ 
+-        srcpath = mnt->src;
+-
+         /* Skip if mount doesn't exist in source */
+-        if ((srcpath[0] == '/') &&
+-            (access(srcpath, R_OK) < 0))
++        if ((mnt->src[0] == '/') &&
++            (access(mnt->src, R_OK) < 0))
+             continue;
+ 
+ #if WITH_SELINUX
+@@ -882,11 +879,11 @@ static int lxcContainerMountBasicFS(bool userns_enabled)
+         }
+ 
+         VIR_DEBUG("Mount %s on %s type=%s flags=%x",
+-                  srcpath, mnt->dst, mnt->type, mnt->mflags);
+-        if (mount(srcpath, mnt->dst, mnt->type, mnt->mflags, NULL) < 0) {
++                  mnt->src, mnt->dst, mnt->type, mnt->mflags);
++        if (mount(mnt->src, mnt->dst, mnt->type, mnt->mflags, NULL) < 0) {
+             virReportSystemError(errno,
+                                  _("Failed to mount %s on %s type %s flags=%x"),
+-                                 srcpath, mnt->dst, NULLSTR(mnt->type),
++                                 mnt->src, mnt->dst, NULLSTR(mnt->type),
+                                  mnt->mflags);
+             goto cleanup;
+         }
+-- 
+1.8.3.1
+
+
diff --git a/recipes-extended/libvirt/libvirt/0004-Remove-duplicate-entries-in-lxcBasicMounts-array.patch b/recipes-extended/libvirt/libvirt/0004-Remove-duplicate-entries-in-lxcBasicMounts-array.patch
new file mode 100644
index 0000000..c02295e
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/0004-Remove-duplicate-entries-in-lxcBasicMounts-array.patch
@@ -0,0 +1,117 @@
+From: "Daniel P. Berrange" <berrange@redhat.com>
+To: libvir-list@redhat.com
+Date: Mon,  7 Oct 2013 14:06:49 +0100
+Message-Id: <1381151211-27111-5-git-send-email-berrange@redhat.com>
+In-Reply-To: <1381151211-27111-1-git-send-email-berrange@redhat.com>
+References: <1381151211-27111-1-git-send-email-berrange@redhat.com>
+X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
+X-loop: libvir-list@redhat.com
+Subject: [libvirt] [PATCH 4/6] Remove duplicate entries in lxcBasicMounts
+	array
+X-BeenThere: libvir-list@redhat.com
+X-Mailman-Version: 2.1.12
+Precedence: junk
+List-Id: Development discussions about the libvirt library & tools
+	<libvir-list.redhat.com>
+List-Unsubscribe: <https://www.redhat.com/mailman/options/libvir-list>,
+	<mailto:libvir-list-request@redhat.com?subject=unsubscribe>
+List-Archive: <https://www.redhat.com/archives/libvir-list>
+List-Post: <mailto:libvir-list@redhat.com>
+List-Help: <mailto:libvir-list-request@redhat.com?subject=help>
+List-Subscribe: <https://www.redhat.com/mailman/listinfo/libvir-list>,
+	<mailto:libvir-list-request@redhat.com?subject=subscribe>
+X-List-Received-Date: Mon, 07 Oct 2013 13:07:00 -0000
+
+From: "Daniel P. Berrange" <berrange@redhat.com>
+
+Currently the lxcBasicMounts array has separate entries for
+most mounts, to reflect that we must do a separate mount
+operation to make mounts read-only. Remove the duplicate
+entries and instead set the MS_RDONLY flag against the main
+entry. Then change lxcContainerMountBasicFS to look for the
+MS_RDONLY flag, mask it out & do a separate bind mount.
+
+Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
+---
+ src/lxc/lxc_container.c | 44 +++++++++++++++++++++++++++-----------------
+ 1 file changed, 27 insertions(+), 17 deletions(-)
+
+diff --git a/src/lxc/lxc_container.c b/src/lxc/lxc_container.c
+index 1b1c93b..a7f71ef 100644
+--- a/src/lxc/lxc_container.c
++++ b/src/lxc/lxc_container.c
+@@ -756,22 +756,12 @@ typedef struct {
+ } virLXCBasicMountInfo;
+ 
+ static const virLXCBasicMountInfo lxcBasicMounts[] = {
+-    /* When we want to make a bind mount readonly, for unknown reasons,
+-     * it is currently necessary to bind it once, and then remount the
+-     * bind with the readonly flag. If this is not done, then the original
+-     * mount point in the main OS becomes readonly too which is not what
+-     * we want. Hence some things have two entries here.
+-     */
+     { "proc", "/proc", "proc", MS_NOSUID|MS_NOEXEC|MS_NODEV },
+-    { "/proc/sys", "/proc/sys", NULL, MS_BIND },
+-    { "/proc/sys", "/proc/sys", NULL, MS_BIND|MS_REMOUNT|MS_RDONLY },
+-    { "sysfs", "/sys", "sysfs", MS_NOSUID|MS_NOEXEC|MS_NODEV },
+-    { "sysfs", "/sys", "sysfs", MS_BIND|MS_REMOUNT|MS_RDONLY },
+-    { "securityfs", "/sys/kernel/security", "securityfs", MS_NOSUID|MS_NOEXEC|MS_NODEV },
+-    { "securityfs", "/sys/kernel/security", "securityfs", MS_BIND|MS_REMOUNT|MS_RDONLY },
++    { "/proc/sys", "/proc/sys", NULL, MS_BIND|MS_RDONLY },
++    { "sysfs", "/sys", "sysfs", MS_NOSUID|MS_NOEXEC|MS_NODEV|MS_RDONLY },
++    { "securityfs", "/sys/kernel/security", "securityfs", MS_NOSUID|MS_NOEXEC|MS_NODEV|MS_RDONLY },
+ #if WITH_SELINUX
+-    { SELINUX_MOUNT, SELINUX_MOUNT, "selinuxfs", MS_NOSUID|MS_NOEXEC|MS_NODEV },
+-    { SELINUX_MOUNT, SELINUX_MOUNT, NULL, MS_BIND|MS_REMOUNT|MS_RDONLY },
++    { SELINUX_MOUNT, SELINUX_MOUNT, "selinuxfs", MS_NOSUID|MS_NOEXEC|MS_NODEV|MS_RDONLY },
+ #endif
+ };
+ 
+@@ -852,6 +842,7 @@ static int lxcContainerMountBasicFS(bool userns_enabled)
+     VIR_DEBUG("Mounting basic filesystems");
+ 
+     for (i = 0; i < ARRAY_CARDINALITY(lxcBasicMounts); i++) {
++        bool bindOverReadonly;
+         virLXCBasicMountInfo const *mnt = &lxcBasicMounts[i];
+ 
+         VIR_DEBUG("Processing %s -> %s",
+@@ -878,13 +869,32 @@ static int lxcContainerMountBasicFS(bool userns_enabled)
+             goto cleanup;
+         }
+ 
++        /*
++         * We can't immediately set the MS_RDONLY flag when mounting filesystems
++         * because (in at least some kernel versions) this will propagate back
++         * to the original mount in the host OS, turning it readonly too. This
++         * We mount the filesystem in read-write mode initially, and then do a
++         * separate read-only bind mount on top of that.
++         */
++        bindOverReadonly = !!(mnt->mflags & MS_RDONLY);
++
+         VIR_DEBUG("Mount %s on %s type=%s flags=%x",
+-                  mnt->src, mnt->dst, mnt->type, mnt->mflags);
+-        if (mount(mnt->src, mnt->dst, mnt->type, mnt->mflags, NULL) < 0) {
++                  mnt->src, mnt->dst, mnt->type, mnt->mflags & ~MS_RDONLY);
++        if (mount(mnt->src, mnt->dst, mnt->type, mnt->mflags & ~MS_RDONLY, NULL) < 0) {
+             virReportSystemError(errno,
+                                  _("Failed to mount %s on %s type %s flags=%x"),
+                                  mnt->src, mnt->dst, NULLSTR(mnt->type),
+-                                 mnt->mflags);
++                                 mnt->mflags & ~MS_RDONLY);
++            goto cleanup;
++        }
++
++        if (bindOverReadonly &&
++            mount(mnt->src, mnt->dst, NULL,
++                  MS_BIND|MS_REMOUNT|MS_RDONLY, NULL) < 0) {
++            virReportSystemError(errno,
++                                 _("Failed to re-mount %s on %s flags=%x"),
++                                 mnt->src, mnt->dst,
++                                 MS_BIND|MS_REMOUNT|MS_RDONLY);
+             goto cleanup;
+         }
+     }
+-- 
+1.8.3.1
+
+
diff --git a/recipes-extended/libvirt/libvirt/0005-Add-flag-to-lxcBasicMounts-to-control-use-in-user-namespaces.patch b/recipes-extended/libvirt/libvirt/0005-Add-flag-to-lxcBasicMounts-to-control-use-in-user-namespaces.patch
new file mode 100644
index 0000000..c9e0afc
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/0005-Add-flag-to-lxcBasicMounts-to-control-use-in-user-namespaces.patch
@@ -0,0 +1,83 @@
+From: "Daniel P. Berrange" <berrange@redhat.com>
+To: libvir-list@redhat.com
+Date: Mon,  7 Oct 2013 14:06:50 +0100
+Message-Id: <1381151211-27111-6-git-send-email-berrange@redhat.com>
+In-Reply-To: <1381151211-27111-1-git-send-email-berrange@redhat.com>
+References: <1381151211-27111-1-git-send-email-berrange@redhat.com>
+X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
+X-loop: libvir-list@redhat.com
+Subject: [libvirt] [PATCH 5/6] Add flag to lxcBasicMounts to control use in
+	user namespaces
+X-BeenThere: libvir-list@redhat.com
+X-Mailman-Version: 2.1.12
+Precedence: junk
+List-Id: Development discussions about the libvirt library & tools
+	<libvir-list.redhat.com>
+List-Unsubscribe: <https://www.redhat.com/mailman/options/libvir-list>,
+	<mailto:libvir-list-request@redhat.com?subject=unsubscribe>
+List-Archive: <https://www.redhat.com/archives/libvir-list>
+List-Post: <mailto:libvir-list@redhat.com>
+List-Help: <mailto:libvir-list-request@redhat.com?subject=help>
+List-Subscribe: <https://www.redhat.com/mailman/listinfo/libvir-list>,
+	<mailto:libvir-list-request@redhat.com?subject=subscribe>
+X-List-Received-Date: Mon, 07 Oct 2013 13:07:02 -0000
+
+From: "Daniel P. Berrange" <berrange@redhat.com>
+
+Some mounts must be skipped if running inside a user namespace,
+since the kernel forbids their use. Instead of strcmp'ing the
+filesystem type in the body of the loop, set an explicit flag
+in the lxcBasicMounts table.
+
+Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
+---
+ src/lxc/lxc_container.c | 17 ++++++++++-------
+ 1 file changed, 10 insertions(+), 7 deletions(-)
+
+diff --git a/src/lxc/lxc_container.c b/src/lxc/lxc_container.c
+index a7f71ef..05190bf 100644
+--- a/src/lxc/lxc_container.c
++++ b/src/lxc/lxc_container.c
+@@ -753,15 +753,16 @@ typedef struct {
+     const char *dst;
+     const char *type;
+     int mflags;
++    bool skipUserNS;
+ } virLXCBasicMountInfo;
+ 
+ static const virLXCBasicMountInfo lxcBasicMounts[] = {
+-    { "proc", "/proc", "proc", MS_NOSUID|MS_NOEXEC|MS_NODEV },
+-    { "/proc/sys", "/proc/sys", NULL, MS_BIND|MS_RDONLY },
+-    { "sysfs", "/sys", "sysfs", MS_NOSUID|MS_NOEXEC|MS_NODEV|MS_RDONLY },
+-    { "securityfs", "/sys/kernel/security", "securityfs", MS_NOSUID|MS_NOEXEC|MS_NODEV|MS_RDONLY },
++    { "proc", "/proc", "proc", MS_NOSUID|MS_NOEXEC|MS_NODEV, false },
++    { "/proc/sys", "/proc/sys", NULL, MS_BIND|MS_RDONLY, false },
++    { "sysfs", "/sys", "sysfs", MS_NOSUID|MS_NOEXEC|MS_NODEV|MS_RDONLY, false },
++    { "securityfs", "/sys/kernel/security", "securityfs", MS_NOSUID|MS_NOEXEC|MS_NODEV|MS_RDONLY, true },
+ #if WITH_SELINUX
+-    { SELINUX_MOUNT, SELINUX_MOUNT, "selinuxfs", MS_NOSUID|MS_NOEXEC|MS_NODEV|MS_RDONLY },
++    { SELINUX_MOUNT, SELINUX_MOUNT, "selinuxfs", MS_NOSUID|MS_NOEXEC|MS_NODEV|MS_RDONLY, true },
+ #endif
+ };
+ 
+@@ -855,12 +856,14 @@ static int lxcContainerMountBasicFS(bool userns_enabled)
+ 
+ #if WITH_SELINUX
+         if (STREQ(mnt->src, SELINUX_MOUNT) &&
+-            (!is_selinux_enabled() || userns_enabled))
++            !is_selinux_enabled())
+             continue;
+ #endif
+ 
+-        if (STREQ(mnt->src, "securityfs") && userns_enabled)
++        if (mnt->skipUserNS && userns_enabled) {
++            VIR_DEBUG("Skipping due to user ns enablement");
+             continue;
++        }
+ 
+         if (virFileMakePath(mnt->dst) < 0) {
+             virReportSystemError(errno,
+-- 
+1.8.3.1
+
+
diff --git a/recipes-extended/libvirt/libvirt/0006-Skip-any-files-which-are-not-mounted-on-the-host.patch b/recipes-extended/libvirt/libvirt/0006-Skip-any-files-which-are-not-mounted-on-the-host.patch
new file mode 100644
index 0000000..a0ac414
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/0006-Skip-any-files-which-are-not-mounted-on-the-host.patch
@@ -0,0 +1,106 @@
+From: "Daniel P. Berrange" <berrange@redhat.com>
+To: libvir-list@redhat.com
+Date: Mon,  7 Oct 2013 14:06:51 +0100
+Message-Id: <1381151211-27111-7-git-send-email-berrange@redhat.com>
+In-Reply-To: <1381151211-27111-1-git-send-email-berrange@redhat.com>
+References: <1381151211-27111-1-git-send-email-berrange@redhat.com>
+X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
+X-loop: libvir-list@redhat.com
+Subject: [libvirt] [PATCH 6/6] Skip any files which are not mounted on the
+	host
+X-BeenThere: libvir-list@redhat.com
+X-Mailman-Version: 2.1.12
+Precedence: junk
+List-Id: Development discussions about the libvirt library & tools
+	<libvir-list.redhat.com>
+List-Unsubscribe: <https://www.redhat.com/mailman/options/libvir-list>,
+	<mailto:libvir-list-request@redhat.com?subject=unsubscribe>
+List-Archive: <https://www.redhat.com/archives/libvir-list>
+List-Post: <mailto:libvir-list@redhat.com>
+List-Help: <mailto:libvir-list-request@redhat.com?subject=help>
+List-Subscribe: <https://www.redhat.com/mailman/listinfo/libvir-list>,
+	<mailto:libvir-list-request@redhat.com?subject=subscribe>
+X-List-Received-Date: Mon, 07 Oct 2013 13:07:03 -0000
+
+From: "Daniel P. Berrange" <berrange@redhat.com>
+
+Currently the LXC container tries to skip selinux/securityfs
+mounts if the directory does not exist in the filesystem,
+or if SELinux is disabled.
+
+The former check is flawed because the /sys/fs/selinux
+or /sys/kernel/securityfs directories may exist in sysfs
+even if the mount type is disabled. Instead of just doing
+an access() check, use an virFileIsMounted() to see if
+the FS is actually present in the host OS. This also
+avoids the need to check is_selinux_enabled().
+
+Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
+---
+ src/lxc/lxc_container.c | 37 +++++++++++++++++++++++--------------
+ 1 file changed, 23 insertions(+), 14 deletions(-)
+
+diff --git a/src/lxc/lxc_container.c b/src/lxc/lxc_container.c
+index 05190bf..4ec7b67 100644
+--- a/src/lxc/lxc_container.c
++++ b/src/lxc/lxc_container.c
+@@ -754,15 +754,16 @@ typedef struct {
+     const char *type;
+     int mflags;
+     bool skipUserNS;
++    bool skipUnmounted;
+ } virLXCBasicMountInfo;
+ 
+ static const virLXCBasicMountInfo lxcBasicMounts[] = {
+-    { "proc", "/proc", "proc", MS_NOSUID|MS_NOEXEC|MS_NODEV, false },
+-    { "/proc/sys", "/proc/sys", NULL, MS_BIND|MS_RDONLY, false },
+-    { "sysfs", "/sys", "sysfs", MS_NOSUID|MS_NOEXEC|MS_NODEV|MS_RDONLY, false },
+-    { "securityfs", "/sys/kernel/security", "securityfs", MS_NOSUID|MS_NOEXEC|MS_NODEV|MS_RDONLY, true },
++    { "proc", "/proc", "proc", MS_NOSUID|MS_NOEXEC|MS_NODEV, false, false },
++    { "/proc/sys", "/proc/sys", NULL, MS_BIND|MS_RDONLY, false, false },
++    { "sysfs", "/sys", "sysfs", MS_NOSUID|MS_NOEXEC|MS_NODEV|MS_RDONLY, false, false },
++    { "securityfs", "/sys/kernel/security", "securityfs", MS_NOSUID|MS_NOEXEC|MS_NODEV|MS_RDONLY, true, true },
+ #if WITH_SELINUX
+-    { SELINUX_MOUNT, SELINUX_MOUNT, "selinuxfs", MS_NOSUID|MS_NOEXEC|MS_NODEV|MS_RDONLY, true },
++    { SELINUX_MOUNT, SELINUX_MOUNT, "selinuxfs", MS_NOSUID|MS_NOEXEC|MS_NODEV|MS_RDONLY, true, true },
+ #endif
+ };
+ 
+@@ -849,16 +850,24 @@ static int lxcContainerMountBasicFS(bool userns_enabled)
+         VIR_DEBUG("Processing %s -> %s",
+                   mnt->src, mnt->dst);
+ 
+-        /* Skip if mount doesn't exist in source */
+-        if ((mnt->src[0] == '/') &&
+-            (access(mnt->src, R_OK) < 0))
+-            continue;
++        if (mnt->skipUnmounted) {
++            char *hostdir;
++            int ret;
+ 
+-#if WITH_SELINUX
+-        if (STREQ(mnt->src, SELINUX_MOUNT) &&
+-            !is_selinux_enabled())
+-            continue;
+-#endif
++            if (virAsprintf(&hostdir, "/.oldroot%s", mnt->dst) < 0)
++                goto cleanup;
++
++            ret = virFileIsMountPoint(hostdir);
++            VIR_FREE(hostdir);
++            if (ret < 0)
++                goto cleanup;
++
++            if (ret == 0) {
++                VIR_DEBUG("Skipping '%s' which isn't mounted in host",
++                          mnt->dst);
++                continue;
++            }
++        }
+ 
+         if (mnt->skipUserNS && userns_enabled) {
+             VIR_DEBUG("Skipping due to user ns enablement");
+-- 
+1.8.3.1
+
+
diff --git a/recipes-extended/libvirt/libvirt_1.1.2.bb b/recipes-extended/libvirt/libvirt_1.1.2.bb
index a12147a..819072d 100644
--- a/recipes-extended/libvirt/libvirt_1.1.2.bb
+++ b/recipes-extended/libvirt/libvirt_1.1.2.bb
@@ -27,6 +27,12 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz \
            file://LXC-Don-t-mount-securityfs-when-user-namespace-enabl.patch \
            file://Move-array-of-mounts-out-of-lxcContainerMountBasicFS.patch \
            file://LXC-don-t-try-to-mount-selinux-filesystem-when-user-.patch \
+	   file://0001-Add-virFileIsMountPoint-function.patch \
+	   file://0002-Remove-unused-opts-field-from-LXC-basic.patch \
+	   file://0003-Remove-pointless-srcpath-variable-in-lxcContainerMountBasicFS.patch \
+	   file://0004-Remove-duplicate-entries-in-lxcBasicMounts-array.patch \
+	   file://0005-Add-flag-to-lxcBasicMounts-to-control-use-in-user-namespaces.patch \
+	   file://0006-Skip-any-files-which-are-not-mounted-on-the-host.patch \
 	   file://libvirtd.sh \
 	   file://libvirtd.conf"
 
-- 
1.7.11.7



