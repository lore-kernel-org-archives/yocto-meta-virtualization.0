Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C6ADC77B75
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 15:27:53 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.91645.1684164466364641565
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 May 2023 08:27:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=T90AjUiZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-50bd37ca954so112798974a12.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 May 2023 08:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684164464; x=1686756464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nCVP4OMfvcZLoLQ0lUcAgTePdxPCwfKhLzOFt7l7IA8=;
        b=T90AjUiZDX0x/V/kwnsCBcMA0OuRFp9An7cl3vE/xjX3CMih5eb6bX1DUFGZ5js+zb
         73hkcXStYVBECHUx5L1QuJqLcHfwURD3pvONuRhui7WTQH8lXS01FGNpjZmt/5yqWv1N
         J6KfOnlpGo86ZSHmHHeKuIbS+wjMf+hgFQBfwMn7uBHEnCX4eyO/9lb43YvQbQBvVfqY
         Qbo8wD2x9dN/x/5lLTjc6p1Yb/48LVX99Gx75gi5n6PqXO1cSPd62ESqsuUWiXYuV//Y
         jGXgIqV1kSMWpV00K6kCOXE93ha2x2x5ycmqz0XaNkkcy1xXH1Q2Nvf3zp6Z1DuG3K6A
         3BsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684164464; x=1686756464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nCVP4OMfvcZLoLQ0lUcAgTePdxPCwfKhLzOFt7l7IA8=;
        b=c1bPt4kkFhQjXRDCssbA3GeJob/XLwp/A2eQ83ySGE4GIsCHkaw9hAbuGx9IK9E6vn
         81RpEYbtNRAolO2Z4AoS4vMQUfScYh0ic7SPHL+Kldt9nGBSCuM0yB250c2ln09wafq4
         G5L1s3BIu3dcMmvuZPbddogoD8lr4CkwcAe5stFaK2OZwjZt8dxp0Oda3cSuMbQPceMd
         FT3IdL/0+qLGc5PDeTtzaJfgfp+hbkaE5uASURc3DoO/HqZT2ql64N+pD/g02Ij7YC/J
         Q6exxkZHvs/KOZGlgRc0GJHeUGiJ8w8PBFSsZzuAnD2mGj1cpQ/aLo9algXsDRh+BR0O
         aLqQ==
X-Gm-Message-State: AC+VfDz49XprkRQRbwseNxOxlA7OfY3k+W4rFz0QXcjhRUt4NmQCr1O7
	xHLzvL4ea8xT19PIV+IkeqwNly6Ll38=
X-Google-Smtp-Source: ACHHUZ5vR2yc3JvVTAp5YtCQX8Chqn0Ze3ihR+NqV76o4AZfnRdCAour1ltI63mYlIFtuIXUIQn20g==
X-Received: by 2002:a05:6402:42c6:b0:506:b94f:3d8f with SMTP id i6-20020a05640242c600b00506b94f3d8fmr32791395edc.5.1684164464229;
        Mon, 15 May 2023 08:27:44 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id ze12-20020a170906ef8c00b009659fa6eeddsm9690128ejb.196.2023.05.15.08.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 08:27:43 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-virtualization][PATCH 0/5] docker update to 23.0.6
Date: Mon, 15 May 2023 17:26:19 +0200
Message-Id: <20230515152624.138713-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 15 May 2023 15:27:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8051

Tested using the following layers:
- poky LTS, branch = kirkstone
- meta-lts-mixins, branch = kirkstone/go
- meta-lts-mixins, branch = kirkstone/rust
- meta-virtualization, branch = master

To one of my layers.conf files I added a hack:
  LAYERSERIES_COMPAT_virtualization-layer += "kirkstone"
Otherwise the mixin layers seams to work surpisingly well with
meta-virtualization master branch, at least for Docker.

From target device:

docker info
    Client:
    Context:    default
    Debug Mode: false

    Server:
    Containers: 0
      Running: 0
      Paused: 0
      Stopped: 0
    Images: 0
    Server Version: 23.0.6
    Storage Driver: overlay2
      Backing Filesystem: extfs
      Supports d_type: true
      Using metacopy: false
      Native Overlay Diff: true
      userxattr: false
    Logging Driver: journald
    Cgroup Driver: systemd
    Cgroup Version: 2
    Plugins:
      Volume: local
      Network: bridge host ipvlan macvlan null overlay
      Log: awslogs fluentd gcplogs gelf journald json-file local logentries splunk syslog
    Swarm: active
      NodeID: 2e9d3m5f67wpovhnnttnj763z
      Is Manager: true
      ClusterID: ivh4ga9xrsu9js9ah6se8pg5n
      Managers: 1
      Nodes: 1
      Default Address Pool: 10.0.0.0/8  
      SubnetSize: 24
      Data Path Port: 4789
      Orchestration:
      Task History Retention Limit: 1
      Raft:
      Snapshot Interval: 10000
      Number of Old Snapshots to Retain: 0
      Heartbeat Tick: 1
      Election Tick: 10
      Dispatcher:
      Heartbeat Period: 5 seconds
      CA Configuration:
      Expiry Duration: 3 months
      Force Rotate: 0
      Autolock Managers: false
      Root Rotation In Progress: false
      Node Address: 192.168...
      Manager Addresses:
      192.168...:2377
    Runtimes: io.containerd.runc.v2 runc
    Default Runtime: runc
    Init Binary: docker-init
    containerd version: 1677a17964311325ed1c31e2c0a3589ce6d5c30d.m
    runc version: v1.1.7-0-g860f061b-dirty
    init version: b9f42a0-dirty
    Security Options:
      seccomp
      Profile: builtin
      cgroupns
    Kernel Version: 5.15.71+gitb280d94
    Operating System: My Distro
    OSType: linux
    Architecture: aarch64
    CPUs: 2
    Total Memory: 1.784GiB
    Name: my-host
    ID: 612ad6f3-0694-4252-befe-fcfb1f804bdc
    Docker Root Dir: /data/lib/docker
    Debug Mode: false
    Registry: https://index.docker.io/v1/
    Experimental: false
    Insecure Registries:
      127.0.0.0/8
    Live Restore Enabled: false


docker run -it alpine /bin/sh
    Unable to find image 'alpine:latest' locally
    latest: Pulling from library/alpine
    08409d417260: Pull complete 
    Digest: sha256:02bb6f428431fbc2809c5d1b41eab5a68350194fb508869a33cb1af4444c9b11
    Status: Downloaded newer image for alpine:latest
    / # cat /etc/os-release 
    NAME="Alpine Linux"
    ID=alpine
    VERSION_ID=3.18.0
    PRETTY_NAME="Alpine Linux v3.18"
    HOME_URL="https://alpinelinux.org/"
    BUG_REPORT_URL="https://gitlab.alpinelinux.org/alpine/aports/-/issues"
    / # exit


docker run -it debian /bin/bash
    Unable to find image 'debian:latest' locally
    latest: Pulling from library/debian
    d677c78be691: Pull complete 
    Digest: sha256:63d62ae233b588d6b426b7b072d79d1306bfd02a72bff1fc045b8511cc89ee09
    Status: Downloaded newer image for debian:latest
    root@84f1d770edfd:/# cat /etc/os-release 
    PRETTY_NAME="Debian GNU/Linux 11 (bullseye)"
    NAME="Debian GNU/Linux"
    VERSION_ID="11"
    VERSION="11 (bullseye)"
    VERSION_CODENAME=bullseye
    ID=debian
    HOME_URL="https://www.debian.org/"
    SUPPORT_URL="https://www.debian.org/support"
    BUG_REPORT_URL="https://bugs.debian.org/"
    root@84f1d770edfd:/# exit
    exit

Adrian Freihofer (5):
  busybox-initrd: auto pv from busybox
  containerd: update to 1.7.1
  moby: update to v23.0.6
  runc-opencontainers: update to 1.1.7
  runc-docker: update to 1.1.7

 .../containerd/containerd-opencontainers_git.bb    |  6 +++---
 recipes-containers/docker/docker-moby_git.bb       |  8 ++++----
 recipes-containers/runc/runc-docker_git.bb         |  4 ++--
 recipes-containers/runc/runc-opencontainers_git.bb |  4 ++--
 ...{busybox-initrd_1.36.0.bb => busybox-initrd.bb} | 14 ++++++++++++++
 5 files changed, 25 insertions(+), 11 deletions(-)
 rename recipes-core/busybox/{busybox-initrd_1.36.0.bb => busybox-initrd.bb} (59%)

-- 
2.40.1


