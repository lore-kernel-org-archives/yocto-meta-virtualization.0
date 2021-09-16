Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.6983.1631768830772981763
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Sep 2021 22:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HYiwoHKD;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: sanakazisk19@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id k23so3745520pji.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Sep 2021 22:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=AuObRjym0Hr6unBQ5TbvRt6tuKoJIQzs5wbWqbqpjRA=;
        b=HYiwoHKDcvjzi3R2E8eNYeq65lxt102x1/VCDamu5DxQNcU6mc6osqqPdId5IZj2G/
         RGUNd+qUbHZAR7ibVUHgvkOcI02lT18DbeUdUpKT6xj+dr8OOin6ezOHbD5z/CuUq0y6
         h+qB1dzkiSkiQuuZF+hrIacYBfJSxl3AOC6ZN170/adeF/8XEGYpodKP9eO2QcV4V+Uf
         5JsmoUiWQSGC9cqdrLN7K88YSIKLJvd2WOyv7zWrKqBJIkVG/SNC0Sh5K71x82XLGUIJ
         3It16JskOCGuWVeG96QUTBjdYu2MXfW9jrXED1QE9PJHPYe+n4rWmkbX2CwgmPxRPEtS
         jqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=AuObRjym0Hr6unBQ5TbvRt6tuKoJIQzs5wbWqbqpjRA=;
        b=zlEg/GkxL4ZsRSP2GqOgc38X4eA2JwWNr2CQliOTEh0cah1TuwOsvabr1nuRGfcubF
         IXyqK1/Ub1alHYKo7xJbinBfWLyIMvqCPp6oncF7mrEOXHco1RzuTxFyW7sYCAlSnjHR
         +cDcQ+L2n5Idx7VniJAy4HSCvUpl9sa2FY2VF5iOn4C4HmK8s72m9989yBnGSy7WnVST
         V067okFCbJDJHHNlRf0LAIIZRUQ3EiEWmJbHJ7lHRBmLpPCAxID0ju781xG2k2HNgFpm
         rvN+NOH5WYVTIgHIVPb4oOvtI2bJ2BRSizUqtJt8Do3VbSgCPMxNOUVFKq+GVMnGm3Gi
         yt9w==
X-Gm-Message-State: AOAM531Ybiymgfv15VMkUCMZ5hK3NP3UNv7GRnjtnc6fzH4OxGuZaep+
	u/qNNGusKdCYnG0YuxDjHoKvtVzyz96KaA==
X-Google-Smtp-Source: ABdhPJxUPKKiZuOgk+oz2yNwAJBzVMFeJh4HyKokD5OEyFXtcEInfiNmgB45ICbmE8kLwENr1+01oQ==
X-Received: by 2002:a17:90a:9a2:: with SMTP id 31mr3953775pjo.58.1631768829904;
        Wed, 15 Sep 2021 22:07:09 -0700 (PDT)
Return-Path: <sanakazisk19@gmail.com>
Received: from localhost.localdomain ([2401:4900:197c:c240:ac8a:850a:232a:b91b])
        by smtp.gmail.com with ESMTPSA id m21sm1483567pfa.216.2021.09.15.22.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 22:07:09 -0700 (PDT)
From: "sana kazi" <sanakazisk19@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Sana Kazi <sanakazisk19@gmail.com>
Subject: [meta-virtualization][master-next][PATCH] lxc: Fix -c command for lxc-attach
Date: Thu, 16 Sep 2021 10:36:53 +0530
Message-Id: <20210916050653.23238-1-sanakazisk19@gmail.com>
X-Mailer: git-send-email 2.17.1

Added fix_c_command.patch the -c command seems to be broken because
the passed context is ignored and always overwritten by the context
specified in the config file.

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
---
 .../lxc/files/fix_c_command.patch             | 36 +++++++++++++++++++
 recipes-containers/lxc/lxc_git.bb             |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 recipes-containers/lxc/files/fix_c_command.patch

diff --git a/recipes-containers/lxc/files/fix_c_command.patch b/recipes-containers/lxc/files/fix_c_command.patch
new file mode 100644
index 0000000..1ed8daf
--- /dev/null
+++ b/recipes-containers/lxc/files/fix_c_command.patch
@@ -0,0 +1,36 @@
+From 9becf309a81806ef08acf9ca99ab95c1bcfa1f65 Mon Sep 17 00:00:00 2001
+From: Maximilian Blenk <Maximilian.Blenk@bmw.de>
+Date: Mon, 23 Aug 2021 15:39:28 +0200
+Subject: [PATCH] attach: Fix -c command
+
+Currently, the -c command (to set the selinux context) seems to be
+broken because the passed context is ignored and always overwritten by
+the context specified in the config file. The intention behind the -c
+imho was to be able to manually overwrite this behavior. This patch
+ensures that the selinux context will be set if passed via the command
+line.
+
+Signed-off-by: Maximilian Blenk <Maximilian.Blenk@bmw.de>
+---
+ src/lxc/tools/lxc_attach.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+Upstream-Status: Backport [https://github.com/lxc/lxc/commit/9becf309a81806ef08acf9ca99ab95c1bcfa1f65.patch]
+Comment: No change in any hunk
+
+diff --git a/src/lxc/tools/lxc_attach.c b/src/lxc/tools/lxc_attach.c
+index 0374d980b4..e6b388b20c 100644
+--- a/src/lxc/tools/lxc_attach.c
++++ b/src/lxc/tools/lxc_attach.c
+@@ -379,7 +379,10 @@ int main(int argc, char *argv[])
+ 		attach_options.gid = my_args.gid;
+ 
+ 	// selinux_context will be NULL if not set
+-	attach_options.lsm_label = selinux_context;
++	if (selinux_context) {
++		attach_options.attach_flags |= LXC_ATTACH_LSM_LABEL;
++		attach_options.lsm_label = selinux_context;
++	}
+ 
+ 	if (command.program) {
+ 		ret = c->attach_run_wait(c, &attach_options, command.program,
diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
index 3215928..f5b5128 100644
--- a/recipes-containers/lxc/lxc_git.bb
+++ b/recipes-containers/lxc/lxc_git.bb
@@ -50,6 +50,7 @@ SRC_URI = "git://github.com/lxc/lxc.git;branch=stable-4.0 \
 	file://dnsmasq.conf \
 	file://lxc-net \
         file://enable_seccomp_profile_when_compiled_libseccomp.patch \
+        file://fix_c_command.patch \
 	"
 
 SRCREV = "cec7cb14b2a4367d4cb21a90e1b90d0f98a9d874"
-- 
2.17.1

