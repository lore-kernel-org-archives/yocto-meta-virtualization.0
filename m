Return-Path: <chaitanya.vadrevu@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 878A9C47089
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 21:16:36 +0000 (UTC)
Received: from mx0a-00010702.pphosted.com (mx0a-00010702.pphosted.com [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web10.24917.1669842988149116719
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 30 Nov 2022 13:16:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=wK0kiIBO;
 spf=pass (domain: ni.com, ip: 148.163.156.75, mailfrom: prvs=93332f2929=chaitanya.vadrevu@ni.com)
Received: from pps.filterd (m0239462.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AUH5eaD000796
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Nov 2022 15:16:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS11062020;
 bh=wre8GPmx3JdHPWhOF2pI3WsMODcZbLphgyzNqQoCx5E=;
 b=wK0kiIBO7TR6CrIPSe574C/whToqy3CLntimkA5HRlAC6XIwN4V/TeXYWPxaDbidcEIC
 9jgD0yRnfBKezGz+ELwYwTy8WAbciHzhLg8+4RqdC1CZWFTV63aoTTLul9SzRdul06ER
 TySqb/bXlfCHqEhwzlJaKFKdokD8+SNNT0lRDO5C4XMarVOVuWOtP56bDiozELVfOWwz
 OAXtadr4fpjT8phao55IEeYkAsS2rwYOHuO8AjexiCPkL1B5VK8il3OOKqikMAhuCMcx
 o+jXuPwot/fAuLT6CFmbIjZHqBRgizu5ox1TkW9JmEdza6KGXG6AlLzLpl7dgfkz0b98 hw== 
Received: from ni.com ([130.164.80.24])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3m3frmrh8d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Nov 2022 15:16:27 -0600
Received: from us-aus-excas-p1.ni.corp.natinst.com (us-aus-excas-p1.ni.corp.natinst.com [130.164.68.17])
	by us-aus-skprod3.natinst.com (8.16.1.2/8.16.1.2) with ESMTPS id 2AULGQLH021440
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Nov 2022 15:16:26 -0600
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.7; Wed, 30 Nov 2022 15:16:26 -0600
Received: from cvadrevu-p620.amer.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server id 15.2.1118.7 via Frontend Transport; Wed, 30 Nov 2022 15:16:26 -0600
From: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Subject: [meta-virtualization][m-c-s][kirkstone][PATCH 2/2] qemu: Update bbappends version from 5 to 6
Date: Wed, 30 Nov 2022 15:16:23 -0600
Message-ID: <20221130211623.3617596-2-chaitanya.vadrevu@ni.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221130211623.3617596-1-chaitanya.vadrevu@ni.com>
References: <20221130211623.3617596-1-chaitanya.vadrevu@ni.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: v9z6BChJ1QGR8S9wcFJ94bzy22y3s_ue
X-Proofpoint-ORIG-GUID: v9z6BChJ1QGR8S9wcFJ94bzy22y3s_ue
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-30_04,2022-11-30_02,2022-06-22_01
X-Proofpoint-Spam-Reason: orgsafe
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Nov 2022 21:16:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7718

openembedded-core has upgraded qemu to 6.2

Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
---
 .../qemu/{qemu_5.%.bbappend => qemu_6.%.bbappend}                 | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-openstack/recipes-devtools/qemu/{qemu_5.%.bbappend => qemu_6.%.bbappend} (100%)

diff --git a/meta-openstack/recipes-devtools/qemu/qemu_5.%.bbappend b/meta-openstack/recipes-devtools/qemu/qemu_6.%.bbappend
similarity index 100%
rename from meta-openstack/recipes-devtools/qemu/qemu_5.%.bbappend
rename to meta-openstack/recipes-devtools/qemu/qemu_6.%.bbappend
-- 
2.34.1


