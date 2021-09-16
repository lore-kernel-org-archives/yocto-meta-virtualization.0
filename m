Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.4135.1631827390073507839
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Sep 2021 14:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=apdlCu7I;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id j6so7176864pfa.4
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Sep 2021 14:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gA7L3K2z87kHLvdS7FxITRyuAQRV69RJ7ZUGYRbAgCk=;
        b=apdlCu7Il6+TFlkxzf6x3+XflB3BcFgzP/bmi6yFA3YsREjvMOCXMM+k6y+wArezzA
         3bXEEgcBOEFx2/cL9P9OMyTrWvdkcx5I9eBzQ2rP29HV0yHflfr+sa3OyN9Jc4xx+/Rm
         HCP8pAvU1j7Wl5z7TV/oI9lm1cwvf2ymtfAeHQkHfD/xrWILXOR+aJhPy85+iVCbHI4O
         QBa37MYqZqCxRtH2s2wUnh2MNlO354ZRezC3FQvIVioPuEt8RhfMe39Yot0iqU15NXy9
         6qkoztpFgDEr30X2DVhg0D2CUBNbZnr4RhYFAO/ypxeqk/TlFAIfi0lTZLDtg9TE6kA1
         ihyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gA7L3K2z87kHLvdS7FxITRyuAQRV69RJ7ZUGYRbAgCk=;
        b=g7OKJu4a+sqw5ELdrBB7eJzBDs9OPVlF1azJmz7l/OuyYO3NW+3yUQ+D+VXE49RiVO
         RFJKHlIaqGSxgOIfVgiQFjevosrb2Zg1qKu9xG3+W6LzPUC0VYCJoFJD3U8tTY503ibe
         3W76MdbuKXlkkWqLw/uluJJrhn0/BrMoM/rqb7ja6cOE4HWuPM5kcpDBBLEn4Qo6m8av
         1Za9EjG5E+oeTHlf+kluodYbKpyPGPI5eVQs39X+2Ng0P5BkadTnoyEzP2vl0wdTsWqH
         GcV6i6O921+x56KTJSJw5lLqkIlE4IJ4TGYSVG5IpWefuSwg4/cRAYkPnQoGlSg+Y6ri
         Xcgw==
X-Gm-Message-State: AOAM5323jTuCIXyDDMU3MIX9mITJ3ic1EcMqi6HRRhp1dLhzbmHrFhMD
	iBi+MkNqNo/0bhqG2jbXUFnOARfRVRw=
X-Google-Smtp-Source: ABdhPJy9zuZ/3J9hTc4U3We37bXxyXz5Z4zodFlm31Ok17WrT5w5bsW9SaT+4XcfashSJHZOzfJzEQ==
X-Received: by 2002:a65:4581:: with SMTP id o1mr6786211pgq.349.1631827389361;
        Thu, 16 Sep 2021 14:23:09 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:8e48:889d:1351:d2d2])
        by smtp.gmail.com with ESMTPSA id qe17sm3520209pjb.39.2021.09.16.14.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 14:23:09 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-virtualization][dunfell][PATCH 3/3] libvirt: Security fix for CVE-2021-3631
Date: Thu, 16 Sep 2021 14:23:05 -0700
Message-Id: <20210916212305.2211766-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916212305.2211766-1-akuster808@gmail.com>
References: <20210916212305.2211766-1-akuster808@gmail.com>
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
 recipes-extended/libvirt/libvirt_6.1.0.bb     |  1 +
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
diff --git a/recipes-extended/libvirt/libvirt_6.1.0.bb b/recipes-extended/libvirt/libvirt_6.1.0.bb
index aa7563f..d4978b3 100644
--- a/recipes-extended/libvirt/libvirt_6.1.0.bb
+++ b/recipes-extended/libvirt/libvirt_6.1.0.bb
@@ -45,6 +45,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://CVE-2020-25637_2.patch \
            file://CVE-2020-25637_3.patch \
            file://CVE-2020-25637_4.patch \
+           file://CVE-2021-3631.patch \
           "
 
 SRC_URI[libvirt.md5sum] = "a870e63f20fac2ccf98e716d05256145"
-- 
2.25.1

