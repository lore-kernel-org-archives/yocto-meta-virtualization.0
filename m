Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A6FFC037D
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:47:54 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.752.1776959265741880152
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 Apr 2026 08:47:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cgQ6y2MU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488ba840146so62016495e9.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Apr 2026 08:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776959263; x=1777564063; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Et1SOgIVjr8JXrvqEy1x3rgM98wA4XUQWU3S1AcvpP8=;
        b=cgQ6y2MUPKSZQEjVmmWctXtr9nG2fUrhRApz0SXbCXDQ6pckGP6+ysgN8e+QcNaWY4
         x1zn3YDHyc2Ncn5iGnQsL28DsiU8LOM6My0dpwyyl66m3K0l+f2wmpuUCl9C7US0nzN4
         o/6LqkhflkU2hfIcMfqEnDivVUMBcGVikxxjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776959263; x=1777564063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Et1SOgIVjr8JXrvqEy1x3rgM98wA4XUQWU3S1AcvpP8=;
        b=hcUT3c6uZtcQQMP3D3NqS2cqjLFYLKpXfCrrvdKpt5EW+VdUGYYTuJ+zowJZwvAI3F
         gbUrg+fPmlEV8aFdPKrEVEwm5KF7AV/zhNgITkRdjEoZi94+UJAnIdkmlNY7V2S/10+8
         hpfK/tPXKUtTzxsR0LR7TdEyKIo9F4tIppxX1zizwW2IsJO7weJqH+RAYFuvUjrqkRj2
         +yn088zHjtsLaHX7rHR17KWZL6vgnGSep/N6I0ls1Qg7tbf+t89MimuTGumY+2s03+tw
         gBh42eB1TnC0e16575PHNr5S897a6bnAJqw5JN1uVUJvvfFNTpVppK7m9B0ubI71dYjl
         Bbcw==
X-Gm-Message-State: AOJu0YxyidgKLdJ9MS9vYZX1DN4wEub/LrwzRnspD3eR8VBq8vdwbiNl
	8L10k7qA0QkLTdkgbs5+93yCbg22XA6O+CZIrvL6tr0Hmxh4/kDTtUPdhTuFU2A/ZS+o2y4aeAw
	dndWGKx4=
X-Gm-Gg: AeBDieu4FjLRo3WXTCotVCKcDpdxHb2pAdPz5wyP4TYXRx/qjtxDHF07etVAIG/PupB
	eIFbX8odTGf35PLZP2osnX9do72pBA0Y4iCcdxezz17cIm6SJU66X4hxeoaOnXPDZANReWBU76b
	1xm6S1+HuDopyo+fg1hST0mE5bCcyvhpAOOerB+M0Ft12RZ0zow1Q/J2/CZNP/vS3GlBQvMFxd6
	pAF8Gdn6VBVFRZPCWHakV7DfabWXy6Rn8qOgbTQWs2azlpE7ndHtITZ1Q1nMN/u/Aso8wgkyG5E
	jBIuxwv7dFSBbo1ueD7+eKZTzIqrzWMTkvAUCF9d2FYZGdOetSemhGH/5Gt7x2u7DZFE6KZKnH4
	4vGyiAkW4blSYS4rnwODqvO5Mz26s3S0Q970r6Tz/ooPSfYRWuaioWZZndcBuu4ozmPY06KEci8
	foi9M0N3S/jsY7mEaoaLxOtPz7T8Hbz6TWtheNEsgDx1g8IRwxmzmTpISVZHLaGRs=
X-Received: by 2002:a05:600c:4593:b0:488:c120:480a with SMTP id 5b1f17b1804b1-488fb78bf05mr380123445e9.31.1776959263446;
        Thu, 23 Apr 2026 08:47:43 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8228:dac2:8992:4ae8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ffc558f2sm401767275e9.1.2026.04.23.08.47.42
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:47:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization] [PATCH] lasyer.conf/qemu-system-native: Improve native DISTRO_FEATURE handling
Date: Thu, 23 Apr 2026 16:47:41 +0100
Message-ID: <20260423154741.2094781-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Apr 2026 15:47:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9728

OE-Core needs to make some improvements to the way DISTRO_FEATURES is being built
but this will break the way meta-virtualization is handling native propagation.

Use DISTRO_FEATURES_FILTER_NATIVE which is designed for this.

That then means updating the bbappend just to look at DISTRO_FEATURES and to
look for both possible values.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 conf/layer.conf                                     | 2 +-
 recipes-devtools/qemu/qemu-system-native_%.bbappend | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index eababe00..2a4a4c91 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -72,7 +72,7 @@ HOSTTOOLS_NONFATAL += "getent"
 
 # Propagate virtualization/vcontainer to native DISTRO_FEATURES for qemu virtfs support
 # This enables virtio-9p in qemu-system-native for container-cross-install batch imports
-DISTRO_FEATURES_NATIVE:append = " ${@bb.utils.contains_any('DISTRO_FEATURES', 'vcontainer virtualization', 'virtualization', '', d)}"
+DISTRO_FEATURES_FILTER_NATIVE:append = " vcontainer virtualization"
 
 NON_MULTILIB_RECIPES:append:x86-64 = " kubernetes"
 
diff --git a/recipes-devtools/qemu/qemu-system-native_%.bbappend b/recipes-devtools/qemu/qemu-system-native_%.bbappend
index 1b77db02..e6703c0c 100644
--- a/recipes-devtools/qemu/qemu-system-native_%.bbappend
+++ b/recipes-devtools/qemu/qemu-system-native_%.bbappend
@@ -6,7 +6,7 @@
 # This is required for the fast batch-import path in container-cross-install.
 #
 # Note: Native recipes don't see target DISTRO_FEATURES directly.
-# The layer.conf propagates virtualization to DISTRO_FEATURES_NATIVE when
-# vcontainer or virtualization is in the target DISTRO_FEATURES.
+# The layer.conf propagates virtualization and vcontainer to DISTRO_FEATURES
+# using DISTRO_FEATURES_FILTER_NATIVE.
 
-PACKAGECONFIG:append = "${@bb.utils.contains('DISTRO_FEATURES_NATIVE', 'virtualization', ' virtfs', '', d)}"
+PACKAGECONFIG:append = "${@bb.utils.contains_any('DISTRO_FEATURES', 'virtualization vcontainer', ' virtfs', '', d)}"

