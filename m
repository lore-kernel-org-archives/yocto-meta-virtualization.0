Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 212F9C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 08:49:34 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.40288.1702889371093496299
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 00:49:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=STzknVvo;
 spf=pass (domain: mvista.com, ip: 209.85.210.173, mailfrom: vkumbhar@mvista.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6d267461249so1170521b3a.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 18 Dec 2023 00:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1702889370; x=1703494170; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hMKvCY/ACdeniC8s1ISWx9APL5D87K6sL/E2J3g8xn8=;
        b=STzknVvob4dAF6BidjTonkuH7P8jKtTU5IPOrXFJOwu67pv/u3BISdRBxT5Xp50TC8
         j/Xl8he26RM/r4gwy2Jp0/8qimFUOVkGzCyexHm6sF6ru4h7DMCiI9D69UtTPexLfrzV
         H5AGsTYFOPSxjUmYx/2Q26kFiCv8VBOiBCcsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702889370; x=1703494170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMKvCY/ACdeniC8s1ISWx9APL5D87K6sL/E2J3g8xn8=;
        b=unyry+3er96JDtTAQbPrYPs7bBfw3IXNm4pk83eE72lKjc26nbZNWldxVDG+ROS/Kt
         9/3rAFcoe17JruX3m5dmQTYqZZNl0wG4OXCqoN2/7ndNHFxJ9LhP93pt5ffGoqkp8MWU
         3LiaEzZDTHaOqa5RxW29RZuZ3pAX4xkIA9Vtu2I4Li1LhQsIomylrJGZFPVYBps8SZbI
         4VOd08umVvsEMth9GTrHi7SzIqgIuajSKADig4/XozDysiftz+Jt2jWp60onl7iIb0aV
         RzRtSSupb3MZEUtJmWjthCCtarI9NgLrU0XQ6RWANMN9NnmK6JqpKu+npKuIkGh2hb6h
         5HQw==
X-Gm-Message-State: AOJu0YwCKE1mwkfsjiasUq/tB7tAHVyQ5RhpDUED3cmFG9k5/4npGzND
	xDiObFz3ahKONuU7NxyNSzSGxsS++xKa1ru9/X4=
X-Google-Smtp-Source: AGHT+IFdS9BO8NHGx/BPnZjEJTSvynR5jkgPYatYNkCuIm8FE8nM64RvolNaAqLqTQLb5MScTjuUFw==
X-Received: by 2002:a05:6a00:218f:b0:6cb:6c9b:8892 with SMTP id h15-20020a056a00218f00b006cb6c9b8892mr7407207pfi.29.1702889369782;
        Mon, 18 Dec 2023 00:49:29 -0800 (PST)
Received: from localhost.localdomain ([115.96.163.219])
        by smtp.gmail.com with ESMTPSA id fn6-20020a056a002fc600b006d838632671sm831835pfb.101.2023.12.18.00.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 00:49:29 -0800 (PST)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [meta-virtualization][PATCH] cloud-init: fix CVE-2023-1786 sensitive data could be exposed in logs
Date: Mon, 18 Dec 2023 14:19:19 +0530
Message-Id: <20231218084919.2800062-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 18 Dec 2023 08:49:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8511

Upstream-Status: Backport from https://github.com/canonical/cloud-init/commit/a378b7e4f47375458651c0972e7cd813f6fe0a6b

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../cloud-init/cloud-init/CVE-2023-1786.patch | 294 ++++++++++++++++++
 .../cloud-init/cloud-init_21.4.bb             |   1 +
 2 files changed, 295 insertions(+)
 create mode 100644 recipes-extended/cloud-init/cloud-init/CVE-2023-1786.patch

diff --git a/recipes-extended/cloud-init/cloud-init/CVE-2023-1786.patch b/recipes-extended/cloud-init/cloud-init/CVE-2023-1786.patch
new file mode 100644
index 00000000..425edd97
--- /dev/null
+++ b/recipes-extended/cloud-init/cloud-init/CVE-2023-1786.patch
@@ -0,0 +1,294 @@
+From a378b7e4f47375458651c0972e7cd813f6fe0a6b Mon Sep 17 00:00:00 2001
+From: James Falcon <james.falcon@canonical.com>
+Date: Wed, 26 Apr 2023 15:11:55 -0500
+Subject: [PATCH] Make user/vendor data sensitive and remove log permissions
+(#2144)
+
+Because user data and vendor data may contain sensitive information,
+this commit ensures that any user data or vendor data written to
+instance-data.json gets redacted and is only available to root user.
+
+Also, modify the permissions of cloud-init.log to be 640, so that
+sensitive data leaked to the log isn't world readable.
+Additionally, remove the logging of user data and vendor data to
+cloud-init.log from the Vultr datasource.
+
+LP: #2013967
+CVE: CVE-2023-1786
+
+Upstream-Status: Backport [https://github.com/canonical/cloud-init/commit/a378b7e4f47375458651c0972e7cd813f6fe0a6b]
+CVE: CVE-2023-1786
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ cloudinit/sources/DataSourceLXD.py   |  8 ++++++--
+ cloudinit/sources/DataSourceVultr.py | 14 ++++++--------
+ cloudinit/sources/__init__.py        | 28 +++++++++++++++++++++++++---
+ cloudinit/stages.py                  |  4 +++-
+ tests/unittests/sources/test_init.py | 27 ++++++++++++++++++++++++++-
+ tests/unittests/test_stages.py       | 16 +++++++++-------
+ 6 files changed, 75 insertions(+), 22 deletions(-)
+
+diff --git a/cloudinit/sources/DataSourceLXD.py b/cloudinit/sources/DataSourceLXD.py
+index 071ea87cf..ea81ccb42 100644
+--- a/cloudinit/sources/DataSourceLXD.py
++++ b/cloudinit/sources/DataSourceLXD.py
+@@ -13,6 +13,7 @@ import os
+ import socket
+ import stat
+ from json.decoder import JSONDecodeError
++from typing import Any, Dict, List, Optional, Tuple, Union, cas
+
+ import requests
+ from requests.adapters import HTTPAdapter
+@@ -170,11 +171,14 @@ class DataSourceLXD(sources.DataSource):
+     _network_config = sources.UNSET
+     _crawled_metadata = sources.UNSET
+
+-    sensitive_metadata_keys = (
+-        "merged_cfg",
++    sensitive_metadata_keys: Tuple[
++        str, ...
++    ] = sources.DataSource.sensitive_metadata_keys + (
+         "user.meta-data",
+         "user.vendor-data",
+         "user.user-data",
++        "cloud-init.user-data",
++        "cloud-init.vendor-data",
+     )
+
+     def _is_platform_viable(self) -> bool:
+diff --git a/cloudinit/sources/DataSourceVultr.py b/cloudinit/sources/DataSourceVultr.py
+index 13f7c24d6..debebc0d7 100644
+--- a/cloudinit/sources/DataSourceVultr.py
++++ b/cloudinit/sources/DataSourceVultr.py
+@@ -5,6 +5,8 @@
+ # Vultr Metadata API:
+ # https://www.vultr.com/metadata/
+
++from typing import Tuple
++
+ import cloudinit.sources.helpers.vultr as vultr
+ from cloudinit import log as log
+ from cloudinit import sources, util, version
+@@ -28,6 +30,10 @@ class DataSourceVultr(sources.DataSource):
+
+     dsname = "Vultr"
+
++    sensitive_metadata_keys: Tuple[
++        str, ...
++    ] = sources.DataSource.sensitive_metadata_keys + ("startup-script",)
++
+     def __init__(self, sys_cfg, distro, paths):
+         super(DataSourceVultr, self).__init__(sys_cfg, distro, paths)
+         self.ds_cfg = util.mergemanydict(
+@@ -56,13 +62,8 @@ class DataSourceVultr(sources.DataSource):
+         self.get_datasource_data(self.metadata)
+
+         # Dump some data so diagnosing failures is manageable
+-        LOG.debug("Vultr Vendor Config:")
+-        LOG.debug(util.json_dumps(self.metadata["vendor-data"]))
+         LOG.debug("SUBID: %s", self.metadata["instance-id"])
+         LOG.debug("Hostname: %s", self.metadata["local-hostname"])
+-        if self.userdata_raw is not None:
+-            LOG.debug("User-Data:")
+-            LOG.debug(self.userdata_raw)
+
+         return True
+
+@@ -147,7 +148,4 @@ if __name__ == "__main__":
+     config = md["vendor-data"]
+     sysinfo = vultr.get_sysinfo()
+
+-    print(util.json_dumps(sysinfo))
+-    print(util.json_dumps(config))
+-
+ # vi: ts=4 expandtab
+diff --git a/cloudinit/sources/__init__.py b/cloudinit/sources/__init__.py
+index 9083f3995..8fb9d4cba 100644
+--- a/cloudinit/sources/__init__.py
++++ b/cloudinit/sources/__init__.py
+@@ -103,7 +103,10 @@ def process_instance_metadata(metadata, key_path="", sensitive_keys=()):
+             sub_key_path = key_path + "/" + key
+         else:
+             sub_key_path = key
+-        if key in sensitive_keys or sub_key_path in sensitive_keys:
++        if (
++            key.lower() in sensitive_keys
++            or sub_key_path.lower() in sensitive_keys
++        ):
+             sens_keys.append(sub_key_path)
+         if isinstance(val, str) and val.startswith("ci-b64:"):
+             base64_encoded_keys.append(sub_key_path)
+@@ -125,6 +128,12 @@ def redact_sensitive_keys(metadata, redact_value=REDACT_SENSITIVE_VALUE):
+
+     Replace any keys values listed in 'sensitive_keys' with redact_value.
+     """
++    # While 'sensitive_keys' should already sanitized to only include what
++    # is in metadata, it is possible keys will overlap. For example, if
++    # "merged_cfg" and "merged_cfg/ds/userdata" both match, it's possible that
++    # "merged_cfg" will get replaced first, meaning "merged_cfg/ds/userdata"
++    # no longer represents a valid key.
++    # Thus, we still need to do membership checks in this function.
+     if not metadata.get("sensitive_keys", []):
+         return metadata
+     md_copy = copy.deepcopy(metadata)
+@@ -132,9 +141,14 @@ def redact_sensitive_keys(metadata, redact_value=REDACT_SENSITIVE_VALUE):
+         path_parts = key_path.split("/")
+         obj = md_copy
+         for path in path_parts:
+-            if isinstance(obj[path], dict) and path != path_parts[-1]:
++            if (
++                path in obj
++                and isinstance(obj[path], dict)
++                and path != path_parts[-1]
++            ):
+                 obj = obj[path]
+-        obj[path] = redact_value
++        if path in obj:
++            obj[path] = redact_value
+     return md_copy
+
+
+@@ -237,6 +251,14 @@ class DataSource(CloudInitPickleMixin, metaclass=abc.ABCMeta):
+     sensitive_metadata_keys = (
+         "merged_cfg",
+         "security-credentials",
++        "userdata",
++        "user-data",
++        "user_data",
++        "vendordata",
++        "vendor-data",
++        # Provide ds/vendor_data to avoid redacting top-level
++        #  "vendor_data": {enabled: True}
++        "ds/vendor_data",
+     )
+
+     _ci_pkl_version = 1
+diff --git a/cloudinit/stages.py b/cloudinit/stages.py
+index b1a6bc495..85db6bec8 100644
+--- a/cloudinit/stages.py
++++ b/cloudinit/stages.py
+@@ -202,7 +202,9 @@ class Init(object):
+         util.ensure_dirs(self._initial_subdirs())
+         log_file = util.get_cfg_option_str(self.cfg, "def_log_file")
+         if log_file:
+-            util.ensure_file(log_file, mode=0o640, preserve_mode=True)
++            # At this point the log file should have already been created
++            # in the setupLogging function of log.py
++            util.ensure_file(log_file, mode=0o640, preserve_mode=False)
+             perms = self.cfg.get("syslog_fix_perms")
+             if not perms:
+                 perms = {}
+diff --git a/tests/unittests/sources/test_init.py b/tests/unittests/sources/test_init.py
+index 745a7fa6b..6eebb512d 100644
+--- a/tests/unittests/sources/test_init.py
++++ b/tests/unittests/sources/test_init.py
+@@ -442,12 +442,24 @@ class TestDataSource(CiTestCase):
+                         "cred2": "othersekret",
+                     }
+                 },
++                "someother": {
++                    "nested": {
++                        "userData": "HIDE ME",
++                    }
++                },
++                "VENDOR-DAta": "HIDE ME TOO",
+             },
+         )
+         self.assertCountEqual(
+             (
+                 "merged_cfg",
+                 "security-credentials",
++                "userdata",
++                "user-data",
++                "user_data",
++                "vendordata",
++                "vendor-data",
++                "ds/vendor_data",
+             ),
+             datasource.sensitive_metadata_keys,
+         )
+@@ -474,7 +486,9 @@ class TestDataSource(CiTestCase):
+             "base64_encoded_keys": [],
+             "merged_cfg": REDACT_SENSITIVE_VALUE,
+             "sensitive_keys": [
++                "ds/meta_data/VENDOR-DAta",
+                 "ds/meta_data/some/security-credentials",
++                "ds/meta_data/someother/nested/userData",
+                 "merged_cfg",
+             ],
+             "sys_info": sys_info,
+@@ -484,6 +498,7 @@ class TestDataSource(CiTestCase):
+                 "availability_zone": "myaz",
+                 "cloud-name": "subclasscloudname",
+                 "cloud_name": "subclasscloudname",
++                "cloud_id": "subclasscloudname",
+                 "distro": "ubuntu",
+                 "distro_release": "focal",
+                 "distro_version": "20.04",
+@@ -506,14 +521,18 @@ class TestDataSource(CiTestCase):
+             "ds": {
+                 "_doc": EXPERIMENTAL_TEXT,
+                 "meta_data": {
++                    "VENDOR-DAta": REDACT_SENSITIVE_VALUE,
+                     "availability_zone": "myaz",
+                     "local-hostname": "test-subclass-hostname",
+                     "region": "myregion",
+                     "some": {"security-credentials": REDACT_SENSITIVE_VALUE},
++                    "someother": {
++                        "nested": {"userData": REDACT_SENSITIVE_VALUE}
++                    },
+                 },
+             },
+         }
+-        self.assertCountEqual(expected, redacted)
++        self.assertEqual(expected, redacted)
+         file_stat = os.stat(json_file)
+         self.assertEqual(0o644, stat.S_IMODE(file_stat.st_mode))
+
+@@ -558,6 +577,12 @@ class TestDataSource(CiTestCase):
+             (
+                 "merged_cfg",
+                 "security-credentials",
++                "userdata",
++                "user-data",
++                "user_data",
++                "vendordata",
++                "vendor-data",
++                "ds/vendor_data",
+             ),
+             datasource.sensitive_metadata_keys,
+         )
+diff --git a/tests/unittests/test_stages.py b/tests/unittests/test_stages.py
+index be1a07870..2a9593f61 100644
+--- a/tests/unittests/test_stages.py
++++ b/tests/unittests/test_stages.py
+@@ -547,17 +547,19 @@ class TestInit_InitializeFilesystem:
+         # Assert we create it 0o640  by default if it doesn't already exist
+         assert 0o640 == stat.S_IMODE(log_file.stat().mode)
+
+-    def test_existing_file_permissions_are_not_modified(self, init, tmpdir):
+-        """If the log file already exists, we should not modify its permissions
+-
++    def test_existing_file_permissions(self, init, tmpdir):
++        """Test file permissions are set as expected.
++        CIS Hardening requires 640 permissions. These permissions are
++        currently hardcoded on every boot, but if there's ever a reason
++        to change this, we need to then ensure that they
++        are *not* set every boot.
+         See https://bugs.launchpad.net/cloud-init/+bug/1900837.
+         """
+-        # Use a mode that will never be made the default so this test will
+-        # always be valid
+-        mode = 0o606
+         log_file = tmpdir.join("cloud-init.log")
+         log_file.ensure()
+-        log_file.chmod(mode)
++        # Use a mode that will never be made the default so this test will
++        # always be valid
++        log_file.chmod(0o606)
+         init._cfg = {"def_log_file": str(log_file)}
+
+         init._initialize_filesystem()
+--
+2.35.7
diff --git a/recipes-extended/cloud-init/cloud-init_21.4.bb b/recipes-extended/cloud-init/cloud-init_21.4.bb
index 5cb62272..b9573420 100644
--- a/recipes-extended/cloud-init/cloud-init_21.4.bb
+++ b/recipes-extended/cloud-init/cloud-init_21.4.bb
@@ -9,6 +9,7 @@ SRC_URI = "git://github.com/canonical/cloud-init;branch=main;protocol=https \
     file://cloud-init-source-local-lsb-functions.patch \
     file://0001-setup.py-check-for-install-anywhere-in-args.patch \
     file://0001-setup.py-respect-udevdir-variable.patch \
+    file://CVE-2023-1786.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.39.3


