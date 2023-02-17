Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C0DC05027
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 14:25:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7490.1676643897828521215
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Feb 2023 06:24:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=oiMboBD3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=14120bd938=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31HDO3mb005123
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 06:24:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=YUurlsDnmZe4MtIjsQzAQTSuEcsy6XvMtY3ld2p2w1w=;
 b=oiMboBD38F5/5y2RBle8UAwK+g5r32HkKAkGx4sbiIzWLkREWbAx9M11KMo0UV+SYJYd
 eQvu/tzQ1o16eT0Xc6qWUWd8U9+E+FakFEEMy+KILV3uURFoGbDtPVFjxtZPPHH6WIfm
 ZdNCqaKdPHI6WtrdRfL7ake6g64q9EMgyRrSdebOQwzk/EtbsSSJ1hvX0PwVywrwwgmW
 8VWe3bY2O8qoRCg/flKZCs3kcUfgVqSEAcE2P9FmHpHZChEt3T82mOa/vccEy58H40BJ
 96yfyjp7hA1sNnGU07A+LlSBVnZhQoI/rybAJ5DJJ5JshITGfP4AlBaPnqjSFaLBXbgt eQ== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nsc111hkd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 06:24:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdG0NmPDmiXd/U+2KlQIm6TeniGO8Ek4g73Rg1EiUxPOtWIAv41fS0+Q2FLvvBlqxpwFuN0HWa0/QDFEOYWN2POLSstxV7Ro4H8mwxaTYIzhJ9TOSnnZxl+IvtX5k3fqA9fCfeVtrb208B0PitPyaKPC1L/PWoB80UHK1pyjPD9k7seHYbnrmwcULZOAdbCbRtfubSJkPjV5VNA8vLvmeplLmpUuo9M9mCPvwGiooe9dizzouIBlDYe3vYJw6FxCy/bdRqMVvZbsJf56/nuXVZngVUFIw+Rz+/3akveNNHKZFCVj3MBzrax/uxCecgSUz0e4x1K3LUDwwUAZSABQcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUurlsDnmZe4MtIjsQzAQTSuEcsy6XvMtY3ld2p2w1w=;
 b=J0oHzjB3qUXMEW2ZKZshjZWFt+an0bo5h9ZV4AFut3u+yINWRKZMUVjiSc95UsdlKE2lh7heHUwWO5KkXwjLl7Uhxksb0HKoHU1V4A+tv3ozApVrymRlLjziR01F2eZTuDMk/rFiz9gtLoGbFAnOx0LptT4O6cEWymPPKAzfdX3u8ubmiGZJ1MoaO2brK/APPucgGpJgDgWyekGh4WOEyJGrWQ/z7XR4C99HuIL2vPFwho3ImrkYhU6UH4zkIJFNAZ6AvEh4nKkXy8qj/ikFgzwZgbFstbbAm3i3+bVRfAYqSZjKDWCQo/geaAT6QIoCqfFeoyWt+3nHuIov2ujHWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB8010.namprd11.prod.outlook.com (2603:10b6:510:249::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.15; Fri, 17 Feb
 2023 14:24:55 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3%6]) with mapi id 15.20.6111.017; Fri, 17 Feb 2023
 14:24:55 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH V2] README: remove some cri-o specific layer dependencies
Date: Fri, 17 Feb 2023 06:24:26 -0800
Message-Id: <20230217142426.93531-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:a03:217::23) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB8010:EE_
X-MS-Office365-Filtering-Correlation-Id: 981ab950-103a-4a56-8d3b-08db10f2bdb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Pk3nNUNwKOHGVeGb/1S7JGPmAArBL1ETvH/mvThrUv31wHrBuIpBEhc7pWgVwXhxtp483tpOvP2ZJjKd1H4pyidWCgY/mznE08s7K4cgFu0gl5R7BJEp/XhcR1hLXm6cYw55mYxugnsueXhRY8hILpfoReK0pfLJIZS3gBUnEVZqAYS0AKEt0WkMl/nQp5JekflbY80KUFdwK4qHJ3kPLZ0ZcunaMhCqWxJFNoAdDXiVQ+mbSsMYQco9ct8lcrveIAI084yrqOvsyG8GG8gUCv/VsGSS4Q/EsMTzTdsTae02u3g+6rSHM4SQ218SngXv/jZyP4VXYhh9svAKrz2GpmZ8CocXYoD/aUmx3ALEj9Bnz0KSkUcAy4lYoASnXuYdMneaYR59xkrZkSvDjdnJHQuQayWElDhghtC95aZQJtSY9xxqstm7GoM92Api0o5IfjBkSFPdbfQSt7LB/RVkMeNETbBPAOtKX8gqaW4Sof+rYda752NIHnHJg0ymYCxi9dfFZ8eSkkQ3T+bDJylRDcY1tm4nV0NREFI0fLrI2vmM1uGiANoiQZLuVRDvUEJLOpZQtUWVSR+3icONpGYLW8B0P0RWpvpaxJEmjhwDa/6Pohwhj5oUvpP+GuErSBqmMTFM1lRNvBx5mMGxGm/3bLXldTxoCfaiWhENCJkpUqXhaLEzR4s6YU6adHMS4w28bER848nrCSMSuXbt1Rq8sw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(346002)(136003)(366004)(39850400004)(451199018)(38350700002)(38100700002)(36756003)(316002)(6486002)(478600001)(52116002)(83380400001)(6666004)(2616005)(6512007)(186003)(1076003)(6506007)(2906002)(4744005)(5660300002)(26005)(8936002)(41300700001)(6916009)(66946007)(8676002)(86362001)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6T3ZNyi897jLTd8niavBm7UQfMKKo5fGX+JWVB3ytZ/4OtUH6VNcvFGuRazx?=
 =?us-ascii?Q?bXGzw+zcvxJJZFQRegc+JrDuVmSPlFUllyedWlrZmjmp9Yx3k6vpMsd9c03h?=
 =?us-ascii?Q?FSATNOzuNkei5YY4t25wt63YAsfVnF4AFXXWVadb9hrAF5fLX513qc1ivLo3?=
 =?us-ascii?Q?DXviSLNsgZ12TK8tLYinBMMh1Rggn5rImUlFoEvt3rJ9hcB+Ijuvl3xvpjaf?=
 =?us-ascii?Q?1wRnwzJvi1DAgxUTAXuq9MU5HUAhZZY0F8mP9r0FQ4XaIaUkCLFzj6QESG3P?=
 =?us-ascii?Q?0ZvQUOV1dMpAHNCd366qWUMHfyfgCloBAYkFksMFyE7BTUBO1vZKtnN22pqr?=
 =?us-ascii?Q?vx4xzVyRJvA8XWfStz1e/enAPlv5iF5r20VuDbslVehF/93GqVaQID9UUbHK?=
 =?us-ascii?Q?TvuidcQfEb7iUKeq7QlznyVFpnlae0G2ktnrXGA/giKB/OIv+PU8MDpgEowL?=
 =?us-ascii?Q?b8/WYK1ybVnfiFS8QGx1Csh5JVLPpJfZ1+KFcH/WR6rwvJtyHURpW5i3np+T?=
 =?us-ascii?Q?b1Nh25qsXs3a0k6oK+wfJ0r4zB62YJyxWN6PLNzEu25gOK3Xb159XiyQe9CE?=
 =?us-ascii?Q?NV1G0Rr+oRUmq7sjDGz1yOZTGcLoOsKXnFS7rAU3gsNm7AN/vOpfwPfUNpdL?=
 =?us-ascii?Q?2qsZHgdcWTMYNLwnN+Uqpr/cMOv5gVtvFjXv6mQNnkV7XrwH8cu9v7BKJfeh?=
 =?us-ascii?Q?o+F3fSrNRF3JkQH/OcNI0EZ2WqpeBJtLMs1OAbLrEdm3oaHWlLCvyR8FQVbd?=
 =?us-ascii?Q?ZOBhes3VquPqvvCyp267fUj3KorwCa53Yf9cCBshqe49uA+PJ/KpX4rwkM4T?=
 =?us-ascii?Q?ZdI7JGjA/Yb7wyZfjo2mvlgtbmLimVUmDKU30M7PBr3LGP8kksxT0Xfj6ioq?=
 =?us-ascii?Q?ODirV2M1wlriS+/zlo4wLwio4Lm6wbsY9lU5DZdErORxHxcQVN4Anu99C/vp?=
 =?us-ascii?Q?B4ypGLx7z+OdYXljaX1VkeDiOUP+6wvgZ5rB+pZ60ct2qH4T8MQBp+OaG7Ob?=
 =?us-ascii?Q?FldT8hzwTnrwwzE/NPi3fGWw4kiR+KEbfpPSNpOM71PlpgZtJMcO1KVbQKAZ?=
 =?us-ascii?Q?8eF+2aNIqm8Vkfyu535M+y5ugaTkwzgk5QWOJq12a/aGnc+QICm4wZhPLxs5?=
 =?us-ascii?Q?E5JlTglTz9dNHKN9nzin8GGtHyKukBg2dqq6OINUAj1zxcb8nuVuZwQE3LsW?=
 =?us-ascii?Q?6/CXVckIxqe39f1B8SuNLB2/NygQP5Z5tw3QLziM57lnrMQc450AXpctDgjy?=
 =?us-ascii?Q?odYa+ofgYQ/E+yw3FXiFDGqrWluYmVRC5zZ67leZci94DTeud4z91wIKRlZ0?=
 =?us-ascii?Q?/xQ6461gEIHi70doBbGnpebm9ZVOf4YLuPo9A6jHET9vLrOQAA0FRRH58tTN?=
 =?us-ascii?Q?K0gQMG/Adb0sAl/wUU7CpoJB+0o/z0BtellokZq4CuB22fai7rgRveETKhmO?=
 =?us-ascii?Q?aA0PmrK7HbA9hTJEjaPlDW2qDhKah1U2et7cIYgnuaKwU7pPd4fTGLJH4r1a?=
 =?us-ascii?Q?+jwHMbeOM353AxlXd0851pLmYyeHFyGrAPZVFoO0fN1MNR+U1slw83Rj1zns?=
 =?us-ascii?Q?H1VjLDZGMlkozV3nmJ0tCgjCvmzHpf/aI9VtuwbfJ5XF4PvHNx0s0Ihe9h5f?=
 =?us-ascii?Q?hg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 981ab950-103a-4a56-8d3b-08db10f2bdb9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 14:24:55.5959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q63ZMjrYqir0QmDGLMWshyIDcklsBJUuECFqvjL5Xa0W+fCJn9qCZWez2ucOauTy7kO+XU2cTOJOaj7QnjrqDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8010
X-Proofpoint-ORIG-GUID: AN0owWyMlrF32nJzTtS99p_GiXk9ol_i
X-Proofpoint-GUID: AN0owWyMlrF32nJzTtS99p_GiXk9ol_i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_09,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 phishscore=0 adultscore=0
 mlxlogscore=653 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302170130
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 14:25:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7873

ostree is in meta-oe, libseccomp is in oe-core. So remove these two.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 README | 2 --
 1 file changed, 2 deletions(-)

diff --git a/README b/README
index 1c75f4a..7a848bb 100644
--- a/README
+++ b/README
@@ -68,9 +68,7 @@ revision: HEAD
 prio: default
 
 Required for cri-o:
-URI: git://github.com/advancedtelematic/meta-updater 
 URI: git://git.yoctoproject.org/meta-selinux
-URI: git://git.yoctoproject.org/meta-security
 branch: master
 revision: HEAD
 prio: default
-- 
2.37.1


