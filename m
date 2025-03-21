Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E10CC35FFF
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 10:10:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18030.1742551807752321508
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 21 Mar 2025 03:10:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=517583f90d=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L7qvvi006969;
	Fri, 21 Mar 2025 10:10:06 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2045.outbound.protection.outlook.com [104.47.73.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45cxs0y5nq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 10:10:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PAxDCAmCJHEkHgbAoTuQQpAurTouC+T85BTbtftWGoin6yseqfieAWtED07f6me2Q6z3o8qzEKfln7vfNvGyKfRMBvIgaxgBxomn/1OR/P+22gIyIn+aQ6I6Yr9fQTBCqzL0VCu5sTj8Slf8CCKCnCM00OgV25kxxH2afQZrtVF1nUfnIimuH4MW6dtZbvP7rB0/7RbELW0vrryDZIH9CF3G4qwGS9e+z1HDFVOdrpCGzKivUbcsvRcTAMx4idsAuC+Mj7wv/e4RYW/58eb0swNmo1oFp2R4P4bG09B2VirI6dkHvZOC9VOVtC4P2FnPcUZi2PpzSgbpCNt5mrIfBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fRQbe3OXzFcZ36X9uiA3dJeFl4FjenHibZx4zhP9u8=;
 b=o7vHKB/3SvZ5w6kZuIar2B6Bk5++p11b5vge6dXJxhxlY/tyEjppSiV8M5SPXiPeRm3MNKhf47J7diGb+kJg2y13PODP7RNSZnfoqJnBGOm5VxkCTnCQEl8oRaPhFaNjGD3FAObap9WHzNHXwJ7Eg5nmhORqOij0jMW4EU1KCjMckg2GLIC7kX+JSbMFSlmchqRYb5kC9DEsHvERqKfxE0YKYsYiM4h0uDvry1FockZQjldBADb0M/tqlxKwmq0v77H6dO7HHHSVPos3d5Y5MeYk5Ft40knaxdcg3puu+m/58HYchjPZfHqMOI/8hXEs4TKaxvxZrrGo2XH2tXb0kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB8570.namprd11.prod.outlook.com (2603:10b6:510:2ff::7)
 by DM3PR11MB8669.namprd11.prod.outlook.com (2603:10b6:0:14::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.34; Fri, 21 Mar 2025 10:10:02 +0000
Received: from PH7PR11MB8570.namprd11.prod.outlook.com
 ([fe80::d870:a7c3:6433:11d4]) by PH7PR11MB8570.namprd11.prod.outlook.com
 ([fe80::d870:a7c3:6433:11d4%2]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 10:10:02 +0000
Content-Type: multipart/alternative;
 boundary="------------HKoyKM5vYyHwhb5T4mvWVEKj"
Message-ID: <122ce34c-0c13-42d0-bcc8-0e2768fb95ff@windriver.com>
Date: Fri, 21 Mar 2025 18:09:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][PATCH] cri-o: Add CONTAINER_DEFAULT_RUNTIME
 to run-ptest
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20250311065659.886554-1-peng.zhang1.cn@windriver.com>
 <CADkTA4NunB_=Y6Z4iO050D-YB9ORtrBpwsTGUR33aOwopXbvkw@mail.gmail.com>
Content-Language: en-US
From: Peng Zhang <peng.zhang1.cn@windriver.com>
In-Reply-To: <CADkTA4NunB_=Y6Z4iO050D-YB9ORtrBpwsTGUR33aOwopXbvkw@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0151.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::8) To PH7PR11MB8570.namprd11.prod.outlook.com
 (2603:10b6:510:2ff::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8570:EE_|DM3PR11MB8669:EE_
X-MS-Office365-Filtering-Correlation-Id: 214c2b61-a0f4-4c63-b799-08dd68608b35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|4022899009|366016|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RGRwcW9rbU81ZTdscTBGcVRoVmkxdUNyWkpoMVI1SWsxQ2FUOFJRdXNHTE0x?=
 =?utf-8?B?V0VzNHcrR0VMV3FHbklvL3plS2hrZkpPMGI0cE1xVW9aRS9oQ0RjeDczUE0v?=
 =?utf-8?B?OVErdTRJUHFaT2hjVVdOUVdZVmJ5aWJRNkNZckk1NG5GcDRkcHZWRkU2NElo?=
 =?utf-8?B?N1B3MHh5S0dhTDFTWkdaeUFmdEpMNWZHMVBWSFdjdjBRQURPR3BtbkR5ZExV?=
 =?utf-8?B?Qm1rcXhmK0tPc2tjYlpMTTdOVjh6U2luVUhPSzhPUk1DL2RFendUOU1jZGkz?=
 =?utf-8?B?WEd1T1d0YktmMVJNd0Y0V3JzdG1Tb1A5QTVKMGxIeStLL1dsaFhnTkgzQ25z?=
 =?utf-8?B?ZW1COWc4QnlSUG94OExxUXpkSytNMGxPN1MydjJQbEQ5aXZFQ2Joc1czRS9T?=
 =?utf-8?B?MEs4dmNBY080UzhPVVB1QytlempBZGF1clZ3VDhLeFhuMHpPUm9jaC9BWXVS?=
 =?utf-8?B?QWdwcm9WZnBDQlhrWTN1MTV4YmZLWDdjVHp4WGRIQUZaVTB1eHNxWGlFQTBu?=
 =?utf-8?B?K1NKYlhRSUl3RUV2R05WNlI2ajhuQTFvTDl5QlM4MG5ITlNxTE1RYUFzeW94?=
 =?utf-8?B?RTN4ejJoamVVaEM3SFB2SXZZTGJGOHY4LzBzTVcvYVkwTUIvaXVrb3VoMWhZ?=
 =?utf-8?B?SWlTY0N2UG9ZSjQvMHFxRWUrNVZROTZQV0Q0QnJEKy8vRnc4N3NVS2t3YlBt?=
 =?utf-8?B?UitkYU1GaXFQS25nRjNWV3A5MUExQzRrRlhPREt2d1lMeVVPU2tVa1psenJ2?=
 =?utf-8?B?MEordWdpNE9XZk8xMkxhS0xsUjJ1NUpUZkpURjlmYTBKUDNzUUtPajZSWm44?=
 =?utf-8?B?dkhqVW9xVlBKMGVJL01ubWMyT3ZNUGpGMVAvckI2djF0K0xWcisxZm1lVEJY?=
 =?utf-8?B?YVNJSytnN3Zvb05FSkEzNHBWajdITmtybnhvWXBtREZvWlA1RXNBekF3ejdq?=
 =?utf-8?B?c08rRlhLTGxKNVZBV1VFWEFLNG5id01ERS9jVE13ODJIYjhnbFJPWUdsZk5N?=
 =?utf-8?B?Yjcyd1BDS1AyMmNtV0xwWjRJRW91VGkwSkdhdGtUK3M0Ly9hazNYeThoYWtP?=
 =?utf-8?B?R0xHNTNXSG1ORVBsTFF2Q1VyN0xjRWwyRXBXa21SdlBIdmdqckRtSEhMYkkx?=
 =?utf-8?B?QXRiZmlnOXZlMm90SGZ3YXRmblQ4cUJXOGVveVh2MVBsZXExbTNMaVFPVWxk?=
 =?utf-8?B?Q0NkcTJYeiswMmZNS2tHODFMRWh1dWNpTzQvZkdwN0dzTGl5c3hjZ2VnVXda?=
 =?utf-8?B?NFNHcCtYQm9tdFErcFA3bEdmbHhhV2dEdEVSdnZ5V2xMeC9jN0RvWTkvdlpZ?=
 =?utf-8?B?alBHQVVxY3FjTXROUmgxT1dkNVpVdjlqY1lZbExTVlcwQ1YrN3RwcW5SWGkr?=
 =?utf-8?B?RmVrcklGT09zcTBCOGZZWlVZTWZJSXVHU1dsS2QxbTN4UDRhZTlDOUFWQVlO?=
 =?utf-8?B?d2xyRVJXOGdqSnFBMXU1bDJhZ2dENkNReGQyMG5hTTJybVUyU2doM0VWeEpX?=
 =?utf-8?B?MTEvRmUrVWhZdkxHTTZoL0FkSTRpeVVVRkQ0dzdqZFp4eUJobDQwdjFmSU5x?=
 =?utf-8?B?MkZhTDdSRUVMa3VjYWFFZFdGZHVKendXVU5IbU1GZGJHOVRyYTQ4dkRWZVJn?=
 =?utf-8?B?UXJKSTlUTk80ZGRxYitmMjFkVVNtSHNEL0xmRDg2N05OMWovazhYUDl1N0I4?=
 =?utf-8?B?ZHZpejlHUURrZHVBeFRwUzFoU3hOSUZvSm9FWUVOUnJSNnR6L2MzaktuZkVt?=
 =?utf-8?B?TUoxQ21zS0IzRGIxWnNkK2VZNkxSYU9MaGhIbzRNUUloL2p3Z3RsMGkyTWxC?=
 =?utf-8?B?M3cyUWhnU2hzZ296RzRvdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB8570.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WExtRFN3dURvajhzNnJYVWl4NTNBTi9zUk0zL3lJL1dNb2lpS3B2aDdtVnZS?=
 =?utf-8?B?U1EvT2dYNVNKckt5RlIvTUJYMWgvOTZzVTN2cHZ1MnExK0llalMxeVZUbW8w?=
 =?utf-8?B?SU1hSG9hOStyT1BNaXo0d0sxRHZLN3VKMWI3VHJleFlReERHa0lGNlBQSzhC?=
 =?utf-8?B?UUdpUDkwNDdxYmdib25QaE1YekJBTXVrUDRyUmQ0aTBPc3ZUd1orVDcwK0hH?=
 =?utf-8?B?bEpjZ2J2SEtSb01UZlk0ci9IMmV5UDlWeWUvMXJjeCt2ajMyRUxaZ2xsZDk3?=
 =?utf-8?B?YkQra0xVcTNsZHB6dHNSaWt3RUxNaTdESnZiL3FSRW9jKzhpOFZjaFZnUXhO?=
 =?utf-8?B?VmUrUklVdDc3VGFUcWZ2Nm4yUUcyUG5Welh3YytmNnczQ3BsMEFGTFNwenJU?=
 =?utf-8?B?ZXh2cDZ0WWgxcG5GN2wwYVVFcWZ0cVp0SFpwdk53RFN3ZjJEYis1d1JaaW1E?=
 =?utf-8?B?MFBpc0grdldDekZzU3hKd2tWWW9tOFBTWmNBQmtxNkx4UWdMMjlNNGpXMVor?=
 =?utf-8?B?dC8zZmpyNzJGcnhJRnRQOHB6YkdHelBSSVhibkpJQ2JuZEFTMERLVC94d25V?=
 =?utf-8?B?eXZEWFBKSXBDblpwbWRRZkxScTlvVW5nTFdSaXNZRVZxU0dGUHhzLzlvb0Ns?=
 =?utf-8?B?VWk1Njd2SkJ5clNXZkZXOC9PV0hZVEVvSmpZd1F2d1pneWE5WldpUjNIRUFV?=
 =?utf-8?B?ZjIzQWRDaUliTmQ5Ky9Db05wS2JsdVlldHVoZ3U4KzZoUDdXenA4Y3cwS3E1?=
 =?utf-8?B?dkVYT1VqMTFIOGZaWnV3NnFZaUpnZFRWT1JyUG84RnlSUUxRRDU5OWpQb3Ix?=
 =?utf-8?B?NDM3RUxaNkMvaWw0WGhQcXZ4K3E2NXhld0xaa1pxc2FQSDFpZnFyYTM1QUpU?=
 =?utf-8?B?Nld3TFM0b3hBbnJ3dVVHRzFocmxPSlNhYzhlbmZCa08rTVRBUEpxNEtlS1RC?=
 =?utf-8?B?Z2FYQWViVUNVUmlvS2RVTUFvQktaYTdIbjZEMzROeDlHMnBtOU84b3Bwd0Nz?=
 =?utf-8?B?aUpFQldDWlRhU0xFVkNYV2RjdUc3d2FEb2RpVVZUQzhuRzRKUmdoYXNZU2xB?=
 =?utf-8?B?SkR4WU5xOERNejVZVXlNdno5OFhuTXdOcW82MEwrUm1yVXZuY2xnSlY3VkRa?=
 =?utf-8?B?alUrVi9tWjE4RFNRUVUxVFZzeEhHTzJSeTVVUGtrNmpUVkwra3BLNG1nZnRN?=
 =?utf-8?B?cC9MQzBPd0dNcjlWUTdWWWhYVlF5NlJPUHNJM1VIYkhOWTUzdnBUc3dmS3J3?=
 =?utf-8?B?SUdaQ3lzWms0ZUc4RktMZXFZM0lRbUlpQ1lEbDh4czNCcUhjZzNwL0diV2RF?=
 =?utf-8?B?bVc1OStERitodEd0dkcxWWNqeDFwQllLdzZzQmkwV2QrSjBsWTZKMU5lbzZ0?=
 =?utf-8?B?MEgyak9oWCtrVloyMDJsZkFNeDRGQjY5aWJkQkhKZXJXU0ZFRTdCaXFNOVZH?=
 =?utf-8?B?eGE0SWNvbHZvTStFRGx1K0ZnTDVKQ05aTVBXM05VNlZLZmFLODdMR09FSWEy?=
 =?utf-8?B?dW1yQUxPOUFBVWhMV0xxQXU0U1hybklXdmYwZlhhQkhTSW1WaVBxb3NHVnMx?=
 =?utf-8?B?U2dyeHgyeGY4cHVpaTFpRkJ0R0dneW5xNnZMNy9BTWJrY0FhTEZsV0VrQlIw?=
 =?utf-8?B?WXR0S2xuOUtZaWdnYTBnVzU4MS9saGlBKzltR0EvWVIrU1d4L2V3K1RmNE9S?=
 =?utf-8?B?ZnRmNmpadncrVk1aQVhCcFhmMThjWGlOVzQxTkc2TWR2eWtiNzVYNmVkVEZj?=
 =?utf-8?B?cDA5SlJUUTdQVmdoNmthRkdXN0RmN1g5TldSajVoaEpHd0c0YW96S05qZzZa?=
 =?utf-8?B?TGVPQlBPc245ZUFwN0RRaEQ2d29PUmt5THhnREZKMEZMWHhBRnZoL0NDY01j?=
 =?utf-8?B?c1VxQTY2eDQrUFMzK3RJaWVlWFJYeTdFQXNDSllkcGhIQWVFcFZPNjNIc0Ry?=
 =?utf-8?B?allRRnRrcFNLcG96ZlBnZUpDYVpVTkNNQXZ3aCtOdFdOT2dja3lJWkRNNkd6?=
 =?utf-8?B?aEFuM2dhTEsrY25ZYjJmeTRPQ3pqYW1GOFcvdTUzM3U5WGtKeVFPdUorVURC?=
 =?utf-8?B?ek1ldFZGN2pQelBMNWhnTWNtQTBoQkxCZXA3WXRYUytua3pWQTJiK1lDM2ZX?=
 =?utf-8?B?U0JqREp4amNKNEdkb21mbDNCbFpmMWdZSDJBRW1PZW9XWmRGdFFMM0owS1Vn?=
 =?utf-8?B?RUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 214c2b61-a0f4-4c63-b799-08dd68608b35
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8570.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 10:10:01.9668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: geKyKrEf93Rbwp1V6yf3yptHCtTRqeU9OX+Z28P2dF1XN4Y8dAxfySCrfZ+abDA7dqaZFUbmg1Wssq5ch/kjArNViuXAXI1dr0ci44cunws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8669
X-Proofpoint-ORIG-GUID: wg_dnOrNyPTknqp2ZgaH-9e8sNOkoNSP
X-Proofpoint-GUID: wg_dnOrNyPTknqp2ZgaH-9e8sNOkoNSP
X-Authority-Analysis: v=2.4 cv=NY/m13D4 c=1 sm=1 tr=0 ts=67dd3afe cx=c_pps a=o99l/OlIsmxthp48M8gYaQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=iGHA9ds3AAAA:8 a=e_rVToSkAAAA:8 a=zfDz3bfgAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=LYVmv8Sl0YxWvGshb9oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=e1voVQ3DZqjPwdPl1qIA:9 a=rojjVzYvmEhS3MUi:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=-apfV7JZ--ObHKUXg5fw:22 a=N25aw_RMdTD0XpBlQSev:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_04,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1011 mlxlogscore=999 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503210074
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 21 Mar 2025 10:10:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9171

--------------HKoyKM5vYyHwhb5T4mvWVEKj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52L7qvvi006969

Hi, Bruce

Thanks very much!

Paul

On 3/21/25 03:28, Bruce Ashfield wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
> I haven't forgotten about this, I'm just overloaded trying to complete=20
> some package upgrades and will get to pending patches shortly.
>
> Bruce
>
> On Tue, Mar 11, 2025 at 2:57=E2=80=AFAM Zhang, Peng (Paul) (CN) via=20
> lists.yoctoproject.org=20
> <https://urldefense.com/v3/__http://lists.yoctoproject.org__;!!AjveYdw8=
EvQ!fyjHHpqvIL2T09f253eB3Gu5TOFkR8-UdswtupGd91EHYkU-Czz9qwcoyUst6aWoDXNEG=
-w3uvr3l_blq8lxfsBO01UWXkj4$>=20
> <peng.zhang1.cn=20
> <https://urldefense.com/v3/__http://peng.zhang1.cn__;!!AjveYdw8EvQ!fyjH=
HpqvIL2T09f253eB3Gu5TOFkR8-UdswtupGd91EHYkU-Czz9qwcoyUst6aWoDXNEG-w3uvr3l=
_blq8lxfsBO0x6vyBnP$>=3Dwindriver.com@lists.yoctoproject.org>=20
> wrote:
>
>     From: Zhang Peng <peng.zhang1.cn@windriver.com>
>
>     CRI-O version 1.31 and later defaults to crun instead of runc.
>     This change cause ptests to fail if crun is not installed on the
>     target system, as the test runner verifies the runtime's availabili=
ty
>     using 'command -v "$CONTAINER_DEFAULT_RUNTIME"'.
>
>     Additionally, CRI-O specifies the runtime via the
>     VIRTUAL-RUNTIME_container_runtime variable as a dependency.
>
>     This commit explicitly sets the CONTAINER_DEFAULT_RUNTIME environme=
nt
>     variable within the run-ptest script, based on the value of
>     VIRTUAL-RUNTIME_container_runtime. This ensures ptests execute with
>     the expected container runtime.
>
>     Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
>     ---
>     =C2=A0recipes-containers/cri-o/cri-o_git.bb
>     <https://urldefense.com/v3/__http://cri-o_git.bb__;!!AjveYdw8EvQ!fy=
jHHpqvIL2T09f253eB3Gu5TOFkR8-UdswtupGd91EHYkU-Czz9qwcoyUst6aWoDXNEG-w3uvr=
3l_blq8lxfsBO0285Nrba$>
>     | 10 ++++++++++
>     =C2=A01 file changed, 10 insertions(+)
>
>     diff --git a/recipes-containers/cri-o/cri-o_git.bb
>     <https://urldefense.com/v3/__http://cri-o_git.bb__;!!AjveYdw8EvQ!fy=
jHHpqvIL2T09f253eB3Gu5TOFkR8-UdswtupGd91EHYkU-Czz9qwcoyUst6aWoDXNEG-w3uvr=
3l_blq8lxfsBO0285Nrba$>
>     b/recipes-containers/cri-o/cri-o_git.bb
>     <https://urldefense.com/v3/__http://cri-o_git.bb__;!!AjveYdw8EvQ!fy=
jHHpqvIL2T09f253eB3Gu5TOFkR8-UdswtupGd91EHYkU-Czz9qwcoyUst6aWoDXNEG-w3uvr=
3l_blq8lxfsBO0285Nrba$>
>     index 1ef32ab0..4622e8d7 100644
>     --- a/recipes-containers/cri-o/cri-o_git.bb
>     <https://urldefense.com/v3/__http://cri-o_git.bb__;!!AjveYdw8EvQ!fy=
jHHpqvIL2T09f253eB3Gu5TOFkR8-UdswtupGd91EHYkU-Czz9qwcoyUst6aWoDXNEG-w3uvr=
3l_blq8lxfsBO0285Nrba$>
>     +++ b/recipes-containers/cri-o/cri-o_git.bb
>     <https://urldefense.com/v3/__http://cri-o_git.bb__;!!AjveYdw8EvQ!fy=
jHHpqvIL2T09f253eB3Gu5TOFkR8-UdswtupGd91EHYkU-Czz9qwcoyUst6aWoDXNEG-w3uvr=
3l_blq8lxfsBO0285Nrba$>
>     @@ -117,6 +117,16 @@ do_install_ptest() {
>     =C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/bin
>     =C2=A0 =C2=A0 =C2=A0cp -rf ${S}/src/import/test ${D}${PTEST_PATH}
>     =C2=A0 =C2=A0 =C2=A0cp -rf ${S}/src/import/bin ${D}${PTEST_PATH}
>     +=C2=A0 =C2=A0 # CRI-O testing changed the default container runtim=
e from
>     runc to crun in version 1.31+.
>     +=C2=A0 =C2=A0 # To maintain compatibility with older tests expecti=
ng runc,
>     and to allow for other custom runtimes,
>     +=C2=A0 =C2=A0 # this section explicitly sets CONTAINER_DEFAULT_RUN=
TIME in
>     the run-ptest script.
>     +=C2=A0 =C2=A0 # The value is determined by the
>     VIRTUAL-RUNTIME_container_runtime variable.
>     +=C2=A0 =C2=A0 if [ "${VIRTUAL-RUNTIME_container_runtime}" =3D "vir=
tual-runc"
>     ]; then
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i '/^.\/test\/test_runner/iexport
>     CONTAINER_DEFAULT_RUNTIME=3Drunc' ${D}${PTEST_PATH}/run-ptest
>     +=C2=A0 =C2=A0 else
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i '/^.\/test\/test_runner/iexport
>     CONTAINER_DEFAULT_RUNTIME=3D${VIRTUAL-RUNTIME_container_runtime}'
>     ${D}${PTEST_PATH}/run-ptest
>     +=C2=A0 =C2=A0 fi
>     +
>     =C2=A0}
>
>     =C2=A0FILES:${PN}-config =3D "${sysconfdir}/crio/config/*"
>     --=20
>     2.34.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#9162):
>     https://lists.yoctoproject.org/g/meta-virtualization/message/9162
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-=
virtualization/message/9162__;!!AjveYdw8EvQ!fyjHHpqvIL2T09f253eB3Gu5TOFkR=
8-UdswtupGd91EHYkU-Czz9qwcoyUst6aWoDXNEG-w3uvr3l_blq8lxfsBO0xPfE-7k$>
>     Mute This Topic:
>     https://lists.yoctoproject.org/mt/111635727/1050810
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/1116=
35727/1050810__;!!AjveYdw8EvQ!fyjHHpqvIL2T09f253eB3Gu5TOFkR8-UdswtupGd91E=
HYkU-Czz9qwcoyUst6aWoDXNEG-w3uvr3l_blq8lxfsBO0z9cDloz$>
>     Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>     <mailto:meta-virtualization%2Bowner@lists.yoctoproject.org>
>     Unsubscribe:
>     https://lists.yoctoproject.org/g/meta-virtualization/unsub
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-=
virtualization/unsub__;!!AjveYdw8EvQ!fyjHHpqvIL2T09f253eB3Gu5TOFkR8-Udswt=
upGd91EHYkU-Czz9qwcoyUst6aWoDXNEG-w3uvr3l_blq8lxfsBO01u_Mjbd$>
>     [bruce.ashfield@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await=20
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
--------------HKoyKM5vYyHwhb5T4mvWVEKj
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52L7qvvi006969

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p>Hi, Bruce</p>
    <p>Thanks very much!</p>
    <p>Paul<br>
    </p>
    <div class=3D"moz-cite-prefix">On 3/21/25 03:28, Bruce Ashfield wrote=
:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4NunB_=3DY6Z4iO050D-YB9OR=
trBpwsTGUR33aOwopXbvkw@mail.gmail.com">
     =20
      <strong>
      </strong>
      <div style=3D"border:solid #9c6500 1pt;padding:2pt;background:#fcfc=
03"><strong><class=3D"msonormal" style=3D"line-height:11pt"><span style=3D=
"font-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class=3D=
"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_default" style=3D"font-size:small">
            <div class=3D"gmail_default">I haven't forgotten about this,
              I'm just overloaded trying to complete some package
              upgrades and will get to pending patches shortly.</div>
            <div class=3D"gmail_default"><br>
            </div>
            <div class=3D"gmail_default">Bruce</div>
          </div>
        </div>
        <br>
        <div class=3D"gmail_quote gmail_quote_container">
          <div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 11, 2025 at
            2:57=E2=80=AFAM Zhang, Peng (Paul) (CN) via
            <a href=3D"https://urldefense.com/v3/__http://lists.yoctoproj=
ect.org__;!!AjveYdw8EvQ!fyjHHpqvIL2T09f253eB3Gu5TOFkR8-UdswtupGd91EHYkU-C=
zz9qwcoyUst6aWoDXNEG-w3uvr3l_blq8lxfsBO01UWXkj4$" moz-do-not-send=3D"true=
">
              lists.yoctoproject.org</a> &lt;<a href=3D"https://urldefens=
e.com/v3/__http://peng.zhang1.cn__;!!AjveYdw8EvQ!fyjHHpqvIL2T09f253eB3Gu5=
TOFkR8-UdswtupGd91EHYkU-Czz9qwcoyUst6aWoDXNEG-w3uvr3l_blq8lxfsBO0x6vyBnP$=
" moz-do-not-send=3D"true">peng.zhang1.cn</a>=3D<a href=3D"mailto:windriv=
er.com@lists.yoctoproject.org" moz-do-not-send=3D"true" class=3D"moz-txt-=
link-freetext">windriver.com@lists.yoctoproject.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            From: Zhang Peng &lt;<a href=3D"mailto:peng.zhang1.cn@windriv=
er.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-=
freetext">peng.zhang1.cn@windriver.com</a>&gt;<br>
            <br>
            CRI-O version 1.31 and later defaults to crun instead of
            runc.<br>
            This change cause ptests to fail if crun is not installed on
            the<br>
            target system, as the test runner verifies the runtime's
            availability<br>
            using 'command -v &quot;$CONTAINER_DEFAULT_RUNTIME&quot;'.<br=
>
            <br>
            Additionally, CRI-O specifies the runtime via the<br>
            VIRTUAL-RUNTIME_container_runtime variable as a dependency.<b=
r>
            <br>
            This commit explicitly sets the CONTAINER_DEFAULT_RUNTIME
            environment<br>
            variable within the run-ptest script, based on the value of<b=
r>
            VIRTUAL-RUNTIME_container_runtime. This ensures ptests
            execute with<br>
            the expected container runtime.<br>
            <br>
            Signed-off-by: Zhang Peng &lt;<a href=3D"mailto:peng.zhang1.c=
n@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-=
txt-link-freetext">peng.zhang1.cn@windriver.com</a>&gt;<br>
            ---<br>
            &nbsp;recipes-containers/cri-o/<a href=3D"https://urldefense.=
com/v3/__http://cri-o_git.bb__;!!AjveYdw8EvQ!fyjHHpqvIL2T09f253eB3Gu5TOFk=
R8-UdswtupGd91EHYkU-Czz9qwcoyUst6aWoDXNEG-w3uvr3l_blq8lxfsBO0285Nrba$" re=
l=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">cri-o_git.bb<=
/a>
            | 10 ++++++++++<br>
            &nbsp;1 file changed, 10 insertions(+)<br>
            <br>
            diff --git a/recipes-containers/cri-o/<a href=3D"https://urld=
efense.com/v3/__http://cri-o_git.bb__;!!AjveYdw8EvQ!fyjHHpqvIL2T09f253eB3=
Gu5TOFkR8-UdswtupGd91EHYkU-Czz9qwcoyUst6aWoDXNEG-w3uvr3l_blq8lxfsBO0285Nr=
ba$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">cri-o_=
git.bb</a>
            b/recipes-containers/cri-o/<a href=3D"https://urldefense.com/=
v3/__http://cri-o_git.bb__;!!AjveYdw8EvQ!fyjHHpqvIL2T09f253eB3Gu5TOFkR8-U=
dswtupGd91EHYkU-Czz9qwcoyUst6aWoDXNEG-w3uvr3l_blq8lxfsBO0285Nrba$" rel=3D=
"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">cri-o_git.bb</a><=
br>
            index 1ef32ab0..4622e8d7 100644<br>
            --- a/recipes-containers/cri-o/<a href=3D"https://urldefense.=
com/v3/__http://cri-o_git.bb__;!!AjveYdw8EvQ!fyjHHpqvIL2T09f253eB3Gu5TOFk=
R8-UdswtupGd91EHYkU-Czz9qwcoyUst6aWoDXNEG-w3uvr3l_blq8lxfsBO0285Nrba$" re=
l=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">cri-o_git.bb<=
/a><br>
            +++ b/recipes-containers/cri-o/<a href=3D"https://urldefense.=
com/v3/__http://cri-o_git.bb__;!!AjveYdw8EvQ!fyjHHpqvIL2T09f253eB3Gu5TOFk=
R8-UdswtupGd91EHYkU-Czz9qwcoyUst6aWoDXNEG-w3uvr3l_blq8lxfsBO0285Nrba$" re=
l=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">cri-o_git.bb<=
/a><br>
            @@ -117,6 +117,16 @@ do_install_ptest() {<br>
            &nbsp; &nbsp; &nbsp;install -d ${D}${PTEST_PATH}/bin<br>
            &nbsp; &nbsp; &nbsp;cp -rf ${S}/src/import/test ${D}${PTEST_P=
ATH}<br>
            &nbsp; &nbsp; &nbsp;cp -rf ${S}/src/import/bin ${D}${PTEST_PA=
TH}<br>
            +&nbsp; &nbsp; # CRI-O testing changed the default container =
runtime
            from runc to crun in version 1.31+.<br>
            +&nbsp; &nbsp; # To maintain compatibility with older tests e=
xpecting
            runc, and to allow for other custom runtimes,<br>
            +&nbsp; &nbsp; # this section explicitly sets
            CONTAINER_DEFAULT_RUNTIME in the run-ptest script.<br>
            +&nbsp; &nbsp; # The value is determined by the
            VIRTUAL-RUNTIME_container_runtime variable.<br>
            +&nbsp; &nbsp; if [ &quot;${VIRTUAL-RUNTIME_container_runtime=
}&quot; =3D
            &quot;virtual-runc&quot; ]; then<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; sed -i '/^.\/test\/test_runner/i=
export
            CONTAINER_DEFAULT_RUNTIME=3Drunc' ${D}${PTEST_PATH}/run-ptest=
<br>
            +&nbsp; &nbsp; else<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; sed -i '/^.\/test\/test_runner/i=
export
            CONTAINER_DEFAULT_RUNTIME=3D${VIRTUAL-RUNTIME_container_runti=
me}'
            ${D}${PTEST_PATH}/run-ptest<br>
            +&nbsp; &nbsp; fi<br>
            +<br>
            &nbsp;}<br>
            <br>
            &nbsp;FILES:${PN}-config =3D &quot;${sysconfdir}/crio/config/=
*&quot;<br>
            -- <br>
            2.34.1<br>
            <br>
            <br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#9162): <a href=3D"https://urldefense.com/=
v3/__https://lists.yoctoproject.org/g/meta-virtualization/message/9162__;=
!!AjveYdw8EvQ!fyjHHpqvIL2T09f253eB3Gu5TOFkR8-UdswtupGd91EHYkU-Czz9qwcoyUs=
t6aWoDXNEG-w3uvr3l_blq8lxfsBO0xPfE-7k$" rel=3D"noreferrer" target=3D"_bla=
nk" moz-do-not-send=3D"true">
https://lists.yoctoproject.org/g/meta-virtualization/message/9162</a><br>
            Mute This Topic: <a href=3D"https://urldefense.com/v3/__https=
://lists.yoctoproject.org/mt/111635727/1050810__;!!AjveYdw8EvQ!fyjHHpqvIL=
2T09f253eB3Gu5TOFkR8-UdswtupGd91EHYkU-Czz9qwcoyUst6aWoDXNEG-w3uvr3l_blq8l=
xfsBO0z9cDloz$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"t=
rue">
              https://lists.yoctoproject.org/mt/111635727/1050810</a><br>
            Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@li=
sts.yoctoproject.org" target=3D"_blank" moz-do-not-send=3D"true">
              meta-virtualization+owner@lists.yoctoproject.org</a><br>
            Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://l=
ists.yoctoproject.org/g/meta-virtualization/unsub__;!!AjveYdw8EvQ!fyjHHpq=
vIL2T09f253eB3Gu5TOFkR8-UdswtupGd91EHYkU-Czz9qwcoyUst6aWoDXNEG-w3uvr3l_bl=
q8lxfsBO01u_Mjbd$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">
              https://lists.yoctoproject.org/g/meta-virtualization/unsub<=
/a>
            [<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank=
" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">bruce.ashfield=
@gmail.com</a>]<br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            <br>
          </blockquote>
        </div>
        <div><br clear=3D"all">
        </div>
        <div><br>
        </div>
        <span class=3D"gmail_signature_prefix">-- </span><br>
        <div dir=3D"ltr" class=3D"gmail_signature">- Thou shalt not follo=
w
          the NULL pointer, for chaos and madness await thee at its end<b=
r>
          - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
          <br>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------HKoyKM5vYyHwhb5T4mvWVEKj--

