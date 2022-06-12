Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 796B6C43334
	for <webhook@archiver.kernel.org>; Sun, 12 Jun 2022 08:00:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.14122.1655020845266530687
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jun 2022 01:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=lSw+hNF3;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=31623a79e8=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25C80eTq006753
	for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jun 2022 08:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=dmejhesBwMGkBLQVKTvijqGUVNTg8nfzM7I34IjmmoA=;
 b=lSw+hNF3nG3soPNct6Ez5FPhXX5XfStpgUUFJijKkM6P4w6YaxOBnogJVOea6DGh9fOx
 od2zstqswy+g2K5jlvPypSEnpdEOx2AFaeyhgoF2bpaCm50R4nwEoLByn02l0va3nAFJ
 tZ0wX7gHc7eSBtICgXBMUa6APKjv1wzZ9Z7v5hCaV67/mWwKMw+dFpJHJg6pxAarFtQW
 7uU3G6RrbnFb5aaHmpb5nV3N9ojlZYCTjpJnEr+GRQmzmj72NVqMXlaXe+e/Rvs9lSuw
 2mvfVwbXX9mEeWhMsXxEKXCxmLQQa4Zv6nAHrd+aB7DQP+Nla2KcgckeaFlD+ez/OT1Q cA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmj198pw7-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jun 2022 08:00:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fixrpYQs4VgBFfBNhuWkM+y+sT62F0V4tqhoB3ReHOviLn14XDL++2gGDGHSgLbFMCHxH6jDux9DiLMTrUfKy0U99OZJBOHxqqnU+HoQhjOTnVDftXFrZqXCOvSW8o/g3wwgjkzDMQo/yj1/S6CyNzAugLb1X8mYAlVCA6C0qg2MKZB+z5oKlYR8kfPWbNbU8ROR1Kg59EIOVwQpPMI5dn38/e0/VM4d94fpfzC9xmLNjOW7CKkN3K6gxNX8qAq9R+NYt4WsxwMA6/uF5Kuj+il2sfuuw3gEeM9PJK0dVpzawMJOiPSkZta2Tt+PGIsFuVliTbrgGkFwEyXw2P9ASg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmejhesBwMGkBLQVKTvijqGUVNTg8nfzM7I34IjmmoA=;
 b=W5wpFGxHUyQQmsEEo0TNkt0z9BTRrhjbUs5KHBCWtcgc3ACLwOg+pgpfKoyUzAKRwVx4yH7pi/RsfgXANi3zaaJqFWml+buROCzF4orE3d+/Roq3LCZASWKeJOuZhwXJRpD7xsgFoRMWkd+pniZDTJBPDuJKfVh08QV4+9pkqmvNnS4kza3M66T/U7XqYdH+/vya1PmHtHsfucAnvx6OkMTRfvm2lPa3fHoe/WfO/ECo60DTJNkQ/h58vckwXDr6km7v9orgpaxvwTNC67W7TcYBEoNGkAAJ2yLgETjHeI2pLHf6+nZJZpZdh3GVr768CiCfObiIaIXuNNK09a16uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BL0PR11MB3396.namprd11.prod.outlook.com (2603:10b6:208:6d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Sun, 12 Jun
 2022 08:00:42 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8%5]) with mapi id 15.20.5332.019; Sun, 12 Jun 2022
 08:00:42 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH V2 8/9] oci-image-tools: adjust GOROOT,
 CGO_CFLAGS and CGO_LDFALGS
Date: Sun, 12 Jun 2022 01:00:08 -0700
Message-Id: <20220612080009.130993-8-Qi.Chen@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 879e6903-7fb5-424f-7178-08da4c49a4f2
X-MS-TrafficTypeDiagnostic: BL0PR11MB3396:EE_
X-Microsoft-Antispam-PRVS: 
	<BL0PR11MB3396C30CC49BE66DAC8C2464EDA89@BL0PR11MB3396.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uMM3KBaEGeqqxspgJI7CnfCFSo4aZZf4sDQVXdhw6DhRYRYuh4oAF2me1fdQxo3B6z/TEkOqqSSXqjOKUcRjfCExtn3QxS/WPp7adwD0ISrepQ5yNtyz9njdeEtV68w1TQz1sam77kFj7zEBlUvbitT4EXlVPlYQSogIDI7t8RvkCtV7peYlqcwvoZz7qOPHbTkp/ALq73q6sZ58JOP0Khxxv3oEelsxweD5lj9BHMxG0iQo7va1s1sl+UGbes0eTnCYefGO6OumAQkfZq52rqrC94L7J1z6idFk5xpV1u1pXtIzbkDG1MbMbFumSY20IGjYAGj9RgxnloqplGoUdq541EIt/TiG11RNnSf6I/AsMNU0bNNcpkubPP+7XJKwcXit5PdN7N766oeg7eUAVLlMl46XiodIwNVR7a9jAnYUmVGOelu/3uqGAI/5XBCgL5IAWrKMPBJzgIlqi/DgucaFrQp7DGzSk78n52hYOi/y13M2IyP25ZIGPkORLkddZKUxaVsf5P+jpxJH9so2V1B80HszpgAuj2QOvtj76EFDB8ZFMdYF/TEoKRYPw0sCp5saBeTrdQ4072ZdISc0itU9rhYP1qXcUZuIyrxI9dTSiQjzrZC953ZHkHFX5l0Pn9E0HJLHwiJ9hKfC2q790T0EtSUqk2PX+IupJtzPMA3Swi5qaiwCvHW7AV/C7gR2r8OhReGGhlnA8myuJ/9KWw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(83380400001)(38100700002)(8676002)(2906002)(66476007)(66556008)(66946007)(8936002)(186003)(38350700002)(5660300002)(316002)(508600001)(86362001)(6486002)(6666004)(2616005)(6916009)(52116002)(6512007)(36756003)(6506007)(26005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/ZnNdoKgSosbU2JG5Hk78s1YsAQkYBvI8ZV7hTjZCQ/XX2qPP5lJdLMFogR7?=
 =?us-ascii?Q?t9qKFjD0ANV5ej0JyIOCuItCEwNjc09QgFP92ZfaMA/5U22Lq30wOP4x6zFw?=
 =?us-ascii?Q?bRn/dymyFeuWU1pN5ARzR5yQ8zbYtQ0Vh4ojdp64nbx7Tx+/55HutahkNYMq?=
 =?us-ascii?Q?rjyB9Dgm/SPUKdvf5BC8H5xkUNsdyCshw7/rWGG3FIHhxqIdyYboI+QotO4t?=
 =?us-ascii?Q?IbEN4CTHXDkU3yBaYVeYKVRZi5GqwOvWoeyuMzv/b6+iOpLDsxraOnEcqkAa?=
 =?us-ascii?Q?Hkyp0scKRsn/UxjhKhGov78vBLitJdH0CxsRrvzKDbAxwNintFgbedyLyNCb?=
 =?us-ascii?Q?JnT7h/VON20e4BzGYDXCx8nKnRXLMzjQVPJvBfIme4nqqxrjFv3SalZqieAK?=
 =?us-ascii?Q?7LArIT0YR+SlZUEYUzktsk4Id7/mvXjnpeJNF+4R89vbagNRXFAHSKYqSPXm?=
 =?us-ascii?Q?vCemPyrgFiiXnse/1x9E8UdIfVGBo2o0+uvFuUbH3oExBSAP++mKH/rcmxhi?=
 =?us-ascii?Q?5BtxRGQAqALVmiG0GS6iNS++xk5WOSYiGdo4qNeLlyhEEpZb0W1FyGfAJXM4?=
 =?us-ascii?Q?WbisClXDzYVud8pyQTvlpXA+D7rQPjrsLyDVKa3EA8Ze4Dj+MhbyzqvjzFks?=
 =?us-ascii?Q?MQ7XEoZ/UE2TZQXkMqIH+xQk2UCFFN7St2wNziuaVSPmJ2Nzc4XoKT+6fmce?=
 =?us-ascii?Q?63Zq4kS7HTXdYtqbhR/gef8FH74db0weRZFhb85wjUZT1y8JompkZg2KG5E0?=
 =?us-ascii?Q?Yahr43URR3jp3qS0l+yGToZqxisLc/+uMJhttA0o2qdrX0qQnSFYPHVllZIP?=
 =?us-ascii?Q?1X54NqpSubzlVCr2KyxRUqDOilQ2SQk20ySQ22p16r+2nh0Bhuy4rTcUOP5h?=
 =?us-ascii?Q?aOqEXE4VYcLWOlDKuKLqCUnumEdW+mlk95YcqDgbu+e+BvYq2Yi81ncDqsd1?=
 =?us-ascii?Q?2vdEYLISNXaCPhU4wSfLZ9RVoovyoDm/Exm8rxkQS+lBFRyM3GsTtxGd8LBW?=
 =?us-ascii?Q?lFtFQC1aG03bNO0KnagcmD5f3imacGosKAIOyyWo6PHWlNj0kTZ3zrFoCbTn?=
 =?us-ascii?Q?AJEZs71kCN/1rmuSBAO/9SPIDm4Qo6ypbKiKE5lXVkEKhcrFQfeqMlXakonX?=
 =?us-ascii?Q?H7STFqYZpQ5MOj6Fc7Icb7TIIbZmlW/M08lVNahhGEkXaP97d9KnpZtB30mA?=
 =?us-ascii?Q?mgEWGrOYUcCTdD/soz2eAEBeLmgXxnKrnSyVR598g/tcKIqjG9fCnWVKAZnW?=
 =?us-ascii?Q?wk726Dipgm7m6z37cBDTE8dCzChhDisl/NAxhk3dfY6sRnaKypTycfikjSg7?=
 =?us-ascii?Q?JJBZ64lXGdwtaBTGir4Q2B8k4BtK2WIAxrbMmHLcHQq5d5ijjCJjvNmMdYjk?=
 =?us-ascii?Q?I697N6g7OoXji7LaYTMDwjTCzqWELEUAArKesg8v9Rlp5VZAg1qi6ONW9RqV?=
 =?us-ascii?Q?vwWI8OcLPMtgUlrtZnE8o6PfoaPe6GaCH87mjn1iknu4C6V+xqxtBKWjwCBl?=
 =?us-ascii?Q?z6vCSGdk3vHdMqp0RKosniXcZ30mgulvl0Ub8FhgdcJMpaLuX5T+rlZD9e+a?=
 =?us-ascii?Q?cB/ilqmuSIJItfd1pJPXlThysFIjOvpVrg+KLhwxoUIIEEXHjrrwSdatNEGC?=
 =?us-ascii?Q?TkPulOJ9uJ0RvSfmjqGsNe9myTwGRbRQlEcL9L6f2ZD1J7LYCd3fBr4x04+y?=
 =?us-ascii?Q?O/ffsuGol5IyH/4QVVV1A96qxwB3W5r/2C3/OnlTeGYt7itZAgPOCDr8A776?=
 =?us-ascii?Q?88RNFdwuIQvnf/Ak3rqLCB3PGf+xG0Q=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 879e6903-7fb5-424f-7178-08da4c49a4f2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2022 08:00:41.3315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 yec3CAzeYDNT8PVLn9p/tCqkN1geA+SuhBiE4BF1db3vkDItG/vdQ+re7jR+jy71anZqavjgyZYIti/p82hrAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3396
X-Proofpoint-GUID: xWZNV9_vnvIWDxUnaXycYFhgW2fU1vfB
X-Proofpoint-ORIG-GUID: xWZNV9_vnvIWDxUnaXycYFhgW2fU1vfB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-12_03,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 mlxlogscore=629 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206120038
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 12 Jun 2022 08:00:47 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7377

Adjust the GOROOT setting as directory specified by the original
one does not exist.

The CGO_CFLAGS and CGO_LDFLAGS should use target flags instead
of the nativesdk ones.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/oci-image-tools/oci-image-tools_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/oci-image-tools/oci-image-tools_git.bb b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
index 8bafd2a..90e671c 100644
--- a/recipes-containers/oci-image-tools/oci-image-tools_git.bb
+++ b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
@@ -29,7 +29,7 @@ EXTRA_OEMAKE="BUILDTAGS=''"
 
 do_compile() {
 	export GOARCH="${TARGET_GOARCH}"
-	export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
+	export GOROOT="${STAGING_LIBDIR}/go"
 	# Setup vendor directory so that it can be used in GOPATH.
 	#
 	# Go looks in a src directory under any directory in GOPATH but riddler
@@ -48,8 +48,8 @@ do_compile() {
 	export CGO_ENABLED="1"
 	export CFLAGS=""
 	export LDFLAGS=""
-	export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-	export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
+	export CGO_CFLAGS="${TARGET_CFLAGS}"
+	export CGO_LDFLAGS="${TARGET_LDFLAGS}"
 	export GO111MODULE=off
 
 	cd ${S}/src/import
-- 
2.36.0


