Return-Path: <paolo.barbolini@m4ss.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57676C021A9
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 17:11:31 +0000 (UTC)
Received: from mout-b-105.mailbox.org (mout-b-105.mailbox.org [195.10.208.50])
 by mx.groups.io with SMTP id smtpd.web10.57581.1739812283970602562
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 09:11:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@m4ss.net header.s=MBO0001 header.b=a/ffsNcL;
 spf=pass (domain: m4ss.net, ip: 195.10.208.50, mailfrom: paolo.barbolini@m4ss.net)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-105.mailbox.org (Postfix) with ESMTPS id 4YxThR0jnvz9wTN;
	Mon, 17 Feb 2025 18:11:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=m4ss.net; s=MBO0001;
	t=1739812279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u3ZrvgNUc7yfnUK9//A1/j8LI9qh/WjyY8G7H59bSb8=;
	b=a/ffsNcL1ApIxWiklXhZtHxCZV0CQPipN+gjRO7FXi++B9D9wtM/1MopuPdK3TPPMvrspv
	D+K8U2/bJRCVc0vaHtOxsYfRkOLvmbZzeklI5pGqngI4bZRTvTwK7mb+nUfZKnPdsqCs7l
	caXxbjFEKt87PR+2rzZhDi57QyXlAYFHHn3qXvYcG3HOcKhubQ4YwjvEF/1oTSc6j/Ew+T
	ipWvFOvu0HCOk53goGYf85/9MxMz4/UhY8dc8PMAny28MAO9/j3ee9ujGNFVsbkgn85avq
	56u9YDMM2UsYwMcrdRYiNcqXWokiz5+Bly42dqlQXnLRfuwJtCnRzNHt+vxeQA==
From: Paolo Barbolini <paolo.barbolini@m4ss.net>
To: meta-virtualization@lists.yoctoproject.org
Cc: Paolo Barbolini <paolo.barbolini@m4ss.net>
Subject: [PATCH] runc-opencontainers: update to v1.2.5
Date: Mon, 17 Feb 2025 18:10:42 +0100
Message-ID: <20250217171042.163624-1-paolo.barbolini@m4ss.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Feb 2025 17:11:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9143

Bumping runc to version v1.2.5-59923ef18, which comprises the following c=
ommits:

    59923ef1 VERSION: release v1.2.5
    165b1035 release: explicitly set --keyserver in release signing scrip=
ts
    615240a8 build(deps): bump golang.org/x/net from 0.24.0 to 0.33.0
    04468c03 libc/int/userns: add build tag to C file
    9742b6cf libct/cg/sd: set the DeviceAllow property before DevicePolic=
y
    00f4a5cc deps: update to github.com/cyphar/filepath-securejoin@v0.4.1
    bb445c19 CI: fix criu-dev compile
    48ea7278 VERSION: back to development
    6c52b3fc VERSION: release v1.2.4
    33ed43bd [1.2] Re-add tun/tap to default device rules
    e9c9dad4 keyring: update @kolyshkin key expiry
    b01ffa03 VERSION: back to development
    0d37cfd4 VERSION: release v1.2.3
    7242ffa4 [1.2] cgroup: ebpf: make unexpected errors in haveBpfProgRep=
lace louder
    e26e0fde [1.2] cgroups: ebpf: also check for ebpf.ErrNotSupported
    e6234149 [1.2] cgroups: ebpf: use link.Anchor to check for BPF_F_REPL=
ACE support
    6b904f3e [1.2] deps: update to github.com/cyphar/filepath-securejoin@=
v0.3.5
    21cabde6 [1.2] deps: update to golang.org/x/sys@v0.28.0
    510a5a09 VERSION: back to development
    7cb36325 VERSION: release v1.2.2
    eb676de1 memfd-bind: elaborate kernel requirements for overlayfs prot=
ection
    82f3af85 readme: drop unused memfd-bind reference
    2421b592 memfd-bind: mention that overlayfs obviates the need for it
    b1f733b8 dmz: overlay: set xino=3Doff to disable dmesg spam
    832faf08 libct/cg: add test for remove a non-existent dir in a ro mou=
nt point
    e41cc272 libct/cg: RemovePath: improve comments
    79cdf119 libct/cg: RemovePath: simplify logic
    e01db002 runc delete: fix for rootless cgroup + ro cgroupfs
    213e1216 Vagrantfile.fedora: stop using dnf shell
    2d6fe54e Vagrantfile.fedora: bump Fedora to 41
    6575ab1d docs: remove prompt symbols from shell snippets
    5fc35586 VERSION: back to development
    d7735e38 VERSION: release v1.2.1
    258cd8b6 libct: rm obsoleted comment
    b798594c libct: fix a comment
    47dfa202 script/check-config.sh: add OVERLAY_FS check
    e0d39536 runc update: fix updating swap for cgroup v2
    914a8f35 libct/cg: improve ConvertMemorySwapToCgroupV2Value
    bb71ad50 CHANGELOG: add (forward-port) v1.1.15 changes
    f07d92db drop runc-dmz solution according to overlay solution
    f479676c libct: rm x/sys/execabs usage
    74a5c786 test join other container userns with selinux enabled
    1eb9ad3e libct/nsenter: become root after joining userns
    0ff6451c [1.2] VERSION: back to development

Signed-off-by: Paolo Barbolini <paolo.barbolini@m4ss.net>
---
 recipes-containers/runc/runc-opencontainers_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes=
-containers/runc/runc-opencontainers_git.bb
index 86da5fb4..a133b097 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -1,11 +1,11 @@
 include runc.inc
=20
-SRCREV =3D "610aa88ab201f289c05c2e262912d0630f46eb35"
+SRCREV =3D "59923ef18c98053ddb1acf23ecba10344056c28e"
 SRC_URI =3D " \
-    git://github.com/opencontainers/runc;branch=3Dmain;protocol=3Dhttps;=
destsuffix=3D${GO_SRCURI_DESTSUFFIX} \
+    git://github.com/opencontainers/runc;branch=3Drelease-1.2;protocol=3D=
https;destsuffix=3D${GO_SRCURI_DESTSUFFIX} \
     file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.pat=
ch \
     "
-RUNC_VERSION =3D "1.2.0"
+RUNC_VERSION =3D "1.2.5"
=20
 # for compatibility with existing RDEPENDS that have existed since
 # runc-docker and runc-opencontainers were separate
--=20
2.48.1


