Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web12.40071.1584274798715653194
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 15 Mar 2020 05:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RD21Dhku;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id q19so15427454ljp.9
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 15 Mar 2020 05:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KuocOyjzNJOUCqQ5lKL69Y7yq/Zg9yvhNXJuRyUzrrM=;
        b=RD21DhkuAfUJZ6TgpEwnqMBiHIhPKxR0v3oIwMUPdMCka8kUos6YugGd2mgec59QFI
         G4eHqM17mk+74i2Ue0kwzkpmZo77JRY7GekOvR03+hdgHkv6DBZt1nate8kZCBVM1DcQ
         5YIra+xK0BwGdeustdBCvCcwaQ05eCYOoglV04GriMVK+q7N4TLaGqDbXH/lgccAxw+8
         KJl9D2p1vC0+5+KQeXmEC2vrjTuULlB7j9opfk9jacEZ7Q6sIIvgiVJZKKExlNyZgpfr
         buYXBl7WvTSLN9QxeXXD2KvrKSMgxB8kllavohC/StjW5elLZzCSCn3PO6Z2aXhiRq5J
         T+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KuocOyjzNJOUCqQ5lKL69Y7yq/Zg9yvhNXJuRyUzrrM=;
        b=PBJMTRxJ3C5CTdAUPF2BgEI9ROkl20Ykv6fwdEa3JZJR3XaXW4DrZbVLpvuup91d/O
         /0Aqys1kCorAqzW1xjjEzn78fWgQOVro/yx08xsx5jQMdGpnmf3HyzqXDrrtvAkhMfZg
         hawKYOSxrW63d3MDdkPVV19nel0QVqxjxPTqGU/vd6M+ncuV95fxX7s6lvoQd8jrrzXw
         Bxmfji7T4wYSW6Qm5qUGrNvSvY1u9Z1WNGlrESvR6r2t0VCrrzP6XomCpSPYnnVJf4Rz
         EY45Mz5xVyves6Td9c+Bz8frm9rRUxqqpRIg3QmQ3RK7AEPgpk4d8MwfWu1Eb1qC8XKN
         NEHw==
X-Gm-Message-State: ANhLgQ1cAiNciWYj7QOjTkf3kEr1gk3g55s8ymKicHmqzFKdKIuI5glK
	iTx00127xhPynzTMe41J3jgq9ypmNUg=
X-Google-Smtp-Source: ADFU+vsnpxhf12Kl9DXfZDMY2+CN2Vjni8nZqpZqY5It9Ijh3liR+Io4+iMQNNytHqEcMrEg3Bwrog==
X-Received: by 2002:a05:651c:1114:: with SMTP id d20mr13193394ljo.103.1584274796280;
        Sun, 15 Mar 2020 05:19:56 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.lan (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id q4sm22393707lfp.18.2020.03.15.05.19.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 15 Mar 2020 05:19:55 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Ming Liu <ming.liu@toradex.com>
Subject: [meta-virtualization][PATCH 1/3] runx: drop distro_features_check
Date: Sun, 15 Mar 2020 13:20:06 +0100
Message-Id: <20200315122008.22161-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <ming.liu@toradex.com>

distro_features_check bbclass is deprecated, inherit features_check
instead.

Signed-off-by: Ming Liu <ming.liu@toradex.com>
---
 recipes-core/runx/runx_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-core/runx/runx_git.bb b/recipes-core/runx/runx_git.bb
index 36fede6..9517d89 100644
--- a/recipes-core/runx/runx_git.bb
+++ b/recipes-core/runx/runx_git.bb
@@ -18,10 +18,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=945fc9aa694796a6337395cc291ddd8c"
 S = "${WORKDIR}/git"
 PV = "0.1-git${SRCREV_runx}"
 
-inherit distro_features_check
+inherit features_check
 REQUIRED_DISTRO_FEATURES = "vmsep"
 
-
 # TODO: for if we need a go shim
 # GO_IMPORT = "import"
 # inherit go
-- 
2.25.1

