Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C66DEE4993
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 08:28:17 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.3746.1692692887785263084
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Aug 2023 01:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Qt8OyTNs;
 spf=pass (domain: mvista.com, ip: 209.85.214.172, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1bf0b24d925so26387275ad.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Aug 2023 01:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1692692886; x=1693297686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fZpxfmpPpzzWEBbH1v0v/zKQDWsjKgXlZAdVWVzd2Ak=;
        b=Qt8OyTNsrOts0tBZUK433bf2WqUowb88XQVgV05Gle83dH9Jj7O0jnKWIFOIVDj43e
         YhVnMUwzkc0aMyae5xNo2ZS5WY2rjDeT5eQtqaZrTGkwq+BSTTTb0CsWuauPVtywnc94
         /ykk3nKrrLbQDK+wzWv+P6wns0MmW2SDDmcRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692692886; x=1693297686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fZpxfmpPpzzWEBbH1v0v/zKQDWsjKgXlZAdVWVzd2Ak=;
        b=dJ7WKFGumDspPSaDQcX8ufjlneHg8ELym/YcJv6MBmzUgJoOrVV2wqPDSEqXx62MqX
         V1UyNiqcFxWmleujPJEXB/YRzg0+gKDk4t39rDWnqmTecoV5LVFJV8kASDmXosTjRaTm
         PbexO6PeJhkqS/mqaZ21oQeivQRI8yK7b0hrUdcumtntvpHFJhzcIRMW4xVL133Jay8+
         8l3oj1669TrenJGBcHXEH+STk7KjrdIaUN9Hl+Y99lapUrSEayiEfou/VlznHQmoIwW5
         r9WO1iIPtnqevJlPIi1Yj1yCrC4k3I4XDN3z0nQ59rEfGhD1ipSLv4cfbgt8bUt2KdV3
         T/9A==
X-Gm-Message-State: AOJu0Yw9b/+PWIUchDvZtBHR6808zK5LTjwRyO8b0Fzl4vX9XJL8Vy4+
	d4Qj7NSL8kDLSqgIeirDE8JYBFuFHhd/E1CZ7lo=
X-Google-Smtp-Source: AGHT+IGhlxl0lyr8M10BivTaf9hQAXQwQ9Xwm9+Du9DrEjNPWbu25aF52IBfkTnsG/AhqXvE9bjeig==
X-Received: by 2002:a17:902:f54f:b0:1bd:f1ae:309d with SMTP id h15-20020a170902f54f00b001bdf1ae309dmr7009538plf.9.1692692886380;
        Tue, 22 Aug 2023 01:28:06 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c01c:78b9:2b44:fd11:3a8e:139c])
        by smtp.gmail.com with ESMTPSA id i1-20020a170902c94100b001bdca6456b9sm8390397pla.17.2023.08.22.01.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 01:28:05 -0700 (PDT)
From: vanusuri@mvista.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [meta-virtualization][dunfell][PATCH] kubernetes: Backport fix for CVE-2020-8565 & CVE-2020-8566
Date: Tue, 22 Aug 2023 13:57:52 +0530
Message-Id: <20230822082752.121479-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Aug 2023 08:28:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8218

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-commit:https://github.com/kubernetes/kubernetes/commit/f0f52255412cbc6834bd225a59608ebb4a0d399b
& https://github.com/kubernetes/kubernetes/commit/e91ec4fad3366d2dee020919f7c2a0d7b52fd3ea

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../kubernetes/kubernetes/CVE-2020-8565.patch | 24 +++++++
 .../kubernetes/kubernetes/CVE-2020-8566.patch | 67 +++++++++++++++++++
 .../kubernetes/kubernetes_git.bb              |  2 +
 3 files changed, 93 insertions(+)
 create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2020-8565.patch
 create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2020-8566.patch

diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2020-8565.patch b/recipes-containers/kubernetes/kubernetes/CVE-2020-8565.patch
new file mode 100644
index 0000000..c3772e9
--- /dev/null
+++ b/recipes-containers/kubernetes/kubernetes/CVE-2020-8565.patch
@@ -0,0 +1,24 @@
+From f0f52255412cbc6834bd225a59608ebb4a0d399b Mon Sep 17 00:00:00 2001
+From: Sam Fowler <sfowler@redhat.com>
+Date: Tue, 6 Oct 2020 11:10:38 +1000
+Subject: [PATCH] Mask bearer token in logs when logLevel >= 9
+
+Upstream-Status: Backport [https://github.com/kubernetes/kubernetes/commit/f0f52255412cbc6834bd225a59608ebb4a0d399b]
+CVE: CVE-2020-8565
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ staging/src/k8s.io/client-go/transport/round_trippers.go | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/staging/src/k8s.io/client-go/transport/round_trippers.go b/staging/src/k8s.io/client-go/transport/round_trippers.go
+index a05208d924d3b..f4cfadbd3da8e 100644
+--- a/src/import/staging/src/k8s.io/client-go/transport/round_trippers.go
++++ b/src/import/staging/src/k8s.io/client-go/transport/round_trippers.go
+@@ -340,6 +340,7 @@ func (r *requestInfo) toCurl() string {
+ 	headers := ""
+ 	for key, values := range r.RequestHeaders {
+ 		for _, value := range values {
++			value = maskValue(key, value)
+ 			headers += fmt.Sprintf(` -H %q`, fmt.Sprintf("%s: %s", key, value))
+ 		}
+ 	}
diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2020-8566.patch b/recipes-containers/kubernetes/kubernetes/CVE-2020-8566.patch
new file mode 100644
index 0000000..7ed812d
--- /dev/null
+++ b/recipes-containers/kubernetes/kubernetes/CVE-2020-8566.patch
@@ -0,0 +1,67 @@
+From e91ec4fad3366d2dee020919f7c2a0d7b52fd3ea Mon Sep 17 00:00:00 2001
+From: Sam Fowler <sfowler@redhat.com>
+Date: Fri, 2 Oct 2020 10:48:11 +1000
+Subject: [PATCH] Mask Ceph RBD adminSecrets in logs when logLevel >= 4
+
+Upstream-Status: Backport [https://github.com/kubernetes/kubernetes/commit/e91ec4fad3366d2dee020919f7c2a0d7b52fd3ea]
+CVE: CVE-2020-8566
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ pkg/volume/rbd/rbd_util.go | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/pkg/volume/rbd/rbd_util.go b/pkg/volume/rbd/rbd_util.go
+index 85044e85fde..9593348de37 100644
+--- a/src/import/pkg/volume/rbd/rbd_util.go
++++ b/src/import/pkg/volume/rbd/rbd_util.go
+@@ -592,9 +592,9 @@ func (util *RBDUtil) CreateImage(p *rbdVolumeProvisioner) (r *v1.RBDPersistentVo
+ 	volSz := fmt.Sprintf("%d", sz)
+ 	mon := util.kernelRBDMonitorsOpt(p.Mon)
+ 	if p.rbdMounter.imageFormat == rbdImageFormat2 {
+-		klog.V(4).Infof("rbd: create %s size %s format %s (features: %s) using mon %s, pool %s id %s key %s", p.rbdMounter.Image, volSz, p.rbdMounter.imageFormat, p.rbdMounter.imageFeatures, mon, p.rbdMounter.Pool, p.rbdMounter.adminId, p.rbdMounter.adminSecret)
++		klog.V(4).Infof("rbd: create %s size %s format %s (features: %s) using mon %s, pool %s id %s key <masked>", p.rbdMounter.Image, volSz, p.rbdMounter.imageFormat, p.rbdMounter.imageFeatures, mon, p.rbdMounter.Pool, p.rbdMounter.adminId)
+ 	} else {
+-		klog.V(4).Infof("rbd: create %s size %s format %s using mon %s, pool %s id %s key %s", p.rbdMounter.Image, volSz, p.rbdMounter.imageFormat, mon, p.rbdMounter.Pool, p.rbdMounter.adminId, p.rbdMounter.adminSecret)
++		klog.V(4).Infof("rbd: create %s size %s format %s using mon %s, pool %s id %s key <masked>", p.rbdMounter.Image, volSz, p.rbdMounter.imageFormat, mon, p.rbdMounter.Pool, p.rbdMounter.adminId)
+ 	}
+ 	args := []string{"create", p.rbdMounter.Image, "--size", volSz, "--pool", p.rbdMounter.Pool, "--id", p.rbdMounter.adminId, "-m", mon, "--key=" + p.rbdMounter.adminSecret, "--image-format", p.rbdMounter.imageFormat}
+ 	if p.rbdMounter.imageFormat == rbdImageFormat2 {
+@@ -629,7 +629,7 @@ func (util *RBDUtil) DeleteImage(p *rbdVolumeDeleter) error {
+ 	}
+ 	// rbd rm.
+ 	mon := util.kernelRBDMonitorsOpt(p.rbdMounter.Mon)
+-	klog.V(4).Infof("rbd: rm %s using mon %s, pool %s id %s key %s", p.rbdMounter.Image, mon, p.rbdMounter.Pool, p.rbdMounter.adminId, p.rbdMounter.adminSecret)
++	klog.V(4).Infof("rbd: rm %s using mon %s, pool %s id %s key <masked>", p.rbdMounter.Image, mon, p.rbdMounter.Pool, p.rbdMounter.adminId)
+ 	output, err = p.exec.Command("rbd",
+ 		"rm", p.rbdMounter.Image, "--pool", p.rbdMounter.Pool, "--id", p.rbdMounter.adminId, "-m", mon, "--key="+p.rbdMounter.adminSecret).CombinedOutput()
+ 	if err == nil {
+@@ -661,7 +661,7 @@ func (util *RBDUtil) ExpandImage(rbdExpander *rbdVolumeExpander, oldSize resourc
+ 
+ 	// rbd resize.
+ 	mon := util.kernelRBDMonitorsOpt(rbdExpander.rbdMounter.Mon)
+-	klog.V(4).Infof("rbd: resize %s using mon %s, pool %s id %s key %s", rbdExpander.rbdMounter.Image, mon, rbdExpander.rbdMounter.Pool, rbdExpander.rbdMounter.adminId, rbdExpander.rbdMounter.adminSecret)
++	klog.V(4).Infof("rbd: resize %s using mon %s, pool %s id %s key <masked>", rbdExpander.rbdMounter.Image, mon, rbdExpander.rbdMounter.Pool, rbdExpander.rbdMounter.adminId)
+ 	output, err = rbdExpander.exec.Command("rbd",
+ 		"resize", rbdExpander.rbdMounter.Image, "--size", newVolSz, "--pool", rbdExpander.rbdMounter.Pool, "--id", rbdExpander.rbdMounter.adminId, "-m", mon, "--key="+rbdExpander.rbdMounter.adminSecret).CombinedOutput()
+ 	if err == nil {
+@@ -703,7 +703,7 @@ func (util *RBDUtil) rbdInfo(b *rbdMounter) (int, error) {
+ 	// # image does not exist (exit=2)
+ 	// rbd: error opening image 1234: (2) No such file or directory
+ 	//
+-	klog.V(4).Infof("rbd: info %s using mon %s, pool %s id %s key %s", b.Image, mon, b.Pool, id, secret)
++	klog.V(4).Infof("rbd: info %s using mon %s, pool %s id %s key <masked>", b.Image, mon, b.Pool, id)
+ 	output, err = b.exec.Command("rbd",
+ 		"info", b.Image, "--pool", b.Pool, "-m", mon, "--id", id, "--key="+secret, "-k=/dev/null", "--format=json").CombinedOutput()
+ 
+@@ -766,7 +766,7 @@ func (util *RBDUtil) rbdStatus(b *rbdMounter) (bool, string, error) {
+ 	// # image does not exist (exit=2)
+ 	// rbd: error opening image kubernetes-dynamic-pvc-<UUID>: (2) No such file or directory
+ 	//
+-	klog.V(4).Infof("rbd: status %s using mon %s, pool %s id %s key %s", b.Image, mon, b.Pool, id, secret)
++	klog.V(4).Infof("rbd: status %s using mon %s, pool %s id %s key <masked>", b.Image, mon, b.Pool, id)
+ 	cmd, err = b.exec.Command("rbd",
+ 		"status", b.Image, "--pool", b.Pool, "-m", mon, "--id", id, "--key="+secret).CombinedOutput()
+ 	output = string(cmd)
+-- 
+2.25.1
+
diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index c73f988..2b0bfb7 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -12,6 +12,8 @@ SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=release-1.17;name=k
            file://0001-hack-lib-golang.sh-use-CC-from-environment.patch \
            file://0001-cross-don-t-build-tests-by-default.patch \
            file://CVE-2020-8564.patch \
+           file://CVE-2020-8565.patch \
+           file://CVE-2020-8566.patch \
           "
 
 DEPENDS += "rsync-native \
-- 
2.25.1


