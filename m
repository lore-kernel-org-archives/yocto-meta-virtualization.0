Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E96CD75BDB
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 09:13:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6815.1732180382325054846
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 01:13:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=105524278e=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL511uC016037;
	Thu, 21 Nov 2024 01:13:01 -0800
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2043.outbound.protection.outlook.com [104.47.51.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xusq54r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 01:13:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x04EE0Qx0/fUGqX3BptvDSB/BmXK4idyc+ZPrD58W5aO3g+fR7bXTmGI/VU+6U5uapBgqLgnpmk9m3EBvFb/QJlHFZqtEBTwDqjRhsh+RsYFYDs0KZKuOejidNKMRnasX0z6HpcufUYJNDSQNox2UtcNTitQ+9T3+m73LeVUOpEjxqp4l1imUtNoEdeccZ4nMlKKphe0nb19/NBVUz+KKbL6521f41ay2FUwN4IEL28kDrCFSGPPs+kGdKUvlpnRfryVx4JtWfueOCYkRcYw5gQbLIrYJ49FLoYBl2rSej6IaFh6IzDfXhgc0Frk3L67T41cYv204vXyGdF1zlPN7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTRnnqznqQy5BYr6VnY+MQ3cMqOcNeQ3AvbtPiA7b4Y=;
 b=YW9DLTXx4UnbOUNy4bCD5ARrAVi1mS55/PDmJ5Yu9iUDdu8wfd4hRG5V7CVq6AkqwXrytUOX/7jYruO4Lc15LiztiF5yx7m+4+3JJ4kaqYkbqr+O8VfSsr22Zto/FS4DjACUa8g9kcdmh+QK/z3AVmb7q5/TtEPYdMUq+l9NtbIewg7WKy54ZfgT9jNcMiVfevhYBvyYK4TZF8apaXny8CTmhzJM/6gVV47L+VpoRJDYd5/u8ItgissbxHr4nLoIlGe4dhLG38O8n35Sxg2yZmrt0SF0nFVx/Mp3I06YWjFzcvxMpukuECcRRdNVaewXQo9H6Ds+RpaggrlgjWUpoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB8570.namprd11.prod.outlook.com (2603:10b6:510:2ff::7)
 by CH3PR11MB7369.namprd11.prod.outlook.com (2603:10b6:610:14d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 09:12:53 +0000
Received: from PH7PR11MB8570.namprd11.prod.outlook.com
 ([fe80::d870:a7c3:6433:11d4]) by PH7PR11MB8570.namprd11.prod.outlook.com
 ([fe80::d870:a7c3:6433:11d4%5]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 09:12:53 +0000
Message-ID: <b86724f6-f3c9-47fb-878c-549a3c3d0b0c@windriver.com>
Date: Thu, 21 Nov 2024 17:12:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][PATCH] cri-o: enable ptest
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20241115141231.1778125-1-peng.zhang1.cn@windriver.com>
 <Zz64Vljz9C29rI2H@gmail.com>
Content-Language: en-US
From: "Zhang, Peng (Paul) (CN)" <peng.zhang1.cn@windriver.com>
In-Reply-To: <Zz64Vljz9C29rI2H@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:54::15) To PH7PR11MB8570.namprd11.prod.outlook.com
 (2603:10b6:510:2ff::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8570:EE_|CH3PR11MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c3e1475-4851-441b-4da6-08dd0a0cadc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|4022899009|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eWxTNjNNbW5qRThjNmR0ZTRxcnJMZkhKVFQ1Z1ZSblRDbUdmeDRLVFFqWmFY?=
 =?utf-8?B?T0d1SWdFaXYySW4rQzdDd1ptZ1dpNWNwbHVrR01pL3ViZ2h2SkU0OVdrTWNS?=
 =?utf-8?B?dThiZFpNWVVEU3U3bHptaUxDdCtwMGZqM2xQU1FiNGhnMXB0NFh5UzhSQmVJ?=
 =?utf-8?B?dWtqcDJWcC9DNmZRQTVwTi9Vby94V29QRXhQRlJVejJlTHlZZDNnWWowQTlT?=
 =?utf-8?B?YnlNanM3eDFzYnMyd09uUU5oUmF5RXc1bVpRR2Q3d3hTWlA4bFkyT3p1Z1hr?=
 =?utf-8?B?SUl6bkdiVXQ1K2pIZ0pNUkd4NnhsN2RBNW12RG5Vb0xobVdoS0I3Ny9malln?=
 =?utf-8?B?dnJUVE12aWxqM0NNbTVjZXlqdUl1emlwSjRiaENZWWlaRzJmN3h2YWtGNDBa?=
 =?utf-8?B?cWZ3TGUwQjFCOHZ3Y0JrUnJwclBqWHU0WHVCelZ6VmVWWGZvOUx1c25XeFVk?=
 =?utf-8?B?aCtUbFZFSkY3M3J1elVyWmRlajNaRTI3cWg3QU1TRkpvM1o0MXJVOHhQUmF5?=
 =?utf-8?B?YktucmhyTm5lOHBiQWgzNTQ1UTR5RG1WZzM5Rlk1SnVpNmVoN2VjTUdjMEhM?=
 =?utf-8?B?SVlxS0JzekM1bHRjeXU2L0dySXRaV2pQSTBVaDZaZ0V6VUJUaHczTUZIemlK?=
 =?utf-8?B?cEw2eUJ4QXRqTTg1cnBSMm9JSTlReGlUckdMZGhkOStPaWJhSWFZTDRNazMr?=
 =?utf-8?B?M0RFNWZVUWh2NGczaXFRbGdDSko0a3c3ZUtGQkVJbTg5QUMwOFJycW9IeDNn?=
 =?utf-8?B?NHhZNFRJUk1CMUFsWGRBb2psRXRHak5JMWYwcTRLREZvcjA4R0k2SDA1MW4z?=
 =?utf-8?B?RjZ2WHVXK2pFNzI2T3pPWnM2TVBrYk1xZ0ErN1ozZVhjcVF0aFJZNUErbXpF?=
 =?utf-8?B?MTlqK3lReW9RTzlzVndaZUJKSE0wQ0J2SEd3MWZBNHlRWVM2VmR3czh5NWZW?=
 =?utf-8?B?ZlE5am5uQ0loZEcycXVvdGZnc2k1eStyV1BrbU13UXNvRmNzakdRWGEwNnVW?=
 =?utf-8?B?L25kcS9KZWszcGhOL0dYblBaSysvWGl6cG1RS2cxcjVmNmhYcjIwZWhmdVNo?=
 =?utf-8?B?SGhDbnN4cG9lV1hKSDlNMy9kRmFmNmJYbU1KNFZ4SU9WYWVmYnJZelZ4b2NP?=
 =?utf-8?B?U1VWMkU0bk0vVHQwb2h2aC9NK3N1UDZWVmtWY1V6UHRhdmlIYXZpN3JvVXNx?=
 =?utf-8?B?L0cvdGpUZHZqVExYTE5QT1hpSG5GUUQ0TGk0bW5QS2IzREk5RWExZWpTb0N1?=
 =?utf-8?B?QkRxMDNEQ2VmdS9yS1lrRjlkYnNTNnJDWHhnRDkrdnJOaTFic0tYWUV6MEFm?=
 =?utf-8?B?OG1EZzdWSm1DNVNpOERnUGRuSHNUMmdsMGdZL1VyZi90ZmxjZkx4SVordWZV?=
 =?utf-8?B?anNwc2RBL3kwMGdYRXJkcDJVZVY2NzZEZkRGVDdGQlZzK1gwbU9rREVQTDFS?=
 =?utf-8?B?bTcwQ2VuVGxFUDMvQmo4TTFyRHhCZDZvTVdIT1UzaDB2NWNZN3A5cnE1ZmdU?=
 =?utf-8?B?bTM5aTNoQnJWNzlpZ1VBaXZXaEF3TDJGWk5md1FMdFJEK0QxT2hybE1MSHF2?=
 =?utf-8?B?cERDeWxCS0VQVXJiVnhEQVNqRm1OZ29OZ3VzREVnaEdhZnJoNUpMeDZQOEN2?=
 =?utf-8?B?OU9UQkVqaWFERUY3b0tQQWh5TDRJaHA5RmppM0V2OU43YXU4REo5UnhsZDZS?=
 =?utf-8?B?aXh0OGlwWGtQaEhiU0o1TDg2S1ZiWlVoMGhQbTFFUzdKNnZzTjJKR0ZRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB8570.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Wmpyc1prSDNoTldzTmNzQzB3emhLak9uYkJJM2Z1TWhmZTl1YXZvRS9hRFpW?=
 =?utf-8?B?K29WZnYwbksxTDdoRkk4N1ZHWjJ4cUlTa3VSN1NxYjhVR0tzeUQvQUNvYXlR?=
 =?utf-8?B?SVRXMXlGZHR1ZVZYRlQwalhBd1g1SkU1aWxYYmlueG9OR1NZbEIra0dqZWJC?=
 =?utf-8?B?VGttMnVlVzBwUU0ycUxjR3NnZFZLTFFNalY2VE9JUnhRLzBxaHVmMENSNCt1?=
 =?utf-8?B?SjBOb2VsZW53eFpkK2Q2NHZWWk5zeXdQWmF1TzNkd0FRMmJLS1c4OFRHYTVC?=
 =?utf-8?B?MnlhWW1VWWdoWCsxMjhvYlZGYzMydmtBSkROSUJkcVl2MjU3emhlRHgrQWZK?=
 =?utf-8?B?UmZiU00wWkl0aXY2MkgwK05HS0poN21sVFZ1WEdWaGtUeERiaDduYUNCU3p3?=
 =?utf-8?B?cTZCQmNSNk1kdnZ5RWxybzI1RFdjTjdqT2RBeklNajBlL2R6TVN0TThreDBv?=
 =?utf-8?B?bTVpa2lxeGJxY3hzUVBCaDlxdjU4TjJRRnB2STRpN0ZrU2oyc0ozVG9mNytM?=
 =?utf-8?B?N0VSMnpvSy95MHUrNkpJaXNyaXpmQ0JBc1NSMEdIb1VDY0VLTWRmUHFBb21G?=
 =?utf-8?B?V2ZmT01iNzFGLzJCUDJmRU0xai9ERmpHTmN3N3Q1MHp5Y2JhWGFMVU1tVzdr?=
 =?utf-8?B?cE5ZSU5OUDhMa3lpSGtkbTBnMndUN0ZrVkE3MkMyVHRVSmhxY1MvM1p0WUp4?=
 =?utf-8?B?MDAza0YzMGo2c0dvekdCaXkwYXZXQnI2RHRtSVFkWDgvZG1VeFlpaHAzbkRu?=
 =?utf-8?B?RlArL2Jub1JxRmlHeStrNVVLbjg5Z08wczdWby9wZmY3SUVvSzArZU1MNG83?=
 =?utf-8?B?bUtsaTJTT1lHajI3Qi9zbDFtdXlGSWk4MWNsaHF6MGQ3S1JYSlUxMWd4ZThN?=
 =?utf-8?B?SmJOYWlTdnM0Wms4dXgxUEJneTFJT0g5N2llRHo3bmlRNnpYL2FndjV3NmRT?=
 =?utf-8?B?d2RMLzZDRHJSRzVyWjVPV0djME56U0V1T21adnRLVy9KWUFrd0dDemtMMmNt?=
 =?utf-8?B?dUhRbUJuWGliSThyYlJqWFBFNUJkOUt5T2NGQVcydjR2VjMwRGlMdXBIWDU4?=
 =?utf-8?B?Q0U1R0FJM3pQNUFqT0JzL1FEOUhCSjlWM2RDYXRob0d1Yk12aFAyUEc1eDhQ?=
 =?utf-8?B?ak1tTmpWQ20wcXN1STQ2bnNuM2M4T1Z2VWE3UmpqRmtSVzErR3BZZExOZVRN?=
 =?utf-8?B?bWVQUWhrRTZZYzlxTWlWOHJSaFFzektmOWhWK0JxMmk5c1hNWUZ2MlBwNU5r?=
 =?utf-8?B?Y3ZFcGxaZmFPZTB3eHlSam1iblp6NnR6MXBGbyt2dlFoZmNPV3pxdnluWm5E?=
 =?utf-8?B?eEFjSVpOQ282ZmVFSHBHUGJ1QzdSRHlJRGR2SFlsT0VLVXdDVEVBQVN0M3lm?=
 =?utf-8?B?TGZjd0dSTnZnKzlBV2hLNDUyYnNodVA3L2Yxbm1mQUx0aXlyYmwxS1ZCcjRu?=
 =?utf-8?B?aHgvU1BzaWNwb0NVcDIxVmQ1Um80K1pXcXB6VmpJNEQ4TWx5c0FwbjdpcWdB?=
 =?utf-8?B?d2VuTTBnWUo5SEpYYlpNeHlyMmRCNFJnY0U2elRqeUIyeW5Tc1dWSUpzc3ho?=
 =?utf-8?B?TC9KL1phU1NYaHNtdG03dG5NaFhnZjlnS1duak9YMUxqTGZyU2NaL3BOOWhJ?=
 =?utf-8?B?VCs2TTgyRUZxY0ZIQkZWb2Q0cHg0WDdBUkFJK0dhanFzMUpSMTdhcnlzZ2ZS?=
 =?utf-8?B?d0dDWHZnWThFb3JOdVVVSFNYY0ZJUUJNemxHbVZDSWwreTJ0RXFyWXdKWER5?=
 =?utf-8?B?bmNqTVNnazlVK0JwRzVmZUxkRG5pZWZpaG1VcU5RRFJXcXVqZGVjbHY4NWpq?=
 =?utf-8?B?Q1JhTzMwc3F3aVdFUFNaWUJvU3BQSmpQdGk5QmhxekoxQno4U2ZwWU9XekVB?=
 =?utf-8?B?bGRvdnQwNllWMTduV3VpalRhZzRtV1ZVSjhRYWh6Y0hsc0RpQ0lVQlBRVlg1?=
 =?utf-8?B?V0RVc1QrREtOQmV1bGoyMklmZWY2TFJ3WnoxT09WY3FoeEFiTi9Bc0dxcnd0?=
 =?utf-8?B?TXE4YWJJYlNLbnlBbGRUUWJtVlB0SVlIYXFIUXRCZ290elV0OUtpQUNXc1cx?=
 =?utf-8?B?SEM5ZzhlZ0l6bkJwNjAyZzlhWVRjbHF6cVhuYkdIWEhGR2l4L0xiclFBZTlQ?=
 =?utf-8?B?ejB5OFQ2aU82OTJ1TTlNTXVSQWhNS29zRG5OUEFiSzVQdUxmRFljdXEzZGFa?=
 =?utf-8?B?a3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3e1475-4851-441b-4da6-08dd0a0cadc0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8570.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 09:12:53.0402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: msPkAqdgjAwHKsyd9LolXzEXzg/4xoR+7f9cDRbwd+fQK6FJaNjL2CkznqGcosvuaubj++oL3QBxOMFYX/nFI4ycdIcrUTbTgk5dmJNC1jg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7369
X-Proofpoint-GUID: g-W2gbkG4tmKVZNBDW_cRAeBZ9zSZnks
X-Proofpoint-ORIG-GUID: g-W2gbkG4tmKVZNBDW_cRAeBZ9zSZnks
X-Authority-Analysis: v=2.4 cv=d9mnygjE c=1 sm=1 tr=0 ts=673ef99c cx=c_pps a=BUR/PSeFfUFfX8a0VQYRdg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10
 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=fSCxghzjbvFormXOEBcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-21_07,2024-11-20_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 impostorscore=0
 phishscore=0 clxscore=1011 malwarescore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411210071
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AL511uC016037
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Nov 2024 09:13:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8994


On 11/21/2024 12:34 PM, Bruce Ashfield wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> In message: [meta-virtualization][PATCH] cri-o: enable ptest
> on 15/11/2024 Zhang, Peng (Paul) (CN) via lists.yoctoproject.org wrote:
>
>> From: Zhang Peng <peng.zhang1.cn@windriver.com>
>>
>> The ptest build for cri-o was previously disabled due to issues
>> introduced with Go 1.11, which borken the build process. With the
>> current Go version, these issues no longer occur, and the ptest build =
is
>> now functional.
>> This commit enables ptest support and resolves the "TMPDIR
>> [buildpaths]" issue encountered during the ptest build process.
> Can you include a log of the ptest running in the commit log ?
> That way the baseline pass/fail is understood and captured.
The CRI-O ptest suite consists of a total of 382 tests. Including the=20
entire test results in the commit message would make it overly=20
cumbersome and difficult to navigate. Instead, I propose including only=20
the list of failed and skipped tests in the commit message, as these=20
provide the most critical information.
=EF=BB=BFAlternatively, the full test results could be stored in a README=
 or=20
another documentation file. This approach ensures the comprehensive test=20
results are preserved as a baseline without bloating the commit message.
=EF=BB=BFWould you prefer the abbreviated results in the commit message, =
or a=20
detailed log stored in a separate file?
>
>> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
>> ---
>>   recipes-containers/cri-o/cri-o_git.bb         | 37 +++++++++++++++++=
+-
>>   .../0001-Add-trimpath-to-build-nri.test.patch | 31 ++++++++++++++++
>>   recipes-containers/cri-o/files/run-ptest      | 11 ++++++
>>   3 files changed, 77 insertions(+), 2 deletions(-)
>>   create mode 100644 recipes-containers/cri-o/files/0001-Add-trimpath-=
to-build-nri.test.patch
>>   create mode 100644 recipes-containers/cri-o/files/run-ptest
>>
>> diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-container=
s/cri-o/cri-o_git.bb
>> index efc86fbe..596a43e2 100644
>> --- a/recipes-containers/cri-o/cri-o_git.bb
>> +++ b/recipes-containers/cri-o/cri-o_git.bb
>> @@ -17,7 +17,9 @@ At a high level, we expect the scope of cri-o to be =
restricted to the following
>>   SRCREV_cri-o =3D "20c06a19cb395445620c31730c0f1a0a1922eaae"
>>   SRC_URI =3D "\
>>        git://github.com/kubernetes-sigs/cri-o.git;branch=3Drelease-1.3=
1;name=3Dcri-o;protocol=3Dhttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX} \
>> +        file://0001-Add-trimpath-to-build-nri.test.patch \
>>           file://crio.conf \
>> +        file://run-ptest \
>>        "
>>
>>   # Apache-2.0 for docker
>> @@ -28,7 +30,7 @@ GO_IMPORT =3D "import"
>>
>>   PV =3D "1.31.0+git${SRCREV_cri-o}"
>>
>> -inherit features_check
>> +inherit features_check ptest
>>   REQUIRED_DISTRO_FEATURES ?=3D "seccomp"
>>
>>   DEPENDS =3D " \
>> @@ -69,6 +71,13 @@ do_compile() {
>>        oe_runmake binaries
>>   }
>>
>> +do_compile_ptest() {
>> +    set +e
>> +
>> +    cd ${S}/src/import
>> +
>> +    oe_runmake test-binaries
>> +}
>>   SYSTEMD_PACKAGES =3D "${@bb.utils.contains('DISTRO_FEATURES','system=
d','${PN}','',d)}"
>>   SYSTEMD_SERVICE:${PN} =3D "${@bb.utils.contains('DISTRO_FEATURES','s=
ystemd','crio.service','',d)}"
>>   SYSTEMD_AUTO_ENABLE:${PN} =3D "enable"
>> @@ -100,6 +109,14 @@ do_install() {
>>       install -d ${D}${localstatedir}/lib/crio
>>   }
>>
>> +do_install_ptest() {
>> +    install -d ${D}${PTEST_PATH}/test
>> +    install -d ${D}${PTEST_PATH}/bin
>> +    install -d ${D}${PTEST_PATH}/vendor
>> +    cp -rf ${S}/src/import/test ${D}${PTEST_PATH}
>> +    cp -rf ${S}/src/import/bin ${D}${PTEST_PATH}
>> +    cp -rf ${S}/src/import/vendor ${D}${PTEST_PATH}
>> +}
> I'm curious. Why does the vendor directory need to be
> copied / installed for the ptest ?
The ctr_seccomp.bats test requires a JSON file located at=20
vendor/github.com/containers/common/pkg/seccomp/seccomp.json. This file=20
is accessed via the CONTAINER_SECCOMP_PROFILE environment variable,=20
which defaults to the path within the vendor directory. Although this=20
variable can be overridden with a custom-defined path, the default=20
configuration relies on the vendor directory.
=EF=BB=BFThis dependency contributes to only two sub-tests passing within=
 the=20
suite. I share your concern about whether this folder should be=20
included. Another option is to allow ctr_seccomp.bats to fail by default=20
if the vendor directory is not installed.
=EF=BB=BFWould you recommend keeping the directory or accept the tests fa=
iled to=20
avoid requiring the vendor directory?
>
>>   FILES:${PN}-config =3D "${sysconfdir}/crio/config/*"
>>   FILES:${PN} +=3D "${systemd_unitdir}/system/*"
>>   FILES:${PN} +=3D "/usr/local/bin/*"
>> @@ -109,7 +126,23 @@ FILES:${PN} +=3D "/usr/share/containers/oci/hooks=
.d"
>>   ALLOW_EMPTY:${PN} =3D "1"
>>
>>   INSANE_SKIP:${PN} +=3D "ldflags already-stripped textrel"
>> +INSANE_SKIP:${PN}-ptest +=3D "textrel"
>>
>> -deltask compile_ptest_base
>> +RDEPENDS:${PN}-ptest +=3D " \
>> +    bash \
>> +    bats \
>> +    cni \
>> +    crictl \
>> +    bind-utils \
>> +    coreutils \
>> +    dbus-daemon-proxy \
>> +    iproute2 \
>> +    util-linux-unshare \
>> +    jq \
>> +    ipcalc \
>> +    slirp4netns \
>> +    parallel \
>> +    podman \
>> +"
> This is an extensive list of rdepends for a ptest.
> What exactly is it testing ? I think we need to document
> in a README what exactly is being tested, since this
> dependency list tells me that it is not trivial and it
> will be prone to breakage.
Given the suite's complexity, documenting the detailed purpose of each=20
dependency would be challenging and potentially incomplete, as many=20
dependencies are used across multiple tests.=C2=A0 However, I agree that =
a=20
README summarizing the primary focus areas of the tests (e.g.,=20
networking, security, etc.) could provide clarity and help maintainabilit=
y.

=EF=BB=BFLet me know if you=E2=80=99d prefer a high-level summary of the =
tests or=20
additional details in the README.

//Peng

> Bruce
>
>>   COMPATIBLE_HOST =3D "^(?!(qemu)?mips).*"
>> diff --git a/recipes-containers/cri-o/files/0001-Add-trimpath-to-build=
-nri.test.patch b/recipes-containers/cri-o/files/0001-Add-trimpath-to-bui=
ld-nri.test.patch
>> new file mode 100644
>> index 00000000..c6be41f0
>> --- /dev/null
>> +++ b/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.te=
st.patch
>> @@ -0,0 +1,31 @@
>> +From 0bf230f59d211044e7993543e010b0d7f9dcead3 Mon Sep 17 00:00:00 200=
1
>> +From: Peng Zhang <peng.zhang1.cn@windriver.com>
>> +Date: Fri, 25 Oct 2024 10:42:02 +0800
>> +Subject: [PATCH] Add --trimpath to build nri.test
>> +
>> +when build test-binary, TMPDIR[buildpaths] error found in nri.test
>> +to fix this error, add "--trimpath" option to build nri.test.
>> +
>> +Upstream-Status: Inappropriate [oe specific]
>> +
>> +Signed-off-by: Peng Zhang <peng.zhang1.cn@windriver.com>
>> +---
>> + Makefile | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +Index: cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae/src/i=
mport/Makefile
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae.orig/src=
/import/Makefile
>> ++++ cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae/src/impo=
rt/Makefile
>> +@@ -169,7 +169,7 @@ test/checkcriu/checkcriu: $(GO_FILES)
>> +     $(GO_BUILD) $(GCFLAGS) $(GO_LDFLAGS) -tags "$(BUILDTAGS)" -o $@ =
./test/checkcriu
>> +
>> + test/nri/nri.test: $(wildcard test/nri/*.go)
>> +-    $(GO) test --tags "test $(BUILDTAGS)" -c ./test/nri -o $@
>> ++    $(GO) test --tags "test $(BUILDTAGS)" -c ./test/nri -o $@ ${TRIM=
PATH}
>> +
>> + bin/crio: $(GO_FILES)
>> +     $(GO_BUILD) $(GCFLAGS) $(GO_LDFLAGS) -tags "$(BUILDTAGS)" -o $@ =
./cmd/crio
>> +--
>> +2.34.1
>> +
>> diff --git a/recipes-containers/cri-o/files/run-ptest b/recipes-contai=
ners/cri-o/files/run-ptest
>> new file mode 100644
>> index 00000000..62abe959
>> --- /dev/null
>> +++ b/recipes-containers/cri-o/files/run-ptest
>> @@ -0,0 +1,11 @@
>> +#!/bin/sh
>> +
>> +./test/test_runner.sh | while IFS=3D read -r line; do
>> +     if [[ $line =3D~ ^not\ ok ]]; then
>> +             echo "FAIL: ${line#not ok }"
>> +     elif [[ $line =3D~ ^ok && ! $line =3D~ \#\ skip ]]; then
>> +             echo "PASS: ${line#ok }"
>> +     elif [[ $line =3D~ ^ok.*#\ skip ]]; then
>> +             echo "SKIP: ${line#ok }"
>> +     fi
>> +done
>> --
>> 2.35.5
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#8971): https://lists.yoctoproject.org/g/meta-virtu=
alization/message/8971
>> Mute This Topic: https://lists.yoctoproject.org/mt/109593003/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsu=
b [bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

