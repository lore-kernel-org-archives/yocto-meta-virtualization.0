Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2F8EFE00DFC; Wed, 30 Oct 2019 01:27:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C68FDE004F6
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 Oct 2019 01:27:08 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9U8R89O003178
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 Oct 2019 01:27:08 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Wed, 30 Oct 2019 01:27:06 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 30 Oct 2019 16:27:05 +0800
Message-ID: <20191030082705.11361-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] runc: fix CVE-2019-16884
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
X-List-Received-Date: Wed, 30 Oct 2019 08:27:11 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...nly-allow-proc-mount-if-it-is-procfs.patch | 201 ++++++++++++++++++
 recipes-containers/runc/runc-docker_git.bb    |   1 +
 2 files changed, 202 insertions(+)
 create mode 100644 recipes-containers/runc/files/0001-Only-allow-proc-mount-if-it-is-procfs.patch

diff --git a/recipes-containers/runc/files/0001-Only-allow-proc-mount-if-it-is-procfs.patch b/recipes-containers/runc/files/0001-Only-allow-proc-mount-if-it-is-procfs.patch
new file mode 100644
index 0000000..5aca99e
--- /dev/null
+++ b/recipes-containers/runc/files/0001-Only-allow-proc-mount-if-it-is-procfs.patch
@@ -0,0 +1,201 @@
+From d75b05441772417a0828465a9483f16287937724 Mon Sep 17 00:00:00 2001
+From: Michael Crosby <crosbymichael@gmail.com>
+Date: Mon, 23 Sep 2019 16:45:45 -0400
+Subject: [PATCH] Only allow proc mount if it is procfs
+
+Fixes #2128
+
+This allows proc to be bind mounted for host and rootless namespace usecases but
+it removes the ability to mount over the top of proc with a directory.
+
+```bash
+> sudo docker run --rm  apparmor
+docker: Error response from daemon: OCI runtime create failed:
+container_linux.go:346: starting container process caused "process_linux.go:449:
+container init caused \"rootfs_linux.go:58: mounting
+\\\"/var/lib/docker/volumes/aae28ea068c33d60e64d1a75916cf3ec2dc3634f97571854c9ed30c8401460c1/_data\\\"
+to rootfs
+\\\"/var/lib/docker/overlay2/a6be5ae911bf19f8eecb23a295dec85be9a8ee8da66e9fb55b47c841d1e381b7/merged\\\"
+at \\\"/proc\\\" caused
+\\\"\\\\\\\"/var/lib/docker/overlay2/a6be5ae911bf19f8eecb23a295dec85be9a8ee8da66e9fb55b47c841d1e381b7/merged/proc\\\\\\\"
+cannot be mounted because it is not of type proc\\\"\"": unknown.
+
+> sudo docker run --rm -v /proc:/proc apparmor
+
+docker-default (enforce)        root     18989  0.9  0.0   1288     4 ?
+Ss   16:47   0:00 sleep 20
+```
+
+Signed-off-by: Michael Crosby <crosbymichael@gmail.com>
+
+Upstream-Status: Backport [https://github.com/opencontainers/runc/pull/2129/commits/331692baa7afdf6c186f8667cb0e6362ea0802b3]
+
+CVE: CVE-2019-16884
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ libcontainer/container_linux.go   |  4 +--
+ libcontainer/rootfs_linux.go      | 50 +++++++++++++++++++++++--------
+ libcontainer/rootfs_linux_test.go |  8 ++---
+ 3 files changed, 43 insertions(+), 19 deletions(-)
+
+diff --git a/libcontainer/container_linux.go b/libcontainer/container_linux.go
+index 7e58e5e0..d51e35df 100644
+--- a/src/import/libcontainer/container_linux.go
++++ b/src/import/libcontainer/container_linux.go
+@@ -19,7 +19,7 @@ import (
+ 	"syscall" // only for SysProcAttr and Signal
+ 	"time"
+ 
+-	"github.com/cyphar/filepath-securejoin"
++	securejoin "github.com/cyphar/filepath-securejoin"
+ 	"github.com/opencontainers/runc/libcontainer/cgroups"
+ 	"github.com/opencontainers/runc/libcontainer/configs"
+ 	"github.com/opencontainers/runc/libcontainer/intelrdt"
+@@ -1160,7 +1160,7 @@ func (c *linuxContainer) makeCriuRestoreMountpoints(m *configs.Mount) error {
+ 		if err != nil {
+ 			return err
+ 		}
+-		if err := checkMountDestination(c.config.Rootfs, dest); err != nil {
++		if err := checkProcMount(c.config.Rootfs, dest, ""); err != nil {
+ 			return err
+ 		}
+ 		m.Destination = dest
+diff --git a/libcontainer/rootfs_linux.go b/libcontainer/rootfs_linux.go
+index f13b226e..5650b0ac 100644
+--- a/src/import/libcontainer/rootfs_linux.go
++++ b/src/import/libcontainer/rootfs_linux.go
+@@ -13,7 +13,7 @@ import (
+ 	"strings"
+ 	"time"
+ 
+-	"github.com/cyphar/filepath-securejoin"
++	securejoin "github.com/cyphar/filepath-securejoin"
+ 	"github.com/mrunalp/fileutils"
+ 	"github.com/opencontainers/runc/libcontainer/cgroups"
+ 	"github.com/opencontainers/runc/libcontainer/configs"
+@@ -197,7 +197,7 @@ func prepareBindMount(m *configs.Mount, rootfs string) error {
+ 	if dest, err = securejoin.SecureJoin(rootfs, m.Destination); err != nil {
+ 		return err
+ 	}
+-	if err := checkMountDestination(rootfs, dest); err != nil {
++	if err := checkProcMount(rootfs, dest, m.Source); err != nil {
+ 		return err
+ 	}
+ 	// update the mount with the correct dest after symlinks are resolved.
+@@ -388,7 +388,7 @@ func mountToRootfs(m *configs.Mount, rootfs, mountLabel string, enableCgroupns b
+ 		if dest, err = securejoin.SecureJoin(rootfs, m.Destination); err != nil {
+ 			return err
+ 		}
+-		if err := checkMountDestination(rootfs, dest); err != nil {
++		if err := checkProcMount(rootfs, dest, m.Source); err != nil {
+ 			return err
+ 		}
+ 		// update the mount with the correct dest after symlinks are resolved.
+@@ -435,12 +435,12 @@ func getCgroupMounts(m *configs.Mount) ([]*configs.Mount, error) {
+ 	return binds, nil
+ }
+ 
+-// checkMountDestination checks to ensure that the mount destination is not over the top of /proc.
++// checkProcMount checks to ensure that the mount destination is not over the top of /proc.
+ // dest is required to be an abs path and have any symlinks resolved before calling this function.
+-func checkMountDestination(rootfs, dest string) error {
+-	invalidDestinations := []string{
+-		"/proc",
+-	}
++//
++// if source is nil, don't stat the filesystem.  This is used for restore of a checkpoint.
++func checkProcMount(rootfs, dest, source string) error {
++	const procPath = "/proc"
+ 	// White list, it should be sub directories of invalid destinations
+ 	validDestinations := []string{
+ 		// These entries can be bind mounted by files emulated by fuse,
+@@ -463,16 +463,40 @@ func checkMountDestination(rootfs, dest string) error {
+ 			return nil
+ 		}
+ 	}
+-	for _, invalid := range invalidDestinations {
+-		path, err := filepath.Rel(filepath.Join(rootfs, invalid), dest)
++	path, err := filepath.Rel(filepath.Join(rootfs, procPath), dest)
++	if err != nil {
++		return err
++	}
++	// pass if the mount path is located outside of /proc
++	if strings.HasPrefix(path, "..") {
++		return nil
++	}
++	if path == "." {
++		// an empty source is pasted on restore
++		if source == "" {
++			return nil
++		}
++		// only allow a mount on-top of proc if it's source is "proc"
++		isproc, err := isProc(source)
+ 		if err != nil {
+ 			return err
+ 		}
+-		if path != "." && !strings.HasPrefix(path, "..") {
+-			return fmt.Errorf("%q cannot be mounted because it is located inside %q", dest, invalid)
++		// pass if the mount is happening on top of /proc and the source of
++		// the mount is a proc filesystem
++		if isproc {
++			return nil
+ 		}
++		return fmt.Errorf("%q cannot be mounted because it is not of type proc", dest)
+ 	}
+-	return nil
++	return fmt.Errorf("%q cannot be mounted because it is inside /proc", dest)
++}
++
++func isProc(path string) (bool, error) {
++	var s unix.Statfs_t
++	if err := unix.Statfs(path, &s); err != nil {
++		return false, err
++	}
++	return s.Type == unix.PROC_SUPER_MAGIC, nil
+ }
+ 
+ func setupDevSymlinks(rootfs string) error {
+diff --git a/libcontainer/rootfs_linux_test.go b/libcontainer/rootfs_linux_test.go
+index d755984b..1bfe7c66 100644
+--- a/src/import/libcontainer/rootfs_linux_test.go
++++ b/src/import/libcontainer/rootfs_linux_test.go
+@@ -10,7 +10,7 @@ import (
+ 
+ func TestCheckMountDestOnProc(t *testing.T) {
+ 	dest := "/rootfs/proc/sys"
+-	err := checkMountDestination("/rootfs", dest)
++	err := checkProcMount("/rootfs", dest, "")
+ 	if err == nil {
+ 		t.Fatal("destination inside proc should return an error")
+ 	}
+@@ -18,7 +18,7 @@ func TestCheckMountDestOnProc(t *testing.T) {
+ 
+ func TestCheckMountDestOnProcChroot(t *testing.T) {
+ 	dest := "/rootfs/proc/"
+-	err := checkMountDestination("/rootfs", dest)
++	err := checkProcMount("/rootfs", dest, "/proc")
+ 	if err != nil {
+ 		t.Fatal("destination inside proc when using chroot should not return an error")
+ 	}
+@@ -26,7 +26,7 @@ func TestCheckMountDestOnProcChroot(t *testing.T) {
+ 
+ func TestCheckMountDestInSys(t *testing.T) {
+ 	dest := "/rootfs//sys/fs/cgroup"
+-	err := checkMountDestination("/rootfs", dest)
++	err := checkProcMount("/rootfs", dest, "")
+ 	if err != nil {
+ 		t.Fatal("destination inside /sys should not return an error")
+ 	}
+@@ -34,7 +34,7 @@ func TestCheckMountDestInSys(t *testing.T) {
+ 
+ func TestCheckMountDestFalsePositive(t *testing.T) {
+ 	dest := "/rootfs/sysfiles/fs/cgroup"
+-	err := checkMountDestination("/rootfs", dest)
++	err := checkProcMount("/rootfs", dest, "")
+ 	if err != nil {
+ 		t.Fatal(err)
+ 	}
+-- 
+2.17.1
+
diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
index c9f460b..8d810d0 100644
--- a/recipes-containers/runc/runc-docker_git.bb
+++ b/recipes-containers/runc/runc-docker_git.bb
@@ -7,6 +7,7 @@ SRC_URI = "git://github.com/opencontainers/runc;nobranch=1;name=runc-docker \
            file://0001-runc-Add-console-socket-dev-null.patch \
            file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
            file://0001-runc-docker-SIGUSR1-daemonize.patch \
+           file://0001-Only-allow-proc-mount-if-it-is-procfs.patch \
           "
 
 RUNC_VERSION = "1.0.0-rc8"
-- 
2.17.1


