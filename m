Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.12546.1630770864583223030
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 04 Sep 2021 08:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J8OQCGdt;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: sanakazisk19@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so1563510pjr.1
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 04 Sep 2021 08:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=THGVIezQbPGl+T9EwWAh6u3cCWts2HaTb+dME3xA/v8=;
        b=J8OQCGdtExfepJv0AATqIPUxKMN1BJAbUxuHSKmZNXDp7+M33lM6qbXGlSM8FYoq+G
         Ct9dBfUV9D+jvS+sqSHUyhZUu0sRzI22Mw/QbSya7RnUoSshH5T7BWfaPDCDaiIU4yeb
         4KQDscZP1D4KMLy1nK/75IUIrMgqwF66NHlxWHvu6N2G64JDKUJDVhgfP2JtvYdauats
         sZZ9G6FVXGO+2dmYCnvSJazjvAoMlrdVqd+cRsxcB44CW10GFakXkEmTi9hBttiO60N9
         yI3YNTSkAjUROSAPLldT6PiJrTgrqCdmpxbk/eG1CiZiac/a0fFe6defiHcdToBC4Aku
         jGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=THGVIezQbPGl+T9EwWAh6u3cCWts2HaTb+dME3xA/v8=;
        b=DJj1QQyExjV9ODy3ZRdpfgEbxg+qg8uBm/XOeEwBzwWpYuqOq++GAhzgG2unt7HtJt
         Qgxq2bbnogO/FWN8eastp8tYSbtgEjRZ/3fqmjcQZbubzjJnWKyQZ7wJF7ZNcyphYfD6
         L2pMRN2O5Ffr2CCLVCgkpK5vOVIJNQrTQRqb4jIej+sWb6cgXJllvVoHGkmPOmI4ccGJ
         OTtT2QZjFEY/wxsaEjHy78VTSFokUOQotpJkV8viKBgnCczV+E6vdXLU5nKnzEPNG1F2
         J3RznvK8Ypi8GjzrLS8RZsi4Odd3ac1Zeec+jxeZilLEvYQ8Zlexpvw3PBx2V9n4u0eK
         fLnQ==
X-Gm-Message-State: AOAM531VQ/m+7rOma3o1DRGTzVvYV+W3aJvwC5386Sm3GHPDNINSIbrq
	moqgv3GzKIuSOkmuI0t29OugjTS6Ejo=
X-Google-Smtp-Source: ABdhPJyofPwogxZEpKdwvWcUaTZqYkeoPMPqCs1zVusckeN3QB5EPH3rSNhEFBsPLad/puTlC9dEDQ==
X-Received: by 2002:a17:90a:8005:: with SMTP id b5mr4802760pjn.190.1630770863746;
        Sat, 04 Sep 2021 08:54:23 -0700 (PDT)
Return-Path: <sanakazisk19@gmail.com>
Received: from localhost.localdomain ([2401:4900:1b38:d6bd:c41b:88f2:9735:f437])
        by smtp.gmail.com with ESMTPSA id x9sm2740848pjp.50.2021.09.04.08.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 08:54:23 -0700 (PDT)
From: "sana kazi" <sanakazisk19@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nishaparrakat@gmail.com,
	purushottamchoudhary29@gmail.com
Subject: [meta-virtualization][master][PATCHv2] lxc: Enable seccomp support for lxc
Date: Sat,  4 Sep 2021 21:24:08 +0530
Message-Id: <20210904155408.6015-1-sanakazisk19@gmail.com>
X-Mailer: git-send-email 2.17.1

Enabled seccomp support for lxc.
Also added a patch to enable seccomp.profile only when compiled with
libseccomp. Currently, seccomp.profile is silently ignored. This
could lead to the false impression that the seccomp filter is
applied while it actually isn't.

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
---
 ...omp_profile_when_compiled_libseccomp.patch | 46 +++++++++++++++++++
 recipes-containers/lxc/lxc_4.0.9.bb           |  2 +
 2 files changed, 48 insertions(+)
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
index 0ef81a5..6720733 100644
--- a/recipes-containers/lxc/lxc_4.0.9.bb
+++ b/recipes-containers/lxc/lxc_4.0.9.bb
@@ -49,6 +49,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz \
 	file://tests-add-no-validate-when-using-download-template.patch \
 	file://dnsmasq.conf \
 	file://lxc-net \
+        file://enable_seccomp_profile_when_compiled_libseccomp.patch \
 	"
 
 SRC_URI[md5sum] = "365fcca985038910e19a1e0fff15ed07"
@@ -72,6 +73,7 @@ EXTRA_OECONF += "--enable-log-src-basename --disable-werror"
 PACKAGECONFIG ??= "templates \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'seccomp', '', d)} \
 "
 PACKAGECONFIG[doc] = "--enable-doc --enable-api-docs,--disable-doc --disable-api-docs,,"
 PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
-- 
2.17.1

