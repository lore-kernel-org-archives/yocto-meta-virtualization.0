Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69685C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 13:48:02 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.93526.1783086480469601182
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 06:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HAOFOGuz;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c01089e8aso4693021cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Jul 2026 06:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783086479; x=1783691279; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EZPtPgzhseDK9UF8qZG8uHJYrHSKjrG1y0YD3zdiZkQ=;
        b=HAOFOGuzxMycMiJH6yQuuFQ4FuhRmlFjB10AT5dBOOmFCgGOjHuPQ0A+P4GhGoXdso
         icXU/2v0OAlvbQ41UwA7rHC11OQKufy/HgxbkvPe7DoJm6VhsK5YL8bIoVZuU/nr6ZpU
         ShV086LdckzYZiFUZcokTC3B/uGo5BWtsLmE5Ec1k3UJ2krnQXWhpjLofW3MRrcMGZpx
         t0xyb0nuJafiBaGpIE7SN8yukZfUo1iHZJyMo7S0FWG4XpgoXQBRKVXkACE39c5l6rV5
         hhwK9S2Rlpo34rINkvPvQFv/GUeOItri6R/c8bxcmveqLqEsBydSihzA6CVQsHe5nccB
         YgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783086479; x=1783691279;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EZPtPgzhseDK9UF8qZG8uHJYrHSKjrG1y0YD3zdiZkQ=;
        b=NxYL7czWcPdPoa0YG5vC5KrbVWXxA4g0tY/K/WZXfnA4ELmFeSReGvd+92sOiSoPUE
         ZZQ8WaicMOQ5AsYI8fqsR2S+BuNWJC4ce9mloXsf77P0XseSckJGvKpzc4Hy4r1z5yFx
         RZC0BsZIclh4FN2XlHGgUi+7rMXcexJyBNgwUcWOOeJYt9g2DRRQwInIH0rs/k0kN9i6
         Qfl6ValvKUAhCvj+12Ff1QWkQdAtA84GxWfQvbR+VbGJaRv/PashJrNqi8QwQklamZCT
         GQNNSOG89YJaIKyAWVNzDK5U473iTWOF5yRGEnC310Gy8h/NIgyY6EyaSV5SOXTK2coG
         MUVg==
X-Gm-Message-State: AOJu0YyDM1TZcdpavFqntJwGa286LgVi9tkNfA/WggGrv0ARcfV5T5Iw
	QMtAoGGUGXu0D4lbtrX5rPoNcQpoHfdPf8OyLVhx4NpWkEbcE3KS2nMV
X-Gm-Gg: AfdE7clj3fVL8BP5Fe6yw0rGLkx0v3Voh+zaDY8yGFJ5njscSlh2Sv+ivmI3ON0G6aA
	VTb2WIaaxmDEF5RJ9f8w5caT3C8/kORb8CLffEVz8KPUcoDLJOnRqukxfRD1+aNKvytdwHi7evQ
	r7Y6ip5da05xpNSgJodZJBSEe6BHGI0V9Ti5dQgOzokfN3unW/mO1FIOVkJpZ1kzH4895AlPttX
	mrBIr7+rp4XQ8bhgj4SbB2YHZHMpwasOuzF2ldw2lSQDerkxfyWWhGyThfUzFIB8yrOdbAybOE0
	0s3OMjTCRrUpQDmWSRpPOqZO/bXThUwn4UtmaGewS9bf8Wei9ZExDh81FnVbQ/M3TpvA6oKriMg
	xuyoYf6n8MaW/d42PNv1KDVKJ3uJiza0l5u2F8/mfm1SYaPXFKrz0wMEbDfu2clTgTeptBy9iEJ
	MPrHu4skvqayQqPvIWudUcj2bU4ZI0Ef7LmkJW/qFFqQeaPYLM8If9TyfoG7R+dA8IWOOM6Qf1E
	5ASKXyrvy1UaUo6DtUdAJpO7ydCW6rYHuiQnMFlLWw2Ztr/Mx2/yU+UgGF7uvUkOdyawGWLr5HS
	wAfmiN7RvNM=
X-Received: by 2002:a05:622a:349:b0:51c:1c00:e46 with SMTP id d75a77b69052e-51c2ad33d7dmr114718711cf.25.1783086479157;
        Fri, 03 Jul 2026 06:47:59 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f471813d33sm55739656d6.29.2026.07.03.06.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 06:47:58 -0700 (PDT)
Date: Fri, 3 Jul 2026 09:47:56 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: benjamin.robin@bootlin.com
Cc: meta-virtualization@lists.yoctoproject.org,
	olivier.benjamin@bootlin.com, pascal.eberhard@se.com,
	wahid.essid@se.com
Subject: Re: [meta-virtualization] [scarthgap][PATCH] containerd: update to
 v2.0.10
Message-ID: <ake9jNRbuFZtvndA@gmail.com>
References: <20260703-containerd-update-v1-1-dae635875482@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-containerd-update-v1-1-dae635875482@bootlin.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Jul 2026 13:48:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9916


merged.

Bruce

In message: [meta-virtualization] [scarthgap][PATCH] containerd: update to v2.0.10
on 03/07/2026 Benjamin Robin via lists.yoctoproject.org wrote:

> Bumping containerd to version v2.0.10, which comprises the following
> commits since v2.0.7:
> 
> 03a19324f990 Bound user-database file reads in openBoundedUserFile
> bbf4a2b8e6c8 Do not propagate reserved labels from image configs
> a15e98122d25 update runc binary to v1.3.6
> ba2ed2a5e5b5 [release/2.2] update runc binary to v1.3.5
> 474184497e5b runc: Update runc binary to v1.3.4
> becbb802ec9a update go to 1.26.4/1.25.11
> 55bdc8bc5b0d Configure udevd children-max for root-test
> 6d81e88679f8 Clean up disk space in node e2e workflow
> 1a3d1c85e0d0 oci: return explicit error for out-of-range USER values
> fa2a97505844 seccomp: Block AF_ALG in default socket policy
> 4b2b07879d7c seccomp: Document socket rule scope and socketcall limitation
> ea56c960571d Support both styles of volatile mount option
> 3d34dc82065b sandbox: forward Create fields, fix event topics
> 4b260843e3f6 apparmor: Set abi conditionally
> 3e9c4d1e0c12 Add GitHub Action for k8s node e2e tests
> cf73e68731f8 Fix TOCTOU race bug in tar extraction
> 2320b319e096 cri:fix lost container exit events if they arrive before info is cached
> fde1480df4c6 update github.com/moby/spdystream v0.5.1
> 5b2eee8a2936 update to Go 1.25.9, 1.26.2
> c579db16e210 update golangci-lint to v2.9.0 with go1.26 support
> 185ddcfd0cda remove windows/arm from cross build
> 8538158dfacc Ignore warnings for golangci-lint bump
> 1cff32695c41 ci: bump golangci from 6.5.2 to 7.0.0
> 2e02b8bb316e Skip github.com/cyphar/filepath-securejoin license checks
> e71fc560b19b Updating selinux to v1.13.1
> 868869eb9eff fix: sanitize error before gRPC return to prevent credential leak in pod events
> 40632e4f2aa7 fix: redact all query parameters in CRI error logs
> 85c3b2b0276b CODEOWNERS: mark Sam and Chris as owners for 2.0
> 902d804c9914 Update github.com/moby/spdystream v0.4.0->v0.5.0
> e92d7b131182 make linter happy in release
> 12fc0e6ca205 add integration test for cni result nil
> 8d912c6a2be3 address comment
> 742f8b8f60a2 fix issue where cni del is never executed
> f246535975c9 Ignore NOCHANGE error
> 9c656fab42dc ci: update CIFuzz actions to support Ubuntu 24.04
> c71c4a091aeb integration: Fix TestImageLoad() failure on CI
> bfee299990b4 ci: modprobe xt_comment on almalinux
> 
> Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
> ---
>  recipes-containers/containerd/containerd-opencontainers_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
> index 4ecc915a9c35..bd2a9117b098 100644
> --- a/recipes-containers/containerd/containerd-opencontainers_git.bb
> +++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
> @@ -5,7 +5,7 @@ DESCRIPTION = "containerd is a daemon to control runC, built for performance and
>                 support as well as checkpoint and restore for cloning and live migration of containers."
>  
>  
> -SRCREV = "4ac6c20c7bbf8177f29e46bbdc658fec02ffb8ad"
> +SRCREV = "ffa3ba0cfc08e443758c01c73a69db403d31ad1b"
>  SRC_URI = "git://github.com/containerd/containerd;branch=release/2.0;protocol=https;destsuffix=git/src/github.com/containerd/containerd/v2 \
>             file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch \
>             file://0001-build-don-t-use-gcflags-to-define-trimpath.patch \
> @@ -15,8 +15,8 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/2.0;protocol=ht
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1269f40c0d099c21a871163984590d89"
>  
> -CONTAINERD_VERSION = "v2.0.7"
> -CVE_VERSION = "2.0.7"
> +CONTAINERD_VERSION = "v2.0.10"
> +CVE_VERSION = "2.0.10"
>  
>  # EXTRA_OEMAKE += "GODEBUG=1"
>  
> 
> ---
> base-commit: 9d0007a369deb4a6346f5ab7a9e6d432a8ed14fe
> change-id: 20260703-containerd-update-a71a2b785727
> 
> Best regards,
> --  
> Benjamin Robin <benjamin.robin@bootlin.com>
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9910): https://lists.yoctoproject.org/g/meta-virtualization/message/9910
> Mute This Topic: https://lists.yoctoproject.org/mt/120099097/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


