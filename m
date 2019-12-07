Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web10.1304.1575724896462173207
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 07 Dec 2019 05:21:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BUbdkkGv;
 spf=pass (domain: gmail.com, ip: 209.85.167.68, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f68.google.com with SMTP id r14so7370019lfm.5
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 07 Dec 2019 05:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JXwpoJaynLRW/LeJzyu+Uu4cPa1FfwRJtG4jDX4MvLQ=;
        b=BUbdkkGv4kyOVFzqdAzEFmmgcdpafZcvalMPnLkCCqMBbYiz9UlVp3FBCZREp0FCgP
         WON7VjEhUlRNnszaX3Z1U49x14Kbg7z0ZvWM6yLcV5a9tPSoUnTD8bTfkyAfPN62yfy8
         hLXmckcYQJZEupQC3kypguS65Fq6GrBrapDeTCB4aAmIdtzMU3v0cVetNW00XZRiuLHi
         j931UKUAbAKRRFEb79Q0G0uAWIYzhGGhaKn/lJD+hAncHmek7m3MQ3pzpfhA1bQf0kOn
         JI3Z5w39NqmZJ7kB740WtUVjQp8fXFDPT0nxHbW3X6Ay2sCGJ4VtjIJ+yAdIo8EWu/PX
         Cecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JXwpoJaynLRW/LeJzyu+Uu4cPa1FfwRJtG4jDX4MvLQ=;
        b=LQSl0apKgDGkg7ABIHLlhXRKWT3K1lhCznOOX+9r90iX5H9/0bQ6UnGSlCVNnbAJot
         1zJz49PhHABwSkKdpubjb3MdLRHMpPXrxy6GU1z+wwP3RWIAJ/Bnv9rd83kaeao7W4jb
         WOJpZpqY5U4LtyPOQ+SYgmUAckKE9ItOGyUkD7KYtz45F2e/+ZFAfLZyr5zQq58sd7K2
         wFxEAZnldwxsa38GN+lQroXfaGljSocg+90IJ7+2w2vwAzcnypoyru1eSyL7y9DnDkXo
         mTQgrTvS/HKwPWyhhbAJyD5J25A6ZxnzY5UHRDLMbSys0SA1Mt+LWdhqUKAd6h2fJofY
         SCqw==
X-Gm-Message-State: APjAAAX9ToAr8w8FZZyqDOvKDDNsqv3+PJcpL/I0cIggld/vyptlC6ir
	30ownUO+4EVVkcoZn8Hzx/jrbO3wgkg=
X-Google-Smtp-Source: APXvYqzR4S6PF1yS02WKSvTTXgXmpXAHr6RGJXwNuQmtUhGwXEmalvLZofK1mt08Zo0wpFLt3MPXxg==
X-Received: by 2002:a19:ed11:: with SMTP id y17mr10446945lfy.58.1575724894654;
        Sat, 07 Dec 2019 05:21:34 -0800 (PST)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.lan (c-75fd72d5.022-417-73746f13.bbcust.telenor.se. [213.114.253.117])
        by smtp.gmail.com with ESMTPSA id m15sm8367562ljg.4.2019.12.07.05.21.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 07 Dec 2019 05:21:34 -0800 (PST)
From: "Ming Liu" <liu.ming50@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: stefan.agner@toradex.com,
	simon.bueler@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-virtualization][PATCH 2/2] python3-nacl: add 1.3.0 recipe
Date: Sat,  7 Dec 2019 14:21:28 +0100
Message-Id: <1575724888-22415-2-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575724888-22415-1-git-send-email-liu.ming50@gmail.com>
References: <1575724888-22415-1-git-send-email-liu.ming50@gmail.com>

From: Ming Liu <liu.ming50@gmail.com>

A regression was introduced by commit ab12e48a:
[ python3-docker-compose: uprev to 1.25.0 ]

python3-docker-compose depends on python3-paramiko hence also depends
on python3-nacl but that recipe does not exist.

Port it from meta-lmp layer.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 recipes-devtools/python/python3-nacl_1.3.0.bb | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 recipes-devtools/python/python3-nacl_1.3.0.bb

diff --git a/recipes-devtools/python/python3-nacl_1.3.0.bb b/recipes-devtools/python/python3-nacl_1.3.0.bb
new file mode 100644
index 0000000..d0a99ae
--- /dev/null
+++ b/recipes-devtools/python/python3-nacl_1.3.0.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Python binding to the Networking and Cryptography (NaCl) library"
+HOMEPAGE = "https://github.com/pyca/pynacl"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8cc789b082b3d97e1ccc5261f8594d3f"
+
+PYPI_PACKAGE = "PyNaCl"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "3f3b1272287bc2de8efd8a5fa18bf728"
+SRC_URI[sha256sum] = "0c6100edd16fefd1557da078c7a31e7b7d7a52ce39fdca2bec29d4f7b6e7600c"
+
+DEPENDS += "\
+    libsodium \
+    python3-cffi-native \
+    python3-pip-native \
+"
+
+RDEPENDS_${PN}_class-target += " \
+    python3-cffi \
+    python3-pycparser \
+"
+
+export SODIUM_INSTALL = "system"
+
+BBCLASSEXTEND = "native"
-- 
2.7.4

