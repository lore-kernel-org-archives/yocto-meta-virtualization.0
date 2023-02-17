Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C412EC05027
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 09:20:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3073.1676625634027790495
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Feb 2023 01:20:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hkcPJqiF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=14120bd938=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31H7H0jA004145
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 09:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=J0LCTWf/csAIEjkKDVwBCrnWuTE5gTPcPnxqpkf3hgQ=;
 b=hkcPJqiFmltAc8IIPTUhUHmlidguRzsT249bj9nK7vKxryYHoduu5mNKD3SPXhR/n726
 btUw7e3tYEPJbP5Rlt3eS/MZMP4Dp9QwwL1j7cUXPMLeBH/4I6eYYFLsmCbLlWwkQ/1c
 3D3tkhUQKNcZlWIcXQe3764MgC+9sL4qulI8FfUlmxF44HaKM0QKCgPCf4d0IEtyF7wN
 IonNF0iltijW9wnlAMmHGnLe6RQfF51L4qa+cN9RpNQcCqL0bp2D7ZgkzVZW3r89+G/4
 v+B9VkEzHm5tG5Z36vtOx8D7zufOpYUIXBt5s97Fz39XEkzc9gohwNtGmYLC+eejzZCV Dw== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nsbx41aqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 09:20:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kRhPUd/7NlmmrSQmyxrvS6A7R0qDER9I9OFODxwdqSnhglpoJlRTvsUkrnajdn1IJy1WmubOr6vM1yKdmdEVF9V7m+YBIanfOP5bbZqsnyypQgDm2H8h5rGZ8clWhVPEA+sVusYFNv8jiejPs+Uyf8o9nc3Obi287xZTS0dlIi/x+0hPQCXz09o980h1lsHD+US3tXAIaQryj1J0eRTxPhbDBsgr9Oy/GC05VJNJiXZSmlGuYUcM8VbxeQYcCBWbezP+CVYS6y9enOSqawoy3Us+hurj1PDYyuLkUjY2FzcjKf0RjMdsCcJgyvoyYPo3szvoiCje0PywAKGnKS3dIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0LCTWf/csAIEjkKDVwBCrnWuTE5gTPcPnxqpkf3hgQ=;
 b=ON6na/NanqoHFxWvLZxX/7mK4FhGtWtWbcy/UYrr90EZP7NzU/Kq9HN8uSqoJ8A3p35rIz+QtPq8HbCus7GB5TvJqWmnj96dk12rWvq2pn+T6hfIF10tYuYlCcxggXsoLFYXnM49QwmgQ/1UICTBgFW9Zi2cRd9aYkBeaxiBQzqDbiJnE3RmNDF72pi4u8CSS+nNL7+eT0EzLE/9FNYTEVb2iMEygbfLMO1mhxNJ8wW+7tdbsiwlD7r3hUNiPLSHI4VjjesRAHDacjsvUWFao4pPHaQOEyWX/0caJs4B+6VhD0BymysuMN62dBq+YpdGif0FItXHmgYKvoGDfQAOxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO1PR11MB4851.namprd11.prod.outlook.com (2603:10b6:303:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.15; Fri, 17 Feb
 2023 09:20:27 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3%6]) with mapi id 15.20.6111.017; Fri, 17 Feb 2023
 09:20:27 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 1/2] cri-o: install policy.json to avoid image pulling error
Date: Fri, 17 Feb 2023 01:20:13 -0800
Message-Id: <20230217092014.3810-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0087.namprd03.prod.outlook.com
 (2603:10b6:a03:331::32) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CO1PR11MB4851:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c095d9d-a5e6-4e3d-03b0-08db10c834cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WmzR2R1hJICg8NjJ15kiG4pB5V0SwuoQNEGrv7VrBVZ/yY2Ex2DMToxVlRk5tXucwaM2gDXimfY7PxuYZiwWZo4f3jZECx+atpFOoopuX62CoYuORRZrMGwDJZodpw5be5UZMyeW35V1aimTfWsBcPm25PsuVgtbcNu6dMtfAqy37fP+KN4UaQ0G1Cc5Pq3qhx2XYadzx5mRARAe2SWal0GiQL9kArSoj+L3aqLYAYU5EJqtTEzugcdM/DzByjUUrnjrTV9MoQvRUpPGxXYO8xmxW6Do2LTw89tZccO52ViDLwAqvyyXe1765z4IBsxT5lj36NopcvIUJO760v8lw11ONdjTctsJop+GcwWyRDI6FUGS/bbjcH5LJYvTxRo1wt9gJqH3gpAx8zUAiRQhzY/ACj1IWvmszyHvV7mIY3Lhkjl1pgfFM2S9r9eqUvVEluRwRKVd3IoeTtyX0zbxZXdZO6lvHmKdmCOBc8i8wHsFFSBAZE4GU3RGyHGM+kVHoEZIlS4U2uNPkoXCl3AWcsuONOlJ3u+Dz0y4pMunY7BQ2IfXQbyhZS3F0qsKVb2KKccDHI67rSI6ylCP8hfODD7yRyaiR2QHmKDixHqURQZFIDEtkabLbVf8XLZlzR+lYMPrTlXi5XOpgSvB6xENviexFJwrt1POlQJ5M82BBzUQKr/3S1JcjUSU/ci7TblQ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(376002)(39850400004)(396003)(366004)(451199018)(86362001)(38350700002)(38100700002)(36756003)(4744005)(5660300002)(8676002)(2906002)(66476007)(6916009)(66946007)(66556008)(8936002)(41300700001)(26005)(186003)(2616005)(6512007)(316002)(6506007)(1076003)(6666004)(52116002)(478600001)(6486002)(84970400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jTgt33tQmYNEmkn3HzvO/DeD3MS/mj7xb1fXQ8tY/6/B/6Za4ssFDi5JYp39?=
 =?us-ascii?Q?iOH0gSOblWaE6chHxKAilw0ziqq1GMzihQcIZaMIT5MM5mxsV8s/4rwBKj74?=
 =?us-ascii?Q?ul70stBE5INF6B/7+mxAlvWhM7VYMWjj9adgxgaSbfaDuWB0PEu9o1Bw+3f6?=
 =?us-ascii?Q?1dI75IpZIcTXvXWDBIyzbeE4pLApjM/Bo9R4TA3LvIMp+cJfzsnnVloOGMKx?=
 =?us-ascii?Q?x1N6pKUx8SHRrfRfjPEJUUtyloiHC7wQ4nuFxYg0qVKYXeW4l3X1lt1nRWgW?=
 =?us-ascii?Q?HR4dCSVykwROveAMVR5R70gbCExNDNPpELn2mWNKlRp9Ds1QsN0u7rcUeOR8?=
 =?us-ascii?Q?RCug1skARxoWxoRQpWheYYOgbJYH9SLx52BmgC6VNtLBe2Mga20VqS8drg6E?=
 =?us-ascii?Q?ToT1UuYXX2c85EtPhPCE8wxzxsilYIpWAbH3YG+L2KNVMh77LITxIlwagDoB?=
 =?us-ascii?Q?iSrHNAmFiVWbvSJ2Qa5NahDAi9KBCPCWu8wi8YgkC4gDz2jF9eanijEewVg2?=
 =?us-ascii?Q?esYsAL78o4aldPq7GkB/ppTtgI1BvltUR8ly1FwMah7mr09Jz93LcjtSo/l3?=
 =?us-ascii?Q?CPQCRnjN/uBjk1qDD6I6d+4WxWctOeQWufyEPKxketBpfEHIcqI/arhT7jjc?=
 =?us-ascii?Q?92w6tfYIIYfVT8qF4/xZU5prRLiQJLMzH9Ojsc32ncxpy0pnZiha2+7O7fXM?=
 =?us-ascii?Q?0cNXiL1z/yKXv0n61BGvQTGMCYM63ipMC6WUSBVzEdotGg9gtDt2PaECv2o6?=
 =?us-ascii?Q?Z9ypsc1zkLbYe6uQiUBNmsvnibogdB9TJQyCIGhzaOs576kJEZViKtw5d3Oy?=
 =?us-ascii?Q?lOtveECbRkBnMW2l6Qi7kRxhlSGJ7WwS7F3TUmdMKAmQDSunfKw9fN6HWW+k?=
 =?us-ascii?Q?9PzBCqbZTeAImAzqkc6CE6KJxAOE3BS1AH58pBz0IQ3H4kwRoceP3/XcuLml?=
 =?us-ascii?Q?FauierN56mH/GMfMgggdeEgC5NKcO0nRB2FJ3cq1zljyXkBNv6U/08s4KvzW?=
 =?us-ascii?Q?14hafSiCN+xM5Vhuu9jkqc2YifGRLyIOmQ3qyLZsGyMUkmzLJGgoGAhd5gU8?=
 =?us-ascii?Q?xJOrahQppFlb8bFlLUeU2+aca2DtgLhgph5b2+6s1ZoOAmtySMuyAgV9s7O0?=
 =?us-ascii?Q?BYJwjDa5oj4N95moeGwZA7RFf8FV40F2rWYsiKcB9eZyq4RfuAC2qyhh4kre?=
 =?us-ascii?Q?Im9N2tGDkkHfJVqRZKvlKJNjUfpWVKx8aWuZDA5HmkN+cNspbpC0MPuAhvtU?=
 =?us-ascii?Q?TZoHYFDPrA1IAGRVyKDcCtM7wf5iqZoMYUSXS8GXvaflC+YQx+94VlykPPnh?=
 =?us-ascii?Q?ohOGaLlHf0S4aiQEd4D91eF4F+SsUN2kyTuqQSFO29G4r5JU8rA04wFRvQRa?=
 =?us-ascii?Q?Cd+5beziD3cY2W7LA+A4Bq0pyLJTpg6QG3gxdxsiBI/mIbV4Q7yxOkF9F92P?=
 =?us-ascii?Q?VWbyIh5modUJgULQiwOeHklEzp2Zkmz2qTTZOqsWMtztiISrIaBM+14fhCvf?=
 =?us-ascii?Q?8SmFi1reHZzqqqLDxK6dxqVUpsjB1b+k49g1tDrPDfbTQ+GtoP+s+d7Ev4D4?=
 =?us-ascii?Q?Afj89tFlHcV+Yg1KWFprgn5DXfEvUHIkE/YlLltE7LKTFqohpNyh+XbslFmC?=
 =?us-ascii?Q?pw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c095d9d-a5e6-4e3d-03b0-08db10c834cc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 09:20:27.1641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CbAPQIzJvWmnS0jDU6mMuEqkeI6LDZ/3rLX3sS+0tndl/G2z3h45BqxNMyPjqdTuHaEcdhG5Zi3t9KULoehX7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4851
X-Proofpoint-ORIG-GUID: tme_jbL-_UaTXShdOPKl0-xiFnwpr1Oc
X-Proofpoint-GUID: tme_jbL-_UaTXShdOPKl0-xiFnwpr1Oc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_04,2023-02-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=860
 impostorscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302170082
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 09:20:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7864

We met the following error when using cri-o with k8s.

  [ERROR ImagePull]: failed to pull image registry.k8s.io/etcd:3.5.6-0:
  rpc error: code = Unknown desc = open /etc/containers/policy.json: no such file or directory"

Install policy.json to /etc/containers/ to fix such error.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/cri-o/cri-o_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index 315659d..f69dc0f 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -98,6 +98,8 @@ do_install() {
     install -m 0644 ${S}/src/import/contrib/systemd/crio-wipe.service  ${D}${systemd_unitdir}/system/
 
     install -d ${D}${localstatedir}/lib/crio
+    install -d ${D}${sysconfdir}/containers
+    install -m 0644 ${S}/src/import/contrib/policy.json ${D}${sysconfdir}/containers
 }
 
 FILES:${PN}-config = "${sysconfdir}/crio/config/*"
-- 
2.37.1


