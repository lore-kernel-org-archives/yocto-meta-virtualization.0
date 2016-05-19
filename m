Return-Path: <Xulin.Sun@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 08E9EE00D5E; Thu, 19 May 2016 00:47:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CA1F9E00D46
	for <meta-virtualization@yoctoproject.org>;
	Thu, 19 May 2016 00:47:09 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4J7l8Vn029283
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 19 May 2016 00:47:08 -0700
Received: from pek-lpggp4.wrs.com (128.224.153.77) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 19 May 2016 00:47:07 -0700
From: Xulin Sun <xulin.sun@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 19 May 2016 15:47:04 +0800
Message-ID: <1463644024-217045-1-git-send-email-xulin.sun@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] cloud-init: fix installed-vs-shipped issue by creating a separate package
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 19 May 2016 07:47:13 -0000
Content-Type: text/plain

This solves the following issue by creating a separate package to put the
below files:

QA Issue: cloud-init: Files/directories were installed but not shipped
in any package:
 /lib
 /lib/systemd
 /lib/systemd/system
 /lib/systemd/system/cloud-init.service
 /lib/systemd/system/cloud-config.target
 /lib/systemd/system/cloud-config.service
 /lib/systemd/system/cloud-init-local.service
 /lib/systemd/system/cloud-final.service

Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
---
 meta-openstack/recipes-extended/cloud-init/cloud-init_0.7.6.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-openstack/recipes-extended/cloud-init/cloud-init_0.7.6.bb b/meta-openstack/recipes-extended/cloud-init/cloud-init_0.7.6.bb
index ea6752c..457ff93 100644
--- a/meta-openstack/recipes-extended/cloud-init/cloud-init_0.7.6.bb
+++ b/meta-openstack/recipes-extended/cloud-init/cloud-init_0.7.6.bb
@@ -42,9 +42,13 @@ CHEF_SERVICES_CONF_FILES := " \
     ${sysconfdir}/cloud/cloud.cfg \
     "
 
+PACKAGES += "${PN}-systemd"
+
 FILES_${PN} += "${sysconfdir}/* \
                 ${datadir}/*"
 
+FILES_${PN}-systemd += "${systemd_unitdir}/*"
+
 INITSCRIPT_PACKAGES = "${PN}"
 INITSCRIPT_NAME_${BPN} = "cloud-init"
 
-- 
2.8.1


