Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEBF9C6FD1D
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 09:48:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15406.1679046532307972910
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Mar 2023 02:48:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2440e5e2f2=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32H87Y7B016379
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Mar 2023 09:48:51 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2046.outbound.protection.outlook.com [104.47.56.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pbq1h9j05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Mar 2023 09:48:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTZAoPaXrpjmrQPUXBNk1wPtqQPdmb7W8EGca19XKRJy/ujnalbiqJ9oTJ0Cuu5eP3J3N/DrsFoxoJg5sZqZRcQnjVKrHulJdOTv4dL0nhEnzY+zqQoiqZloGptbtV913aSZJ8f/s0KRnfRZW2tSf+EJzwfu8PT6NLEU0A6vATNB9J3ZkRZYCtJlWxxfblClBYkpjIzyTNnCtzsF9oYKXDSEZr3IygkPqd+kF1QEDY7TEz3Yb/EHslfyOomUitNtbsJeZH+tKoOMDx7n/+npI7kk5GfIah8zfXRZnblDN4jVgnrm9VNIHAoZm3/UV/pqW8jX9TwCBYEh12lAofUOrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ImdTwrL6VqDVFDTjkV+ZRRBtCBvYxrJ22OM9Hum30l8=;
 b=gwPCZkfWsgRY3r7zPdgCwsCxD76HCfs/oSRWEfZA+AYJjnVyvSfdS/cnPao6weLxUpZWix8EvPezuQsND5kq9Sy/Fs0ffi+xpUDkMZCyhpyaMYtKsXdn3WLm7DFynWWcm0YPfhYWQZvCL9I8XNoeDYVBBtvY2IR3MQ7awMCkvMYLVHnjDo54xpMQxY1TFaOOIUS+NMEgvPuY0kwmtaAx0OWpPCEghIo/AxJpH08/4PghsXh/qfWcPMX5vuNYc8YrKeLIQO5gtfNTMVa4iJ4rasroQcclrGodTW8etKIM6I8s65qNhRtacPBMzw80bPSsneh8CLOe/paUEfHIdiWGCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by IA1PR11MB7872.namprd11.prod.outlook.com (2603:10b6:208:3fe::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Fri, 17 Mar
 2023 09:48:49 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68%4]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 09:48:49 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization] [PATCH] lxc: add -L option for curl in templates-use-curl-instead-of-wget.patch
Date: Fri, 17 Mar 2023 17:48:35 +0800
Message-Id: <20230317094835.3781487-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0192.namprd05.prod.outlook.com
 (2603:10b6:a03:330::17) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|IA1PR11MB7872:EE_
X-MS-Office365-Filtering-Correlation-Id: 963b37d8-8f01-4e45-896a-08db26cccee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	64Ljygk4dlAdenh8oBMmQ/XiHdqevx1AXvq1KaKNZDLkKGYOPEczpOcurbzod4+ElhoT2trtKcGe/+vtyQFc0BYy6xAmA2QJWRnfKne2UicQQz0cQjAQ8chPij6cGc1FfjTxk4Es51Qrmm7rg4uUSU7H3aeBX/7MMYSTIbaIUJojQSdYXiDL0T59jXr9dtOGGPx5z7cY9dZJW/Z2EUgHtJ7TIkiDV72bSTj+p77XplzDCK0DodJHDSnk/HjDjXfM1JeQcgPT9rCUg09ZNz295Rl63pVJLQpcBTfp5MDaoE2cStrAk+6Uc6D+izLnQEZoLtdVWYcLUaeWz4fwoAJDy0q3LvjH/0B7ZnwvHrskYui3YRlsk8sPvXFfbh9WzLqTU/IZD3NBjbql22baRwXrANcmLBY/f57sn7fclaxat4hUK9Biwgtyz5TXNvWrgLrtyZwCMTwInq2htctw7mBGJsbD7Ek4f+nVamZZEpOGUBIqJ2hoAf+ZHq/Db27cD8J7I16IhVqkFZT/STJtEJS4bAleR6swSHZOJvYYR0TtELkAvEg/t96q/Jh1Y0DW5Un4IPjbRft9/2lWfxsVRhiSS5zP8zbJNxNHzDsbYk416ifhvC/W4E6TaHRF3gwn2IpbCI5w1knpsyMLuiOwPdKXg4W228U7fsqmvtAyRYNamvbYS1EvZUvlisrxfI6zUfkLi8W8wYvjNsSCDI4JtVKFjw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(376002)(366004)(39850400004)(396003)(451199018)(6512007)(478600001)(66476007)(44832011)(8676002)(6916009)(8936002)(66946007)(66556008)(38350700002)(186003)(38100700002)(83170400001)(26005)(41300700001)(6486002)(1076003)(5660300002)(316002)(6666004)(83380400001)(6506007)(2906002)(52116002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GPAvrddoyG79Uqhq5LZ53MXqtfHuBacn68xzJRvgl3D5AzIDXlKNc+i+MVEA?=
 =?us-ascii?Q?BX6BsfFyZZVegdilpY4dlGRLtypmyjg0++UlggHkkplquGu6SxfXGE5ODpm/?=
 =?us-ascii?Q?Ml3v/Lx0wLRkoa74Hl401USZcW9oJ/KFUHK5xSVXJ+zbYtupU/8tTkyIPROh?=
 =?us-ascii?Q?CuBv4QaCdXEllgfeJJHBm8+s0FQmCBjxOENouIrX0JsY/ry0Bu2EAOVfiBbE?=
 =?us-ascii?Q?jUvxGSL1PELfqAoyIBAAnE0G8BFcok3FAURCWHz+9jUNRugA8flOzdlZLXXd?=
 =?us-ascii?Q?HACsTtxFdogteNgcB/j0EWQ1Zydw02F3YYAtI0Z7ubXk7Km76dgBnHyMyufj?=
 =?us-ascii?Q?rEhJjV4QcPP1M8uToDXxSLwB9RHPbsTPN3fDTVQ45CP0nBtR0tt7xvrGQPb0?=
 =?us-ascii?Q?G+EAFJ3/x/Rirjo0D9fq0+3ESsEGd+8WeJRx+CabfbOxZ2lk3LsgW9yE0hqb?=
 =?us-ascii?Q?OlO0rPOLH1cmnW92fZHA8p2fxZT9i4gZ7axv9fpmT/d3EVpJvMGpfI5Agi5b?=
 =?us-ascii?Q?Qrn7ZrewyPziGOxqFP2Df56niExtiSP/hUrVlYN+PkAIhJh6U/07u5x+WgGg?=
 =?us-ascii?Q?7SzEaSOvTeeUUSrlgr+eTiZcpbq9iesYMKhPMoE7wqmSbTNEVVcxk7JUOvLC?=
 =?us-ascii?Q?BKCgMfBYw+lfTL7dlZdZZg2A4myVme379B4x0fxGFwntqpYjldD81qsX5nOi?=
 =?us-ascii?Q?wZjEwc3bdw2QyXbXsjA9I3X+mRFc8IyYaaBaxKevMhCHIgeRdDREzTc0Dbbq?=
 =?us-ascii?Q?ZbmlF6LGJfWQsCAUtAbSjIR9373KD5E5gP5HLfKmwlrdvD7nIySsyAaJDsWs?=
 =?us-ascii?Q?7aL00F4beUGId4Fzs+dzDSMH4908nJ9w8chaDp/LhtvJQ9yYUgSGSdcFpZzX?=
 =?us-ascii?Q?wbV+8HSEISnP2hZ9Zck0bTBhvnPq7lD+fq+iFIDPsb4Tol5V7FPMDiU1RpDL?=
 =?us-ascii?Q?Gm2mSYNhHgtTNbq9yYgex+T3AIZFsrz/jvZcBHuFuJzxHNQPSywlyzFX5Eno?=
 =?us-ascii?Q?JRyqAdOx9wbzoqEDA1rk1BMia2m4WBxr5pWJYqp4oVyQ4QLY87NS+GeUs4tv?=
 =?us-ascii?Q?rproJQuIov7g9o9F3wyhGQyQkHbo92CoGuMV3bd6n7vYwzoIf8VTMcKt0NxU?=
 =?us-ascii?Q?LMHULHvXACl8vIXKkduHZFT0BB3H83ziH78+CMyrkc1jQQfdmjVC7jALuce9?=
 =?us-ascii?Q?ltBIArnrb/gmG1+bpNEwr2NFP5ae0lc5Rs1Igg2yfybLqnK2ymqdVUY7zQnH?=
 =?us-ascii?Q?FOCsaUQ0PthkBRcE+SG0naaDUqlrwODaxgdxWE15nLiLCo4bAEBwqQvWuQ4g?=
 =?us-ascii?Q?kiUyxBwF//GTelVCMs1yaZu4/MtkoWzlSANkSc3zV/fWoNkujGRrSN+u/6Lr?=
 =?us-ascii?Q?Q/fWJ8wXrfSEN5YE1LBbSqRlw/5pDbImqJFCMIkiorzUNQCt3L6fwhIfJiwm?=
 =?us-ascii?Q?8gx4TZJDTQKV3MU5+DbWBtx/4Q6XEIs/DPETO8SuTahl6Dub2hvcvBKikYX0?=
 =?us-ascii?Q?2PRc1JCDqu2xr++SkKd3w1yq+/DrwN1G6s74KD/Pk2dAnBREspN56KrbvXP9?=
 =?us-ascii?Q?0cIVs+vkr1dg9Vp8hYEXE1g12jecXdgAS1DCrQZd9jTrsX9qftuKExmnHVyO?=
 =?us-ascii?Q?Fg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 963b37d8-8f01-4e45-896a-08db26cccee2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 09:48:49.2162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iso/QGPqdYL+q3MvwQtFGXteU+PlbK+lV0JpnalfCqfw2WB1AC3/DitFj5mydzwnVdkImCfw9UtsoF6rMGlRee7OxucYyl7r2g0LvCOIYIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7872
X-Proofpoint-ORIG-GUID: O4qRQDmbdQ3yIa9mU5MDDLg0-JW5CP5A
X-Proofpoint-GUID: O4qRQDmbdQ3yIa9mU5MDDLg0-JW5CP5A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-17_05,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 mlxlogscore=760 impostorscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303170065
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Mar 2023 09:48:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7942

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Add support of redirect option for curl, the
linuxcontainers.org sometimes redirect to
other mirror site such like us.lxd.images.canonical.com,
this would cause the lxc-download script report
download failed.

Reproduce and verified on following command:
lxc-create -t download -n test -- --dist archlinux --release current --arch arm64

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 .../lxc/files/templates-use-curl-instead-of-wget.patch          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch b/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
index ff5c5f6..e9af833 100644
--- a/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
+++ b/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
@@ -35,7 +35,7 @@ index a62ddf482..690307338 100755
  
  download_file() {
 -  if ! wget_wrapper --user-agent="lxc/@PACKAGE_VERSION@ compat:${DOWNLOAD_COMPAT_LEVEL}" -T 30 -q "https://${DOWNLOAD_SERVER}/$1" -O "$2" >/dev/null 2>&1; then
-+  if ! curl_wrapper --user-agent "lxc/@PACKAGE_VERSION@ compat:${DOWNLOAD_COMPAT_LEVEL}" -m 30 -s "https://${DOWNLOAD_SERVER}/$1" -o "$2" >/dev/null 2>&1; then
++  if ! curl_wrapper -L --user-agent "lxc/@PACKAGE_VERSION@ compat:${DOWNLOAD_COMPAT_LEVEL}" -m 30 -s "https://${DOWNLOAD_SERVER}/$1" -o "$2" >/dev/null 2>&1; then
      if [ "$3" = "noexit" ]; then
        return 1
      else
-- 
2.34.1


