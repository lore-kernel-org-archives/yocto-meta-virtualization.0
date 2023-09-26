Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49312E7E63F
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 14:26:24 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.20275.1695738380821361992
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 Sep 2023 07:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B9h/Mpkj;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-99c93638322so1988755266b.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 26 Sep 2023 07:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695738379; x=1696343179; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u/zS9DnPeCZPtnNSPTUbtDyWWM4m4dzCG383U771EGw=;
        b=B9h/MpkjnxepWIB8zsU4j9AwiNXDbkUQlgE30EozFZw2Rp5PcJfUrOhb8QnAD6JDoy
         QAJdKcvVPoi5u3sZLYzsype3XYR0HHkyYR5zWwItywbggfyHXeh1l8Sq2vB/zy4WE106
         riA5oG34mLdYl9VBSiaERi0sOEw4+QMXauk+g6R4t5ZwX4yvKuSeMNuh2yomsdkkuaUL
         HjzbFRvVqu+kWkcqxkI3arjrTutJaITj8m1soqpT9qY3e9HzXIKX+NWrYPQIEP5jVO39
         sPQicFgySkw1oBeEWdATXS2iB6UDRlWYOFDJ11cSQs/2RcauSFwl9rNXFBe/R3grtq/g
         qW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695738379; x=1696343179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/zS9DnPeCZPtnNSPTUbtDyWWM4m4dzCG383U771EGw=;
        b=HhwsxOhqrvlboFjY9/Tx0UDXXDboYwc0Ah9lmRzegmoGBzO3yUueHXMKHvlfx1VFwH
         9l3wZJxzisbcoKt1oTDsLwYVbvyrVS24oKFD/O7grGAmSyJC0aaUfqJGxNyy8JQrjjL0
         4uhZSL7r4JrmuiMBiB1jjW35MH3eZGrYdT7uIOLR6u1/3El5EOnPdsusjbcTxnJm7Xek
         rnb/XL9ijMnyYXANR4PUIYdbjDQsr1fpYMQqVyGWYxP45+2R0URJi6Ny5Vz4BPEap0t9
         7juYVeb7mjaoZuunp5kcdZ56L9uS9sC37TaKDB/uP59J52mPAK/tT0BgDrfIKc99EvGZ
         +/9w==
X-Gm-Message-State: AOJu0YwcohfOIQIynxRz/YsTAW7axqmISwI32cvD7UD+IyOZKP6zd0rx
	6Hz4XfZMtIH/NswU+7CIAWO6E8eYicw=
X-Google-Smtp-Source: AGHT+IGeHB8Ff+1DKkSzUoV7a9DreoeaHcuDx5XJxZrWd5+rcnA0fnyLs5dr+X8YfynnWrgPOkasZg==
X-Received: by 2002:a17:906:19b:b0:9ae:659f:4d2f with SMTP id 27-20020a170906019b00b009ae659f4d2fmr4827620ejb.26.1695738379029;
        Tue, 26 Sep 2023 07:26:19 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id j17-20020a170906279100b0099329b3ab67sm7841569ejc.71.2023.09.26.07.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 07:26:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] libslirp-virt: remove
Date: Tue, 26 Sep 2023 16:26:14 +0200
Message-ID: <20230926142614.1793757-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 26 Sep 2023 14:26:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8322

* it conflicts with libslipr now as discussed in:
  https://lists.openembedded.org/g/openembedded-core/message/188157
  and https://git.yoctoproject.org/meta-virtualization/commit/recipes-networking/slirp?id=543f4e6b5f6be0d397bcc78e22d5ca9a970b7111
  said it will be removed after slirp4netns verification in runtime, but
  slirp4netns_git.bb DEPENDS on libslirp not libslirp-virt so we can drop
  unused libslirp-virt recipe to fix possible conflict (e.g. in world builds):

  ERROR: Recipe libslirp-virt is trying to install files into a shared area when those files already exist. The files and the manifests listing them are:
  TOPDIR/BUILD/pkgdata/qemux86-64/runtime-reverse/libslirp-dev
    (matched in manifest-qemux86_64-libslirp.packagedata)
  TOPDIR/BUILD/pkgdata/qemux86-64/runtime-reverse/libslirp-dbg
    (matched in manifest-qemux86_64-libslirp.packagedata)
  TOPDIR/BUILD/pkgdata/qemux86-64/runtime-reverse/libslirp0
    (matched in manifest-qemux86_64-libslirp.packagedata)
  TOPDIR/BUILD/pkgdata/qemux86-64/runtime-reverse/libslirp-src
    (matched in manifest-qemux86_64-libslirp.packagedata)

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 recipes-networking/slirp/libslirp-virt_git.bb | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 recipes-networking/slirp/libslirp-virt_git.bb

diff --git a/recipes-networking/slirp/libslirp-virt_git.bb b/recipes-networking/slirp/libslirp-virt_git.bb
deleted file mode 100644
index 9f6dc627..00000000
--- a/recipes-networking/slirp/libslirp-virt_git.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "A general purpose TCP-IP emulator"
-LICENSE = "BSD-3-Clause & MIT"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bca0186b14e6b05e338e729f106db727"
-
-SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master"
-SRCREV = "888ddad6bde1dc6d7dbfc8daa7d015251b72e02c"
-PV = "4.6.1+git"
-S = "${WORKDIR}/git"
-
-DEPENDS = " \
-    glib-2.0 \
-"
-
-inherit meson pkgconfig
-- 
2.42.0


