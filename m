Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9838FC43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 11:35:40 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7121.1783596938792498330
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 09 Jul 2026 04:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=k2IrFUj+;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6604; q=dns/txt;
  s=iport01; t=1783596938; x=1784806538;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=U8cSl3uqiw00b6yOZfv84m4dgGgVpbZ8hSnEI1fkqf0=;
  b=k2IrFUj+vhPPHQM4Sqd0oK+ZSrhOyUSCrNeWB/LBdEHyX9MJ2wX0JcNv
   eV14hkAf3wycYDF/KsR+l6QoaqLGsDmrmhMidpMzuj4X+RxyZKCBsKLOU
   l5GZJ0yn/18+GoUcdbDjeajMI0XhhwYas2niOgE2fUaaGFAkiDTMdRtJd
   Ae5p/yuyJm6b/ytrTe9r7j9Z0Hsj92F7YJ/vXOeWo6v6G4u+Mz6r+eLli
   AOpzE7RWpkNd1N40ywFAXL6Aopnm9D9BkVZM14FFWXkOz/HQSenKQQtUQ
   ybibMVWlzfoGZHzzDdlep6SZAOLhFF4S5hZEDHJnHBZU0WQz7iAhlEab1
   A==;
X-CSE-ConnectionGUID: DEeuWmy7R9mvkL3y5sW6Mg==
X-CSE-MsgGUID: KF4K8G5gTSGZO30SXmB3xQ==
X-IPAS-Result: =?us-ascii?q?A0BFAgCbhk9q/43/Ja1aglmCV3RfQkmEV49SgiGeHoF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAZJUAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBKQ8BcgMBAgMCJgItIxgJgwIBgnMCARG5BnqBMoEBg2gCQ1DbL?=
 =?us-ascii?q?gEFBhQBgQouhT+DHAGFAlsYAYJJgjMnGxuBcoEVg2mBBYFcAQGFO4JIIgSCI?=
 =?us-ascii?q?oEMgVoej21IgQIcA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+FzRYGwcFgR2BW?=
 =?us-ascii?q?4EEhHkjHwM5f4EwdUp5LYEBEh4KgVKCFgI6AwsYDUgRLDcUGwQ9AW4HjT8XD?=
 =?us-ascii?q?4I+ATBKEwErgREeFAqUHpI3oQ8KKIN1jCGVOhozhASUF5JRC5h9jgqWUIRpg?=
 =?us-ascii?q?Wg8gUcLB3AVgyJTGQ+OLQsLg2CBf8xbJDULMgEBBwIHAgwDC4FokX4BAQ?=
IronPort-Data: A9a23:iGe54a4dI/u2ZpCiFjq6EQxRtGvGchMFZxGqfqrLsTDasY5as4F+v
 mIeWmyBaP2ONGGge9t+aoyxoUwA75WBzIdjTAo9rCA3Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2Qqaj1Mu/rawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eEaAV59lyED50p
 PkGKxRWf02YuLyTz+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGcyFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEWUrsUIMpWcOOAinTyaTREqFW9rqss6G+Vxwt0uFToGIeNJIDXH5UOwS50o
 Erl0TjaUj5HO+Ck5giiqSqXturlxjPCDdd6+LqQs6QCbEeo7mkeFBRTS1qhveSwjk+sUs5eL
 Eo8/is1sbN05UugUt7lRRq6rXWY+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmIHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:yLT6gqpIKw5HlDxdgpKnjPEaV5odeYIsimQD101hICG9Ffbo8v
 xG/c5rtyMc5wx+ZJhNo7290cq7MBDhHOBOgLX5VI3KNGKNhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjizEht7t2uqUuEimpRGsZd0zs=
X-Talos-CUID: =?us-ascii?q?9a23=3An9BRPmqjrHOVwSGq0JKuYXbmUewIf2DiyWaPGR6?=
 =?us-ascii?q?9F2VNE6zIUmDO3awxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AUagBjA2Ix/gaCg5aObeXvvn9IDUjwIryKxAizJo?=
 =?us-ascii?q?6gOa2EncoAAeYpm+ne9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208";a="506452837"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Jul 2026 11:35:37 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id AE6C4180005F7
	for <meta-virtualization@lists.yoctoproject.org>; Thu,  9 Jul 2026 11:35:37 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 5083BCC2EC3; Thu,  9 Jul 2026 04:35:37 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH 1/2] docker-moby: Fix CVE-2026-41568
Date: Thu,  9 Jul 2026 04:35:27 -0700
Message-Id: <20260709113527.3745345-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3552.cisco.com [171.68.249.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 09 Jul 2026 11:35:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9946

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream Moby v29 backport for CVE-2026-41568.
The upstream fix commit is referenced in [1], and the public CVE
advisory is referenced in [2].

[1] https://github.com/moby/moby/commit/64a22d80b93ddc1416b501b5145df02947312249
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-41568

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index 56d94675..31b8589d 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -54,6 +54,7 @@ SRC_URI = "\
         file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
         file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=src/import \
         file://0001-check-config-make-CONFIG_MEMCG_SWAP-conditional.patch;patchdir=src/import \
+        file://CVE-2026-41568.patch;patchdir=src/import \
 	"
 
 DOCKER_COMMIT = "${SRCREV_moby}"
diff --git a/recipes-containers/docker/files/CVE-2026-41568.patch b/recipes-containers/docker/files/CVE-2026-41568.patch
new file mode 100644
index 00000000..a0a1b72a
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2026-41568.patch
@@ -0,0 +1,147 @@
+From 84ed1ac6753f538ab762f3ba81a0db1aeff6d048 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Pawe=C5=82=20Gronowski?= <pawel.gronowski@docker.com>
+Date: Thu, 26 Mar 2026 18:49:45 +0100
+Subject: [PATCH] daemon/copy: Fix symlink escape in mount destination
+ creation
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
+Upstream-Status: Backport [https://github.com/moby/moby/commit/64a22d80b93ddc1416b501b5145df02947312249]
+
+Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
+(cherry picked from commit 64a22d80b93ddc1416b501b5145df02947312249)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ daemon/containerfs_linux.go      | 41 +++++++++++++++++++-------------
+ daemon/containerfs_linux_test.go | 22 ++++++++++-------
+ 2 files changed, 38 insertions(+), 25 deletions(-)
+
+diff --git a/daemon/containerfs_linux.go b/daemon/containerfs_linux.go
+index 52a362ebbc..00516d2b96 100644
+--- a/daemon/containerfs_linux.go
++++ b/daemon/containerfs_linux.go
+@@ -91,6 +91,13 @@ func (daemon *Daemon) openContainerFS(ctr *container.Container) (_ *containerFSV
+ 			if err := mount.MakeRSlave("/"); err != nil {
+ 				return err
+ 			}
++
++			root, err := os.OpenRoot(ctr.BaseFS)
++			if err != nil {
++				return fmt.Errorf("open container root: %w", err)
++			}
++			defer root.Close()
++
+ 			for _, m := range mounts {
+ 				dest, err := ctr.GetResourcePath(m.Destination)
+ 				if err != nil {
+@@ -102,7 +109,7 @@ func (daemon *Daemon) openContainerFS(ctr *container.Container) (_ *containerFSV
+ 				if err != nil {
+ 					return err
+ 				}
+-				if err := createIfNotExists(dest, stat.IsDir()); err != nil {
++				if err := createIfNotExists(root, strings.TrimPrefix(m.Destination, "/"), stat.IsDir()); err != nil {
+ 					return err
+ 				}
+ 
+@@ -254,24 +261,24 @@ func (vw *containerFSView) Stat(ctx context.Context, path string) (*containertyp
+ }
+ 
+ // createIfNotExists creates a file or a directory only if it does not already exist.
+-func createIfNotExists(dest string, isDir bool) error {
+-	if _, err := os.Stat(dest); err != nil {
+-		// FIXME(thaJeztah): this ignores any other error (which may include "dest" is of the wrong type, or permission errors).
+-		if os.IsNotExist(err) {
+-			if isDir {
+-				return os.MkdirAll(dest, 0o755)
+-			}
+-			if err := os.MkdirAll(filepath.Dir(dest), 0o755); err != nil {
+-				return err
+-			}
+-			f, err := os.OpenFile(dest, os.O_CREATE, 0o755)
+-			if err != nil {
+-				return err
+-			}
+-			_ = f.Close()
++// The path is scoped to root using [os.Root] to prevent symlink escape attacks.
++func createIfNotExists(root *os.Root, unsafePath string, isDir bool) error {
++	if isDir {
++		return root.MkdirAll(unsafePath, 0o755)
++	}
++
++	parent := filepath.Dir(unsafePath)
++	if parent != "." && parent != "/" {
++		if err := root.MkdirAll(parent, 0o755); err != nil {
++			return err
+ 		}
+ 	}
+-	return nil
++
++	f, err := root.OpenFile(unsafePath, os.O_CREATE|os.O_WRONLY, 0o755)
++	if err != nil {
++		return err
++	}
++	return f.Close()
+ }
+ 
+ // makeMountRRO makes the mount recursively read-only.
+diff --git a/daemon/containerfs_linux_test.go b/daemon/containerfs_linux_test.go
+index 7d436442d3..715c9bce0e 100644
+--- a/daemon/containerfs_linux_test.go
++++ b/daemon/containerfs_linux_test.go
+@@ -10,30 +10,36 @@ import (
+ 
+ func TestCreateIfNotExists(t *testing.T) {
+ 	t.Run("directory", func(t *testing.T) {
+-		toCreate := filepath.Join(t.TempDir(), "tocreate")
++		dir := t.TempDir()
++		root, err := os.OpenRoot(dir)
++		assert.NilError(t, err)
++		defer root.Close()
+ 
+-		err := createIfNotExists(toCreate, true)
++		err = createIfNotExists(root, "tocreate", true)
+ 		assert.NilError(t, err)
+ 
+-		fileinfo, err := os.Stat(toCreate)
++		fileinfo, err := os.Stat(filepath.Join(dir, "tocreate"))
+ 		assert.NilError(t, err, "Did not create destination")
+ 		assert.Assert(t, fileinfo.IsDir(), "Should have been a dir, seems it's not")
+ 
+-		err = createIfNotExists(toCreate, true)
++		err = createIfNotExists(root, "tocreate", true)
+ 		assert.NilError(t, err, "Should not fail if already exists")
+ 	})
+ 	t.Run("file", func(t *testing.T) {
+-		toCreate := filepath.Join(t.TempDir(), "file/to/create")
++		dir := t.TempDir()
++		root, err := os.OpenRoot(dir)
++		assert.NilError(t, err)
++		defer root.Close()
+ 
+-		err := createIfNotExists(toCreate, false)
++		err = createIfNotExists(root, "file/to/create", false)
+ 		assert.NilError(t, err)
+ 
+-		fileinfo, err := os.Stat(toCreate)
++		fileinfo, err := os.Stat(filepath.Join(dir, "file/to/create"))
+ 		assert.NilError(t, err, "Did not create destination")
+ 
+ 		assert.Assert(t, !fileinfo.IsDir(), "Should have been a file, but created a directory")
+ 
+-		err = createIfNotExists(toCreate, true)
++		err = createIfNotExists(root, "file/to/create", false)
+ 		assert.NilError(t, err, "Should not fail if already exists")
+ 	})
+ }
+-- 
+2.35.6
-- 
2.35.6


