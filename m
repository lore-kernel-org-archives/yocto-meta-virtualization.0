Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CCC3CF6492
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 23:28:52 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20857.1763594922694687393
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 15:28:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KcG7rGCC;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4ee1e18fb37so3151371cf.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Nov 2025 15:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763594922; x=1764199722; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1rKhZ+9wRF3SBFR2k70/H+HcHfKENgIu3wIpEoFgz1A=;
        b=KcG7rGCCRmvBoqfF7PrgpaCkbFcDAU/hvfvl55HZyVAphP/z8IUeWy3Q+vHyLz0iCs
         EEF8sx0dwe/1VqnaiUhWjQ/H05kuXvwxSVwZa1j0+i4NTqTkeFxf4/Aq/TqCYgViUo+8
         UA/8jG33UuBDXCdMO1MbHvxvfFvkhv3IgkUqpOkcuIKPG83yk/ZGPxZqfisbaIM/lcBK
         f4lGWlyglS7CRyxepkiwz991XqKzbQfDjnuvm7IjG7MQTcBfdFeUkxaQzzh+7ZtEWxOo
         vvuF47n9xZPBvhicfboZruOWNJ3vpKdoY7A6ijCiOLuhzT6mTJ1DD45ZnMl0ZMzCdBBt
         JSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763594922; x=1764199722;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rKhZ+9wRF3SBFR2k70/H+HcHfKENgIu3wIpEoFgz1A=;
        b=XFsqFGTlJvTPG1gwLw5XHRNzKEctxhwRHmODGD1UwuI4QBtO/A+siBjyY1ggX/pwRC
         2Sc69m6mNoDg+rN0mFPzMCgntKm2dmpiLYqcInnf8XoD8z04ukVUm79mKR717bziYSnb
         m5f5I/WuGjQp99JxHxrDvS+1IfcDicvFraSkM5Q4UeRTuBV0OxXN7I8HQFCjd+HyjGsn
         nH/as2G+GaWHGYKxLAwpIUBNpXc0UJppbYskr5MYPl1EwqfkmRFvtMV9Ek1Zi+ZR9b2Z
         0pH/ZNL46p74c4bgLVao/DEnFpORbY3d2/IooxJS7/fw9xV6aRDz7lBqB39Lhau0sPGi
         wMqg==
X-Gm-Message-State: AOJu0YzPRX2UMpD3TfhTBgLsHpdq6x0BaL32KLCg1VXfb8kIQvxcx0nf
	yzXr8dVk7fXQE349JtSQ4vSo39tunO1Dbjjz7//nO8nQn6XNodPZil19THiXYR6v
X-Gm-Gg: ASbGncv2L6qoJSKZIUwRzzWnnkp/8sJQSswXU9qYIWFMBTR2flxKiEFEAjcpmf5b/ZE
	pvw7gYxPyeLLX4DYiE5ID/mgX3ghmLpfmt6jrkboY6XJ71Fu96XBf3jNvrusPcWkM8DFG4CFR39
	q4Z4KOzLJZoU6ZTLgVURybMjlFryq5PDjpjo0mJTHCdWb1TyiQKAwkF7Oy4OdKIpoPlWwdxMtlC
	XnsSqW6D/A7LFOMX7VSI3BVarbQT9J153a+YZaSKoB2tnD+n35rGWAmhUdqZCIl0gebW7DZDxHL
	p/m14KJT8kMeZHml1nR9hoN2ckdO00R2rFrKtvr8uQhIUqGEXaHqX3MzbfyqhpiG1fAyZYGzcAs
	zQ3PxQ4maHyp5wfPEtFg3A9sdb44U74J5b+pAc81+eDHFoO2AabSDw7YF7FHFqqEX3Q1m2XpVVy
	NHjE7smIdjF+kAA5qV45SOYCEX5YDbrRJ81KLki160pyFHsIbtVNVfqxgE1YPC9Fd92+IgQzx3q
	6Q=
X-Google-Smtp-Source: AGHT+IHgLQyBLWG7prdIgLpt/7DXZbz6ZkARIu+Eh9RfDWwxmkRGAj9gyINf+n88pJA+qief0cyAjw==
X-Received: by 2002:a05:622a:1348:b0:4ed:5f45:42c0 with SMTP id d75a77b69052e-4ee496c4d78mr15931121cf.62.1763594921509;
        Wed, 19 Nov 2025 15:28:41 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee48e69dfbsm5679311cf.24.2025.11.19.15.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 15:28:40 -0800 (PST)
Date: Wed, 19 Nov 2025 18:28:38 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: vanusuri@mvista.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][kirkstone][PATCH 1/2]
 containerd-opencontainers: fix CVE-2024-25621
Message-ID: <aR5SpnDZRfu9jk91@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110113049.120549-2-vanusuri@mvista.com>
 <20251110113049.120549-1-vanusuri@mvista.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Nov 2025 23:28:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9448

merged.

Bruce

In message: [meta-virtualization][kirkstone][PATCH 1/2] containerd-opencontainers: fix CVE-2024-25621
on 10/11/2025 Vijay Anusuri via lists.yoctoproject.org wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
> 
> Upstream-Status: Backport from https://github.com/containerd/containerd/commit/0450f046e6942e513d0ebf1ef5c2aff13daa187f
> 
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../CVE-2024-25621.patch                      | 103 ++++++++++++++++++
>  .../containerd-opencontainers_git.bb          |   1 +
>  2 files changed, 104 insertions(+)
>  create mode 100644 recipes-containers/containerd/containerd-opencontainers/CVE-2024-25621.patch
> 
> diff --git a/recipes-containers/containerd/containerd-opencontainers/CVE-2024-25621.patch b/recipes-containers/containerd/containerd-opencontainers/CVE-2024-25621.patch
> new file mode 100644
> index 00000000..4ae9bb63
> --- /dev/null
> +++ b/recipes-containers/containerd/containerd-opencontainers/CVE-2024-25621.patch
> @@ -0,0 +1,103 @@
> +From 0450f046e6942e513d0ebf1ef5c2aff13daa187f Mon Sep 17 00:00:00 2001
> +From: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
> +Date: Mon, 27 Oct 2025 16:42:59 +0900
> +Subject: [PATCH] Fix directory permissions
> +
> +- Create /var/lib/containerd with 0o700 (was: 0o711).
> +- Create config.TempDir with 0o700 (was: 0o711).
> +- Create /run/containerd/io.containerd.grpc.v1.cri with 0o700 (was: 0o755).
> +- Create /run/containerd/io.containerd.sandbox.controller.v1.shim with 0o700 (was: 0o711).
> +- Leave /run/containerd and /run/containerd/io.containerd.runtime.v2.task created with 0o711,
> +  as required by userns-remapped containers.
> +  /run/containerd/io.containerd.runtime.v2.task/<NS>/<ID> is created with:
> +  - 0o700 for non-userns-remapped containers
> +  - 0o710 for userns-remapped containers with the remapped root group as the owner group.
> +
> +Signed-off-by: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
> +(cherry picked from commit 51b0cf11dc5af7ed1919beba259e644138b28d96)
> +Signed-off-by: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
> +
> +Upstream-Status: Backport [https://github.com/containerd/containerd/commit/0450f046e6942e513d0ebf1ef5c2aff13daa187f]
> +CVE: CVE-2024-25621
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + pkg/cri/cri.go            |  8 ++++++++
> + runtime/v2/manager.go     |  2 ++
> + services/server/server.go | 14 ++++++++++++--
> + 3 files changed, 22 insertions(+), 2 deletions(-)
> +
> +diff --git a/pkg/cri/cri.go b/pkg/cri/cri.go
> +index 7182716b6..dec810196 100644
> +--- a/pkg/cri/cri.go
> ++++ b/pkg/cri/cri.go
> +@@ -19,6 +19,7 @@ package cri
> + import (
> + 	"flag"
> + 	"fmt"
> ++	"os"
> + 	"path/filepath"
> + 
> + 	"github.com/containerd/containerd"
> +@@ -68,6 +69,13 @@ func initCRIService(ic *plugin.InitContext) (interface{}, error) {
> + 		return nil, fmt.Errorf("invalid plugin config: %w", err)
> + 	}
> + 
> ++	if err := os.MkdirAll(ic.State, 0700); err != nil {
> ++		return nil, err
> ++	}
> ++	// chmod is needed for upgrading from an older release that created the dir with 0755
> ++	if err := os.Chmod(ic.State, 0700); err != nil {
> ++		return nil, err
> ++	}
> + 	c := criconfig.Config{
> + 		PluginConfig:       *pluginConfig,
> + 		ContainerdRootDir:  filepath.Dir(ic.Root),
> +diff --git a/runtime/v2/manager.go b/runtime/v2/manager.go
> +index 1927cbb3f..1f26bbeac 100644
> +--- a/runtime/v2/manager.go
> ++++ b/runtime/v2/manager.go
> +@@ -109,6 +109,8 @@ type ManagerConfig struct {
> + // NewShimManager creates a manager for v2 shims
> + func NewShimManager(ctx context.Context, config *ManagerConfig) (*ShimManager, error) {
> + 	for _, d := range []string{config.Root, config.State} {
> ++		// root:  the parent of this directory is created as 0700, not 0711.
> ++		// state: the parent of this directory is created as 0711 too, so as to support userns-remapped containers.
> + 		if err := os.MkdirAll(d, 0711); err != nil {
> + 			return nil, err
> + 		}
> +diff --git a/services/server/server.go b/services/server/server.go
> +index 857cc9c76..bc2ddbf1f 100644
> +--- a/services/server/server.go
> ++++ b/services/server/server.go
> +@@ -82,16 +82,26 @@ func CreateTopLevelDirectories(config *srvconfig.Config) error {
> + 		return errors.New("root and state must be different paths")
> + 	}
> + 
> +-	if err := sys.MkdirAllWithACL(config.Root, 0711); err != nil {
> ++	if err := sys.MkdirAllWithACL(config.Root, 0700); err != nil {
> ++		return err
> ++	}
> ++	// chmod is needed for upgrading from an older release that created the dir with 0o711
> ++	if err := os.Chmod(config.Root, 0700); err != nil {
> + 		return err
> + 	}
> + 
> ++	// For supporting userns-remapped containers, the state dir cannot be just mkdired with 0o700.
> ++	// Each of plugins creates a dedicated directory beneath the state dir with appropriate permission bits.
> + 	if err := sys.MkdirAllWithACL(config.State, 0711); err != nil {
> + 		return err
> + 	}
> + 
> + 	if config.TempDir != "" {
> +-		if err := sys.MkdirAllWithACL(config.TempDir, 0711); err != nil {
> ++		if err := sys.MkdirAllWithACL(config.TempDir, 0700); err != nil {
> ++			return err
> ++		}
> ++		// chmod is needed for upgrading from an older release that created the dir with 0o711
> ++		if err := os.Chmod(config.Root, 0700); err != nil {
> + 			return err
> + 		}
> + 		if runtime.GOOS == "windows" {
> +-- 
> +2.25.1
> +
> diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
> index dd621705..264d37a6 100644
> --- a/recipes-containers/containerd/containerd-opencontainers_git.bb
> +++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
> @@ -10,6 +10,7 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/1.6;protocol=ht
>             file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch \
>             file://0001-build-don-t-use-gcflags-to-define-trimpath.patch \
>             file://CVE-2024-40635.patch \
> +           file://CVE-2024-25621.patch \
>            "
>  
>  # Apache-2.0 for containerd
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9436): https://lists.yoctoproject.org/g/meta-virtualization/message/9436
> Mute This Topic: https://lists.yoctoproject.org/mt/116217319/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


In message: [meta-virtualization][kirkstone][PATCH 2/2] containerd-opencontainers: fix CVE-2025-64329
on 10/11/2025 Vijay Anusuri via lists.yoctoproject.org wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
> 
> Upstream-Status: Backport from https://github.com/containerd/containerd/commit/c575d1b5f4011f33b32f71ace75367a92b08c750
> 
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../CVE-2025-64329.patch                      | 80 +++++++++++++++++++
>  .../containerd-opencontainers_git.bb          |  1 +
>  2 files changed, 81 insertions(+)
>  create mode 100644 recipes-containers/containerd/containerd-opencontainers/CVE-2025-64329.patch
> 
> diff --git a/recipes-containers/containerd/containerd-opencontainers/CVE-2025-64329.patch b/recipes-containers/containerd/containerd-opencontainers/CVE-2025-64329.patch
> new file mode 100644
> index 00000000..a3cc5e85
> --- /dev/null
> +++ b/recipes-containers/containerd/containerd-opencontainers/CVE-2025-64329.patch
> @@ -0,0 +1,80 @@
> +From c575d1b5f4011f33b32f71ace75367a92b08c750 Mon Sep 17 00:00:00 2001
> +From: wheat2018 <1151937289@qq.com>
> +Date: Tue, 13 Aug 2024 15:56:31 +0800
> +Subject: [PATCH] fix goroutine leak of container Attach
> +
> +The monitor goroutine (runs (*ContainerIO).Attach.func1) of Attach will
> +never finish if it attaches to a container without any stdout or stderr
> +output. Wait for http context cancel and break the pipe actively to
> +address the issue.
> +
> +Signed-off-by: wheat2018 <1151937289@qq.com>
> +Signed-off-by: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
> +(cherry picked from commit a0d0f0ef68935338d2c710db164fa7820f692530)
> +Signed-off-by: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
> +
> +Excluded pkg/cri/sbserver/container_attach.go changes as the file not
> +present in our current vrsion 1.6.19
> +
> +Upstream-Status: Backport [https://github.com/containerd/containerd/commit/c575d1b5f4011f33b32f71ace75367a92b08c750]
> +CVE: CVE-2025-64329
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + pkg/cri/io/container_io.go         | 14 +++++++++++---
> + pkg/cri/server/container_attach.go |  2 +-
> + 2 files changed, 12 insertions(+), 4 deletions(-)
> +
> +diff --git a/pkg/cri/io/container_io.go b/pkg/cri/io/container_io.go
> +index 70bc8b789..e1584100f 100644
> +--- a/pkg/cri/io/container_io.go
> ++++ b/pkg/cri/io/container_io.go
> +@@ -17,6 +17,7 @@
> + package io
> + 
> + import (
> ++	"context"
> + 	"errors"
> + 	"io"
> + 	"strings"
> +@@ -134,7 +135,7 @@ func (c *ContainerIO) Pipe() {
> + 
> + // Attach attaches container stdio.
> + // TODO(random-liu): Use pools.Copy in docker to reduce memory usage?
> +-func (c *ContainerIO) Attach(opts AttachOptions) {
> ++func (c *ContainerIO) Attach(ctx context.Context, opts AttachOptions) {
> + 	var wg sync.WaitGroup
> + 	key := util.GenerateID()
> + 	stdinKey := streamKey(c.id, "attach-"+key, Stdin)
> +@@ -175,8 +176,15 @@ func (c *ContainerIO) Attach(opts AttachOptions) {
> + 	}
> + 
> + 	attachStream := func(key string, close <-chan struct{}) {
> +-		<-close
> +-		logrus.Infof("Attach stream %q closed", key)
> ++		select {
> ++		case <-close:
> ++			logrus.Infof("Attach stream %q closed", key)
> ++		case <-ctx.Done():
> ++			logrus.Infof("Attach client of %q cancelled", key)
> ++			// Avoid writeGroup heap up
> ++			c.stdoutGroup.Remove(key)
> ++			c.stderrGroup.Remove(key)
> ++		}
> + 		// Make sure stdin gets closed.
> + 		if stdinStreamRC != nil {
> + 			stdinStreamRC.Close()
> +diff --git a/pkg/cri/server/container_attach.go b/pkg/cri/server/container_attach.go
> +index a95215051..3625229f9 100644
> +--- a/pkg/cri/server/container_attach.go
> ++++ b/pkg/cri/server/container_attach.go
> +@@ -79,6 +79,6 @@ func (c *criService) attachContainer(ctx context.Context, id string, stdin io.Re
> + 		},
> + 	}
> + 	// TODO(random-liu): Figure out whether we need to support historical output.
> +-	cntr.IO.Attach(opts)
> ++	cntr.IO.Attach(ctx, opts)
> + 	return nil
> + }
> +-- 
> +2.25.1
> +
> diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
> index 264d37a6..05683d26 100644
> --- a/recipes-containers/containerd/containerd-opencontainers_git.bb
> +++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
> @@ -11,6 +11,7 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/1.6;protocol=ht
>             file://0001-build-don-t-use-gcflags-to-define-trimpath.patch \
>             file://CVE-2024-40635.patch \
>             file://CVE-2024-25621.patch \
> +           file://CVE-2025-64329.patch \
>            "
>  
>  # Apache-2.0 for containerd
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9437): https://lists.yoctoproject.org/g/meta-virtualization/message/9437
> Mute This Topic: https://lists.yoctoproject.org/mt/116217320/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



