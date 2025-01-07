Return-Path: <FlorianWickert@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0FA4E77198
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 08:40:55 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.16313.1736239247794693609
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Jan 2025 00:40:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AwgdUjIk;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: florianwickert@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436345cc17bso110032065e9.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Jan 2025 00:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736239246; x=1736844046; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MNwccYDEiUS/+fah3+U6xQAWLngPP1KkBN+RxgZYsJ4=;
        b=AwgdUjIkJlFX2ZhkKvVnQQGUVP0BC1kYORRU+vLlcXo9rhsUTb7ZtgN9N5d4A4xaxt
         VDFmXTcydj5xvJnq+5Z+zBMYuXljx0q7ENzdjSOjv0zpJ86rcWi2Xhj+aROlJlKzh+Eq
         1uNNjlSbC7PPD0YKPSe+fFcEzymjKZXiPgJJ0aHKYUmKPzoBvYTPGBIHiCCQgVkTAERi
         xtJ4eY5KHkmGZhZQ7QoYKOPTHVSQMk5AjW3a9KppxOnxsrSgAkIpviv57VgDBDinG5vl
         SvAxnqAor0YbrIg0iZ9bLC06NZVLu0P6Dj6KO5Nc0AcHkyl17y7JrfWekUW0XKe1zbWV
         waxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736239246; x=1736844046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MNwccYDEiUS/+fah3+U6xQAWLngPP1KkBN+RxgZYsJ4=;
        b=UCIf//lSodA71O4S2ZGC/3reQRArhEy9EqGUnzj1eEF8JdfOgwCKvH76yyrNjbjcIH
         y4zMtflOnCGCNXDWh6MLK/NO3xADYKtjebMDcYkWiZu0jM6Lbyu+CrMS9sfJso7BC+de
         SG9X10e7FrISSgre3sGZB8KMtrD43YGcFAljHK3WZyM70DXM2eAojTkFtdbhfeK2HbFB
         kQlr1mGemzA8obPkLlhFmWfaNVDIN95kjqEZjqfPUPUGR+/k1ni6m6elfTgVbNqCGd3q
         97gJ2rjYZQmWWnr2PoKeab/+P1V79mWlx4IZYwj3mRldSrzs8iLBS2vtA34Uus+M36+m
         XeHg==
X-Gm-Message-State: AOJu0YwkGw1c1V5xZbzNnhQDtA5iA0B7Wi1UmxATKBE1J+xwprJZWRtF
	+CDoeVvltThFoKrz9dOketKXRZGXX7c76ORscToDyWC21ILJ11yhLcoOPDSb
X-Gm-Gg: ASbGnctHZPxlQTph/RV2D++o/+CFnKToaQV10faj0hPJjUOaq3WCUHSCBv9pMF+BsGw
	Q0Zxs9tc30t0eCFRti3ZSU82Q9Bvw3eflcJAjxrKfXv8oerkIs6IvzCUNKxjVEJHpzfsvzxqgsB
	aFzD5ia2JoLvxuT+txYKRfAeohCJcK2PhhdGZPup1bT37sH9DChldpauhKZsnQ8I05M6nx1OVO9
	hfMsjkuiQdWxwceFwI/VoBWS88ozypPZOfim3vhUIdg+Nm/t2i29YqdhQY8fzbEvqc/xd53/W1U
	0rCfpDE6urry8wSILaRRvh3zrFn+QKU=
X-Google-Smtp-Source: AGHT+IEADpsGTjgtHAzuX7hw5RDluvGrSXqtA16Wi/JbepvNGzAfKGiTFMXi8HuVsoNxKBNMzA2nUA==
X-Received: by 2002:a05:600c:3b8b:b0:431:55af:a230 with SMTP id 5b1f17b1804b1-43668b7a1f6mr408614405e9.33.1736239245565;
        Tue, 07 Jan 2025 00:40:45 -0800 (PST)
Received: from work-ubuntu.. (155.red-88-14-68.dynamicip.rima-tde.net. [88.14.68.155])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8b874asm49802758f8f.109.2025.01.07.00.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 00:40:45 -0800 (PST)
From: Florian Wickert <florianwickert@gmail.com>
X-Google-Original-From: Florian Wickert <FlorianWickert@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Florian Wickert <FlorianWickert@gmail.com>
Subject: [meta-virtualization][PATCH] image-oci-umoci: preserve file modes in rootfs
Date: Tue,  7 Jan 2025 09:40:20 +0100
Message-ID: <20250107084020.2361279-1-FlorianWickert@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Jan 2025 08:40:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9073

cp does not preserve file modes by default.
This will break sudo (among others) which needs the suid flag to do its
work.

This patch adds the --preserve=mode flag to the cp call to fix this.

Signed-off-by: Florian Wickert <FlorianWickert@gmail.com>
---
 classes/image-oci-umoci.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
index c77750fb..bbea2add 100644
--- a/classes/image-oci-umoci.inc
+++ b/classes/image-oci-umoci.inc
@@ -49,8 +49,8 @@ IMAGE_CMD:oci() {
     fi
 
     bbdebug 1 "OCI: populating rootfs"
-    bbdebug 1 "OCI: cp -r ${IMAGE_ROOTFS}/* $image_bundle_name/rootfs/"
-    cp -r ${IMAGE_ROOTFS}/* $image_bundle_name/rootfs
+    bbdebug 1 "OCI: cp -r --preserve=mode ${IMAGE_ROOTFS}/* $image_bundle_name/rootfs/"
+    cp -r --preserve=mode ${IMAGE_ROOTFS}/* $image_bundle_name/rootfs
 
     bbdebug 1 "OCI: umoci repack --image $image_name:${OCI_IMAGE_TAG} $image_bundle_name"
     umoci repack --image $image_name:${OCI_IMAGE_TAG} $image_bundle_name
-- 
2.43.0


