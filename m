Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web12.2939.1604099709550745827
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 30 Oct 2020 16:15:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=CXLKlqHc;
 spf=pass (domain: foundries.io, ip: 209.85.222.171, mailfrom: ricardo@foundries.io)
Received: by mail-qk1-f171.google.com with SMTP id 140so6518190qko.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 30 Oct 2020 16:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fJIGHCF6XJaNDHMFIWxpGHGXB6kYxbnSSK6uKbGhbog=;
        b=CXLKlqHcKOkB7yIA/ZDSV3DgXNBQ0iclgZN09sB6i9x1RQnsFosKS3xKTVGql+q7xu
         UObYjkHO5XvHOlWX/gr5mhkpXj0o73eEbpbkTjMD1CYCVP9pl1YnpTYuyU3vQ89t4D7B
         n6JzZ3FxIu5pF7E6Wl3LPn7Z+5vKH3fHbDWCYP1jfime446Ti84GbQ+TMqS2rLRgu0FM
         kD2fzQaj7XxsT+KLp6lB5UqUIq25+wi7KGxHK0Q1WuHY7tGauvo/xUiDdLT8x9YMIgbt
         chEVHUvxrS524JAy87C7p9UHCjSaBp1dhW2BBMmuKmU/yF5pvFcnJLIRXGqtl3y2SXpA
         iy1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fJIGHCF6XJaNDHMFIWxpGHGXB6kYxbnSSK6uKbGhbog=;
        b=cD3gMha4F1xZuZ1Z9YJDcH2riEltft3zVOwHqgK8/dSA4M+oMKkdFGPzvziA402+xH
         mDIplk4hMRVJQbmmiPJEqsfhyZPCtvTZbbmHFDyLdOKpp1Xd1TCd34+hSuVsl6u+X4LW
         moWo5i1mJwHFYAQSdJNwkGX1KMdCMEFcVKs7lgXxDBXvfO6goNTWAnPABXJIkCRKa8DK
         9SpfwRsFhqgJjwmXXjVSrvvL7tNQsNYm4M9KM0GmHgGavoaELWTNvOMCzVp4bNzcehl1
         fvxVestyw97hQf/rlL1PRYqBATavFLOXv5KxSFh40AnUcMrxeWvsMcPmdPfVteQMkuBc
         AvNg==
X-Gm-Message-State: AOAM531OAocOtISJYGqkyCQdJQzc2r0BSY1oBKEjU8XIIwgBr0oS3e2r
	O65JLmxavLvNljiVxRuEI25oqCAsk3Am
X-Google-Smtp-Source: ABdhPJzVbnxDI9Uczez/t67Xdj9q7+95ljkgDVCt2KS5Ya9T6T/SqpeVscyVpejm3Ze0YGnEs9EDvA==
X-Received: by 2002:a05:620a:201b:: with SMTP id c27mr4539246qka.279.1604099708231;
        Fri, 30 Oct 2020 16:15:08 -0700 (PDT)
Return-Path: <ricardo@foundries.io>
Received: from localhost.localdomain ([2804:7f5:f480:bcdd:ddb5:2334:2f12:9430])
        by smtp.gmail.com with ESMTPSA id o8sm552776qtm.9.2020.10.30.16.15.07
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 16:15:07 -0700 (PDT)
From: "Ricardo Salveti" <ricardo@foundries.io>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH 2/2] python3-docker-compose: upgrade 1.26.0 to 1.27.4
Date: Fri, 30 Oct 2020 20:14:44 -0300
Message-Id: <20201030231444.26695-2-ricardo@foundries.io>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201030231444.26695-1-ricardo@foundries.io>
References: <20201030231444.26695-1-ricardo@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Release notes for 1.27.4:
- Bugs
  - Remove path checks for bind mounts
  - Fix port rendering to output long form syntax for non-v1
  - Add protocol to the docker socket address

Release notes for 1.27.3:
- Bugs
  - Merged max_replicas_per_node on docker-compose config.
  - Fixed depends_on serialization on docker-compose config.
  - Fixed scaling when some containers are not running on docker-compose
    up.
  - Enabled relative paths for driver_opts.device for local driver.
  - Allowed strings for cpus fields.

Release notes for 1.27.2:
- Bugs
  - Fix bug on docker-compose run container attach

Release notes for 1.27.1:
- Bugs
  - Fix compose run when service.scale is specified
  - Allow driver property for external networks as temporary workaround
    for swarm network propagation issue
  - Pin new internal schema version to 3.9 as the default
  - Preserve the version when configured in the compose file

Release notes for 1.27.0:
- Features
  - Merge 2.x and 3.x compose formats and align with COMPOSE_SPEC schema
  - Implement service mode for ipc
  - Pass COMPOSE_PROJECT_NAME environment variable in container mode
  - Make run behave in the same way as up
  - Use docker build on docker-compose run when COMPOSE_DOCKER_CLI_BUILD
    environment variable is set
  - Use docker-py default API version for engine queries (auto)
  - Parse network_mode on build
- Bugs
  - Ignore build context path validation when building is not required
  - Fix float to bytes conversion via docker-py bump to 4.3.1
  - Fix scale bug when deploy section is set
  - Fix docker-py bump in setup.py
  - Fix experimental build failure detection
  - Fix context propagation to docker cli
- Miscellaneous
  - Drop support for Python 2.7
  - Add script for docs syncronization
  - Bump docker-py to 4.3.1
  - Bump tox to 3.19.0
  - Bump virtualenv to 20.0.30

Release notes for 1.26.2:
- Bugs
  - Enforce docker-py 4.2.2 as minimum version when installing with pip

Release notes for 1.26.1:
- Features
  - Bump docker-py from 4.2.1 to 4.2.2
- Bugs
  - Enforce docker-py 4.2.1 as minimum version when installing with pip
  - Fix context load for non-docker endpoints

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 ...-remove-maximum-version-requirements.patch | 25 ++++++++-----------
 ....0.bb => python3-docker-compose_1.27.4.bb} |  4 +--
 2 files changed, 13 insertions(+), 16 deletions(-)
 rename recipes-containers/docker-compose/{python3-docker-compose_1.26.0.bb => python3-docker-compose_1.27.4.bb} (88%)

diff --git a/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch b/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch
index f517d05..2c25f69 100644
--- a/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch
+++ b/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch
@@ -1,4 +1,4 @@
-From 1d358acd46c9ca71d848fca8c2d677414257f247 Mon Sep 17 00:00:00 2001
+From e3aca6421e003d03d119e69bf3d6b30bb5c662c9 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Fri, 22 Nov 2019 09:24:58 +0800
 Subject: [PATCH] setup.py: remove maximum version requirements
@@ -11,14 +11,14 @@ Upstream-Status: Inappropriate [OE Specific]
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 Signed-off-by: Ming Liu <liu.ming50@gmail.com>
 ---
- setup.py |   26 +++++++++++++-------------
- 1 file changed, 13 insertions(+), 13 deletions(-)
+ setup.py | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 110441dc..eef28254 100644
+index e0d4340e..80ffefe5 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -30,18 +30,18 @@ def find_version(*file_paths):
+@@ -25,17 +25,17 @@ def find_version(*file_paths):
  
  
  install_requires = [
@@ -29,9 +29,8 @@ index 110441dc..eef28254 100644
 -    'texttable >= 0.9.0, < 2',
 -    'websocket-client >= 0.32.0, < 1',
 -    'distro >= 1.5.0, < 2',
--    'docker[ssh] >= 3.7.0, < 5',
+-    'docker[ssh] >= 4.3.1, < 5',
 -    'dockerpty >= 0.4.1, < 1',
--    'six >= 1.3.0, < 2',
 -    'jsonschema >= 2.5.1, < 4',
 -    'python-dotenv >= 0.13.0, < 1',
 +    'cached-property >= 1.2.0',
@@ -41,24 +40,22 @@ index 110441dc..eef28254 100644
 +    'texttable >= 0.9.0',
 +    'websocket-client >= 0.32.0',
 +    'distro >= 1.5.0',
-+    'docker[ssh] >= 3.7.0',
++    'docker[ssh] >= 4.3.1',
 +    'dockerpty >= 0.4.1',
-+    'six >= 1.3.0',
 +    'jsonschema >= 2.5.1',
 +    'python-dotenv >= 0.13.0',
  ]
  
  
-@@ -61,7 +61,7 @@ extras_require = {
-     ':python_version < "3.3"': ['backports.shutil_get_terminal_size == 1.0.0',
-                                 'ipaddress >= 1.0.16, < 2'],
+@@ -51,7 +51,7 @@ if sys.version_info[:2] < (3, 4):
+ extras_require = {
+     ':python_version < "3.5"': ['backports.ssl_match_hostname >= 3.5, < 4'],
      ':sys_platform == "win32"': ['colorama >= 0.4, < 1'],
 -    'socks': ['PySocks >= 1.5.6, != 1.5.7, < 2'],
 +    'socks': ['PySocks >= 1.5.6, != 1.5.7'],
      'tests': tests_require,
  }
  
- 
 -- 
-2.25.0
+2.28.0
 
diff --git a/recipes-containers/docker-compose/python3-docker-compose_1.26.0.bb b/recipes-containers/docker-compose/python3-docker-compose_1.27.4.bb
similarity index 88%
rename from recipes-containers/docker-compose/python3-docker-compose_1.26.0.bb
rename to recipes-containers/docker-compose/python3-docker-compose_1.27.4.bb
index 37c62e8..1096d31 100644
--- a/recipes-containers/docker-compose/python3-docker-compose_1.26.0.bb
+++ b/recipes-containers/docker-compose/python3-docker-compose_1.27.4.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "f7d54de5db1f17322c09db8157bd160f"
-SRC_URI[sha256sum] = "7e836102d139aca667d6af53f0f4d942c9459ec24d6dd4f0203d74359b0fd311"
+SRC_URI[md5sum] = "6c25d3b92596dc529edc337cc837eae1"
+SRC_URI[sha256sum] = "5a5690f24c27d4b43dcbe6b3fae91ba680713208e99ee863352b3bae37bcaa83"
 
 SRC_URI += "file://0001-setup.py-remove-maximum-version-requirements.patch \
             file://0001-setup.py-import-fastentrypoints.patch \
-- 
2.28.0

