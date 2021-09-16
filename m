Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web08.4019.1631826836742075588
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Sep 2021 14:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xmf/eKlS;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id q23so5033993pfs.9
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Sep 2021 14:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HZN+B56WQ3ORinMAY2FekRHjtDf4CyLg/E1Bq9FzOcs=;
        b=Xmf/eKlSaqbmtABgnNAXDLiQFAE5VpGn5fIgqWbKwhA3gMu7S5KS59sYgdNh3zB2c+
         jgd8i1+0jRrZdQwtCjm5gXWNBTE07mHMFb/q6wvT+Bv9WcndCoriE4Jxi+WWv1F/7vVa
         KQ61jAm8AsB8k7K2tFpSKZwPQFxftfVPycZBIzwhoKB21uAxH1hroSAewoffq5ik0zjR
         WSlkYVpHh3+owHeRpARiT6uLo1hQowGowrRwd3C3H3Jwj6PDuU3M8YACK8DPlVRBlIEh
         2Rm7ZChj2Db3h3h30sD2rm0O3uybpAlU9wc73BmpaIDvH25Z5h+PJBBndBmPhYRcgbRh
         IODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HZN+B56WQ3ORinMAY2FekRHjtDf4CyLg/E1Bq9FzOcs=;
        b=iInUpW5SFj1wOy2+oi0/APZ+KakT/98D+Pnl/fA0JTAHr2kIfIOx54s1TBoZxVjcXN
         pl42yravOJZGDhDCCf/ThoDXb/KwlGYt4P+DtoKlE34YXDMfxBBmvnH6REqMT8GK/jIg
         78MlN8kdCq0oXLEUcMwQJx2lub08cmq0Y4UGTKcTQlJ5gYmrnkz7TdOuqV9qvAs9Ak6y
         BtMKKvmBSLBh2hRlneiYi1Tx4/iudX0oPYiGNX2Pi5eQB2C2DaL5VqbVsW8L+zf74YsN
         OOlLvmSnjqI2sWh8KftbKEQ/c12I/Kc+nOnkJPzaathslNS4W6Z+jdYPms9VZBC+hyFZ
         Qudg==
X-Gm-Message-State: AOAM531Pk+HDJ3BdCQE/pl9fzm3xoS0bbEqKAyZ1ZJPLBgVl20/vT1IV
	y1i18AgfX3U2tw3/k1/zxo0hUgtNUFA=
X-Google-Smtp-Source: ABdhPJzpQ10Ig1g8Gt+lcIyKHfTSRxWmheQtahBrIKMczCO5hE3/CR6Xxi45ibE0ojxg9i1jqqXpkA==
X-Received: by 2002:aa7:8201:0:b0:3fd:7dbd:fbbe with SMTP id k1-20020aa78201000000b003fd7dbdfbbemr7319218pfi.43.1631826836064;
        Thu, 16 Sep 2021 14:13:56 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:8e48:889d:1351:d2d2])
        by smtp.gmail.com with ESMTPSA id a11sm3814967pfo.31.2021.09.16.14.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 14:13:55 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-virtualization][hardknott][PATCH 2/2] libvirt: Security fix for CVE-2021-3631
Date: Thu, 16 Sep 2021 14:13:53 -0700
Message-Id: <20210916211353.2143749-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916211353.2143749-1-akuster808@gmail.com>
References: <20210916211353.2143749-1-akuster808@gmail.com>
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
 recipes-extended/libvirt/libvirt_6.3.0.bb     |  1 +
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
diff --git a/recipes-extended/libvirt/libvirt_6.3.0.bb b/recipes-extended/libvirt/libvirt_6.3.0.bb
index fc2b63d..33bac76 100644
--- a/recipes-extended/libvirt/libvirt_6.3.0.bb
+++ b/recipes-extended/libvirt/libvirt_6.3.0.bb
@@ -44,6 +44,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://CVE-2020-25637_2.patch \
            file://CVE-2020-25637_3.patch \
            file://CVE-2020-25637_4.patch \
+           file://CVE-2021-3631.patch \
           "
 
 SRC_URI[libvirt.md5sum] = "1bd4435f77924f5ec9928b538daf4a02"
-- 
2.25.1

