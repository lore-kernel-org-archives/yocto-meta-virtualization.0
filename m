Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD19C83F07
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 00:12:23 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.1889.1751587938872529544
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 03 Jul 2025 17:12:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lXd1OZ29;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751587938; x=1783123938;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=g03o6oAZe1wQMA8O48yvdWUEtlUSQ1I1cKFamBzLCps=;
  b=lXd1OZ29CK40Oarnjp3Wm9h6NtZY6JzE4Qy9Gxb61ROlspu1JkWK32/V
   KFa2C5he99L6tCVeoF3Hb8Qf/3ZPK8rdOCySubqqaWgBoyjC7FRKyJxFk
   YV6VLJFMeGJFjSSQLYAvZFW/SZNTI4y07YtZlWNEozV1T7NBPYe6JtrKI
   QeJNTPKfmJ0sep7J7DyzfMh2YaLu7ISJ+FNQIz267lqPXFoiqktuojf/g
   hTsw09DUyBt+lNEX2Rinmb/Sl6ey5e8aBLGlRij8DEXtjSCUqzjyLWOyO
   9nHxgbzniHS1e3RVgFnCUATl+XO9AED0eoOkL7zxbAmxadN/KjEaIC6H8
   g==;
X-CSE-ConnectionGUID: 1FvUr4LHR9KI56OR4+24AA==
X-CSE-MsgGUID: kYq95Fh2Q2Oih66Ksxp3tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="205684476"
X-IronPort-AV: E=Sophos;i="6.16,285,1744038000"; 
   d="scan'208";a="205684476"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 09:12:13 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 04152820701
	for <meta-virtualization@lists.yoctoproject.org>; Fri,  4 Jul 2025 00:12:14 +0000 (UTC)
Received: from yto-m2.gw.nic.fujitsu.com (yto-m2.gw.nic.fujitsu.com [10.128.47.163])
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTP id 7EAFD18000DA
	for <meta-virtualization@lists.yoctoproject.org>; Fri,  4 Jul 2025 00:12:13 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id F2F702DC02
	for <meta-virtualization@lists.yoctoproject.org>; Fri,  4 Jul 2025 09:12:11 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 73C861A0071;
	Fri,  4 Jul 2025 08:12:11 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization] [PATCH 1/4] lxc: drop unneeded S assignment
Date: Fri,  4 Jul 2025 08:12:04 +0800
Message-ID: <20250704001207.250-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 04 Jul 2025 00:12:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9291

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 recipes-containers/lxc/lxc_git.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
index 63123590..b3011f16 100644
--- a/recipes-containers/lxc/lxc_git.bb
+++ b/recipes-containers/lxc/lxc_git.bb
@@ -52,8 +52,6 @@ SRC_URI = "git://github.com/lxc/lxc.git;branch=stable-6.0;protocol=https \
 SRCREV = "fe31d844e882d5cc176a7935a93b14b4b2823992"
 PV = "v6.0.3"
 
-S = "${WORKDIR}/git"
-
 # Let's not configure for the host distro.
 #
 PTEST_CONF = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '-Dtests=true', '', d)}"
-- 
2.43.0


