Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06DEEC4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 08:54:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.68184.1701334434024103266
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Nov 2023 00:53:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0698bd4b2f=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AU5LeC4026126
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Nov 2023 08:53:53 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uph0w8af8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Nov 2023 08:53:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jEmtYH3KInFIhDh4L5hYvxBZTEK3OAOFEMQeFGZKjbmjvdSWSbLQqvuBy36+Pd0NuwS4HEnOrPtUt3Fiesy3zSrK8cGABZEPTOLXycx6RjNSk2/T+GTAxdCkmyAtheIRr8XffM3kvI4XOB4Wjlhj7XxtY+vpiYuC2A2DXPanTiEhtsHJBz/aNOCVMCg4/Gag9ROk9p7p59sxGA774krExMNXERSwZjdZxjG2lHBTBNf6H/81Sdbp+DtHFkjP29ulPY59i7Hfi9SvlIFqVOxqPgHtsXBLSTrOoz1q6IDNB/+OzQwVsJM6yG4h5i8kITmCNktT9FsUWOF636XeJOkKSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l4PoydPR97I6TL1bLCjLz4QDTPh25ry0f2ZXyluV15U=;
 b=PgzCWk7U3GXXCej73BGcmButkmcuN9YfgpqA160TTyxnqf/zhbri/5D2dLt0z+wLHbGe1bHR/4SUBgMz1i8ddSiTwMWXz21JX9N4frqYtqxR6tmgHWUUTDA60n6g1+gXji33Ao3u1jghrS1jW82NBqPVSqeY/+OLknFnQXY1ia7rX0hBiJ5pKdc8/czmr3Zc5/l9njGEZ4xjGkv9zpx5e/a1EMyJC+s3YrZ5w/FA9Ai8RJ8aO4+5x4Cmkv1YQzSY3jGV3Evmt2aSdtWSlk5vWoaV1oOClKshcw/zIf08GXnJfMN8PGcluKFGYxe/jnFwEnMJ9fS270cvJ2kleCuFsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SA1PR11MB6783.namprd11.prod.outlook.com (2603:10b6:806:25f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Thu, 30 Nov
 2023 08:53:51 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd%4]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 08:53:50 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] libvirt: fix missing dmidecode on arm/aarch64 platform
Date: Thu, 30 Nov 2023 16:53:32 +0800
Message-Id: <20231130085332.1352490-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0132.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::15) To PH7PR11MB5820.namprd11.prod.outlook.com
 (2603:10b6:510:133::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SA1PR11MB6783:EE_
X-MS-Office365-Filtering-Correlation-Id: 39df3b0f-9683-4f45-10fa-08dbf181deb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZvKd77Vbo5dzqXwMYKs0JeCcdzRkyEXNgI1VdZAMrhL8lShexX4JD3rcwa3zZWrDUi/GEC/ox2adVlNpGPYu9LO8scnY2jwU9cHi/6qAe/twSvMhxJbM+T6RnZWRn1g3wv9i5uYzBzcq2qjDcw+Bx6qcfciSuad4t2kcbD0vJR8z6w1MSbbigOZ8t4iVHTcVtkoEStkMAR8PJRu8+A87Gcis6oy0G6hIXUhjCbNa4LuQJeElrcr/G9KBCEG89xpR4O7ckm6DmXNDO5wP8PjPQme3gyfTFjW/j4PyI/6rTYMKilWSkDZT6lER4/iZ9qgGRR6xoG08snMlGQX+7AN5IzmVGDQWYRXfui7JIS5hvddUIk6gcjI3Tcrni2rd+GrCPKEop4KKTbwXOcfE6vr9Ljh3JM6MuOiysM5Vh+iNRKyGmOn8pgkTlWEpA5fna8hNWikC07HLb3qxO8tR2/RqXtC0Vn+ogNoyxUV104mCY3Xl9kVufnt/UB23n1aWEYc/R1HPR8Mw4fzt2gtkXMvrS1sxhA3V3gMq0TYK71UXi/MCuRYcR3Rs0Cvx/TZDHJKX3RXsJHVoHPd9fB6fePlo+o21Kk++W4e2T6bpbMHWthBpnh8A/DSoVM+xRCFuzbxXWC5/E1pUH3HGae/uqzN1RQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(346002)(396003)(39850400004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(83170400001)(1076003)(2616005)(26005)(38350700005)(66476007)(66556008)(6916009)(66946007)(2906002)(8676002)(8936002)(5660300002)(44832011)(41300700001)(6506007)(6512007)(6666004)(52116002)(316002)(478600001)(6486002)(966005)(202311291699003)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?roJa3XW75BrQBFG5hLoi6OfLKCWPAy1IilVNY7nyMLZ/C4uyGE1BbJcyjmc9?=
 =?us-ascii?Q?tuPt3ER2w/wfeULt2vudgaQM8OMIPYlTBnqGAXas/sFTEF6q7OnMBWkbXR3g?=
 =?us-ascii?Q?SKAubDSsnyhs/13RpsllSS6FmcGLh1ksIaCSHUGXC8V4DspYy7TOPzF+KvQ4?=
 =?us-ascii?Q?D5Th+9tm7+XleitSHSqWhG6gJO5WI9D71sBZJJuUoSlgHnk73UWxnplxPznd?=
 =?us-ascii?Q?XT0+l4l5PqkYAMG1GJPYtqyG/dCAGJhjmis5CdrpNdFvSj0EOfrc50XfMtL/?=
 =?us-ascii?Q?sPEvUdQRVNvB5T1DSLlWb6FcPQc3VAuB4iVN7Q2XHr5pNSqiRcjEg4tIUaX2?=
 =?us-ascii?Q?xEnqcklf4/O6j1T1kHmJ+8dorlwK9xAxXNzQJ1yxPo8imux5KaycQcraNxGu?=
 =?us-ascii?Q?dn2Go7NJaKBEEFUzd6DIbEUctmFr/jU9XiTV84tsbiVDCtD6TT7ytGJgCBig?=
 =?us-ascii?Q?L/Wo5+EGbE3xERWLnibKf8OsrAleuU4eMzH2czUIeCQmXPGEGbjSSmjA7/l5?=
 =?us-ascii?Q?T35dQ6JgiuLrzjeDcdhkxSuvbAwJSLjEgQyZaJ27nFFArPMuTtHIJyaCM9gR?=
 =?us-ascii?Q?n6KPAU6FtgO2IzY6weUwSdQUGr+X8hKTc+ax8y/qszqF6GLIpbyPOkfK4Q6O?=
 =?us-ascii?Q?Gf4uMwD5dZOgChAX9TrmS0m1trBV07BcMA9yrthkfztDZyNckIVFN7luqBVC?=
 =?us-ascii?Q?k3X+qbqgACTyrkAA3o+IfjLC1kIN4pL+T62XrXLMP43Xicj4HYnmcDz1L3j5?=
 =?us-ascii?Q?vlthejxQ0DI2U6NFE4kucWHRUU3TujQqTY1IL6r1ClxOtvLmZKFqaUmv8R4b?=
 =?us-ascii?Q?MQauvq+94C9i4I2tIuizdpkbGlVvKWv6ParYocg5dfRFgq1ohqvxkNLFQFCH?=
 =?us-ascii?Q?ccU/NSjS1OTbEPAdl4RaiNuCz4U8xrSAeZYmU2Vp2OFB5HUaYdZrbA1Dl25A?=
 =?us-ascii?Q?5NQh7ahQGAHnhNUFiigu8oRNdDnxr+jpqWqcBVVSE+n2+rgaFM83ZIQAKKrY?=
 =?us-ascii?Q?mmrclbhPiY8BMOE/fEnINyRmtmVxTcK3O8eixKrjP1EDhXW+bk4Ji/HeAX6x?=
 =?us-ascii?Q?SzkFO9Qyb/PKM44jBGogoANTR2JgToeAyteN3t1t+eO77dBS4UN+Z9wvpJi2?=
 =?us-ascii?Q?kbo6ow+7TluRe227DgNQ46+fVomsXUrpcZ9FrVm691j70PwWvnAsydYLgLK1?=
 =?us-ascii?Q?lYyvaSRFWrBnwPYAUaCyqwn5wNjclAANmAMLCppfSvXYMZg99WqkCSnd0BbP?=
 =?us-ascii?Q?tATgU/xeMQtsH//Gp91od2tYCRm7VCkiJctTpeYOia7FdPsV6icXwVfOoOKo?=
 =?us-ascii?Q?poex8mMLa5fqrx+LmyOEHKPbdRUb6ynF1ULssuobWI8zSwbzNYO2pLJFX0nj?=
 =?us-ascii?Q?EYHu0/MTMBQtUyQ7JLSfQy1nRLICue0G9U5E/4wYp4OfBzsb0ghBZoqPOgE9?=
 =?us-ascii?Q?B/1l8GUfKLtavrxpZHm92O9ZXfT5gbd5/3r95Z1Sl4VsQQClPDaIm+6oxZwQ?=
 =?us-ascii?Q?/hkto06BdxgUmsNzbEDNjGT1LrGv8qxULqhjE9PG/G46B6vrAVPIlKgQ7aZM?=
 =?us-ascii?Q?A0wouKt5pNVlgWGXqUo6rNNAbUHe/nwzHs1Qkq3Swp0T4F4w+58nF1SfZ9an?=
 =?us-ascii?Q?8w=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39df3b0f-9683-4f45-10fa-08dbf181deb5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 08:53:50.8532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E4AaDn7FnUW0aAJc8np7w4vsXijkKSohaghyDaIaf+MM0QQpL7dU0mbFRb4OGdPS3+Hta6GWCWyhWWLEc34F2/VOZQd9VJDWXZqDoIs5hpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6783
X-Proofpoint-ORIG-GUID: 9R5gxu8bzI0OsaW2HpBpmkmLz22oi3cE
X-Proofpoint-GUID: 9R5gxu8bzI0OsaW2HpBpmkmLz22oi3cE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 mlxlogscore=748 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311300065
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Nov 2023 08:54:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8483

From: Xiangyu Chen <xiangyu.chen@windriver.com>

When using libvirtd on aarch64 platform, after system bootup, the log of libvirtd
contains an error as below:

libvirtd[417]: internal error: Child process (/usr/sbin/dmidecode -q -t 0,1,2,3,4,11,17) 
unexpected exit status 127: 
libvirt:  error : cannot execute binary /usr/sbin/dmidecode: No such file or directory

After checking the libvirt source code, the arm/aarch64 also try to call dmidecode to get
the system information[1], so add the dmidecode as depends under arm and aarch64 platform.

Ref:
[1] https://github.com/libvirt/libvirt/blob/master/src/util/virsysinfo.c#L429

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 recipes-extended/libvirt/libvirt_9.6.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-extended/libvirt/libvirt_9.6.0.bb b/recipes-extended/libvirt/libvirt_9.6.0.bb
index c5d0d2cd..b63087e8 100644
--- a/recipes-extended/libvirt/libvirt_9.6.0.bb
+++ b/recipes-extended/libvirt/libvirt_9.6.0.bb
@@ -18,6 +18,8 @@ RDEPENDS:${PN} = "gettext-runtime"
 RDEPENDS:libvirt-libvirtd += "bridge-utils iptables pm-utils dnsmasq netcat-openbsd ebtables"
 RDEPENDS:libvirt-libvirtd:append:x86-64 = " dmidecode"
 RDEPENDS:libvirt-libvirtd:append:x86 = " dmidecode"
+RDEPENDS:libvirt-libvirtd:append:arm = " dmidecode"
+RDEPENDS:libvirt-libvirtd:append:aarch64 = " dmidecode"
 
 #connman blocks the 53 port and libvirtd can't start its DNS service
 RCONFLICTS:${PN}_libvirtd = "connman"
-- 
2.34.1


