Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C9B1C369C9
	for <webhook@archiver.kernel.org>; Sat, 19 Apr 2025 22:48:38 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.6251.1745102910532605988
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 19 Apr 2025 15:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z8DFfHjH;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-47691d82bfbso56145081cf.0
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 19 Apr 2025 15:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745102909; x=1745707709; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VVMi2WLuZkZBHUl93gdDjydMBpoB6Bj6j5S1gtIBb+Q=;
        b=Z8DFfHjHeDjAbc4UORBFlYKMwUyAOY73AOoujBV/Kmg51DiWY5xteXuJZJWC7mZp/3
         cgdAZsWCJIRoGz62VLbI13UdjkBhhbYuosE0+1MuzLxhEhPH2+OZYiq6/51+04B/qjWQ
         +moTPjCBeIPNgcMnpA/gFP1dEGn5AUJG4Yi46l6bSjc/GMd37M4iUFEiWn75GLUM8aon
         /JSzK/y1gpneH+GfxHMw4KGQaSr8dFxPfyUhP9b9yFyT4QG5AIqM+1udyHFpeC+73KvP
         sdgCD9Q/kNsxKcrWO6KEShz6PGkDqqA5zQNbm+sMYGFdj4/TVrtP6t1xqeI4XHhtaPkO
         miRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745102909; x=1745707709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVMi2WLuZkZBHUl93gdDjydMBpoB6Bj6j5S1gtIBb+Q=;
        b=lj+HutIAZ+rsDHfI8BPolLceM2n53qppJqr8pV8w8q/u0qzUIRYeidACEfOsMGBBz+
         jx0QyG3MCzp86IxmZrI+nURUJeYWibVz4HjtP1QZOqhrbbTHRZRLQVlrxuiRcudy+z1X
         7PDt5jEdkl+YTfwKCwsUq1cAqi8XDBV8JSDwb6uEKCGlvxaoNhyF42v7RjhKCfcP7Q00
         vZ0M66k9+XDiM/lKzNMna62pHROqKL0BkyTYi8Jd4DHeDRP0Vps9rd67/A+5bHV/Rrak
         IVAIQvlzbA8G6mnpCMbx5BPfaVZSXPHfLyyAHy16UwKrl01ELzZ9ohksl8wYp7G8bt8o
         eudw==
X-Gm-Message-State: AOJu0YwNaAarYmPEDGrREIFkPNvMjNqUNAtYOqyyUgwf+aG1Dm0yFJcg
	75HRl8qHil3f9W8Vu9yYHyLMEpHH9hXX5zFTSk7kgl+7Qyxf3F7T
X-Gm-Gg: ASbGncts4FOD+aDDsfUOfrrlaCjFeaMALr4vM642YAxc6W58dG759trkyhF+O8pV69C
	1N41axvrJccDpaRDaGEY4O+AnFY6FGnw40IuwTI/KjsGxs4EOVzh7bxvsl1AUWWCrmzMjkSkN0T
	IwY9J7g8mUKruWTNWw+kKi49doYmj0cfVbOrfqjpYYdVx9kbpbiGMw4TbB0JbE1B4lVph8FL+dv
	jZHo+Ex7wx6NDv/G/T3ACHoYef20I6X29QCT+1oV5l1whJH/rnuAYjZP5k45Mf8hKG3T8SE5nrt
	8UQ51Z4qKVc8JsaJf/Jclo31kacu75OQc7DyLX+nIC1KQ0I2u44MKPo83JQ1hUe4c+G9/hQ/Ltw
	E9sD+AJW6lxdxARw686l5mluwS49wuQ==
X-Google-Smtp-Source: AGHT+IEVI+cpO5n/rPk+nhWKSLKL0Qubp/NKqQvLvkFrevmaJ9Wq2ObtO6rdwAbBJ7yvYVS3NZCW0w==
X-Received: by 2002:a05:622a:1aa0:b0:476:832b:7ee1 with SMTP id d75a77b69052e-47aec4a017emr126380301cf.40.1745102909323;
        Sat, 19 Apr 2025 15:48:29 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c4cdc4sm26144141cf.42.2025.04.19.15.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 15:48:28 -0700 (PDT)
Date: Sat, 19 Apr 2025 22:48:26 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: praveen.kumar@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][scarthgap][PATCH 1/1] buildah: Fix
 CVE-2024-9675
Message-ID: <aAQoOrruuTCF2Ght@gmail.com>
References: <20250414132956.770831-1-praveen.kumar@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414132956.770831-1-praveen.kumar@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 19 Apr 2025 22:48:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9230

merged.

Bruce

In message: [meta-virtualization][scarthgap][PATCH 1/1] buildah: Fix CVE-2024-9675
on 14/04/2025 Praveen Kumar via lists.yoctoproject.org wrote:

> A vulnerability was found in Buildah. Cache mounts do not properly
> validate that user-specified paths for the cache are within our cache
> directory, allowing a `RUN` instruction in a Container file to mount an
> arbitrary directory from the host (read/write) into the container as long
> as those files can be accessed by the user running Buildah.
> 
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2024-9675
> https://security-tracker.debian.org/tracker/CVE-2024-9675
> 
> Upstream-patch:
> https://github.com/containers/buildah/commit/cffa820dc8be07efdb7fc4e8e8b9ff44c70aaf93
> 
> Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
> ---
>  .../buildah/buildah/CVE-2024-9675.patch       | 113 ++++++++++++++++++
>  recipes-containers/buildah/buildah_git.bb     |   1 +
>  2 files changed, 114 insertions(+)
>  create mode 100644 recipes-containers/buildah/buildah/CVE-2024-9675.patch
> 
> diff --git a/recipes-containers/buildah/buildah/CVE-2024-9675.patch b/recipes-containers/buildah/buildah/CVE-2024-9675.patch
> new file mode 100644
> index 00000000..6a655366
> --- /dev/null
> +++ b/recipes-containers/buildah/buildah/CVE-2024-9675.patch
> @@ -0,0 +1,113 @@
> +From cffa820dc8be07efdb7fc4e8e8b9ff44c70aaf93 Mon Sep 17 00:00:00 2001
> +From: Matt Heon <mheon@redhat.com>
> +Date: Wed, 9 Oct 2024 15:23:03 -0400
> +Subject: [PATCH] Properly validate cache IDs and sources
> +
> +The `--mount type=cache` argument to the `RUN` instruction in
> +Dockerfiles was using `filepath.Join` on user input, allowing
> +crafted paths to be used to gain access to paths on the host,
> +when the command should normally be limited only to Buildah;s own
> +cache and context directories. Switch to `filepath.SecureJoin` to
> +resolve the issue.
> +
> +Fixes CVE-2024-9675
> +
> +CVE: CVE-2024-9675
> +
> +Upstream-Status: Backport [https://github.com/containers/buildah/commit/cffa820dc8be07efdb7fc4e8e8b9ff44c70aaf93]
> +
> +Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
> +---
> + internal/volumes/volumes.go | 19 ++++++++++++++-----
> + tests/bud.bats              | 34 ++++++++++++++++++++++++++++++++++
> + 2 files changed, 48 insertions(+), 5 deletions(-)
> +
> +diff --git a/internal/volumes/volumes.go b/internal/volumes/volumes.go
> +index c07c67ebe..c6d6e3545 100644
> +--- a/internal/volumes/volumes.go
> ++++ b/internal/volumes/volumes.go
> +@@ -23,6 +23,7 @@ import (
> +	"github.com/containers/storage/pkg/idtools"
> +	"github.com/containers/storage/pkg/lockfile"
> +	"github.com/containers/storage/pkg/unshare"
> ++	digest "github.com/opencontainers/go-digest"
> +	specs "github.com/opencontainers/runtime-spec/specs-go"
> +	selinux "github.com/opencontainers/selinux/go-selinux"
> + )
> +@@ -362,7 +363,11 @@ func GetCacheMount(args []string, store storage.Store, imageMountLabel string, a
> +			return newMount, nil, fmt.Errorf("no stage found with name %s", fromStage)
> +		}
> +		// path should be /contextDir/specified path
> +-		newMount.Source = filepath.Join(mountPoint, filepath.Clean(string(filepath.Separator)+newMount.Source))
> ++		evaluated, err := copier.Eval(mountPoint, string(filepath.Separator)+newMount.Source, copier.EvalOptions{})
> ++		if err != nil {
> ++			return newMount, nil, err
> ++		}
> ++		newMount.Source = evaluated
> +	} else {
> +		// we need to create cache on host if no image is being used
> +
> +@@ -379,11 +384,15 @@ func GetCacheMount(args []string, store storage.Store, imageMountLabel string, a
> +		}
> +
> +		if id != "" {
> +-			newMount.Source = filepath.Join(cacheParent, filepath.Clean(id))
> +-			buildahLockFilesDir = filepath.Join(BuildahCacheLockfileDir, filepath.Clean(id))
> ++			// Don't let the user control where we place the directory.
> ++			dirID := digest.FromString(id).Encoded()[:16]
> ++			newMount.Source = filepath.Join(cacheParent, dirID)
> ++			buildahLockFilesDir = filepath.Join(BuildahCacheLockfileDir, dirID)
> +		} else {
> +-			newMount.Source = filepath.Join(cacheParent, filepath.Clean(newMount.Destination))
> +-			buildahLockFilesDir = filepath.Join(BuildahCacheLockfileDir, filepath.Clean(newMount.Destination))
> ++			// Don't let the user control where we place the directory.
> ++			dirID := digest.FromString(newMount.Destination).Encoded()[:16]
> ++			newMount.Source = filepath.Join(cacheParent, dirID)
> ++			buildahLockFilesDir = filepath.Join(BuildahCacheLockfileDir, dirID)
> +		}
> +		idPair := idtools.IDPair{
> +			UID: uid,
> +diff --git a/tests/bud.bats b/tests/bud.bats
> +index 3a1dbd63a..9e3930f52 100644
> +--- a/tests/bud.bats
> ++++ b/tests/bud.bats
> +@@ -6648,3 +6648,37 @@ _EOF
> +   assert "$status" -eq 2 "exit code from ls"
> +   expect_output --substring "No such file or directory"
> + }
> ++
> ++@test "build-check-cve-2024-9675" {
> ++  _prefetch alpine
> ++
> ++  touch ${TEST_SCRATCH_DIR}/file.txt
> ++
> ++  cat > ${TEST_SCRATCH_DIR}/Containerfile <<EOF
> ++FROM alpine
> ++RUN --mount=type=cache,id=../../../../../../../../../../../$TEST_SCRATCH_DIR,target=/var/tmp \
> ++ls -l /var/tmp && cat /var/tmp/file.txt
> ++EOF
> ++
> ++  run_buildah 1 build --no-cache ${TEST_SCRATCH_DIR}
> ++  expect_output --substring "cat: can't open '/var/tmp/file.txt': No such file or directory"
> ++
> ++  cat > ${TEST_SCRATCH_DIR}/Containerfile <<EOF
> ++FROM alpine
> ++RUN --mount=type=cache,source=../../../../../../../../../../../$TEST_SCRATCH_DIR,target=/var/tmp \
> ++ls -l /var/tmp && cat /var/tmp/file.txt
> ++EOF
> ++
> ++  run_buildah 1 build --no-cache ${TEST_SCRATCH_DIR}
> ++  expect_output --substring "cat: can't open '/var/tmp/file.txt': No such file or directory"
> ++
> ++  mkdir ${TEST_SCRATCH_DIR}/cve20249675
> ++  cat > ${TEST_SCRATCH_DIR}/cve20249675/Containerfile <<EOF
> ++FROM alpine
> ++RUN --mount=type=cache,from=testbuild,source=../,target=/var/tmp \
> ++ls -l /var/tmp && cat /var/tmp/file.txt
> ++EOF
> ++
> ++  run_buildah 1 build --security-opt label=disable --build-context testbuild=${TEST_SCRATCH_DIR}/cve20249675/ --no-cache ${TEST_SCRATCH_DIR}/cve20249675/
> ++  expect_output --substring "cat: can't open '/var/tmp/file.txt': No such file or directory"
> ++}
> +--
> +2.40.0
> diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
> index 288a1cb0..83d861cb 100644
> --- a/recipes-containers/buildah/buildah_git.bb
> +++ b/recipes-containers/buildah/buildah_git.bb
> @@ -34,6 +34,7 @@ SRCREV_storage = "246ba3062e8b551026aef2708eee747014ce5c52"
>  SRC_URI = " \
>      git://github.com/containers/buildah;branch=release-1.34;name=buildah;protocol=https \
>      file://0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch;patchdir=src/github.com/containers/buildah/vendor/github.com/containers/storage \
> +    file://CVE-2024-9675.patch;patchdir=src/github.com/containers/buildah \
>      "
>  
>  DEPENDS = "libdevmapper btrfs-tools gpgme"
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9221): https://lists.yoctoproject.org/g/meta-virtualization/message/9221
> Mute This Topic: https://lists.yoctoproject.org/mt/112256810/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


