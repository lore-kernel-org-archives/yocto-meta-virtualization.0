Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9963DC4708E
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:59:58 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.37855.1670831987304699300
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 11 Dec 2022 23:59:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VtH+sxc/;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id vv4so25831405ejc.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 11 Dec 2022 23:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDWen4Z5hXx0h58OaocS1Fl6K04fvRgScqu+FADr450=;
        b=VtH+sxc/HnkBl0LfwLfoBye2szBbJ2l2Culh8fpaEt9OVWkLgWMFxoVOyMZw5K/X6k
         LI9hnvrkN5mCQxd3pWusVKK1DieCLQ5Rmsx3WBA4Zlo2hou8HLuEgMyYyrd9bO7/udtE
         T/fP0fs1Q1ml1uM1s6+gY+1sbd9uLDVztjeY4bkynv2yBjA0zMUR/ypPuPCcOCJoOWqq
         P6CJdfJlZ/8ag11Or1mJ+PolE8jVXOHdm66dMmx4R9hHglqJ343tF14qCgSpQCvL5AZv
         /bCr+xwgLlGs+2rtAXv1KqJLmb+sUeMtOqhZVzhAoKKbyC+CJvI3Zb9nnY2i0RYDjZHk
         x1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDWen4Z5hXx0h58OaocS1Fl6K04fvRgScqu+FADr450=;
        b=tZt3hYtAOJP/YGEIoFeAQS1KduH4VGl/L0mWrcb6xVovN7cgeb0srcuQerQ6y19ivW
         VtI0fAhsHtF69jHs5kSvj54PKvxjHVKUVzWeIFBalFKvKQk/NegVZVq7JChx1yg/+KZl
         EyRkQzZKkci8YfS+gvPALLI62T2Syc4wyH1jt1VKWLDmjfqGHgCtoHod+85mtLc/Pe0b
         oqz0JAdLcIaGHFIim2cMTKZIwY9qf9fW3mbQxywq8QQB0ppjB5BzZxnngHkmBjqPoPhM
         47bycgLtQD8B1L6GZWi3o6hjbw0m9XDymW9iPJavAh8g+K+y/nzaSFFuDpO7CrSO9R3m
         Yzug==
X-Gm-Message-State: ANoB5pklkx2yTpybHFAUYj9wx6KBvkX0StgW56nyTospZmsfMh7o+Ndj
	mOBiA2gvJ8hBClVUirDcdg4T6Wu9AXA=
X-Google-Smtp-Source: AA0mqf46kkZ1XgRKWdSR3JS36ZjurCX6zIbwfNwKi5Ze3pfHNlkMa3vPU6vXZfkWwHJho3ESQ8YDWQ==
X-Received: by 2002:a17:906:c054:b0:7ae:b637:633f with SMTP id bm20-20020a170906c05400b007aeb637633fmr17930871ejb.4.1670831991890;
        Sun, 11 Dec 2022 23:59:51 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id ko5-20020a170907986500b007bd1ef2cccasm2952278ejc.48.2022.12.11.23.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 23:59:51 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][kirkstone][PATCHv2 10/21] containerd: update to 1.6.8
Date: Mon, 12 Dec 2022 08:58:46 +0100
Message-Id: <20221212075857.1065221-11-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
References: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Dec 2022 07:59:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7763

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping containerd to version v1.6.8-8-g579a6380e, which comprises the following commits:

    1efd8b947 ci: remove GOPROXY environment variable due to https://github.com/go-yaml/yaml/issues/887
    0448673af Do not append []string{""} to command to preserve Docker compatibility
    5c230ece0 Fix cleanup in critest
    ed9d3dc37 oci: WithDefaultUnixDevices(): remove tun/tap from the default devices
    3364f411e Prepare release notes for v1.6.8
    390920429 release workflow: remove Go setup action
    cf48ba6e8 release workflow: increase timeout to 30 minutes
    57873e652 release: rollback Ubuntu to 18.04 (except for riscv64)
    eccb82f6d Update release build timeout to 20 minutes
    6a854d4b5 Update mailmap
    61612e1a2 Prepare release notes for 1.6.7
    d199ee462 Update golang to 1.17.13
    0578d20c5 Change os.Stderr reassign for Windows service
    12cae4961 Update Vagrant CI to macos-12
    bc4091aae chore: bump macos runner version
    cb73bd050 Windows HostProcess container CRI stats test
    ac388525a Add validations for Windows HostProcess CRI configs
    0007f40fe [release/1.6] go.mod: Bump hcsshim to v0.9.4
    c9607e78c Update Fedora version to 36
    2952b66c0 CI: add riscv64 builds
    6b2dc9a37 release/Dockerfile: update Ubuntu to 22.04 for supporting riscv64
    745dc07c4 seccomp: support riscv64
    c2f841f21 Create ppc64le release
    86b55bd8d seccomp: allow clock_settime64 when CAP_SYS_TIME is added
    f3da3e51f allow ptrace(2) by default for kernel >= 4.8
    aa1101068 [release/1.6] update golang to 1.17.12
    37dfc5c9d [release/1.6] Fix WWW-Authenticate parsing

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../containerd/containerd-opencontainers_git.bb             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
index 35a27d4..af91a22 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "containerd is a daemon to control runC, built for performance and
                support as well as checkpoint and restore for cloning and live migration of containers."
 
 
-SRCREV = "4e92d8e7e439530f5bb17e57a77481e9aa3da851"
+SRCREV = "579a6380ec93ab92a6e7f26167fe4f18dfcf2a4b"
 SRC_URI = "git://github.com/containerd/containerd;branch=release/1.6;protocol=https \
            file://0001-Add-build-option-GODEBUG-1.patch \
            file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch \
@@ -15,8 +15,8 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/1.6;protocol=ht
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=1269f40c0d099c21a871163984590d89"
 
-CONTAINERD_VERSION = "v1.6.6"
-CVE_VERSION = "1.6.6"
+CONTAINERD_VERSION = "v1.6.8"
+CVE_VERSION = "1.6.8"
 
 EXTRA_OEMAKE += "GODEBUG=1"
 
-- 
2.38.1


