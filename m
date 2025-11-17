Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C518CE8D6B
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 05:00:50 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2722.1763355641739138137
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 16 Nov 2025 21:00:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=H9a+2jfE;
 spf=pass (domain: mvista.com, ip: 209.85.216.52, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-34381ec9197so3504708a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 16 Nov 2025 21:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1763355640; x=1763960440; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x9bo1H+wVZVgVnLtV6SvtGD5aW9Qd9tmgyaTKbrqZ3Y=;
        b=H9a+2jfEcECI9DW7ZVUKc/ReFw24xzOIo2G7TfoUcvQz2i/6ecS6eSuWRX5w7EhPBq
         pVhxEQF4diroJSDutx1pJkbABJy/+wfkYxQDwMtl52DUiFoWgNhByRRkE24bEhmaI4Zs
         SA0ApAd6h8NYWZ6E85WOq9U9Jyo5EIr/YnpT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763355640; x=1763960440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9bo1H+wVZVgVnLtV6SvtGD5aW9Qd9tmgyaTKbrqZ3Y=;
        b=pJ23hQXgHs/xVzty94im1DMBg2tn8bVSIZYJO70BuSGNCyASXfyOZDSR31ChHCwekV
         EX7u9DDjjueOL5WJQ3JNBLWKji1Qrp8PV4BKKTpW2w82ZT8nLhA943vbr1a8FXGIealL
         5h9/+1neR+VH/a5krCrU6MUzSGgOnA8MTm/WXnCR+YX3+ofd6KSDA1EToIJlVan4kW5s
         DXRx4j6fHxwbaOh8pzUnAYPZf8I57yNF6g0xPwbTFojyIDQpzRtWVxkMjMN4joQexDHd
         xFSfb9EoUPA7H7ViCt4uU8XVICT486No3H2G0GMInvR1eGs10tM0LtMqeqjiiNluIwrs
         OzQA==
X-Gm-Message-State: AOJu0YwtgpETvrxQTmLLqJ4t/U26XRm8P5vXjsKGoa2kqxoCl00hTaNf
	M+SRObiy494JJaZUPZpq9OFZoX6UGx8Tsz0KCkT26EP7Fu6T0iUECBgiqc9UJQxnsvT8OIU1oMn
	6w58O
X-Gm-Gg: ASbGncvN+Q9FtPjPZ2KHTlSPWmBRfqTDaKL5rR1/M1+YJSFyChx+Ub0o0RKrOP95dc1
	BkLt+FMOV31VIxFGAqarGZB8W1TNtzMPuYqiXOuDTeZDO+kB2zQm8x9hyILLZGgCyn2uhTiCXXH
	bCPRon8LtIzhCigl+TAatDXY0ZUPlWtlr0gKLuOlMqriVkXQVSULWm80CFAEo9GmmMjkM0PXb+l
	uerEojwQZjIBr9qmYn+o8gb7X272PwHk+XK5kECBGwLSZulMsYsFgKfwTkt4jVPR/MGQv/8XUNz
	A4AdBxd2oNUjQIxbIQS/l93aiOKmbaz8Ad3wgPcEwaarKW58yA81qs1jlbSVtJxh6PbdVnF+reS
	bu35AXFr5Jby3f4Vhyd3DuIlxj5kKaijBrUBbsCqMqlJV/JOMjUwitxr9J3KTX3CaMjVkqA84cH
	Jq5rzhs94NBLoB+f9i5PXIMaHCRKdsbZBINQ==
X-Google-Smtp-Source: AGHT+IElDmlxBBGWNWX7UUWvzV9JXcR5nvc9ryXfkl1MOxze27wrlCa2ZTjW8R2SjpUkvQGBDh/H4w==
X-Received: by 2002:a17:90b:5243:b0:343:f536:e813 with SMTP id 98e67ed59e1d1-343fa7326aemr11395473a91.28.1763355640146;
        Sun, 16 Nov 2025 21:00:40 -0800 (PST)
Received: from localhost.localdomain ([123.201.170.28])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc37517864asm10732133a12.17.2025.11.16.21.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 21:00:39 -0800 (PST)
From: vanusuri@mvista.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [meta-virtualization][kirkstone][PATCH] kubernetes: Fix for CVE-2024-10220
Date: Mon, 17 Nov 2025 10:30:23 +0530
Message-Id: <20251117050023.61262-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Nov 2025 05:00:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9441

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/kubernetes/kubernetes/commit/6622b002f70a153100d1c286fbcea721160da192

Reference: https://github.com/kubernetes/kubernetes/issues/128885

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../kubernetes/CVE-2024-10220.patch           | 57 +++++++++++++++++++
 .../kubernetes/kubernetes_git.bb              |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2024-10220.patch

diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2024-10220.patch b/recipes-containers/kubernetes/kubernetes/CVE-2024-10220.patch
new file mode 100644
index 00000000..c0e371af
--- /dev/null
+++ b/recipes-containers/kubernetes/kubernetes/CVE-2024-10220.patch
@@ -0,0 +1,57 @@
+From 6622b002f70a153100d1c286fbcea721160da192 Mon Sep 17 00:00:00 2001
+From: Imre Rad <imrer@google.com>
+Date: Thu, 25 Apr 2024 14:21:51 +0000
+Subject: [PATCH] gitRepo volume: directory must be max 1 level deep
+
+More details on Hackerone #2266560
+
+Upstream-Status: Backport [https://github.com/kubernetes/kubernetes/commit/6622b002f70a153100d1c286fbcea721160da192]
+CVE: CVE-2024-10220
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ pkg/volume/git_repo/git_repo.go      |  6 ++++++
+ pkg/volume/git_repo/git_repo_test.go | 14 ++++++++++++++
+ 2 files changed, 20 insertions(+)
+
+diff --git a/pkg/volume/git_repo/git_repo.go b/pkg/volume/git_repo/git_repo.go
+index 995018d900727..b3827b92ad0f0 100644
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
+index 5b1461be892a1..650f765cc4884 100644
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
diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index 41f1ad73..dbfb3705 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -39,6 +39,7 @@ SRC_URI:append = " \
            file://CVE-2023-3955.patch;patchdir=src/import \
            file://CVE-2023-3676.patch;patchdir=src/import \
            file://CVE-2025-5187.patch;patchdir=src/import \
+           file://CVE-2024-10220.patch;patchdir=src/import \
           "
 
 DEPENDS += "rsync-native \
-- 
2.25.1


