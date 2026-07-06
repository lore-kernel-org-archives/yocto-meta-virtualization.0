Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A009EC44500
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:14:11 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156212.1783358044576985822
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jul 2026 10:14:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=I1tn/osl;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8453427d3f4so3014074b3a.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jul 2026 10:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358044; x=1783962844; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8FL8Uh4fgH5iS9aR2eEXkpyUw9fT5FdYAc8NQCeh518=;
        b=I1tn/oslK62BGePqUuTzkO8tq6rCDK8X2GQ+yjFyCVOQTI69xEoc9kdJOqOWwbZA67
         gzWNFvYcgYTPf0t9uGGOTR1zNcHfLjlO+d8D/F3gtrQs2uy4QZs3VDxwsGYd6FDzTMid
         /B+zoykhXeZ5diM2x1NsJeP7aWOE++fEFWA3oCIBxQmVFuCduEzmLuzxvGrsxbk3fxMs
         80Crr5FDGopyChokvmKUBiDklIyqJtCwrPhzaPQPx+HHSL1JSxJRZwKSE+87+Gfa+3ZH
         u674OCcXwcqSlZPehyl64e2H7/OGup90GvwgaIN/o1M8LymNiAizINiVVz8TXKpojB1e
         Rk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358044; x=1783962844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8FL8Uh4fgH5iS9aR2eEXkpyUw9fT5FdYAc8NQCeh518=;
        b=siJz81i02qpl9kOgY4a291amPf8Ghwyc5STQWrpYVX2yHF82tjYeiSoeCos0mwrvjX
         ldUR5TSid4EZ27HyxkZ/wkVmnBLtbYRP4n2iikk7yB7hqD3z26eosPHpxDCZ1tTXromp
         ++d8XfBzEUHJezEkw5/S7/aWt+f+HcT4zYvAuYMpVzcfWbK8EgzqsyUYZ9njBKlEyynB
         fux55Vl7/ha7ffBsaulYEymK4iYDqTZr9jxvsLb/BzME/Uzj21W1WtezDxu74Qq9xcEO
         PduoEOOkb2/E1giemMh0CcbOmK24RH9B+ffXOGslAYfvNqWkb7y7+vHVK2vqBIIiSH8i
         MoNQ==
X-Gm-Message-State: AOJu0YxSKUESSGvn/xGjhgJZyHRKGhAR8TqmZEYl4FVAcPPTymAVgzKU
	2bSWEZHJ96w0g6gZJfLLzQ6QogRXPoFm3BcrPyD6augXCLdSojVm+K1j2DQtHw==
X-Gm-Gg: AfdE7cm723SaOXqCdWyaNjP+7BE7+T2tZ74O/51NgOKhvt8JQkZDLbEqRbwuPlWgDez
	k1pwp4DET76Pd6Dfo/v+zWesjmHCVAyKIxD0EC1l+SwPWJQ9xj54HNgoyNj6r6Fah2Ar2DuozWz
	CiG6HdRGb7O78wy9WuQv1UJBPkJ2MnYbLn2pVQsA1+WowuQ2skoooIrZaM1Tm1X6ewnn7LSAfKA
	OzK757xNUIURZuRyCTpZZlseTizYunwb/NdfedWejpxdyaRhdg6zm+0almeeVQgkAoQlawtzx2a
	ECMcnbO5MiY3/r1kRYvgJhr3sREiT4/o05yBV4j2IjRjAWxHIA/qUc1BeVUEiXHygasbqPlyRdT
	Wa44OkhpTZBrflmlEHGYFW5XliWQjVNskd8JY6yeub4zhn7BRXbApfPQruYc5lPUwTWfghIeUiU
	bVe20HizOFubhv2bPgrb8/1QotL0prJlsuK1So3mg8dZ5vHdIB8LIiw/5F2RTPho6nFnRGde0h+
	b7CDqB2FSS6
X-Received: by 2002:aa7:9064:0:b0:842:2a81:4c63 with SMTP id d2e1a72fcca58-84826c34e80mr1459717b3a.25.1783358043760;
        Mon, 06 Jul 2026 10:14:03 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6bd1078sm4121873b3a.24.2026.07.06.10.14.01
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Jul 2026 10:14:02 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH v2 08/13] recipes-containers/images: add app-container-valkey
Date: Mon,  6 Jul 2026 10:12:43 -0700
Message-ID: <db9e87eaeb31711afb8f4dbe5b7631cada5848f0.1783356922.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783356922.git.tim.orling@konsulko.com>
References: <cover.1780104071.git.tim.orling@konsulko.com> <cover.1783356922.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jul 2026 17:14:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9932

From: Tim Orling <ticotimo@gmail.com>

Add OCI container image recipe for the Valkey in-memory key-value
datastore. The image uses multi-layer mode with separate base and
valkey layers, exposes the standard Valkey port (6379), and launches
valkey-server with its default config file as the entrypoint.

The stock valkey.conf shipped by meta-oe is tuned for a host install
(daemonize yes, syslog-enabled yes, bind 127.0.0.1). In most use cases
the user will want to provide their own valkey.conf. In that vein,
provide container-entrypoint.sh which will use /path/to/valkey.conf
passed in on the command line. If no .conf is passed in, we default
to the same behavior as upstream containers (no config).

Add container-entrypoint.sh script based on upstream [1]

Add OCI_IMAGE_WORKINGDIR = "/data" to avoid issues writing .rdb on save
since 'valkey' will default to '/' for the working dir.

Add NONROOT_OWNED_DIRS = "/data /var/lib/valkey /var/log/valkey /run/valkey"
as the 'nonroot' user needs permissions on these directories.

Inherit container-nonroot-user to run as 'nonroot' with UID 65532 by
default. Can optionally set PACKAGECONFIG:pn-app-container-valkey = "dev"
in local.conf or a distro/image config to run as 'root'.

Inherit container-volatile-fixup to fix 'log' and 'tmp' in
/var/volatile.

Inherit container-dev-mode to optionally run as UID '0' root user.
Since we use 'container-entrypoint.sh' which has #!/bin/sh we
provide a shell for both '-dev' and 'production' container flavors,
which matches upstream Docker Hardened Images behavior.

Relies on image-oci to auto-derive IMAGE_INSTALL from OCI_LAYERS
:packages: layers.

[1] https://github.com/valkey-io/valkey-container/blob/mainline/9.1/debian/docker-entrypoint.sh

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../images/app-container-valkey.bb            | 71 +++++++++++++++++++
 .../container-entrypoint.sh                   | 18 +++++
 2 files changed, 89 insertions(+)
 create mode 100644 recipes-containers/images/app-container-valkey.bb
 create mode 100644 recipes-containers/images/app-container-valkey/container-entrypoint.sh

diff --git a/recipes-containers/images/app-container-valkey.bb b/recipes-containers/images/app-container-valkey.bb
new file mode 100644
index 00000000..10c239e2
--- /dev/null
+++ b/recipes-containers/images/app-container-valkey.bb
@@ -0,0 +1,71 @@
+SUMMARY = "Valkey key-value store container image"
+DESCRIPTION = "OCI container running the Valkey in-memory key-value \
+datastore, a flexible distributed datastore that supports both caching \
+and beyond caching workloads."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+# Multi-layer mode: create explicit layers instead of single rootfs layer
+OCI_LAYER_MODE = "multi"
+
+# Optional 'dev' mode:
+#   - runs the container as root (UID 0)
+# Enable with: PACKAGECONFIG:pn-app-container-valkey = "dev"
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[dev] = ""
+inherit container-dev-mode
+
+# Unlike the other app-container-* recipes, valkey always ships a real shell,
+# in 'dev' and production alike. container-entrypoint.sh is a #!/bin/sh
+# script (upstream-compatible arg handling + umask hardening; see the file
+# for details) and requires an interpreter to boot at all — 'no shell in
+# production' isn't available here without dropping that script and its
+# behavior. Matches DHI's own 'hardened' valkey image (debian-13/9.1.yaml),
+# which ships bash for the exact same reason rather than go shell-less.
+CONTAINER_SHELL = "busybox"
+
+#  image.bbclass intentionally sets do_fetch, do_unpack and do_install to noexec.
+#  We do not want to abuse that isolation, so instead get the file from local
+#  tree and install in rootfs postprocess.
+ROOTFS_POSTPROCESS_COMMAND:append = " rootfs_install_entrypoint_sh ; "
+rootfs_install_entrypoint_sh () {
+    install -m 0755 ${THISDIR}/${BPN}/container-entrypoint.sh ${IMAGE_ROOTFS}/${bindir}/
+}
+
+# Define layers: each layer contains specific packages
+# Format: "name:type:content" where content uses + as delimiter for multiple items
+OCI_LAYERS = "\
+    base:packages:base-files+base-passwd+netbase \
+    shell:packages:${CONTAINER_SHELL} \
+    valkey:packages:valkey+tini \
+    entrypoint:files:${bindir}/container-entrypoint.sh \
+"
+
+# In 'dev' mode, override the nonroot UID inherited from container-nonroot-user
+OCI_IMAGE_RUNTIME_UID = "${@bb.utils.contains('PACKAGECONFIG', 'dev', '0', '${NONROOT_UID}', d)}"
+
+# The 'nonroot' user needs permissions on the following directories
+NONROOT_OWNED_DIRS = "/data /var/lib/valkey /var/log/valkey /run/valkey"
+
+IMAGE_FSTYPES = "container oci"
+inherit image
+inherit image-oci
+inherit container-nonroot-user
+inherit container-volatile-fixup
+
+IMAGE_FEATURES = ""
+IMAGE_LINGUAS = ""
+NO_RECOMMENDATIONS = "1"
+
+# Allow build with or without a specific kernel
+IMAGE_CONTAINER_NO_DUMMY = "1"
+
+# The stock valkey.conf shipped by meta-oe is tuned for a host install
+# (daemonize yes, syslog-enabled yes, bind 127.0.0.1). Most users will
+# want to create their own valkey.conf and pass it in to the
+# container-entrypoint.sh script
+OCI_IMAGE_ENTRYPOINT = "${bindir}/docker-init -- ${bindir}/container-entrypoint.sh"
+OCI_IMAGE_CMD = "${bindir}/valkey-server"
+OCI_IMAGE_PORTS = "6379/tcp"
+OCI_IMAGE_TAG = "latest"
+OCI_IMAGE_WORKINGDIR = "/data"
diff --git a/recipes-containers/images/app-container-valkey/container-entrypoint.sh b/recipes-containers/images/app-container-valkey/container-entrypoint.sh
new file mode 100644
index 00000000..36cdf93a
--- /dev/null
+++ b/recipes-containers/images/app-container-valkey/container-entrypoint.sh
@@ -0,0 +1,18 @@
+#!/bin/sh
+# Based on https://github.com/valkey-io/valkey-container/blob/mainline/docker-entrypoint.sh
+# SPDX-License-Identifier: BSD-3-Clause
+set -e
+
+# first arg is `-f` or `--some-option`
+# or first arg is `something.conf`
+if [ "${1#-}" != "$1" ] || [ "${1%.conf}" != "$1" ]; then
+    set -- valkey-server "$@"
+fi
+
+# set an appropriate umask (if one isn't set already)
+um="$(umask)"
+if [ "$um" = '0022' ]; then
+    umask 0077
+fi
+
+exec "$@"
-- 
2.54.0


