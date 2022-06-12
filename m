Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3738CCA47E
	for <webhook@archiver.kernel.org>; Sun, 12 Jun 2022 08:00:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.13686.1655020843676146436
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jun 2022 01:00:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=H8rVDlAW;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=31623a79e8=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25C80eTn006753
	for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jun 2022 08:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=aFez9kAhBW+N2coO47RUKTX57Uhl/CQXMKcw/o+p1n0=;
 b=H8rVDlAW+akthOhKO/LdGaOh3hz+vY14tt30LgTBXC+cjktyG81dN/CI6zZ49G2GQqoL
 /kiugD0mbQ7Pc8/mv+6jn7e9ngLRahN5wLL0qF0ZakRbUnRCWc1SBchHzHkeJNJ0MECf
 2COTTiIoWziqWOvQ0E0zRO0IpRXovCqiIyWylS0do/lVZdhKfyMzTgzIwHR/qPbTM5LE
 j7Etz2f8V/hjxwWvpaPLTOdRJdTn8KzvvSn6UgK49MqGdejVgJWNYgTGnCNBOKpPXDX8
 On6WRUji6l6xd8bBuPNwZYwFBi/FHg/ksy2nZ4csjSsNGEDIkMr51LoKMCZYuUXeqO2T Lw==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmj198pw7-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jun 2022 08:00:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+WEp4CYhAzmhbLr5A4yQ1I02eHkpyHI9j3DJLVk/2xwLakEeEzSZhbmTLzGeC1j6vuSaHngmxCMbBQR/wLP3oj0ngGIeWGBJSVK9apXUm1rLX7CJ5sL35+MJzQPVYCn8KDHPj9lEwRclJJomLa97xN1Z+p51SilVzp4iYtitWmIp/MQkbxSH2UoNP8xxUNQ+cY6/CrseM+G9NmZwmp5Z3JQ/or9H9xpDUEfYfh2mB8noa4aSbpsAuka08FIhNLCH8gYdxrbxZmkQtIwvftKSIt0gbxF/vylGjgS+w0djiBg8VAaz0ynNNLeogoz+ln/zDm5xoLQrsPWDF/NJecgvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFez9kAhBW+N2coO47RUKTX57Uhl/CQXMKcw/o+p1n0=;
 b=XxSMM7c+NfcutjrbafS2+N2FrapF9aobbaFFdaQlAN1zvqwPLRcEjgWCYjHu6pte1qBdzIurkgdCwclSb3Sjl4ml+o9Lq4wUQ50gZ5JB7OnAEidJNXsYdVpl9uUmk5venGqwstMlqzj5sU1+VTbzc81CqwAg2frSqf91g7DLxlEMiMzRLYSwI8pygTunh2G3NotOwBrJxG0d/fzGyPP5eYJv56wk960+IW+li9/yaTWgTVAfOXYaIAjTTsRO+QCIEBsgeG2YxPb+v+XYbioGuXtJpsjQ+oPQq3qWAlkEXUYHE9yPl7/CFaPz5DYtOlCAPtKj4riNIt8EfDvpp0j8Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BL0PR11MB3396.namprd11.prod.outlook.com (2603:10b6:208:6d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Sun, 12 Jun
 2022 08:00:40 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8%5]) with mapi id 15.20.5332.019; Sun, 12 Jun 2022
 08:00:40 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH V2 5/9] umoci: adjust CGO_CFLAGS and
 CGO_LDFLAGS settings
Date: Sun, 12 Jun 2022 01:00:05 -0700
Message-Id: <20220612080009.130993-5-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220612080009.130993-1-Qi.Chen@windriver.com>
References: <20220612080009.130993-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0169.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::24) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1d4391e-da25-43eb-459c-08da4c49a3e7
X-MS-TrafficTypeDiagnostic: BL0PR11MB3396:EE_
X-Microsoft-Antispam-PRVS: 
	<BL0PR11MB3396315CF403FA6B8CAD96A4EDA89@BL0PR11MB3396.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VsYyXnSRITc12ZZfjG1LIOfT1KghWvMz7z65byi0pjC+OrPFNtgaEztQhSK6cNEwow+iMOkNVe9cQt8w8qlM2So2zWY2jLomoLPUmSKDTY7cMVJOnf0zNoJKorrubQI1zvZNePX7FGCiAhz8NX0MlQNOKd0GA1eryU+QDNDAuHICxx8papHVrf4TKSeTVlHa+frx/ofbHcULBmnhh/JShSpxr8ISSBUH7RnRz96X73Pdhgh1duLUQd+7FK5Yxu+/vY6AiXO1n1DHPAyWWKz9G0g8Xq3k7sTtQ45u7Fs/BLCi7dJSBD16mpzrmqhOofg0XXVJSLSdXgnvzHOt3EoVuSw0nCDw0+eg+q6j8I6WezCb6iY2xGD64xDG2t40ECqFJePqrJMluvAEl0TxbYtrRlDynWUx3dYjzwmFyziMKpxbS86ozoGP3lh9UeD1Pb4O99tb3oasCzuhLuRvF78WHvzpAYmm8Wt4qsOGAVTLuT2QfolHlokqtNaawC1Nq2NgCPbsvznCjUlBjyOd9mK7F4BoXiq2izZbC3mpkp4UqJ225LZMuFwrYbn4EvqaXDbTAngbjfEIybJIBLYypGY90N01v0hV/7TiEyVyk+wa//C8OqNQvrramZJFhM3Z4lJf7UmQOOnT38RYn7ozPOhdIzT4aU7EmWhX2/0Ax2dylZP+rJW5RhwxVV334eD8Dk4wdbOL4eaHnaj56ZulcPwsBA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(83380400001)(38100700002)(8676002)(2906002)(66476007)(66556008)(66946007)(4744005)(8936002)(186003)(38350700002)(5660300002)(316002)(508600001)(86362001)(6486002)(6666004)(2616005)(6916009)(52116002)(6512007)(36756003)(6506007)(26005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?t7BF5CRrm9BPTPK5oFP2DurtCB3P+vQJVQ1SGPQmiEgzow85d/93KdjmlHs3?=
 =?us-ascii?Q?66kyNu+YgfOpcUIn0cBGPPpksjvCuhNIVGACioyjUrMG2fTn3bxRxLZkMXvq?=
 =?us-ascii?Q?Sut79bZlHgdNnRNqxEcgO2E9rY9y799Iv6QUilYSogSt9etonMI7p/FlQScL?=
 =?us-ascii?Q?mtwWAvclnrvSjQdaFqzKCOGnY0S3Qkn32srjKzHTmfg92TX1hlRqBgNKooP7?=
 =?us-ascii?Q?bJWuMnY9g2xk1yunq/0YHbunlPvYgp2sejZdv2qfWLV7Z3NLDtib6D598i+s?=
 =?us-ascii?Q?QrSO3xtBV378X7295+wXfrqEtMurHAG4+2YC6KGj/TGqJMGwiCSVPp+YVsgA?=
 =?us-ascii?Q?X+6nrwuA266ABMrNbZGuaNJAM7Zbb6Gy6AptxCU87ghp80efmPRIX+tTCKIO?=
 =?us-ascii?Q?rYDX1LjQVX5OKzAHAznBhf0bRmV+76l4Hz3GQ/FunIZnL4qLbgF861zHz5yC?=
 =?us-ascii?Q?yu0Go7G9nQN3kLf+XkrhE+bGacth+ieqIi06bRTg+E4CTc+CFJQYENWnBpZP?=
 =?us-ascii?Q?tIEh69lgnSBVjTkX1TGAREnHmwZQBjOZZtzgx3P1LP7vPfW+DG5XzZbFSt8r?=
 =?us-ascii?Q?FAIEZafNBIR9hrvjoETlRk59vwXPLQfd024YwJu7FhN9T89a5QfRC1CMmGHw?=
 =?us-ascii?Q?rOVYPK6bnI3uWHN3qTLO/mVtAXIumBN14+sSHsGUAzxvrbmMZ8qCnDlTnfro?=
 =?us-ascii?Q?rw8g7+NuM1q6aQoac+HC+Q9pOFwsPCxaAj+Vd9tsCTVSYxtppcNqXjqit/Bb?=
 =?us-ascii?Q?/rWiW2zJJpg5AAzryP1iHX0ikMLmDMyiVKxeaomkpy0euOtHW4Qfwdo2U3J3?=
 =?us-ascii?Q?f/gVK8VN43AVhd7IB1lOPKv4Mel3RHhgFe4Q8Wjw4cJZUEts+ma2XYIVdT/l?=
 =?us-ascii?Q?8nNPzps4sM+yrPp5o4N7FpXG8K4k4CmvH6Y1+hTicB3cbdWQefYcKSDUB/3M?=
 =?us-ascii?Q?t0LLN8vF7Avo9Zyj3HpbgE7x8ULFzMNXp7qKyOunljMG/8hySHl3IRmvrxeF?=
 =?us-ascii?Q?VPGUjBVxv94Qv+JhOPZshSdOC+DpX3aiEQYc9/BXBWxKWAVkjubyuUsOxMXm?=
 =?us-ascii?Q?nZJqlLbbQPd5TLG15d29n8QijGLY0OlZnz4BmHdL4Mw/kOKnOoPr3qoFo+ac?=
 =?us-ascii?Q?Y+xiHfkx09mGprr5cqGCFyOVx7Jt0nAwcRebp8nECHK483zTiXASCe62M9O5?=
 =?us-ascii?Q?AUJsklex+UuzygdRnGb2aBLuF29M5v/tcj+4hYFLuf+SJukZSCq0uMsCs366?=
 =?us-ascii?Q?hW7Rr/y/RGg30a7svz0UE+dDuub2YYwRV+wM/0Rlh/Alhhpne3ME9kcpl/ak?=
 =?us-ascii?Q?hNrboxCzAFQ+WrWAj7QOk023pcMNOMLckila/ckF7LRQ1SFvqMQ+uNeVf9sk?=
 =?us-ascii?Q?ZOQ7/ARwh5E85z76aZEY6hk2ppfke9MkIEfc01B46koJ1qf371ABHkHtXolB?=
 =?us-ascii?Q?Xiqhb+P/L/P5zB7mTZiXdrslyWVB9n39ecAiv480nP4HbTt/J8Fg6MVX+iUf?=
 =?us-ascii?Q?kDLt8fphKc74iNUgBgo/AUbal/3lgbf5rsyLF8BlYmCMTr0sP/QFr1/8gS2z?=
 =?us-ascii?Q?gp6vslZv0/qyA71ol6CKZEaq8hqB0p2UjJsv4mvUWwxqxb0SvPuFoDDFGns/?=
 =?us-ascii?Q?F1DT71JpUR5U5voyi8WZxxDOfzoTqoM3Y84cdlTeuenqGxhpZDNJwVlJQLNX?=
 =?us-ascii?Q?4GvCt9AEcUt3qPznnbjFmZq0gGgrs0gN2VsvLECDTN9JqdhsnpjCpXSzhm89?=
 =?us-ascii?Q?qf7zQvFt382cPGtEnWWeEBY4uuRMEjM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e1d4391e-da25-43eb-459c-08da4c49a3e7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2022 08:00:39.6430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 o9zYwt7zQ7Mc9bxZG1TBI7P3bw/K6XTwIP3nAmjkO1W8CoFCWuGmPPUr/gXZcskL/I+PRE52ptaP0Oy1jCBG1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3396
X-Proofpoint-GUID: ZIv23wcmwwj-kY0OI3lPSF_pVM80q9Gu
X-Proofpoint-ORIG-GUID: ZIv23wcmwwj-kY0OI3lPSF_pVM80q9Gu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-12_03,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 mlxlogscore=543 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206120038
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 12 Jun 2022 08:00:47 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7374

The CGO_CFLAGS and CGO_LDFLAGS should use target flags instead
of the nativesdk ones.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/umoci/umoci_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/umoci/umoci_git.bb b/recipes-containers/umoci/umoci_git.bb
index a2c0827..3e7b912 100644
--- a/recipes-containers/umoci/umoci_git.bb
+++ b/recipes-containers/umoci/umoci_git.bb
@@ -61,8 +61,8 @@ do_compile() {
     export CGO_ENABLED="1"
     export CFLAGS=""
     export LDFLAGS=""
-    export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-    export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
+    export CGO_CFLAGS="${TARGET_CFLAGS}"
+    export CGO_LDFLAGS="${TARGET_LDFLAGS}"
 
     export GO111MODULE=off
 
-- 
2.36.0


