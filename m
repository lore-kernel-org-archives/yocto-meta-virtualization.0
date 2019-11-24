Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web12.1732.1574629331755557761
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 24 Nov 2019 13:02:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zcc+E5Ic;
 spf=pass (domain: gmail.com, ip: 209.85.208.196, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f196.google.com with SMTP id d5so13356669ljl.4
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 24 Nov 2019 13:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=wjm+ITiXL3nDhcP/buEftKxdt6mq1gLYUo9jy2/5QrE=;
        b=Zcc+E5IcAPVh7BK87S6HNBCqDOx10YAR7KItvmdF/I8g3nVIqLxIsR9pKl/Fs7+8PO
         cKvQtBXxP9PoDJ1+v98a3apcp7bVfMKAPElvDD5GuNlDLf/eZtU7yeZRKer4oGKKuKl2
         wgOZ6v0IHzU4FF/tKivhgIu56sOwLZcYn/+OyljTCl6rzjXJeYShq8nRUT0W7FQIZR1g
         f7lPiL+KIhQTlknYpoSQm0SMA81uUhJvz0OJEFWf+pVzncJRUOnKO4Py8Mg70jCIkiiD
         kkSqkwUFTHQCVvZjFdq4099gZYQff5QxF8IG/AMdiBmoa336g8tyo3+hptb3/+13a5lu
         kGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=wjm+ITiXL3nDhcP/buEftKxdt6mq1gLYUo9jy2/5QrE=;
        b=IBnT8fzMmzIfgWgOybfKamk99cybLyEIZW9vhDfpOy4za8BtgkLarJ65+OoADxJr1K
         7o+3Jw6HWNGq8G3pH9AlvzbFnPE8yniKzj1xMZMX04Onuz1A+4v/5NBwYl+IjhA9hSYu
         FlN9rcvfiX0ve0JCof+/rR0AH/toO3KfrPWSuNRldHaudMQu/ls37XDh02jLyt2EOcgT
         kROZvG60iSbqMCuOYls5kf7ZZETBPyRgKl9+R/JB2wuZ1JKqMBIPvracNKSvUrg4wCIX
         qSXuN8GDOsrBAvMLLEgz6BwUI5FO4s2EmMV/1HIzJsebtM3SUEFxLAT2lVjG7568epWq
         tUWQ==
X-Gm-Message-State: APjAAAWPbXtBU6d57eN0TQaYsMyHidu92IcCkh1Mg5PjnIJCajcHbrV+
	xKJOUhWF6aNS2xwlw1nVFguV1ORWWQ8=
X-Google-Smtp-Source: APXvYqxvSIRj5N1aMNicU8hNINaToAupTw3ib+K6alFdkAhSTL+KPDc1nP/Wd8Z4YEhc4c6Mq+Wj3Q==
X-Received: by 2002:a2e:b5d4:: with SMTP id g20mr14900014ljn.140.1574629329677;
        Sun, 24 Nov 2019 13:02:09 -0800 (PST)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.lan (c-75fd72d5.022-417-73746f13.bbcust.telenor.se. [213.114.253.117])
        by smtp.gmail.com with ESMTPSA id r7sm2757733ljc.74.2019.11.24.13.02.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 24 Nov 2019 13:02:09 -0800 (PST)
From: "Ming Liu" <liu.ming50@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: stefan.agner@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-virtualization][PATCH] python-sqlalchemy: drop 1.0.16 recipe
Date: Sun, 24 Nov 2019 22:02:05 +0100
Message-Id: <1574629325-30122-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Ming Liu <liu.ming50@gmail.com>

Seems no one is referring this recipe, there is already a
python-sqlalchemy_1.1.5 recipe in this layer.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 recipes-devtools/python/python-sqlalchemy_1.0.16.bb | 16 ----------------
 1 file changed, 16 deletions(-)
 delete mode 100644 recipes-devtools/python/python-sqlalchemy_1.0.16.bb

diff --git a/recipes-devtools/python/python-sqlalchemy_1.0.16.bb b/recipes-devtools/python/python-sqlalchemy_1.0.16.bb
deleted file mode 100644
index 5eb60b5..0000000
--- a/recipes-devtools/python/python-sqlalchemy_1.0.16.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
-application developers the full power and flexibility of SQL"
-HOMEPAGE = "http://www.sqlalchemy.org/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d7dba1721bc8ce05d421f7279cb87971"
-RDEPENDS_${PN} += "python-numbers"
-
-SRCNAME = "SQLAlchemy"
-SRC_URI = "https://pypi.io/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "42c81726e7e145c206dac46964b4a167"
-SRC_URI[sha256sum] = "e2dfdaa0983931ac1b0522dd637f08a52cf3081746513ac79c50843277ebe463"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
-- 
2.7.4

