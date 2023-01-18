Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A51C38142
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 01:30:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5008.1674005391208356046
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 Jan 2023 17:29:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0382714a72=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30I1MgVd005173
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 18 Jan 2023 01:29:50 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3jx6kjkf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 18 Jan 2023 01:29:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IDBa7pn2HEEl602FIpXeW7jQ4KmjJZJGXlGuGwDA+sCiJPDYmvrAKxVUsb5tXUl2pFbkVbXsoooATDJTY6taCC4Gi9HHP+7u+KtMVJb/nKja3kg1l2efXWN1KAf+3OQ54WDd0Pp2rid5uD0xgSYaYogEdYDliFTKt+A1vilyzzNOe7JOOVemsduocjp2H1VxzOMbDV+VpIPoTVaBmBjhnUO1SR/ow3TJgTYGFK1zqXswnC12ZhHBWDhdwedMDm2FgOYyWdQkLGDkzK/RaIVgQ0CNTjE8YY84gOwaNphaIFTsv6+tqjvYXhkhAOww2e7bkZ/rk+/IB7fCgGnFN4OjNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnPHnYAZ5IOLvCV77915+zjVd3jNd83dslpwivoYqNY=;
 b=fEegW6dareZN8vSozu8mCyjSlHoT/RMSVLKxT8Nwz38RlwwcBZvdzO5lxdux5d8SWDjVyzQzPiLET7fSmaGfCJ4iFbI2+sQLXSH3xSVZILwGKZJ0PaMTQJAPwZge+uP5eFutewCAnXakjEdjPDT+fyNmmhctw2oViFxg/+fitf/ASnWK2UENOSY30vx7N0XEKc7Ib+9g0Qn5rugNHqkUTKDhsu3aOii4HuYGXee/HZyDlJUn+3UIX+MHoxjCl4rRzr35zsHuf4iPaQXi5qnOyXmTqCVcrfPG/F1jvSliVjppDfILWhZsKm++9GTSh97XzM2En58W0rrm6cHJk9sudQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by CO1PR11MB4930.namprd11.prod.outlook.com (2603:10b6:303:9b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Wed, 18 Jan
 2023 01:29:48 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::39df:478e:d974:335a]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::39df:478e:d974:335a%8]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 01:29:47 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][PATCH] lxc: backport patch to fix CVE-2022-47952
Date: Wed, 18 Jan 2023 09:29:27 +0800
Message-Id: <20230118012927.2347896-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0014.namprd10.prod.outlook.com
 (2603:10b6:a03:255::19) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|CO1PR11MB4930:EE_
X-MS-Office365-Filtering-Correlation-Id: 139b8228-0957-45a1-e262-08daf8f37c65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cYsXYqj3Sxdsvhmklr/yJ6AWjM1mYBZvQizNfuQyDnPzWkbh97xzAe+aZiwts6hkbwhG8Nkeyr5BHO9ljiAi6+bD/K4cn6hTYdYZu1KHH1OZ088tC0hDUKGiLaPOxlRBrVrd9UZLuK8JEVDr3XviLWB/84oJQnux1da1i6GYBsd+KTQePlgRF+RtcTDdTcsZXAsH0c1ksSrwpaqfAZ+kmfRNLsyVUf7sIWUZhiHKN3O9qdAqUSnlXTQA6Wq+SDhfnBmaTf53hgiUOCmsJnUNk0/L/9KxtoGuRBxumkV/FjrDCGTqT2TlFHcqDn7+n4BqNtGLdj/CeUFvBhfuUSDtHAwX61asc3gClnJIkS7oX5zloQxRDJI8niyavBX75Ydy0jUWVVRUzVorZaZvdGfifx/leJH4ch2A7Z440HozkHBrmoK3pe5r3nZVzbzldX6Q7aSAxIzcmjopcCnYhDxKEhNfPR//JxO9095lvm8zpeqxBhi2u35DZPpHuwXOuRjRGuN1vqYDRawkTMWX00WnAVlujnZyqjaIXrOn5KUUwOXmrhSfhu3OMwmo4RJpGL3lPl8giJNBzwNBHq0w/9qMl/nKGmoM9JCMgppalKQDZaGOwu+oJ+jP+p7uHBaxzXCWTdFaIr/kPEWPFy82nTLQuSzQOj8dVMQ+xgt8nYd6hrsnDgbyofpPWcA4h8tdpyNMaNCSAY/AUquyMxtmpkSfK3B1zJgWNpiY8qPyZ6r2hCQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(376002)(396003)(136003)(346002)(451199015)(83170400001)(8936002)(44832011)(66476007)(66556008)(66946007)(5660300002)(2906002)(8676002)(6916009)(83380400001)(38100700002)(38350700002)(6666004)(52116002)(316002)(478600001)(966005)(6486002)(41300700001)(1076003)(6506007)(26005)(186003)(2616005)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JMRmFD9oSP5xpnByEbkquYIquvPsbgTBejjNEigkhg7YFe7iYYdFS2bXZxtr?=
 =?us-ascii?Q?pH6hOo8Y5kD/OxHKNCe/qp4BGVcTEesbYrGKlDs3C51du4OjXwgGApbPv6WB?=
 =?us-ascii?Q?bICKhiTZIKt+ZQNf/vbZXE8OGAKm1swDrPQbZ//pqJhZue9v0MqO6x0hyQnu?=
 =?us-ascii?Q?FaqfOXuHZ5BtyZpLnbjYCUKxUAr9nOA+kkSo78MUF34LVGV6IMjQYBNY08S1?=
 =?us-ascii?Q?rT5X9ZEZ7OpUkX9KAssQ2Op+ZytDbnncggPA+W2U6nGXiNfixkT/RcAsmmoS?=
 =?us-ascii?Q?u3RE+MfunZxNwNB8aVLnE5xbKbb9V4y+rNdjRzNwGzdyx2idXucyaoJfAHPZ?=
 =?us-ascii?Q?2mSk6d4Y5sBnPPLq0Hk5KHN6oNc6R5xlmZyX9L2XHGzunXtRkufxHmPkS0gQ?=
 =?us-ascii?Q?4UR1UE0bIFHwkzyGwX3lt/7MnkBlfbqBF+r3XbqIETNzTZHagLUJ3F+5/wAZ?=
 =?us-ascii?Q?8sZylQ4traMMuZnfCe6J+l19945TGs+qSS2soRcSIvV87PaFfQXI5aZzoJnm?=
 =?us-ascii?Q?bmNZnVTIiUBM7f6iabVkoePPK6a7ENb1KlyfdtML5h8YaCh/9kYzdSMqR4xt?=
 =?us-ascii?Q?kQrIhYVaY/CZptPs2ReB8Hj6I7JWdh+iNLYIoXR1lf9ui3ZtCBfX800SCzv1?=
 =?us-ascii?Q?a44+TeAYAKUXRa4yI+uITl6Z0ly6Ogz99s6wHg9mnPacJBfnt+SGru0rJDcy?=
 =?us-ascii?Q?kvKVbo11U0eAEx+/rUJ+m2JiofK2L9Sp23+mZNqwPln63BvdhS1fEo7/V72F?=
 =?us-ascii?Q?oF+YTnJWN2+wzXivT6Q5MU81VR3VzOOY8GxNRg7WVp2q2P6P8Rb7luQw1c84?=
 =?us-ascii?Q?eys0jzAK6r8JPwKUsfB68WMxqC1irBTFqiYCU6sL5FVjRFlQIICsLcmTn3GN?=
 =?us-ascii?Q?ibJ5jgo539GKVKDNj+Fj0Mteyz3tW9xUCEoqWm0fBSt9Sg8M9kJr0i7JV39P?=
 =?us-ascii?Q?pGcKCS6YImR5sLbLB8KtEG/KhxRPsvw0Q8aGGZpG6nHsb1gMMMLFOAPZcc7Q?=
 =?us-ascii?Q?bTx5nyzqIF7NaHg3Qoxjv3mWD13/NCXjfMZwttX1kTmpxM+8VuPbIP0A47G3?=
 =?us-ascii?Q?oFAfMSntYdkBWdV4NCwwTiqQKLyN76NxMNOpdMaK4Igs6aUb4FExGAzne6Hp?=
 =?us-ascii?Q?kkqAfPtCpaSntRQb6erP54OyBZoCcc90aoxz6nPvLxss3UqUnDbuYYQBO+OA?=
 =?us-ascii?Q?w7THU7T8BbCB/1FUZhw0JrlaFsOfdtDAjdioArWmHWWqfDubyoj4zKT9LgmD?=
 =?us-ascii?Q?SBKlwY8ki1KyuVNICutjaSlTgFTsa2YPB5hlDaek6H2NoBtgN0l2thIj+lAZ?=
 =?us-ascii?Q?N+MRQpnFkFEW1qWmR7jSWrDO8BfkM2rmHEz3PxQMd9SA53swzGbFucd3bSER?=
 =?us-ascii?Q?WITkfZ46bqeAyThwLTHn7k/GgxoM7FW3sTWXvgY5brLXKnEwoZ2JmcwrtPdC?=
 =?us-ascii?Q?y2FwgsgXtVYeBh4Yeg7kHjzlcOZDEZhyE+r/qZGlM9xPO+57HrWsDzxBrHaf?=
 =?us-ascii?Q?tHPgCmUUeLpOho0ejMgdZbOGq3FZDCFM3yv/66JeOSNUQBBKAILZmTi/9EPX?=
 =?us-ascii?Q?zdMOTKEYfQ0Zqbx0+JmeOT1okWDDCdndExL+sYe9jbfc/4XzV1Srluwuuccz?=
 =?us-ascii?Q?YQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 139b8228-0957-45a1-e262-08daf8f37c65
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 01:29:47.7264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TPUtGcw+0bhzqJ8nV4Vp2P7ip6A423FF3ojgvF5CrQfru4w/1dBAj8OExrMyeC7iTgMURjtN82nbhkjh3dFyORPkAk5LVai3o8pug/6LZn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4930
X-Proofpoint-GUID: K5VGHH7jvUWrsC_hsjFs1Y2stz1L92f4
X-Proofpoint-ORIG-GUID: K5VGHH7jvUWrsC_hsjFs1Y2stz1L92f4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_11,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301180009
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 18 Jan 2023 01:30:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7815

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
index cecb591..71dce7d 100644
--- a/recipes-containers/lxc/lxc_git.bb
+++ b/recipes-containers/lxc/lxc_git.bb
@@ -48,6 +48,7 @@ SRC_URI = "git://github.com/lxc/lxc.git;branch=stable-4.0;protocol=https \
 	file://tests-our-init-is-not-busybox.patch \
 	file://dnsmasq.conf \
 	file://lxc-net \
+	file://0001-Patching-an-incoming-CVE-CVE-2022-47952.patch \
 	"
 
 SRCREV = "5ba5725cb4a210c25707beeca64fde5f561d1c71"
-- 
2.34.1


