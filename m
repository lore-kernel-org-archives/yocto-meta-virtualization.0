Return-Path: <Yi.Zhao@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2617FE00CEE; Thu, 18 Apr 2019 17:26:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 88376E00AC5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Apr 2019 17:26:43 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3J0QMih006807
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Apr 2019 17:26:32 -0700
Received: from localhost (128.224.162.195) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Thu, 18 Apr 2019 17:26:11 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 19 Apr 2019 08:26:09 +0800
Message-ID: <1555633569-13203-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.195]
Subject: [meta-cloud-services][PATCH] apache2: remove bbappend
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
X-List-Received-Date: Fri, 19 Apr 2019 00:26:44 -0000
Content-Type: text/plain

The apache2 in meta-webserver has been upgraded to 2.4.39. This bbappend
has been integrated into apache2 recipe. So remove it.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-httpd/apache2/apache2_2.4.%.bbappend           | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 meta-openstack/recipes-httpd/apache2/apache2_2.4.%.bbappend

diff --git a/meta-openstack/recipes-httpd/apache2/apache2_2.4.%.bbappend b/meta-openstack/recipes-httpd/apache2/apache2_2.4.%.bbappend
deleted file mode 100644
index 5fc832d..0000000
--- a/meta-openstack/recipes-httpd/apache2/apache2_2.4.%.bbappend
+++ /dev/null
@@ -1,14 +0,0 @@
-do_install_append() {
-    sed -i -e 's/#ServerName.*$/ServerName 127.0.0.1:80/' ${D}${sysconfdir}/apache2/httpd.conf
-    # Keep our logs together, also matches ubuntu and debian
-    sed -i -e 's@^\(.*\)/var/apache2/logs\(.*\)$@\1/var/log/apache2\2@g' ${D}${sysconfdir}/apache2/httpd.conf
-
-    # default layout for htdocsdir in 2.4.7 is different, create the following for
-    # backward compatibility reasons
-
-    mkdir -p ${D}${datadir}/${BPN}/default-site
-    ln -sf ../htdocs ${D}${datadir}/${BPN}/default-site/htdocs
-}
-
-FILES_${PN} += "${datadir}/${BPN}/default-site"
-SYSTEMD_AUTO_ENABLE_${PN} = "enable"
-- 
2.7.4


