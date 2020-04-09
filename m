Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web10.16218.1586457746312801705
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 09 Apr 2020 11:42:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sASC4v8+;
 spf=pass (domain: gmail.com, ip: 209.85.167.65, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f65.google.com with SMTP id w145so441818lff.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 09 Apr 2020 11:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7TUX9m0TqQjZKf7RN3R/ZLgm7Ln/0bcFxor9z2Isfjs=;
        b=sASC4v8+D13NW+fa1AZar6x/ki1Cw3jKwDAQwdR+qr3A/C8P/5BcEJezNR61sl9GFx
         J0Vpt5ktE/E9UPLWZxL3NT5OKVAMsAelYwOVdaoU+XC43d40mrNGvYqDe9euQaKbHWQ4
         /jpDXkGcODNr51KLydBOuTCGcJGgmGVI5mZXyBe3Va++QdrtepCAAvq+tkPFyTdqpT7s
         /+XrfHGc6LnxcEQYOMxV+Atb6IBOdhUFWqqsm9ZjfO8YBmJqjmqrt2lzWlh7WAev+Zno
         yPGYiPsCqWOB/NNgZECBdKHlikgy2ku0iC065jiqBY7xUtuh4BZnY94n/S2vgf6Zem1p
         BzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7TUX9m0TqQjZKf7RN3R/ZLgm7Ln/0bcFxor9z2Isfjs=;
        b=nHj8eQC+V/3QBAnJ0ueh7+jM7IJ1mS4DWhaX3cjvFUi7lN+Zh5FlN7bV0sNQfXftwm
         cWQIVH7Zl/EJKMhADKq4g+BrCnQCF7koxrjYqpLdVFe4j643JwARAFuQur5Z5jcKsCXf
         qx9fY+NVeGmKFESj4UwEnIQmtVMEBgL7B4V6avN0mH1jWY2+bCuartzpA3qhTocbD99p
         bK913vJd5t0thyF6iD1MxPnVTeKGP/fdpI2D46tRqns47yxbov4E/LtRj3Z2kS0RzSbd
         VX4QlguUHMfz+uxA+DBvoS7pmNShtwR0z5yIzICnCyjE5n9d8AX1DiE7mR4WbAhDsg/P
         LkWw==
X-Gm-Message-State: AGi0Puaxlm44LbSjl6A0p1OVUj5nyX0jBIYWt6b3ZOw6IK0xuwqU5r5n
	9DbXtyTFh71MyTJ0hUd4IBjWNnKhYjQ=
X-Google-Smtp-Source: APiQypIIOorLGDyRZ1WjBXIYaPqC/u7VPbOCfLBc3GC48dWdETDug9M+h06hpnrAAxk6CugTdiqCXQ==
X-Received: by 2002:a19:691d:: with SMTP id e29mr386309lfc.83.1586457744187;
        Thu, 09 Apr 2020 11:42:24 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.lan (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id 64sm10637743lfh.32.2020.04.09.11.42.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Apr 2020 11:42:23 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: stefan.agner@toradex.com,
	Ricardo Salveti <ricardo@foundries.io>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][zeus][PATCH] docker-ce: allow custom build tags via packageconfig
Date: Thu,  9 Apr 2020 20:42:51 +0200
Message-Id: <20200409184251.11114-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ricardo Salveti <ricardo@foundries.io>

As done by the docker-moby recipe, move the definition of the default
build tags outside do_compile and let the docker build tags be
customized via the packageconfig options set by the recipe.

This is required for enabling seccomp support during build time.

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-containers/docker/docker-ce_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
index 817795f..2746e3f 100644
--- a/recipes-containers/docker/docker-ce_git.bb
+++ b/recipes-containers/docker/docker-ce_git.bb
@@ -44,6 +44,8 @@ PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
 PACKAGES =+ "${PN}-contrib"
 
 DOCKER_PKG="github.com/docker/docker"
+# in order to exclude devicemapper and btrfs - https://github.com/docker/docker/issues/14056
+BUILD_TAGS = "exclude_graphdriver_btrfs exclude_graphdriver_devicemapper"
 
 inherit go
 inherit goarch
@@ -71,8 +73,7 @@ do_compile() {
 	export CGO_ENABLED="1"
 	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-	# in order to exclude devicemapper and btrfs - https://github.com/docker/docker/issues/14056
-	export DOCKER_BUILDTAGS='exclude_graphdriver_btrfs exclude_graphdriver_devicemapper'
+	export DOCKER_BUILDTAGS='${BUILD_TAGS} ${PACKAGECONFIG_CONFARGS}'
 
 	export DISABLE_WARN_OUTSIDE_CONTAINER=1
 
-- 
2.26.0

