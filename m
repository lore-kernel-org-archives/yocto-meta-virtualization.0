Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web10.8962.1581612532465368511
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 13 Feb 2020 08:48:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=QQ3QyYGG;
 spf=pass (domain: broadcom.com, ip: 209.85.216.68, mailfrom: scott.branden@broadcom.com)
Received: by mail-pj1-f68.google.com with SMTP id d5so2606456pjz.5
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 13 Feb 2020 08:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=64JL250MyUCxapFa2Ws+Lp5e0xBIzXlI0BHRNDV9SKo=;
        b=QQ3QyYGGjVyDmXVyzAD1fRGfjWY1OhDvjg/Dj51huFZ/4ysCHyNvRIQn1DnnbmSD0i
         dUHEZAAMctSrGIXJi3wgblCGGemfyq1b4tJvjIagiJBSYMozSrTVe6eYDzIUUs7thK+7
         xWLBi4mN/oG8gb9qMZx2HbA5TKl5kcPLOxEOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=64JL250MyUCxapFa2Ws+Lp5e0xBIzXlI0BHRNDV9SKo=;
        b=DZsMTYNvnbnTVj7P/GlFSTa9F0/QDrpYm0o690unV3zxueIMQ7pJMUBli9nJ755XT5
         gsrWb12LDmev+d47T4UUmilznfzn/Bs+bo9LSAuy1tcUZ8XaJwqtJ4w1R/iRSSPCe+QU
         fYmg+yaSe5GA240S1mkKPCgcRJMBoQhYy8OhAuxkx6KAlrDvTZZeEu42pwTEaAHjmAHb
         4dmAgRzJ+AhIBGxFi2855MXD/ZlKspobvjK/zqznCfudeWDR8/cZhUXoKPsRx6eFQ2NB
         TpfuCNWkk2iTDrvvx4x6m71FWLQthPCGDANAYw9GEQbiwhSSvd3TSLpS3VeDA/KhnOdM
         Kbpw==
X-Gm-Message-State: APjAAAXwF2d6fb8S7y4L+mLFt7qfXmELps4G+VOsJyiEaUWR3L3850pt
	SCbtIjalsFcBt6HHkCzZCiuZa0SQWES8crc+rnD6MVSECdOgFAQz4a2I/39UFjaogUxLT40Z0QG
	qNaOyvF05tTJp32Qy8yZNP53od9qh6gv1h6waABdXUSroR04lUHbibDamCvNVjiZCdD3yloFoJ2
	iK5YO2AaD7jjHhGywR8BbO6s8xnw70mA==
X-Google-Smtp-Source: APXvYqy3G9Kf/xwzVlSKsQXn4C6Piv5N/aTK/NnMuT1YO/Q7y/UA0VAlsLVgB0o2/YV/nB5jFDmacA==
X-Received: by 2002:a17:90a:cb8c:: with SMTP id a12mr6325687pju.71.1581612531134;
        Thu, 13 Feb 2020 08:48:51 -0800 (PST)
Return-Path: <scott.branden@broadcom.com>
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id r26sm3743951pga.55.2020.02.13.08.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 08:48:50 -0800 (PST)
From: "Scott Branden" <scott.branden@broadcom.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Rick Liu <rick.liu@broadcom.com>,
	Scott Branden <scott.branden@broadcom.com>
Subject: [PATCH] ovs: fix python 3.8 dict keys error
Date: Thu, 13 Feb 2020 08:48:44 -0800
Message-Id: <20200213164844.16352-1-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1

From: Rick Liu <rick.liu@broadcom.com>

Backport patch to python 3.8 issue with ovs do_compile runtime error:
RuntimeError: dictionary keys changed during iteration

https://patchwork.ozlabs.org/patch/1162374/

Signed-off-by: Rick Liu <rick.liu@broadcom.com>
Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 ...on3-dict-key-change-during-iteration.patch | 38 +++++++++++++++++++
 .../openvswitch/openvswitch_git.bb            |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/fix-python3-dict-key-change-during-iteration.patch

diff --git a/recipes-networking/openvswitch/openvswitch-git/fix-python3-dict-key-change-during-iteration.patch b/recipes-networking/openvswitch/openvswitch-git/fix-python3-dict-key-change-during-iteration.patch
new file mode 100644
index 0000000..f9cadd2
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch-git/fix-python3-dict-key-change-during-iteration.patch
@@ -0,0 +1,38 @@
+From d84109f0b60096ce71cd0537b31b69a7f5ea8756 Mon Sep 17 00:00:00 2001
+From: Flavio Leitner <fbl@sysclose.org>
+Date: Sat, 14 Sep 2019 20:17:28 -0300
+Subject: [PATCH] ovsdb-idlc.in: fix dict change during iteration.
+
+Python3 complains if a dict key is changed during the
+iteration.
+
+Use list() to create a copy of it.
+
+Traceback (most recent call last):
+  File "./ovsdb/ovsdb-idlc.in", line 1581, in <module>
+    func(*args[1:])
+  File "./ovsdb/ovsdb-idlc.in", line 185, in printCIDLHeader
+    replace_cplusplus_keyword(schema)
+  File "./ovsdb/ovsdb-idlc.in", line 179, in replace_cplusplus_keyword
+    for columnName in table.columns:
+RuntimeError: dictionary keys changed during iteration
+
+Signed-off-by: Flavio Leitner <fbl@sysclose.org>
+Signed-off-by: Ben Pfaff <blp@ovn.org>
+---
+ ovsdb/ovsdb-idlc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ovsdb/ovsdb-idlc.in b/ovsdb/ovsdb-idlc.in
+index 40fef39edf..22d0a4e22e 100755
+--- a/ovsdb/ovsdb-idlc.in
++++ b/ovsdb/ovsdb-idlc.in
+@@ -176,7 +176,7 @@ def replace_cplusplus_keyword(schema):
+                 'wchar_t', 'while', 'xor', 'xor_eq'}
+ 
+     for tableName, table in schema.tables.items():
+-        for columnName in table.columns:
++        for columnName in list(table.columns):
+             if columnName in keywords:
+                 table.columns[columnName + '_'] = table.columns.pop(columnName)
+ 
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index 072d7f1..5947759 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -33,6 +33,7 @@ SRC_URI = "file://openvswitch-switch \
            file://python-switch-remaining-scripts-to-use-python3.patch \
            file://systemd-update-tool-paths.patch \
            file://systemd-create-runtime-dirs.patch \
+           file://fix-python3-dict-key-change-during-iteration.patch \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
-- 
2.17.1

