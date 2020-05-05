Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web12.7312.1588714366388550725
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 05 May 2020 14:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries-io.20150623.gappssmtp.com header.s=20150623 header.b=nOYCI1dt;
 spf=softfail (domain: foundries.io, ip: 209.85.160.194, mailfrom: ricardo@foundries.io)
Received: by mail-qt1-f194.google.com with SMTP id z90so3356692qtd.10
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 05 May 2020 14:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries-io.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rcggPwjlS5IbqKx9aI9FEfl4ZUkPc/jsTO5w+F5hsy8=;
        b=nOYCI1dt7ghhlE/0fkKVGNrg4K96KovuCPz+7/gySe6SmrVSr96mFtMu9S267BWaDL
         2WLO8F2rp5BE+ca41ospF4EyVTxG4QfarUZfjyVcYLPNn3Q1wLZ9ryAoOQ5aG99NZa+6
         Xv+RdWfPmrwsGLmkGE9uE0Sm92BvBqa1QzOD0ENRVZ+IbOErJuyX6s7mxEeOrQB3QQrs
         ADfzjVtSzsyc4uS87GkzDShkvzEBQWjJvI2q9SDOFwttlpYoGltWJKuUbkzoreWh/WeV
         65Ie+iE9M5ygJqenXIOQKStdRyyShkU6McRd1IcEm8YgkysB7NLqWDWDXvGnxVNsZzLL
         vj7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rcggPwjlS5IbqKx9aI9FEfl4ZUkPc/jsTO5w+F5hsy8=;
        b=WS6J7UDorStiCepQ50pxoSeJBBzrBcPy2mdQpo2fMI5crmKlUlTQwEJvTBD0WA/Dyl
         wGXgY/BKhqK2Hn8Sq/LN8miQJ5ol4spFqp2aTmwdMXhuGWOpEU/rL2Ypi6dw7QZpYLWE
         66S/2+N/Ne4cXImvkXJoXkmd9/sIZ1IevXxW37dUZX8r1rsBmKLkuIgzjba3alOHIEGs
         JzJ/wpkCVz9jFHml8jNZnG6lxK+ZAB6iRY7eIJlshfWhIxeoYmiSXIZPYaNr/mCdRNmD
         rXKOSTeosLElh54ip6qhss2CCRmv8Gsq4n7RTruDKpJGczoMUehTFgTCe6vW1BwQri3y
         pw/A==
X-Gm-Message-State: AGi0PuZJckinsZSYKV6mTuw89FuwyqrgmVUJhtahiMBP02mCxosO1oIC
	nHwLzZ7jtSdq5RQABv+oeqOLzAypuXcZ
X-Google-Smtp-Source: APiQypImidSaoK/W8teG/0Q9xSupLPAf4ut0UUpF6YNKUaXnasGHlGZAs4nf/lHdqo3TUPnofGGXyg==
X-Received: by 2002:ac8:180f:: with SMTP id q15mr4826545qtj.42.1588714365118;
        Tue, 05 May 2020 14:32:45 -0700 (PDT)
Return-Path: <ricardo@foundries.io>
Received: from localhost.localdomain ([2804:7f5:f480:47e8:2112:9c9e:eadc:3a7e])
        by smtp.gmail.com with ESMTPSA id y6sm72282qky.133.2020.05.05.14.32.43
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 14:32:44 -0700 (PDT)
From: "Ricardo Salveti" <ricardo@foundries.io>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] python3-docker-compose: update to 1.25.5
Date: Tue,  5 May 2020 18:32:22 -0300
Message-Id: <20200505213222.23902-1-ricardo@foundries.io>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Main change is support for the compose format version 3.8.

Relevant git changes between versions:
- 41d229eb Fix v3.8 schema support for binaries
- 15bb3eeb add warning when max_replicas_per_node limits scale
- 5d34f12f set min engine version needed for v38 schema support
- 82873d2b update api version for 3.8
- fe832661 Add v3.8 schema support

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 ...ker-compose_1.25.4.bb => python3-docker-compose_1.25.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-containers/docker-compose/{python3-docker-compose_1.25.4.bb => python3-docker-compose_1.25.5.bb} (87%)

diff --git a/recipes-containers/docker-compose/python3-docker-compose_1.25.4.bb b/recipes-containers/docker-compose/python3-docker-compose_1.25.5.bb
similarity index 87%
rename from recipes-containers/docker-compose/python3-docker-compose_1.25.4.bb
rename to recipes-containers/docker-compose/python3-docker-compose_1.25.5.bb
index 2dcad1e..dece5da 100644
--- a/recipes-containers/docker-compose/python3-docker-compose_1.25.4.bb
+++ b/recipes-containers/docker-compose/python3-docker-compose_1.25.5.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "893fbb804a9057d6c470b5312407e0d1"
-SRC_URI[sha256sum] = "fabae2bee4abfa7bdd09125b6bbdcdda81f946c7b16e3ccc6bb2d821ef6488f3"
+SRC_URI[md5sum] = "a6f296957148e4c61b28fb324c27c966"
+SRC_URI[sha256sum] = "7a2eb6d8173fdf408e505e6f7d497ac0b777388719542be9e49a0efd477a50c6"
 
 SRC_URI += "file://0001-setup.py-remove-maximum-version-requirements.patch \
             file://0001-setup.py-import-fastentrypoints.patch \
-- 
2.26.2

