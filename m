Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B9F4C433FE
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 11:46:38 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.4736.1664538390206103733
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 30 Sep 2022 04:46:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zo2V2pKV;
 spf=pass (domain: gmail.com, ip: 209.85.221.50,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id c11so6437523wrp.11
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 30 Sep 2022 04:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=h9sUnccDk/75/y3XbgMDHjvb28cstWQZ51nXMuoxNaQ=;
        b=Zo2V2pKV2d+hLe1L9MHHU6KVa3Kbcm/RVcEFaYmnxOAVdryTl9LDl61MSnEJCMeWN9
         z8LrvX6QNCI5fKIa/o7YRHhn7qjs92tBVs1jBcF93ozrRD8MJdQngWqP/rHZH/bIM+gK
         JrJjT8S+zu8neBlFrcnMoEpvyEjVBIh5PaE8C1QnIJSpQtH4AJm0obvc+JnvsZEn7xqu
         Rl66de2CbgUxgzGY2KsRxchgKx84lbru8hvJyIisnb0BIlRj2D9FnKkTAQpWQzG/1c9p
         CXVQCzNZhLpdzwkDUEi+1/V/XpRiAlf0v3DYyFPuZNUJ/wxvtHXl2hA8qoUcvgsbVZgN
         3qxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=h9sUnccDk/75/y3XbgMDHjvb28cstWQZ51nXMuoxNaQ=;
        b=2BiZp3AnVLKbj5n2nA1BemhSU8qcWaqoovto2p1xahI7sesJDVx7T8aBbKrAmcmsuZ
         5RQmt5KRkPv/TQfV1bBYMcpA/+ODEPottDx6VXclm0XYmoibaRtwYLfsld2ULHnPhi/0
         FYbzrlRWa8OxsesG2zvO0aiBwwi0QZSmDMzoEJRwdwXsYfm7hMJJE6ZNTy7gEK4fiRLI
         G93oOLMwoxB37OKhr0dUpT3rQhDlRkjwDaG57E8NSpkqb8PPXpSxybpqYdp860IuVv5I
         4bqYS+noUyMvqhNO5YVLvdHQ3rbfNog3N8b1I1v/Nj3iPtvRUU71/kYUy5wT2h9V5noN
         gicQ==
X-Gm-Message-State: ACrzQf0pHH8AHRG+vapKtr3/pDtj6AL/5Kk+3T/8KJXp2VxNwAOQA1ya
	Qj/LHvBfTuctdIaYTh4VObEzUIWvSiAiIA==
X-Google-Smtp-Source: 
 AMsMyM7UCt+MpTgxI6fLNy8AmZCM6pHyCWOTRdTrj8V7cmqfJN1l7novtw6zPpmXPRJBBu089NbkeQ==
X-Received: by 2002:a5d:6808:0:b0:22a:c437:5b36 with SMTP id
 w8-20020a5d6808000000b0022ac4375b36mr5508816wru.459.1664538388002;
        Fri, 30 Sep 2022 04:46:28 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net
 (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id
 h11-20020adfe98b000000b0022c906ffedasm1802444wrm.70.2022.09.30.04.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 04:46:27 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-virtualization@lists.yoctoproject.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-virtualization][PATCH] tini: fix function declaration without a
 prototype
Date: Fri, 30 Sep 2022 11:46:01 +0000
Message-Id: <20220930114601.3116137-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 30 Sep 2022 11:46:38 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7637

This also fix building with clang 1.15

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 ...n-declaration-without-a-prototype-is.patch | 74 +++++++++++++++++++
 recipes-containers/tini/tini_0.19.0.bb        |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 recipes-containers/tini/tini/0001-tini.c-a-function-declaration-without-a-prototype-is.patch

diff --git a/recipes-containers/tini/tini/0001-tini.c-a-function-declaration-without-a-prototype-is.patch b/recipes-containers/tini/tini/0001-tini.c-a-function-declaration-without-a-prototype-is.patch
new file mode 100644
index 0000000..96f3625
--- /dev/null
+++ b/recipes-containers/tini/tini/0001-tini.c-a-function-declaration-without-a-prototype-is.patch
@@ -0,0 +1,74 @@
+From 66d0b5fd94fafe1e15bf21a1b73618ca23de078f Mon Sep 17 00:00:00 2001
+From: Jose Quaresma <jose.quaresma@foundries.io>
+Date: Fri, 23 Sep 2022 16:31:33 +0000
+Subject: [PATCH] tini.c: a function declaration without a prototype is
+ deprecated in all versions of C
+
+| /srv/oe/build/tmp-lmp/work/corei7-64-lmp-linux/tini/0.19.0-r0/git/src/tini.c:150:18: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
+| int isolate_child() {
+|                  ^
+|                   void
+| /srv/oe/build/tmp-lmp/work/corei7-64-lmp-linux/tini/0.19.0-r0/git/src/tini.c:395:14: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
+| int parse_env() {
+|              ^
+|               void
+| /srv/oe/build/tmp-lmp/work/corei7-64-lmp-linux/tini/0.19.0-r0/git/src/tini.c:416:24: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
+| int register_subreaper () {
+|                        ^
+|                         void
+| /srv/oe/build/tmp-lmp/work/corei7-64-lmp-linux/tini/0.19.0-r0/git/src/tini.c:434:19: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
+| void reaper_check () {
+|                   ^
+|                    void
+| 4 errors generated.
+
+:Upstream-Status: Submitted [https://github.com/krallin/tini/pull/198]
+
+Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
+---
+ src/tini.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/tini.c b/src/tini.c
+index 2c873f9..7914d3a 100644
+--- a/src/tini.c
++++ b/src/tini.c
+@@ -147,7 +147,7 @@ int restore_signals(const signal_configuration_t* const sigconf_ptr) {
+ 	return 0;
+ }
+ 
+-int isolate_child() {
++int isolate_child(void) {
+ 	// Put the child into a new process group.
+ 	if (setpgid(0, 0) < 0) {
+ 		PRINT_FATAL("setpgid failed: %s", strerror(errno));
+@@ -392,7 +392,7 @@ int parse_args(const int argc, char* const argv[], char* (**child_args_ptr_ptr)[
+ 	return 0;
+ }
+ 
+-int parse_env() {
++int parse_env(void) {
+ #if HAS_SUBREAPER
+ 	if (getenv(SUBREAPER_ENV_VAR) != NULL) {
+ 		subreaper++;
+@@ -413,7 +413,7 @@ int parse_env() {
+ 
+ 
+ #if HAS_SUBREAPER
+-int register_subreaper () {
++int register_subreaper (void) {
+ 	if (subreaper > 0) {
+ 		if (prctl(PR_SET_CHILD_SUBREAPER, 1)) {
+ 			if (errno == EINVAL) {
+@@ -431,7 +431,7 @@ int register_subreaper () {
+ #endif
+ 
+ 
+-void reaper_check () {
++void reaper_check (void) {
+ 	/* Check that we can properly reap zombies */
+ #if HAS_SUBREAPER
+ 	int bit = 0;
+-- 
+2.34.1
+
diff --git a/recipes-containers/tini/tini_0.19.0.bb b/recipes-containers/tini/tini_0.19.0.bb
index 914cffb..fd90f62 100644
--- a/recipes-containers/tini/tini_0.19.0.bb
+++ b/recipes-containers/tini/tini_0.19.0.bb
@@ -8,6 +8,7 @@ SRCREV = "b9f42a0e7bb46efea0c9e3d8610c96ab53b467f8"
 SRC_URI = " \
   git://github.com/krallin/tini.git;branch=master;protocol=https \
   file://0001-Do-not-strip-the-output-binary-allow-yocto-to-do-thi.patch \
+  file://0001-tini.c-a-function-declaration-without-a-prototype-is.patch \
   "
 
 LICENSE = "MIT"
-- 
2.34.1


