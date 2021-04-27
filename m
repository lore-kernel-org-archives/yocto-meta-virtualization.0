Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.150.1619547022216455821
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Apr 2021 11:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=cAF/iOIK;
 spf=pass (domain: linaro.org, ip: 209.85.219.44, mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qv1-f44.google.com with SMTP id x27so29491710qvd.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 27 Apr 2021 11:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=e7qbVjvqcbFb+4pAWYW+pLKL5uEXbAzAiDZ6lP+cbAk=;
        b=cAF/iOIKO774upTkBuSNQcyt7YF/EKOPYAnlsr61vsBeqjNXayQ7wKTtnQSEliBVn+
         t28XqlG5Q2uZTgQeWJ8MZ8LJ5ZcFW8INHAeFPm1VYKfA9v+BCKrsqyZvFv3g8obU0KDw
         k7simJgozGpe6jCfTQ1ZLnGjrlSBeBSqkTDjQAaL5q/7ZX7bCupMXnPkc+eYkF1pEanr
         4BstlKCmy3Da32oXThsnXzzTCrvaIq+zZz2UXKyvrTA+zg/OUSOlsh0/xNODKFsrWm7D
         ryaGaL4s/ImkzKIr7BpqdzhbaqbYQ0gF0D7PIJbXtgcX0yHk09fp6LFLyQSHQ4NT5Pb2
         iooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=e7qbVjvqcbFb+4pAWYW+pLKL5uEXbAzAiDZ6lP+cbAk=;
        b=SgVgzfoA+cF80STjvXTeUlkleO7bzFyMLDNUt6XuHOSBUc0T9Ds12+NEXZcRG+KRV3
         q8BeRQSHL9YbllfFOpr+WL/5j9IwITUxkNmd9rrYJ7Ws4KDPvhstg0NBzBsAU9miZdGW
         iyA53QZPc1VFE3A/zGz4ZA+mnMC+5m5IH5jlK7V4uEJMIOXBSs+uKbc9bEdeRBXVSyxZ
         3Bdn0kdEicgX2OLvu/qu0WgmqS6xeBMkZ3TW1WjqiNnFRw7QSVpgt+Y14W8h7Puuo8Yv
         QlkvFVhFmhcM/x8IrdLuihSuAXhplA2B6G8S2/lBKciE/PeafZqcFYvRrR2ba8kiGf7e
         KCRQ==
X-Gm-Message-State: AOAM532U/C69vNBxnVTqf/TeM/A/E86bYG8YSk5fsQZFR9SUuO/veEOH
	H7rtaqCOphQwpthQEFk8li6saVLWbOFFMK8k
X-Google-Smtp-Source: ABdhPJxHXDeQQ3v/RrXClpqbCPPhyC2gTYIg4Dh8EZOlXRoJ5PVUasrJiuQfJfcdpmBsKRlWPxPGHA==
X-Received: by 2002:a0c:f901:: with SMTP id v1mr24158989qvn.26.1619547021355;
        Tue, 27 Apr 2021 11:10:21 -0700 (PDT)
Return-Path: <ralph.siemsen@linaro.org>
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id e7sm435891qth.27.2021.04.27.11.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 11:10:20 -0700 (PDT)
From: "Ralph Siemsen" <ralph.siemsen@linaro.org>
To: meta-virtualization@lists.yoctoproject.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [RFC][dunfell][PATCH] add CVE_PRODUCT for docker, containerd, runc
Date: Tue, 27 Apr 2021 14:10:11 -0400
Message-Id: <20210427181011.6193-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.17.1

This is more of an RFC than an actual review request. Currently, the
yocto CVE checker fails to report CVEs in docker, due to mismatch of the
package names (eg "docker-moby" versus just "docker" in NVD).

So set CVE_PRODUCT in each recipe to match up the names. I have only
done this for docker, containerd and runc. Perhaps there are more
components needing similar treatment.

Possible TODOs include:
* rebase/update this to master, and test it there
* split into separate commits, one per component
---
 recipes-containers/containerd/containerd-docker_git.bb         | 2 ++
 recipes-containers/containerd/containerd-opencontainers_git.bb | 2 ++
 recipes-containers/docker/docker-ce_git.bb                     | 2 ++
 recipes-containers/docker/docker-moby.bb                       | 2 ++
 recipes-containers/runc/runc-docker_git.bb                     | 2 ++
 recipes-containers/runc/runc-opencontainers_git.bb             | 2 ++
 6 files changed, 12 insertions(+)

diff --git a/recipes-containers/containerd/containerd-docker_git.bb b/recipes-containers/containerd/containerd-docker_git.bb
index b18a9bb..2a3cd34 100644
--- a/recipes-containers/containerd/containerd-docker_git.bb
+++ b/recipes-containers/containerd/containerd-docker_git.bb
@@ -12,3 +12,5 @@ PROVIDES += "virtual/containerd"
 RPROVIDES_${PN} = "virtual/containerd"
 
 DEPENDS += "btrfs-tools"
+
+CVE_PRODUCT = "containerd"
diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
index 347eae5..2bcff1e 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -14,3 +14,5 @@ EXTRA_OEMAKE += "GODEBUG=1"
 
 PROVIDES += "virtual/containerd"
 RPROVIDES_${PN} = "virtual/containerd"
+
+CVE_PRODUCT = "containerd"
diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
index 14182d1..adffcec 100644
--- a/recipes-containers/docker/docker-ce_git.bb
+++ b/recipes-containers/docker/docker-ce_git.bb
@@ -129,3 +129,5 @@ FILES_${PN} += "${systemd_unitdir}/system/* ${sysconfdir}/docker"
 
 FILES_${PN}-contrib += "${datadir}/docker/check-config.sh"
 RDEPENDS_${PN}-contrib += "bash"
+
+CVE_PRODUCT = "docker"
diff --git a/recipes-containers/docker/docker-moby.bb b/recipes-containers/docker/docker-moby.bb
index 762a785..600603f 100644
--- a/recipes-containers/docker/docker-moby.bb
+++ b/recipes-containers/docker/docker-moby.bb
@@ -148,3 +148,5 @@ FILES_${PN} += "${systemd_unitdir}/system/* ${sysconfdir}/docker"
 
 FILES_${PN}-contrib += "${datadir}/docker/check-config.sh"
 RDEPENDS_${PN}-contrib += "bash"
+
+CVE_PRODUCT = "docker"
diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
index 8d810d0..3684366 100644
--- a/recipes-containers/runc/runc-docker_git.bb
+++ b/recipes-containers/runc/runc-docker_git.bb
@@ -11,3 +11,5 @@ SRC_URI = "git://github.com/opencontainers/runc;nobranch=1;name=runc-docker \
           "
 
 RUNC_VERSION = "1.0.0-rc8"
+
+CVE_PRODUCT = "runc"
diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
index 3a7e7aa..a1271f6 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -7,3 +7,5 @@ SRC_URI = " \
     file://0001-Only-allow-proc-mount-if-it-is-procfs.patch \
     "
 RUNC_VERSION = "1.0.0-rc8"
+
+CVE_PRODUCT = "runc"
-- 
2.17.1

