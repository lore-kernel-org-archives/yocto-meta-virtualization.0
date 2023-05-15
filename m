Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92686C7EE2E
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 15:27:53 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.91648.1684164467655164092
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 May 2023 08:27:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=BRNhLSCh;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-50bd37ca954so112799151a12.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 May 2023 08:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684164466; x=1686756466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRkQ0S82TPjNv9NePoG7lxgLxqv8r6LeVdYIlhVA+Ho=;
        b=BRNhLSChioevBMrB1yq8yfYlAksKs3oNY9iKpt7KWTaUxJq27K/B+u8WuXjmC/gKjz
         t3oAwYyGBrlIRL+TJeCuPFLI+guSZ/Os5QYCgFlm9eyZauGKH0p++GcmTfWCYthPZIp9
         jdD23C3ZLWYrkTOeY3+EjObeD+6T/g/rQ9pKD5FagWfa7IBXxHQV7bMRL8kZ/rmBvmnI
         M/y5yGPvNcFUfVZ82cgDSwDvSZOvfKEBm6/Y+j9HG/swD1n/Uz6J2PgPb+aV5BjArnlw
         GFnNm60sPOBnXOEolWvC1l4r/w5t6GB1pD7KWLpgQXli5/kDF5GpksgLz9Cs2/u7RelM
         qijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684164466; x=1686756466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qRkQ0S82TPjNv9NePoG7lxgLxqv8r6LeVdYIlhVA+Ho=;
        b=Vwsm3Q2OQSJXzmfvs+jARtJzcAeT0zYqJoqPKsCRvA/WqUu8GcFLyfGLLdjI6ETkIo
         QH/XX5e8h7VcG+f0XhnPdZvNHxdfxBdBiU76bQbMJDevDCDSAXy5skN6ijgFQNYTXScl
         tKakB47qxVMb5pEpL84Rh5IQjRDi+EFteMRZr/UpeTsHGaMJmwRQ0jMKDexYXdfEAbio
         BkG3TEjn+7hCN6tbvgCRt9GmQV3lLYSHAyj9Af/Y9Tk7jwKmKEtYzJklriQ4wqOYjxFb
         xjxVFhnHaTqUnpnlYUSKhfc+ebZpWcIL+R8IBEqLd+FS4h96fA5G6FkYXbamDKLS0gXi
         u6VA==
X-Gm-Message-State: AC+VfDz76ZJE3D89Qxh51fNvzcNQrxwylVQd3+yQf51WlA+icurPgH7i
	xDubYivdUvK8bgnsybL4UFhAWXDefsQ=
X-Google-Smtp-Source: ACHHUZ4zUbWa90+wF8MPG0wMuBHAClIGXZe4vzlBMUi2iSeQH7rPk1buD2mkMxLZ0CKIc6iJqDQ3DA==
X-Received: by 2002:a17:907:1c90:b0:96a:f4b8:37ec with SMTP id nb16-20020a1709071c9000b0096af4b837ecmr6615204ejc.8.1684164465513;
        Mon, 15 May 2023 08:27:45 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id ze12-20020a170906ef8c00b009659fa6eeddsm9690128ejb.196.2023.05.15.08.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 08:27:45 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-virtualization][PATCH 2/5] containerd: update to 1.7.1
Date: Mon, 15 May 2023 17:26:21 +0200
Message-Id: <20230515152624.138713-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515152624.138713-1-adrian.freihofer@siemens.com>
References: <20230515152624.138713-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 15 May 2023 15:27:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8053

Bumping containerd to version v1.7.1, which comprises the following commits:

    1677a1796 (HEAD -> release/1.7, tag: v1.7.1) Merge pull request #8501 from dmcgowan/prepare-v1.7.1
    89ab3ce79 Merge pull request #8499 from dmcgowan/backport-1.7-update-ttrpc-1.2.2
    7b288e2d7 Update ttrpc to v1.2.2
    27a0d957b Prepare release notes for v1.7.1
    c8e99bfde Merge pull request #8475 from Iceber/fix_checkpoint_options_1.7
    74ce87e3c Merge pull request #8495 from Iceber/bump_typeurl_1.7
    6ad8a4618 Merge pull request #8491 from dmcgowan/transfer-service-backports
    0e0532eb2 bump typeurl to v2.1.1
    35e86f96c [transfer] avoid setting limiters when max is 0
    f7233811f Update transfer configuration
    4510eac00 Fix image pulling with Transfer service
    e39c5c4b3 Merge pull request #8480 from kiashok/updateShim-1.7
    aaa65e8c1 Update hcsshim tag to v0.10.0-rc.8
    53d1934bf Merge pull request #8472 from brandond/fix-cri-stats
    95ef67e19 Fix umarshal metrics for CRI server
    3ef5b689a runtime/shim: fix the nil checkpoint options
    d26aaf5bf Merge pull request #8471 from thaJeztah/1.7_backport_update_go1.20.4
    021bba28b update go to go1.20.4, go1.19.9
    df648308b Merge pull request #8453 from Iceber/fix_runtime_path_1.7
    087bb3248 Merge pull request #8457 from kiashok/port_deleteCtr_1.7
    f67c1e5bd Merge pull request #8451 from thaJeztah/1.7_backport_runc_binary_1.1.7
    6b3ae0129 Remove entry for container from container store on error
    c0e128624 skip TestContainerStartWithAbsRuntimePath if the runtime is v1
    aa3c63c15 integration: add container start test using abs runtime path
    d2d9eedb1 WithRuntimePath uses the TaskInfo.RuntimePath field
    fae4b6223 update runc binary to v1.1.7
    91fd84224 Merge pull request #8444 from kinvolk/rata/userns-stateless-idmap-error
    571715a9d cri: Vendor v0.27.1
    9fe175967 Merge pull request #8404 from thaJeztah/1.7_backport_restore_readonly_comments
    348e00349 Merge pull request #8405 from kiashok/portArgsEscapedTest
    7dd7a0919 Merge pull request #8211 from kinvolk/rata/userns-stateless-idmap-error
    ab4bf318f Merge pull request #8396 from thaJeztah/1.7_backport_runtime_tools_remove_replace
    b03d57f21 Merge pull request #8386 from thaJeztah/1.7_backport_runc_binary_1.1.6
    a6d336c1f Fix argsEscaped tests
    1bbf98e53 oci: partially restore comment on read-only mounts for uid/gid uses
    8f6e86fec go.mod: add comment explaining go-fuzz-headers replace rule
    1ece0cb50 go.mod: remove replace for github.com/opencontainers/runtime-tools
    e9f962187 go.mod: integration: use non-pre-release of containerd
    84393b005 go.mod: integration: move indirect dependencies to the right group
    dec2595af update runc binary to v1.1.6
    7de8629be cri: Throw an error if idmap mounts is requested
    75ac7e0d8 cri: Vendor v0.27.0-beta.0 for mounts uid/gid mappings
    d9453224b Merge pull request #8358 from thaJeztah/1.7_backport_oci_readonly_mounts
    54d12b872 oci: Use WithReadonlyTempMount when adding users/groups
    63cb9b371 Merge pull request #8354 from thaJeztah/1.7_backport_bump_go1.20.3
    624327651 update go to go1.20.3, go1.19.8
    3a986b2ae Merge pull request #8344 from jedevc/v1.7-export-skip-docker-manifest
    1d6641b7c export: add test for WithSkipDockerManifest
    0e0d84f6b archive: consistently respect value of WithSkipDockerManifest
    110b38c9b Merge pull request #8336 from vinayakankugoyal/fixresolv-cp2
    9dc345600 Merge pull request #8335 from Iceber/fix_ctr_task_metrics_1.7
    9b4935d86 Update sbserver to add noexec nodev and nosuid to /etc/resolv.conf mount bind.
    5e953cfa6 Test to ensure nosuid,nodev,noexec are set on /etc/reolv.conf mount.
    0aad93f08 Add noexec nodev and nosuid to sandbox /etc/resolv.conf mount bind.
    1a64f1b43 ctr/tasks: fix unmarshal the task metrics for cgroups v1
    f47b7a9f0 Merge pull request #8331 from egernst/resolv-cherry
    17c52a26d Keep linux mounts for linux sandboxes on Windows/Darwin

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../containerd/containerd-opencontainers_git.bb             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
index 27406ef..907556b 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "containerd is a daemon to control runC, built for performance and
                support as well as checkpoint and restore for cloning and live migration of containers."
 
 
-SRCREV = "6ea9bc57f97cd6bdd62afe8c8295706de36afd51"
+SRCREV = "1677a17964311325ed1c31e2c0a3589ce6d5c30d"
 SRC_URI = "git://github.com/containerd/containerd;branch=release/1.7;protocol=https;destsuffix=git/src/github.com/containerd/containerd \
            file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch \
            file://0001-build-don-t-use-gcflags-to-define-trimpath.patch \
@@ -15,8 +15,8 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/1.7;protocol=ht
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1269f40c0d099c21a871163984590d89"
 
-CONTAINERD_VERSION = "v1.7.0"
-CVE_VERSION = "v1.7.0"
+CONTAINERD_VERSION = "v1.7.1"
+CVE_VERSION = "v1.7.1"
 
 # EXTRA_OEMAKE += "GODEBUG=1"
 
-- 
2.40.1


