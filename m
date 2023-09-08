Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84AFAEB8FDE
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 02:43:00 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.31652.1694140972155804533
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 07 Sep 2023 19:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: leimaohui@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="110601642"
X-IronPort-AV: E=Sophos;i="6.02,236,1688396400"; 
   d="scan'208";a="110601642"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 11:42:50 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id CAFB1CD7E2
	for <meta-virtualization@lists.yoctoproject.org>; Fri,  8 Sep 2023 11:42:46 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id BE4E6D4BDB
	for <meta-virtualization@lists.yoctoproject.org>; Fri,  8 Sep 2023 11:42:45 +0900 (JST)
Received: from ubuntu20.g08.fujitsu.local (unknown [10.167.225.227])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4ED6B401F1;
	Fri,  8 Sep 2023 11:42:45 +0900 (JST)
From: leimaohui@fujitsu.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Lei Maohui <leimaohui@fujitsu.com>
Subject: [meta-virtualization] [meta-cloud-services][PATCH] open-iscsi-user: Fix do_package error after usrmerge was enabled.
Date: Fri,  8 Sep 2023 10:42:43 +0800
Message-Id: <20230908024243.222363-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27862.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27862.004
X-TMASE-Result: 10--6.308100-10.000000
X-TMASE-MatchedRID: hWRIiYV8xz+FxmnVS90dVbnHu4BcYSmtCKQyo+jPjif8CKDXhvuAycyg
	Al+yObROtasxpUmh4e74IS0j/HVkZgH3QVwvWrgw/HTKStsDGMJHNQ8CqEKO2EfyM5VfgjG2TH+
	TN4Qu3Bbi8zVgXoAltsIJ+4gwXrEtIAcCikR3vq83ot7YfeE/PupWd6IqMwwUmzhDSx//8nX9sP
	lCzqMXIw5e8HscDAHo
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Sep 2023 02:43:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8286

From: Lei Maohui <leimaohui@fujitsu.com>

ERROR: open-iscsi-user-2.1.7-r1 do_package: QA Issue: open-iscsi-user: Files/directories were installed but not shipped in any package:
  /lib
  /sbin/iscsiuio
  /sbin/brcm_iscsiuio
  /lib/systemd
  /lib/systemd/system-generators
  /lib/systemd/system
  /lib/systemd/system-generators/ibft-rule-generator
  /lib/systemd/system/iscsi-init.service
  /lib/systemd/system/iscsi.service
  /lib/systemd/system/iscsid.service
  /lib/systemd/system/iscsid.socket
  /lib/systemd/system/iscsiuio.socket
  /lib/systemd/system/iscsiuio.service
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
open-iscsi-user: 13 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 .../open-iscsi/open-iscsi-user_2.1.7.bb                | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.7.bb b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.7.bb
index 8cedff4..1f84508 100644
--- a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.7.bb
+++ b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.7.bb
@@ -44,12 +44,6 @@ FILES:${PN} += " \
     ${systemd_unitdir}/system-generators/ibft-rule-generator \
 "
 
-do_install:append() {
-    rm -rf ${D}${systemd_unitdir}/
-
-    install -d ${D}${systemd_unitdir}/system
-    install -d ${D}${systemd_unitdir}/system-generators
-    install -m 0644 ${S}/etc/systemd/*.service ${D}${systemd_unitdir}/system/
-    install -m 0644 ${S}/etc/systemd/*.socket ${D}${systemd_unitdir}/system/
-    install -m 0644 ${S}/etc/systemd/ibft-rule-generator ${D}${systemd_unitdir}/system-generators/
+do_install() {
+    oe_runmake install DESTDIR=${D} prefix=${exec_prefix} LIBDIR=${libdir} sbindir=${sbindir} SBINDIR=${sbindir} systemddir=${systemd_unitdir}
 }
-- 
2.34.1


