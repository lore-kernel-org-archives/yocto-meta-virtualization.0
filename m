Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16FFBC83F12
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 13:13:14 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.18403.1751980386768160313
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 08 Jul 2025 06:13:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fdHVYPsg;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ade5a0442dfso716821966b.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Jul 2025 06:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751980385; x=1752585185; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zjglsshWf0MtY/HSH/NcKCD1DtIP8PmoFbN2nf/nqqc=;
        b=fdHVYPsgUS9YorvCAfIsElK85ON4erz2KpesFnvHzcqMdazP4zxtldiFtz1LKst7ZY
         kUKJbgtGxVPaOTtUmCcmJm6BDjCJZ2Qk5kinKWSwsrUExdsI5nUHDHLZwatl2s4NGA6t
         siWlGBTejRXY7JezULZQLY0xoCNNY78CcGEZmlqLFSTewpv3HkMW39+ZT/fSTjBjVji9
         UIhCgVTmOtd8VTiypqJ0SMViJUXJawEmr6x+cxRXgxHeVVks7D+h4QbUh9NcAw9YSFYf
         KI3yRjIKJ545aH2krAbxdpXyb0+La4TprkCoEIIC6D8PLFheNxYVvS9twrYCpvWK3zo/
         uX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751980385; x=1752585185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zjglsshWf0MtY/HSH/NcKCD1DtIP8PmoFbN2nf/nqqc=;
        b=dYqiMt07eK+OPcFzDfUJFENwyK9B9xG4b4oJkR01PEzjVfncF9W5+t4g95kohA/pXN
         ZPOKU3eqTr0XscKUjh++ErmgB6Q6TCw+GrmsObZ9KOeqzg5HS/v/fnthHHC5EeXiNQUr
         SXVudD+T70Gq7mBhCRkweXbHH7CnEiJeaBt+IwudpSnvXmYT3rGJqcx/S4/D8zr5pfiU
         mVbT2Xam+juKuiCTziy1HtpgskWYAFmy9IQp360WU3d7dFCN7HH+3EvU3719qHk9UU44
         wgrmmA3s1oRiK5IfbXMBIxGvz4MPeXqvvSoimilJroCzAHrg+HIBHzJz8uTcFmZcBMJj
         T7Vw==
X-Gm-Message-State: AOJu0Yzl/70wPfQ0pS1/s4iLG7LBE9+/ob+FZoVFPbwRqgAqRYXwMp5s
	iXRU4dNdGWtsoQuW2dSeMNe9idvUeS0Hh7IkU2S201uvCb5NtPFbsPwFh4lltg==
X-Gm-Gg: ASbGncu1FgtdCn4jbS165nmYytiDhz2WXtpJPGaDr/4dfdDwBjApHrAX41Vei95qej4
	xKDuvu7JkxXu5fG+FOizJea/xeK6Fqe+R1wW7eG5sPJ7NmnddnkSmrtD9zGpD5TYWeFko766EIe
	k/DzTGgeVgwUkxrqGqoaPcMdHAY+PA8gmPDjXifXosUqsGUP3EwLeVee3IGM1g9ucJluBEzYSzn
	iQohsyU+sZ1m9ed0UVYNA31mJMZ0SJZxCtvrm6wAUxJZ8u6o+HQsjOLc1FNDKAhZQBs5h8mJxmH
	9OYT0L1Gu11I2N4mkiFPMNpFu4OrsLzSL+Lyk8zNzM6kpQ6l8PCzHOPOdwTgFVpWyHUpR1Bitvg
	=
X-Google-Smtp-Source: AGHT+IFXXee8gaCk2/UtmXCLuLi5vYogib6iEPo6i1qCdFOv8VLrEdhtTrN4b2GRb3b4A7tya3znMA==
X-Received: by 2002:a17:907:9816:b0:ae3:b654:165b with SMTP id a640c23a62f3a-ae6b0b7f673mr334675066b.24.1751980384841;
        Tue, 08 Jul 2025 06:13:04 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae3f6b5e7f6sm897430866b.143.2025.07.08.06.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 06:13:04 -0700 (PDT)
From: martin.jansa@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-virtualization][PATCH] xvisor: upgrade to 3.0.2
Date: Tue,  8 Jul 2025 15:13:02 +0200
Message-ID: <20250708131302.3871609-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Jul 2025 13:13:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9301

From: Martin Jansa <martin.jansa@gmail.com>

* the old SRCREV 6b23764a1439f9d08b2ed2f363da522460d8a22b doesn't exist in any branch
  upgrade to latest 3.0.2 release from Jan 1st 2023

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 recipes-extended/xvisor/{xvisor_git.bb => xvisor_0.3.2.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename recipes-extended/xvisor/{xvisor_git.bb => xvisor_0.3.2.bb} (92%)

diff --git a/recipes-extended/xvisor/xvisor_git.bb b/recipes-extended/xvisor/xvisor_0.3.2.bb
similarity index 92%
rename from recipes-extended/xvisor/xvisor_git.bb
rename to recipes-extended/xvisor/xvisor_0.3.2.bb
index 1d6e79f9..e33a9533 100644
--- a/recipes-extended/xvisor/xvisor_git.bb
+++ b/recipes-extended/xvisor/xvisor_0.3.2.bb
@@ -8,11 +8,9 @@ require xvisor-configs.inc
 
 inherit autotools-brokensep
 
-PV = "0.3.0+git"
-
 # This version support the RISC-V v0.5.0 Hypervisor extensions
-SRCREV = "6b23764a1439f9d08b2ed2f363da522460d8a22b"
-SRC_URI = "git://github.com/avpatel/xvisor-next.git;branch=master;protocol=https \
+SRCREV = "0ff131498a26bd1c97a867ef3ccfbc23873209f1"
+SRC_URI = "git://github.com/xvisor/xvisor.git;branch=master;protocol=https \
     file://0001-TESTS-Don-t-specify-mabi-or-march-for-RISC-V.patch \
     file://0001-build-use-usr-bin-env-for-python-scripts.patch \
 "

