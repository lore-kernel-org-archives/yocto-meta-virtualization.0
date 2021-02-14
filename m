Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web08.15687.1613301152638702962
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 14 Feb 2021 03:12:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sg0ekkSb;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id l12so4914223edt.3
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 14 Feb 2021 03:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4AqFmoX7YkBVSrjoO3hCns/n37T5QTLfW3ZLf8d459s=;
        b=sg0ekkSbUW9sYmDWixM6W48nImP4QTxFBFRs9dRalPLXlvwyZV/jLcGmmn9JTk5PRz
         uiVUCG70kU+TXJmnwdGi0R4cgjNscrX6ni3wEu117lwQaN/9KXmUAi7HWWME40dvR8se
         0IBoCz0FRnb8Mf9k+HcO/jOrRgczmArUjUQHkIob2jheHeCVRNcAosFg3jYluykmPn3p
         xVpxdG9oMmP0qsFZafmCY7OuTdy7V6elr4H2z656ZszjkJGH2F3s3t5OrylQbZYIaweg
         e3NwIpMOy8jTtw9bUbrrpkQF8IZ6iNMZ0MA/52InikH2NehUv54SFQUMiTVuHKntYNZb
         JkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4AqFmoX7YkBVSrjoO3hCns/n37T5QTLfW3ZLf8d459s=;
        b=Dk83nP3hFR5ipdZjsicDrxxhUUg+SBTfUVCmFDfjkXnEWga0j/aXA2FZ5Ed7UayH10
         NeUDZLGbg6lvrNS0GSP7hQMXX+POFRyacO7L2hxb1uqFf3sDuDkATWRcBmrZXdvJZiPJ
         UgCX6YAS6UL/VYKJw1LMu5242IZOFJJKmtwR3BSwtI7hJE9XUwZCsATAJcjIyHVqIcFA
         RXBg8JjPG0dLpbPw9aPbfnU9Pk4weqjVcnq8yLKDrxZjTxnTDWrhvXPY87DMajXwwbZc
         nu8hCiZqVjYoo/gBFTNGc0hpjF31UK86xmt+avd7O0YlzKJH0GxwokRuIBl99TaxCPqw
         4oWg==
X-Gm-Message-State: AOAM532E/V0gD2Gy8RG9/WR5wus+pUmS82o4UV5FyrxWddN2DvWS2Cs7
	PsDqPd+ceBurNPQaBEl1/WP+YJfnH2e4kQ==
X-Google-Smtp-Source: ABdhPJzLrN1vRJ+zF1DH6T4GGUpFdvlDme1MbUTCSGf8ej0fHL8U0COGfzUfMcoulUCqq0BH3zNVyQ==
X-Received: by 2002:a05:6402:4382:: with SMTP id o2mr11337146edc.371.1613301151072;
        Sun, 14 Feb 2021 03:12:31 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id jo21sm2732121ejb.30.2021.02.14.03.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 03:12:30 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][gatesgarth][PATCH] libvirt-python: inherit python3targetconfig
Date: Sun, 14 Feb 2021 12:12:26 +0100
Message-Id: <20210214111226.74201-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* otherwise libvirt build will incorrectly use host's gcc and fail with:
  gcc: error: unrecognized command line option "-fmacro-prefix-map=/OE/libvirt/6.1.0-r0=/usr/src/debug/libvirt/6.1.0-r0"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-extended/libvirt/libvirt-python.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index 7b87d5e..bcd7657 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -1,4 +1,4 @@
-inherit python3native python3-dir
+inherit python3native python3-dir python3targetconfig
 
 export STAGING_INCDIR
 export STAGING_LIBDIR
-- 
2.27.0

