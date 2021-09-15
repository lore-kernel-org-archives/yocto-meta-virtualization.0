Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.5833.1631702874246256648
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Sep 2021 03:47:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OdNAgcTg;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: sanakazisk19@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id f65so2268399pfb.10
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Sep 2021 03:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=3NFzA+GMIIvoSwuhJTrpKRe0ZmEqeb2ZrTqucbv4wAs=;
        b=OdNAgcTgeGzJDoHTn2+iIYZUEFHy0deiuD+DL2hcDBhfjEK4xd9n/O1RhMisCeyfUh
         ZbiqfK5bBbXsI8xQBlI2gXFZyk7kh55z7OzX4n+Dna5eaC1Dq4TgkkgQw7Lh2zB9x4GE
         7FcMcCqFoMA6AAovZy8lLeAM0aVb/ZeyOFwW7LBvQpvaxHYUIZkkpadU0n9plDqjhdya
         9gkfb0WVgI+pqAbTL8Nqm4sCa0lnesAiBSBZ6Glkn6q+/vqpyb1BCqClFKTfF7RpRHQ6
         A6TfEXHmEwCtyKaZIF1MXODkUlEpk/haqbt/iFyVq6M9+NqNRVqDSUxedFX5lsPofoRd
         jMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3NFzA+GMIIvoSwuhJTrpKRe0ZmEqeb2ZrTqucbv4wAs=;
        b=0gCUVXrGDtvARAj5Zlwi/sLPrg3tmHwq/ADYTi462qmevQstFQAx7ggwMITK7scK8W
         wCI2TMHeR0mCAwKVjNcXEYWvH1UDkXF5JWUEUVrf17cvvzGvSMIWUcp0v3MWIzqsTD6U
         W0TsdzR7S7S6KtB0/0ZHYQcOAzDWYVTxzQAo/n/7ez9DV18wTe1mpGySS1dknyKX7pev
         7LsDwniT5j+7gkNFYjT4QZqei1JdmpD/+H/VZED2JDCvkm05KkKRVBX+fCOCfuTkZjQV
         vVcU1Hpi90+cSY18VkpKfdbXsfcV5Xu9B8P+lyTapLghTxrzQ37LEpYgpBMu07o+L3+i
         iIIA==
X-Gm-Message-State: AOAM531YubGVqANitJzgWmGB9UaJJw+09lgFrGicsiXYhjiXKAmvfEH+
	f/RIXF3kSa4glp1VO5Wr7d4bJLbG46A=
X-Google-Smtp-Source: ABdhPJwVxGwLVUgLMXHSSxUBSrC+r4XbtS5REOBY5S5ifUWzbKON6Fx3G+iwbSNmeSffx3vYEe3RZg==
X-Received: by 2002:a62:6493:0:b0:43c:e252:3dfc with SMTP id y141-20020a626493000000b0043ce2523dfcmr9751596pfb.60.1631702873498;
        Wed, 15 Sep 2021 03:47:53 -0700 (PDT)
Return-Path: <sanakazisk19@gmail.com>
Received: from localhost.localdomain ([2401:4900:197c:c240:ac8a:850a:232a:b91b])
        by smtp.gmail.com with ESMTPSA id 141sm14351001pgg.16.2021.09.15.03.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 03:47:53 -0700 (PDT)
From: "sana kazi" <sanakazisk19@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Sana Kazi <sanakazisk19@gmail.com>
Subject: [meta-virtualization][master][PATCH] lxc: Fix -c command for lxc-attach
Date: Wed, 15 Sep 2021 16:17:39 +0530
Message-Id: <20210915104739.19316-1-sanakazisk19@gmail.com>
X-Mailer: git-send-email 2.17.1

Added fix_c_command.patch the -c command seems to be broken because
the passed context is ignored and always overwritten by the context
specified in the config file.

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
---
 .../lxc/files/fix_c_command.patch             | 36 +++++++++++++++++++
 recipes-containers/lxc/lxc_4.0.9.bb           |  1 +
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
diff --git a/recipes-containers/lxc/lxc_4.0.9.bb b/recipes-containers/lxc/lxc_4.0.9.bb
index 6720733..c45ae5c 100644
--- a/recipes-containers/lxc/lxc_4.0.9.bb
+++ b/recipes-containers/lxc/lxc_4.0.9.bb
@@ -50,6 +50,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz \
 	file://dnsmasq.conf \
 	file://lxc-net \
         file://enable_seccomp_profile_when_compiled_libseccomp.patch \
+        file://fix_c_command.patch \
 	"
 
 SRC_URI[md5sum] = "365fcca985038910e19a1e0fff15ed07"
-- 
2.17.1

