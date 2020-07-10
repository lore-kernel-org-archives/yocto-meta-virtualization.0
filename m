Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web12.5829.1594366131519449375
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jul 2020 00:28:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=sdx/7tgh;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.215.173, mailfrom: ashishm@mvista.com)
Received: by mail-pg1-f173.google.com with SMTP id e8so2146572pgc.5
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Jul 2020 00:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=kKL+MYa/FjFmeplK67PBZs8J22lxq0D0Mt405bxO8n0=;
        b=sdx/7tghmyO0fpG/s9dUvgG30ObKdpLuU9yem7Xpj9ndsi+c+IwjaPXSW8pmbd+n0u
         d62FWXhC1iG8RCCz0JraZsVse+CrWb2/b5mGEy4vxGkPUke0++3jqaAm+CmY8YeVnWkM
         hUenhZ4PkDPnleU9nLmL2sdP8OGdcB7uWSwOJTmZ3as4XL/4nTryteoVw32lnkkDuVJE
         9RaATy1EeUQZ5p5VDPm4nPt5us+hzjvqdTycKDdAWBKBK2En9BZTfC7xkrKAe8ngziwU
         2FGl/2tCZabMjMo4V59u8sJwymgdQxHQqp/EhJd0pyLujo/OkRAg38gCf8UOVJEUmgkf
         3SBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=kKL+MYa/FjFmeplK67PBZs8J22lxq0D0Mt405bxO8n0=;
        b=QqESbTQIUInDxLqjR+ZOj7S2nJALR9Wz3nnVF/RTf8FTCPhqVzEMl7EOzeULH4mXQO
         2LfOw0ibs9vP95MOkmikHDhgd30PMVtojGxWTmJ4u3LWyubA6YAuDwc20FYRO3PWIl8T
         1D9EgHDL+aZ9GHB9sxjAZPaK3foxwUdTYbiysz35afFQYJNSlBUWw2uPUMYAJp5Fg5Ul
         zRmTbYbnk5U9YqPSDUtm3wBADPCXInyrNbMwt0idhOopbxNxQ3zoggnrQGlyzfdJo124
         xIhZ0cGg/zjUPXxPg43DP30U7Vtw8sYOXG5y4wqY+huLvdAhyUjGjI/30dBSHMlnb55a
         ywwg==
X-Gm-Message-State: AOAM5306sNpKlq8Pox8+fn2Krg5JGQQ5NwlrF0E3DGcEXZPEj972Inz6
	53Vpr5SGIzfwQKF1esWhsNbHMMFqiGA=
X-Google-Smtp-Source: ABdhPJzJbmRdRF35eBHE/ZP0M1QEZfLCEbvCxy8puO5pvuk1mW0cMgwh9yeuMvlJn7ZFqBVj708GFA==
X-Received: by 2002:a63:3ec4:: with SMTP id l187mr24779337pga.371.1594366130182;
        Fri, 10 Jul 2020 00:28:50 -0700 (PDT)
Return-Path: <ashishm@mvista.com>
Received: from localhost.localdomain ([106.193.251.32])
        by smtp.googlemail.com with ESMTPSA id hg13sm4490957pjb.21.2020.07.10.00.28.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Jul 2020 00:28:49 -0700 (PDT)
From: ashishm@mvista.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Ashish <ashishm@mvista.com>
Subject: [meta-virtualization][PATCH] Prevents two getty running on single serial console (hvc0)
Date: Fri, 10 Jul 2020 12:58:37 +0530
Message-Id: <1594366117-14557-1-git-send-email-ashishm@mvista.com>
X-Mailer: git-send-email 2.7.4

When xen is enabled on raspberrypi4-64 machine user had
two getty's running on the serial console device (hvc0)
This led to root credentials failure continuously for few time
followed by user getting the root prompt.
But user would be unable to operate on serial console as
he gets "Login timed out after 60 seconds" within few seconds
and the control goes back again asking login credentials.
---
 recipes-core/sysvinit/sysvinit-inittab_xen.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-core/sysvinit/sysvinit-inittab_xen.inc b/recipes-core/sysvinit/sysvinit-inittab_xen.inc
index de0af20..04fd8f9 100644
--- a/recipes-core/sysvinit/sysvinit-inittab_xen.inc
+++ b/recipes-core/sysvinit/sysvinit-inittab_xen.inc
@@ -1,4 +1,3 @@
 do_install_append() {
                 echo "" >> ${D}${sysconfdir}/inittab
-                echo "X0:12345:respawn:${base_sbindir}/getty-wrapper 115200 hvc0" >> ${D}${sysconfdir}/inittab
 }
-- 
2.7.4

