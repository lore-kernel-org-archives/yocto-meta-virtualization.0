Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B04D1C3DA71
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:59:58 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.37928.1670831989510637845
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 11 Dec 2022 23:59:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=itsnQB9B;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id fc4so25751805ejc.12
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 11 Dec 2022 23:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LlzNhGtSrLd/DgDP3X+SFllXZK76E8uAiI08/hgiiU=;
        b=itsnQB9BXFQgjtn97FYuqqVFtyXqvkadWlqwPlBH39yTDtapxiyYD/KD2Pu5knoFKd
         jV8UymdJ5ZC+ufJbeLreTfx1vrul3wGyQhcCtg0lysCta1TkSYSZPWPUl8MAoB7bHpKT
         G/ikYMtE/PeuwoBzox8xyc/+BxrfnG0BoQKui5XbBnzEHEiG4ZckRWZUqIeUFYf6y4yT
         2Tc0j44V2zdGqdG06/vYjiwReaXPGGMnKEtWTZC0CGc8F6/2lsyvQ+phv3+wdA2jJwlU
         kJP/pyNdRbWj0lNyofTI28HyQepGb4dStmBZMA+DTq9AMecmcsZQNMK6VEXUQhPfptG9
         0LTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4LlzNhGtSrLd/DgDP3X+SFllXZK76E8uAiI08/hgiiU=;
        b=xlT95TnPLSMAjiZIoZiBGoX6HzKZSae87u11TFzZDGV9x6DnmGUqG0yMekJRBeiNOY
         rfxI7PXzh0Q4MV2vu/2ArCQE+WBZYX+MbGFpRKO7frl+LLSz9BwlgM13zsRjodV1/SJ8
         rQyrZ7ICLzhKmxjs05pcr/ixAwoFHfTJ95gwWFfqweDCAanQnjtzM9qOFa5LhI3U6mM4
         zJ6LvrZ77zpqbPKqS0GH7JyLQTOGXt3F87tvtXcj95a6d1VyAeB7QTrgHL1fYm0YXyd1
         Y7cOEA+MgLu6JlLHY4JVWSIG7xSKFNT4MjDq3Z+2UTQ/Y3He/mp7JM6NcJyltiFVcMO2
         InTQ==
X-Gm-Message-State: ANoB5pmHq+/+4dkM+4+rv92APHXQmCKoJyfvCkeavFlgKv3z0bvjLPAo
	Vt+jl7m4esYXo4fLv8pKOZdVeGKYmiU=
X-Google-Smtp-Source: AA0mqf5f6d4FEeF62Mbi5CmVjY7F4x5yjuocfKfzNodtog5GjWkqwBNwINee+zqLQlkeMw62l2sv4Q==
X-Received: by 2002:a17:907:1de3:b0:7c0:e5dd:6e5f with SMTP id og35-20020a1709071de300b007c0e5dd6e5fmr13542112ejc.4.1670831987641;
        Sun, 11 Dec 2022 23:59:47 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id ko5-20020a170907986500b007bd1ef2cccasm2952278ejc.48.2022.12.11.23.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 23:59:47 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-virtualization][kirkstone][PATCHv2 04/21] runc-opencontainers: drop obsolete patch
Date: Mon, 12 Dec 2022 08:58:40 +0100
Message-Id: <20221212075857.1065221-5-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
References: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Dec 2022 07:59:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7758

commit e4474ef881401b2f3ed3ba806a288bb986dcac49 of runc does a vendor
update which includes the reverted fix again. The commit is after 1.2.0
and before 1.3.0 --> the next cherry-pick updates runc to 1.3.0 and the
fix will be back.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 ...efine-ActKillThread-equal-to-ActKill.patch | 90 -------------------
 .../runc/runc-opencontainers_git.bb           |  1 -
 2 files changed, 91 deletions(-)
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
diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
index f9dae6a..14570b9 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -4,7 +4,6 @@ SRCREV = "b507e2da6c6a3a328f208fa415a56ad7cd58761b"
 SRC_URI = " \
     git://github.com/opencontainers/runc;branch=release-1.1;protocol=https \
     file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
-    file://0002-Define-ActKillThread-equal-to-ActKill.patch;patchdir=src/import/vendor/github.com/seccomp/libseccomp-golang \
     "
 RUNC_VERSION = "1.1.2"
 
-- 
2.38.1


