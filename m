Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA5BDC433FE
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 21:42:48 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web08.16457.1664487761084346756
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 14:42:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JnP6ob6X;
 spf=pass (domain: gmail.com, ip: 209.85.166.44,
 mailfrom: danismostlikely@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id e205so1964490iof.1
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 14:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ynD9n4X1jvj6xX1cV7Hgu9yba9OUkdZPYmsXU0XDP70=;
        b=JnP6ob6XS+vAIq/VZsH4nSsOByWE5bKrvlKysltWLMPbzSpe1cy7DFAT5ebI69HQq+
         CB6gkIxP2AeHvuTIylC5bY1cIJadzRmlNZXku7XiqipCs122cU7j4K2Z92DX4T5D1gev
         WdBvjSBKSz/ABNOPFIwRsUBzb/TLH0G/pVtQvrheS7DEozNYC7cnhG7x5GezEY7/Q1Y9
         o4sLBEygQGdYbffCGSs5WorhlXIPsF+JYKiMM5YKTN0gOZP3ghPSXkCGJwilsH5UEfvJ
         oauGlnuIGMDDqV+DXfBydjMX/qs5fh4Q9lYrNSIsvpZrdn4KykjHEZB1xMDljtvfhwvd
         /4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ynD9n4X1jvj6xX1cV7Hgu9yba9OUkdZPYmsXU0XDP70=;
        b=6N7mHklw1xpdImkrlH8hZJGzTUWKTzUXYcOHdDXqedqy/QQanUdBPwJYg/YsStg4q2
         BJ3OvcjAXV8jSf2JWiiI64sTLeqRWBSatzyepvqHOD1vmDxC3YVJaQVi7HBcbBy08Dkm
         mXKFWbsLw95+OSD1Yorxeg0JxDdD8o347xab6s3jkYWkjiTzb+pusKIR2he0qyvJJukq
         EzGPVVJP/UNUTzcnjbsurbUN3MS8ltPJa8f8gKxe/TQ9e8GUcMTI6KIxQr49umsUUv10
         1WZOSkVDbYL2LUbzHfFflAgwwHifpB2pRGtjADf+BcCGFrU7ZQRdOiHxOkTd7a8u2SuR
         AOQg==
X-Gm-Message-State: ACrzQf0Qz5VgrGmKlkcKz5MxrJwxhUgfOpyT+m4+3nV2hn1pzRHGyrWv
	H6BjXHWdi0445R4TS7TPb/QOrJqET1E=
X-Google-Smtp-Source: 
 AMsMyM5f4r3qXNNrNbzdgmJXLfzuajoNPgqED4HdtRzT08scb0KoVOAJmgMTsyj9LEynGYR4hTxtkw==
X-Received: by 2002:a02:cb95:0:b0:358:324e:79ea with SMTP id
 u21-20020a02cb95000000b00358324e79eamr3002982jap.301.1664487760280;
        Thu, 29 Sep 2022 14:42:40 -0700 (PDT)
Received: from nebuchadnezzar.home.arpa ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id
 x37-20020a0294a8000000b003583063a6cdsm204330jah.104.2022.09.29.14.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 14:42:39 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [meta-virtualization][PATCH 2/2] cloud-init: add Apache-2.0 as a
 LICENSE option
Date: Thu, 29 Sep 2022 15:42:24 -0600
Message-Id: <20220929214224.2054-2-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929214224.2054-1-danismostlikely@gmail.com>
References: <20220929214224.2054-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 29 Sep 2022 21:42:48 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7635

From: Dan McGregor <dan.mcgregor@usask.ca>

cloud-init has been dual licensed for a while.  According to the
LICENSE file this package is dual-licensed Apache 2 and GPL 3. This has
been the case since commit b2a9f3361 in 2016. This has applied to every
release since 17.1.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 recipes-extended/cloud-init/cloud-init_21.4.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/cloud-init/cloud-init_21.4.bb b/recipes-extended/cloud-init/cloud-init_21.4.bb
index 9c9b56f18e3..e5f5b79e52e 100644
--- a/recipes-extended/cloud-init/cloud-init_21.4.bb
+++ b/recipes-extended/cloud-init/cloud-init_21.4.bb
@@ -1,8 +1,11 @@
 DESCRIPTION = "Init scripts for use on cloud images"
 HOMEPAGE = "https://github.com/canonical/cloud-init"
 SECTION = "devel/python"
-LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c6dd79b6ec2130a3364f6fa9d6380408"
+LICENSE = "GPL-3.0-only | Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c6dd79b6ec2130a3364f6fa9d6380408 \
+    file://LICENSE-GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
+    file://LICENSE-Apache2.0;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+"
 
 SRCREV = "a97fd062f7dbd4b824fd006edd08927ef9dbf24a"
 SRC_URI = "git://github.com/canonical/cloud-init;branch=main;protocol=https \
-- 
2.37.3


