Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB42CCA480
	for <webhook@archiver.kernel.org>; Sun, 12 Jun 2022 08:00:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.13858.1655020844229865524
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jun 2022 01:00:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=SZ8a9tSs;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=31623a79e8=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25C80eTo006753
	for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jun 2022 08:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=e+xrXltjLv4X19GZLzxXDaOeWxFceXfNj/1IKrr2FIg=;
 b=SZ8a9tSseeXtzrYKWcFh9XIG+LByAfp4/K5EZtNrIPVpMIwhq0lVg3Wl2ojAqiKdZL4x
 la44pvn/I/nKvmxmXfM6p7URfMpVFKizyxLV22i/shohO3BMp1bz8Iq+KWPaMzJ8pN9h
 /ZAcff9AB0LbyQ7dh8HcBK58fqDDUC9fK8cH/ubF7aXRMks10+jQM+/JkJTxtOYzf4LQ
 6aciIUUuWoSeV05mTJN236DUtR1QsRBu+ipzjr0jJtab1TqsGFlQb3IzGvIacTDDHOO/
 nfJxxhdHBj7N3SHHUeLd3FnjwESS00TEsiPVR2AbvOiG1xIzlv1hb8278EjgXrdgnzQw SA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmj198pw7-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jun 2022 08:00:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFLZdQ2IM7DgK55JnJOF4UGkly0U4j2p8yAuzGsNT7UflCdOwDxIMHvZwqxu1FsOS5dKZtcqR41YQjajaYLpBwnzKLLzE/F/FCLE6jeISHZTq+tOSIxzVtzVS3pLB2Aa7nIRK7RVLrlu/Hlj2GT62jrdJm6FMoi0aV2NI5tTdH6mt5w395GywMM5pnyDEwcQO5Rypyotb325gNu3SOe+7mZqotf/Vxmsn7s1iTgqmPFke70AsxuKP1pakkXN+GvXEGrhjCH+XRu4/ebdXIzOsjGahtRYNRzUj4l9rKC3lbGOVPTCEcZJww6k3vQeV9Ui7DiGhEnb3/EFZa2ErlIDJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+xrXltjLv4X19GZLzxXDaOeWxFceXfNj/1IKrr2FIg=;
 b=WfHwT385Pz6bsBtwOOhYLv0WmF00qMK6fGh0+FUgSIWNunkCtgrOv8LEDabl6cSpkkH//V0S71gcu/V0j1PHHgIfBazs5lEEOCVcJgk0fzkGPxc7L0O3m6hTwSOG/Y3JUKoG3LIH9a8CZzt9I7pUSAXvHrzes7Q3LVFvWy1KNtICREkDbn+rK+yn5SO0QE+0OUqXdk14UX0dZnYReRWt0Z1yAKTiVucHl5GnTG5VTtH6KkcgeV9aE4ymXgauhsSsn/MCMkAkLiNdCmSuraPwwI5n+a3gsMVyl+u8eKAe96C66zsSyd7aOF+m10s7XouHYV6V4ZdZ61bMFzZKT/vkrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BL0PR11MB3396.namprd11.prod.outlook.com (2603:10b6:208:6d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Sun, 12 Jun
 2022 08:00:41 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8%5]) with mapi id 15.20.5332.019; Sun, 12 Jun 2022
 08:00:41 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH V2 6/9] oci-runtime-tools: adjust GOROOT,
 CGO_CFLAGS and CGO_LDFALGS
Date: Sun, 12 Jun 2022 01:00:06 -0700
Message-Id: <20220612080009.130993-6-Qi.Chen@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 48861584-269e-4567-a77c-08da4c49a43f
X-MS-TrafficTypeDiagnostic: BL0PR11MB3396:EE_
X-Microsoft-Antispam-PRVS: 
	<BL0PR11MB339618E752198D98576D1572EDA89@BL0PR11MB3396.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vrmnmAh+sDdVbBUF9Kc58o1RA+4SBafPbzMjqXc3XWK312P+UAk59Ks6ul5tUZJTRpUgsCHSIfu2el757RqkEXPDTgQt6Jmhr7fvS2wljU51Wk8/cM18wS/VpTG2uE/10aPjV8F7Wl0c4sTn3vpDun51TwL5Av9XgenBB3Pu2phmma3QyRxcv05TrMHxi5yDrc99I62LqJh9NJ6LO3zRQIy14UZ4nV4jlfmWPvS/CPiUcZ/yU1mPLbMLrt3tQCyNqmEyZpdXpQrrCBUKWq6vn0jSuXynK+FxU4DbF04Gxv922aeJ47RqiICh4wLueedeMr7ESyanQs61OyCrITOaeNHAyZDdyoRZzAN0JNlpA+SaYSIRQTwzvGTGSgMaGRuAZTj1GxrnbmdSW+9jOal0V1bq6qOaxqDQvXUE7/FteSSSDdgqsXWe6jiEVBfTSsUbfuF4dA0esdPuKDzxPzQnMCEXOjSojvfuYvUJajOcHTJ+0I4x8bJp0Y0JvDyEnwYYTF7cQsHXaNJGz8rQbR8+2WkyjBelHhYzpZimRFprE7vMk9eBC8N0NseCUUTNV18XUr6uJWaCfnZ/YRHhhVQhR2jYoaZ0ntyK+pbNz7rfHz+qlBiQ1zM6svPLcjAD90XTxDM32U65sW5y4PNgsh6Y9vONOh5NC9PjkoxrwpTFqTnhRMjjHqMPiOvjSoAf/4BBlAom+tv8G2AU6/oaZhyriw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(83380400001)(38100700002)(8676002)(2906002)(66476007)(66556008)(66946007)(8936002)(186003)(38350700002)(5660300002)(316002)(508600001)(86362001)(6486002)(6666004)(2616005)(6916009)(52116002)(6512007)(36756003)(6506007)(26005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?x+A8Ex3ixpc5+Yx2IGUZpzBlDSx2OWvGroKkdKpSDpBBk7WmO1uHjyDnpfe6?=
 =?us-ascii?Q?GhNrh0tpxrJ/KtuQHO/3jP+W6ZT55KoZISkbk1Z/HNuCuS2Mpfho58C48Tfw?=
 =?us-ascii?Q?LB22c+5CMKDexW+FJY37jJ9NrOUEPQXP5n18qFFKMDCiJsPl2kPvkeVedCts?=
 =?us-ascii?Q?1Kv8uDVE0EiT3oSjOeJrzJe7AxbJo40VRHlM/Q4YCNQmBvHfYBKYqWLeNwk/?=
 =?us-ascii?Q?+9dPjqu5aMUS+y+hWGTGa1V/cxBIdhVOF9wUjleJJ5XNTcDlkfu+pBLz+ueF?=
 =?us-ascii?Q?/loH1ffrZwZLvMn5Ks8TUVdbm87iYy6Pdca9oaTeqlU649sJOvb2nGPbqavh?=
 =?us-ascii?Q?sOiV6YUvg+mBfObAwtYgFni8at4rb82MkD+7DZCjC7HQ304hqwXAjhcIAmuW?=
 =?us-ascii?Q?KBohy2u445hrXaucI0khlg3Zsd8dM6Kc8ueT5KxYLOynagz2u7zxAKGhSS/T?=
 =?us-ascii?Q?gx7m1Ctpm4RP7z9yMspjJ8RdQYh3kfvIpWEhS0f7HaexhKdcT3nPeGeucO4W?=
 =?us-ascii?Q?v+F8ejQljp9NhFUF6frTSKCWPSdCGjs/WvxhLjcIFkd5XNdiIiKnBVUyn/An?=
 =?us-ascii?Q?W2PBjx7YvKIymfxg9UFEWPrShhAMKTHxtJLAXjAC4DgOikhHls4Z7vPmKe0u?=
 =?us-ascii?Q?yby6Q8MYOI9MgfaXncumkBgzHs0h0aUhsVS7BRvs3JlO/kHcn5sRNXOstRE9?=
 =?us-ascii?Q?ewzFDJRysYDrVVbo1nbokPMQ14ARHPdJzPISqzq5RXvqOyjl3YNnZqIbnTty?=
 =?us-ascii?Q?7up5oZrYWrzY/L0vVqFT9/w445fAGv6diDNzuScgPbdcrW3ErvQPk1NlH3tr?=
 =?us-ascii?Q?JGE/FiJkaLVxwubMk5KY0yMJlxY06PY6cMofezNYsHT2NSgX53wtN8xNcVaQ?=
 =?us-ascii?Q?EMzB4TUGzSHiHbLHap4GJWyFQ5ZZuSxhnbMATmzEgDlWrFWOlG7duk+3AKUI?=
 =?us-ascii?Q?0E3f4HNzI8TSVDijKFZO3EIab0Y6v6k8a+nnlqntJAN7RiM/5J37VCnGzzca?=
 =?us-ascii?Q?CmCx5L179FW8ZQTbsvBtzNhz+S4/bE3MELkg6XllPeTiVlHA4dtghYOSb96l?=
 =?us-ascii?Q?o4LPedLQGQuE961bwELwcZZjxIopCgSCZf51wEEiY/If/qVR8FNot1D/7fDZ?=
 =?us-ascii?Q?0+GDCWCglhc+4tQhTF1iRVd45InaoVT2C7/i6Qoo+Ac+u0GpbH7BgAa8bryq?=
 =?us-ascii?Q?sLeAOvf8JsPUnU+lKsJSoyp9KFlNkWCsbe6DCcyWu9bInoqjh+pDa7Y31s4P?=
 =?us-ascii?Q?WcTS235sOmOvRYjHJt8AMVDCQJeziVjEJmkC7AHoBMHm8FdA8iHwahWxwBhD?=
 =?us-ascii?Q?mDsR10BLos5IGrwS3y4O4R7S26rs4nms7M9wy77qztgkAVJiOlstkvI3ZClt?=
 =?us-ascii?Q?ZoKVoO4JCC9/nys9pNgsQFq+JLDwQMilKEc1Jf4u+PgMpo6pg/NqWyqypIVI?=
 =?us-ascii?Q?8kSs7LHveZ873DOcbGWubaWEJLqLww6D8Ro5QFXibbKwW299ckfpVwYaAAN3?=
 =?us-ascii?Q?8nnFQlH4cZwu3tXNHguQZoi5NxbKLiihnejMBIwe6esxkfhQ4AujPYdxheil?=
 =?us-ascii?Q?9sCCXmqaYzbhU/A0UqxlYdhsSSuc06TpVbkCHpZ2UjzjS4S066feFQi91Rq8?=
 =?us-ascii?Q?uXKaLMSyQRXoZlus54y2bEbmZDtaRCGdL5Wz7F+SJuzKnpXEO8w95mvOOaTf?=
 =?us-ascii?Q?l0dOVT6gE2bxKTnzCOc0ChrXAOJczr+iiPw29+JFnsLOWaTWHS6R8lkJLp2b?=
 =?us-ascii?Q?zofS6rc9R2KkCaxxvDW5eAnq4zQz7iA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 48861584-269e-4567-a77c-08da4c49a43f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2022 08:00:40.0804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VyOsO3UDsdXzc+Fk3JshjRX55TrsEANuOihbZ66PZJj9RjHyKXvNKaYuleKnDMgyrfmA/h1n6PtXH+N/zMDg0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3396
X-Proofpoint-GUID: 61PI4SFaZDI2wH8jSmb_D4AcAvsh7w3T
X-Proofpoint-ORIG-GUID: 61PI4SFaZDI2wH8jSmb_D4AcAvsh7w3T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-12_03,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 mlxlogscore=712 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206120038
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 12 Jun 2022 08:00:47 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7375

Adjust the GOROOT setting as directory specified by the original
one does not exist.

The CGO_CFLAGS and CGO_LDFLAGS should use target flags instead
of the nativesdk ones.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../oci-runtime-tools/oci-runtime-tools_git.bb              | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb b/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
index 838d24b..0a4c909 100644
--- a/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
+++ b/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
@@ -18,7 +18,7 @@ inherit go
 
 do_compile() {
 	export GOARCH="${TARGET_GOARCH}"
-	export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
+	export GOROOT="${STAGING_LIBDIR}/go"
 	export GOPATH="${S}/src/import:${S}/src/import/vendor"
 
 	# Pass the needed cflags/ldflags so that cgo
@@ -26,8 +26,8 @@ do_compile() {
 	export CGO_ENABLED="1"
 	export CFLAGS=""
 	export LDFLAGS=""
-	export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-	export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
+	export CGO_CFLAGS="${TARGET_CFLAGS}"
+	export CGO_LDFLAGS="${TARGET_LDFLAGS}"
 	export GO111MODULE=off
 
 	# fixes:
-- 
2.36.0


