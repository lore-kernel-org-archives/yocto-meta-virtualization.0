Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5D28C44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 17:26:05 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50.1784136364123034832
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Jul 2026 10:26:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Fi1ZJ4vi;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=16320; q=dns/txt;
  s=iport01; t=1784136364; x=1785345964;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=MiQe8abalDyhC/98gTwREeVzT6W8QMpgGCT8xqu2Qbs=;
  b=Fi1ZJ4vij6RV4DIH7S1Mphnf5xyU45No4SLjKVT2F0WW9C+Bllmk6f1B
   f2XbfutK0f9oyg1V6PRTiuYhTqbhppiTA+YhIHrGiYm/avA22fNQ+m9n/
   Hy4c40DoGkvzjgR0fQsqQjQPitXDyDrQ48glyXcYxyMSuNd6KOSvGrdZt
   +M4qTLPcPmGoj6UdgAPOGTySAq9HAMoUoNkb8tCfaCc4aTPVX3GLwawJG
   smTpsAY2hhqSi2eqLfTJ/mfgwk+vmcfafWS4YucuFDg1yfoYOA8QhF5Kp
   zaG+yFlPwIajhDxjmc/NW6CU35CIg+/IViw1PCdxI81avepU3vLLReYPu
   Q==;
X-CSE-ConnectionGUID: XfnrtLfLTrqViF6lut/org==
X-CSE-MsgGUID: 6PqbG7YgSP6I4EnJ+LA9+w==
X-IPAS-Result: =?us-ascii?q?A0ADAwDtwVdq/5L/Ja1aHgEBCxIMggULgld0X0JJA4RUj?=
 =?us-ascii?q?1KCIQOBE50IgX4PAQEBD0QNBAEBhQUCjVECJjYHDgECBAMCAwEBAQEBAQEBA?=
 =?us-ascii?q?QEBCwEBBQEBAQIBBwWBDhOGTw2GWgECAQMjBAsBVhwDAQIDAiYCAisjCBABC?=
 =?us-ascii?q?IMCAYJ0AxG9RHp/M4EBhH3bLgELFAGBCi6FP4MdAYUCXBgBhHwnGxuBcoEVg?=
 =?us-ascii?q?nN2gQWBXAKFO4JIIgSCIoEMgVoej3lIgQIcA1ksAVUTDQoLBwWBZgM1EioVb?=
 =?us-ascii?q?jIdgSM+FzRYGwcFgR2BUIEChHYjHwM5f4EwdUp3LWoSF4FRghSBGgMLGA1IE?=
 =?us-ascii?q?Sw3FBsEPQFuB41KJYFyTAEBDSNKCgkBByQFHW8yCg0eEBgMHC0CkmNCkgOBO?=
 =?us-ascii?q?J9aCiiDdYwhlToaM4QEgVeSQJErgSYLmH2LN4JTlTQ0aIRpgW4BNYFZcBWDI?=
 =?us-ascii?q?glKGQ+OKgMLC4Ngh1fGQTw1CwMvAQEHAgcCDAMLgWiQACyBUgEB?=
IronPort-Data: A9a23:CWqGuKIXJW9I57BTFE+RgpQlxSXFcZb7ZxGr2PjKsXjdYENShTAHz
 WFMUDqOOfbZamegLtAiPIyyp0NQ68fcmt9mQVMd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9hGcpajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1eAkcsIakW3tptGF9P2
 6IcNSxKaQqM0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBXLAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEqojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZjeG1aIWFJ4LTLSlTthigv
 2jpoFX2OSlEFYCyzxjG1lv9xfCayEsXX6pXTtVU7MVChVCPzykNCQcKSFK/oOuwlk+5XfpbK
 lcI4Ww/qqMu81SxSdvwVAH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBVy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:OMskraAAsULCfILlHemO55DYdb4zR+YMi2TDsHoBLiC9E/bo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a585+oJjsaE52JKGxCe3+mLnE=
X-Talos-CUID: 9a23:N4C9IGM7MPfu6+5DaCdh7lIwFOQZaGTjzVmOJ1KkTmFzR+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AgLn6Vg4enj84Tf5izzTVVI7/xow2272kJx88nq4?=
 =?us-ascii?q?+5ejYGCpSeBO03XeoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,165,1779148800"; 
   d="scan'208";a="510078561"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Jul 2026 17:26:03 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 6DB4C18000581
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jul 2026 17:26:02 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 90111CC037D; Wed, 15 Jul 2026 22:56:00 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][scarthgap][PATCH 2/2] docker-moby: Fix CVE-2026-42306
Date: Wed, 15 Jul 2026 22:55:49 +0530
Message-Id: <20260715172549.1152428-2-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260715172549.1152428-1-deeratho@cisco.com>
References: <20260715172549.1152428-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jul 2026 17:26:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9953

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream 25.0 backport for CVE-2026-42306.
The upstream fix commits are referenced in [1] and [2], and the
public CVE advisory is referenced in [3]. The Scarthgap-specific
Go 1.22 API adaptation is documented in the embedded patch headers.

[1] https://github.com/moby/moby/commit/63772fe8630ee74f7c45d20637f3161cc750f4da
[2] https://github.com/moby/moby/commit/f82f5a92d2ca3a2337b167bdc0a91d99a89756ef
[3] https://github.com/moby/moby/security/advisories/GHSA-rg2x-37c3-w2rh

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 recipes-containers/docker/docker-moby_git.bb  |   2 +
 .../docker/files/CVE-2026-42306_p1.patch      | 183 ++++++++++++++++++
 .../docker/files/CVE-2026-42306_p2.patch      | 161 +++++++++++++++
 3 files changed, 346 insertions(+)
 create mode 100644 recipes-containers/docker/files/CVE-2026-42306_p1.patch
 create mode 100644 recipes-containers/docker/files/CVE-2026-42306_p2.patch

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index f9121b3..68e53b0 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -60,6 +60,8 @@ SRC_URI = "\
 		file://CVE-2026-34040_p1.patch;patchdir=src/import \
 		file://CVE-2026-34040_p2.patch;patchdir=src/import \
 		file://CVE-2026-41568.patch;patchdir=src/import \
+		file://CVE-2026-42306_p1.patch;patchdir=src/import \
+		file://CVE-2026-42306_p2.patch;patchdir=src/import \
 	"
 
 DOCKER_COMMIT = "${SRCREV_moby}"
diff --git a/recipes-containers/docker/files/CVE-2026-42306_p1.patch b/recipes-containers/docker/files/CVE-2026-42306_p1.patch
new file mode 100644
index 0000000..c07a74a
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2026-42306_p1.patch
@@ -0,0 +1,183 @@
+From b4eb1144ac13d0a8e1b7d7e6a3d35ce97865d036 Mon Sep 17 00:00:00 2001
+From: Deepak Rathore <deeratho@cisco.com>
+Date: Tue, 30 Jun 2026 05:17:49 -0700
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
+Upstream-Status: Backport [https://github.com/moby/moby/commit/63772fe8630ee74f7c45d20637f3161cc750f4da]
+
+Backport Changes:
+- Replaced upstream root.Open with the Scarthgap openInRoot helper,
+  which uses openat(2) and O_NOFOLLOW from a pinned container-root fd
+  because Go 1.22 does not provide os.Root.
+- Used a raw O_PATH fd and /proc/self/fd/<fd> for the initial bind
+  mount, then kept the upstream real-path remount and propagation flow.
+- Kept raw fd close handling explicit: fatal paths close before
+  returning, while non-fatal makeMountRRO errors fall through to the
+  common close so targetFd is closed exactly once.
+- Retained the strings import because pathComponents still uses
+  strings.Split in the Scarthgap openat(2) helper; upstream removes it
+  because os.Root avoids that helper.
+
+Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
+(cherry picked from commit 43fa458a9c40873867e75221454de10709b04236)
+Signed-off-by: Cory Snider <csnider@mirantis.com>
+(cherry picked from commit 63772fe8630ee74f7c45d20637f3161cc750f4da)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ daemon/containerfs_linux.go | 67 ++++++++++++++++++++++----
+ 1 file changed, 57 insertions(+), 10 deletions(-)
+
+diff --git a/daemon/containerfs_linux.go b/daemon/containerfs_linux.go
+index ab6b199..3ed4a88 100644
+--- a/daemon/containerfs_linux.go
++++ b/daemon/containerfs_linux.go
+@@ -7,6 +7,7 @@ import (
+ 	"os"
+ 	"path/filepath"
+ 	"runtime"
++	"strconv"
+ 	"strings"
+ 
+ 	"github.com/containerd/log"
+@@ -89,10 +90,14 @@ func (daemon *Daemon) openContainerFS(container *container.Container) (_ *contai
+ 			}
+ 			defer unix.Close(rootFd)
+ 
++			// TODO(vvoland): Refactor this after security release.
+ 			for _, m := range mounts {
+-				dest, err := container.GetResourcePath(m.Destination)
++				// Destination is an absolute path within container
++				// filesystem. For the root-scoped openat operations to
++				// work, convert it to a path relative to root fs /.
++				relDest, err := filepath.Rel("/", m.Destination)
+ 				if err != nil {
+-					return err
++					return fmt.Errorf("make destination relative: %w", err)
+ 				}
+ 
+ 				var stat os.FileInfo
+@@ -100,7 +105,7 @@ func (daemon *Daemon) openContainerFS(container *container.Container) (_ *contai
+ 				if err != nil {
+ 					return err
+ 				}
+-				if err := createIfNotExists(rootFd, strings.TrimPrefix(m.Destination, "/"), stat.IsDir()); err != nil {
++				if err := createIfNotExists(rootFd, relDest, stat.IsDir()); err != nil {
+ 					return err
+ 				}
+ 
+@@ -108,9 +113,7 @@ func (daemon *Daemon) openContainerFS(container *container.Container) (_ *contai
+ 				if m.NonRecursive {
+ 					bindMode = "bind"
+ 				}
+-				writeMode := "ro"
+ 				if m.Writable {
+-					writeMode = "rw"
+ 					if m.ReadOnlyNonRecursive {
+ 						return errors.New("options conflict: Writable && ReadOnlyNonRecursive")
+ 					}
+@@ -122,6 +125,37 @@ func (daemon *Daemon) openContainerFS(container *container.Container) (_ *contai
+ 					return errors.New("options conflict: ReadOnlyNonRecursive && ReadOnlyForceRecursive")
+ 				}
+ 
++				// Open the mount target through the container root so we
++				// have a file descriptor pinning the resolved inode. Using
++				// /proc/self/fd/<fd> as the mount target prevents any
++				// subsequent symlink swap from redirecting the mount.
++				targetFd, err := openInRoot(rootFd, relDest)
++				if err != nil {
++					return fmt.Errorf("open mount target %q: %w", m.Destination, err)
++				}
++				targetPath := "/proc/self/fd/" + strconv.Itoa(targetFd)
++
++				// The kernel rejects remount and propagation-change syscalls
++				// when the target is a /proc/self/fd path. Only the initial
++				// bind mount works on such paths, so we perform that via the
++				// fd path for TOCTOU safety and then resolve the real path for
++				// the read-only remount and propagation change.
++				if err := mount.Mount(m.Source, targetPath, "", bindMode); err != nil {
++					unix.Close(targetFd)
++					return err
++				}
++				realPath, err := os.Readlink(targetPath)
++				if err != nil {
++					unix.Close(targetFd)
++					return fmt.Errorf("readlink %s: %w", targetPath, err)
++				}
++				if !m.Writable {
++					if err := mount.Mount("", realPath, "", "ro,remount,bind"); err != nil {
++						unix.Close(targetFd)
++						return err
++					}
++				}
++
+ 				// openContainerFS() is called for temporary mounts
+ 				// outside the container. Soon these will be unmounted
+ 				// with lazy unmount option and given we have mounted
+@@ -132,20 +166,21 @@ func (daemon *Daemon) openContainerFS(container *container.Container) (_ *contai
+ 				// all these mounts rprivate.  Do not use propagation
+ 				// property of volume as that should apply only when
+ 				// mounting happens inside the container.
+-				opts := strings.Join([]string{bindMode, writeMode, "rprivate"}, ",")
+-				if err := mount.Mount(m.Source, dest, "", opts); err != nil {
++				if err := mount.MakeRPrivate(realPath); err != nil {
++					unix.Close(targetFd)
+ 					return err
+ 				}
+ 
+ 				if !m.Writable && !m.ReadOnlyNonRecursive {
+-					if err := makeMountRRO(dest); err != nil {
++					if err := makeMountRRO(realPath); err != nil {
+ 						if m.ReadOnlyForceRecursive {
++							unix.Close(targetFd)
+ 							return err
+-						} else {
+-							log.G(context.TODO()).WithError(err).Debugf("Failed to make %q recursively read-only", dest)
+ 						}
++						log.G(context.TODO()).WithError(err).Debugf("Failed to make %q recursively read-only", m.Destination)
+ 					}
+ 				}
++				unix.Close(targetFd)
+ 			}
+ 
+ 			return mounttree.SwitchRoot(container.BaseFS)
+@@ -278,6 +313,18 @@ func createIfNotExists(rootFd int, unsafePath string, isDir bool) error {
+ 	return unix.Close(fd)
+ }
+ 
++func openInRoot(rootFd int, unsafePath string) (int, error) {
++	parentFd, base, closeParent, err := openParentInRoot(rootFd, unsafePath)
++	if err != nil {
++		return -1, err
++	}
++	if closeParent {
++		defer unix.Close(parentFd)
++	}
++
++	return unix.Openat(parentFd, base, unix.O_PATH|unix.O_CLOEXEC|unix.O_NOFOLLOW, 0)
++}
++
+ func mkdirAllInRoot(rootFd int, unsafePath string) error {
+ 	parts, err := pathComponents(unsafePath)
+ 	if err != nil {
diff --git a/recipes-containers/docker/files/CVE-2026-42306_p2.patch b/recipes-containers/docker/files/CVE-2026-42306_p2.patch
new file mode 100644
index 0000000..ef02668
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2026-42306_p2.patch
@@ -0,0 +1,161 @@
+From 5ec5db4aa88385b86df0f4e109ecabde25498b2c Mon Sep 17 00:00:00 2001
+From: Deepak Rathore <deeratho@cisco.com>
+Date: Tue, 30 Jun 2026 05:19:01 -0700
+Subject: [PATCH] daemon: resolve in-container symlinks before os.Root mount ops
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
+Upstream-Status: Backport [https://github.com/moby/moby/commit/f82f5a92d2ca3a2337b167bdc0a91d99a89756ef]
+
+Backport Changes:
+- Reworded upstream os.Root comments only where this branch uses the
+  Scarthgap openat(2)-based root-scoped helpers from p1.
+- Added an Fstat check after O_PATH|O_NOFOLLOW so a final symlink fd is
+  rejected, matching the intended os.Root.Open behavior.
+- Ported upstream TestCopyWithAbsoluteSymlinkedMountTarget from
+  integration/container/copy_linux_test.go into Scarthgap's
+  integration/container/copy_test.go, where the copy integration tests
+  live in this branch.
+
+Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
+(cherry picked from commit fb3702d033601bb0e767f2ca398e3909a15be29c)
+Signed-off-by: Cory Snider <csnider@mirantis.com>
+(cherry picked from commit f82f5a92d2ca3a2337b167bdc0a91d99a89756ef)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ daemon/containerfs_linux.go        | 29 +++++++++++++++++++++-----
+ integration/container/copy_test.go | 49 ++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 73 insertions(+), 5 deletions(-)
+
+diff --git a/daemon/containerfs_linux.go b/daemon/containerfs_linux.go
+index 3ed4a88..f7ed847 100644
+--- a/daemon/containerfs_linux.go
++++ b/daemon/containerfs_linux.go
+@@ -92,10 +92,16 @@ func (daemon *Daemon) openContainerFS(container *container.Container) (_ *contai
+ 
+ 			// TODO(vvoland): Refactor this after security release.
+ 			for _, m := range mounts {
+-				// Destination is an absolute path within container
+-				// filesystem. For the root-scoped openat operations to
+-				// work, convert it to a path relative to root fs /.
+-				relDest, err := filepath.Rel("/", m.Destination)
++				// Walk m.Destination through the container's symlinks
++				// before passing it to root-scoped openat operations.
++				// This preserves common absolute symlinks such as
++				// /var/run -> /run while later fd-based operations still
++				// enforce the mount destination protections.
++				resolved, err := container.GetResourcePath(m.Destination)
++				if err != nil {
++					return fmt.Errorf("resolve mount destination %q: %w", m.Destination, err)
++				}
++				relDest, err := filepath.Rel(container.BaseFS, resolved)
+ 				if err != nil {
+ 					return fmt.Errorf("make destination relative: %w", err)
+ 				}
+@@ -322,7 +328,20 @@ func openInRoot(rootFd int, unsafePath string) (int, error) {
+ 		defer unix.Close(parentFd)
+ 	}
+ 
+-	return unix.Openat(parentFd, base, unix.O_PATH|unix.O_CLOEXEC|unix.O_NOFOLLOW, 0)
++	fd, err := unix.Openat(parentFd, base, unix.O_PATH|unix.O_CLOEXEC|unix.O_NOFOLLOW, 0)
++	if err != nil {
++		return -1, err
++	}
++	var st unix.Stat_t
++	if err := unix.Fstat(fd, &st); err != nil {
++		unix.Close(fd)
++		return -1, err
++	}
++	if st.Mode&unix.S_IFMT == unix.S_IFLNK {
++		unix.Close(fd)
++		return -1, fmt.Errorf("mount target %q is a symlink", unsafePath)
++	}
++	return fd, nil
+ }
+ 
+ func mkdirAllInRoot(rootFd int, unsafePath string) error {
+diff --git a/integration/container/copy_test.go b/integration/container/copy_test.go
+index 38d2c799f2..a03cc38b03 100644
+--- a/integration/container/copy_test.go
++++ b/integration/container/copy_test.go
+@@ -10,10 +10,13 @@ import (
+ 	"testing"
+ 
+ 	"github.com/docker/docker/api/types"
++	mounttypes "github.com/docker/docker/api/types/mount"
+ 	"github.com/docker/docker/errdefs"
++	"github.com/docker/docker/integration/internal/build"
+ 	"github.com/docker/docker/integration/internal/container"
+ 	"github.com/docker/docker/pkg/archive"
+ 	"github.com/docker/docker/pkg/jsonmessage"
++	"github.com/docker/docker/testutil"
+ 	"github.com/docker/docker/testutil/fakecontext"
+ 	"gotest.tools/v3/assert"
+ 	is "gotest.tools/v3/assert/cmp"
+@@ -129,6 +132,52 @@ func TestCopyToContainerPathIsNotDir(t *testing.T) {
+ 	assert.Check(t, is.ErrorContains(err, "not a directory"))
+ }
+ 
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
++	err := apiClient.CopyToContainer(ctx, cid, "/sockets/", bytes.NewReader(nil), types.CopyToContainerOptions{})
++	assert.NilError(t, err)
++}
++
+ func TestCopyFromContainer(t *testing.T) {
+ 	skip.If(t, testEnv.DaemonInfo.OSType == "windows")
+ 	ctx := setupTest(t)
-- 
2.35.6


