Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.693.1630648078280831930
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 Sep 2021 22:47:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PNMTxUcW;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: sanakazisk19@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id u11-20020a17090adb4b00b00181668a56d6so3175952pjx.5
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 02 Sep 2021 22:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=2fDp+BwjUqjOtwH+i+RaMgmTJ0vTELbDxZboMLRJEUI=;
        b=PNMTxUcW4yzsep7vJAV0ib4Ggx2Xgvtt06cWy4C8R6305IofgxJeaaol6g1FyawpcP
         HkRA5KBjgVA+nTCJFyzTn8XmNDKbgH14awdL3OlhaIHnTvY2DEB/UkIZzAbNXkwpiQLp
         urcBEnij1LPyE2gusYDFFzecRsuWKuwBMxJ9b1pkMpnbtP3QLx/rZ7ZyrKB35OkautAk
         73KctgCxUNAYIjMEkqr6IRJ8cMCgW5lE9/uNdWfSBVCitB6/1Bw2qAha7DU8yh8GLb3H
         vi5gL5iykBbwQ3thUXkXyPRifpeD0nxyCSZUVwlkom3jIhf4L9Vf7sDCOvwoTs7QQkk7
         OYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=2fDp+BwjUqjOtwH+i+RaMgmTJ0vTELbDxZboMLRJEUI=;
        b=O3noxHiAup8CVqnu0+uJIlMinwbuYc2V5rBimqKfS2F904pGv8LiWgqhtIVcYSjjCi
         /XgS1T3gYORhMgz5QPK4+OrNUValkho1AB/ln0Riib27r575dEibaEeR/DrNjSEXG3bB
         snL2YniFp59yVPi760fHG4M9jBL71kzuVvHSO/dflca8cQOeRSn8krZOB/Dr1XLtq9nh
         c9jtShn9YbL0sT0Wga0agia7+PYmGzvPz0NgsHdg+T9r/qrCvlcAzbYF85A1sUnIa9F4
         hmz1OZBktZDbv8Hp0NnNVbR0yDqJrWKWPdo3WvuNozEEKaLWoAiYZM8G3vXXXa8KwIOc
         0dvQ==
X-Gm-Message-State: AOAM530dM5k9LkxEcuRJVOWcHiLyBljnlFOuLM0hgqF8eOWh184xb3Mb
	2VZw4r2hmg1M2AMVdyhIkwgRLRWV2J8=
X-Google-Smtp-Source: ABdhPJzdyXDWIkvDTF/se5aLbUYylFL28rTNdphqaN3aNcXL08qVaafk+B6ig8/LUNG3vq9GZijZhQ==
X-Received: by 2002:a17:90b:4b4d:: with SMTP id mi13mr8144140pjb.160.1630648077442;
        Thu, 02 Sep 2021 22:47:57 -0700 (PDT)
Return-Path: <sanakazisk19@gmail.com>
Received: from localhost.localdomain ([2401:4900:190a:600c:b02b:a85a:72bd:f2])
        by smtp.gmail.com with ESMTPSA id b16sm3939450pfr.138.2021.09.02.22.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 22:47:56 -0700 (PDT)
From: "sana kazi" <sanakazisk19@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nishaparrakat@gmail.com,
	purushottamchoudhary29@gmail.com
Subject: [meta-virtualization][master][PATCH] lxc: Enable seccomp support for lxc
Date: Fri,  3 Sep 2021 11:17:37 +0530
Message-Id: <20210903054737.20114-1-sanakazisk19@gmail.com>
X-Mailer: git-send-email 2.17.1

Enabled seccomp support for lxc.
Also added a patch to enable seccomp.profile only when compiled with
libseccomp. Currently, seccomp.profile is silently ignored. This
could lead to the false impression that the seccomp filter is
applied while it actually isn't.

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
---
 ...omp_profile_when_compiled_libseccomp.patch | 46 +++++++++++++++++++
 recipes-containers/lxc/lxc_4.0.9.bb           |  3 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 recipes-containers/lxc/files/enable_seccomp_profile_when_compiled_libseccomp.patch

diff --git a/recipes-containers/lxc/files/enable_seccomp_profile_when_compiled_libseccomp.patch b/recipes-containers/lxc/files/enable_seccomp_profile_when_compiled_libseccomp.patch
new file mode 100644
index 0000000..f0a5813
--- /dev/null
+++ b/recipes-containers/lxc/files/enable_seccomp_profile_when_compiled_libseccomp.patch
@@ -0,0 +1,46 @@
+From 3d46e1d1f8e904fddd4fab3e8d0c6cf57d2ddd4e Mon Sep 17 00:00:00 2001
+From: Maximilian Blenk <Maximilian.Blenk@bmw.de>
+Date: Mon, 23 Aug 2021 22:04:40 +0200
+Subject: [PATCH] config: enable seccomp profile only when compiled with
+ libseccomp
+
+Make lxc fail if seccomp.profile is specified but lxc is compiled
+without seccomp support. Currently, seccomp.profile is silently ignored
+if is specified in such a scenario. This could lead to the false
+impression that the seccomp filter is applied while it actually isn't.
+
+Signed-off-by: Maximilian Blenk <Maximilian.Blenk@bmw.de>
+---
+ src/lxc/confile.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+Upstream-Status: Submitted [https://github.com/lxc/lxc/pull/3947/commits/3d46e1d1f8e904fddd4fab3e8d0c6cf57d2ddd4e]
+
+diff --git a/src/lxc/confile.c b/src/lxc/confile.c
+index d8b96c6921..1cc8da15f1 100644
+--- a/src/lxc/confile.c
++++ b/src/lxc/confile.c
+@@ -1211,7 +1211,11 @@ static int set_config_seccomp_notify_proxy(const char *key, const char *value,
+ static int set_config_seccomp_profile(const char *key, const char *value,
+ 				      struct lxc_conf *lxc_conf, void *data)
+ {
++#ifdef HAVE_SECCOMP
+ 	return set_config_path_item(&lxc_conf->seccomp.seccomp, value);
++#else
++	return ret_set_errno(-1, ENOSYS);
++#endif
+ }
+ 
+ static int set_config_execute_cmd(const char *key, const char *value,
+@@ -4383,7 +4387,11 @@ static int get_config_seccomp_notify_proxy(const char *key, char *retv, int inle
+ static int get_config_seccomp_profile(const char *key, char *retv, int inlen,
+ 				      struct lxc_conf *c, void *data)
+ {
++#ifdef HAVE_SECCOMP
+ 	return lxc_get_conf_str(retv, inlen, c->seccomp.seccomp);
++#else
++	return ret_errno(ENOSYS);
++#endif
+ }
+ 
+ static int get_config_autodev(const char *key, char *retv, int inlen,
diff --git a/recipes-containers/lxc/lxc_4.0.9.bb b/recipes-containers/lxc/lxc_4.0.9.bb
index 0ef81a5..1fd3ea5 100644
--- a/recipes-containers/lxc/lxc_4.0.9.bb
+++ b/recipes-containers/lxc/lxc_4.0.9.bb
@@ -49,6 +49,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz \
 	file://tests-add-no-validate-when-using-download-template.patch \
 	file://dnsmasq.conf \
 	file://lxc-net \
+        file://enable_seccomp_profile_when_compiled_libseccomp.patch \
 	"
 
 SRC_URI[md5sum] = "365fcca985038910e19a1e0fff15ed07"
@@ -69,7 +70,7 @@ ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
 EXTRA_OECONF += "--enable-log-src-basename --disable-werror"
 
-PACKAGECONFIG ??= "templates \
+PACKAGECONFIG ??= "templates seccomp \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
 "
-- 
2.17.1

