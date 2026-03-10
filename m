Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614BBFD2D9B
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 13:58:28 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40689.1773151107137387771
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Mar 2026 06:58:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bbH/Nmvo;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so5988048f8f.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Mar 2026 06:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773151105; x=1773755905; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jYBLy/oVfz4d1vQgIetiafPp53GbFutl+il6Gj/pi/s=;
        b=bbH/NmvodY7EFE0S+IJu9XsR9RF1FaSSnutA404LAbChXzsTaHSbDYJbhmTSuvYsAQ
         NiSr3ya9wptD0LPN055UD6Z7gD5tBjpnM0f/IzP3Et1AGlrDFJYW3zvb4c+RpuyFnwcc
         fviXGYUqo63z18ykCCnS+sivOWK9NISRsrBJoBYCmnKMFss/XSb8B86zKhLogbBDWGL2
         8qMi5eOCS/S4/63pLdUkoPhtqyZwg6qKWcclsgk4yyfiasaRjp1P3TiEI/06isYwHNBa
         IIKOLjXXppBWUAJ10kYnnX61rvJ5IfFXTE0GhJygh3lOpkg8Oj2TPK0sZwhthWpCPHUL
         z7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773151105; x=1773755905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYBLy/oVfz4d1vQgIetiafPp53GbFutl+il6Gj/pi/s=;
        b=kJJnEt17SfmNZzGCz7T+ujC+ENAkfEuL3y6zUp9zMDZZ38W1wTYVe7rmrw8lk3m+xp
         YRJZSO8OHr4P17FV8hSjbciZwUGslmREM6AhxRBMAQ7QWOkikjg79zIlEa0DJevON49D
         bT4sGw/gcWGcNQb5VzI2uC2TmqIX/eEP6UX1cHIUhCFzEEAC1vD0ix+CiVBZuIdQAf/2
         lUtS0lxVnOyqH/74VD37U2nCiFldtDtUdv2UfO10TIFYiU5hhRahL7azPD4D18dQR49O
         TWEoCDIieYSViv+mWB+r4deXbtOTNrHsQYIoTmNOlD9i6SfHanjlnyZYbNHsaPKkJnPp
         EXrw==
X-Gm-Message-State: AOJu0YwtSXbgDfeEZ6KBf5V1KgT+YCjBoMs0KK+/lNlDWd3QgfNIs7xB
	+M9e5J+R5zo4oNfbGpL/ebTWc4MFGdz4kmChGKTWuddGUVbHGncTUBYJnIou9Dq5
X-Gm-Gg: ATEYQzwWzCFnZqLHO6uhucWTvRhreadXXJTwL84/MPhyz8XqzY0ByvQzZWln0DsgJfG
	Qa24T6iY/ti8S7NYLO/RpF0zhlP+Nihe6OBa6gskNdfo+Ch5U/cvgsfOMZjOdAfU3jfTbKT3J0a
	McN2vZgsKO9Qham1oG4q9kda8cmn+0U5Pog4tezhu+R1ggFZZtUZmrnlhxS3DgVuAQkeKM6SZtL
	ZmwO2SmwBjNbVSwCiKLC4y84vcAMa4t9v+OVewD0hXGqtbtj/RdIaOhj7jeILMy7bb01CzOiNPN
	suPdFtxBwTsaXAp1DbVqmDvK/gErAznL10sWAS2XblMFbeCZq8ZIMpb99l/if7AoTfeOPMQ9Slk
	f82C3poj39vckuyJ0wG4/grhJWrhjwvndb03x95SO16XjU8+H6Dzy4uA+ETf2OvfUoz9X917hLs
	Q9jg7zeUM3DzxaU2tkc6Eq3LilOg==
X-Received: by 2002:a05:6000:2c0e:b0:439:d74d:a66d with SMTP id ffacd0b85a97d-439eff443d5mr6419780f8f.21.1773151105303;
        Tue, 10 Mar 2026 06:58:25 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm40414469f8f.30.2026.03.10.06.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:58:24 -0700 (PDT)
From: martin.jansa@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 1/2] cockpit-machines: move to dynamic layer for meta-webserver
Date: Tue, 10 Mar 2026 14:58:14 +0100
Message-ID: <20260310135815.3353144-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Mar 2026 13:58:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9633

From: Martin Jansa <martin.jansa@gmail.com>

it depends on cockpit recipe from there, fixes:
ERROR: Nothing PROVIDES 'cockpit' (but meta-virtualization/recipes-extended/cockpit-machines/cockpit-machines_346.bb DEPENDS on or otherwise requires it)
in bitbake world builds

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 conf/layer.conf                                                 | 2 ++
 .../recipes-extended}/cockpit-machines/cockpit-machines_346.bb  | 0
 2 files changed, 2 insertions(+)
 rename {recipes-extended => dynamic-layers/webserver/recipes-extended}/cockpit-machines/cockpit-machines_346.bb (100%)

diff --git a/conf/layer.conf b/conf/layer.conf
index 6eadc87f..a0f13f01 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -16,6 +16,8 @@ BBFILES_DYNAMIC += " \
     raspberrypi:${LAYERDIR}/dynamic-layers/raspberrypi/*/*/*.bbappend \
     xilinx:${LAYERDIR}/dynamic-layers/xilinx/*/*/*.bb \
     xilinx:${LAYERDIR}/dynamic-layers/xilinx/*/*/*.bbappend \
+    webserver:${LAYERDIR}/dynamic-layers/webserver/*/*/*.bb \
+    webserver:${LAYERDIR}/dynamic-layers/webserver/*/*/*.bbappend \
 "
 
 # This should only be incremented on significant changes that will
diff --git a/recipes-extended/cockpit-machines/cockpit-machines_346.bb b/dynamic-layers/webserver/recipes-extended/cockpit-machines/cockpit-machines_346.bb
similarity index 100%
rename from recipes-extended/cockpit-machines/cockpit-machines_346.bb
rename to dynamic-layers/webserver/recipes-extended/cockpit-machines/cockpit-machines_346.bb

