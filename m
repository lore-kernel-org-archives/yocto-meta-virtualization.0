Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B74F589DF
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:39:10 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16473.1777019939981395190
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 01:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KZ9jk9rc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d0deb7ad5so6226752f8f.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Apr 2026 01:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777019938; x=1777624738; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WVuKh7PMpcAVHCcfhHGkT+9uALfuEblKqGBJNXWSzqY=;
        b=KZ9jk9rcuWmhToNoBVwYD/hDba5qnjI/xUPigMtysG+7lPfOM+ZgRgdtdaZbCUBcv2
         YsaCQ/wmBdvSl+WdlnC424aTLB4a7VzIqTvpcD7/II+AAKo+SNj7EprkepuCx83aMH2d
         aSeL7l2VzaLGGiIfLjZVP9yeNVuv9ZEHqX8QA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777019938; x=1777624738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WVuKh7PMpcAVHCcfhHGkT+9uALfuEblKqGBJNXWSzqY=;
        b=Q7ux5cMSPpdwmR/I9d91INcgM0TE8adeSFTgn8+NptFzURP/GxpFQr5mWD/O8bOzkR
         7689TJgY6/aqXGtScQ42I9VAJmjndNKA2vpY9eVzXOZj+43jK8solLt/2W7eBCNqBD/Z
         pTjctbyREdGGl9uOyHCNeSJQTRY0GCvtU/S++6x8I/QhcqJoBKl0A7IOeklGhWZd2PmI
         7jy0XrjTTTRO/jfVkJvY3q9/pPcvxe95uFfOHa8fH1lgn/EvR8t4p6RjbRfYB8H005J+
         7wlDPlhPN7w92y68LYuX2VZEm3uZgewWxI2IXXARJRSrsmRmZEuBv/UVIqlaijheAJAs
         BhYQ==
X-Gm-Message-State: AOJu0YzEDC/xVVpt2iD/gMnKf0q5m9cM5wa2JmRma/J6JGo6YxBoBka0
	rkJb85uJCaf+kO0nWUrd6N4XiXr2YuEKRdLZFFg00rCzaEdTtf/BDDYc1Rh8DyYP1WXgxsc5pSU
	hThbCelY=
X-Gm-Gg: AeBDiesF48hJmDm1PTHlV/UHZoRssBdjrGiMi4edXN++I2GvXjujYfcFFzL5DERvKxd
	mxD11MhaBIQU0jwMKN6IVBTcvRlmIyWEmWIQYZe45hlV5M8jgDE2K222MI4sVwPVClfyMOXAPOr
	+5ciMjx0YBKxyUAvg9W6FFYVee73hiYxAMLckcMtaJPLhYsv4TTpn3o7HOQonNooFUBsUodLbnq
	7jSXE4BI1IgsW0J/px1UOAUP2FPz8jVKBMP3EsUjmGvjhwpnHMnF1eU/epG7lNS51EhMr2hpqd4
	niUxiCFc+dh2mDN9zoQPz/s6Me47xnwY907oUmSRnjkjHxxc/sKVCUIK3EG9orJBRHr6Ppap1kz
	2nHNN4S5lK7vwOKogBj2tp8HvwPdz8c0L6vdhlC4Qv6wT4PrGVzH5K9Ax72sHYbS+nG1hbd5mJ5
	foCeeeCmJSdlhpPyJi1Z0g7iucQtm9Kaqyd9awU3nAlIDtmVX+fGg1ArXaiDvPbf85iL8jWjIHP
	w==
X-Received: by 2002:a05:6000:2283:b0:43f:e94a:e777 with SMTP id ffacd0b85a97d-43fe94ae7eamr44330884f8f.37.1777019937525;
        Fri, 24 Apr 2026 01:38:57 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6633:2b7d:813b:8534])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e59f97sm64681772f8f.37.2026.04.24.01.38.56
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 01:38:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization] [PATCH] ca-certificates: Ensure changes only apply with the selected DISTRO_FEATURES
Date: Fri, 24 Apr 2026 09:38:55 +0100
Message-ID: <20260424083855.3214724-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:39:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9739

This fixes yocto-check-layer failures:

 ca-certificates:do_recipe_qa: 4d7b7adb7436eeb5714c354f3c590e7e69294ea044452343d24e64c92d5c040f -> c1676ce811efe714731b666ccd683586477f7a1b52ad7597148bd9d709291220
      List of dependencies for variable SRC_URI changed from 'frozenset({'PV', 'SRC_URI[sha256sum]', 'BPN'})' to 'frozenset({'SRC_URI[le-r11.sha256sum]', 'BPN', 'SRC_URI[le-e8.sha256sum]', 'PV', 'SRC_URI[sha256sum]'})'
      Variable SRC_URI value changed:
      @@ -1 +1,2 @@
      -${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch            file://0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
      +${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch            file://0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch             ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization',     'https://letsencrypt.org/certs/2024/e8.pem;name=le-e8;unpack=0      https://letsencrypt.org/certs/2024/r11.pem;name=le-r11;unpack=0',     '', d)}
      +DISTRO_FEATURES{virtualization} = Unset

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../ca-certificates_%.bbappend                | 39 +------------------
 .../ca-certificates_virtualization.inc        | 38 ++++++++++++++++++
 2 files changed, 39 insertions(+), 38 deletions(-)
 create mode 100644 recipes-support/ca-certificates/ca-certificates_virtualization.inc

diff --git a/recipes-support/ca-certificates/ca-certificates_%.bbappend b/recipes-support/ca-certificates/ca-certificates_%.bbappend
index e659f1ed..617caccb 100644
--- a/recipes-support/ca-certificates/ca-certificates_%.bbappend
+++ b/recipes-support/ca-certificates/ca-certificates_%.bbappend
@@ -1,38 +1 @@
-# Install Let's Encrypt intermediate certificates (E8/ECDSA, R11/RSA).
-#
-# Only active when 'virtualization' is in DISTRO_FEATURES.
-#
-# Some container registries (e.g., registry.yocto.io) don't send the
-# full certificate chain. Go's TLS library (used by Docker, skopeo,
-# podman) cannot verify the server certificate without the intermediate,
-# even though the root CAs (ISRG Root X1/X2) are present.
-#
-# These intermediates are fetched at build time and installed alongside
-# the standard CA certificates. update-ca-certificates (run in
-# pkg_postinst) incorporates them into the system CA bundle.
-#
-# Source: https://letsencrypt.org/certificates/
-
-SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', \
-    'https://letsencrypt.org/certs/2024/e8.pem;name=le-e8;unpack=0 \
-     https://letsencrypt.org/certs/2024/r11.pem;name=le-r11;unpack=0', \
-    '', d)}"
-SRC_URI[le-e8.sha256sum] = "f2c0dde62e2c90e6332fa55af79ed1a0c41329ad03ecf812bd89817a2fc340a9"
-SRC_URI[le-r11.sha256sum] = "6c06a45850f93aa6e31f9388f956379d8b4fb7ffca5211b9bab4ad159bdfb7b9"
-
-do_install:append () {
-    for pem in ${UNPACKDIR}/e8.pem ${UNPACKDIR}/r11.pem; do
-        if [ -f "$pem" ]; then
-            install -d ${D}${datadir}/ca-certificates/letsencrypt
-            # ca-certificates expects .crt extension
-            base=$(basename "$pem" .pem)
-            install -m 0644 "$pem" ${D}${datadir}/ca-certificates/letsencrypt/lets-encrypt-${base}.crt
-        fi
-    done
-
-    # Add to ca-certificates.conf so update-ca-certificates includes them
-    for crt in ${D}${datadir}/ca-certificates/letsencrypt/*.crt; do
-        [ -f "$crt" ] || continue
-        echo "letsencrypt/$(basename $crt)" >> ${D}${sysconfdir}/ca-certificates.conf
-    done
-}
+require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', '${BPN}_virtualization.inc', '', d)}
diff --git a/recipes-support/ca-certificates/ca-certificates_virtualization.inc b/recipes-support/ca-certificates/ca-certificates_virtualization.inc
new file mode 100644
index 00000000..e659f1ed
--- /dev/null
+++ b/recipes-support/ca-certificates/ca-certificates_virtualization.inc
@@ -0,0 +1,38 @@
+# Install Let's Encrypt intermediate certificates (E8/ECDSA, R11/RSA).
+#
+# Only active when 'virtualization' is in DISTRO_FEATURES.
+#
+# Some container registries (e.g., registry.yocto.io) don't send the
+# full certificate chain. Go's TLS library (used by Docker, skopeo,
+# podman) cannot verify the server certificate without the intermediate,
+# even though the root CAs (ISRG Root X1/X2) are present.
+#
+# These intermediates are fetched at build time and installed alongside
+# the standard CA certificates. update-ca-certificates (run in
+# pkg_postinst) incorporates them into the system CA bundle.
+#
+# Source: https://letsencrypt.org/certificates/
+
+SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', \
+    'https://letsencrypt.org/certs/2024/e8.pem;name=le-e8;unpack=0 \
+     https://letsencrypt.org/certs/2024/r11.pem;name=le-r11;unpack=0', \
+    '', d)}"
+SRC_URI[le-e8.sha256sum] = "f2c0dde62e2c90e6332fa55af79ed1a0c41329ad03ecf812bd89817a2fc340a9"
+SRC_URI[le-r11.sha256sum] = "6c06a45850f93aa6e31f9388f956379d8b4fb7ffca5211b9bab4ad159bdfb7b9"
+
+do_install:append () {
+    for pem in ${UNPACKDIR}/e8.pem ${UNPACKDIR}/r11.pem; do
+        if [ -f "$pem" ]; then
+            install -d ${D}${datadir}/ca-certificates/letsencrypt
+            # ca-certificates expects .crt extension
+            base=$(basename "$pem" .pem)
+            install -m 0644 "$pem" ${D}${datadir}/ca-certificates/letsencrypt/lets-encrypt-${base}.crt
+        fi
+    done
+
+    # Add to ca-certificates.conf so update-ca-certificates includes them
+    for crt in ${D}${datadir}/ca-certificates/letsencrypt/*.crt; do
+        [ -f "$crt" ] || continue
+        echo "letsencrypt/$(basename $crt)" >> ${D}${sysconfdir}/ca-certificates.conf
+    done
+}

