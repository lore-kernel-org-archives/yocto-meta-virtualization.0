Return-Path: <troth@openavr.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8886C25B4F
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 17:04:05 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.1860.1714583044674486226
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 May 2024 10:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20230601.gappssmtp.com header.s=20230601 header.b=c6HvdZDW;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.160.47, mailfrom: troth@openavr.org)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-22fa7e4b0beso2815817fac.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 May 2024 10:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20230601.gappssmtp.com; s=20230601; t=1714583043; x=1715187843; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JitfObcskMC1MTs9jz8FkX6VEABcQC/77Za2xoIjwMk=;
        b=c6HvdZDWouH7Wf+373sD9N5ioJBfL0qI6IztiEo95A+qVGzXNSLa4BAQqEya6khwkL
         fvdknkFoW9sWdbBRROdWCT+2SssohmuzBe8VyGo+ISThH0DC10PauAEJt6yaGkpJKagn
         N9ecVTjFDmbg2ZWvGiJWc9DO1pnFL/VBcNACpsgQbKMkFBFSNR4RJfO2MWamzuwKc6Mn
         oS0OQAzuDw9nh9OkWt5CWLnp2vmXXyHVdSoXMXktIu1PKfncQguNkJvyQLRZMvzcwN/h
         PRuy3ATz5RWWn0tnXf44mirAV5c9Pod42InL8D3+85xnCENhj8rygx2HEIlgiH5QoGPw
         Os/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714583043; x=1715187843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JitfObcskMC1MTs9jz8FkX6VEABcQC/77Za2xoIjwMk=;
        b=AENdb5gBoU82Rerx0m7GoDOjkWkHesL1/0uokFWYhzL9OZYOPfS8e/L0Q038XTtPBL
         oflufpzerUTZv1v26ZLOK2dm9tGixNJtBkUW/p+1QQNIive5y6+UiDqxgeSreURG7G92
         MGz6I4rRZNOyExXGeBuEAK3vPVLCYdYDn/xF6PXLLQmxy7quYk5P+OP4bKc0OYDwI671
         ST6WmeB+Qy/DYevOIgnNTyaq24AAQlEu3kX2T9o1g2shwhI+EiMRUD5bplIW8uGRkt/X
         s5S9PV9MJa/bX1iMmbL4mrZWK20icTJnS7sJoXwd3js/Bfbl0VP3tml5PRcXLcyLOJP7
         9EZA==
X-Gm-Message-State: AOJu0Yy7yE8zCUWjQkEif80u1nMj0ipBJ1O0iaYSOCXH5ZU3uYIjxAz0
	Ut40SAmH5ASp61YndHCbL/mn5HGZG2twqERiBWhRxDVrUuuBv99E/DP6Mu5F6FoMI1ewI0Z2gKG
	XURFsQg==
X-Google-Smtp-Source: AGHT+IGXW3NmRIdZ0mE6CHa4/B2LYDtKu3wwof/cDUo+AQwfSXRyA3AWawjgYSUs/Qc8m+5ZMRHxjA==
X-Received: by 2002:a05:6870:ac12:b0:22a:1cd5:dc5 with SMTP id kw18-20020a056870ac1200b0022a1cd50dc5mr3344840oab.20.1714583043026;
        Wed, 01 May 2024 10:04:03 -0700 (PDT)
Received: from tas-troth.am.trimblecorp.net ([155.63.136.49])
        by smtp.gmail.com with ESMTPSA id cy9-20020a056830698900b006ee17b2ee0csm1525300otb.70.2024.05.01.10.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 10:04:02 -0700 (PDT)
From: "Theodore A. Roth" <troth@openavr.org>
X-Google-Original-From: "Theodore A. Roth" <theodore_roth@trimble.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	"Theodore A. Roth" <troth@openavr.org>,
	"Theodore A . Roth" <theodore_roth@trimble.com>
Subject: [master][scarthgap][meta-virtualization][PATCH] podman: Fix missing brace in FILES
Date: Wed,  1 May 2024 11:03:43 -0600
Message-Id: <20240501170343.1036664-1-theodore_roth@trimble.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 01 May 2024 17:04:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8709

From: "Theodore A. Roth" <troth@openavr.org>

When converting to use {systemd_user_unitdir}, the closing brace was
omitted

Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
Signed-off-by: Theodore A. Roth <troth@openavr.org>
---
 recipes-containers/podman/podman_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index f69dec16..32de3f0c 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -134,7 +134,7 @@ do_install_ptest () {
 FILES:${PN} += " \
     ${systemd_unitdir}/system/* \
     ${nonarch_libdir}/systemd/* \
-    ${systemd_user_unitdir/* \
+    ${systemd_user_unitdir}/* \
     ${nonarch_libdir}/tmpfiles.d/* \
     ${datadir}/user-tmpfiles.d/* \
     ${sysconfdir}/cni \
-- 
2.34.1


