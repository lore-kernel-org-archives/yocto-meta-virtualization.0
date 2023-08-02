Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4487C001DF
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 13:12:28 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web11.14536.1690981945291924380
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Aug 2023 06:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=DQRWjU/d;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-348f5193c12so22747055ab.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Aug 2023 06:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690981944; x=1691586744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TqeWok6SRia1ni7rWAAxEPvswQq7KNV57LqMsUkmAJk=;
        b=DQRWjU/dVn13qpDFv1wDxB/qbm2cuBJ42o8RPkv/9s392UWYjGoNnI5dd6kcoJVRDE
         blgWyMpWAxYKPOP2n33U9l8JPHxm+Hc2gjcBVBJAhmdlD8IPAI/zoNN/q3sbTNu8Z9J+
         jEPc/5hI6LDbme/gd/sxAKr7ziWWh9bzVDpOyJhiRqrGwZTUHCAEdjwjrv/QWHsFMES1
         g8Ty8Unv7FbUOrja9R0BjAI0OZaMAFp37RHTA49SxrPU6reLOj7VpxkOmUu8CfWEnZB4
         8PaV5a+0071yuo0KDGSdzkDEHbSpypoI+X4mtSfUPobXuaXZDeYlueJ7/wGHYSvaPlHL
         ekzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690981944; x=1691586744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TqeWok6SRia1ni7rWAAxEPvswQq7KNV57LqMsUkmAJk=;
        b=OWvbZPAxOnF7kvKu/JEoSvQGQr8grkIdyDstgCWho4JQP3uttWOyjBGEDYrlRC2B7R
         KMSBT3G5mLDNwVfD02a35ml/BHOzCLX6b/mWPXb16KkxC/JK5JEAaZ1EjiPa9HN1DCx4
         s7YNaWvxzB9U/wb+tYK/nhginzJjqJdzcCAv8eO30bR9eaUhWR26u6+kM87of+G0Qgyt
         8cZOPxdFk2WwRUDowmVQfK5XwurU9ATpJmV06h9D8Njf+HWbGJX8DkYJN3IRgVDb2Ohg
         c4ihtIjdmXMJ/XhVM6G0IPPT9oc6yjKkR46tZ0p8iUE3Smelog5qHpCWGhct6U25EH/b
         HxAw==
X-Gm-Message-State: ABy/qLYC0843nE9Ne29NzgiIz0zAHmJRiqLl8mTNQG5BB3bsPKS1mWwP
	ZfD+F9/4MxY6ywNR+Y5Q+D7wHeKRZPkU1uRyr7Yx0KXeif0=
X-Google-Smtp-Source: APBJJlFPwcVUU2mu7izze4SOsrd5QsLf7e5qTtE8Y5qLcqeQ+NFbQc3hlA3qqfkyAJeLeZY2UXAYuxZ5EvMwVRqCKtg=
X-Received: by 2002:a05:6e02:174e:b0:347:5ce2:b996 with SMTP id
 y14-20020a056e02174e00b003475ce2b996mr19809935ill.20.1690981944246; Wed, 02
 Aug 2023 06:12:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230802082210.1438735-1-mikko.rapeli@linaro.org>
In-Reply-To: <20230802082210.1438735-1-mikko.rapeli@linaro.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 2 Aug 2023 09:12:25 -0400
Message-ID: <CADkTA4OqTf4Z3kvdpnjjUHMKDnsfCpYWh0km-g7vaxu99X1x1w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] docker: update from 24.0.2 to 24.0.5
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Javier Tia <javier.tia@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Aug 2023 13:12:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8165

Thanks for the change, I'll double check my pending set of component
updates against this.

I have a full set of updates under test, but have been out of the
office the last week, so they are a bit delayed in making it to
master-next.

Bruce

On Wed, Aug 2, 2023 at 4:22=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro.or=
g> wrote:
>
> From: Mikko Rapeli <mikko.rapeli@linaro.org>
>
> go 1.20.6 from poky is not compatible with docker 24.0.2 and network
> stack inside container is failing with "invalid Host header" error,
> see for example https://github.com/moby/moby/issues/45935
>
> 24.0.5 contains the fixes for go and also other bug fixes.
> Suggested by Javier Tia <javier.tia@linaro.org>.
>
> Changes listed in
> https://docs.docker.com/engine/release-notes/24.0/ are:
>
> 24.0.5
>
> 2023-07-24
>
> For a full list of pull requests and changes in this release, refer to
> the relevant GitHub milestones:
>
>     docker/cli, 24.0.5 milestone
>     moby/moby, 24.0.5 milestone
>
> Bug fixes and enhancements
>
>     The Go client now avoids using UNIX socket paths in the HTTP Host:
> header, in order to be compatible with changes introduced in go1.20.6.
> moby/moby#45962, moby/moby#45990
>     containerd storage backend: Fix Variant not being included in docker
> image inspect and GET /images/{name}/json. moby/moby#46025
>     containerd storage backend: Prevent potential garbage collection of
> content during image export. moby/moby#46021
>     containerd storage backend: Prevent duplicate digest entries in
> RepoDigests. moby/moby#46014
>     containerd storage backend: Fix operations taking place against the
> incorrect tag when working with an image referenced by tag and digest.
> moby/moby#46013
>     containerd storage backend: Fix a panic caused by EXPOSE when
> building containers with the legacy builder. moby/moby#45921
>     Fix a regression causing unintuitive errors to be returned when
> attempting to create an overlay network on a non-Swarm node.
> moby/moby#45974
>     Properly report errors parsing volume specifications from the
> command line. docker/cli#4423
>     Fix a panic caused when auths: null is found in the CLI config file.
> docker/cli#4450
>
> Packaging updates
>
>     Use init scripts as provided by in moby/moby contrib/init.
> docker/docker-ce-packaging#914, docker/docker-ce-packaging#926
>     Drop Upstart from contrib/init. moby/moby#46044
>     Upgrade Go to go1.20.6. docker/cli#4428, moby/moby#45970,
> docker/docker-ce-packaging#921
>     Upgrade Compose to v2.20.2. docker/docker-ce-packaging#924
>     Upgrade buildx to v0.11.2. docker/docker-ce-packaging#922
>
> 24.0.4
>
> 2023-07-07
>
> For a full list of pull requests and changes in this release, refer to
> the relevant GitHub milestones:
>
>     docker/cli, 24.0.4 milestone
>     moby/moby, 24.0.4 milestone
>
> Bug fixes and enhancements
>
>     Fix a regression introduced during 24.0.3 that causes a panic during
> live-restore of containers with bind mounts. moby/moby#45903
>
> 24.0.3
>
> 2023-07-06
>
> For a full list of pull requests and changes in this release, refer to
> the relevant GitHub milestones:
>
>     docker/cli, 24.0.3 milestone
>     moby/moby, 24.0.3 milestone
>
> Bug fixes and enhancements
>
>     containerd image store: Fix an issue where multi-platform images
> that did not include a manifest for the default platform could not be
> interacted with. moby/moby#45849
>     containerd image store: Fix specious attempts to cache FROM scratch
> in container builds. moby/moby#45822
>     containerd image store: Fix docker cp with snapshotters that cannot
> mount the same content multiple times. moby/moby#45780, moby/moby#45786
>     containerd image store: Fix builds with type=3Dimage not being
> correctly unpacked/stored. moby/moby#45692
>     containerd image store: Fix incorrectly attempting to unpack
> pseudo-images (including attestations) in docker load. moby/moby#45688
>     containerd image store: Correctly set the user agent, and include
> additional information like the snapshotter when interacting with
> registries. moby/moby#45671, moby/moby#45684
>     containerd image store: Fix a failure to unpack already-pulled
> content after switching between snapshotters. moby/moby#45678
>     containerd image store: Fix images that have been re-tagged or with
> all tags removed being pruned while still in use. moby/moby#45857
>     Fix a Swarm CSI issue where the Topology field was not propagated
> into NodeCSIInfo. moby/moby#45810
>     Fix failures to add new Swarm managers caused by a very large raft
> log. moby/moby#45703, moby/swarmkit#3122, moby/swarmkit#3128
>     name_to_handle_at(2) is now always allowed in the default seccomp
> profile. moby/moby#45833
>     Fix an issue that prevented encrypted Swarm overlay networks from
> working on ports other than the default (4789). moby/moby#45637
>     Fix a failure to restore mount reference-counts during live-restore.
> moby/moby#45824
>     Fix various networking-related failures during live-restore.
> moby/moby#45658, moby/moby#45659
>     Fix running containers restoring with a zero (successful) exit
> status when the daemon is unexpectedly terminated. moby/moby#45801
>     Fix a potential panic while executing healthcheck probes.
> moby/moby#45798
>     Fix a panic caused by a race condition in container exec start.
> moby/moby#45794
>     Fix an exception caused by attaching a terminal to an exec with a
> non-existent command. moby/moby#45643
>     Fix host-gateway with BuildKit by passing the IP as a label (also
> requires docker/buildx#1894). moby/moby#45790
>     Fix an issue where POST /containers/{id}/stop would forcefully
> terminate the container when the request was canceled, instead of
> waiting until the specified timeout for a =E2=80=98graceful=E2=80=99 stop=
.
> moby/moby#45774
>     Fix an issue where docker cp -a from the root (/) directory would
> fail. moby/moby#45748
>     Improve compatibility with non-runc container runtimes by more
> correctly setting resource constraint parameters in the OCI config.
> moby/moby#45746
>     Fix an issue caused by overlapping subuid/subgid ranges in certain
> configurations (e.g. LDAP) in rootless mode. moby/moby#45747,
> rootless-containers/rootlesskit#369
>     Greatly reduce CPU and memory usage while populating the Debug
> section of GET /info. moby/moby#45856
>     Fix an issue where debug information was not correctly printed
> during docker info when only the client is in debug mode.
> docker/cli#4393
>     Fix issues related to hung connections when connecting to hosts over
> a SSH connection. docker/cli#4395
>
> Packaging updates
>
>     Upgrade Go to go1.20.5. moby/moby#45745, docker/cli#4351,
> docker/docker-ce-packaging#904
>     Upgrade Compose to v2.19.1. docker/docker-ce-packaging#916
>     Upgrade buildx to v0.11.1. docker/docker-ce-packaging#918
>
> Cc: Javier Tia <javier.tia@linaro.org>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  recipes-containers/docker/docker-moby_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-conta=
iners/docker/docker-moby_git.bb
> index 2fc11d0..de20aa6 100644
> --- a/recipes-containers/docker/docker-moby_git.bb
> +++ b/recipes-containers/docker/docker-moby_git.bb
> @@ -44,9 +44,9 @@ DESCRIPTION =3D "Linux container runtime \
>  # so we get that tag, and make it our SRCREVS:
>  #
>
> -SRCREV_moby =3D "d7aa1e14e521af24c0aca800a837866f514f46f7"
> +SRCREV_moby =3D "a61e2b4c9c5f7c241aeb37f389b4444aee26bea4"
>  SRCREV_libnetwork =3D "3f0048413d95802b9c6c836eba06bfc54f9dbd03"
> -SRCREV_cli =3D "0823df7daa197bba96f2f2a85b9cbe156df78d43"
> +SRCREV_cli =3D "ced099660009713e0e845eeb754e6050dbaa45d0"
>  SRCREV_FORMAT =3D "moby_libnetwork"
>  SRC_URI =3D "\
>         git://github.com/moby/moby.git;branch=3D24.0;name=3Dmoby;protocol=
=3Dhttps \
> @@ -66,7 +66,7 @@ require docker.inc
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://src/import/LICENSE;md5=3D4859e97a9c7780e779=
72d989f0823f28"
>
> -DOCKER_VERSION =3D "24.0.2"
> +DOCKER_VERSION =3D "24.0.5"
>  PV =3D "${DOCKER_VERSION}+git${SRCREV_moby}"
>
>  CVE_PRODUCT =3D "docker mobyproject:moby"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8164): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8164
> Mute This Topic: https://lists.yoctoproject.org/mt/100501205/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

