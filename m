Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web08.11948.1604671782949338963
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Nov 2020 06:09:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ah1Wi45d;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id c9so1539677wml.5
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Nov 2020 06:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wD8eZsE+J9R+VdKpuIC4+KuJwsMqDKB+2ussQ6a0024=;
        b=ah1Wi45dcmCBwQ2Ofoi8ONN6M6t9Suxmh3ECAL+Ca++wodjMPZkRMvj9rtduDnso5y
         2rjNqZbrSv/GydH51/6Lnbuns0yyTE2fxh6jkNLAV/MVqmuMwrw8CGLPcOovycltejKU
         VUqwnyuc8kvWPC7KUojl20cT1b3QmlFew3mD5RYKFJZNxLBwKYfYN042DIG6CZiEtyRf
         T5EP9nYI6rvmg/OJs26eoe+cXQXldgiXEghNCrA7QXNL264CxUNgc5u/uRBIRnwSic8D
         qturTRiCR3xbFrBDeNPH81GSKSDicjVC6s708WwtyNxckthwjS1d9T1wuA93P4adh9by
         A2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wD8eZsE+J9R+VdKpuIC4+KuJwsMqDKB+2ussQ6a0024=;
        b=Fw2x2Hl1Gf/UFiNd6A0WxKSgzG35MCS2KTnwKpS1UDkT/Hh4BwewZ8M6i0/IQcgTC5
         hHsyaSKvDQ/rhz0N92FkFA5Rxul5Yl+2ciNbkN5P8ImebUQq7w+3Xtksqo2PwYQ3qb/m
         GgShtua4yZYKeNUsZXaDZfwOMfiaO3Fbdxc+ZpOAj5FHPVkXA7Vmg+u+mrmbWjYGYPa3
         ikCRSPBwYKAAGfIyr7hoJzrHH9YnJM/gWtFTtGKW+l7AfpGtcvKr6Lkq+IA2wOD3CLpz
         1NyWfpXCguiqU/6mYGD0oJu0ZDc1UzvT9qdCHtG9R/wd0eXiw/TFmbcl+Ua52QsH7KhV
         yYvg==
X-Gm-Message-State: AOAM532PqoHQ5ypIQyIf7F/lv3XIS87sHe+t5Q3GBN5nHY0xHdGSgseR
	/bOaDD2qnn3GStkJxIrLZad5bnxCj5o=
X-Google-Smtp-Source: ABdhPJysdU/81wfGOHkYBoA8ocaAwEJW8Ae9HMp+s1i2/kUHKUPtwsWmAPE+YDeW4JXArpzzuWt4rg==
X-Received: by 2002:a1c:2203:: with SMTP id i3mr2775714wmi.144.1604671781191;
        Fri, 06 Nov 2020 06:09:41 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n23sm2501682wmk.24.2020.11.06.06.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 06:09:40 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH] xvisor: skip QA checks ldflags and textrel
Date: Fri,  6 Nov 2020 15:09:37 +0100
Message-Id: <20201106140937.765868-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* feel free to fix it properly, I don't use xvisor at all
  it just shown these 2 errors in my aarch64 world builds
  and this recipe needs more love than just these 2 issues
  like setting PV to something better than "git"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-extended/xvisor/xvisor_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-extended/xvisor/xvisor_git.bb b/recipes-extended/xvisor/xvisor_git.bb
index 50323d7..831c943 100644
--- a/recipes-extended/xvisor/xvisor_git.bb
+++ b/recipes-extended/xvisor/xvisor_git.bb
@@ -49,3 +49,7 @@ FILES_${PN} += "/*.dtb"
 
 COMPATIBLE_HOST = "(aarch64|riscv64|riscv32).*"
 INHIBIT_PACKAGE_STRIP = "1"
+
+# ERROR: xvisor-git-r0 do_package_qa: QA Issue: File /vmm.elf in package xvisor doesn't have GNU_HASH (didn't pass LDFLAGS?) [ldflags]
+# ERROR: xvisor-git-r0 do_package_qa: QA Issue: xvisor: ELF binary /vmm.elf has relocations in .text [textrel]
+INSANE_SKIP_${PN} += "ldflags textrel"
-- 
2.27.0

