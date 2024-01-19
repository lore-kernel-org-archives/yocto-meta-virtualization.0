Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9BCC4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 18:02:55 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.413.1705687371521576654
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 19 Jan 2024 10:02:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xh1keMk6;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: christopher.w.clark.io@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d5db9eb0e7so7165415ad.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 19 Jan 2024 10:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705687370; x=1706292170; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=QkHjkTqfmnhX8jRZjH9Cca0v7Ykakt9gAgDQxA2WwZ4=;
        b=Xh1keMk6o1AVCzSTopHN63N/2zuTM2DFtrGzt6tVxQuyYK+aEx6Wnknt/AUh8TashG
         JfZJ8VjNu5EdIFQbv8EFzvP301Pz6da0+LPvLTbl4GcgXQsUqAr4fW5UgzlNeKRQupKZ
         NkE+w2lqo8QsXfq7iR3CWc5bvlSesqYdv9508vTyOR5z+iPOk8f38qY9aL9ZnlMCue9Z
         FT2kC9zERmIIJYlkzSjLvUlpHrVS8l32Fay2tymguD/2ZtX/El7Rp2+ga6L1IRpkcGXb
         8nwKMjWrh+CCO4LTX79+PuGqIKM/yThtzCHUXvh1blmJfQ0UB5tZGyIrBIHs63RIIeMs
         3upQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705687370; x=1706292170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkHjkTqfmnhX8jRZjH9Cca0v7Ykakt9gAgDQxA2WwZ4=;
        b=X8PZ47MAg+UbQ/4jqemVi9ObNkttw4ZFx7rtyUKMyK5cKWQszauA063eEcmGBPTjru
         t1hDkkVfS+KGhwUJWLBC2V6rU83RaA19AzlJQeRyOrk4FRSAOQ1wVnM+PfebCz6AwlZV
         wuSl06ai6/ITdqxkZQlw3eiriqQwCS/RdG87bD+s5i901vdGSE60gNLN6OuozVpN69kV
         8iFS3h4FF5fgbuB1idp2WiPtetm8FERw54xZZRLkN/xmhWRlCWgNNZFcg09C6WJ2RaIp
         WjpmO642oCNCLQDhlNae0fU0wWtxJ78agOlvBuB/+67nGIigpBqR/ClyGGbJSw5RWLUa
         USNQ==
X-Gm-Message-State: AOJu0YwkMSsxSDrkKPWsWXoH1TDygqrfrAB9BV1zD3zHg3FJzKL7span
	U7/bWSDT6TxrLwKEKqw+UVpAkg+IHLJys7DAmhrVK5LTd81O4a6JxjUWhx8D
X-Google-Smtp-Source: AGHT+IFLuJM9yunautlSEZduyUugnXqLNL0kM+h+HTD/eZS8h7l8x/Zao/h5wqB1vJB/2Wx4bftRAA==
X-Received: by 2002:a17:903:234a:b0:1d5:e757:104a with SMTP id c10-20020a170903234a00b001d5e757104amr282826plh.103.1705687370114;
        Fri, 19 Jan 2024 10:02:50 -0800 (PST)
Received: from localhost.localdomain ([70.103.208.83])
        by smtp.gmail.com with ESMTPSA id t18-20020a170902d21200b001d5f009a69fsm3301307ply.142.2024.01.19.10.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 10:02:49 -0800 (PST)
Sender: Christopher Clark <christopher.w.clark.io@gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com
Subject: [meta-virtualization][PATCH] rpi, xen, linux-yocto: enable linux-yocto 6.6 for RPi4
Date: Fri, 19 Jan 2024 10:02:41 -0800
Message-Id: <20240119180241.2785-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 19 Jan 2024 18:02:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8548

Add linux-yocto append for kernel 6.6 for use with Xen as the default
preference for Linux kernel on the Raspberry Pi 4.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto_6.6.bbappend           | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.6.bbappend

diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.6.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.6.bbappend
new file mode 100644
index 00000000..2e2f92b6
--- /dev/null
+++ b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_6.6.bbappend
@@ -0,0 +1,6 @@
+# Enable use of the linux-yocto kernel for the Raspberry Pi 4
+KBRANCH:raspberrypi4-64 ?= "v6.6/standard/bcm-2xxx-rpi"
+KMACHINE:raspberrypi4-64 ?= "bcm-2xxx-rpi4"
+COMPATIBLE_MACHINE:raspberrypi4-64 = "(raspberrypi4-64)"
+
+require linux-yocto_xen-rpi.inc
-- 
2.25.1


