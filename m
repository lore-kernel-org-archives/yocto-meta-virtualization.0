Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.1373.1596783926365632644
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 00:05:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qXRxfV5G;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3E7D2E01FA6; Fri,  7 Aug 2020 00:05:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.222.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ADC0CE01FA4
	for <meta-virtualization@yoctoproject.org>; Fri,  7 Aug 2020 00:05:25 -0700 (PDT)
Received: by mail-qk1-f195.google.com with SMTP id b14so895677qkn.4
        for <meta-virtualization@yoctoproject.org>; Fri, 07 Aug 2020 00:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=g6QtQihJaC76PqmKwCApkx3zw3IonVvYW7AHCxevDeA=;
        b=qXRxfV5GqxVXIR8hHUAM7bEsg9VV3x8wkkJnrfqptIjzktyfKUS/NFeKWdFxCcbbZB
         mbqs0Axh3KPcdjkYb1KRczlDfvCM3N0oQ/cuCnunn2mkQ97p1e1YifUVrODKDE9kTPFo
         Ci1VixYd11ocZVmAqGM6uldM9rm9mWtXeU5zl0mgyIrxOGa6I23LElopHUYeV2KMccpy
         fUq1gAZYI7mqthW1W4yPbVP848vp5UpmaQ/TVWdQLYXWR48qtGmUDf44YTefBfPTN00f
         7bt5XCO+T3SIJyh53oZ2zR1JQNq3pNFZmxJZc9S2P4KGep5NfgXo6TL9G5XQSEj1C40p
         +SIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=g6QtQihJaC76PqmKwCApkx3zw3IonVvYW7AHCxevDeA=;
        b=Z2pQQ+wg/rOQTfHDwNSdqt5AmudR1jNgoZdATK9MJ7/6G6O0KA0wpJrN5r7Trp0m3W
         b1+uCJuelxsPU+9Bco8GHyFU9Gg+SqRXtXcbzwKUd9+Fu6s0hTpoo9MmwOqsRCAgyJ8/
         9tm4sI0Z+/KVSgOk7KrBbwKFst0brskxncECgCXsEe0Y3cNYIZ1NsuJ3rTYVuP8E8kwa
         ePJMr4ctuB/aOlLEbpOCuolviY+P7XVkxNEgof2gUN9l3ZQlPWe+nEqLyDwUpNw+WRuq
         8lYDDKF3bLzMAea6gh2woVXsyBQVgfCpd9MTT9lDHA1cDeUWwrXQHXHpAsJPcZIdNd1u
         Qkvg==
X-Gm-Message-State: AOAM530SdQUB/gUtxD2x9pqn38LOINrqKYqje82CMFDNojKx9Q2QtoIh
	VUy/2lrTkOlH7JEpVu6ExDV3IDxGY5c=
X-Google-Smtp-Source: ABdhPJwCiQurSXGyqW07hs/zK6Tf9Wtdb4GNPU6tqAHeNvJ7NHDATz6iDhjUV7JfToemi1WifaYNVQ==
X-Received: by 2002:a37:4811:: with SMTP id v17mr12779082qka.166.1596783924988;
        Fri, 07 Aug 2020 00:05:24 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-176-185-85.mycingular.net. [166.176.185.85])
        by smtp.gmail.com with ESMTPSA id v45sm6992275qtc.42.2020.08.07.00.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 00:05:24 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH 3/5] xen, rpi4: use RPI_EXTRA_CONFIG and drop the rpi-config_git.bbappend
Date: Fri,  7 Aug 2020 00:05:01 -0700
Message-Id: <20200807070503.30777-4-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807070503.30777-1-christopher.w.clark@gmail.com>
References: <20200807070503.30777-1-christopher.w.clark@gmail.com>

The GIC that is needed by Xen can be enabled via the rpi-config recipe
variable. Fixes the build after the upstream recipe changed recently.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 conf/distro/include/meta-virt-xen.inc                       | 2 ++
 .../recipes-bsp/bootfiles/rpi-config_git.bbappend           | 6 ------
 2 files changed, 2 insertions(+), 6 deletions(-)
 delete mode 100644 dynamic-layers/raspberrypi/recipes-bsp/bootfiles/rpi-config_git.bbappend

diff --git a/conf/distro/include/meta-virt-xen.inc b/conf/distro/include/meta-virt-xen.inc
index 1ad670e..fe3fd22 100644
--- a/conf/distro/include/meta-virt-xen.inc
+++ b/conf/distro/include/meta-virt-xen.inc
@@ -15,5 +15,7 @@ IMAGE_FSTYPES_append_raspberrypi4-64 = " rpi-sdimg"
 # Add Xen to the bootable SD card image
 RPI_SDIMG_EXTRA_DEPENDS_append_raspberrypi4-64 = " xen:do_deploy"
 DEPLOYPAYLOAD_raspberrypi4-64 = "xen-${MACHINE}:xen"
+# We need the GIC enabled for Xen to work
+RPI_EXTRA_CONFIG_append_raspberrypi4-64  = "\nenable_gic=1"
 # Align kernel version with current meta-virtualization kernel version
 PREFERRED_VERSION_linux-raspberrypi ?= "5.4.%"
diff --git a/dynamic-layers/raspberrypi/recipes-bsp/bootfiles/rpi-config_git.bbappend b/dynamic-layers/raspberrypi/recipes-bsp/bootfiles/rpi-config_git.bbappend
deleted file mode 100644
index 2b9c4fb..0000000
--- a/dynamic-layers/raspberrypi/recipes-bsp/bootfiles/rpi-config_git.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-do_deploy_append() {
-    # We need the GIC enabled for Xen to work.
-    if [ "${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'yes', 'no', d)}" = "yes" ]; then
-        echo "enable_gic=1" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
-    fi
-}
-- 
2.17.1

