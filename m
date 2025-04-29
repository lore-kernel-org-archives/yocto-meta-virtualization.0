Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB26C3ABA9
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 10:07:56 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.15897.1745921266519842565
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 29 Apr 2025 03:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d02Yf6Lz;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso39092065e9.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Apr 2025 03:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745921265; x=1746526065; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68TjAjZ6zhpolrGf8EWuldy5CduRsfQrFPOqUpdehMU=;
        b=d02Yf6LzsM9m4pbDjT5s7MzbogV+rru6PXQrexSJtPYlZL5G+94OFrnpujMMSf77DY
         CkBm4rm2n2dqC2IbiMXZjeQYx6ApYYzac5K5shGcH9WWH6RMHWD0q7DbANUEU1/waXRK
         gZjn1Xe0kZVpszQg4DaY71larav1QNyU9rwqycVOrjJYKrzGZE50SGpYiArrQPupTiGw
         4ayOe7qMsa3MIeJzcMNCxmZV4SbAJNpdn2K0TJYAiDO6mpSn3Sx95akJPZzk+cURnlfN
         EN4BCIs+wRwn731KPbHVhEyQz0KsBkLVYn18qijsuVXLqkPCwAz27Qu1wKwnn2nvPTmj
         0tqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745921265; x=1746526065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=68TjAjZ6zhpolrGf8EWuldy5CduRsfQrFPOqUpdehMU=;
        b=WiX3QlaWkNk23uRudKIItGkSOCd/hYwJbJQOOTla30aT4Zj7ZXoNHFe8Ll6ayLJYdx
         C4tBxGGwqkU/XtTI9uLkItw4n6v+b4jZnEmxXEi2D5NMCoeoGdS0Go0R/yKLuRWIQCad
         pSYzUVeh9x1Rr0NwSEQmOL11Nx6bDNlKylikHw1wqs+UZbtJfgH6aBNoCscimcWmi7J8
         dYRqDOqmrUY3BXP22HMXsfUafhl/Qiz9ugnjX33jPrJXg/8JxZulHtJ/fc920KaeTfx3
         rfktqWbntNOm/cpRzDNzabE1woET5OUHPmOZhXSns98PRC4y0kM/R7HaYS+o2AtW+Ujp
         pJvA==
X-Gm-Message-State: AOJu0YxKjswWKsh3eJeSPuHB/Qtd3tOTO1MlF6SkjMJli/uDmVr6pJkR
	FbybZF9FaiNMm/03xkOmjL2leLjqcpnnx7gAoo9920Jlenk1Bj3t+uLvheX6
X-Gm-Gg: ASbGnctSUZ7jWSaZvUqk+t11Ce9zDMzKBGtLv223YKW+lILt6Ik0xklQj72A+/w25ej
	AioY758JpsbU6yoRr0YKQoEHbl1WqGzql9If0JGZIrXs+EmvPY32Gw13BEQoHapaxEQ/AXBk1V/
	QcTrHEFjDtMRyorlyfkr10/b7UMRE8wt1cIfkroYPw9UN+p5+mQ60M2/hZmykGMiHTVTohOpzO6
	jLClq2yjobUlhKXXNk1EYoauVfSBC/Lms4om05c63/oVzsx57xrD+fMseEshSKxA6wfhEiVWAyr
	MBte+JCVrLZAuPRULL8tSnNfYT1qJ/OGNRZHBqFZ1Zw=
X-Google-Smtp-Source: AGHT+IEfYJ4WhUR0oXQLSCde+LD15Pa6OFrjSFG1PX6pb1WtYWnBXbB5at0a5RUWcxYtQP4jEjuAQQ==
X-Received: by 2002:a05:600c:4f8f:b0:43d:7588:667b with SMTP id 5b1f17b1804b1-440ab7b5f6emr116973035e9.10.1745921264861;
        Tue, 29 Apr 2025 03:07:44 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441af8af6e5sm5522965e9.11.2025.04.29.03.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 03:07:44 -0700 (PDT)
From: martin.jansa@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 3/3] libvmi: ignore incompatible-pointer-types
Date: Tue, 29 Apr 2025 12:07:34 +0200
Message-ID: <20250429100734.1440305-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429100734.1440305-1-martin.jansa@gmail.com>
References: <20250429100734.1440305-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Apr 2025 10:07:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9239

From: Martin Jansa <martin.jansa@gmail.com>

* temporary work around to unblock gcc-15 upgrade in oe-core

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 recipes-extended/libvmi/libvmi_git.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/recipes-extended/libvmi/libvmi_git.bb b/recipes-extended/libvmi/libvmi_git.bb
index 353cdf91..cd2eba7f 100644
--- a/recipes-extended/libvmi/libvmi_git.bb
+++ b/recipes-extended/libvmi/libvmi_git.bb
@@ -41,3 +41,20 @@ do_install:append () {
 
 # Construction of grammar.h is not parallel safe.
 PARALLEL_MAKE = "-j1"
+
+# http://errors.yoctoproject.org/Errors/Details/853259/
+# tools/vmifs/vmifs.c:129:18: error: initialization of 'void (*)(void *)' from incompatible pointer type 'void (*)(void)' [-Wincompatible-pointer-types]
+# examples/process-list.c:120:64: error: passing argument 3 of 'vmi_get_offset' from incompatible pointer type [-Wincompatible-pointer-types]
+# examples/process-list.c:122:63: error: passing argument 3 of 'vmi_get_offset' from incompatible pointer type [-Wincompatible-pointer-types]
+# examples/process-list.c:124:62: error: passing argument 3 of 'vmi_get_offset' from incompatible pointer type [-Wincompatible-pointer-types]
+# examples/process-list.c:127:62: error: passing argument 3 of 'vmi_get_offset' from incompatible pointer type [-Wincompatible-pointer-types]
+# examples/process-list.c:129:62: error: passing argument 3 of 'vmi_get_offset' from incompatible pointer type [-Wincompatible-pointer-types]
+# examples/process-list.c:131:60: error: passing argument 3 of 'vmi_get_offset' from incompatible pointer type [-Wincompatible-pointer-types]
+# examples/process-list.c:135:65: error: passing argument 3 of 'vmi_get_offset' from incompatible pointer type [-Wincompatible-pointer-types]
+# examples/process-list.c:137:64: error: passing argument 3 of 'vmi_get_offset' from incompatible pointer type [-Wincompatible-pointer-types]
+# examples/process-list.c:141:60: error: passing argument 3 of 'vmi_get_offset' from incompatible pointer type [-Wincompatible-pointer-types]
+# examples/process-list.c:143:59: error: passing argument 3 of 'vmi_get_offset' from incompatible pointer type [-Wincompatible-pointer-types]
+# examples/dump-memory.c:185:20: error: passing argument 2 of 'signal' from incompatible pointer type [-Wincompatible-pointer-types]
+# examples/win-offsets.c:287:20: error: passing argument 2 of 'signal' from incompatible pointer type [-Wincompatible-pointer-types]
+# examples/dmesg.c:146:80: error: passing argument 4 of 'vmi_get_struct_size_from_json' from incompatible pointer type [-Wincompatible-pointer-types]
+CFLAGS += "-Wno-error=incompatible-pointer-types"

