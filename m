Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F34C6FD1D
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 22:10:44 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.33344.1680387037729561042
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 01 Apr 2023 15:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=KL9Bunah;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id h8so103398686ede.8
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 01 Apr 2023 15:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680387036; x=1682979036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hw4Or75UcjIdVeTfze9/+mZ+vNNU43p1p/F2jDBvSCw=;
        b=KL9BunahIuq6o5iaHppMisA7j6514HcP0JQiNt14GNELMJVq63TQJnCEHrAZi/j6w0
         TGtmBohZsJdAe9yrU0QM0hPlo1LLRr0Tm4aqWrwq94WjrSRCRXCQR6F0iaeWiwNLcKHI
         EMG9QRCfvII0fMZvFrcjoVkOKko/U6KvRdQpBEs2TnVMxiDpx9Xnr9fguxX5pWPbU4Di
         gEMEnQYH4t8Yvvt4aUBL4+KEx3JCXqr67yf0GVjrXNX0e4qHtJi4SCV/OGjU1yba9mO9
         alWLWA0B+ATXi+p06OTdIrY8/iZdTiAeY4PLCkUViWDvcklY14YeroaUu6VcU1UloTbv
         2UvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680387036; x=1682979036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hw4Or75UcjIdVeTfze9/+mZ+vNNU43p1p/F2jDBvSCw=;
        b=SDW05k8jJsp4dW25KmFs0z6+PPwOIKP5Ap4109YWeMpiY8l97XyVm4L9gWnnA7i1Rw
         klisRVF4sQxcgLSztMioseHrrPEDfvt3lb73fhq626OhQEEyMFeN0QS2mfaS77C8T7Mq
         c0gVzYQF4MyB/C9/ubDUcmZylMP5MO270rLJN4smTL1D9/dQrAvJPBjAoKkrg0JPMbpu
         1Ypfq30vXF+TkHkexEUn9wHTKfFStpvtg3F8qi4OmJ/FQ234d8Ci+7rmLAxys02LBya4
         rRfgvpacv4fq79RCF4fgitJY5Wba9KufYpFotDheYwNe5EmTjS4R18jtZ2Y3v62TPn+c
         1Hcw==
X-Gm-Message-State: AAQBX9eaViYFSUtHE9w3jWDbVvZqB9ssxO14ECJA1KDIquTbvkayJoKP
	7Ir+HJenh7NutDolTIKHlTJQXzrRWeI=
X-Google-Smtp-Source: AKy350aDUSHgUKGrdZ9cMSn19NAoZTgqR/SP7stxWYmAlfmNzq6QI2Ehuog9By3Exa2uaeNaogS4/Q==
X-Received: by 2002:a17:906:7243:b0:8f3:dc49:d8eb with SMTP id n3-20020a170906724300b008f3dc49d8ebmr32155270ejk.71.1680387035986;
        Sat, 01 Apr 2023 15:10:35 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id h11-20020a170906530b00b00922a79e79c2sm2519940ejo.217.2023.04.01.15.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 15:10:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH] crun: fix REQUIRED_DISTRO_FEATURES
Date: Sun,  2 Apr 2023 00:10:27 +0200
Message-Id: <20230401221027.2776494-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 01 Apr 2023 22:10:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7977

* features_check was inherit twice and REQUIRED_DISTRO_FEATURES
  was set twice as well but both with ?= so the 2nd one was ignored

* seccomp was added in:
  commit b8f2edd39af6b7ac4461158b0d0382e88e93d6f1
  Author: Bruce Ashfield <bruce.ashfield@gmail.com>
  Date:   Wed Jun 30 11:22:42 2021 -0400
  Subject: crun: add seccomp distro features check

  but there was already systemd from:

  commit 144d1ae8973e8c67709d7b544dc53b80bf924754
  Author: Bruce Ashfield <bruce.ashfield@gmail.com>
  Date:   Fri Apr 23 10:32:24 2021 -0400
  Subject: crun: use REQUIRED_DISTRO_FEATURES to indicate systemd dependency

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-containers/crun/crun_git.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/recipes-containers/crun/crun_git.bb b/recipes-containers/crun/crun_git.bb
index 7db609e..15c18a1 100644
--- a/recipes-containers/crun/crun_git.bb
+++ b/recipes-containers/crun/crun_git.bb
@@ -20,14 +20,12 @@ SRC_URI = "git://github.com/containers/crun.git;branch=main;name=crun;protocol=h
 PV = "1.8.1+git${SRCREV_crun}"
 S = "${WORKDIR}/git"
 
-REQUIRED_DISTRO_FEATURES ?= "systemd"
+REQUIRED_DISTRO_FEATURES ?= "systemd seccomp"
 
 inherit autotools-brokensep pkgconfig features_check
 
 PACKAGECONFIG ??= ""
 
-inherit features_check
-REQUIRED_DISTRO_FEATURES ?= "seccomp"
 
 DEPENDS = "yajl libcap go-md2man-native m4-native"
 # TODO: is there a packageconfig to turn this off ?
-- 
2.40.0


