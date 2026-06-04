Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 462E9CD6E60
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 00:20:14 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.819.1780532409884680962
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 17:20:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hEkDVK11;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36d8b644473so84375a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 03 Jun 2026 17:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780532409; x=1781137209; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p2ySpjwkBGtrGOUBx0t7ny/3zS4gpFMqlOa0WdfLmPE=;
        b=hEkDVK115t+XEG9kr4dHfND8WRu+2LCJxllRvq+El0MnNl7zPl6q20iaLDtNDE/2qA
         MBWZpbagfm7eEUWzG7WSLojiK0xyH2+UwXaAsmGsf0bmGIpzw2lZ3etJrdr45nw0ZtPg
         AZTv7DjuCYkwH5Yer3ioBGc/8/kciJPKXzn9DQFpO1Rf2t2ddRynIZIbxDn+m2eYCGFU
         N/vlZwKnFSMGPMwIlx8ok1lll6fF5FOeTM+mCw8B4BXg42uyVEQxEaSp0bXAzh1cTkTU
         X8dTTihhLjnbOPzXudm6IFsSecqN7ket+qU/2yk1YzrLMeIA/vsFImWB0O771LypqCLg
         rCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780532409; x=1781137209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2ySpjwkBGtrGOUBx0t7ny/3zS4gpFMqlOa0WdfLmPE=;
        b=YzI2rdXWq9CnlOpvhmZmoIqKEhR9/qUglIzUfUFm4njciIGyE/ALbnUe8Nx5jo5DKI
         s8VPcOWXqQa93vvDdCcSOgu/+JIzvKSSZ4gqxWjDb5/MBhKts4/GRr9MuGcz4x+OCclK
         Mx9ZStgkuY1WP60TNA8aaneuqLHXv1NC+xp5Ij0leIDhVzYpLIJmynKKloviitwG1e7w
         Tkl2YPwmw59RpIKiIwIcJ3kqJFZnqH8p0DikbkNAANV6bXrmBkFTilFQK1xudaFitT8V
         NkDQw7onQ8c7FvWZ8KdY0ktVRG/sV/LG+UEfbySXIYgelA5iGOnNJIES+2Aakgo1BWa2
         wMMg==
X-Gm-Message-State: AOJu0YyN4yyzlxhDHIhAyuaSLoLaTpCCCOJP4vOM/P0vaJZEoCUhbOFt
	JIoAEPtULBPsKD3dps1YOyZ8dkNHgm+TIo5/jdN6XoGQDDEbFYWw5x+LUFI1Kg==
X-Gm-Gg: Acq92OHy03e/rpWZZZUlUlBMSaXMgtgKrY7+xo4bm/aO7bN9n/ZIo+i310bUNP+6s7F
	EkQliq9HOtwB+BUMFM29gfVjjPG89/kkyISHstVAm0QBVOigKxlXGAs0t6yH8iBE8j7Hbk6TbzS
	tb6mqeNOpXYvTiQ/tw1HbP0y9sRbCos29fxZ5nrjAdvCr1MFGDQlVX2luTWWznvuBu/VVV3diiG
	qRw7JJEsYHYHehyb5EUOpOjf1y/E5UqzQyXpDLKA6BkEXzKUBNS37buh0zQC/17Fua7IN/hd4YN
	E5DGvxap2RJsJw8yOEW2eTx5nUqz8wUWaw95OJp7ZcdhlZYmEVMCZDUpuH0nB791whkzfUbw53F
	XwjVXoANrOgDJ4tpmSzT5aXlbaFzkg/VOlOQe2RY+TcBxCxckfAAojrdCEZqDhPLEyaeKjh5NMM
	NPqKH6IVmZYC6ThC3NmUv7gm6iflTrsnTYcH8IY6zGj3nGg+jZMDl8khn59SNdptXhoAKA3CFMc
	5Tf6wsqYAV/oIABnZMx83q9kPaRdytepQ==
X-Received: by 2002:a17:902:d48d:b0:2bf:2015:5b93 with SMTP id d9443c01a7336-2c163a2311amr59562365ad.11.1780532409225;
        Wed, 03 Jun 2026 17:20:09 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629cfe2sm40000665ad.62.2026.06.03.17.20.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 03 Jun 2026 17:20:08 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-virtualization][PATCH] tests: add requirements.txt
Date: Wed,  3 Jun 2026 17:19:31 -0700
Message-ID: <20260604001931.96550-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Jun 2026 00:20:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9846

Add requirements.txt to allow versions to be pinned.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 tests/requirements.txt | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 tests/requirements.txt

diff --git a/tests/requirements.txt b/tests/requirements.txt
new file mode 100644
index 00000000..b0ac705f
--- /dev/null
+++ b/tests/requirements.txt
@@ -0,0 +1,3 @@
+pytest>=9.0.3,<10
+pytest-timeout>=2.4.0,<3
+pexpect>=4.9.0,<5 
-- 
2.54.0


