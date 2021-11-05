Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.6735.1636124325811890455
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 05 Nov 2021 07:58:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U5rowp0+;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id i5so14207855wrb.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 05 Nov 2021 07:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f850WtSU1tT9VURexGQSkaN+D4nh51RsnZFyeFz+rEY=;
        b=U5rowp0+ek1FZ60kWBdULUlMAF0K1COCsXMolKu5aDvyBSBWpjDkdzalt+ZFM/Epxg
         734kKsaWhjVw4WOEmqq0Gkht8FKkDqZgHLsz6prlPC1rbkcqkFPys9fGAzj9l1rdxSxv
         NNKgx69OyF9MFsAqfz/tfXevA4wU9+f05HKfaeAgxtCyCTY7NW1y3HfF9ZGTXn4V+DTK
         fIM8LERgw1vTMpCkEiTQRscTDeLlBgqhZ3ybGfK8oJhAg/rGw8vEwvsKOi+31mXo61Bn
         V29nNqAoH0mFAGguv88NUGoPtii8OgigA3PpGzoqSuxl3XD4SnCvZlXywwg0Ix6tpQ7f
         9Bww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f850WtSU1tT9VURexGQSkaN+D4nh51RsnZFyeFz+rEY=;
        b=kKZ6Pf/x/JkdxqOXeQaErDHJ9hBUxLN5iRLqLU0K+7h5yvJ3FLsqRKPlsgHn8/5jkE
         IBq/ylkrIjX3Gs6PO6BNsLQPEiGG4QHu0GfXy9ozkp0q5q34WAQ5LnrKukV3rHka87zT
         pHoRzo8QD/00vuwH0hULoghqTL+t+PsgFMBTKWYDrxbL2ud/WF4IwYp7o5mhJJ8xO84L
         uLX0GLZ7wiIkBOQJHpbsRojIE9QHt/1DMF0j36Onv1HaOVi7ALqnWHcLDPt9ElGg1Lvd
         bdx2kL9to1PfXxOMBJQYERctrUnvCJp7rzJZRsSAvib+nKi0Qr9LCYrxzVMeiRPuPMXx
         Lvyw==
X-Gm-Message-State: AOAM533R7Y9UGeIhE6hHqt6ItDLnIVplgw2CbzVRIJ+GI4QGVCvonUK4
	9r4Li+Q54utbKZl05AoyPhznZjIZ3dg=
X-Google-Smtp-Source: ABdhPJw2gNUQVduOnWem1EQ6oLWjHIZr72iSbLJq9BoEM/wDMtVbK3NynSCl0T1E8eX+EyqR+cmE+Q==
X-Received: by 2002:a5d:6a4d:: with SMTP id t13mr45214399wrw.104.1636124324489;
        Fri, 05 Nov 2021 07:58:44 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id w17sm8425522wrp.79.2021.11.05.07.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 07:58:44 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH 2/2] linux-yocto_virtualization.inc: remove :append and += combination
Date: Fri,  5 Nov 2021 15:58:40 +0100
Message-Id: <20211105145840.1721877-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211105145840.1721877-1-Martin.Jansa@gmail.com>
References: <20211105145840.1721877-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* fixes:
  KERNEL_FEATURES:append += is not a recommended operator combination, please replace it.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-kernel/linux/linux-yocto_virtualization.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc b/recipes-kernel/linux/linux-yocto_virtualization.inc
index a27ae7d..84a7bd8 100644
--- a/recipes-kernel/linux/linux-yocto_virtualization.inc
+++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
@@ -13,7 +13,7 @@ KERNEL_MODULE_AUTOLOAD += "nf_conntrack_ipv6 openvswitch"
 KERNEL_MODULE_AUTOLOAD += "${@bb.utils.contains('DISTRO_FEATURES', 'kvm', 'kvm', '', d)}"
 
 # aufs kernel support required for xen-image-minimal
-KERNEL_FEATURES:append += "${@bb.utils.contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
+KERNEL_FEATURES:append = "${@bb.utils.contains('DISTRO_FEATURES', 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
 
 # if the kernel-yocto meta-data routine automatically starts to add the
 # recipe-sysroot-native, we can do away with this conditional, since all
-- 
2.32.0

