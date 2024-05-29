Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B252AC25B7C
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 09:31:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9635.1716975109577636186
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 May 2024 02:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6879a5a475=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T4U3oO012698
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 May 2024 09:31:47 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yb6y5m0bp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 May 2024 09:31:47 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YeEjtYcnFazHdNlUbyWHrrFgvsf2AtoQLzm/1XwkhOxCCj5tEAWrP1zj9VnmnDsBDsdJjf+of0URfdTqEnpS3TasNQEknbW5fNsP36ZIpxS50SmPz5QZg9CHr4+5mPODndlLNtRsPQ0qOAo0KGzSJCEsYykrcTYTHyhxfe5GVSUUdR34rbvdowZ+hkRB5fyiRfQPeRmEzKtQE/CfoJOiQ/cBakMNO2jQZhAS4FYbE+AGVtCyou9zSS+SSVJPYXBlWTlPWL0lQYGOCFp+1Y29w/AVFJV1QaEyR+ZiZuiGLgLcNxUxWvx65RSUYsKQkj6zKHjaEJO20p/IKN3qS8qtaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGntxAcEtM0AsO33KTGEJBtz/0pAYn7hPoY7vR6vyFU=;
 b=glnNIQxV8sN2eGDWk6CN28KkVjfatAYkuscy7fmB2TAWCOMZ02T7sj7q+JYvlxeZzUG6ir0XFzOIrVL3JM2hVAwm2zWgQwYDSSlexl3U7if2UM2md+ByV8/FRbSTPaAV09WMQMgMDzVWg5P8GVMlDr58jlrlex4RcEee1lp1157FIksYjalmfdmavj2PlEY6KP0qgrtciTi6ndeNCZQfll6nSRab4D81FFyS8yhDgL2MNuUSrxDeQWhGw0nV76ryKBxNJNvpXKRz1bWXsuLa7rwpUsiP/2EnTovR3FkwfcPTTiL8fiOo9ew4cFQg/NBv+VAo+a3RRF7ARe7e0r2Klw==
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
Subject: [meta-virtualization][PATCH 3/4] docker-moby: use GO_SRCURI_DESTSUFFIX
Date: Wed, 29 May 2024 02:31:29 -0700
Message-ID: <20240529093130.72277-3-Qi.Chen@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 95372042-375b-42f7-41e4-08dc7fc22693
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|366007|1800799015|52116005|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?viVv1+jhLjwL1KtYnc39H2YlaEU7KgP82hDByPBbx3ptG02RCM6BTHc0pRAQ?=
 =?us-ascii?Q?Dm4y6t1LtfcQbXNYGvZ84tmOwpRSKnykjxdUm8xFsLtwrt9/WIT++W9yEBJV?=
 =?us-ascii?Q?SgdrZVs8YxRCGVnZae9eywyAYlV+pWUDqklIg4Df8xSLYecDIu7TUNFRNYAX?=
 =?us-ascii?Q?5KxXdHngXolbWqZ9MuJ/CgY+f640ZXSoQOqUBvmN7Pc6TBfPb6WR25fLjU92?=
 =?us-ascii?Q?62vLzsK3Wp9ixO6Vu3KVmzsaT/OjQOjnKHdT6MC/XwmR4Xv7zrnP7DyWbxC6?=
 =?us-ascii?Q?LRAQU9SA72uhb5p2etl5RpZaHL6QaYswOWgINSHDWGwmBaqhZYiuYewW55BC?=
 =?us-ascii?Q?XmuQk9H7Rztu4hVx9AQNROzcKRBtSnKVDlV3Fm7q39CxDomxDg+zNCitwAAR?=
 =?us-ascii?Q?2OWEh1C42F6rO+3Wp8kLPLTvYOVtmBvdXb6DpmlaVg/FnpU10Xr9U3YPGg0T?=
 =?us-ascii?Q?ILzq3WC+A2tORyCbEWWHAhse/zk1Pv1hTLArFcALi50GU6twvhZj2cGq5hvG?=
 =?us-ascii?Q?cyfwijQjTfApckPERHc4xU28Ic9SCEDSfFtMiNTBlKYw2CBs1Z4yRfP/LrJk?=
 =?us-ascii?Q?7TpkDpP8gonuCj3iU//Y0Zun2ARDakUO05ir+d9jxxUDZf1q1yTShXXp7Xlf?=
 =?us-ascii?Q?bfpRWgR6ZHU0P38JXUEb+738nyR/SpYWzpFxX5ifZHgkNi8qc0lSsl3FvVWO?=
 =?us-ascii?Q?wyaH4tdjSVuUR4TdDLs2Kp0t/Xmv0bGSoopKWafFUYk74MVB2OUDwy0dFQ0s?=
 =?us-ascii?Q?NVZNJtIF172ickxh1P6QsWyJy4lhz/eLdyx+PPZz10mVUT7+e8hy+ebHXMgx?=
 =?us-ascii?Q?yJoixujzdqcl+YJui6fh/wvfaMQgmsD2wQaMeNhwPZV7ea93WFzyiSNanNqq?=
 =?us-ascii?Q?fH0D7dVNVDN2jVFbqQEcSLWQ1Zxg8wVbczB5pyVs+n1P3R9vJ8rn9Zvm1G0n?=
 =?us-ascii?Q?Gj6IQHbBTRocpnyCnX3CKljm/xxrJnCTl8rOmT0xHW2fCUE7wwLbtNf+uFPP?=
 =?us-ascii?Q?1FCRshIMHkYhE8Zs0NDqWo86oWTFf98XOeEYsJwg2L15e/8XmbCbF2lWyLPW?=
 =?us-ascii?Q?auPQ/cZBIKskTtp/cgtiwXPkoqVs8p1wugaA1y8IZF3kikj9Yz1Dymy4o91f?=
 =?us-ascii?Q?xmayuxHpegqx7CmOXlvbgg0Pom7jQSW5Z4/m1C/OGykJbqYgdNTwOcmICi2k?=
 =?us-ascii?Q?NhIXUzM0t2IytcG0hHBVAUTJ6Yheik2Tgvt1cBpgcx82HF6y9AgyvdmfLG0Y?=
 =?us-ascii?Q?d1o6VUISOL6pGY61awmgfWmtmVujAZ2mFuRNvAGQkj3QCrzRyXLyKFxTwOcZ?=
 =?us-ascii?Q?cY8sscWuszHvVSsmYDYrpWQYlZAV8EgrHYUsCYBmMsKfFQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?e46Zk38MFIqdiqhpxkJDhr2TLvkObIwIecFow22U+9tai2RvNJcT8YLVqLuP?=
 =?us-ascii?Q?ACJJFI4567wP3oZvHfiGFnSJwBJGOgO477T+wrvS64Cx9AQa1RkkTiPKP8Ju?=
 =?us-ascii?Q?bVxkjaWFTkailSxQsOj38dX6GkmKh5Ah85lbkAdS+6EqV3RKAaWbu3kctEkm?=
 =?us-ascii?Q?tWjVL28r9frowiqtC/rV6OQHw5HL6y5jSzga7fVAhKef5VLKo8EBHdzXRzVQ?=
 =?us-ascii?Q?Zir+zQgU0bpielcDgOx4XDqsw8rxKBdWZjapsLD6j2GKJREbI1i3H8LY1ZPG?=
 =?us-ascii?Q?JQDzv6heKq0Edl1n2V06AZXZlnP3pzotk3uLnFeJg5kmhskgx8HM1Lxcaw3N?=
 =?us-ascii?Q?IG+VWlv22XeGfw5oTO1CdADLU1YvD9zUaE4yINwvcrbQ9xNPYYJabkYrAqzr?=
 =?us-ascii?Q?dxwLRLDqJ2+1S5c6IzDBcdLWqV3OEMuNjqIoZYhfp9/p1G4fcnMq7Yqc3Sl0?=
 =?us-ascii?Q?2KrhUuBfaUEU3MDNglloJffteepw0Y5rMRyO9GbZGdtXG95ST6dx7fMPPg/R?=
 =?us-ascii?Q?C0UdflksbXPAv98InnIHjEDe9z72YY49O0DNep628CwNYiB10HX39wc8e2it?=
 =?us-ascii?Q?pzHMqgIDGkzKdJ4MJ16JpXv6YsorjaxS0DIEVkF0nhqobzBQFj3SXXDgINvm?=
 =?us-ascii?Q?+pNuhFwflDvV2WHDkHVPt585Tk+x6Xwh9Zln+a2aM9fKTSD8mYnm3pKtCHtp?=
 =?us-ascii?Q?pFrD6v/WMcZiXeVfj2TaaQtB6T/uzQO25EwxBPVz87e6FXnckQPdueAEbGHr?=
 =?us-ascii?Q?uXiu0xG1L9dxnAn6zDtpgJPo7Z6VC2Fl9m+lcovbOZb3PDQEYDGEGrixfFnK?=
 =?us-ascii?Q?Nj6S00qLgVtNqDQj8FBMUzq6o7XJn7bRSRZUxhsU6fTmC1uO4Gg5c5gLOsPv?=
 =?us-ascii?Q?uLut+PykzMfMm1PItGsLKQSa7uB9VBk+iTbRB17dOi4/TDfVDXo0scSirK6I?=
 =?us-ascii?Q?Ss/X1iuTOpthDOYcWryEBOxbIPwaDpZR8mZLx6Ys06QYwcSJxcoLt8w+1SkB?=
 =?us-ascii?Q?K5QNdfYmeM+HMF9vMM+g4USI5EQ6STM33RSI5UT4bibBqyYNd6L265c1aB8v?=
 =?us-ascii?Q?T/FlT8iYXLQmsIk/dHLIJop4yWHfRHJ/9MwCBA5QEM5+ULxfwoS7vZGhoTbn?=
 =?us-ascii?Q?Qf2xdRM/VOeDsEl3AHipo199qDxSEzWWIHq9BqO6dAbMgSBQFaJD0XUjpSEZ?=
 =?us-ascii?Q?dCsbGuWWfgML9OXy4/dXLVnZMRd8i/aA7oFaiE0clnhrvtG6Nz+lMWCK1N70?=
 =?us-ascii?Q?ksWpphnDQbGj7ZkPFZ16O0tMWIWrOteWhZkSNaGJUDvx5yZX3oc7ZJxvAHce?=
 =?us-ascii?Q?1qAOJzifpr24BQrH6k/N3MZRN7mXKrSBSv5XFcBKVGtZtwTTvZvMlZAxPejf?=
 =?us-ascii?Q?DHV6DjlWs2drRCe6hdTEEsjzuFgjIIFDO6he0seD6dtSyBFYMoX7ws54rPhW?=
 =?us-ascii?Q?HpeYIoeu5QO5VutNmtFeeeWaa4VO8eLLuZSBrpXX4KXqRNmYZmKCvk7wKRNo?=
 =?us-ascii?Q?DAiH7XDed1VCD6vcJp+nV2BsgJkPbHhXKPe/Y0Je60KG2vimFNNPjoxJjOY4?=
 =?us-ascii?Q?t77Lq2V5HpAOpIuCFyKvJ/Ot1Gf21d8ySW98xkKDdc2udHE/Yx+YcWI6EB0I?=
 =?us-ascii?Q?kA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95372042-375b-42f7-41e4-08dc7fc22693
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 09:31:42.9228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tPwPM/HtnCkcUp67V6c9UDrv/6Fics8Arqt50DY/FGcpyS1AuoWksFBu4jKr6/FgxanEUcMu8ixY/7FWkJiPCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7424
X-Proofpoint-ORIG-GUID: krPpVWFTqdthGBM02LvteqO4evIQMTwH
X-Proofpoint-GUID: krPpVWFTqdthGBM02LvteqO4evIQMTwH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_14,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=719 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2405290063
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 29 May 2024 09:31:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8776

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/docker/docker-moby_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index 0abb0b3f..41a6823d 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -49,7 +49,7 @@ SRCREV_libnetwork = "67e0588f1ddfaf2faf4c8cae8b7ea2876434d91c"
 SRCREV_cli = "01f933261885c0126edb3f47fd56d048ae31265a"
 SRCREV_FORMAT = "moby_libnetwork"
 SRC_URI = "\
-	git://github.com/moby/moby.git;branch=25.0;name=moby;protocol=https \
+	git://github.com/moby/moby.git;branch=25.0;name=moby;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
 	git://github.com/docker/libnetwork.git;branch=master;name=libnetwork;destsuffix=git/libnetwork;protocol=https \
 	git://github.com/docker/cli;branch=25.0;name=cli;destsuffix=git/cli;protocol=https \
 	file://docker.init \
-- 
2.45.1


