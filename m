Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web12.442.1580579259060732550
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 01 Feb 2020 09:47:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YOBCha3F;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id n18so10407598ljo.7
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 01 Feb 2020 09:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=dJJZyhiphbow1q3j5n7XwxPEOWudKkponkXJT4sxUNI=;
        b=YOBCha3F3q6Xhcp5B8ToZvtPEe4iISJpP2arTo6o3VJQkGBqbCVQbbIbkPXYRxSpY9
         Ah6yp7KvjLaFRvtZIfOunhNjyQXntSTI3Fr7fEUxxOzYVD8gtCeYyTTjfYZIB/myQl+f
         PQb7uugAMTrHu6RjKY5OlqDuryyMiExIPNC2yTHQoX+WeBypa3CFw82IjsB2zIcHRrsO
         oa9B2+wBllhNllBmuisaCW4Lr977glWizFl4pwn6izXH6WCHlEUb5+DOxBrNGaBBi/I/
         DxuG5znowMRbHdDFJWZJ0HUVTc+SrlOLJXIt4TDknt+MRtH79H5ABhxmLC1IaXffM205
         TeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=dJJZyhiphbow1q3j5n7XwxPEOWudKkponkXJT4sxUNI=;
        b=Ckfh08XZ0ynOtkKH/iXNOUD/iIpFfIpz5d0Gg28kmBpOQ8SV6bAajsNcQhauMmdFsC
         QWhNNLM3c7min9JA2AYMjogz/z/UopsUqeDSrgQ5I4q2X4oL1Aa2fk6rrXJzzAYQK/qN
         /lulBtgWmqw00V3+HbwbTWQDrlloy9NC5kXbYMBMHc69AifRB0mLQlWIxv24LF9NACjL
         kwvPMTLsUTkHxDntBzZzcxTUQK7zbJEdT2yW5qirZhIzDNIm84nPdXq7dPBR0OsdoERo
         GAp43dRnX58oNj3MHcZB5MJPelJlre2CIdTNXbh7inBMlSXtRmQg9acUxTMF5nAfEJue
         Vuxw==
X-Gm-Message-State: APjAAAWboSHtabniaKIrQq7kJ4UmSTRjezsTUtJSSXB3viaj50rblHf7
	AJ2wTs/YAAoPsFL9BWpo1OWO6nhuhp0=
X-Google-Smtp-Source: APXvYqzRyBmoLWMI5WCjwKFdHf1b/2c8Jxvr7Pdv5RCY5OKkdHAU9Nreatz2Fy+2BFfZDY/nNsI9nA==
X-Received: by 2002:a2e:58c:: with SMTP id 134mr9186702ljf.12.1580579256982;
        Sat, 01 Feb 2020 09:47:36 -0800 (PST)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.lan (c-75fd72d5.022-417-73746f13.bbcust.telenor.se. [213.114.253.117])
        by smtp.gmail.com with ESMTPSA id k23sm6962153ljj.85.2020.02.01.09.47.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 01 Feb 2020 09:47:36 -0800 (PST)
From: "Ming Liu" <liu.ming50@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: stefan.agner@toradex.com,
	simon.bueler@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-virtualization][PATCH 1/2] python3-fastentrypoints: add recipe
Date: Sat,  1 Feb 2020 18:47:19 +0100
Message-Id: <1580579240-12882-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Ming Liu <liu.ming50@gmail.com>

python3-fastentrypoints is a python module that make entry_points
specified in setup.py load more quickly.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 .../python/python3-fastentrypoints_0.12.bb             | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 recipes-devtools/python/python3-fastentrypoints_0.12.bb

diff --git a/recipes-devtools/python/python3-fastentrypoints_0.12.bb b/recipes-devtools/python/python3-fastentrypoints_0.12.bb
new file mode 100644
index 0000000..7bd1651
--- /dev/null
+++ b/recipes-devtools/python/python3-fastentrypoints_0.12.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Make entry_points specified in setup.py load more quickly"
+DESCRIPTION = "Using entry_points in your setup.py makes scripts that start \
+really slowly because it imports pkg_resources, which is a horrible \
+thing to do if you want your trivial script to execute more or less \
+instantly. fastentrypoints aims to fix that bypassing pkg_resources, \
+making scripts load a lot faster."
+HOMEPAGE = "https://github.com/ninjaaron/fast-entry_points"
+SECTION = "devel/python"
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://README.rst;md5=f212a0cb34eb678477972d2011fb365a"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "390ad9a9229164a06156a5b1f0ef1b22"
+SRC_URI[sha256sum] = "ff284f1469bd65400599807d2c6284d5b251398e6e28811f5f77fd262292410b"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4

