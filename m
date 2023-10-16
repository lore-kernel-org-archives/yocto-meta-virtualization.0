Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD99CDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 21:08:43 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.180155.1697490516815389722
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 14:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SAxaDF+R;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6c6368a1a97so3004037a34.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Oct 2023 14:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697490515; x=1698095315; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EZTKmXvRcra2Dvb4h/1b2OJ0oGLTq4p28emR2ah7lYE=;
        b=SAxaDF+RkMB+4jIQunuoYfmTNG3IOz9d1joy7iAxLoN4hiMUgNypg6viSPB7YQaNBX
         hFCiQlj7aGfvcYATfxQjaohBszPsioFnHfjCkaAkrJWaspEdXm0hiJUHEUvCAwydQPrh
         CT9MnDlNgU7nmH0lW7i/XoIHd1Cb2MOU7sF22+jXMzUuT4EXCuzHZpT7faoHRMIVSVHE
         4mOnQvPj+284AncaE99eyfsgfTxPVaaF98BFZSz0NpRN08F2UoA98WDvcNxg+3Grjqhl
         q21XWEZ9lyvymWBDziqtxT4EBXYlngPwGGdiADo9qFjwWeK0KjNtOaouD8q6d9sgj0Ze
         z2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697490515; x=1698095315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZTKmXvRcra2Dvb4h/1b2OJ0oGLTq4p28emR2ah7lYE=;
        b=RI/r0CUs/KiVYIwHVFvOc9y1GFcfHe+TH21mdWFZV4nv3YN/kXFxpYlm5442IeKgrh
         sKRJ3aU5hlU9U0Ci1RWQFq3Ri18a8sCjioDEtgKMkMDgnONqFXCXbXdPKy64lQ19JR7p
         RqShWp5Ys6wNKszYcjvJHXBRA96/MUk+AuJLWu7T8GZyOCquk9qMyMm9jonoUlkAAk1e
         BIdqlI2HkJAl7aeY3M54mH1lnKUMl7Dzr68P7Nndo2C0jEcwH7pjQIWAU0zSUThajgPl
         RSay+L8p3TFcW9lHH9O3G1pR7Q+tjkN6uwVJDQnXq4WFzDVQQaH6uIiJPGFOR0oxG/PM
         IkpA==
X-Gm-Message-State: AOJu0YxaNz92/KExa16niw/BpB8yPO2flWtntQV/ykNqO+vsRvyOD00C
	v+3DDERR9wD2vnzK43POh5EzuUY/AVM=
X-Google-Smtp-Source: AGHT+IHueu862pQQjibwbwp4L5A+vvH2l9rLBLefXc23Y4QNyMZAckMAch9j4gKxZEhhvJHKBoXBYw==
X-Received: by 2002:a05:6870:350f:b0:1e9:668f:46d0 with SMTP id k15-20020a056870350f00b001e9668f46d0mr322552oah.19.1697490515459;
        Mon, 16 Oct 2023 14:08:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::589])
        by smtp.gmail.com with ESMTPSA id e7-20020a056870a60700b001ea4324364csm632294oam.12.2023.10.16.14.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 14:08:34 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-virtualization][PATCH] classes/image-oci-umoci: Allow labels to have spaces
Date: Mon, 16 Oct 2023 15:08:32 -0600
Message-Id: <20231016210832.2116524-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Oct 2023 21:08:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8375

Quote the label argument passed to umoci to allow it to correctly handle
spaces. Note that this requires that OCI_IMAGE_LABELS have the argument
quoted with single quotes, as in:

    OCI_IMAGE_LABELS = "org.opencontainers.image.description='${SUMMARY}'"

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 classes/image-oci-umoci.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
index 58e4668..333c816 100644
--- a/classes/image-oci-umoci.inc
+++ b/classes/image-oci-umoci.inc
@@ -58,8 +58,8 @@ IMAGE_CMD:oci() {
     bbdebug 1 "OCI: configuring image"
     if [ -n "${OCI_IMAGE_LABELS}" ]; then
 	for l in ${OCI_IMAGE_LABELS}; do
-	    bbdebug 1 "OCI: umoci config --image $image_name:${OCI_IMAGE_TAG} --config.label $l"
-	    umoci config --image $image_name:${OCI_IMAGE_TAG} --config.label $l
+	    bbdebug 1 "OCI: umoci config --image $image_name:${OCI_IMAGE_TAG} --config.label \"$l\""
+	    umoci config --image $image_name:${OCI_IMAGE_TAG} --config.label "$l"
 	done
     fi
     if [ -n "${OCI_IMAGE_ENV_VARS}" ]; then
-- 
2.34.1


