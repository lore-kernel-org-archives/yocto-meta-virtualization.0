Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7701CC27C4F
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 03:22:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12276.1718767311622874739
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 Jun 2024 20:21:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6900ab20e8=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J1p3G2005338
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Jun 2024 03:21:50 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yujbdr5u6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Jun 2024 03:21:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VeecTPQaGA+04tfq+acP1L9beZc6NuXAKZ4QyXKxm3wlXN4QKG9hU/C7Evs2s23uMqglISxumhZH53mg9bnJcJSRV9bVoWo/6UXgpJ4VGli0KLuYT8+UdIdr2MS1/uil0W1B5MducXFx1uxGBVM0QxZOyRIXGDeEP/Q/BT6QZY2sLRPlPFd/G/IxEE7sMr+AT2Vd5CXVwOOfwomOOgvSmFDJE6ay0eDHRQXQjeICPLHDPOlO6CK+ba/F43p1kP3Jq4mCe0+l6f4DTf1QmIXZRpE1Ea/dV2lqA8cdbWCk8vD9OZqnIQphKAvU991CxuxlnGf8LA6+RKlKXgAOnD5H2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52xBZWEGZgBKNVMz+0TH3wsKCRk7vQKW7MWtcYbvHfA=;
 b=HwghJP6UBFyEycxaO5gy9feSh6AI2NFD4IQqKm4xhhpMkAf8rWGfcUOmqPqhyU2fgvqagKxVd2o6DH2+NGBCFOmEBRlDpn3gjNzXwcLRauC8fVgS4y9yeunjDQYoLmPL3QxnuiSdmhkZLUEsrxmDTnLhLYFzQEgtEXKshej5NBqOv01s+VCaUDtXUdBPq8qcQ76HBFjuGjBH+vY5U2fjkaKUVsTl8WXfSyRyww+LraX6aDdPK18slgIjdx3lazvjy7gbCbvlkbN/mDd8nny6NxD8Fal6BnDnjqDR+ncO1vGiZpS3oAPvQX3eimbPXLWrnXSWthLl80KWilQPhkaqGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SJ1PR11MB6153.namprd11.prod.outlook.com (2603:10b6:a03:488::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.29; Wed, 19 Jun
 2024 03:21:47 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f5f6:a389:b6fc:dbc3]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f5f6:a389:b6fc:dbc3%5]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 03:21:47 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] lxc: update ptest cases in black list
Date: Wed, 19 Jun 2024 11:21:27 +0800
Message-Id: <20240619032127.1637376-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0221.apcprd06.prod.outlook.com
 (2603:1096:4:68::29) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SJ1PR11MB6153:EE_
X-MS-Office365-Filtering-Correlation-Id: de27281e-6882-45ab-0674-08dc900ef3a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|376011|52116011|1800799021|366013|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vLmtr4QB9iVWr7WWgNy0ZG7n6CYGp4L+bKYl2priIFe21Zyh2Ed+ls18280o?=
 =?us-ascii?Q?1KRtrjERn1VK7h/jGG+NX5Z8TApiqLUrOQBheQShx09Cynm5k0WWWfTl/V+C?=
 =?us-ascii?Q?UEGb5UGjYRwcLEkSqRKcpJpvQNi3WVp8qBD3B2cyB2s7JJd7blag+9wZ4PEH?=
 =?us-ascii?Q?ltpbAVb/rzdM9MlOop0b3DzTeQniRkMn76qV89Li2TBP/ZNXBhCldeQYN9fR?=
 =?us-ascii?Q?5u9PUbkceRuJkxmhud57MuwAsoiZoH//7MwMNWRsS0H/s0AtMPGRDNKdkYGr?=
 =?us-ascii?Q?gNI0f8cpHxmIprtVc+HvmveSnIh30UHgn4PDXFAsCdb2KrIiXc/LOODqbers?=
 =?us-ascii?Q?nqYcsjD57+CP6Ch5d6heFW15TEEEt1aaUc7Lh8bR9l1Y2qwr1FsD+gVd+7Pv?=
 =?us-ascii?Q?9yZwktIY8SSGiXXPEWtDeHWCj2JfxqfQJLgq65zc24QpCuRaToGQD1CdLpJf?=
 =?us-ascii?Q?LZ5cH5g9SaC/UBce7dQelynkH8SB3LqAbBNXq8u/8dmdHsGpTw0PKgBP+h86?=
 =?us-ascii?Q?JCyx+adjS/9ZWXoZhp8hxn5vsPFKWVjn9s+VbIj1UNgKuEsKlux/LRVvFqbw?=
 =?us-ascii?Q?zmuq5bKEuJAlSHxGOQIUfOfAczFwLDKWdLlJtWW8oLEFAG15aHYbLikrQu2H?=
 =?us-ascii?Q?D0jsq7VFDqWEI6+DgW+g1dOZ+tuIsIJ3XzRijabKqyK1KfgE5mMzrj+1MwAP?=
 =?us-ascii?Q?QRfPGy/NRKN+XCA3tMMkBwrjLfCQn3IXJyLS2/zpHAQaGot0WAO3yWKKNmDC?=
 =?us-ascii?Q?BcYIhVD1MlhsLGUVxbBpFEmUstZ6LbB5H8h9cVYRn3LYM3rgYkJX94kXFMdZ?=
 =?us-ascii?Q?Akv1nEKVF6+WUPzUgvuVBLaWN4n/m5nLJIS604k5Yg7RZqbZlob4AK3M2eQv?=
 =?us-ascii?Q?6hOEb8Iu1mGT8CY4vJ6+KQfKbAYYrJ+uif6Y3dHHvlPqXMgFfel0ZVh6tFwM?=
 =?us-ascii?Q?wt4BLbwHaFbZjyIIIFsUJcRbsBRdg2yAWWwUSaNI4Yyadr6+ZkPo0kLvrxsf?=
 =?us-ascii?Q?hIIuEXX5gDwizd1Kvr9jp9MFa7hVc2kHWLw1rmeeRA3SNAHL5p6oEmzAiD/x?=
 =?us-ascii?Q?T3tg3niIob3rTCMBXeb8GqzHRh1VTjFvmSXFhQ/vyigDXzsvbkiZSHZt+LLp?=
 =?us-ascii?Q?Ev7FVxS13Py2Gd6NtItg0JhPQYTF/u0BmvZgoSSnOaJTD+f2DMhSO/1UrzeV?=
 =?us-ascii?Q?l5H7iBG4OXPXRG2NbMr7I3nxPwf7GYOPYI0GyMUhCO7OHmfIPKSn2VWd7ipP?=
 =?us-ascii?Q?tiqALMfKP8l3g3Aa2jpySoC9PLwlPOIRSeFq1bk2tLML+X92bcrXgD6xmcBs?=
 =?us-ascii?Q?hzoB6kRzkqUo7sbsb2X99LRL?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(52116011)(1800799021)(366013)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uvjj/2iLDbNT9CfJNk1DZ5LXBt7NgwB2fOtEaagSENQM1WzOQaBToxdC/is7?=
 =?us-ascii?Q?FdPu83ufw/OCWxnt6b45ICXGofduCvg/fbVQEZcAbcZgbSDylemJZBEKb3jm?=
 =?us-ascii?Q?0m01Qv5vnuOWanVAWvj+3GBh2hsQfKXyHXs8Dvr1sBi1sYz6IT2vgwYzEILR?=
 =?us-ascii?Q?IgwOyVoDDSkMYx+bkY4f/l9n8BiySt8JEEGCU19oq94qCojzsqN40jJ39huP?=
 =?us-ascii?Q?6Fia2QIdbfC8YXfoAkdz7Qcw+HS4zXd9xUJx+aaQloGM+DEDj439sGDiXO58?=
 =?us-ascii?Q?We9DqzpU9JmP76vk7jfPJMSuSSyIZHIIbpyiQcJzWs8rvTRgNuVpqdUQdUeG?=
 =?us-ascii?Q?FJX/MWFwNC+ygtpxmTzKp4woh0Yf1M2TeB2eTwqHpVQoDPU6mWI/rqcRO+2K?=
 =?us-ascii?Q?GWzJaUgz/QVfVEqDl3yvCy76gMbBdurSI6lIbpT+yjrFSWFzvPmHntvfagoy?=
 =?us-ascii?Q?p0XNgjGZbBH0buAsQtQNRLFoCndG/bcwxKdgUPuowqE6+nuOoGK/76nFimzE?=
 =?us-ascii?Q?qEvrPt2PD9uP3PJkbgZDzhomd4JVQgH3qu+P7HBKKepOiadwGwJ1mjKYggC8?=
 =?us-ascii?Q?EteFXD2O1yz34V7Hwlc2FLn3galC5zCsMK1OmGsESicb4KPFT80sIsY70SRP?=
 =?us-ascii?Q?xzHwx9Y+oi6LIQnEiO9ulwW90lBVLRt5a5GazWuEX1MsgBlqB2H1nvGcLk2C?=
 =?us-ascii?Q?RzSlDK/Q2I1x8wqOdAQJ0GGYN74qsRYVgHEaFERPh1fFy30BFeW/FCyugu5R?=
 =?us-ascii?Q?hz4Y/xgmFJbqFeLri7KkfsB0Kt3mDJ3sULpdtoASEYFCXNEv2Jkq+/g2Dmf8?=
 =?us-ascii?Q?wkzGXx7EJ6gRWhQKrl6SaLgddI2LDk+bOHDJcekzuVBRixgdvSB7OUqsWY2t?=
 =?us-ascii?Q?xiHUh3qtCeW55d+JLf80fM3xxhYVF3Jw+tiT/VBIkU7MGP8+mLFhIipsA3LG?=
 =?us-ascii?Q?6Mu+9R16RkofaVL+hVX7to3/pC6LinF8ayQOLZwvwWhXbJSWNlXmagk6beuU?=
 =?us-ascii?Q?5E1SkvjL6qx0kX9b+T3H7tqwqJcoFpNvGRwlia5G3X7X9BjP5HvNMYSnh31C?=
 =?us-ascii?Q?B2uLNCF756V/PwpN3QvEhyZW8g86ajMKUI81QX+irkqLzCQ/nCLqv6jAb6HI?=
 =?us-ascii?Q?ez2lPYBmTQVFQR2QhaDliaeMM7dzmso2bWWdQuOGjW8o+cuik1ptY+ptvWSl?=
 =?us-ascii?Q?FkTaGnHJdKItTaGtfNvhHREUqMjIhUN06snh5bsOu1/nQwOZgSVFSGFzDJEn?=
 =?us-ascii?Q?uNwcxO19/iXi286JItfNC048eybFAWlcr3WrJECAWDj3uGfae/igRSkIdf7t?=
 =?us-ascii?Q?2AqJv0jd+tRFZk/GGpzyan+iUsmDg0mJeYl7LSOBWT3BdihjibvV111lo8la?=
 =?us-ascii?Q?LlzJGn2BDVdGY9rdgTslufEd2pXWcbbFQWjsBDYt782ioQr3HTVOxAuTBb8e?=
 =?us-ascii?Q?PNG8OG3OHyWvv6G7/CgS7s5cmHknJqFANhbLCDR2N0Oepv4FW2JwuRaTROev?=
 =?us-ascii?Q?BUDvqQdrq3s92vBK7/eNv8rni2VhvdnbHIn38wEwaWn2USQOvbuwXbLrJRIk?=
 =?us-ascii?Q?JF2Kipd8Ggm20hW1UzRT0C0aUceU4ZeQwBZhMYMtZuUBUjbvVqxMQTN07Hiy?=
 =?us-ascii?Q?0g=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de27281e-6882-45ab-0674-08dc900ef3a3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 03:21:47.3127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oBRNXXUgPWd6pTLslcr2IrL2d3J3OwbL/tiHH3kAyfam7B/W9B8GRgMYJL/SPOoPoHIRLqdIObN0lwbE2KYvU+gnTc0Z3aqW/hhWlAib1PY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6153
X-Proofpoint-ORIG-GUID: mbosj0lMkx6m9cteVGyjH0IGo8BBsnA3
X-Proofpoint-GUID: mbosj0lMkx6m9cteVGyjH0IGo8BBsnA3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_08,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxscore=0 mlxlogscore=999 clxscore=1011 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406190024
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Jun 2024 03:22:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8802

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Released lxc-test-shutdowntest and lxc-test-state-server due to
those back to normal since lxc upgraded to 6.0.0.

lxc-test-no-new-privs and lxc-test-checkpoint-restore are broken test,
already reported to upstream[1][2], move them to blacklist until
upstream fix them.

lxc-test-usernic always fails when use ptest-runner, but normal with
run-ptest by manual.

Ref:
[1] https://github.com/lxc/lxc/issues/4296
[2] https://github.com/lxc/lxc/issues/4435

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 recipes-containers/lxc/files/run-ptest | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/lxc/files/run-ptest b/recipes-containers/lxc/files/run-ptest
index 196adb04..278107d9 100644
--- a/recipes-containers/lxc/files/run-ptest
+++ b/recipes-containers/lxc/files/run-ptest
@@ -12,9 +12,15 @@ blacklist="$blacklist lxc-test-apparmor"
 blacklist="$blacklist lxc-test-apparmor-mount"
 #lxc-test-get_item would report Built without AppArmor support error
 blacklist="$blacklist lxc-test-get_item"
-# These currently hang so skip them until someone fixes them up
-blacklist="$blacklist lxc-test-shutdowntest"
-blacklist="$blacklist lxc-test-state-server"
+# This is a broken case, also fails on opensuse, already reported to
+# upstream https://github.com/lxc/lxc/issues/4296
+blacklist="$blacklist lxc-test-no-new-privs"
+# lxc doesn't adapt the criu's new mount flag, that cause restore fails
+# already reported to upstream https://github.com/lxc/lxc/issues/4435
+blacklist="$blacklist lxc-test-checkpoint-restore"
+# if we run "run-ptest" under /usr/lib64/lxc/ptest, the result is normal
+# but it would be failed when using "ptest-runner lxc"
+blacklist="$blacklist lxc-test-usernic"
 
 # Tests in firstrunlist will be run first
 firstrunlist=""
-- 
2.34.1


