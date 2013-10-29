Return-Path: <Paul.Barrette@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C19B6E01756
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Oct 2013 13:40:29 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9TKeSGI009072
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Oct 2013 13:40:28 -0700 (PDT)
Received: from yow-pbarrett-lx.wrs.com (128.224.146.11) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Tue, 29 Oct 2013 13:40:28 -0700
From: Paul Barrette <paul.barrette@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Tue, 29 Oct 2013 16:40:27 -0400
Message-ID: <1383079227-24408-1-git-send-email-paul.barrette@windriver.com>
X-Mailer: git-send-email 1.8.1.4
MIME-Version: 1.0
Subject: [PATCH] initscripts: add warning and begin functions to lsb_log_message
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
X-List-Received-Date: Tue, 29 Oct 2013 20:40:32 -0000
Content-Type: text/plain

Some init scripts call a "begin" or "warning" function to log early init
phase messages, e.g. openvswitch-controller.  These functions are not
part of the default /etc/init.d/functions script, which is provided by
oe-core's lsb pkg.  Append these two missing commands to
/etc/init.d/functions during the install phase.

Signed-off-by: Paul Barrette <paul.barrette@windriver.com>
---
 recipes-core/initscripts/initscripts_1.0.bbappend | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-core/initscripts/initscripts_1.0.bbappend b/recipes-core/initscripts/initscripts_1.0.bbappend
index 04d848d..02b5bc4 100644
--- a/recipes-core/initscripts/initscripts_1.0.bbappend
+++ b/recipes-core/initscripts/initscripts_1.0.bbappend
@@ -7,4 +7,10 @@ do_install_append() {
 	echo failure \(\) \{  >> ${D}${sysconfdir}/init.d/functions
 	echo \ \ \ \ echo \$* >> ${D}${sysconfdir}/init.d/functions
 	echo \}               >> ${D}${sysconfdir}/init.d/functions
+	echo warning \(\) \{  >> ${D}${sysconfdir}/init.d/functions
+	echo \ \ \ \ echo \$* >> ${D}${sysconfdir}/init.d/functions
+	echo \}               >> ${D}${sysconfdir}/init.d/functions
+	echo begin \(\) \{  >> ${D}${sysconfdir}/init.d/functions
+	echo \ \ \ \ echo \$* >> ${D}${sysconfdir}/init.d/functions
+	echo \} 
 }
-- 
1.8.1.4


