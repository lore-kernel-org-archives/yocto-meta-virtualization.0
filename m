Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web12.12721.1617346973118176499
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 02 Apr 2021 00:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PP+/fFlU;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id u9so6204718ejj.7
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 02 Apr 2021 00:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7b/IHAqcD1seIg5S2UASwkx1ri3rdbU69v3Zt5nMFlE=;
        b=PP+/fFlUlEsxYdevjJJABxu4fkdjAgVeymJR9tzNPJfv8nZHH/mABKamTP5YgtyoLu
         Dgu2yY7xe4FzISApbTAH0Rb+Ekl5+/Huy3ip2HcLskRPjxFH7AE/eG5QdTmsTaHivoEl
         Nclg/G/zFY+h4UaZIaE3L6mjXAaeElYsRQLYd0OU+HIl35moRRM1mHU4DGpqV8mnqlCl
         BpakerFutxFQo/JmJJHs1PiCCKgWU0qKI7Qy/3unTFbr36/yfUMg6yEuTbNYqrtVvHFd
         x+Ybzjj0Lu9+6LdW8/oFc/Mi5thEys/hwhgO7pKfIhhEyu3wX0IwjliK+dcITXu7SN8X
         E8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7b/IHAqcD1seIg5S2UASwkx1ri3rdbU69v3Zt5nMFlE=;
        b=cTIvM9PgC267YSiNJO2Ou3F/Q1xRS+ckxKNBY2QP2uI0IixpNI3xC3FHAmjwc/qcXk
         hYyMwT7xg9KyUVfnOYW+RDAHEPIjx5p6FxFTQuO2ifuwaRfQiYmAPLgEY5d+vYKBQNEa
         1G8QI/pbNoei8G1v09UdoKaK60iYj7acjhWuieBxwxaMYKqE2JXXdq59Ly5VDfyTnvRh
         SRJ3YcX/63TkSSNNCRvUrChx+nhl2lGT5GD5Jz6G7gZL5pMAbePnRuL5adh7VJi0GLO0
         gsz1t5NI91ITJIv7diLKLaRBGvd7TDrXJVYI1F9o+FeqYCAeNZAfYpHP5lkef3gwRbVT
         SWRg==
X-Gm-Message-State: AOAM532G21YSP5RDDjY1fsVTd73iJzZDr8QqeX4iWaZqCQxKu8WTgBmz
	wH2476Vh3c/E237DHyhd8dcX31yKiFo=
X-Google-Smtp-Source: ABdhPJxe1UBM3b25VpQ+pk3a11d6B6Lz8ZzoJzmVRAHbDOmVX4dENXYioiuTzrNtgsIR5x7T68+PaQ==
X-Received: by 2002:a17:907:216a:: with SMTP id rl10mr12853522ejb.365.1617346971704;
        Fri, 02 Apr 2021 00:02:51 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id dx16sm225894ejb.89.2021.04.02.00.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 00:02:51 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH 2/2] packagegroup-container: skip without meta-security because of podman
Date: Fri,  2 Apr 2021 09:02:44 +0200
Message-Id: <20210402070244.2321014-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210402070244.2321014-1-Martin.Jansa@gmail.com>
References: <20210402070244.2321014-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* copy the skip from podman recipe, because this packagegroup
  depends on podman

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-core/packagegroups/packagegroup-container.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recipes-core/packagegroups/packagegroup-container.bb
index d425ac5..b3b0d4c 100644
--- a/recipes-core/packagegroups/packagegroup-container.bb
+++ b/recipes-core/packagegroups/packagegroup-container.bb
@@ -44,3 +44,12 @@ RDEPENDS_packagegroup-containerd = " \
     virtual/containerd \
 "
 
+python __anonymous() {
+    msg = ""
+    # ERROR: Nothing PROVIDES 'libseccomp' (but meta-virtualization/recipes-containers/podman/ DEPENDS on or otherwise requires it).
+    # ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
+    # Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'podman', 'libseccomp']
+    if 'security' not in d.getVar('BBFILE_COLLECTIONS').split():
+        msg += "Make sure meta-security should be present as it provides 'libseccomp'"
+        raise bb.parse.SkipRecipe(msg)
+}
-- 
2.30.2

