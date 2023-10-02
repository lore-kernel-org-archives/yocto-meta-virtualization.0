Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA94E748F3
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 16:15:05 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.86320.1696263302138669751
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Oct 2023 09:15:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EaKtoPhN;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-419787a43ebso26900101cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 02 Oct 2023 09:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696263301; x=1696868101; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+3RxH1Krx5V8xyIelo2wTvLSGp7zRJVRvtSugd1ZJVg=;
        b=EaKtoPhNP60ab4Swx7ONCVWv3tcrHDusC9Xwm7PLBMA/71WMzsj+YOu+XJd5XIZmW6
         zEDBawxWrE3whdre3flD4utiENFJMfUvtdyqb+sdJNhjcM0TdAHAWwZvVI+g9CEy1jzp
         WVHb1wzIoAm9arjEmlJS19s3Xb+xxCmuNizsnb9veGlJlfWpeifHRd6Atbi1ibjFrWX+
         7y53xU1ZhNN5dUY4eouCC9ayvP2lSjbQqFgDI4a8uhbcVY/lM1+4G49FmQvpi0xd+3nL
         cCsh0V24dPuXz6nwmdTXWMytcHIrYUYl/fC3jXciu3OAXSxW+b7vC9lDoObgmeupyXot
         CB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696263301; x=1696868101;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+3RxH1Krx5V8xyIelo2wTvLSGp7zRJVRvtSugd1ZJVg=;
        b=PB+s5hiuCIS8qLQ2W92lLzXoLw32ZuyAhfhbtZ0UErdyamVgDPzilffgN4PQx5mcGW
         Vlwv86nQwCFc0IqLOgnNzOt478bENKCHhPJ+AUjuWW7jA3s5S96fJAgKXZTN32oupExG
         8BKFXM6KsoN3P77YSmBb+45uIiVAr3rlyhJwwmLHBGR2e9e0anyckrpPtSreXqN1Zo2O
         4TyJXjAl3ID3z2OvYa1eJoxWA3zXnENPRIaydEQDUxDXXrUc/wbd9Il8sQCdeB8j3EpW
         84FN3xXHUkKerwuXgxdyveWAZrMg3zxvDCVzcRtnHSHx0IAYhkH2XdGbwPFamUqc27Pz
         zj4w==
X-Gm-Message-State: AOJu0Yw9KQl9oeAQOXKaU6c5tHzh6yaXdv+5oJkccjmhseaTaQpEEENc
	MNb9LDejTWCNXlOyAXp3rm8=
X-Google-Smtp-Source: AGHT+IEnMmIKnpy/6Pb4CnrqltRz8vnVa7xWgCUH697dOxb1thauXbstA+DWe7wE6x2Fi5LTy5tdnA==
X-Received: by 2002:ac8:7e95:0:b0:3f8:71aa:f11d with SMTP id w21-20020ac87e95000000b003f871aaf11dmr14759593qtj.37.1696263301083;
        Mon, 02 Oct 2023 09:15:01 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id b16-20020ac844d0000000b0040ff6194ef3sm8810663qto.70.2023.10.02.09.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 09:15:00 -0700 (PDT)
Date: Mon, 2 Oct 2023 16:14:59 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Ali Can Ozaslan <ali.oezaslan@linaro.org>
Cc: meta-virtualization@lists.yoctoproject.org, patches@linaro.org
Subject: Re: [meta-virtualization][mickledore][PATCH 1/2] moby: update to
 v24.0.2
Message-ID: <ZRrsg4FIg9lwejWq@gmail.com>
References: <20230925163116.1060-1-ali.oezaslan@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925163116.1060-1-ali.oezaslan@linaro.org>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 02 Oct 2023 16:15:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8331

The cherry picks have been completed to mickledore.

Bruce

In message: [meta-virtualization][mickledore][PATCH 1/2] moby: update to v24.0.2
on 25/09/2023 Ali Can Ozaslan wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Bumping moby to version v24.0.2-56-gd7aa1e14e5, which comprises the following commits:
> 
>     5652c59647 testing: temporarily pin docker-py tests to use "bullseye"
>     789a8755b8 run `getent` with a noop stdin
>     f7298b326e vendor: github.com/sirupsen/logrus v1.9.3
>     1c18ad6ca6 vendor: github.com/rootless-containers/rootlesskit v1.1.1
>     ae4a10df67 update RootlessKit to v1.1.1
>     24c882c3e0 update go to go1.20.5
>     b3133d7471 contrib/check-config: move xt_bpf check to overlay section
>     8c552012ae contrib/check-config: check for xt_bpf
>     61d547fd06 Dockerfile: Move dockercli to base-dev
>     e5fbc3f75a hack/cli.sh: Quiet origin cleanup
>     1a078977e1 Dockerfile/shell: Install buildx cli plugin
>     c4198e6053 Dockerfile: Use separate cli for shell and integration-cli
>     647ba03224 builder-next: Set moby exporter as default
>     961fe27408 c8d/handlers: Handle error in walkPresentChildren
>     087cf6f238 c8d/load: Don't unpack pseudo images
>     0b9d68f59d c8d/load: Use walkImageManifests
>     cbf0779bfc c8d/list: Use walkImageManifests
>     0139309fef c8d: Add walkImageManifests and ImageManifest wrapper
>     e1c7956764 Dockerfile: use COPY --link for source code as well
>     75afe3201b containerd: add c8d version and storage-driver to User-Agent
>     8018ee4689 dockerversion: DockerUserAgent(): allow custom versions to be passed
>     ed376a603f dockerversion: remove insertUpstreamUserAgent()
>     1d45ea52f4 dockerversion: simplify escapeStr()
>     a27b0381a6 dockerversion: add a basic unit-test
>     1fc19772e0 Make sure the image is unpacked for the current snapshotter
>     4217d9ea0a Dockerfile: use COPY --link to copy artifacts from build-stages
>     4c6b8e737f added alias validation
>     e370f224ae fixing consistent aliases for OCI spec imports
>     ac1a867282 vendor: github.com/mistifyio/go-zfs/v3 v3.0.1
>     2949fee1d3 containerd: set user-agent when pushing/pulling images
>     f9c68e5fbc libn: fix resolver restore w/ chatty 'iptables -C'
>     3452a76589 libnetwork: fix sandbox restore
>     fec801a103 libnetwork: log why osl sandbox restore failed
>     d9e39914a7 Fix npe in exec resize when exec errored
>     042f0799db libn/d/overlay: support encryption on any port
>     ec8ec9056c builder/remotecontext: deprecate CachableSource, NewCachableSource
>     7a4ea19803 libcontainerd: work around exec start bug in c8d
>     ae6e9333c0 vendor: github.com/moby/buildkit v0.11.7-0.20230525183624-798ad6b0ce9f
>     0d9acd24fe c8d/inspect: Fill `Created` time if available
>     04eccf8165 vendor: github.com/containerd/go-runc v1.1.0
>     d64bab35ee daemon: lock in snapshotter setting at daemon init
>     329d671aef Dockerfile: temporarily skip CRIU stage
>     4cc2081119 integration: Add TestImageInspectEmptyTagsAndDigests
>     27df42255c hack: Rename .ensure-emptyfs to .build-empty-images
>     9ee7d30aef hack/ensure-emptyfs: Create dangling image
>     8a4b7c5af8 Add testenv.UsingSnapshotter utility
>     a753ca64e2 hack/make/.binary: don't use "netgo" when building Windows binaries
>     5276c2b6e0 c8d/pull: Use same progress action as distribution
>     baf1fd1c3f libnetwork: check for netns leaks from prior tests
>     992dc33fc5 libnetwork/osl: restore the right thread's netns
>     ef1545ed4a libnetwork: leave global logger alone in tests
>     876f5eda51 libnetwork: make resolver tests less confusing
>     47a3dad256 c8d/list: Show layerless images
>     0869b089e4 libnetwork: just forward the external DNS response
>     3467ba6451 reorder load funcs to match newServiceConfig()'s order
>     f9b886c01b add mirror to daemon reload test for insecure registries
>     07140c0eca build: use daemon id as worker id for the graph driver controller
>     d5ad186d49 ci(bin-image): distribute build across runners
>     4d924c35f7 api/server: allow empty body for POST /commit again
>     68b7ba0d03 api/inspect: Fix nil RepoTags and RepoDigests
>     5ea7b8d091 fix: `docker pull` with platform checks wrong image tag
> 
> Bumping docker-cli to version v24.0.2-9-g0823df7da, which comprises the following commits:
> 
>     11af1189d docs: add "--detach-keys" example to docker run reference
>     f118c05e8 docs: move "--detach-keys" example to examples section
>     f66f7ed7f cli/command: fix GoDoc referencing wrong const
>     2814c01b0 Dockerfile.vendor: update GOPROXY to use default with fallback
>     32f66cbe5 vendor: github.com/docker/docker v24.0.2
>     dc4707edb [24.0] vendor: github.com/docker/docker v24.0.1
>     298e67926 docs: fix example for proxies in daemon.json
>     9175ffa9b man: remove devicemapper from examples
>     beb0330a7 Correct "ps --no-trunc" example output
>     405be9063 docs: remove AuFS from glossary
>     7a269817b docs: remove Docker Toolbox from glossary
>     41ef7c45c docs: remove boot2docker and docker-machine from glossary
>     c184a61da docs/deprecated: remove "disabled by default" for AuFS, overlay
>     e7a60449f docs: remove aufs and legacy overlay
>     77541afea contrib/completion: remove aufs, legacy overlay
>     e67a7acd0 docs/deprecated: remove .patch release from deprecation status
>     fb6ae356c vendor: github.com/docker/docker v24.0.0-rc.3
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  recipes-containers/docker/docker-moby_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
> index 70f3692..b417da4 100644
> --- a/recipes-containers/docker/docker-moby_git.bb
> +++ b/recipes-containers/docker/docker-moby_git.bb
> @@ -34,9 +34,9 @@ DESCRIPTION = "Linux container runtime \
>  #   - The common components of this recipe and docker-ce do need to be moved
>  #     to a docker.inc recipe
>  
> -SRCREV_moby = "821e4ec4c7b13c28dbb1424f024980aed4535384"
> +SRCREV_moby = "d7aa1e14e521af24c0aca800a837866f514f46f7"
>  SRCREV_libnetwork = "3f0048413d95802b9c6c836eba06bfc54f9dbd03"
> -SRCREV_cli = "98fdcd769bcd137f7538f898b37348f919536ea4"
> +SRCREV_cli = "0823df7daa197bba96f2f2a85b9cbe156df78d43"
>  SRCREV_FORMAT = "moby_libnetwork"
>  SRC_URI = "\
>  	git://github.com/moby/moby.git;branch=24.0;name=moby;protocol=https \
> @@ -56,7 +56,7 @@ require docker.inc
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=4859e97a9c7780e77972d989f0823f28"
>  
> -DOCKER_VERSION = "24.0.0"
> +DOCKER_VERSION = "24.0.2"
>  PV = "${DOCKER_VERSION}+git${SRCREV_moby}"
>  
>  CVE_PRODUCT = "docker mobyproject:moby"
> -- 
> 2.34.1
> 

