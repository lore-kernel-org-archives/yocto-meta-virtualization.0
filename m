Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CFE6CCA482
	for <webhook@archiver.kernel.org>; Sun, 12 Jun 2022 08:00:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.13685.1655020842078991253
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jun 2022 01:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=W/e/exy1;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=31623a79e8=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25C80eTk006753
	for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jun 2022 08:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=cyofePrv1EblNyHFQ3D2U7B4A1fhX8mNRsLB/xofUUM=;
 b=W/e/exy1vQvfZTOuTqgsKpCo7oISt8Tchu87bRWnlXKnWBWSf63OBkhzonyLSEOtod8f
 mx8nnO5Hpo3XH5XdTSP1tL1CEZY2LVnHcXhUixErbjvuES02Du6Z/hB+FY3MMY6NZXwR
 BHISwBeRJuKixHl8Ih4ZcLFLaYwHrDYmCaPQOt+m1jWdwsi/RnWbUjmKVu0VKagXUB8G
 Yi5Ye2o3teUFZibpiKkaQRXfDkCtS7SH1dp8Xv/nXaz8sdcxh2qNBnD3stWSCpLzJLdW
 VYuUjcBletDBLdfCIy5BEaVl2rC1WW1FxXEGR7jUe1cIG3yljDOCgj1gjoQGKoXumv77 rg==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmj198pw7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jun 2022 08:00:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXB4t9lWWzVSHzjy7gJHIqPohkutJOBGfRylFML7KvBs3sqaDn/fEBG/lTyLmOWTQJghxkOn/JZhQ+Ke0IkCO+/dnWrTXGjvPtqrEM7X/zmSbwwCv2jfsdC9OfgwxyL4TB3aPr1Co+XiAYiBlH3IubiEbCUQSI+aXDeDomOeBtumaMb4U8iZIdvKL4f0om6Q+opa04cdDWGKwveKXpUA82GUPrq78LWbRB7sJs5hEvmr+BeoztS1BmFjyGpPcnfIED3F+fwCHJTtwVl+IVZLNNqXUNjxRIcYxthRU3iSW9a0lpbnL2ZsWghm1vgbvJd/4m7YSaAxTlK9u19gBWBODw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cyofePrv1EblNyHFQ3D2U7B4A1fhX8mNRsLB/xofUUM=;
 b=cGJ/q6Ln9GamX4/4E5ng5jVMiW1paSWwd37NnWHY+p3PiPkGA8Ql+oDEZyvVwvA2OqiX8bSjaH+wwFF2ypbZUVE1bkkOT2xHb0n8RTFBebkxG3/rtJhbYV/CFvY4oWX0rfV4OCbnC91P2qj2ihsZ19Hehp+OvA9p+tl0J47KcOifRJcXfLmHWMdbVrIuvSZ1EYLRY3pdjOJxWo4IZwVXuloRwsg5KyjNNQ66zEJ/2/jIPn382NUe6OIDjI7zMYFgqZiJjw0zZUQYGBHqC1zRHf1bYSMCQKRGzOEL2D+EJ0JOVTNJQofZTKPpDrM8IXvwYsfPIigmfoFYevKGmOGlFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BL0PR11MB3396.namprd11.prod.outlook.com (2603:10b6:208:6d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Sun, 12 Jun
 2022 08:00:38 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8%5]) with mapi id 15.20.5332.019; Sun, 12 Jun 2022
 08:00:38 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH V2 2/9] docker-distribution: fix build
 error on new hosts
Date: Sun, 12 Jun 2022 01:00:02 -0700
Message-Id: <20220612080009.130993-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220612080009.130993-1-Qi.Chen@windriver.com>
References: <20220612080009.130993-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0169.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::24) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 048aa7b6-493d-4b65-11e7-08da4c49a2f9
X-MS-TrafficTypeDiagnostic: BL0PR11MB3396:EE_
X-Microsoft-Antispam-PRVS: 
	<BL0PR11MB3396CBBF080F2A1BB83EDFC9EDA89@BL0PR11MB3396.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Fh4PS4TpjTKBwmsDHPX+1GPsrdZiz3Ym8Isz5NdRR59KUJli0aHJiRrcW2FQa/BriWJ+clhuRT07Un2olk3+oDIFrugq7KTPidmYZewcn778Cu5IU2RYZvldf/t1FaymTTIViVc8Y5HEpvWwDgTeA54NW77vbQdENW/cAFu++Dy/UZovYI6EiuSb5kDAJVbKHSTQED1z8RK6oW6+PBeHr2b6SvFN3dRZDoT0oluRx8wa3H/lAmJrG77KX3ZBm0xAshqyP2DQ4ZqIpSNrGREff813zGu+m2RTiuPYfh9ZFvhHG+oJAdNS8CYrbxJufvWUme+/0HADKfCmlQV02s02DfRQvINdUtQEnJbYT1SDIhIImiuIh3ujSZTEgThNpqQvPpYAuLdUtWvLVQcu95wgkWpjLWpxDN4unDMYx/4wjA769i9lTh1lV+gBEKxruPTWOpk50NLnpGVlldpa0DUUxFRSuQPGzi+rUqePJWJK9UX+HwRepQPX94y2tc5a2msxF2L8GN03aSonvGRFQjgVIswmfo7wEcITCjn5CZPH1R6oxBhHKxJBxZ4MkNaiE+0W4euLy1k+ckxhPWWOSRX+07/uSpuwSSVA7f1V7z0wKe1/+sC5f6B1ik0iAy5c748toazSqmD8zntLY6v32w0U+zeVDVAji8aapatCPW5yzvSiXvjTNRqOIMCF8n1ikFkLnTNHfdga6YOHtvVkukc0NA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(83380400001)(38100700002)(8676002)(2906002)(66476007)(66556008)(66946007)(8936002)(186003)(38350700002)(5660300002)(316002)(508600001)(86362001)(6486002)(6666004)(2616005)(6916009)(52116002)(6512007)(36756003)(6506007)(26005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?58mcBNYHeu4kdO/OBRABKKzEA87t0fRKgQW+XZYzj+u3qSQoV49gEQ4LNkN2?=
 =?us-ascii?Q?QjNkEQAIrCmcwJluXDCnZ7qzev2CTOm4X2fEUVa7kBgA+phjusYuhzo1LD3P?=
 =?us-ascii?Q?2UWFSXVQNdrhEkh1fj/JCmypSjVduFH05o0rVY+aDxO6QLdW7zGCk4m6S+Zd?=
 =?us-ascii?Q?Z4dPqV0olXnEtv2xjg9rSXN1OTOtrmF1ei6rnI/kqYrSgUFtFvLUDfWzOps3?=
 =?us-ascii?Q?LKwW70E11xM2DJXuBGeNmdy/A3e5UvtLTcxlTHyMo0TC/lxAKcBqajpsWVRE?=
 =?us-ascii?Q?AS7SlLyx7j4ySuvXQpmweAVSBiQbE9N2r8f+GkfCQlp14ICqRudekR6FfoIc?=
 =?us-ascii?Q?icuH/KsriYIdlrtruopgPXK9YieKkyFU1a8TTEICi2DvYPVQ4cqRXVtSnWVq?=
 =?us-ascii?Q?tWnuec6SB6RtSsYkJ4006iYYLFGbwdMPn/xbS/ewyA5mR2qY7jGgOnmqBEv5?=
 =?us-ascii?Q?jrXmDL+jLCqg+SlH26z6PhA8c1iaCccku6+Ymup+/NoZdcr60QDup03o/D2U?=
 =?us-ascii?Q?hN6Es2rE3KLUvLmHFBb2JwIbuXisvOtZWjtNjJ9wFx3vg/ITmu9R2tr+1x/T?=
 =?us-ascii?Q?UX9uCfKFkT5PZFKh8AFkXNLvVk5yx0mvSOXXLCaT3Wn3AXm7DfLRZuLQPvtj?=
 =?us-ascii?Q?kXH4y/tba7369z4aUC13ye7eFAO7jPc+r42wUAVbnKXclSqUyJj/PrJ/Go5i?=
 =?us-ascii?Q?jJBhZX19Goxhw48/GzmG3E+vCV8O1hly4s8VbIFnjlom28YDTeXzF6zK/79u?=
 =?us-ascii?Q?d0svzlSa9EIUJ/OSGrja0C/jzvCOH0M8u/86U9Mq+Kto51b+O25mrSH34q+K?=
 =?us-ascii?Q?bmnr6Mf+VlFmxrmfC86Gd0Xlrik6jMl3js2EGS9nZ/6wujcvcpuKL9nxs4aA?=
 =?us-ascii?Q?MM0ISX7A3Rlb/YScbMfcWudCJzQEhdDmgwZWVO3uZlkSotKim34PXX/blFmr?=
 =?us-ascii?Q?2sR4aABqy/125u0uwkRjrt/DSicZqlNVvG0kHOjGIZmiR6D3+HmD/uMjVbs6?=
 =?us-ascii?Q?H9k0wUhzhC6eEQKK7zEDGk0AAn7Gf8E6YSUpOySQwyTdl3lOBwMudNubdvMP?=
 =?us-ascii?Q?QSXdSufoXnu/A/etE2ccmCK8GSG2GUPpfpf6Tad2+ZsoOybgSLUoGuFa++NI?=
 =?us-ascii?Q?sjzuLDQs4iMDaqFlehcblXy5i8h6UR9Img/vSgJkifwjt35N/XyDR+hV8LzM?=
 =?us-ascii?Q?LRHWqdUsgjMi3lOXf7L4K4VjJ9yMO0nCD+9SLfXukhWIkwWWDuawgRvt0X/G?=
 =?us-ascii?Q?LByLIJJ36A85Hmh3w/B7fvjBKAJKEfgUyHXKF2tu6M7xYoT/oIc1GfXtNBT7?=
 =?us-ascii?Q?5/4Ynk4DBt2NaqHbQTkwoF1a8qIKLxHwii9L52TrYV3ANH41oYK8Kj0WM+LY?=
 =?us-ascii?Q?3szgpVJIRd6m2cOqq8a8gTiCJnP1h7cMf9L30RGxq1yw325f6Bzvk3YG6wtY?=
 =?us-ascii?Q?L3OBnwvcEcmG7bGjENWu+Tvvhz2PHWfrJYOaXIm7uSmeawhJWSkTaxxrwwF7?=
 =?us-ascii?Q?3vzuPZiyiZbqN5S6tmKOCpGWZVfQHAAZ8YzsA7AjpLtECTymKUKZGNfc1x5t?=
 =?us-ascii?Q?rR9R/zKfmRZbWkdm5QwJ68MVn6OLd2uqhMtsHTgGN+hgX5slgIYKi+DMGshu?=
 =?us-ascii?Q?Bl+n1J5L/bNaStaFhaEUIsYGK8cO+ZENhtYylKaivOJKP6+TItZR50CgoALK?=
 =?us-ascii?Q?DD3UXABqemboBDuBmL1nZx6MKH/e+3LLIJqtKni/+w3IMciP49qcWnQ2/EKU?=
 =?us-ascii?Q?V5RTa9TSRviYdxT6dcAJXgsRE+Yj1XM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 048aa7b6-493d-4b65-11e7-08da4c49a2f9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2022 08:00:38.1744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cjE2bjOxqY7HeubpYE4NjejihDVqMeVP6ZnBt4mbXD+1J9BbJj6IsZJxxPw0rfCQl9HsFIia4PmY8+aFvQkbQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3396
X-Proofpoint-GUID: FmZCCkWpE3LtFwwnPEbC8VQXXa_IhyPF
X-Proofpoint-ORIG-GUID: FmZCCkWpE3LtFwwnPEbC8VQXXa_IhyPF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-12_03,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 mlxlogscore=903 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206120038
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 12 Jun 2022 08:00:47 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7371

Fix settings for GOROOT, CGO_CFLAGS and CGO_LDFLAGS.

The previous setting for GOROOT is no longer valid as the directory
does not exist for now. So adjust the GOROOT setting.

Currently CGO_CFLAGS is set to use BUILDSDK_CFLAGS, and this is
incorrect. We need target flags instead of SDK related flags. Such
setting happens to work for some hosts. However, when building on
newer hosts, we get QA error like below:

  ERROR: docker-distribution-v2.7.1-r0 do_package_qa:
  QA Issue: /usr/sbin/registry contained in package docker-registry requires
  libc.so.6(GLIBC_2.34)(64bit), but no providers found in RDEPENDS_docker-registry? [file-rdeps]

The above error was found on hardknott on host Fedora 35.
Tracking down the error and I found it's using host stuff which is likely
to be caused by using incorrect CGO_CFLAGS. As the master branch is
using the same settings, it has the same issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../docker-distribution/docker-distribution_git.bb          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index 395694a..89c5980 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -25,15 +25,15 @@ EXTRA_OEMAKE="BUILDTAGS=''"
 do_compile() {
 	export GOARCH="${TARGET_GOARCH}"
 	export GOPATH="${WORKDIR}/git/"
-	export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
+	export GOROOT="${STAGING_LIBDIR}/go"
 	# Pass the needed cflags/ldflags so that cgo
 	# can find the needed headers files and libraries
 	export CGO_ENABLED="1"
 	export CFLAGS=""
 	export LDFLAGS=""
-	export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
+	export CGO_CFLAGS="${TARGET_CFLAGS}"
 	export GO_GCFLAGS=""
-	export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
+	export CGO_LDFLAGS="${TARGET_LDFLAGS}"
 	export GO111MODULE=off
 
 	cd ${S}
-- 
2.36.0


