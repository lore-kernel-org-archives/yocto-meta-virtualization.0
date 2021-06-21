Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web12.45968.1624275878867828466
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Jun 2021 04:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: has@pengutronix.de)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <has@pengutronix.de>)
	id 1lvIM1-0000uT-A4; Mon, 21 Jun 2021 13:44:37 +0200
Received: from has by dude02.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <has@pengutronix.de>)
	id 1lvIM1-0003rq-1U; Mon, 21 Jun 2021 13:44:37 +0200
From: "Holger Assmann" <h.assmann@pengutronix.de>
To: meta-virtualization@lists.yoctoproject.org
Cc: Holger Assmann <h.assmann@pengutronix.de>
Subject: [meta-virtualization][PATCH 2/2] conmon: branch "master" renamed to "main"
Date: Mon, 21 Jun 2021 13:44:33 +0200
Message-Id: <20210621114433.4510-2-h.assmann@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210621114433.4510-1-h.assmann@pengutronix.de>
References: <20210621114433.4510-1-h.assmann@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: has@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: meta-virtualization@lists.yoctoproject.org
Content-Transfer-Encoding: 8bit

Without further parametrization, do_fetch tries do access the source via
the "master" branch of the respective repository. Since this branch has
been renamed to "main", further specification has become necessary.

Signed-off-by: Holger Assmann <h.assmann@pengutronix.de>
---
 recipes-containers/conmon/conmon_2.0.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/conmon/conmon_2.0.18.bb b/recipes-containers/conmon/conmon_2.0.18.bb
index d0a5739..b5c229d 100644
--- a/recipes-containers/conmon/conmon_2.0.18.bb
+++ b/recipes-containers/conmon/conmon_2.0.18.bb
@@ -8,7 +8,7 @@ DEPENDS = "glib-2.0 go-md2man-native"
 
 SRCREV = "0e155c83aa739ef0a0540ec9f9d265f57f68038b"
 SRC_URI = "\
-    git://github.com/containers/conmon.git \
+    git://github.com/containers/conmon.git;branch=main \
 "
 
 PV = "2.0.26+git${SRCPV}"
-- 
2.29.2

