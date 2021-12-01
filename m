Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.94809.1638376847622284330
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 08:40:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MbmRdjBd;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 77-20020a1c0450000000b0033123de3425so239245wme.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Dec 2021 08:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tKan1AqQ34N+rHOKUIcXRUKHXLZ1wQjExtRYY9+bYZc=;
        b=MbmRdjBdEN6qq+Gfc0/xiA31RsNcEqSY7V71KyinJ1Q8C32RkRwKBr3ouP52RXbqLq
         vj2wjR06lYdO34yn2fVzBUr7tHi9yj45N0nz3FeZKgThBsprlC3FALzeM997Y6RkLWlP
         SGTADFDP5spoz0xSoIUc/u8DdzQ0BZbggj8Y80QXOW3S6H1m0NYciQh3aSLc7RsV6TeF
         BinsO8psayXPwY5mwKLVKr/yuPkwy3QNfne5h1Bf7/Gf/H+w/+cJ7OPUq1QnBF9bn++P
         4xtfqOgAQ9V0O+aIXT9u5lv4IAFKPaNCeWJ/BT4z9pj9gXD34CE7QtRvcozWzIWKypQQ
         ELhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tKan1AqQ34N+rHOKUIcXRUKHXLZ1wQjExtRYY9+bYZc=;
        b=gKsbBIvlo1DwiRS8CX2V3Msx96IJxgtaHaSc6yObr/e2UHP+dcfayqSDshirJMYM7X
         SEckiAc1faoglXtJl1EIO3s5YVhNrKXvJNVtJCpUlRnSiV5novQy5k/wdG+CRBjaLucG
         lXK1o8igx3JG1N4hezUyS70zexU2GdRVlYvuNynVadQCcqAl2vHSTgDK9j26ZGESDJei
         eu6Nu6S+VkazHHI+Fn4muFqJhIK8Doh837htlgzcKF5gbSA5FsQ+xTE5FITlKwbsrm3k
         r3sir6KBSkpPiB5LRRsGLejl1EOwgVk9UXQjf1c3RMLva9E6j4QHcYRR//NcjjKg3nz+
         EeTg==
X-Gm-Message-State: AOAM533kovdHOsvF1A0DN8IRv4YcIP5Z5qLtei+qxKsuxGWqXOW296Kw
	ulT2AwOz9FuBqZ9lBZxHUbjmDqFYK2c=
X-Google-Smtp-Source: ABdhPJx7HzgKEb10Mu4lcGZwi7GPr8sxp4KQz88aqsiApzM1zZaZeemD03evmqc2ghhDQc2ONV3feQ==
X-Received: by 2002:a1c:43c2:: with SMTP id q185mr8258716wma.30.1638376846252;
        Wed, 01 Dec 2021 08:40:46 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n13sm282440wrt.44.2021.12.01.08.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 08:40:45 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][honister][PATCH 5/5] xvisor: set PV
Date: Wed,  1 Dec 2021 17:40:34 +0100
Message-Id: <20211201164034.33610-5-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211201164034.33610-1-Martin.Jansa@gmail.com>
References: <20211201164034.33610-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* use something more reasonable than default 'git' from filename
* there wasn't a new tag for a long time, so this is quite far
  from 0.3.0 as git describe shows:
  v0.3.0-231-g6b23764a
  but 0.3.0 is still the closest release I've found
  and matches PROJECT_VERSION in Makefile:
  https://github.com/avpatel/xvisor-next/blob/6b23764a1439f9d08b2ed2f363da522460d8a22b/Makefile#L29

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-extended/xvisor/xvisor_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-extended/xvisor/xvisor_git.bb b/recipes-extended/xvisor/xvisor_git.bb
index 4d2a719..26b4e0f 100644
--- a/recipes-extended/xvisor/xvisor_git.bb
+++ b/recipes-extended/xvisor/xvisor_git.bb
@@ -8,6 +8,8 @@ require xvisor-configs.inc
 
 inherit autotools-brokensep
 
+PV = "0.3.0+git${SRCPV}"
+
 # This version support the RISC-V v0.5.0 Hypervisor extensions
 SRCREV = "6b23764a1439f9d08b2ed2f363da522460d8a22b"
 SRC_URI = "git://github.com/avpatel/xvisor-next.git;branch=master;protocol=https \
-- 
2.32.0

