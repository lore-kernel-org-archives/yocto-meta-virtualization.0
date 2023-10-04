Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF99E7C4DA
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 16:02:55 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.22449.1696435366796458388
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Oct 2023 09:02:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NAVjtbgm;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6c620883559so1550448a34.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 04 Oct 2023 09:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696435365; x=1697040165; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pkVb7+/T2toQLX+paN5wUs+RG3rSxU8klXNuyTFN2Wc=;
        b=NAVjtbgmq4PgxOdA0i50k2Ey7u9iDeW8CLOyVZ5s3J2MNwOxUjvRIjNQ5SBag9Rhvx
         I9JpbebTIdbHGBV2+5q5DPA9c0MHW/gyrkr6NR/+thElHEXJdmeq0RJTipm07uHZI28O
         dVuqSjAW4dv2hnMV+VKt7L1nzQueKSVCbPdT5wBW2uY7UcHywWusrkEZBhT0W3QQ4jwE
         tLPdOJQIT7OBjcAq9w0e1sn6tWP/UWT8EX3mQP5GA2jHJ4zcpT5HUQz7sy/kzMGxXjGO
         m6PeDpMKVE5B0Z9k7Vb8CPDApt5MrO64m75mdzAIc8SbTxApK1OuUCHPLvGViFOgRlbZ
         wz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696435365; x=1697040165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pkVb7+/T2toQLX+paN5wUs+RG3rSxU8klXNuyTFN2Wc=;
        b=vgWdXTUoVdaqp6v4nI4g8GbOJktmPXZgZPBwQ+hkRnmG+DPdBsqLRIarQzZh1Lcx1P
         MSHc+nY/+a6Y+bxAprgCDVG5yPCbGUEc0dgF2oe0hXpiNrpGCcj3U9NwwwYoN6h8DytU
         XFumONyA8I2aClN3K5h4Z1Po1H34RQB0X25YSVTzUF/1c93OKbz78mLNRFc/cpysFPR5
         9c3JzLsOoOEA3Y5dpIOe5n1QzvpLHd07/9BpySfj6Tj107OnI1dm3bPXOwiVUJUvq4JW
         6bW8nqfLBf1TRNUXmlWiEgz2wXf9RfGJKMZOlhXiHIPOrY2BxDlMuzB+4WHD9BSTHiC8
         byMg==
X-Gm-Message-State: AOJu0YxoZb77HI/uZv/saeJgej8yM9AH4lKwZ8MWeOh3EI2waU3107vb
	cs/bEG7a07O75ihQeEUII7tjTCe+QeA=
X-Google-Smtp-Source: AGHT+IHcVnj11mCiafcHLspY9nVOSEjjIaWBYmdDnTN7O6yJ2tDw74jmeae7UCb5rRQ9J3VtYLyqEA==
X-Received: by 2002:a05:6870:d681:b0:1ba:cc77:1d81 with SMTP id z1-20020a056870d68100b001bacc771d81mr3065844oap.46.1696435365385;
        Wed, 04 Oct 2023 09:02:45 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::589])
        by smtp.gmail.com with ESMTPSA id e21-20020a056870c35500b001dd5857e243sm703232oak.14.2023.10.04.09.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 09:02:44 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-virtualization][PATCH] classes/image-oci-umoci: Replace ":" in image file name
Date: Wed,  4 Oct 2023 10:02:12 -0600
Message-Id: <20231004160212.3574826-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 04 Oct 2023 16:02:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8336

The OCI_IMAGE_TAG variable can contain a ":" if the user wants to give
the image a name and a tag, as in:

    OCI_IMAGE_TAG = "${IMAGE_BASENAME}:latest"

However, while this is valid for tag name, the ":" is illegal in OCI
image file names so replace it with "_" when naming the symlinks

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 classes/image-oci-umoci.inc | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
index 58e4668..adca6c1 100644
--- a/classes/image-oci-umoci.inc
+++ b/classes/image-oci-umoci.inc
@@ -105,6 +105,10 @@ IMAGE_CMD:oci() {
     fi
     umoci config --image $image_name:${OCI_IMAGE_TAG} --author ${OCI_IMAGE_AUTHOR_EMAIL}
 
+    # OCI_IMAGE_TAG may contain ":", but these are not allowed in OCI file
+    # names so replace them
+    image_tag="${@d.getVar("OCI_IMAGE_TAG").replace(":", "_")}"
+
     # make a tar version of the image direcotry
     #  1) image_name.tar: compatible with oci tar format, blobs and rootfs
     #     are at the top level. Can load directly from something like podman
@@ -118,13 +122,13 @@ IMAGE_CMD:oci() {
 	tar -cf "$image_name-dir.tar" "$image_name"
 
 	# create a convenience symlink
-	ln -sf "$image_name.tar" "${IMAGE_BASENAME}-${OCI_IMAGE_TAG}-oci.tar"
-	ln -sf "$image_name-dir.tar" "${IMAGE_BASENAME}-${OCI_IMAGE_TAG}-oci-dir.tar"
+	ln -sf "$image_name.tar" "${IMAGE_BASENAME}-$image_tag-oci.tar"
+	ln -sf "$image_name-dir.tar" "${IMAGE_BASENAME}-$image_tag-oci-dir.tar"
     fi
 
     # We could make this optional, since the bundle is directly runnable via runc
     rm -rf $image_bundle_name
 
     # This is the OCI image directory, which is technically the "image" as specified
-    ln -sf $image_name ${IMAGE_BASENAME}-${OCI_IMAGE_TAG}-oci
+    ln -sf $image_name ${IMAGE_BASENAME}-$image_tag-oci
 }
-- 
2.34.1


