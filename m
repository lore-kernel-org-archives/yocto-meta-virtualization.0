Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E49B3C4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 19:08:23 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web10.158111.1698692894311314096
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 30 Oct 2023 12:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CayFqvhG;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6ce31c4a653so3243972a34.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 30 Oct 2023 12:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698692893; x=1699297693; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8hdbp0WgHQHrCDvdmq6zS3yY0dTnSt88hFO0GRQGzI=;
        b=CayFqvhGT/5XiYnM1ZKzxJzg5aP+L0zCtHJ9/MS9dEjDmuovV/hxuWWOKyylq+61x/
         RGN7xZAlY6tk00mNv8Au1xGhh+smUQFin2qqlR/jDdYA9DQFFKg5kUByne1Hmb2RA3tt
         iOuAq8EnuR4AcmulljTCG0ePeTCbjyhd2MqYkWyrqItczRrCW33Z/joOBQJU/OApCXEs
         cVZs6vHPpSvD0IMd1cijOO+fsGDpcbLnf6qZsKfB6K7xF5Tt2fARQvSs0Ss86PX2UI+R
         rV3adjpww4iEguOxJUL68oYh2NBzYpTFGiRCY5LUR9KO3jfZNPOCV4Db25jtILNXoEp7
         ZnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698692893; x=1699297693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8hdbp0WgHQHrCDvdmq6zS3yY0dTnSt88hFO0GRQGzI=;
        b=T9Ar36z4McnfWIQDIbUAXaqAHkIsWB7IVytWgIr9/0dTaIKhgv1GEMSQnR+RWXRyNL
         2l6CBi0CijJkW+3bL2IA3iQMahxM399jDX8XLIQkVFZsUNMBe08evzuek4EvkfvExkqd
         i0y/D74GeXns5Q8vfLN4yoy+UmnilFIKljfMXEk2IjJlIKEXs1DKtfLzFQL8slTelxOd
         kXl3ZEMs6blrj196YQN2lQ4mdAv6BZYFGnRJ1ylJ5WmXxcpHI39NCqJs4HS/FPfX52S+
         ERLSW2kntelqa7HpHOhn5ccwI0lo4uICNSm1Ceadi+Mc1ZL2Qr8nVfBmHWyPZocugm4Y
         YAkw==
X-Gm-Message-State: AOJu0YwNqtPy7voWSwo5INN3E90wGwdXjtrdFKztV8DP+m5mHKUD90f+
	BZkLxCDhrzHBUH61mY1CwXDX/Hb4+H0=
X-Google-Smtp-Source: AGHT+IFygB4An8PfasqtT8BAqSFBagOPbWOJ83DC8LpUY1AiHABZCOrCSd0MKeKt1ujkmN+RHGM92Q==
X-Received: by 2002:a05:6830:12d5:b0:6ce:ca0:eaef with SMTP id a21-20020a05683012d500b006ce0ca0eaefmr11907069otq.26.1698692892926;
        Mon, 30 Oct 2023 12:08:12 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::6aa6])
        by smtp.gmail.com with ESMTPSA id g39-20020a05683030a700b006ce342a5dbdsm1499599ots.13.2023.10.30.12.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 12:08:12 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-virtualization][PATCH v2] classes/image-oci: Map image architecture correctly
Date: Mon, 30 Oct 2023 13:08:02 -0600
Message-Id: <20231030190802.1275280-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231016212626.2146963-1-JPEWhacker@gmail.com>
References: <20231016212626.2146963-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 30 Oct 2023 19:08:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8408

OCI requires that the architecture [1] be a valid GOARCH [2]. To
correctly perform this mapping, use the go library code from OE core.

[1]: https://github.com/opencontainers/image-spec/blob/main/config.md#properties
[2]: https://go.dev/doc/install/source#environment

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 classes/image-oci.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/image-oci.bbclass b/classes/image-oci.bbclass
index 9ddb88b..0ec5c48 100644
--- a/classes/image-oci.bbclass
+++ b/classes/image-oci.bbclass
@@ -52,7 +52,7 @@ OCI_IMAGE_AUTHOR_EMAIL ?= "${PATCH_GIT_USER_EMAIL}"
 OCI_IMAGE_TAG ?= "latest"
 OCI_IMAGE_RUNTIME_UID ?= ""
 
-OCI_IMAGE_ARCH ?= "${TARGET_ARCH}"
+OCI_IMAGE_ARCH ?= "${@oe.go.map_arch(d.getVar('TARGET_ARCH'))}"
 OCI_IMAGE_SUBARCH ?= "${@oci_map_subarch(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
 
 OCI_IMAGE_ENTRYPOINT ?= "sh"
-- 
2.34.1


