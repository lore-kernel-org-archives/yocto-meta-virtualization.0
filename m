Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 781B6C369DC
	for <webhook@archiver.kernel.org>; Sun,  4 May 2025 20:35:01 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.36307.1746390894046464165
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 04 May 2025 13:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c8i4E3ph;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43ede096d73so21887425e9.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 04 May 2025 13:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746390892; x=1746995692; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QN1vBRAdkr6i+IJkVvqrOeWGPKAsJjrNVgDtme15y0k=;
        b=c8i4E3phZn26iqIwQ2QKHgFO4XrmkZdZPT4cAaWtN8ALqrawB9PyVvauHzOMhv2sLw
         eV4TmkW4G8JCmr6FjI5Y7/JYeUZnDJX/gcafqAiPNBWdGO/u7AVL8uWoKrv2IVqHSJlx
         1ZrPvT6apteYY75AtnvqCLkoP9KCLs0PzCxo0ejpbFFClLJpPMmwGGUQFCJA3xDK9ohB
         KEPNhgkEPiAPSxbX7yHGRiIEXNkStYvWiOot+8Sp0QlplpUq2bzDNYv+sWM95wQ2pOrC
         mq1kYKxiKkv460D6TpaceF+sL/YQi79ileGP99uN4iNipRNFzuGWieO/cathFz2njNnD
         C/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746390892; x=1746995692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QN1vBRAdkr6i+IJkVvqrOeWGPKAsJjrNVgDtme15y0k=;
        b=lzqJKN8Q5jIPR3OoSW9kLD7KjGAyZwekd4P/aZDAJK3xC3qetqfkEQGEGd4/3P8Ovf
         51T4Dpbtk9siRnUCw2emzQLB606Ef/sZD9pyofVofSDxCmx842flmeMb41cryaLpvRUx
         p06H9UIkNtyYwpUXHeJbrd8arcKEVt+jjAEnLXJSRAPe1vLYTcbPIUrgZJyrgIn8EIa5
         KF8Rd79peFsrR3MkO/uB0veLxqliDQptilvPKxJUDzNFKehfM9uL8vDDlvgJOs1b/UDR
         WSU0nENtlSHjzahoK5nnoA4sJirImFwPIhIZuPXK4f8YA0+DCOdM4hqUethXw1IOJAdz
         lsMA==
X-Gm-Message-State: AOJu0YxwldzEci8OIY74aSmZftd5U4tALaYB9z3iGd/g4NCstZQADqNK
	8pOF0hagkPoddbApBCjndpe8+4fejI1TuQbAYn2GZJghu714c6fCpw0Lng==
X-Gm-Gg: ASbGncs2M5UJDxWPYeoXNd6R+3XXWM2T3pXM2DnqSD8FxwO9b7uxAzwyakP8Wm9fY7b
	mCaxXdg93YBTlGYex8cwLNkOL5/2Y/YKg184hGzoiZkk+2ciEL+eD8HjzwyC57sHhXvwq8gBE4f
	bk+gvuT2H5B2Jc3delcYiTYZM6TLGGtr2ScMqucXGRUJecouOx++OkzdQW7ZnmmbOouF2hme20x
	jhB5fl87lH0xMs+7hQW2R+xCY0/Bg6dbBmNNUWTOUiDJOPOc7DBS16gHaoMg3A0OzRt/E1HT/vp
	MT+d0/HytnbJcs5HKUr3Au2KISjZpo9w04e0+V3yMHo=
X-Google-Smtp-Source: AGHT+IEfj0iupadTQRSSx6Cmjf/woy8aE3YImBre0HcuDe5OnSPyZE8A5VdQjYB+0un0/XTUdd637w==
X-Received: by 2002:a05:600c:8708:b0:43d:36c:f24 with SMTP id 5b1f17b1804b1-441c48be14bmr39445885e9.13.1746390892224;
        Sun, 04 May 2025 13:34:52 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b89edfc2sm109647465e9.20.2025.05.04.13.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 13:34:51 -0700 (PDT)
From: martin.jansa@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] dev86: use gnu17 and ignore incompatible-pointer-types to allow building with gcc-15
Date: Sun,  4 May 2025 22:34:46 +0200
Message-ID: <20250504203447.1113879-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 04 May 2025 20:35:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9241

From: Martin Jansa <martin.jansa@gmail.com>

The repo from SRC_URI is no longer accessible add temporary
work around to allow building with gcc-15.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 recipes-extended/dev86/dev86_git.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/recipes-extended/dev86/dev86_git.bb b/recipes-extended/dev86/dev86_git.bb
index 6414ecfb..d43d1200 100644
--- a/recipes-extended/dev86/dev86_git.bb
+++ b/recipes-extended/dev86/dev86_git.bb
@@ -57,4 +57,11 @@ FILES:${PN} += "${libdir}/bcc"
 # unproto.c:188:51: error: implicit declaration of function 'strcmp' [-Wimplicit-function-declaration]
 CFLAGS += "-Wno-error=implicit-int -Wno-error=implicit-function-declaration"
 
+# http://errors.yoctoproject.org/Errors/Details/853302/
+CFLAGS += "-std=gnu17"
+
+# http://errors.yoctoproject.org/Errors/Details/853303/
+# ar.c:615:23: error: passing argument 1 of 'ctime' from incompatible pointer type [-Wincompatible-pointer-types]
+CFLAGS += "-Wno-error=incompatible-pointer-types"
+
 EXTRA_OEMAKE += "CFLAGS='${CFLAGS}'"

