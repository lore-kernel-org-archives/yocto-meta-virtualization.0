Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web09.1187.1575724894522468802
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 07 Dec 2019 05:21:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G1JW1F3X;
 spf=pass (domain: gmail.com, ip: 209.85.167.65, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f65.google.com with SMTP id 9so7350759lfq.10
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 07 Dec 2019 05:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=71hjAbQZmPIIKBzk7QjQJSwHXzkOtPSvq2EebuYZ9jw=;
        b=G1JW1F3XDH4ODipaBoFOTHLJZF8SvDvvr7TRMTzAm0lkjNoQQy9BSWDmUA0nOYVtk1
         4+UGv72g+aSMZUDFcUbbgHzIgB0+f1te48/7yvyzcy4fhTE1QoTuCwW8tRk/fgbeIKRb
         fnJs1TpD0WaFhfYBnPNhgWhbEcz5TT5xM64lMzUGlexiidPxxn4d2jHwqZ7QHWX23FlL
         heXvO6z60CvnXrvUJlw+gM1W0u//tBxwY1/97m36oQA/bt0LLkemjQ6Zb8r87I361IM4
         CQ+Jq9Pfw6n5d0KxLS+HGgmMCz8anVmRS/pbTNARrc3izSZLSvo4Uw47pIM9tuHUJJYe
         ykIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=71hjAbQZmPIIKBzk7QjQJSwHXzkOtPSvq2EebuYZ9jw=;
        b=t8dfzw7k5CkVmICx0kdy0Alni+2HAzolGN6vOggNMUg6fJK5BBbBs06C92rOzgiDdz
         Aa9EL22Yl9Vepjy+pRCenxLpqsgtg2zgEPDPZg9fvQUUYZMI7PZDHi0FB0MXrYmKzuQP
         npwQK+Ya3T7TmahGr46nRU+DZT/WEi1J9wGX+YZz19RWp784PrUXaCOdTQakpKOYp470
         xJOJbcDKUIZ0zeAHOdLzE1omj8zdH3dPm8Xvzi7WP+uvo9gemVO4Lrsa3w6BoIf/eseV
         UMvgdODyYSIybMrPori1RexrU0amgvtsm1soCubr1bpaHKIpLUg6Tvq1zp9TKpUywB4p
         7Rxg==
X-Gm-Message-State: APjAAAVemp4lW44bsvUHdKNDSHKmuYg0cYgorvVSwt0apuogQuAT2ZsQ
	lPoCvvk9ykj67KSeimnivAt4gyM8NYA=
X-Google-Smtp-Source: APXvYqzn+IiH3K0SImqCsmLXhyi+m19WI4+kf8VIk2CHC/Uyk/4U1iMOFhXdhhQ/Zh4XpB5DgtywMg==
X-Received: by 2002:ac2:4946:: with SMTP id o6mr10766094lfi.170.1575724892432;
        Sat, 07 Dec 2019 05:21:32 -0800 (PST)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.lan (c-75fd72d5.022-417-73746f13.bbcust.telenor.se. [213.114.253.117])
        by smtp.gmail.com with ESMTPSA id m15sm8367562ljg.4.2019.12.07.05.21.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 07 Dec 2019 05:21:31 -0800 (PST)
From: "Ming Liu" <liu.ming50@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: stefan.agner@toradex.com,
	simon.bueler@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-virtualization][PATCH 1/2] python3-paramiko: add 2.7.0 recipe
Date: Sat,  7 Dec 2019 14:21:27 +0100
Message-Id: <1575724888-22415-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Ming Liu <liu.ming50@gmail.com>

A regression was introduced by commit ab12e48a:
[ python3-docker-compose: uprev to 1.25.0 ]

python3-docker-compose depends on python3-paramiko but that recipe does
not exist.

Port it from meta-lmp layer and uprev to the latest release 2.7.0.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 recipes-devtools/python/python3-paramiko_2.7.0.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 recipes-devtools/python/python3-paramiko_2.7.0.bb

diff --git a/recipes-devtools/python/python3-paramiko_2.7.0.bb b/recipes-devtools/python/python3-paramiko_2.7.0.bb
new file mode 100644
index 0000000..d03702c
--- /dev/null
+++ b/recipes-devtools/python/python3-paramiko_2.7.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Python module that implements the SSH2 protocol"
+HOMEPAGE = "https://github.com/paramiko/paramiko"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "b130f3e1c3442d21c1a0c9ae17776f4e"
+SRC_URI[sha256sum] = "fba9c46340e3d690ad5a9d0dbf06677cd91425de3afa7e9c0c187298ee4ddd0d"
+
+RDEPENDS_${PN} += " \
+    python3-bcrypt \
+    python3-cryptography \
+    python3-pyasn1 \
+    python3-nacl \
+"
-- 
2.7.4

