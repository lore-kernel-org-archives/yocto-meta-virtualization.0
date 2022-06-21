Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6467C43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 22:00:27 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web09.443.1655848821334941529
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Jun 2022 15:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=RuRUtQKG;
 spf=pass (domain: mvista.com, ip: 209.85.216.48,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pj1-f48.google.com with SMTP id
 k12-20020a17090a404c00b001eaabc1fe5dso14928722pjg.1
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Jun 2022 15:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S996CKWo5YLHECuq/pUvlDflUYG8/KJ9ULCvL+oaTss=;
        b=RuRUtQKGKLmx4oEnVFiuXWLerGpXbXxGwuxSpXpvvneUisx3Vcis0c4RijKqfeUvdF
         jrmLpEQYz7K42XqgSps34wRont6Wy66tLEcyCCpMHTYnPeef/1hGPq9MZ8hGnc2Hp8AU
         8uHQ5o4mwFDkR4HtH+zyFPkEeaFun1E5T7zIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S996CKWo5YLHECuq/pUvlDflUYG8/KJ9ULCvL+oaTss=;
        b=o20k8VnaGDfiNvI5y4W5sIJ82occiEOTsx4XjIJ0n4+szubvmtE+PAUibnf9fti6UB
         HS5chWVTcndKCbF7iJPIPd4w2bPcX7EVwDGvWFl9gEivnyy58Jy4RcwdlzgcQ+cvYOPQ
         Sv4mjKA4NAJ6HhC3iKgP89cwGE+gy7NxIjziQW58I6JiBlB3u+ZV2XVSqS+yFY/W2t+Z
         D9y90JPKuSf0OX/Ud78kFVPnvwydgx6j79GcmGPxqX1wrrvP8YmBwl4d+qDOqDmc85mN
         nxIViB80hhU5LbNAQD4NBojo1LOkxwLtp4BYvztvMgoeOIXNtoahk4iOlw5YwikKYxSi
         kvXA==
X-Gm-Message-State: AJIora91EiXIoS6tft4uRxGgFdIQdFJdyrIuCJDmY5zG8K388cviEG60
	Uw62sQOaKWNYgKod+kxbLNXlWzMyiuwL+Q==
X-Google-Smtp-Source: 
 AGRyM1vosUKV2LP/kQQtiAP4Qy3bet78WEUn5k/OZo8BcHuuSGePFiDHubh2wzHLv3WOHTtAhtqd1w==
X-Received: by 2002:a17:90a:c402:b0:1e6:8254:3478 with SMTP id
 i2-20020a17090ac40200b001e682543478mr57974pjt.101.1655848820665;
        Tue, 21 Jun 2022 15:00:20 -0700 (PDT)
Received: from red (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 jj4-20020a170903048400b001678898ad06sm5192852plb.47.2022.06.21.15.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 15:00:20 -0700 (PDT)
Received: by red (sSMTP sendmail emulation); Tue, 21 Jun 2022 18:00:18 -0400
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [meta-virtualization][master|kirkstone][PATCH 2/2] cloud-init:
 install sysvinit initscripts
Date: Tue, 21 Jun 2022 18:00:11 -0400
Message-Id: <20220621220011.778623-2-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220621220011.778623-1-jpuhlman@mvista.com>
References: <20220621220011.778623-1-jpuhlman@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Jun 2022 22:00:27 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7394

The redhat versions work with out modification.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 recipes-extended/cloud-init/cloud-init_21.4.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-extended/cloud-init/cloud-init_21.4.bb b/recipes-extended/cloud-init/cloud-init_21.4.bb
index 9c2dae7..5cb6227 100644
--- a/recipes-extended/cloud-init/cloud-init_21.4.bb
+++ b/recipes-extended/cloud-init/cloud-init_21.4.bb
@@ -19,6 +19,11 @@ DISTUTILS_INSTALL_ARGS:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'syste
 do_install:append() {
     ln -s ${libdir}/${BPN}/uncloud-init ${D}${sysconfdir}/cloud/uncloud-init
     ln -s ${libdir}/${BPN}/write-ssh-key-fingerprints ${D}${sysconfdir}/cloud/write-ssh-key-fingerprints
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+       install -m 755 -d ${D}${sysconfdir}/init.d/
+       install -m 755 ${S}/sysvinit/redhat/* ${D}${sysconfdir}/init.d/
+    fi
+
 }
 
 inherit pkgconfig
-- 
2.35.3


