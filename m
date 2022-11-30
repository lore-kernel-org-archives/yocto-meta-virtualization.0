Return-Path: <chaitanya.vadrevu@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86053C4321E
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 21:16:36 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web10.24916.1669842987462648694
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 30 Nov 2022 13:16:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=AaKWTmSX;
 spf=pass (domain: ni.com, ip: 148.163.156.75, mailfrom: prvs=93332f2929=chaitanya.vadrevu@ni.com)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AUHK4LH005623
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Nov 2022 15:16:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS11062020;
 bh=ubYujldCMXdxELkGKXri/sh14bGT0NCLrv2ASq+0D+Y=;
 b=AaKWTmSXygwKPUM3EkBT7X/VnlswjRM2sapQ/5Owk5gQSSwPk3YpI3hW0pdzeK8RL5ZZ
 /RiXywVinhMUUSbUfFQQIsBnvjet2RZ3fxzlqrPi69GvENMKtiH6IQaVeEvHyxEMTpHP
 hiZCOxQA3XQ11QW3DORi1A84ox2gPAQ/U8yCZs2zwYlK+lo162GEesxaeZaNC0NEyZIg
 8DXcLGUzyZGvYfUsL1a26uvHfc1T5EqT6DoH7ELz1JBegO1+8bN6NvTY/bzXwxBamQ9Q
 ExL7pdHuEqnlzcTnT/x5w+7qrHmM7dWJhLQfU6AbozADz0B/StHQmEXI2EcAFhLDUT2t WA== 
Received: from ni.com ([130.164.80.23])
	by mx0a-00010702.pphosted.com (PPS) with ESMTPS id 3m3h708dyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Nov 2022 15:16:26 -0600
Received: from us-aus-excas-p1.ni.corp.natinst.com (us-aus-excas-p1.ni.corp.natinst.com [130.164.68.17])
	by us-aus-skprod2.natinst.com (8.16.1.2/8.16.1.2) with ESMTPS id 2AULGP7X021478
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Nov 2022 15:16:25 -0600
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.7; Wed, 30 Nov 2022 15:16:25 -0600
Received: from cvadrevu-p620.amer.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server id 15.2.1118.7 via Frontend Transport; Wed, 30 Nov 2022 15:16:25 -0600
From: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Subject: [meta-virtualization][m-c-s][kirkstone][PATCH 1/2] libvirt: Update bbappends version from 6 to 8
Date: Wed, 30 Nov 2022 15:16:22 -0600
Message-ID: <20221130211623.3617596-1-chaitanya.vadrevu@ni.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: QfvoOrB6UsRqGVAPFw21iE3rJFsQGUBk
X-Proofpoint-ORIG-GUID: QfvoOrB6UsRqGVAPFw21iE3rJFsQGUBk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-30_04,2022-11-30_02,2022-06-22_01
X-Proofpoint-Spam-Reason: orgsafe
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Nov 2022 21:16:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7717

meta-virtualization has upgraded libvirt to 8.1

Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
---
 .../libvirt/{libvirt_6.%.bbappend => libvirt_8.%.bbappend}        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-openstack/recipes-extended/libvirt/{libvirt_6.%.bbappend => libvirt_8.%.bbappend} (100%)

diff --git a/meta-openstack/recipes-extended/libvirt/libvirt_6.%.bbappend b/meta-openstack/recipes-extended/libvirt/libvirt_8.%.bbappend
similarity index 100%
rename from meta-openstack/recipes-extended/libvirt/libvirt_6.%.bbappend
rename to meta-openstack/recipes-extended/libvirt/libvirt_8.%.bbappend
-- 
2.34.1


