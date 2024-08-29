Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F20EC77B7A
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 06:21:12 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.6424.1724912467250314025
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 28 Aug 2024 23:21:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OomhRFqR;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724912467; x=1756448467;
  h=from:to:cc:subject:date:message-id;
  bh=QZtaRz0plqCfKa2hk6nT8RjyBnKvOslpJJ9u9QHT/rM=;
  b=OomhRFqR8pIfufD0ln2WvhICMKtSRMVHuMBxqgElywQqLlj09QnN482/
   RfdLnDlHMxBAAKi3bw+ovy2NvR0wFmVpJb5uaj2jFDkp6w9zHIzSBZ0jR
   Hloc5Y85weCVzs5i+49slWmOINXNUlqwPyHeQ5Q3NWCCEddGOgDKf0p+t
   3YuDmDN0BJJTFloxljNS+bGJpAngIpnTHQFtD0FygZ+JlvaZT3eoXaVCi
   OC/QnRTdF8c20Qu1gARND5biKRqnr6NxiNNHqMw/4dieXGEURTe38l85P
   XJgKfSu2yd1CZnIwAi2xhusEg4FZYNyZSOBSi3vMaqKAQjybZ019elWDI
   g==;
X-CSE-ConnectionGUID: 9GD1aZ5jQv25XPl/YlSaRw==
X-CSE-MsgGUID: ifWJo/vYRLOCmT00hAEZUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="172017622"
X-IronPort-AV: E=Sophos;i="6.10,184,1719846000"; 
   d="scan'208";a="172017622"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 15:21:04 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A82F1D29EA
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 29 Aug 2024 15:21:02 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id EFC12BF4B6
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 29 Aug 2024 15:21:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 87CA770BE9
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 29 Aug 2024 15:21:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 32D601A000B;
	Thu, 29 Aug 2024 14:21:01 +0800 (CST)
From: wangmy@fujitsu.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization] [PATCH] libvirt: Fix do_package QA issue
Date: Thu, 29 Aug 2024 14:20:57 +0800
Message-Id: <1724912457-10022-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28626.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28626.005
X-TMASE-Result: 10--7.842100-10.000000
X-TMASE-MatchedRID: Q3OJUoK6MKWYg1tgtT05Jzz6L+U/pejxCZa9cSpBObl/uVjvNeIxv/Mz
	LKs5Zq8YTQ0JkPG287/mn3xyPJAJoh2P280ZiGmRowvZ4t/MYW7bjtx2Oq4Xg0VlS5Fk1XJ0qXA
	FsS+trPLi8zVgXoAltr8hWd4lAsFlC24oEZ6SpSkj80Za3RRg8HvuQ+E7K98+rXeH72pmIgeCP3
	htO9vH30TwNlqGbcBi4LMLmAzUE38=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 29 Aug 2024 06:21:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8864

From: Wang Mingyu <wangmy@fujitsu.com>

When enable multilib, the following do_package QA happens:

ERROR: libvirt-v10.5.0+git-r0 do_package: QA Issue: libvirt: Files/directories were installed but not shipped in any package:
  /usr/lib/sysusers.d
  /usr/lib/sysusers.d/libvirt-qemu.conf

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 recipes-extended/libvirt/libvirt_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
index 706d4a40..4e03a962 100644
--- a/recipes-extended/libvirt/libvirt_git.bb
+++ b/recipes-extended/libvirt/libvirt_git.bb
@@ -92,6 +92,7 @@ FILES:${PN} += "${libdir}/libvirt/connection-driver \
 	    ${datadir}/bash-completion/completions/vsh \
 	    ${datadir}/bash-completion/completions/virt-admin \
 	    /usr/lib/firewalld/ \
+            ${nonarch_base_libdir}/sysusers.d/ \
 	    "
 
 FILES:${PN}-dbg += "${libdir}/libvirt/connection-driver/.debug ${libdir}/libvirt/lock-driver/.debug"
-- 
2.34.1


