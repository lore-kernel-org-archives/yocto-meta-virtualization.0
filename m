Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web09.40985.1617528384086062847
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 04 Apr 2021 02:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W/WEkHNa;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id mh7so3050775ejb.12
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 04 Apr 2021 02:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9icXzPz1sMIB8+jMAs7NTdOocUMQXzfTjlBTr3MMdhk=;
        b=W/WEkHNaO1ikmsq15MHLzbIlAfhFAESF+NqNPc0vu/GjGjRwD3OUFzqEBgdFkb68TG
         Yj0iHpAVea9dDgqkQeVjQhU4GdBuZsFz9mI84cPgvwZV4XtNvnwKUWzfqiLXBAXTMuiy
         FGWeoiUluywxZgNwpvS0EFmXkkmTtqkT6Q0Gdu72/iu6he56Ew6KtHJ3JvH+XetgChjs
         orHz7qE1MN37ci8ckVQwVIxFg4PSl8nl3JzC4Zcap7Uxy66TRwaBMxf52Eft9feOxd3Y
         vhA2bow2yf3yHTBtQryMjXnXu8YdveCNb91BvoG9ir9KPQp5uxU4JPBr5Ey9H6Wd/Ow+
         PEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9icXzPz1sMIB8+jMAs7NTdOocUMQXzfTjlBTr3MMdhk=;
        b=rEra+VM1RcrQn3sFWIjbAKwN/H8zcMEysL2jB6eqLJZz4htNRADuIppCqsEk3l/+iX
         i0p1lM0mEitQeo1Na4ShOKZV7FMJHsO+gKO7A6C+4uZ41iMP14FLrOIpZiTjq5QEFZsd
         FAOmYn5zOg5r1tS9Af7YMYbV1vY3aDO78GyRBMw69f/JryqnN5B5HYX70f/uS+vCfkSo
         9J7K4v4DyeuEHxuPXRv56eyrVwaw7WJqp1ahKuqrUWnurYAQpjsOi2s7ArVELrALah93
         rBsnQk8u/numqgRr6mf1MPN+Sps3vFKDKkBy0+1tp9e9qBMfu2gkrQHnzz1exmtQnDro
         79nA==
X-Gm-Message-State: AOAM531FMujcUfHNVOlL0syayJQ7n/fjB0nWbU9uGvxDV1fjkdwsF46o
	Ed6v0m/f0ESv5K6tw0KYkGHs3kpf4SM=
X-Google-Smtp-Source: ABdhPJyDRdcklveYprtAqIUYg7PCz4DncniPVaC3mp69yFVpcZFKfqX5tZubjhiVZr3CTsi/y3aJzw==
X-Received: by 2002:a17:906:5495:: with SMTP id r21mr23031724ejo.471.1617528382718;
        Sun, 04 Apr 2021 02:26:22 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id f19sm8301135edu.12.2021.04.04.02.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 02:26:22 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: christopher.w.clark@gmail.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH] xen: drop i686 support also from xen-tools/xen-python2
Date: Sun,  4 Apr 2021 11:26:19 +0200
Message-Id: <20210404092619.2059377-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* this commit seems no longer true for current version of xen:
  commit a0964e2044cb1ccdd4f64173658ce7602257ff48
  Author: Christopher Clark <christopher.w.clark@gmail.com>
  Date:   Tue Feb 25 16:16:00 2020 -0800

    xen, xen-tools: separate COMPATIBLE_HOST for hypervisor and tools

    The tools have broader platform compatibility than the hypervisor.

* xen-tools are failing to build for qemux86 as shown in:
  http://errors.yoctoproject.org/Errors/Details/575367/

  make[8]: Entering directory 'TOPDIR/tmp-glibc/work/core2-32-oe-linux/xen-tools/4.14+stableAUTOINC+ad844aa352-r0/git/tools/firmware/xen-dir/xen-root/xen'
  echo "*** Xen x86/32 target no longer supported!"
  *** Xen x86/32 target no longer supported!
  make[8]: Leaving directory 'TOPDIR/tmp-glibc/work/core2-32-oe-linux/xen-tools/4.14+stableAUTOINC+ad844aa352-r0/git/tools/firmware/xen-dir/xen-root/xen'
  ln -sf xen-root/xen/xen xen-shim
  ln -sf xen-root/xen/xen-syms xen-shim-syms
  ...
  install: cannot stat 'xen-dir/xen-shim': No such file or directory
  make[4]: *** [Makefile:51: install] Error 1

  revert the commit and also drop i686 from map_xen_arch

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-extended/xen/xen-arch.inc       | 3 +--
 recipes-extended/xen/xen-hypervisor.inc | 3 ---
 recipes-extended/xen/xen-python2.bb     | 3 ---
 recipes-extended/xen/xen-tools.inc      | 2 --
 recipes-extended/xen/xen.inc            | 2 ++
 5 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/recipes-extended/xen/xen-arch.inc b/recipes-extended/xen/xen-arch.inc
index fb0093e..9676045 100644
--- a/recipes-extended/xen/xen-arch.inc
+++ b/recipes-extended/xen/xen-arch.inc
@@ -8,8 +8,7 @@ def map_xen_arch(a, d):
     import re
     valid_archs = d.getVar('valid_xen_archs').split()
 
-    if   re.match("i.86", a):        return "x86_32"
-    elif re.match("x86.64", a):      return "x86_64"
+    if re.match("x86.64", a):      return "x86_64"
     elif re.match("arm.*", a):       return "arm32"
     elif re.match("aarch64.*", a):   return "arm64"
     elif a in valid_archs:           return a
diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen/xen-hypervisor.inc
index 916bd3c..d8e57e2 100644
--- a/recipes-extended/xen/xen-hypervisor.inc
+++ b/recipes-extended/xen/xen-hypervisor.inc
@@ -6,9 +6,6 @@ DESCRIPTION = "The Xen hypervisor"
 # this allows for varying the target architecture or toolchain used
 # to build the different components. eg. 32-bit tools and a 64-bit hypervisor.
 
-# The Xen hypervisor has a narrower compatible platform range than the Xen tools
-COMPATIBLE_HOST = '(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
-
 inherit deploy python3native cml1
 
 PACKAGES = " \
diff --git a/recipes-extended/xen/xen-python2.bb b/recipes-extended/xen/xen-python2.bb
index ad3c1fd..08d8e92 100644
--- a/recipes-extended/xen/xen-python2.bb
+++ b/recipes-extended/xen/xen-python2.bb
@@ -6,9 +6,6 @@ SECTION = "console/tools"
 
 SRCREV ?= "a5fcafbfbee55261853fba07149c1c795f2baf58"
 
-# The same restriction as xen-tools.inc, because of the dependency on xen-tools-xentrace from xen-tools-xentrace-format
-COMPATIBLE_HOST = 'i686-.*-linux|(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
-
 XEN_REL ?= "4.12"
 XEN_BRANCH ?= "stable-4.12"
 
diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index 722c503..35d0c58 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -1,8 +1,6 @@
 SUMMARY = "Xen hypervisor tools"
 DESCRIPTION = "Tools and utility software for the Xen hypervisor"
 
-COMPATIBLE_HOST = 'i686-.*-linux|(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
-
 inherit setuptools3 update-rc.d systemd deploy
 require xen-blktap.inc
 
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 9e8fcad..8277939 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -2,6 +2,8 @@ HOMEPAGE = "http://xen.org"
 LICENSE = "GPLv2"
 SECTION = "console/tools"
 
+COMPATIBLE_HOST = '(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
+
 inherit autotools-brokensep
 
 require xen-arch.inc
-- 
2.30.2

