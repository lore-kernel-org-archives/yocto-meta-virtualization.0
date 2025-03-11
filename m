Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97137C28B2E
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 06:57:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3017.1741676235208063438
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 10 Mar 2025 23:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=51652a637e=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B5j2Ze009338
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 11 Mar 2025 06:57:14 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458b4133hc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 11 Mar 2025 06:57:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2H97GO3pk45dPYqEsNmVXJkYNEEJVWaeiqSU8zql+xID1exzt15JzWS9AzYNHNKwH758I3I8V0p9prqfUrlCzKI5DFlNLNvSvqUkygbY8hnIYkx1BHKzAetxMrXtudXzZpzS842+Eok4r6jZ/RAJ3QNX2OhdCE2P0RXlQv9boiqGkS0aNxHgWocxcrgJ0N2z/XPPBu28wnTWY8TT8PD+/sYDMbywEsU2eq8wxyFPgOsayHhcilw9FX/ZTruDVtj92hJol9MZrmAKF+Ekb1U4X9qTyJdnmC4OiyXqk9E4KQzSu2F5subN6B5HOegHopQo1ZVfzGPJZ5gfZmcZMPcDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+DMgkpz1KPkPvMShazJ5AhAlnSdULgkqZluVZYIkPQ=;
 b=EL0k5lJ6qk2sEivGCp3v8tDHiXLbaRK9vNdhT9NTekhcCD9Chq0rzTMvCKrlrShGie6dUWA5Pdp0HHnJETh5VWZn5ZLZi0+r1IMAwZI7ghPdMlG/A2eE6LJXoekNiQlCBbsLEJchNUmzZDQPi/Hsr9kc0iz4zK+D2r37YGzT8qfz3NpJCWzT0GJQv1jcCpGSuufTBRNR+sV54ElXevHdp9Ai0acNg4IqVECPstCZp14tu89hpabbU8mVLZsiO18fUVa8J13zYB5OSO/s67/00/iNK3WITxXZfj7T6iz4w1uk5X1IRXSdomj9b4SmwomMLooes5cmHC9ujV83+3s2fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CYYPR11MB8308.namprd11.prod.outlook.com (2603:10b6:930:b9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 06:57:10 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%5]) with mapi id 15.20.8511.025; Tue, 11 Mar 2025
 06:57:10 +0000
From: peng.zhang1.cn@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] cri-o: Add CONTAINER_DEFAULT_RUNTIME to run-ptest
Date: Tue, 11 Mar 2025 14:56:59 +0800
Message-Id: <20250311065659.886554-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::24)
 To CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|CYYPR11MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e591919-6302-4b63-08a5-08dd6069f1ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?weMMs7CI98rpvx5CaHQxUqdl2BLEWhpc5Z6ayImB/In80GaoY9jhvvQliVNX?=
 =?us-ascii?Q?k2pBbea3lRyVLys8kVg9gHKTFJBCCM7ezBUnpY3n7598vGiKevj0ETwZPfnD?=
 =?us-ascii?Q?4+cIP5jtNL35cyivfgoUsDWj/TNUQil8UaWRmsAw3lNS013lr950T8PTjPui?=
 =?us-ascii?Q?Y5UIqTUeERa/hRuTLvJtJlNYE1anTpOSlFhabNIA26NqYUkTZjIZVBwrOr+g?=
 =?us-ascii?Q?AfuJeuAsFo6AtXxF6nslnCk+watMplidRnK32rVhKgwv44YLtv7bnDUcmlRP?=
 =?us-ascii?Q?pWes6YjsumRquz2QKfKcVHKA3yfCu9TrMpFNfCdtwRsDIBsSz7saSiCNAj9y?=
 =?us-ascii?Q?sSjwQYKDVZhkFr81DSHw6vBBc6JZhPSLamHlmY3y5LQ0lSn+Ko5eEaxQvgeO?=
 =?us-ascii?Q?4DMcmK/C3rHLBsztAI3mzYULT/sv93Onp7Wxk7fZ0GLGn7921A2hAtHNaqJJ?=
 =?us-ascii?Q?r498jC/qENMPc+G/tbaBkHGsUR1RxaXTRW4dyChkFQE9ENTKtfW8/U3vvDUc?=
 =?us-ascii?Q?d5UQsl3JH177rpNUEa8/whrZ5+Y5CM01YyROU4CmPJHiBjKbvUKAC9o9Xfdi?=
 =?us-ascii?Q?21oUYFpZJbUsg3S2CqX61GAhU/KRiYNMYpkZQc4nWYR1FfWNN7ku2l0rSazf?=
 =?us-ascii?Q?/t7tjumv9L48PmeeW7PQMBeKawcvRR/KjekhQuTUg3Ve4dOs9WWSZE2/fH6I?=
 =?us-ascii?Q?+dJq8TYDrATfF+znw/6+xiGzqXjaHJHe6CnW4dMjjv8fhUlMD/Ziq8Z4Fex2?=
 =?us-ascii?Q?GliI+JL1ngX6VPhUejduAcVgEPSoN2vw/Nbhr087nsz8h63R2h1+1X57MREn?=
 =?us-ascii?Q?IGGQu7wpRZu4m+acFXxLhAlE7dchT15mCTqVvnwGMO1apsQVK8/Vivh7hEQc?=
 =?us-ascii?Q?nuhCq8lKQrwbpIyWbYV1QTQ7sX1QAW2ES99OILiWo2UZ/rpuSyKjw/3sMOBk?=
 =?us-ascii?Q?DGW5gJ5xD6+mFZ/SgIiz19rv6GnvQ77vLabdt6Z3l+tUK/HmfJSH+uPp1JEQ?=
 =?us-ascii?Q?OV0NsnAyVUTk9fKpbr5nme3jWh92Nx5EaBr5+lXxX3PoO/aUDnEKhncXf60B?=
 =?us-ascii?Q?uatcNRi2VG0uUizdrgR/9n/IpTcaGiiWJCt+REpTBtrhib/4KFXEsXsCIWHI?=
 =?us-ascii?Q?HIYznKZ1wJ2sytZ/QnDR09faf18XtU1I6OdfnWCwKmUj/oHVlsGucn7FhZ/G?=
 =?us-ascii?Q?I5kxNTkQMrG/M8QxoZqTZo+dBXKkSL/25mr06sEMcPOA4JXW37o3VpWeXy6t?=
 =?us-ascii?Q?nr2q1eYmPHWAkKv2Yzc0tzbdrXIr/C7TNlc7PGz1bN7FLd4dSxuHWUpOu3Dv?=
 =?us-ascii?Q?IZl4JSq4PGcWtV5F8VFMhfad6DY2muYhUHgxyXWCm4Jmbz9fbTU/Mr3hkZkr?=
 =?us-ascii?Q?49u1bhxQZCT7+0ilO94Fp7LpI7QNKd2JNcuknEpsFueWL4NJMI/m2HQlf7F8?=
 =?us-ascii?Q?xfRMLMhEMQM6cKA2jFp4s4ClU9w0b51P?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uoE0UfUNKAe+6A5oTUDhoVyGphufYly7rPhGYCO3gD1S+fOmyz8peeiEAERb?=
 =?us-ascii?Q?kihNkFjIVgrDzWrSk2Qsy04G9WTVPQLurcCpa9gx/Fu+vd49/Azr4xiu3kBN?=
 =?us-ascii?Q?XNJWfYEPyJ3/vOS7fnaAH1WWuFs5fgERuQ942kgUSjCvO4LkUHkva+o3ZPyA?=
 =?us-ascii?Q?rXo5gZmRbvs/7taxF8MlcB710leKTm05egZZ3pgh6yU0Ik9LJ1FoXpMKQgue?=
 =?us-ascii?Q?uTi09VrHhU5m60HLcmPSPAiJkSogNwOYhuf03mGARgc8HjgaxiMCshXLiEvh?=
 =?us-ascii?Q?fcf8yYUM7Vfdkl+wxGwVif1Fo/6/1vCou16MafyabDgd3kcrepfPi/sxsd+d?=
 =?us-ascii?Q?BWiuZ/kgXp2zsrzVaPt9Kt8HQRvpUloPlS5//I6evOgxkC7ZDORVby9IYgmF?=
 =?us-ascii?Q?BMVSJk+JOdjemyMRvDkreOw2sQCGGL0AbCMkR+PNFGQwAolXwbEwDDTxHLx6?=
 =?us-ascii?Q?7g9/TBIxwylD+oaIE+ANYY/4cwtjAtSNRcIQUOSF6ShfMKwX+huI7bXZpPME?=
 =?us-ascii?Q?bJ6uhbzEG0g+GjF8cnLSP7UgDQY+gzBuiAcK2FXViCv43DYM7l8Q90QmSaZB?=
 =?us-ascii?Q?UTfS4uaaEnWjyKnZJfLs3gPay5Zxe49KgHcBL1l53ShUip3gyqNAfQboWvD5?=
 =?us-ascii?Q?72rWRYxglQfnMjKer61XUjGV7WlT8p6mgJLjiYmB2CsYUBAHHGjUDKcmOawW?=
 =?us-ascii?Q?JhIuCPASksrztfFYelb7fy8Olq3KPm8q86YsTRkxZAY9T9D92OiMn7qPkGUl?=
 =?us-ascii?Q?5by6SoU2zJ4M3L2t6NI1sjERsWYSFd3cOJ6Q2XvQW9oG2pYuw+o6FDb/5/iH?=
 =?us-ascii?Q?MHprt9z9s6RBrWFKFGV2aQCGoRPLnAi4xtL3zMn/2i98nJDEtT0qYG3wEsQH?=
 =?us-ascii?Q?rAs9Wg+IVJ3WJ1dnLQMXROcB5MSzrDtbBufnQKhbI4BHbmhUjQgaIWyg+fWC?=
 =?us-ascii?Q?l+2HUr2drOpKr/kQxh0d+5QNd8JS09rXwVJubZuw1l5gWJJmlIrVlvuRnV4T?=
 =?us-ascii?Q?DZEDT4Qdzi7lsuHuw+O25g+01yhyb5kHVD9fXEOiIK3KtBjWsBx6lYZwSWAB?=
 =?us-ascii?Q?FxaTBgXKLR3rqUURtWqN1njkAihm8zltupD5JrYzX1K4DMudDlKn1xspv2Ag?=
 =?us-ascii?Q?eLQPqaPVNtEVjkkQh8cOinHSX0x8SkVLZXyEbRhkJV+11IwUvrXp+sSsGXZc?=
 =?us-ascii?Q?wD+NIAk8WFK20Qwt9RDBcbQ8Oz8kjMPKA8k6cqvaW3nXpRszecf0+Gbwm+AL?=
 =?us-ascii?Q?ae3B17Zaq3r8lbRY3q4V6wNLx7QldGFX9jCg2XaAQakYzNGY9ggI0x2IhRfa?=
 =?us-ascii?Q?7SHiNSF/p9gnwK8NnzMC6yawFl99sh/OF8wFrV6VLTjMaikwdZn0uW3ZNcIZ?=
 =?us-ascii?Q?4snIz/xaVfYadY6sDcp4fEHWAYJPMnfcThjDAIbu0v1c878aub/TRjpHxLzC?=
 =?us-ascii?Q?KNDj0pmSxTiSMxEO7d5P+u5xrJ3XGg1QUtY2uvq2YYp+9K8BAkR746MdK2Qr?=
 =?us-ascii?Q?DvEyVzYPEXEp+7/2K2AgebE1tBSqU/stBZ+Kp9/+GyOHWH2znlF/2sLQWTWl?=
 =?us-ascii?Q?wvfs6hcw4FAmNoitL/8kYaytYCZDyYmTeNrUpWKAvsXkboGoq5YY4XmDHX6g?=
 =?us-ascii?Q?VQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e591919-6302-4b63-08a5-08dd6069f1ec
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 06:57:10.4888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQpNl75ef6A9dozR/iRUsg8Lz3IAUHoOB1TExP45SBT1VoejDHYQiH7UtsIqxilelD6YWbbvZlOl1zWvw7pz33TzUgxp1ckxbt11j8McMnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8308
X-Authority-Analysis: v=2.4 cv=JYNGrVKV c=1 sm=1 tr=0 ts=67cfdeca cx=c_pps a=mXs27GP3B2XOU+bPH1EGlQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=t7CeM3EgAAAA:8 a=CtMT-mPSgrFWnnp4GGIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: VhzuxOCqnuQTGhSTJ3yH8oyGrCtt59ZY
X-Proofpoint-GUID: VhzuxOCqnuQTGhSTJ3yH8oyGrCtt59ZY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503110046
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 11 Mar 2025 06:57:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9162

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CRI-O version 1.31 and later defaults to crun instead of runc.
This change cause ptests to fail if crun is not installed on the
target system, as the test runner verifies the runtime's availability
using 'command -v "$CONTAINER_DEFAULT_RUNTIME"'.

Additionally, CRI-O specifies the runtime via the
VIRTUAL-RUNTIME_container_runtime variable as a dependency.

This commit explicitly sets the CONTAINER_DEFAULT_RUNTIME environment
variable within the run-ptest script, based on the value of
VIRTUAL-RUNTIME_container_runtime. This ensures ptests execute with
the expected container runtime.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 recipes-containers/cri-o/cri-o_git.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index 1ef32ab0..4622e8d7 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -117,6 +117,16 @@ do_install_ptest() {
     install -d ${D}${PTEST_PATH}/bin
     cp -rf ${S}/src/import/test ${D}${PTEST_PATH}
     cp -rf ${S}/src/import/bin ${D}${PTEST_PATH}
+    # CRI-O testing changed the default container runtime from runc to crun in version 1.31+.
+    # To maintain compatibility with older tests expecting runc, and to allow for other custom runtimes,
+    # this section explicitly sets CONTAINER_DEFAULT_RUNTIME in the run-ptest script.
+    # The value is determined by the VIRTUAL-RUNTIME_container_runtime variable.
+    if [ "${VIRTUAL-RUNTIME_container_runtime}" = "virtual-runc" ]; then
+        sed -i '/^.\/test\/test_runner/iexport CONTAINER_DEFAULT_RUNTIME=runc' ${D}${PTEST_PATH}/run-ptest
+    else
+        sed -i '/^.\/test\/test_runner/iexport CONTAINER_DEFAULT_RUNTIME=${VIRTUAL-RUNTIME_container_runtime}' ${D}${PTEST_PATH}/run-ptest
+    fi
+
 }
 
 FILES:${PN}-config = "${sysconfdir}/crio/config/*"
-- 
2.34.1


