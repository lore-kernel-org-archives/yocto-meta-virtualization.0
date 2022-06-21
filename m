Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99DBAC43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 16:55:25 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web12.45917.1655830517912436011
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Jun 2022 09:55:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=I08yVUHa;
 spf=pass (domain: mvista.com, ip: 209.85.214.177,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pl1-f177.google.com with SMTP id m14so13058078plg.5
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Jun 2022 09:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y4+0PHjS1OiShXlYWMWJsyR1zSH9oAFwt+T/d6bx5Cw=;
        b=I08yVUHaPuBgfrtsGkzC8n1Yn8/486nScKDwJRrRsTcWy0Tu2dZIgOX1+yfRuKlEnY
         r1UluRllRW89DsiQaSkRXQ2grAPCL9isImv8M/rzr+RJGF9qtBPuwecwJg1k+ByFmAMj
         k9XRWnvJ1l07ZCpoy20Zahvi2TiblWw67mRjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y4+0PHjS1OiShXlYWMWJsyR1zSH9oAFwt+T/d6bx5Cw=;
        b=SZCZtT9zWdRKFiBqMesNOdeuCe7G7dPamGDCqjNiOwWgkrXSRuWrAFI4W6AlIuLcjD
         lxjkq2hj6oCArmeFVJBxBHPFw3AkWM8FTH/3XwnRgYjer+o2bYLhEQIs7qxh58KZRYSC
         pJW5YlvBZQMzKI6ASoFjXuVwLuV4ztnTNoKJjJs28DRIoEUDlloqIxWCw8oKgS6H0eHY
         VQ340tPwsdRVGueNi1Jlq1dziLTNWbekyG0ckyUl6f2D+xs/CG4jiZtyuzcCHB25rJeM
         ZvzftbGnUwtl3D1xAxZtdc5PTS/4BPv/K4bH73ticrpNHy60mXYOIhDXLePQA15LjIRb
         MsDg==
X-Gm-Message-State: AJIora+ogDx/g0hcXqKcleDJmF3pJRvC63lDiYpEE2PG1az2KIE6E0pQ
	nR+xSeaHfMY79+GqJ+im7H5vwAcobf2ziw==
X-Google-Smtp-Source: 
 AGRyM1uux0lL7PiYR6v7r9+8g32BIHLnA4H2lW6rdkWTgUs51fqKHd4sc+X3ZEB6zvCgqKxMkZKb6A==
X-Received: by 2002:a17:902:e5c4:b0:16a:33e4:417b with SMTP id
 u4-20020a170902e5c400b0016a33e4417bmr6010172plf.133.1655830516714;
        Tue, 21 Jun 2022 09:55:16 -0700 (PDT)
Received: from red (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 p3-20020a170902780300b00161ac982b9esm10858777pll.185.2022.06.21.09.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 09:55:16 -0700 (PDT)
Received: by red (sSMTP sendmail emulation); Tue, 21 Jun 2022 12:55:13 -0400
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [meta-virtualization][master|kirkstone][PATCH] cloud-init: add depend
 on udev in sysvinit case.
Date: Tue, 21 Jun 2022 12:55:10 -0400
Message-Id: <20220621165510.324992-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Jun 2022 16:55:25 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7392

Just as with systemd, the build needs the dev manager installed
as a dependancy

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 recipes-extended/cloud-init/cloud-init_21.4.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/cloud-init/cloud-init_21.4.bb b/recipes-extended/cloud-init/cloud-init_21.4.bb
index f549db9..c6e64b3 100644
--- a/recipes-extended/cloud-init/cloud-init_21.4.bb
+++ b/recipes-extended/cloud-init/cloud-init_21.4.bb
@@ -26,8 +26,9 @@ inherit setuptools3_legacy
 inherit update-rc.d
 inherit systemd
 
-# setup.py calls "pkg-config systemd --variable=systemdsystemunitdir" and needs to find our systemd
+# setup.py calls "pkg-config systemd --variable=systemdsystemunitdir" and needs to find our dev manager
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'udev', '', d)}"
 
 inherit python3native
 
-- 
2.35.3


