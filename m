Return-Path: <Changqing.Li@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9F873E00D74; Wed,  5 Jun 2019 19:20:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7B62CE00D51
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Jun 2019 19:20:01 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x562JeV0018301
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 5 Jun 2019 19:19:50 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Wed, 5 Jun 2019 19:19:29 -0700
From: <changqing.li@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 6 Jun 2019 10:19:28 +0800
Message-ID: <1559787568-378928-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] nagios-nrpe: fix systemd service start failed
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
X-List-Received-Date: Thu, 06 Jun 2019 02:20:02 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Jun 06 01:44:51 qemux86 systemd[1]: Started Nagios nrpe plugin.
Jun 06 01:44:51 qemux86 nrpe[1263]: Starting up daemon
Jun 06 01:44:51 qemux86 nrpe[1263]: Cannot write to pidfile '/var/nagios/nrpe.pid' - check your privileges.
Jun 06 01:44:51 qemux86 systemd[1]: nagios-nrpe.service: Main process exited, code=exited, status=2/INVALIDARGUMENT
Jun 06 01:44:51 qemux86 systemd[1]: nagios-nrpe.service: Failed with result 'exit-code'

In configuration file /etc/nagios/nrpe.cfg, the pidfile is under /var/nagios.

fix by stop rm the /var/nagios, and include it into daemon packages

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-extended/nagios/nagios-nrpe_3.2.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-extended/nagios/nagios-nrpe_3.2.1.bb b/recipes-extended/nagios/nagios-nrpe_3.2.1.bb
index 9493336..3afa5dd 100644
--- a/recipes-extended/nagios/nagios-nrpe_3.2.1.bb
+++ b/recipes-extended/nagios/nagios-nrpe_3.2.1.bb
@@ -73,8 +73,6 @@ do_install_append() {
         install -d ${D}${systemd_unitdir}/system
         install -m 644 ${WORKDIR}/nagios-nrpe.service ${D}${systemd_unitdir}/system/
     fi
-
-    rmdir -p --ignore-fail-on-non-empty ${D}${localstatedir}/nagios
 }
 
 PACKAGES = "${PN}-dbg ${PN}-plugin ${PN}-daemon"
@@ -86,6 +84,7 @@ FILES_${PN}-plugin = "${NAGIOS_PLUGIN_DIR} \
 FILES_${PN}-daemon = "${sysconfdir} \
                       ${bindir} \
                       ${nonarch_libdir}/tmpfiles.d/ \
+                      ${localstatedir} \
 "
 
 RDEPENDS_${PN}-daemon = "nagios-base"
-- 
2.7.4


