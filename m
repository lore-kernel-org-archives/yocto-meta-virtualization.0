Return-Path: <raitosyo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D6DC83F1A
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 09:13:11 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.16521.1752829985814716905
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 18 Jul 2025 02:13:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e6kOJ/DW;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raitosyo@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-311ef4fb43dso1565655a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 18 Jul 2025 02:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752829985; x=1753434785; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qkQZv9R0aaLpClU44gMMdFIRKmQjUsMcgoiPucbV89E=;
        b=e6kOJ/DWDdelFNTvIUcD2NppVhjBijueFqzZoubJ92fgSOi0dCwZW0SiZFQRuz44vH
         vT3aKGkb34HiRQb8rz3bmborqhJvLPTyiWEBSZT1iArSNF4gXBCscSE4e6NskRY8Tl+Q
         wt++C4QHGjJsl7jGu1yIYfSMLgB0Z7LnQkEs5IrQwIsSOcab5GpuIDw4oKX1AeppXn0/
         nQiDF/Cmbn7Dv3d3l+mCuRwJx4S8FZNV0YJWVyWSenEz3xj7Qw+2PMfi8EckC9mSmpP5
         SV9gx9vwaidV3qQDSJXYO8/whQykGikM4DRfEbp3Dkqm7BNiTXUUtblrMZMqtvQw5zPE
         nkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752829985; x=1753434785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qkQZv9R0aaLpClU44gMMdFIRKmQjUsMcgoiPucbV89E=;
        b=a4wL0diBhvhgyfdUzhsl8e4Zp++7BS8eu1Mmq5gdnjc+J1qb8JWDbFcYftae1EVdei
         gdNpMv1MJJl5O1t5N9lGMK7AoCi3CsSQcn1BunGer/bN8b+hIrG0FFGCTQ3Iv4+4RLY2
         7847BAh3HrSrgVqz/r9aa3OpNHZkgePgBMtDUOKaj6t6y3AzyygQomtfe2lfBodre+v7
         /Dhmk0SlivDg0sPbLxsauxx+38EruAhykIi1krXQVRsP+xF1Qdz83ZQc1ktYrdWTafCV
         aUKTmbn34KLSU0c5BB7lyLsc+ZEEeXj0lb2U9aARuRO/noia/18NYdJdrbPBAkFfySqj
         PhaA==
X-Gm-Message-State: AOJu0Yw8kvMdtZmoL0CwbBBcuVrvZnPjI/Tb0d7ftM3C068SApAcbpMq
	o3KqBNQDwJnH4a2fpXnT0Pve9uvl2tugqhHF/vmqohORZPVqT1YvdhXkJPtazw==
X-Gm-Gg: ASbGnctX4r4WWwO3SpkI/ISfrd1KFZFxvDik/lkQ6Vf68O6AckLuTxiGxyFsalumoO0
	p7TmUXd2MbKsM2nvXX1erzHDCI8yxoABTUxzJg92qXTCqg0/DAbFpsK4+6OVWP5wbs3JVDyqwLb
	83oHUDjlxFBDLFofVah4LOQGAKfvEWrG+udeoXAD3h2VHYwiLljKE54Fw/z5Ni9S7nUouhFdgI/
	XZf99gEmvNwUHYZrwcOymzKcdEGW3CAt/FU/fCLTPp5fsNNzAQjgQ0zs3IQP4ahHFwi9w9C7oUB
	5sLFKW4FE+Goh8kTWQGDyJ+7s4iuRv5ZLvumbGFi9C3RCLGxCRTC2Jn0Uvha8GE5rZoMETBX1aC
	Wjdrr8MPks3F08OM=
X-Google-Smtp-Source: AGHT+IFlZLMNZjeFkVTiwgTwda6SCHkGlT6agGR2hCaM0D+vD/QkHWmJjPTJb4KSChD8k9LY2yKxJA==
X-Received: by 2002:a17:90b:2ec7:b0:311:ef19:824d with SMTP id 98e67ed59e1d1-31c9f435537mr13505872a91.2.1752829984650;
        Fri, 18 Jul 2025 02:13:04 -0700 (PDT)
Received: from fedora ([240d:1a:3a7:a400:9a57:aa11:487a:b54f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3f448c0sm879794a91.38.2025.07.18.02.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 02:13:04 -0700 (PDT)
From: Ryosuke Saito <raitosyo@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: ryosuke.saito@linaro.org
Subject: [meta-virtualization][PATCH] tini: Fix build error with CMake 4+
Date: Fri, 18 Jul 2025 18:12:53 +0900
Message-ID: <20250718091253.829595-1-raitosyo@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 18 Jul 2025 09:13:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9321

From: Ryosuke Saito <ryosuke.saito@linaro.org>

Backport patches from https://github.com/krallin/tini to resolve the
build error with CMake 4.0 and later.

- 0001-chore-bump-minimum-CMake-to-2.8.12.patch
- 0001-chore-allow-CMake-though-to-3.10.patch

Signed-off-by: Ryosuke Saito <ryosuke.saito@linaro.org>
---
 ...001-chore-allow-CMake-though-to-3.10.patch | 39 +++++++++++++++++++
 ...1-chore-bump-minimum-CMake-to-2.8.12.patch | 29 ++++++++++++++
 recipes-containers/tini/tini_0.19.0.bb        |  2 +
 3 files changed, 70 insertions(+)
 create mode 100644 recipes-containers/tini/tini/0001-chore-allow-CMake-though-to-3.10.patch
 create mode 100644 recipes-containers/tini/tini/0001-chore-bump-minimum-CMake-to-2.8.12.patch

diff --git a/recipes-containers/tini/tini/0001-chore-allow-CMake-though-to-3.10.patch b/recipes-containers/tini/tini/0001-chore-allow-CMake-though-to-3.10.patch
new file mode 100644
index 000000000000..faea9fb647f9
--- /dev/null
+++ b/recipes-containers/tini/tini/0001-chore-allow-CMake-though-to-3.10.patch
@@ -0,0 +1,39 @@
+From bb775aa14cc5072cf687fd7f4edd44df62c06b1d Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Fri, 28 Mar 2025 19:10:02 +1100
+Subject: [PATCH] chore: allow CMake though to 3.10
+
+This is allows the build with cmake-4.0.0 without deprecation warnings.
+
+use min...max syntax to allow build with newer cmake.
+ref: https://cmake.org/cmake/help/latest/command/cmake_minimum_required.html
+
+Fixes:
+CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+  to tell CMake that the project requires at least <min> but has been updated
+  to work with policies introduced by <max> or earlier.
+
+  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+
+Upstream-Status: Backport [https://github.com/krallin/tini/commit/071c715e376e9ee0ac1a196fe8c38bcb61ad385c]
+Signed-off-by: Ryosuke Saito <ryosuke.saito@linaro.org>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9b06fc13f31d..2e5390b84967 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required (VERSION 2.8.12)
++cmake_minimum_required (VERSION 2.8.12...3.10)
+ project (tini C)
+ 
+ # Config
+-- 
+2.34.1
+
diff --git a/recipes-containers/tini/tini/0001-chore-bump-minimum-CMake-to-2.8.12.patch b/recipes-containers/tini/tini/0001-chore-bump-minimum-CMake-to-2.8.12.patch
new file mode 100644
index 000000000000..ec03f7ff16b2
--- /dev/null
+++ b/recipes-containers/tini/tini/0001-chore-bump-minimum-CMake-to-2.8.12.patch
@@ -0,0 +1,29 @@
+From 0a5449a61b64938354db6efae8465d530d824d37 Mon Sep 17 00:00:00 2001
+From: Bjorn Neergaard <bneergaard@mirantis.com>
+Date: Fri, 27 Jan 2023 08:07:51 -0700
+Subject: [PATCH] chore: bump minimum CMake to 2.8.12
+
+This is both the last version supported by current CMake, and the
+version in use on Enterprise Linux 7.
+
+Signed-off-by: Bjorn Neergaard <bneergaard@mirantis.com>
+
+Upstream-Status: Backport [https://github.com/krallin/tini/commit/0b44d3665869e46ccbac7414241b8256d6234dc4]
+Signed-off-by: Ryosuke Saito <ryosuke.saito@linaro.org>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 4a6cab12fc25..9b06fc13f31d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required (VERSION 2.8.0)
++cmake_minimum_required (VERSION 2.8.12)
+ project (tini C)
+ 
+ # Config
+-- 
+2.34.1
+
diff --git a/recipes-containers/tini/tini_0.19.0.bb b/recipes-containers/tini/tini_0.19.0.bb
index c3ca25d07a4a..9eed4a646cba 100644
--- a/recipes-containers/tini/tini_0.19.0.bb
+++ b/recipes-containers/tini/tini_0.19.0.bb
@@ -10,6 +10,8 @@ SRC_URI = " \
   file://0001-Do-not-strip-the-output-binary-allow-yocto-to-do-thi.patch \
   file://0001-tini.c-a-function-declaration-without-a-prototype-is.patch \
   file://0001-Support-POSIX-basename-from-musl-libc.patch \
+  file://0001-chore-bump-minimum-CMake-to-2.8.12.patch \
+  file://0001-chore-allow-CMake-though-to-3.10.patch \
   "
 
 LICENSE = "MIT"
-- 
2.50.0


