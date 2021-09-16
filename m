Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.2955.1631821634260741710
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Sep 2021 12:47:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eOwi/KqA;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id j1so5309898pjv.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Sep 2021 12:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A8aUk/9AHtcYeqt+IjKA/UL2NG4syCUGc3TW+Ybwl5o=;
        b=eOwi/KqAGK4R6ol+ua8+p3Ngc1bsbFygN6jp8mbw7AZv6fS10vEcYEv4sGx4tFrYtN
         nqO69Gv1r8/D+gMU3c9VA5f/T5CADk0oxREaeh4+ThMLM59AyJ8IXzoabNyiYmpWeyTd
         7rhF3McD+eL45m2OGQDe+orvjMqwOq55gzMwOa5OpzIHrFzITTWUh8pbyl3AaZWUdtKa
         0hTILQgbAMJCyMBLB1E53VkhciDGMfuZqgBrqWEWXfYeRLgPm86KWEZgv/5z/Rk5iAwr
         KOake28GI6uyZ39g4hQGMa8Ye4HOqHkVjSIhN75vFR37gasfM7PYtOTYcMNMJT3qldwJ
         hM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A8aUk/9AHtcYeqt+IjKA/UL2NG4syCUGc3TW+Ybwl5o=;
        b=mEqChg2X55jgMbh9lUeOatWfSbc0IDo8i6pvcTf0bJjAv5YcVS+0hotpatvunKiOQr
         2yYrK9JNqeqFLzZ8Y3Aa0D05xic/FZpfnTHk81rQZj9NQDBvwM5OG/LHdgNGHyk8qaRw
         znOUFbbu1XnHKLq1wdQkWQ9Lrpe4e57C7OVyUpwUkuYCLC01qwV+fP9efEnzmPOCElAJ
         ETPAfWV1oU4GO9yoA6ain58TVsH1sYHKMQTsqlGXepLR4SbGFRLshK9tB37f7GzAD0xQ
         ub7KXUy1jbs6Ea6DRhK4OxNM8+PDnDgI/Q07TgVbhEsvlUW73Le18skO0IgPHR22pr8i
         7XQA==
X-Gm-Message-State: AOAM530yPF9YZAuKMRi+n1yLZCVGsxbDuQa8h2vLiKPSD/nSnQEDQTNy
	yvRs6glNXRhFZ9sjVBCnijbkZgs6Y6o=
X-Google-Smtp-Source: ABdhPJz60g+HBdqmBYQl1mJFSl054UBxdZYEbDDuxJbAusf8+fU8Ynux4wx3b/yKhGWM0N3dXflHCw==
X-Received: by 2002:a17:90b:4b52:: with SMTP id mi18mr7814233pjb.112.1631821633554;
        Thu, 16 Sep 2021 12:47:13 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:8e48:889d:1351:d2d2])
        by smtp.gmail.com with ESMTPSA id o17sm3097966pfp.126.2021.09.16.12.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 12:47:13 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-virtualization][PATCH] libvirt: Security fix for CVE-2021-3631
Date: Thu, 16 Sep 2021 12:47:11 -0700
Message-Id: <20210916194711.759443-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: https://libvirt.org/git/libvirt.git
MR: 112956
Type: Security Fix
Disposition: Backport from https://gitlab.com/libvirt/libvirt/-/commit/15073504dbb624d3f6c911e85557019d3620fdb2
ChangeID: 314727e329e5b1351326737eb9c9232f465db184
Description:

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../libvirt/libvirt/CVE-2021-3631.patch       | 56 +++++++++++++++++++
 recipes-extended/libvirt/libvirt_7.2.0.bb     |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/CVE-2021-3631.patch

diff --git a/recipes-extended/libvirt/libvirt/CVE-2021-3631.patch b/recipes-extended/libvirt/libvirt/CVE-2021-3631.patch
new file mode 100644
index 0000000..c1fa8c2
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/CVE-2021-3631.patch
@@ -0,0 +1,56 @@
+From 15073504dbb624d3f6c911e85557019d3620fdb2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
+Date: Mon, 28 Jun 2021 13:09:04 +0100
+Subject: [PATCH] security: fix SELinux label generation logic
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+A process can access a file if the set of MCS categories
+for the file is equal-to *or* a subset-of, the set of
+MCS categories for the process.
+
+If there are two VMs:
+
+  a) svirt_t:s0:c117
+  b) svirt_t:s0:c117,c720
+
+Then VM (b) is able to access files labelled for VM (a).
+
+IOW, we must discard case where the categories are equal
+because that is a subset of many other valid category pairs.
+
+Fixes: https://gitlab.com/libvirt/libvirt/-/issues/153
+CVE-2021-3631
+Reviewed-by: Peter Krempa <pkrempa@redhat.com>
+Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2021-3631
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ src/security/security_selinux.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+Index: libvirt-6.1.0/src/security/security_selinux.c
+===================================================================
+--- libvirt-6.1.0.orig/src/security/security_selinux.c
++++ libvirt-6.1.0/src/security/security_selinux.c
+@@ -391,7 +391,15 @@ virSecuritySELinuxMCSFind(virSecurityMan
+         VIR_DEBUG("Try cat %s:c%d,c%d", sens, c1 + catMin, c2 + catMin);
+ 
+         if (c1 == c2) {
+-            mcs = g_strdup_printf("%s:c%d", sens, catMin + c1);
++            /*
++             * A process can access a file if the set of MCS categories
++             * for the file is equal-to *or* a subset-of, the set of
++             * MCS categories for the process.
++             *
++             * IOW, we must discard case where the categories are equal
++             * because that is a subset of other category pairs.
++             */
++            continue;
+         } else {
+             if (c1 > c2) {
+                 int t = c1;
diff --git a/recipes-extended/libvirt/libvirt_7.2.0.bb b/recipes-extended/libvirt/libvirt_7.2.0.bb
index 9cf2951..7bc93ff 100644
--- a/recipes-extended/libvirt/libvirt_7.2.0.bb
+++ b/recipes-extended/libvirt/libvirt_7.2.0.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://hook_support.py \
            file://gnutls-helper.py \
            file://0002-meson-Fix-compatibility-with-Meson-0.58.patch \
+           file://CVE-2021-3631.patch \
           "
 
 SRC_URI[libvirt.md5sum] = "92044b629216e44adce63224970a54a3"
-- 
2.25.1

