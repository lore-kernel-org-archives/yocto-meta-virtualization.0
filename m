Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F2CC83F1A
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 01:28:28 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.11006.1752802104559386931
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 17 Jul 2025 18:28:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ue6kT+0t;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752802105; x=1784338105;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aJEj6j2VtxdRNhg2D63CINPuDKcuVOpNTi043FgbQ+M=;
  b=Ue6kT+0tBnjf108Zym/D702GuWYk9akgq30ptm7S1UVGFEllCfXwEduo
   fgqxkIivaOXGMzxb3Ce0s5cplvtS9qdIVQjmjCRIrFSFso+l5oOhumzEK
   eZE0MsOZ6ITOWzeW+uPptcwDlEpIf4JPttN3rpgFWVD4q14MCstJEsClw
   4qH/EMpi+MzwpnNFALubcVKmp2r7aYeob5OEo+3axKf8w4J3IIP9gFjO7
   4pY2rwOZVDbW4Eh0a9AUtsZHbmxRIZgtztTSOjUuw1z0lrhu1pkw4qExQ
   UStX2hrLQRCuLCAV7mhHUqiBBXBN2Cs38JtifLbsbKFNnEL8RvuzDFFyH
   g==;
X-CSE-ConnectionGUID: iffv5d6cSo6Wkvmjj18eyg==
X-CSE-MsgGUID: lsBCEuYmSpGFXKmZ/YeeZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="206683454"
X-IronPort-AV: E=Sophos;i="6.16,320,1744038000"; 
   d="scan'208";a="206683454"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 10:28:23 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 6287382072E
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 18 Jul 2025 01:28:22 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id C354DC02F09
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 18 Jul 2025 01:28:21 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 140EA1A0074;
	Fri, 18 Jul 2025 09:28:17 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [meta-virtualization][PATCH] openvswitch: small ptest fix adapt to UNPACKDIR changes
Date: Fri, 18 Jul 2025 09:28:08 +0800
Message-ID: <20250718012808.1403-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 18 Jul 2025 01:28:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9319

Assume the build conf dir is /mnt/test/build_auh
before UNPACKDIR change:
S="/mnt/test/build_auh/tmp/work/qemuarm64-poky-linux/openvswitch/3.5.0/git"
after UNPACKDIR change:
S="/mnt/test/build_auh/tmp/work/qemuarm64-poky-linux/openvswitch/3.5.0/sources/openvswitch-3.5.0"

Then we should change ptest patch to adapt to it

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...tch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch
index abad1458..e55e434d 100644
--- a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch
+++ b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch
@@ -86,7 +86,7 @@ index 0000000..0b4587c
 +	install $(srcdir)/utilities/ovs-pki.in $(TEST_DEST)/utilities ;\
 +	for p in $$list ; do \
 +	  echo $$p ;\
-+	  p=$${p#../git/} ;\
++	  p=$${p#../sources/openvswitch*/} ;\
 +	  pre=$${p#tests\/} ;\
 +	  if test $$pre != $$p ; then \
 +	    echo installing $$p to $(TEST_DEST)/tests/$$pre ;\
-- 
2.43.0


