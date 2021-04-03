Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.34322.1617479501072975664
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 03 Apr 2021 12:51:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TmmXtd9V;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id n2so5406520ejy.7
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 03 Apr 2021 12:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cpJ62uvwYWl6Ix8KbZyS5tnAWKDfRBBLfZ60mbChlAg=;
        b=TmmXtd9Vvw103tDkzH7YtWs9dYcfiQGG3RhfpJhbJA7bTCGfKbK3NRNjytYJp8lRhM
         Gqbva98cv9+KcYqjwe+S1G5muHuD7MzhFaBRfhFpNGlGOUF9rgzYFgkvzViQJAbe+UX6
         9qwfXLHjXg9THai0HHMBFQwLp803NfcE3TwDyUymu2edYhdLkf1ppfYEjnXC3WexhIEa
         Gdm8safLBKaj/dHy1tcM2YH/UGT14c4mEtVrr3zY20JK8j9/xPD5728suXDzh+dIxBKq
         9F36sgr7enVmYSPcxpIFhFpgD1MJiKwlF4k4kTbmlOBby58dM01MV/ZOeZ2AiRDXz++8
         RyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cpJ62uvwYWl6Ix8KbZyS5tnAWKDfRBBLfZ60mbChlAg=;
        b=k8pO4Vgcy0pFZDp8jCF4vPYcCKctawh8Os8yP9Axh+d1sBLdXnhfuC02V/YrMAopcN
         R7O9SGCLZzuLMJQyuG0rgXGtd0Qxi7RqwLua6YJZmueK1syesouOC/M1oIYRgmIxVVKE
         JXlmYGZ0KF1FNAkVK85Qwdr1lQ8DDsQhvUscPQ8wvcLi+2829G/u+Z2mpzI80KJRo131
         MroHCt/ZUC+fBaqCfHM3wqdhbRFPfR9If1wp/PU5LmS7LUCOBGLd6tflf1doxFVWP/6K
         kpGVgRX+IIPCLnU2JXde2BSIuja8T2egc3Sea099B/+8QH36xE9XNmfZR6MfcpF5H7n/
         QmLA==
X-Gm-Message-State: AOAM532gQCK3/oix5IHWotTYYKiEk2g9kfvAUz1HUiFDtMRJ+f4idlzt
	RiguO0JrSk7bapzntQpld7nqXUeEASM=
X-Google-Smtp-Source: ABdhPJyXdPF9vimFLiDQZmQvF7WX4Yd/OkykshnIxp5GS3JA4jS2Fci1AULsW4rMhNrpFMWkvqHvPA==
X-Received: by 2002:a17:907:2bdd:: with SMTP id gv29mr19970594ejc.259.1617479499743;
        Sat, 03 Apr 2021 12:51:39 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id g20sm7337432edb.7.2021.04.03.12.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 12:51:39 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH 4/5] ipxe: fix SRC_URI
Date: Sat,  3 Apr 2021 21:51:32 +0200
Message-Id: <20210403195133.1401406-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210403195133.1401406-1-Martin.Jansa@gmail.com>
References: <20210403195133.1401406-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* git.ipxe.org is gone:
  fatal: unable to access 'https://git.ipxe.org/ipxe.git/': Couldn't connect to server

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-extended/ipxe/ipxe_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/ipxe/ipxe_git.bb b/recipes-extended/ipxe/ipxe_git.bb
index 7b76817..448087e 100644
--- a/recipes-extended/ipxe/ipxe_git.bb
+++ b/recipes-extended/ipxe/ipxe_git.bb
@@ -14,7 +14,7 @@ PR = "r0"
 FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
 SRC_URI = " \
-    git://git.ipxe.org/ipxe.git;protocol=https \
+    git://github.com/ipxe/ipxe.git;protocol=https \
     file://ipxe-fix-hostcc-nopie-cflags.patch \
     file://ipxe-intel-Avoid-spurious-compiler-warning-on-GCC-10.patch \
     file://ipxe-golan-Add-explicit-type-casts-for-nodnic_queue_pair_.patch \
-- 
2.30.2

