Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EAB8C04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 06:20:43 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.33910.1715926832842152198
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 May 2024 23:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gcDxmW7h;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51f3a49ff7dso2022196e87.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 16 May 2024 23:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715926831; x=1716531631; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=viwG29WC+o20zELPTRBSkS+gkn87zwQ9uQNo4ekGYm4=;
        b=gcDxmW7hkgVYCL1HIQ1bcaZgEFUTRdD7AHVbpdQNhS3EglAitAMaT/Lk2nCmqeMbrs
         hsM2m92FI9k0AxaFBGV56tm6bfCF+VJT+VjQxj53xjehbM+4vwVZCiWCk35W7qveCP1T
         R3Qjs3epJ+KMH2dRSQ9mNgl02VbsDS9fmcxNVgKeLQeeylueQhaMa7IA75Rhrx5N5UmU
         StCAKD5ci7Ia/MmQkOilgc3X80rE5tSBUlTbGNQRg2SCGX+kEvv/77z+jOKfbZ2YSUCW
         qm79ArB6BB0f/MeEfBp5YaDN46IUnd4Ob8HGRpWGSJDeySTsmQI+wWGK3iICLlqu9tS3
         kptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715926831; x=1716531631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=viwG29WC+o20zELPTRBSkS+gkn87zwQ9uQNo4ekGYm4=;
        b=m0pAZORFUSB9s42AkbyHzY1tUx1qsvd1kbNY1OR7fBz7S9iC9tXrMFdL4zda6xBQh1
         nSZY4HgWnSJFYOXdQYpzLjI53vsntvbR1mr7N6NbXdnVHnBZUPs760GnC1b1axWgUPTZ
         o/GAFFA47+GPayBoLXuRzs0RObHQpFrG9EqA5uHxNDkUgO5F2D8vGfjaXYj4JcSOxYZD
         RF5ygvtCFiqoaYMGocFZHpt7s00jadIX/3g11lvZ4UjDkXScr6KRRXK4cvmPwVDxWVzZ
         VxnFZ9zraoMOm/pccg+aZUNwpv12cSFGDqHiVhJwmyWNyBJmWVKhiAc/LHvK5g0nu3Lw
         Vpxw==
X-Gm-Message-State: AOJu0Yz44e69jFt2ucy4Yvlg8GowBcIzxu1uN3RQcdF/K1qGHrWyoxYm
	Drof+4DUnKCTjCnMEcfGRJ+NAySyvJ10TU+eJur/1YvpU4Ve6r+lo2Khbg==
X-Google-Smtp-Source: AGHT+IF0TBJISBCmAHueQf1CwBth17XM+e10hDgyNMDptu15a3Nh5YJ3KjlCvOiAk/t7hdkRHNE9vA==
X-Received: by 2002:a05:6512:33d0:b0:523:9811:b0d6 with SMTP id 2adb3069b0e04-5239811b25cmr5321373e87.15.1715926830582;
        Thu, 16 May 2024 23:20:30 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17891f87sm1066427966b.65.2024.05.16.23.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 23:20:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [kirkstone][PATCH] kubernetes: fix do_patch failure
Date: Fri, 17 May 2024 08:20:21 +0200
Message-ID: <20240517062021.116829-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 May 2024 06:20:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8730

* introduced in:
  https://lists.yoctoproject.org/g/meta-virtualization/message/8715

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 recipes-containers/kubernetes/kubernetes_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index 78d1cd2a..f374892a 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -35,7 +35,7 @@ SRC_URI:append = " \
            file://cni-containerd-net.conflist \
            file://k8s-init \
            file://99-kubernetes.conf \
-           file://CVE-2024-3177.patch \
+           file://CVE-2024-3177.patch;patchdir=src/import \
           "
 
 DEPENDS += "rsync-native \
-- 
2.45.1


