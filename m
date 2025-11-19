Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC58CF259E
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 08:52:25 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2570.1763542343927748693
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 00:52:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Ss57NtbF;
 spf=pass (domain: mvista.com, ip: 209.85.216.45, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-34361025290so4931536a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Nov 2025 00:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1763542343; x=1764147143; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2U8rKfxlPvywo1w9gTbmNBZ9JAcocG3pGipZ27Nz4sk=;
        b=Ss57NtbFeccKc3Jtv/UvnfBo+ztp+tJkvpbAW1Yk32kN58Gs6EvP4MzsZj5HD5Udsb
         RRLF3KIX+a9KCEsE85st6i0+d1FCl+Bh0bwEVRTQYMltp4KpGmjDpUdE0ysw4ys4Ajie
         LPFLTM72Cw3adR8WqTtOHvgq7ileq4+m+H/sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763542343; x=1764147143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2U8rKfxlPvywo1w9gTbmNBZ9JAcocG3pGipZ27Nz4sk=;
        b=shxELp7UpyFX/QiDllJsa0MxpKWMaf8N3Q0Mx0ytwRNtID8JyNaruOg0YvgtnKStQy
         Hezn/JPQq2uXp+tjd1HvoYxeIxo4sKFaoZKfGnl5efx8blP+cAmxm2lnGm26tRv+8rcc
         p6kE0h3LiTOR6J9hbLHPGsRbG94/UDZnqNkyn84ehCIvLTcskB6/Z3RY2eGhGEvQhUEO
         54Y67sc1Fh62GTDF9VxrPdaQhEhm6xgKt/7Fd1CkCgUR9DMgdTt5eLV6IYEGhsEPdAap
         xNpldRY5yyDfUjT3+oGVjy5ZDtgdcxA9iDUW5euBFByTKhxStn12JdYzVRCzv8u4NjDX
         WnFg==
X-Gm-Message-State: AOJu0Ywkj3BX/n5p6jYGQ/yYM87gHgjFz51Pp00asqoAnMI1l9HGeuC6
	Bwjhc9IkpHOpT2Y7c1o3c/32E0pi4CpB4+wcvi2NyAStCvhVPhrS4rqUZ1PzWtvtktXI4uNLg81
	kGEt7Yus=
X-Gm-Gg: ASbGnctWTnvaMyTEDYy2fDswwIZ4G+IBgNAd9zysVgqSO7yUi4z31fQMY8EtKv8SHz1
	e6DA4c3KwHoAjwql2mOLqj8cLqKuLkooFKdHIxwhYscTT/li6VXr272U6UMaPRddj1D6eR1YewD
	Rwp+MO2eLDRf3PwaykN7DHGI9jjsYku+vG9aq4JTaDkChQmIm5Dwiij2sNrOE7Oas6mRd2C8xCZ
	ovQ4g591P0dj5t7fEdPy5W+37/NMQZRDG8SubM4pSelswvMgiISqWmj2oVBsfadFtE63y5Y5rp/
	uxuIPlfgDDULnocKta/NQqcTwLw/B/g5YElfyNfHq74CsENrCPqzFGug75/OQX7Z89ZsjypQxoE
	E6g18gRv84yCOJghODT56L0/q8bVAaiVmZrwQOERyEZ3MZn4/FqEfbJTHGLffvbteAOBJsYwe7G
	4kaMiJadBDtrIMrvwuBIfq
X-Google-Smtp-Source: AGHT+IHIA2JawgvHtA7tW7CCUuum2XrodIS1POFzX40nHpNsv0m3hwNrMxrx6q9KTr83eKxylBYq2w==
X-Received: by 2002:a17:90b:1d4f:b0:340:f7d6:dc70 with SMTP id 98e67ed59e1d1-343f9e9f3b5mr20254476a91.13.1763542342899;
        Wed, 19 Nov 2025 00:52:22 -0800 (PST)
Received: from MVIN00013 ([150.129.170.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345bbfc8dd9sm1963378a91.3.2025.11.19.00.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 00:52:22 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-virtualization][scarthgap][PATCH] kubernetes: Fix for CVE-2024-10220
Date: Wed, 19 Nov 2025 14:22:16 +0530
Message-ID: <20251119085216.329343-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Nov 2025 08:52:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9443

Upstream-Status: Backport from https://github.com/kubernetes/kubernetes/commit/4b7b754099e32ce4b67dacd51d60daa2686ddd94

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../kubernetes/CVE-2024-10220.patch           | 60 +++++++++++++++++++
 .../kubernetes/kubernetes_git.bb              |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2024-10220.patch

diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2024-10220.patch b/recipes-containers/kubernetes/kubernetes/CVE-2024-10220.patch
new file mode 100644
index 00000000..1de966e4
--- /dev/null
+++ b/recipes-containers/kubernetes/kubernetes/CVE-2024-10220.patch
@@ -0,0 +1,60 @@
+From 4b7b754099e32ce4b67dacd51d60daa2686ddd94 Mon Sep 17 00:00:00 2001
+From: Imre Rad <imrer@google.com>
+Date: Thu, 25 Apr 2024 14:21:51 +0000
+Subject: [PATCH] gitRepo volume: directory must be max 1 level deep
+
+More details on Hackerone #2266560
+
+CVE: CVE-2024-10220
+Upstream-Status: Backport [https://github.com/kubernetes/kubernetes/commit/4b7b754099e32ce4b67dacd51d60daa2686ddd94]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ pkg/volume/git_repo/git_repo.go      |  6 ++++++
+ pkg/volume/git_repo/git_repo_test.go | 14 ++++++++++++++
+ 2 files changed, 20 insertions(+)
+
+diff --git a/pkg/volume/git_repo/git_repo.go b/pkg/volume/git_repo/git_repo.go
+index 995018d9007..b3827b92ad0 100644
+--- a/pkg/volume/git_repo/git_repo.go
++++ b/pkg/volume/git_repo/git_repo.go
+@@ -261,6 +261,12 @@ func validateVolume(src *v1.GitRepoVolumeSource) error {
+ 	if err := validateNonFlagArgument(src.Directory, "directory"); err != nil {
+ 		return err
+ 	}
++	if (src.Revision != "") && (src.Directory != "") {
++		cleanedDir := filepath.Clean(src.Directory)
++		if strings.Contains(cleanedDir, "/") || (strings.Contains(cleanedDir, "\\")) {
++			return fmt.Errorf("%q is not a valid directory, it must not contain a directory separator", src.Directory)
++		}
++	}
+ 	return nil
+ }
+ 
+diff --git a/pkg/volume/git_repo/git_repo_test.go b/pkg/volume/git_repo/git_repo_test.go
+index 5b1461be892..650f765cc48 100644
+--- a/pkg/volume/git_repo/git_repo_test.go
++++ b/pkg/volume/git_repo/git_repo_test.go
+@@ -267,6 +267,20 @@ func TestPlugin(t *testing.T) {
+ 			},
+ 			isExpectedFailure: true,
+ 		},
++		{
++			name: "invalid-revision-directory-combo",
++			vol: &v1.Volume{
++				Name: "vol1",
++				VolumeSource: v1.VolumeSource{
++					GitRepo: &v1.GitRepoVolumeSource{
++						Repository: gitURL,
++						Revision:   "main",
++						Directory:  "foo/bar",
++					},
++				},
++			},
++			isExpectedFailure: true,
++		},
+ 	}
+ 
+ 	for _, scenario := range scenarios {
+-- 
+2.50.1
+
diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index ee44db47..5339371c 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -35,6 +35,7 @@ SRC_URI:append = " \
            file://k8s-init \
            file://99-kubernetes.conf \
            file://CVE-2025-5187.patch \
+           file://CVE-2024-10220.patch \
           "
 
 DEPENDS += "rsync-native \
-- 
2.50.1


