Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A1A0C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 05:45:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.66241.1701323144455668277
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 Nov 2023 21:45:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0698bd4b2f=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AU4e2H2028505
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Nov 2023 05:45:43 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uph0w857g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Nov 2023 05:45:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZsCu3PRuaCSGMH4PqtQo480bnACtWz5YCb10OUC2BrSzPFCTj/sFfNl5C8MqvU0dsqaQrltYXMrNFp/CdzTaYRjF+Kwx6aDK2g3rg/iFUWZNi3rafLaVUPYVD9fK0u6m5FoxnjtFoyL36vmDDmlXOqDjZwIy61wK3Fz+4p5TtsoT7CmDi1+AWnK1aBMY4/FXnQwWkmUPrGqQRP2ukxDFouELYET2b89vJPOK2NJD4i8RlsIfsgmtd8N5TVlGszV7z9poQG0/vclSZKs5FH8ohT5gFeGDXpcbUBotKO1Lst1HkwCQo7QTwII89kBfz4bOUkEu7dUk9Jl1/PPmTNaiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWL5Y5TiGfsZrxOzSaP/+zuOiQSEGkpBtNmYTWoHiW0=;
 b=g9+xv2wMAXRePcWUI1yNi2c6YT18XOrlWmJIj5c+RyWPi1sf9NW02x3+NA/4u+gawhPVM4Ko8ltch7zPcEmx9chSC8iKW/CwlGSYTA81YxAgD4kB6FAEi5T1Tqx6Gr8j8lMby8EE14KOyLyKN8efv35I3x5utGnEh2sHKtlqO4vwnW2GN3/JteJFTvzch8jYYZ/S6S5KPy9DSaLqek68Asx8289b4+tZWOgVxO/RY92e283SFh4bE0v0Y9G8k7O2icJy/PbqBcIZBQn/DyOd0S2+aVImbVTSeL//yHp4Tpl6HggQH150PexAgsKieK+Hq+Mg5aDcJpPq95k+bHngPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SN7PR11MB6797.namprd11.prod.outlook.com (2603:10b6:806:263::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Thu, 30 Nov
 2023 05:45:41 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd%4]) with mapi id 15.20.7025.022; Thu, 30 Nov 2023
 05:45:41 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] lxc: add distrosysconfdir option to make sure the lxc configuration in correct folder
Date: Thu, 30 Nov 2023 13:45:24 +0800
Message-Id: <20231130054524.1125012-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
 To MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SN7PR11MB6797:EE_
X-MS-Office365-Filtering-Correlation-Id: 31bc4fb5-8cf5-4e46-d915-08dbf167961e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DzlmfY2uONDKdKz7jD39bui4gOX3sQSa102K4UAVHe12Kgnx55CPe4yBfWLQbwkIinWq2kyzSI1885XwJ6wZxCT1xF4T2z1pYwnVujOJkEZfJP0uIFu8ueHyBlJpwamzwpQcQApa9hq9gQCugKtpYd+pJVDhji1DgkF6EDJ4OG0N7LDrshaomzbGcif0NJM7H9Sa4/M60MexB2vsQRNCbzBZmlY3n/eGi0EDQyYs2ds1F0LenuCIj0s7cJpK732t08CWXHAJEXVlghQSUVngX1idUA0hFkcpdmiY/5hVT/e3bKhmtVV6CS94Ti8GaLPwmEju1U4mE6p2/ZWz2jVd9E9uVGGbaV/C8+E/WW4R14cYRtrlJD56h0cZX/ivGoKhsgYac3P9S8k06gLHI+yohcwmaOP9KHfrNXRm+sOFCwnj9bq6ENLXg1+gin7OokE87LMX/fj93cGBgGqFtjAOQbiKZuDbO6Rawm6R6FKFmiVpuV481dCizpsWAYYuG1RruiOIko16wmECo5NjDfD7+eqJxYmzj/GKQ7IISyFnIwelr/XLZBVXMxwzBM5izLwQhlTIu7j63hLYRWrPuSdv+YHGzVBp09ob6m0FKZwW8d6/GDtFqrhtHxpGAd2xxX8RZvdiCcbnnmrEoLk1gAtMJpPTumV8HlRIjt1E9SUoz1xTNK6gkSar8w5srlCfOMLj
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(376002)(136003)(39850400004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(44832011)(41300700001)(66946007)(66556008)(6916009)(66476007)(83380400001)(38100700002)(8676002)(478600001)(966005)(6486002)(2906002)(5660300002)(316002)(8936002)(202311291699003)(6666004)(83170400001)(52116002)(6506007)(6512007)(2616005)(1076003)(26005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?g4wTVAv8GlP9IsJxTnt2ot3YsfTuHD1qBtckGS5Au2L5KFI3k5mnd6muToMe?=
 =?us-ascii?Q?waJdHOj7PqgNfBackbeUbKxVR/ytyrfNlRkgqEHeIbDf9Fz5VKTLppsPo1P+?=
 =?us-ascii?Q?HawTraUnDqjupqplRQK/+6GnqGuogoq9PGCqmnIUAdWIu+UbArQvyItv3J3z?=
 =?us-ascii?Q?z1OiKsFeK/3TjFKqJqy2NsjrwG9pWtq8S7zokm8u7IbY1HmAgz3lOwr05LIU?=
 =?us-ascii?Q?LE7pvmFbD5gxh2bfdrm6g8ccoQSlg4h5aqejnz/frXln3aTpZ+h1p0yicSu7?=
 =?us-ascii?Q?5sZUKtgNz1qk49xteAkAIneQtGVBqEYvW4xCoThwjQ7k1qviPKsmwhziEpFu?=
 =?us-ascii?Q?4XkBg0paXTDsGIgRlU5qTGqGaIbrG4m57k4tRjWBoISrTq91vofjzNUtxH3w?=
 =?us-ascii?Q?jspmy4WNW5C1x0W66mCTYaCXi4uS0tnaSiEW5h+Hx13tO6F4x437S7HORbnX?=
 =?us-ascii?Q?pUPFsHiRw62ch+zsrQT5j8Bckle8OTOBoYi3O1DbvKJe62bOnHg1mv8rzCC1?=
 =?us-ascii?Q?SLVE45PLo0kWscF3BS10ccNxBGH8jxdsVzldNeGNEj++kzl+DokSJyiM5l/z?=
 =?us-ascii?Q?KYyRLU+83LTfRxFS1dTuRcyoVkfpfq1rw7zCl5heWm1Rm2pTxH8ha2S7KVIh?=
 =?us-ascii?Q?OE2fFqxtppK2pSMUvCMcDyhrGvGwhuq7Y/BglTo89GtwenAXdv99uYbYsYGm?=
 =?us-ascii?Q?HeISCNl7hJU6fJS1zXHldBs//I2by7eUnjzzFNkPaZqVu/Vea98U9c+nKY3W?=
 =?us-ascii?Q?Zb9ldjtZkD4+RKE3dagfqy3SLFQujcOS+u86WcO4VbJHsbkovBLtaitfPWfn?=
 =?us-ascii?Q?FkVMoMm5fxLvV1+eJFgX6k7EQHObJKiUmTxl5aBBYnonCH4+4DInLdjVP7n3?=
 =?us-ascii?Q?FGm6bsRTp3vaaGkdQPxkVQxNniZHCNrrE+cBAotzozZQl1Pvp/2h47mg/Hw1?=
 =?us-ascii?Q?5EqM+GI/ge8WsA98WlO+2xCA0rOZmPtCuk6tg7KZAyGc3Uv3R5y0g2xrz7Rw?=
 =?us-ascii?Q?CiIorU+E/2TUQA8Q3FDOF8ZKB0Lr7TJtNmC0VSHhqhFw036oaj/cin5kPP9H?=
 =?us-ascii?Q?BtdXBYlkx5hoYXS5zQkmwaIQDXIVjsqw5O24qpKOUDBvz8D4M7cF6TXWqgEk?=
 =?us-ascii?Q?cUUX8ur5XcoXLXsdQJoxry41DJkHyOhKt5wAyAQqjMl77d2z1ruYfGtiIfqX?=
 =?us-ascii?Q?ln6q2Y5fgrymn9fNIP/u3QKe1vRrhAAINt6KX7LzdBn/4eLKpmL2l/v6GC9/?=
 =?us-ascii?Q?KcQBfmvSTo7nQzNP5pwMXr25jyzfAX44gRNfUEyLCziyvNYTbS2W2giQk4sj?=
 =?us-ascii?Q?+nbtt9ArrVR3d0xUcJUDYpL/ngm7m40SnRo3c5NLwi7HUo2Lm8W42HfQyutd?=
 =?us-ascii?Q?ibxywGBAJQKVB3iRz9NaXGfPMUELhFVMVyUwnEXoJM9bn3qScxvJ20uil1aA?=
 =?us-ascii?Q?1giYJn5Uphfg2SiYRT0sshEE8A0bJpSFrCBcP2ziCoRFJkePOU2L90kO1G/d?=
 =?us-ascii?Q?uRTO9hs9CioIeH8xzTUTezzVzntJUnZg0FKwgHtyNrk36fK20WaNOfKD/+mU?=
 =?us-ascii?Q?FjiV4oo3RZFr8iMtCHYau28ymThwDNOuuGHHprJpBl8mm+tCphPiDu+tYWmy?=
 =?us-ascii?Q?KQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31bc4fb5-8cf5-4e46-d915-08dbf167961e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 05:45:41.3517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJ3xJcHs2KlrgFcwpxl4tG93Vw5vunw33LltlIAai1CvEpAi6UQmXLoU87e9fR+pDU7OIfUDpRCYocLN09is6ZprxmFMhOocvUxfZRQNa1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6797
X-Proofpoint-ORIG-GUID: e0ahl--biBUlbpbtaatuz0rOmlVNsD8O
X-Proofpoint-GUID: e0ahl--biBUlbpbtaatuz0rOmlVNsD8O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1011 suspectscore=0 adultscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311300042
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Nov 2023 05:45:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8482

From: Xiangyu Chen <xiangyu.chen@windriver.com>

After the commit[1] "meson.build: allow explicit distrosysconfdir", the config of lxc would install
to distrosysconfdir[2], if this value not set, it might set to /etc/sysconfig, that cause lxc-net
configuration cannot be found[3] due to our bb file install the lxc-net to /etc/default folder.

Ref:
[1] https://github.com/lxc/lxc/commit/16ebb29dccb35bf74e8a19e8c45d2513f927476f
[2] https://github.com/lxc/lxc/blob/main/config/sysconfig/meson.build#L9
[3] https://github.com/lxc/lxc/blob/main/config/sysconfig/lxc.in#L28

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 recipes-containers/lxc/lxc_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
index 94e71087..33ea4ee7 100644
--- a/recipes-containers/lxc/lxc_git.bb
+++ b/recipes-containers/lxc/lxc_git.bb
@@ -60,7 +60,7 @@ PTEST_CONF = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '-Dtests=true', '
 
 # No meson equivalent for --with-distro
 # EXTRA_OECONF += "--with-distro=${DISTRO} ${PTEST_CONF}"
-EXTRA_OEMESON += "${PTEST_CONF}"
+EXTRA_OEMESON += "${PTEST_CONF} -Ddistrosysconfdir=${sysconfdir}/default"
 # No meson equivalent for these yet
 # EXTRA_OECONF += "--enable-log-src-basename --disable-werror"
 
-- 
2.34.1


