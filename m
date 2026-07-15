Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB1D6C44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 17:28:25 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.104.1784136497963142067
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Jul 2026 10:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hwjqxwaI;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5858; q=dns/txt;
  s=iport01; t=1784136498; x=1785346098;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nufG/+E/9W7gOV5iYWGnuJ57DNQaDG1VriU8AOO8+2w=;
  b=hwjqxwaIgmmpqFH36BSfwAGgOSNH7GzX32In3qb2pF9fu311WchbiVr6
   OaAh1ScBx4VdDE44l43piISPBkbitmm1CI3ZNVBuv0yUdMgU9Dir/JZKm
   dI4XFpKZK4ulg6bfTO0TD3ckDuz/CltKQGd6FuMBzRlpsdivjpopd4QYb
   52sM7mwa+ALYTbgtumZT2d7fNnYHM+h7IcMuRJ2eCMHWciwJfYI0vjXFF
   FEkgXXSHQg11y7skx5fNAmLyrHYsKMNqOX1OmEriO5Es2wS5aL4GMQAdW
   UWx38BVy6QBymGJw6o18ATiPz3gxNfQGw36NBqAYkrQe1171N+RWhQxQl
   A==;
X-CSE-ConnectionGUID: K2ibmoaDQpm/J7UUmnaHrQ==
X-CSE-MsgGUID: o6WOocK8RrCzljdolxMcWw==
X-IPAS-Result: =?us-ascii?q?A0BDAgDtwVdq/5H/Ja1aHgEBCxIMggULgld0X0JJA5Qmg?=
 =?us-ascii?q?iGBFp0IgX4PAQEBD0QNBAEBklgCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2GWgE4AXIDAQJaIxkIgwIBgnQDEb1EgiyBAYR92y4BC?=
 =?us-ascii?q?xQBgTiFP4ggXBgBhHwnGxuBcoEVgnN2gQWBXAKIJQSCInoSgVqQF0iBHgNZL?=
 =?us-ascii?q?AFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYEdgVCBAoR2Ix8DOX+BMHVKd?=
 =?us-ascii?q?y1qEheBUYIUgRoDCxgNSBEsNxQbBD5uB41KJYI/exMBByQFS0EKUgsFLxGTJ?=
 =?us-ascii?q?gEHkjShEgoog3WMIZU6GjOFW6URC5h9izeCU5VoaIRpgWg8gVlwFYMiCUoZD?=
 =?us-ascii?q?444g2vOGDw1CwMvAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:NAS+5q1p9YiKRY4pDfbD5YBwkn2cJEfYwER7XKvMYLTBsI5bp2dRz
 mUcCm6HPf/cZGbwKNojbIS09R4B7cfdm4drHARu3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g2EtbzpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGLxs3N4gf88pOGWQJ1
 6MlFTULZzCZvrfjqF67YrEEasULNsLnOsYb/3pn1zycVaZgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUidC/FMEg9/5JYWkOqlnHDjczpwo1OOrq1x6G/WpOB0+OW0aICEIYXVHa25mG6f+
 F3h+G/aUisAH86byzaC9mKJjdDQyHaTtIU6UefQGuRRqFie2mVWFhwMSUaypfirg1K/XNR3L
 00P5jFovK856EuzVN7/Uhak5nmesXYht8F4CeY27kSJj6HT+QvcXjhCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:DGFE3qPywwFdy8BcTvGjsMiBIKoaSvp037BN7TESdfU7SKKlfq
 yV8cjztiWE6wr5JktApTnoAsDpKhnhHPVOjrX5U43PYOCfgguVBbAny5f+yDv9HCC73Otc2a
 B8N5VaMrTLfD1HZQKQ2njeLz7mq+P3lJyVuQ==
X-Talos-CUID: 9a23:qWqh1mNMDcZmre5De3Nm/ksTE+wcania7ijtHkq+AEZzcejA
X-Talos-MUID: =?us-ascii?q?9a23=3ADr6G2AyA/Ag33FdafJX9YUeAnvqaqKPwN2cKmrZ?=
 =?us-ascii?q?WgdOvJyhyNzCZnBG8fZByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,165,1779148800"; 
   d="scan'208";a="510293170"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Jul 2026 17:28:17 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id B7E19180001C8
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jul 2026 17:28:16 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id D9A2ECC037D; Wed, 15 Jul 2026 22:58:14 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][scarthgap][PATCH] runc-opencontainers: fix CVE-2026-41579
Date: Wed, 15 Jul 2026 22:57:56 +0530
Message-Id: <20260715172756.1154974-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jul 2026 17:28:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9954

From: Deepak Rathore <deeratho@cisco.com>

This patch applies a Scarthgap backport for CVE-2026-41579.
The upstream release-1.3 fix commit is referenced in [1], and
the public security advisory is referenced in [2]. The target
release lacks the newer internal/pathrs helpers, so the embedded
patch records the equivalent fd-based adaptation.

[1] https://github.com/opencontainers/runc/commit/a8e53f2c6d6d25cb3dd643cc514f118aab44b097
[2] https://github.com/opencontainers/runc/security/advisories/GHSA-xjvp-4fhw-gc47

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../runc/files/CVE-2026-41579.patch           | 109 ++++++++++++++++++
 .../runc/runc-opencontainers_git.bb           |   1 +
 2 files changed, 110 insertions(+)
 create mode 100644 recipes-containers/runc/files/CVE-2026-41579.patch

diff --git a/recipes-containers/runc/files/CVE-2026-41579.patch b/recipes-containers/runc/files/CVE-2026-41579.patch
new file mode 100644
index 00000000..0d30c942
--- /dev/null
+++ b/recipes-containers/runc/files/CVE-2026-41579.patch
@@ -0,0 +1,109 @@
+From 4662e4af4680996b7d9b7100b5970b75ee6d0048 Mon Sep 17 00:00:00 2001
+From: Deepak Rathore <deeratho@cisco.com>
+Date: Mon, 6 Jul 2026 00:44:51 -0700
+Subject: [PATCH] rootfs: make /dev initialisation code fd-based
+
+These code paths operate on host-visible paths before pivot_root(2),
+so a malicious image with /dev as a symlink can make runc operate on
+host paths while setting up /dev symlinks and /dev/ptmx.
+
+Use fd-relative unlinkat(2) and symlinkat(2) against a no-follow
+opened rootfs/dev directory so the final /dev component cannot be a
+symlink to a host directory.
+
+CVE: CVE-2026-41579
+Upstream-Status: Backport [https://github.com/opencontainers/runc/commit/a8e53f2c6d6d25cb3dd643cc514f118aab44b097]
+
+Backport Changes:
+- Scarthgap runc 1.1.14 does not contain the internal/pathrs helpers
+  used by the upstream release-1.3 fix.
+- Added a minimal openDevInRoot helper and used unlinkat/symlinkat
+  directly to keep the same fd-scoped security behavior.
+- Omitted internal/pathrs changes because that package is absent from
+  release-1.1 and the CVE path only needs fixed /dev entry handling.
+
+Signed-off-by: Aleksa Sarai <aleksa@amutable.com>
+(cherry picked from commit a8e53f2c6d6d25cb3dd643cc514f118aab44b097)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ src/import/libcontainer/rootfs_linux.go | 45 ++++++++++++++++++++++++++----------
+ 1 file changed, 33 insertions(+), 12 deletions(-)
+
+diff --git a/src/import/libcontainer/rootfs_linux.go b/src/import/libcontainer/rootfs_linux.go
+index 78b6998c..b8f9b238 100644
+--- a/src/import/libcontainer/rootfs_linux.go
++++ b/src/import/libcontainer/rootfs_linux.go
+@@ -658,25 +658,40 @@ func checkProcMount(rootfs, dest string, m *configs.Mount, source string) error
+ 	return fmt.Errorf("%q cannot be mounted because it is inside /proc", dest)
+ }
+ 
++func openDevInRoot(rootfs string) (int, error) {
++	devPath := filepath.Join(rootfs, "dev")
++	devFd, err := unix.Open(devPath, unix.O_DIRECTORY|unix.O_NOFOLLOW|unix.O_CLOEXEC, 0)
++	if err != nil {
++		return -1, &os.PathError{Op: "open", Path: devPath, Err: err}
++	}
++	return devFd, nil
++}
++
+ func setupDevSymlinks(rootfs string) error {
++	devFd, err := openDevInRoot(rootfs)
++	if err != nil {
++		return err
++	}
++	defer unix.Close(devFd) //nolint: errcheck
++
+ 	links := [][2]string{
+-		{"/proc/self/fd", "/dev/fd"},
+-		{"/proc/self/fd/0", "/dev/stdin"},
+-		{"/proc/self/fd/1", "/dev/stdout"},
+-		{"/proc/self/fd/2", "/dev/stderr"},
++		{"/proc/self/fd", "fd"},
++		{"/proc/self/fd/0", "stdin"},
++		{"/proc/self/fd/1", "stdout"},
++		{"/proc/self/fd/2", "stderr"},
+ 	}
+ 	// kcore support can be toggled with CONFIG_PROC_KCORE; only create a symlink
+ 	// in /dev if it exists in /proc.
+ 	if _, err := os.Stat("/proc/kcore"); err == nil {
+-		links = append(links, [2]string{"/proc/kcore", "/dev/core"})
++		links = append(links, [2]string{"/proc/kcore", "core"})
+ 	}
+ 	for _, link := range links {
+ 		var (
+ 			src = link[0]
+-			dst = filepath.Join(rootfs, link[1])
++			dst = link[1]
+ 		)
+-		if err := os.Symlink(src, dst); err != nil && !os.IsExist(err) {
+-			return err
++		if err := unix.Symlinkat(src, devFd, dst); err != nil && err != unix.EEXIST {
++			return &os.PathError{Op: "symlinkat", Path: filepath.Join(rootfs, "dev", dst), Err: err}
+ 		}
+ 	}
+ 	return nil
+@@ -886,12 +901,18 @@ func setReadonly() error {
+ }
+ 
+ func setupPtmx(config *configs.Config) error {
+-	ptmx := filepath.Join(config.Rootfs, "dev/ptmx")
+-	if err := os.Remove(ptmx); err != nil && !os.IsNotExist(err) {
++	devFd, err := openDevInRoot(config.Rootfs)
++	if err != nil {
+ 		return err
+ 	}
+-	if err := os.Symlink("pts/ptmx", ptmx); err != nil {
+-		return err
++	defer unix.Close(devFd) //nolint: errcheck
++
++	ptmx := filepath.Join(config.Rootfs, "dev", "ptmx")
++	if err := unix.Unlinkat(devFd, "ptmx", 0); err != nil && err != unix.ENOENT {
++		return &os.PathError{Op: "unlinkat", Path: ptmx, Err: err}
++	}
++	if err := unix.Symlinkat("pts/ptmx", devFd, "ptmx"); err != nil {
++		return &os.PathError{Op: "symlinkat", Path: ptmx, Err: err}
+ 	}
+ 	return nil
+ }
+-- 
+2.35.6
diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
index 4c831502..8e3dbc8d 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -5,6 +5,7 @@ SRC_URI = " \
     git://github.com/opencontainers/runc;branch=release-1.1;protocol=https \
     file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
     file://0001-Makefile-fix-typo-in-LDFLAGS_STATIC.patch \
+    file://CVE-2026-41579.patch \
     "
 RUNC_VERSION = "1.1.14"
 
-- 
2.35.6


