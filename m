Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.11285.1621114000896337825
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 15 May 2021 14:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UGWsMo/Z;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id q5so2519257wrs.4
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 15 May 2021 14:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eewDur+oouE/zRMI+X2VZ0DkZnjDz5Cgs0Tl93qD2Qo=;
        b=UGWsMo/Zy5ZcBWpzbFYD/FmidrKzci3joH2jgSh8wOebBFjZJTI+YeVrLuIusgSADb
         hGsUcraKg6V2S/lhqHCI2AiQohtbl/WbYRFUC6thiuOzl2vXwTCpuuqD6RdpRvZMK7KD
         MBkd3BsnG8RWT7ENQ4dmeWDmmKyaiwJPYkfAFAdl4ZcDDs/y2ITqPYIv33G2pSUBIsOL
         N7G+2NRYLdngqKfq139wlU6kLnxWzSf9bt5cYwgA8W8qjOphMIgBeaZgGgJzo4uHkQpU
         kPtp3Dd+wMVyt2BICap3CsM0cleAWWmbcsqLnXDMkYO4F7CJr+KNUYeU6MNITWjGFdeY
         OeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eewDur+oouE/zRMI+X2VZ0DkZnjDz5Cgs0Tl93qD2Qo=;
        b=qY4PvmtZrrxrzX67tlAPYevUYHZKTlQoUwfp4UJkZuOB/BAdquETG1HeD8R27WqW+v
         9fzjLwJNEIZ1AwjmRUlNEhaTe2b6mf0qaWuaX0htYxsmrtn5/iLmqE8tYJuFqMovA9PR
         rL5bw9AugWqX3AgET0bvofQ7MS9usnaXvuJJaZX5pz0unYfa+nWRsoIzCD9hmRA3+gOk
         QVz8GdBqKePzhM3Npz84wch6sQzYuMr9Gqgnf6nHuaTDOKrCgsReZEq/yAx3fGUqbY63
         dxMM+ItP7LuFpAJdvEWeTQvHLVXmOajymvF8hvWhS1UUFCnoMSNuzw8BXQBu0yzt8Bqp
         bWuQ==
X-Gm-Message-State: AOAM532Qc5ieqvYdB50DDqYQK5xKAmv++cUAA1rNOI1h3TkGGWXClX5K
	TlKDCL1tgq0WgooEpdkBv4tklEivPiE=
X-Google-Smtp-Source: ABdhPJz/Nhpek+YsgJ0fyzRhkBcd4uDjI7ePWrk2NtO4RDq2ZEtLoYR/7XvnLl/S49j0PkiauFw05w==
X-Received: by 2002:a5d:4003:: with SMTP id n3mr15702500wrp.173.1621113999420;
        Sat, 15 May 2021 14:26:39 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a17sm2556039wrt.53.2021.05.15.14.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 14:26:38 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] libvirt: backport patch to fix compatibility with Meson-0.58
Date: Sat, 15 May 2021 23:25:10 +0200
Message-Id: <20210515212510.47256-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...on-Fix-compatibility-with-Meson-0.58.patch | 48 +++++++++++++++++++
 recipes-extended/libvirt/libvirt_7.2.0.bb     |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/0002-meson-Fix-compatibility-with-Meson-0.58.patch

diff --git a/recipes-extended/libvirt/libvirt/0002-meson-Fix-compatibility-with-Meson-0.58.patch b/recipes-extended/libvirt/libvirt/0002-meson-Fix-compatibility-with-Meson-0.58.patch
new file mode 100644
index 0000000..3201eed
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/0002-meson-Fix-compatibility-with-Meson-0.58.patch
@@ -0,0 +1,48 @@
+From c607266619c5ab78ad5d4179b3ea93cfb6348391 Mon Sep 17 00:00:00 2001
+From: Andrea Bolognani <abologna@redhat.com>
+Date: Mon, 3 May 2021 09:06:34 +0200
+Subject: [PATCH] meson: Fix compatibility with Meson 0.58
+
+Builds failed with
+
+  tests/meson.build:690:0: ERROR: List item must be one
+  of <class 'str'>, not <class 'list'>
+
+before this change.
+
+https://gitlab.com/libvirt/libvirt/-/issues/158
+
+Upstream-Status: Backport [https://gitlab.com/libvirt/libvirt/-/commit/c607266619c5ab78ad5d4179b3ea93cfb6348391]
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Signed-off-by: Andrea Bolognani <abologna@redhat.com>
+Reviewed-by: Peter Krempa <pkrempa@redhat.com>
+Reviewed-by: Pavel Hrdina <phrdina@redhat.com>
+---
+ tests/meson.build | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tests/meson.build b/tests/meson.build
+index 05c3e90195..9900983d0c 100644
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -687,12 +687,12 @@ foreach name : test_scripts
+   test(name, script, env: tests_env)
+ endforeach
+ 
++testenv = runutf8
++testenv += 'VIR_TEST_FILE_ACCESS=1'
++
+ add_test_setup(
+   'access',
+-  env: [
+-    'VIR_TEST_FILE_ACCESS=1',
+-    runutf8,
+-  ],
++  env: testenv,
+   exe_wrapper: [ python3_prog, check_file_access_prog.path() ],
+ )
+ 
+-- 
+GitLab
+
diff --git a/recipes-extended/libvirt/libvirt_7.2.0.bb b/recipes-extended/libvirt/libvirt_7.2.0.bb
index 24748ef..b569953 100644
--- a/recipes-extended/libvirt/libvirt_7.2.0.bb
+++ b/recipes-extended/libvirt/libvirt_7.2.0.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://dnsmasq.conf \
            file://hook_support.py \
            file://gnutls-helper.py \
+           file://0002-meson-Fix-compatibility-with-Meson-0.58.patch \
           "
 
 SRC_URI[libvirt.md5sum] = "92044b629216e44adce63224970a54a3"
-- 
2.30.2

