Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6562C6369B
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.29223.1649683779855194754
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Apr 2022 06:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=CEw/AVWj;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=1100a70fa3=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23BCuWdt026239
	for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Apr 2022 06:29:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=WGolH9DX7yYaImaIOwQcNB41ieb3noY3U1fTAnu22o8=;
 b=CEw/AVWj2SurMGopZ1Oeb4huLh7Kn2mn4rdqYBQieBJ38pEgqAPW9Ka/xbz3e46D5lOR
 G99rWx+Z4qQIdj72jE7ZWxBtZlmFV4QnMWzBEyUkgI1C6Nsrl5UTgaAu3Cn2seit4rTJ
 h6MLs1M7fLplqw9vu1KtPqPz8HJ1g1eoHiF5XpCZExR5zstqvW46uarXhLPk0vNpTN/V
 KWhSz2/9HKRVr9Gp/g93HaTvPAQFP1j3WAUqc/G13L0MatX4nnmodGFYBcY+8JMcO/iw
 dL50n2D88Cwg4Hx3UwPxSKUwWjc5KrjJGngLtWJbhxjJ/lQbNbumI69BbRTWHzuO9LGo bw==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fb9nfs8hf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Apr 2022 06:29:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UcF0F8a4x5BxD9Gfa/4p7AYRHSXzzDkbBAYOmv3L0np941u3DLV18LEJEzS1S8b/nyuzPhuzd1xx5ztWHxzHoTkCDUVnflyUbKy1fLFBmWvylBqIuwaemfrdLUGWQzaJbur9kG9hbzV516txuaA8cNL2IprSQVKu0zBqEWokJ5Mx5R8eJwqxnBAAscSTZywN6S4v2dqYOW0u3nLgwVRNVy2ag6hEOf9dWKyJs8G0bbUA90HmrwxCgkK06zy0k9N/lJ8724dBXLf0HfgAiVX41DLH+OCu+G6LNFi1aXWszvP2xR79lTVZiVnTh8BdoW0ijfxRQc1OCSnLgdMF5REENQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGolH9DX7yYaImaIOwQcNB41ieb3noY3U1fTAnu22o8=;
 b=kV13vBK/hGstOqKV5ParetcqIsIGczGF40+9JTjIYFSaqGBTz9huELMQHLhfH5h/wDvmllpSuHaL7ijbatmoXm2PLUqYY+lrN0cJmRwH1LRHfa8JvAuGLtm0HPWffXsvwz2pmh3zdcFSUqipxTIfjZkDlf9cM5k82q7nMBSzvR4rK3EgOlxt1/fLNtgL0PK9uCm79am9ubQkpWgmNNJvZUWXXFRnRx2nEfq5ZsN6RO36tfZiLnUbQvCrM1wYyMyhdr8XMJ1wSA0JzGL6ktXBu0QwImjb5bkV2BpMRTawaL8X+afSrmGc/cL4JPm2w+hU+VebkTMLJc4FrGARzLeemA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 13:29:37 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f0d0:2344:b876:db97]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f0d0:2344:b876:db97%7]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 13:29:37 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] libvirt: package all sysctl conf files
 for libvirtd
Date: Mon, 11 Apr 2022 06:29:21 -0700
Message-Id: <20220411132921.35512-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0356.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::31) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7929c9d-667d-46f9-a780-08da1bbf52c3
X-MS-TrafficTypeDiagnostic: LV2PR11MB6024:EE_
X-Microsoft-Antispam-PRVS: 
	<LV2PR11MB6024EDDA18856F0061B59EB0EDEA9@LV2PR11MB6024.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Cxlnnzq0ddTFqc4XeJ59ecxxzTm1KYDp27AiWXhWFkJJbBmZy+9+IwkNEYWnhS6f37BcopEYmo7+vXLbLJEf0rRRq8iXLtCB647E4mQFPxQpwvF07Koc87Em4UQodXV+xlel1KpZwEYU06MpNor4y4i1s4EpIpyQrndkgk2tcSj53TNlBEZtRHTd/gTERAK4qgRh1z/x1fxxhcYHvkpO9fWl/2ktThfSv7DZMWW/t0Re9xgCzMw0ZsAWAW37fWcqLsQTkBUF1jssFBM55zu68jWwzcRxlYf02TPSNNnr9uG72IDr7PlY7xpFaWLAehNHuoUyjBh4Mi/b42Mp9RV9YFbZ14YmKWRT9DxIAQaVDpZbjSdrTjsqtjwHQYKlDKJ8WsBobHoSP62FzICFhnBZ+W9t9pbJqEnbsJibCrE4Z8Nr6dCYptFLSxOWXAfSG+gGygkzA8filnzDKi9FVwF2TlOkQbX2AJCEpHS3cA55KaMoW8ttEepX6UKAIp8IAnCe/tYkbUe0stwp0pZK7ziVeaSqiGLDdjoqEw4LHZcEcdlgjFs0BFXBZKugQhA08B5QQQjziwZPwVgcXISXRNxJrFNSyyqPcKbTAuGFTw29pngtnrnzWRREIREy9XPkGC7C7IeiIrr3fYP+u8Lob5CgJ5POkThx8JLlh4iPWeHt76iBSFH4iH0r8r25sXHdrgU5L6JQ7j37Xh3vb9cAkZ2VqA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(38350700002)(38100700002)(6486002)(6916009)(6666004)(2906002)(6512007)(508600001)(316002)(5660300002)(52116002)(6506007)(1076003)(26005)(186003)(36756003)(66556008)(66946007)(8676002)(8936002)(66476007)(83380400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tup/mrkawrvZjNs3I928Cbvjn3SMb/p0txFlLW1ApYKopEs3+6oxWHtubrwK?=
 =?us-ascii?Q?K9UbbYk+Fk1wR4K8ykEkiB61Qt4oKYLHfIcni7pzwBRBxUVAq3nEY3LOlEiK?=
 =?us-ascii?Q?nOQDz4hSqoleyEdQ7Aer51Jzy/37+Py6fQlZ6DnHMui3IC/cCoEYStSzH/BZ?=
 =?us-ascii?Q?/UTFiz1q0nKPApEXkEmjeg6oR+gjo6Ok/p3FwTHmWdtx2DwO5pbLqm+JsGNY?=
 =?us-ascii?Q?zcCRGiGF5fgv1WczY9e5I0Sx/LlgSWyULt9DxJKN95aEbwYpoDGOI/tycS8v?=
 =?us-ascii?Q?W65UChogqlIeQuUWmAGP/ZOlYTzoPFMbzbyNfKsN0lYJgnZgfaZD3FodUVKR?=
 =?us-ascii?Q?GFh8BrDGRrGKRK/mnzdhfa/ydJJVnfblpkaP29rqvCjaNXnx1pXw4NqSAdRY?=
 =?us-ascii?Q?wMOEP6XnJqFKM+2opSaU8LG1zX/opO7HpMcKYrKNLhJPXvfbdEqkQ02WQK9U?=
 =?us-ascii?Q?dUGsuNWITNSFbQ/vc3LqqgrKfI3NjR3h8ewwCNFsKtxaRwiRo8Yz/PDT1T1C?=
 =?us-ascii?Q?xOwoG2FRHmGGj1CE9IwfIeDKyy2gSrYmaroX0gHynwxgcsB/iDkqpt2BRZTq?=
 =?us-ascii?Q?dk+eHC/+8DY1H4XlBtwFoV7W/4OvOTrirwBA9H79nuDoNGRzejWtammyryKm?=
 =?us-ascii?Q?BVYzVSGrzPeeH6Jtzxn1ydziZh2ke62GVYUT03FG3WX/OJEPuFiuBkt+ODIo?=
 =?us-ascii?Q?bXrN286+W0SIx4l8M4clZfc89s0vpkZtwhgHPU3DoVpZj7klhvBr/gkk06An?=
 =?us-ascii?Q?1jDmejB9/bU7eOsAcczXZ17/nKcKxH1eVYacI4XbBAujbrAUPtWeWPecC2nP?=
 =?us-ascii?Q?2CvHutwMh8ltlRHgwy+A8wyHTqnqyeV+bO74vUFvr9IddhhN6h+10Uto0HHM?=
 =?us-ascii?Q?z7hykHAY30D7sEYiAOk+WUVBolG0EfUA2yLc/RLPdd3Pjqqt52q96wT6Uwdk?=
 =?us-ascii?Q?lCis62KymOxb9cSgMeluatfTg6+4AetsfEKLFPmdc8R45BXAzqVvsiikcZ64?=
 =?us-ascii?Q?sYrZtuhgtiZIgUThvRXr4lVOofxE2vSiDyCTA2g5tc7XYMuqnAkf/GsVdpkA?=
 =?us-ascii?Q?OKUBVObAekNVTdoWq8Me5JNiBZt9JjBavd/BM3at69mzp1uxX1edFDeI2gEO?=
 =?us-ascii?Q?0tQLnM6+ONjxD2sfCuqzwJlOa8xfw41dUUuCZ9JwHX7D4effJozxf2iF7aeW?=
 =?us-ascii?Q?NjQf4uX4v81ztsX9i+py2LS65MK8Edm6QAy/3nmnwb8/2yi3ezlL11cBQLvT?=
 =?us-ascii?Q?lXND/SiXJo2bBp01wvd4T4FPw7dUX/13eu+xi61GerRXQjNnaBj3eq/CcEZn?=
 =?us-ascii?Q?fVWxBj6Jt+rs9/Ld/CxCc+cW6bLC/G7tKjnwai85SnvZNCI2gbwDTvhFNj5k?=
 =?us-ascii?Q?Ey7U/fuxcywaRRYjeLp2lw4c/m6LCx2nkaZXSl9l3LkBuJPO11Oj1BuqMTzM?=
 =?us-ascii?Q?J/o67yiI7E9WlVdsEHw719JYT3vE0AfetWJ2VsQXX4Ffxz9VeW/tU03oVPi/?=
 =?us-ascii?Q?4AIQTyVbqTl7npl35pGW0J/NXdCXXZ1/FBKZH8TJgWvNPKv1p4dfxdjAcveA?=
 =?us-ascii?Q?jzij6WYZvWPJhUBdgCKaiOb00SKaVg4Ul34EIrZuHcOFCcm3wC5LSxGXhNh5?=
 =?us-ascii?Q?s5eb4UjAfgvgVqenWJ97dGXbcnb9o+FfNZHWzKx4Rv49PUK5ZvFJBE2V3EId?=
 =?us-ascii?Q?/ULS0UFIVKLrF20UV7zNH5x5aX8L5WDoZop1V81XW0LjmrLxNVJVa2uzFcSm?=
 =?us-ascii?Q?qraj6KtlxaPw2e7Jv+BMiOqQFMAytNw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a7929c9d-667d-46f9-a780-08da1bbf52c3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 13:29:36.9791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8tv38DIxSfsSCUkcrxFVjOJ/1SLZfk7g4L8aSzpH33yOcSBUcQqkq+jBf5FcHLwkkHTWETjDR9ECFnglKb/+Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6024
X-Proofpoint-ORIG-GUID: G_68mY4X3MUhOOv89S6aqp1GUbOMryvM
X-Proofpoint-GUID: G_68mY4X3MUhOOv89S6aqp1GUbOMryvM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-11_05,2022-04-11_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 mlxlogscore=737 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204110074
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Apr 2022 17:18:00 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7155

The libvirtd package has already packaged ${sysconfdir}/sysctl.d,
and also the /usr/lib/sysctl.d/60-libvirtd.conf, it would be
reasonable for it to package other sysctl conf files, otherwise
we will meet the following error in case of multilib.

  QA Issue: libvirt: Files/directories were installed but not shipped in any package:
    /usr/lib/sysctl.d/60-qemu-postcopy-migration.conf

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-extended/libvirt/libvirt_8.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt_8.1.0.bb b/recipes-extended/libvirt/libvirt_8.1.0.bb
index b90fb704..433601c6 100644
--- a/recipes-extended/libvirt/libvirt_8.1.0.bb
+++ b/recipes-extended/libvirt/libvirt_8.1.0.bb
@@ -62,7 +62,7 @@ FILES:${PN}-libvirtd = " \
 	${sysconfdir}/sysctl.d \
 	${sysconfdir}/logrotate.d \
 	${sysconfdir}/libvirt/libvirtd.conf \
-        /usr/lib/sysctl.d/60-libvirtd.conf \
+        /usr/lib/sysctl.d/ \
 	${sbindir}/libvirtd \
 	${systemd_system_unitdir} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '', '${libexecdir}/libvirt-guests.sh', d)} \
-- 
2.33.0


