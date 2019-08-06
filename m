Return-Path: <Changqing.Li@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A2328E00D5F; Mon,  5 Aug 2019 23:54:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A0217E00D47
	for <meta-virtualization@yoctoproject.org>;
	Mon,  5 Aug 2019 23:54:42 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x766sfOk017264
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 5 Aug 2019 23:54:41 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Mon, 5 Aug 2019 23:54:41 -0700
From: <changqing.li@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 6 Aug 2019 14:54:40 +0800
Message-ID: <1565074480-317469-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] nagios-core/nagios-nrpe: use update-alternatives for /var/nagios
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
X-List-Received-Date: Tue, 06 Aug 2019 06:54:43 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix below error:
Error: Transaction check error:
  file /var/nagios from install of nagios-core-4.4.3-r0.core2_64 conflicts with file from package nagios-nrpe-daemon-3.2.1-r0.core2_64

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-extended/nagios/nagios-core_4.4.3.bb | 6 +++++-
 recipes-extended/nagios/nagios-nrpe_3.2.1.bb | 5 ++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/nagios/nagios-core_4.4.3.bb b/recipes-extended/nagios/nagios-core_4.4.3.bb
index fcf04e9..7a86653 100644
--- a/recipes-extended/nagios/nagios-core_4.4.3.bb
+++ b/recipes-extended/nagios/nagios-core_4.4.3.bb
@@ -25,7 +25,7 @@ SRC_URI[sha256sum] = "bba8f0e8dc8cf72f7a7ae4e8ce9c60f5bd315629421b9ec34818a28b8d
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-inherit autotools-brokensep update-rc.d systemd
+inherit autotools-brokensep update-rc.d systemd update-alternatives
 
 DEPENDS = "gd unzip-native"
 
@@ -151,3 +151,7 @@ INITSCRIPT_NAME = "nagios"
 INITSCRIPT_PARAMS = "defaults"
 
 CVE_PRODUCT = "nagios_core"
+
+ALTERNATIVE_PRIORITY_${PN} = '20'
+ALTERNATIVE_${PN} = "nagios"
+ALTERNATIVE_LINK_NAME[nagios] = "${localstatedir}/nagios"
diff --git a/recipes-extended/nagios/nagios-nrpe_3.2.1.bb b/recipes-extended/nagios/nagios-nrpe_3.2.1.bb
index 3afa5dd..04917f7 100644
--- a/recipes-extended/nagios/nagios-nrpe_3.2.1.bb
+++ b/recipes-extended/nagios/nagios-nrpe_3.2.1.bb
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "8ad2d1846ab9011fdd2942b8fc0c99dfad9a97e57f4a3e6e394a4ead99
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-inherit autotools-brokensep update-rc.d systemd
+inherit autotools-brokensep update-rc.d systemd update-alternatives
 
 # IP address of server which proxy should connect to
 MONITORING_PROXY_SERVER_IP ??= "192.168.7.2"
@@ -97,3 +97,6 @@ SYSTEMD_AUTO_ENABLE_${PN}-daemon = "enable"
 INITSCRIPT_PACKAGES = "${PN}-daemon"
 INITSCRIPT_NAME_${PN}-daemon = "nrpe"
 INITSCRIPT_PARAMS_${PN}-daemon = "defaults"
+
+ALTERNATIVE_${PN}-daemon = "nagios"
+ALTERNATIVE_LINK_NAME[nagios] = "${localstatedir}/nagios"
-- 
2.7.4


