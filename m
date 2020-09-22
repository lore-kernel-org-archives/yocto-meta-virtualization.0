Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.93.1600803952860418149
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Sep 2020 12:45:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tEJ3J7cd;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id d20so20403769qka.5
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Sep 2020 12:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Tf+oiwyoojsP+b8Us5mk0L7mfwLyyCDUrqgFwa2ikE8=;
        b=tEJ3J7cdpwUtFRILpByBjithEmQK9iGUfi2ZPXkCMAbUHEpyEnVGE+D8F2XT/EKtP3
         l+U3Te+wR9WtQqOgXge5/IdhAqXLv0cvtzPkGya15l9Ww4hqt7JkTWOECqcbZY3CZJwA
         sRMTn+HG4vgSz2pUtKrPUuHCWig31KQtvWUWjViX1h41y8HhUiCsnwTQYcRsAzz1AxS1
         SADuLIz4iWkWzAlcZfOImELdyQzz2SVCTIWctmsOfkYGueo0X2NTXy51ALmgdLnJieQH
         k9nLBwTBAMy10DXAGYpo7FwzGh48cc2HD6+XTln3e/3UNWneR51p4wRYc/z1ecv1vFK+
         jQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tf+oiwyoojsP+b8Us5mk0L7mfwLyyCDUrqgFwa2ikE8=;
        b=rqMA4eZ0xeW0UhFpqmRr8BqtzJkSsvnJajHiv5vKv9NFmKfC5M9Ow5GAmcaDpilK8y
         DA9R1mfxvkjKmIb9fL6yx44UoZaI1265ul2+zCod+d40HhjPQ1SbTC+2pyKFvF6cpcuu
         95SE3LAHm2BaZkl0eThh5YoaLJihWiK+2m50ZddyXHP6ZCbcQQI3aPOWwWB8oYVTrP+o
         uNP+6fS9mPEhXCXs+HdQU1nuiJz/IFLGz3/l7UM72P1qEdfANQe2GtQ04Iu8gH9hdLKk
         p+QlF5f9ANoIi9ZNIgPl+5tVRfCyY8ae7uGd/3YnHhVka5zEy4pdXnuwy0jVoR+qOh9j
         UKQA==
X-Gm-Message-State: AOAM532LuuY9/mu4+hznRQcO9beIPE0mu1mUZ8TGt0V/yhIHTZ772qLK
	IPpOpdGBOg3io4bkrIq5VU7QZTNwGk3IUW8b
X-Google-Smtp-Source: ABdhPJzKYcjBOm04WISSdDVtW47IGxE9kw6iqMRHkbNu8f+nuMMgWb/+NBOpeySl2YVFv62Tc8McQg==
X-Received: by 2002:ae9:f306:: with SMTP id p6mr6608745qkg.104.1600803951658;
        Tue, 22 Sep 2020 12:45:51 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id t43sm13538513qtc.54.2020.09.22.12.45.50
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 12:45:51 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH 6/7] conf: enable xilinx dynamic layer
Date: Tue, 22 Sep 2020 15:45:38 -0400
Message-Id: <20200922194539.51933-6-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200922194539.51933-1-bruce.ashfield@gmail.com>
References: <20200922194539.51933-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@xilinx.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@xilinx.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 conf/layer.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/conf/layer.conf b/conf/layer.conf
index 1ec7a15..16d071b 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -24,6 +24,8 @@ BBFILES += "${@' '.join('${LAYERDIR}/dynamic-layers/%s/recipes*/*/*.bb' % layer
 BBFILES_DYNAMIC += " \
     raspberrypi:${LAYERDIR}/dynamic-layers/raspberrypi/*/*/*.bb \
     raspberrypi:${LAYERDIR}/dynamic-layers/rasbperrypi/*/*/*.bbappend \
+    xilinx:${LAYERDIR}/dynamic-layers/xilinx/*/*/*.bb \
+    xilinx:${LAYERDIR}/dynamic-layers/xilinx/*/*/*.bbappend \
 "
 
 # This should only be incremented on significant changes that will
-- 
2.19.1

