Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 156B0C43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 22:00:18 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.397.1655848816812497702
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Jun 2022 15:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fD0GnpHm;
 spf=pass (domain: mvista.com, ip: 209.85.214.178,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pl1-f178.google.com with SMTP id q18so2261938pld.13
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Jun 2022 15:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2ZsTS7/2xs2QNh7vvBPuFVCUGh5E/fouUSRSv/03jo0=;
        b=fD0GnpHmQIGLr9D4K1yhNw6IwOMDrJnqJW9arB9Yuh3wIA0vhuDv2hAP6fsejPjscz
         CwP6G12I0MieHmwGQYPBPrz+ygjVCUqUuVjXf15vDiUTp8RzaWrmKfm38/F5ZE8/FmDN
         RuKcsuLwOmQ4tNuSKPVOL/pTWdned78/7FcUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2ZsTS7/2xs2QNh7vvBPuFVCUGh5E/fouUSRSv/03jo0=;
        b=vcDhNPtd9ZV7SZqOSgaFaea4h6KUIK3bKRbGixzGc3PgXfiFqLoO94nUmHCYc4UJQZ
         BG7emmEBT0R9QH6GcIRFYNZDkZDr9Fcw1k1WS9qYSNQN9BKB7dVn9hn+xYdkwe12ICji
         iV+IDRXLSCVdcm77aK6IHL+XmRybgFP1kLuKu3TJnTEmkJCw9pUQ/bUppxvD2WoUGmLC
         iUvjdSFvFTp/b2j3tWq/KhP7tnITFdpCPtchqoA386nMMfWwz82wfvXTJElQ9qJb0Sdh
         IpxvEqx7skJE9wkWJYJ9q9hAfW9SANcLziRHc173+b9mLxlrD8S0z/F8eZpA18/vrX8a
         lUEQ==
X-Gm-Message-State: AJIora83Cq1WiqS6N4uVCYOfx/Dk+iv/QIHtXNoLSbPIK3FC5YwmdFWL
	zuLWuf57taWhAUZZh0SiQh5+x7PaUvsbBg==
X-Google-Smtp-Source: 
 AGRyM1vqXNatBeQSsvA02qw6XiH1N1U5dXwXFYHZBaLnF76aOkEBDQ9NYjJazjeCzCAPEReOoABU3Q==
X-Received: by 2002:a17:902:7248:b0:167:95e2:f83c with SMTP id
 c8-20020a170902724800b0016795e2f83cmr31106798pll.74.1655848816020;
        Tue, 21 Jun 2022 15:00:16 -0700 (PDT)
Received: from red (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 k23-20020a17090aaa1700b001ecb5602944sm3756000pjq.28.2022.06.21.15.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 15:00:15 -0700 (PDT)
Received: by red (sSMTP sendmail emulation); Tue, 21 Jun 2022 18:00:13 -0400
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [meta-virtualization][master|kirkstone][PATCH 1/2] cloud-init: add
 rdpends for netifaces and charset-normalizer
Date: Tue, 21 Jun 2022 18:00:10 -0400
Message-Id: <20220621220011.778623-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Jun 2022 22:00:18 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7393

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 recipes-extended/cloud-init/cloud-init_21.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-extended/cloud-init/cloud-init_21.4.bb b/recipes-extended/cloud-init/cloud-init_21.4.bb
index c6e64b3..9c2dae7 100644
--- a/recipes-extended/cloud-init/cloud-init_21.4.bb
+++ b/recipes-extended/cloud-init/cloud-init_21.4.bb
@@ -56,6 +56,8 @@ RDEPENDS:${PN} = "python3 \
                   python3-jsonschema \
                   python3-pyyaml \
                   python3-oauthlib \
+                  python3-netifaces \
+                  python3-charset-normalizer \
                   bash \
                  "
 
-- 
2.35.3


