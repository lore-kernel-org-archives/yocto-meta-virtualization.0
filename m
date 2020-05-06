Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.2151.1588751870876340220
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 06 May 2020 00:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: haitao.liu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0467vTMr009113
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 6 May 2020 00:57:40 -0700
Received: from ala-lpd-susbld2.wrs.com (147.11.105.122) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Wed, 6 May 2020 00:57:19 -0700
From: "jason.lau" <Haitao.Liu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][master,Zeus] go-pty: change the source address
Date: Wed, 6 May 2020 00:57:14 -0700
Message-ID: <20200506075714.61924-1-haitao.liu@windriver.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-Originating-IP: [147.11.105.122]
Content-Type: text/plain

The go-pty module has moved to https://github.com/creack/pty.

Signed-off-by: Prashant Chikhalkar <prashant.chikhalkar@windriver.com>
Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
---
 recipes-devtools/go/go-pty_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-devtools/go/go-pty_git.bb b/recipes-devtools/go/go-pty_git.bb
index bc94b31..02cef69 100644
--- a/recipes-devtools/go/go-pty_git.bb
+++ b/recipes-devtools/go/go-pty_git.bb
@@ -1,12 +1,12 @@
 DESCRIPTION = "PTY interface for Go"
-HOMEPAGE = "https://github.com/kr/pty"
+HOMEPAGE = "https://github.com/creack/pty"
 SECTION = "devel/go"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://License;md5=93958070863d769117fa33b129020050"
 
 SRCNAME = "pty"
 
-PKG_NAME = "github.com/kr/${SRCNAME}"
+PKG_NAME = "github.com/creack/${SRCNAME}"
 SRC_URI = "git://${PKG_NAME}.git"
 
 SRCREV = "05017fcccf23c823bfdea560dcc958a136e54fb7"
-- 
2.17.0

