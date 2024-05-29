Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B352AC41513
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 09:31:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9633.1716975108375914676
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 May 2024 02:31:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6879a5a475=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T4U3oN012698
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 May 2024 09:31:47 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yb6y5m0bp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 May 2024 09:31:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jN0HSXi+yRdLA1HdI+dXPNaFcA2C1W7WredwkkHR98gdwll57YaTmMig6AsDQa6jBO7hCoQgCtRHd4GKFkdWhU+RMlF8tYB8BGDH5PkYnxJNBBck64vwtRx5314K5RwVm2W3GHrUxbCGoZw0/23mrQUJQhXAgCHDrNF77s7gyVdPSkB6FuSpDi4TUZXZ06fXYhN2YVJ+23G2JHD5YF3hg5FWeAgBff0kYkiCk3cuMpFofuQG8rc4k4dm2mhCieZWv4Sd3rdpzWQ3r1k9JtUT0fAGrafkjkIwgTTiU0uOV404HbvDUPY3YDJM2OcBriN1US9/XCv5x4nTirxDBozXPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dI3Dnuv/SVXu54ay3O8QRH10X5tPteZJWC4eFtateI8=;
 b=T6LOFbDywk7JJ6nmtebyAYtoHuWMPJ0rQAEBP2Fng8kk/jiWwc3RFSikxURX/5W2sn4xWHmO0Eg/rowYKFdVCvAz2b/87qTX+2kFTG1Ujcfuq2ZVG6xQEfkXl1otHpqTazJRnPtUOC0IHDpKqNWMYK6itB/QGi/amgvB2xweObGbpKXuhR9AgzUdrrsevj2ygGXJ6xqLfm/GqmsHcTqPC4KRioDuE3PtFtg9Mj0B/S+SyKuoNpRhE1j22R6jAnDyO93AUfUcvoJKLPTdE9GpVikxJLsA65SvQ0o52Zvxb5jfs/NzHkixNFpFdAqQO3n08KivolxqWogiGG+gSdHw5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Wed, 29 May
 2024 09:31:43 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 09:31:43 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 2/4] runc-opencontainers: use GO_SRCURI_DESTSUFFIX
Date: Wed, 29 May 2024 02:31:28 -0700
Message-ID: <20240529093130.72277-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240529093130.72277-1-Qi.Chen@windriver.com>
References: <20240529093130.72277-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:40::32) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH0PR11MB7424:EE_
X-MS-Office365-Filtering-Correlation-Id: 470f4863-f80e-4c77-7315-08dc7fc22666
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|366007|1800799015|52116005|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RGQrUNCT2yT8xTI7CM/YLYDmdAvM6rsAWTNWg+pS2UhZ2XQbEqLMlX23JLhu?=
 =?us-ascii?Q?U9Z9KGeYHyaG4HMKmGGHJTYD12N+7fWUiGD3jsdGoix0/rUmJoxTCWzuYwvQ?=
 =?us-ascii?Q?bXwluW0nqDI720dhKfX/BmCuhOrY1eHoIYlLwWcEOtJCR+aEF9qnm9U9MPFD?=
 =?us-ascii?Q?lRtxTOSIWq5T7vzQwOZ6kwwi5awkaekzUfCS9WiwpCBC4oO2XuWbVP2h7v3q?=
 =?us-ascii?Q?k5D3yEgye1A9sI8SDnPyQauqChTHVRhywEk6GT8b+0iIO4axWUSHIgUiHdC2?=
 =?us-ascii?Q?3oookeJfFrouucSrxVvaPWD9cpjao65p93sKGDYa7WM7LfNNIOFE7XR908fG?=
 =?us-ascii?Q?3pAwhqRIX0aLOaaq/HqMdxZ0j1ojA1LakDYbEYkAXFJEgVJwuhReMuZ2ieJ/?=
 =?us-ascii?Q?G6tEW1XSTim4kpJoP6xz5pSB7XWtaMddXf1Rg1cUJLhX8VoTbifZZTzJsE4g?=
 =?us-ascii?Q?JINWYbqIRew33rSSbZ88+K/rXyoSSqY4XjmrkukDHulb35rvz6n/diX+tpD6?=
 =?us-ascii?Q?UvKc+zgGD27O+3+/cF7LrJCRtiJ6R5Y8+QRdnyJiOGO7o50ab8hwayxBLmaj?=
 =?us-ascii?Q?7ftM4+yB+ZDoZPMxgnSE6LK2WTBbkloh3pDSIphrhPWl/w3YDPIMA91jk5mr?=
 =?us-ascii?Q?hcZdm7Ex6MzfH89deUv1z4PoB2w8JxTeOO9zDpAYAXzr/kakkwnROt/E9/ml?=
 =?us-ascii?Q?6EZqYiR7RYzfDPClDqIByhkTnXbUwhBLBypSMjkJzvJEGqZSmI/o8h8Rp/xy?=
 =?us-ascii?Q?1eBZYcdS6diz6DQif53QUMzGPG42PONnS+X0IvIB90B032x0OzaS2LBSbRDZ?=
 =?us-ascii?Q?4Bam5ipokk9UGeqWkLjWI8dpNAlK0F6TbCuiUgHcOLMhZtyEHUg5FCTcOIsE?=
 =?us-ascii?Q?ipbuAo+rwhrgbNp1Qa1rBa/uhc06Km6mtNR2BZSgpVZAYjMlgytBiNb1HrPa?=
 =?us-ascii?Q?f2j/jFWW1hjjDXnaSVuFGsFyXOHAYwKgUA9PhUr8LBqMkxcRZTVRt1mf8eyk?=
 =?us-ascii?Q?Abjz4ZiYmM/vFJM3rRnEFEkprFtnGjACOgUMfL2OgCOYLFur8IDwhHA5dNQl?=
 =?us-ascii?Q?0ISwXa2cK+YDSTTNtFNZZoMN1A5JbeFJ7LhfUGAJoraVFk1ykDfyz7Z+NTPW?=
 =?us-ascii?Q?awBjvRRh+x+dxnUkK9PwAaPpOreXkLw/uCWQPaUCPOWTolVXy7DJ9B/E2STv?=
 =?us-ascii?Q?TWqqTX9FCySI+GQlVrG6y9/JD+p30J2JSWR4rCIDxquo+WAc0Z45IIZiAzbR?=
 =?us-ascii?Q?Sxkp+rINiCJySFd8KKFIQqu1DWQydmkECy2ScE2dNm+0AZaTHTwLGnflrhD0?=
 =?us-ascii?Q?gIGYfR13MCf6AmaYbeT3K7dcT8BGXoiWuMv/5lWvQRnjkw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XCC+6u5CVxbQt6fGGJUcwLfXjr+GVAf9ARMyl9Aqc2zLVccEqX9qSb8qwxDC?=
 =?us-ascii?Q?Vx3SccVadaavnPBWb9fj+4gYnZ6IjWRmjPh8opMPDb4gtvOgzlTKTc8y9r7Z?=
 =?us-ascii?Q?+WiOSgjrG6mJ/v1v3SHDpn+K97PyZ/SCQguz3tEvdOoG/GCM/M+YDmsOfNkG?=
 =?us-ascii?Q?Sz3cD5X/aw5tJ+wIex4STLjYNH+GCDVItsg7EsV4YD7OmXpfn1IVnW1j4ThJ?=
 =?us-ascii?Q?4PcLgEeZp4MQS7gnT3c1iErrRhIBd3ixzFtvMCLK3onyfTx1AjyU75u8J00N?=
 =?us-ascii?Q?1soSFzdqBWrF2XpviSg6L+LPt+A4zK8+EUGaZJTKFuRniFrP1rQtXW5tFIBu?=
 =?us-ascii?Q?e0PGzUE14Xxj7Fd2WmTBXhBZ4w1rRSHVHN13POEB8uh+wiXVhJoXFrrAiuTi?=
 =?us-ascii?Q?fFE4p4L8d+R/rwciVMLyF1ZuP04WNq0nOr9PwsBTh68LBYRonOhrJgomOzDr?=
 =?us-ascii?Q?kDk5ZmnJZfKIyMa3p+H6fCjzuAHdSdIacFhmWakjD+PG6zeLTzgg/yhYC2WF?=
 =?us-ascii?Q?IZUbQn92KTPg6+mQagRp7BXp1uaMT4bpUPW3rzjUfwc08bceSFK/ezlEr51Q?=
 =?us-ascii?Q?nyMuJQNm3ClnTnijddf4+FUbA3HoewDPJl314UkpMSY7/MdTUVVlBIMYPxxW?=
 =?us-ascii?Q?xq6mCeFwRHIqJqNDdwc5M9pd25a6/+ozxg+UQg8V5TUn0zSV7ypdkswkhi0d?=
 =?us-ascii?Q?9fGue8/0KOTMc5oFBHMDRRKr0YDM00h12SmQdnTtti2Qp6cw8Nnb2YWM1gZ2?=
 =?us-ascii?Q?TeYqIG+mg+6j1YKMUza77/8q740DchPwBiiY2hRhso0ar/9y3fxW2JdoS4b4?=
 =?us-ascii?Q?q3jlr22FSku6Ua4oo0l6FwsFwy0XvQkSkhczKuoeGaqPxcuJBh92dBGA/njr?=
 =?us-ascii?Q?Cr9WQSUC2BC0wusJs2aII2Q3+zDX6h2MRGG4mZ3KXSga6NmyqKSfpxaF5VDG?=
 =?us-ascii?Q?tEWIWyotRiNFCuqEBtMKodfCMyL7SmNsanVsw/UB2Xy8bOupc2gU6XcFilbB?=
 =?us-ascii?Q?ot0OXM04qvM7QNzSHWsL2zYKgpfHqzc5+mhj8YtbifSUm5l1RsH+sGP32X3O?=
 =?us-ascii?Q?6JD84PLnOKzgpqa8OuxrWIi4o2BLJuG/T8wHFFpej9OQ1tgYt7TXlOrQ+mBr?=
 =?us-ascii?Q?Ets9L6z+os65j4M2HJ9qdldYRJ3xnlRKMbwNd+3pHQppPJXgU2uS9O85TsD5?=
 =?us-ascii?Q?UWSiiD4fJGeBhq77YY+iX4a5IzAP6kXC8bjStBEO54KVrFYURl5xTKo0h7Ca?=
 =?us-ascii?Q?Qzn+kBCvzbsi8Tl6pKwb511bLdiB1EY+vXoBHvSi/d12Gv/Ofm5NOSbh3Sc9?=
 =?us-ascii?Q?Vmm2zSXnUrnaxZ1Bz3A9f2mzmDq8N0/7Wb+SdrFd+lFm/WHCeJ5Abz0DBf33?=
 =?us-ascii?Q?dKvq1FqVevynAV/YyW0poxgsDYWRfWL+gd7gdzzHyJcRhWqxuOhVNwfFLZmk?=
 =?us-ascii?Q?JNUnNwyy38/O3kDI5lsmRIMI6aB9e0oruxytqXO1Zn9S62aiSOPeT4nzS0my?=
 =?us-ascii?Q?EpdQCqSHwRZGJNfXAhL0HIdvJIp9thofx6FsVC1JcpOqwQb/IpwrLg4XNHPM?=
 =?us-ascii?Q?ABBOCpAM8/Ob2e7O+MN01Fnr7k0mQYDVHRW6NW+I3N5My4cIUkHL6YOafOu4?=
 =?us-ascii?Q?Fg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 470f4863-f80e-4c77-7315-08dc7fc22666
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 09:31:42.5641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iEXhzKUb1qTCPtwHqaLs/gTDsBDyLKEq9+G3Yqwgi0/wPCZIDGc7+FJXjqZQa0ba3c+F23y4IYKu2Z6DAqX0RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7424
X-Proofpoint-ORIG-GUID: BfFWazWZZL3atrP6IJ8S6nqIuOKfRTbe
X-Proofpoint-GUID: BfFWazWZZL3atrP6IJ8S6nqIuOKfRTbe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_14,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 clxscore=1011 mlxlogscore=893 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2405290063
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 29 May 2024 09:31:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8774

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/runc/runc-opencontainers_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
index 188b8440..0b709a0d 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -2,7 +2,7 @@ include runc.inc
 
 SRCREV = "a9833ff391a71b30069a6c3f816db113379a4346"
 SRC_URI = " \
-    git://github.com/opencontainers/runc;branch=release-1.1;protocol=https \
+    git://github.com/opencontainers/runc;branch=release-1.1;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
     file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
     "
 RUNC_VERSION = "1.1.12"
-- 
2.45.1


