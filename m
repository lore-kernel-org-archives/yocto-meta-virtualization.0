Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F64DCDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 21:34:43 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.181286.1697492080706223946
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 14:34:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gfqj2+dX;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3af609c3e74so3347039b6e.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Oct 2023 14:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697492079; x=1698096879; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e8G1rph4W4+QGpQAud0weUf87LanBpHk4BjgncW/fA8=;
        b=Gfqj2+dXCA52BEuBtKL4qH6YpI5agsYamFiUOxEv0Q9kLj/svqCu0byTgfhz1TInXj
         ZPvPS5EEkDI7qsCUXIAV1pjzJ9yyBwhPZ8v9WUTMGBcVtgOs2+RyEGZTU4gZfcMYI9LU
         +uxLuoOfGQ0kGSzWKS3aD6A2aDYQHGWJgDQerJzpwKJ7sPmkWJsMIhjNh2E4LB1645be
         HGtTdTyaeBo9f2WwZxLkOTmZs0tsxyVW4+6uYjPpZZXKfhLn4vSnKq/pOzzuw2588883
         N3zSrVJFqcQksUpxZILXtzWhGuTS8ghLEdVPkh787JMNlBmXQPDY2Cpbn7LLNMbu/zPN
         lRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697492079; x=1698096879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e8G1rph4W4+QGpQAud0weUf87LanBpHk4BjgncW/fA8=;
        b=j2y4iUJuOvVwc+tdV8bH1k8v29UrXDnjusgKEsCctYu0Yg9WYotSbMhTFKucff0pAG
         tNP68DDR51R97t5nWnLQCwTL1XvsXJ72KpsV3Isrkqc9bCc82Rw6Isw91hmZGQjhCSIN
         qcsRyjvKwjJUHxWwz+3P9RTHtcEFrigleIq9/XwrFWAqtYlK5EyisM2yZEJAPRCeR/Qu
         oqIPETaykwh0NVr+ah80eyTUSsRAx7Kbppmm2B3xcoJfdPpdivWwq3DzurEWXpkEpY7q
         pLtSGHoHY/H6GANgLcvoPCo+aZ++cpdexP5YpsEDEwcZ1c97GupMgtfpR3E3VtrknC0R
         QeQg==
X-Gm-Message-State: AOJu0YzGAz+DZo+qZP7vzBBmobQXSBSQfTcxe1iuBCib0nEci3bXBB1L
	WdBGXg6NIMdQ+1xgpypL0YwCGXlNRpw=
X-Google-Smtp-Source: AGHT+IE03kh8S35AFwqI4+FJ8vhLxA5qRPIGdNpmOYEQu/IuizBJI+TZu+iVNDXvUXd+xd16UvBp4A==
X-Received: by 2002:a05:6808:2792:b0:3ae:12f6:ac51 with SMTP id es18-20020a056808279200b003ae12f6ac51mr434401oib.41.1697492079345;
        Mon, 16 Oct 2023 14:34:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::589])
        by smtp.gmail.com with ESMTPSA id 6-20020aca0b06000000b003a3860b375esm27705oil.34.2023.10.16.14.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 14:34:37 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-virtualization][PATCH] classes/image-oci-umoci: Allow environment variables to have spaces
Date: Mon, 16 Oct 2023 15:34:31 -0600
Message-Id: <20231016213431.2149835-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Oct 2023 21:34:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8377

Quote the environment variable argument passed to umoci to allow it to
correctly handle spaces. Note that this requires that OCI_IMAGE_ENV_VARS
have the argument quoted with single quotes, as in:

    OCI_IMAGE_ENV_VARS = "FOO='bar bat'"

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 classes/image-oci-umoci.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
index d96b438..e8facfe 100644
--- a/classes/image-oci-umoci.inc
+++ b/classes/image-oci-umoci.inc
@@ -64,8 +64,8 @@ IMAGE_CMD:oci() {
     fi
     if [ -n "${OCI_IMAGE_ENV_VARS}" ]; then
 	for l in ${OCI_IMAGE_ENV_VARS}; do
-	    bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG} --config.env $l"
-	    umoci config --image $image_name:${OCI_IMAGE_TAG} --config.env $l
+	    bbdebug 1 "umoci config --image $image_name:${OCI_IMAGE_TAG} --config.env \"$l\""
+	    umoci config --image $image_name:${OCI_IMAGE_TAG} --config.env "$l"
 	done
     fi
     if [ -n "${OCI_IMAGE_PORTS}" ]; then
-- 
2.34.1


