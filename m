Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web09.33821.1636306650888998411
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 07 Nov 2021 09:37:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pG/PzxoY;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id ee33so53490242edb.8
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 07 Nov 2021 09:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jdek5/eMrEa/gfKBOrWEfBQXWecwSjybLWhDoqYpnCA=;
        b=pG/PzxoYigTQ6d3/zer07Zxht2OUoCrIs/1lsG9RmY2ux88vwlhpm26jeiTnG4n/yR
         rzbqGkxYk+xLO5H/91mvingyR1mnwPSbaTKq01oismDM0pe2uZKCqAwuPuOKmTWEMEA/
         PUInFXU/tltWtR47ZI9GRuBsAqSQ8W66WRF5qfxfwiY+Z1Qp+YvSDvEm+JR0NJWxC1yr
         RYnnStFKkfeFy+ywUh4tZuld7kPnJ+LPAhU3FDLSZLLgb3pu+Cxc2qdqIBNK7u7lroXC
         Rx/Yt/dYxVMlsyOExTrMhirYf3a+yXPjGMAWYSCq8G2NnGk/6pkbRmef3CyaXbWoYfuc
         Mslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jdek5/eMrEa/gfKBOrWEfBQXWecwSjybLWhDoqYpnCA=;
        b=bIFGA+gBwY0mGkUGEWEnZKlXovbKyOa0jSKq6BzTEs8/KdRpWaaAvzY23wu52ro1kP
         lei2ML5Rqnnc53aoChDfitUa0nWklejzc2dxax/EGVIulWrf5K8FDudD46eMZIkIM1xa
         40s+QFjJbbDE1tBIi7zKDujmYUPa/yPHUJNgqC1LgBP0n8Kw6fEtH9hnjJpx4a0EfqUL
         2yuWehkmi/7KDMQcXo9tJqav3HUbxxX3/wMNZ7ahoEORMikUyefI9ouNhvQxmu8bJ25x
         FYwwBHuMA8SXx177IaSVYl+BRnqtR4wNObCYeosGmbg3Z1daiD4UK5nPHM/kvpEwSLLh
         C16g==
X-Gm-Message-State: AOAM532rHrEX34ub1neB9dwTuFg3ETJvw5ugkKR4AU8hwVH3BTYwFEfB
	tPcsG3xoajb5ntudVZtbXZx1dA0oQdw=
X-Google-Smtp-Source: ABdhPJxpF38MYJYgjeiPjbrJkvvQKRSsW2jZmXmorJIlu/MKaf5aiE/Ay8lLbERRgBXTS0KbbbNv+A==
X-Received: by 2002:a05:6402:42c8:: with SMTP id i8mr30486501edc.373.1636306649352;
        Sun, 07 Nov 2021 09:37:29 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id j12sm4622603edr.67.2021.11.07.09.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 09:37:29 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH 2/2] yq: convert github SRC_URI to use https protocol
Date: Sun,  7 Nov 2021 18:37:23 +0100
Message-Id: <20211107173723.700787-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211107173723.700787-1-Martin.Jansa@gmail.com>
References: <20211107173723.700787-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-devtools/yq/yq_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.bb
index 3e48fee..1fccb12 100644
--- a/recipes-devtools/yq/yq_git.bb
+++ b/recipes-devtools/yq/yq_git.bb
@@ -15,7 +15,7 @@ SRCREV_logging = "b2cb9fa56473e98db8caba80237377e83fe44db5"
 SRCREV_yaml = "eeeca48fe7764f320e4870d231902bf9c1be2c08"
 
 SRCREV_FORMAT = "yq_color"
-SRC_URI = "git://${GO_IMPORT};name=yq;branch=master \
+SRC_URI = "git://${GO_IMPORT};name=yq;branch=master;protocol=https \
            git://github.com/fatih/color;name=color;destsuffix=build/vendor/src/github.com/fatih/color;branch=master;protocol=https \
            git://github.com/goccy/go-yaml;name=lexer;destsuffix=build/vendor/src/github.com/goccy/go-yaml/;branch=master;protocol=https \
            git://github.com/kylelemons/godebug;name=debug;destsuffix=build/vendor/src/github.com/kylelemons/godebug/;branch=master;protocol=https \
-- 
2.32.0

