Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B09C4332F
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 19:46:39 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.15313.1664912795624433182
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 12:46:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JzNAKeEj;
 spf=pass (domain: gmail.com, ip: 209.85.216.48,
 mailfrom: christopher.w.clark.io@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 i7-20020a17090a65c700b0020ad9666a86so2804125pjs.0
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 12:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date;
        bh=/JIounyzmv9VXV4hzB8nSK68lKZTHr/9XJcixj35/ig=;
        b=JzNAKeEjmLjemFqL/S0ZTqiv0Ur28z5JbIU+PjSpnTs59shSeoH/R4hIxErxkqo3ye
         uxDXsTyVL8hf2ngV/e7UadiMTZwg5E7/2d93+hFgddlbOrVroLptQc6QdVgky4jozp2H
         Y4JqJgfy1ftS+845U2VuKPHIOD3Y4wZXwOcyl3ftlldQ49vQKOCPazN/51pfdjp/SNh0
         bLT6ogsLgu+Ztlezi9OQ79XLs1G7yw9lDJlnd5Bv89ctucuU7gL3LGfpmS3JsXpfKhai
         2IchMkFl7mqQwD6A104uGwH1U7GCHVBIyitaEb/e/pYZHhH4DJN+XJyCKfjnTxqDqD9B
         Dvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date;
        bh=/JIounyzmv9VXV4hzB8nSK68lKZTHr/9XJcixj35/ig=;
        b=s4Plxilpsjx23LwL7VmSXs54QgVfIIRaHm4fAO62I5ZsPLvZMDPjWTv+Oo6D5Cszl5
         eOj3l1odgssEDZaHtaY3Y5x1LHhIG2q/YD7/e2znpootHJAQehiQ/lYR+NjA6aw0P4Co
         2DGWZl594FGXqB3oO8dNKBZY1kKROKCe68AB0aDu8xzldIaAeh3sTGG7cN+eXbzjdAkd
         PDCCswgKdvhQeT45eCOqoPC9PjgGKA+OV3Sc7RAYNLfJ4kMmyQFkvXJvpzO68gGGb1vm
         no9P77uWO8WcYw9c/YofU2Bu5Hl1Fa2WedfOiJoaNHibDKfUpMZ0WipT0T9BmF1GAUME
         k2LQ==
X-Gm-Message-State: ACrzQf2PdQUv3R55LYs7CxkQEf9mm6bxXPbb/pyHeX0eSa69dxG7ZIno
	9nOuEonvOxZvYsvpgwhN61mhDHWQuWI=
X-Google-Smtp-Source: 
 AMsMyM7Lrc7lIah0g0TpCNEMwWeyR5wbJcz4VsB4OBy1EhZHpMBEOtBymsaBfxRAer0joepowQz4pw==
X-Received: by 2002:a17:903:11cf:b0:178:a8f4:d511 with SMTP id
 q15-20020a17090311cf00b00178a8f4d511mr28190453plh.72.1664912794880;
        Tue, 04 Oct 2022 12:46:34 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83])
        by smtp.gmail.com with ESMTPSA id
 m6-20020a17090ab78600b0020063e7d63asm8360507pjr.30.2022.10.04.12.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 12:46:34 -0700 (PDT)
Sender: Christopher Clark <christopher.w.clark.io@gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	Bertrand.Marquis@arm.com
Subject: [meta-virtualization][PATCH 1/2] xen,
 xen-tools: Bump SRCREV of the 4.16 recipes to 4.16.2
Date: Tue,  4 Oct 2022 12:46:28 -0700
Message-Id: <20221004194629.50511-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 04 Oct 2022 19:46:39 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7638

Update to use the latest stable 4.16 release.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 recipes-extended/xen/xen-tools_4.16.bb | 4 ++--
 recipes-extended/xen/xen_4.16.bb       | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-extended/xen/xen-tools_4.16.bb b/recipes-extended/xen/xen-tools_4.16.bb
index be27cf7..2200a5a 100644
--- a/recipes-extended/xen/xen-tools_4.16.bb
+++ b/recipes-extended/xen/xen-tools_4.16.bb
@@ -1,5 +1,5 @@
-# xen 4.16.1 release sha
-SRCREV ?= "f26544492298cb82d66f9bf36e29d2f75b3133f2"
+# xen 4.16.2 release sha
+SRCREV ?= "cea5ed49bb5716698a11312a3f38bc8865cd1e67"
 
 XEN_REL ?= "4.16"
 XEN_BRANCH ?= "stable-${XEN_REL}"
diff --git a/recipes-extended/xen/xen_4.16.bb b/recipes-extended/xen/xen_4.16.bb
index de5d1e5..70e1d70 100644
--- a/recipes-extended/xen/xen_4.16.bb
+++ b/recipes-extended/xen/xen_4.16.bb
@@ -1,5 +1,5 @@
-# xen 4.16.1 release sha
-SRCREV ?= "f26544492298cb82d66f9bf36e29d2f75b3133f2"
+# xen 4.16.2 release sha
+SRCREV ?= "cea5ed49bb5716698a11312a3f38bc8865cd1e67"
 
 XEN_REL ?= "4.16"
 XEN_BRANCH ?= "stable-${XEN_REL}"
-- 
2.25.1


