Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955C0C04A6A
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 13:00:13 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.106919.1692018004208650675
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Aug 2023 06:00:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Hl1NB9wk;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4fe44955decso4989439e87.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Aug 2023 06:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692018002; x=1692622802;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UcDF3z+/L4+tVKD+K6wj7Mu2sDcNmbq852XJAC6W+t4=;
        b=Hl1NB9wkKZklX0CHcA9nnnSoQhtMtiOagwTTo0KNN+jWeWTd2GMYpjuIAkJfH2QH/j
         kLw3j8w27Po2BN3scqyLSImUdruIns4fTMG52XjGNJgxpg1AhwLkDIAlVHInBMb47liN
         gGt2Uei6aWSVMgEK1IMsNvvoY1OezAEHamf58+XmQQPcuyUjvVyY0rlhlniRkMbP4JSB
         RXBr3nx5J5sPfp0XDPsuWQeYeCPhxq7Qnzx5OYJ1iYxEOzM4FDMwLDpN/BlLXxF0g3KV
         Cs+pTiiW5yHpfZS6BTmrjvr5MNfXSco0/Jml4jtARW60JC1YJyfpbvccBod8B9mjWNVy
         Bodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692018002; x=1692622802;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UcDF3z+/L4+tVKD+K6wj7Mu2sDcNmbq852XJAC6W+t4=;
        b=bvaL3bJXpIKpZszyWTBtPGMZQ2Q9oQ3S9cDcAk1XDW9VDGYUFAd5f1+R3hgDepNbj3
         +4vg6oaBNstodbpx2Oqi3Igcqk6hEZiFRLvvJVWjCiX+rH6HVHZWG0ZTHomATJYOy/1y
         oi/TsHsWDP8ASMQt8phP3ggj3aPtmkTbYSzolgtMUGPuggBg/zFGlNszSdklnDq1aEtn
         /MdywzWw5tV6g7Phd/kzlPLcjnTqKA8Kh0pBTTGtqPc1WyebpsxwL5sOLj7TiUGcnbto
         N+LYx13kRhi2JAX243ssjEmCFbd2gICXN9JhFHkfyu8GOcRaaMWY42Ko6aCq9tFCglUB
         V9DA==
X-Gm-Message-State: AOJu0YyIP3xm6pdYKbI13YxG7WNrgcvDUTnKDut0gWWsZ+yeLkI5fBZ1
	a+gnQVgdiZL4YwPVRAJrX6Cj7A==
X-Google-Smtp-Source: AGHT+IFbaJp8rx2e4sAlqRgWkuEOKAh9a4fYBF2SR3fIv7mOxT4xRDn3zYMu7N34M+hJKLxqIhIRpQ==
X-Received: by 2002:a05:6512:3d9e:b0:4f9:dac6:2f3d with SMTP id k30-20020a0565123d9e00b004f9dac62f3dmr3659814lfv.13.1692018002153;
        Mon, 14 Aug 2023 06:00:02 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id j1-20020ac253a1000000b004fe37199b87sm1947757lfh.156.2023.08.14.06.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 06:00:01 -0700 (PDT)
Date: Mon, 14 Aug 2023 15:59:59 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	meta-virtualization@lists.yoctoproject.org,
	Javier Tia <javier.tia@linaro.org>
Subject: Re: [meta-virtualization][PATCH] docker: update from 24.0.2 to 24.0.5
Message-ID: <ZNolT+ee+Lo0yZYP@nuoska>
References: <20230802082210.1438735-1-mikko.rapeli@linaro.org>
 <CADkTA4OqTf4Z3kvdpnjjUHMKDnsfCpYWh0km-g7vaxu99X1x1w@mail.gmail.com>
 <ZNnFaZr31xzBO1Wa@nuoska>
 <CA+chaQdgEY33tZcAiKbqO1pUvpF-4DTsjx6MmqnXdQq1GdnXGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+chaQdgEY33tZcAiKbqO1pUvpF-4DTsjx6MmqnXdQq1GdnXGQ@mail.gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Aug 2023 13:00:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8184

Hi,

On Mon, Aug 14, 2023 at 02:44:22PM +0200, Martin Jansa wrote:
> Hi,
> 
> looks like kirkstone and dunfell are affected as well after go backports:
> kirkstone: https://lists.openembedded.org/g/openembedded-core/message/185082
> dunfell: https://lists.openembedded.org/g/openembedded-core/message/185895

Yes, fix should be an update of moby from v20.10.21 to v20.10.25 in kirkstone.
dunfell docker 19.03 looks like not maintained anymore upstream.

Unfortunately I've managed update from dunfell and kirkstone to master branch
and don't build these branches anymore.

Cheers,

-Mikko

> Cheers,
> 
> On Mon, Aug 14, 2023 at 8:11 AM Mikko Rapeli <mikko.rapeli@linaro.org>
> wrote:
> 
> > Hi, would be nice to get this or similar change applied to master to get
> > docker
> > container network connections working again.
> >
> > FWIW, kirkstone branch suffers from same problem but docker and go
> > versions are different. Point release update could fix the issue there
> > too.
> >
> > Cheers,
> >
> > -Mikko
> >
> > On Wed, Aug 02, 2023 at 09:12:25AM -0400, Bruce Ashfield wrote:
> > > Thanks for the change, I'll double check my pending set of component
> > > updates against this.
> > >
> > > I have a full set of updates under test, but have been out of the
> > > office the last week, so they are a bit delayed in making it to
> > > master-next.
> > >
> > > Bruce
> > >
> > > On Wed, Aug 2, 2023 at 4:22 AM Mikko Rapeli <mikko.rapeli@linaro.org>
> > wrote:
> > > >
> > > > From: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > >
> > > > go 1.20.6 from poky is not compatible with docker 24.0.2 and network
> > > > stack inside container is failing with "invalid Host header" error,
> > > > see for example https://github.com/moby/moby/issues/45935
> > > >
> > > > 24.0.5 contains the fixes for go and also other bug fixes.
> > > > Suggested by Javier Tia <javier.tia@linaro.org>.
> > > >
> > > > Changes listed in
> > > > https://docs.docker.com/engine/release-notes/24.0/ are:
> > > >
> > > > 24.0.5
> > > >
> > > > 2023-07-24
> > > >
> > > > For a full list of pull requests and changes in this release, refer to
> > > > the relevant GitHub milestones:
> > > >
> > > >     docker/cli, 24.0.5 milestone
> > > >     moby/moby, 24.0.5 milestone
> > > >
> > > > Bug fixes and enhancements
> > > >
> > > >     The Go client now avoids using UNIX socket paths in the HTTP Host:
> > > > header, in order to be compatible with changes introduced in go1.20.6.
> > > > moby/moby#45962, moby/moby#45990
> > > >     containerd storage backend: Fix Variant not being included in
> > docker
> > > > image inspect and GET /images/{name}/json. moby/moby#46025
> > > >     containerd storage backend: Prevent potential garbage collection of
> > > > content during image export. moby/moby#46021
> > > >     containerd storage backend: Prevent duplicate digest entries in
> > > > RepoDigests. moby/moby#46014
> > > >     containerd storage backend: Fix operations taking place against the
> > > > incorrect tag when working with an image referenced by tag and digest.
> > > > moby/moby#46013
> > > >     containerd storage backend: Fix a panic caused by EXPOSE when
> > > > building containers with the legacy builder. moby/moby#45921
> > > >     Fix a regression causing unintuitive errors to be returned when
> > > > attempting to create an overlay network on a non-Swarm node.
> > > > moby/moby#45974
> > > >     Properly report errors parsing volume specifications from the
> > > > command line. docker/cli#4423
> > > >     Fix a panic caused when auths: null is found in the CLI config
> > file.
> > > > docker/cli#4450
> > > >
> > > > Packaging updates
> > > >
> > > >     Use init scripts as provided by in moby/moby contrib/init.
> > > > docker/docker-ce-packaging#914, docker/docker-ce-packaging#926
> > > >     Drop Upstart from contrib/init. moby/moby#46044
> > > >     Upgrade Go to go1.20.6. docker/cli#4428, moby/moby#45970,
> > > > docker/docker-ce-packaging#921
> > > >     Upgrade Compose to v2.20.2. docker/docker-ce-packaging#924
> > > >     Upgrade buildx to v0.11.2. docker/docker-ce-packaging#922
> > > >
> > > > 24.0.4
> > > >
> > > > 2023-07-07
> > > >
> > > > For a full list of pull requests and changes in this release, refer to
> > > > the relevant GitHub milestones:
> > > >
> > > >     docker/cli, 24.0.4 milestone
> > > >     moby/moby, 24.0.4 milestone
> > > >
> > > > Bug fixes and enhancements
> > > >
> > > >     Fix a regression introduced during 24.0.3 that causes a panic
> > during
> > > > live-restore of containers with bind mounts. moby/moby#45903
> > > >
> > > > 24.0.3
> > > >
> > > > 2023-07-06
> > > >
> > > > For a full list of pull requests and changes in this release, refer to
> > > > the relevant GitHub milestones:
> > > >
> > > >     docker/cli, 24.0.3 milestone
> > > >     moby/moby, 24.0.3 milestone
> > > >
> > > > Bug fixes and enhancements
> > > >
> > > >     containerd image store: Fix an issue where multi-platform images
> > > > that did not include a manifest for the default platform could not be
> > > > interacted with. moby/moby#45849
> > > >     containerd image store: Fix specious attempts to cache FROM scratch
> > > > in container builds. moby/moby#45822
> > > >     containerd image store: Fix docker cp with snapshotters that cannot
> > > > mount the same content multiple times. moby/moby#45780, moby/moby#45786
> > > >     containerd image store: Fix builds with type=image not being
> > > > correctly unpacked/stored. moby/moby#45692
> > > >     containerd image store: Fix incorrectly attempting to unpack
> > > > pseudo-images (including attestations) in docker load. moby/moby#45688
> > > >     containerd image store: Correctly set the user agent, and include
> > > > additional information like the snapshotter when interacting with
> > > > registries. moby/moby#45671, moby/moby#45684
> > > >     containerd image store: Fix a failure to unpack already-pulled
> > > > content after switching between snapshotters. moby/moby#45678
> > > >     containerd image store: Fix images that have been re-tagged or with
> > > > all tags removed being pruned while still in use. moby/moby#45857
> > > >     Fix a Swarm CSI issue where the Topology field was not propagated
> > > > into NodeCSIInfo. moby/moby#45810
> > > >     Fix failures to add new Swarm managers caused by a very large raft
> > > > log. moby/moby#45703, moby/swarmkit#3122, moby/swarmkit#3128
> > > >     name_to_handle_at(2) is now always allowed in the default seccomp
> > > > profile. moby/moby#45833
> > > >     Fix an issue that prevented encrypted Swarm overlay networks from
> > > > working on ports other than the default (4789). moby/moby#45637
> > > >     Fix a failure to restore mount reference-counts during
> > live-restore.
> > > > moby/moby#45824
> > > >     Fix various networking-related failures during live-restore.
> > > > moby/moby#45658, moby/moby#45659
> > > >     Fix running containers restoring with a zero (successful) exit
> > > > status when the daemon is unexpectedly terminated. moby/moby#45801
> > > >     Fix a potential panic while executing healthcheck probes.
> > > > moby/moby#45798
> > > >     Fix a panic caused by a race condition in container exec start.
> > > > moby/moby#45794
> > > >     Fix an exception caused by attaching a terminal to an exec with a
> > > > non-existent command. moby/moby#45643
> > > >     Fix host-gateway with BuildKit by passing the IP as a label (also
> > > > requires docker/buildx#1894). moby/moby#45790
> > > >     Fix an issue where POST /containers/{id}/stop would forcefully
> > > > terminate the container when the request was canceled, instead of
> > > > waiting until the specified timeout for a ‘graceful’ stop.
> > > > moby/moby#45774
> > > >     Fix an issue where docker cp -a from the root (/) directory would
> > > > fail. moby/moby#45748
> > > >     Improve compatibility with non-runc container runtimes by more
> > > > correctly setting resource constraint parameters in the OCI config.
> > > > moby/moby#45746
> > > >     Fix an issue caused by overlapping subuid/subgid ranges in certain
> > > > configurations (e.g. LDAP) in rootless mode. moby/moby#45747,
> > > > rootless-containers/rootlesskit#369
> > > >     Greatly reduce CPU and memory usage while populating the Debug
> > > > section of GET /info. moby/moby#45856
> > > >     Fix an issue where debug information was not correctly printed
> > > > during docker info when only the client is in debug mode.
> > > > docker/cli#4393
> > > >     Fix issues related to hung connections when connecting to hosts
> > over
> > > > a SSH connection. docker/cli#4395
> > > >
> > > > Packaging updates
> > > >
> > > >     Upgrade Go to go1.20.5. moby/moby#45745, docker/cli#4351,
> > > > docker/docker-ce-packaging#904
> > > >     Upgrade Compose to v2.19.1. docker/docker-ce-packaging#916
> > > >     Upgrade buildx to v0.11.1. docker/docker-ce-packaging#918
> > > >
> > > > Cc: Javier Tia <javier.tia@linaro.org>
> > > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > > ---
> > > >  recipes-containers/docker/docker-moby_git.bb | 6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/recipes-containers/docker/docker-moby_git.bb
> > b/recipes-containers/docker/docker-moby_git.bb
> > > > index 2fc11d0..de20aa6 100644
> > > > --- a/recipes-containers/docker/docker-moby_git.bb
> > > > +++ b/recipes-containers/docker/docker-moby_git.bb
> > > > @@ -44,9 +44,9 @@ DESCRIPTION = "Linux container runtime \
> > > >  # so we get that tag, and make it our SRCREVS:
> > > >  #
> > > >
> > > > -SRCREV_moby = "d7aa1e14e521af24c0aca800a837866f514f46f7"
> > > > +SRCREV_moby = "a61e2b4c9c5f7c241aeb37f389b4444aee26bea4"
> > > >  SRCREV_libnetwork = "3f0048413d95802b9c6c836eba06bfc54f9dbd03"
> > > > -SRCREV_cli = "0823df7daa197bba96f2f2a85b9cbe156df78d43"
> > > > +SRCREV_cli = "ced099660009713e0e845eeb754e6050dbaa45d0"
> > > >  SRCREV_FORMAT = "moby_libnetwork"
> > > >  SRC_URI = "\
> > > >         git://
> > github.com/moby/moby.git;branch=24.0;name=moby;protocol=https \
> > > > @@ -66,7 +66,7 @@ require docker.inc
> > > >  LICENSE = "Apache-2.0"
> > > >  LIC_FILES_CHKSUM =
> > "file://src/import/LICENSE;md5=4859e97a9c7780e77972d989f0823f28"
> > > >
> > > > -DOCKER_VERSION = "24.0.2"
> > > > +DOCKER_VERSION = "24.0.5"
> > > >  PV = "${DOCKER_VERSION}+git${SRCREV_moby}"
> > > >
> > > >  CVE_PRODUCT = "docker mobyproject:moby"
> > > > --
> > > > 2.34.1
> > > >
> > > >
> > > >
> > > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#8177):
> > https://lists.yoctoproject.org/g/meta-virtualization/message/8177
> > Mute This Topic: https://lists.yoctoproject.org/mt/100501205/3617156
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> > Martin.Jansa@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
> >

