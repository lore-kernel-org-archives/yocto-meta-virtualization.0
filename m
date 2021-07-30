Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web09.25161.1627658003194603353
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 30 Jul 2021 08:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fUiWwoJ8;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id hs10so8721009ejc.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 30 Jul 2021 08:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zpAdyjMokPbtRkb9DmGnMGG6PWPtcuSKk6eH4x8Mahs=;
        b=fUiWwoJ85XjWw0WMhT7X672eaP/3mGmMTtmsR1W8sOHzW4P7UXoQeClxhyjY0En8tj
         dS5O21RlgbDFxSfY2B6WaozcuoOleqywlVtIi0eMcmpm6Vge2+pBLFv5YR51mutcH/Nk
         xNTcqps0CFu2pXEbsheVQQV82GBynX4YqC5MML1fPE12iC3v5KJl8Tzd18uJjmBcKFon
         CgnNiUZBaWm6Y5/9ULptWLkbtiY0/4jl3hlyCOxE1JdfPZPEq8py44RokRRl/b2TJdbQ
         95XEQ8Gm4kkXxuCAYhmLW8pGglMzxCPTQAXkH5Z9AGtQfB47QX4UCh4ejzcI73KLiX/P
         1aGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zpAdyjMokPbtRkb9DmGnMGG6PWPtcuSKk6eH4x8Mahs=;
        b=FyM7DivWO8OJZnughaqWUygEMN1b8DqRSckgKkeKgu+PETlN3AnsG1IZQhLW71QXya
         hpth8BCpco6uEfSpe/7/+G+WgeEVxpNEl5jvuvnruC9LX5Mful97REt2lBaYaQ6XRsFL
         7tCt/3jlwFNmyWR8jOYX9T8kfcaPlzxocYhBBzuFf7KcWLEQq3cstMgNoNhdIbRwFSjb
         NGvqo0VClhm3Y9BLi6m/NDlkiA/WsWx2vJLgSL++Fj59eNL7X1pdRCZJZ/jabG9kXd01
         4v2/ZvWfK9LPbWRSKkJx//D0gwj6p8eNZDSBTjq49bJmu03o+7XxKESYzN6CW8sU8dVU
         W5eQ==
X-Gm-Message-State: AOAM532arvHRV4pLYu91AAlst9sirWeZGflwQw3IAvcp78Q1RNkZLTfo
	JbxodB4UrQcbMcVe1uS13h9EoeDB3FU9Gw==
X-Google-Smtp-Source: ABdhPJwL+nhUpI71Fvtk3F7b+t54HT13dQU2Y0Yc7izaV1KJA+3zSr7L41ymqo2nnxZFwUy4HBW9Cg==
X-Received: by 2002:a17:906:3915:: with SMTP id f21mr3081774eje.178.1627658001692;
        Fri, 30 Jul 2021 08:13:21 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id m3sm812688edb.7.2021.07.30.08.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 08:13:21 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][WIP][PATCH] docker-distribution: manually finish override syntax conversion
Date: Fri, 30 Jul 2021 17:13:19 +0200
Message-Id: <20210730151319.54916-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../docker-distribution/docker-distribution_git.bb              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index 48d1c93..028c728 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -69,6 +69,6 @@ FILES:docker-registry += "${localstatedir}/lib/registry/"
 SYSTEMD_SERVICE:docker-registry = "${@bb.utils.contains('DISTRO_FEATURES','systemd','docker-registry.service','',d)}"
 SYSTEMD_AUTO_ENABLE:docker-registry = "enable"
 
-RDEPENDS_${PN}-ptest_remove = "${PN}"
+RDEPENDS:${PN}-ptest:remove = "${PN}"
 
 CVE_PRODUCT = "docker_registry"
-- 
2.30.2

