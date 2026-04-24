Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E9DFB44A3
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 04:27:38 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14381.1777004852538492432
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 Apr 2026 21:27:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AjWnh94P;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-36146ae9dd4so5993425a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Apr 2026 21:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777004851; x=1777609651; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cX/GlJzFguc8PVuT9RG0nHQnY1ZObqwPPx9tTvQ1SU0=;
        b=AjWnh94PXCDsaBDviGSE/XBJzDBvL70T5Pfy+a4t1KTXeVTDJZ4IgSdj8mrwJpAlQe
         5VTbTi5iK8kxQp9/SfaDMktjCVqm80pDIQFBNUjYVVASEpsoAflDNz8REf7hymGdLIah
         XRcTvA/IsXKB0+XX/0Q9sZJrcHuxsIRoE8PSEp5rzKosR9pd6tg7skGm652llsgtBy5/
         ZsH2PyPJ4/WN8zxvjFsQTNRD6HwAnpzHEFlYE4UV4GN+wKgEgsRicSNX7gbOU12rrWte
         ZMZJOvtE5mCXb/7WQI7UQ1S2z1dXDkvUwGRUivdmF/GQdOkCGae2QYq1/9oButo2qexP
         qdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777004851; x=1777609651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cX/GlJzFguc8PVuT9RG0nHQnY1ZObqwPPx9tTvQ1SU0=;
        b=NETlBtT8Gr2k82NRsytpAv0e9HHr4LaK9o2PddxMvqco0qvy+EdeTrRHerCGOSxnGN
         bcxbsBFzdSHd3PQDOCkWmSwqgHwmZLfHBvmSlWdD8+ezi9bd2NQC4HVavX5sE3/eEzNc
         o2V/MGs+YzPrvhhFx2vXHXOqQ/ettLVXJjc0SqneYb/JsZuLEANT15mG8CAz09ZnAp82
         OlXzALRa4ZHLQ2GmDauwakXrcM3gZuUQIHqAJJZleEOj7prLbeDo5jhYikPwS8WDgovD
         8vRLsThYptNOY340N7GM6pKAKIoXegewWW07wKUOCvWWRhA9N4RfqC7Pc7L27/pjhTHe
         Rrhg==
X-Gm-Message-State: AOJu0YyTli33uCKZmbXsD5TzY0UR5FH59h2RMfZnzRB4XMyDnGo5SBzL
	rBlVvR8OuzFxohVnyemPoe53vsMuoTieJqGVhubXyiNlWcppyvbCDGd42IfbPEpw
X-Gm-Gg: AeBDiet4YbeO6Ezt8G7Bzn39i2exYw3kN6TQODcAJsqdlcQtboU7JBDf/s0mD16PqsQ
	dt+GPmVr0wD0azFIEhh4JHcAUuGmf/1ayrZ+1VI6oCnESmKOUdhHGHLuUD+LIRDbVKdxRAot4/0
	EeJYqHZ4s2QJWO8vsnONQu5yr8Hboah3CM7TUIY6Xnm85a6j4vcJG+cpNNukTbXg+wGC8t+KGEM
	tkOxgDnSPpeU+1u8+KMxINdduvLxmg7R+IBFaSFx3jQy7TUdoPgO6gKZYA+9o+dDgauHeRJf/wi
	9Ub0+pKsyIAZwyinUsCPtNVxuWkcJkDLjDmW3BwTx6cj++u7Osu8iXVjOuH49Yw0MxyG2YUCUj4
	Or/TK9SFwCWyKSpVenBV8kHXOm6tyZPGkFCd1RQ5oYRbKeYLI0C4QlXL8Pbq87rkuCaOq1s5ltm
	b18NLM/rN/XXWMbVrwJZT4bMkhUF2BB+vioj6k3r0G1ACVoaG0X5SzxZJU9FFodAW3QRMTi2doX
	NzkpaPw9LBzgiyNL13ybLKu1dqwKlQW
X-Received: by 2002:a17:90b:55ce:b0:35e:5929:d78d with SMTP id 98e67ed59e1d1-361403add31mr32151665a91.3.1777004851317;
        Thu, 23 Apr 2026 21:27:31 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614195a9f0sm21402988a91.9.2026.04.23.21.27.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Apr 2026 21:27:30 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-virtualization][PATCH] distro/vruntime: DISTRO_FEATURES_DEFAULT is obsolete
Date: Thu, 23 Apr 2026 21:26:56 -0700
Message-ID: <20260424042727.75417-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Apr 2026 04:27:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9736

Replace with DISTRO_FEATURES_DEFAULTS

https://git.openembedded.org/openembedded-core/commit/meta/conf?id=0548ea447445834647be7ef35ed0ae8d1d3387b3

Fixes:
ERROR: Nothing PROVIDES 'nativesdk-libseccomp' ...

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 conf/distro/vruntime.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/distro/vruntime.conf b/conf/distro/vruntime.conf
index 0ea43e62..56c5ad6a 100644
--- a/conf/distro/vruntime.conf
+++ b/conf/distro/vruntime.conf
@@ -46,8 +46,8 @@ DISTRO_FEATURES = "acl ext2 ipv4 ipv6 seccomp vfat pci vcontainer vxn"
 DISTRO_FEATURES_OPTED_OUT = "pulseaudio gobject-introspection-data opengl ptest multiarch wayland vulkan"
 
 # Native and nativesdk classes need full features for build tools
-DISTRO_FEATURES:class-native = "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_FEATURES}"
-DISTRO_FEATURES:class-nativesdk = "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_FEATURES}"
+DISTRO_FEATURES:class-native = "${DISTRO_FEATURES_DEFAULTS} ${POKY_DEFAULT_DISTRO_FEATURES}"
+DISTRO_FEATURES:class-nativesdk = "${DISTRO_FEATURES_DEFAULTS} ${POKY_DEFAULT_DISTRO_FEATURES}"
 
 # Default to ext4, but image recipes may override to squashfs
 IMAGE_FSTYPES = "ext4"
-- 
2.50.1 (Apple Git-155)


