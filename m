Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6409CCD6E53
	for <webhook@archiver.kernel.org>; Sat, 30 May 2026 01:31:53 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2372.1780104711740171824
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 May 2026 18:31:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Eko/02Kw;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bf114b0cf9so13275635ad.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 29 May 2026 18:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780104711; x=1780709511; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kXJheJGHLHVq3q1E7ISqy5l8Cnq70zTR45wgbjluxjo=;
        b=Eko/02KwqpL6ZWQzYrKcOsjlVBW6ROeuO1aZfHQJmP1nTg/pKGt8KKq36kL3BWLmtH
         c0bU4xt5WoWFYL2KHFJiMspj8N+QxcNW7bcwrlv8pdMiAbb6KgDBvEZtVgjgqlcPWH0e
         LfTRHy6C1hmRJ4lcdQaA8RIyGEAuNI4OVV6RBRP6MUSPAu2BiDS9E5u8dOLZFw0Pn5hr
         bFcTngmBWY2MSJ6y3AIPq9hV+kb2HrU5ciZgD+cOZLmEG91kZySdgi/TP+pBVxOaGgdB
         YvasFL7LB3mG9RSL9dJKCXthbCQgJ8e7IVLiK+LnbJIUPYgnxPHwrTYGRS6Owguro19V
         j82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780104711; x=1780709511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kXJheJGHLHVq3q1E7ISqy5l8Cnq70zTR45wgbjluxjo=;
        b=L3qtp/tT59J2OsIW5G7nIE5raC8zo4fgfMkL8YMdVtQqZZZxTym6en0ADm4Wpyxojo
         0M12/SOL7AYzwq/vATWju/XmJLg4e3y4KMe4ciI+vGtD6tKPDgSZ5AMFVAGbGc9exKts
         pYipb8ArELwcMqZ1Pzl+btjbkbtm8l5k8iN1zcuh/eJ28WbqFTRKc3pZ0ChGXSq7g+U4
         gt1sNmstWsLJo+cljYxi8uCPOi8aAEqQ9Jg1aqxCadyUnoswu52VtEYcSEPfaJdioPUX
         BgmUtJPmWs0LSZ0gQhCWA/TGUqjBL7s6KBw369cjuacSs4lhsv7ktfdhcwf5iVQwFK10
         2EOw==
X-Gm-Message-State: AOJu0YzKBtXNtENAcJ98gjtY5wE5S273AyAIZrS27kOOWpwKh1X+EsCr
	B5p4BQ5dps2/Q3SS91uY0CkQqEol6beJYOZ1ANX5gcwkfBHoyX2WN9h5Q180QQ==
X-Gm-Gg: Acq92OFQEquj0mox7BiXPj/PaEPsmpm4rFIrburieiZ09Yq+/W/3Aio6x1Z0oIeFaK8
	nP0hwyre96R9Y+X/nXIvenJ9KzyueUwiAV1YfzyW0fgNI5Fh7gHz/QuS8as7PJIx3vS1/SIvmPQ
	S1xGr6QZXJp67Oia5CkJwB4Mm1BlyKXnlFpLYGwVe114NP1zIVRp0nMBPOlmqFMOBYUZu9NG1ni
	siK761G06f1lIEib3EcaYv/wU+uDNIA2u5R3o9ZGzYh04WaeIyPx0F1Kfg/coJhqilSwPdxdWaj
	Y3Wph2SERYnirsw5bMqcLGga+JBmjkfL6FIZ71R4NTyUoPjOrlTokiqV0/9herEWYdlRECwbVT2
	5RLUrVuPbZ7/C4C444Axj+XS8h2YP1Uw1xcvSXXmKDayYRH2gp/kxdE3NQ+npjDXGESdhewbRYT
	2Y2XTSIwiPq9jdWsOTlS6hBAyOhJRHpZV+iLURbCf9erTZikiALus4nCK5YMPWb3tS6iF2++O/u
	9NI6hCjUpwTTWSXLw80roxxmG1IEICYDQ==
X-Received: by 2002:a17:903:3510:b0:2b4:61cc:37a8 with SMTP id d9443c01a7336-2bf367cf5f4mr27803655ad.17.1780104711097;
        Fri, 29 May 2026 18:31:51 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a2dbfbsm33798765ad.37.2026.05.29.18.31.48
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 29 May 2026 18:31:48 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 6/7] vcontainer-bbmask.inc: allow meta-webserver/recipes-httpd
Date: Fri, 29 May 2026 18:31:07 -0700
Message-ID: <9bdb3d78518c4c8a8247376aec613b23e4628bdd.1780104071.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1780104071.git.tim.orling@konsulko.com>
References: <cover.1780104071.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 30 May 2026 01:31:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9832

Allow us to build nginx, apache2, etc. multiarch containers.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 conf/distro/include/vcontainer-bbmask.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/distro/include/vcontainer-bbmask.inc b/conf/distro/include/vcontainer-bbmask.inc
index ac74464f..077255cb 100644
--- a/conf/distro/include/vcontainer-bbmask.inc
+++ b/conf/distro/include/vcontainer-bbmask.inc
@@ -93,6 +93,7 @@ BBMASK += "meta-networking/recipes-(?!filter|support)"
 BBMASK += "meta-openstack/recipes-dbs/postgresql/"
 BBMASK += "meta-oe/dynamic-layers/networking-layer/recipes-core/"
 BBMASK += "meta-openstack/recipes-extended/libvirt/"
+BBMASK += "meta-webserver/recipes-(?!httpd)"
 
 # ---------------------------------------------------------------------------
 # Entire layers with 0 recipes in the container image dependency graph.
@@ -101,7 +102,6 @@ BBMASK += "meta-openstack/recipes-extended/libvirt/"
 # ---------------------------------------------------------------------------
 BBMASK += "meta-filesystems/"
 BBMASK += "meta-python/"
-BBMASK += "meta-webserver/"
 # Warning suppression for these fully-masked layers is in meta-virt-host.conf
 # (BBFILE_PATTERN_IGNORE_EMPTY) because BitBake checks the base datastore,
 # not per-multiconfig datastores.
-- 
2.54.0


