Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
 by mx.groups.io with SMTP id smtpd.web11.7061.1587403064695249612
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Apr 2020 10:17:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YX9ewUxz;
 spf=pass (domain: gmail.com, ip: 209.85.210.65, mailfrom: jpuhlman@gmail.com)
Received: by mail-ot1-f65.google.com with SMTP id i27so8783944ota.7
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Apr 2020 10:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/S4N0HyORWY3PHejL9gPUpzkTRCY9hWIOE9vjfyd/ME=;
        b=YX9ewUxzqDy8r1oYHe6CqZ8Y4SlrYRlASB/zM/7myfPprpR9upOPoXnSRPXYy1wRem
         vQu7hmahktRetipueiarW47MPSBp/iZpyxAArSnyu1oFjgnHUOQnbymJ7CI9+acJZgO5
         f6ImVWangdjeGknIspLE2GXXhGZbNn/ryKeXlbJu30SFw3tsxfxSuLrjz+DjpJeb6yok
         ZwFE80FAmTu+dOYP1yruDaMdvVbXMq4GDK8Wft5zre3r5ZqJ6cMTGaBFGxO9PxdqlSw9
         Pv4m+zt+k9iRsF3hK977/RNUAr5WY1vrldsAo/2zBceun8H0A5JBhYrHZK7FvCQlFchC
         y4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=/S4N0HyORWY3PHejL9gPUpzkTRCY9hWIOE9vjfyd/ME=;
        b=IJ0WtPlg9JOhALXxM8D9gvrbyz5/m09GkdTA7q13sIg0RXUPez1b25bryalf1NtBCm
         wMdrmwTWAnn9/aSLiFBMZ1fjg0fSeAArll4BYsqpLTliFsvf1W0goMF+WMW1Gq0XRf4o
         K28WpDCiIlBGSDkVXkzrEg2muLM5dleMLNusCsNcx8Q26C1Sb94Zn1fJ5c7Xm7+LBzVT
         fOJQAIukpftV0OnbhaxwqJvH+r4f86lLUP9WBMVEkGxsVm/LgUsm9OlqFJmwCeTzbX2M
         D+6T4fRPOX1zyB3Xm5WBGh7NgIch3U0KvN4mhEWey4uM1figRu4+5ohCWi8YY3flKFP6
         oLKw==
X-Gm-Message-State: AGi0PuaWMAyOnibt3FCOd6MxF2PHgwj6TtNK0mzQrN5csq5y5A6hE1GG
	Cpch5CeU4plM58uv2o4ZMe+hMHP0
X-Google-Smtp-Source: APiQypJ/NdbcfSlGycTB3h/3YSum3GnsWWDdV+O59Gjbfjh7Drh18zxsgkwKjg5g7INMmxpgtLtRUA==
X-Received: by 2002:a9d:107:: with SMTP id 7mr11120911otu.48.1587403063678;
        Mon, 20 Apr 2020 10:17:43 -0700 (PDT)
Return-Path: <jpuhlman@gmail.com>
Received: from workhorse.localdomain (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id t11sm10494oov.1.2020.04.20.10.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 10:17:43 -0700 (PDT)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id AD4372A089C; Mon, 20 Apr 2020 10:17:40 -0700 (PDT)
From: "Jeremy Puhlman" <jpuhlman@mvista.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Corey Minyard <cminyard@mvista.com>,
	"Jeremy A . Puhlman" <jpuhlman@mvista.com>
Subject: [meta-virtualization][master,dunfell][PATCH] xen-hypervisor: Check for the right image in uncompressed deploy
Date: Mon, 20 Apr 2020 10:17:39 -0700
Message-Id: <20200420171739.12379-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Corey Minyard <cminyard@mvista.com>

The deploy for the uncompressed image was checking if a .gz file exists,
it should instead check for a straight xen file.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 recipes-extended/xen/xen-hypervisor.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen/xen-hypervisor.inc
index 21d9c7f..c386917 100644
--- a/recipes-extended/xen/xen-hypervisor.inc
+++ b/recipes-extended/xen/xen-hypervisor.inc
@@ -47,7 +47,7 @@ do_install() {
 do_deploy() {
     install -d ${DEPLOYDIR}
 
-    if [ -f ${B}/xen/xen.gz ]; then
+    if [ -f ${B}/xen/xen ]; then
         install -m 0644 ${B}/xen/xen ${DEPLOYDIR}/xen-${MACHINE}
     fi
 
-- 
2.20.1

