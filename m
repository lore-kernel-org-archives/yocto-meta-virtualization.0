Return-Path: <chaitanya.vadrevu@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65189C47089
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 20:49:16 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web10.24140.1669841347990935249
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 30 Nov 2022 12:49:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=oEnNDv9w;
 spf=pass (domain: ni.com, ip: 148.163.156.75, mailfrom: prvs=93332f2929=chaitanya.vadrevu@ni.com)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AUHYTbf005147
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Nov 2022 14:49:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS11062020;
 bh=ubYujldCMXdxELkGKXri/sh14bGT0NCLrv2ASq+0D+Y=;
 b=oEnNDv9wcjnXXv9B7ISRLRjCiPEuw3G0wUI7BeWB0RCEBujnTGPXFsc6arCzsKN/gOnb
 AW7K8ArFkdzPc/8zyW40eehiCm9HDMR359KTZCiiQFHejlnQ9S5z1uktWFBSNgVINsBa
 I/eC+sHLo7WI5IJruwekg9JAryl+ycTbdFH6lhifMS8L2ZYF9PfWt0W6NW8jqUlR0I7Z
 RzXhhBVAP19wH7NfA1kg3bqnVcsIUJwwFqtsPtBMWlGz1hhz6tzIETufhOC6lTjcrzDl
 HXm+cXkqmNqd1jGN2BwLKUmyxjxlIfDivvyPVnOI7TIDZhryJONbHLXYydt4KZbGYemV dA== 
Received: from ni.com ([130.164.80.24])
	by mx0a-00010702.pphosted.com (PPS) with ESMTPS id 3m3h708cmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Nov 2022 14:49:07 -0600
Received: from us-aus-excas-p1.ni.corp.natinst.com (us-aus-excas-p1.ni.corp.natinst.com [130.164.68.17])
	by us-aus-skprod3.natinst.com (8.16.1.2/8.16.1.2) with ESMTPS id 2AUKn6So003371
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Nov 2022 14:49:06 -0600
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.7; Wed, 30 Nov 2022 14:49:06 -0600
Received: from cvadrevu-p620.amer.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server id 15.2.1118.7 via Frontend Transport; Wed, 30 Nov 2022 14:49:06 -0600
From: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Subject: [meta-virtualization][m-c-s][PATCH 1/2] libvirt: Update bbappends version from 6 to 8
Date: Wed, 30 Nov 2022 14:48:42 -0600
Message-ID: <20221130204843.3524686-1-chaitanya.vadrevu@ni.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: gt5iEjVJdiksoDGEpMd-ym-KJwdfwQab
X-Proofpoint-ORIG-GUID: gt5iEjVJdiksoDGEpMd-ym-KJwdfwQab
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-30_04,2022-11-30_02,2022-06-22_01
X-Proofpoint-Spam-Reason: orgsafe
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Nov 2022 20:49:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7715

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


