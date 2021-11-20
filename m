Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.3801.1637381827892103297
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 20:17:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=RAfR82cn;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=69583b91e3=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AK4H7fD016699
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 19 Nov 2021 20:17:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=Spg/ByIsjaVMnKb/ij0RllrrZrwAuuFNTeqDsTppq+Q=;
 b=RAfR82cnujFqdb3J4PSWGq73NNpcOMbF+j0ESOIPUGzQO2sIrpGzjFClXuFeztKKH848
 FARB0R3VYga7mZ96x28Jv+EBtxYw4usXCd91wLJ3MM9XqFwvzdf+PDwpVFZCcu5qUCHL
 pyVKZC/jYmdLtOdbW9lLDIAxpkeTpj96FXuqtqSXUcr/rvmmaAtXasraOJ36VWfL9d4/
 rt42538MhGRN+8ExHAisj8OZj8Hh8+pbtJyFg/48amvcPdcuCT70zjV/z3mrFsRWcAi5
 GRRADjD8/dJBpE3SlPGrSjk8ewwugAnnO85DRMXCUFpLwSdZJw2De1YyuheemcrVcoiw ow== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ce02h940h-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 19 Nov 2021 20:17:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chfTnv0aailVCaBk24fnssaW/7NPAr1TlnnzffPBEksKqJaXAygs0B//HqsUVQDXyr7PhzNA/gdT4HeFeVebrhApFd2vMsl2ZdV/mAht67AOIhCQ1+ZRunHbK9+tYYmrs3LwvVSf9wk7UA+N0CJZACpX6E0Bx5XJeuPuo9JWEmeYiGVU8tHzodqleVWg2XIkPvvQPqnK5otmc9h4FzGqr16d9IEeQW+ZXcRY50Rpsnt8KeFuXjQ0L7+Cw8KGYDZia48RY8u2U3rpWRf8S4i5Cvqnxgbxl9xYUSwhoUGomn6tTX6BSmyTXxoYUfzdmPWz5N7stMQoT0Hjo9eHRqOxeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Spg/ByIsjaVMnKb/ij0RllrrZrwAuuFNTeqDsTppq+Q=;
 b=NKXy1XdZelbxktf62DMAYtfIgPkgZhIj37FXMHuidUq7YF2+b+0466LSRHxuyDRvkSPID6mTHo3VsswQgaQ0U566I+UoRhGZT61rlsJc7WwJI0/03t+yHdtNrJyGl78Zcgk7b+cq5eOb38B3+FQ85uW0si/25EqeHOGkpKiJvuLAS5c9wTEKVIDGhrR9v89fUfN1nVVM0x24H3Qe2fw9ibQv990s7FLWr2oEkKVnLMt1frT+a54p7rfezq2CenD7UI44zfLBl4l5EnQFj25eKW4E8QGiu2+IFVOcCmCOXNNo0wTbeZzMv75eazwtZ0LLrdFZKU8tDU56NO2V+Ebf3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4785.namprd11.prod.outlook.com (2603:10b6:303:6f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Sat, 20 Nov
 2021 04:17:06 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480%9]) with mapi id 15.20.4713.022; Sat, 20 Nov 2021
 04:17:06 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-cloud-services][PATCH 3/3] meta-openstack/README: fix for operator append combined with +=
Date: Sat, 20 Nov 2021 12:16:52 +0800
Message-Id: <20211120041652.583066-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211120041652.583066-1-yi.zhao@windriver.com>
References: <20211120041652.583066-1-yi.zhao@windriver.com>
X-ClientProxiedBy: HK2PR02CA0155.apcprd02.prod.outlook.com
 (2603:1096:201:1f::15) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR02CA0155.apcprd02.prod.outlook.com (2603:1096:201:1f::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend Transport; Sat, 20 Nov 2021 04:17:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 245ffa5b-14df-48a4-68b2-08d9abdc9d0d
X-MS-TrafficTypeDiagnostic: CO1PR11MB4785:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB47850ADCB595225A8EFC5F5FF99D9@CO1PR11MB4785.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ul08O/ovZLN3Jv3RU2cPTlr1VIpra23sBc028H3nxP2fB3gc0Ln5l+103togNzVo81igieuDzpTZf5Zqigfgt6+Kb+XlyrdgPcj+WAkd1JqzMOS04aN49XiWMYL94I0M/RGtMfk55qwHAob6gUYqXTMKzhx/A+QBijKlWY+ILLUqJzoyNC+FIYatBvuefvzp8ks/Sdj57/JzU1F3D9OL1LTAfg4wFrlF1N+hShGKAKZodaNxDlRjpbTwS/MxqUAXi8ZoQYXkhhBwx7uxzqTqfp3pr86LFWaCDoOqdJmdpXn4xv2B7F9p/erc3+1CRsLibSwVhwL9w7kEEhJ/3wbljiWWiiazteod9obGN1UaG/lQNGVbRVcaE4m2hjK7X4hVEl+16Ity2lJZ6ecLAwRDQMOmUVswi3Wes30lQVYeghV8zT3Ctq8kYh17poXTPiQKLSsCkGrWtfCqSqOVyiuXfos57JSUQzfyC3YHkid4pgURBj+8n9uqliSCJi7JcDsmi6qu2j55U+eZgvvh2gHgujYVMlmLUEmviT2iCf9FcUJXDNtCU9ilQ43gfKEHZ+Qpc5JrTfLDgapwO3MN9w+Dh3nnREsDrpJvSG74wX0DvMuRvdghjqwgSnFK4W33JL69wCHqNDUxo8AR3o85HjsdaP3wyAC9TbLtpRGMCODfC0iPPQ6NEbiUIA2JMiKz1zIQNm6dSUoNvF5tw7G2qEzRVA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(6506007)(2906002)(38350700002)(38100700002)(66556008)(6486002)(52116002)(6916009)(1076003)(83380400001)(66946007)(8676002)(6512007)(44832011)(36756003)(186003)(86362001)(5660300002)(956004)(8936002)(508600001)(66476007)(2616005)(26005)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MbLeDnj0VF+FRKskbtO6n+caFG8e+Y2ItTy/nfO6bfqvmsR+h7da6EZuyxrN?=
 =?us-ascii?Q?P929lmX2vFagEet16sX1wg3SXWmVKaKSYH0UWxGW1bQmHlhXuybSYvi/ZVPH?=
 =?us-ascii?Q?VP357y8tkjz6u+z9p6PngF4f3OOItpSwxoORXBEmW3M/c3SDh+bqhUnAMqF3?=
 =?us-ascii?Q?q2vzFzI8CAyDHKq3Lxky2eWy22pgureaguXUMY+0MWI6uIGC12PSAccVjw1I?=
 =?us-ascii?Q?HBuGR3Yqv0WLlqENMiqPj1AHY5QoU13xGVN4AO+ht2deEOeqgnyvJHAAxFvd?=
 =?us-ascii?Q?kASzTVQ8nL37hRBaOoT3RDZ1jakaZhnB/nernejTOnItHwi11vErMY8BTdMD?=
 =?us-ascii?Q?ljigWaE3LKRY1oBARsmR8Xg6RaehyIyN1HhlNmHm++IJ2zn0vCuLb0vxGI3w?=
 =?us-ascii?Q?U9/chQmaSomJ5yEO9GCQg7iztrUzMgvjmG71ccFcH7irmPBapSFYkuZf5ItC?=
 =?us-ascii?Q?JwsSCA+PZT8Eho+yxMJWGSX1fBbmADzwK6l9KWNgvvDtEsEUK7HPbMwknnYj?=
 =?us-ascii?Q?oTd5NBUxL+gcbUMf6iuERj7HZMItEc0fKgdHGM8RL2ClMfJ01Db48yVfF8+x?=
 =?us-ascii?Q?Ap3lcv95KedygLzibZU/gH4KBtRlhQFuxKbQS5pKLAcT95jLrEkfPRsGsThQ?=
 =?us-ascii?Q?L0vrDfa+J9Z7VSodfmklj46rGLsCpCTjKBm7WS8Gk/zHyk1WxtiAMGEeNt5w?=
 =?us-ascii?Q?4c0TeDNqI0IsgaqvtYSqrW4K11986fa+wD/4DJ//kDVKLLhrV8pWAkDfzR4G?=
 =?us-ascii?Q?9tuoL70dsDs/HhkD1XH2DtJ/9gsjGgdna2961WeRWBcaQqN82vMhS8yizTPW?=
 =?us-ascii?Q?srshFToVK+xwURa9WaWf7Iytll7y57BMzoycSbgZ5mCEPFQOaffU4KKLiY1G?=
 =?us-ascii?Q?YaUOYOJyAZG3pIooy5GURfOr/XCDwUVqh3A0JLwnsobkVgpilsz1Wn3IJw5A?=
 =?us-ascii?Q?eg1yxnj7rzY4FOIkIoBw63mc+pShAvSFE3eHfrXtaLrLT9uycGGzdLmT9Hbk?=
 =?us-ascii?Q?nLIrmsFthDoW0948iO5rE2y/bmEpvpeEicrUJWfGkorYg5JdPEiTf86imrQE?=
 =?us-ascii?Q?pHvKW5ePZL+d4dY7fVFgpMrN0gZ3+GuurD6gAZ3VZfIYOtznBkOjldLHXW0G?=
 =?us-ascii?Q?Io+tWQ7nrF1LhNps7IMFk2Qn7KxPypQlxfvwy/HHsYtuQ+2v8StRId5D1yc+?=
 =?us-ascii?Q?5qkVf6XMmIG057jabLSlboXUqdKwc8U4dbDdK1q/1azhbiIX74ZbIcpsjF8i?=
 =?us-ascii?Q?1hay+GkxV0jsEBX3u+676ljBh6gSSRKdAKkYnD808piq0qC+85UbPXfj35GR?=
 =?us-ascii?Q?C3xtYFr7l3lxzVIvKW5EUTz8oEZUg1L7C9kTrYpLQUHE8Q9JRlWmjmIPmHke?=
 =?us-ascii?Q?1E3mIN0bPn/FMJ3jPxTBFSwQFXrlFUevXd2uoPpB0MvGnDXrJ1a3eW9+oWtD?=
 =?us-ascii?Q?upr3nWEoFioJlp2378ol8+IQFY5rxSdC3eP/ibUTrMAV9t7thMK3jkx45UN9?=
 =?us-ascii?Q?4bXNiqcK9DefQCVwXn7IgzkREC90yF9zpuwcKNdXDocS/Uzr94wnIk7UzHmj?=
 =?us-ascii?Q?YTFipifJyQRVTYIR2GAMlQLToCH7zN1wU+It+dMQOBlQO5WHnt8oswPRsUfh?=
 =?us-ascii?Q?+u7RpWYh7VH6ndcTxztktsA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 245ffa5b-14df-48a4-68b2-08d9abdc9d0d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2021 04:17:06.8360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4Tisy9sFSjL/8uknoGmlzGZPD29JUjmAwdAUGDn0wQK010P704kFvOszwEcwVC0+m4/pquRl6PGZAcrCqXJfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4785
X-Proofpoint-GUID: 9TyZBf32REtZRa7IOQYv_zYeQsOWl2mq
X-Proofpoint-ORIG-GUID: 9TyZBf32REtZRa7IOQYv_zYeQsOWl2mq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-20_01,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=788 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111200025
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-openstack/Documentation/README.OpenLDAP | 2 +-
 meta-openstack/README.setup                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/Documentation/README.OpenLDAP b/meta-openstack/Documentation/README.OpenLDAP
index a45b769..95c2227 100644
--- a/meta-openstack/Documentation/README.OpenLDAP
+++ b/meta-openstack/Documentation/README.OpenLDAP
@@ -6,7 +6,7 @@ OpenLDAP into DISTRO_FEATURES
 
 e.g. in conf/local.conf
 
-DISTRO_FEATURES:append += " OpenLDAP"
+DISTRO_FEATURES:append = " OpenLDAP"
 
 A number of variables can be specified during the build phase that configures
 OpenLDAP specific options:
diff --git a/meta-openstack/README.setup b/meta-openstack/README.setup
index d1a4703..f837f63 100644
--- a/meta-openstack/README.setup
+++ b/meta-openstack/README.setup
@@ -95,7 +95,7 @@ systemd will be used in your images:
 
 Additionally activiate the meta-virtualization layer:
 
-    DISTRO_FEATURES:append += "virtualization kvm"
+    DISTRO_FEATURES:append = " virtualization kvm"
 
 
 Package configurations
-- 
2.25.1

