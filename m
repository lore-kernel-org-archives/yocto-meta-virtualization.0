Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web08.2880.1604099708003260919
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 30 Oct 2020 16:15:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=cf/4ZfZa;
 spf=pass (domain: foundries.io, ip: 209.85.160.174, mailfrom: ricardo@foundries.io)
Received: by mail-qt1-f174.google.com with SMTP id p45so5371842qtb.5
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 30 Oct 2020 16:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OiPWRZtLJX+kBFSRK8KWce+hXofEnhVY/AJhb1kEEgI=;
        b=cf/4ZfZaDAqNHuBompNlfXFXnCwvOepXgz9CoRF58jzBa6dU2Iv3hYAcfnM0N+obRS
         sUhDaDYl/GTeZxRK4gmGoBJ/Uondfnuj5IoIf/z/yjJnXNiPZS++xLe2tgWMcfSBOOZR
         fgpwGaM9LMoVYid1qu0EXl01CpIgCDa1nmNFKiwDcz/alQuM/HsnIAux249Im7ydl7v2
         pXKeFd977N5Aip1RDojgbTk3Fh4SKXD6ceyxKLQ2n2RFpJyY9fCglxJcjnU0A0A4pYMc
         K+xmCjTORkUCBNfSY2rfQCRzOF5ifli5cdBCHQitO22BhojBXgRinOau+/hEh5SJA+gX
         rYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OiPWRZtLJX+kBFSRK8KWce+hXofEnhVY/AJhb1kEEgI=;
        b=VwpD1wObodjMaYh4/uom6rGuAj9BnvRm7mx4EKHh2GQdv4+XqdrlSL6k3csdmTMhwZ
         EpTvDakYuCcpmh244v/AuCvVpApezGDPF5osdsyzizlb0sNQWjDZ5mmOhtVf3d5AmR4b
         f1/OtdZgykqExtyhCosEMGywtfP08p3zB9AolmYIWZMYpUbYsYNALiuijr2c56gy4xvE
         TrSqhuCxUjbtCCFNW0BXK+wtbS3jHnqDLp6iaNAquF4+ng5Ggsu1LK1rUhcYVH6pS6ES
         b6XIiNA5vrWFCDMVIW/EHUhGV3hddqD5pAP/elECmVUh44N/sFuLz8GN9/6LQ0AgiqED
         heCg==
X-Gm-Message-State: AOAM530501Zdb5i0Xx2TyckiN1LzEVJaFQ7kgTcKZq5RTpqYcC5uv4E4
	W5ob3lOK5EB8bbhzWzbyR6ogF7HDFj3U
X-Google-Smtp-Source: ABdhPJywvnElMdLbHc90UPwWAy4XhKP928X506M5qrmKwc/bxaO1JibLaeOqMfGmPc1eXUDUv1furA==
X-Received: by 2002:ac8:529a:: with SMTP id s26mr4630663qtn.150.1604099706770;
        Fri, 30 Oct 2020 16:15:06 -0700 (PDT)
Return-Path: <ricardo@foundries.io>
Received: from localhost.localdomain ([2804:7f5:f480:bcdd:ddb5:2334:2f12:9430])
        by smtp.gmail.com with ESMTPSA id o8sm552776qtm.9.2020.10.30.16.15.05
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 16:15:06 -0700 (PDT)
From: "Ricardo Salveti" <ricardo@foundries.io>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH 1/2] python3-docker: upgrade 4.2.1 to 4.3.1
Date: Fri, 30 Oct 2020 20:14:43 -0300
Message-Id: <20201030231444.26695-1-ricardo@foundries.io>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Release notes for 4.3.1:
- Miscellaneous
  - Set default API version to auto
  - Fix conversion to bytes for float
  - Support OpenSSH identityfile option

Release notes for 4.3.0:
- Features
  - Add DeviceRequest type to expose host resources such as GPUs
  - Add support for DriverOpts in EndpointConfig
  - Disable compression by default when using container.get_archive method
- Miscellaneous
  - Update default API version to v1.39
  - Update test engine version to 19.03.12

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 .../{python3-docker_4.2.1.bb => python3-docker_4.3.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-devtools/python/{python3-docker_4.2.1.bb => python3-docker_4.3.1.bb} (76%)

diff --git a/recipes-devtools/python/python3-docker_4.2.1.bb b/recipes-devtools/python/python3-docker_4.3.1.bb
similarity index 76%
rename from recipes-devtools/python/python3-docker_4.2.1.bb
rename to recipes-devtools/python/python3-docker_4.3.1.bb
index 32b24eb..f873ca6 100644
--- a/recipes-devtools/python/python3-docker_4.2.1.bb
+++ b/recipes-devtools/python/python3-docker_4.3.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/docker/docker-py"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34f3846f940453127309b920eeb89660"
 
-SRC_URI[md5sum] = "65111a1e4a2ab83d2ba104cdb17f1326"
-SRC_URI[sha256sum] = "380a20d38fbfaa872e96ee4d0d23ad9beb0f9ed57ff1c30653cbeb0c9c0964f2"
+SRC_URI[md5sum] = "ce28bd52fe2e33a26394693f01199e6c"
+SRC_URI[sha256sum] = "bad94b8dd001a8a4af19ce4becc17f41b09f228173ffe6a4e0355389eef142f2"
 
 DEPENDS += "${PYTHON_PN}-pip-native"
 
-- 
2.28.0

