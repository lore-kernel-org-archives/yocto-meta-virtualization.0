Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.2665.1578014507783503191
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 Jan 2020 17:21:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: windriver.com, ip: 140.211.169.56, mailfrom: qi.chen@windriver.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 46B08E01365; Thu,  2 Jan 2020 17:21:47 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SUBJ_OBFU_PUNCT_FEW autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	*  0.7 SUBJ_OBFU_PUNCT_FEW Possible punctuation-obfuscated Subject: header
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 170E1E0078F
	for <meta-virtualization@yoctoproject.org>; Thu,  2 Jan 2020 17:21:45 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0031LjUp026279
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>; Thu, 2 Jan 2020 17:21:45 -0800 (PST)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.468.0; Thu, 2 Jan 2020 17:21:44 -0800
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Subject: [meta-virtualization][PATCH] docker: remove docker.service.rpm
Date: Fri, 3 Jan 2020 09:21:43 +0800
Message-ID: <20200103012143.33707-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

This file is useless and misleading. Remove it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/docker/docker-ce_git.bb | 1 +
 recipes-containers/docker/docker-moby.bb   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
index 817795f..8b8136d 100644
--- a/recipes-containers/docker/docker-ce_git.bb
+++ b/recipes-containers/docker/docker-ce_git.bb
@@ -107,6 +107,7 @@ do_install() {
 		install -m 644 ${S}/src/import/components/engine/contrib/init/systemd/docker.* ${D}/${systemd_unitdir}/system
 		# replaces one copied from above with one that uses the local registry for a mirror
 		install -m 644 ${S}/src/import/components/engine/contrib/init/systemd/docker.service ${D}/${systemd_unitdir}/system
+		rm -f ${D}/${systemd_unitdir}/system/docker.service.rpm
 	else
 		install -d ${D}${sysconfdir}/init.d
 		install -m 0755 ${WORKDIR}/docker.init ${D}${sysconfdir}/init.d/docker.init
diff --git a/recipes-containers/docker/docker-moby.bb b/recipes-containers/docker/docker-moby.bb
index 0936fdf..0e1f4e2 100644
--- a/recipes-containers/docker/docker-moby.bb
+++ b/recipes-containers/docker/docker-moby.bb
@@ -126,6 +126,7 @@ do_install() {
 		install -m 644 ${S}/src/import/contrib/init/systemd/docker.* ${D}/${systemd_unitdir}/system
 		# replaces one copied from above with one that uses the local registry for a mirror
 		install -m 644 ${S}/src/import/contrib/init/systemd/docker.service ${D}/${systemd_unitdir}/system
+		rm -f ${D}/${systemd_unitdir}/system/docker.service.rpm
 	else
 		install -d ${D}${sysconfdir}/init.d
 		install -m 0755 ${WORKDIR}/docker.init ${D}${sysconfdir}/init.d/docker.init
-- 
2.17.1

