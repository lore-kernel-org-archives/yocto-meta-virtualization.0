Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB15C43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 11:36:10 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7213.1783596957176379993
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 09 Jul 2026 04:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ffRaFqVS;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=13136; q=dns/txt;
  s=iport01; t=1783596957; x=1784806557;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=L+TGRtYzp4WgnYS4qmxSUgJoBzTpBTm3eUWLDokn1FM=;
  b=ffRaFqVSIuJz2gqurLRLJbpvYsaQ6Wo6zR/L3fhUgTcZKVQGHuhHdkxP
   Q5uXX31cbqTd2EaF+PxID/OHL59kHNfJ2DXMBVYU2YDeYyqfzaVfuDSuW
   mqQV8/MTtNKlH/B0ecQXlx80pqKCQF+qobwhAH/7JhQ6aHvR8VYH77e3N
   fH9/bQgtzfi2izuPnL17GZ/bA9na9KLYt8XqUwxwFdU6MjlADW+oOvfEx
   dvAUgUi+x6Oqsvj+Cq55e4htlH2b41Hf3hUoETL6Yi69uksvwrvtTJxVw
   uuRVHJQHFKPD52tman1RGhS8wA0ou5cb4VjpbMkyHusXWFQsFohD+8+sO
   w==;
X-CSE-ConnectionGUID: c6lLmN/NSzy9RVDUHjvdKw==
X-CSE-MsgGUID: 1zp2SyzjTdKfBJZr0WbKbQ==
X-IPAS-Result: =?us-ascii?q?A0BGAgCbhk9q/5X/Ja1aglmCV3RfQkmEV49SgiGBFp0IF?=
 =?us-ascii?q?IFqDwEBAQ9EDQQBAZJUAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBKQQLAXIDAQIDAiYCLSMYCYMCAYJzAgERuQZ6fzOBAYNoA?=
 =?us-ascii?q?kNQ2y4BCxQBgQouhT+DHAGFAlsYAYR8JxsbgXKBFYJzdoEFgVwBAYFGg3WCS?=
 =?us-ascii?q?CIEgiKBDIFaHo9tSIECHANZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPhc0WBsHB?=
 =?us-ascii?q?YEdgVuBBIR5Ix8DOX+BMHVKeS2BARIeCoFSghYCOgMLGA1IESw3FBsEPQFuB?=
 =?us-ascii?q?40/Fw+CPQEBgQQJAQckBR1vCigKKxAYDBwtApJjkkiBNZ9aCiiDdYwhlToaM?=
 =?us-ascii?q?4QEgVeSQJErgSYLmH2LN4JTlTQ0aIRpgWg8gUcLB3AVgyIJShkPjioDCwuDY?=
 =?us-ascii?q?FCBL4VYxwMkNQsyAQEHAgcCDAMLgWiQACyBUgEB?=
IronPort-Data: A9a23:lo3O06zvWliKJVVGOyh6t+dkxyrEfRIJ4+MujC+fZmUNrF6WrkVSx
 mEYDD2Aa/eNMWSgL9l0PIm/90oAvsTRmIQ2S1Q5+FhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYrajJMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEpoOakd3KFROnNfp
 MYmBA0tbA6PpP3jldpXSsE07igiBNPgMIVavjRryivUSK98B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cMnWjOX9PYH46tOuli2P2bz1fgFmUvqEwpWPUyWSd1ZCwaISFIYTQG5s9ckCw/
 3DepV/oEBMmOP+R4xi36CqTjMzFpHauMG4VPPjinhJwu3WWy3AaTQMXT0emqP24mEeiWtVZA
 0gV4TY167k1/1CsVsP6XRCzvDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzFeCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:ppPzpKE9Wqaj/8DfpLqE3seALOsnbusQ8zAXPidKOHlom62j5q
 KTdZsguyMc5Ax9ZJhCo6HiBED/exLhHPdOiOF7V4tKNzOIhILHFu1fBPPZowHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPId+rJBLK8gcaVbSC09QYLcT1X
X-Talos-CUID: 9a23:8F+SNmxOLJGZV8mAzwZBBgUfRMQBd1ua6kzCMh6CN0pUaL+LRXyPrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AyAL3yQ/IIAJ1pICoMizdZL6Qf556+/6VGVIPrZk?=
 =?us-ascii?q?lteOmBzYoBD2+hg3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208";a="506830266"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Jul 2026 11:35:56 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id E8116180001EE
	for <meta-virtualization@lists.yoctoproject.org>; Thu,  9 Jul 2026 11:35:55 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 97546CC2EC3; Thu,  9 Jul 2026 04:35:55 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH 2/2] docker-moby: Fix CVE-2026-42306
Date: Thu,  9 Jul 2026 04:35:47 -0700
Message-Id: <20260709113547.3747083-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3552.cisco.com [171.68.249.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 09 Jul 2026 11:36:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9947

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream Moby v29 backport for CVE-2026-42306.
The upstream fix commits are referenced in [1] and [2], and the public
CVE advisory is referenced in [3].

[1] https://github.com/moby/moby/commit/43fa458a9c40873867e75221454de10709b04236
[2] https://github.com/moby/moby/commit/fb3702d033601bb0e767f2ca398e3909a15be29c
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-42306

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index 31b8589d..a512219a 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -55,6 +55,8 @@ SRC_URI = "\
         file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=src/import \
         file://0001-check-config-make-CONFIG_MEMCG_SWAP-conditional.patch;patchdir=src/import \
         file://CVE-2026-41568.patch;patchdir=src/import \
+        file://CVE-2026-42306_p1.patch;patchdir=src/import \
+        file://CVE-2026-42306_p2.patch;patchdir=src/import \
 	"
 
 DOCKER_COMMIT = "${SRCREV_moby}"
diff --git a/recipes-containers/docker/files/CVE-2026-42306_p1.patch b/recipes-containers/docker/files/CVE-2026-42306_p1.patch
new file mode 100644
index 00000000..22b556c0
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2026-42306_p1.patch
@@ -0,0 +1,152 @@
+From 3816f8eb0bea8ba708ba3172739c668076002b61 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Pawe=C5=82=20Gronowski?= <pawel.gronowski@docker.com>
+Date: Thu, 26 Mar 2026 18:49:45 +0100
+Subject: [PATCH] Fix bind mount target redirection via symlink swap during
+ docker cp
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Pin mount targets via /proc/self/fd file descriptors to prevent TOCTOU
+attacks.
+
+Previously, a container process could swap a path component with a
+symlink between GetResourcePath resolution and directory/file creation
+or mount, allowing writes to arbitrary host paths outside the container.
+
+Open the resolved destination through os.Root to get a pinned fd, then
+mount onto /proc/self/fd/<fd> instead of re-resolving the
+container-relative path. This closes the TOCTOU window between
+createIfNotExists and mount.
+
+Because the kernel rejects remount and propagation-change syscalls on
+/proc/self/fd paths, the initial bind mount uses the fd path for safety,
+then Readlink resolves the real path for the subsequent read-only
+remount and rprivate propagation change.
+
+CVE: CVE-2026-42306
+Upstream-Status: Backport [https://github.com/moby/moby/commit/43fa458a9c40873867e75221454de10709b04236]
+
+Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
+(cherry picked from commit 43fa458a9c40873867e75221454de10709b04236)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ daemon/containerfs_linux.go | 56 +++++++++++++++++++++++++++++--------
+ 1 file changed, 45 insertions(+), 11 deletions(-)
+
+diff --git a/daemon/containerfs_linux.go b/daemon/containerfs_linux.go
+index 00516d2b96..52f7af0339 100644
+--- a/daemon/containerfs_linux.go
++++ b/daemon/containerfs_linux.go
+@@ -7,7 +7,7 @@ import (
+ 	"os"
+ 	"path/filepath"
+ 	"runtime"
+-	"strings"
++	"strconv"
+ 
+ 	"github.com/containerd/log"
+ 	"github.com/moby/sys/mount"
+@@ -98,10 +98,14 @@ func (daemon *Daemon) openContainerFS(ctr *container.Container) (_ *containerFSV
+ 			}
+ 			defer root.Close()
+ 
++			// TODO(vvoland): Refactor this after security release.
+ 			for _, m := range mounts {
+-				dest, err := ctr.GetResourcePath(m.Destination)
++				// Destination is an absolute path within container
++				// filesystem. For the os.Root to work, we need to convert it
++				// to a path relative to root fs /
++				relDest, err := filepath.Rel("/", m.Destination)
+ 				if err != nil {
+-					return err
++					return fmt.Errorf("make destination relative: %w", err)
+ 				}
+ 
+ 				var stat os.FileInfo
+@@ -109,7 +113,7 @@ func (daemon *Daemon) openContainerFS(ctr *container.Container) (_ *containerFSV
+ 				if err != nil {
+ 					return err
+ 				}
+-				if err := createIfNotExists(root, strings.TrimPrefix(m.Destination, "/"), stat.IsDir()); err != nil {
++				if err := createIfNotExists(root, relDest, stat.IsDir()); err != nil {
+ 					return err
+ 				}
+ 
+@@ -117,9 +121,7 @@ func (daemon *Daemon) openContainerFS(ctr *container.Container) (_ *containerFSV
+ 				if m.NonRecursive {
+ 					bindMode = "bind"
+ 				}
+-				writeMode := "ro"
+ 				if m.Writable {
+-					writeMode = "rw"
+ 					if m.ReadOnlyNonRecursive {
+ 						return errors.New("options conflict: Writable && ReadOnlyNonRecursive")
+ 					}
+@@ -131,6 +133,37 @@ func (daemon *Daemon) openContainerFS(ctr *container.Container) (_ *containerFSV
+ 					return errors.New("options conflict: ReadOnlyNonRecursive && ReadOnlyForceRecursive")
+ 				}
+ 
++				// Open the mount target through os.Root so we have a
++				// file descriptor pinning the resolved inode. Using
++				// /proc/self/fd/<fd> as the mount target prevents any
++				// subsequent symlink swap from redirecting the mount.
++				targetFile, err := root.Open(relDest)
++				if err != nil {
++					return fmt.Errorf("open mount target %q: %w", m.Destination, err)
++				}
++				targetPath := "/proc/self/fd/" + strconv.FormatUint(uint64(targetFile.Fd()), 10)
++
++				// The kernel rejects remount and propagation-change syscalls
++				// when the target is a /proc/self/fd path. Only the initial
++				// bind mount works on such paths, so we perform that via the
++				// fd path for TOCTOU safety and then resolve the real path for
++				// the read-only remount and propagation change.
++				if err := mount.Mount(m.Source, targetPath, "", bindMode); err != nil {
++					targetFile.Close()
++					return err
++				}
++				realPath, err := os.Readlink(targetPath)
++				if err != nil {
++					targetFile.Close()
++					return fmt.Errorf("readlink %s: %w", targetPath, err)
++				}
++				if !m.Writable {
++					if err := mount.Mount("", realPath, "", "ro,remount,bind"); err != nil {
++						targetFile.Close()
++						return err
++					}
++				}
++
+ 				// openContainerFS() is called for temporary mounts
+ 				// outside the container. Soon these will be unmounted
+ 				// with lazy unmount option and given we have mounted
+@@ -141,20 +174,21 @@ func (daemon *Daemon) openContainerFS(ctr *container.Container) (_ *containerFSV
+ 				// all these mounts rprivate.  Do not use propagation
+ 				// property of volume as that should apply only when
+ 				// mounting happens inside the container.
+-				opts := strings.Join([]string{bindMode, writeMode, "rprivate"}, ",")
+-				if err := mount.Mount(m.Source, dest, "", opts); err != nil {
++				if err := mount.MakeRPrivate(realPath); err != nil {
++					targetFile.Close()
+ 					return err
+ 				}
+ 
+ 				if !m.Writable && !m.ReadOnlyNonRecursive {
+-					if err := makeMountRRO(dest); err != nil {
++					if err := makeMountRRO(realPath); err != nil {
++						targetFile.Close()
+ 						if m.ReadOnlyForceRecursive {
+ 							return err
+-						} else {
+-							log.G(context.TODO()).WithError(err).Debugf("Failed to make %q recursively read-only", dest)
+ 						}
++						log.G(context.TODO()).WithError(err).Debugf("Failed to make %q recursively read-only", m.Destination)
+ 					}
+ 				}
++				targetFile.Close()
+ 			}
+ 
+ 			return mounttree.SwitchRoot(ctr.BaseFS)
+-- 
+2.35.6
diff --git a/recipes-containers/docker/files/CVE-2026-42306_p2.patch b/recipes-containers/docker/files/CVE-2026-42306_p2.patch
new file mode 100644
index 00000000..da00d973
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2026-42306_p2.patch
@@ -0,0 +1,136 @@
+From f143d0422d2a80b9ddb2666d2a41bfabbd0f3430 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Pawe=C5=82=20Gronowski?= <pawel.gronowski@docker.com>
+Date: Tue, 19 May 2026 16:03:30 +0200
+Subject: [PATCH] daemon: resolve in-container symlinks before os.Root mount
+ ops
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The security fix in GHSA-vp62-88p7-qqf5 switched openContainerFS to
+os.Root for mount-destination operations, but stopped walking the
+destination through in-container symlinks.
+
+os.Root refuses to follow absolute symlinks, so any container whose
+image had an absolute symlink along the mount target's path (e.g. the
+common /var/run -> /run in ubuntu/alpine/busybox) broke `docker cp`.
+
+Walk m.Destination through ctr.GetResourcePath first which follows
+symlinks to get a path relative to BaseFS, then keep using os.Root for
+the actual MkdirAll/OpenFile/Open calls.
+
+CVE: CVE-2026-42306
+Upstream-Status: Backport [https://github.com/moby/moby/commit/fb3702d033601bb0e767f2ca398e3909a15be29c]
+
+Backport Changes:
+- Removed the ImageBuildOptions argument from build.Do because
+  Wrynose's helper accepts four arguments and uses default build options
+  internally.
+
+Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
+(cherry picked from commit fb3702d033601bb0e767f2ca398e3909a15be29c)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ daemon/containerfs_linux.go              | 14 ++++---
+ integration/container/copy_linux_test.go | 66 +++++++++++++++++++++++++++++++
+ 2 files changed, 76 insertions(+), 4 deletions(-)
+
+diff --git a/daemon/containerfs_linux.go b/daemon/containerfs_linux.go
+index 52f7af0339..62e77c80a6 100644
+--- a/daemon/containerfs_linux.go
++++ b/daemon/containerfs_linux.go
+@@ -100,10 +100,16 @@ func (daemon *Daemon) openContainerFS(ctr *container.Container) (_ *containerFSV
+ 
+ 			// TODO(vvoland): Refactor this after security release.
+ 			for _, m := range mounts {
+-				// Destination is an absolute path within container
+-				// filesystem. For the os.Root to work, we need to convert it
+-				// to a path relative to root fs /
+-				relDest, err := filepath.Rel("/", m.Destination)
++				// Walk m.Destination through the container's symlinks before
++				// passing it to os.Root, which refuses absolute symlinks
++				// (e.g. the common /var/run -> /run). The resolution itself
++				// is lexical; subsequent os.Root operations still enforce
++				// the GHSA-vp62-88p7-qqf5 / GHSA-rg2x-37c3-w2rh protections.
++				resolved, err := ctr.GetResourcePath(m.Destination)
++				if err != nil {
++					return fmt.Errorf("resolve mount destination %q: %w", m.Destination, err)
++				}
++				relDest, err := filepath.Rel(ctr.BaseFS, resolved)
+ 				if err != nil {
+ 					return fmt.Errorf("make destination relative: %w", err)
+ 				}
+diff --git a/integration/container/copy_linux_test.go b/integration/container/copy_linux_test.go
+new file mode 100644
+index 0000000000..d3d43944a9
+--- /dev/null
++++ b/integration/container/copy_linux_test.go
+@@ -0,0 +1,66 @@
++package container
++
++import (
++	"bytes"
++	"os"
++	"path/filepath"
++	"testing"
++
++	mounttypes "github.com/moby/moby/api/types/mount"
++	"github.com/moby/moby/client"
++	"github.com/moby/moby/v2/integration/internal/build"
++	"github.com/moby/moby/v2/integration/internal/container"
++	"github.com/moby/moby/v2/internal/testutil"
++	"github.com/moby/moby/v2/internal/testutil/fakecontext"
++	"gotest.tools/v3/assert"
++	"gotest.tools/v3/skip"
++)
++
++// TestCopyWithAbsoluteSymlinkedMountTarget was introduced as a regression test
++// for https://github.com/moby/moby/issues/52653.
++//
++// The security fix in GHSA-vp62-88p7-qqf5 switched openContainerFS to use
++// os.Root for the mount-destination operations.
++// os.Root refuses to follow absolute symlinks, but distro images commonly ship
++// /var/run as an absolute symlink to /run.
++// As a result, any container with a bind mount whose target traversed such a
++// symlink (e.g. -v /host/sock:/var/run/docker.sock) made `docker cp` fail.
++func TestCopyWithAbsoluteSymlinkedMountTarget(t *testing.T) {
++	skip.If(t, testEnv.DaemonInfo.OSType != "linux")
++	ctx := setupTest(t)
++	apiClient := testEnv.APIClient()
++
++	// Build an image with an absolute in-container symlink along the mount
++	// target path.
++	// Stock distro images expose this shape via /var/run -> /run, but we set
++	// up our own /sockets -> /root pair so the test does not depend on any
++	// particular base image's layout.
++	buildCtx := fakecontext.New(t, "",
++		fakecontext.WithDockerfile(`FROM busybox
++RUN touch /root/nil && ln -s /root /sockets
++`),
++	)
++	defer buildCtx.Close()
++	imgID := build.Do(ctx, t, apiClient, buildCtx)
++
++	// Use testutil.TempDir so the rootless daemon can access the bind-mount
++	// source: t.TempDir() creates a 0700 parent that the fake-root user
++	// cannot stat.
++	srcDir := testutil.TempDir(t)
++	assert.NilError(t, os.WriteFile(filepath.Join(srcDir, "sock"), nil, 0o644))
++
++	cid := container.Create(ctx, t, apiClient,
++		container.WithImage(imgID),
++		container.WithMount(mounttypes.Mount{
++			Type:   mounttypes.TypeBind,
++			Source: filepath.Join(srcDir, "sock"),
++			Target: "/sockets/docker.sock",
++		}),
++	)
++
++	_, err := apiClient.CopyToContainer(ctx, cid, client.CopyToContainerOptions{
++		DestinationPath: "/sockets/",
++		Content:         bytes.NewReader(nil),
++	})
++	assert.NilError(t, err)
++}
+-- 
+2.35.6
-- 
2.35.6


