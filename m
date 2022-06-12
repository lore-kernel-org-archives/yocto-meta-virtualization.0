Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE9CCCA481
	for <webhook@archiver.kernel.org>; Sun, 12 Jun 2022 08:00:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.13695.1655020843132978403
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jun 2022 01:00:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cRPY6UM1;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=31623a79e8=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25C80eTm006753
	for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jun 2022 08:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=nlvCgF6WlUIyXnMkvxDSg48/L/xMH3VqCINIK4dlIDk=;
 b=cRPY6UM16EmOaSXiBUtLlXOd3Uewml4WQ4++V6eXNhY4qZeeO4VvII1JhxACAer2F/zb
 RlR1VszIUHbXB0oTOIP0GcJZkV987cW/NqmGfuXmgUnAGKYPy6mDdcEkKvUenoWZVsux
 QcazRx1fL9V4e7yBp5auAlwXeXxzOsjJfXZeK30bIdiG03JAaN8y6T2Z1PFiV8OcOgE+
 30l+UzMfxehs/MPKaAUCcdmdHh0i5jEOqno+gIi6y29PtWpeqr1L9qvklGLvraVBvalp
 GWj3SFQRHD/Uac5e+2Ztx/Z5u7YUvhEwYBWAMwqC+eJfmthPytoPUkprVETrLX6cyctB HQ==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmj198pw7-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jun 2022 08:00:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gr7d5Mo7z4JplHHpOvL5LveZJ4JjTTka3S1q9Qeikhpy3M+dzKozjHIrqvb1VZ0cJS2WfKAR0tM6Kz8kobJGHkBLuDa/je5P5rpB4z6OqRsA+Lf6y+9BI4epGmfzRKaf/yvoLn5APZSYV8G3hvw7G/LLxsUljxpMR06aEiNXMJ5IFHRUo/O4MInslmlcNkvwandTy8HH/PyjTlB22C/6TQJPXuBu18/CtiRq0wILXIr8g7MpdCZudPVG6sqQgt03F8GbX/KInPo6T8BbRDFVGllnUriAruIcNSRk6/+hAdVHuK/PIpxnpFfVyg6rZRpnKdhpEudRWTl+1Krzt+Ha7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlvCgF6WlUIyXnMkvxDSg48/L/xMH3VqCINIK4dlIDk=;
 b=MMqoRDi84/UeUMtXaaw7728B38Nh7LAxyrQPxlEcSIQO2xG53LwpQOVln5ZJKUzaQDWQ4klSLuEMot6OHncP9DLwyo3mhy9WsksBWXDaHLOKlgWW7UYiHvEtG8tzVxO1HZRV6kKWUJq9aaHnqAl41dMCmUgCpoq9IvAjQvyLsieRp4p32tLxaS8BT3Ugqfg8s8hIfwUhQMVVYN4fQxT+k2zrSnz0z8f2n0+TyYxhf62yxsIxC1RzF2kslXFQhbzvd47zeNBn20RGdgbBqXP9jy/6rHkBGiGwZEpH91oCoieVib7KS+fWF6R46u6ip3G0AXXn8VYC4HI1xtVSftb4kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BL0PR11MB3396.namprd11.prod.outlook.com (2603:10b6:208:6d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Sun, 12 Jun
 2022 08:00:39 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8%5]) with mapi id 15.20.5332.019; Sun, 12 Jun 2022
 08:00:39 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH V2 4/9] skopeo: clean up depends and fix
 CGO settings
Date: Sun, 12 Jun 2022 01:00:04 -0700
Message-Id: <20220612080009.130993-4-Qi.Chen@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: da4d0710-2f78-4d80-9e24-08da4c49a3b0
X-MS-TrafficTypeDiagnostic: BL0PR11MB3396:EE_
X-Microsoft-Antispam-PRVS: 
	<BL0PR11MB33966D50316155262A4895DEEDA89@BL0PR11MB3396.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/xqhubohiP8q+ZoHEP2h8HCzyBttOA9hVl0itdRug3pYjj8MSscqYyBOEpWWK/ufSkMzVWm6cgqUUlHM04Na9TorgSr4m4u4yFep4tnJGOmLTW+HKFnYA0TA5GBXqmqT80aYNawJd1OtrLRHXMlqI/U6fddwZbORGmoQmXp/g6AoZCsFbEGUkriaNYe5VoNL6rSHiT5BK9psvZeMDuQ63YXy2KL/9cpr81BDJ9aztBxTUpqaxHF6b9pN0e4crPk7TVcOc/31QHdC9Q97fwGFpEkiuTpurZASMONUnYBFWznvEchgSHFwxG8E35OhLAT939e0/YciGC5eOdF5XvHTR6znJGCImKHTlLctlmI5UeV2T3xwEjnjPV6vqksCGEjk1s2ZDPNIAZZ5l/TOBf0zDiCCYnjOLM8bZWP8l6W4VkbMxXVpleO7wdKdWX3mpOs5ZwO7hoM2GMBwRp4EQCLrJV6bD8259HIBr9NBaotDeOXLxGx7YaeQIy6RKsp1AxaZf5yGhv/xKp74TcWNOevH6l4vU/EpiCtAGVTOu37XaK6q7ha70i/WCwSZVd/draU8z8m5r6TF+beuZytJNDecbvpmz6qxzySnFqHt5iuRJye7ZZxrY3447F3KbyONeAD2yp+k4TGen6I+6RILdlcGDru9gIfeSbcg28U8bH5X7yRKmjE7yTYR+v4Jj9lcstoV0QvrXfwzwtFjKShXHhFUIgMRRt9z4pdQTN0wiTIi3MMp/VZK5ODjCK6BzsXI2CTSNVFmEsYIlaSK1hECOVZPlavz9EJlY1Qd5Zs7UuqHZTI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(83380400001)(38100700002)(8676002)(2906002)(66476007)(66556008)(66946007)(8936002)(186003)(38350700002)(5660300002)(316002)(508600001)(86362001)(6486002)(6666004)(966005)(2616005)(6916009)(52116002)(6512007)(36756003)(6506007)(26005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5horZ9hkLVRDvwyl8jIQsWO1slFgos5kbMCk7tJ3eS7aF2JsqiSkd5AcmqkP?=
 =?us-ascii?Q?cI87smjpSJg8U9IJ/zktxfzdG8XlHYNTpRfqUCEwvQy235GJPu5LhjZ3DlJy?=
 =?us-ascii?Q?5doCmZ0j7c7ezpATgbs/XfZircYoktfxhXYQ6hYmng3Ophgup8BCejaUvhgr?=
 =?us-ascii?Q?P1SByPSzG3HseaJsr8hTIz6q5SYIQ6QNWxKKihSnjqJVSALWSE7qFL2rapcr?=
 =?us-ascii?Q?xEzruI4MpggadzTPdk3D2GDAT3BNp6nSCvDVo0VMr2OG6oec/edb85TZjchB?=
 =?us-ascii?Q?u2UB1mmAjlh16GWTq7YI2d+uB67OaNOrXQF9byoABKr5/54tHA8Qm9qvaE+e?=
 =?us-ascii?Q?3UChWYhOc1ewSCejkCQYYalLyFUOL8NJAzhXG1L1TzoXcE0IwgkGCltQIfpI?=
 =?us-ascii?Q?CyPSbcZAhZUewCKrOZbsoi210Attys9jIX+cnvVOqRvr4feYf+RKzhdUHFz9?=
 =?us-ascii?Q?8xV5969EPW7ScRtWoUMT34ZbyAXOKDy75Xy3BChwn1/rVA3ru1VFQLdaAYuV?=
 =?us-ascii?Q?naxYDWvX90bOW9aFv+dqNHYIK5LEPd9mIp0HHZu/kOLFugFlZyq1MGJzzZYD?=
 =?us-ascii?Q?LyrtDGJtmmSuJqYodK/q4KWiuCtsZ3h9fQytgWQ2+CbeolmnBCR7l6jYKFrq?=
 =?us-ascii?Q?OelWz1iIpbJvlm8fs1keGSgE0BYnMBgPzangwzFdkdQyfIEeAJhK+n6fI6VE?=
 =?us-ascii?Q?6VcA6j486rBaZfVbDbPt6IhyL/5Pgb9rpuDW/iuvnvP1ArIdrycNer1HddMt?=
 =?us-ascii?Q?aEyeSBABaFhC5nzbC07y5mSb89EYp1ZCkCe8OaUsLuzdfNeUOzJnZce1Bolk?=
 =?us-ascii?Q?Uh0mo6ZN2/nYCKLx/a4FBcTY/Rh6pmsNjGf1UMi4JcXCcL/aeRr8awE7Hw+x?=
 =?us-ascii?Q?SyZClHWuRdtC9MBov9ikYDsBapIFmhx4W+7Q6D79WMbZcg3G4K63t8EdtVsW?=
 =?us-ascii?Q?I0PCf77YBTE5XllogSQoCvIhVvz+Sb2O9XX5iUuRJtubjjnl1KuwAM55N59+?=
 =?us-ascii?Q?KdxWCqYgNI0Oa/eDXtIWNsafwI5pzN0DFSRHEgQZ/aFiTLaABbcX4gsMhrZX?=
 =?us-ascii?Q?EeJXjMOxFVRB0HqntM+cuYktNeopcANlcKkDwERlp+4XARyAXHki9Jq5n4cV?=
 =?us-ascii?Q?ZuNJDxzeeL224iQuZCEmkpXrzGZErqHvI8u8W5TKDnEfubQIdad1h8rPcyvl?=
 =?us-ascii?Q?eXtomOLw5Bh5qqizL7lwub0e7nPSgny1UhQq21AsJUFAVKOq6SN0mD9sHIjL?=
 =?us-ascii?Q?QHRSdHjcNaDYGD7wAXNhMXKLWTopU7bB/PhLM+ZI8eTAktWaPIxp60k6UhH6?=
 =?us-ascii?Q?C8TFUBrmL95ZVDCiwZZ5kJNp72wvoiM1chARA2tQ/vWl01sg7fsrnSKawTXP?=
 =?us-ascii?Q?Z7xmeusguFOEwwjoBazZZA2S215segUGiEJWF1Elo6O20gz6WPDyVCZp8/ax?=
 =?us-ascii?Q?B0NUfoDLjc6Mft2y8sFD60z7sgTUSMwR4/ogzRlU/e6naa2tCNtAJ5kC/pk1?=
 =?us-ascii?Q?RC2DHvoT/OZShOpXRBrR6bfGYraiwqrTjtqkDTsR/i2rMhUPSYSSH6vRF2l6?=
 =?us-ascii?Q?hXgyWXuraIC5s5uImwpzXcRv0dBHhTAuvrRzE/bdO6fetSfYc1X4sO2YN1EH?=
 =?us-ascii?Q?oVWvjL/frw+2SnNUdTAvh3iPDDLkoAgY6VbMugajozVo5va2TWM7+w8pkbWT?=
 =?us-ascii?Q?kMdrpwwrdIz7Nn49KmZszSPIyL90zIYGmrl46cmmyrzCpO1XzdFF33mxymzl?=
 =?us-ascii?Q?1M4KcHafwEM8O9n7Nl7bZE5zeF+hpBI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 da4d0710-2f78-4d80-9e24-08da4c49a3b0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2022 08:00:39.0805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BcpQqfnFSbOHye8iOfuu+ViDiwoJAh4brxKRIDa58oiPfqeWkO5CyT8LMyfEoRZWLfqnLbjcGu+XkKTsNeKMZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3396
X-Proofpoint-GUID: NC8eySELKmJpmHi_b-cZyLc27e0Pxrma
X-Proofpoint-ORIG-GUID: NC8eySELKmJpmHi_b-cZyLc27e0Pxrma
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-12_03,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 mlxlogscore=585 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206120038
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 12 Jun 2022 08:00:47 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7373

According to https://github.com/containers/skopeo/blob/main/install.md#building-from-source,
the ostree dependency is not needed.

Also, adjust the CGO_CFLAGS and CGO_LDFALGS to use target
flags instead of the SDK ones.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/skopeo/skopeo_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
index f3217db..35377a8 100644
--- a/recipes-containers/skopeo/skopeo_git.bb
+++ b/recipes-containers/skopeo/skopeo_git.bb
@@ -9,7 +9,6 @@ DEPENDS = " \
     lvm2 \
     btrfs-tools \
     glib-2.0 \
-    ostree \
 "
 
 inherit go
@@ -61,8 +60,8 @@ do_compile() {
 	export CGO_ENABLED="1"
 	export CFLAGS=""
 	export LDFLAGS=""
-	export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-	export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
+	export CGO_CFLAGS="${TARGET_CFLAGS}"
+	export CGO_LDFLAGS="${TARGET_LDFLAGS}"
 	cd ${S}/src/import
 
 	export GO111MODULE=off
-- 
2.36.0


