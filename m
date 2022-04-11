Return-Path: <preeti.sachan@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5193AC3A5A3
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:59 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.24072.1649637524671384079
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 10 Apr 2022 17:38:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=jkj/3/6d;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: preeti.sachan@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649637524; x=1681173524;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bBw0w++zQ4f93Mrh9IkENonWEFQQON2Cspjx2QRXu48=;
  b=jkj/3/6dkL4j9jwVJAQuyEtVo1A+rQmvFKQuYqBk3B1k0UiPQ2mSlh9Q
   a6tcozGG+FPmLWYnRa3u3OK5tZix2/XHvEgnTXmvkkCdOh7bpRYCthFQj
   UUzp+32DkHyZ5A9MP/VElH8JFopvmnOeifOCK6UTOF7bAFczpnHbdLCIW
   69psnoBWrRZMrh1kAOekaFeFCYVMwsx19uk/4MOLGa5NuTU4/R3kY/Rkv
   +iDmTw06qdxNnfOFMFPcewTa6u4o6PHj5/BtVeGlZ5Uu3+x6jUgoZNgEZ
   WPfvAf6njsCBmLdXHOIgmCz/eEN2dONyqFq3hNWsGGtZZ//SXq7NgVMP2
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="262186542"
X-IronPort-AV: E=Sophos;i="5.90,250,1643702400";
   d="scan'208";a="262186542"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2022 17:38:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,250,1643702400";
   d="scan'208";a="525753916"
Received: from preeti-ilbpg12.png.intel.com ([10.88.227.75])
  by orsmga006.jf.intel.com with ESMTP; 10 Apr 2022 17:38:42 -0700
From: preeti.sachan@intel.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] libvirt: fix do_package issue
Date: Sun, 10 Apr 2022 20:38:34 -0400
Message-Id: <20220411003834.1547923-1-preeti.sachan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Apr 2022 17:17:59 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7144

From: Preeti Sachan <preeti.sachan@intel.com>

Signed-off-by: Preeti Sachan <preeti.sachan@intel.com>
---
 recipes-extended/libvirt/libvirt_8.1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/libvirt/libvirt_8.1.0.bb b/recipes-extended/libvirt/libvirt_8.1.0.bb
index b90fb70..712cea8 100644
--- a/recipes-extended/libvirt/libvirt_8.1.0.bb
+++ b/recipes-extended/libvirt/libvirt_8.1.0.bb
@@ -63,6 +63,7 @@ FILES:${PN}-libvirtd = " \
 	${sysconfdir}/logrotate.d \
 	${sysconfdir}/libvirt/libvirtd.conf \
         /usr/lib/sysctl.d/60-libvirtd.conf \
+        /usr/lib/sysctl.d/60-qemu-postcopy-migration.conf \
 	${sbindir}/libvirtd \
 	${systemd_system_unitdir} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '', '${libexecdir}/libvirt-guests.sh', d)} \
-- 
2.25.1


