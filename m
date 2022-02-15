Return-Path: <kasper@krinvent.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A65BC433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Feb 2022 14:31:38 +0000 (UTC)
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by mx.groups.io with SMTP id smtpd.web10.10042.1644935494765179976
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 15 Feb 2022 06:31:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@krinvent.dk header.s=rsa2 header.b=lopByZKa;
 spf=none, err=permanent DNS error (domain: krinvent.dk, ip: 46.30.210.185,
 mailfrom: kasper@krinvent.dk)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=krinvent.dk; s=rsa2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=KWpKppLnVUgivjgksrwhBA679emBEAi5+maXCEdmJkI=;
	b=lopByZKavZvq4y3HU6QaW/7no0nDNCp5pJ/mJCqXhMBpN/0ssIta/feUiNf2AbDSaX+BmhxNEvn8h
	 p0dJW9YZdmfTrtfvIeh25HjKZF48PAswNsfdv5UrU5+/v5BHrjX2U7JFTQrYygasFLpNlqF2wESKV9
	 21t1b6bba6KPoPnGvO0oK/Ak0YnHu2iH7XMrQa+dMqSR3tHjVCyLevuTkynezuEAgN/c8zCvwYzzxT
	 XYTohJ8Qkpc3SoHYViAJlXGesmMFBPOy/jaRhpuiFENZfN1QVdgTVzDzshGucOtmguxOc7/x7Cfkrc
	 iRdIXnJOxAZm42XWEyg9osHxiDDG9NQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=krinvent.dk; s=ed2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=KWpKppLnVUgivjgksrwhBA679emBEAi5+maXCEdmJkI=;
	b=LUF2QlNb7Bl2fcSRFVu3OfwXvaJVBcBvTM5uhX1kFcP3njjYFK8cPbWLCLdxaJ5hpo1EeZRW3C3B1
	 s4toJEzCg==
X-HalOne-Cookie: 1d320627d9dfbdf5072b5c803c01bc8067f9fde7
X-HalOne-ID: f785d069-8e6b-11ec-b097-d0431ea8bb10
Received: from ubuntu.localdomain (unknown [87.104.84.103])
	by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id f785d069-8e6b-11ec-b097-d0431ea8bb10;
	Tue, 15 Feb 2022 14:31:30 +0000 (UTC)
From: kasper@krinvent.dk
To: meta-virtualization@lists.yoctoproject.org,
	mail@krevsbech.dk
Cc: Kasper Revsbech <kasper.revsbech.ext@siemensgamesa.com>
Subject: [PATCH] xvisor: Remove bb.error when builing for non-supported arch
Date: Tue, 15 Feb 2022 15:31:23 +0100
Message-Id: <20220215143123.56913-1-kasper@krinvent.dk>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 15 Feb 2022 14:31:38 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7060

From: Kasper Revsbech <kasper.revsbech.ext@siemensgamesa.com>

Change bb.error to bb.note when getting config and arch of target/host
as it is not an error if arch is not supported that should flag when
parsing the recipe.
It is an error if trying to include in image and that is already handled
in COMPATIBLE_HOST

Signed-off-by: Kasper Revsbech <kasper.revsbech.ext@siemensgamesa.com>
---
 recipes-extended/xvisor/xvisor-configs.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/xvisor/xvisor-configs.inc b/recipes-extended/xvisor/xvisor-configs.inc
index f53bba2..cd873cb 100644
--- a/recipes-extended/xvisor/xvisor-configs.inc
+++ b/recipes-extended/xvisor/xvisor-configs.inc
@@ -9,7 +9,7 @@ def get_oemake_config(a, d):
     elif re.match('riscv32(eb|)$', a):        return 'generic-32b-defconfig'
     elif re.match('riscv64(eb|)$', a):        return 'generic-64b-defconfig'
     else:
-        bb.error("cannot map '%s' to a Xvisor defconfig" % a)
+        bb.note("cannot map '%s' to a Xvisor defconfig" % a)
 
 def map_xvisor_arch(a, d):
     import re
@@ -22,4 +22,4 @@ def map_xvisor_arch(a, d):
     elif re.match('aarch64_be_ilp32$', a):      return 'arm'
     elif re.match('riscv(32|64|)(eb|)$', a):    return 'riscv'
     else:
-        bb.error("cannot map '%s' to a Xvisor architecture" % a)
+        bb.note("cannot map '%s' to a Xvisor architecture" % a)
-- 
2.32.0


