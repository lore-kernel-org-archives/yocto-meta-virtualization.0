Return-Path: <zachary.zet.li.chua@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54DB6C83F1A
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 05:51:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by mx.groups.io with SMTP id smtpd.web10.5681.1753336274939585924
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Jul 2025 22:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=mD77hqZh;
 spf=pass (domain: intel.com, ip: 192.198.163.13, mailfrom: zachary.zet.li.chua@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753336275; x=1784872275;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=M6RNRyITLgbjFwnROAKV+xsdGsH045V31lu9MvL/r+8=;
  b=mD77hqZhpEfVcbkEjB65kzD39XKAHrTBBxnxqrhTm6x2o0l5HGS3VRVV
   kiVAoA1UaDl4xsIaZNMnNGQhJJhtTC3Bz6cwKS74TAGXmqRuNP0qYNgli
   3fgknQNYTOLMLeKupfTNmiYRz+PglQMIcMCCrbj+ahfudGkuIVeTbE3Uu
   wvfZHkwlaktE5vsWlHIDsUNrFPQCulaORzhYYzlo/19SaikPARf2OZtly
   oLKyw/ux03qEsIoqXVlNDtTYAGhiSFi4hCYVVA4YpZgTb80E6lRXckw12
   U1Rm1PFbUhGxL71Vx7NCtIGuMz2oJxKMee03IwZ3SLtvMXGEZYVBgpwTi
   Q==;
X-CSE-ConnectionGUID: xyJHQB7PQRCl7tCj0yHwsQ==
X-CSE-MsgGUID: VlGOgWdQRtGeKtAKQpD1+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="58248138"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="58248138"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 22:51:14 -0700
X-CSE-ConnectionGUID: kwBnJKe5SfuAcSEp26Gj5w==
X-CSE-MsgGUID: x+AgC+9bRt6z4NHuMNQDgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="165564099"
Received: from bassr3devlab04.iind.intel.com ([10.223.23.249])
  by orviesa005.jf.intel.com with ESMTP; 23 Jul 2025 22:51:14 -0700
From: zachary.zet.li.chua@intel.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [scarthgap][PATCH] virt-manager: update RDEPENDS
Date: Thu, 24 Jul 2025 05:50:13 +0000
Message-ID: <20250724055013.3358042-1-zachary.zet.li.chua@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 24 Jul 2025 05:51:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9329

From: "Chua, Zachary Zet Li" <zachary.zet.li.chua@intel.com>

Update RDEPENDS to fix following errors when run virt-manager:

|   File "/usr/share/virt-manager/virtManager/virtmanager.py", line 13, in <module>
|     import gi
| ModuleNotFoundError: No module named 'gi'

|   File "/usr/lib/python3.12/site-packages/gi/__init__.py", line 122, in require_version
|     raise ValueError('Namespace %s not available' % namespace)
| ValueError: Namespace LibvirtGLib not available

|   File "/usr/share/virt-manager/virtinst/xmlapi.py", line 7, in <module>
|     import libxml2
| ModuleNotFoundError: No module named 'libxml2'

|   File "/usr/share/virt-manager/virtinst/install/urlfetcher.py", line 16, in <module>
|      import requests
| ModuleNotFoundError: No module named 'requests'

Update RDEPENDS for package virt-manager-install which are required by
command virt-install. For example, the error is as follows when missing
virsh:

  Error launching ['virsh', '--connect', 'qemu:///system', 'console',
    'myvm']: [Errno 2] No such file or directory

Commits are taken from 'master' branch:
- 032415ef6b7d48ca34bb1d23cb8c194a38e0c369
- 238020e42060764e7d2aadbb43a12792ed8b7e27

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Chua, Zachary Zet Li <zachary.zet.li.chua@intel.com>
---
 .../virt-manager/virt-manager_4.1.0.bb           | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/virt-manager/virt-manager_4.1.0.bb b/recipes-extended/virt-manager/virt-manager_4.1.0.bb
index a2395012..d752fd2b 100644
--- a/recipes-extended/virt-manager/virt-manager_4.1.0.bb
+++ b/recipes-extended/virt-manager/virt-manager_4.1.0.bb
@@ -28,8 +28,20 @@ RDEPENDS:${PN}-common += " \
   libosinfo \
 "
 
-RDEPENDS:${PN} = "${PN}-common"
-RDEPENDS:${PN}-install = "${PN}-common"
+RDEPENDS:${PN} = " \
+  ${PN}-common \
+  libvirt-glib \
+  libxml2-python \
+  python3-pygobject \
+  python3-requests \
+"
+RDEPENDS:${PN}-install = " \
+  ${PN}-common \
+  libvirt-virsh \
+  libxml2-python \
+  python3-pygobject \
+  python3-requests \
+"
 
 SETUPTOOLS_INSTALL_ARGS += "${PACKAGECONFIG_CONFARGS}"
 
-- 
2.43.0


