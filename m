Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web11.5545.1619744593406961645
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 29 Apr 2021 18:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.168.0.2])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 13U13BoI003162
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 29 Apr 2021 20:03:12 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 0/1] Fix for xilinx bbappend
Date: Thu, 29 Apr 2021 20:03:09 -0500
Message-Id: <20210430010311.29911-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1

This change applies to gatesgarth, hardknott and master.  The same patch
applied to all three branches.

Without this change, it's not possible to build an eSDK w/ Xen enabled.

Mark Hatle (1):
  xen: Remove deltask for setscene

 dynamic-layers/xilinx/recipes-extended/xen/xen-xilinx.inc | 3 ---
 1 file changed, 3 deletions(-)

-- 
2.17.1

