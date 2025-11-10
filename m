Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76EF0CCFA13
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 11:31:13 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46132.1762774265162394796
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 10 Nov 2025 03:31:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=UEkoEx1Z;
 spf=pass (domain: mvista.com, ip: 209.85.216.45, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3436d6aa66dso1378673a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Nov 2025 03:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1762774264; x=1763379064; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/WKP1RL3aSNfX0cf7Iw1+nAeLjsYLQHDN3CWUDM9YU=;
        b=UEkoEx1ZYMzHzUNJiPoitxENU/oEDVHls3SdN2mQID9aVZd4fCs3mNeoQXKPP5zFbU
         mBr3k9sQEDYcn2x4XRjaNrKPSt74VFaW1cmN2cxfpeyOumjf8WVCVPNdn/Jr6hT5X+Cj
         cUr1veZ4Vk2m4daavazdjGGLHCj6Xz59a1XIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762774264; x=1763379064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t/WKP1RL3aSNfX0cf7Iw1+nAeLjsYLQHDN3CWUDM9YU=;
        b=DH6FZDtYrG4rbGBtd3NGwDob5LiSYLTdJXHRAk+FO2N3qHAkocz+51JLWKDoEywc3D
         7FClKYA7GyJdARDahdZp6ugenieoMwVrVVma6qCjUp75hrNsKMhze8fbfZWiCcsqbsAC
         7UpmBiFg86RRb5mPKIu/97LeA8YBOXmreShfTK5fzLHHWTPkJ823DoRMYDO/0a0tb6Ue
         ShhlJ5ccjx8v+w9GNAnP1TFs34lgyhTksoUGh6iKeYb8IdjQmlhtCTqtUeZYs2fwrUYP
         HYhitTdI75PBYPRfqwrJAwLGUxbjCJ0D8IOpX2g38/FMPwYKcStnn477shdRhuwmL9Vj
         G9FA==
X-Gm-Message-State: AOJu0YwkMtdb26+0z/l9e+Qw9Y+fHWN34SoP87BW8GuXb1ntQGRkY+TL
	YaYdWqTIvC3aFHXFZV8R8aOUZcSTTFzfcX3qXG7sp0O7Xs3vzgRgwKLkb6f2PzjmGCtj/aHQAKb
	9hoR3hQs=
X-Gm-Gg: ASbGncuPltrh4E78d0lQByeRG+FkJSOYqB3/iPav4SjfcLYrT8Y4Mzl3hLXUPx79HJA
	n0khS4OrAkjYGr1TjDT3TiwWrRjKorFHm/q92iRh1ohHLa3kCG4ys+JEnuNUjN0GnEJY6sKGdfS
	shcuo4eq+Xiy0Mys3AVjJ1VdsN8EQCs1zsDHn5UpyyPrCbNSs/cE0SJiXVT6dc1i/KK0EgxmnTV
	CZRslrw141F8bJ97/6ogGGiKb88GT895bwNR+3W3jGUgWLAhqO1cjyThRpVKobByPSdvSNDhioC
	jPrgTVq30QHV3gdaXdbmCFkJxd0bTknYl0RvldBe2Kuj1Jt5R6M6+ngOk82fmhnH6Kw3ER37AH5
	+Vb5C2aAbFrIonihff1Rv21reMsHCixxmSBsLoLMuU0Hgg0Ccf2d4pNuxAh+1sKxWgxmcoEp7Eh
	HjsUBiQ3HoQHxSSl/rhOsd8pN5Zw==
X-Google-Smtp-Source: AGHT+IFQzHXyhKRohqvCp8Fr3UxfUqJOf8ObQMnjiYz5GUUr83lCcZrJLgpQ172nPqET6AxKLJEuIg==
X-Received: by 2002:a17:90b:53c3:b0:340:dd63:3fd5 with SMTP id 98e67ed59e1d1-3435378896amr14123159a91.17.1762774264096;
        Mon, 10 Nov 2025 03:31:04 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:8fcf:9e59:b0c4:9342:b8a5:38cf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343614818f5sm8865090a91.15.2025.11.10.03.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:31:03 -0800 (PST)
From: vanusuri@mvista.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [meta-virtualization][kirkstone][PATCH 2/2]  containerd-opencontainers: fix CVE-2025-64329
Date: Mon, 10 Nov 2025 17:00:49 +0530
Message-Id: <20251110113049.120549-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251110113049.120549-1-vanusuri@mvista.com>
References: <20251110113049.120549-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Nov 2025 11:31:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9437

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/containerd/containerd/commit/c575d1b5f4011f33b32f71ace75367a92b08c750

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../CVE-2025-64329.patch                      | 80 +++++++++++++++++++
 .../containerd-opencontainers_git.bb          |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 recipes-containers/containerd/containerd-opencontainers/CVE-2025-64329.patch

diff --git a/recipes-containers/containerd/containerd-opencontainers/CVE-2025-64329.patch b/recipes-containers/containerd/containerd-opencontainers/CVE-2025-64329.patch
new file mode 100644
index 00000000..a3cc5e85
--- /dev/null
+++ b/recipes-containers/containerd/containerd-opencontainers/CVE-2025-64329.patch
@@ -0,0 +1,80 @@
+From c575d1b5f4011f33b32f71ace75367a92b08c750 Mon Sep 17 00:00:00 2001
+From: wheat2018 <1151937289@qq.com>
+Date: Tue, 13 Aug 2024 15:56:31 +0800
+Subject: [PATCH] fix goroutine leak of container Attach
+
+The monitor goroutine (runs (*ContainerIO).Attach.func1) of Attach will
+never finish if it attaches to a container without any stdout or stderr
+output. Wait for http context cancel and break the pipe actively to
+address the issue.
+
+Signed-off-by: wheat2018 <1151937289@qq.com>
+Signed-off-by: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
+(cherry picked from commit a0d0f0ef68935338d2c710db164fa7820f692530)
+Signed-off-by: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
+
+Excluded pkg/cri/sbserver/container_attach.go changes as the file not
+present in our current vrsion 1.6.19
+
+Upstream-Status: Backport [https://github.com/containerd/containerd/commit/c575d1b5f4011f33b32f71ace75367a92b08c750]
+CVE: CVE-2025-64329
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ pkg/cri/io/container_io.go         | 14 +++++++++++---
+ pkg/cri/server/container_attach.go |  2 +-
+ 2 files changed, 12 insertions(+), 4 deletions(-)
+
+diff --git a/pkg/cri/io/container_io.go b/pkg/cri/io/container_io.go
+index 70bc8b789..e1584100f 100644
+--- a/pkg/cri/io/container_io.go
++++ b/pkg/cri/io/container_io.go
+@@ -17,6 +17,7 @@
+ package io
+ 
+ import (
++	"context"
+ 	"errors"
+ 	"io"
+ 	"strings"
+@@ -134,7 +135,7 @@ func (c *ContainerIO) Pipe() {
+ 
+ // Attach attaches container stdio.
+ // TODO(random-liu): Use pools.Copy in docker to reduce memory usage?
+-func (c *ContainerIO) Attach(opts AttachOptions) {
++func (c *ContainerIO) Attach(ctx context.Context, opts AttachOptions) {
+ 	var wg sync.WaitGroup
+ 	key := util.GenerateID()
+ 	stdinKey := streamKey(c.id, "attach-"+key, Stdin)
+@@ -175,8 +176,15 @@ func (c *ContainerIO) Attach(opts AttachOptions) {
+ 	}
+ 
+ 	attachStream := func(key string, close <-chan struct{}) {
+-		<-close
+-		logrus.Infof("Attach stream %q closed", key)
++		select {
++		case <-close:
++			logrus.Infof("Attach stream %q closed", key)
++		case <-ctx.Done():
++			logrus.Infof("Attach client of %q cancelled", key)
++			// Avoid writeGroup heap up
++			c.stdoutGroup.Remove(key)
++			c.stderrGroup.Remove(key)
++		}
+ 		// Make sure stdin gets closed.
+ 		if stdinStreamRC != nil {
+ 			stdinStreamRC.Close()
+diff --git a/pkg/cri/server/container_attach.go b/pkg/cri/server/container_attach.go
+index a95215051..3625229f9 100644
+--- a/pkg/cri/server/container_attach.go
++++ b/pkg/cri/server/container_attach.go
+@@ -79,6 +79,6 @@ func (c *criService) attachContainer(ctx context.Context, id string, stdin io.Re
+ 		},
+ 	}
+ 	// TODO(random-liu): Figure out whether we need to support historical output.
+-	cntr.IO.Attach(opts)
++	cntr.IO.Attach(ctx, opts)
+ 	return nil
+ }
+-- 
+2.25.1
+
diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
index 264d37a6..05683d26 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/1.6;protocol=ht
            file://0001-build-don-t-use-gcflags-to-define-trimpath.patch \
            file://CVE-2024-40635.patch \
            file://CVE-2024-25621.patch \
+           file://CVE-2025-64329.patch \
           "
 
 # Apache-2.0 for containerd
-- 
2.25.1


