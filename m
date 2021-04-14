Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web08.806.1618443594915503725
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 16:39:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eAhuyDAG;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id er3so2321607qvb.6
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 14 Apr 2021 16:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QGkSXprDA1sH/rxOpnxuqrgo3MOZufRoCIiLzrqjj6E=;
        b=eAhuyDAGwFsTF4m/eW42eO+FMVq8QTgNJTzklGKo+IhvxqRsg3bT6oz/JnDlvX8xbx
         DzpAqy2fsaMd3Pub63nn/Cb3FQ0xgMQKiicY6ZIhisZnwK5tqYGzWi2eBaj64eP2wJCm
         9DqxAd06PZpoQQ1r+dwMKMQ+tskOt2NYmyewn9mvEgKChqQs4DccEIe866KRQjJXGMXG
         NOv4ZdJyH2G8OD2vSgO9k4v9Fp3HD5MFOgkAt7MkBoJKnvNGbMtMUaOVtZc1N3268lsA
         HlRpMTu2gsh6CreVX3wnimUEVoM7L906JcAwvT4wnCGMTrRnPsORl9mWHXT7Lt9AjVQo
         KrQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QGkSXprDA1sH/rxOpnxuqrgo3MOZufRoCIiLzrqjj6E=;
        b=r5bfD0UCkRxHFMVS/a8n11znP074d2MkCpQoobCBIY+iEAtcuoj/dYRGuzAaY3aY2u
         HkePzCbAuzKM/uJNTw/4RRTjyoS2JDPTIuP7MgLyZtF3f4ekbVuYrErAWSmUDDkXR9V4
         rT8XqN1sdv92srNj3GwB+RBBK0kiRoTJivZcqPoVO4M7Fsi6bd6oIujYfMDdgtrza1hz
         nxDG/UdVVsvvCsX4Lsfk6wJnlH7e3qy/sUPkNbIe0C4R6MXar6dnv6SbwGNYWDe2Pggk
         BDBVWWXnoZXK2pxkSeAfbHvSEBeDNc/qjCGCTEP9IPgKUWFBtxQ/E6/vNwlf6uJ7Sh7W
         HN1Q==
X-Gm-Message-State: AOAM532i9z1F7t6srJWebtpB1b3BbEOPjyxZdKQRUi2Y5NAl1dv+Gnrv
	3jLJha7bjO5/oF5qCzPe7kWKJSvtifI=
X-Google-Smtp-Source: ABdhPJzxA1BK7qoMV75C+Z+IHSzByg1i/w6J8PauJyf8q+88D6kvtICBD5XZJBvG7n+EXQ6UxyupAA==
X-Received: by 2002:a0c:f454:: with SMTP id h20mr501513qvm.40.1618443593998;
        Wed, 14 Apr 2021 16:39:53 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-176-184-52.mycingular.net. [166.176.184.52])
        by smtp.gmail.com with ESMTPSA id q28sm736010qkm.15.2021.04.14.16.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 16:39:53 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	bertrand.marquis@arm.com
Subject: [meta-virtualization][PATCH v2 3/6] xen, xen-tools: uprev git recipes after 4.15 release
Date: Wed, 14 Apr 2021 16:39:21 -0700
Message-Id: <20210414233924.55589-3-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210414233924.55589-1-christopher.w.clark@gmail.com>
References: <20210414233924.55589-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated to the branch point for 4.16 development.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 recipes-extended/xen/xen-tools_git.bb | 4 ++--
 recipes-extended/xen/xen_git.bb       | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xen/xen-tools_git.bb
index 71850ee..0188bdd 100644
--- a/recipes-extended/xen/xen-tools_git.bb
+++ b/recipes-extended/xen/xen-tools_git.bb
@@ -1,6 +1,6 @@
-SRCREV ?= "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
+SRCREV ?= "e680cc48b7184d3489873d6776f84ba1fc238ced"
 
-XEN_REL ?= "4.15"
+XEN_REL ?= "4.16"
 XEN_BRANCH ?= "master"
 
 SRC_URI = " \
diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
index 2b62c5c..eaf3956 100644
--- a/recipes-extended/xen/xen_git.bb
+++ b/recipes-extended/xen/xen_git.bb
@@ -1,6 +1,6 @@
-SRCREV ?= "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
+SRCREV ?= "e680cc48b7184d3489873d6776f84ba1fc238ced"
 
-XEN_REL ?= "4.15"
+XEN_REL ?= "4.16"
 XEN_BRANCH ?= "master"
 
 SRC_URI = " \
-- 
2.25.1

