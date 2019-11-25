Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.1460.1574711771608604331
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 Nov 2019 11:56:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HRaIIaNV;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id d5so17378511ljl.4
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 Nov 2019 11:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=rSFE1IaRbSwRsouhuQJMrHHjryZGCWUB1DQ0L5yzbDM=;
        b=HRaIIaNVW1Dc9HAXH5EkZ3qKmBVg5jvcQCcya56Vsm79NQSQjwk0mW70T4KYibVAkO
         6DPpFyq1F0pA9VJOcg0DfuWN89Nby4LhDbKVe0fhHII0GifHll7TXpY9rKAh49Q2w/1T
         aGFPddMuBw7oI9C/+CWj0DkTTBUCbOOyLvgSf4cZ9WUmoTIhRTSuV6J9OsN7L0+ZZaL6
         SUEilP7ponDF+0tm1YzZ3RBF6Ye2Ogt/hRloppDJAnQ56oeZhsehRqab1gwvhnCzmjt9
         5LeHTWQGZaVtMoV8Qxdn9Hxph515mipiomhpo0vYKkqmdX4nZymPP5/Jp1VkWbmh0Rou
         z7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=rSFE1IaRbSwRsouhuQJMrHHjryZGCWUB1DQ0L5yzbDM=;
        b=M7+M4CnZgOiXsMVaN+3HQoyV3wrh/IrWrC/IB4Q1GXGktUkm/pYRzkw8Y9dC7k+bho
         gl7yDh8tKhbld0eU+JBlEpdXuS7aaeJkedEfbC/TskLrlw4NanZZEzQb26dBH31WhiZC
         GMUcqV3pvnnPLCgVkAHX66NU6gLlWlyE8eu+1KlMyH2uM3iaHMOypncb6kxh5lKNwwQF
         P5M9qZzIOMzwTN/0n4MGNLXxiqF/Pv4WpFxVEc42z50pUoHIClSaFBcZxz2weMn7Wvnn
         ubQK6k4TUjiUFOwjj4rdiHf4gQM4cVtaEZUh834KltPVgfqOZimcsx5LaAtNebf91X8W
         AggA==
X-Gm-Message-State: APjAAAWINjPqE0C/5IUxWh2MH2BMGE04xEmG2X2MaczfLoScAA/iWHtY
	44HnT0TaPQddhOZaZyzwzkP7ZRX8Alw=
X-Google-Smtp-Source: APXvYqx1QNJ52p7qtogNsc2+asX2bdL1fgXylSkyaP9PiJIMLXgRXy19gRUMogJA9n7l1I1LkxXeiA==
X-Received: by 2002:a2e:2a43:: with SMTP id q64mr24254566ljq.242.1574711769811;
        Mon, 25 Nov 2019 11:56:09 -0800 (PST)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.lan (c-75fd72d5.022-417-73746f13.bbcust.telenor.se. [213.114.253.117])
        by smtp.gmail.com with ESMTPSA id z17sm4489046ljz.30.2019.11.25.11.56.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 25 Nov 2019 11:56:09 -0800 (PST)
From: "Ming Liu" <liu.ming50@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: stefan.agner@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-virtualization][PATCH] xen-guest-image-minimal: do not inherit distro_features_check
Date: Mon, 25 Nov 2019 20:56:06 +0100
Message-Id: <1574711766-6295-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Ming Liu <liu.ming50@gmail.com>

Change to inherit features_check, since distro_features_check has been
deprecated in OE.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 recipes-extended/images/xen-guest-image-minimal.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/images/xen-guest-image-minimal.bb b/recipes-extended/images/xen-guest-image-minimal.bb
index d311eae..63c7510 100644
--- a/recipes-extended/images/xen-guest-image-minimal.bb
+++ b/recipes-extended/images/xen-guest-image-minimal.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "A Xen guest image."
 
-inherit core-image distro_features_check
+inherit core-image features_check
 
 IMAGE_INSTALL += " \
     packagegroup-core-boot \
-- 
2.7.4

