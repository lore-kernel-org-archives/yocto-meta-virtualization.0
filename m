Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B71C04FFE
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 19:00:29 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.5606.1715194819490146059
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 May 2024 12:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X5wHCz1l;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-34d7d04808bso34171f8f.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 08 May 2024 12:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1715194818; x=1715799618; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LK/0dpFtdSLINNcNQl3Jf8cHjpEMCn0/wg2YarRfUTk=;
        b=X5wHCz1l3eHXl0joKFoWSbNusGGr1kA3oSKB5kH9uKbcasVkO+MIIEHbSu2RaGZt8G
         VRQHJXtjGuQNuMxC+9C3XX05Je9FXuxEI0GSeDl0skeL+ks53crEO6Fa6vIrC2zhZeHE
         5EVWL1bjz8uV+v2b3++x5isZzb/K0hogdJRgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715194818; x=1715799618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LK/0dpFtdSLINNcNQl3Jf8cHjpEMCn0/wg2YarRfUTk=;
        b=wHRoaU2i6CzinbOTYMrJt9QGOwSqVamcKxh/NhhrnTLFtp0eO2bQP8mpcc2fIUfr9E
         CjHoEK0b3KrcOz+aUM+LmmWmuu60ISEEhNwYn73KFw7BbzlKU9IetxdFls3HRmTLlMm/
         Q3sDapMbPfys4TVe9L22bKapLllUpPAZ3tEOKHdhpghmPzmGgXXBWWbf62VBQjCpUk4z
         8GzyBzALcWbB7hzKR8K3QO+j3Yk2NpQC4INH87geOJ29YJs5gRrh30Ws8thcIXJpcdzy
         OqjrY6qMX3BYXnSYLsky+a/iNTyq7sph20NjguhrVdTpB28YYTEnIET1u387+/4XhljD
         Gxig==
X-Gm-Message-State: AOJu0YzXmn/jb0XxaYVm4rEggubrxiGEbupZ3TEspMO2AuzOj0tXoPR6
	IupgAzZoWr5qsrPmKfz5ZvacPirAaXiVy25si1hdZ0Xs9KIpOVmcMFIoYuBS2mqugj1RQf2xsSa
	uZew=
X-Google-Smtp-Source: AGHT+IHrOxPuYZNxE83mmIX+SOVtta7mjsB3ph3jjASb8xXCLMO51QSlooPMAZ6pVcOv/ZdVCKtSXA==
X-Received: by 2002:a5d:6507:0:b0:34d:9c8f:61a1 with SMTP id ffacd0b85a97d-34fcabefd83mr3032907f8f.60.1715194817521;
        Wed, 08 May 2024 12:00:17 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5b88:fab8:c8fc:9dd2])
        by smtp.gmail.com with ESMTPSA id w18-20020adfec52000000b0034dd8356028sm15915966wrn.26.2024.05.08.12.00.16
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 12:00:17 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization] [PATCH] sysvinit-inittab: Use UNPACKDIR instead of WORKDIR
Date: Wed,  8 May 2024 20:00:16 +0100
Message-Id: <20240508190016.3865000-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 08 May 2024 19:00:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8718

Now that UNPACKDIR has been introduced to OE-Core, use it in the
do_install fuction so that as/when things move around and UNPACKDIR
is no longer WORKDIR, it continues to work correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 recipes-core/sysvinit/sysvinit-inittab_virtualization.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/sysvinit/sysvinit-inittab_virtualization.inc b/recipes-core/sysvinit/sysvinit-inittab_virtualization.inc
index bf52da0e..5010dfd3 100644
--- a/recipes-core/sysvinit/sysvinit-inittab_virtualization.inc
+++ b/recipes-core/sysvinit/sysvinit-inittab_virtualization.inc
@@ -4,6 +4,6 @@ SRC_URI += "file://getty-wrapper"
 
 do_install:append() {
     install -d ${D}${base_sbindir}
-    install -m 0755 ${WORKDIR}/getty-wrapper ${D}${base_sbindir}/getty-wrapper
+    install -m 0755 ${UNPACKDIR}/getty-wrapper ${D}${base_sbindir}/getty-wrapper
 }
 FILES:${PN} += "${base_sbindir}/getty-wrapper"
-- 
2.40.1


