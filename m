Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.2928.1592901892593393324
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 23 Jun 2020 01:44:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CARKLfqK;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: liu.ming50@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id l17so2192310wmj.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 23 Jun 2020 01:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hsH6o036sZv7qaK80MhSVsd7WJNzXxBVriqaG80pBhw=;
        b=CARKLfqKYoFtdtUlqEYzamhMzzId9q9uKVmjuWmm10Asy9vPTWrf3a4+L0787FdxA9
         vzznNTj5FMY8UsLpMdnNW4lq0It0WFkW9Uw4jnOMgpnmd3+Kc4c2eR2Yn9hV3ZTc5/zS
         3aVrWJa1nItnSgJS7314RJ9+BCdFuFss+YUH0x97LEdLXxx2yRwFpcZmPoOBjXTVVUyx
         Nc88ehnQ1Z2zA61SsVFgxEr0gwc8vZDTk05vCTYI53XAfhAH5prajqdluMHI68nqiFNM
         +dq7crcGusS2BBeTRuJrhyNizzYmcuK5n9I+deu04fw5LxQKaWaRPo46bsmFvjy7aeRS
         C8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hsH6o036sZv7qaK80MhSVsd7WJNzXxBVriqaG80pBhw=;
        b=Oovz4Lj0+8JcbCziArDPwsVWcmJQTTYS/7T5eL9Wz+80T2oZXTfYVLW/wuOgQ+pqda
         qmprXE6clP2vSvWtvN6qVuDQRk99zjOfRNg+NS7q1Z+EmkM9GcFON0mUg8c0rjX7Yr8z
         O3xv6VquRIsjVEBVdpQyMHnhQFUQzaKv7AEOHkBWxSY9NrqVF4+QZXo2PWrJd5O4ST99
         RivUIyz+ks1FDUZp4nr6BgUA2SlPLKW82D+RWOYxvGmzAxrQZUkk6KVUD+Lw9fEqZdA7
         URbU+OtvOvEr9vLHQUrblXH+Ie+iWgJA7MBh80ngA+NjrZ9LYX+dYJCASFJErinGabCi
         ZzLA==
X-Gm-Message-State: AOAM532zAymXCiKhxBjeRqk3/yl2oQt8QS46K/70AOqm/5qW/1GwyFdG
	cc08PW17PWAIPbXZxUEgW+K0u1ZK
X-Google-Smtp-Source: ABdhPJyCPP1MboUWFo3td661xqrdb6mFYP/jXG4CpeCHBO1DaFPcfec5IQe3NU+9u6PLq+NCmyHSHw==
X-Received: by 2002:a1c:f003:: with SMTP id a3mr22634544wmb.119.1592901890573;
        Tue, 23 Jun 2020 01:44:50 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from localhost.localdomain (m83-185-43-74.cust.tele2.se. [83.185.43.74])
        by smtp.gmail.com with ESMTPSA id 33sm15216853wri.16.2020.06.23.01.44.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jun 2020 01:44:49 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Ming Liu <ming.liu@toradex.com>
Subject: [meta-virtualization][PATCH] python3-boto3: uprev 1.11.7 > 1.14.7
Date: Tue, 23 Jun 2020 10:45:55 +0200
Message-Id: <20200623084555.15456-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <ming.liu@toradex.com>

Also drop SRCNAME/SRC_URI/S, change to inherit pypi.

Signed-off-by: Ming Liu <ming.liu@toradex.com>
---
 .../python/python3-boto3_1.11.7.bb            | 22 -------------------
 .../python/python3-boto3_1.14.7.bb            | 15 +++++++++++++
 2 files changed, 15 insertions(+), 22 deletions(-)
 delete mode 100644 recipes-devtools/python/python3-boto3_1.11.7.bb
 create mode 100644 recipes-devtools/python/python3-boto3_1.14.7.bb

diff --git a/recipes-devtools/python/python3-boto3_1.11.7.bb b/recipes-devtools/python/python3-boto3_1.11.7.bb
deleted file mode 100644
index ae623cf..0000000
--- a/recipes-devtools/python/python3-boto3_1.11.7.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-HOMEPAGE = "https://github.com/boto/boto"
-SUMMARY = "Amazon Web Services API"
-DESCRIPTION = "\
-  Boto3 is the Amazon Web Services (AWS) Software Development Kit (SDK) for Python, \
-  which allows Python developers to write software that makes use of services like \
-  Amazon S3 and Amazon EC2. \
-  "
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://setup.py;md5=0149f3d994965905689bbefa0212efe2"
-
-SRCNAME = "boto3"
-
-SRC_URI = "https://pypi.python.org/packages/source/b/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "79936a15612b8ef762eb1274a936cea5"
-SRC_URI[sha256sum] = "5222edc5b20d5c6ab7440fc4f89f987ead05be37ff5cc5359a3b9148d9b5a51e"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools3
-
diff --git a/recipes-devtools/python/python3-boto3_1.14.7.bb b/recipes-devtools/python/python3-boto3_1.14.7.bb
new file mode 100644
index 0000000..f9e979e
--- /dev/null
+++ b/recipes-devtools/python/python3-boto3_1.14.7.bb
@@ -0,0 +1,15 @@
+HOMEPAGE = "https://github.com/boto/boto"
+SUMMARY = "Amazon Web Services API"
+DESCRIPTION = "\
+  Boto3 is the Amazon Web Services (AWS) Software Development Kit (SDK) for Python, \
+  which allows Python developers to write software that makes use of services like \
+  Amazon S3 and Amazon EC2. \
+  "
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
+
+SRC_URI[md5sum] = "fb8b77d4ac10a971570419dd3613196e"
+SRC_URI[sha256sum] = "4856c8cb4150b900cc7dccbdf16f542fb8c12e97b17639979e58760847f7cf35"
+
+inherit pypi setuptools3
-- 
2.27.0

