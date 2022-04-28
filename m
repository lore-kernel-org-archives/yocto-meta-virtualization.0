Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C1BC433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 00:06:21 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web09.4082.1651104379242811601
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 17:06:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ciT/voSH;
 spf=pass (domain: gmail.com, ip: 209.85.216.48,
 mailfrom: christopher.w.clark.io@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id p6so2820154pjm.1
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 17:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+EXYSBfEUhGhOX3BBtdYmACO3pBMANfxQ6Msq/e+Vlc=;
        b=ciT/voSHxunPRAsZ4Eh2/oesg0GTVgsc/cZkYjgZN5md2/WK1aZ6ESF1TTlA5oju6N
         q/hxpsHqAAygJHktY4WbQ1vYdo4XV0+agKoiRSj9ibCFX4q+6lcmVtqgrSSo81YGy3lq
         xFcF8M5Z2pI3RHpfn4PqBeeNpGfY/tKBUpze8/sqTKcKahJU+hITU8pjnXG7SXzFS6ht
         pzai1exkauuOdGJdPQtaNfvS5UlLeqBUYDtiYKlklKC4eCTdaLKoHKUJ6nAicjM4dUCY
         67NjL8ORLRk/CZIpCzA/PyCFB1BNEFt6r1PXDM/SmHEZ801HQZDcWwHNMro3jvRRhy8T
         VM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=+EXYSBfEUhGhOX3BBtdYmACO3pBMANfxQ6Msq/e+Vlc=;
        b=7kyqEdilsQLzG0nMx5QbrjX1i+ZFXTBAg8W6ait5oF9nl56/W0yF2jTT9tvSSIzhkX
         FlVrculhL2WhCOS/u+XdW6c6EsA0mUf/b/rsAACTYtESrQ8IMyTFlu1IRAsLr1qUCjMx
         6pr27HRs7RoaqQF6fJ5dgmP18elb6rOlgUlGyna3t4qry1dqAtxzjGRxJmK+H7AuauSt
         QIEaJvOtbq9sVFB6FqDUacKNZRYGUsiT1cAc45+wCj/1pDbVVwgHLNJtnNo2OAvB36mW
         zL1wZMc9Qd9qA3f8Pk+lMYJpaO1OBvL8hE4FJBWPANd7LPy9VZQ5/jjpbdjfyYkjw5K2
         G8+Q==
X-Gm-Message-State: AOAM533GCkK7NbehYsr2yODEsGRSNJBdBSzdKOG6ikic8zImdND2Amvj
	/LUsvDb9y2xoFVvadh6JHwR5Q8PvKR4ATA==
X-Google-Smtp-Source: 
 ABdhPJxkJ9OzLMgAaM/AvuRpUaVChAt6QcBcQuWdJZ+Zh3ZAIoWOax3LEx1ykuEi2WcDypOpqsROrQ==
X-Received: by 2002:a17:902:ef45:b0:156:1858:71fc with SMTP id
 e5-20020a170902ef4500b00156185871fcmr30857382plx.23.1651104378451;
        Wed, 27 Apr 2022 17:06:18 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83])
        by smtp.gmail.com with ESMTPSA id
 h8-20020a17090a3d0800b001cd4989ff4asm4268239pjc.17.2022.04.27.17.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 17:06:18 -0700 (PDT)
Sender: Christopher Clark <christopher.w.clark.io@gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@cardoe.com,
	dpsmith@apertussolutions.com,
	scott.davis@starlab.io,
	Diego.Sueiro@arm.com,
	jdmason@kudzu.us
Subject: [meta-virtualization][PATCH v2 0/3] Xen: improve Qemu integration
Date: Wed, 27 Apr 2022 17:06:06 -0700
Message-Id: <20220428000609.26814-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 28 Apr 2022 00:06:21 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7225

A series of improvements to Qemu integration with the Xen recipes:

- update the Qemu package dependency for the x86 Xen tools
- add support for testing Arm 32-bit images with Qemu and testimage
- configure a standard Xen bridged network xenbr0 for Xen images in qemu
  to improve support for configuring guest virtual machine networking

v2 coalesces these patches into a series and addresses feedback on v1

Christopher Clark (3):
  xen, xen-tools: add recommendation for Qemu for non-hvm x86
  qemuboot, xen-image-minimal: enable runqemu for qemuarm Xen images
  xen images, qemuboot: configure xenbr0 bridge for runqemu, testimage

 classes/qemuboot-testimage-network.bbclass   |  36 +++++-
 classes/qemuboot-xen-defaults.bbclass        |  26 +++-
 classes/qemuboot-xen-u-boot.bbclass          | 128 +++++++++++++++++++
 conf/distro/include/meta-virt-xen.inc        |   1 +
 recipes-extended/images/xen-image-minimal.bb |   8 +-
 recipes-extended/xen/xen-tools.inc           |   9 +-
 recipes-extended/xen/xen.inc                 |   6 +-
 7 files changed, 197 insertions(+), 17 deletions(-)
 create mode 100644 classes/qemuboot-xen-u-boot.bbclass

-- 
2.25.1


