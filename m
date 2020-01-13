Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.40139.1578932232522630487
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Jan 2020 08:17:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BDDBKWx4;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: brendank310@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id f16so4235523qvi.4
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Jan 2020 08:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RI5Te2w9aHV7lnFt9mdD8ZdaNmmtBruo5OMCrExCDQk=;
        b=BDDBKWx4wEqOfPq6yfu9aYWU6kLboVdBSaAfTL2Ln+UZSV3Ma1rXFPEgejv6F9ynes
         rinjgUPsYNZuPvVtNDaJjpi1eaX+mPp1xoqAzHr8HlLUAKD+IAVL/WhnuQj0G41T4h5v
         mmylP4QW+y/pdzyPOXlAzeiGhsjke8xtS3EFGYDDdi5OGwEAQ2Z2ogb4QVLLHuP0HN+Z
         JUKWcrTO8yJkJ7UzEnjtVulpYqP57NDv1PQnCfdk5zg24Hcnsvgz70S0Bt9Pg7KJuCiL
         RbsifSpedDwMU/GQtFfnAjL3Oc1Aou28muBT/tZL5kAGq8GK+4IFrJmbZSVw5qlMqR70
         reYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RI5Te2w9aHV7lnFt9mdD8ZdaNmmtBruo5OMCrExCDQk=;
        b=LMY9E2plL9YivIFLqWx8AgAws0vz0ZKUGR2GmcFr0fGUXeccxcuAoFNvrUc8kX7kmS
         2U4ASPw+2mnwpEC8mARN9bTTXGa7GdlzOdLpxraX+KonpsFzoB0Nmzt1zjzKPyIy6fL2
         ry/3PTlBHjIPtmNw09Yt1oO6LH3iRBXH7r+0Sa8xNcQVfrj3OsXKmp2sfWcH9V0col4Y
         rKQhaQBcI3eCSB7ajqI7QI+3jB83c+bXt1vm42P9SI3lskuE6+aUwADnhr24Su6SipUi
         i48btJQ1SQfZ423zZ4uXVZ+OgLmH1LATLMMkfOszMqWo3QRWcEMehbehj/sgO2w5JSl6
         G//Q==
X-Gm-Message-State: APjAAAUbKDj36yufvV5enIfykBMvr0+c2WX6Bv6bjXJFH3WCgRnbXNkP
	sk+jdf6b6pkmOX8p23RxjSc4ujr2/wY=
X-Google-Smtp-Source: APXvYqwSvzT0D6WmafkCk9cuAl2NbzuygQPGviyT++BxN3utVcWZF6X47SqmlLLvxZx2YQOvfmQvXQ==
X-Received: by 2002:a0c:c542:: with SMTP id y2mr11808471qvi.225.1578930492592;
        Mon, 13 Jan 2020 07:48:12 -0800 (PST)
Return-Path: <brendank310@gmail.com>
Received: from localhost.localdomain (pool-96-249-236-140.nrflva.fios.verizon.net. [96.249.236.140])
        by smtp.gmail.com with ESMTPSA id r205sm5150459qke.34.2020.01.13.07.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 07:48:12 -0800 (PST)
From: "Brendan Kerrigan" <brendank310@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Brendan Kerrigan <kerriganb@ainfosec.com>
Subject: [PATCH 3/3] xen: upgrade to 4.13.0
Date: Mon, 13 Jan 2020 10:47:42 -0500
Message-Id: <20200113154742.15509-4-brendank310@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200113154742.15509-1-brendank310@gmail.com>
References: <20200113154742.15509-1-brendank310@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brendan Kerrigan <kerriganb@ainfosec.com>

Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
---
 ...01-python-pygrub-pass-DISTUTILS-xen.4.13.patch} |  3 +++
 recipes-extended/xen/xen_4.12.0.bb                 | 12 ------------
 recipes-extended/xen/xen_4.13.0.bb                 | 14 ++++++++++++++
 3 files changed, 17 insertions(+), 12 deletions(-)
 rename recipes-extended/xen/files/{0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch => 0001-python-pygrub-pass-DISTUTILS-xen.4.13.patch} (96%)
 delete mode 100644 recipes-extended/xen/xen_4.12.0.bb
 create mode 100644 recipes-extended/xen/xen_4.13.0.bb

diff --git a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen.4.13.patch
similarity index 96%
rename from recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch
rename to recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen.4.13.patch
index 6504d86..630fe05 100644
--- a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch
+++ b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen.4.13.patch
@@ -13,6 +13,9 @@ Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
 Forward-ported to Xen 4.12.0
 Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
 
+Forward-ported to Xen 4.13.0
+Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
+
 diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
 index 3063c49..513314b 100644
 --- a/tools/pygrub/Makefile
diff --git a/recipes-extended/xen/xen_4.12.0.bb b/recipes-extended/xen/xen_4.12.0.bb
deleted file mode 100644
index 246be7a..0000000
--- a/recipes-extended/xen/xen_4.12.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
-require xen.inc
-
-SRC_URI = " \
-    https://downloads.xenproject.org/release/xen/${PV}/xen-${PV}.tar.gz \
-    file://0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch \
-    "
-
-SRC_URI[md5sum] = "7d24d4541e3025421e02384cabc3528b"
-SRC_URI[sha256sum] = "6e5455e4a58dcb2339bfcd2a89842728068b530aa62501843793f7cf743c4d64"
-
-S = "${WORKDIR}/xen-${PV}"
diff --git a/recipes-extended/xen/xen_4.13.0.bb b/recipes-extended/xen/xen_4.13.0.bb
new file mode 100644
index 0000000..856b3df
--- /dev/null
+++ b/recipes-extended/xen/xen_4.13.0.bb
@@ -0,0 +1,14 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+require xen.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=4295d895d4b5ce9d070263d52f030e49"
+
+SRC_URI = " \
+    https://downloads.xenproject.org/release/xen/${PV}/xen-${PV}.tar.gz \
+    file://0001-python-pygrub-pass-DISTUTILS-xen.4.13.patch \
+    "
+
+SRC_URI[md5sum] = "d3b13c4c785601be2f104eaddd7c6a00"
+SRC_URI[sha256sum] = "c69ae21b2ddeaf25532a81a448fcc6a218bc56f93c8907b2d416b2d4339c0afe"
+
+S = "${WORKDIR}/xen-${PV}"
-- 
2.20.1

