Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B4FC25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 13:17:23 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.27443.1716815839763290467
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 May 2024 06:17:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout12.t-online.de (Postfix) with SMTP id 250881AB4
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 May 2024 15:17:18 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.33.219]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sBaE1-1maxYP0; Mon, 27 May 2024 15:17:17 +0200
From: Markus Volk <f_l_k@t-online.de>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] linux-yocto_virtualization: adjust path for scc files
Date: Mon, 27 May 2024 15:17:55 +0200
Message-ID: <20240527131755.1903448-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1716815837-27FFCD34-70033A7A/0/0 CLEAN NORMAL
X-TOI-MSGID: e261378a-5d95-4a43-b74d-069079ccf720
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 May 2024 13:17:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8766

this avoids:
| ERROR: Feature '../recipe-sysroot-native/kcfg/cfg/virtio.scc' not found=
, this will cause configuration failures.
| ERROR: Check the SRC_URI for meta-data repositories or directories that=
 may be missing
| ERROR: Set KERNEL_DANGLING_FEATURES_WARN_ONLY to ignore this issue

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 recipes-kernel/linux/linux-yocto_virtualization.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc b/recipe=
s-kernel/linux/linux-yocto_virtualization.inc
index 9a6554d1..5edaef94 100644
--- a/recipes-kernel/linux/linux-yocto_virtualization.inc
+++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
@@ -21,12 +21,12 @@ def kernel_cache_cond_feature(src_uri,feature):
     if kernel_cache:
        return feature
=20
-    return "../recipe-sysroot-native/kcfg/" + feature
+    return "../../recipe-sysroot-native/kcfg/" + feature
=20
 # no conditional, just use the yocto-kernel-cache addition, yes
 # the src_uri isn't used, but we may need to check it in the future
 def kernel_cache_feature(src_uri,feature):
-    return "../recipe-sysroot-native/kcfg/" + feature
+    return "../../recipe-sysroot-native/kcfg/" + feature
=20
 def distro_cond_feature(feature_fragment,distro_feature,d):
     import bb
--=20
2.44.0


