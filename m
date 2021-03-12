Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.41])
 by mx.groups.io with SMTP id smtpd.web10.5503.1615537608947165871
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 12 Mar 2021 00:26:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YbdZJNfk;
 spf=pass (domain: windriver.com, ip: 40.107.244.41, mailfrom: daniel.dragomir@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCJ9GEtdQeUvBe+v8jQOs8Uz/XWjsBr+aY1A3AQi8MAPawFeX8SaZx8vRGZEUtfb3P5blJf4jNTK+lJMMch7Sud4CzS+hg9mnpLF0n4CO4+pRIyKxfOGacY9/miCwNI/YE7WsnGZuqallvjKPaYo2UJQhZcLt9mW4MiRDSfZ9BdKssztArmwJDrJvtaLZTTCfrP54HpAV2fVACmfrMR/V8tq3c097ujplM0kTwTTmMauSF4toU6deCXEa42oLX0kge5FafLfQ7HGr5KZPI0Cr5LggImXWW4kDga0IMtG2Y4YpFO8uqxF848Xu7cpUh+DA9BzjEsaeXOuZQaDxmW1kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhNw2YT5nDZMsakmVj6kBvRlwrmSHhqayP45oieez40=;
 b=H5XAIZyJ8etqHHZH1CZk34Yt+NZPqx4Z3AEILsITqeDt79Z8B5Qvfz2lqZXv2SfrfD14BGlJNP+epKrQdQCUWN0HJ/1AlF7fRbqyG8FwXZY3WoRKOAVUcRAVVALn/a6hwvOs4oyuezyz/JxmkrnuHqQGs4cEeO8sskYUbdqSSXwqxaubJTiP6X60xYjYy84WDLpwP+JznnpP+qc1r3NilVJgEE7EpIsrA17Y8ftJvIrxLXXm3U82afMG4wdI/TQ/gLZxFnSGHSk3TKhVCr5Cnd8CdQfl/jkkR3beNpLXdK7QJ1/vbnaHrC/ClgaE7wfCAkEiFNDhtWrhb2IGmV/x1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhNw2YT5nDZMsakmVj6kBvRlwrmSHhqayP45oieez40=;
 b=YbdZJNfkK2nu/4LL0AvdkT0bSIDy5FJqhvP79c8/lhaIW+g23xgIPJfokZ8XJVpfV0Wq80TEZJc64VboI4icMwSdnsmKgcmc5xnVPQISMe4SZnVNMZfqp6ykEFgZkzCBe+LAM1jgY1xyD/gvx8BFx5poDXwd3+VEC2dRQZXqBiw=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3077.namprd11.prod.outlook.com (2603:10b6:a03:90::14)
 by BYAPR11MB2853.namprd11.prod.outlook.com (2603:10b6:a02:c8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Fri, 12 Mar
 2021 08:26:45 +0000
Received: from BYAPR11MB3077.namprd11.prod.outlook.com
 ([fe80::6cc9:d566:d792:5ab2]) by BYAPR11MB3077.namprd11.prod.outlook.com
 ([fe80::6cc9:d566:d792:5ab2%5]) with mapi id 15.20.3912.028; Fri, 12 Mar 2021
 08:26:45 +0000
From: "Daniel Dragomir" <Daniel.Dragomir@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] lxc: Fix download URL from SRC_URI
Date: Fri, 12 Mar 2021 10:22:04 +0000
Message-Id: <20210312102204.58721-1-Daniel.Dragomir@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [46.97.150.20]
X-ClientProxiedBy: VI1PR02CA0048.eurprd02.prod.outlook.com
 (2603:10a6:802:14::19) To BYAPR11MB3077.namprd11.prod.outlook.com
 (2603:10b6:a03:90::14)
Return-Path: Daniel.Dragomir@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from otp-ps-s1.wrs.com (46.97.150.20) by VI1PR02CA0048.eurprd02.prod.outlook.com (2603:10a6:802:14::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Fri, 12 Mar 2021 08:26:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44533a7a-6b4e-4d8b-04df-08d8e5309263
X-MS-TrafficTypeDiagnostic: BYAPR11MB2853:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2853CAAFB9E33B00EB0989B0F76F9@BYAPR11MB2853.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UeSLHyLV/g4W5MhXvvjSHM60w4K6J16hTx+eWR34d0D3hArqTdv5x3+bPato/8bX/GKKmCjT2D8IVVCwkStL6t2EeqOyjCcUwojtlpUL3sgq6UsRh5CBn8DNNrdC/P6CgFlACuPu2ocaLWGJlqqJXOQOpBZ+TsiZ634I5CwjqIiYNo8eVBQJ0Y7byCjaKiEejvsZguZBZat8hTwxcqY9JxJRNpEkmVvnhgZydEDQFCIiKCW0IFXYHWnlR1W2NVYKpc2+IRaOBsRCIYAAWFEWCcOxY2FRJ8KHYUwLRUEMyC4dT5GW4KdpTuEf+QiOedJ8NdvJCnvpzQzojnGe9tw49ZuHTlZIN2SVblsb/9YZNLgR/hd05EQ5AyjK1fJMkPf5sDdNGlZzppxsuXG0E67VCi1NlnjnRxKBqljiJBAHtHaeFAYDcZ9udBnxpZ11w9RbVglicWCJul6k2W8Z4sfU1TdYK9+IQdIIFRBamADPn9q/t4vxieM8UMp2mnNwFvovUFSVj+H1rlJSaU06IIk+2zOcoj1n+VdBnZmV511G2mCMqTAcXciY/acKgHUnhECYTrtuC56B/Wlp32eA73K4Pw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3077.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(136003)(396003)(39850400004)(66946007)(86362001)(186003)(5660300002)(26005)(66476007)(6512007)(83380400001)(2906002)(1076003)(6506007)(16526019)(36756003)(478600001)(6486002)(6916009)(8936002)(966005)(956004)(52116002)(6666004)(316002)(66556008)(8676002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?l2533YN1c86mghBk5lFCV+1lrXuKC0LzmFLtTX9lkJi8wtBCzsn8dh5Uhebv?=
 =?us-ascii?Q?aBX/q3d5xqwuwN5T/Psn6TamH5m9zdrW9bYg7zNdrVCEX+hz0Gzpu0QTR/GM?=
 =?us-ascii?Q?jjqIiEUYyl7yDTDC76HXdA/5ONjLJvQ2oq9bnpSKERfQOMjhfVHg/dTTq7Ac?=
 =?us-ascii?Q?fuRphYBa3DCuQgH2L60dp8Gs+SihQFjE61gTh5CDm3fzET42iONy/7vaMSYQ?=
 =?us-ascii?Q?O1slsoH+qSt3kFOoLH7tFW7E5+CQECaI9MT7DtZ+Mu8uW6sHMWiwQFIv4FZh?=
 =?us-ascii?Q?MU82oSN9veDC/8T5WHLVfmh6moUQBFUMl6loQ1BPBMVy45XX5r859ryvb5ao?=
 =?us-ascii?Q?Ix9aeRwt/l/6O2APgSHcdCsodH+/puNhSpN4Jpofwjc2YgvwFRgf/35yPQ3N?=
 =?us-ascii?Q?a3FdRNS8Iei+t/1AHBKmdUSI0DkrDHDl1pyacSh3w2UJUlAXEtMDgEu1A05Q?=
 =?us-ascii?Q?aUCRFZS3NAHEN7LMzrxq1ERlS2rs3+1kUI33D/DmdKwuTSTZfzslSfNbyFSw?=
 =?us-ascii?Q?Auq8PN8uGVnErFO8NXSt1+LKqi7SYqzA67l3f+8GFIdmo9iiXP7hGXdixJiU?=
 =?us-ascii?Q?Ht3jTubqmcN2rmeKI4KMmzGy41WIuXHYAruAEwbMUgcQHX9gSQMG49/gZ9rl?=
 =?us-ascii?Q?M/zs7DpaIXpqXE72KcnaSoTjJXZKx9n7NmsBjnO4q4YAbPO9brIFOGSwySk2?=
 =?us-ascii?Q?kdclTXXNvlIEXNSEZp7WsPTYtJSIq/FLKgkNWxp5Ch8gjesmq33uU0a/lZed?=
 =?us-ascii?Q?JSpnu0DpdPLNMDpq6uO6UGzUbClHAfJLCuXIGyR63IRAp92eONRxbbWQQlzC?=
 =?us-ascii?Q?C+zRld5FbVf2Mv36FJqe+CSWUq2puDM2KyuJGy9tVM7EYJNC3DdaKizcLZX5?=
 =?us-ascii?Q?PjH5wXTT4Sn2zlN2mVIysYJGqIVBWa7YEegX4R9EufPOVBpBDpAuSL+KiyJA?=
 =?us-ascii?Q?oXB1S0mBqgipB4/r/tXfl/2rAcZZHlrRG1JAKMQvYtHVEPk4ynLSw0vhB+LQ?=
 =?us-ascii?Q?z82A7o3G+mkJx387D6EgPOi/g6gi3qVcHyRHuqNuyw+4FsuAZ3uMAC7HTTBd?=
 =?us-ascii?Q?zd2pul99kzgVSRiqtu5b6ZA5N8l/tecjUz+geP4XxnuCwlMevyyTnc6OvsCD?=
 =?us-ascii?Q?8ITKHr3BVv8b834kuEfbPNNNo3AAXXiupz43LiDXAm/Equ2jtBUeZ3BmS2Op?=
 =?us-ascii?Q?oJf6YwMeoYfWk63qRXNSDi967cfEg0sj1smgKuhW6ZhwVRFDWGUL2dKP4GbO?=
 =?us-ascii?Q?c+Xh9ToXG1mR7WdQqLXPnQDruyG8ymTCnQqJPU+Nb/bmn4M/cjUL0Mpq60UR?=
 =?us-ascii?Q?mxufptfYfscZ+aVKbDjiV78i?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44533a7a-6b4e-4d8b-04df-08d8e5309263
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3077.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 08:26:45.4706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lzupW4QOogGTztFN6xmYh5HPTrTGti/RN2Fgw3Z88ksaHV+WZ8MslJi9RC65rnOQyzG0xI0Qos7jFP4WwMOTAkEzDpgtmHWkhFnD2HMbt/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2853
Content-Type: text/plain

Download URL from linuxcontainers.org for lxc has changed.

URL transformed to HTTPS due to an HSTS policy
--2021-03-12 09:53:23--  https://linuxcontainers.org/downloads/lxc-4.0.6.tar.gz
Resolving linuxcontainers.org (linuxcontainers.org)... 170.39.196.167, 2602:fd23:8:1::8
Connecting to linuxcontainers.org (linuxcontainers.org)|170.39.196.167|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2021-03-12 09:53:24 ERROR 404: Not Found.

Signed-off-by: Daniel Dragomir <Daniel.Dragomir@windriver.com>
---
 recipes-containers/lxc/lxc_4.0.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/lxc/lxc_4.0.6.bb b/recipes-containers/lxc/lxc_4.0.6.bb
index ddff9af..b422909 100644
--- a/recipes-containers/lxc/lxc_4.0.6.bb
+++ b/recipes-containers/lxc/lxc_4.0.6.bb
@@ -36,7 +36,7 @@ RDEPENDS_${PN}-ptest += "file make gmp nettle gnutls bash libgcc"
 
 RDEPENDS_${PN}-networking += "iptables"
 
-SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
+SRC_URI = "http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz \
 	file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
 	file://run-ptest \
 	file://lxc-fix-B-S.patch \
-- 
2.17.1

