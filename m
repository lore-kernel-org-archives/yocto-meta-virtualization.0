Return-Path: <Kris.Gavvala@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 236E8FF8864
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 20:52:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6111.1777323120260726928
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Apr 2026 13:52:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=m6cv+2Dt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8577753280=kris.gavvala@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R101nE2569449
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Apr 2026 13:51:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=FVqzfgaEpSaxobS7DmD2
	Iv42sMjPB97t9ikwrji34MQ=; b=m6cv+2Dt37cC0ZcCQ2pfPuVBgD4By6ri3ES0
	AszqWFOZS415I+7aH9bYHWWyOElp2xJTtVXbUMJbouLc2jVQ94iC5RJ29ol7tdL7
	XR4yANiBMtJ/tty70wg5cu1dhCAnhLMU2Kdt2xv08m60ek63diHeblYK8Q+wY6th
	4exz1qJApqIZGPJVhHhOGTlgLHdCsuWTB8wpClxyjV6kfwNdMOcH9Eis8qwMFJSi
	cY9QMK+PHffD7PzSpLFFlDJ/X5F9nRxgdRURnAf7m+4pfghll8+qqPplAxi7/nvV
	FgSI4LoYRe7Thm8CAcxwnCvPJo1tm4qDBiS84LaHPCoqavv4+Q==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013007.outbound.protection.outlook.com [40.93.196.7])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4drrw2tc5b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Apr 2026 13:51:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AqJ8FjQehdLk/ozKcJheU3a3hRXAGbxHnMAONG6ddLKOCViwTSr/lpSCxS1VBuIyXD7PrnxMfNvdYszTJguLBIqw01Ic1LYkzmtP0agXvF1HKvlRoqDxFJto9rGkLlgguVjnI6kS0UjJbE40jVBg1kKSVNC9M2BBNT6tmA36cBvcFWuBROFu4VUYB8/KOvIW2ayZeJTwKQSVM8orIbi6RvbXExFGNY3MuBH0wXrINQSh8qVPBPwXCHJNLfVfteJNzTlf87hvEZX4hrD7VBkAW6Fkv0A+62BuIuCVk4liYmQMFYjAJY/e4pHjASOxkHK5Irkn6BDCqs4A4YdB9PH12A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVqzfgaEpSaxobS7DmD2Iv42sMjPB97t9ikwrji34MQ=;
 b=DUeGqpS+LdOItYTtVivl5jge6KAxUIq/5Oxkbv0tVqJcQJYMUTjGenqCLIVXrJ/u6lxN8AvtrYUcOTTr1uaIPCahsN/V0lBodjLf1mOKRwE8yr4tCqRPMTFHvTVm/tvzAZNV9KE7cZ6Cgvc4jASsBgLg9Tj19TmGG88p0TXDCtbEXDws7DBVRlnOBd7Zc3lI4oPEdCIk2EcZJMnVsP6tltSpAg4G8LIQ2zfUgI9nAKAi9Hf3cwUeThV6GX5oXo/RkUUaeZikgXC0WhfSTB8qrK9UMji/n3F8ivXaVJKSVdW0ZlE5+jBGw0w4HlET1azTbmec0fXwTpWUJ2+GyO9hHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) by
 MW4PR11MB6740.namprd11.prod.outlook.com (2603:10b6:303:209::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 20:51:55 +0000
Received: from DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1]) by DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1%6]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 20:51:55 +0000
From: Kris Gavvala <kris.gavvala@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] lxc: delete extraneous PACKAGECONFIG[systemd] line
Date: Mon, 27 Apr 2026 13:48:56 -0700
Message-ID: <20260427204856.86829-1-kris.gavvala@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::39) To DS7PR11MB7783.namprd11.prod.outlook.com
 (2603:10b6:8:e1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7783:EE_|MW4PR11MB6740:EE_
X-MS-Office365-Filtering-Correlation-Id: a8262fa8-0ffd-4af0-39fb-08dea49ed10a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	0nZDZHTGUHtAq2R3nJE9j/AKZwrrnk7308Lv/rqPf9dWETnShF3wtoMDzDOnO73Li0mMg12zBRd1oFyAXyjAq5kKxFZlUVL2t8L+w9flphAMs7UOqD7vaQzOVn54j0Az5ufN1+FTOvxWWRk7qSVwWZDlKXGLEex1QhOlEcSrfHei7NU+70FVWu3NK5mJFrBPB0fhxtggP41HCjqrjeT5YI7RJ67lsYcVUSbi6DQwR3jatEu9S8Gulxk2kYHaq71+Gsh2lRnk5Vy/TDASmmCcfmXfK1ECITvM4ZagiH8T9biMuVQbrMxxlC/7+oU6Jv1aHvefySH0UPpUnCdv3aekIxHfzE9DQPIMa8se8QIwkk+Jz0CI5DPbTYi77NqxBHWytFBZk7KSwuU9sLjZR61HizArwZpEO5BYiD/QBF5h/+wTf89vImHE121oJIVUN8VWEVh3vrhByor85RInQtfnxfXqWE3eElmDW3pb9pjhaxpFpvygS0jRJwCsFVk+ISfBrL7bL0BfT4SMbynP7yYbf8jllt9FQ43IXV7A1t3ASiWjcsg8VLg56X8x1U44noImHNVdHcARTKX7qHNS+RsD/YeJJwDBsP7WdhPHCcUC1oooR4Z+gVKlEIDAWWM5GFCa90Ox6xX0B0dvGr28aZCrMZ+dMwW5PBWVy6QP7/LRqqNx1XOwfrb6B1p0antZqEY27zQudIkfnKAxiPTrdE7jOnHJUPnifQi2+6HMhJHKZvGiDxfqCBranP9kBjP66tvXFw3E7aaCteEt2uVGyn8rNePPrMeopN6uv3WghJEvZaU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB7783.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dxXiIoD57wTCTa2F0LxdHleqmm4omNc5HisViDrYylXj787++H9QKe3XoKWF?=
 =?us-ascii?Q?3MWqJssSSZWZrfxemzmfdjWBDZJ8gF16Lpi4zoHeVgT+kGXxk8CVj/Eun9sl?=
 =?us-ascii?Q?KfYnOLA71qk8rGJUZJCw+lBkkR4py6w0tbLIULytFgTzgkT9B71TK8AVhbGn?=
 =?us-ascii?Q?CHMcP/tuGUCaB+Juw3wFMGYJuIS+ckOnH9jXUXDfOphpohV4XxEBwbTjUmXn?=
 =?us-ascii?Q?jgQsN2X1AB1ndkxem/8wM7eGlsCaJai6Gw/XrNQtb/8K4/V8/YmbJPOde7nL?=
 =?us-ascii?Q?87CIf5t/Z9pVULdaLB24rG4mtoqYnrKgD+gk92DPqM9awzq6tDPUEU/xBXTL?=
 =?us-ascii?Q?M1cuBrSbVvDvdluxIgtAejPVWE8HWjajo+akAKF2/6rNBRYVlaw0ymSmm+am?=
 =?us-ascii?Q?BR9pufnph4ncG/vtYYC8MQclqDF6YHt44vkrdfVnn9iAzejY7Gx1AjrV1ran?=
 =?us-ascii?Q?xnfk/iAzWdI9FpGeks7eHHzN2TS1uYVAUsRenmd81p4T+Spc9nDq7NKzBohW?=
 =?us-ascii?Q?bfS0j9QMA7/gSsl08nSSYVhvrMEfOhMnu60nzAU9o0NM1XlE9JSYPjWUf93O?=
 =?us-ascii?Q?xd1AlxUX2TThyWGTiWyCyAPEhpCY7Fgp4V33t5XxXz2u2hJEFDwxFGCV7yPS?=
 =?us-ascii?Q?yQBT62GHYVhDa5Xx+kcXDmm3w65OpmDO8ugODR7P3gLTuJbQHu1mrknpi/32?=
 =?us-ascii?Q?wF4/2UGk2h8dxFx7Ju0oWFIuNhY47lkGFZSymhyP6Sgy6evjZ89rrqYegqcm?=
 =?us-ascii?Q?36suNMh5GCh0hVAHV/RA51sHUnYouAT4LE753A4qS6Ma/ckFRcuEjsJHGfg1?=
 =?us-ascii?Q?pxJTKIFn0zDe7sxt+PA+rnowarN1baexIDPWHH9/O9yb1Zfis2qJ/D+3Srkl?=
 =?us-ascii?Q?Nsvucjgx9Zp7t/8j25xOcYrgmX8AFgxOSjXo9K/4GptG6F1dwWtmVaXn3RFO?=
 =?us-ascii?Q?gZ074clbyHO49nNCry2rHUx9uGNOeAnU37YSe+nFSBCGIC4Eyv5mZSKk3Sxy?=
 =?us-ascii?Q?TF3mIlcL//0t7f4f1STGAE3TuRp99obp6yyRSaCYq71tu0wu0WkbD6xGvtyG?=
 =?us-ascii?Q?p1+QtiwCeepVHsvQ8hfKEm0GzFX3mZ69VfIhjfKQ2YNZr6DxXm46CdVAfwjN?=
 =?us-ascii?Q?sNioK3NOO2fatKHEJhr48f3ETQklAHv43nN8c9OHWXcjpI3o2eFiYdpxHIoj?=
 =?us-ascii?Q?HZ9zWMddTuuoKBoVCBExoGqIVjZx5ONoCRX8awqiMulovzksoH83iTRXtfvi?=
 =?us-ascii?Q?gqnzL3BJtjyWOLX942M+Et8s2Szb6fymrvS2fs8spVRPL5GHW9KRg9bvVgqK?=
 =?us-ascii?Q?IU3zW8lXM3/u1tD4xL/+CqChyHWoOkkSOtOZWLr8hLY4Xfc2nstf3oVBAN+7?=
 =?us-ascii?Q?takf6GQGoR3av6vJC9a//+JpDF4z5JtsmLbGe5J0wvoy1GKFDeKZ8VUOevz7?=
 =?us-ascii?Q?SiCmtqmrTfYlQv3X+j0XrtmAj7jSGFRDIC0l+9ji0k3hBKYisL1oHaxZaV/P?=
 =?us-ascii?Q?tvTCzb857amNzcKV5gP2i2nQd7/mDPlio63joarb+v+O5lHNi6N7V9Cw+rSH?=
 =?us-ascii?Q?/eXOGO5QfdN8WO2OQ+pmoIUoJLIHOWCCPssJesoWdjN8o17Qfz2KrhOHxZmW?=
 =?us-ascii?Q?aMic+SKQZpE6gwo77y4hOAvvDZZWB5d8dWK0QBeAxJOCZIpnwiPFPoaazt3R?=
 =?us-ascii?Q?faia8hEWYH0axGw4mgimQZgmw89FQfEaVj4SAJpXhXxnw1GWkyySVBIi0xI6?=
 =?us-ascii?Q?4MdQtAqcP2FD6ZXTA+jGQiRC3vfBiOo=3D?=
X-Exchange-RoutingPolicyChecked: 
	h5vLlL3BOnL5sAId5nRwys2oNK6NphrVxBLz8I8eBBiztiZXAfjMIpTBEKe9sd7Iq8e63lFpd8fZ6siwGTBQDKWSwzi9iLFW3oHAqvjX39ql6pOuuC//qNBAe1yt3bI+loBxmqE7q4NDxN5JX2XhfQOF5wYRkyyAKXsmt2AdOlLhcd2zLTyfx+OVnApH3pP9jHddpLovGGlMu/lmM07YJLAIxg1y5c/GiZdr36gvw1GfmQvwG08J5brOKoKnqMcNub6MgYIOmT/Xv10XMoLmTFjBHUvdpKjQ3ijfpF9tdNte2NSW8FjTr9VXllLCJXupwEd7fTuNTM44IRpQwvV5Og==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8262fa8-0ffd-4af0-39fb-08dea49ed10a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 20:51:55.3803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W2VIYaiqvyBPoo2VK+/KdXqCCra6Afei6Gn+eFpi4kc0535BJ/EHQa5nB44UawTDQTomMm9dHHvBfFqy3fX8DOqttXSHlQpDGO0eTzoLrl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6740
X-Proofpoint-GUID: spqZEFJsQv0c2vqBM2gKmIJ8Lelba8vR
X-Proofpoint-ORIG-GUID: spqZEFJsQv0c2vqBM2gKmIJ8Lelba8vR
X-Authority-Analysis: v=2.4 cv=Pu+jqQM3 c=1 sm=1 tr=0 ts=69efcc6f cx=c_pps
 a=B1kIKGfTVomdQYahC0fm5g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=qTo3ID_eeLhOEIK1Xp0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIyMSBTYWx0ZWRfX6fuS+/CLlMbr
 mxZKeIuHON71RkezNvaXsNYHZbtaVQoVeqntvA0X4QgTLMPXUlVDzhzHUkIBfpy1bId8C4JvoN/
 CKXyqtP5tTe4/RLpZFbV30bp5W/bQ4Mi+yMWVrocUv2j4dd36ug9l6YPtaxhxjvwkHO6wFMIEOi
 F7eODpQ1Bt4xSRM6Yuy9A72exL89njIttT0VNh1axyFe0b8Zr9RwtWMhHgLh3kKIjlgbcf+u/I/
 GPdAkRN7GH3DqKlJYMI2l3vz3JXaXAMB4YjR0Vcp74N1Oa+TaM4hADilFFu4GlEN4GLyGv/anu1
 ratmaSbBpJinVGtZtCVjnHu61ugS2bPAQ4ReyvAWR13f7tXpvrnECTYAgU/912zKxWmKALBTQgv
 +gSDkJv0ToYJwRceVqDDacqsGB+e4njVmoWSVIXelPSy1EbsPI3j2+5eLY2prkbK162Ubf15FV4
 WSLu+lgQwJcUZSkVmEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270221
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Apr 2026 20:52:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9747

The PACKAGECONFIG[systemd] variable is assigned twice, with the second assignment overriding the first.
This patch removes the unused assignment to avoid confusion.

The duplication was introduced in an August 25, 2022 patch:
	05f316f7 lxc: update to 5.x and meson

Verfied that the build did not change after this deletion by checking the log files before and after
and finding the same message:

	export systemd_system_unitdir="/usr/lib/systemd/system"
	export systemd_unitdir="/usr/lib/systemd"
	export systemd_user_unitdir="/usr/lib/systemd/user"

Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
---
 recipes-containers/lxc/lxc_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
index f08d793d..3de9a8e9 100644
--- a/recipes-containers/lxc/lxc_git.bb
+++ b/recipes-containers/lxc/lxc_git.bb
@@ -80,7 +80,6 @@ PACKAGECONFIG[apparmor] = "-Dapparmor=true,-Dapparmor=false,apparmor,apparmor"
 PACKAGECONFIG[templates] = ",,, ${PN}-templates"
 PACKAGECONFIG[selinux] = "-Dselinux=true,-Dselinux=false,libselinux,libselinux"
 PACKAGECONFIG[seccomp] = "-Dseccomp=true,-Dseccomp=false,libseccomp,libseccomp"
-PACKAGECONFIG[systemd] = "-Dsystemd-unitdir=${sysconfdir}/systemd/system/, -Dsystemd-unitdir=, systemd,"
 PACKAGECONFIG[systemd] = "-Dinit-script=systemd,-Dinit-script=sysvinit,systemd,"
 
 # required by python3 to run setup.py
-- 
2.49.0


