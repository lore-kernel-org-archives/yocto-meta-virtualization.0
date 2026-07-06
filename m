Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78862C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:14:01 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155197.1783358031937577971
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jul 2026 10:13:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nLNeJaA6;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84783bce476so2199244b3a.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jul 2026 10:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358031; x=1783962831; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pkNICGFpSNF0SHsR0uYOEfMt/84XS29pjp2zyabJsNc=;
        b=nLNeJaA6bNAKAEv8P70iJwjxm1u0wol+m4U0OBc/8SjNax0zrd4qJp+KnBlyeNUzSF
         aI7JV+rx+HEdtP2gBnGcUZYmQuzKWUTFa4sLHX330idXH8ccnh4n5EWYau8xvzRadurE
         ilUib4Uzgd1qm4AwzU43stoGLFtryyWQEAgW9FexRnG90wnUzpCLVOacxAl5GJk3DIPu
         KeX8y90NTVQMu5FD1CzPbz89yZVP0nFW48pOQOrJbapMZuVf5Xx3pjQN16Cx/sbQtmEg
         LVekNdyMGG3RcbxF0kRX/qnvFC8nJ9vXjR4aHMnJknvYfQDvhTX9a1z1twmwcrD7Z+m3
         XEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358031; x=1783962831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pkNICGFpSNF0SHsR0uYOEfMt/84XS29pjp2zyabJsNc=;
        b=ro4Wez88Jkxz5u+4YvP/Yu8EnRv6R6QmKJ4GgUjsch/YuYtJxjfQ4KU8CBl1hJepnf
         E/w7NIT5+ygqKMl+n0KLybNN68Q0BfW1Wg5wlfj+zHaYT5ctoJBqZX44+WzzhiWVECwG
         3dlj1AR43dkX41sUvCQP8EeqnjVrQHx/kRHZzm0iIIkneDWJlf1SRD/V/PBztUHYUsdN
         DNq6mZQiZty6jnj2hJ1kYOo4yQVn2MvAi+klL6N//C6IJm9gtqgB0QXRilZLSCV9FC3V
         fxEMDyMye9wZmRUNSdwmp9ta1QfxUP7XYNAXfrEuRJbpjYIoF9P3K1vwKE1YVBLwCMn5
         uENA==
X-Gm-Message-State: AOJu0YxPatjT3UFTgyUTY1ccrv9q1iJxevoaV38n8JhB0WrcvSjFDYNk
	IwM336Ed5ikdgQv9FkCo6olq/Is7s/8uRXd3bDtW2R1M/yvAvcGasEaUkgb3bQ==
X-Gm-Gg: AfdE7cnk4Yx4VoVtbFLcPzsLxh4HIYfKTAjASJMkD1WW5JJmbFZDin3kK6Ab/f/ZhcV
	IcXNCqID6j7SaEu5tMxeBLnOcZjCb3Dwgmqywj7ciYPHTYxWFy6jnBZjPfCrxcw0lTI5cprifn1
	xDfTHiY6Pj65g5ZvbphO15kyCm2zJpzWyQLcHJcFoEiotdQPNVmMwD3fZwSCitU+7fPyd9P8Y4N
	d9JeQOtkE2r2jvlAOmlsclrTUB7qdY8Hx3vizhXTMXj/mltszmZLYF3PiH0m5+CQ5WINl0Dw0rc
	odnko7li8MTXsuJ9Q+MANxFBvK5qLCnUTa3BGOih9he4/A3bJrfdhLOZqhpDfjj3udKUPiNnZX8
	mE0iZ9XsMDfi82OXvTIdBVJmlVtogyvnovvRGJiV1cJylenjdvYLxC8wSJXHRHkO9e5KZ/zqKOY
	JOpSHZAnN8gf9sqQ27VTZ6pA75sWBKJqj4lPlMrmJU3d3hDfNnf8vT5jiV+Jx2qngSqyTGtSvM9
	Jf/m1YK1NKW
X-Received: by 2002:a05:6a00:4503:b0:82f:9d21:d352 with SMTP id d2e1a72fcca58-84826d122damr1432949b3a.9.1783358031273;
        Mon, 06 Jul 2026 10:13:51 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6bd1078sm4121873b3a.24.2026.07.06.10.13.49
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Jul 2026 10:13:49 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH v2 04/13] classes: add container-dev-mode.bbclass
Date: Mon,  6 Jul 2026 10:12:39 -0700
Message-ID: <fe0d8f75411e23b4fb9b515288592b8908a9ac02.1783356922.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783356922.git.tim.orling@konsulko.com>
References: <cover.1780104071.git.tim.orling@konsulko.com> <cover.1783356922.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jul 2026 17:14:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9928

Shared 'dev' mode support for containers-library app images.

Enable per recipe with:
   PACKAGECONFIG:pn-<recipe> = "dev"

 'dev' mode wants a shell; default 'production' intent does not, for
 security purposes. Recipes still choose for themselves where
 CONTAINER_SHELL actually gets consumed (e.g. an OCI_LAYERS 'shell' layer
 gated on PACKAGECONFIG 'dev') and whether 'dev' should also relax
 OCI_IMAGE_RUNTIME_UID to run as root.

Each recipe should set the following, we most likely do not want to set
at the class level.
PACKAGECONFIG ??= ""
PACKAGECONFIG[dev] = ""

Inspired by the -dev tagged Docker Hardened Images on dhi.io

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 classes/container-dev-mode.bbclass | 34 ++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 classes/container-dev-mode.bbclass

diff --git a/classes/container-dev-mode.bbclass b/classes/container-dev-mode.bbclass
new file mode 100644
index 00000000..cb96fa90
--- /dev/null
+++ b/classes/container-dev-mode.bbclass
@@ -0,0 +1,34 @@
+# Shared 'dev' mode support for containers-library app images.
+#
+# Enable per recipe with:
+#   PACKAGECONFIG:pn-<recipe> = "dev"
+#
+# 'dev' mode wants a shell; default 'production' intent does not, for
+# security purposes. Recipes still choose for themselves where
+# CONTAINER_SHELL actually gets consumed (e.g. an OCI_LAYERS 'shell' layer
+# gated on PACKAGECONFIG 'dev') and whether 'dev' should also relax
+# OCI_IMAGE_RUNTIME_UID to run as root.
+#
+# Each recipe should set the following, we most likely do not want to set
+# at the class level.
+# PACKAGECONFIG ??= ""
+# PACKAGECONFIG[dev] = ""
+
+# In 'dev' mode, override the nonroot UID inherited from container-nonroot-user
+# so the container runs as root.
+OCI_IMAGE_RUNTIME_UID = "${@bb.utils.contains('PACKAGECONFIG', 'dev', '0', '${NONROOT_UID}', d)}"
+
+# 'dev' always wins and gets a real shell (busybox), regardless of whether
+# production intent (below) was also configured, e.g. in local.conf.
+#
+# For production, if the following is configured in local.conf (or the
+# distro):
+#      PACKAGE_EXTRA_ARCHS:append = " container-dummy-provides"
+#
+# it has been explicitly indicated that we don't want or need a shell, so
+# we'll add the dummy provides instead of busybox.
+#
+# This is required, since there are postinstall scripts in base-files and
+# base-passwd that reference /bin/sh and we'll get a rootfs error if
+# there's no shell or no dummy provider.
+CONTAINER_SHELL ?= "${@bb.utils.contains('PACKAGECONFIG', 'dev', 'busybox', bb.utils.contains('PACKAGE_EXTRA_ARCHS', 'container-dummy-provides', 'container-dummy-provides', 'busybox', d), d)}"
-- 
2.54.0


