Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EAFA6E00D88; Wed, 22 Nov 2017 08:08:01 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CCDA4E008A4
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Nov 2017 08:07:46 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAMG7k7S019941
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Nov 2017 08:07:46 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 22 Nov 2017 08:07:45 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Wed, 22 Nov 2017 11:07:40 -0500
Message-ID: <1511366860-6756-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [m-c-s][PATCH] apache: changes to support systemd
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
X-List-Received-Date: Wed, 22 Nov 2017 16:08:02 -0000
Content-Type: text/plain

Auto start apache2 and adapt how we change the logging location from
/var/apache2/logs to /var/log/apache2. Sysvinit specific changes are
removed as we only plan to support systemd.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/recipes-httpd/apache2/apache2_2.4.%.bbappend | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-httpd/apache2/apache2_2.4.%.bbappend b/meta-openstack/recipes-httpd/apache2/apache2_2.4.%.bbappend
index 7af8143..5fc832d 100644
--- a/meta-openstack/recipes-httpd/apache2/apache2_2.4.%.bbappend
+++ b/meta-openstack/recipes-httpd/apache2/apache2_2.4.%.bbappend
@@ -1,13 +1,14 @@
 do_install_append() {
     sed -i -e 's/#ServerName.*$/ServerName 127.0.0.1:80/' ${D}${sysconfdir}/apache2/httpd.conf
+    # Keep our logs together, also matches ubuntu and debian
+    sed -i -e 's@^\(.*\)/var/apache2/logs\(.*\)$@\1/var/log/apache2\2@g' ${D}${sysconfdir}/apache2/httpd.conf
 
     # default layout for htdocsdir in 2.4.7 is different, create the following for
     # backward compatibility reasons
 
     mkdir -p ${D}${datadir}/${BPN}/default-site
     ln -sf ../htdocs ${D}${datadir}/${BPN}/default-site/htdocs
-    
-    sed -i '30i if [ ! -e /var/log/apache2 ]; then ln -sf /var/apache2/logs/ /var/log/apache2; fi' ${D}/etc/init.d/apache2
 }
 
 FILES_${PN} += "${datadir}/${BPN}/default-site"
+SYSTEMD_AUTO_ENABLE_${PN} = "enable"
-- 
2.7.4


