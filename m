Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFCC8C4167B
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 09:21:28 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.49985.1699262479947916801
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 01:21:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=alexander.sverdlin@siemens.com header.s=fm1 header.b=fUquMUqj;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-456497-20231106092117c32d0759550b908d29-z0y__m@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20231106092117c32d0759550b908d29
        for <meta-virtualization@lists.yoctoproject.org>;
        Mon, 06 Nov 2023 10:21:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=8UJMzKGQ7WgA1eeXPh48waa39PPtOpbZaHkfxf9CiPw=;
 b=fUquMUqjgM5ov2+ARPuCNcAALDvUFcQE60aI0VepE4fjCor2IrwrNboy02xcFq8DI2DdJm
 VFajtBoHywyvYPmdcuwqR34RkDHoJwvGv2nEX86lTbPocxEdzCFf6vqAzHj8ufFyqQ94Ldvp
 n++atijwnrbIaTzuwGRTJGUcd4lR0=;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	meta-virtualization@lists.yoctoproject.org,
	adrian.freihofer@gmail.com
Subject: [PATCH RFC] kernel: allow KERNEL_META_TYPE redefinition
Date: Mon,  6 Nov 2023 10:20:29 +0100
Message-ID: <20231106092058.1209687-1-alexander.sverdlin@siemens.com>
In-Reply-To: <CADkTA4ORrENvzkPYG_1EnDca-BQjhm4L3nj9e+ZfNer4wcd0Yw@mail.gmail.com>
References: <CADkTA4ORrENvzkPYG_1EnDca-BQjhm4L3nj9e+ZfNer4wcd0Yw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Nov 2023 09:21:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8424

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

There are use cases for type=kmeta in kernel-yocto.bbclass-derived SRC_URI
which do not point to git://git.yoctoproject.org/yocto-kernel-cache but to
file:// local storage containing just some .scc files. It's not obvious
that they shall pull in the whole automatic kernel configuration of
meta-virtualization. Make this behaviour configurable by allowing
KERNEL_META_TYPE to be defined in local.conf or distro config.
---
 recipes-kernel/linux/linux-%.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-%.bbappend b/recipes-kernel/linux/linux-%.bbappend
index 5f31578..c2fc91c 100644
--- a/recipes-kernel/linux/linux-%.bbappend
+++ b/recipes-kernel/linux/linux-%.bbappend
@@ -5,6 +5,6 @@ LINUX_MAJOR = "${@(d.getVar('LINUX_VERSION') or "x.y").split('.')[0]}"
 LINUX_MINOR = "${@(d.getVar('LINUX_VERSION') or "x.y").split('.')[1]}"
 
 
-KERNEL_META_TYPE = "${@'yocto' if d.getVar('SRC_URI').find('type=kmeta') > 0 else 'none'}"
+KERNEL_META_TYPE ?= "${@'yocto' if d.getVar('SRC_URI').find('type=kmeta') > 0 else 'none'}"
 
 include ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', 'linux-${KERNEL_META_TYPE}_${LINUX_MAJOR}.${LINUX_MINOR}_virtualization.inc', '', d)}
-- 
2.41.0


