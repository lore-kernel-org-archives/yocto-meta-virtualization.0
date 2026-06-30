Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 367FAC43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 19:07:07 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29044.1782846423700618436
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 30 Jun 2026 12:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hESbziz3;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-842358aaf36so2124769b3a.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Jun 2026 12:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782846423; x=1783451223; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UFz7KxL9ifuKr+iFdSc1rwvwf5hokSdmEbp+4T7CUck=;
        b=hESbziz3gsgfEWiEQxCu6qWG9yFf1yz/80siySoQlMaPPAkAlsxfCfigd4ghFFeamu
         GhGC8/KRF4tZM6dNZGuJqAji/3d5jBn1Ofr41GGj53Hjlm+gKwQleSo4eDbh+XxpJX34
         AxTGUXUVVRKKJ/Gq/LIOwNb+grfwwsINRQc6A4FGz79Xqath6Jrv/olw5wTkXiDBHknj
         bYhRiX3wwMB4WQtbGE/HWHspyhj1baUUUApNw6IWcm7Jq9/L4fKTexXkO1pXMzmDN28c
         PQUvtCa7EBq8jv662jZlNi88kr7g/TbkBVJC0JG+5lRavrJ4W5LKaaFGasqgySimbd4l
         midw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782846423; x=1783451223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFz7KxL9ifuKr+iFdSc1rwvwf5hokSdmEbp+4T7CUck=;
        b=sw+EyEedeEjdahjHOpngIbmVMuGpNfmbdS0raUnWqlHnof+MTs/AL5/vkiWFVLs1FJ
         bQvBZCEob9RAMkZUYTVzmyzIe/watR7emXv0TKFb3+sJsWtGyKIWl4xKy2gADT7WNXjs
         Bpkbyojc0j0RNvqibXbAeFJHlLesVwO/w2reJMnCxdxPvWSdgJawMA0+EG1fycSnCH90
         xBQXIQxerimBqnLj59Ff5VcvYcHkw03pZ+1AX0BpmpfXSy5SKDJOecdCbN8FheWHWg2E
         IFigGi60mK6Y8Jzu/snhRdiqTixtcGzjvNggEJu/HJz7ZxHOUUPwnDjxRdwgTx5msjXj
         XLww==
X-Gm-Message-State: AOJu0YyxoVzcLls4n5xW88sdE14hpsDZplLSzDxgB3Ana439OBLnf98v
	NU8ZfmFVv/Icao/eKEKdG21NL1Fwp5z2AoSW8eb49r+3YwbnxCqRinbi+EpDCg==
X-Gm-Gg: AfdE7cnz5mxxOtAJXCr22rCmlGnIP/oRd1l2Mmtf7rpR2B9bWqvVnu0Ql0JqvQ8Lmrz
	CDE0O6mKYd8AwzHdLTtrTibTPhSKFmNxixo9zPeYY4gUss+47s+qD4VUl4jzx00ZxAORfGmmwx8
	/WeE8iXIRNE+59su46rfpwtvhkIEvgn0+DkWjQ+yyDyTbXjsBrQrxlsdifhPH5Sc1vyFdQ7MYzx
	Jivx+O1ir9ee7e4rqSzSVAQaGwYeWnHVWQ/UC5BSUf4YhOfQFGP0DgB0wG6Otv++r/eeq4hTD7G
	DIYcKCyITfbzZu42rRsIRitWKLdVEXxNOpgNBGkcriNdvwa9hw8WZX842pM9ewM51pSJPn9ziVz
	OM3FTjYC4+72tFJzbFuYqmG6jQs+3hmZEw+qj/wiUxPILDn330djpKiqiPf72AkNyIl0Itfq1nN
	4IuOfZZRD5PufPm46LQ9uoIcVnl0uMwrnC2qY51Tr+v8SWOpd47Vz/AkmU
X-Received: by 2002:a05:6a00:b47:b0:845:e000:e4bc with SMTP id d2e1a72fcca58-847addcf9abmr1682640b3a.27.1782846423014;
        Tue, 30 Jun 2026 12:07:03 -0700 (PDT)
Received: from localhost.localdomain ([69.9.132.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a0329c08sm2630918b3a.42.2026.06.30.12.07.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 30 Jun 2026 12:07:02 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-virtualization][PATCH] alpine-oci-base: upgrade to 3.24.1
Date: Tue, 30 Jun 2026 12:06:44 -0700
Message-ID: <20260630190643.75464-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Jun 2026 19:07:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9908

Upstream release notes:
https://alpinelinux.org/posts/Alpine-3.24.1-released.html

CVE: CVE-2026-34180
CVE: CVE-2026-34181
CVE: CVE-2026-34182
CVE: CVE-2026-34183
CVE: CVE-2026-42764
CVE: CVE-2026-42766
CVE: CVE-2026-42767
CVE: CVE-2026-42768
CVE: CVE-2026-42769
CVE: CVE-2026-42770
CVE: CVE-2026-45445
CVE: CVE-2026-45446
CVE: CVE-2026-45447
CVE: CVE-2026-7383
CVE: CVE-2026-9076

The full git commit log:
https://git.alpinelinux.org/aports/log/?h=v3.24.1

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{alpine-oci-base_3.23.bb => alpine-oci-base_3.24.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename recipes-containers/oci-base-images/{alpine-oci-base_3.23.bb => alpine-oci-base_3.24.bb} (83%)

diff --git a/recipes-containers/oci-base-images/alpine-oci-base_3.23.bb b/recipes-containers/oci-base-images/alpine-oci-base_3.24.bb
similarity index 83%
rename from recipes-containers/oci-base-images/alpine-oci-base_3.23.bb
rename to recipes-containers/oci-base-images/alpine-oci-base_3.24.bb
index 7bf067d3..88e14789 100644
--- a/recipes-containers/oci-base-images/alpine-oci-base_3.23.bb
+++ b/recipes-containers/oci-base-images/alpine-oci-base_3.24.bb
@@ -21,11 +21,11 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 inherit container-bundle
 
 # Remote container from Docker Hub
-CONTAINER_BUNDLES = "docker.io/library/alpine:3.23"
+CONTAINER_BUNDLES = "docker.io/library/alpine:3.24"
 
 # REQUIRED: Pinned digest for reproducible builds
-# Get with: skopeo inspect docker://docker.io/library/alpine:3.23 | jq -r '.Digest'
-CONTAINER_DIGESTS[docker.io_library_alpine_3.23] = "sha256:5b10f432ef3da1b8d4c7eb6c487f2f5a8f096bc91145e68878dd4a5019afde11"
+# Get with: skopeo inspect docker://docker.io/library/alpine:3.24 | jq -r '.Digest'
+CONTAINER_DIGESTS[docker.io_library_alpine_3.24] = "sha256:28bd5fe8b56d1bd048e5babf5b10710ebe0bae67db86916198a6eec434943f8b"
 
 # Enable deployment to DEPLOY_DIR_IMAGE for use as OCI base layer
 CONTAINER_BUNDLE_DEPLOY = "1"
-- 
2.54.0


