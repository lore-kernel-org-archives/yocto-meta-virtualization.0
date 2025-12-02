Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B54ACD116F3
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 01:12:00 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7590.1764637917546656983
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 17:11:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YdP1wE/h;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4ede6b5cad7so18286211cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 01 Dec 2025 17:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764637916; x=1765242716; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/iVG1HymKN1HZS5OCSh2qLJUNVNaHtUcjcW15ab+HNI=;
        b=YdP1wE/hyHvhGIgYArdauVrsWgSKCLaOynZhhhSIHPBDwdiD5Nd4Rex40jfYiEA61h
         VdDE15q33Vm9T9hXeuuEeZCNYFNi0Afhobn6ZFwa/8LbqUaeqDKdholzVMFPe6bLG2ym
         s5Dfz1h+MXJzl2TeuQ/2jajd4dM6wx2cKmwWUchd9GZCckYoWu7i6+F1NXZgKBec9Uxm
         g35QIJVfqmxFCY/qgKzWp1TaD0QFL1Tl1oXkl6QfYvSCpO+hxtTt75R59t4Yii2GHTvO
         H2Z3IZClirbvYFzphOoCHiIHreIEyhGKNvxEoa7JHboIvU1ATrDzuU2LriI20Dfnw+4b
         2Pxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764637916; x=1765242716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/iVG1HymKN1HZS5OCSh2qLJUNVNaHtUcjcW15ab+HNI=;
        b=jYjeQU/ccy3GkUW0PY2psehCzfpewzZB80cy0c0Dv+p0u/l2Vhh/z7mbJ52gVh5c2G
         ckieP9zO9IA1bfTZjLjyXOO8rDKuOF7jzHgADuyYttIkRIXZ25tEJRxMlBd/+7Cb5lw7
         bUdT+AFO1ULejRUVFJvuoMI5HwnvvLI1WyloLfDpVR/trK/3/CTfilvfJMuT6xxn5V7X
         s6YA4JoTjxke7sAKBNl3h6rBqNYPAcEDReekgPcJHJr8uPr+U2CVhBdGRxlyGh90o7/c
         vzk38QjOznGuqzOTwBikUgF+q5q/iGyXFzW5ZyQGF94Ep64P54Wx8ntDgfzF+f/uSTBh
         IqFQ==
X-Gm-Message-State: AOJu0YxOz4nei2710NjXS1QlZZvFg2k3FPOEBJ1t8SZdQHXS/BDxlbF3
	A7Rk18NJJojMxqjrvZQSaB0lmm5liuQi1fze3AhZPgLhr/PSZMebGg+bvOSowRZDujs=
X-Gm-Gg: ASbGnctY4omqL6eWrj4MZCS8zgN+LeMR7gnIeToSHjIa+ZI0iJgEsxwQqyVrJldAVb3
	beyqdXCi8sy8zu9pzT8TT0zgir4xj5c6+CvD8obxBhDn2lhkY13SNQg5B6sD07tHo3oWaoZwUtS
	4JDZUF7OQ6rMBITH/gLmHF4TXKv7Lo8/2zcsooJpiFvVZ2ez5PfbEGwRzrylMXn7cV3OiLuWe4m
	9rAx3nStBTxyeOOmd6pEY8MFSqRt39GBCIxPqTy7ctslS85K1t4E23buqWdKNTciT58ox5EXhJW
	WzaduhjwolEki4aqn1p8Ely6DHxkLDBed+bGq3Nqo6TBa/vHNnww4Qw/vkFaPRaW6qnPC73oyxa
	5B7kteS9WHCOoeQIJ1cnQtLu/ZNQ0czsM+PqRiMHyJ3+xvFLiAQHJwCvt/n/x8AxAO6XaZqk8ym
	ygvpwVEyu2FMG2vIn9baoAeazC50nvPEtKp1kKSLWjqFfdTeNyedVGKu2ZbT03EaKw
X-Google-Smtp-Source: AGHT+IEI+tsCMpXYTqV1F+c285LEZvr26lTRWQgtPj2R4KoB66macX36ITXK/KO3y46Jt8ZHwwBNIw==
X-Received: by 2002:a05:622a:1a26:b0:4ee:42e6:a5 with SMTP id d75a77b69052e-4efbdabff99mr480793071cf.57.1764637916428;
        Mon, 01 Dec 2025 17:11:56 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f0046825d6sm10869391cf.5.2025.12.01.17.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 17:11:55 -0800 (PST)
Date: Mon, 1 Dec 2025 20:11:54 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: vanusuri@mvista.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][kirkstone][PATCH 2/2]
 containerd-opencontainers: fix CVE-2025-64329
Message-ID: <aS482uMvjz7PCB2Y@gmail.com>
References: <20251110113049.120549-1-vanusuri@mvista.com>
 <20251110113049.120549-2-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110113049.120549-2-vanusuri@mvista.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 02 Dec 2025 01:12:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9465

This patch says 2/2, but I can't find patch 1/2. What was the
subject of 1/2 ? Or rather than just telling me the subject, if
you resend it, that would be great.

Bruce

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


