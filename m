Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7504C4332F
	for <webhook@archiver.kernel.org>; Sun,  4 Dec 2022 21:38:48 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.139151.1670189921225191444
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 04 Dec 2022 13:38:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qAQLEJRz;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id ml11so23589476ejb.6
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 04 Dec 2022 13:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sv6b0IOUwZe4w6jD6fbvW/+ddth8eSNk6DMXPV4fJI0=;
        b=qAQLEJRzoXYpm3dS/I/A/lbzV5boxBUdB6okNsCM67UhWxwoZyD7pVVDEhtkYAHF1P
         oQaSauBmXNatKTn4UTEhjx2CnIaN2wHw+2eF6KAEOEMzxpbsNLJKDClyCZadN05IOeyk
         zOBO1i0kjuxbhpSy0DnvzbFhGkFGl5nEldHdN3kD3Hy8Snx2C+sIb4XBxfvjIws9kQcT
         6E2o7yKkVyXBGnKJ+3lX11yd119+71v3JmE81Xxzy9zx3U+hJhRa6kPtgZV8DVCF2Nyj
         DZs8v+JGwAyIwYmi245UMdrk2PylSqpWhGzxy16HV4l0Dlex8Ny0rTKZ2P12O8JtJEO5
         lJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sv6b0IOUwZe4w6jD6fbvW/+ddth8eSNk6DMXPV4fJI0=;
        b=iFEphawSrBM1ysntzGSGBNAIvcrYw6D7tGLd5Cg2NamiX3oYBIg1nopjMcSmGnU2oO
         LRVMpKuAaZ3HfGXhzIhAd5VQSgsmQM4UWN0oe3MVdLO/6GqSpVosrse0n+iwm/YzKCMO
         ppqvQ7Q8eSg1U27PAMavZq1ViZry0wNFZMVSxPWHMguEXIjSuUHXmfg+/CuaXw0FWU9E
         pv8ACDgP7lUZVWhEE6BT1GCGe5bpVtE83iSaGvP69A+OM1JHXfrZ6IrH0HxHSkEzjrmO
         f03ehq+hUdbImfY+4cN6l7eSjwkf3LzF5aL1CfU86VppK4sZrXrvuaFyIxpt1XHreiPB
         ZKmA==
X-Gm-Message-State: ANoB5plYm0Dbk9mPdOll/Y8/LUNQJF4S7yXuelTsdmV6kypI9Iqm3eD3
	nHT3fklsLKspGB2MWpdhH2r8APSsWys=
X-Google-Smtp-Source: AA0mqf7UPp2+lgonT+oMVF3UkLgXvimXJ9E7w5RtnEXDv0TKVX8BYoahuJ8xjldSStp5TinHRlYKOA==
X-Received: by 2002:a17:906:bcda:b0:7c0:80b0:7f67 with SMTP id lw26-20020a170906bcda00b007c080b07f67mr24964324ejb.462.1670189919352;
        Sun, 04 Dec 2022 13:38:39 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id dt13-20020a170906b78d00b0078d3f96d293sm5544179ejb.30.2022.12.04.13.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 13:38:39 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-virtualization][kirkstone][PATCH 1/3] runc-docker: update to 1.1.4-tip
Date: Sun,  4 Dec 2022 22:38:07 +0100
Message-Id: <20221204213809.483131-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204213809.483131-1-adrian.freihofer@siemens.com>
References: <20221204213809.483131-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 04 Dec 2022 21:38:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7734

Bumping runc to version v1.1.4-8-g974efd2d, which comprises the following commits:

974efd2d Merge pull request #3620 from lab47/b-remove-udev-dep
3b958289 Fixes inability to use /dev/null when inside a container
28fa513e Merge pull request #3630 from kolyshkin/1.1-fix-centos-7-ci-again
335ec376 cirrus-ci: install EPEL on CentOS 7 conditionally
8523022e Merge pull request #3618 from kolyshkin/1.1-fix-centos-7-ci
fb145a2f cirrus-ci: enable EPEL for CentOS 7
d66943e6 merge branch 'pr-3564' into release-1.1
276297b6 VERSION: back to development
5fd4c4d1 (tag: v1.1.4) Release 1.1.4
46a5a846 Merge pull request #3554 from kolyshkin/1.1-fix-dev-pts
204c673c [1.1] fix failed exec after systemctl daemon-reload
1c6dc765 Merge pull request #3562 from kolyshkin/1.1-ci-codespell-2.2
ec2efc2c ci: fix for codespell 2.2
7c69bcc6 Merge pull request #3558 from kolyshkin/1.1-fix-cross-386
c778598c [1.1] ci/gha: fix cross-386 job vs go 1.19
b54084fb Merge pull request #3541 from kolyshkin/1.1-exec-noexec
d83a861d Fix error from runc run on noexec fs
69734b99 merge branch 'pr-3536' into release-1.1
d614445d [1.1] libct/nsenter: switch to sane_kill()
f4aaf0d8 merge branch 'pr-3538' into release-1.1
3ca5673f CI: workaround CentOS Stream 9 criu issue
c3986e53 tests/int: don't use --criu
f46c0dad [1.1] ci: fix delete.bats for GHA
6b94849d tests/int: runc delete: fix flake, enable for rootless
afda6b7c merge branch 'pr-3511' into release-1.1
fa3354dc libct: fix mounting via wrong proc fd
1e7bb5b7 merge branch 'pr-3490' into release-1.1
eb1552a0 VERSION: back to development
6724737f (tag: v1.1.3) VERSION: release 1.1.3
91fa032d ci: add basic checks for CHANGELOG.md
5d74e0f0 Merge pull request #3504 from cyphar/1.1-systemd-devices-nonexistent-files
7219387e cgroups: systemd: skip adding device paths that don't exist
da9b9d93 Merge pull request #3494 from eriksjolund/1.1-backport-3489
93d1807b libcontainer: relax getenv_int sanity check
ff14258e merge branch 'pr-3481' into release-1.1
8242c05d script/seccomp.sh: check tarball sha256
017cb29b Dockerfile,scripts/release: bump libseccomp to v2.5.4
131222d6 Merge pull request #3493 from cyphar/1.1-ns_last_pid
51649a7d Allow mounting of /proc/sys/kernel/ns_last_pid
9d00472f merge branch 'pr-3479' into release-1.1
3a09da6b ci: drop docker layer caching from release job
fa7cca98 Merge pull request #3478 from cyphar/1.1-seccomp-enosys-setup
8b93f9fb seccomp: enosys: always return -ENOSYS for setup(2) on s390(x)
1839c392 Merge pull request #3476 from kolyshkin/1.1-dbus-err
fc2a8fe1 libct/cg/sd: check dbus.ErrClosed instead of isDbusError
13e164db merge branch 'pr-3477' into release-1.1
d105e052 libct/seccomp/config: add missing KillThread, KillProcess
e4474ef8 [1.1] vendor: bump seccomp/libseccomp-golang to f33da4d
dc083b2b fix deprecated ActKill

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 ...efine-ActKillThread-equal-to-ActKill.patch | 90 -------------------
 recipes-containers/runc/runc-docker_git.bb    |  4 +-
 .../runc/runc-opencontainers_git.bb           |  6 +-
 3 files changed, 5 insertions(+), 95 deletions(-)
 delete mode 100644 recipes-containers/runc/files/0002-Define-ActKillThread-equal-to-ActKill.patch

diff --git a/recipes-containers/runc/files/0002-Define-ActKillThread-equal-to-ActKill.patch b/recipes-containers/runc/files/0002-Define-ActKillThread-equal-to-ActKill.patch
deleted file mode 100644
index ba51d4a..0000000
--- a/recipes-containers/runc/files/0002-Define-ActKillThread-equal-to-ActKill.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From f2aa0359bcc776239bda8a4eb84957b97ef55c35 Mon Sep 17 00:00:00 2001
-From: Tonis Tiigi <tonistiigi@gmail.com>
-Date: Fri, 28 Jan 2022 14:44:56 -0800
-Subject: [PATCH] Define ActKillThread equal to ActKill
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-These constants are equal in libseccomp but Go definitions
-were defined separately. This resulted in dead code that
-never executed due to identical case statements in switch.
-Go can usually detect these error cases and refuses to build
-but for some reason this detection doesn’t work with cgo+gcc.
-Clang detects the equal constants correctly and therefore
-libseccomp-golang builds with clang broke after ActKillThread
-was added.
-
-In order to fix the clang build only removal of the
-switch case is needed. But I assumed that the setter/getter
-logic is supposed to work for ActKillThread as well
-and only way to ensure that is to set them equal like they
-are in C.
-
-Signed-off-by: Tonis Tiigi <tonistiigi@gmail.com>
-Signed-off-by: Sebastiaan van Stijn <github@gone.nl>
-Acked-by: Tom Hromatka <tom.hromatka@oracle.com>
-Signed-off-by: Paul Moore <paul@paul-moore.com>
-Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
-Upstream-status: Backport [https://github.com/seccomp/libseccomp-golang/commit/c35397d0ea8f285a0be78693bb2fd37b06952453]
----
- seccomp.go          | 8 ++++----
- seccomp_internal.go | 4 ----
- 2 files changed, 4 insertions(+), 8 deletions(-)
-
-diff --git a/seccomp.go b/seccomp.go
-index e9b92e2..32f6ab2 100644
---- a/seccomp.go
-+++ b/seccomp.go
-@@ -214,14 +214,14 @@ const (
- 	// This action is only usable when libseccomp API level 3 or higher is
- 	// supported.
- 	ActLog ScmpAction = iota
--	// ActKillThread kills the thread that violated the rule. It is the same as ActKill.
--	// All other threads from the same thread group will continue to execute.
--	ActKillThread ScmpAction = iota
- 	// ActKillProcess kills the process that violated the rule.
- 	// All threads in the thread group are also terminated.
- 	// This action is only usable when libseccomp API level 3 or higher is
- 	// supported.
- 	ActKillProcess ScmpAction = iota
-+	// ActKillThread kills the thread that violated the rule. It is the same as ActKill.
-+	// All other threads from the same thread group will continue to execute.
-+	ActKillThread = ActKill
- )
- 
- const (
-@@ -394,7 +394,7 @@ func (a ScmpCompareOp) String() string {
- // String returns a string representation of a seccomp match action
- func (a ScmpAction) String() string {
- 	switch a & 0xFFFF {
--	case ActKill, ActKillThread:
-+	case ActKillThread:
- 		return "Action: Kill thread"
- 	case ActKillProcess:
- 		return "Action: Kill process"
-diff --git a/seccomp_internal.go b/seccomp_internal.go
-index 8dc7b29..8fc9914 100644
---- a/seccomp_internal.go
-+++ b/seccomp_internal.go
-@@ -612,8 +612,6 @@ func (a ScmpCompareOp) toNative() C.int {
- func actionFromNative(a C.uint32_t) (ScmpAction, error) {
- 	aTmp := a & 0xFFFF
- 	switch a & 0xFFFF0000 {
--	case C.C_ACT_KILL:
--		return ActKill, nil
- 	case C.C_ACT_KILL_PROCESS:
- 		return ActKillProcess, nil
- 	case C.C_ACT_KILL_THREAD:
-@@ -638,8 +636,6 @@ func actionFromNative(a C.uint32_t) (ScmpAction, error) {
- // Only use with sanitized actions, no error handling
- func (a ScmpAction) toNative() C.uint32_t {
- 	switch a & 0xFFFF {
--	case ActKill:
--		return C.C_ACT_KILL
- 	case ActKillProcess:
- 		return C.C_ACT_KILL_PROCESS
- 	case ActKillThread:
--- 
-2.25.1
-
diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
index f2c0613..97373a7 100644
--- a/recipes-containers/runc/runc-docker_git.bb
+++ b/recipes-containers/runc/runc-docker_git.bb
@@ -2,13 +2,13 @@ include runc.inc
 
 # Note: this rev is before the required protocol field, update when all components
 #       have been updated to match.
-SRCREV_runc-docker = "b507e2da6c6a3a328f208fa415a56ad7cd58761b"
+SRCREV_runc-docker = "974efd2dfca0abec041a3708a2b66bfac6bd2484"
 SRC_URI = "git://github.com/opencontainers/runc;branch=release-1.1;name=runc-docker;protocol=https \
            file://0001-runc-Add-console-socket-dev-null.patch \
            file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
            file://0001-runc-docker-SIGUSR1-daemonize.patch \
           "
 
-RUNC_VERSION = "1.1.2"
+RUNC_VERSION = "1.1.4"
 
 CVE_PRODUCT = "runc"
diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
index f9dae6a..350bfd7 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -1,11 +1,11 @@
 include runc.inc
 
-SRCREV = "b507e2da6c6a3a328f208fa415a56ad7cd58761b"
+SRCREV = "974efd2dfca0abec041a3708a2b66bfac6bd2484"
 SRC_URI = " \
     git://github.com/opencontainers/runc;branch=release-1.1;protocol=https \
     file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
-    file://0002-Define-ActKillThread-equal-to-ActKill.patch;patchdir=src/import/vendor/github.com/seccomp/libseccomp-golang \
     "
-RUNC_VERSION = "1.1.2"
+
+RUNC_VERSION = "1.1.4"
 
 CVE_PRODUCT = "runc"
-- 
2.38.1


