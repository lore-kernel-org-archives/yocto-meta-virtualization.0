Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79287C00528
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 08:22:27 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.9762.1690964538226965082
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Aug 2023 01:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qR77W-002I7a-0b;
	Wed, 02 Aug 2023 11:22:14 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qR77V-0062LF-Tu; Wed, 02 Aug 2023 11:22:13 +0300
From: mikko.rapeli@linaro.org
To: meta-virtualization@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Javier Tia <javier.tia@linaro.org>
Subject: [meta-virtualization][PATCH] docker: update from 24.0.2 to 24.0.5
Date: Wed,  2 Aug 2023 11:22:10 +0300
Message-Id: <20230802082210.1438735-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.9 (-)
X-Rspam-Report: Action: no action
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: RCPT_COUNT_THREE(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_SPF_ALLOW(-0.20)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: FROM_NO_DN(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20230802082210.1438735-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Aug 2023 08:22:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8164

From: Mikko Rapeli <mikko.rapeli@linaro.org>

go 1.20.6 from poky is not compatible with docker 24.0.2 and network
stack inside container is failing with "invalid Host header" error,
see for example https://github.com/moby/moby/issues/45935

24.0.5 contains the fixes for go and also other bug fixes.
Suggested by Javier Tia <javier.tia@linaro.org>.

Changes listed in
https://docs.docker.com/engine/release-notes/24.0/ are:

24.0.5

2023-07-24

For a full list of pull requests and changes in this release, refer to
the relevant GitHub milestones:

    docker/cli, 24.0.5 milestone
    moby/moby, 24.0.5 milestone

Bug fixes and enhancements

    The Go client now avoids using UNIX socket paths in the HTTP Host:
header, in order to be compatible with changes introduced in go1.20.6.
moby/moby#45962, moby/moby#45990
    containerd storage backend: Fix Variant not being included in docker
image inspect and GET /images/{name}/json. moby/moby#46025
    containerd storage backend: Prevent potential garbage collection of
content during image export. moby/moby#46021
    containerd storage backend: Prevent duplicate digest entries in
RepoDigests. moby/moby#46014
    containerd storage backend: Fix operations taking place against the
incorrect tag when working with an image referenced by tag and digest.
moby/moby#46013
    containerd storage backend: Fix a panic caused by EXPOSE when
building containers with the legacy builder. moby/moby#45921
    Fix a regression causing unintuitive errors to be returned when
attempting to create an overlay network on a non-Swarm node.
moby/moby#45974
    Properly report errors parsing volume specifications from the
command line. docker/cli#4423
    Fix a panic caused when auths: null is found in the CLI config file.
docker/cli#4450

Packaging updates

    Use init scripts as provided by in moby/moby contrib/init.
docker/docker-ce-packaging#914, docker/docker-ce-packaging#926
    Drop Upstart from contrib/init. moby/moby#46044
    Upgrade Go to go1.20.6. docker/cli#4428, moby/moby#45970,
docker/docker-ce-packaging#921
    Upgrade Compose to v2.20.2. docker/docker-ce-packaging#924
    Upgrade buildx to v0.11.2. docker/docker-ce-packaging#922

24.0.4

2023-07-07

For a full list of pull requests and changes in this release, refer to
the relevant GitHub milestones:

    docker/cli, 24.0.4 milestone
    moby/moby, 24.0.4 milestone

Bug fixes and enhancements

    Fix a regression introduced during 24.0.3 that causes a panic during
live-restore of containers with bind mounts. moby/moby#45903

24.0.3

2023-07-06

For a full list of pull requests and changes in this release, refer to
the relevant GitHub milestones:

    docker/cli, 24.0.3 milestone
    moby/moby, 24.0.3 milestone

Bug fixes and enhancements

    containerd image store: Fix an issue where multi-platform images
that did not include a manifest for the default platform could not be
interacted with. moby/moby#45849
    containerd image store: Fix specious attempts to cache FROM scratch
in container builds. moby/moby#45822
    containerd image store: Fix docker cp with snapshotters that cannot
mount the same content multiple times. moby/moby#45780, moby/moby#45786
    containerd image store: Fix builds with type=image not being
correctly unpacked/stored. moby/moby#45692
    containerd image store: Fix incorrectly attempting to unpack
pseudo-images (including attestations) in docker load. moby/moby#45688
    containerd image store: Correctly set the user agent, and include
additional information like the snapshotter when interacting with
registries. moby/moby#45671, moby/moby#45684
    containerd image store: Fix a failure to unpack already-pulled
content after switching between snapshotters. moby/moby#45678
    containerd image store: Fix images that have been re-tagged or with
all tags removed being pruned while still in use. moby/moby#45857
    Fix a Swarm CSI issue where the Topology field was not propagated
into NodeCSIInfo. moby/moby#45810
    Fix failures to add new Swarm managers caused by a very large raft
log. moby/moby#45703, moby/swarmkit#3122, moby/swarmkit#3128
    name_to_handle_at(2) is now always allowed in the default seccomp
profile. moby/moby#45833
    Fix an issue that prevented encrypted Swarm overlay networks from
working on ports other than the default (4789). moby/moby#45637
    Fix a failure to restore mount reference-counts during live-restore.
moby/moby#45824
    Fix various networking-related failures during live-restore.
moby/moby#45658, moby/moby#45659
    Fix running containers restoring with a zero (successful) exit
status when the daemon is unexpectedly terminated. moby/moby#45801
    Fix a potential panic while executing healthcheck probes.
moby/moby#45798
    Fix a panic caused by a race condition in container exec start.
moby/moby#45794
    Fix an exception caused by attaching a terminal to an exec with a
non-existent command. moby/moby#45643
    Fix host-gateway with BuildKit by passing the IP as a label (also
requires docker/buildx#1894). moby/moby#45790
    Fix an issue where POST /containers/{id}/stop would forcefully
terminate the container when the request was canceled, instead of
waiting until the specified timeout for a ‘graceful’ stop.
moby/moby#45774
    Fix an issue where docker cp -a from the root (/) directory would
fail. moby/moby#45748
    Improve compatibility with non-runc container runtimes by more
correctly setting resource constraint parameters in the OCI config.
moby/moby#45746
    Fix an issue caused by overlapping subuid/subgid ranges in certain
configurations (e.g. LDAP) in rootless mode. moby/moby#45747,
rootless-containers/rootlesskit#369
    Greatly reduce CPU and memory usage while populating the Debug
section of GET /info. moby/moby#45856
    Fix an issue where debug information was not correctly printed
during docker info when only the client is in debug mode.
docker/cli#4393
    Fix issues related to hung connections when connecting to hosts over
a SSH connection. docker/cli#4395

Packaging updates

    Upgrade Go to go1.20.5. moby/moby#45745, docker/cli#4351,
docker/docker-ce-packaging#904
    Upgrade Compose to v2.19.1. docker/docker-ce-packaging#916
    Upgrade buildx to v0.11.1. docker/docker-ce-packaging#918

Cc: Javier Tia <javier.tia@linaro.org>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 recipes-containers/docker/docker-moby_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index 2fc11d0..de20aa6 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -44,9 +44,9 @@ DESCRIPTION = "Linux container runtime \
 # so we get that tag, and make it our SRCREVS:
 #
 
-SRCREV_moby = "d7aa1e14e521af24c0aca800a837866f514f46f7"
+SRCREV_moby = "a61e2b4c9c5f7c241aeb37f389b4444aee26bea4"
 SRCREV_libnetwork = "3f0048413d95802b9c6c836eba06bfc54f9dbd03"
-SRCREV_cli = "0823df7daa197bba96f2f2a85b9cbe156df78d43"
+SRCREV_cli = "ced099660009713e0e845eeb754e6050dbaa45d0"
 SRCREV_FORMAT = "moby_libnetwork"
 SRC_URI = "\
 	git://github.com/moby/moby.git;branch=24.0;name=moby;protocol=https \
@@ -66,7 +66,7 @@ require docker.inc
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=4859e97a9c7780e77972d989f0823f28"
 
-DOCKER_VERSION = "24.0.2"
+DOCKER_VERSION = "24.0.5"
 PV = "${DOCKER_VERSION}+git${SRCREV_moby}"
 
 CVE_PRODUCT = "docker mobyproject:moby"
-- 
2.34.1


