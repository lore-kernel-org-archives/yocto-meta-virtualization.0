Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29928C61DB4
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 10:24:34 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18493.1787653470229927312
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 03:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.51 with ESMTP; 25 Aug 2026 19:24:28 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO magneto) (10.177.121.44)
	by 156.147.1.121 with ESMTP; 25 Aug 2026 19:24:28 +0900
X-Original-SENDERIP: 10.177.121.44
X-Original-MAILFROM: jaeyoon.jung@lge.com
From: jaeyoon.jung@lge.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Jaeyoon Jung <jaeyoon.jung@lge.com>
Subject: [PATCH] irqbalance: add PACKAGECONFIG for ui
Date: Tue, 25 Aug 2026 19:24:24 +0900
Message-ID: <20260825102425.3092801-1-jaeyoon.jung@lge.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 25 Aug 2026 10:24:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10063

From: Jaeyoon Jung <jaeyoon.jung@lge.com>

Add 'ui' to PACKAGECONFIG, corresponding to the '--with-irqbalance-ui'
configure option along with an explicit build dependency on ncurses.
Add it to the default PACKAGECONFIG since the feature is enabled by
default unless '--without-irqbalance-ui' is specified.

Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
---
 recipes-extended/irqbalance/irqbalance.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/irqbalance/irqbalance.inc b/recipes-extended/irqbalance/irqbalance.inc
index 0c570e12..a0dda231 100644
--- a/recipes-extended/irqbalance/irqbalance.inc
+++ b/recipes-extended/irqbalance/irqbalance.inc
@@ -28,12 +28,13 @@ EXTRA_OECONF = "--program-transform-name= \
 
 # let the recipes or appends define options
 #
-PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} ui"
 # enable,disable,depends,rdepends
 #
 PACKAGECONFIG[numa] = "--enable-numa,--disable-numa,numactl,"
 PACKAGECONFIG[libcap-ng] = "--with-libcap-ng,--without-libcap-ng,libcap-ng,"
 PACKAGECONFIG[systemd] = "--with-systemd --with-pkgconfdir=${sysconfdir},--with-pkgconfdir=${sysconfdir},systemd,"
+PACKAGECONFIG[ui] = "--with-irqbalance-ui,--without-irqbalance-ui,ncurses,"
 
 do_install () {
         oe_runmake 'DESTDIR=${D}' install

