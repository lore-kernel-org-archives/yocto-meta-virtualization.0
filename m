Return-Path: <biannm@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0F626E00A5B; Thu, 18 Jun 2015 22:14:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Greylist: delayed 63 seconds by postgrey-1.32 at yocto-www;
	Thu, 18 Jun 2015 22:14:04 PDT
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9F3FBE009D6
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Jun 2015 22:14:04 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.13,625,1427731200"; d="scan'208";a="97310407"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Jun 2015 13:16:59 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5J5BEXm031676
	for <meta-virtualization@yoctoproject.org>;
	Fri, 19 Jun 2015 13:11:14 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 19 Jun 2015 13:13:05 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 19 Jun 2015 13:04:01 +0800
Message-ID: <1434690241-57136-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-cloud-services][PATCH] dhcp: fix build error
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
X-List-Received-Date: Fri, 19 Jun 2015 05:14:08 -0000
Content-Type: text/plain

dhcp in oe-core has been upgrade to 4.3.2, so the following error will be caught.

 ERROR: No recipes available for:
   /yocto/meta-cloud-services/recipes-connectivity/dhcp/dhcp_4.3.1.bbappend

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 recipes-connectivity/dhcp/dhcp_%.bbappend     | 16 ++++++++++++++++
 recipes-connectivity/dhcp/dhcp_4.3.1.bbappend | 16 ----------------
 2 files changed, 16 insertions(+), 16 deletions(-)
 create mode 100644 recipes-connectivity/dhcp/dhcp_%.bbappend
 delete mode 100644 recipes-connectivity/dhcp/dhcp_4.3.1.bbappend

diff --git a/recipes-connectivity/dhcp/dhcp_%.bbappend b/recipes-connectivity/dhcp/dhcp_%.bbappend
new file mode 100644
index 0000000..a23f7c9
--- /dev/null
+++ b/recipes-connectivity/dhcp/dhcp_%.bbappend
@@ -0,0 +1,16 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+SRC_URI += "file://dhclient-exit-hooks \
+           "
+
+do_install_append () {
+	install -m 0644 ${WORKDIR}/dhclient-exit-hooks ${D}${sysconfdir}/dhcp/dhclient-exit-hooks
+	sed 's%/etc/dhclient-exit-hooks%/etc/dhcp/dhclient-exit-hooks%g' -i ${D}${base_sbindir}/dhclient-script
+
+	sed 's%request .*%\noption classless-static-routes code 121 = array of unsigned integer 8;\n\n&%g' -i ${D}${sysconfdir}/dhcp/dhclient.conf
+	sed 's%netbios-name-servers,.*netbios-scope;%netbios-name-servers, netbios-scope, classless-static-routes;\n%g' -i ${D}${sysconfdir}/dhcp/dhclient.conf
+
+}
+
+FILES_dhcp-client += "${sysconfdir}/dhcp/dhclient-exit-hooks \
+                     "
diff --git a/recipes-connectivity/dhcp/dhcp_4.3.1.bbappend b/recipes-connectivity/dhcp/dhcp_4.3.1.bbappend
deleted file mode 100644
index a23f7c9..0000000
--- a/recipes-connectivity/dhcp/dhcp_4.3.1.bbappend
+++ /dev/null
@@ -1,16 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
-
-SRC_URI += "file://dhclient-exit-hooks \
-           "
-
-do_install_append () {
-	install -m 0644 ${WORKDIR}/dhclient-exit-hooks ${D}${sysconfdir}/dhcp/dhclient-exit-hooks
-	sed 's%/etc/dhclient-exit-hooks%/etc/dhcp/dhclient-exit-hooks%g' -i ${D}${base_sbindir}/dhclient-script
-
-	sed 's%request .*%\noption classless-static-routes code 121 = array of unsigned integer 8;\n\n&%g' -i ${D}${sysconfdir}/dhcp/dhclient.conf
-	sed 's%netbios-name-servers,.*netbios-scope;%netbios-name-servers, netbios-scope, classless-static-routes;\n%g' -i ${D}${sysconfdir}/dhcp/dhclient.conf
-
-}
-
-FILES_dhcp-client += "${sysconfdir}/dhcp/dhclient-exit-hooks \
-                     "
-- 
1.8.4.2


