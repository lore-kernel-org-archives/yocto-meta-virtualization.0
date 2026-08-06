Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E8DC55ABF
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 14:19:18 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20940.1786025950206666665
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 06 Aug 2026 07:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MyybBA/4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47fde295992so868557f8f.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Aug 2026 07:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786025948; x=1786630748; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ikkkRSNcINUfX0K6iOTJBOJ/dJWH+hYaKfZxgNAE5Qk=;
        b=MyybBA/4wj0LakECjfOjG3UbOQ9zlCCK+aVgr2x3TbSsUNDlhTDsZysakW2ZNUpsa7
         P1v2hG14yyG5+yfxofh/o15xaVNlVZMXyw3Th5H26U/ujruBao43j7+j1QZ657pnBakG
         JFaa6aVY3gpDoQNW6tFNeqOjkBYc6wI6gDJQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786025948; x=1786630748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ikkkRSNcINUfX0K6iOTJBOJ/dJWH+hYaKfZxgNAE5Qk=;
        b=kB0qB62jTvPtzcyzFyAiK18R9mdW6yHwXT1eUj57L+yTzOUj/RuKtyIvwDF/8NdsHc
         DbJf+V7dpBXz9KiiCrPuVM5nhkV1Cna/HVP6X0seE11vDfoSiKHlthDVWzvyvnorkWtp
         DyZKSDB51QEbqkSK4udXOY/JL4bpXMOTVg1JJJpw4sC48BZfJOT76wgiu3oejsIgdcZ2
         8VjO0TOBU5MZPIbKVmZzVCh0At5m77sE/pXIxrGcxwPPflhcAC1OTlQWgJZ53d9AlI54
         auFs63fktcce0i4rHwD4lWABzBOOMQJ2is4ukWlCPFJB0oQI4KEoX+627efKiOQHhCSW
         QIMQ==
X-Gm-Message-State: AOJu0Yy/H05JmIMptq228J9VGiOkeVs+FDmjU/McdSGKJmvtlKyU+5En
	CDWE4tg/lqCM3ay8D/UIqqnrHvdp8JLYo18lUk6cdyZlM7moX7Bmf0dUMmK3cKNizIKZ5aqr8UD
	bS2Xe4ts=
X-Gm-Gg: AR+sD10n6QTTuI+teIo9xy/Anu9TBUpkEqGQHL56tJI7Ip1QMvul/vLE4GOZp2g3WI8
	o0GdtH5DDt2qCzGrox/0i1YKwTJLu/pbnx/np46C6OG622xNQhQlkTQ9EZRRvmZi5PqrulZ8aQP
	1e8o0mvEMfaj3RmFfYJwr0ZFnVkNaho+sGYNjyV9YV5P5qnyt7Zk3UQeIFpaXlManzRk0oQUagO
	dRQM2wJN0zewKZgsmv8q2KaViDMeiHKGgkTKNRKaju/+O/JZDVSdCSi56bbb+YCmCNzsoeSAYy8
	bZJd9NDaZY4tcbeb6JqBez33f8sLcest9oshZW8bF2Cbqz88ibcGnd4oT0mcADFR6IKIX3A8HsY
	LFDUuw4pFXbfnjsfZ8jx58G8GW08/q0yJ5D9MiPAbLG6AgylmAfIAHxowcmNUfygzdgRjffaQd/
	63eZd0d0B9nSfLhIoLLChYqbYvg4oXu73leiqnSycNhAlYdBmYlrKHseX67P8QKrGEZ8jfiHmCK
	9bMElAeephzwxNXGg==
X-Received: by 2002:a05:6000:41ea:b0:47f:90f1:68c8 with SMTP id ffacd0b85a97d-47ff4ba89fcmr11806399f8f.1.1786025947833;
        Thu, 06 Aug 2026 07:19:07 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9366:921d:f7c4:9ad6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b285b1sm7681361f8f.31.2026.08.06.07.19.06
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 07:19:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization] [PATCH] qemuboot-xen-dtb: Fix task dependency
Date: Thu,  6 Aug 2026 15:19:06 +0100
Message-ID: <20260806141906.2309877-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Aug 2026 14:19:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10031

qemuboot in OE-Core had a bug fixed here:
https://git.openembedded.org/openembedded-core/commit/?id=8e2a45871962c9e44b2ae04dc1f09ee8d634170f
where it was running before IMGDEPLOYDIR was cleaned and hence the files
were getting lost. It was moved to run between do_image and do_image_complete
which is the correct place to run things touching IMGDEPLOYDIR.

This code also touches IMGDEPLOYDIR so it needs to run before do_image_complete
for the same reasons. This fixes a build failure after the above merged:

"""
These are usually caused by circular dependencies and any circular dependency chains found will be printed below. Increase the debug level to see a list of unbuildable tasks.

Identifying dependency loops (this may take a short while)...

ERROR:
Dependency loop #1 found:
  Task /srv/pokybuild/yocto-worker/meta-virt/build/meta-virtualization/recipes-extended/images/xen-image-minimal.bb:do_image (dependent Tasks ['xen-image-minimal.bb:do_create_rootfs_spdx', 'xen-image-minimal.bb:do_image_qa', 'xen-image-minimal.bb:do_flush_pseudodb', 'xen-image-minimal.bb:do_write_xen_qemuboot_dtb', 'xen-image-minimal.bb:do_rootfs'])
  Task /srv/pokybuild/yocto-worker/meta-virt/build/meta-virtualization/recipes-extended/images/xen-image-minimal.bb:do_write_qemuboot_conf (dependent Tasks ['xen-image-minimal.bb:do_image', 'linux-yocto_6.18.bb:do_deploy'])
  Task /srv/pokybuild/yocto-worker/meta-virt/build/meta-virtualization/recipes-extended/images/xen-image-minimal.bb:do_write_xen_qemuboot_dtb (dependent Tasks ['xen-image-minimal.bb:do_write_qemuboot_conf'])
"""

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 classes/qemuboot-xen-dtb.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/qemuboot-xen-dtb.bbclass b/classes/qemuboot-xen-dtb.bbclass
index d43d23a3..c2a7f013 100644
--- a/classes/qemuboot-xen-dtb.bbclass
+++ b/classes/qemuboot-xen-dtb.bbclass
@@ -182,7 +182,7 @@ do_write_xen_qemuboot_dtb() {
     fi
 }
 
-addtask do_write_xen_qemuboot_dtb after do_write_qemuboot_conf before do_image
+addtask do_write_xen_qemuboot_dtb after do_write_qemuboot_conf before do_image_complete
 # Task dependency:
 # An expected common case is that the kernel for at least one of the initial
 # domains (eg. dom0) is deployed from the virtual/kernel recipe, so

