Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68336C77B7D
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 15:27:53 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.92032.1684164466925443449
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 May 2023 08:27:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=J/wnsQfb;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-965c3f9af2aso1979776666b.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 May 2023 08:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684164465; x=1686756465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Ltdjh7kQO4s4ncTE/gRzwcBG9EKkK4NZWX9CePQdCA=;
        b=J/wnsQfbsnj8bZFTKqcWKYkH6N80/2jY7EVgZSL7x9tolTESCg7gFGs904K1exblyg
         cJcZ+VwLC9n/xe0xnOzJF2JM88LaeCvtiuxFUfzKYjWk1rP3PJZSPsK27u3+VII9DLb8
         EJgmSugtCqY1rswv2zdL9LSmGPA/TAkEUdCe25YLOB+iafZbERtOKiYogHR40PMS9q8c
         lhRSKSblCPT+gKx1Zw0gV6h/mmhMPgP0GWLQFh4kJ0VQmgcF770Nv/BgilgjW23Dd88Q
         AIGn904VAo4v0iOvjAt5F+vCcMIg3vCh1iDH7usoM9m+xtqlm+9NPJb/bkrG3EXaQYKU
         3ViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684164465; x=1686756465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Ltdjh7kQO4s4ncTE/gRzwcBG9EKkK4NZWX9CePQdCA=;
        b=dVcTAkyA8jU4NVvJmwd786bSC4EOdlqfDVMrbTyNSZKWUKqYYktNsOv3GvXZd/zSJ2
         OtBVIC4N0tNs6kU3XhyGlQuA35eFfUuzN/C8Od8FIPDokZsOHTkd6dqotV3UFV993276
         /UKFlRP8dafU6pW+d9jlW3V6kgeqeV2/gAED7VJpTqSkTzT/tWEEnCPjbWi+zrxmXIhr
         cqlLqsDW/S/smsAkL1I73ilJ4gPY6Dpl9cXHM7MXlhKJoLBhWz0WLi+4wBPZhviuSU0p
         BxYOGkREn8AaIP67AVSP9U4IR8npwbacl+NxkrI9Kz1qsSOfJC20zhAiEOFkTPJLq0uZ
         9s0A==
X-Gm-Message-State: AC+VfDzvXezhC0VMRdFbkumDH0NQvS+Nip/MGmNVf7DfZfW7JRkMtHEB
	KrP7koLXqUVBc9OdrC0QM7F90oP9mmw=
X-Google-Smtp-Source: ACHHUZ6BTFiqKvgIWuDrzfYVwprSYN85eODztsczYMFMt/TM6iljMmebKtxQleDUKlmhZb17WoveBg==
X-Received: by 2002:a17:906:ef0d:b0:94e:ed5d:c864 with SMTP id f13-20020a170906ef0d00b0094eed5dc864mr33538284ejs.19.1684164464872;
        Mon, 15 May 2023 08:27:44 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id ze12-20020a170906ef8c00b009659fa6eeddsm9690128ejb.196.2023.05.15.08.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 08:27:44 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-virtualization][PATCH 1/5] busybox-initrd: auto pv from busybox
Date: Mon, 15 May 2023 17:26:20 +0200
Message-Id: <20230515152624.138713-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515152624.138713-1-adrian.freihofer@siemens.com>
References: <20230515152624.138713-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 15 May 2023 15:27:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8052

Not hardcoding the version of busybox from the core layer in this layer
is a small improvement for maintenance.

But the main motivation is to support the following layer combination
without getting a parse error from bitbake:
- poky LTS, branch = kirkstone
- meta-lts-mixins, branch = kirkstone/go
- meta-lts-mixins, branch = kirkstone/rust
- meta-virtualization, branch = master

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 ...{busybox-initrd_1.36.0.bb => busybox-initrd.bb} | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 rename recipes-core/busybox/{busybox-initrd_1.36.0.bb => busybox-initrd.bb} (59%)

diff --git a/recipes-core/busybox/busybox-initrd_1.36.0.bb b/recipes-core/busybox/busybox-initrd.bb
similarity index 59%
rename from recipes-core/busybox/busybox-initrd_1.36.0.bb
rename to recipes-core/busybox/busybox-initrd.bb
index 6108e9a..513ed13 100644
--- a/recipes-core/busybox/busybox-initrd_1.36.0.bb
+++ b/recipes-core/busybox/busybox-initrd.bb
@@ -1,5 +1,19 @@
 FILESEXTRAPATHS:prepend := "${THISDIR}/busybox-initrd:${COREBASE}/meta/recipes-core/busybox/busybox:${COREBASE}/meta/recipes-core/busybox/files:"
 
+def get_busybox_pv(d):
+    import re
+    corebase = d.getVar('COREBASE')
+    bb_dir = os.path.join(corebase, 'meta', 'recipes-core', 'busybox')
+    if os.path.isdir(bb_dir):
+        re_bb_name = re.compile(r"busybox_([0-9.]*)\.bb")
+        for bb_file in os.listdir(bb_dir):
+            result = re_bb_name.match(bb_file)
+            if result:
+                return result.group(1)
+    bb.fatal("Cannot find busybox recipe in %s" % bb_dir)
+
+PV := "${@get_busybox_pv(d)}"
+
 require recipes-core/busybox/busybox_${PV}.bb
 
 SRC_URI += "file://init.cfg \
-- 
2.40.1


