Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA0AC36017
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 13:58:40 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.9102.1743602316982517431
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Apr 2025 06:58:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KNxrewjd;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso12292131a12.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Apr 2025 06:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743602315; x=1744207115; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VHkCiB5v2SGW6Tsh8KetebATCtPRYgg2mOfqyjyLpeU=;
        b=KNxrewjdwRjFdg9RrT8xmnuMfa56KEZ8Ftec54gHwfOdVurX92acG9oUPX5MCfebik
         OlD3HucVzf95PlLYbh1ZIsZPN00HUhNtA+oJfpGiJicUTWmj3BjJSTfzYQ3rajgNVsTF
         eTmpew5lpWu4D654/lHuheVqYSgeLJlh+CgwSruG7L0B9uLKYoLlDLGzVaVM1yy8vZPl
         3NXT1cc4+91ydyRuOi80WmsFvc/yPoPsmiuHx1wBj6HPBV+5KkYtK0si+6pfDpt9pskD
         z0td2/vi6syS+JXxNRnzce2m5W43Um+JTHqaATYqFRFxRIZWUItL/8Ln79GrS3XPcdiv
         I2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743602315; x=1744207115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VHkCiB5v2SGW6Tsh8KetebATCtPRYgg2mOfqyjyLpeU=;
        b=VeYmVPOnlXY1moRcayPG6TR/U7lhqbFeMV1Llf/y6I61384rDG4ktU6v/Snr/1Hg01
         1Mx7yxGTuhb3IHTBrVw2HE5wT165jzjd588zNIh+pIaRcEwLK1i6XvmPwBdWEHOl5SSj
         oZQ1fOlogE6g7yX4YVeBlNh5z4DYo6quJxwKqZr133NHwly8xcN81GAFYsWVUQMCAyM3
         weKn71/K0+17pSqWFrCS4xBT/9fKeUbIjmCrOShNSC2qHNyi51TWWGUZItf2P3aVD/0K
         d9hw2hCXe4b2CoXUKS70kPzXQAuwSns3A3FYMN9ZILx8roHdb/2HUfuifyByYJxJpqcb
         WLUw==
X-Gm-Message-State: AOJu0Yw4JoCEhuGrbjumXYnPOQLunwJ4xl+WJAvAwYdmEPlFy4EWCWIc
	87FimlSdthm6QqEaN+ngYKIkX60jFOHRFfRpxvBXyWxoNmvOcHklb+qmIXOs
X-Gm-Gg: ASbGncsPcXS9mGcWk9xVHMAXAN2ZuGhGbSaZlP8bePXIap2J2eYNTG1v6jsNOk2549z
	XsFRAZnFWXOVdnU3949gey059e5p5BC5LEkmBI3FNqtIxgLP/dDymVlw6DbGLgbGL5PdH87vSsM
	feH3GECvQZQdaOTcrAn3TTdcl1dro0aljSH5ZYvqpkUDjAdYhrTuagW8P+XsoSb/uVTmvu2rFhi
	DlXxK1UtNTZw5z1MkJa6tm6Q7Z4MJCPYZK/z8RNy4A+eKIL6/U8WiDqOv5rWYxDI0BtSuGImSqF
	8FWbCszzOhWeak2FpGtjj792ZjK5s9opOPeG/DAep3qA438=
X-Google-Smtp-Source: AGHT+IFk3I5OuOc57h1eXHeZDKN8invyXsXsRrUEiARtv1PG6X1WcT6/U8YOw73o4PQv6bAIF7Wilw==
X-Received: by 2002:a17:906:6a10:b0:ac2:6bb5:413c with SMTP id a640c23a62f3a-ac738a9700amr1823954866b.31.1743602315096;
        Wed, 02 Apr 2025 06:58:35 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac71927b06fsm920141466b.53.2025.04.02.06.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 06:58:34 -0700 (PDT)
From: martin.jansa@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH] docker: fix Upstream-Status format
Date: Wed,  2 Apr 2025 15:58:30 +0200
Message-ID: <20250402135830.3393656-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Apr 2025 13:58:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9191

From: Martin Jansa <martin.jansa@gmail.com>

* fixes:
DEBUG: Executing python function do_qa_patch
ERROR: QA Issue: Malformed Upstream-Status in patch
TOPDIR/meta-virtualization/recipes-containers/docker/files/CVE-2024-36620.patch
Please correct according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status :
Upstream-Status: [patch-status]
ERROR: QA Issue: Malformed Upstream-Status in patch
TOPDIR/meta-virtualization/recipes-containers/docker/files/CVE-2024-36621.patch
Please correct according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status :
Upstream-Status: [patch-status]
ERROR: Fatal QA errors were found, failing task.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 recipes-containers/docker/files/CVE-2024-36620.patch | 3 +--
 recipes-containers/docker/files/CVE-2024-36621.patch | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/recipes-containers/docker/files/CVE-2024-36620.patch b/recipes-containers/docker/files/CVE-2024-36620.patch
index 7bce4137..03628fb3 100644
--- a/recipes-containers/docker/files/CVE-2024-36620.patch
+++ b/recipes-containers/docker/files/CVE-2024-36620.patch
@@ -8,8 +8,7 @@ First released in v25.0.0-beta.1
 
 CVE: CVE-2024-36620
 
-Upstream-Status:
-Backport [https://github.com/moby/moby/commit/ab570ab3d62038b3d26f96a9bb585d0b6095b9b4]
+Upstream-Status: Backport [https://github.com/moby/moby/commit/ab570ab3d62038b3d26f96a9bb585d0b6095b9b4]
 
 Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
 ---
diff --git a/recipes-containers/docker/files/CVE-2024-36621.patch b/recipes-containers/docker/files/CVE-2024-36621.patch
index a6c06ef2..6560f46a 100644
--- a/recipes-containers/docker/files/CVE-2024-36621.patch
+++ b/recipes-containers/docker/files/CVE-2024-36621.patch
@@ -12,8 +12,7 @@ release only one of these layers was actually released.
 
 CVE: CVE-2024-36621
 
-Upstream-Status:
-Backport [https://github.com/moby/moby/commit/37545cc644344dcb576cba67eb7b6f51a463d31e]
+Upstream-Status: Backport [https://github.com/moby/moby/commit/37545cc644344dcb576cba67eb7b6f51a463d31e]
 
 Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
 ---

