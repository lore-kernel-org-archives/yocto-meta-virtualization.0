Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A848C433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 17:24:23 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.131.1652117061669976316
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 May 2022 10:24:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TjOdmkNm;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id 204so10035080pfx.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 May 2022 10:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kOIku+hwl8xRvDNZ2g2eMxIg1mEjg5+4+CzRWx9rCfk=;
        b=TjOdmkNmHPXQjqsG804bx6ryZqs/at9pEG0cUyUhH/7Nsu1HGYqQJmyFd1pILDL8R3
         zhZm3aQugsKxs4HRhQWR5OEJXrYlAcx9V9ZCjJAs2ytFvOmqzhj7IeK8FzRSHdLsgpcD
         2oNYJOGc05kPLgvGCQqmv/IXieyWNoXJc2X+6YirR9gsPMnWwuiFFK70hIRzUitLUISc
         PnT+u57I96Ya0oR2cLwVX1opjSFgVICDFheS9+okpt8xLL+FDyDOyK8X5Y1Lbnf8IT3+
         vDiBR/PQAKSPRTvHLrNC8Deb+HWNY7B2Rv7kZZjgy+0MqeJJvINUYkumg8T1rNx3ROBR
         kkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kOIku+hwl8xRvDNZ2g2eMxIg1mEjg5+4+CzRWx9rCfk=;
        b=me/c7I7mqXzTa95HJkqhlNwYhN5QwEUD6LtKh6KzzxMD3xU3z6+HqLXE9m4rlyIFPj
         47WRbGe9Qk8Q+qyucAeNGGOeJDHwD6FtJ13A1WmUom5yXIUengPmHXk0k7Cg6wAIT9sD
         p8rPyWCmjZBL04D4vftApA+vvxO6YiVFPxCCPVxmr9xDjkmyboevWczD9UhJclNVeOIk
         +j2jX5bfRv/hvxLvWaiKufR10iilGcmlFDu+qj4xRa0NEjG9ffJLQXlqLe4DESg4voZK
         sRNxBG3hDHt1uIspqXXsVeanmSssyZJsR9PbUwgEAomW+h3oPcOWclMeJ6jXx0/VAdEF
         0AjA==
X-Gm-Message-State: AOAM530jFiutl5CahHm9aGM13hvHQ72klqB5StXsV4IDYqA/uoVJK0wK
	6XLum85SRqSL8CMjej++rFJR4leeaC17yA==
X-Google-Smtp-Source: 
 ABdhPJytxMVNazOjFyIiPOQM3pokJPSwayuVH6GDI5dDBgB4+TChaPAjYV+gTQcMCv+Nr0i22sr1Bg==
X-Received: by 2002:a63:d04a:0:b0:3c1:65f2:5d09 with SMTP id
 s10-20020a63d04a000000b003c165f25d09mr13985169pgi.201.1652117060892;
        Mon, 09 May 2022 10:24:20 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 l7-20020a170902f68700b0015e8d4eb2dasm81466plg.292.2022.05.09.10.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 10:24:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][PATCH] ipxe: Pin to use gcc
Date: Mon,  9 May 2022 10:24:17 -0700
Message-Id: <20220509172417.2803867-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 May 2022 17:24:23 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7266

Use single quote instead of double quotes to help bitabake syntax
highlighter do right job

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-extended/ipxe/ipxe_git.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/ipxe/ipxe_git.bb b/recipes-extended/ipxe/ipxe_git.bb
index ff46184..7565c21 100644
--- a/recipes-extended/ipxe/ipxe_git.bb
+++ b/recipes-extended/ipxe/ipxe_git.bb
@@ -23,13 +23,13 @@ SRC_URI = " \
 
 FILES:${PN} = "/usr/share/firmware/*.rom"
 
-EXTRA_OEMAKE = " \
+EXTRA_OEMAKE = ' \
     ISOLINUX_BIN="${STAGING_DIR_TARGET}/usr/share/syslinux/isolinux.bin" \
     CROSS_COMPILE="${TARGET_PREFIX}" \
     EXTRA_HOST_CFLAGS="${BUILD_CFLAGS}" \
     EXTRA_HOST_LDFLAGS="${BUILD_LDFLAGS}" \
     NO_WERROR="1" \
-"
+'
 
 S = "${WORKDIR}/git/src"
 
@@ -44,3 +44,5 @@ do_install() {
     install -d ${D}/usr/share/firmware
     install ${S}/bin/*.rom ${D}/usr/share/firmware/
 }
+
+TOOLCHAIN = "gcc"
-- 
2.36.1


