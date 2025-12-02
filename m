Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D82CFD376
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 04:46:07 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.717.1764650762785031250
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 20:46:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D0Px1Ow/;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4ed66b5abf7so63637781cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 01 Dec 2025 20:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764650762; x=1765255562; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eAIjdyatT+QVhivxlC0p/lp0KxXSvVOWGvI3q1YGHlk=;
        b=D0Px1Ow/9iBm/3NvGDQbPuAMM+I9AvdIqUjicbRRtSPY2PY8mnema8KKvm7s7NH68W
         kixfUjKn0cubAfuagxlSOMReWTNlizplnuyseKa8PFBV+rNe3sNQOtuxtG56CFEu7koJ
         6TYTJo0OFM47noNZAJRBmbTF7lzoIV2eoxi1KGD327ANZ+Abqr9qRoJKDm69wmuJG4PS
         cdhR5ww6rCouwD/hnUEi99wPx1NW7YvYEpOUJJGQzqwoZaNYyDw0AVYYpih+NHCTCR3V
         /vVMPYtpmQHdXB5UD+gAleo4FjP/jTt3VE/xcTK4GwRFPBWmJ7DWs9pwbMJikufD2Ia5
         V0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764650762; x=1765255562;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eAIjdyatT+QVhivxlC0p/lp0KxXSvVOWGvI3q1YGHlk=;
        b=X1sn9WpNvRnDDyXCqj54oU0e9uWj0qurJkY9k13SBJe3Zx+IWlMRdM1SOI3gQUQKmi
         oFgDY84y9vzE1/ycMXJBk1pvs+BY16J/lGCpBt6vpKUg6+UU6thTMGsVHTXRE2+y0L79
         4Lqapq/mcmPYqnECb1wq8gOfB5lzfMDYYTw75X1SD4ZOblTzpuQ7iBmQ0IwuKfsWa1N4
         jZevic+MmiOuKggyUyQuVTIIjfzd84td5G3vSVqa5KWFYgArRLtGbsBbPltH+OwEv8aG
         ymymX3HyosIEiZLhjffIHOqVO1phtQxmQ+zthyH9ircNJFpCmh8cGfhs+KasJqqdTWEU
         44wQ==
X-Gm-Message-State: AOJu0YyooAjZ7EOYwXZ9094oALtXGHIDNJQYGtFOHYSngwBYryNmhW9J
	kN6O4ce+2nmDfNUDiFeQdeh5MeJswMpUiP7EMsqy6IvvLF3khH6Pc/YPUWJoMd+zt2c=
X-Gm-Gg: ASbGncu0pksU9v1nw/GPp/fWjPQft5W0sfvigMJso61O7DRtpKnmgQKrEggUlRDyHsY
	34gzICT1NBnKs+rK4dEiikTu1k0WVbPNoHm/KMzyT7UQzzEOBP61qkpNSRzU1FQVc3TUCuu5DIo
	8O9MgMOmeY7efROHSKYNKe6ylwD1zePZOBBJbeSaijzBsm5b7KvvwYs/wNKr5IiV3/HHnxHTAYm
	wbR/0tRf5QjxA2woz0M6JFojF41QEZFljPNt2d7OwZBcvzTe9VPFMLKVp5bk0uwbFFfVk+KU7Yt
	a/J6Z+tcGapHj++u2TkoVuQjpysWXQL1M2M4uLuxOxpaiKJNV5OkUTxwuULaKRmfit4d13/qJ0c
	lhOMxqt/tml6OohLuPie6yl/uIrB/dzvJLO09gcv+jNJ1NXAqEE15KiOFY5t7aH9DlUrXCb72+m
	SysEcswh46N/rxlRJfauDWTRnvn24k1h39t118+6lTEN5myGQoSwtbTwIYBGxCeQnT
X-Google-Smtp-Source: AGHT+IEDH6m4naci2iQ/PtFMh4wW8yHTYcdEHhMZzzRHjSrCh/4EhAXYz45sPL9mAZI23UviVmrzQQ==
X-Received: by 2002:a05:622a:1989:b0:4ee:26b3:e512 with SMTP id d75a77b69052e-4f0088de078mr20886741cf.13.1764650761577;
        Mon, 01 Dec 2025 20:46:01 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4efd341f0ecsm86040051cf.16.2025.12.01.20.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 20:46:00 -0800 (PST)
Date: Mon, 1 Dec 2025 23:45:59 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Vijay Anusuri <vanusuri@mvista.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][kirkstone][PATCH 2/2]
 containerd-opencontainers: fix CVE-2025-64329
Message-ID: <aS5vBydbPbyJW690@gmail.com>
References: <20251110113049.120549-1-vanusuri@mvista.com>
 <20251110113049.120549-2-vanusuri@mvista.com>
 <aS482uMvjz7PCB2Y@gmail.com>
 <CANQUz19+66fM5nGVWzBR134c_VADBG5OKs_+fRXakY4bY0VpkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANQUz19+66fM5nGVWzBR134c_VADBG5OKs_+fRXakY4bY0VpkQ@mail.gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 02 Dec 2025 04:46:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9470

It looks like I also merged this one. I see it on the branch now
that I've looked.

Bruce

In message: Re: [meta-virtualization][kirkstone][PATCH 2/2] containerd-opencontainers: fix CVE-2025-64329
on 02/12/2025 Vijay Anusuri wrote:

> Hi Bruce,
> 
> Patch 1/2 (containerd-opencontainers: fix CVE-2024-25621) appears to have
> already been merged.
> 
> Patch 1/2 : https://git.yoctoproject.org/meta-virtualization/commit/?h=
> kirkstone&id=9f4afbb21a91eab9917a25811f1d2ba7d223e071
> Patch 2/2 : https://git.yoctoproject.org/meta-virtualization/commit/?h=
> kirkstone&id=4da521b4440f57b10ba70091ee0e31b1085e665e
> 
> Since the patches were merged, I wanted to confirm with you before resending
> them.
> If you would still like me to resend the patches, I can do so.
> 
> Thanks & Regards,
> Vijay
> 
> On Tue, Dec 2, 2025 at 6:41 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> 
>     This patch says 2/2, but I can't find patch 1/2. What was the
>     subject of 1/2 ? Or rather than just telling me the subject, if
>     you resend it, that would be great.
> 
>     Bruce
> 
>     In message: [meta-virtualization][kirkstone][PATCH 2/2]
>     containerd-opencontainers: fix CVE-2025-64329
>     on 10/11/2025 Vijay Anusuri via lists.yoctoproject.org wrote:
> 
>     > From: Vijay Anusuri <vanusuri@mvista.com>
>     >
>     > Upstream-Status: Backport from https://github.com/containerd/containerd/
>     commit/c575d1b5f4011f33b32f71ace75367a92b08c750
>     >
>     > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>     > ---
>     >  .../CVE-2025-64329.patch                      | 80 +++++++++++++++++++
>     >  .../containerd-opencontainers_git.bb          |  1 +
>     >  2 files changed, 81 insertions(+)
>     >  create mode 100644 recipes-containers/containerd/
>     containerd-opencontainers/CVE-2025-64329.patch
>     >
>     > diff --git a/recipes-containers/containerd/containerd-opencontainers/
>     CVE-2025-64329.patch b/recipes-containers/containerd/
>     containerd-opencontainers/CVE-2025-64329.patch
>     > new file mode 100644
>     > index 00000000..a3cc5e85
>     > --- /dev/null
>     > +++ b/recipes-containers/containerd/containerd-opencontainers/
>     CVE-2025-64329.patch
>     > @@ -0,0 +1,80 @@
>     > +From c575d1b5f4011f33b32f71ace75367a92b08c750 Mon Sep 17 00:00:00 2001
>     > +From: wheat2018 <1151937289@qq.com>
>     > +Date: Tue, 13 Aug 2024 15:56:31 +0800
>     > +Subject: [PATCH] fix goroutine leak of container Attach
>     > +
>     > +The monitor goroutine (runs (*ContainerIO).Attach.func1) of Attach will
>     > +never finish if it attaches to a container without any stdout or stderr
>     > +output. Wait for http context cancel and break the pipe actively to
>     > +address the issue.
>     > +
>     > +Signed-off-by: wheat2018 <1151937289@qq.com>
>     > +Signed-off-by: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
>     > +(cherry picked from commit a0d0f0ef68935338d2c710db164fa7820f692530)
>     > +Signed-off-by: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
>     > +
>     > +Excluded pkg/cri/sbserver/container_attach.go changes as the file not
>     > +present in our current vrsion 1.6.19
>     > +
>     > +Upstream-Status: Backport [https://github.com/containerd/containerd/
>     commit/c575d1b5f4011f33b32f71ace75367a92b08c750]
>     > +CVE: CVE-2025-64329
>     > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>     > +---
>     > + pkg/cri/io/container_io.go         | 14 +++++++++++---
>     > + pkg/cri/server/container_attach.go |  2 +-
>     > + 2 files changed, 12 insertions(+), 4 deletions(-)
>     > +
>     > +diff --git a/pkg/cri/io/container_io.go b/pkg/cri/io/container_io.go
>     > +index 70bc8b789..e1584100f 100644
>     > +--- a/pkg/cri/io/container_io.go
>     > ++++ b/pkg/cri/io/container_io.go
>     > +@@ -17,6 +17,7 @@
>     > + package io
>     > +
>     > + import (
>     > ++    "context"
>     > +     "errors"
>     > +     "io"
>     > +     "strings"
>     > +@@ -134,7 +135,7 @@ func (c *ContainerIO) Pipe() {
>     > +
>     > + // Attach attaches container stdio.
>     > + // TODO(random-liu): Use pools.Copy in docker to reduce memory usage?
>     > +-func (c *ContainerIO) Attach(opts AttachOptions) {
>     > ++func (c *ContainerIO) Attach(ctx context.Context, opts AttachOptions) {
>     > +     var wg sync.WaitGroup
>     > +     key := util.GenerateID()
>     > +     stdinKey := streamKey(c.id, "attach-"+key, Stdin)
>     > +@@ -175,8 +176,15 @@ func (c *ContainerIO) Attach(opts AttachOptions) {
>     > +     }
>     > +
>     > +     attachStream := func(key string, close <-chan struct{}) {
>     > +-            <-close
>     > +-            logrus.Infof("Attach stream %q closed", key)
>     > ++            select {
>     > ++            case <-close:
>     > ++                    logrus.Infof("Attach stream %q closed", key)
>     > ++            case <-ctx.Done():
>     > ++                    logrus.Infof("Attach client of %q cancelled", key)
>     > ++                    // Avoid writeGroup heap up
>     > ++                    c.stdoutGroup.Remove(key)
>     > ++                    c.stderrGroup.Remove(key)
>     > ++            }
>     > +             // Make sure stdin gets closed.
>     > +             if stdinStreamRC != nil {
>     > +                     stdinStreamRC.Close()
>     > +diff --git a/pkg/cri/server/container_attach.go b/pkg/cri/server/
>     container_attach.go
>     > +index a95215051..3625229f9 100644
>     > +--- a/pkg/cri/server/container_attach.go
>     > ++++ b/pkg/cri/server/container_attach.go
>     > +@@ -79,6 +79,6 @@ func (c *criService) attachContainer(ctx
>     context.Context, id string, stdin io.Re
>     > +             },
>     > +     }
>     > +     // TODO(random-liu): Figure out whether we need to support
>     historical output.
>     > +-    cntr.IO.Attach(opts)
>     > ++    cntr.IO.Attach(ctx, opts)
>     > +     return nil
>     > + }
>     > +--
>     > +2.25.1
>     > +
>     > diff --git a/recipes-containers/containerd/
>     containerd-opencontainers_git.bb b/recipes-containers/containerd/
>     containerd-opencontainers_git.bb
>     > index 264d37a6..05683d26 100644
>     > --- a/recipes-containers/containerd/containerd-opencontainers_git.bb
>     > +++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
>     > @@ -11,6 +11,7 @@ SRC_URI = "git://github.com/containerd/containerd;
>     branch=release/1.6;protocol=ht
>     >             file://0001-build-don-t-use-gcflags-to-define-trimpath.patch
>     \
>     >             file://CVE-2024-40635.patch \
>     >             file://CVE-2024-25621.patch \
>     > +           file://CVE-2025-64329.patch \
>     >            "
>     > 
>     >  # Apache-2.0 for containerd
>     > --
>     > 2.25.1
>     >
> 
>     >
>     > -=-=-=-=-=-=-=-=-=-=-=-
>     > Links: You receive all messages sent to this group.
>     > View/Reply Online (#9437): https://lists.yoctoproject.org/g/
>     meta-virtualization/message/9437
>     > Mute This Topic: https://lists.yoctoproject.org/mt/116217320/1050810
>     > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>     > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
>     bruce.ashfield@gmail.com]
>     > -=-=-=-=-=-=-=-=-=-=-=-
>     >
> 
> 

