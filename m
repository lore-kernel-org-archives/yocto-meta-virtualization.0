Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA48CCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 10:07:05 +0000 (UTC)
Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18335.1792145223175547014
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 16 Oct 2026 03:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=h2dXnNY9;
 spf=pass (domain: cisco.com, ip: 173.38.203.68, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=23677; q=dns/txt;
  s=iport01; t=1792145223; x=1793354823;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=cvTEX5wiFzvX6oxyOUavD5U5x0PvBkpJYATTgcbhqeY=;
  b=h2dXnNY9ze/MY3uKyyJRELGH/wBpizYpz8V/gVGt/kjtTlDwpIWOGF62
   reDvsNeYLLJafpbdsM4S/I9hbEhbteTvrAtvE0MNrmNUpBDWFquWMgM2u
   QHNweOktxjp6iWNpUQFHe3HyswlqD0PTXRr88kwG2qisrz9ql+/KHOVsl
   yBle9MkljRNyy2fpMbFa9ajwWqbWUJ8+iL3ulsWQZ8LGUD2xvJAwAhe4E
   fVlIXpqCVMgDIt0Yv7JeJhBPT32mlmm+G9MZTgjNEdcKCdmQjC2wwQqZM
   r9TCTWC64MYtl7jCqlCv8Fj86r1lifj6nLmn7vYdqBPLhFuoE3pDnJ6pv
   Q==;
X-CSE-ConnectionGUID: zO33hAzMRg6VjOfB0YOGPg==
X-CSE-MsgGUID: VJh48GOATUen0h/BSFrQvA==
X-IPAS-Result: =?us-ascii?q?A0DlAgAs9tFq/9NK/pBRCR4BAQsSDIIFC4IYP3VhQkmUK?=
 =?us-ascii?q?YIhA4ETilKSNxSBag8BAQEPRA0EAQGEP0YCjhUCJjUIDgECBAMCAwEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDGhgBVhwDAQIvIAsjCBEIg?=
 =?us-ascii?q?ipYAYI6AzcDEb07giyBAYNpAkNQ2EsNgloBCxQBgTiFQIJ/hSRdGAGEfCcbG?=
 =?us-ascii?q?4FygRWCc3aBBYEaQgEBgTQSAoZdBIIigQyBWog2A40OSIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBaAM1EioVbjIdgSM+F4EHGwYFgR2BIIIWIxk2eoEJXoErKWEQF4EJggcCg?=
 =?us-ascii?q?lSCAAIBSUEOB0VTCSVDEkcmIggSCQETGjALgRs4PAkoQRcMcwwdBXIIAg0JB?=
 =?us-ascii?q?ykYDUgRLDcVGQQ+bgeSFB6CGC0ZBzFKEwEHHgYEAUMIKxYKKCUEFwUDIQVGA?=
 =?us-ascii?q?5JgQo9jAYIegTieaXEKKIN2jCKPPoV8GjOEBIFXkkCRLoEmC5h9glmIXoJTh?=
 =?us-ascii?q?AmFBoxQE12EaYFqATmBRwsHcBWDIglKGQ+OLgsLg2CBf2WBbEPJLzw1CzIBA?=
 =?us-ascii?q?QcCBw4DC4FokAArgVMBAQ?=
IronPort-Data: A9a23:e7aH16mz/4/qr5OE4Z6mYV7o5gzXJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdD2qDaP/ZN2r0ctgiOovgphlQup/SyNRgS1FoqCk8RFtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtMsvzb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FZ8/ob13KHNrz
 /NGFjIqYDrbtsWZ+L3uH4GAhux7RCXqFIoSoDRkiDreF/tjGMiFSKTR7tge1zA17ixMNa+CO
 4xDNGYpM0iGOUQWUrsUIMpWcOOAinTyaTREqFW9rqss6G+Vxwt0uFToGIeFJIzVGZ0O9qqej
 lzk/zipLTYzCOGSz2KFtViXqPX2gwquDer+E5X9rJaGmma7w2EPAVgIVEGnvPC9i1y3R9NYL
 WQQ+zEytu4j80e3ScHnWB+1q2LCuQQTM+e8CMUz5RvIzu/f5ByUQzFcCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:ecHX+KAol6BeoJrlHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:t1/gMm7VmbuEFX6Jd9ss5mlPQcAMYFjnwynuIWi2Iz5Yb5KtRgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AirbJZw1TIMOzPa2rhF8U5l3ljjUj3YauVBAitrw?=
 =?us-ascii?q?6hsSCbSw3EQyzlg2pa9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="58687403"
Received: from aer-l-core-10.cisco.com ([144.254.74.211])
  by aer-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 10:07:00 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-10.cisco.com (Postfix) with ESMTPS id 2B573180001EF
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 16 Oct 2026 10:07:00 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id CA352CC1295; Fri, 16 Oct 2026 15:36:58 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH 3/5] containerd: Fix CVE-2026-53489
Date: Fri, 16 Oct 2026 15:36:39 +0530
Message-Id: <20261016100641.1628059-3-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016100641.1628059-1-deeratho@cisco.com>
References: <20261016100641.1628059-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-10.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 16 Oct 2026 10:07:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10116

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream release/2.2 backport for CVE-2026-53489.
The upstream fix commit is referenced in [1], and the public CVE record
is referenced in [2].

[1] https://github.com/containerd/containerd/commit/357652293053d0cd3ed565f718b0050aa662ae1a
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-53489

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../containerd/CVE-2026-53489.patch           | 529 ++++++++++++++++++
 .../containerd/containerd_git.bb              |   1 +
 2 files changed, 530 insertions(+)
 create mode 100644 recipes-containers/containerd/containerd/CVE-2026-53489.patch

diff --git a/recipes-containers/containerd/containerd/CVE-2026-53489.patch b/recipes-containers/containerd/containerd/CVE-2026-53489.patch
new file mode 100644
index 00000000..74915474
--- /dev/null
+++ b/recipes-containers/containerd/containerd/CVE-2026-53489.patch
@@ -0,0 +1,529 @@
+From 0e6f9d96caa978fd688a2d94140e95f348bfe74f Mon Sep 17 00:00:00 2001
+From: Brian Goff <cpuguy83@gmail.com>
+Date: Tue, 9 Jun 2026 11:37:18 -0700
+Subject: [PATCH 3/4] cri: make checkpoint restore robust to unexpected archive
+ content
+
+The CRI checkpoint restore path unpacked checkpoint archive/OCI image content
+directly into the container's persistent state directory and read files such as
+container.log back from it with a symlink-following copy. Checkpoint content is
+externally provided, so make restore more defensive about what it unpacks and
+how it reads those files back.
+
+Behavior changes:
+
+- Only unpack regular files and directories from the checkpoint archive.
+
+- Unpack checkpoint content into a dedicated <state>/ctrd-restore
+  subdirectory created fresh rather than into the state dir itself, so
+  checkpoint content cannot collide with containerd's own files (e.g.
+  the "status" blob). Restore and cleanup operate on that subdir;
+  cleanup is now a single RemoveAll of it.
+
+CVE: CVE-2026-53489
+Upstream-Status: Backport [https://github.com/containerd/containerd/commit/357652293053d0cd3ed565f718b0050aa662ae1a]
+
+Backport Changes:
+- CVE-2026-53492 and this upstream commit independently add
+  internal/cri/server/container_checkpoint_linux_test.go. Applying the
+  selected series produces an add/add conflict for that file.
+- Resolve the conflict by merging the upstream CVE-2026-53489 checkpoint
+  archive and symlink tests into the file created by CVE-2026-53492. This
+  retains both CVEs' upstream test coverage without changing security code.
+
+Signed-off-by: Brian Goff <cpuguy83@gmail.com>
+(cherry picked from commit 8196411f24065533093be4c7ad874c23b06178f3)
+Signed-off-by: Brian Goff <cpuguy83@gmail.com>
+(cherry picked from commit 357652293053d0cd3ed565f718b0050aa662ae1a)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ .../cri/server/container_checkpoint_linux.go  | 186 ++++++++++++++----
+ .../server/container_checkpoint_linux_test.go | 130 ++++++++++++
+ internal/cri/server/container_start.go        |  35 ++--
+ 3 files changed, 286 insertions(+), 65 deletions(-)
+
+diff --git a/internal/cri/server/container_checkpoint_linux.go b/internal/cri/server/container_checkpoint_linux.go
+index 13cd3e2e1..26f0d9b25 100644
+--- a/internal/cri/server/container_checkpoint_linux.go
++++ b/internal/cri/server/container_checkpoint_linux.go
+@@ -31,7 +31,6 @@ import (
+ 	"time"
+ 
+ 	crmetadata "github.com/checkpoint-restore/checkpointctl/lib"
+-	"github.com/checkpoint-restore/go-criu/v7/stats"
+ 	"github.com/checkpoint-restore/go-criu/v7/utils"
+ 	"github.com/containerd/containerd/api/types/runc/options"
+ 	"github.com/containerd/containerd/v2/client"
+@@ -56,9 +55,86 @@ import (
+ 	"github.com/opencontainers/image-spec/identity"
+ 	v1 "github.com/opencontainers/image-spec/specs-go/v1"
+ 	spec "github.com/opencontainers/runtime-spec/specs-go"
++	"golang.org/x/sys/unix"
+ 	runtime "k8s.io/cri-api/pkg/apis/runtime/v1"
++
++	// TODO: This package import is kept to prevent merge conflicts while integrating multiple
++	// branches, specifically because this changes vendoring.
++	_ "github.com/checkpoint-restore/go-criu/v7/stats"
+ )
+ 
++// copyNoFollow copies the regular file at src to dst without following a symlink
++// at the final path component of src.
++//
++// The checkpoint code reads files (container.log, status, stats-dump, dump.log)
++// out of the container state directory, which can contain entries unpacked from a
++// checkpoint archive or OCI image. Those entries are externally provided, so they
++// are read defensively.
++//
++// src is first lstat'd (which does not follow a final-component symlink) and must
++// be a regular file; non-regular entries are rejected before src is ever opened.
++// src is then opened with O_NOFOLLOW as a belt-and-suspenders guard in case the
++// entry changes type between the lstat and the open.
++func copyNoFollow(src, dst string, perm os.FileMode) error {
++	fi, err := os.Lstat(src)
++	if err != nil {
++		return err
++	}
++	if !fi.Mode().IsRegular() {
++		return fmt.Errorf("refusing to copy %s: not a regular file", src)
++	}
++
++	in, err := os.OpenFile(src, os.O_RDONLY|unix.O_NOFOLLOW, 0)
++	if err != nil {
++		return err
++	}
++	defer in.Close()
++
++	out, err := os.OpenFile(dst, os.O_WRONLY|os.O_CREATE|os.O_TRUNC, perm)
++	if err != nil {
++		return err
++	}
++	defer out.Close()
++
++	_, err = io.Copy(out, in)
++	return err
++}
++
++// checkpointArchiveEntryAllowed reports whether a tar entry from a checkpoint
++// archive may be unpacked. Legitimate checkpoint archives contain only regular
++// files and directories; other entry types (symlinks, hardlinks, device and fifo
++// nodes) are not produced by the checkpoint code and are rejected as a hardening
++// measure.
++func checkpointArchiveEntryAllowed(hdr *tar.Header) bool {
++	switch hdr.Typeflag {
++	//nolint:staticcheck // TypeRegA is deprecated but we may still receive an external tar with TypeRegA
++	case tar.TypeReg, tar.TypeRegA, tar.TypeDir, tar.TypeXGlobalHeader:
++		return true
++	default:
++		return false
++	}
++}
++
++// assertCheckpointDirSafe verifies that the populated restore directory contains
++// only regular files and directories.
++//
++// The OCI-image restore path copies checkpoint content into the restore dir with
++// fs.CopyDir, which (unlike the tar unpack filter) faithfully recreates any
++// symlinks and special files present in the image. Restore-time consumers open
++// paths under this directory, so non-regular entries are rejected before they run.
++func assertCheckpointDirSafe(root string) error {
++	return filepath.WalkDir(root, func(path string, d os.DirEntry, err error) error {
++		if err != nil {
++			return err
++		}
++		// d.Type() reports the entry type without following symlinks.
++		if d.IsDir() || d.Type().IsRegular() {
++			return nil
++		}
++		return fmt.Errorf("refusing to restore checkpoint: %s is not a regular file or directory", path)
++	})
++}
++
+ // checkIfCheckpointOCIImage returns checks if the input refers to a checkpoint image.
+ // It returns the StorageImageID of the image the input resolves to, nil otherwise.
+ func (c *criService) checkIfCheckpointOCIImage(ctx context.Context, input string) (string, error) {
+@@ -187,6 +263,12 @@ func (c *criService) CRImportCheckpoint(
+ 		}(archiveFile)
+ 
+ 		filter := archive.WithFilter(func(hdr *tar.Header) (bool, error) {
++			// Reject entry types the checkpoint code never produces (symlinks,
++			// hardlinks, device/fifo nodes) so they are not recreated on disk.
++			if !checkpointArchiveEntryAllowed(hdr) {
++				log.G(ctx).Warnf("Skipping unexpected checkpoint archive entry %q (type %d)", hdr.Name, hdr.Typeflag)
++				return false, nil
++			}
+ 			// The checkpoint archive is unpacked twice if using a tar file directly.
+ 			// The first time only the metadata files are relevant to prepare the
+ 			// restore operation. This filter function ignores the large parts of
+@@ -381,16 +463,39 @@ func (c *criService) CRImportCheckpoint(
+ 		return "", err
+ 	}
+ 
++	// Confine all checkpoint content to a dedicated subdirectory of the container
++	// state dir instead of unpacking it directly into the state dir, so it cannot
++	// collide with containerd's own files there. Create it fresh; RemoveAll unlinks
++	// any pre-existing entry without following it.
++	restoreDir := filepath.Join(containerRootDir, checkpointRestoreDir)
++	if err := os.RemoveAll(restoreDir); err != nil {
++		return "", err
++	}
++	if err := os.Mkdir(restoreDir, 0o700); err != nil {
++		return "", err
++	}
++
+ 	if restoreStorageImageID != "" {
+-		if err := fs.CopyDir(containerRootDir, mountPoint); err != nil {
++		if err := fs.CopyDir(restoreDir, mountPoint); err != nil {
+ 			return "", err
+ 		}
+ 		if err := mount.UnmountAll(mountPoint, 0); err != nil {
+ 			return "", err
+ 		}
++		// fs.CopyDir recreates any symlinks/special files from the image; reject
++		// them here so restore-time consumers only ever open regular files.
++		if err := assertCheckpointDirSafe(restoreDir); err != nil {
++			return "", err
++		}
+ 	} else {
+ 		// unpack the checkpoint archive
+ 		filter := archive.WithFilter(func(hdr *tar.Header) (bool, error) {
++			// Reject entry types the checkpoint code never produces (symlinks,
++			// hardlinks, device/fifo nodes) so they are not recreated on disk.
++			if !checkpointArchiveEntryAllowed(hdr) {
++				log.G(ctx).Warnf("Skipping unexpected checkpoint archive entry %q (type %d)", hdr.Name, hdr.Typeflag)
++				return false, nil
++			}
+ 			excludePatterns := []string{
+ 				crmetadata.ConfigDumpFile,
+ 				crmetadata.SpecDumpFile,
+@@ -408,19 +513,21 @@ func (c *criService) CRImportCheckpoint(
+ 
+ 		// Start from the beginning of the checkpoint archive
+ 		archiveFile.Seek(0, 0)
+-		_, err = archive.Apply(ctx, containerRootDir, archiveFile, []archive.ApplyOpt{filter}...)
++		_, err = archive.Apply(ctx, restoreDir, archiveFile, []archive.ApplyOpt{filter}...)
+ 
+ 		if err != nil {
+-			return "", fmt.Errorf("unpacking of checkpoint archive %s failed: %w", containerRootDir, err)
++			return "", fmt.Errorf("unpacking of checkpoint archive %s failed: %w", restoreDir, err)
+ 		}
+ 	}
+-	log.G(ctx).Debugf("Unpacked checkpoint in %s", containerRootDir)
++	log.G(ctx).Debugf("Unpacked checkpoint in %s", restoreDir)
+ 
+-	// Restore container log file (if it exists)
+-	containerLog := filepath.Join(containerRootDir, "container.log")
+-	_, err = c.os.Stat(containerLog)
+-	if err == nil {
+-		if err := c.os.CopyFile(containerLog, meta.LogPath, 0600); err != nil {
++	// Restore container log file (if it exists).
++	//
++	// container.log was unpacked from a checkpoint archive/OCI image, so it is
++	// copied without following a final-component symlink.
++	containerLog := filepath.Join(restoreDir, "container.log")
++	if err := copyNoFollow(containerLog, meta.LogPath, 0600); err != nil {
++		if !errors.Is(err, os.ErrNotExist) {
+ 			return "", fmt.Errorf("restoring container log file %s failed: %w", containerLog, err)
+ 		}
+ 	}
+@@ -488,7 +595,25 @@ func (c *criService) CheckpointContainer(ctx context.Context, r *runtime.Checkpo
+ 	if err != nil {
+ 		return nil, fmt.Errorf("failed to get task for container %q: %w", r.GetContainerId(), err)
+ 	}
+-	img, err := task.Checkpoint(ctx, []client.CheckpointTaskOpts{withCheckpointOpts(i.Runtime.Name, c.getContainerRootDir(r.GetContainerId()))}...)
++
++	cpPath := filepath.Join(c.getContainerRootDir(container.ID), "ctrd-checkpoint")
++	// ctrd-checkpoint may already exist from a prior checkpoint operation. RemoveAll
++	// unlinks any existing entry (including a symlink) itself rather than its target,
++	// so creating the directory afterwards cannot write through a link.
++	if err := os.RemoveAll(cpPath); err != nil {
++		return nil, err
++	}
++	if err := os.Mkdir(cpPath, 0o700); err != nil {
++		return nil, err
++	}
++	defer os.RemoveAll(cpPath)
++
++	// Point CRIU's work directory (where it writes dump.log and stats-dump) at the
++	// dedicated, freshly-created checkpoint dir instead of the persistent container
++	// state dir. Otherwise checkpoint creation litters those files into the state
++	// dir where they are never cleaned up; here they land directly where they are
++	// archived from and are removed with cpPath.
++	img, err := task.Checkpoint(ctx, []client.CheckpointTaskOpts{withCheckpointOpts(i.Runtime.Name, cpPath)}...)
+ 	if err != nil {
+ 		return nil, fmt.Errorf("checkpointing container %q failed: %w", r.GetContainerId(), err)
+ 	}
+@@ -513,43 +638,20 @@ func (c *criService) CheckpointContainer(ctx context.Context, r *runtime.Checkpo
+ 		return nil, fmt.Errorf("failed to unmarshall blob into checkpoint data OCI index: %w", err)
+ 	}
+ 
+-	cpPath := filepath.Join(c.getContainerRootDir(r.GetContainerId()), "ctrd-checkpoint")
+-	if err := os.MkdirAll(cpPath, 0o700); err != nil {
+-		return nil, err
+-	}
+-	defer os.RemoveAll(cpPath)
+-
+-	// This internal containerd file is used by checkpointctl for
+-	// checkpoint archive analysis.
+-	if err := c.os.CopyFile(
+-		filepath.Join(c.getContainerRootDir(r.GetContainerId()), crmetadata.StatusFile),
++	// This internal containerd file is used by checkpointctl for checkpoint archive
++	// analysis. It lives in the container state dir, which can hold files from a
++	// prior checkpoint operation, so it is read without following symlinks.
++	if err := copyNoFollow(
++		filepath.Join(c.getContainerRootDir(container.ID), crmetadata.StatusFile),
+ 		filepath.Join(cpPath, crmetadata.StatusFile),
+ 		0o600,
+ 	); err != nil {
+ 		return nil, err
+ 	}
+ 
+-	// This file is created by CRIU and includes timing analysis.
+-	// Also used by checkpointctl
+-	if err := c.os.CopyFile(
+-		filepath.Join(c.getContainerRootDir(r.GetContainerId()), stats.StatsDump),
+-		filepath.Join(cpPath, stats.StatsDump),
+-		0o600,
+-	); err != nil {
+-		return nil, err
+-	}
+-
+-	// The log file created by CRIU. This file could be missing.
+-	// Let's ignore errors if the file is missing.
+-	if err := c.os.CopyFile(
+-		filepath.Join(c.getContainerRootDir(r.GetContainerId()), crmetadata.DumpLogFile),
+-		filepath.Join(cpPath, crmetadata.DumpLogFile),
+-		0o600,
+-	); err != nil {
+-		if !errors.Is(errors.Unwrap(err), os.ErrNotExist) {
+-			return nil, err
+-		}
+-	}
++	// dump.log and stats-dump are written directly into cpPath by CRIU via its
++	// work directory (see withCheckpointOpts above), so they are already present
++	// for archiving and do not need to be copied out of the container state dir.
+ 
+ 	// Save the existing container log file
+ 	_, err = c.os.Stat(criContainerStatus.GetStatus().GetLogPath())
+diff --git a/internal/cri/server/container_checkpoint_linux_test.go b/internal/cri/server/container_checkpoint_linux_test.go
+index 3010e5233..740a52100 100644
+--- a/internal/cri/server/container_checkpoint_linux_test.go
++++ b/internal/cri/server/container_checkpoint_linux_test.go
+@@ -19,13 +19,19 @@
+ package server
+ 
+ import (
++	"archive/tar"
+ 	"context"
++	"errors"
++	"os"
++	"path/filepath"
+ 	"sync"
+ 	"testing"
+ 
+ 	"github.com/containerd/log"
+ 	"github.com/sirupsen/logrus"
+ 	"github.com/stretchr/testify/assert"
++	"github.com/stretchr/testify/require"
++	"golang.org/x/sys/unix"
+ )
+ 
+ type testLogHook struct {
+@@ -105,3 +111,127 @@ func TestFilterAndMergeAnnotations(t *testing.T) {
+ 		})
+ 	}
+ }
++
++func TestCopyNoFollowRegularFile(t *testing.T) {
++	dir := t.TempDir()
++	src := filepath.Join(dir, "src")
++	dst := filepath.Join(dir, "dst")
++	require.NoError(t, os.WriteFile(src, []byte("hello"), 0o644))
++
++	require.NoError(t, copyNoFollow(src, dst, 0o600))
++
++	data, err := os.ReadFile(dst)
++	require.NoError(t, err)
++	assert.Equal(t, "hello", string(data))
++
++	info, err := os.Stat(dst)
++	require.NoError(t, err)
++	assert.Equal(t, os.FileMode(0o600), info.Mode().Perm())
++}
++
++func TestCopyNoFollowMissingSource(t *testing.T) {
++	dir := t.TempDir()
++	src := filepath.Join(dir, "does-not-exist")
++	dst := filepath.Join(dir, "dst")
++
++	err := copyNoFollow(src, dst, 0o600)
++	require.Error(t, err)
++	assert.True(t, errors.Is(err, os.ErrNotExist), "expected ErrNotExist, got %v", err)
++	assert.NoFileExists(t, dst)
++}
++
++func TestCopyNoFollowSymlinkSourceNotFollowed(t *testing.T) {
++	dir := t.TempDir()
++
++	// A stand-in for a file outside the copy that a symlink might point at.
++	secret := filepath.Join(dir, "outside-target")
++	require.NoError(t, os.WriteFile(secret, []byte("outside-content"), 0o600))
++
++	src := filepath.Join(dir, "container.log")
++	require.NoError(t, os.Symlink(secret, src))
++	dst := filepath.Join(dir, "dst")
++
++	err := copyNoFollow(src, dst, 0o600)
++	require.Error(t, err)
++	// A symlink is not a "missing file"; it must surface as an error, not be skipped.
++	assert.False(t, errors.Is(err, os.ErrNotExist))
++	// And the linked-to content must not have been copied into the destination.
++	assert.NoFileExists(t, dst)
++}
++
++func TestCopyNoFollowRejectsFIFO(t *testing.T) {
++	dir := t.TempDir()
++	src := filepath.Join(dir, "fifo")
++	require.NoError(t, unix.Mkfifo(src, 0o600))
++	dst := filepath.Join(dir, "dst")
++
++	// Must return promptly with an error rather than blocking on the FIFO open.
++	err := copyNoFollow(src, dst, 0o600)
++	require.Error(t, err)
++	assert.False(t, errors.Is(err, os.ErrNotExist))
++	assert.NoFileExists(t, dst)
++}
++
++func TestCopyNoFollowRejectsDirectory(t *testing.T) {
++	dir := t.TempDir()
++	src := filepath.Join(dir, "adir")
++	require.NoError(t, os.Mkdir(src, 0o700))
++	dst := filepath.Join(dir, "dst")
++
++	err := copyNoFollow(src, dst, 0o600)
++	require.Error(t, err)
++	assert.NoFileExists(t, dst)
++}
++
++func TestAssertCheckpointDirSafe(t *testing.T) {
++	t.Run("regular files and dirs allowed", func(t *testing.T) {
++		root := t.TempDir()
++		require.NoError(t, os.MkdirAll(filepath.Join(root, "checkpoint"), 0o700))
++		require.NoError(t, os.WriteFile(filepath.Join(root, "checkpoint", "img"), []byte("x"), 0o600))
++		require.NoError(t, os.WriteFile(filepath.Join(root, "rootfs-diff.tar"), []byte("x"), 0o600))
++		assert.NoError(t, assertCheckpointDirSafe(root))
++	})
++
++	t.Run("symlink rejected", func(t *testing.T) {
++		root := t.TempDir()
++		require.NoError(t, os.Symlink("/some/outside/path", filepath.Join(root, "rootfs-diff.tar")))
++		assert.Error(t, assertCheckpointDirSafe(root))
++	})
++
++	t.Run("symlink nested in subdir rejected", func(t *testing.T) {
++		root := t.TempDir()
++		require.NoError(t, os.MkdirAll(filepath.Join(root, "checkpoint"), 0o700))
++		require.NoError(t, os.Symlink("/some/outside/path", filepath.Join(root, "checkpoint", "pages-1.img")))
++		assert.Error(t, assertCheckpointDirSafe(root))
++	})
++
++	t.Run("fifo rejected", func(t *testing.T) {
++		root := t.TempDir()
++		require.NoError(t, unix.Mkfifo(filepath.Join(root, "fifo"), 0o600))
++		assert.Error(t, assertCheckpointDirSafe(root))
++	})
++}
++
++func TestCheckpointArchiveEntryAllowed(t *testing.T) {
++	for _, tc := range []struct {
++		name    string
++		typ     byte
++		allowed bool
++	}{
++		{"regular", tar.TypeReg, true},
++		//nolint:staticcheck // TypeRegA is deprecated but external tars may still use it
++		{"regular-A", tar.TypeRegA, true},
++		{"directory", tar.TypeDir, true},
++		{"global-header", tar.TypeXGlobalHeader, true},
++		{"symlink", tar.TypeSymlink, false},
++		{"hardlink", tar.TypeLink, false},
++		{"char-device", tar.TypeChar, false},
++		{"block-device", tar.TypeBlock, false},
++		{"fifo", tar.TypeFifo, false},
++	} {
++		t.Run(tc.name, func(t *testing.T) {
++			got := checkpointArchiveEntryAllowed(&tar.Header{Typeflag: tc.typ, Name: tc.name})
++			assert.Equal(t, tc.allowed, got)
++		})
++	}
++}
+diff --git a/internal/cri/server/container_start.go b/internal/cri/server/container_start.go
+index c0fb8c50f..0c7653cad 100644
+--- a/internal/cri/server/container_start.go
++++ b/internal/cri/server/container_start.go
+@@ -31,7 +31,6 @@ import (
+ 	runtime "k8s.io/cri-api/pkg/apis/runtime/v1"
+ 
+ 	crmetadata "github.com/checkpoint-restore/checkpointctl/lib"
+-	"github.com/checkpoint-restore/go-criu/v7/stats"
+ 	containerd "github.com/containerd/containerd/v2/client"
+ 	cio "github.com/containerd/containerd/v2/internal/cri/io"
+ 	containerstore "github.com/containerd/containerd/v2/internal/cri/store/container"
+@@ -41,6 +40,12 @@ import (
+ 	cioutil "github.com/containerd/containerd/v2/pkg/ioutil"
+ )
+ 
++// checkpointRestoreDir is the subdirectory under a container's persistent state
++// directory into which checkpoint content (CRIU images, container.log,
++// rootfs-diff.tar, ...) is unpacked during restore. Confining it here keeps
++// checkpoint content from colliding with containerd's own files in the state dir.
++const checkpointRestoreDir = "ctrd-restore"
++
+ // StartContainer starts the container.
+ func (c *criService) StartContainer(ctx context.Context, r *runtime.StartContainerRequest) (retRes *runtime.StartContainerResponse, retErr error) {
+ 	span := tracing.SpanFromContext(ctx)
+@@ -112,7 +117,7 @@ func (c *criService) StartContainer(ctx context.Context, r *runtime.StartContain
+ 		pid, err := container.Restore(
+ 			ctx,
+ 			ioCreation,
+-			filepath.Join(c.getContainerRootDir(r.GetContainerId()), crmetadata.CheckpointDirectory),
++			filepath.Join(c.getContainerRootDir(r.GetContainerId()), checkpointRestoreDir, crmetadata.CheckpointDirectory),
+ 		)
+ 
+ 		if err != nil {
+@@ -155,28 +160,12 @@ func (c *criService) StartContainer(ctx context.Context, r *runtime.StartContain
+ 		// It handles the TaskExit event and update container state after this.
+ 		c.startContainerExitMonitor(context.Background(), id, task.Pid(), exitCh)
+ 
+-		// cleanup checkpoint artifacts after restore
+-		cleanup := [...]string{
+-			crmetadata.RestoreLogFile,
+-			crmetadata.DumpLogFile,
+-			stats.StatsDump,
+-			stats.StatsRestore,
+-			crmetadata.NetworkStatusFile,
+-			crmetadata.RootFsDiffTar,
+-			crmetadata.DeletedFilesFile,
+-			crmetadata.CheckpointDirectory,
+-			crmetadata.StatusDumpFile,
+-			crmetadata.ConfigDumpFile,
+-			crmetadata.SpecDumpFile,
+-			"container.log",
+-		}
+-		for _, del := range cleanup {
+-			file := filepath.Join(c.getContainerRootDir(r.GetContainerId()), del)
+-			err = os.RemoveAll(file)
+-			if err != nil {
+-				log.G(ctx).Infof("Non-fatal: removal of checkpoint file (%s) failed: %v", file, err)
+-			}
++		// cleanup checkpoint artifacts after restore.
++		restoreDir := filepath.Join(c.getContainerRootDir(r.GetContainerId()), checkpointRestoreDir)
++		if err := os.RemoveAll(restoreDir); err != nil {
++			log.G(ctx).Warnf("Non-fatal: removal of checkpoint restore dir (%s) failed: %v", restoreDir, err)
+ 		}
++
+ 		log.G(ctx).Infof("Restored container %s successfully", r.GetContainerId())
+ 		return &runtime.StartContainerResponse{}, nil
+ 	}
+-- 
+2.35.6
+
diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-containers/containerd/containerd_git.bb
index b2e9187a..af756ba8 100644
--- a/recipes-containers/containerd/containerd_git.bb
+++ b/recipes-containers/containerd/containerd_git.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/2.2;protocol=ht
            file://CVE-2026-53488.patch \
            file://CVE-2026-50195.patch \
            file://CVE-2026-53492.patch \
+           file://CVE-2026-53489.patch \
           "
 
 # Apache-2.0 for containerd
-- 
2.35.6


