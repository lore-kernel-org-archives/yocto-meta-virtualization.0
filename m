Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web12.76823.1638282080703547383
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 30 Nov 2021 06:21:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qbgSOT+z;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id t5so87784329edd.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Nov 2021 06:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tKan1AqQ34N+rHOKUIcXRUKHXLZ1wQjExtRYY9+bYZc=;
        b=qbgSOT+z6R0JNbGwKPb8APqwOVDpSU0XrT8Symr5A6RgX9bu5GV162FcNJj7A5oKeh
         SW+Sm1Z4Q5OOJecVJbxflcWZ7xEzbQMhwuxnwWkOkzT9WfTPXxnYrEdWSa8sYtqsKg92
         isNY4vSb5jdtnukSFRzjHJZtv0eNYoIN0C0vtfO67hG+kc2NObwa9cgWAkbB2EhHnIsc
         3t9d9BWlo6iPSlSlbhs7TjiVvqMwQ8hI48gTNYMI0Ad9T22TlICOF7EkLrZZOPD0v1tM
         Z+yTJ46gR25073ViQKGWSiUhI830JhLCAnjvcjFeUPk3t9C9jDgw/o00fKEozuDmCh+M
         VtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tKan1AqQ34N+rHOKUIcXRUKHXLZ1wQjExtRYY9+bYZc=;
        b=LwNNTIGYb0ThoJqw7D/2dCrdreVarscxLlP6ArTJuOBYJo8/F/6fbMwILh2dAuXSKt
         SDw+0DMDK2Z7hjavvuJ73q+D5sR3rjZ7RJ7e7wSHKp8mgNhQ5wFFG7eXnReikbm4+vna
         MkxGjBLoXZX2k7ThkVLnRDwpBUGBZDq4xgJ1S3QkpoyAiVAkeFoh53bmOx7wQ5T5egjI
         GebNZCTDGOL048NEBCUXsfy5llWeojQlRKmjnO8s0Kd6325IfO1eK6awnnAZ2RYDweuD
         nwEZfs+yKblgptTsAaydObuSOi+bi/PEbiZc8vDZcI6iZYDe2WMVqpMmX27kQV6RJwdR
         oIAw==
X-Gm-Message-State: AOAM5321eL/CM6yiFlY8d/swQcM2zd8OYmVDJSJMC44xtjNY0Fkd3m7e
	u1sVJmOqvWIbSkIPMl3HoY5LMWM5iW0=
X-Google-Smtp-Source: ABdhPJzClfBpBzLdSYY43QpOOhR22KPXQ1dapfypaT41TsrfA7xhIsx9lhsI0shJXsXVA/3fNftEpA==
X-Received: by 2002:a17:906:5d15:: with SMTP id g21mr72685958ejt.162.1638282079109;
        Tue, 30 Nov 2021 06:21:19 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id kw10sm8980896ejc.71.2021.11.30.06.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 06:21:18 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH] xvisor: set PV
Date: Tue, 30 Nov 2021 15:21:16 +0100
Message-Id: <20211130142116.34259-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
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

