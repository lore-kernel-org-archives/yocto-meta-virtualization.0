Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web08.13721.1619624667518547706
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 28 Apr 2021 08:44:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=XtS4txaC;
 spf=pass (domain: linaro.org, ip: 209.85.219.51, mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qv1-f51.google.com with SMTP id dm16so6138844qvb.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 28 Apr 2021 08:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=7AH9CdQEgrEFlIrf5HiqLa0+BUWcLBBPFiEgqTQdahk=;
        b=XtS4txaCxeCDEzjvtYDWH6TUkv/DuZXdg5E93HaGezrL01AtJ3Qmv2OQ9J5OfW0gUz
         +WJhfwONfBW/dy4N0ZSVzCMENyW+TzvfRKPfEdynlty3zZ1gtJ/6F0lWQ56pFs45bpCf
         UBdUXmLcAD2O/CEaN/FUlaRUlvJxu467xmMbYwp3zCg+CGz4FBZq6GdnprOOZR/2uptr
         a7YgUCHl5ME619T0cAUp0jz3/+yv+wZxxqaqOAT3FqTTbPu3Jt5Xa5o1exEL6NyzUnF7
         y79xeW8X9h4l9NIwAdOO4lhZ+iE4Zn26SHf58Y5JlwIkzvgpn2JnqPO1eGJtfUHNnMLR
         NzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=7AH9CdQEgrEFlIrf5HiqLa0+BUWcLBBPFiEgqTQdahk=;
        b=sMUXxjM/OBkUgzO6nI6htUpzOcJAYTKPvsVD/VrZ2NMO99CAvZemaWF/54EiVrzYVa
         NXDMKt0oc+ymu/Ua3JFslNSo1+UVyEceKgoezKss+yrlslRdhAxodeWUzV7OZIGG/jOp
         lCYsvgm49CAWAO91wQ2K5FVjiW4NyszK8rCLp8IHA8AztXZIQGT2L989PtzhNAabkZyn
         yCmOMZzBgg43RJcB51b494OqGLYdUhVpd64MuW14BbZZ+8m3LyrU3HfyJWzmsBPU1mO3
         D/D/oDb1+L3lDX5aSmR4pkoQN4HK8IFAjiMdB64GCYw1plbdjQHjUsm8a7wKSbNRAPQc
         qfUw==
X-Gm-Message-State: AOAM531ZGFgwywkFB4ouqMLKk4qtvJyiiqQwmga6o0NdxajVAuUzjt4X
	XgDVI4p0N0DvjWTbmi5gq4evh9cPRyNsaaHV
X-Google-Smtp-Source: ABdhPJyxiG/kOTtAi54T/EK7wJRq5ztJHzBzRxrggidNjdUfr8/xRCMYpiyQdzVom7fseKv8rW5rEQ==
X-Received: by 2002:a05:6214:224b:: with SMTP id c11mr30317038qvc.44.1619624666661;
        Wed, 28 Apr 2021 08:44:26 -0700 (PDT)
Return-Path: <ralph.siemsen@linaro.org>
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id n11sm68228qkn.33.2021.04.28.08.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 08:44:26 -0700 (PDT)
From: "Ralph Siemsen" <ralph.siemsen@linaro.org>
To: meta-virtualization@lists.yoctoproject.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [PATCH 1/3] docker: add CVE_PRODUCT to recipes
Date: Wed, 28 Apr 2021 11:44:09 -0400
Message-Id: <20210428154411.12994-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.17.1

Allows the yocto cve-checker to flag CVEs, which would otherwise go
unreported due to the package name not matching NIST NVD data.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 .../docker-distribution/docker-distribution_git.bb              | 2 ++
 recipes-containers/docker/docker-ce_git.bb                      | 2 ++
 recipes-containers/docker/docker-moby.bb                        | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index 6bfc345..71a88ac 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -70,3 +70,5 @@ SYSTEMD_SERVICE_docker-registry = "${@bb.utils.contains('DISTRO_FEATURES','syste
 SYSTEMD_AUTO_ENABLE_docker-registry = "enable"
 
 RDEPENDS_${PN}-ptest_remove = "${PN}"
+
+CVE_PRODUCT = "docker_registry"
diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
index a107934..be45be2 100644
--- a/recipes-containers/docker/docker-ce_git.bb
+++ b/recipes-containers/docker/docker-ce_git.bb
@@ -132,3 +132,5 @@ FILES_${PN} += "${systemd_unitdir}/system/* ${sysconfdir}/docker"
 
 FILES_${PN}-contrib += "${datadir}/docker/check-config.sh"
 RDEPENDS_${PN}-contrib += "bash"
+
+CVE_PRODUCT = "docker"
diff --git a/recipes-containers/docker/docker-moby.bb b/recipes-containers/docker/docker-moby.bb
index 31f3ce9..0e716db 100644
--- a/recipes-containers/docker/docker-moby.bb
+++ b/recipes-containers/docker/docker-moby.bb
@@ -150,3 +150,5 @@ FILES_${PN} += "${systemd_unitdir}/system/* ${sysconfdir}/docker"
 
 FILES_${PN}-contrib += "${datadir}/docker/check-config.sh"
 RDEPENDS_${PN}-contrib += "bash"
+
+CVE_PRODUCT = "docker"
-- 
2.17.1

