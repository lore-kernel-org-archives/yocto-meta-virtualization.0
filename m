Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web08.6922.1631768270842167410
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Sep 2021 21:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Syfv0r9p;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: sanakazisk19@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id q68so4996455pga.9
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Sep 2021 21:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=9PQFYnY9w4WVxJtvG7qSvPTEc1dwAwBuCKp8kWj094w=;
        b=Syfv0r9pKnWku10GlvMq171y2vcTXoq49Zm10cmkMvnLOD4v2xv7WtjSqvX1Im/mC3
         sTdvrSJo04ABvWdOygo6aSFFqn3UQSp9j9iOnWkjLMYmEp4tRTp2H2DsTcmcJ6Kf9xA4
         cEtbeVJ3p87/6PMsOxxES1CD9yszl6PhT7fhntWCy6aJQIqmQg9aoeWULLaBihxJdJML
         XrNGq7nL1KGd8DWFf3iaKAOnUjDqLA9zXu1G7ZehwVnt39QrdcwhHDH6KuxLtJ5ilppp
         lVV919nueTGta5JQsOhUmDCQnpwTyW56d6TGZKcbTmJs+R3BugMxy9R2KXgRxVlGzDNy
         gGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=9PQFYnY9w4WVxJtvG7qSvPTEc1dwAwBuCKp8kWj094w=;
        b=5TeBEP8oJPcU99HnTe7WqYlO3bWr7b8diOzbN4xnmRMhAC5lW+02SymoqyJNdh8NpS
         J2VGoN/X9A2NfZFQFhhBE17tASSbpGArJ63WowZhbKEgMj6uz0id8pSQDTBH9BWbyHLW
         o4pW7r9YpEZrLDwxn4EWfEeDikWimlX0Ajdnwujw8jbVK9WLmj4ECeij7j3fpG+tAzbG
         61b57Incfj2rjD5n9l94lhrxZLNbjN03MtKzMRktpz1DVpU5hxhN7sfHF7BYoDUn/ZeO
         52lPFZ8QQT1MDR3+VPDJdJ19hqLRG4EFYZyQpy3sn62vs3m9rB2fY79yTx+XoHbS29oJ
         rP9A==
X-Gm-Message-State: AOAM533hQo1v1Gl+eykaytp3ggQ3efKW8Pj31qx9K/CrvEMkztsHmcK+
	ADyuq9o1y+kx6dXlMqdLEWY3J/MnLwmD9A==
X-Google-Smtp-Source: ABdhPJwf3/gvvPIs0OpX7aeFn5V5bnQNvociYg3AsIf9p/6kUjRIyjd8WIMThL+wIGwv8ind191Mfg==
X-Received: by 2002:a63:4c1f:: with SMTP id z31mr3305232pga.50.1631768269949;
        Wed, 15 Sep 2021 21:57:49 -0700 (PDT)
Return-Path: <sanakazisk19@gmail.com>
Received: from localhost.localdomain ([2401:4900:197c:c240:ac8a:850a:232a:b91b])
        by smtp.gmail.com with ESMTPSA id g3sm1655514pgf.1.2021.09.15.21.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 21:57:49 -0700 (PDT)
From: "sana kazi" <sanakazisk19@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Sana Kazi <sanakazisk19@gmail.com>
Subject: [meta-virtualization][master][PATCH] lxc: Add lxc.init.groups config key
Date: Thu, 16 Sep 2021 10:27:32 +0530
Message-Id: <20210916045732.22444-1-sanakazisk19@gmail.com>
X-Mailer: git-send-email 2.17.1

The lxc init options for 4.0.9 and lxc.init.groups is missing.
Added add_lxc_init_groups_config_key.patch to fix this issue.

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
---
 .../add_lxc_init_groups_config_key.patch      | 144 ++++++++++++++++++
 recipes-containers/lxc/lxc_4.0.9.bb           |   1 +
 2 files changed, 145 insertions(+)
 create mode 100644 recipes-containers/lxc/files/add_lxc_init_groups_config_key.patch

diff --git a/recipes-containers/lxc/files/add_lxc_init_groups_config_key.patch b/recipes-containers/lxc/files/add_lxc_init_groups_config_key.patch
new file mode 100644
index 0000000..b3521aa
--- /dev/null
+++ b/recipes-containers/lxc/files/add_lxc_init_groups_config_key.patch
@@ -0,0 +1,144 @@
+From 19b18b6970482e54489caf7cc5993c440c0a98b0 Mon Sep 17 00:00:00 2001
+From: Christian Brauner <christian.brauner@ubuntu.com>
+Date: Mon, 14 Jun 2021 12:10:46 +0200
+Subject: [PATCH] confile: backport lxc.init.groups config key
+
+This is needed for lxcri.
+
+Fixes: #3862
+Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
+---
+ src/lxc/confile.c | 88 +++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 88 insertions(+)
+
+Upstream-Status: Backport [https://github.com/lxc/lxc/commit/19b18b6970482e54489caf7cc5993c440c0a98b0.patch]
+Comment: No change in any hunk
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+
+diff --git a/src/lxc/confile.c b/src/lxc/confile.c
+index 76d9402626..8072d658a6 100644
+--- a/src/lxc/confile.c
++++ b/src/lxc/confile.c
+@@ -86,6 +86,7 @@ lxc_config_define(init_cmd);
+ lxc_config_define(init_cwd);
+ lxc_config_define(init_gid);
+ lxc_config_define(init_uid);
++lxc_config_define(init_groups);
+ lxc_config_define(jump_table_net);
+ lxc_config_define(keyring_session);
+ lxc_config_define(log_file);
+@@ -213,6 +214,7 @@ static struct lxc_config_t config_jump_table[] = {
+ 	{ "lxc.include",                    true,  set_config_includefiles,               get_config_includefiles,               clr_config_includefiles,               },
+ 	{ "lxc.init.cmd",                   true,  set_config_init_cmd,                   get_config_init_cmd,                   clr_config_init_cmd,                   },
+ 	{ "lxc.init.gid",                   true,  set_config_init_gid,                   get_config_init_gid,                   clr_config_init_gid,                   },
++	{ "lxc.init.groups",                true,  set_config_init_groups,                get_config_init_groups,                clr_config_init_groups,                },
+ 	{ "lxc.init.uid",                   true,  set_config_init_uid,                   get_config_init_uid,                   clr_config_init_uid,                   },
+ 	{ "lxc.init.cwd",                   true,  set_config_init_cwd,                   get_config_init_cwd,                   clr_config_init_cwd,                   },
+ 	{ "lxc.keyring.session",            true,  set_config_keyring_session,            get_config_keyring_session,            clr_config_keyring_session             },
+@@ -1177,6 +1179,64 @@ static int set_config_init_gid(const char *key, const char *value,
+ 	return 0;
+ }
+ 
++static int set_config_init_groups(const char *key, const char *value,
++				  struct lxc_conf *lxc_conf, void *data)
++{
++	__do_free char *value_dup = NULL;
++	gid_t *init_groups = NULL;
++	size_t num_groups = 0;
++	size_t idx;
++	char *token;
++
++	if (lxc_config_value_empty(value))
++		return clr_config_init_groups(key, lxc_conf, NULL);
++
++	value_dup = strdup(value);
++	if (!value_dup)
++		return -ENOMEM;
++
++	lxc_iterate_parts(token, value_dup, ",")
++		num_groups++;
++
++	if (num_groups == INT_MAX)
++		return log_error_errno(-ERANGE, ERANGE, "Excessive number of supplementary groups specified");
++
++	/* This means the string wasn't empty and all we found was garbage. */
++	if (num_groups == 0)
++		return log_error_errno(-EINVAL, EINVAL, "No valid groups specified %s", value);
++
++	idx = lxc_conf->init_groups.size;
++	init_groups = realloc(lxc_conf->init_groups.list, sizeof(gid_t) * (idx + num_groups));
++	if (!init_groups)
++		return ret_errno(ENOMEM);
++
++	/*
++	 * Once the realloc() succeeded we need to hand control of the memory
++	 * back to the config otherwise we risk a double-free when
++	 * lxc_conf_free() is called.
++	 */
++	lxc_conf->init_groups.list = init_groups;
++
++	/* Restore duplicated value so we can call lxc_iterate_parts() again. */
++	strcpy(value_dup, value);
++
++	lxc_iterate_parts(token, value_dup, ",") {
++		int ret;
++
++		gid_t group;
++
++		ret = lxc_safe_uint(token, &group);
++		if (ret)
++			return log_error_errno(ret, -ret, "Failed to parse group %s", token);
++
++		init_groups[idx++] = group;
++	}
++
++	lxc_conf->init_groups.size += num_groups;
++
++	return 0;
++}
++
+ static int set_config_hooks(const char *key, const char *value,
+ 			    struct lxc_conf *lxc_conf, void *data)
+ {
+@@ -4174,6 +4234,26 @@ static int get_config_init_gid(const char *key, char *retv, int inlen,
+ 	return lxc_get_conf_int(c, retv, inlen, c->init_gid);
+ }
+ 
++static int get_config_init_groups(const char *key, char *retv, int inlen,
++				  struct lxc_conf *c, void *data)
++{
++	int fulllen = 0, len;
++
++	if (!retv)
++		inlen = 0;
++	else
++		memset(retv, 0, inlen);
++
++	if (c->init_groups.size == 0)
++		return 0;
++
++	for (int i = 0; i < c->init_groups.size; i++)
++		strprint(retv, inlen, "%s%d", (i > 0) ? "," : "",
++			 c->init_groups.list[i]);
++
++	return fulllen;
++}
++
+ static int get_config_ephemeral(const char *key, char *retv, int inlen,
+ 				struct lxc_conf *c, void *data)
+ {
+@@ -4821,6 +4901,14 @@ static inline int clr_config_init_gid(const char *key, struct lxc_conf *c,
+ 	return 0;
+ }
+ 
++static inline int clr_config_init_groups(const char *key, struct lxc_conf *c,
++					 void *data)
++{
++	c->init_groups.size = 0;
++	free_disarm(c->init_groups.list);
++	return 0;
++}
++
+ static inline int clr_config_ephemeral(const char *key, struct lxc_conf *c,
+ 				       void *data)
+ {
diff --git a/recipes-containers/lxc/lxc_4.0.9.bb b/recipes-containers/lxc/lxc_4.0.9.bb
index 6720733..53f82d6 100644
--- a/recipes-containers/lxc/lxc_4.0.9.bb
+++ b/recipes-containers/lxc/lxc_4.0.9.bb
@@ -50,6 +50,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz \
 	file://dnsmasq.conf \
 	file://lxc-net \
         file://enable_seccomp_profile_when_compiled_libseccomp.patch \
+        file://add_lxc_init_groups_config_key.patch \
 	"
 
 SRC_URI[md5sum] = "365fcca985038910e19a1e0fff15ed07"
-- 
2.17.1

