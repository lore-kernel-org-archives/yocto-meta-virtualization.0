Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC2A4C5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 08:34:28 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8720.1786696467438054137
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 14 Aug 2026 01:34:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Ev21Cx/d;
 spf=pass (domain: mvista.com, ip: 209.85.216.46, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38f620399a0so631112a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 14 Aug 2026 01:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1786696467; x=1787301267; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sVYLLc7gR7bJU7jRoe+ea9XdDflpvHA79XepuzXtfbw=;
        b=Ev21Cx/damn+bbzv7Ca5w/+oTxXtDG5hPBUhRi6Cgjtap0+ZRzq7sg5RRFNhIgfK4q
         7Ocs7lW6uFjosK0XbIicb9vQmfVwRQTuGySqsJPaa6RoZ9q695v/062PtV9Hj7aFBUuz
         9gR1ti7mHAx1jsdi1zt0ORJHM/CQCftII0MdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786696467; x=1787301267;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sVYLLc7gR7bJU7jRoe+ea9XdDflpvHA79XepuzXtfbw=;
        b=UY0/DUOKtqSDKTKSxBiAiw/HRZbufV3ap1lZFgR2tDT4ASl6W/gfhsyyD90TsjcqBm
         n+WJMz2zXJEQotNchSJp2kE1j0tzFvXFd5qGLoaxTAK/aj0PJfdImkrQeMXUZnA7qBzo
         mS0b1YOorvjF1reUlpBj16KYFmzPOLw6rcd1+RrsNM+v0OYc4waDPmInw3b/vFw/mSQ0
         zVfMQ2Yu/YJRR4xd87+92HRoE/fNYdeNnN1VtV+8IHY2/ImLPor/G9fMoah+9yN3gJeO
         j9+OkLH4g3SCw+3GB52wX3RRkYgyW44lg3/RWvn+g+moLNWPxVkwFnxJUhPtOAkEEmet
         d6Nw==
X-Gm-Message-State: AOJu0Yzww0/sk6tPnEyubkOAG2FrzDjShGC//KGGF5HhL0Qu86zNWbQB
	F6nhTWQCyhUl0GYcWyvTxyiFiumnRWQHoZq3rDCD7u71QtCaPe3wwZCylvc3MUr/ixIcmh/WXlt
	mxhgskOo=
X-Gm-Gg: AR+sD12W68QealYzjnJYruuYDdBKgOWMt9rU1fyMW2vG+oNvCjZFhs14tAWr6zsYPwR
	HuShb0XoPUqSTQi3zQJbeWynZ8RR5MxU2Z57iM+6otItu57XsjiPqZv5V02DWQQVkjAGsI9qDCK
	qkQ52GAh0k1Qv4SnXM59xAMM981RJIYLgojPInuWfSaZkpyF/Sh4Mqm3jnGbMwODjIPbpi1Erzs
	V5fIUVeUpE7dgRVsDDNP6dm3sUdW42wF+ibaezl62piiGcUsm4dwMY7u7sqPemaAoAiyp0vquSM
	I0jWjrL6T3hOQGta7HjVqeXfMlJoT150f3j8oT+uO0rWyT8X1TVnXnJFe94SXGLssUSSOYo+9g7
	q3cZjr5KIUeFPaHcM/f5ZhqK5WXozfEAEsByx7CVWvfE9HflVj26OYImARkoVaH9MQogwWUlIDd
	I12fRijJu4XevLxA8RY4VTVPLOQ8o11sjMmLzMBYqnyOD1xTawzB8V+crsiuC8XLZ3lB93r7Ygb
	w==
X-Received: by 2002:a17:90b:5388:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-3933b8fc728mr4453156a91.10.1786696466638;
        Fri, 14 Aug 2026 01:34:26 -0700 (PDT)
Received: from MVIN00013.mvista.com ([152.59.5.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea7fe465sm1780819eec.25.2026.08.14.01.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 01:34:26 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-virtualization][scarthgap][PATCH] libvirt: fix for CVE-2026-63622
Date: Fri, 14 Aug 2026 14:02:09 +0530
Message-ID: <20260814083211.590990-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 14 Aug 2026 08:34:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10041

Pick patch from [1] also mentioned at Debian report in [2]

[1] https://gitlab.com/libvirt/libvirt/-/commit/801160fd414ca2cc402bc01ead09b7ed4c3b8f5b
[2] https://security-tracker.debian.org/tracker/CVE-2026-63622
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-63622

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libvirt/libvirt/CVE-2026-63622.patch      | 73 +++++++++++++++++++
 recipes-extended/libvirt/libvirt_10.0.0.bb    |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/CVE-2026-63622.patch

diff --git a/recipes-extended/libvirt/libvirt/CVE-2026-63622.patch b/recipes-extended/libvirt/libvirt/CVE-2026-63622.patch
new file mode 100644
index 00000000..093cd1c6
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/CVE-2026-63622.patch
@@ -0,0 +1,73 @@
+From 801160fd414ca2cc402bc01ead09b7ed4c3b8f5b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?HE=20WEI=EF=BC=88=E3=82=AE=E3=82=AB=E3=82=AF=EF=BC=89?=
+ <skyexpoc@gmail.com>
+Date: Tue, 28 Jul 2026 17:49:02 +0100
+Subject: [PATCH] util: virFileChownFiles: do not follow symlinks
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+virFileChownFiles() selected entries with virFileIsRegular() (stat(), follows
+symlinks) and changed ownership with chown() (follows symlinks). A component
+that owns the target directory at a lower privilege (e.g. the swtpm/tss state
+directory) can plant a symlink to an arbitrary regular file and have the root
+caller chown that file. Use lstat() to skip non-regular entries and
+fchownat(..., AT_SYMLINK_NOFOLLOW) so a symlink final component is never
+followed.
+
+Fixes: CVE-2026-63622
+Signed-off-by: HE WEI（ギカク） <skyexpoc@gmail.com>
+[DB: use g_lstat instead of stat; use lchown instead of
+ fchownat for portability; added comment]
+Reviewed-by: Ján Tomko <jtomko@redhat.com>
+Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
+
+CVE: CVE-2026-63622
+Upstream-Status: Backport [https://gitlab.com/libvirt/libvirt/-/commit/801160fd414ca2cc402bc01ead09b7ed4c3b8f5b]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/util/virfile.c | 16 ++++++++++++++--
+ 1 file changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/src/util/virfile.c b/src/util/virfile.c
+index f3108e9..baeb842 100644
+--- a/src/util/virfile.c
++++ b/src/util/virfile.c
+@@ -3172,6 +3172,12 @@ int virDirIsEmpty(const char *path,
+  *
+  * Change ownership of all regular files in a directory.
+  *
++ * This will NOT follow any symlinks, to avoid security risks.
++ * It is assumed the process using content under @name will
++ * be unprivileged, thus less trusted than libvirt. If it is
++ * compromised it might attempt to create symlinks in @name to
++ * escalate privileges on a subsequent call to virFileChownFiles.
++ *
+  * Returns -1 on error, with error already reported, 0 on success.
+  */
+ #ifndef WIN32
+@@ -3188,13 +3194,19 @@ int virFileChownFiles(const char *name,
+ 
+     while ((direrr = virDirRead(dir, &ent, name)) > 0) {
+         g_autofree char *path = NULL;
++        struct stat sb;
+ 
+         path = g_build_filename(name, ent->d_name, NULL);
+ 
+-        if (!virFileIsRegular(path))
++        if (g_lstat(path, &sb) < 0) {
++            virReportSystemError(errno, _("cannot stat '%1$s'"), path);
++            return -1;
++        }
++
++        if (!S_ISREG(sb.st_mode))
+             continue;
+ 
+-        if (chown(path, uid, gid) < 0) {
++        if (lchown(path, uid, gid) < 0) {
+             virReportSystemError(errno,
+                                  _("cannot chown '%1$s' to (%2$u, %3$u)"),
+                                  ent->d_name, (unsigned int) uid,
+-- 
+2.50.1
+
diff --git a/recipes-extended/libvirt/libvirt_10.0.0.bb b/recipes-extended/libvirt/libvirt_10.0.0.bb
index c6e6069c..4076a0cf 100644
--- a/recipes-extended/libvirt/libvirt_10.0.0.bb
+++ b/recipes-extended/libvirt/libvirt_10.0.0.bb
@@ -38,6 +38,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://CVE-2024-2494.patch \
            file://CVE-2024-4418.patch \
            file://CVE-2025-13193.patch \
+           file://CVE-2026-63622.patch \
           "
 
 SRC_URI[libvirt.sha256sum] = "8ba2e72ec8bdd2418554a1474c42c35704c30174b7611eaf9a16544b71bcf00a"
-- 
2.50.1


