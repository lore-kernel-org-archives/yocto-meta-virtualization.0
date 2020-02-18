Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.3548.1582066778548677513
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 Feb 2020 14:59:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries-io.20150623.gappssmtp.com header.s=20150623 header.b=yFliKf7Q;
 spf=softfail (domain: foundries.io, ip: 209.85.219.54, mailfrom: ricardo@foundries.io)
Received: by mail-qv1-f54.google.com with SMTP id u10so9959538qvi.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 18 Feb 2020 14:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries-io.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hXLFuqXv9xQdH2WKN4RFk8onKAqwpR5rQ+M0ZhVwXfk=;
        b=yFliKf7QRHn3frBaCCNOX+Psrk21eV9UIkzM12sYdYcxRPkfLdkmfi5TIbFMXdN+MJ
         4WEfRyeaTXgssGpPxs9Byqqvji8O2rIdaEiKmBfaWYZKbG1m6KLfPaewcqEvbBaLVa6q
         C7189BK6bz4g22/uezJ15GkRQZ3zYO3aBpy9dF/leR0K1kxh+0bxbyk1DmutYujXmtGJ
         2ZAooAtjdCjfvixbk2DQftQop1+Hn6fmqLoz1KXb91qScWFUEZjYGn8MHpCkF6bwvxxU
         IjfiOy7ZAiXXR60ivOEHCxqFBX+GD+q/NwMOJtnu58gLnMiL5UhqRFbUPHjPQ2KqSodh
         2oxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hXLFuqXv9xQdH2WKN4RFk8onKAqwpR5rQ+M0ZhVwXfk=;
        b=jIxqaU3kqIbcDMQk3Zvt3PTHcM13twWmnw5ofOLKiV/SJVFvkaWPagf7vp2QUL72Tu
         9f3xGC7WwNwL4Ndr6L1D4o1GokEZ1oOqgreNMxYMF7p742QTdsbNVUCyY0bbJMFpDSMT
         NccH8AVEUURiD6y24a9KNhCW0X5kwTSQ+MPmzDltsKPTgB4VI2BlEEZi1kU5bEzwCjs0
         HVxrFr2ZP25gUwOeFrPWnMO3gMDNL3dBD645GWoyr581tF+3jT+1UU0m0c72v+0v8FsY
         M40zm5ad4QurTejnzJrOCMo2khAuA/4mAOHUvnx7DcNJ8n2kqkiXE2fIu28D+d7gXcNg
         xjvQ==
X-Gm-Message-State: APjAAAVV7qW5K3cgjVKsGMz7cBSB14K1HKdwWrrdu4YGTfS9u53LzNio
	K5Q/Bow8SwvnS1nB/4GItOqGdPG6iQ==
X-Google-Smtp-Source: APXvYqxB5Wd7/lpjUOo7mH8jceUH2+Vn2mc2+lm4lskYN/cbBvrGQCPXoKjQOZNuu4r2vHTZE6HVOA==
X-Received: by 2002:a0c:ffd2:: with SMTP id h18mr1924640qvv.31.1582066777223;
        Tue, 18 Feb 2020 14:59:37 -0800 (PST)
Return-Path: <ricardo@foundries.io>
Received: from localhost.localdomain ([2804:7f5:f380:9307:4fd:3784:742d:cba])
        by smtp.gmail.com with ESMTPSA id 123sm50378qkj.113.2020.02.18.14.59.36
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 14:59:36 -0800 (PST)
From: "Ricardo Salveti" <ricardo@foundries.io>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] docker-ce: allow custom build tags via packageconfig
Date: Tue, 18 Feb 2020 19:59:13 -0300
Message-Id: <20200218225913.30838-1-ricardo@foundries.io>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As done by the docker-moby recipe, move the definition of the default
build tags outside do_compile and let the docker build tags be
customized via the packageconfig options set by the recipe.

This is required for enabling seccomp support during build time.

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 recipes-containers/docker/docker-ce_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
index ef84069..3c8a339 100644
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
2.25.0

