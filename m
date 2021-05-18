Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.4436.1621313749141516073
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 May 2021 21:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 14I4tlm6019356
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 17 May 2021 21:55:47 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 17 May 2021 21:55:46 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Mon, 17 May 2021 21:55:46 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] nativesdk-sloci-image: add recipe
Date: Mon, 17 May 2021 21:55:46 -0700
Message-ID: <20210518045546.57617-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add nativesdk-sloci-image recipe which is basically from the
sloci-image-native recipe.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../sloci-image/nativesdk-sloci-image_git.bb  | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 recipes-containers/sloci-image/nativesdk-sloci-image_git.bb

diff --git a/recipes-containers/sloci-image/nativesdk-sloci-image_git.bb b/recipes-containers/sloci-image/nativesdk-sloci-image_git.bb
new file mode 100644
index 0000000..3c2b539
--- /dev/null
+++ b/recipes-containers/sloci-image/nativesdk-sloci-image_git.bb
@@ -0,0 +1,27 @@
+SUMMARY = "A simple CLI tool for packing rootfs into a single-layer OCI image"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=948cd8e59069fad992b0469af9ad7966"
+SRC_URI = "git://github.com/jirutka/sloci-image.git \
+           file://0001-sloci-image-fix-variant-quoting.patch \
+          "
+
+
+DEPENDS = ""
+
+SRCREV = "4015e49763e5a738026a5bbfcf32b38b5a4fa650"
+PV = "v0.1.0+git${SRCPV}"
+
+inherit nativesdk
+
+S = "${WORKDIR}/git"
+
+do_compile() { 
+	:
+}
+
+do_install() {
+	cd ${S}
+        make PREFIX="${exec_prefix}" DESTDIR=${D} install
+}
+
+CLEANBROKEN = "1"
-- 
2.30.2

