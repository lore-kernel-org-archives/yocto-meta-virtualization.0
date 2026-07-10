Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D1BC44506
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 12:26:09 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11347.1783686359635882003
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jul 2026 05:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=kMiY3z8t;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8953; q=dns/txt;
  s=iport01; t=1783686359; x=1784895959;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=M7z/+mknfeilfhs72vG9j5xH7QwlmAoV3uOY6W2GlbU=;
  b=kMiY3z8tW1/5ZSOZhPwVP3/Da34z7sEkL/65cQ540XQ/xVy3+WknzNEz
   089rTd16iC497gwwXn6udUj72onWfybEFmn6YB22YBuv9glo3o/kXLQMi
   o2iRb91zY2Ug9HMqdIpuwQrKohHolRGLDHq+Al+0LR3o8gO4YJR2yZ8fu
   FFTwVewtNUhO8Yj48PLx2PZNMtg2DponcdffTLja6DTP6uxSHVLSdhg0B
   VVdr0PtoDCI9AiKZxPpyPYbaQSR/j9BCKunzZXJqNIdpbCOTmevUJPwJ2
   Sq3sTONRPEfk4PssOVsWXQD+4ejssLGb4dOEYNR9lVOdayQ84+1ngpSwA
   w==;
X-CSE-ConnectionGUID: g9CB6+IFQw2rgmxWKfQRNA==
X-CSE-MsgGUID: kkNN8RFLQ2SvOUiNFPrbxA==
X-IPAS-Result: =?us-ascii?q?A0BDAgAi5FBq/43/Ja1aHgEBCxIMggULgld0X0JJA5Qmg?=
 =?us-ascii?q?iGBFp0IgX4PAQEBD0QNBAEBklQCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2GWgE4AXIDAQJaIxkIgwIBgnMDEbpDgiyBAYR92y4BC?=
 =?us-ascii?q?xQBgTiFP4gfWxgBhHwnGxuBcoEVgTuBOHaBBYFcAoE3hm4EgiJ6EoFaHo9yS?=
 =?us-ascii?q?IEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgR2BWYEChHkjHwM5f?=
 =?us-ascii?q?4EwdUp5LXMSHgqBUoIWVAMLGA1IESw3FBsEPm4HjT4XD4IsEnsTASsFSgEjH?=
 =?us-ascii?q?goFRRgBDx+TLgmQHoIegTifWgoog3WMIZU6GjOFW6URC5h9izeCU5VzXYRpg?=
 =?us-ascii?q?Wg8gVlwFYMiCUoZD444g2uFE8kvPDULAy8BAQcCBw4DC4FokACBfgEB?=
IronPort-Data: A9a23:TNsSqaONo71rc0LvrR32lsFynXyQoLVcMsEvi/4bfWQNrUoh0TwEz
 zcXXjrSPqrYM2f1c9hzbY3ipkJSv57SnNU3S3M5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf6g24sawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6/o/J2tofqw2w/ktG25L5
 cM7Jgk3SDnW0opawJrjIgVtrt4oIM+uOMYUvWttiGmFS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzNXwsYDUXUrsTIJ4zkf2hmnn4WzZZs1mS46Ew5gA/ySQtgemxaICIK4PiqcN9nUW+g
 DL80UDAWCoEE+Ge7xS96Hi8r7qa9c/8cMdIfFGizdZvjUGag3ISEgELXF+6s/Cli0m4c9ZeM
 FAPvDspprQ17FasTNT2Q1u/unHsg/IHc8BbH+t/7ESGzbDZpl7FQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:0H9BJ62LhE8owJhq/qa24QqjBIIkLtp133Aq2lEZdPUzSL37qy
 nAppomPHPP5Qr5O0tQ+uxoRpPgfZq0z/cciuMs1NyZMzUO1lHFEGgb1+vf6gylPTHi/ehA0q
 olWa1/BNrsSWVet6/BkWyF+xJK+qjhzEhu7t2uq0tQcQ==
X-Talos-CUID: 9a23:sWKhHm1ctbX4VfVl0Jej5bxfFZEOWCOe7VnpPBWiBmN5d56bcGW20fYx
X-Talos-MUID: 9a23:v54lcAiBMEqmRSEP/tMoqsMpN8ROxfSUJmQ0y64YnPSFEwJIIT2NpWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208";a="499402597"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Jul 2026 12:25:58 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 47F4918000487
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Jul 2026 12:25:58 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 65621CC037D; Fri, 10 Jul 2026 17:55:56 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH] runc: fix CVE-2026-41579
Date: Fri, 10 Jul 2026 17:55:53 +0530
Message-Id: <20260710122553.3001811-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Jul 2026 12:26:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9948

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream release-1.5 backport for
CVE-2026-41579. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/opencontainers/runc/commit/4504accbbaebd198f1fce296b39cf0d6f20a17e1
[2] https://github.com/opencontainers/runc/security/advisories/GHSA-xjvp-4fhw-gc47

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../runc/files/CVE-2026-41579.patch           | 182 ++++++++++++++++++
 recipes-containers/runc/runc_git.bb           |   1 +
 2 files changed, 183 insertions(+)
 create mode 100644 recipes-containers/runc/files/CVE-2026-41579.patch

diff --git a/recipes-containers/runc/files/CVE-2026-41579.patch b/recipes-containers/runc/files/CVE-2026-41579.patch
new file mode 100644
index 00000000..f5adbba5
--- /dev/null
+++ b/recipes-containers/runc/files/CVE-2026-41579.patch
@@ -0,0 +1,182 @@
+From eaee40282ce6a653e4bfd1a34f74fd6c988ea005 Mon Sep 17 00:00:00 2001
+From: Aleksa Sarai <aleksa@amutable.com>
+Date: Wed, 15 Apr 2026 01:44:09 +1000
+Subject: [PATCH] rootfs: make /dev initialisation code fd-based
+
+These codepaths are very old and operate on pure paths but before
+pivot_root(2), meaning that a bad image with a malicious /dev symlink
+could cause us to operate on host paths instead.
+
+In practice this means that we could be tricked into removing a file
+called "ptmx" (note that /dev/pts/ptmx and /dev/ptmx are both immune for
+different reasons) or creating a very restricted set of symlinks (with
+fixed targets and names). The scope of these bugs is thus quite limited,
+but we definitely need to harden against it.
+
+These codepaths were unfortunately missed during the fd-based rework in
+commit d40b3439a961 ("rootfs: switch to fd-based handling of mountpoint
+targets") -- I must've assumed they were called after pivot_root(2)...
+
+Fixes: GHSA-xjvp-4fhw-gc47
+Fixes: CVE-2026-41579
+Fixes: d40b3439a961 ("rootfs: switch to fd-based handling of mountpoint targets")
+
+CVE: CVE-2026-41579
+Upstream-Status: Backport [https://github.com/opencontainers/runc/commit/4504accbbaebd198f1fce296b39cf0d6f20a17e1]
+
+Backport Changes:
+- Wrynose runc 1.5.0-rc.1 still uses rootfs string pathrs
+  helpers rather than the newer root *os.File API expected by the
+  upstream release-1.5 fix.
+- Kept fd-scoped unlinkat/symlinkat behavior by adding helpers that
+  use Wrynose's string-based OpenInRoot and MkdirAllParentInRoot APIs.
+
+Signed-off-by: Aleksa Sarai <aleksa@amutable.com>
+(cherry picked from commit 864db8042dbb191028676f80addf8c35f348aee2)
+Signed-off-by: Aleksa Sarai <aleksa@amutable.com>
+(cherry picked from commit 4504accbbaebd198f1fce296b39cf0d6f20a17e1)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ internal/pathrs/mkdirall.go        | 14 +++++++---
+ internal/pathrs/root_pathrslite.go | 41 ++++++++++++++++++++++++++++++
+ libcontainer/rootfs_linux.go       | 19 +++++---------
+ 3 files changed, 58 insertions(+), 16 deletions(-)
+
+diff --git a/src/import/internal/pathrs/mkdirall.go b/src/import/internal/pathrs/mkdirall.go
+index 3a896f484..52fb97797 100644
+--- a/src/import/internal/pathrs/mkdirall.go
++++ b/src/import/internal/pathrs/mkdirall.go
+@@ -24,6 +24,14 @@ import (
+ 	"path/filepath"
+ )
+ 
++func splitPath(path string) (dirPath, filename string, err error) {
++	dirPath, filename = filepath.Split(path)
++	if filepath.Join("/", filename) == "/" {
++		return "", "", fmt.Errorf("root subpath %q has bad trailing component %q", path, filename)
++	}
++	return dirPath, filename, nil
++}
++
+ // MkdirAllParentInRoot is like [MkdirAllInRoot] except that it only creates
+ // the parent directory of the target path, returning the trailing component so
+ // the caller has more flexibility around constructing the final inode.
+@@ -41,9 +49,9 @@ func MkdirAllParentInRoot(root, unsafePath string, mode os.FileMode) (*os.File,
+ 		return nil, "", fmt.Errorf("failed to construct hallucinated target path: %w", err)
+ 	}
+ 
+-	dirPath, filename := filepath.Split(unsafePath)
+-	if filepath.Join("/", filename) == "/" {
+-		return nil, "", fmt.Errorf("create parent dir in root subpath %q has bad trailing component %q", unsafePath, filename)
++	dirPath, filename, err := splitPath(unsafePath)
++	if err != nil {
++		return nil, "", fmt.Errorf("split path %q for mkdir parent: %w", unsafePath, err)
+ 	}
+ 
+ 	dirFd, err := MkdirAllInRoot(root, dirPath, mode)
+diff --git a/src/import/internal/pathrs/root_pathrslite.go b/src/import/internal/pathrs/root_pathrslite.go
+index 51db77440..a925c0bd9 100644
+--- a/src/import/internal/pathrs/root_pathrslite.go
++++ b/src/import/internal/pathrs/root_pathrslite.go
+@@ -19,7 +19,9 @@
+ package pathrs
+ 
+ import (
++	"fmt"
+ 	"os"
++	"path/filepath"
+ 
+ 	"github.com/cyphar/filepath-securejoin/pathrs-lite"
+ 	"golang.org/x/sys/unix"
+@@ -65,3 +67,42 @@ func CreateInRoot(root, subpath string, flags int, fileMode uint32) (*os.File, e
+ 	}
+ 	return os.NewFile(uintptr(fd), root+"/"+subpath), nil
+ }
++
++// UnlinkInRoot deletes the inode specified at the given subpath. If you pass
++// [unix.AT_REMOVEDIR] it will remove directories, otherwise it will remove
++// non-directory inodes.
++func UnlinkInRoot(root, subpath string, flags int) error {
++	dirPath, filename, err := splitPath(subpath)
++	if err != nil {
++		return fmt.Errorf("split path %q for unlink: %w", subpath, err)
++	}
++
++	dirFd, err := OpenInRoot(root, dirPath, unix.O_DIRECTORY|unix.O_PATH)
++	if err != nil {
++		return fmt.Errorf("failed to open parent directory %q for unlink: %w", dirPath, err)
++	}
++	defer dirFd.Close()
++
++	err = unix.Unlinkat(int(dirFd.Fd()), filename, flags)
++	if err != nil {
++		err = &os.PathError{Op: "unlinkat", Path: filepath.Join(dirFd.Name(), filename), Err: err}
++	}
++	return err
++}
++
++// SymlinkInRoot creates a symlink inside a root with the given target (as well
++// as creating any missing parent directories). If the subpath already exists,
++// an error is returned.
++func SymlinkInRoot(linktarget, root, subpath string) error {
++	dirFd, filename, err := MkdirAllParentInRoot(root, subpath, 0o755)
++	if err != nil {
++		return err
++	}
++	defer dirFd.Close()
++
++	err = unix.Symlinkat(linktarget, int(dirFd.Fd()), filename)
++	if err != nil {
++		err = &os.PathError{Op: "symlinkat", Path: filepath.Join(dirFd.Name(), filename), Err: err}
++	}
++	return err
++}
+diff --git a/src/import/libcontainer/rootfs_linux.go b/src/import/libcontainer/rootfs_linux.go
+index be7719211..a0c03b95e 100644
+--- a/src/import/libcontainer/rootfs_linux.go
++++ b/src/import/libcontainer/rootfs_linux.go
+@@ -170,7 +170,7 @@ func prepareRootfs(pipe *syncSocket, iConfig *initConfig) (err error) {
+ 		if err := createDevices(config); err != nil {
+ 			return fmt.Errorf("error creating device nodes: %w", err)
+ 		}
+-		if err := setupPtmx(config); err != nil {
++		if err := setupPtmx(config.Rootfs); err != nil {
+ 			return fmt.Errorf("error setting up ptmx: %w", err)
+ 		}
+ 		if err := setupDevSymlinks(config.Rootfs); err != nil {
+@@ -885,11 +885,8 @@ func setupDevSymlinks(rootfs string) error {
+ 		links = append(links, [2]string{"/proc/kcore", "/dev/core"})
+ 	}
+ 	for _, link := range links {
+-		var (
+-			src = link[0]
+-			dst = filepath.Join(rootfs, link[1])
+-		)
+-		if err := os.Symlink(src, dst); err != nil && !errors.Is(err, os.ErrExist) {
++		target, devName := link[0], link[1]
++		if err := pathrs.SymlinkInRoot(target, rootfs, devName); err != nil && !errors.Is(err, os.ErrExist) {
+ 			return err
+ 		}
+ 	}
+@@ -1097,15 +1094,11 @@ func setReadonly() error {
+ 	return mount("", "/", "", flags, "")
+ }
+ 
+-func setupPtmx(config *configs.Config) error {
+-	ptmx := filepath.Join(config.Rootfs, "dev/ptmx")
+-	if err := os.Remove(ptmx); err != nil && !errors.Is(err, os.ErrNotExist) {
++func setupPtmx(rootfs string) error {
++	if err := pathrs.UnlinkInRoot(rootfs, "/dev/ptmx", 0); err != nil && !errors.Is(err, os.ErrNotExist) {
+ 		return err
+ 	}
+-	if err := os.Symlink("pts/ptmx", ptmx); err != nil {
+-		return err
+-	}
+-	return nil
++	return pathrs.SymlinkInRoot("pts/ptmx", rootfs, "/dev/ptmx")
+ }
+ 
+ // pivotRoot will call pivot_root such that rootfs becomes the new root
+-- 
+2.35.6
+
diff --git a/recipes-containers/runc/runc_git.bb b/recipes-containers/runc/runc_git.bb
index 6ae647ee..af211865 100644
--- a/recipes-containers/runc/runc_git.bb
+++ b/recipes-containers/runc/runc_git.bb
@@ -4,6 +4,7 @@ SRCREV = "e1c1378fc924f56ce53f4547b7204e2beda7dbf0"
 SRC_URI = " \
     git://github.com/opencontainers/runc;branch=release-1.5;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
     file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
+    file://CVE-2026-41579.patch \
     "
 RUNC_VERSION = "1.5.0-rc.1"
 
-- 
2.35.6


