Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 850CEC433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 15:32:00 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.85])
 by mx.groups.io with SMTP id smtpd.web11.27836.1644420717909574677
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 09 Feb 2022 07:31:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=jVpl4N1i;
 spf=pass (domain: arm.com, ip: 40.107.3.85, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Oz+9MgI8b71A/ElLG6w+EmKQDx7kIfY4Yfkkkc70AY=;
 b=jVpl4N1iLiGeYv+yVGNikyhAcPiJoclQxwJ47hAcxBWfLGiznwgIu4VKpoxt4gqfGz1sIJs2yWrYfW52rrF2FZG4IBUKNP4Kcska4cjRPYatWRlFs5ABs/um3Ccr0WP7rpT01N8UPGv0HrD8D/kAxir6GM7T6/jikEdZHuRmw9w=
Received: from DU2P251CA0008.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::10)
 by AM0PR08MB4113.eurprd08.prod.outlook.com (2603:10a6:208:129::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Wed, 9 Feb
 2022 15:31:54 +0000
Received: from DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::d4) by DU2P251CA0008.outlook.office365.com
 (2603:10a6:10:230::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19 via Frontend
 Transport; Wed, 9 Feb 2022 15:31:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT005.mail.protection.outlook.com (10.152.20.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.12 via Frontend Transport; Wed, 9 Feb 2022 15:31:53 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Wed, 09 Feb 2022 15:31:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ef2ca9da43673387
X-CR-MTA-TID: 64aa7808
Received: from de9225406ea3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8D1BDFCB-676E-46B7-B515-66CE6A86B917.1;
	Wed, 09 Feb 2022 15:31:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 de9225406ea3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 09 Feb 2022 15:31:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ED9+egYcovy7URKakq+tzSbwCAlWHpwIlH1mSNGwpGZJEHVpA9zi8wM/Of4FJU3v6zsDEjnslkHBY9B1JD5BklqPm2BKgdgV46q1uRvIUpqJniS5ufdP5bfLuuaOQE6TbubNp7g6FwKBy0aWdZ6IU/8SkhaAaGo4hEGe5CWZtxdA/gEuDvG9rsoQ/c1cIu7sP5i/1j3gDcnByEFKIBY/5Zpp3kfio2ykYEcYNInSq2SJ8plI5GASwmoxInUHgbyWbTAO9aTH330/qcmQLUGiUbp/P5LNHUa6+PlY5BoU/Xn+7g29sqAzBcaNp46mdqgK4vOZhq0LqTjhyJ07fl1lNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Oz+9MgI8b71A/ElLG6w+EmKQDx7kIfY4Yfkkkc70AY=;
 b=WDsPzvGhRv4rmfLhV5Fz1ljvw2Bao6N+dMqaK5VskR9Z7M9zBztpPTntoENAGiypIyfvgRuyTVQs5A/j+dE34Q1yEu3SDxtU8mWbFm8xC/Z0z31DWd4KCwu6K2cDvgAU6H5UIS6pusHBuRn66b5+5rlnTRHSJF2mgrQZaWakBq+Fm1KQdw+IiyEjZEdqH7w0eLEauFGyABuWB0/QhfXcjtSATvvgApKft5bPvcYompNWx7bw1Jv1bCxeLpVyYkuhsgxj41xv8Ci0B1vFzxcwewo7obkfW9RHCl7cRKbAGmX4ZcATZDjwMfHE2akJfAQQFvDBwXCM9lP0t2IOEIFSsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Oz+9MgI8b71A/ElLG6w+EmKQDx7kIfY4Yfkkkc70AY=;
 b=jVpl4N1iLiGeYv+yVGNikyhAcPiJoclQxwJ47hAcxBWfLGiznwgIu4VKpoxt4gqfGz1sIJs2yWrYfW52rrF2FZG4IBUKNP4Kcska4cjRPYatWRlFs5ABs/um3Ccr0WP7rpT01N8UPGv0HrD8D/kAxir6GM7T6/jikEdZHuRmw9w=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by DBBPR08MB4506.eurprd08.prod.outlook.com (2603:10a6:10:d0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 15:31:37 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::4166:e460:59da:189]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::4166:e460:59da:189%3]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 15:31:36 +0000
From: Diego Sueiro <diego.sueiro@arm.com>
To: meta-virtualization@lists.yoctoproject.org
CC: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [meta-virtualization][PATCH honister] k3s: uprev from v1.21.5+k3s1 to
 v1.21.9+k3s1
Date: Wed,  9 Feb 2022 15:31:22 +0000
Message-ID: 
 <418a985b65f8fe5aa5d2728586d0bea68bc7181c.1644420463.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0135.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::27) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 2a6e96ac-eae8-429c-c044-08d9ebe14cae
X-MS-TrafficTypeDiagnostic: 
	DBBPR08MB4506:EE_|DB5EUR03FT005:EE_|AM0PR08MB4113:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB4113A1B6235737A9D16C40ED922E9@AM0PR08MB4113.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 fc0dA7v3jMeqElPiAa0713LI4xsdSFNcDvGUSJPumxP0Id+eaPkTgrR9se0BuVz1y7uIWyWQeh+qFP5XgVQp3wbvvK79T1eGO4bljVPhe2JK3TT4yWDmCtAK2fviy3QMrBpEeu1Uhfws16/k3uhNHhQol6bPQsb/YpNZXBNBj3ZIpNMjvMfoiTm16FARnX3G7aQmTNVTXJqwK2GnoLXdBhdhuzfbr5yKlrte7ZlE0+zwFBiPPw3iVYlwM38U7adzh5zB3GJ0N022wjIXAYeXHKZKmT9uc9F5aA3aZMh2yqOyCIPWM43cQYaZOeaykxydM+clBaWkSGFrwV8Cc0jhIZQcILPC+JO53uv9H2Qzd7tZOAJpIE22NrZyqzYyUBGNMMzCh7VlN1ShrfJruUw1RcM0NXFzbsowoM6O4S4ZThFw6Iy9N4l2Blc2W+sYNO5Q9ekV3m93UaMY5iOGSGUPSth5lqnrj0FHmO+dTwkYbCsmH8ev87spGaqIzXVdDf/NSpErARUvMWql5gc4eiUT7Tbx4cZEa/V4BZGD3iYZrfOiI3NsKnYkxfYywzDAITKUes6DaY3qBHWYHRNFpdHIP9/Dw0ltX1GQTnPYCsdKXgZlkCDKAZMU3U30CxtBAhh0uFsX9XytRVFeajiTLDR2D59G7c9YmZiCswl/QECIdtpbG9Ye2ei393d5LATweudErhbb+VinZ3DC4zlmETIrg1OWd4bDQkQ2ER0w5i+xS6qRwYN8ahJVCf2aP4SiZVJT7/+4h3RGrjwbrk4L/h88mO6G5pzjO24Xh3MP97Q4hSC1gQWz020IHkoa/2hkjRlajOPD98OKWb20vJCcqkZnCQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52116002)(66476007)(66556008)(66946007)(6512007)(6506007)(8676002)(8936002)(86362001)(508600001)(4326008)(84970400001)(6486002)(6666004)(316002)(6916009)(5660300002)(2616005)(186003)(38100700002)(38350700002)(36756003)(2906002)(83380400001)(26005)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4506
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d381585a-2110-48a1-e2d9-08d9ebe1427f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vyrXQcSJ9HnMY5wKF1+q0YICi5EWGHfWI+tWxO74xoGpe9MThZOn9YhXedBR5b55Mdy8Xf01GYYDbOt39H7Ti2k4jBl81hWlSAmKFRcnBmZdD5TtwkkOd7Klr69DLbGdol4Xlz0FBmX9G02ZdIt7tLE0v2cWhemMgjitdcDz3a5Pi4/lGSmYHnbCng/h4MfC/I/upZkE856eJofrTnhspAzjMKbJQiPvh/6yxPrAVFT2GiDgBi/XDE0SWH6r1ROOI1qA1G2wDLm5gnZT0X5HFXP/cg2PoHLXn/OZKabkSmvB8cvEKMlGpYPSNBrg3gruRON5doCnhPxvNlflfOIvxg8x9M4sK0YybbFib6NClChVgH0+6jUzEv6HeIROyNIGzGvJLsVjkXXqHpk/mW2Mr63GvMjCWwB7qELCSYTMkPclpxJiBXakulhbc08BxPQ7smhmgmedOW1LFD1tus4qUEjQYsGc9UpOsD8gJvyteLXVVjFS/sIE97nF4x9w0ydQTR1XpH0U99RDj/8g/aDJpZrcK1gs3J4UMhBTZrFxdRoJtz78BeMY2Y3vHlqK/jG2gz9F9VzTB8FvFwFvb9mr7hrs8gUyaswurJesfyD3Zgy5upAs92GzRmEQ9tY2w+CnYUMBemtT+If4axdbKxR2Bozhxl1aeZKNfGll5XJ9PTHMN3edpXuF5VLSTMmKzOfBJCGwHNKr27nP4HI8TSvwCQDat14W60Mtt7IeO1zOEnMXK8doIp5c76xfcDN9/JQYk70yPTIf5QAj0N6++FMv7jYQbtkjhjeMiqHl4cB8wcN3RfILCyTLeO31zJD5sb/l
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(5660300002)(70206006)(356005)(70586007)(6506007)(47076005)(6666004)(81166007)(36860700001)(6916009)(84970400001)(82310400004)(44832011)(316002)(86362001)(336012)(2906002)(6512007)(83380400001)(2616005)(508600001)(4326008)(26005)(186003)(40460700003)(36756003)(8936002)(6486002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 15:31:53.6240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2a6e96ac-eae8-429c-c044-08d9ebe14cae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4113
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 09 Feb 2022 15:32:00 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7054

Also fix build issues related to:
Log data follows:
| DEBUG: Executing shell function do_compile
| go: inconsistent vendoring in /[...]/build/tmp/work/aarch64-poky-linux/k3=
s/v1.21.9+k3s1-r0/k3s-v1.21.9+k3s1/src/import:
|       github.com/containerd/cgroups@v1.0.1: is explicitly required in go.=
mod, but not marked as explicit in vendor/modules.txt
|       github.com/containerd/containerd@v1.5.7: is explicitly required in =
go.mod, but not marked as explicit in vendor/modules.txt
|       github.com/containerd/cri@v1.11.1-0.20200820101445-b0cc07999aa5: is=
 explicitly required in go.mod, but not marked as explicit in vendor/module=
s.txt
|...
|       mvdan.cc/unparam: is replaced in go.mod, but not marked as replaced=
 in vendor/modules.txt

Short log since v1.21.5+k3s1:
101917b0c4 (tag: v1.21.9-rc1+k3s1, tag: v1.21.9+k3s1) Update to v1.21.9 (#4=
994)
8069a88177 Merge pull request #4978 from manuelbuil/ip6tables-release121
dc970d27ca Merge pull request #4982 from rbrtbnfgl/ipv6-nat_release-1.21
447279299b go generate
00068c92ea Fix CRD version lookup
683efbb737 Update packaged components
f856aa94d6 Upgrade: metrics server version bump from v0.5.0 to v0.5.2
900e5ff519 [Release-1.21] Adds the ability to compress etcd snapshots (#486=
6) (#4959)
42d160da5b Move flannel logs to logrus
de12630ec0 Added debug log for IPv6 Masquerading rule
bb3fe9b185 Added flannel-ipv6-masq flag to enable IPv6 nat
bfafe909d1 Remove ip6table rules when cleaning up k3s
758331404e Added iptables masquerade rules for ipv6 on flannel
f540db4570 Update etcd to v3.4.18-k3s1
6644357d0e Skip CGroup v2 evac when agent is disabled
f11f0748e9 Enable logging on all subcommands (#4921) (#4932)
be3c430985 (tag: v1.21.8-rc2+k3s2, tag: v1.21.8+k3s2) Move ClusterResetRest=
ore handling ControlConfig setup
c25ffa9ea3 (tag: v1.21.8-rc1+k3s2) Add basic etcd join test
a0521c29eb Fix handling of agent-token fallback to token
4b3f5be45d Fix use of agent creds for secrets-encrypt and config validate
512268458e Merge pull request #4842 from luthermonson/rm-vendor-121
03aa6d568f drop vendor dir
1942d18447 code to remove vendor dir
d47e38e05e Add etcd sonobuoy tests
9df916e86d Add variable to enforce max test concurrency
58501554f3 Fix previous channel detection
8b4553c921 More codespell ignores
625dd61a60 Close etcd clients to avoid leaking GRPC connections
14364119f6 Build script cleanups
b39c805d52 Bump k3s-root to v0.10.1
5641f9b328 Fix panic checking name of uninitialized etcd member
046961c4c6 Update bootstrap logic to output all changed files on disk (#480=
0) (#4808)
7e9ac115f4 [Release-1.21] Close agentReady channel only in k3s (#4794)
cbff7350ec (tag: v1.21.8-rc2+k3s1, tag: v1.21.8+k3s1) Merge pull request #4=
778 from manuelbuil/fix-rke2-ha-121
8d2170f5c4 Remove Disables, Skips and DisableKubeProxy from the comparing c=
onfigs
78102dcc01 (tag: v1.21.8-rc1+k3s1) Update to v1.21.8 (#4760)
6bac01fc58 [Release-1.21] Fix cold boot and reconcilation on secondary serv=
ers (#4753)
5260e4a649 (tag: v1.21.7-rc2+k3s2) Merge pull request #4734 from briandowns=
/backport_issue-4644-release-1.21
0d065c8491 Fix snapshot restoration on fresh nodes (#4737)
98d6d38d61 Resolve Bootstrap Migration Edge Case (#4730)
53ef842a98 (tag: v1.21.7-rc1+k3s2) Resolve restore bootstrap (#4704) (#4716=
)
d2f0bbb381 Bump runc to v1.0.3
3024462196 Add validation to certificate rotation (#4697)
8e1b2340c9 Bump wharfie to v0.5.1 and use shared decompression code
f468e10fcf bump kine to v0.6.5
b526e98d1b Include node-external-ip in serving-kubelet.crt SANs (#4620)
1e67a2b004 Merge pull request #4679 from manuelbuil/ha-verify-1.21
8ea26cdad1 Check HA network parameters
1055837e4f Backport secrets-encrypte command (#4658)
7b62900836 [Release-1.21] Add cert rotation command (#4632)
378201a459 Merge pull request #4616 from manuelbuil/loggingFlannel1.21
1390792919 Improve flannel logging
a622dd57f3 [release-1.21] etcd snapshot functionality enhancements (#4606)
ac70570999 (tag: v1.21.7-rc2+k3s1, tag: v1.21.7+k3s1) go generate
3f40742363 Add package version to traefik helm chart
d09821c2ed (tag: v1.21.7-rc1+k3s1) [release-1.21] Bump golang and container=
d versions (#4539)
7f737097bc [release-1.21] Bump Kubernetes to v1.21.7-k3s1 (#4531)
1847a711e7 Fix regression with cluster reset (#4524)
5b456972c3 Merge pull request #4519 from manuelbuil/backport_ipv6_rh_121
fd71ed9f4a Allow svclb pod to enable ipv6 forwarding
c096668cde Merge pull request #4515 from manuelbuil/fix_dualStack
43e15c4028 Backport updating cniplugins version and klipper-lb images
256f5d504a Merge pull request #4513 from manuelbuil/backport_dual-stack
88e77fdbfd Improved regex for double equals arguments (#4508)
e777b2c767 Dual-stack support LB controller
6854470a14 Merge pull request #4503 from manuelbuil/fix_dualStack_bug
7de34a0059 Fix bug in dual-stack
93cf545ab2 [Release-1.21] Removed warning about skipping flags (#4493)
119b1aeb25 [Release-1.21] etcd-snapshot loading config fails with "flag pro=
vided but not defined" (#4482)
334eae119a [release-1.21] Add etcd extra args support for K3s (#4471)
10c854c00e Increase agent's apiserver ready timeout (#4457)
c9d4543c99 go generate
7d5d1dbb80 Add dashboard annotations to Traefik helm chart
864e800896 [Release-1.21] All bootstrap backport (#4452)
df033fa248 (tag: v1.21.6-rc3+k3s1, tag: v1.21.6+k3s1) Fix log/reap reexec
254d2f696e (tag: v1.21.6-rc2+k3s1) Fix other uses of NewForConfigOrDie in c=
ontexts where we could return err
388963440d Watch the local Node object instead of get/sleep looping
afa1981f1d Block scheduler startup on untainted node when using embedded CC=
M
3fba7c1021 (tag: v1.21.6-rc1+k3s1) Update to v1.21.6 (#4350)
bb50c45a6f Revert "Backport bootstrap release 1.21 (#4313)"
d413f97146 Update peer address when running cluster-reset
f0ea0a0946 Backport bootstrap release 1.21 (#4313)
63bcc307fb Bump klipper-helm version
50fb1ce065 Added configuration input to etcd-snapshot (#4280) (#4282)
944ea312be Merge pull request #4267 from manuelbuil/1.21-flannel-update
11dce34b4e Update to the newest flannel
41b0997e31 Add dual-stack support
a18c2efb4c Refactor log and reaper exec to omit MAINPID
504e249a5e Add containerd ready channel to delay etcd node join
e814850eef Fix premature etcd shutdown when joining an existing cluster
7cbdea6bd2 go mod tidy
557d425010 Minor cleanup on cribbed function
4f28561e34 Wait for apiserver readyz instead of healthz
17f1aa36e2 Merge pull request #4251 from manuelbuil/1.21-race-fix
89f5721a3a Fix race condition in cloud provider
4aa9553978 [Release-1.21] - Add etcd s3 timeout (#4207) (#4228)
22f7f1c41a Make sure there are no duplicates in etcd member list (#4025) (#=
4213)
e7bf7b141f Display cluster tls error only in debug mode (#4201)
aa5a0a8c78 set transport to skip verify if se skip flag passed (#4102) (#41=
04)
3ee5098225 Add "etcd-" prefix to etcd-snapshot commands as aliases (#4161) =
(#4171)
724ef700ba (tag: v1.21.5-rc1+k3s2, tag: v1.21.5+k3s2) Bump containerd to v1=
.4.11+k3s1
69a9f46bce Don't evacuate the root cgroup when rootless
0af55a830a Skip tests that violate version skew policy
9e66f975d5 Fix PREVIOUS_CHANNEL lookup when current minor release is not st=
able
38ddda587a Properly handle operation as init process
c948305076 Merge pull request #4099 from manuelbuil/sysctl_ipv6_inheritance=
_1.21
15f3a2ebfb Enable the inheritance of settings for ipv6
273827d4ba Update build images to python3 for compat with recent gsutil cha=
nge
8c2f7ac41c Remove experimental from cluster commands
acad8ef840 (tag: v1.21.5-rc1+k3s1, tag: v1.21.5+k3s1) [release-1.21] Update=
 Kubernetes to v1.21.5 (#4032)

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 recipes-containers/k3s/k3s_git.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k3s=
_git.bb
index bcfa959..77ad6d4 100644
--- a/recipes-containers/k3s/k3s_git.bb
+++ b/recipes-containers/k3s/k3s_git.bb
@@ -13,10 +13,9 @@ SRC_URI =3D "git://github.com/rancher/k3s.git;branch=3Dr=
elease-1.21;name=3Dk3s;protoco
            file://0001-Finding-host-local-in-usr-libexec.patch;patchdir=3D=
src/import \
            file://k3s-killall.sh \
           "
-SRC_URI[k3s.md5sum] =3D "363d3a08dc0b72ba6e6577964f6e94a5"
-SRCREV_k3s =3D "aa5a0a8c783a8a4475b727a04d6594c0fea09253"
+SRCREV_k3s =3D "101917b0c493dd1effac1074feb1d5462b9a189b"
=20
-PV =3D "v1.21.5+k3s1"
+PV =3D "v1.21.9+k3s1"
=20
 CNI_NETWORKING_FILES ?=3D "${WORKDIR}/cni-containerd-net.conf"
=20
@@ -30,7 +29,7 @@ PACKAGECONFIG[upx] =3D ",,upx-native"
 GO_IMPORT =3D "import"
 GO_BUILD_LDFLAGS =3D "-X github.com/rancher/k3s/pkg/version.Version=3D${PV=
} \
                     -X github.com/rancher/k3s/pkg/version.GitCommit=3D${@d=
.getVar('SRCREV_k3s', d, 1)[:8]} \
-                    -w -s \
+                    -w -s -v \
                    "
 BIN_PREFIX ?=3D "${exec_prefix}/local"
=20
@@ -40,11 +39,12 @@ REQUIRED_DISTRO_FEATURES ?=3D "seccomp"
 do_compile() {
         export GOPATH=3D"${S}/src/import/.gopath:${S}/src/import/vendor:${=
STAGING_DIR_TARGET}/${prefix}/local/go"
         export CGO_ENABLED=3D"1"
-        export GOFLAGS=3D"-mod=3Dvendor"
+        export GOFLAGS=3D"-mod=3Dvendor -modcacherw"
=20
         TAGS=3D"static_build ctrd no_btrfs netcgo osusergo providerless"
=20
         cd ${S}/src/import
+        ${GO} mod vendor -v && ${GO} mod tidy -v
         ${GO} build -tags "$TAGS" -ldflags "${GO_BUILD_LDFLAGS} -w -s" -o =
./dist/artifacts/k3s ./cmd/server/main.go
=20
         # Use UPX if it is enabled (and thus exists) to compress binary
--=20
2.35.1


