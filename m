Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68857C433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 09:03:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.24695.1654851789549450095
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 02:03:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qpFW+C47;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=31600aeb41=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25A8k9KN016450
	for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 02:03:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=hlFpCTnkqOUMiQCLYnNv27DfA7HVG+RI97QYu1erGx0=;
 b=qpFW+C477GkTCpyUs4+MPcZpBv4cQXSe681pEdp+6d3ZaH4z8LCh71oMm9AqsFyVHWf7
 lNU9lVEpFbEFsi+TtBwB2R6K+vlVrRHR2YaRW3Gva7jhjAXUTQOaW9c4U5WvtBo7f//V
 j2Pc5ibr78MjcmsO6bX39+tDWW8bQLpbpCT3FC2yGFKLJOCR5TmjlRqHLK/TurnbduWC
 1RSbeylX3EoRwxVvF7LuCrEOk3xvDCjOCLa0bbhAMtsxHE4G8Ys5n/WYZVq3lGxxJeji
 QjNUvJvRP7DjPWFyyT9rXO2GJ5CJ6lncKyUEzm5T0b81yWiYllOwFmjy8GeZH25wVj5m Hw==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gkuwar7mc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 02:03:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTbgGfvRfeZlKZa1kfs9+3cVS/KFf62NwMGeNmuqONPDaRLqVZJCJ8PxeOo2REeGBZMA4aybChcizlynv+bBlvo8O9pGjXo4tQE0pV52vhVVKnC5Bv4q5waFL3xbZV/WEdqGwZ8cv2PUZM1x0NLBF3s2/ltz4Cv2LWrwZqR2t591NgJdYhXeM+mk64GJKZkMXW4dhvBJ4Hece1Jz37cY4D9uZAKqNhWRdx4cx9nYxHRrEBBEZMTv3H7khoUIA2U/jmNsV1n3hAOkHfXb5VK1lbKiRibqOOH1jBLw+lIa+gz35vqGevznESXzNYByiz6ikDjhJtNCQ6ccCsVH7xMwig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlFpCTnkqOUMiQCLYnNv27DfA7HVG+RI97QYu1erGx0=;
 b=e+fdpmrvi6fKscwEUVWK3HRWpTUBtPtGOBrheHdhu43zaGTEgvABWwh12+lxydPZJKWScejUkgKuVOCAZtMScWjg3tZLhiuwqfrnKyVfG9nnUcBhdwj5AHlT8KPcJaMqS///BL2GbXovG8d0HYvDnQlWzETHGjqfqoRqePMyOWkgfHtH1pPVUIr6oU8J/QMeRMB334KFvEJ1IgmZxQR7IsE9JIdSmH01xYOyjIG01IG8dEAuG6Qmkvjb0kWQRBqd24mZn4iuL/gnoAnSy987IOtCAyCHrMYEpozIkQdpJSotCZO5mZtIuaAn27HxyKsbWxRMzOwYkOhR6Wljy0oYTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW3PR11MB4649.namprd11.prod.outlook.com (2603:10b6:303:5b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Fri, 10 Jun
 2022 09:03:05 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8%5]) with mapi id 15.20.5332.015; Fri, 10 Jun 2022
 09:03:05 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] skopeo: clean up depends and fix CGO
 settings
Date: Fri, 10 Jun 2022 02:02:53 -0700
Message-Id: <20220610090253.81323-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.36.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0357.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::32) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f677ecb-5f5b-4536-1b29-08da4ac007cb
X-MS-TrafficTypeDiagnostic: MW3PR11MB4649:EE_
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4649979FC98094C7446B8B90EDA69@MW3PR11MB4649.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kJ5dtV41kerg37wvl0z+xcWLF8m3cVgHeT3wFsl2mF4O1FiObJUR1ic3ZwvyFcGk/KNPJuh+wgBU8WJ9z+V73EF0AtTVpdhVIrYBwzamL/rVgfh3UGTMPn30bpFwmm7R/W+q7ZRe17Jx9X14wnOIuFIBuf2KrcQIAd3Xor+QiBVklnWEohBCbB4+W7moF52Wtc/uB2H6rjz5skYme2lOjVfOS6Zu8tl/BjmaI8yBFxaRfqmAu3m+Xyg6u8a5MwZiWhDPz/D9uGHgaGcAoWQHSkcgeptizc2BX/P9d/i6HEkWLvDrpT4yddfqMUJATHmMbvj0TJZ3EmstB22wSPeIETPooK/OsnRhUHTW/WJua4F8tkSr2RtEQiH8a9Uc5MLCOMCTWz6Wo/bauZv1RZLlAaye2mOF6ufBjJNmfLyStQqJdTPTUa8MbKDw7Adsknz3jYIZwr2TonRJXG91gFTTFV5om2x3SyA957VoepTDEsJn9LSBADXv36vVHwPsz4CHsTqbJ3NuQ9EwbYSV4PGqWlVPeXXxR3fOARe9xEaaPip9bofuzdQ1XvjUkguXJgvcj+fLyx6z+WiYolfXxd/XQWdOf77aVNQnzBwT9SKuT9U0lpmIJoOEwFHsDiCDyepFTj+4wSqEdNLXLC6y4LyDXI3GSjyaf0kL0MKKuPPvoDu3Nlf9nQToj6ipaxdeJKX0nxXukq4liV65C6x23+on1OuhT3qmhRmmuCn1Aq1p3bUVQwmbyMGfBXK1iOMANadBuzkoxB1pNIZwm1BLcwD3NPnGHeTnLHCbutrMg1QFa9H+2jQePiMIoK99mb1b9Wwl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(5660300002)(38350700002)(8936002)(36756003)(2906002)(66946007)(6916009)(86362001)(66556008)(66476007)(8676002)(2616005)(6486002)(1076003)(6506007)(83380400001)(6512007)(26005)(508600001)(316002)(6666004)(966005)(52116002)(186003)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?X+TMdu4N9FCpnOhsc7Txp2/yJIyQkGNbqf0Vu4/tKpT8uuIazlSZNBWTRi8x?=
 =?us-ascii?Q?sqgGG10xlux3RekFhVEfsc/KCQqETtLPwgA/9XQnfleTaoFLW+LcYq+xSQ/f?=
 =?us-ascii?Q?C8rvfzxVRRIVfyMY/gUqmIoVUPDbCbVLpsq1cs9+q7WwE9Cnv0uaYRFow44k?=
 =?us-ascii?Q?zHh5cm2dEBXi9msWNPsPrHQW/JDrzS8xPR4hC2jhpQD8XGwNL0409xue6tD3?=
 =?us-ascii?Q?UHhg6KdnpYTrQGbVzMqJUkDm7BpP5tjK1GOyOKCDbOOBj/uXC9cNTNp0oCne?=
 =?us-ascii?Q?92trsEZgkWTWnEjGK8Uw0T7hbZJGK1E072BsCf8q5ILCS4XtbIKtN74g40Jx?=
 =?us-ascii?Q?8oa1vJppO+JuTWAkNXneDNx9zlMbaURFJyI7o4G32pwGAbKp35zQxyexjOd4?=
 =?us-ascii?Q?evrFvhl45ZAzoGI5zyc43wqcZPS3BGelIe58VKpy9vints2LYts0dRlliQQz?=
 =?us-ascii?Q?Awjalh1xGcPuf4VzyKGdeX77YozCdtnVGtAhzZ/6k+Bo3PmU4S2fZ54CIUOQ?=
 =?us-ascii?Q?OSfval7u5nn4ns1UQFyNtUUQfvs3V0qp1xHur+LcOtTyBA+OAi51z0oefCfh?=
 =?us-ascii?Q?TwJoG+SPk6Dp6m8bGPSXN9gb3j/uknLJiNktn1gm8ydvj0H/aZI5kuYY2oDD?=
 =?us-ascii?Q?6h+yO7N4Chhvl+HBkglSIUlMaV6YnSvRfVc1zAl5Ab041L6yIuTj6v/Gw269?=
 =?us-ascii?Q?YoMsDu9ukxe8ZhcmikrNdfucIpptQKlpC7Y+5EmuOAqSTHcal4GLsej1Ahxq?=
 =?us-ascii?Q?CqeTsEBRIhAuORAWhV+dA8E2RDv77atZYGY7R1RzIPe7kq0kfENk7ujQDpIH?=
 =?us-ascii?Q?m5AhGPz3iOWzS/G/lyTUfExvwf68rOZOEUYwjMmuv3mp6cQH81KhZ/qRDwZ0?=
 =?us-ascii?Q?tz8S6rkskZNeLOl2ZEnWaPE5UfwryEfnODK3RtRhQI8y/pCsQ8aZPVA71xe3?=
 =?us-ascii?Q?OTNtefv1b5aUvyOJt6YqVwjpofD7rcqdQONm0pwrYrJ2gPWJZ8A0F+78TfJ8?=
 =?us-ascii?Q?qdhw49XCT4XQDxDqe6BVMzH1r3n5UcPNm77po08uFkJsc2d24gW4z0ezOB3Z?=
 =?us-ascii?Q?QQbRrivXqu7ObVuQjxnKQJ60WBDB7EeYdq4Eb07B2NCp4mxMzp2Zb2/59tP5?=
 =?us-ascii?Q?OyWWQ7+VbcSihBEg9ko49x2DddHju1wWmEe9pG0LYR3KI8VTjHPhqbG4eXZx?=
 =?us-ascii?Q?aVF+5CS5jKQ3TTVMfleko0y6ABFxLUWO5d/ykzgBqMPEQy0Xdiz0ye55zFlf?=
 =?us-ascii?Q?WAJ490LPQ6HNjcb+L8QdzTkQ9qoI4+pxCcceVqf/yAzNrGQwSgRAxt6NRCSI?=
 =?us-ascii?Q?Q7BAjm9BXOtNOp+kuwklg5Q2sFcODKQVxj72FUw61xfyx+R5aYocY8sDCwnT?=
 =?us-ascii?Q?OpgVQNtp/nei8PNuayoWXP6bmNtirlTPKk1Zgrsw3etMJkfANRxnXpxXCuE8?=
 =?us-ascii?Q?SyXZICDAVdW0WKQ7nYFecTr7uCdTwQy/8BN6wRU6je1jjxorH6NvigS2Wu5b?=
 =?us-ascii?Q?Ko/sh1EPpQEYEhfpSsI32QX1mXVS0EuF8XCelBMRY4+GaBUqlnUFq3XGmaDp?=
 =?us-ascii?Q?TUScgO6BsGL/Csjltep3kEX/thmvLStalQxPHbXWcoAF9Q2BXb0Y/4/AF05H?=
 =?us-ascii?Q?kdsmjcF1m+W0tDmW2sNbHQxofC41PlDn+IepRraKUKjsHb821nyqIrPVSAvb?=
 =?us-ascii?Q?EquyUZn3JgOpuJ9alnNwV37DCTCHh/8y3HyqpI8t0PUrhwlts6yWoT73s+3X?=
 =?us-ascii?Q?01MXI6kK+FQJvrtMD8k6Eveeaj32p3I=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6f677ecb-5f5b-4536-1b29-08da4ac007cb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 09:03:05.5023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gSPrKgjg63k0dS7VTM/bHvrlvPbKwZA+czmr8dxv9FdZx8LVGfCKjzAVQxTzciOqebOiyNGX7+Q8YqWsRgnb3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4649
X-Proofpoint-ORIG-GUID: xQoeDvYCJ7tzpu5ptlX62YSDCaAY83zJ
X-Proofpoint-GUID: xQoeDvYCJ7tzpu5ptlX62YSDCaAY83zJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 mlxlogscore=590 clxscore=1015 impostorscore=0
 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100033
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Jun 2022 09:03:18 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7358

According to https://github.com/containers/skopeo/blob/main/install.md#building-from-source,
the ostree dependency is not needed.

Also, remove the CGO settings which incorrectly use BUILDSDK_XXX.
The CGO_CFLAGS and CGO_LDFALGS should use target flags instead of
SDK ones. As the CGO_XXX vars have already been set in go.bbclass,
there's no need to set them here.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/skopeo/skopeo_git.bb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
index f3217dbf..24d951ef 100644
--- a/recipes-containers/skopeo/skopeo_git.bb
+++ b/recipes-containers/skopeo/skopeo_git.bb
@@ -9,10 +9,9 @@ DEPENDS = " \
     lvm2 \
     btrfs-tools \
     glib-2.0 \
-    ostree \
 "
 
-inherit go
+inherit go pkgconfig
 
 RDEPENDS:${PN} = " \
      gpgme \
@@ -33,8 +32,6 @@ GO_IMPORT = "import"
 
 S = "${WORKDIR}/git"
 
-inherit goarch
-inherit pkgconfig
 
 # This disables seccomp and apparmor, which are on by default in the
 # go package. 
@@ -61,8 +58,6 @@ do_compile() {
 	export CGO_ENABLED="1"
 	export CFLAGS=""
 	export LDFLAGS=""
-	export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-	export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 	cd ${S}/src/import
 
 	export GO111MODULE=off
-- 
2.36.0


