Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 042F0C433F5
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 21:42:39 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web08.16456.1664487758051064871
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 14:42:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YdkKUChR;
 spf=pass (domain: gmail.com, ip: 209.85.166.173,
 mailfrom: danismostlikely@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id a17so879551ilq.1
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 14:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=BQ9fJ1vWD4FFbiNimUC5dUanQk3kuEFSt2N4qrsUMT8=;
        b=YdkKUChRUO6fv5YJhkQecnT49vhX6PWUNGQhtOJPzFLEw6zzFEByF9Tjhc2rx7vdPa
         YhaCoU10Loi3fRuvN0ZKMLBhSb6UBP4xTXDpta5ahxdIyU+k2u53pGNu4hXFoc++kDqI
         vhgzgwFv6q6Pi/wGMi05Ko6KBAfaaMHeKxfpK+BeLRlf4Ccam+k1C9b3cj9N7j+6CwGN
         ZuV0hPWQVGnXgza01vCUy4zJ3QxWPn5BdZnf9ent+ezalivIpcofblG/8nQAV44BU3sR
         q5zLKFt38CRE+3XEp/nB23vfEP+hIKwWyYsjj/4RZcwFd62Mq8sYtBpdWyiGIH4i+k+n
         3Fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=BQ9fJ1vWD4FFbiNimUC5dUanQk3kuEFSt2N4qrsUMT8=;
        b=4/oz/WO5PG32LsQeOLWNSNgA50q53b+hYnk5/2kF8231HXJK8Z9vQDxqEAGXKvBT+z
         1Ko1FmJw6axqSEF5RXEPhIaNrTlQ7YfLjaV9wTD/Ec/kXUjwdp/Q6I9JA8HP1E3dfVEc
         Fs38ZKQYEdGE04oVALCOAMoAw2e1j5H0qzveuioRZ8yG1y3ggLcR8GI9cbGVAQzGXgh/
         itMxJQ9bRptHm/MIfOaqFjh3hya5UhOfMtcrb6t5AmSwra8SaSkBnah8GLEF+RMjkcQi
         DYh7udPZ4BX2A70498HSBm72nnikluBuRNJqsVjPRVuL5hEBU7I2UFhXuGDk//EBHWUk
         oN/Q==
X-Gm-Message-State: ACrzQf25BgXunKxZ7eY3QoDhhglJFbRVWtiY5qO1IX48fO8DGOIEUMsU
	CZYd8QRUXaW5loa4pkCqxT3FUroReoU=
X-Google-Smtp-Source: 
 AMsMyM4aPpu93KTUs7Yq+cTKCUd7hunYE05NFVo7v3CaHiWgQPC+o2YU+7/CCt5A6Z8biGs054LNsg==
X-Received: by 2002:a05:6e02:1aa5:b0:2f8:739:c48 with SMTP id
 l5-20020a056e021aa500b002f807390c48mr2758205ilv.72.1664487757206;
        Thu, 29 Sep 2022 14:42:37 -0700 (PDT)
Received: from nebuchadnezzar.home.arpa ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id
 x37-20020a0294a8000000b003583063a6cdsm204330jah.104.2022.09.29.14.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 14:42:36 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [meta-virtualization][PATCH 1/2] cloud-init: package nonarch_libdir
Date: Thu, 29 Sep 2022 15:42:23 -0600
Message-Id: <20220929214224.2054-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 29 Sep 2022 21:42:39 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7634

From: Dan McGregor <dan.mcgregor@usask.ca>

cloud-init installs its data in nonarch_libdir, not libdir, so package
that. On non-multilib builds this wouldn't be noticed.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 recipes-extended/cloud-init/cloud-init_21.4.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/cloud-init/cloud-init_21.4.bb b/recipes-extended/cloud-init/cloud-init_21.4.bb
index 5cb62272c23..9c9b56f18e3 100644
--- a/recipes-extended/cloud-init/cloud-init_21.4.bb
+++ b/recipes-extended/cloud-init/cloud-init_21.4.bb
@@ -40,7 +40,8 @@ inherit python3native
 PACKAGES += "${PN}-systemd"
 
 FILES:${PN} += "${sysconfdir}/* \
-                ${datadir}/*"
+                ${datadir}/* \
+                ${nonarch_libdir}/${BPN}/*"
 
 FILES:${PN}-systemd += "${systemd_unitdir}/*"
 RDEPENDS:${PN}-systemd += " ${PN}"
-- 
2.37.3


