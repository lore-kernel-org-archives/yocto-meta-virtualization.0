Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDDB3E7C4CB
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 14:55:03 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web11.20612.1696431296188895731
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Oct 2023 07:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fbxO7FHP;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6c64c2c0f97so1448547a34.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 04 Oct 2023 07:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696431295; x=1697036095; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=24m2sfVRccRpglM6JVnvrft64NI9cvDrwOHrXcMR5ug=;
        b=fbxO7FHPI5aIzRDkSNgx3jbea2dkGI140ESZjkt20/6ViIexLaRWqZz2mSwy3F3w3K
         zJOsd5HDqyP7T7MSsbeuRVaWMRAwSrO0ITZAHgf9KdlrYmLulASauF1AnihPO2dN45M8
         lLUb2CS1LE5ecezb+EQiHrPLT0PjYr3pAjEWANydHmXUJYBrgRgwQGTrXcNVBchf8azj
         rtD3Hag9Bl2H9+IApN+zy+WHNj2UzRo20cbwZONQy5DMuLwSTAXSr1YCOdio80fTii5h
         dBaWdvijF4voQlAmitXj6ZESXsRREfMKGdVsLCtnuJja/jN63hM2EEg2ZL8vOtxdJN2r
         yKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696431295; x=1697036095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=24m2sfVRccRpglM6JVnvrft64NI9cvDrwOHrXcMR5ug=;
        b=XdexcczVruQTi56kEstLKha2PsI/fm++dgJtHCl/I+EWoao6nnLQ6MJNbBOVEwwfa0
         CAemCQ834I2QeZWt6srRNOIukDzITno/+8C4gCTUZAxp4TV3okuOkj4jZ9VvDoEiNbSI
         qvi/guugKk3fDVOFMXofG+dqnEvDlVDPTX+A5+maObAP+o1qLUggklQfb5af3EEfrC7f
         vCi+Q3qzNGdrcTGxd5DjzxABXzBPftKaRa8bpp9MVmDIWWeU64ljGfOVVSWTLzo98dV9
         WnGYK+HorErro7MkmLuIaENpL7S9AoZyE9nG7wqjZ+FUuqX51izQBhWTBOexl4grdvkJ
         S8cQ==
X-Gm-Message-State: AOJu0YxyYvIe1R1r/XKaRWzopurmSlDpVxoUOMFTtjgLloiqkGuhTYn1
	FVKNEXy92C1le/RSKIluWdJFsUPmWdQ=
X-Google-Smtp-Source: AGHT+IGi/ugIT3G5Ht5awZ1sX2gQeMWPgplQ8BuSjKBDsOdN3DAzhzlH4EsTOdNF61JD7jRXAtBC5A==
X-Received: by 2002:a9d:5e97:0:b0:6be:fd51:cb6d with SMTP id f23-20020a9d5e97000000b006befd51cb6dmr2325076otl.31.1696431294842;
        Wed, 04 Oct 2023 07:54:54 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::589])
        by smtp.gmail.com with ESMTPSA id h9-20020a9d6f89000000b006c4d56392f4sm487101otq.24.2023.10.04.07.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 07:54:54 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-virtualization][RFC] image-oci-umoci: Set image name and tag
Date: Wed,  4 Oct 2023 08:54:33 -0600
Message-Id: <20231004145433.3544915-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 04 Oct 2023 14:55:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8335

umoci treats the --image parameter as <DIRECTORY>:<NAME>, where the OCI
spec ref.name for the image it set to <NAME>. Therefore, if the
intention is for the ref.name to be in the format <IMAGE_NAME>:<TAG> (as
is expected by e.g. `podman load`, then the complete argument that is
passed to umoci must be `--image <DIRECTORY>:<IMAGE_NAME>:<TAG>`

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 classes/image-oci-umoci.inc | 52 +++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 25 deletions(-)

diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
index 58e4668..a58cb4c 100644
--- a/classes/image-oci-umoci.inc
+++ b/classes/image-oci-umoci.inc
@@ -35,14 +35,16 @@ IMAGE_CMD:oci() {
     fi
 
     if [ -z "${OCI_IMAGE_TAG}" ]; then
-	OCI_IMAGE_TAG="initial-tag"
-    fi
+	image_spec="$image_name:${IMAGE_BASENAME}:initial-tag"
+    else
+	image_spec="$image_name:${IMAGE_BASENAME}:${OCI_IMAGE_TAG}"
+   fi
 
     if [ -n "$new_image" ]; then
 	bbdebug 1 "OCI: umoci init --layout $image_name"
 	umoci init --layout $image_name
-	umoci new --image $image_name:${OCI_IMAGE_TAG}
-	umoci unpack --rootless --image $image_name:${OCI_IMAGE_TAG} $image_bundle_name
+	umoci new --image $image_spec
+	umoci unpack --rootless --image $image_spec $image_bundle_name
     else
 	# todo: create a different tag, after checking if the passed one exists
 	true
@@ -52,58 +54,58 @@ IMAGE_CMD:oci() {
     bbdebug 1 "OCI: cp -r ${IMAGE_ROOTFS}/* $image_bundle_name/rootfs/"
     cp -r ${IMAGE_ROOTFS}/* $image_bundle_name/rootfs
 
-    bbdebug 1 "OCI: umoci repack --image $image_name:${OCI_IMAGE_TAG} $image_bundle_name"
-    umoci repack --image $image_name:${OCI_IMAGE_TAG} $image_bundle_name
+    bbdebug 1 "OCI: umoci repack --image $image_spec $image_bundle_name"
+    umoci repack --image $image_spec $image_bundle_name
 
     bbdebug 1 "OCI: configuring image"
     if [ -n "${OCI_IMAGE_LABELS}" ]; then
 	for l in ${OCI_IMAGE_LABELS}; do
-	    bbdebug 1 "OCI: umoci config --image $image_name:${OCI_IMAGE_TAG} --config.label $l"
-	    umoci config --image $image_name:${OCI_IMAGE_TAG} --config.label $l
+	    bbdebug 1 "OCI: umoci config --image $image_spec --config.label $l"
+	    umoci config --image $image_spec --config.label $l
 	done
     fi
     if [ -n "${OCI_IMAGE_ENV_VARS}" ]; then
 	for l in ${OCI_IMAGE_ENV_VARS}; do
-	    bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG} --config.env $l"
-	    umoci config --image $image_name:${OCI_IMAGE_TAG} --config.env $l
+	    bbdebug 1 "umoci config --image $image_spec --config.env $l"
+	    umoci config --image $image_spec --config.env $l
 	done
     fi
     if [ -n "${OCI_IMAGE_PORTS}" ]; then
 	for l in ${OCI_IMAGE_PORTS}; do
-	    bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG} --config.exposedports $l"
-	    umoci config --image $image_name:${OCI_IMAGE_TAG} --config.exposedports $l
+	    bbdebug 1 "umoci config --image $image_spec --config.exposedports $l"
+	    umoci config --image $image_spec --config.exposedports $l
 	done
     fi
     if [ -n "${OCI_IMAGE_RUNTIME_UID}" ]; then
-	bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG}  --config.user ${OCI_IMAGE_RUNTIME_UID}"
-	umoci config --image $image_name:${OCI_IMAGE_TAG} --config.user ${OCI_IMAGE_RUNTIME_UID}
+	bbdebug 1 "umoci config --image $image_spec  --config.user ${OCI_IMAGE_RUNTIME_UID}"
+	umoci config --image $image_spec --config.user ${OCI_IMAGE_RUNTIME_UID}
     fi
     if [ -n "${OCI_IMAGE_WORKINGDIR}" ]; then
-	bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG}  --config.workingdir ${OCI_IMAGE_WORKINGDIR}"
-	umoci config --image $image_name:${OCI_IMAGE_TAG} --config.workingdir ${OCI_IMAGE_WORKINGDIR}
+	bbdebug 1 "umoci config --image $image_spec  --config.workingdir ${OCI_IMAGE_WORKINGDIR}"
+	umoci config --image $image_spec --config.workingdir ${OCI_IMAGE_WORKINGDIR}
     fi
     if [ -n "${OCI_IMAGE_STOPSIGNAL}" ]; then
-	bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG}  --config.stopsignal ${OCI_IMAGE_STOPSIGNAL}"
-	umoci config --image $image_name:${OCI_IMAGE_TAG} --config.stopsignal ${OCI_IMAGE_STOPSIGNAL}
+	bbdebug 1 "umoci config --image $image_spec  --config.stopsignal ${OCI_IMAGE_STOPSIGNAL}"
+	umoci config --image $image_spec --config.stopsignal ${OCI_IMAGE_STOPSIGNAL}
     fi
     if [ -n "${OCI_IMAGE_OS}" ]; then
-	bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG}  --os ${OCI_IMAGE_OS}"
-	umoci config --image $image_name:${OCI_IMAGE_TAG} --os ${OCI_IMAGE_OS}
+	bbdebug 1 "umoci config --image $image_spec  --os ${OCI_IMAGE_OS}"
+	umoci config --image $image_spec --os ${OCI_IMAGE_OS}
     fi
 
-    bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG}  --architecture ${OCI_IMAGE_ARCH}"
-    umoci config --image $image_name:${OCI_IMAGE_TAG} --architecture ${OCI_IMAGE_ARCH}
+    bbdebug 1 "umoci config --image $image_spec  --architecture ${OCI_IMAGE_ARCH}"
+    umoci config --image $image_spec --architecture ${OCI_IMAGE_ARCH}
     # NOTE: umoci doesn't currently expose setting the architecture variant,
     #       so if you need it use sloci instead
     if [ -n "${OCI_IMAGE_SUBARCH}" ]; then
 	bbnote "OCI: image subarch is set to: ${OCI_IMAGE_SUBARCH}, but umoci does not"
 	bbnote "     expose variants. use sloci instead if this is important"
     fi
-    umoci config --image $image_name:${OCI_IMAGE_TAG} --config.entrypoint ${OCI_IMAGE_ENTRYPOINT}
+    umoci config --image $image_spec --config.entrypoint ${OCI_IMAGE_ENTRYPOINT}
     if [ -n "${OCI_IMAGE_ENTRYPOINT_ARGS}" ]; then
-	umoci config --image $image_name:${OCI_IMAGE_TAG} --config.cmd "${OCI_IMAGE_ENTRYPOINT_ARGS}"
+	umoci config --image $image_spec --config.cmd "${OCI_IMAGE_ENTRYPOINT_ARGS}"
     fi
-    umoci config --image $image_name:${OCI_IMAGE_TAG} --author ${OCI_IMAGE_AUTHOR_EMAIL}
+    umoci config --image $image_spec --author ${OCI_IMAGE_AUTHOR_EMAIL}
 
     # make a tar version of the image direcotry
     #  1) image_name.tar: compatible with oci tar format, blobs and rootfs
-- 
2.34.1


