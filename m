Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93919C53209
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 00:03:29 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20603.1785110601992077247
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 26 Jul 2026 17:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=PC0m5COv;
 spf=pass (domain: konsulko.com, ip: 209.85.214.172, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cace91f112so22097205ad.0
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 26 Jul 2026 17:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785110601; x=1785715401; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dI0voafy1xUsLf1FkhAEGXj0HVUydZSWDgai8cP79WM=;
        b=PC0m5COvz6WjjA6YVQeY+AGvmlnn4H66JZjyAXR0+zvETmrLOV8nToJwoCa0VRsdSC
         Nf2VOjp4ZvaYkHKNmCiyednzRewHaJWqu9eadClYJ3Pa3gN8/mzORcJreEd0cXrOnSAD
         tmQ+zWX/ys3flgThncpe575+OTK/bFdfGe/hA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785110601; x=1785715401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dI0voafy1xUsLf1FkhAEGXj0HVUydZSWDgai8cP79WM=;
        b=az48hoL6Xqu7i4a26XukskUA5GX9rVLwgGqo+DIe7BLSdVcX/RTyhDtFPS3wwTiUpt
         ZVShzPs6uSPc5wZjKPS2yRsKQGZnZd6zK9jfkYpza8WWweD67mF2gBtniF5+ONr2+6qZ
         63GAoZJ7QuAXgztR2f3vMccjmXfJ56Upsp+CD139Rt+r0E+sb4qgeA3EKib6++AYAvjr
         O0WupoIQ7hBQU02ttoHGXc0yDBk8HkYRNNQaB1+fuwAfpeZXkjGo4OvUI1oQl36gkRlr
         WzadAADcv7vFMRct2CxNyAS41mfVRLOoJR54EWa7RbxpDYujkDSCWJ28pFwwk1IK9Slb
         miGw==
X-Gm-Message-State: AOJu0YzrHwewUCfanzspTnwnb8CYAell3+C42aZfj0OgG4RVP76dpsFX
	IdKMFN7E8/fy1cnLfb9zOpFwx2lYirh502RzMBpqvJJT2jxaH5JNBo3jGjCfc9L0SpEVRfDHMyQ
	1iYmu
X-Gm-Gg: AR+sD11Y+n6FLw/LAcRu6Th9dGhcdyTi1/6f+urI6XH4ms4E1V5Lb0qBDPBnEbsy/K+
	ajB02IJq/wB53+GD6CUC/2GKrfvEfJSVdiSfwiS94P4PAM6l9gPmdGDtexvVmEqgUHvQGcaxhEP
	USvG9v45nCvodhHEZvXQYhsF35dRiQQTAyDGeR809dXbnn+pfQfRJf8pE8a+PzXKOy4VCa6B2X7
	qEOoDypgjLt8RAFW6EyRvBJD5gbYHE//+8v126cjZ/Mfb/K7RzihKIov0Gai3TVpzNN7wl2DoZQ
	DnbszY8OgQjyMIvrw/nJ6IGpoK4s9oAApfb74S5jnhidxZRacuwaelkGYUwD5X/I6e7fFan/FMO
	yiZeVHl1vNRRpq8Bha+C7AfLFfkJ4eJCybdURT1NIqbRisSwtRbgoVj7X0Tsyfr8NGP9//BQCZo
	XG2dpaT/5VBO38RQ0MuYE=
X-Received: by 2002:a17:903:a90:b0:2ca:ed41:d331 with SMTP id d9443c01a7336-2cfde89b942mr55795895ad.45.1785110601277;
        Sun, 26 Jul 2026 17:03:21 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:4c93:d927:aa69:60a6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e2b44sm25048625ad.27.2026.07.26.17.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 17:03:20 -0700 (PDT)
From: tim.orling@konsulko.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-virtualization][RFC][PATCH 1/5] vcontainer-bbmask.inc: add python3-pexpect,-ptyprocess
Date: Sun, 26 Jul 2026 17:02:41 -0700
Message-ID: <20260727000247.1623785-3-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Jul 2026 00:03:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9981

From: Tim Orling <tim.orling@konsulko.com>

For multiarch container-yocto-builder, during run-time testing
with the bitbake-setup workflow, it was discovered that we need
python3-pexpect and its dependency python3-ptyprocess.

Remove the layer-wide meta-python BBMASK and allow these
specific recipes.

Once meta-python is allowed, there was an error for
meta-oe/dynamic-layers/meta-python which we do not need for the
above recipes. It can be enabled in the future when needed.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 conf/distro/include/vcontainer-bbmask.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/conf/distro/include/vcontainer-bbmask.inc b/conf/distro/include/vcontainer-bbmask.inc
index 0c9b8b02..0c6a7efc 100644
--- a/conf/distro/include/vcontainer-bbmask.inc
+++ b/conf/distro/include/vcontainer-bbmask.inc
@@ -94,6 +94,8 @@ BBMASK += "meta-openstack/recipes-dbs/postgresql/"
 BBMASK += "meta-oe/dynamic-layers/networking-layer/recipes-core/"
 BBMASK += "meta-openstack/recipes-extended/libvirt/"
 BBMASK += "meta-webserver/recipes-(?!httpd/nginx)"
+BBMASK += "meta-python/recipes-devtools/python/python3-(?!pexpect|ptyprocess)"
+BBMASK += "meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/"
 
 # ---------------------------------------------------------------------------
 # Entire layers with 0 recipes in the container image dependency graph.
@@ -101,7 +103,7 @@ BBMASK += "meta-webserver/recipes-(?!httpd/nginx)"
 # does not warn about zero files matching BBFILE_PATTERN.
 # ---------------------------------------------------------------------------
 BBMASK += "meta-filesystems/"
-BBMASK += "meta-python/"
+
 # Warning suppression for these fully-masked layers is in meta-virt-host.conf
 # (BBFILE_PATTERN_IGNORE_EMPTY) because BitBake checks the base datastore,
 # not per-multiconfig datastores.
-- 
2.47.3


