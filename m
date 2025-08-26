Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91EC7CA0EFA
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 08:07:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.59311.1756195650503322984
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 Aug 2025 01:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=neBwfgT/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0333c92c70=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57Q3mVdE939145
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 26 Aug 2025 08:07:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=SybwEWbPIsOC5+/hfV6P
	91HFjNc7k4bMde9OEJTEc2U=; b=neBwfgT/koq2GpgXkZlC2ckqx/0T/9MqBBtj
	qfE8OBo2g8ly1nWCv9uuRiJVhLTI9GxwRRoD7UYvCWCBu43e2sxAv4Ott1pZpKH2
	Y4OwgLUOXGXfLOzOW3aAXVx6uvNe93vK1EAZHNgSzs32BUDG1U9HjRqi5BuWq3cc
	y3D3tkNlSGyxAPke+84MmGYcqevsI1eYtUQh+gek4MUGbxMSiDS8RYhNsCANVS86
	JKcLaiS623MexyGfnEfoWt7s5q1aN5Oww86L/jl7zBPJ65Kq5FchSz7wXsVqjOkR
	C5YQ6BPrHzKYDlhPp0KFDBsBgk0ZUm2668K5SFXggJhIdTK1bQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q2v1av15-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 26 Aug 2025 08:07:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dg2LkWPaTsAruP4RnCjq6y7vsB3W3H7qXJ5Xov8x9nnZaTLL89/YjMsEwbxd4ih7+5idx2eZu4MY6NH4kSu6mKJWQsYBuV3OpFh/kCzrekh0MCoch5tLMbojLMYq9dYjl/55rXftcexkbIiDhKjtBN7rpQboiMHtXumW1aj4T5QuJhLv5/b8+BL36FD0cHwZmqvxsbtLvCsf4r2eoIa1Gnpop2rZ5jFusm8cG+XZv8YUbcDCso2B3nslUzCIoQBr3K8rKl309ahqAsxRI2OOASRfZCqvY7KWMSqwz8jjN8glmbTSBFlxc2kOkoWKUfCGxZOqhDHpgr/kzlZotobmIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SybwEWbPIsOC5+/hfV6P91HFjNc7k4bMde9OEJTEc2U=;
 b=Mot/kmBFwQMWfYmMs9QOWiPJHm42SVzQ96D0FZcA6PQRrjLTbrLAoIk6cGtFL3tsJC45YxKcbzaJZ/zpbKIIwHDSC3MZ8/Xgqi43iuE1lVE8W5xkaD5pKflNz77esIBDuIS5S00ir9POBdIhL2i7gAL4wA+vxzAjg/iqVt9AzuSlFIRbIMi/9vg+DT3UQ3lywumvu4lTL00hsagmrLx2mu6H3bCX0xAG8ALm5DH97Ulv7BqyR9/nq0YdpsXd06dgBuuR+d3RbR1kFNQ7ubSCBTjmH3E5+deYBStWWnB3tOYQPHpoaw9VIkvd9mu6BesmaTzgyDneVRdR/rY9hYJeiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB6955.namprd11.prod.outlook.com (2603:10b6:510:206::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 08:07:26 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.9052.017; Tue, 26 Aug 2025
 08:07:25 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] cri-o: correct SRC_URI and HOMEPAGE
Date: Tue, 26 Aug 2025 16:07:10 +0800
Message-Id: <20250826080710.2228501-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY1PR01CA0190.jpnprd01.prod.outlook.com (2603:1096:403::20)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB6955:EE_
X-MS-Office365-Filtering-Correlation-Id: 30fdc971-547b-4a3b-8001-08dde47797bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OCNOvUwdAtb2yQoIcMbInU5wgLDSz4S0kL/IEhL5OMi0Txc+aTbg08nmDGZS?=
 =?us-ascii?Q?OmFci8KB1oQCGaMOAVmzedtxlObwbMSMIHBW5R1setOTFjDVPs+Vbrq3vCJL?=
 =?us-ascii?Q?Xn5EgYhq2ElcR8YXyGhPraMAvrlt2vafIkpDqGyV8p3sk2o7Dx9qOXb+Li0X?=
 =?us-ascii?Q?nATFp+MwIB5NS64aIrErq0G2lusuOgT1JkbAHw+iXNkHg6z0I8cdmq/V1Fxs?=
 =?us-ascii?Q?DwN7rpMqWRkk5WrKk1F/fQi97QY/O0Q3FcDoLvRoDn23UELk532lPz4euMBF?=
 =?us-ascii?Q?pGF7Wz8VSSlw3AC8WXO7Qvuq2OKzoMwzPhGJIuHBwmsJ9M+EnwJjF/ey3RHC?=
 =?us-ascii?Q?py5U3cRRdUwmfoCyM1U94Omogs8A2VynnxQDd68O4qQeW5uzsBsaGbwtP9od?=
 =?us-ascii?Q?cpi6Uiluhn1LIJwGg94BkWEh+jw/hllAtXfC+eUAlpjr89UZGhmDBbIqq1rK?=
 =?us-ascii?Q?ngqmtpl9GDZ4c50oiBgXwBUlu1GQgTse82wfewf2EnaBSEZvxIvecITM56LY?=
 =?us-ascii?Q?NcUILEyPjVVOgR2WbAx6zrx1Jx1t/NejO3C37eDe1/nGpI0Umd23rZSO1DqM?=
 =?us-ascii?Q?mWtuG9xdlkwV0QKsXfy+MD7YPVfXl61oQgjdPGecLoH4JZXr3jD34Brt9pA+?=
 =?us-ascii?Q?8XYwODaDtFpKJMFZ4xhT1ACacvvZ7knD/eLvZRdIRLkRh+L9fsiAGc4BId3x?=
 =?us-ascii?Q?kjNm0+FJLLtnrIOdKd6AkwBYQ7owh+H8LF8iXMrV1cH8m6icjdigkz3eyG62?=
 =?us-ascii?Q?hwJ9jyUzJZyJg8OfV2h29Kair+8BYY7bl8vNVMvcD94SClc5h1TjcMAFtSbY?=
 =?us-ascii?Q?VPZJelkIBclfew69tEmxqQrrLi5TL7pRCNyrvGsT1gBKqDdtScXKTpb+m9MX?=
 =?us-ascii?Q?Y+W2eLq9Cx6s6whqRgN25YjXNlB3SJ83mWRryWFUW87mLnPB5EiPmXEHzBh8?=
 =?us-ascii?Q?sP1myA+D2gk4b7qbhtjThur35AXeUZ2h7Xrf7ITESgo+DTuzX2+2QAMDd32h?=
 =?us-ascii?Q?E8C95TNPtRVtm1TX3ood/N5v10/tqnCsnUND44CsckhyoHRPELAJ/n0FNEOY?=
 =?us-ascii?Q?W+/sjPPX1XyZx09JDfLyGMxJXwJ8jMvL08QTJZMck3qG1G4v/KAsIEy123NS?=
 =?us-ascii?Q?S56U+00EqiTYPfZgyw3+q1xgeCYvAjiOUFIzx9vAJYLvlSgeXZl5DRp8nwAJ?=
 =?us-ascii?Q?kySwExzIshcnTmob0au/u/HEGBFYxbx70wY12W1a9sneehhXvkJ9wIDJaLiG?=
 =?us-ascii?Q?AZ4mAbNVfrXIK9xozuDVTfwS8yg5+c96UxhI9TbjaXfCkTOf1xZR2EH5HkPR?=
 =?us-ascii?Q?Kv89vm8L05L1WAP7YDBdj5hm9wM8POEUIGFnP00MY9kCTIlMYepVURt576La?=
 =?us-ascii?Q?jlsEXgK+6LEx/x0FEdJMrdGG7AY2vTF6qZZP8qTIM8oE6ZdVL7MypIVMCTWx?=
 =?us-ascii?Q?vm2By5nuwQFOaEnLxYK/FoSsVRTPHgB3KCODt1s9PFhMxqSseJHyGWv6PtaL?=
 =?us-ascii?Q?O++yECb4QAVUQvc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZPav9t/uzhXCHGo7X7/+rHRjk/Mqavw8b6y3wzDK3YaABE+JSpYy2XuKnHmj?=
 =?us-ascii?Q?A3qrbKnxZjo+S5besPFDd1ovloiX3mXxdvY5VuB91yT+nbHxUyAxGtMwDRrG?=
 =?us-ascii?Q?QXsuKRrzYPGtjN3lM7jHfCGT5bnWsuXWss4/d1AZv/jEBKcMzmTeS3EEmkhA?=
 =?us-ascii?Q?irD7G/yHu0qtLND5lllW4JXfNXMino0H7Q6qItsvWDcMU0PV7ZY6fb/Nh8Cq?=
 =?us-ascii?Q?x3k+TeVCJcGm2wC90mazmuFQU01YZ+q6JigGDuOtVBYl7+H6gnpof0v5OEWH?=
 =?us-ascii?Q?M0qxggZb7cANgblTTotx6qJtUGOj4hmR6WRWo9fjAN6CkEdHU8F8TdlcADKE?=
 =?us-ascii?Q?lTk01UWEMrnCrb4URATvYKLzaALlpHPxKOIW0dn+aE7ooVbGax6ToVrb9mNx?=
 =?us-ascii?Q?yUH3L/fEmvuUiul10wEZkSiOucdC4vX+PVDa/sAk3YI1jIImB1tuSf9l6Dwy?=
 =?us-ascii?Q?yicSPtF50HxmsYagsTixNWOegJiWhcEOrdeJyiMI2LssWQLDjzIJXQjaLyUc?=
 =?us-ascii?Q?MGju8vuIZYNH+R1eRk15PROzu4UMKmX76t7MVFoaitTqrOgYl9Up48ezPUtX?=
 =?us-ascii?Q?k1u9oSUsBad/f+M/72GBLedCY3aj6SpOp+06shW2sfz78EbELPCfMdmQwCJq?=
 =?us-ascii?Q?ISXgnOUKbh+H8N/7ZPUSjHvtF6iTUWtaktT9L6pJ+uD/1X1zAimqIBNgvdMT?=
 =?us-ascii?Q?tLbhGndagmP07Me3xZtpOlgkwsFrY4nwBBLGxvPY2r7Z3DZGMGVlbCDKaW3A?=
 =?us-ascii?Q?+3Aic7Z0PaGvWnnJbAMQ+u2MZJGgn9w5wHuJcB9+wKUaLoh5IaLc4BsBD/Oy?=
 =?us-ascii?Q?LAidt1ZYb/SYMaRxmAR6/kXVra5/P1HBpAC6UvLAB2j7/8TPS5nhqQrKWm5o?=
 =?us-ascii?Q?D284lB5Ik/C7z4HyV9/QG1TabgXlPBHT0jfEF06E/vqxgSZ8LpCdhLySTWxv?=
 =?us-ascii?Q?R6SX+cMTrm8B7iHOIUAYyMYVBV7o/JIb/m+6tMDlV1VwaePRzJQT6jNbuP4g?=
 =?us-ascii?Q?niJHfn5naDRiJsli/19NmO4ucC8RzQS2bF3UUE+gixeiHWHS2aafC6ntTDfe?=
 =?us-ascii?Q?ueX4IkbGFhYSsjRnkMioqugziZKiKhUsxDtKweFl66/YvQXrftSWs6DsQpbB?=
 =?us-ascii?Q?FYW/cegRX9zPV954TzjBoHT+nxP/Gu8ou+lNGdPxKGzL0K6GiZSd3n2P1SKW?=
 =?us-ascii?Q?Sp7AQfF52X75PwlYxWo1auMVb8loDm5t1nXBCh8P6MuY5bnxsLf3PwwHm5mq?=
 =?us-ascii?Q?bbFcMxYvI9iphO1FhTzmRLBsDSi8IoqWBWlbKA/0Gs7f9HHtDUan2QDJDHsj?=
 =?us-ascii?Q?RflVi5Wg9TiFoFvJhPgm8b/6Yo2cOQYCvQuXJ0L/+flUq7SQCIkJVB+hts3I?=
 =?us-ascii?Q?/30LnQcezGeScD1/bP96amzz++OcEJBjMbmL1mkJ1Gydipo8VMzTSzgfiwfT?=
 =?us-ascii?Q?iKGi26u7fxLN3BjDvCty3fNaDIFqwdTiTjDYMwFFX7KElt5svHkUPuupRy7f?=
 =?us-ascii?Q?mUPlmmO7TGDwhO3RLzdaMkcU9g37SibcsMldjnj8IM0tJmgvp/eHD2zxmgWM?=
 =?us-ascii?Q?+h+dkLY4WIcuQb9mFmtKEHeRjJe7Sb7JIlE920PV?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30fdc971-547b-4a3b-8001-08dde47797bc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 08:07:25.6438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1tI24jNjJqF0mRGXOpM4rvWMLv+zxvV/7Pl+xjIhPz2Zdv+3dDjxfk5GW9yAk3FxxvXyMs3eMthCB1C6A33BKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6955
X-Proofpoint-ORIG-GUID: GgCxpQdyxZ3gDjlqyAJM31FzfibBq9Yy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDA3MSBTYWx0ZWRfX6uWE1A141u/O
 NRu8CYRp+RvsG/Ofb9L5RfvItjJk5NnMZ5q7s4iT8GNQcdIMSFlIsXqXN2ChxIvcOScLBmIZ1F4
 TlWABN3iyVbkytt8RahoH95fxJcRs7C+rfW/jhAY1QUUtw0/3r8J3QWWSwO46QSOtTCaCm4/o5s
 iU85elivJh1HhpGo6UEKCq0/5v8IlVpjAlEypxJTMs2D0ObKaOvQABlSzMqYye9xyzjhK718s55
 WvnPoa/Xc58xt44ybnPzZ65UU4+TGRi0WnC6vWpLRCTSYhwj2GiWI0GBnB007PzBvKPbi/EYnyu
 dd8Ql6F+UQWgbb1oLP5BKNgw4D8urO+oPUnhDWgIgMH4GiDtJVOB8Yf7unnubc=
X-Authority-Analysis: v=2.4 cv=T5GMT+KQ c=1 sm=1 tr=0 ts=68ad6b41 cx=c_pps
 a=7j0Ltmo+QGRCGvpdpD29zg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=J9ib23vNIjUkgzsXdsIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: GgCxpQdyxZ3gDjlqyAJM31FzfibBq9Yy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 26 Aug 2025 08:07:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9360

From: Chen Qi <Qi.Chen@windriver.com>

cri-o now resides under https://github.com/cri-o/cri-o.

The old URL, https://github.com/kubernetes-sigs/cri-o, now redirects
to https://github.com/cri-o/cri-o.

Correct SRC_URI and HOMEPAGE to use https://github.com/cri-o/cri-o.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/cri-o/cri-o_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index 11374297..5b348a8b 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -1,4 +1,4 @@
-HOMEPAGE = "https://github.com/kubernetes-sigs/cri-o"
+HOMEPAGE = "https://github.com/cri-o/cri-o"
 SUMMARY = "Open Container Initiative-based implementation of Kubernetes Container Runtime Interface"
 DESCRIPTION = "cri-o is meant to provide an integration path between OCI conformant \
 runtimes and the kubelet. Specifically, it implements the Kubelet Container Runtime \
@@ -16,7 +16,7 @@ At a high level, we expect the scope of cri-o to be restricted to the following
 
 SRCREV_cri-o = "87ce1c120d022797913f0792e15dd0107d19dffe"
 SRC_URI = "\
-	git://github.com/kubernetes-sigs/cri-o.git;branch=release-1.34;name=cri-o;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
+	git://github.com/cri-o/cri-o.git;branch=release-1.34;name=cri-o;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
         file://crio.conf \
         file://run-ptest \
 	"
-- 
2.34.1


