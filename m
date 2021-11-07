Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web08.33997.1636306650022719322
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 07 Nov 2021 09:37:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I/Gz//JI;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id o8so53166496edc.3
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 07 Nov 2021 09:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=INN1VPOwBlKebkM0F4grMDhONJqPeaISxfKnvn9qwpM=;
        b=I/Gz//JIPFusn5WzL9H0eE8Jr/7DLis7qGKidta46CuaFE9XMZgTz4jJAuFxU4R7/f
         cPi4rJbFvQblBIkVn41coO3OD+eyJas4BdhvyhW1+uc1idJycx+7NvVZLJc4VztYldrD
         aNol8VA4VHyWwaouQ54DznSXTxAZQhqjdsYVLDn/OC9a77d4jFPbhHjPDZx3r/TYmnbe
         vW09lSANiE48h+u6TwbBl6XLEveYScze20zdbFl1hfTzbtBkIpwr8PhEZdOhF55QUId2
         oujCUYNITMBYtuU1P8l5y4KWxCqbOlVp8EWaHM8S9z7XWopkH3CWT4UHAdtOUcfGAsyz
         m4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=INN1VPOwBlKebkM0F4grMDhONJqPeaISxfKnvn9qwpM=;
        b=lRbm1ffPXdORq+i1Nw0lSQj2KuV005F+K2CX5IVMmUr9sRxkUDg1K8S3pO4Zw6SjNt
         zyZgaNfvIXItPjiOVtAiFvQ0HiX1tbbePskhIeVKLs3XI3SKAR/LRBKiJajewBQn4cm2
         wI+rlUDwAjc/ONNY5/s/jppursjFriJceAQryG5x1BFtvWrYEb5a8SM0E/1u9yuaictW
         m4lk998DlYg5fANijfPsiY/jTE+/jUvl0FaMZHGF9UD9Mp1c0xAS07wsysu49HWEiZ+f
         jvwtU78AyO4dAecabcZYOHuRQAtG7L87GlPSoWKTQrSpKZZK8KEllPVsa8Z5djA605kb
         KolA==
X-Gm-Message-State: AOAM530EfqY1obKOE873No83C2hLoufCPkfaf397kwyAmR8Kb7mCqCrJ
	KGZKnzN71WAYzbcOXHN4ksaTIeI5ZkM=
X-Google-Smtp-Source: ABdhPJzRZKSSJXMBzOvBscrhYf4+8YBm9CHlUCRFMiKBsTyCyJfReko83TDgKrd75gVR4sEp9M07rg==
X-Received: by 2002:a17:906:c248:: with SMTP id bl8mr87277477ejb.360.1636306648288;
        Sun, 07 Nov 2021 09:37:28 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id cz7sm7907685edb.55.2021.11.07.09.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 09:37:27 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH 1/2] irqbalance: bump SRCREV to latest
Date: Sun,  7 Nov 2021 18:37:22 +0100
Message-Id: <20211107173723.700787-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* remove the incorrect comment about SRCREV being 1.7.0
* and add +git because the old SRCREV wasn't matching
  with 1.8.0 tag as well

* add -Wno-error=format-security to work around build failures with newer ncurses-6.3 like:
  | ../git/ui/ui.c:45:32: error: format not a string literal and no format arguments [-Werror=format-security]
  |    45 |         mvprintw(LINES - 1, 0, footer);
  |       |                                ^~~~~~

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-extended/irqbalance/irqbalance_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-extended/irqbalance/irqbalance_git.bb b/recipes-extended/irqbalance/irqbalance_git.bb
index 0911201..5761185 100644
--- a/recipes-extended/irqbalance/irqbalance_git.bb
+++ b/recipes-extended/irqbalance/irqbalance_git.bb
@@ -4,10 +4,8 @@
 
 require irqbalance.inc
 
-# commit tagged as version 1.7.0
-#
-SRCREV = "bd5aaf5a8613c8eadfbf9f0908fd8260125aae28"
-PV = "1.8.0"
+SRCREV = "a97266548398870c2dde034e48a8c9e3c1893acb"
+PV = "1.8.0+git${SRCPV}"
 
 SRC_URI = "git://github.com/Irqbalance/irqbalance;branch=master;protocol=https \
            file://add-initscript.patch \
@@ -16,3 +14,5 @@ SRC_URI = "git://github.com/Irqbalance/irqbalance;branch=master;protocol=https \
           "
 
 S = "${WORKDIR}/git"
+
+CFLAGS += "-Wno-error=format-security"
-- 
2.32.0

