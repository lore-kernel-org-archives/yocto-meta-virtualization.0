Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98211C00A5A
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 01:37:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5152.1674005843506225602
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 Jan 2023 17:37:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0382714a72=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30I1bN0B031261
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 17 Jan 2023 17:37:23 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3vsqb542-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 17 Jan 2023 17:37:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nioP5HkmfjpUR3Kh0nvnTo9A5DqrZu8LnndNMiWF1FBNC5A1QDi1e084KJbxPxIWdxeGNerODii3wJZwxaOLqdY6XEksSKPEm785ARaAAX5uJkc1DWEipWbdVBckHMZYZUuynBSyV+rbAYR2Njs11tfKu/YckPrWSQc7P3ZmyevuGQhx4CuO70Rkt9LomZXKyUD+6vqZUkwp4Auv9gdS8NLFotnGTKwMLmIMjxbNCiCqt4Ho43TD3zxzJHeYHeNy0P2r4LxD38UdbrTXIco/kwgJG8HlKhfCLtRNLtAmROe5ffPgQG9DLLQ23y3X15U2p605QvgRjP9KLCpAm0nzEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhXthnIQYk6x2XWkcv55iHIeLYahK36dz9s8usAX4XU=;
 b=f4JrWCeV1SlP2m4LYmb6TyMP7bAG+O14RtVK/adeTWfuYjdATym5wQk+tdLPf8Z+zpk9pQeMHYHBFEb+LBUCRRdq7emM35ymDAAlheC3SbxdeWeq8AgMCByfc3PooqnzzAM3POa2eRnpiPAtdJHj14OS/6GYlvD/a1gpwa5BOB1Ffj2plFqntATrwqdX+Q+gYdXy1UxwRsXJo0PNKEJP6ibWLShEBBn5f7mt2xUv7UiM60RMh5io+Mgf/uI+y61PJ0jz0t1qHza+7AXhtyXe/1FGdcy/HxDUrlfH+imgre7NohzUdaGUc2AwPCgZG8964CDv3vMzJVFTj+fzpplHqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SN7PR11MB7140.namprd11.prod.outlook.com (2603:10b6:806:2a3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Wed, 18 Jan
 2023 01:37:20 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::39df:478e:d974:335a]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::39df:478e:d974:335a%8]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 01:37:20 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][master][langdale][PATCH] lxc: backport patch to fix CVE-2022-47952
Date: Wed, 18 Jan 2023 09:37:05 +0800
Message-Id: <20230118013705.2354105-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::30) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SN7PR11MB7140:EE_
X-MS-Office365-Filtering-Correlation-Id: 44f51824-81ee-4228-d7e4-08daf8f48a74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hun2h5sExYjTIlAqwhP/FALi7BioSHOnK9RSQhobLlIaoN8FpZmn7rrqQfJ7DeY2K5/YUENY/OYsK9o4oBtWhfcVTyqnWPU3hepk7mS2mZK9J9PqqPxRjBYZ6xRQ0vmmH2XJYNSaFqHH41z7S9alYyVQuqr1B8JCUkQoFgxZQKY5EIoGGwIQUJ+Jdpg+KoEwM4sdOQIUjLIJe1zPvzd1Az3YeZMIxE7gFhxvwsPgl8LjSEKQXtscxDrZnhyDjlkAaKEc/RAKThrwL2+ArFq3CYxi/DReHhIyivLP3JK536KngBIKcBc3kxvdT7cKtsSM0WvRDCTRcLz6n2RfHlzKPqUsE9ILx5EBiWFyJfu2QVz1QB1Vf4KzYYdX7Tkas1gHuwflgx/tB887SvogJTaW1B2bd2mpUTGDuxW/Ta+iWaoDfmyx9VVBtzMsdcS/4xtlkJADY/RO441RDchcymVoErglAB+fS5zwdGPIZBfC7jbgZfkC3g+ruyKCk58cTk8CJHET25HQXvQ3a2lc/ghGkalBD9ltRb+PZAg0Z0MsRo3mjal03sb69Ylc9sMJkuRTMM+RDo6QG0QshDIzO4NneCGE+NNyGuQRY4AIyLeGSCiQFon3d7mwmcPuM/zj1448lLUaRfjLGWbxMNLjumTGPeCttFlTh2PqHJXhhLizRMPkD5YTQHr1h/WV63HuUukXVWQF2JJ9waQoPYdt7gqgIvwz5e+oFyHgIqEFzTIBZrM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39850400004)(136003)(376002)(366004)(346002)(451199015)(83380400001)(966005)(6486002)(52116002)(478600001)(6512007)(186003)(38100700002)(38350700002)(83170400001)(2616005)(1076003)(2906002)(6506007)(41300700001)(5660300002)(44832011)(26005)(6666004)(8676002)(66476007)(6916009)(8936002)(66556008)(66946007)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CkrvOOyOzkbllUc8lz+Zens/8o6y4Rv30PpjAN5YDm2VGaej+RmsTSnJMUmb?=
 =?us-ascii?Q?te+G53jOGTskdGshk8t6hVZSUSaaFNC/xThv5q2+nQB+n4PeMhXQ7kRDP41F?=
 =?us-ascii?Q?kaavpIi0QX+HOsFeRTDbMgZmXjrx9TcgYvOKMh3KUZQuJT+F70wZ25l1YHaP?=
 =?us-ascii?Q?0oyhl1Th8Kywcj8tSniCCnPcnC3LKnSfBPmRwFKFFG0JN8f3hTwBzMLxN57O?=
 =?us-ascii?Q?7iI0JXS6gwVG0iS6blFuTXRBrhyzLkf6aZowj3a3sElFE0oONVFRnA1hb1fa?=
 =?us-ascii?Q?HYKGk6CiexxZlcmeLDjq6AlUaswf5sk0BtQDqfJXLwdq7jbjXZL4d4FoBxCc?=
 =?us-ascii?Q?LK5qarcfh3cWAGjrx8sudLaYNKqArY0kw7NjY4C1xe8W9yAgfVNVO3cbxhKU?=
 =?us-ascii?Q?Yi7TMP+vruBluOAL9YYI7H7j3ddWbb2Tz/HYL5+xRmgrsw2g94nmiui4Y/II?=
 =?us-ascii?Q?DBeNpD6KBmahOMrOnR81bCkvCpH59CzcYJsHbi+Ak633lWC+GG+IR631qwus?=
 =?us-ascii?Q?Xlo6oG/2CDxogEJh8RG0y6Sx3169127/z9diWAl19Mr86hlnUvGL4nptXxkw?=
 =?us-ascii?Q?hpn7qo7PsTkWOyIUuebWDgPU9PQqaJTIuKhVGoO011zI4mWHyh/kkVNF4oJ8?=
 =?us-ascii?Q?myKPdMmH2vKiLCd5muCN1ViiYs0v1B2T7K3V+6w48Sa93gGwYY+Tf586zDUP?=
 =?us-ascii?Q?BHKeRP3aQOy0Yl9aagvHF0Q16XdM3vCheM+kb71w1J1+lhzLcMEVL+3oEO9F?=
 =?us-ascii?Q?FGq0BKOoVATizD8RYc+TDQkVBXKO27JfZAzqUIjZTQESAA40fujezk1WsWN/?=
 =?us-ascii?Q?d/TpAwyxAvJVvAoB5AmJx4ZapOJigJGIJTQsN4TOyHAdF9MpG+kOhz3uXFN4?=
 =?us-ascii?Q?WPhkHxO83JsCeOeskalWVr0xQxUHnDN5aEvRhKGVX0YTmZP6S5ikH8aZ6ElJ?=
 =?us-ascii?Q?bRfW+VH8DcnzEwWnMDRQU9iqID8cLTvzBUQw/7K07N2iFFtTDXpJ2ImuZqOU?=
 =?us-ascii?Q?q/YU350OELuv7jo2UXOA8Ei056SHePFpk9GhqzZjFOs6RYMMvHpaw71ITnwV?=
 =?us-ascii?Q?r9KcCEOABIdyJyT1xm/w+r5bxxArmNjZQYfJvtCaWdM5LmzcphTYndIepsdW?=
 =?us-ascii?Q?RIDnU7sCpb6Js1guviAl+3yz1/QwzueQ9tpq85OwwFsFZI8OLkaoXRS6F3sK?=
 =?us-ascii?Q?MpNzptVR50qWhiYYLSHAgNzy40i68ijMGqlnHBvPwB63zyWuXs7P0DXvUYfF?=
 =?us-ascii?Q?GUltRrawaofGsELSIP0P+n9GiFJ9mJIu4uhdRLwqb1oLtylAPCSSMQevlsjl?=
 =?us-ascii?Q?p7HRCWBleVVR2lAz88f1wP5ngkfs9Tv2PGTrSsZb2akoyhoWU8Xafs+pdZnw?=
 =?us-ascii?Q?KsySAm0JD20KQ6Q1TR834swCZTSrE9k74IaiI1Wgz9EKe1pQTlFFVAae+jIv?=
 =?us-ascii?Q?bVCtNDOmml5jAZLj4RcNrzBRevh2LPsitoGy94+OjUKvR736ES2kiCLlN6nr?=
 =?us-ascii?Q?otGkuXv5nQXiw3VmWhqLvrfTGmliX9VyCx6jIjmJBIGYUlwktzvktyQPNh/P?=
 =?us-ascii?Q?7lt2v3p8q6oBRg6C10NS8NB70/Xj6LY4EO3PDD+99KA5EFZ3RurtG/eW0D6x?=
 =?us-ascii?Q?5Q=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f51824-81ee-4228-d7e4-08daf8f48a74
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 01:37:20.7797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ObdlO61QFXFiPXqBSOlcpdJC0Me0SirVtJhs0BHFpIWR2ARkAIvD5hjSjYAdMN9AQO2bWP3FRsyZ6jKYYu7u4Xue5LEtbfUcaJX1eHrOZmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7140
X-Proofpoint-GUID: XaRzM1Sd6V5cFCw51oHHC_yE2-Y1YNJy
X-Proofpoint-ORIG-GUID: XaRzM1Sd6V5cFCw51oHHC_yE2-Y1YNJy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_11,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301180010
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 18 Jan 2023 01:37:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7816

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...ching-an-incoming-CVE-CVE-2022-47952.patch | 76 +++++++++++++++++++
 recipes-containers/lxc/lxc_git.bb             |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 recipes-containers/lxc/files/0001-Patching-an-incoming-CVE-CVE-2022-47952.patch

diff --git a/recipes-containers/lxc/files/0001-Patching-an-incoming-CVE-CVE-2022-47952.patch b/recipes-containers/lxc/files/0001-Patching-an-incoming-CVE-CVE-2022-47952.patch
new file mode 100644
index 0000000..d5a02f4
--- /dev/null
+++ b/recipes-containers/lxc/files/0001-Patching-an-incoming-CVE-CVE-2022-47952.patch
@@ -0,0 +1,76 @@
+From 1b0469530d7a38b8f8990e114b52530d1bf7f3b8 Mon Sep 17 00:00:00 2001
+From: Maher Azzouzi <maherazz04@gmail.com>
+Date: Sun, 25 Dec 2022 13:50:25 +0100
+Subject: [PATCH] Patching an incoming CVE (CVE-2022-47952)
+
+lxc-user-nic in lxc through 5.0.1 is installed setuid root, and may
+allow local users to infer whether any file exists, even within a
+protected directory tree, because "Failed to open" often indicates
+that a file does not exist, whereas "does not refer to a network
+namespace path" often indicates that a file exists. NOTE: this is
+different from CVE-2018-6556 because the CVE-2018-6556 fix design was
+based on the premise that "we will report back to the user that the
+open() failed but the user has no way of knowing why it failed";
+however, in many realistic cases, there are no plausible reasons for
+failing except that the file does not exist.
+
+PoC:
+> % ls /l
+> ls: cannot open directory '/l': Permission denied
+> % /usr/lib/x86_64-linux-gnu/lxc/lxc-user-nic delete lol lol /l/h/tt h h
+> cmd/lxc_user_nic.c: 1096: main: Failed to open "/l/h/tt" <----- file does not exist.
+> % /usr/lib/x86_64-linux-gnu/lxc/lxc-user-nic delete lol lol /l/h/t h h
+> cmd/lxc_user_nic.c: 1101: main: Path "/l/h/t" does not refer to a network namespace path <---- file exist!
+
+Upstream-Status: Backport from https://github.com/lxc/lxc/commit/1b0469530d7a38b8f8990e114b52530d1bf7f3b8
+CVE: CVE-2022-47952
+
+Signed-off-by: MaherAzzouzi <maherazz04@gmail.com>
+Acked-by: Serge Hallyn <serge@hallyn.com>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ src/lxc/cmd/lxc_user_nic.c | 15 ++++++---------
+ 1 file changed, 6 insertions(+), 9 deletions(-)
+
+diff --git a/src/lxc/cmd/lxc_user_nic.c b/src/lxc/cmd/lxc_user_nic.c
+index a91e2259d..69bc6f17d 100644
+--- a/src/lxc/cmd/lxc_user_nic.c
++++ b/src/lxc/cmd/lxc_user_nic.c
+@@ -1085,20 +1085,17 @@ int main(int argc, char *argv[])
+ 	} else if (request == LXC_USERNIC_DELETE) {
+ 		char opath[LXC_PROC_PID_FD_LEN];
+ 
+-		/* Open the path with O_PATH which will not trigger an actual
+-		 * open(). Don't report an errno to the caller to not leak
+-		 * information whether the path exists or not.
+-		 * When stracing setuid is stripped so this is not a concern
+-		 * either.
+-		 */
++		// Keep in mind CVE-2022-47952: It's crucial not to leak any
++		// information whether open() succeeded of failed.
++
+ 		netns_fd = open(args.pid, O_PATH | O_CLOEXEC);
+ 		if (netns_fd < 0) {
+-			usernic_error("Failed to open \"%s\"\n", args.pid);
++			usernic_error("Failed while opening netns file for \"%s\"\n", args.pid);
+ 			_exit(EXIT_FAILURE);
+ 		}
+ 
+ 		if (!fhas_fs_type(netns_fd, NSFS_MAGIC)) {
+-			usernic_error("Path \"%s\" does not refer to a network namespace path\n", args.pid);
++			usernic_error("Failed while opening netns file for \"%s\"\n", args.pid);
+ 			close(netns_fd);
+ 			_exit(EXIT_FAILURE);
+ 		}
+@@ -1112,7 +1109,7 @@ int main(int argc, char *argv[])
+ 		/* Now get an fd that we can use in setns() calls. */
+ 		ret = open(opath, O_RDONLY | O_CLOEXEC);
+ 		if (ret < 0) {
+-			CMD_SYSERROR("Failed to open \"%s\"\n", args.pid);
++			CMD_SYSERROR("Failed while opening netns file for \"%s\"\n", args.pid);
+ 			close(netns_fd);
+ 			_exit(EXIT_FAILURE);
+ 		}
+-- 
+2.34.1
+
diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
index 9cabe05..a99d7ee 100644
--- a/recipes-containers/lxc/lxc_git.bb
+++ b/recipes-containers/lxc/lxc_git.bb
@@ -47,6 +47,7 @@ SRC_URI = "git://github.com/lxc/lxc.git;branch=master;protocol=https \
 	file://0001-use-sd_bus_call_method_async-to-replace-the-asyncv-o.patch \
 	file://dnsmasq.conf \
 	file://lxc-net \
+	file://0001-Patching-an-incoming-CVE-CVE-2022-47952.patch \
 	"
 
 SRCREV = "133aa416ca2a5996090ec0e697e253646364d274"
-- 
2.34.1


