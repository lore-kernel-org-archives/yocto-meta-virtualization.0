Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BDB4CCF9E3
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 11:31:03 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46130.1762774261163025101
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 10 Nov 2025 03:31:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=apAL/MXc;
 spf=pass (domain: mvista.com, ip: 209.85.215.182, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b55517e74e3so2480465a12.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Nov 2025 03:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1762774260; x=1763379060; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0g+jZjnSREI1AQ9v9O9KX+Yr5Kjfx+xekomt2XBPhcQ=;
        b=apAL/MXc5fyZdMsynSai7KiFrLGXR9CAjEY61zmBQWrCzz6FxFCB2xtWfHaylWM2cr
         yo3Go6HrqZauYAt+57/bUw+N/Urc/jljLPrMtCNjsKaNXGoRPWDTV6V77c7ixJHsbsg8
         RT5GbZXIunPi0B3GOXJKCy4W7wgeI7ZVx3i5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762774260; x=1763379060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0g+jZjnSREI1AQ9v9O9KX+Yr5Kjfx+xekomt2XBPhcQ=;
        b=VN16h14id+oGImWHpiVpmiHL1POPwBmxf+yvBUTXAhYBONUC3aKElX3ptwf7myFhgU
         CJrAb17J8zBTI/fXyps6CdNQJcD4tEK3JzmGNozi8RHLJtGHEA58UQuVkealFhZwvkKc
         y/ySucsM4HnouG87TL7rc+JIye9m7fPbO3uHISf3uPB7t4kjYvKTBsX/9ag7hRaz63Pv
         D9ombrHh1jt/OuYfJJ4i2h0sGfvW8PTnKMdls2O0q+Gy+MyHEfkL7t1cqDWibvO5d2CD
         9fvEG/tRSpUYCyQr0ZMfM5yIYgKK42VclVv7wC0ADlsnFbWpLjy57RrsEWa2BMt11Xkw
         Vfbw==
X-Gm-Message-State: AOJu0YzFc+yEGg0M0AAeD7Eq1wjXiygx8u01KPJSUg6DTemAn3IYKd7o
	rvpEsh09gPF6GhcWmzIg0C3YnctHjZ5cjUIpG90WxRLHTzHKOYTTXML1saTjSDbaOMkmDnmRBdX
	JoWUnEaI=
X-Gm-Gg: ASbGnctd9427t0ja/n7+b0P6BPmE5LiP0/lIQ9kOlOqeCyvChlZxxgwgv0Txz4a1VYf
	92P4tSlymfMEc+71/wTgYxnqzqvQcCmDGtMtbfyJAklPBExJhx5YELa8jraWwGBDgDIllW3go2z
	FZzVJivQOYWY9Pofn6Drrl+zJT6+ymQT0aD/ufjpUKQN60LlCLLpxwSYyuD2nw2hk+2w1lZyw/t
	G9Mh589BX0fMrx66VE0t3eobPbl+T8eKns996c62L/gtdmvKL3Jv5XPYg0pfMEFCyEP5nU/d/9i
	J0S6hlK3a+9v1fRdybP/Pi15Mok6c45gevZhGJNSj7iRdCgmgPvPkA8RI4o2CoyaCWqvtaTUGM4
	viOh9qJol+SWqEtV8nlGybxkGjWmRCwfT0j1ah8Q6SGZPlY8o7nWI8nWRm/NoRsk198pueVKepZ
	jCIqrAxUlADfb0xJD3OCA6zPz2Jw==
X-Google-Smtp-Source: AGHT+IHZ9/FpK4acOpQpTKkQZlaVJDaBtoja4A+ggSr7p3MD2wyjCakJPhyHVZsNcFk8L63MK3fCTg==
X-Received: by 2002:a17:902:e947:b0:295:543a:f7e3 with SMTP id d9443c01a7336-297e564cc94mr100790265ad.27.1762774259695;
        Mon, 10 Nov 2025 03:30:59 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:8fcf:9e59:b0c4:9342:b8a5:38cf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343614818f5sm8865090a91.15.2025.11.10.03.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:30:59 -0800 (PST)
From: vanusuri@mvista.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [meta-virtualization][kirkstone][PATCH 1/2]  containerd-opencontainers: fix CVE-2024-25621
Date: Mon, 10 Nov 2025 17:00:48 +0530
Message-Id: <20251110113049.120549-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Nov 2025 11:31:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9436

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/containerd/containerd/commit/0450f046e6942e513d0ebf1ef5c2aff13daa187f

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../CVE-2024-25621.patch                      | 103 ++++++++++++++++++
 .../containerd-opencontainers_git.bb          |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 recipes-containers/containerd/containerd-opencontainers/CVE-2024-25621.patch

diff --git a/recipes-containers/containerd/containerd-opencontainers/CVE-2024-25621.patch b/recipes-containers/containerd/containerd-opencontainers/CVE-2024-25621.patch
new file mode 100644
index 00000000..4ae9bb63
--- /dev/null
+++ b/recipes-containers/containerd/containerd-opencontainers/CVE-2024-25621.patch
@@ -0,0 +1,103 @@
+From 0450f046e6942e513d0ebf1ef5c2aff13daa187f Mon Sep 17 00:00:00 2001
+From: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
+Date: Mon, 27 Oct 2025 16:42:59 +0900
+Subject: [PATCH] Fix directory permissions
+
+- Create /var/lib/containerd with 0o700 (was: 0o711).
+- Create config.TempDir with 0o700 (was: 0o711).
+- Create /run/containerd/io.containerd.grpc.v1.cri with 0o700 (was: 0o755).
+- Create /run/containerd/io.containerd.sandbox.controller.v1.shim with 0o700 (was: 0o711).
+- Leave /run/containerd and /run/containerd/io.containerd.runtime.v2.task created with 0o711,
+  as required by userns-remapped containers.
+  /run/containerd/io.containerd.runtime.v2.task/<NS>/<ID> is created with:
+  - 0o700 for non-userns-remapped containers
+  - 0o710 for userns-remapped containers with the remapped root group as the owner group.
+
+Signed-off-by: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
+(cherry picked from commit 51b0cf11dc5af7ed1919beba259e644138b28d96)
+Signed-off-by: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
+
+Upstream-Status: Backport [https://github.com/containerd/containerd/commit/0450f046e6942e513d0ebf1ef5c2aff13daa187f]
+CVE: CVE-2024-25621
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ pkg/cri/cri.go            |  8 ++++++++
+ runtime/v2/manager.go     |  2 ++
+ services/server/server.go | 14 ++++++++++++--
+ 3 files changed, 22 insertions(+), 2 deletions(-)
+
+diff --git a/pkg/cri/cri.go b/pkg/cri/cri.go
+index 7182716b6..dec810196 100644
+--- a/pkg/cri/cri.go
++++ b/pkg/cri/cri.go
+@@ -19,6 +19,7 @@ package cri
+ import (
+ 	"flag"
+ 	"fmt"
++	"os"
+ 	"path/filepath"
+ 
+ 	"github.com/containerd/containerd"
+@@ -68,6 +69,13 @@ func initCRIService(ic *plugin.InitContext) (interface{}, error) {
+ 		return nil, fmt.Errorf("invalid plugin config: %w", err)
+ 	}
+ 
++	if err := os.MkdirAll(ic.State, 0700); err != nil {
++		return nil, err
++	}
++	// chmod is needed for upgrading from an older release that created the dir with 0755
++	if err := os.Chmod(ic.State, 0700); err != nil {
++		return nil, err
++	}
+ 	c := criconfig.Config{
+ 		PluginConfig:       *pluginConfig,
+ 		ContainerdRootDir:  filepath.Dir(ic.Root),
+diff --git a/runtime/v2/manager.go b/runtime/v2/manager.go
+index 1927cbb3f..1f26bbeac 100644
+--- a/runtime/v2/manager.go
++++ b/runtime/v2/manager.go
+@@ -109,6 +109,8 @@ type ManagerConfig struct {
+ // NewShimManager creates a manager for v2 shims
+ func NewShimManager(ctx context.Context, config *ManagerConfig) (*ShimManager, error) {
+ 	for _, d := range []string{config.Root, config.State} {
++		// root:  the parent of this directory is created as 0700, not 0711.
++		// state: the parent of this directory is created as 0711 too, so as to support userns-remapped containers.
+ 		if err := os.MkdirAll(d, 0711); err != nil {
+ 			return nil, err
+ 		}
+diff --git a/services/server/server.go b/services/server/server.go
+index 857cc9c76..bc2ddbf1f 100644
+--- a/services/server/server.go
++++ b/services/server/server.go
+@@ -82,16 +82,26 @@ func CreateTopLevelDirectories(config *srvconfig.Config) error {
+ 		return errors.New("root and state must be different paths")
+ 	}
+ 
+-	if err := sys.MkdirAllWithACL(config.Root, 0711); err != nil {
++	if err := sys.MkdirAllWithACL(config.Root, 0700); err != nil {
++		return err
++	}
++	// chmod is needed for upgrading from an older release that created the dir with 0o711
++	if err := os.Chmod(config.Root, 0700); err != nil {
+ 		return err
+ 	}
+ 
++	// For supporting userns-remapped containers, the state dir cannot be just mkdired with 0o700.
++	// Each of plugins creates a dedicated directory beneath the state dir with appropriate permission bits.
+ 	if err := sys.MkdirAllWithACL(config.State, 0711); err != nil {
+ 		return err
+ 	}
+ 
+ 	if config.TempDir != "" {
+-		if err := sys.MkdirAllWithACL(config.TempDir, 0711); err != nil {
++		if err := sys.MkdirAllWithACL(config.TempDir, 0700); err != nil {
++			return err
++		}
++		// chmod is needed for upgrading from an older release that created the dir with 0o711
++		if err := os.Chmod(config.Root, 0700); err != nil {
+ 			return err
+ 		}
+ 		if runtime.GOOS == "windows" {
+-- 
+2.25.1
+
diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
index dd621705..264d37a6 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/1.6;protocol=ht
            file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch \
            file://0001-build-don-t-use-gcflags-to-define-trimpath.patch \
            file://CVE-2024-40635.patch \
+           file://CVE-2024-25621.patch \
           "
 
 # Apache-2.0 for containerd
-- 
2.25.1


