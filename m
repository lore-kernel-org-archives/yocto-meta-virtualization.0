Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6893BC53219
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 00:04:19 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20609.1785110653235517892
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 26 Jul 2026 17:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=lYhcIqTy;
 spf=pass (domain: konsulko.com, ip: 209.85.214.173, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cace91f112so22100965ad.0
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 26 Jul 2026 17:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785110653; x=1785715453; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BEa+lzw6B8pb8oyjQ+LzmKnRGM+Eziyr8u60QqUzKhA=;
        b=lYhcIqTykppvbDwTmMMki5zW2m8RwCP/lcHnzb1ZJxh/6Bf3KGAmaAUAbgwLVq0DKK
         RcpYn6tBiuIgEr9qgAPyQFf4RZtkVtmeFLm3IT7jzpGa+SeFiQSlFP7bSP5YRbXpCyvI
         u15KXhP0EL6sDT5WeoImNKUWlXlVzLcLt8jfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785110653; x=1785715453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BEa+lzw6B8pb8oyjQ+LzmKnRGM+Eziyr8u60QqUzKhA=;
        b=HugybbT4cUE5nKBUBm2R3Hg8+Sjh5Fu75X2hRW0o6a7AsoTC2m5VX/BdevdVgBwSoB
         Lp3tf97mTESs8cz8YxOMTiotQPBuU3S21/rf1/r54kQlj7KmvL9O+I6zxeGpIUE5UUA9
         tNCcJo1ta+obcNKhbGVOyLfRUYiGbUgQzSYeVB3lJzetRKB/it7F5BOVsxldxbgY+4bM
         oK9rTYu3rOfY3oOdrmI60VBqcZ3dVFSkZY9+0rortzCEiu0dVXe8liKc0Tm2Nylw98P1
         RzYEsDuUP3Re/zhRhRCEzH1U+CHsvryWcAAxZCgu+9Z1kWalJBU9qUizFdzaAkRt9lVl
         WNog==
X-Gm-Message-State: AOJu0YwmhN9ZH23wXlhNomLxTLXZ5+2gVUDvJsskOkOEJxAPsIWSFQaR
	Byc5S7UhmhkYWVr4I4i4ELTlf1ISC2p+nf/4ALFaNAv+epgB9LLhe8dZbIn8iboB/vV9xxiuE36
	nsIc+
X-Gm-Gg: AR+sD13CGnw7e00tTGy3PKoR2i8dfCwwhVX1Bk+6OSLV62G54WaKCmAg5OeAD3ktVXI
	KaJu8o3BApHDzJ5vZcNzanViGZR1/ppSSZuWdrSMBQQtXrr88nchhbolVrjmBdPo76k50R/HrLP
	iB7wl1km1T8skVKIef8Bonke3Cu1wCxzfzWMAH0qTB3q48N7fIvLKlC81u2vbFFpjE/uljegW9j
	tZ7ccqFaybaIgbudTW6zHm1LxedWdUGvvAQhZKWx3RLskz/kqBUZyeeFI3iss/ZcdhlMY2xneKm
	Sm8J6hbYCqkNr7EEQtzi16gkwCKOZ9/PCcPVntxpYUL/or+MIQBSX7ysDeFg+Sdr6La1kv+Loae
	uo8RKJhpF2Qb6zSRP5mdS+dCVkh7jlvMnd5952BRnlqi7ONfhX9X7h954vrZz9EWGjfh/qhal4w
	ZJ6NSxWNtUNz48yKACdfw=
X-Received: by 2002:a17:902:ebca:b0:2cc:741a:ff33 with SMTP id d9443c01a7336-2cfde8890f2mr59184215ad.43.1785110652711;
        Sun, 26 Jul 2026 17:04:12 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:4c93:d927:aa69:60a6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e2b44sm25048625ad.27.2026.07.26.17.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 17:04:12 -0700 (PDT)
From: tim.orling@konsulko.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-virtualization][RFC][PATCH 4/5] container-image-multiarch: add container-yocto-builder
Date: Sun, 26 Jul 2026 17:02:47 -0700
Message-ID: <20260727000247.1623785-9-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260727000247.1623785-3-tim.orling@konsulko.com>
References: <20260727000247.1623785-3-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Jul 2026 00:04:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9984

From: Tim Orling <tim.orling@konsulko.com>

Enable multiarch builds for x86-64 and aarch64.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 recipes-containers/images/container-image-multiarch.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/images/container-image-multiarch.bb b/recipes-containers/images/container-image-multiarch.bb
index 13c4ae24..16d79410 100644
--- a/recipes-containers/images/container-image-multiarch.bb
+++ b/recipes-containers/images/container-image-multiarch.bb
@@ -16,6 +16,7 @@ CONTAINER_IMAGES ?= "\
     app-container-nginx \
     app-container-python \
     app-container-valkey \
+    container-yocto-builder \
 "
 
 inherit oci-multiarch
-- 
2.47.3


