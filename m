Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web09.45868.1624275877324598976
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Jun 2021 04:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: has@pengutronix.de)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <has@pengutronix.de>)
	id 1lvILz-0000uH-NU; Mon, 21 Jun 2021 13:44:35 +0200
Received: from has by dude02.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <has@pengutronix.de>)
	id 1lvILz-0003kW-Eu; Mon, 21 Jun 2021 13:44:35 +0200
From: h.assmann@pengutronix.de
To: meta-virtualization@lists.yoctoproject.org
Cc: Holger Assmann <h.assmann@pengutronix.de>
Subject: [meta-virtualization][PATCH 1/2] crun: branch "master" renamed to "main"
Date: Mon, 21 Jun 2021 13:44:32 +0200
Message-Id: <20210621114433.4510-1-h.assmann@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: has@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: meta-virtualization@lists.yoctoproject.org
Content-Transfer-Encoding: 8bit

crun "master" branch has been renamed to "main", so change SRC_URI
accordingly.

Signed-off-by: Holger Assmann <h.assmann@pengutronix.de>
---
 recipes-containers/crun/crun_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/crun/crun_git.bb b/recipes-containers/crun/crun_git.bb
index ced1e1c..ed2c5b0 100644
--- a/recipes-containers/crun/crun_git.bb
+++ b/recipes-containers/crun/crun_git.bb
@@ -9,7 +9,7 @@ SRCREV_ispec = "79b036d80240ae530a8de15e1d21c7ab9292c693"
 SRCREV_rspec = "7413a7f753e1bd9a6a9c6dc7f96f55888cbbd476"
 
 SRCREV_FORMAT = "crun_rspec"
-SRC_URI = "git://github.com/containers/crun.git;branch=master;name=crun \
+SRC_URI = "git://github.com/containers/crun.git;branch=main;name=crun \
            git://github.com/containers/libocispec.git;branch=main;name=libocispec;destsuffix=git/libocispec \
            git://github.com/opencontainers/runtime-spec.git;branch=master;name=rspec;destsuffix=git/libocispec/runtime-spec \
            git://github.com/opencontainers/image-spec.git;branch=master;name=ispec;destsuffix=git/libocispec/image-spec \
-- 
2.29.2

