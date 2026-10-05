Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98449CA5FF0
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 20:53:21 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30654.1791233597693923032
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 05 Oct 2026 13:53:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=lLPLzdPI;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20261005205314d3aaebba7d000207b0-gymweh@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20261005205314d3aaebba7d000207b0
        for <meta-virtualization@lists.yoctoproject.org>;
        Mon, 05 Oct 2026 22:53:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=SMcl8sQ7zZCGNBRVVvlgq5wJf0g4AW3sQBPQiLZum0U=;
 b=lLPLzdPIDnQPGclSsomLMkfvRDRdB3w8z7JXIlHRu9J6utV1ZYK5Esi/pX/ZREl31B2y8W
 o9J1sec4ZcGSnbZYczBvQJwwbu/emVTceiZv0gHkH1JvH48GqMeR8wGsiQXJkrVVvtjidZT9
 Rodlmk27uWeyXzX5jJVi/+AqGrxb+86urohAj4JRK3MV9XeIuQ5e1vIm7M+ApO/5jVyi3aUd
 V4mKdu+Gd33RZNDD173K3TDsklumRcuOHRDnTznMHgNgJkDU7OwxpMySpGItDv5hYAQlRZvF
 T/0bppYtPZRTa1XzbjTW8qqCyDLp+4yMCW45umeckGo5cp9k62v8GHSA==;
From: Peter Marko <peter.marko@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-virtualization][scarthgap][PATCH] crun: patch CVE-2026-47766
Date: Mon,  5 Oct 2026 22:53:00 +0200
Message-ID: <20261005205303.1224158-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 05 Oct 2026 20:53:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10108

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].
Also pick a small part of another commit which is pre-requisite for
backporting to this old version.

[1] https://security-tracker.debian.org/tracker/CVE-2026-47766

AI-Generated: GPT-6.1 Sol

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../crun/crun/CVE-2026-47766-01.patch         |  45 +++++
 .../crun/crun/CVE-2026-47766-02.patch         | 166 ++++++++++++++++++
 recipes-containers/crun/crun_git.bb           |   2 +
 3 files changed, 213 insertions(+)
 create mode 100644 recipes-containers/crun/crun/CVE-2026-47766-01.patch
 create mode 100644 recipes-containers/crun/crun/CVE-2026-47766-02.patch

diff --git a/recipes-containers/crun/crun/CVE-2026-47766-01.patch b/recipes-containers/crun/crun/CVE-2026-47766-01.patch
new file mode 100644
index 00000000..a4a57021
--- /dev/null
+++ b/recipes-containers/crun/crun/CVE-2026-47766-01.patch
@@ -0,0 +1,45 @@
+From bfa0640011165a3a70b17a29041956d6d7315008 Mon Sep 17 00:00:00 2001
+From: Erik Sjölund <erik.sjolund@gmail.com>
+Date: Thu, 6 Jun 2024 14:13:28 +0200
+Subject: [PATCH] Add more O_PATH flags
+
+Fixes: https://github.com/containers/crun/issues/1478
+
+Signed-off-by: Erik Sjölund <erik.sjolund@gmail.com>
+
+CVE: CVE-2026-47766
+Upstream-Status: Backport [https://github.com/containers/crun/commit/bfa0640011165a3a70b17a29041956d6d7315008]
+Backport only the two rootfs /dev opens needed by CVE-2026-47766.
+The unrelated cgroup, sysctl, status and utility changes are omitted.
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/libcrun/handlers/krun.c | 2 +-
+ src/libcrun/linux.c         | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/libcrun/handlers/krun.c b/src/libcrun/handlers/krun.c
+index 804a17cb..c1c870ea 100644
+--- a/src/libcrun/handlers/krun.c
++++ b/src/libcrun/handlers/krun.c
+@@ -240,7 +240,7 @@ libkrun_configure_container (void *cookie, enum handler_configure_phase phase,
+         }
+     }
+ 
+-  devfd = openat (rootfsfd, "dev", O_RDONLY | O_DIRECTORY | O_CLOEXEC);
++  devfd = openat (rootfsfd, "dev", O_PATH | O_DIRECTORY | O_CLOEXEC);
+   if (UNLIKELY (devfd < 0))
+     return crun_make_error (err, errno, "open /dev directory in `%s`", rootfs);
+ 
+diff --git a/src/libcrun/linux.c b/src/libcrun/linux.c
+index 6e17b22c..de6ccd13 100644
+--- a/src/libcrun/linux.c
++++ b/src/libcrun/linux.c
+@@ -1766,7 +1766,7 @@ create_missing_devs (libcrun_container_t *container, bool binds, libcrun_error_t *err)
+   dev_fds = get_private_data (container)->dev_fds;
+   get_private_data (container)->dev_fds = NULL;
+ 
+-  devfd = openat (rootfsfd, "dev", O_CLOEXEC | O_RDONLY | O_DIRECTORY);
++  devfd = openat (rootfsfd, "dev", O_CLOEXEC | O_PATH | O_DIRECTORY);
+   if (UNLIKELY (devfd < 0))
+     return crun_make_error (err, errno, "open /dev directory in `%s`", rootfs);
+ 
diff --git a/recipes-containers/crun/crun/CVE-2026-47766-02.patch b/recipes-containers/crun/crun/CVE-2026-47766-02.patch
new file mode 100644
index 00000000..7a6db5e9
--- /dev/null
+++ b/recipes-containers/crun/crun/CVE-2026-47766-02.patch
@@ -0,0 +1,166 @@
+From c6f338ac2e26e216ab7820b91863a0b84e608097 Mon Sep 17 00:00:00 2001
+From: JUNYI LIU <moss80199.cs05@nycu.edu.tw>
+Date: Mon, 25 May 2026 22:45:06 +0800
+Subject: [PATCH] Do not follow rootfs /dev symlinks (CVE-2026-47766)
+
+Open rootfs /dev with safe_openat before creating default devices or handler-specific devices. This keeps rootfs-controlled /dev symlinks from redirecting device setup outside the container rootfs.
+
+Add a regression test covering a rootfs /dev symlink to an outside directory and verify that the outside target is not populated or replaced.
+
+Signed-off-by: JUNYI LIU <moss80199.cs05@nycu.edu.tw>
+
+CVE: CVE-2026-47766
+Upstream-Status: Backport [https://github.com/containers/crun/commit/c6f338ac2e26e216ab7820b91863a0b84e608097]
+Retain the v1.14.3 safe_openat API's rootfs_len argument and local
+rootfsfd variable. This avoids backporting the unrelated
+* API cleanup dcf4f78b8e5eb9ab3e1cc052b28283d149cec89a
+* error-message cleanup 3649947bdd4c03640f50eb2625599bf46c9d4afd
+* rootfsfd refactoring 2e210bdce68aafcd078d996b9f954b9e0447d0cd
+Relocate the regression test and add its imports for the older test
+suite, whose skip result is 77 rather than a (77, reason) tuple.
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/libcrun/handlers/krun.c |  4 +--
+ src/libcrun/linux.c         |  4 +--
+ tests/test_devices.py      | 87 +++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 91 insertions(+), 4 deletions(-)
+
+diff --git a/src/libcrun/handlers/krun.c b/src/libcrun/handlers/krun.c
+index 5e1f3e54..6e249a9b 100644
+--- a/src/libcrun/handlers/krun.c
++++ b/src/libcrun/handlers/krun.c
+@@ -240,9 +240,9 @@ libkrun_configure_container (void *cookie, enum handler_configure_phase phase,
+         }
+     }
+ 
+-  devfd = openat (rootfsfd, "dev", O_PATH | O_DIRECTORY | O_CLOEXEC);
++  devfd = safe_openat (rootfsfd, rootfs, strlen (rootfs), "dev", O_PATH | O_DIRECTORY | O_CLOEXEC, 0, err);
+   if (UNLIKELY (devfd < 0))
+-    return crun_make_error (err, errno, "open /dev directory in `%s`", rootfs);
++    return devfd;
+ 
+   ret = check_running_in_user_namespace (err);
+   if (UNLIKELY (ret < 0))
+diff --git a/src/libcrun/linux.c b/src/libcrun/linux.c
+index 24569dec..fcb62dbf 100644
+--- a/src/libcrun/linux.c
++++ b/src/libcrun/linux.c
+@@ -1766,9 +1766,9 @@ create_missing_devs (libcrun_container_t *container, bool binds, libcrun_error_t *err)
+   dev_fds = get_private_data (container)->dev_fds;
+   get_private_data (container)->dev_fds = NULL;
+ 
+-  devfd = openat (rootfsfd, "dev", O_CLOEXEC | O_PATH | O_DIRECTORY);
++  devfd = safe_openat (rootfsfd, rootfs, get_private_data (container)->rootfs_len, "dev", O_CLOEXEC | O_PATH | O_DIRECTORY, 0, err);
+   if (UNLIKELY (devfd < 0))
+-    return crun_make_error (err, errno, "open /dev directory in `%s`", rootfs);
++    return devfd;
+ 
+   for (i = 0; i < def->linux->devices_len; i++)
+     {
+diff --git a/tests/test_devices.py b/tests/test_devices.py
+--- a/tests/test_devices.py
++++ b/tests/test_devices.py
+@@ -16,6 +16,9 @@
+ # along with crun.  If not, see <http://www.gnu.org/licenses/>.
+ 
+ import os
++import subprocess
++import shutil
++import json
+ from tests_utils import *
+ 
+ def test_mode_device():
+@@ -250,7 +253,91 @@ def test_dev_console_symlink_does_not_escape_rootfs():
+     return 0
+ 
+ 
++def test_dev_symlink_does_not_populate_outside_rootfs():
++    if is_rootless():
++        return 77
++
++    workdir = os.path.join(get_tests_root(), "dev-symlink")
++    bundle = os.path.join(workdir, "bundle")
++    rootfs = os.path.join(bundle, "rootfs")
++    outside_dev = os.path.join(workdir, "outside-dev")
++    runtime_root = os.path.join(workdir, "run")
++    shutil.rmtree(workdir, ignore_errors=True)
++    try:
++        os.makedirs(rootfs)
++        os.makedirs(outside_dev)
++        os.makedirs(runtime_root)
++        ptmx_marker = os.path.join(outside_dev, "ptmx")
++        with open(ptmx_marker, "w") as f:
++            f.write("outside marker\n")
++
++        os.symlink(outside_dev, os.path.join(rootfs, "dev"))
++        shutil.copy2(get_init_path(), os.path.join(rootfs, "init"))
++        os.chmod(os.path.join(rootfs, "init"), 0o755)
++
++        conf = {
++            "ociVersion": "1.0.2",
++            "process": {
++                "terminal": False,
++                "user": {"uid": 0, "gid": 0},
++                "args": ["/init", "true"],
++                "env": ["PATH=/bin"],
++                "cwd": "/",
++            },
++            "root": {
++                "path": "rootfs",
++                "readonly": True,
++            },
++            "mounts": [
++                {"destination": "/proc", "type": "proc", "source": "proc"},
++            ],
++            "linux": {
++                "namespaces": [
++                    {"type": "mount"},
++                    {"type": "pid"},
++                    {"type": "ipc"},
++                    {"type": "uts"},
++                ],
++            },
++        }
++        with open(os.path.join(bundle, "config.json"), "w") as f:
++            f.write(json.dumps(conf))
++
++        container_id = "test-dev-symlink"
++        crun = get_crun_path()
++
++        try:
++            subprocess.check_output([crun, "--root", runtime_root, "run", "-b", bundle, container_id],
++                                    stderr=subprocess.STDOUT)
++            logger.info("container unexpectedly started with rootfs /dev symlink")
++            return -1
++        except subprocess.CalledProcessError:
++            pass
++        finally:
++            subprocess.run([crun, "--root", runtime_root, "delete", "-f", container_id],
++                           stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
++
++        outside_entries = sorted(os.listdir(outside_dev))
++        if outside_entries != ["ptmx"]:
++            logger.info("rootfs /dev symlink target was populated outside rootfs: %s", outside_entries)
++            return -1
++
++        if os.path.islink(ptmx_marker):
++            logger.info("rootfs /dev symlink target ptmx marker was replaced with a symlink")
++            return -1
++
++        with open(ptmx_marker) as f:
++            if f.read() != "outside marker\n":
++                logger.info("rootfs /dev symlink target ptmx marker content changed")
++                return -1
++
++        return 0
++    finally:
++        shutil.rmtree(workdir, ignore_errors=True)
++
++
+ all_tests = {
++    "dev-symlink-does-not-populate-outside-rootfs": test_dev_symlink_does_not_populate_outside_rootfs,
+     "dev-console-symlink-does-not-escape-rootfs": test_dev_console_symlink_does_not_escape_rootfs,
+     "owner-device" : test_owner_device,
+     "deny-devices" : test_deny_devices,
+-- 
+2.43.0
\ No newline at end of file
diff --git a/recipes-containers/crun/crun_git.bb b/recipes-containers/crun/crun_git.bb
index 0bcc51aa..0b88ab9b 100644
--- a/recipes-containers/crun/crun_git.bb
+++ b/recipes-containers/crun/crun_git.bb
@@ -18,6 +18,8 @@ SRC_URI = "git://github.com/containers/crun.git;branch=main;name=crun;protocol=h
            file://CVE-2025-24965.patch \
            file://CVE-2026-88264-01.patch \
            file://CVE-2026-88264-02.patch \
+           file://CVE-2026-47766-01.patch \
+           file://CVE-2026-47766-02.patch \
           "
 
 PV = "v1.14.3+git${SRCREV_crun}"

