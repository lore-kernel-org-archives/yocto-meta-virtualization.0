Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA99C433EF
	for <webhook@archiver.kernel.org>; Sun, 12 Jun 2022 08:00:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.13684.1655020842033324866
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jun 2022 01:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=LvGMHk5e;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=31623a79e8=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25C80eTj006753
	for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jun 2022 08:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=da214DBI4dqV5pCLp48WJ71iQC4Kk19KGjTCAEN+cRU=;
 b=LvGMHk5emIqkmzyGl0l4bvLBoIBZe2d9nlSpZoWwpCARjCkeUfmmRKChjsIZ9V4MIJla
 I6ZDzPdkMtHKEEB9q0HKp1lFpJFBE/jYP/uxEPc8uy9967Zmp4py2YzvzPw4cmuLVMvs
 ZItzfnxnYkzIlJuQv2YRQOOYyeOCO0MonU5TgdNAFz0/8HhX4U1qEozyRrBFjxFFsxvU
 MQf3fmO5zjhcSGJ7xOS4I1Xe1oGWriU1S839Cw0EVYlBwgVxIC5MwmJ8pWXgyS/egbI7
 /L+Rerz2bo0YfFQ4ueRRHzLCWXWsmPi/afoIO9RJt3HYrwOUCLC0rjXmZ9xpQtWEgKy0 Cw==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmj198pw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jun 2022 08:00:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+WRrP7WhGA8W/qxx9S2QPsvFGJ4PeFzHXNMv7Xs/JQbGwxex5bx9gRfS1o/P+JyWRrXyfb1tz5PE7rhLUVfnNShP5l2GWibuDkTPZoAEjLWq3ywIGMpLwMWOmB6hXBZLBeRdQ7Fk7mx2raDI0r59JTmzEbgR0KljJ95loZeTEvFxgcnTve/ZEGWq6PAZw/alErSdFPOAcPDDX8FUVGlAZiFo0ZARhhXfwFKCEoMtkozGuORkM+QI7RaHCXpOo5wkS3FIBslF+AraXKpu+8rtdmCbbQ2cYizddNTuHpHGDuQjW2dNJokzQuoR2ljo+KR+XEmCEYwDBG+hvwLup3VjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=da214DBI4dqV5pCLp48WJ71iQC4Kk19KGjTCAEN+cRU=;
 b=XoPjLFYwvmcJVmk6raDW0M45VS15n2y7B6FVo2PQIZZOKqYtSiF4dPHdB5ajKUCQGWgJwyVaQ2uHQNvOTBUHRMFlUI0ozvbNR6KeQnG1AUsI1XeI6YjeH2+s6tPQsI3N6NdmGK1BQa2a4I5WItHNFug690HVDeRlTZbTRb6/85cOvr1z5XK/ZMeoU67JAre5+FM24uBGWF7/sI8jtpyOrzwbwxJP/NmeXXs6hImiYzEWMCAAz5FwpvifeT04OMRZv2Krd1OmY6SMtyOG90AVXtmj0+8AK+uszRRE8oRYpkJhpM9mFZyN6d0Iagd40U/3cUpl3EeTKLWdYjAF6qYJvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BL0PR11MB3396.namprd11.prod.outlook.com (2603:10b6:208:6d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Sun, 12 Jun
 2022 08:00:37 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8%5]) with mapi id 15.20.5332.019; Sun, 12 Jun 2022
 08:00:37 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH V2 1/9] docker-distribution: fix the
 inehrit and systemd settings
Date: Sun, 12 Jun 2022 01:00:01 -0700
Message-Id: <20220612080009.130993-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.36.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0169.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::24) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aba53c6e-c1fe-49b7-6221-08da4c49a2b1
X-MS-TrafficTypeDiagnostic: BL0PR11MB3396:EE_
X-Microsoft-Antispam-PRVS: 
	<BL0PR11MB3396FBDF0415A06529A902EEEDA89@BL0PR11MB3396.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rjApkGnF+TdnEGHZIgWYm1jKjNppRteV//itjOMN15I590Cih5QSRBwyBPkktlejFkOP+xalDIqZJbVfnQA71WNWuV9duewANbeEKD6MB+RIeCu4YjEaKKDEY/5M9buYI2IX3diebphSPUiu98xJDe/r1NfkFW3R1Efx40dPjJxv/i8TNPDhk1vYHg3wKDN0Ou8dcH0tVYeLVS7aqv2rH4Ckq5MPspmWPfWtxP/5ycim+yzHkxWoJSbnH3CY8LYbyGiKBSaNTauAOSYOCLcTKCt5kiJvGXzCzkBYSsG3FL1XTsGM5hXAghJTLvS2qOFxxdjVFaDYed+Evr6bbWD9jp2Gp29KnkdrWUbg5PPbRTiwq6CRwyzMxcx9NJxKZkWO0/uTs6GgfPUivEYPgmIN0F8TUyllf6avQJ+VQ3xzoBuDfmk1o9ug9Ye8O0+9Ehnu35lVDM6Gt9yE3NY/aIqKK2VCsDmSSqrS+Zr/wk79+fki59e203PHAYW0fS3Xn/lwwoK34eGc7//ZC3VpbAYCbRMHhoyQ6DTcAHuAaifeG+v28XaIMXm3nMcyljQhfTKR05vaCAP+1ydPCLMJ4T6VcBKe/2mUmR2Zena5w/uzKSKAxsvutjga2MGLArb51xaLtqB359tvGrQBdo+w9lYZlaHQLCaQ9QWtpYg1YMjCe4j1G3sWrvmal2vLi+BRB5r1mQwiCnKIpyAfM38B63dNVw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(83380400001)(38100700002)(8676002)(2906002)(66476007)(66556008)(66946007)(8936002)(186003)(38350700002)(5660300002)(316002)(508600001)(86362001)(6486002)(6666004)(2616005)(6916009)(52116002)(6512007)(36756003)(6506007)(26005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XY1Z3btuyb/RuDdYFRLGtCwaP7AohhYD50eg7iq5GdUH2H1ceMhXHz5wTu38?=
 =?us-ascii?Q?JVEZ9eQFvigpNx5mnuLnJTuhLnpc3PaYqJ3ZqG6erSXLt91GqGtwh/zWxkUI?=
 =?us-ascii?Q?H6kCHNfB3INV4UrqcYPCE6TMTUGJpYizvRndo8tWBk8pzipxx2ZoiQ8zZp2I?=
 =?us-ascii?Q?p6IcVzPduj28hMAw/gi8OPr2BzssHEdQqbuppkv0FBdNnXGsOQ086NDRe2Ja?=
 =?us-ascii?Q?0/s93+nGPD2al3Cb+gWMBCechTN41QMlF5oaeDzTsUEh+ZQ6tBvPjhzrBzSc?=
 =?us-ascii?Q?Ct8FYZ0A9SyMzxpY7jnF48h2RvDXOpOfgihPDzPsbUQWkEuGuhpKibTZBf8y?=
 =?us-ascii?Q?vMZZ4FUsE9PqT/0o2I8YZ/DkZ62EcDAEmb7xK4Jc/x/XK1YNOZMo5L52063H?=
 =?us-ascii?Q?QfkUD+A5+FrKYaM3SmFERWhnHLtl4KbOnuBY78+nMuHHUX+s4dhufXNwv4rM?=
 =?us-ascii?Q?EqRhe7A+vP65z2Nepi+Wj+JjinW2Qc3nLFnyQPQQpLZ99uxPoHr8bmhMwBZ1?=
 =?us-ascii?Q?wCD2ovV1eIr5XyZJh+jYQBVK2Exe9G+BSdtj28tQp9d/Af7esMztC1IjZikW?=
 =?us-ascii?Q?UN1RvRBlgj+bF8Jik9sFY1JwdSkSE0M11hU+nU2TG8s1SFUfuU6WRtEJPJOi?=
 =?us-ascii?Q?wjf0/y1WA5u3huA3dn0ETKuo0nAPgcFgrxfEIn7FCm2Djzcopcp17/CBsGUM?=
 =?us-ascii?Q?xuBQaYesbSywcaZpcZWbQkquGzjklHLIpF1om0hBMRnKGbeKxYTWJhvOHoAJ?=
 =?us-ascii?Q?76epUzhZxeAcAgo8G0TNa8VOxMAfLjex7KmdKP8UADset5xtX2TYeyKKle90?=
 =?us-ascii?Q?9wvrTPeXPHb0FGDop9JKabOhlvA/Z1/zUFu9uCQ0E5/SSh7ekLkQV16sOqlA?=
 =?us-ascii?Q?2fjIyz1XsXdysnMaxNXQywcAFYvKsjfHKjNwHRZgu7UPgOUqxZ/U1AZqrOxn?=
 =?us-ascii?Q?X3LgKzMSCscFZRyRHxDR6Iyiq/5JOiePVVeT2spPBW8oz5zKAS9WA7loxf+2?=
 =?us-ascii?Q?5Ms25vy11waYsF+2Us0iI/OfmybMDx3LYSLFyNcnWILOlUJtWCnD76Vuay1W?=
 =?us-ascii?Q?qL9bmwBD2x+pu6kMrAbMe0CQqwm0xC8E9e0VVITTBubTw8bhSUzLH/UC/uYD?=
 =?us-ascii?Q?IwpWRl2DE5VXUiOUNp4y+L5lfBQfMC2Pwi11/BjB8s2rCCAoRYHgfrbLyIK7?=
 =?us-ascii?Q?3Kkt0iEQ3YGnS8H+40BwLG3kq2lajIX8ZqdlSqxWKrfC6LGHNAPv3BO9AGjx?=
 =?us-ascii?Q?k17Lc9tq9mMohUV27XVIoTMXvufbI17HdcbV1f5ytCuU+efLqZlPSy0RNeft?=
 =?us-ascii?Q?cbgXNKp4KyYn3HpLny/GZeOtCXkD7bIEXGOJxacruYxYFOvvLyfHgKbanpLI?=
 =?us-ascii?Q?6YBIrYCjnj5ZhiMvl7fHcGcN0Xt+pPBebVHDlB+q8r5jV0az+rmYlCt9MYaw?=
 =?us-ascii?Q?nCSrHrcGvxlimFrfHyWx1SmR07gkGv08IFNOWJ0WTLQx9Rf3EFwjTsjPNFtK?=
 =?us-ascii?Q?ImNYeA/uzPKaPmBhovGCYxchBKV0OWfOSPPfKTyK3sJ/TAuxqRc9gv6f3R0N?=
 =?us-ascii?Q?1K7iRyd8W1JuLoCSAsQo3TVfYB8HaANlcX6hFcmf+CbM9IslPpNRqMmhejNv?=
 =?us-ascii?Q?pjTsQFnIa5DLQ4jeRjnIzKmRbZli6aiaQoKObr4QKpUKKb3el0bFEMCUrkAB?=
 =?us-ascii?Q?7mApVIrbXaZ3KoYFvNFWMqf8kd981epINtki7pb/Brt6DMrzWT63ZKKQ7mE3?=
 =?us-ascii?Q?0Vrp8IqxsiaBrhFXUHO5X9bOYVjIt3k=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 aba53c6e-c1fe-49b7-6221-08da4c49a2b1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2022 08:00:37.5027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 F+d/RSUVDB3UB8YI+EKKlShjjMFziogbE4+Qbf6BDEZ4pLeTwUG26VbOoKleOMiHxj8v32t0kYFLjfHPPq+W/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3396
X-Proofpoint-GUID: b3EjVkQBKHDW_ge1LakAffjnXARWi9MM
X-Proofpoint-ORIG-GUID: b3EjVkQBKHDW_ge1LakAffjnXARWi9MM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-12_03,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 mlxlogscore=781 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206120038
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 12 Jun 2022 08:00:47 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7370

In order for systemd variables such as SYSTEMD_AUTO_ENABLE to have
effect, we need to inherit the systemd class. We also need to specify
the package which contains the service.

As go.bbclass already inherits goarch.bbclass, we only need to inehrit
go.bbclass.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../docker-distribution/docker-distribution_git.bb            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index 0dbdc49..395694a 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -16,8 +16,7 @@ S = "${WORKDIR}/git/src/github.com/docker/distribution"
 
 GO_IMPORT = "import"
 
-inherit goarch
-inherit go
+inherit goarch go systemd
 
 # This disables seccomp and apparmor, which are on by default in the
 # go package. 
@@ -66,6 +65,7 @@ FILES:docker-registry += "${systemd_unitdir}/system/docker-registry.service"
 FILES:docker-registry += "${sysconfdir}/docker-distribution/*"
 FILES:docker-registry += "${localstatedir}/lib/registry/"
 
+SYSTEMD_PACKAGES = "docker-registry"
 SYSTEMD_SERVICE:docker-registry = "${@bb.utils.contains('DISTRO_FEATURES','systemd','docker-registry.service','',d)}"
 SYSTEMD_AUTO_ENABLE:docker-registry = "enable"
 
-- 
2.36.0


