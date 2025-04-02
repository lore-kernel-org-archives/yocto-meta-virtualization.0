Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B6FEC36010
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 02:22:21 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.4391.1743560535994156742
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Apr 2025 19:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RQUCMdVb;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e41e18137bso48343746d6.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Apr 2025 19:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743560535; x=1744165335; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8QJsazjJ7H4oRbNKxkM3+DkCs2eYlMctHkTBwebTO6s=;
        b=RQUCMdVbMVwQcUyKwPpS7g3dlC7JjM7+IjpmXAJwzrfAtB25MFSy0ohu25cK7P/Zfp
         w/y3pG0oN5IfzcD66zao0fUjZMX6HkGCI5a1oRqaUrxHqsEHkFIh8xpX4uYkYy0YJ2io
         QTiKzhiKyB3K4ghdtbir+zP6b8MPoBuSY3nTUuy26lV+fnHDutAuspwi36mHODriXr+k
         Z42q6hG3Xk95szthOqxi13gCdZKlze9zk90NRC30FtRjbDR5/LsTe/7ctRjEh1MuF13l
         UeZkUjVmz2t6NURPzUsjC4iIsAOL9r2X2Kkkk930xbVvxDtoaITromxQ/IYg8byJGVSd
         gUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743560535; x=1744165335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8QJsazjJ7H4oRbNKxkM3+DkCs2eYlMctHkTBwebTO6s=;
        b=IWf8+WAkF9qwyqZtsKsLCQl+cXi31bzXznoDa1Kp7kRyDDqPE7XvtbcsK6IAJqgTM7
         aaCLzwnuProO4RgHZAAiu25czGlmoGE0QGwoIZJpi6jB6epI/fLiwo/SEtFLqvNVYB7h
         dCNezzR17YCmcxZ6KOQh7VfBYCdjWL2QOqBjFVEzXUdITL5dQ7dS43DgxXr7gYSEs8KO
         B/m7NlvJU+QHU3exdaiBUMZ+HH9jzFeq9H7U0/zI57YmEGE/2kFJmRvU4C+IXDXqB07C
         qz4MmcWZ+GQY410LBzizg0Z1N0ZkBaMMTf16jj96BSkpFsj4yW7QwxqGUP8UMNKLk5pz
         EWMg==
X-Gm-Message-State: AOJu0YwGeUsa9letpRn8ztqiDzv3sBkxZZ9vxEgjkEv3/5btq15uS6Pm
	hqexoS8/3x2wbGMhdIlwfDTTpTu8WFXqDkS14TFDMkZsSciTX+HvmK5iC6zTllM=
X-Gm-Gg: ASbGnctNKhSLJCUqGYN4zSaUuEkym5AK910HyD08phLWiYEbLVpYOBuYf9gf8kAH6PE
	6/jof5Vlr+GFM72sU/DronKno+aiyklGbcSS00U9yJ7Hahx36D94EJDlkg1UXIfv1N0uCeSh0kX
	Lt7IeVyThPDvCcUzapmcEawG3h+rsYfiZOxwp05xJ/D+/vi+KcgRFWaWMxpZnnhoqC+twJlbYEg
	TxLWyDc/uNFDBH1m29V1mI5+/V7FPzN9kB7appMFX05jd1rRugNH3svzbwb5H8WIizD18t/b87b
	PBAvIXDQ+vDZ3GM6JoNs5LF7Ii2sHum9hE2J91kQYIj0VborhCQQtwvIFfC0epnJcNNeWRObk7u
	rXazVShIbuKyLwhuiIU0MlYQ=
X-Google-Smtp-Source: AGHT+IGkY1iA1BZw6+T0k6pq5I1eJdRrh6m0uTRIshXoOW+XpMIZrBQYTDuGKArE2azO6e7D/JQX1w==
X-Received: by 2002:ad4:4aea:0:b0:6eb:1f63:5cac with SMTP id 6a1803df08f44-6ef02b7d4a7mr12334156d6.5.1743560534715;
        Tue, 01 Apr 2025 19:22:14 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec950465asm69370956d6.0.2025.04.01.19.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 19:22:14 -0700 (PDT)
Date: Wed, 2 Apr 2025 02:22:12 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: praveen.kumar@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][scarthgap][PATCH 2/3] docker-moby: Fix
 CVE-2024-36621
Message-ID: <Z-yfVPCgWsRzCaq9@gmail.com>
References: <20250326195009.757247-1-praveen.kumar@windriver.com>
 <20250326195009.757247-2-praveen.kumar@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326195009.757247-2-praveen.kumar@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Apr 2025 02:22:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9185

merged.

Bruce

In message: [meta-virtualization][scarthgap][PATCH 2/3] docker-moby: Fix CVE-2024-36621
on 26/03/2025 Praveen Kumar via lists.yoctoproject.org wrote:

> moby v25.0.5 is affected by a Race Condition in
> builder/builder-next/adapters/snapshot/layer.go. The vulnerability could
> be used to trigger concurrent builds that call the EnsureLayer function
> resulting in resource leaks/exhaustion.
> 
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2024-36621
> 
> Upstream-patch:
> https://github.com/moby/moby/commit/37545cc644344dcb576cba67eb7b6f51a463d31e
> 
> Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
> ---
>  recipes-containers/docker/docker-moby_git.bb  |  1 +
>  .../docker/files/CVE-2024-36621.patch         | 83 +++++++++++++++++++
>  2 files changed, 84 insertions(+)
>  create mode 100644 recipes-containers/docker/files/CVE-2024-36621.patch
> 
> diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
> index a1879ed2..d274b002 100644
> --- a/recipes-containers/docker/docker-moby_git.bb
> +++ b/recipes-containers/docker/docker-moby_git.bb
> @@ -57,6 +57,7 @@ SRC_URI = "\
>          file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
>          file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=src/import \
>          file://CVE-2024-36620.patch;patchdir=src/import \
> +        file://CVE-2024-36621.patch;patchdir=src/import \
>  	"
>  
>  DOCKER_COMMIT = "${SRCREV_moby}"
> diff --git a/recipes-containers/docker/files/CVE-2024-36621.patch b/recipes-containers/docker/files/CVE-2024-36621.patch
> new file mode 100644
> index 00000000..a6c06ef2
> --- /dev/null
> +++ b/recipes-containers/docker/files/CVE-2024-36621.patch
> @@ -0,0 +1,83 @@
> +From 37545cc644344dcb576cba67eb7b6f51a463d31e Mon Sep 17 00:00:00 2001
> +From: Tonis Tiigi <tonistiigi@gmail.com>
> +Date: Wed, 6 Mar 2024 23:11:32 -0800
> +Subject: [PATCH] builder-next: fix missing lock in ensurelayer
> +
> +When this was called concurrently from the moby image
> +exporter there could be a data race where a layer was
> +written to the refs map when it was already there.
> +
> +In that case the reference count got mixed up and on
> +release only one of these layers was actually released.
> +
> +CVE: CVE-2024-36621
> +
> +Upstream-Status:
> +Backport [https://github.com/moby/moby/commit/37545cc644344dcb576cba67eb7b6f51a463d31e]
> +
> +Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
> +---
> + .../builder-next/adapters/snapshot/layer.go   |  3 +++
> + .../adapters/snapshot/snapshot.go             | 19 +++++++++++--------
> + 2 files changed, 14 insertions(+), 8 deletions(-)
> +
> +diff --git a/builder/builder-next/adapters/snapshot/layer.go b/builder/builder-next/adapters/snapshot/layer.go
> +index 73120ea70b..fc83058339 100644
> +--- a/builder/builder-next/adapters/snapshot/layer.go
> ++++ b/builder/builder-next/adapters/snapshot/layer.go
> +@@ -22,6 +22,9 @@ func (s *snapshotter) GetDiffIDs(ctx context.Context, key string) ([]layer.DiffI
> + }
> +
> + func (s *snapshotter) EnsureLayer(ctx context.Context, key string) ([]layer.DiffID, error) {
> ++	s.layerCreateLocker.Lock(key)
> ++	defer s.layerCreateLocker.Unlock(key)
> ++
> +	diffIDs, err := s.GetDiffIDs(ctx, key)
> +	if err != nil {
> +		return nil, err
> +diff --git a/builder/builder-next/adapters/snapshot/snapshot.go b/builder/builder-next/adapters/snapshot/snapshot.go
> +index a0d28ad984..510ffefb49 100644
> +--- a/builder/builder-next/adapters/snapshot/snapshot.go
> ++++ b/builder/builder-next/adapters/snapshot/snapshot.go
> +@@ -17,6 +17,7 @@ import (
> +	"github.com/moby/buildkit/identity"
> +	"github.com/moby/buildkit/snapshot"
> +	"github.com/moby/buildkit/util/leaseutil"
> ++	"github.com/moby/locker"
> +	"github.com/opencontainers/go-digest"
> +	"github.com/pkg/errors"
> +	bolt "go.etcd.io/bbolt"
> +@@ -51,10 +52,11 @@ type checksumCalculator interface {
> + type snapshotter struct {
> +	opt Opt
> +
> +-	refs map[string]layer.Layer
> +-	db   *bolt.DB
> +-	mu   sync.Mutex
> +-	reg  graphIDRegistrar
> ++	refs              map[string]layer.Layer
> ++	db                *bolt.DB
> ++	mu                sync.Mutex
> ++	reg               graphIDRegistrar
> ++	layerCreateLocker *locker.Locker
> + }
> +
> + // NewSnapshotter creates a new snapshotter
> +@@ -71,10 +73,11 @@ func NewSnapshotter(opt Opt, prevLM leases.Manager, ns string) (snapshot.Snapsho
> +	}
> +
> +	s := &snapshotter{
> +-		opt:  opt,
> +-		db:   db,
> +-		refs: map[string]layer.Layer{},
> +-		reg:  reg,
> ++		opt:               opt,
> ++		db:                db,
> ++		refs:              map[string]layer.Layer{},
> ++		reg:               reg,
> ++		layerCreateLocker: locker.New(),
> +	}
> +
> +	slm := newLeaseManager(s, prevLM)
> +--
> +2.40.0
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9175): https://lists.yoctoproject.org/g/meta-virtualization/message/9175
> Mute This Topic: https://lists.yoctoproject.org/mt/111924195/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


