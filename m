Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3873.1637381827582200709
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 20:17:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Y6WSlAwc;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=69583b91e3=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AK4H7fC016699
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 19 Nov 2021 20:17:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=3v4ahy24CtG7jp5gPvbVAorCsuheTW0lAX+no7BFQfc=;
 b=Y6WSlAwcNnAewAN/olduxcKpkFFtWo0MG3dYTa/5BPb5EA60N0XyqUXQjI0T5tZ8hOwc
 gKpIGA2BBjDNTZBuEgO56M4FcI0tskA4pOX39zDouZJFprTQUVaqpfAM3S9UFzYVuTKP
 0TzTvJTrvePpr6QL2bmIFW9GSRcmt+e+KIxn4J1kD3Qgs2HRGL9OHGnnLjl2xOoedZLR
 DHNaQ+ADnF8WbWi3sex+Yhex4/w0WG46lg6C1X3TpcJyidchIpng8YSzznzWlV9jsSFO
 ki11oNmt/6So1vOAE50CbR2zi0ZgCLRkxd5WBTIJqruN5w6xHQszyhH+EBDSWsuoITWZ 8g== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ce02h940h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 19 Nov 2021 20:17:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RcyoCXCjyou2MljEmoxgFcYU18BXxXwKWVBE6ek0f7B/mEQLKPnYp0NAz8i+s2YE8S9Ds9ZEW8Rihcqx7y4cEVDNrk75j7n7ByWL6FNao/casEXOkLjgI5Ky6WzmZkgBWSWDh0uNvv1kpAgJQ/XY6x1MCjIu+5VED94z/logwIGnCYcEBX9PGXdV+VkPGOVuR86UjZiosk2020V6+ih8o+vvniWIpjLX47JaExz6pBQtEfMIiMmMe7rF4qCYNue7diZFfjqso13fjf5+D21XzP0eSrVRqpl7H6j8y46FB1/c1P0dqYiJkZ4OxWkklmnBPXURzABNKy44AfrHvKjWlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3v4ahy24CtG7jp5gPvbVAorCsuheTW0lAX+no7BFQfc=;
 b=a5myVF7qQK+DpuAoE6PDm5b4e1IoVFrdlBChHz36QyVngRh7QaGTHdPI7T+N3wB34k1toI6LZnIDB8EJbhglxzlB6UAFnOFH9rgTdgvMFo05pWeqOcNRhVB68/RAx8NGGr1/RbOMGNsGqrck5hguMq42QeroRXS3+YZ1ZL4svrsG9OuLoRik696IgvViUs8HwigxKBUeo3wp/m1Wnvk6E/EPeVeGOWabs9RW5giANs5a50og453AhNRYyGsFf+U/z4AWaRJUjbZjxH2392c2Lh+Hy+J3ax2wRmDNHk7pATUcgd4e25yQds2xJT9q+TZa6x4qEyO+4c9+i5Y+ydg5GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4785.namprd11.prod.outlook.com (2603:10b6:303:6f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Sat, 20 Nov
 2021 04:17:04 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480%9]) with mapi id 15.20.4713.022; Sat, 20 Nov 2021
 04:17:04 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-cloud-services][PATCH 1/3] openstack-image-compute: fix warning of operator append combined with +=
Date: Sat, 20 Nov 2021 12:16:50 +0800
Message-Id: <20211120041652.583066-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: HK2PR02CA0155.apcprd02.prod.outlook.com
 (2603:1096:201:1f::15) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR02CA0155.apcprd02.prod.outlook.com (2603:1096:201:1f::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend Transport; Sat, 20 Nov 2021 04:17:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb81fd7a-6fa0-40c3-bd72-08d9abdc9b93
X-MS-TrafficTypeDiagnostic: CO1PR11MB4785:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4785B3E797791A0BCBEA8A27F99D9@CO1PR11MB4785.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BrcbUThJXEUEH+pLKfXNffkVxfDtQHjOJyDdevFpXD8SjW2ootA5L+QbX/WTywkHzUknC9A0HqEiCFGaFPfc0qpUz7VYb5sw4IbaZ41S3Y/12frOXXsDXb1KWpFpexkPGdwt3rbn3LtzAhrO3gNgdO1S0v5vVWGfbrd+k8fdD3QluTGWEnQAjaMvxmDcJTHC01M0qqHyaaidK4bMG3kUcT5CVjCmi+7K0wQt8DxCPhR5lSY3hLPR30+ynNLztvnmrX+DE6cx6x/h69V5niRr1zeqgn9ONmagDLsJFQNYGCTfUu9cXNMJVItxSzyuiEe9sekPMX1G+1GHiNCB4gUyyNVU0qekqGDGgIOOg1wFCFGp3SyF0DdNd8ZPewlV9V4BgGcuEV6FjeTEqlRig+eYrpvorkk1a+q8xlYPEd8UKhd/mixLOuuLF0IaISvhQ15ZMHVhXjee3t00IYVkHVdcOLE5752U/O96e9RM/ynXycQw1ZGKgdBdUk9jOdgl14yqri1jD9L7c5bMxr29bzBJgRXy9GtNhG8eslomyBr0AV50HQmbcq39YLx3Da6SNyyOtX337kjlsr5lOxTVp3OY64+mPxWUp/IJq6lmu7Zp4BLB4inQVGlFY6HlD2Nbyb56VCyxZQc4Ep0WzLL6fE4D3kMTTAYlFtF4j1XsST31j+kZfuK/bJbzLQ+NBE0iBPZJ3IRUmhr8NFuXwPHU9m+DfA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(6506007)(2906002)(38350700002)(38100700002)(66556008)(6486002)(4744005)(52116002)(6916009)(1076003)(83380400001)(66946007)(8676002)(6512007)(44832011)(36756003)(186003)(86362001)(5660300002)(956004)(8936002)(508600001)(66476007)(2616005)(26005)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CYvoZ7P8Mcq7Zc/VtQLuEpK9lCyORUVMCMMyzJj6MaWo7EOq9f+eEYqEVrhS?=
 =?us-ascii?Q?xE+bfU5zqaqYEBl5gfVdMMg7h3NS3f/QyJqiVWXVmNKwpXHghWJ20t7saNmT?=
 =?us-ascii?Q?21tI5ABh3iuSKzhPOHA80gcHII+MjU1q1dM+ihI4l6E5TSVGxGVq2+ih8SA1?=
 =?us-ascii?Q?uSU0g1xarnrKeXd0jNQGM6F3co7hTHn+zN39nUOawhok0CV/n4KqsverUUvv?=
 =?us-ascii?Q?otk5k/Wty3LwhHZR2RRhHF+u3b+Jtid6kZKHLvA6ZblzU6ynZEtiJPU0Z56y?=
 =?us-ascii?Q?/njPDQJZ5VVna3qhqbG1EVoZqwz57cdHKWRW392F3QpNWrZT4941SaHBhiIa?=
 =?us-ascii?Q?lPdVpx+3wFcxWmaKv8YnRoYQqD3eT/lhsEd5hxKoQFxncf+ZgIYt6Esg/BrL?=
 =?us-ascii?Q?TCBGGPh+Vfmc41UKxS7hB4FbFrWSk11e6WwfH9hPz7wlPrSbLTYISPrD+VML?=
 =?us-ascii?Q?iwPLloz41W95cPB2H21ZrENHQLNZ8JOP8BHvPBLFihLPCoXBwxPJ6EyPm/vJ?=
 =?us-ascii?Q?KVTeq8lZPmX1pH22uBPTBBXGDPPEAvTqDVVQMkvijNo/D3lTsNb37hLk+/sc?=
 =?us-ascii?Q?nX/KbDJ2QnxDRdd4TRF6L8pxxNIOlHJDuv/fZIgbr9LypgVzkdwgkRMJLR9O?=
 =?us-ascii?Q?kCF4gNgnjeiQULQADKSGud3AuTDAGmzHSARy+XyS27Ynxck/Yn/ewahucwZL?=
 =?us-ascii?Q?cO17zqEPFDlX39EvcZl8aLVGfoGiQWRmW4BUxMr9FD73wQy3LkIT0Er2JbqA?=
 =?us-ascii?Q?IISTk9SWMMTPiM4Q6taNX7t4U49V1sx2LOe+jj7Bd/qBtqjJWJK0Bx2RyUAn?=
 =?us-ascii?Q?tGk/ntqR2uNTkBMUYIumEZrCR6MxwOeeQ9u49Ca+uDAOlpD3d2qkgi/DxuxS?=
 =?us-ascii?Q?5Hp0vOY4yOVSmMe0kTbVg+fOuhM8nqQvve8ZqnBpgjpCCLp3E8N5wm87X5qg?=
 =?us-ascii?Q?wqGnXcXi366MAA3O7CqapKrdYhTZj4btuhvRvgR1iVRpgE9BuumqhRyjGgAk?=
 =?us-ascii?Q?/qQg+5sp5Gf7Q2nEqzuUuSHxB+GlGHHr+w4WBd13K0nEumSQZKLDcnC3hPcn?=
 =?us-ascii?Q?DPoEWKvv/Iz2eCX5L3NF/7fTOx9p6Mm8V6TLnTxscEOaLSpF4zmGMpDlneUM?=
 =?us-ascii?Q?7+noMsJNemnuTLTm4/x4s5zfdazQfhy4qyXdvO/JBqYswT0VwwiltXzIS2g/?=
 =?us-ascii?Q?RY07aNDEo51c2sO7xgt2RtjLjKovuZUz1axqKAjesSSZXsX1UKAYvru/hBNw?=
 =?us-ascii?Q?r6kA4lNaEFyXBnJQqVwUCmehVpjWygox/1xM//N2UttydJFvhMMMy2ZVsm9F?=
 =?us-ascii?Q?Uf21Ryk8B+cizTc72lq4U3uIkjxYnH3QejgXKPSm9VNtt/rkXiP3T+34ob81?=
 =?us-ascii?Q?vrjKMuqyVtf332yfvefBrRiaUmRcLg68q9fR0BTFqWrj8pVdA6VXYAj8DmeI?=
 =?us-ascii?Q?x8LX7QWCWizsj55roiXopxl4AbleexpeH4YmZtlC9JXvny77noEpikKR8tHN?=
 =?us-ascii?Q?3UBX+SHQ/ajOaPoVrI5d/D1R8DNmTuPyXFvXUR5xK3NuSapBkFiuLnPIlPw+?=
 =?us-ascii?Q?KBUF5vMeIooY1glWCLjdotdx3PsVzLKjjsrfWE2Pt5qwoftbUBott5PDLX3R?=
 =?us-ascii?Q?Uv086g21xOsieAxSWjP6RPk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb81fd7a-6fa0-40c3-bd72-08d9abdc9b93
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2021 04:17:04.3649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YLmrTzQXVCujmZoa6Z8ICoXcnYi++akmGzHwke7y02BAbpSAFKaTotEKu+j4Eky+03nvbzf9c+ahz+2GNZJA+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4785
X-Proofpoint-GUID: efol7bunM8t90LR6_0-VLR7uttQ2X17W
X-Proofpoint-ORIG-GUID: efol7bunM8t90LR6_0-VLR7uttQ2X17W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-20_01,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=814 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111200025
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Fixes:
WARNING: openstack-image-compute.bb: IMAGE_ROOTFS_EXTRA_SPACE:append +=
is not a recommended operator combination, please replace it.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-extended/images/openstack-image-compute.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-extended/images/openstack-image-compute.bb b/meta-openstack/recipes-extended/images/openstack-image-compute.bb
index 15726fd..a725e2e 100644
--- a/meta-openstack/recipes-extended/images/openstack-image-compute.bb
+++ b/meta-openstack/recipes-extended/images/openstack-image-compute.bb
@@ -19,6 +19,6 @@ inherit monitor
 
 # Ensure extra space for guest images, and rabbit MQ has a hard coded
 # check for 2G of free space, so we use 3G as a starting point.
-IMAGE_ROOTFS_EXTRA_SPACE:append += "+ 3000000"
+IMAGE_ROOTFS_EXTRA_SPACE:append = " + 3000000"
 
 # ROOTFS_POSTPROCESS_COMMAND += "remove_packaging_data_files ; "
-- 
2.25.1

