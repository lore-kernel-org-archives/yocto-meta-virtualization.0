Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC92C77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 07:05:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3102.1686035118913071007
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 00:05:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=gMzTcwMg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5521525cda=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3566i4MF006937
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 6 Jun 2023 00:05:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=VYO28/oCxiPUcC67d/sfhdDYzw8K1yi+apv2vZr9q4I=;
 b=gMzTcwMg4vk2mWT8m6MHGme5HOtP+nUYoKgl82FA5aDVvj66QYpEQrEmT7oHsh0zjxzS
 zfn9CxCo1xgdvpoO35E1WIHjQDlNz0BfitW7x1acdkR7tsssT1PmDlx2QsM1yGsn62q3
 Hiz4qKIkqKfvzVGQaYCMir4x1x6w25w530aJZNOAfo4vPuPIM/Z+LpQZEqBATX5AGCdE
 Rbu7+GVuTpsvvyWOlQtFwu7bm7BXJDhFtfuA4nTlMni5L5v5YGnBD5kOAIrWUbwXwtHj
 iCTB0Jq9hTL+gYVrP0U1qk+qp2Rl9Md2v0WU3vml3O4NO5VgzocBd/g/ns4LC74Cp/VR YQ== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r051j9xtn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jun 2023 00:05:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BT+HljZEJPGNyKrEivQl/6aOl0TxNfm5XSbxf4IgCu9MpfElOjPXVNZjY4meUme3Ql7i0e6KGOh09A4eBcZY5SwUAXMGH07GX4LIExpIWlyEqZ5VwlBcQqpKu6DvS7BTmZaWqK9cyBqnXrPh6hpug9rknXSHa5qTh/rQ7edbShOmtb+GVRYAM2R3oyHREcozFwJwPDWRrmSNMzCMk0/BjjfvldrUnBXF2xr/vRdxu3aJkVwEYb5oSuR4XE9+OtpWy5zyPn0eORU8B5lyRbLAv/cdbg57wGcuBuciL8djJoRVpk428MUw+9QSlSs67+tDgvG40Q88qR95wODvxyrR5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VYO28/oCxiPUcC67d/sfhdDYzw8K1yi+apv2vZr9q4I=;
 b=Nh9LFOye5fvBQIjCIOXFKoME7UYb1Lc4MatqBDcFSLlevYUvLARUv2fTOm4otdz8Cq7Lrq6NTsOhWzJw9JdMzxPTk4+O8DPTWmV3ytyZBEogXbZu0xzyjFqLNuNdVO+J9GKdq0+rODqXKU4sWwJr2ETU60umwfebOWH8GcYDikGXWuufshrlrfrySltV8+M2LMoO10jShB4zrUEL60YdL0aNzSdj2ktiaGFybNZi0VtGOV0dM3Sp7LBfT6Il4Jep+CmRvw9CpcIESesDYTbAhoO3GtC1pQDt+PiXBFqLvmNOB1TwQ9c0jngM83UQK7irNwXRN9s5y52ze5ticMORlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB6699.namprd11.prod.outlook.com (2603:10b6:510:1ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 07:05:13 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17%3]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 07:05:13 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][master][mickledore][PATCH] runc: bump to 1.1.6
Date: Tue,  6 Jun 2023 00:05:02 -0700
Message-Id: <20230606070502.1019140-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0019.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::32) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB6699:EE_
X-MS-Office365-Filtering-Correlation-Id: d443cf05-8a1f-45b0-2b9d-08db665c5fc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	P9T3GVENH07Ta6z1CbeX4VVu7gWmCA9B8RghnFDwXoHfRbGYy+vV5+gA6Q/z/txgcIC95QBgaje27dhWaHBDs36aD7GeOw+lDZCTt/yquBDbwhBhBRRMPNjtqi3EOj1rEvLcXNr/GpdhQ7YQapdspPsspTf/QZQFdTlC/XOv7WeTq2gQ41StLNBbVISXQg418d4ph1SAvh16p+iyP7rK8y0U3lp6+eaQ5fXMN+rVpmCGMFfITgEQ720e1p3ZYvuPZpx9IgQLVUedFSW31GGioCh9b+I3MH1Snq1g9uZCIGGogYCewrl9ieIxNe9JcCiL5DMTl5b+CrE0ar3e7qQYQCXkVtBbyE2Ene0LatSyKlveETVCasticn7mXp1MWy96WF221hFzNw9ltmNBbmjbCcAJi6cZWosxvPHhXH81T3Hwee3CddcyPik0Ks+Dp66t8JLElXPX67EttfakPuJUz2XdPuDX/tWJDnnDqI8wy8ZCDNTrEDaRD1yS6XwOvoBTNp0SHy6+hZ9+umQ0OY63IXASaOcEpN1Q/D8iHZ8u7JiB62Zjy/ohHovvQ/xurLiXA+xtmuW1/byN9tsJZTvTDiJ3c7LmTT9TSRg5+eqX+HvCIoU0FVc91oZ8fXv455mz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(39850400004)(396003)(136003)(346002)(451199021)(66476007)(66946007)(2906002)(478600001)(316002)(8676002)(8936002)(6916009)(41300700001)(66556008)(6666004)(5660300002)(52116002)(6486002)(1076003)(6506007)(26005)(6512007)(9686003)(38100700002)(186003)(2616005)(83380400001)(36756003)(86362001)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Mfg8UxB6Dz17P9y10fMktDJzWiV3BC1ULLB7ePneXQYxwh03NmmPsiFQuUk6?=
 =?us-ascii?Q?QEElbsSlE/BbI2bqZs6OBng/dt8ZlUwzLxCDFylQfj3OpeCepG+mQ8zjzHh1?=
 =?us-ascii?Q?aAdeKyzJcviIgSaeosunxDiGICtnVsRV6C61gcPYR05sI0t0lbTDK2ICy/3o?=
 =?us-ascii?Q?An2fNix95YmLK7w0fRKNMosyj6pVhXO6SEpElgUCYDF5ENsdrrzcqDfMDrng?=
 =?us-ascii?Q?rnRoudH4a4SffjOiYqQBf7t5tuAix+5KhVJ/ZaFPG2X3hYD3eWD9lV1FL9Z3?=
 =?us-ascii?Q?zMiWru7m5G8K1AfV8x7VdgRd1CeCi2MTdwaKElqx14iyAZ7X3cqcelmUJq5+?=
 =?us-ascii?Q?Th46o9cm2hIP+xqrgt/7U0/eWQCXGXwNz78hdUlooCd9I5dl1IKFExSVpWfh?=
 =?us-ascii?Q?nP4jDoz0EW6Wwj++G5QGA7HbArE9VQZDCd5tbvm6aRvBwLFhmj3hS+6KbTOs?=
 =?us-ascii?Q?pP4n/5lx/D5gtfMzuMe+8p51OrUUXvKh1StDASJI/zFBKp7WM1vNCKfjlOvc?=
 =?us-ascii?Q?Fgdo0q+mloShMY1Vawlj3V5u3iBiEgF9vjz7kkDFXQoitTLM02JXRaVdK12N?=
 =?us-ascii?Q?4Ckpk6rlBSJ1EP7H+RfMygKbKiJ15EMgHmhzHQfLjwozkicWMkV7WTqhRRLo?=
 =?us-ascii?Q?kpB9wc5vm88ZsNHukcr8U6Fcca4Xs5aje7Dt+2k42XTIzFek9Yfx/8JraXIV?=
 =?us-ascii?Q?4KJ34ILlSQ7Rr9TTFToixnvgvNg7M+7BhcNtX4RKvvPLyEJb3Gzt5kaO+i0t?=
 =?us-ascii?Q?L0hsIV4ixT5H5jTL2N4p0fb4X3VjqGX6iVl1s2G776o/0gTxlujbZqQQWSyc?=
 =?us-ascii?Q?19b/prgvr4hqAoaNnzYqX46x9LiXZhbACJBt03OU8xqeLTXFzOA1ASnNv9dl?=
 =?us-ascii?Q?zIXhn35EMclkwmqk/J3kn6PdUdFq1fOrven/EkIu24C9qvve+OzvDEUii0Gz?=
 =?us-ascii?Q?+hu+qJfQtH/IVIzKXsP7jhTGGyTAMXbe8LSLjuN0NgslqnUTk91YT2TqNp5X?=
 =?us-ascii?Q?7W93s2qnMWfj86VIwPkXdm0hhU5JfmtR0BCUJq1CpiGBkXfsM9OFhJHk7kWi?=
 =?us-ascii?Q?GGoWNS/jTcdw9R+7W8j+QWMLbCIGxIZgwXhfWdUHaS+9c+VjY8yZllHYxVx/?=
 =?us-ascii?Q?i9D79a9Kn6UybhF4nz/FyOanpVjGwtR1ss1nnZz9fdGWKeEc2hGoGhzDLwQP?=
 =?us-ascii?Q?qfSqXvzR9wml+v3x5wHQVHNXUO5IWfrGZNPtkQY+2Z+hNaZjq5V6h599QruR?=
 =?us-ascii?Q?B5+vy8CCc3Jl6Iuq4uPJ/VTSYNr3K/hraP1+G0lAyN71VrW7OYyvFFztr4NF?=
 =?us-ascii?Q?ZH5NbK2ijuVWSW/7woHZztPfjWqhGYW7La77DV2Dgydze54ZYmmqO8ptY7Uo?=
 =?us-ascii?Q?do701ycUWmCgGdkxziYgOT/aN9SoiBOIuW7CWGnMwAoapqJJPIV50dRhGZPM?=
 =?us-ascii?Q?kEPRSXSuibiLXEKOcQffnE0BzRBdbcFJDDQ2oD2CVpRBHQpyLtOUD9ku3PZq?=
 =?us-ascii?Q?TqmaTkPqiPWDNXfFhPgs5ZSdlJq2x2E1R64BNuMOUwESHEX1deglU3HAxGE2?=
 =?us-ascii?Q?AGHnvuVBww4pd+daSQz0/CJvsXplZ/5+9Frcal69?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d443cf05-8a1f-45b0-2b9d-08db665c5fc0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 07:05:13.4046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2uSle1QF8HOw1oNbphzzaUG8nkrcAsLZkzJSI84TwS8nj+Ixn6XC0oAgaxAKTFoT2WcjtEn07jr9dEMVK7B9oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6699
X-Proofpoint-ORIG-GUID: hf4VKYIbiY7dRZ7o8ulZAD-VBAINFLX-
X-Proofpoint-GUID: hf4VKYIbiY7dRZ7o8ulZAD-VBAINFLX-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_04,2023-06-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=576 adultscore=0 phishscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306060060
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jun 2023 07:05:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8088

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/runc/runc-docker_git.bb         | 4 ++--
 recipes-containers/runc/runc-opencontainers_git.bb | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
index b74ffc3a..cc09cc39 100644
--- a/recipes-containers/runc/runc-docker_git.bb
+++ b/recipes-containers/runc/runc-docker_git.bb
@@ -2,13 +2,13 @@ include runc.inc
 
 # Note: this rev is before the required protocol field, update when all components
 #       have been updated to match.
-SRCREV_runc-docker = "17a2d451d635e5eda2e4902324428f1bc65b0364"
+SRCREV_runc-docker = "0f48801a0e21e3f0bc4e74643ead2a502df4818d"
 SRC_URI = "git://github.com/opencontainers/runc;branch=release-1.1;name=runc-docker;protocol=https \
            file://0001-runc-Add-console-socket-dev-null.patch \
            file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
            file://0001-runc-docker-SIGUSR1-daemonize.patch \
           "
 
-RUNC_VERSION = "1.1.5"
+RUNC_VERSION = "1.1.6"
 
 CVE_PRODUCT = "runc"
diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
index a5a2f11b..60e029c6 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -1,10 +1,10 @@
 include runc.inc
 
-SRCREV = "17a2d451d635e5eda2e4902324428f1bc65b0364"
+SRCREV = "0f48801a0e21e3f0bc4e74643ead2a502df4818d"
 SRC_URI = " \
     git://github.com/opencontainers/runc;branch=release-1.1;protocol=https \
     file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
     "
-RUNC_VERSION = "1.1.5"
+RUNC_VERSION = "1.1.6"
 
 CVE_PRODUCT = "runc"
-- 
2.40.0


