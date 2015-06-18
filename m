Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 904E8E00A5B; Wed, 17 Jun 2015 23:11:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 25A93E00A4B
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 Jun 2015 23:11:00 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.13,625,1427731200"; d="scan'208";a="97248628"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Jun 2015 14:15:07 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5I69MtY007265
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Jun 2015 14:09:22 +0800
Received: from localhost.localdomain (10.167.226.85) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 18 Jun 2015 14:10:57 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 18 Jun 2015 14:10:53 +0800
Message-ID: <1434607853-2097-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.85]
Subject: [PATCH] open-iscsi-user: fix warnings and errors.
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
X-List-Received-Date: Thu, 18 Jun 2015 06:11:05 -0000
Content-Type: text/plain

WARNING: QA Issue: /usr/sbin/iscsi@underscore@discovery_open-iscsi-user contained
in package open-iscsi-user requires /bin/bash,
but no providers found in its RDEPENDS [file-rdeps]

ERROR: Function failed: SYSTEMD_SERVICE_open-iscsi-user-systemd value
iscsi-initiator.service does not exist

Also,modify the LICENSE from GPL to GPLv2.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../recipes-connectivity/open-iscsi/open-iscsi-user_2.0-871.bb   | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.0-871.bb b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.0-871.bb
index 593d791..5b3a257 100644
--- a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.0-871.bb
+++ b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.0-871.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Open-iSCSI project is a high performance, transport independent, multi-platform implementation of RFC3720."
 HOMEPAGE = "http://www.open-iscsi.org/"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 PR = "r1"
 
 inherit systemd
@@ -38,15 +38,18 @@ SRC_URI_append = "  file://iscsi-initiator                                   \
                     file://iscsi-initiator.service                           \
                     file://iscsi-initiator-targets.service                   \
                  "
+RDEPENDS_${PN} += "bash"
 RDEPENDS_${PN}-systemd += "${PN}"
 FILES_${PN}-systemd +=  "   ${base_libdir}/systemd                  \
                             ${sysconfdir}/default/iscsi-initiator   \
                         "
 SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = " iscsi-initiator.service iscsi-initiator-targets.service "
-
+SYSTEMD_SERVICE_${PN}-systemd = "iscsi-initiator.service iscsi-initiator-targets.service"
 
 do_install_append () {
         install -d ${D}${sysconfdir}/default/
         install -m 0644 ${WORKDIR}/iscsi-initiator ${D}${sysconfdir}/default/
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/iscsi-initiator.service ${D}${systemd_unitdir}/system/
+        install -m 0644 ${WORKDIR}/iscsi-initiator-targets.service ${D}${systemd_unitdir}/system/
 }
-- 
1.8.4.2


