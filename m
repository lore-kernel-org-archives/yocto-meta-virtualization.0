Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6767CCF9C72
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 15:53:55 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.40171.1727106826910680742
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 23 Sep 2024 08:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cm67aaYt;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: michalwsieron@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a83562f9be9so529092066b.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Sep 2024 08:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727106825; x=1727711625; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tDyQVo5X0uv/m6B4LKAtaPgEac8waEIc4/Wy9TYGSlg=;
        b=Cm67aaYt5gI718/9iaeIhOKs9E1KtWa7P50+Z72j0JYYA3KchgKjQSMeL6MvGQJOtq
         pgmiaALUOqIvrITT8AlocoiwkcdOo45MTC2g7NhN2n93dGYuAw5jvlRGUNZ/1DZWfKDi
         LyMqgU5wSZ3tOIdBLMe4PCmEacS30jjqVmDxOMCik95MkWZF7+5vKtmRWapWnxKIq8E3
         RpcyO16uHSaLfneZTG6SE/rXbE7oRYeoUVAMGTCgc8BSVkUn/SrGeKFgbaVsssKm/Hjk
         5qaQapOySF0k+/wJDt64kAKeg6LYhqKIkWWq3HtuK91MgutW4t1jTuWiSx4eegci9550
         DapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727106825; x=1727711625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDyQVo5X0uv/m6B4LKAtaPgEac8waEIc4/Wy9TYGSlg=;
        b=EJuhi+BAWmjB9WU3gyjOBd+pc+jHd6HRL9PFx5Zf/hBzwDw43Zqcuoe4P9yxwd+ge5
         9zsP1x0EipAVwK8oBZ3h3x1o0q/7Bcd+wr1w0K2OslbmFt2uaoEAaxnGBWMu3J4oPGM4
         FC2kMCULJvwlCypGobbYpcv4tiwtD+zy3luDoQmc1lUyRfpeyBh6SUFVoQNai6MovV6U
         EuCh1taK3qROVNtQKMALwB0CCuAorFJDts0KOMXoXdVAGbSb6QR9h4u5CisKbrcsLtXZ
         iapjwfL8opS+mmrfM26RHrYVgz5I9U5zj6jahYVgNnMBUa9IRVDmbAx1MyrAeiYo5F6D
         FYZA==
X-Gm-Message-State: AOJu0Yyn/LS2w82Nu+DS4sf1vvHvELpoCGk0Y/vO52NaCcbxMdPSoSKo
	6JRkEefAuMmcVJypJaBSVd35EsB7gexMWMkFLU2V+niD3qoRuibk5zfy35nd
X-Google-Smtp-Source: AGHT+IE0iotLlJgbl9uTWlWX2bsCikRcfkn30hazrRjmShkWRHbf7pi9gzq5onByFYKH1XhhLKDW9A==
X-Received: by 2002:a17:907:e8e:b0:a86:7cac:f871 with SMTP id a640c23a62f3a-a90d511c335mr1434616666b.54.1727106825028;
        Mon, 23 Sep 2024 08:53:45 -0700 (PDT)
Received: from localhost.localdomain (178-37-56-200.dynamic.inetia.pl. [178.37.56.200])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610f4265sm1237035666b.56.2024.09.23.08.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 08:53:44 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Michal Sieron <michalwsieron@gmail.com>
Subject: [PATCH] crun: Add PACKAGECONFIG options
Date: Mon, 23 Sep 2024 17:53:17 +0200
Message-ID: <20240923155316.589060-2-michalwsieron@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Sep 2024 15:53:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8897

Neither systemd nor seccomp is hard required by crun.
They can actually be disabled during configuration with
--disable-systemd or --disable-seccomp.

Introduce PACKAGECONFIG options for them and default them to presence
of corresponding entries in DISTRO_FEATURES.

Now REQUIRED_DISTRO_FEATURES and features_check can also be removed.

Similarly dependency on libcap can be made optional.
crun actually contains pregenerated manpages in the repository so
dependency on go-md2man-native can be made optional as well.

As there is a configuration option for embedding yajl I added an option
for that as well. However, as PACKAGECONFIG can only specify
dependencies when config is enabled I had to invert the options so the
config is for external-yajl.

I set default PACKAGECONFIG value to match previous state (except
detecting if systemd and seccomp are in DISTRO_FEATURES).

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 recipes-containers/crun/crun_git.bb | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/recipes-containers/crun/crun_git.bb b/recipes-containers/crun/crun_git.bb
index 2b74264a..4d03017c 100644
--- a/recipes-containers/crun/crun_git.bb
+++ b/recipes-containers/crun/crun_git.bb
@@ -20,16 +20,22 @@ SRC_URI = "git://github.com/containers/crun.git;branch=main;name=crun;protocol=h
 PV = "v1.15+git${SRCREV_crun}"
 S = "${WORKDIR}/git"
 
-REQUIRED_DISTRO_FEATURES ?= "systemd seccomp"
-
-inherit autotools-brokensep pkgconfig features_check
-
-PACKAGECONFIG ??= ""
-
-DEPENDS = "yajl libcap go-md2man-native m4-native"
-# TODO: is there a packageconfig to turn this off ?
-DEPENDS += "libseccomp"
-DEPENDS += "systemd"
+inherit autotools-brokensep pkgconfig
+
+PACKAGECONFIG ??= " \
+    caps external-yajl man \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'seccomp', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+"
+
+PACKAGECONFIG[caps] = "--enable-caps,--disable-caps,libcap"
+PACKAGECONFIG[external-yajl] = "--disable-embedded-yajl,--enable-embedded-yajl,yajl"
+# whether to regenerate manpages that are already present in the repo
+PACKAGECONFIG[man] = ",,go-md2man-native"
+PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp,libseccomp"
+PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
+
+DEPENDS = "m4-native"
 DEPENDS:append:libc-musl = " argp-standalone"
 
 do_configure:prepend () {
-- 
2.46.1


