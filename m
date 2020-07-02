Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.9441.1593704354524052608
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 Jul 2020 08:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FR2ebY0f;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id o18so25851800eje.7
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 02 Jul 2020 08:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=myEEHy5AC9f42ykMploH29pr6MLuVBayvHFFzdEEdaw=;
        b=FR2ebY0fOe5hJ7/2H52guFlFYl8eyH8PN5u0RnNTr4kiZie8Jq9VP+iNq22SlflNHd
         YiEJlYI33JNnAM33r0L9xoi6fQ8crv8NxwV3q3tAYOxudqNdmvKffWpCHhUlbM2u0dpz
         /DyMRIx5oEseq/dz3S1L92NxREM1Ow9kxEj4hYr/WStEAhh4kEgp2Tc/uJV1jP+Oi4/l
         zulqXtw9BsTXG9vD1XVtY9jrrITbp2bcQSatGvNCPhJQcTs3mN5zbmKk5DsjKT8L3/EA
         CWJoGFQAFJBBKeg2Ov6EldXuqt5Vi/+eQp/lWTglyR9Zj0KUG6RmbPTXE18pBqe7fP4e
         nYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=myEEHy5AC9f42ykMploH29pr6MLuVBayvHFFzdEEdaw=;
        b=g6Yn0Mqdcy5Fb/Jmt4DAZwfIIGDT8L0gVazlZPiIpUmQb8DvHo3tBfWsN8nv0Q6Ypd
         Y+1rYHfyT0WG0ziFYRBnrZXbb9j7R4Q6Thv16MwA0isrbQvf3Hui+ANZ3pCEFCtY3JB6
         5NNkX9g3xTgQZIeAoo1UfCtVV4qj0nUHWRG3oFJNBz8JjVv5QbN9gvVtc0/SWkDtAZnQ
         4YvtK43afZh+3v1B8WJqQmvr7F7xsSBjynCficdA83zaURu14/McN3b4P3WF8FIoDQmx
         U6uIG9EA5ITEqf3DocHe7g94yfxchJ/kq1Sc/YD83QiT8OtErLhS9Ko4T9+Sq8kSurbV
         XZXA==
X-Gm-Message-State: AOAM532Ep88+dGuIugyN/a6VgSn61AWwcwNW7ynGnehKB9W2R/qdsmXl
	7RGD6PYpMNAzZKhwcUu0/POa2uCX
X-Google-Smtp-Source: ABdhPJzIApDvaZhKxLk9+WvcsFEfUZH4eT1h6carb6jZNrsMPJydsjcsPtOA9bMMynTCVKWx8XE1/w==
X-Received: by 2002:a17:906:2581:: with SMTP id m1mr30065322ejb.89.1593704352736;
        Thu, 02 Jul 2020 08:39:12 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id m13sm7154323ejc.1.2020.07.02.08.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 08:39:11 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@lge.com>
Subject: [PATCH 1/2] docker-ce: remove unused docker-registry.service file
Date: Thu,  2 Jul 2020 17:39:06 +0200
Message-Id: <20200702153907.75805-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Martin Jansa <martin.jansa@lge.com>

Signed-off-by: Martin Jansa <martin.jansa@lge.com>
---
 .../docker/docker-ce/docker-registry.service  | 19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 recipes-containers/docker/docker-ce/docker-registry.service

diff --git a/recipes-containers/docker/docker-ce/docker-registry.service b/recipes-containers/docker/docker-ce/docker-registry.service
deleted file mode 100644
index 7b4bc46..0000000
--- a/recipes-containers/docker/docker-ce/docker-registry.service
+++ /dev/null
@@ -1,19 +0,0 @@
-[Unit]
-Description=docker private registry service
-After=docker.service
-
-[Service]
-ExecStartPre=-/usr/bin/docker kill registry
-ExecStartPre=-/usr/bin/docker rm registry
-ExecStart=/usr/bin/docker run --name registry -v /mirror/registry:/tmp/ -p 5000:5000 \
-                          -e "STANDALONE=true" \
-                          -e "MIRROR_SOURCE=https://registry-1.docker.io" \
-                          -e "MIRROR_SOURCE_INDEX=https://index.docker.io" \
-                          -e "SETTINGS_FLAVOR=local" \
-                          registry
-ExecStop=-/usr/bin/docker stop registry
-Restart=always
-RestartSec=10s
-
-[Install]
-WantedBy=multi-user.target
-- 
2.25.1

