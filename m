Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09FB3C74A5B
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 02:49:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.16400.1680144563878470194
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 Mar 2023 19:49:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=MAIJmcPn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34532b16d4=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32U1ukBn031090
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Mar 2023 02:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=ulhld9WmfwL71pZ2VqHQJ2y7w0w+NnpaX/Wuix5OqYo=;
 b=MAIJmcPn4sbiiJbyXvtDHa0dXaVD34XfPZvhxs1VFBMI35/ks1pTJWQ+yDuMg4l+h/Ou
 gYmV5wNEkMpMxsgyFYV3rRW0W77FhZhjmDPQ4ymPFhHXZkPMriPYC07499scxHSG56Lx
 jyhKWRDT7qnha4UMBiSObdluoH5oI/2fRmNAomHCM4BNTu9s6fjoYm0apa2K3EzIz/go
 emGgUSmwRvR4KIY62CFmj8AEvSbDvhfCUfp+043e8MzleD0Upp6NacKu8U6kpH5ka2gP
 8A642/m7Lg6940Ney6gq5iNtGDKfEfkqDDvBuHkf81TcAzOyZbSpzCtVzPO7FiMM/OaU LQ== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3phqxbwp2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Mar 2023 02:49:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIx4qKjT1vw8yk+VGrIcE/roJIp8JKqT/ItAtjPfeHxlOqdhnYiiyREDt3RfcRs8pnw/U7+uiAzQLsb7J0OO7d++QJ213N3Le4PDemJoepv1VWF9aiiWBhtCIUGHPkxdcj5bUmBBXOkJ8sageZctN5mWGQSaGSeopETuil7b5KeYU9AZoaHY1PSSduoD9bvWjt6ctCN7Xeru0OyZPf03t1ybxg3IljKIncHDVZrqaDbsDv+eVp+be0ZFE+EywU9W+SYP+TFDdSVMHI+t1rT5yTdIz2J+S98yH6gTcKQGhOlAHpYA8SMGj2P+vi74MQA8zcWFI1jjLq9NwiDu1IJPMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulhld9WmfwL71pZ2VqHQJ2y7w0w+NnpaX/Wuix5OqYo=;
 b=hqyqi7uhZYOjQ8jOSqW5gt6PUm3q2iwzPpj1ehSgBGiOzCSLr2AoCUb0SEfvDPsX0qirWdfwp6g5gUubHNiMDd5EsSg4NfUsQyVlXhHusTKFGCa+7jeHp8fC/pVXF+KQIq/WBokXAYRo3mcioHZe7LXpHRkKCB+AV9nmJlg5MTHPh3muA9BDPBY7hw+884UE1g/vaVpiFnQn7zszHFzA3TKQZ0jCe18KN1Qhf0Ea8OgQbsOjSHuSHoOMMG3VINirCqBmIAorzr9QIyCbjSb1uJO5uPIKCd2qtvuTiQcrDXh2EFm+xDJU0rPoo4r2S5ckZHDPQHVydEJzAr0GnLEPCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM4PR11MB6066.namprd11.prod.outlook.com (2603:10b6:8:62::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Thu, 30 Mar
 2023 02:49:20 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95%6]) with mapi id 15.20.6222.035; Thu, 30 Mar 2023
 02:49:20 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] runc: upgrade to 1.1.5
Date: Wed, 29 Mar 2023 19:49:10 -0700
Message-Id: <20230330024910.40124-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0136.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::21) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DM4PR11MB6066:EE_
X-MS-Office365-Filtering-Correlation-Id: e2238430-3b4f-4bf6-e257-08db30c95ca7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ODCq+sTnMaUSoCAqUFbC4vshEcz+Dtxp+jx5TngmNgxocjDEzsiwuyTcDWWUAXSXEa48g+8fE+waoJ+dtWEPr5yPhYxv035RfGUt6aIbDjW5K91QjpuFgrLQB62WentCGzd00hUS3yy7U5+Uj4nMwA4H9O7B479nL07vNUTNRN18iM0KyhE58So+RB0O8NaslvdCuJJ3nVoVaBjBPI8FAJoEu8E2wsS2SLrCi8a+83QHn351rYQ8s80omUoEZo4zdXpSnky2QBFi59dktYaa5ft6gemj9aVarkbfswcnZlEMvm4y++pI98xhHCnLcBu+oR10syaKTq4RSDl84ou2B6wJe1Zkw/b//z2QVlV3QQTH/68SiM6pA/MsUuIKmG5W3EslN8Ospny+heHld4roBNlPI3s32fM/diCYYNrz77FIUaw3oiy8E5cD5JwFSkOcpgmRh0Pf05tZ/2IsCJc7oZYP2tJtKB47XClw+diRinIll/FPunVF0ilQGBNhEcWHpzlSSF4QxNZ2Cs40k1Px3rv1m57PvzsuvLPONMdUVIN9EUTyNtVvc4l8GhVxizf4zyB/KtU/X3xCmB44fqMGuWPS8P7axwVGg/7BJ30JNx3ODZUVMlSqrLWeQ1p8yxua
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(366004)(376002)(396003)(39850400004)(451199021)(478600001)(6666004)(83380400001)(6916009)(66946007)(66556008)(8676002)(66476007)(41300700001)(38350700002)(2906002)(5660300002)(38100700002)(8936002)(86362001)(36756003)(316002)(26005)(1076003)(6512007)(186003)(2616005)(6506007)(52116002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ByXnqW52G187BAfbh5ej+R7Iv3dBDFR4GruUEEgHC2avfi/fiF74RC8yiII8?=
 =?us-ascii?Q?yiXZykeSBio2FfXi9A4MnXJu4utSgGps7y8FTfFP2g0Y1xqmaNvGr9KLjlOy?=
 =?us-ascii?Q?XCnTJObOQDL8Wr+PXIBnCdc58tkPYHZJcTSLWGsV7oW78qt2f/tCq3ysWCFH?=
 =?us-ascii?Q?2iyAZz0ZGaVmhDVQpkKIE7dNS+Niw1muqdrjYBgZ6zXt44aaxVpajief0div?=
 =?us-ascii?Q?o4QlWbjMCudra5GA9RRjUeC7OPqiTok/qgKuUSNVExHcF2XMjSbw6cFMVjPP?=
 =?us-ascii?Q?TgEdyP/8z6F3/sLZyLEi6rwWXuDJ8Lqvr/uEVGvheCKkq1gnB5EB2AvXnjyr?=
 =?us-ascii?Q?S805TEd+rALRUcxqsV4BtbB3le2YYZskDOHot6+m3Lx+J1X3u4naf6SOjJMF?=
 =?us-ascii?Q?g+S202KGwVAJKJnPcA4YyZaPNzB9ifabOz+SFGjfs2tOeu7OBM1ddS+p11Al?=
 =?us-ascii?Q?dLaejj1nJAfUbPiKvkbC8mc9DjEN3QMw/n2lJa+rzpiQV0wrkFEwNedzhRfD?=
 =?us-ascii?Q?xd2z+oNErY7E5yfzeoxAiAebNr87kCIH0Pc4ErvTgcLGpawS9upmEF9Z1+jE?=
 =?us-ascii?Q?CHER7wgICct20IChoSp5u7jYmrS1TbuCvLsmBcb5ocDEDA6horI6s11OE2i9?=
 =?us-ascii?Q?xBcCWndQ13bu0uFvYY+90Owm01fuZVQb0tjmaP9vFUTMLWKrkuJRbI3MByLH?=
 =?us-ascii?Q?IcTcLEPr8NRIyYYt7JnGc2kYRFb2hwBauqChLRLTChufCiN9KMtfN0kX7wol?=
 =?us-ascii?Q?fZrtUGFWySZkM8DvgjSUDIwTyAjSff5iZhCRlX0slE15oCGauZqyMODnLbIa?=
 =?us-ascii?Q?hHaGmTyz+t13pyw9Rqdl0Zi1j8RZ2sCuR47Yqzz6Ueb8PRFHBSjU0AEK/93w?=
 =?us-ascii?Q?4uWwXVSMcS5D3y1ZS8FEHwl5OSjyMiQI1VUt2ukM4+hYZqivhrhBY8KPdzlt?=
 =?us-ascii?Q?2nVed85rPozr1Z8tAug+wARFgonF2oLUZwah3AjNPcRxIt7J1A7PIJWL3xc8?=
 =?us-ascii?Q?wRQepYkAjgpYvh0fSck4Xa+2IBLGxtZnwRwR7feNfoVo936E26T9EbEAeLPi?=
 =?us-ascii?Q?cAzNYRoXLBuu/KbaDg9A9aVYsdfAzUroIXoPNrdRQuvLXYIVOTn6OPsx+94M?=
 =?us-ascii?Q?j0VdV3HQT6Cz3Ee6NqCGjsU0DFwr7dUlDHIWP7A3L+mamg3NE8zLpVElj75O?=
 =?us-ascii?Q?pSQBjG86tPJLXCCmMW9bCkillHlRW1N58eM/uXvzY+RRUsZ0w1+ZyXWlK5Fh?=
 =?us-ascii?Q?3AWnkizleqxjcvtP9O0GjhwGiySw/YYewhnbehGwLn5nSPrS7CtfnoJKLhuL?=
 =?us-ascii?Q?L+CAksEireuzIu/KCOCzVX+F/UxmPelUgbYa3qv2bzNZzw+cvXeXRmXHKGuh?=
 =?us-ascii?Q?QiqfVpZmiusoYeDB2kgDYbZ4aiXhwPF9vV2cuSZfeUwCsfBdBTra5JRHwTId?=
 =?us-ascii?Q?JZujFvUPoJVzfXlpvvOkEHO4evRtwxy5CZt9J6WKHpA/DPPhtor/mDZ+alta?=
 =?us-ascii?Q?JHFWwkToGWjhfMjUA/avhHEPjJRIfOqZKwAbVq+vx/jDWgLIA23vHQfqmtFM?=
 =?us-ascii?Q?sQjPQ7R14IdtgCIDgUO24PoemVzgeAXsIUcojL7H2DaCO8vY3rrEHuFS6ji8?=
 =?us-ascii?Q?+w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2238430-3b4f-4bf6-e257-08db30c95ca7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 02:49:20.6052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: extH+LSnmpfz7yF709OdMR3csNjYUIL0pz8bGjjh0pLnrlTgONRKkee8BDGljrteMDEum34jftM3LPZ50qv8OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6066
X-Proofpoint-GUID: zDxBLRH0dIueyFwxlyqKmJc54-bB_VqZ
X-Proofpoint-ORIG-GUID: zDxBLRH0dIueyFwxlyqKmJc54-bB_VqZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_16,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=388
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303300019
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Mar 2023 02:49:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7967

This upgrade fixes a few CVEs:
- CVE-2023-27561
- CVE-2023-25809
- CVE-2023-28642

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/runc/runc-docker_git.bb         | 4 ++--
 recipes-containers/runc/runc-opencontainers_git.bb | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
index 7288ef0..9bed441 100644
--- a/recipes-containers/runc/runc-docker_git.bb
+++ b/recipes-containers/runc/runc-docker_git.bb
@@ -2,13 +2,13 @@ include runc.inc
 
 # Note: this rev is before the required protocol field, update when all components
 #       have been updated to match.
-SRCREV_runc-docker = "c6781d100a73d2dcef84e9376d85fff02235a2ed"
+SRCREV_runc-docker = "f19387a6bec4944c770f7668ab51c4348d9c2f38"
 SRC_URI = "git://github.com/opencontainers/runc;branch=release-1.1;name=runc-docker;protocol=https \
            file://0001-runc-Add-console-socket-dev-null.patch \
            file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
            file://0001-runc-docker-SIGUSR1-daemonize.patch \
           "
 
-RUNC_VERSION = "1.1.4"
+RUNC_VERSION = "1.1.5"
 
 CVE_PRODUCT = "runc"
diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
index 8d56ffc..235a01b 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -1,10 +1,10 @@
 include runc.inc
 
-SRCREV = "c6781d100a73d2dcef84e9376d85fff02235a2ed"
+SRCREV = "f19387a6bec4944c770f7668ab51c4348d9c2f38"
 SRC_URI = " \
     git://github.com/opencontainers/runc;branch=release-1.1;protocol=https \
     file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
     "
-RUNC_VERSION = "1.1.4"
+RUNC_VERSION = "1.1.5"
 
 CVE_PRODUCT = "runc"
-- 
2.37.1


