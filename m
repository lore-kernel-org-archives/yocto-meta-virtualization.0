Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web12.34437.1617479500411668092
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 03 Apr 2021 12:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EDTtKyhx;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id n2so5406502ejy.7
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 03 Apr 2021 12:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nm3pcr0VBGJU2h3mflLiSJhomjqUIM61TNrFyTYTKXc=;
        b=EDTtKyhxMe9oU0uHzAc+ErAJIdAcUS9fKCM06hPch8GsXE7vTdlPHfeyJFGUsERza+
         nYpzTKk8RLsZuWir7x/VZMnEhzZ6ampvVR1WypJ5IRCbmAB0D4jJLy2jXtC1GtdLKtjb
         3tnz3WfWWv+uaDaGpNbWcflB5R906/JYU6vM03WhHNONAPjiRPJKTVeg1j/0ut5TZg3b
         WGB8YD/CzYxmPkjJYQl0JFD/y2sC2dN9y/yA0OEk1Qhd4VocDFxB32UNw2jalejhrK7g
         pASHeWw/HHLBgOrMl+kdm3FcE4+mgrXfObZjqV+Wf9JHaKPNxlHZhLA0WK0hAX9Y5dcu
         emeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nm3pcr0VBGJU2h3mflLiSJhomjqUIM61TNrFyTYTKXc=;
        b=bfRBa7lscyvZUFeNal8zbgtVpFGVihESmda9CF7deWnmct0YTbZEZNEaBEi8d6O10v
         VKSRO0jjfYx4ZkkseVMZE1muQ779wgK2UgXP0D684pfiuXnY0yoixHS+XiNvS7oz11Xp
         We4LOSis7Yz8ilM8y0L3OBqibGdR3ym1QeEtT+3f7r6uRsUv5IqYOxBt6PdmVDbNJLsB
         pMB9fhiUdcP/D2oHb0tAeQvUMnW7biK3EJ8jeJg2GB8rExdyiWIAzH2ivfiU/F+537q8
         S24QXllDYhJgAXVp865KQzMFoBaBuuFQvtMCuZhIKM7BIPLLwpzvCZQkE5dojOlnuIbU
         O+sQ==
X-Gm-Message-State: AOAM5338ZiDCHgf1TMe7kfaezPRR7fYaBDoafEJt+1G4gH6QqiS+rJ5h
	WHtTAYChQia4pwzWuXP71aBBbIpTbJQ=
X-Google-Smtp-Source: ABdhPJzYPTs97sjLs1qfP+nNYAsxWiWSBkQlXq+58ub+T327J85YvO19S/TU+kzcd6s2zGxy5ezjhA==
X-Received: by 2002:a17:906:71d3:: with SMTP id i19mr20717350ejk.347.1617479498991;
        Sat, 03 Apr 2021 12:51:38 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id bm21sm5861001ejb.36.2021.04.03.12.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 12:51:38 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH 3/5] cri-o, podman, packagegroup-container: replace anonymous python function calling bb.parse.SkipRecipe with conditional PNBLACKLISTs
Date: Sat,  3 Apr 2021 21:51:31 +0200
Message-Id: <20210403195133.1401406-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210403195133.1401406-1-Martin.Jansa@gmail.com>
References: <20210403195133.1401406-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* PNBLACKLISTs are IMHO a bit easier to read and easier to override from distro
  which e.g. provides own recipe for libseccomp

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-containers/cri-o/cri-o_git.bb            | 16 +---------------
 recipes-containers/podman/podman_git.bb          | 10 +---------
 .../packagegroups/packagegroup-container.bb      | 10 +---------
 3 files changed, 3 insertions(+), 33 deletions(-)

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index 2d6187a..0ac5ddc 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -43,21 +43,7 @@ RDEPENDS_${PN} = " \
     libdevmapper \
     "
 
-python __anonymous() {
-    msg = ""
-    # ERROR: Nothing PROVIDES 'libseccomp' (but /buildarea/layers/meta-virtualization/recipes-containers/cri-o/cri-o_git.bb DEPENDS on or otherwise requires it).
-    # ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
-    # Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'cri-o', 'libseccomp']
-    if 'security' not in d.getVar('BBFILE_COLLECTIONS').split():
-        msg += "Make sure meta-security should be present as it provides 'libseccomp'"
-        raise bb.parse.SkipRecipe(msg)
-    # ERROR: Nothing PROVIDES 'libselinux' (but /buildarea/layers/meta-virtualization/recipes-containers/cri-o/cri-o_git.bb DEPENDS on or otherwise requires it).
-    # ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
-    # Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'cri-o', 'libselinux']
-    elif 'selinux' not in d.getVar('BBFILE_COLLECTIONS').split():
-        msg += "Make sure meta-selinux should be present as it provides 'libselinux'"
-        raise bb.parse.SkipRecipe(msg)
-}
+PNBLACKLIST[cri-o] ?= "${@bb.utils.contains('BBFILE_COLLECTIONS', 'security', bb.utils.contains('BBFILE_COLLECTIONS', 'selinux', '', 'Depends on libselinux from meta-selinux which is not included', d), 'Depends on libseccomp from meta-security which is not included', d)}"
 
 PACKAGES =+ "${PN}-config"
 
diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index a552a7f..62ae024 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -14,15 +14,7 @@ DEPENDS = " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
 "
 
-python __anonymous() {
-    msg = ""
-    # ERROR: Nothing PROVIDES 'libseccomp' (but meta-virtualization/recipes-containers/podman/ DEPENDS on or otherwise requires it).
-    # ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
-    # Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'podman', 'libseccomp']
-    if 'security' not in d.getVar('BBFILE_COLLECTIONS').split():
-        msg += "Make sure meta-security should be present as it provides 'libseccomp'"
-        raise bb.parse.SkipRecipe(msg)
-}
+PNBLACKLIST[podman] ?= "${@bb.utils.contains('BBFILE_COLLECTIONS', 'security', '', 'Depends on libseccomp from meta-security which is not included', d)}"
 
 SRCREV = "288fb688964cb7fc7086d0728daa1f5f6b726dd6"
 SRC_URI = " \
diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recipes-core/packagegroups/packagegroup-container.bb
index b3b0d4c..b06a7c7 100644
--- a/recipes-core/packagegroups/packagegroup-container.bb
+++ b/recipes-core/packagegroups/packagegroup-container.bb
@@ -44,12 +44,4 @@ RDEPENDS_packagegroup-containerd = " \
     virtual/containerd \
 "
 
-python __anonymous() {
-    msg = ""
-    # ERROR: Nothing PROVIDES 'libseccomp' (but meta-virtualization/recipes-containers/podman/ DEPENDS on or otherwise requires it).
-    # ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
-    # Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'podman', 'libseccomp']
-    if 'security' not in d.getVar('BBFILE_COLLECTIONS').split():
-        msg += "Make sure meta-security should be present as it provides 'libseccomp'"
-        raise bb.parse.SkipRecipe(msg)
-}
+PNBLACKLIST[packagegroup-container] ?= "${@bb.utils.contains('BBFILE_COLLECTIONS', 'security', '', 'Depends on podman which depends on libseccomp from meta-security which is not included', d)}"
-- 
2.30.2

