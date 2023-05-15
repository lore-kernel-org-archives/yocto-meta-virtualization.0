Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A0B1C77B75
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 16:00:03 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web11.92549.1684166402686280033
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 May 2023 09:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=RkpodWHh;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-76c5673330eso587502439f.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 May 2023 09:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684166402; x=1686758402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ev6wkqkbpe8/rHA7XuyAU+gNR3ITA3gqNAokwayAYIQ=;
        b=RkpodWHhDSdcpwPqkimlD4C4B7JjRanNDZ/zO16B2Mvj9mmLfEOvjeQgCd6u1lgGey
         RjbZgANWFi/shLPc2P5snq/rqQhSNqBkgEDR16i0Y793gX1c4TOYKjzLmx/PDP0wwmLs
         UtG6gJYl0f/95IAhjBTNOfeRUjeBsNp8AkXJ6iqli3xlTl4In1PY8PBdtEmr6sXLnUyh
         UI39BrtPX8rHv9UqBBR4AzJC/xlfkGhf6Tm1dNh9BayPim2mBE7cF+bH84jzsef9mOVh
         eVoKUaQ9GZ0sKvtE1KExzGiWnklxjVFe7u92v/NzTd0xp7QiCmRL37/3AQ7tNtvytAyK
         7/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684166402; x=1686758402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ev6wkqkbpe8/rHA7XuyAU+gNR3ITA3gqNAokwayAYIQ=;
        b=MV5v55WS63A0n1Emh3LByBwSnQYgI1amhsQrhu24dxqlplOX/14G1A+I1+8x165Mb6
         LGDxJegaV3kxt6062SuspI4Zl1PG+jxF23d3SQ4HtFE3s2Y6NitwzlYOM5F+vq5VvsKy
         6RUdX+t+9gAIOlfxNOs+WRAa2TfJMi9syVz7WseZqY00qkzLUdBK+MAt23yIfvN1C5N4
         qh0jswaYIMvFkKeE+9lPdlRJHiwjQVOlzZA6YjHaNPJI1mM8Yhb+94WFGs0p7Flnippt
         NTG8+j2utMtrL4Dp92EKzOm0DNKiX7RJDf3bYXWySTBbVbZ2knoCSClk+Zwuh6QV9elj
         6Gjw==
X-Gm-Message-State: AC+VfDxeI/p76A2WVHPehG0JrIrBQ1S4/NNH4eCMY0gySCy44KrxvUJc
	ftdd++cpI6qM6M6yUwMJB3vTV0M7L5dwYsIyHbU=
X-Google-Smtp-Source: ACHHUZ7lHuIuwh85U9y7vRqw11uvaxRoGzedLUw+vWx6uynxZ0GKOm8LDgcCFq3+MME6uBEp9RCJuV2UYcRdF/P2btI=
X-Received: by 2002:a5e:970b:0:b0:76c:826f:2188 with SMTP id
 w11-20020a5e970b000000b0076c826f2188mr7604ioj.6.1684166401734; Mon, 15 May
 2023 09:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230515152624.138713-1-adrian.freihofer@siemens.com>
In-Reply-To: <20230515152624.138713-1-adrian.freihofer@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 15 May 2023 11:59:50 -0400
Message-ID: <CADkTA4PCch0eAbH5j1_P=izKSh4ciOqs4bSGvm1V=ERCH6AR8w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 0/5] docker update to 23.0.6
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 15 May 2023 16:00:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8057

I already have a lot of in flight upgrades (these included), I just
haven't had a chance to update master-next.

Either way, thanks for the test status, I'll include it in my next
round of updates.

I'll consider the busybox pv change a bit more, but something similar
was tried in the past and we ran into python -> variable -> parse time
issues.

Bruce

On Mon, May 15, 2023 at 11:27=E2=80=AFAM Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> Tested using the following layers:
> - poky LTS, branch =3D kirkstone
> - meta-lts-mixins, branch =3D kirkstone/go
> - meta-lts-mixins, branch =3D kirkstone/rust
> - meta-virtualization, branch =3D master
>
> To one of my layers.conf files I added a hack:
>   LAYERSERIES_COMPAT_virtualization-layer +=3D "kirkstone"
> Otherwise the mixin layers seams to work surpisingly well with
> meta-virtualization master branch, at least for Docker.
>
> From target device:
>
> docker info
>     Client:
>     Context:    default
>     Debug Mode: false
>
>     Server:
>     Containers: 0
>       Running: 0
>       Paused: 0
>       Stopped: 0
>     Images: 0
>     Server Version: 23.0.6
>     Storage Driver: overlay2
>       Backing Filesystem: extfs
>       Supports d_type: true
>       Using metacopy: false
>       Native Overlay Diff: true
>       userxattr: false
>     Logging Driver: journald
>     Cgroup Driver: systemd
>     Cgroup Version: 2
>     Plugins:
>       Volume: local
>       Network: bridge host ipvlan macvlan null overlay
>       Log: awslogs fluentd gcplogs gelf journald json-file local logentri=
es splunk syslog
>     Swarm: active
>       NodeID: 2e9d3m5f67wpovhnnttnj763z
>       Is Manager: true
>       ClusterID: ivh4ga9xrsu9js9ah6se8pg5n
>       Managers: 1
>       Nodes: 1
>       Default Address Pool: 10.0.0.0/8
>       SubnetSize: 24
>       Data Path Port: 4789
>       Orchestration:
>       Task History Retention Limit: 1
>       Raft:
>       Snapshot Interval: 10000
>       Number of Old Snapshots to Retain: 0
>       Heartbeat Tick: 1
>       Election Tick: 10
>       Dispatcher:
>       Heartbeat Period: 5 seconds
>       CA Configuration:
>       Expiry Duration: 3 months
>       Force Rotate: 0
>       Autolock Managers: false
>       Root Rotation In Progress: false
>       Node Address: 192.168...
>       Manager Addresses:
>       192.168...:2377
>     Runtimes: io.containerd.runc.v2 runc
>     Default Runtime: runc
>     Init Binary: docker-init
>     containerd version: 1677a17964311325ed1c31e2c0a3589ce6d5c30d.m
>     runc version: v1.1.7-0-g860f061b-dirty
>     init version: b9f42a0-dirty
>     Security Options:
>       seccomp
>       Profile: builtin
>       cgroupns
>     Kernel Version: 5.15.71+gitb280d94
>     Operating System: My Distro
>     OSType: linux
>     Architecture: aarch64
>     CPUs: 2
>     Total Memory: 1.784GiB
>     Name: my-host
>     ID: 612ad6f3-0694-4252-befe-fcfb1f804bdc
>     Docker Root Dir: /data/lib/docker
>     Debug Mode: false
>     Registry: https://index.docker.io/v1/
>     Experimental: false
>     Insecure Registries:
>       127.0.0.0/8
>     Live Restore Enabled: false
>
>
> docker run -it alpine /bin/sh
>     Unable to find image 'alpine:latest' locally
>     latest: Pulling from library/alpine
>     08409d417260: Pull complete
>     Digest: sha256:02bb6f428431fbc2809c5d1b41eab5a68350194fb508869a33cb1a=
f4444c9b11
>     Status: Downloaded newer image for alpine:latest
>     / # cat /etc/os-release
>     NAME=3D"Alpine Linux"
>     ID=3Dalpine
>     VERSION_ID=3D3.18.0
>     PRETTY_NAME=3D"Alpine Linux v3.18"
>     HOME_URL=3D"https://alpinelinux.org/"
>     BUG_REPORT_URL=3D"https://gitlab.alpinelinux.org/alpine/aports/-/issu=
es"
>     / # exit
>
>
> docker run -it debian /bin/bash
>     Unable to find image 'debian:latest' locally
>     latest: Pulling from library/debian
>     d677c78be691: Pull complete
>     Digest: sha256:63d62ae233b588d6b426b7b072d79d1306bfd02a72bff1fc045b85=
11cc89ee09
>     Status: Downloaded newer image for debian:latest
>     root@84f1d770edfd:/# cat /etc/os-release
>     PRETTY_NAME=3D"Debian GNU/Linux 11 (bullseye)"
>     NAME=3D"Debian GNU/Linux"
>     VERSION_ID=3D"11"
>     VERSION=3D"11 (bullseye)"
>     VERSION_CODENAME=3Dbullseye
>     ID=3Ddebian
>     HOME_URL=3D"https://www.debian.org/"
>     SUPPORT_URL=3D"https://www.debian.org/support"
>     BUG_REPORT_URL=3D"https://bugs.debian.org/"
>     root@84f1d770edfd:/# exit
>     exit
>
> Adrian Freihofer (5):
>   busybox-initrd: auto pv from busybox
>   containerd: update to 1.7.1
>   moby: update to v23.0.6
>   runc-opencontainers: update to 1.1.7
>   runc-docker: update to 1.1.7
>
>  .../containerd/containerd-opencontainers_git.bb    |  6 +++---
>  recipes-containers/docker/docker-moby_git.bb       |  8 ++++----
>  recipes-containers/runc/runc-docker_git.bb         |  4 ++--
>  recipes-containers/runc/runc-opencontainers_git.bb |  4 ++--
>  ...{busybox-initrd_1.36.0.bb =3D> busybox-initrd.bb} | 14 ++++++++++++++
>  5 files changed, 25 insertions(+), 11 deletions(-)
>  rename recipes-core/busybox/{busybox-initrd_1.36.0.bb =3D> busybox-initr=
d.bb} (59%)
>
> --
> 2.40.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8051): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8051
> Mute This Topic: https://lists.yoctoproject.org/mt/98905945/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

