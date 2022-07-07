Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2726C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 06:30:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2532.1657175404555407333
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 06 Jul 2022 23:30:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=N9l4hxnm;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=41872ca0c7=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2676P7PU009244
	for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 7 Jul 2022 06:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=csN9XghTXDqX4lif8GNJicG75hGqyDcnA+IdCk77ogo=;
 b=N9l4hxnmZ7Q2Y/4o8uiREzY59xABFsHx8aNx8g77zNc7hxE9RtMwwcf/wSJ56grC6Ijl
 B4FEUm2oiYPs+2D6vrUR1NQF2oBX/M5CBMFlhBC/wi8dwS8xv7gB+N/COzf5BaR9AGAu
 Y+lcqCXkHDScMJOa4PItjbskVUAi3wrk0zS2ZnDIykUB8SWb/pmEpamQ/cVazcNFhIID
 j0MHsM8Z0XmxJI2SiWwexnjAQLdrkINbJfy58DKenO2WvxHdd1f/NYoVv9WYQor9mDjn
 mjupEeJLEER9MeQ1EDmXPbwILCoGtwbsNdY8/V6kfdgfC5uDyXERrIlyNafWWML6v2sy pQ==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3h4uh0s5xy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 07 Jul 2022 06:30:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0kltaQhciTMgfb22h5uUxmAZQvA77y87shcwvJ4ac4PsRgQWvMaSngDSSVdnM9n0As791qUk+ZKOfGThoAZFXXEJDueTdRjdXQoi8AGtVY8vIHH6C42TiRHnkSkesZWVvVfe26985ZfcYG62PwOfPxMULK5kfVI+8LBIP963knfub0LxDTZy+41infFwQlNlcwAys5Vru/0Kof7W0aDCMO4V+ZyksNOwL/woEA50cdDRmbCLKkUAJLEKmx16iTn5OXFLjqCoJK5qb+rz3dZIBmZ9tcEaVQQq0mVO3Y5W24epzhOQUGvj/cR8QxS0SOF4o+tUVn6zrnSsPbkRZ7LrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csN9XghTXDqX4lif8GNJicG75hGqyDcnA+IdCk77ogo=;
 b=GpndrVE4fDfw76/KZWnZW02+k1wKwkgvOqGEfk3VilQzA7ymcUqHp+0yIBkx/M0+9wN6Xrb37Fy/f9EhvM4OojxNU5D6DypFLIPcrl+SaQSR1IL5d8hUwZKEQe5djdndzO/ozbbHj8x6LfILDp6d4I7RG9Rv0ncECFQ7Va80jOBiqWTs0jtoOzjE7TPmMkGw08HCyenTiLtyIOYOjBYkZj0SwH4U+kmHyibn7s3TYsYTZvhO4AAsSF4hW5a683uey/VKsIP91O9iiv25MuFViZube1z47d2Fvpg9EVqCdXnfQf014bTElzb6MwOwz4lx8jsA18o20DlSftnPMda/Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BN7PR11MB2564.namprd11.prod.outlook.com (2603:10b6:406:b1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Thu, 7 Jul
 2022 06:30:00 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7874:564a:5570:ca99]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7874:564a:5570:ca99%4]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 06:30:00 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][master][kirkstone][PATCH] containerd: upgrade
 to 1.6.6
Date: Wed,  6 Jul 2022 23:29:49 -0700
Message-Id: <20220707062949.110913-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0220.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::15) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44cddc6f-3083-4842-f20f-08da5fe21e3f
X-MS-TrafficTypeDiagnostic: BN7PR11MB2564:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cckIpHFGBC9Upg/ShdBUGlgC3Ad6X0WooF+ND0zvAG3CpbVXV7qtNxebBtRGsc5yWYb0uPLjtmRDsYFtVGT2oqDK2/NGh3TayWONxHpGArwArkYJxJALBi3KlEpoy7Pdcux5xNSasBUAJx2UQwmuG8bHX2mXSvWi2Fw6ZuyjpW9Ja7G8FpZvdMksByA5KCcrlvyYtD4+JNat7OBdjNbXeqe3DNbFbHqGcpGzINNE2EPHxqEP/pjG4CVO2d3Fj224au0ApgJNAT1MDRFxv+pkc8pW3eaaMj5XFzFe8xCplWL8j5GKkCHzLXAo/+0DUed0lRPdJpa23LRJJHUo+ilw+J4VZSVb++xv62aRtHP5fi12ZaPWFQDXp5OytXpv4j4pAgv2EakJVJvdwUWVf5eEYOqWD+RdvwQlBmceqZXOMGnDbH6VgsxLjrCU0fy/L88DDdtbDKlqBhBdLskULhN7hf7JiczjgmvwmDcLNLHiyhXXAJd/ssrBLtoDdLrp0OHTDlzV32CBji8lVPfAIlGpd6JjbW2SS6fK6JKg3T/kBrC95cLZ3szFYrJcb6a413jgvuCgZ/lg9KJxFPcZDaPph4l3tYnPi9kai77Hlr9NSNkBESdaaRAYn+knYSqoMC7UsGJ3fkvHQDsjaeZ9kgSmwlHGAg9ZZxOve4uDWRNCy40whXG9hsK1hBbhSFx/t1YtkfrcQP2TZbiG3werU4YCgpHDjU/wAzpu+7wWyqUFCjlykH2ZOBECRdrBd01rB3QG2KRXvdutBYu1PJc+sTJ8+vfopMPjxz3+1UC4KiOV0+LiHSjoEx/E2mW2Txje8Qyk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(366004)(346002)(136003)(396003)(376002)(2616005)(186003)(6666004)(52116002)(8676002)(38100700002)(38350700002)(66476007)(36756003)(1076003)(6916009)(66946007)(66556008)(83380400001)(316002)(8936002)(6506007)(6512007)(5660300002)(478600001)(86362001)(6486002)(26005)(2906002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lIlT/nD8ndbERGpQpQpZ0Km1qAySIOIjtxloh9c4HJ5pEYaJ1rZq3ScfhULJ?=
 =?us-ascii?Q?vPznWetKbd7jKVCwHi6+ANNXPy/jfQZp+lbO2cQjNyToCWdlpTH3rU9ZaAh6?=
 =?us-ascii?Q?u7MpoJQT0D0pGpj8E1+/KHarnxWPPZr+yRIvmn6zSggkCLafcOal+R/lqcUs?=
 =?us-ascii?Q?DilTgHVduvmt61/SPRluSDObVjbEpaoIHO9AlG3R9hgb4hc5uLdZ+fICwIa4?=
 =?us-ascii?Q?D7Iyqofaw0NjDPXpsrhBkNDYJ9m4znPd4e5S3sWbe+L3DAWz8ir7CHl7OwNm?=
 =?us-ascii?Q?Y13z2JS92+nWe82kr6lpMnq/5O1V/i08H8iAAD//gz74VwuZlqiow6E9L0Dh?=
 =?us-ascii?Q?YBuMZUIqTxMIyEPyIeSpKf9OHdReRp7FMIKxYBdc/+i27zNH99f8KiNwKA5H?=
 =?us-ascii?Q?0+znD4CzPJAWbKYocObDIRfJl2AHNB7IRT9ZzIkhmTsQROQUQG9WJE1701G8?=
 =?us-ascii?Q?/h72JzqvVvwg/aJ8ko12EDz14/gyWCMM+YYmXmvW1LqMoVsosuTP5QxRf3CF?=
 =?us-ascii?Q?N59VGSrO7s/jXE4bcZOc0sHuUGDIpyacD6Utz250zOueisU34+Q1xCSbAYsG?=
 =?us-ascii?Q?AiZ51KTYcFy8028mpk/48h8Mfvrg4JGU7/+XMeo5V6GwX0lOoAVcLgoJ3Hvj?=
 =?us-ascii?Q?IcbcCTjEULocL1bBHyDE5PZFagFIlIWMk6XwC4uooHWM/1Y3JWSPiBuAAByu?=
 =?us-ascii?Q?Mq9e8UyzZmN5jNzfdxqIZmv1U9tsq7HINCBaYP9qHprzi5LtQpYfwz4aKUvr?=
 =?us-ascii?Q?Iia2Ikx+rfklROOTL/v7pVQBut5a2fhCdhsx9QIqE3dYOAYeBbqFYZ6c7WbC?=
 =?us-ascii?Q?H4vqGf8aiAg0RmtFxQl0u8+HL8zTLLox6QaqYgRdBmJDsK8/wsBWJpona4NA?=
 =?us-ascii?Q?+MF6PzRLjChmCc7zV8NkI/ATAc3Ne+woBjJveZ2Xyr2/HKbQU17/vEexTqr7?=
 =?us-ascii?Q?WmE8iqzzGzfSMKR3qvgvJqSRpz2bSpoLBLxiqHE506CW7aJ/OH3PFGdExC0y?=
 =?us-ascii?Q?IGEYMVAT+at5gYCj/L5EvK7kPs/r2JA8em/FuMV42CdsMnMzQHvqWN8P4aq7?=
 =?us-ascii?Q?hiIR/EHauHjIeNyjRd6VMDY0hjTrKfgtGsUP4eUa9JIwVZNz1np1zns2BmTW?=
 =?us-ascii?Q?hsl9R/ptV1bBLCgmWonRDPAGWGN3dGXRst4o0PHvzk2NPFs8+9jgdSDf7/pV?=
 =?us-ascii?Q?FZf/9n+XhH4BiX7ysrVv/WYCVsW3q3MRqjrTM3LNI2J3LjZfAFcaXWfBkd9v?=
 =?us-ascii?Q?gbvEs4+SZ4u8EJCHwwR2HLOtGCcW8WU4Fz20Z92dc4ntXNcdb2YMasFJ8M13?=
 =?us-ascii?Q?16c7IkJm5NPqsQzuALzYdOIxZFY4kSZoJ1bI4A8T+xogBI+5Yr7vvDS4aMXl?=
 =?us-ascii?Q?uHazbPjM0J/uOamI/LTCnzeIqRlLRZp/THUgu06KkRM7kiTOgWGsHMVR2MAa?=
 =?us-ascii?Q?TpBB/9YyrC/Jt56yjLgWqeHSIR8AhFEiStY+ktC5Gd9rrMcaIhb//G18u2lw?=
 =?us-ascii?Q?zNQMKw0PLrRVqOkondffAszum7r1v2nChYlXxX0Hh92PdZELp/IxZCFvefeQ?=
 =?us-ascii?Q?9l0hp2vHBeKrQzMLerU87M3R7srmPlKaAx8quCgkde+Jmvyzt0tlE+glQsrM?=
 =?us-ascii?Q?5w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 44cddc6f-3083-4842-f20f-08da5fe21e3f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 06:30:00.2351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 eJyMt4ZHbOd15+nvVeFbkHoBksPPD1+l3cYnFhWLnt0rHJtjpkYcSbt0JyOu8ZvY03FAI6BN2xB1xC4C6NJEXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2564
X-Proofpoint-GUID: ZHQ5sTch7AjanAKRoVtxzNrqFZcd6xL2
X-Proofpoint-ORIG-GUID: ZHQ5sTch7AjanAKRoVtxzNrqFZcd6xL2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_04,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207070024
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 07 Jul 2022 06:30:12 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7414

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../containerd/containerd-opencontainers_git.bb           | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
index b0f92b12..c28b1510 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "containerd is a daemon to control runC, built for performance and
                support as well as checkpoint and restore for cloning and live migration of containers."
 
 
-SRCREV = "d12516713c315ea9e651eb1df89cf32ff7c8137c"
+SRCREV = "10c12954828e7c7c9b6e0ea9b0c02b01407d3ae1"
 SRC_URI = "git://github.com/containerd/containerd;branch=release/1.6;protocol=https \
            file://0001-Add-build-option-GODEBUG-1.patch \
            file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch \
@@ -15,8 +15,8 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/1.6;protocol=ht
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=1269f40c0d099c21a871163984590d89"
 
-CONTAINERD_VERSION = "v1.6.1"
-CVE_VERSION = "1.6.1"
+CONTAINERD_VERSION = "v1.6.6"
+CVE_VERSION = "1.6.6"
 
 EXTRA_OEMAKE += "GODEBUG=1"
 
@@ -56,7 +56,7 @@ do_compile() {
 		     metrics filters identifiers labels leases plugin server services \
 		     cmd cio containers namespaces oci events log reaper sys rootfs nvidia seed apparmor seccomp \
 		     cap cri userns atomic ioutil os registrar seutil runtimeoptions netns \
-                     shutdown schedcore tracing; do
+                     shutdown schedcore tracing kmutex; do
         if [ -d ${S}/src/import/${c} ]; then
 	    ln -sfn ${S}/src/import/${c} ${S}/src/import/vendor/github.com/containerd/containerd/${c}
         fi
-- 
2.37.0


