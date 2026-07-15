Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8329C44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 17:26:05 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53.1784136358043437590
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Jul 2026 10:25:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=LvTOrA2L;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10218; q=dns/txt;
  s=iport01; t=1784136358; x=1785345958;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=l7JzbSbSe6Z+z93UtTS3J7QtlanE8HSM/Ylb9AjX5TE=;
  b=LvTOrA2LevzO+RK10dh+Ds1UkLU2F5yXu6Y/G/BJtl7rh60mvWnRFXWl
   1s1+wi8L+y8ZyvXb3jCXtipTwM04AqYNMXzJEgadbAzHMMQt6ecivNuID
   N2MNbfrgI3LERSuxhpCDNDeAOhWrPxfbsNBf6LmqbV/FlyggOhcv7yzjJ
   O+D8M0mVgDiCOcH7rrmYYcTlrov6iOjleze+Jtz2ZnyEJky+UPvO1rHqC
   2xrnizBRBWfC77hii+U2B7xRoK9AJlyxYV/t335/5go0mxyxYlFpp4qqg
   w+16MjrNXkgxC4YZ9Cn8W0VITZuwZDiV8I1UD6irS8Ti8WMK0ZThHl6U4
   A==;
X-CSE-ConnectionGUID: C9zFUVHsQCmQWXbPZ8hqlw==
X-CSE-MsgGUID: 7UZoZI2lRsmrWSWYJI7YDA==
X-IPAS-Result: =?us-ascii?q?A0DIAgD+wFdq/5P/Ja1aglmCV3RfQkkDhFSPUoIhnh6Bf?=
 =?us-ascii?q?g8BAQEPRA0EAQGSWAImNQgOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaASkPAXIDAQIDAiYCLSMYAQiDAgGCdAMRvQV6gTKBAYR92y4BC?=
 =?us-ascii?q?xQBgQouhT+DHQGFAlwYAYJJgjMnGxuBcoEVg2mBBYFcAoU7gkgiBIIigQyBW?=
 =?us-ascii?q?h6PeEiBAhwDWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XNFgbBwWBHYFQgQKEd?=
 =?us-ascii?q?iMfAzl/gTB1SnctahIXgVGCFIEYAwsYDUgRLDcUGwQ9AW4HjUklgj8xShMBK?=
 =?us-ascii?q?4ERCjIKAx40o1WCHqESCiiDdYwhlToaM4QEgVeSQJJRC5h9izeCU5ZQhGmBa?=
 =?us-ascii?q?QE6gVlwFYMiCUoZD44tCwuDYIUTgkTGQTw1CwMvAQEHAgcCDAMLgWiRfgEB?=
IronPort-Data: A9a23:wniMBa7kViv5EBvVW5r3vQxRtGvGchMFZxGqfqrLsTDasY5as4F+v
 jFOXWCBaKyDajbweo9wbtzj9U1SvZLXyNJqHlM9/npgZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2Qqaj1NtvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eFtwK1NtJIXp33
 vkhFwAHViLTh/uy3+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGMiFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEQUrsUIMpWcOOAinTyaTREqFW9rqss6G+Vxwt0uFToGIeNI4PbHpoMxi50o
 EqZwlb+MDBAMOaEzCC6yU2dpM6QrA/SDdd6+LqQs6QCbEeo7mkeFBRTS1qhveSwjk+sUs5eL
 Eo8/is1sbN05UugUt7lRRq6rXWY+BkGVLJt//YS8gqBzO/Qpg2eHGVBF2YHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:c6eth6qqvI8WiuU1A3vBV6gaV5odeYIsimQD101hICG9Ffbo8v
 xG/c5rtyMc5wx+ZJhNo7290cq7MBDhHOBOgLX5VI3KNGKNhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjizEht7t2uqUuEimpRGsZd0zs=
X-Talos-CUID: 9a23:adh3NWA87sc4gtP6EwI25mApJOA+S1bY9UjgKXeKWWZwTKLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3A8qhl/g7KL6AjBCED7JeASI71xow33papOmFXla8?=
 =?us-ascii?q?dvtO7DhNBGRbCvRieF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,165,1779148800"; 
   d="scan'208";a="501793710"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Jul 2026 17:25:57 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id ACA031800024F
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jul 2026 17:25:56 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id CF2A1CC037D; Wed, 15 Jul 2026 22:55:54 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][scarthgap][PATCH 1/2] docker-moby: Fix CVE-2026-41568
Date: Wed, 15 Jul 2026 22:55:48 +0530
Message-Id: <20260715172549.1152428-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jul 2026 17:26:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9952

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream 25.0 backport for CVE-2026-41568.
The upstream fix commit is referenced in [1], and the public CVE
advisory is referenced in [2]. The Scarthgap-specific Go 1.22 API
adaptation is documented in the embedded patch header.

[1] https://github.com/moby/moby/commit/742e28ed8d654372f0aa5b549da74c2f6e674194
[2] https://github.com/moby/moby/security/advisories/GHSA-vp62-88p7-qqf5

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 recipes-containers/docker/docker-moby_git.bb  |   1 +
 .../docker/files/CVE-2026-41568.patch         | 275 ++++++++++++++++++
 2 files changed, 276 insertions(+)
 create mode 100644 recipes-containers/docker/files/CVE-2026-41568.patch

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index eb493a4..f9121b3 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -59,6 +59,7 @@ SRC_URI = "\
 		file://CVE-2026-33997.patch;patchdir=src/import \
 		file://CVE-2026-34040_p1.patch;patchdir=src/import \
 		file://CVE-2026-34040_p2.patch;patchdir=src/import \
+		file://CVE-2026-41568.patch;patchdir=src/import \
 	"
 
 DOCKER_COMMIT = "${SRCREV_moby}"
diff --git a/recipes-containers/docker/files/CVE-2026-41568.patch b/recipes-containers/docker/files/CVE-2026-41568.patch
new file mode 100644
index 0000000..8dffd72
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2026-41568.patch
@@ -0,0 +1,275 @@
+From 9afb2d06f1d14b71be59d6662d4da2deacfb45fc Mon Sep 17 00:00:00 2001
+From: Deepak Rathore <deeratho@cisco.com>
+Date: Tue, 30 Jun 2026 05:16:06 -0700
+Subject: [PATCH] daemon/copy: Fix symlink escape in mount destination creation
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Use os.Root to scope all filesystem operations in createIfNotExists to
+the container root directory.
+
+This prevents a TOCTOU attack where a container process swaps a path
+component with a symlink between GetResourcePath resolution and
+directory/file creation, which could allow writing to arbitrary host
+paths outside the container.
+
+CVE: CVE-2026-41568
+Upstream-Status: Backport [https://github.com/moby/moby/commit/742e28ed8d654372f0aa5b549da74c2f6e674194]
+
+Backport Changes:
+- Replaced upstream os.Root operations with dirfd-relative
+  openat(2)/mkdirat(2) helpers, because Scarthgap uses Go 1.22 and
+  does not provide os.Root.
+- Kept O_NOFOLLOW while walking each path component so the backport
+  preserves the upstream root-scoped symlink protection.
+- Adapted the createIfNotExists unit test to open the container root
+  with unix.Open.
+
+(cherry picked from commit 64a22d80b93ddc1416b501b5145df02947312249)
+Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
+(cherry picked from commit 742e28ed8d654372f0aa5b549da74c2f6e674194)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ daemon/containerfs_linux.go      | 148 +++++++++++++++++++-
+ daemon/containerfs_linux_test.go |  51 +++++++
+ 2 files changed, 197 insertions(+), 2 deletions(-)
+ create mode 100644 daemon/containerfs_linux_test.go
+
+diff --git a/daemon/containerfs_linux.go b/daemon/containerfs_linux.go
+index 384c86b..ab6b199 100644
+--- a/daemon/containerfs_linux.go
++++ b/daemon/containerfs_linux.go
+@@ -19,7 +19,6 @@ import (
+ 	"github.com/docker/docker/container"
+ 	"github.com/docker/docker/internal/mounttree"
+ 	"github.com/docker/docker/internal/unshare"
+-	"github.com/docker/docker/pkg/fileutils"
+ )
+ 
+ type future struct {
+@@ -83,6 +82,13 @@ func (daemon *Daemon) openContainerFS(container *container.Container) (_ *contai
+ 			if err := mount.MakeRSlave("/"); err != nil {
+ 				return err
+ 			}
++
++			rootFd, err := unix.Open(container.BaseFS, unix.O_RDONLY|unix.O_DIRECTORY|unix.O_CLOEXEC, 0)
++			if err != nil {
++				return fmt.Errorf("open container root: %w", err)
++			}
++			defer unix.Close(rootFd)
++
+ 			for _, m := range mounts {
+ 				dest, err := container.GetResourcePath(m.Destination)
+ 				if err != nil {
+@@ -94,7 +100,7 @@ func (daemon *Daemon) openContainerFS(container *container.Container) (_ *contai
+ 				if err != nil {
+ 					return err
+ 				}
+-				if err := fileutils.CreateIfNotExists(dest, stat.IsDir()); err != nil {
++				if err := createIfNotExists(rootFd, strings.TrimPrefix(m.Destination, "/"), stat.IsDir()); err != nil {
+ 					return err
+ 				}
+ 
+@@ -242,6 +248,144 @@ func (vw *containerFSView) Stat(ctx context.Context, path string) (*types.Contai
+ 	return stat, err
+ }
+ 
++// createIfNotExists creates a file or directory below rootFd only if it does
++// not already exist. Path components are opened dirfd-relative with
++// O_NOFOLLOW so a container cannot swap in a symlink that escapes BaseFS.
++func createIfNotExists(rootFd int, unsafePath string, isDir bool) error {
++	if isDir {
++		return mkdirAllInRoot(rootFd, unsafePath)
++	}
++
++	parentPath := filepath.Dir(unsafePath)
++	if parentPath != "." && parentPath != "/" {
++		if err := mkdirAllInRoot(rootFd, parentPath); err != nil {
++			return err
++		}
++	}
++
++	parentFd, base, closeParent, err := openParentInRoot(rootFd, unsafePath)
++	if err != nil {
++		return err
++	}
++	if closeParent {
++		defer unix.Close(parentFd)
++	}
++
++	fd, err := unix.Openat(parentFd, base, unix.O_CREAT|unix.O_WRONLY|unix.O_CLOEXEC|unix.O_NOFOLLOW, 0o755)
++	if err != nil {
++		return err
++	}
++	return unix.Close(fd)
++}
++
++func mkdirAllInRoot(rootFd int, unsafePath string) error {
++	parts, err := pathComponents(unsafePath)
++	if err != nil {
++		return err
++	}
++
++	currentFd := rootFd
++	closeCurrent := false
++	for _, part := range parts {
++		nextFd, err := openDirAtNoFollow(currentFd, part)
++		if os.IsNotExist(err) {
++			if err := unix.Mkdirat(currentFd, part, 0o755); err != nil && !os.IsExist(err) {
++				if closeCurrent {
++					unix.Close(currentFd)
++				}
++				return err
++			}
++			nextFd, err = openDirAtNoFollow(currentFd, part)
++		}
++		if err != nil {
++			if closeCurrent {
++				unix.Close(currentFd)
++			}
++			return err
++		}
++		if closeCurrent {
++			unix.Close(currentFd)
++		}
++		currentFd = nextFd
++		closeCurrent = true
++	}
++	if closeCurrent {
++		return unix.Close(currentFd)
++	}
++	return nil
++}
++
++func openParentInRoot(rootFd int, unsafePath string) (parentFd int, base string, closeParent bool, err error) {
++	parts, err := pathComponents(unsafePath)
++	if err != nil {
++		return -1, "", false, err
++	}
++	if len(parts) == 0 {
++		return -1, "", false, fmt.Errorf("empty path")
++	}
++	base = parts[len(parts)-1]
++	if len(parts) == 1 {
++		return rootFd, base, false, nil
++	}
++
++	parentFd, err = openDirInRoot(rootFd, filepath.Join(parts[:len(parts)-1]...))
++	if err != nil {
++		return -1, "", false, err
++	}
++	return parentFd, base, true, nil
++}
++
++func openDirInRoot(rootFd int, unsafePath string) (int, error) {
++	parts, err := pathComponents(unsafePath)
++	if err != nil {
++		return -1, err
++	}
++	if len(parts) == 0 {
++		return rootFd, nil
++	}
++
++	currentFd := rootFd
++	closeCurrent := false
++	for _, part := range parts {
++		nextFd, err := openDirAtNoFollow(currentFd, part)
++		if err != nil {
++			if closeCurrent {
++				unix.Close(currentFd)
++			}
++			return -1, err
++		}
++		if closeCurrent {
++			unix.Close(currentFd)
++		}
++		currentFd = nextFd
++		closeCurrent = true
++	}
++	return currentFd, nil
++}
++
++func openDirAtNoFollow(rootFd int, name string) (int, error) {
++	return unix.Openat(rootFd, name, unix.O_RDONLY|unix.O_DIRECTORY|unix.O_CLOEXEC|unix.O_NOFOLLOW, 0)
++}
++
++func pathComponents(unsafePath string) ([]string, error) {
++	if filepath.IsAbs(unsafePath) {
++		return nil, fmt.Errorf("absolute path %q is not scoped to container root", unsafePath)
++	}
++
++	cleanPath := filepath.Clean(unsafePath)
++	if cleanPath == "." {
++		return nil, nil
++	}
++
++	parts := strings.Split(cleanPath, string(os.PathSeparator))
++	for _, part := range parts {
++		if part == "" || part == "." || part == ".." {
++			return nil, fmt.Errorf("path %q escapes container root", unsafePath)
++		}
++	}
++	return parts, nil
++}
++
+ // makeMountRRO makes the mount recursively read-only.
+ func makeMountRRO(dest string) error {
+ 	attr := &unix.MountAttr{
+diff --git a/daemon/containerfs_linux_test.go b/daemon/containerfs_linux_test.go
+new file mode 100644
+index 0000000..08d797b
+--- /dev/null
++++ b/daemon/containerfs_linux_test.go
+@@ -0,0 +1,51 @@
++package daemon // import "github.com/docker/docker/daemon"
++
++import (
++	"os"
++	"path/filepath"
++	"testing"
++
++	"golang.org/x/sys/unix"
++	"gotest.tools/v3/assert"
++)
++
++func TestCreateIfNotExists(t *testing.T) {
++	t.Run("directory", func(t *testing.T) {
++		dir := t.TempDir()
++		rootFd := openRootFd(t, dir)
++		defer unix.Close(rootFd)
++
++		err := createIfNotExists(rootFd, "tocreate", true)
++		assert.NilError(t, err)
++
++		fileinfo, err := os.Stat(filepath.Join(dir, "tocreate"))
++		assert.NilError(t, err, "Did not create destination")
++		assert.Assert(t, fileinfo.IsDir(), "Should have been a dir, seems it's not")
++
++		err = createIfNotExists(rootFd, "tocreate", true)
++		assert.NilError(t, err, "Should not fail if already exists")
++	})
++	t.Run("file", func(t *testing.T) {
++		dir := t.TempDir()
++		rootFd := openRootFd(t, dir)
++		defer unix.Close(rootFd)
++
++		err := createIfNotExists(rootFd, "file/to/create", false)
++		assert.NilError(t, err)
++
++		fileinfo, err := os.Stat(filepath.Join(dir, "file/to/create"))
++		assert.NilError(t, err, "Did not create destination")
++
++		assert.Assert(t, !fileinfo.IsDir(), "Should have been a file, but created a directory")
++
++		err = createIfNotExists(rootFd, "file/to/create", false)
++		assert.NilError(t, err, "Should not fail if already exists")
++	})
++}
++
++func openRootFd(t *testing.T, path string) int {
++	t.Helper()
++	fd, err := unix.Open(path, unix.O_RDONLY|unix.O_DIRECTORY|unix.O_CLOEXEC, 0)
++	assert.NilError(t, err)
++	return fd
++}
-- 
2.35.6


