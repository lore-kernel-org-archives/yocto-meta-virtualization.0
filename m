Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19109.1792662321218650194
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 02:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Ln9S+9Cv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4755789ecc=roopa.kalmath@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M71Y1j3826436
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 09:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=oCzfvgN8YRlJV97UPj1k
	BOZbSjmgCqKHGyyfKkRpVEM=; b=Ln9S+9Cv5yJiQSS3kt+83yKrepkGe8pQeqkx
	7C1i3IWTpdMiDgHpkWtLFYtq9z6lVYuhu+eWeLtMAlt+idL11CYLw30HcFQzjglF
	8Uxp61NFYs6Q/eyZBjmVXtyOdjwc65ONbSzg8yZg/B0Ra2BPQCd5yr1k+IwEDqC9
	FI105j/NtnAQ6uuR28QzDbd/bZR1E5ap/GXK6jYgt5CoqTF0hdrHNJpTO3c4fk4k
	GXZ2BDK6L4D3jTD4ixC6RrBn6quPVxTE44O2pJjmOO2JshXepzRWL8AqycekY+BR
	fKsza98rMENTWTo4OrC3fb02SfVEPIh+KOgMGpzO2AjnBmG0DQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023073.outbound.protection.outlook.com [40.93.201.73])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hf9h1rdpn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 09:45:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JBXmeZ/VjEFVhJeKE36qnloRvOJianHkuSr030smtGyr18PsBUG+pHH7loyl0b6Loln4ywSVZoVD3q4kSmx8vQElVNpfTvMzN8jIhsOYulBFZG+/VZ62NGfo0CZ/QAfgM6fSPQlEr260JXnkCSCYNA+p6P+uDdBwFhlMRz6B031DQstASzZ4gQ5QLawCVEMiDDB2IqSeEtMs9Y8W0TMSrNO4XxRfrW1OyxX8WnnymnBf+X7Wgo8Kix3NMZwJHDGtlHw1xGiHp0cZnIt/9hdNgbOoFdS8lwrCYTi+546Fm3MeEtkP8mIBVXvg2gYNS6F05xI1S1hG8fVLl0w37LG8pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCzfvgN8YRlJV97UPj1kBOZbSjmgCqKHGyyfKkRpVEM=;
 b=mWG6oxJvE8gk1gosCuxTgTggJN4KDF9DNUB5e1I7nQLQZyDKLMtjOhr3aa4p8YF+BgWorgzcMTPlOEjxjrYZGuqPUtSbjTDiHAMPyuF6DTIi5IK5ft6O2oltclHR0/VW3kOTO33bO0gr0pWczr7nCNNeGTd1duZehxHq/I8SBd5gjWBROKeIJkCkwWAU/O50AxNANncP65V5aQX7LtEJ77AF9LncfE2XFY9jRtMwmXim2tZ1xeyk1SE4tomYX8bZgkMKJpbLpb3kW6qqd82ETeFgIHTwyoL5iTg/jD78jk9UXOm/Jnx3MWU0m/FLFYgSPKmZKmnxryelg89h5glm/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA1PR11MB796993.namprd11.prod.outlook.com
 (2603:10b6:806:51a::24) by LV0PR11MB9790.namprd11.prod.outlook.com
 (2603:10b6:408:385::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.22; Thu, 22 Oct
 2026 09:45:17 +0000
Received: from SA1PR11MB796993.namprd11.prod.outlook.com
 ([fe80::95f6:cbad:d705:67cb]) by SA1PR11MB796993.namprd11.prod.outlook.com
 ([fe80::95f6:cbad:d705:67cb%5]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 09:45:17 +0000
From: Roopa Kalmath <Roopa.Kalmath@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH] libvirt: fix CVE-2026-18917
Date: Thu, 22 Oct 2026 15:14:54 +0530
Message-ID: <20261022094457.3334481-1-Roopa.Kalmath@windriver.com>
X-Mailer: git-send-email 2.49.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI3PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:295::14) To SA1PR11MB796993.namprd11.prod.outlook.com
 (2603:10b6:806:51a::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB796993:EE_|LV0PR11MB9790:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fbdb05d-f8c6-4cf4-50f2-08df30212df0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|52116014|376014|6133799003|18002099003|3023799007|13003099007|11063799006|261009223027099003|261021121427099003|261021135927099003|261021130227099003|261021123027099003|10067099003|260925021911599003|260925021311599003|56012099006|260925022911599003|38350700014;
X-Microsoft-Antispam-Message-Info: wMhcE0Lr+j4YPxAtGjKd/1rPDIYqsanTE1S+U7B+3oZkn+Yu9SAri5JGooTvkCNqZpvhqCGS92b9c26iNRgQniRhwci9pDM0h+vGFNy/tQyqcY3Y9EHkMBOVEcbXb9k+bX+iYMDD5FZeKc14YmnF9s5/guD1vqRYMxJ1jbnkQZIP9v6eDTRMO4p1K0GgO2ZvH33cotKaewJon7u7itg6p0KDvDeiSJtHTpTm03koxzDrW5Efa/JscX1PBupDehXo5SxkbCe2imj0FSZH/e1Rly50xKPZQzS9XdQx+3pBcxLA1xr9Vj42D2ltoXkSrwEM4fs+3hjdcjbjoH2pB2PJtPtXnrN3NjvTVkbHZlgstCTGcSYotLv4GIuLfZSMIBoTLWZDg4saGAjj0d+tKt/zNhi2lhSL3x/zVa2FIFRMXcLUDh58L4no3wuKsiNeFgCWiYf0w3Vdm6ccGRva0y82MHtVp7rBUypCZjPU0FO+GqWrRuyW4InAKkY+eJNAAGmcXngcBA3hPdQrhocfmON4XmvJ5A6qg3y+2Ap30t2bjFpDsnSxgjzxXR6DhR4g08mbpWOfp4xUk/HBoQjiiIVThW+aRZ7Z2eReLNHjrqHrT2kjgBaDWRXsp5q1NR+BY6bQK77P7i18RSyNh+66IKvmIW1X96RkLUMBeB7UQxL1cVSw6NCaA/cD12cARy6X2ZHQpSE3cyOFZU9dvyacYJnvrhaXwFUE/aVZXnassUI/IR0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB796993.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(52116014)(376014)(6133799003)(18002099003)(3023799007)(13003099007)(11063799006)(261009223027099003)(261021121427099003)(261021135927099003)(261021130227099003)(261021123027099003)(10067099003)(260925021911599003)(260925021311599003)(56012099006)(260925022911599003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dG56R0F6MThOSHVQK2ZvRExjemFoVnFNRlVXUlRYUW9wbTRmQkFPL1BuOXRO?=
 =?utf-8?B?WWFDUGU2dHpqemdoUG41YWN2SU5yMFVMb0VpeTIzYVdNM2FTU3lOTDNUaGVE?=
 =?utf-8?B?eEdFZWF0Z1ZQSnBCTEYvdWFzcnFzN2RaTGo0YnA1MXpvd2JsdEZSZFkwVWFB?=
 =?utf-8?B?SHBOaE54NFJkN3hES3U4S1U3ZDRONjRKN3p0T2ViKzFKZ0JsVVpoWkhjdmtE?=
 =?utf-8?B?bkdZQTlReGJiNXY1ckNEaVBzRlkvbjVyMG9tNVFEejQ0cmUzR1JUanc0NEdB?=
 =?utf-8?B?VTQraDJwZ3BDYURHSVlwZDl2Y0VjM0hxL3lvMnhHYllrTCtGZXZLOG5rWENE?=
 =?utf-8?B?Z3hQRUNRUkl2VEFZcGxuS0IrQmkwSDVsUVRtYzhmQlFOMzVUUGNJeGRvc0c4?=
 =?utf-8?B?L0IyajhoMTBiYWpiUG8wbkNaRk5VVXExZFU4dmszQWFCcTRTaE9tbXhZMUFr?=
 =?utf-8?B?WGtEUWkreFp6MnB0MnRjSDEydlBpTUViQ3BSZHZEZG9MVG44Q1ZNZjRkUDlU?=
 =?utf-8?B?ZXlVaVFNdVhxT2lWRlcxMlBDbG1McDNrRFVycHIvYUlKeE5DSExMOGRjUitB?=
 =?utf-8?B?R1V3VEpsengrSUhRa0h1ZysyditnMTFxM0I5ZEJyVFpYb0I1c1U3bGEyUjVR?=
 =?utf-8?B?L2dZU3B5Wm5vR1dXQncvd0lvWGQ1RmE5M3NuMTJuN1c4Z0ltWDZHeEFTVTlp?=
 =?utf-8?B?SVV4clhSb2psUklZeDVVdU51LyswNDUrdmp0VzRFZHZzdFgwcllKdkY4WEhZ?=
 =?utf-8?B?TlovaFZVbE02WmVNVDc4Nnc2TnZvWWY1S3ZrWmsydzAvdDkwTWRITk4wUjda?=
 =?utf-8?B?NWxPWW9seHJSb1g1dHZFNUp6WUlhdkRkKzJaSnRRRXRFQmRGSDF6VVhxOWhz?=
 =?utf-8?B?M1VnNkpMd0dDL24rSnpmRmlWR2RrYkcxYTY0V3hTMDFodndnL0QzTXNTTHNa?=
 =?utf-8?B?K0p5Z3YybGx4a1NkdWM2TGVCTzdOOFVMbVBHT1BaK0IzcEJLdHBBZFNEQysr?=
 =?utf-8?B?YnRldmlaRVhNaGsyczVIVHJlVStGU0xhOXZuV0p3c0xSNnovekFkUUMzSHNF?=
 =?utf-8?B?WlAwM3BLYTc0M2xXelVkNDZZQ3ZCTG0yaWF2QWQ5bEo4bW4rczEyZ1hGdG9a?=
 =?utf-8?B?QVJOanZKVDI2OFc5R1U2aVV2eS93Vm1wVG1pTEhaV0hXbjIwRkRZMjE4YmVx?=
 =?utf-8?B?UW5vcm9VSnQ3bVpmUlpOM3hnRU5WWDlqcWl0UW04Wm9VMndUSXZFVGRRSEZF?=
 =?utf-8?B?aGxBNi9LZUlSY0NscXlnMUo1a3lRQkh5SHp4Q0wvNkxrMzc4SXlMR003Snhy?=
 =?utf-8?B?OFpZSVk4R0VLTGRvT3Zua0V1alk5VC9kN3VXS1grOFVlV0wrWUIvTmcvUFpT?=
 =?utf-8?B?MGFESWk4TmRmN1hsZmI0Rks2NWtSZkJpallHYzNnbURpSXVtN051QStobXhJ?=
 =?utf-8?B?SE9KaEF4bmF1UnF2TldWSy9zM0c0N2w4di9mNThMVUxkNFB1VkMyczV0ZFJn?=
 =?utf-8?B?SFpSSmhXcTZlQWQ1T3BoRnpZOHhZZ2JKd0NrQk5GOS9Kbmhnb0QwbC9hZ3g3?=
 =?utf-8?B?RlpPazJwTjQ0YmdqR2Z6MUlHdkd4RXNaYnR3YXBqNWpia0w0MHNJeTlOZjRY?=
 =?utf-8?B?ZTluMmNjaGI4ay8rOWgzdkVyUUFPQWhXbHd3bVdzL3dPNHgrVmlLVkxiNkx6?=
 =?utf-8?B?OXBSTURBbWRMUXNublM5Z1FMQ1NORFBDSmhYb2tCQjI0eWt6QlpWVFZFZGZr?=
 =?utf-8?B?aUVBSTMxdTBtSEJmZTNFL2poWGJqUVoyZEx4R2VPMmJJc0NjMDZFUktOMDl6?=
 =?utf-8?B?cGlZajZ6N2dPYy9ycmZXSlg1L0tHUXdnWDRRM1BOcStIcUdacGtpWDJuUCtZ?=
 =?utf-8?B?MWpGa1czSlh2bENSdUFlQmVWQkE2SW1CTzJKM0lldVZLcmx5Wmp1YWsrWmNX?=
 =?utf-8?B?Rnp6ZVdYZGh2alEwL3lMS2xIRFkwMTFadEJzS1RVaTA3RDVrYXN0YkpEbUhE?=
 =?utf-8?B?ZHU5Z2VvRndKNHZvM1cxRjRvK00rb2xjVmY5TEZGWjIyeDV0dlY3YlZtNXBL?=
 =?utf-8?B?SjdVR2s2V3lreERKVkwvYS9NQjMvUWxYdGZtT29JdGdBWTgzY0p0SUQ4RTJZ?=
 =?utf-8?B?bXhYSFJYdHFmYStCUTQrQnBjeThFSVJwdEJhWUZHV0NabmJoTVFOMENlTU1y?=
 =?utf-8?B?K1hXQ1pueXl3ZUp2UkZyUGJ5WVhpdWZJNEpGbGRZQzhScnBBdGlkTHdycExY?=
 =?utf-8?B?K3AyRndVUlhLczRhcVJMSGcxV3JSeXZYVCtJRm1ZZTFYcHpaRStKdmVCNTkr?=
 =?utf-8?B?YlIrZE9xa2pneHcwZ3ptVWdDeWRIc1l5RW5EcElILzQ3dTF5eUxhMzF5SDVN?=
 =?utf-8?Q?qf+xS6GU+paf0u8o=3D?=
X-Exchange-RoutingPolicyChecked: cSv51IPiJOHD++35amfzTcp/doWwDnqtVKCrFEg9ZtB7cF6xK2kx1LJ3TJi7oswdliQKGA7pIh4L4xiOoXUsAS8K/ytUGOipNFnz+d2KFts+KtkmZ4+m6EsTZOzG6FVusTL1X52EUUodWWV0S5Ay9PZcPiDgiIIiGADZOe2YKgDMk+WfB9Kq1WnU4O+PglAs+ciRPIH+Yb4U5w25MPr89DEMhgNW2OTOwXNIAlUEw9rwbsXyC3ZGTBMTLA+AUCH6En5gUGzIoQcR2o06ZkjRpJ/DRGnEyn7n4RMW0FTq9oaDK4j5aQkCKh91EGJWaOWkK/nBS6R3peMCvdvh9DeKZA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fbdb05d-f8c6-4cf4-50f2-08df30212df0
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB796993.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 09:45:17.3881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hxUvFrCW2Arvegc9OoP8q7hlcwy7WG2kZr5jxwWWi/yTm2yXyHkhLgfEKtsU9DPJ1H9YD/I8p3p6jcR5EKdG5JR4WKawmzUkMDeKUkAdTMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB9790
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzOCBTYWx0ZWRfXwSZvFaK7VJjs
 52SUEspL7JIzVTqGVrjGSJQenajg4sXjL5BVC/DifW5fNax/WYbXxANcKgVZIDc6J4AeLxVg7L9
 vcYR/EiHxrL3ENCuerGiQ1ToBxsh/5YfdlRmdn6dCGiYngCW7hizVO1iK95oqwWh3zq3B7JpWWo
 YjbkxM3FXcV6QlCMPtGY/Ji9Xy2NzHXtRhSf+LA8efFq1L/lF0kp7WTOS978Hnb9AF8sN/N/CHm
 mrScf13P1pcVdZfp3HLT1k3MTAjg83UStO0KUWIAdvd7i4i/aEgT/TevDD1JQTmA83dopnaB682
 Vsuy/WUQYfij93exbGMSxbLGYixegoRrHvgWRVV0R/TS+L2HJW2QjoW7RN71EMMwH5CftqOfU0p
 TGE20w8exsQeRiQUXwwnrWTOvVHarrN0e2anJu6cMhyXuDIDZ0eDT3e1w9aC02Yopxjk3bbNLxI
 NBJ4wokvnPjFggk6rPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzOCBTYWx0ZWRfX+Nt3zi8f5mWb
 Q50599gjBlIAfr4uy2kD8Si2PAPxl76nlDUwxKRp+k+rfUnWRwGe80S6Bf8Zwqmasu9Y/wwe9at
 H2oX1hGvIIA43nBBWgcVnuPoTWX9aJzQezpZmWTL/2lzQWo/cy9W
X-Authority-Analysis: v=2.4 cv=Ro1QvymK c=1 sm=1 tr=0 ts=6ad9db2f cx=c_pps
 a=GKgL0VAr1x+Lwu9ZGPB1HQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8Ad4tvYqdmIA:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=p0WdMEafAAAA:8 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=NEAV23lmAAAA:8 a=pqoEyW-WUp3kZ8g3W7wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: DoaC9uKDxDzonawzF2d43qjizVmgebDn
X-Proofpoint-ORIG-GUID: DoaC9uKDxDzonawzF2d43qjizVmgebDn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220038
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 69M71Y1j3826436
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 09:45:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10121

Backport commit[1] which fixes this vulnerability as mentioned debian
report in [2].

[1] https://gitlab.com/libvirt/libvirt/-/commit/5a62cbf2907d4590283597b46=
da9c0f41e7b4d4f
[2] https://security-tracker.debian.org/tracker/CVE-2026-18917

Signed-off-by: Roopa Kalmath <Roopa.Kalmath@windriver.com>
---
 .../libvirt/libvirt/CVE-2026-18917.patch      | 71 +++++++++++++++++++
 recipes-extended/libvirt/libvirt_git.bb       |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/CVE-2026-18917.patch

diff --git a/recipes-extended/libvirt/libvirt/CVE-2026-18917.patch b/reci=
pes-extended/libvirt/libvirt/CVE-2026-18917.patch
new file mode 100644
index 00000000..8b8b84ab
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/CVE-2026-18917.patch
@@ -0,0 +1,71 @@
+From 5a62cbf2907d4590283597b46da9c0f41e7b4d4f Mon Sep 17 00:00:00 2001
+From: Peter Krempa <pkrempa@redhat.com>
+Date: Wed, 12 Aug 2026 16:51:58 +0200
+Subject: [PATCH] remote: Fix integer overflow in RPC handler for
+ virNodeGetFreePages (CVE-2026-18917)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE-2026-18917
+
+The RPC handler 'remoteDispatchNodeGetFreePages' multiplies the 'npages'
+argument with the 'cellcount' argument passed to 'virNodeGetFreePages',
+both of which are declared as 'unsigned int' to both do an RPC limit
+check against the 'REMOTE_NODE_MAX_CELLS' constant and then to allocate
+the memory to hold the result from the actual hypervisor driver.
+
+Since both the values are 'unsigned int' the product is also unsigned
+int so big enough numbers can overflow, both passing the check and also
+allocating not enough memory for the result. The hypervisor driver
+assumes that the passed buffer is large enough and overwrites memory.
+
+When this happens the the hypervisor daemon crashes.
+
+This can be triggered e.g. by passing 1023 and 4198405 as values which
+multiply to 1019 after wrapping to 32 bit unsigned value.
+
+Use the VIR_INT_MULTIPLY_OVERFLOW macro in the check to avoid the issue
+the same way as we do for other APIs doing multiplication of arguments
+to determine amount of required memory.
+
+Fixes: 34f2d0319d2098c77c8cc27d8350616029125a2b (v1.2.5-164-g34f2d0319d)
+Closes: https://gitlab.com/libvirt/libvirt/-/work_items/903
+
+CVE: CVE-2026-18917
+=20
+Upstream-Status: Backport [https://gitlab.com/libvirt/libvirt/-/commit/5=
a62cbf2907d4590283597b46da9c0f41e7b4d4f]
+
+Signed-off-by: Peter Krempa <pkrempa@redhat.com>
+Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
+Signed-off-by: Roopa Kalmath <Roopa.Kalmath@windriver.com>
+---
+ src/remote/remote_daemon_dispatch.c | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/src/remote/remote_daemon_dispatch.c b/src/remote/remote_dae=
mon_dispatch.c
+index 95ab173b7c..e548438250 100644
+--- a/src/remote/remote_daemon_dispatch.c
++++ b/src/remote/remote_daemon_dispatch.c
+@@ -6752,13 +6752,14 @@ remoteDispatchNodeGetFreePages(virNetServer *ser=
ver G_GNUC_UNUSED,
+     if (!conn)
+         goto cleanup;
+=20
+-    if (args->pages.pages_len * args->cellCount > REMOTE_NODE_MAX_CELLS=
) {
+-        virReportError(VIR_ERR_INTERNAL_ERROR, "%s",
+-                       _("the result won't fit into REMOTE_NODE_MAX_CEL=
LS"));
++    if (VIR_INT_MULTIPLY_OVERFLOW(args->pages.pages_len, args->cellCoun=
t) ||
++        args->pages.pages_len * args->cellCount > REMOTE_NODE_MAX_CELLS=
) {
++        virReportError(VIR_ERR_INTERNAL_ERROR,
++                       _("npages * cellcount > REMOTE_NODE_MAX_CELLS (%=
1$u)"),
++                       REMOTE_NODE_MAX_CELLS);
+         goto cleanup;
+     }
+=20
+-    /* Allocate return buffer. */
+     ret->counts.counts_val =3D g_new0(uint64_t,
+                                     args->pages.pages_len * args->cellC=
ount);
+=20
+--=20
+GitLab
+
diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/l=
ibvirt/libvirt_git.bb
index 34a1ff21..e42bb400 100644
--- a/recipes-extended/libvirt/libvirt_git.bb
+++ b/recipes-extended/libvirt/libvirt_git.bb
@@ -42,6 +42,7 @@ SRC_URI =3D "gitsm://github.com/libvirt/libvirt.git;nam=
e=3Dlibvirt;protocol=3Dhttps;br
            file://0001-messon.build-remove-build-path-information-to-avo=
id-.patch \
            file://0001-tests-meson-clear-absolute-directory-paths.patch =
\
            file://0001-qemu_nbdkit.c-use-llu-to-print-time_t.patch \
+           file://CVE-2026-18917.patch \
           "
=20
 inherit meson gettext update-rc.d pkgconfig systemd useradd perlnative
--=20
2.49.1

