Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FAFECDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 21:26:33 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web10.180951.1697491592157357908
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 14:26:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EUMQRbqu;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-57b706f604aso3071115eaf.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Oct 2023 14:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697491591; x=1698096391; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I/OsJit10FzWcnplVncPwjPkWmyAdocsl/ZPkDtApgk=;
        b=EUMQRbqucumVpIuvYzEDZGiMND44esVfxeqYKIPsYe6Ni6pDQC9mzFmohZILAnnyto
         3nWTwKlUAkXNOSgyduX7/dBKNBnZXoRhdibMkXu6pBbQ9u4oDOGoZgNbF9fu0pxk3xcq
         9FhDhOP4r0dGCat6jJDMPcMftww97K5tASeDC+1MLkQ/lsVw8IxannJVeILGsjoOm41v
         6zuUuDR08x5yvLziccM0lUXK8rkWvSGIZg8nm3qO6Mn1MgoCUvhri7F3yxd69leVdpRG
         3pjnveo28Uw0vpPL1dU1SVO7gO9E2dMgAhVuc/UF4PguaO3yyT9ME897ohx3J8Y4Naat
         EaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697491591; x=1698096391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/OsJit10FzWcnplVncPwjPkWmyAdocsl/ZPkDtApgk=;
        b=krWMmYDmKsZ6gH9smCGo3cN/A/5ZjB2A51nV3PWWIeJDvJAl/IEsm2wtORXii+5Z9M
         YbgWn0yLsIIsbZxRIOk/JZ4CVrcWDjgZh3zdhOwwFvEcOvvPUjw8zfEcLiYH8ttx4YdP
         UCz10QGu9jbHlobKvjLip6VuKFwVMlGHam+ZmkActMEMCnZ8diPEvMAfQoSfZ2rJZLqq
         wAPIBi3Gj18XkXb3A6Bo37bhf6sy9Ix5LFHlKm/eCrQm/rtDLlrb1CWGm6yG/sVyR37M
         BtUyUzyWiltTF1Ws78TIgMDguZjxi9EjrpDRhDze33BJJQ3uQR9Z6XGNwAw7Dl2D+3bf
         FfrQ==
X-Gm-Message-State: AOJu0YyhXZwWnZLz3LaVs2vCAhz2CTCT3L+N/Nj2pKCHAv17MLqSYA5S
	thsrRs7VmmdzLwluca+xyjMXd4PKuEA=
X-Google-Smtp-Source: AGHT+IEtwFPM872shM8CyXqlMEL5/o9I/CrFy7XNFCwtyoAz/vwakEppt+GG2/Baa7a1M4r7fQ2Kgg==
X-Received: by 2002:a05:6820:162a:b0:573:4da2:4427 with SMTP id bb42-20020a056820162a00b005734da24427mr264709oob.7.1697491590856;
        Mon, 16 Oct 2023 14:26:30 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::589])
        by smtp.gmail.com with ESMTPSA id f7-20020a4aeb07000000b0057bcbc23738sm11334ooj.17.2023.10.16.14.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 14:26:29 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-virtualization][PATCH] classes/image-oci: Map x86_64 -> amd64
Date: Mon, 16 Oct 2023 15:26:26 -0600
Message-Id: <20231016212626.2146963-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Oct 2023 21:26:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8376

OCI requires that the architecture [1] be a valid GOARCH [2]. "x86_64"
is not a valid GOARCH so map it to the correct "amd64" value.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>

[1]: https://github.com/opencontainers/image-spec/blob/main/config.md#properties
[2]: https://go.dev/doc/install/source#environment

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 classes/image-oci.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/classes/image-oci.bbclass b/classes/image-oci.bbclass
index 9ddb88b..3370f86 100644
--- a/classes/image-oci.bbclass
+++ b/classes/image-oci.bbclass
@@ -52,7 +52,7 @@ OCI_IMAGE_AUTHOR_EMAIL ?= "${PATCH_GIT_USER_EMAIL}"
 OCI_IMAGE_TAG ?= "latest"
 OCI_IMAGE_RUNTIME_UID ?= ""
 
-OCI_IMAGE_ARCH ?= "${TARGET_ARCH}"
+OCI_IMAGE_ARCH ?= "${@oci_map_arch(d.getVar('TARGET_ARCH'))}"
 OCI_IMAGE_SUBARCH ?= "${@oci_map_subarch(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
 
 OCI_IMAGE_ENTRYPOINT ?= "sh"
@@ -74,6 +74,13 @@ OCI_IMAGE_ENV_VARS ?= ""
 # bundled into a tarball.
 OCI_IMAGE_TAR_OUTPUT ?= "true"
 
+# Map architectures to a valid container arch. Note that the container archs
+# should be a valid GOARCH
+def oci_map_arch(a):
+    if a == "x86_64":
+        return "amd64"
+    return a
+
 # Generate a subarch that is appropriate to OCI image
 # types. This is typically only ARM architectures at the
 # moment.
-- 
2.34.1


