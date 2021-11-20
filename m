Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3755.1637381827394837313
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 20:17:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=XFU1i+Dx;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=69583b91e3=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AK4H7fB016699
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 19 Nov 2021 20:17:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=Mo8iDyZs2hLSIpl8uoLyDkgJoiVun+u3q0hNgdJhQ5s=;
 b=XFU1i+DxEmHZ80EkiJ/yRj6SENr9Mg/MhsocUhyO7bsm+fxJsXYz16MggzQLgar6qmNG
 eB1CmvCAXH6XhH7kqlgK12zmzm3gxHaqZHMsqGqZ0Pm8hrhJ8o+G/bBG3nIVWytOPGeX
 RoJlBSAr/9ey19ozx2hn3PnjF0zuq0zt54oo8QwXU2AIQgubVtvZxIFv5U0BQ4/HOnjl
 pqHi+fUvPQMMXYHDnt+/UaO+XQJjOBAGuiSC4UK4AXNhzxQElop1vSmAa927NprUe2KC
 TGO9CmFMNC4ilLytn887UfF5rIYWSsBcqemV8Fql8uGk52YlSs9+9Op1fNkaglTD1zZf wQ== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ce02h940h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 19 Nov 2021 20:17:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mpp2NCM7iohPi5z623oJ0O9PSjioYX8id+G8ZT7oZHR3FKkViN1NBJ6pZbO5mCwI1zCHXo7l2UyfyIxyLb4KKATC+s86+itVV5JDoRKThrUCgPxjh+8rRy5NojfW/GseH+K6DVvsRniTfBY/blsg4yN9UwMCw9v7hLyfBwHFEPkzqkYeEALaTOK1kie5ZxDgEx31SQXtRWjgwRT1C7nag4qPkxDmKHrUtkO7qkj2Rhs30WDqfuI2IhgL9s/aiZ6Y+UnkmlZ7dnw0tnnBM4t2q+DlUO6EEmSzIJ0QSTCu6tG46dZci3wDnnW6Ovg0K1mPF2w4q0NT/O5ZoxtHdSRf8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mo8iDyZs2hLSIpl8uoLyDkgJoiVun+u3q0hNgdJhQ5s=;
 b=RzbfJ3xMb+yOv7LUzum/HsGTlVcxrYbjtmKAI+/xpjdXaWLG7LTsogL3cVS98nQ8ZPsDLqCUVS1myPlzXxes+eg6e8fxEK2fNrDr0hqd52qunnS5L+j3O7D6Wd6fr0R9obWm2J8bybwuHBJ9gLdCt+/0r1H2Ds4Yc1Im3ddzpa9uxO0y7t7GaS0ITkJdqwxO9fnLVlnYh38lwC2fy2d37XrN+xQkgePrUq6VCRhbhqnocu26/Qr2Di+et368JQoAYZ8N7//KdggilKKNC7lptecwTsMO/AiMAk8wES4YbesZSs/RibTNMuGHYsIiCc91Q75xTv6mMz1hdHCZEaR+xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4785.namprd11.prod.outlook.com (2603:10b6:303:6f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Sat, 20 Nov
 2021 04:17:05 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480%9]) with mapi id 15.20.4713.022; Sat, 20 Nov 2021
 04:17:05 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-cloud-services][PATCH 2/3] openstack-image-controller: fix warning of operator append combined with +=
Date: Sat, 20 Nov 2021 12:16:51 +0800
Message-Id: <20211120041652.583066-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211120041652.583066-1-yi.zhao@windriver.com>
References: <20211120041652.583066-1-yi.zhao@windriver.com>
X-ClientProxiedBy: HK2PR02CA0155.apcprd02.prod.outlook.com
 (2603:1096:201:1f::15) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR02CA0155.apcprd02.prod.outlook.com (2603:1096:201:1f::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend Transport; Sat, 20 Nov 2021 04:17:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0151be06-77d9-4111-11f8-08d9abdc9c60
X-MS-TrafficTypeDiagnostic: CO1PR11MB4785:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4785B2EF58B97FBB71FB6071F99D9@CO1PR11MB4785.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	61AvjqcYBHWp+hTZTJjghrVJdDYCOCmUa9BOGpSZ9qnAMweh5YpecAKqa8iHImwpWcwC9G7Q356euDGH/O3mbPXAy6kMx42zqBiTJuAwQ5CUpbtdmpyNr9mfxWZ8meJkImpQW7I63tY8LUCEVNS0VlqA3CK3g9lJb+6OR/hJlmMq4m3E8PEPGQGELgnppcnZmZNOqxJvjU6fRDIA3GJSpZE5jwrMVc5RTLYwHCrv/ujfn7+yaVrvNtO8Jrinac1B7IYQy3Jmuyzl3bMChn9hXZwrnOIM0wGjX8ZndeEKlMVIxZGikLqXOTmE+V40Z4iKvAg6zVV8TsbDMe3qXEwhU/5sRJzqJlqcDMrJMXQ/QbuMGL0DUPDtKqEisHlEzeoM2Yfqk9smxL9mSOAGjzu2PkU4q/g0V/YEgmegisRmpKiYvzq1fi/w/cIHKmd5w8UsW0QzO1p2zAzkUWou9NqWM9NPDdyGVl62Byoo1dXRzrOx3vRu1ETcebcjFeBa86/MoptUtSM5QyrVbjH7gu1CEmDo7wBF+ZxiIqgmkLbRte+ruWNY129ubZ3+N+N1WkV92RDBMr390oemfdvfZt6ab7ZvojSiCrXaCQ3Q9fRYbw8sCV+Es+vio1aAY0VExkBQAcy8EVefCGLDGXNClnOyM+exB5uFSupKcw5/54hoRPy3I3+7i0RDrscj/Ctf/aS1fJeIx95y2VuDNndIsYqTSQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(6506007)(2906002)(38350700002)(38100700002)(66556008)(6486002)(4744005)(52116002)(6916009)(1076003)(83380400001)(66946007)(8676002)(6512007)(44832011)(36756003)(186003)(86362001)(5660300002)(956004)(8936002)(508600001)(66476007)(2616005)(26005)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bSWYel84eJ1FxZBYm20Vihr55YaB/GD3IQ55XcN24vfwTfE9x8hV2o6gRKY0?=
 =?us-ascii?Q?53fj1cjvDWDXdiPvunw8JVA/R8aE0s5CmD+NHkmZpPkkJ3PMLBkxgbhnl7KD?=
 =?us-ascii?Q?bhECiuurU0M3vl0KFZOviB9egiEEtK4inN4l8jy67UegL3wnI7TjbXqPC2kX?=
 =?us-ascii?Q?J/Q7ZZQNfIIoGUNENZbA5qm7m0UxkgkbBy+sU7tJFP98Z0I6kujv3xZAsx+A?=
 =?us-ascii?Q?JEwWU3wU6Zb8CDq8TY3ZsmVOegGdxvK3ZZ0rNCTdURQgp4Tj1yCnxwfSIwDn?=
 =?us-ascii?Q?X1ZLOIx+g1/kLzuES5cyE7/YCwT0OTo99gb008fy4hCPdPvJPCfQIGj7QADU?=
 =?us-ascii?Q?V9TiLVAX45Q3qhlMmQPhWhXcBfXnsUfD5ZlnlOlUdwtHx45s9cD+zdC1itNb?=
 =?us-ascii?Q?IUWdpysEdfhXFMInRcfYzjjZHITNZoaFU1gG1IaZEJa8CRtNWVwcoDX2+VnH?=
 =?us-ascii?Q?A2xa7mYB091S2cv6uIOgCaiaac6H4gPrcqd6pukcvvm1WZG/EZPP3thZT7/F?=
 =?us-ascii?Q?HiTYmLmDDy4z8GYIAmby2p/bJxWR17GpDVbg7LAwWTWwIQGelzUN4vMCATSJ?=
 =?us-ascii?Q?hvOUYZsVJIKS8Y7kwBPhPi2dTqNeFHbegyn3btpNa89icbLV3NrvJxlqF5uh?=
 =?us-ascii?Q?v8KXOxkWHV4SQiJZN486L43bxJqzGUMU3mA84seHaxBhWFheRk1CbdU7/TJs?=
 =?us-ascii?Q?viRQuwvD4N54MOHfED9XkYCLZMQwivpBCXHCvv9/Sf2xrOMUkI89NorTEj4M?=
 =?us-ascii?Q?GiebdFa2cJHc/q5pX9n48j/Yo4JgLuHFnKnsfueo7YEQ/VrPmPH1epoNSFMS?=
 =?us-ascii?Q?8lXKyaWhXXFuq5VUQK+KO/shNxtF03yC33lOE5GMDyzOzeiVecQaoQhh04at?=
 =?us-ascii?Q?b++N+a9zIdTzDAEfBtnGnELD27/6OL7f/ItHGaOIG1+oWn1OMJVyMA/7PnaF?=
 =?us-ascii?Q?/I5RoHhpLDsLLl8AYd3HBDaHLgVUDBVRosPyF+Nl6fEb3E1rSFyr3Oq7YQoA?=
 =?us-ascii?Q?3n29upaNEuYSpb/Sa0+gUJ4VfdFuiHh9Vf6JrLEg6qyf9ZqhIXBkmeAqaDJw?=
 =?us-ascii?Q?fKQ+FWGqGrn/wd+SqYzn1jXalpQDM+CNZpiLKEBqgz0Dju3NzUKAcVzQHMSm?=
 =?us-ascii?Q?TsApb7zTo3u8d+Dt/fBqjB+rPS+WLW/CjtJqUDof5NlSM3OQApjWVtXPk//U?=
 =?us-ascii?Q?EF++drDRvBzHgkjU7tzAAkBxljh3pK5UFCbNrmlfgbGZAJ5MwCwUbwjUqod9?=
 =?us-ascii?Q?eHN9fJmcU5XaBnnRFxf1OHyRA3qZYfiLq5KBMTFZDfqlk22/LlILB9XaJVYR?=
 =?us-ascii?Q?wZuVCgbDlZ7/rzLQn7dS9vwc5Pa2yHvsmupFnEDFshE+QuX56LAdHN9lTncd?=
 =?us-ascii?Q?npfeb11/ew2KBHu012YmRBkpdBDvn3Cpz80OOJOWGtYj3B5+HJuMLNnh6CU/?=
 =?us-ascii?Q?v5dIW21n26r86RRKgqbK4spl/HSY8cBPYqj94Lw/pasATWWJ6/655+qRYBpJ?=
 =?us-ascii?Q?7gpVKGG2ZNxgiT70Oiifkcu/yF1qdhyrJlZy/ImnCzYC6GAuZMBdZc92BGDH?=
 =?us-ascii?Q?ulglliqXOcfKbsuohEbu+S+dO4CsNP8DV/oGARuYyK882+YYPvdxvfTHwdOF?=
 =?us-ascii?Q?IrOgKZ659M/lGDeYMs+QJgw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0151be06-77d9-4111-11f8-08d9abdc9c60
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2021 04:17:05.7040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ePgtPpG8hTYNHfbj4mXP/a4Da2HhkX2BjBkhPwvJQ1Bct8Lmv+k4wWpLCMAV/yVvhasmTNB9vCMJ7Kvsy3l7hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4785
X-Proofpoint-GUID: eWZav1Lca8DYU16e5HOQ5FtQFjY7SaRe
X-Proofpoint-ORIG-GUID: eWZav1Lca8DYU16e5HOQ5FtQFjY7SaRe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-20_01,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 phishscore=0 priorityscore=1501 clxscore=1011
 mlxlogscore=775 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111200025
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Fixes:
WARNING: openstack-image-controller.bb: IMAGE_ROOTFS_EXTRA_SPACE:append
+= is not a recommended operator combination, please replace it.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-extended/images/openstack-image-controller.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-extended/images/openstack-image-controller.bb b/meta-openstack/recipes-extended/images/openstack-image-controller.bb
index 7f41a08..96dc80c 100644
--- a/meta-openstack/recipes-extended/images/openstack-image-controller.bb
+++ b/meta-openstack/recipes-extended/images/openstack-image-controller.bb
@@ -24,5 +24,5 @@ inherit monitor
 
 # Ensure extra space for guest images, and rabbit MQ has a hard coded
 # check for 2G of free space, so we use 5G as a starting point.
-IMAGE_ROOTFS_EXTRA_SPACE:append += "+ 5000000"
+IMAGE_ROOTFS_EXTRA_SPACE:append = " + 5000000"
 
-- 
2.25.1

