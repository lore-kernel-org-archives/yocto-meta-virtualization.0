Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.2989.1592901979895919053
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 23 Jun 2020 01:46:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YzW3Vsi8;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: liu.ming50@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id a6so1725257wmm.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 23 Jun 2020 01:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9XA+WJIKCISV2AyRealj2MTB9GcaZ6l5P0suzfvIi4Y=;
        b=YzW3Vsi8jVRQqYi0VhWxsi4UdY3g91eBgQbNx/Xe9FFXn0CdyLcxSSgxOcOdbdcN01
         TGA/gQGkKIc7d2u5H/V3djEh+EhpJp0k0S6e42xGMwIqiaEIEf1znfCJv9wkL8Um0dKM
         dpWAcxtuTV8kYXgPeWHkes2jSTTTMpGbGJD3iQvDOKAwiMJt2mg2l0DDbNs2XA4/8i6G
         WiHHhajh7NaCQMpj76S4MOz98O7w5Uyg57NE9LDuu0TmzIjVoBi1PkSu2evyWVMDqrUw
         29kAjHe3sja8yhq9P3SA98GyTZn8Fc0AHqmW6j2eLvHXIVx/eWCAHFC5WjeEYpmJU/k3
         HQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9XA+WJIKCISV2AyRealj2MTB9GcaZ6l5P0suzfvIi4Y=;
        b=L3KQOX8PNxlogSzWmMoENSFZyxzknRqyHDYfwh4eYo9YKNwrS00vYuxC5BfR6fRxjP
         3i4KZZjqJ1dlEmbOfv8rJyuCZvwfHEYND64bxwHYgwqyPJSwUqpXDXWDYTnPkYRaOIgP
         PzZ1kyTBWXOZNgDaYr3Py0fLpwn1Olwz7BVSkOmIrLQNes9fq5iPnZ9HX35GyNxrwGXZ
         /jOSK6vqZyQVY1wWOMBLOkt6KnjLpuAgAuHGrybD8d0F/RqMNaLkuPKU1VCf0Z76Vnfd
         97E8XvLIyiQiT5NbX/CDc+jYXIFI6RLYvrYBlQwEQ4UpmeIuVDqVARbhaTiOQzE7gzhz
         e6PA==
X-Gm-Message-State: AOAM533z79eRBUYIdmhSGSfT5/tjF3Z1n4w7VfVtEFIE5Uj/6nIWAVWT
	kxCtDJg/BbkUfrJAH3wzKbRKFDtB
X-Google-Smtp-Source: ABdhPJz6ZVhymNkNrDn/AxWcsW5uWeObuc7xOttlLf+mdQVVwFE7AHhvIgfg3WFr4EsmcxptURF1TA==
X-Received: by 2002:a1c:5502:: with SMTP id j2mr22731864wmb.15.1592901978204;
        Tue, 23 Jun 2020 01:46:18 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from localhost.localdomain (m83-185-43-74.cust.tele2.se. [83.185.43.74])
        by smtp.gmail.com with ESMTPSA id d2sm21650157wrs.95.2020.06.23.01.46.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jun 2020 01:46:17 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Ming Liu <ming.liu@toradex.com>
Subject: [meta-virtualization][PATCH] python3-bugsnag: uprev 3.6.0 > 3.6.1
Date: Tue, 23 Jun 2020 10:47:25 +0200
Message-Id: <20200623084725.6278-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <ming.liu@toradex.com>

Also drop SRCNAME/SRC_URI/S, change to inherit pypi.

Signed-off-by: Ming Liu <ming.liu@toradex.com>
---
 ...3-bugsnag_3.6.0.bb => python3-bugsnag_3.6.1.bb} | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)
 rename recipes-devtools/python/{python3-bugsnag_3.6.0.bb => python3-bugsnag_3.6.1.bb} (55%)

diff --git a/recipes-devtools/python/python3-bugsnag_3.6.0.bb b/recipes-devtools/python/python3-bugsnag_3.6.1.bb
similarity index 55%
rename from recipes-devtools/python/python3-bugsnag_3.6.0.bb
rename to recipes-devtools/python/python3-bugsnag_3.6.1.bb
index ef704e7..3238579 100644
--- a/recipes-devtools/python/python3-bugsnag_3.6.0.bb
+++ b/recipes-devtools/python/python3-bugsnag_3.6.1.bb
@@ -8,18 +8,12 @@ DESCRIPTION = "\
   "
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9577253c24027f0c6027a4fded2134fc"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=3bc101ebc0815bd849021892cd333dd4"
 
-SRCNAME = "bugsnag"
+SRC_URI[md5sum] = "93443091b052130cfe1daf7595249f9f"
+SRC_URI[sha256sum] = "8878437aa44ec485cecb255742035b3b98a6c7e7d167a943b5fbe597b2f8f7f9"
 
-SRC_URI = "https://pypi.python.org/packages/source/b/bugsnag/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "b97e16b068b5e7fdc3e3fa9f684e56cd"
-SRC_URI[sha256sum] = "67b8c01719e92f193f8424595a94e3a527bc0f9fcb7f2bc47a20af87de81929d"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools3
+inherit pypi setuptools3
 
 DEPENDS += "python3-webob python3-flask python3-blinker"
 
-- 
2.27.0

