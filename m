Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.39946.1578932200662370167
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Jan 2020 08:16:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=havcchEr;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: brendank310@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id c16so8977187qko.6
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Jan 2020 08:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0x/vdEPoixl8Bmk5cQTH7s0fWg1gNTqrAKAys25zySQ=;
        b=havcchEr58r0totX490zYqz5zfs/eGrviZoDmMvUMm7lbm/ZddaQZjSzibWQr0SWDB
         rzYxJJ/98jbOvs154PXELSY0xcTkpnpyJQ5Su3/NjVHt9k1TjYTTQQvDNjzn5XLc8mcy
         KqvSWpHzy33hM1uCo1SP146H57V7SAwaMEHLe4XmO80eTWosze69eSUJMAvZ+bK9DM3v
         onAj3owtxWVJZbneq0urZoYDTBtYUi6GuNBvtZbG9eRuGGEleg2AmrU2mqAjZ4NIqDgh
         uq8eHHxhvDh7II2WlJe4Eq59cWTBVuGe4r78Y1KlV5I8/H8XylkPfCjcQh/r/2eKQP7p
         8Utg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0x/vdEPoixl8Bmk5cQTH7s0fWg1gNTqrAKAys25zySQ=;
        b=EdWlkmByg2h8J2yE+gU9rhv06zc7PQJA8jpSUXf/0Ja4MRMkpFo2L4WibfAhrKn+Fx
         /rAdqQoGB/fkJqixAmGS+Am5R3WUM6vK1fmcb3UYms9o1eMGspfCK6Efirbyg94jlGsT
         pkhalLJL0IPg2wTB63242JBsfpjYoD2JAWFr9m+TplEcaMOCR9PlwN4TGhQzfWP+M1vn
         oMVI6YO6i1+22wWGFOVJVVJrjtjo0uiAunlciMs5KNxxTbBLuUVbXu4BXbAvctfDlisj
         Vqg/WIqFQpi0FCLz62N3k9TTtMkhMolHDsFF3Gxb4sZ3O+8Eublf+0Hb2+TOG5Ztcrt1
         Tqow==
X-Gm-Message-State: APjAAAVH84TUkLGU6C4vXsxrVakRBA/Qmgz88PB6lK9yHHw0TOhtD59G
	+P9c6drTKW8KzSh/CP2YkRpRyGA1x7w=
X-Google-Smtp-Source: APXvYqygh50I/n7rySnGaF1kq7+yNzCqmjobKtSmSN8idNc6JFGU4JzYZ7ZQdOPSuO934Zwn5t7UIw==
X-Received: by 2002:a05:620a:5f0:: with SMTP id z16mr16717020qkg.59.1578930491945;
        Mon, 13 Jan 2020 07:48:11 -0800 (PST)
Return-Path: <brendank310@gmail.com>
Received: from localhost.localdomain (pool-96-249-236-140.nrflva.fios.verizon.net. [96.249.236.140])
        by smtp.gmail.com with ESMTPSA id r205sm5150459qke.34.2020.01.13.07.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 07:48:11 -0800 (PST)
From: "Brendan Kerrigan" <brendank310@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Brendan Kerrigan <kerriganb@ainfosec.com>
Subject: [PATCH 2/3] xen: add package for xen-ucode
Date: Mon, 13 Jan 2020 10:47:41 -0500
Message-Id: <20200113154742.15509-3-brendank310@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200113154742.15509-1-brendank310@gmail.com>
References: <20200113154742.15509-1-brendank310@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brendan Kerrigan <kerriganb@ainfosec.com>

Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
---
 recipes-extended/xen/xen.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index a77b0d7..ed56e38 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -74,6 +74,7 @@ RDEPENDS_${PN}-base = "\
     ${PN}-fsimage \
     ${PN}-scripts-block \
     ${PN}-scripts-network \
+    ${PN}-ucode \
     ${PN}-xen-watchdog \
     ${PN}-xencommons \
     ${PN}-xendomains \
@@ -216,6 +217,7 @@ PACKAGES = "\
     ${PN}-scripts-network \
     ${PN}-shim \
     ${PN}-staticdev \
+    ${PN}-ucode \
     ${PN}-volatiles \
     ${PN}-xcutils \
     ${PN}-xencommons \
@@ -673,6 +675,10 @@ FILES_${PN}-shim = " \
     ${libdir}/xen/boot/xen-shim \
     "
 
+FILES_${PN}-ucode = " \
+    ${sbindir}/xen-ucode \
+    "
+
 FILES_${PN}-volatiles = "\
     ${sysconfdir}/default/volatiles/99_xen \
     ${sysconfdir}/tmpfiles.d/xen.conf \
-- 
2.20.1

