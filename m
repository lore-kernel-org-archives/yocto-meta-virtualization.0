Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.1002.1594232315594634384
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Jul 2020 11:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cljrDNgO;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: paulohefagundes@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id ls15so899225pjb.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Jul 2020 11:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C+wpzJrp4LAnYM8YX+w5n6yNW5mkob+UN/z6cCXEsYM=;
        b=cljrDNgOe16GSwuYrlP41pSzf96tlA2HW8oLv9KVe06mgOqW0ScsLPhVLRyt6XRfUa
         wRQthXKkvUQx16Q3XCa7XUAsduIpIYXcoEbgSzx0Jg3tLfA+z+sZjSYbLmKnqp7IRtgH
         YSVArHm9tTiLd4ry38YHuQltE8jGYC+8LHYhSaP0LwidRkF8wWhkzVyKfqyExuaJ/eZX
         qexCsrc6rEe3rLFX/Gcx38l9BiHCEbr1aH8pfryQHF2M6Lo4NpLdxCYv/qJ6y/E2+0Yj
         rFkSqVfL+7EDeUluTnVjlSwmL7R0Ry/bgSgmiHG28LENTABzD1BiDPXd6t7tXAMu/c7z
         jbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C+wpzJrp4LAnYM8YX+w5n6yNW5mkob+UN/z6cCXEsYM=;
        b=nSZmwNXirprlClvZW7BZQVHedpU4Hgx6Grl46GiveCPsKDgLZUpQZFfYJzwwSPHNMx
         g6xQb+O8yqkodNxfw3P3GXiEpExs4iF3gRXkNwZXZoU8lmdDWdSLAQnH250R7fVpmZHb
         NwYI2b/AB5wMA3dyEDpCAqjsAba+wjJ2dCSPETSi27Ks9ABSIxZuR1f2jkFeOWCUFSwp
         iXLpAt9lEoQBYcnxeYEDfqtQuDtXm37qzaHIKsdvIvKM8bTke6RVbZ403hS/bXpq+ijg
         QZMWFLgaUv1aqFa1HFwag7nM3L6eOEkaAiCVx2oxjLod8VzIAZANk/wvW8NqiVlv8ZVw
         8M0g==
X-Gm-Message-State: AOAM530suHH6O8/5nm/Td37fkyngjHnnJbwgO+5tFEJR3S9cseZEEY1P
	JukeOcFO+SbhQFZ5hpYb/G75+hJd
X-Google-Smtp-Source: ABdhPJwIHSdzAzCbW32zgbv8cCQxrqjDQMh7zYEQYOawfYrnVtUjNPNXz/QKmjH+M5vN7M8/TPWMRw==
X-Received: by 2002:a17:902:bcc1:: with SMTP id o1mr49898939pls.246.1594232314619;
        Wed, 08 Jul 2020 11:18:34 -0700 (PDT)
Return-Path: <paulohefagundes@gmail.com>
Received: from daemon.og.opengear.com (c-24-11-33-45.hsd1.ut.comcast.net. [24.11.33.45])
        by smtp.gmail.com with ESMTPSA id d190sm421004pfd.199.2020.07.08.11.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 11:18:33 -0700 (PDT)
From: "Fagundes, Paulo" <paulohefagundes@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Paulo Fagundes <paulohefagundes@gmail.com>
Subject: [meta-virtualization][m-c-s][PATCH] salt: bump 3000 -> 3001
Date: Wed,  8 Jul 2020 12:16:26 -0600
Message-Id: <20200708181625.81840-1-paulohefagundes@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Paulo Fagundes <paulohefagundes@gmail.com>
---
 .../salt/set_python_location_hashbang.patch   | 158 ------------------
 .../salt/{salt_3000.bb => salt_3001.bb}       |   7 +-
 2 files changed, 3 insertions(+), 162 deletions(-)
 delete mode 100644 meta-openstack/recipes-support/salt/salt/set_python_location_hashbang.patch
 rename meta-openstack/recipes-support/salt/{salt_3000.bb => salt_3001.bb} (97%)

diff --git a/meta-openstack/recipes-support/salt/salt/set_python_location_hashbang.patch b/meta-openstack/recipes-support/salt/salt/set_python_location_hashbang.patch
deleted file mode 100644
index 76d6f41..0000000
--- a/meta-openstack/recipes-support/salt/salt/set_python_location_hashbang.patch
+++ /dev/null
@@ -1,158 +0,0 @@
-Upstream-Status: Pending
-
-# The Salt SysV scripts require that the process name of the salt
-# components have the form "salt-<component>".
-# The current python shebangs on the salt components scripts spwans
-# processes that are generically named python. Changed shebang so
-# process names will be identifiable by the init scripts.
-
-diff --git a/scripts/salt b/scripts/salt
-index 1a6d6b4d0c..0408ad07b2 100755
---- a/scripts/salt
-+++ b/scripts/salt
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- '''
- Publish commands to the salt system from the command line on the master.
- '''
-diff --git a/scripts/salt-api b/scripts/salt-api
-index 6f028bacb6..7a51117822 100755
---- a/scripts/salt-api
-+++ b/scripts/salt-api
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
-
- # Import salt libs
- from salt.scripts import salt_api
-diff --git a/scripts/salt-call b/scripts/salt-call
-index 5b8a8f3935..9ddda9428d 100755
---- a/scripts/salt-call
-+++ b/scripts/salt-call
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- '''
- Directly call a salt command in the modules, does not require a running salt
- minion to run.
-diff --git a/scripts/salt-cloud b/scripts/salt-cloud
-index e977b68179..01c593881c 100755
---- a/scripts/salt-cloud
-+++ b/scripts/salt-cloud
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- '''
- Publish commands to the salt system from the command line on the master.
- '''
-diff --git a/scripts/salt-cp b/scripts/salt-cp
-index 3da660d137..dcc3f11554 100755
---- a/scripts/salt-cp
-+++ b/scripts/salt-cp
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- '''
- Publish commands to the salt system from the command line on the master.
- '''
-diff --git a/scripts/salt-extend b/scripts/salt-extend
-index 5385a7b6a9..b01c584bb4 100755
---- a/scripts/salt-extend
-+++ b/scripts/salt-extend
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- '''
- Quickstart for creating an/or extending the functionality of your SaltStack installation
-
-diff --git a/scripts/salt-key b/scripts/salt-key
-index cb26dfd5a6..596b202a3f 100755
---- a/scripts/salt-key
-+++ b/scripts/salt-key
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- '''
- Manage the authentication keys with salt-key
- '''
-diff --git a/scripts/salt-master b/scripts/salt-master
-index b4323bd532..52bb47dc47 100755
---- a/scripts/salt-master
-+++ b/scripts/salt-master
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- '''
- Start the salt-master
- '''
-diff --git a/scripts/salt-minion b/scripts/salt-minion
-index 74a9fa1d67..4a23ed9122 100755
---- a/scripts/salt-minion
-+++ b/scripts/salt-minion
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- '''
- This script is used to kick off a salt minion daemon
- '''
-diff --git a/scripts/salt-proxy b/scripts/salt-proxy
-index e921e6590b..443774ef85 100755
---- a/scripts/salt-proxy
-+++ b/scripts/salt-proxy
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- # -*- coding: utf-8 -*-
- '''
- This script is used to kick off a salt proxy minion daemon
-diff --git a/scripts/salt-run b/scripts/salt-run
-index 2b2d86554c..cfef160ab0 100755
---- a/scripts/salt-run
-+++ b/scripts/salt-run
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- '''
- Execute a salt convenience routine
- '''
-diff --git a/scripts/salt-ssh b/scripts/salt-ssh
-index 4f21baa5f4..77bb6ceb38 100755
---- a/scripts/salt-ssh
-+++ b/scripts/salt-ssh
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- '''
- Execute the salt ssh system
- '''
-diff --git a/scripts/salt-syndic b/scripts/salt-syndic
-index d6faf2df63..896bf5f3b0 100755
---- a/scripts/salt-syndic
-+++ b/scripts/salt-syndic
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- '''
- This script is used to kick off a salt syndic daemon
- '''
-diff --git a/scripts/salt-unity b/scripts/salt-unity
-index b0a2d31597..ff1fa9034c 100755
---- a/scripts/salt-unity
-+++ b/scripts/salt-unity
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
-
- from salt.scripts import salt_unity
-
-diff --git a/scripts/spm b/scripts/spm
-index 027864ee11..4d9b648b5d 100755
---- a/scripts/spm
-+++ b/scripts/spm
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- '''
- Publish commands to the salt system from the command line on the master.
-
diff --git a/meta-openstack/recipes-support/salt/salt_3000.bb b/meta-openstack/recipes-support/salt/salt_3001.bb
similarity index 97%
rename from meta-openstack/recipes-support/salt/salt_3000.bb
rename to meta-openstack/recipes-support/salt/salt_3001.bb
index c2bc8da..5140470 100644
--- a/meta-openstack/recipes-support/salt/salt_3000.bb
+++ b/meta-openstack/recipes-support/salt/salt_3001.bb
@@ -19,11 +19,10 @@ PACKAGECONFIG[zeromq] = ",,python3-pyzmq python3-pycrypto,"
 PACKAGECONFIG[tcp] = ",,python3-pycrypto"
 
 SRC_URI = "https://files.pythonhosted.org/packages/source/s/${PN}/${PN}-${PV}.tar.gz \
-           file://set_python_location_hashbang.patch \
 "
 
-SRC_URI[md5sum] = "8084ef6f2a275b627ae364b9d562b4ff"
-SRC_URI[sha256sum] = "04fbc64933b375cbbefc9576bcc65167b74d5eec7f58e64d096d67529ea66500"
+SRC_URI[md5sum] = "ae06cef7557e237a954491a069e79a25"
+SRC_URI[sha256sum] = "5ca60d1b2cc8e63db50995bd8b117914eeaf57c48ce2b3a3731ee57163adf154"
 
 
 SYSTEMD_AUTO_ENABLE_${PN}-master = "disable"
@@ -100,7 +99,7 @@ SUMMARY_${PN}-common = "shared libraries that salt requires for all packages"
 DESCRIPTION_${PN}-common ="${DESCRIPTION_COMMON} This particular package provides shared libraries that \
 salt-master, salt-minion, and salt-syndic require to function."
 RDEPENDS_${PN}-common = "python3-dateutil python3-jinja2 python3-pyyaml python3-requests (>= 1.0.0)"
-RRECOMMENDS_${PN}-common = "lsb"
+RRECOMMENDS_${PN}-common = "lsb-release"
 RSUGGESTS_${PN}-common = "python3-mako python3-git"
 RCONFLICTS_${PN}-common = "python3-mako (< 0.7.0)"
 CONFFILES_${PN}-common="${sysconfdir}/logrotate.d/${PN}"
--
2.27.0

I wasn't sure on the RRECOMMENDS for lsb since it was removed and lsb-release was created in it's place.
