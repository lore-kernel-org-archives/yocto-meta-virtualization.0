Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C352DF531E7
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 02:17:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9456.1776133033825447587
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Apr 2026 19:17:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BGRK5mEF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=85642e362d=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DNchlQ3860875;
	Mon, 13 Apr 2026 19:17:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=4jlTFmGDcupoNdui8M0pnq5VlS78/LThBTvwsvWsGk8=; b=
	BGRK5mEF9BFPpeNRJF5jgI8Sz5GOQ8YvjTZQmd8L3bUJUXtExT8vn0AUgT2oGw3r
	xYn6WGvX35SRCWSh8HtanSLn2vYbLXeh3Ut6eGwJwIeCV+Xogv2YWxJ9pd2ojkly
	f2JUOQXEp+5z6uljDk8Lz8cYsvMO/j6mTgb+G0ZqxvUv1/frffUjE93BxRk5KWew
	BtnWQy/6+rB7rIO89SKngk4dncBCjuG0TTyhb6XKet40zm+9SctnS9nxN7oJmZhU
	d/Qs9eJYzuJdC/F5YNoSz0PmvT8AVWmu9FvJCHqCnhPubYHd5dj/Pxdd+FawjKeJ
	F4pag8a0nxrVqTIum/0nVQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012067.outbound.protection.outlook.com [40.93.195.67])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh87mr6m9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 19:17:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gYfBdzOzWIpTQZHKyKYY2wkuZRZyLzTVNBwYn80nzIg7IiPXseLks+/g4+gf45LuQ4SqyPd62y3HqgcOE/AuaCy/cwW+1a35B+widzJk79PsrdGZ+93TiUo5Xkgcz7EmiyR0rLfd67JTMW6l7u0IV72XjeNCYE9M8O5RT+O+clYSxYTAxI4vrAxKdhoaG/sttyi5YJRlwK9v1mao4nt3fsPcfJ4pMo+n8Jy5ID2ESfAZ4umVHTPoM+87VAUuIJ1CGG06mkl4YIkaC0mwd15Id98YovBBPlAWs6w0BKLp2ttE+h/QMJLfWSxTW/WZsxu4qYK4UNXpRIxKflAgZMh25g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4jlTFmGDcupoNdui8M0pnq5VlS78/LThBTvwsvWsGk8=;
 b=VeYKf1QuH5uzSAVS7wMkpciOLk2lNyiyI65z8aPbgtF8Y6izxFBbnD/QF4FXF39IsBm7eJj28K55YEAI8exwtqKBdD7m7GZUaLrSvoIHncB136XJH5OgTWi6PFO5RI75Raa/IGor7LP02DzLSoR3B4/QUPjuMNNO88zhcypqtZJg24OZAxBZ+Pc74cBPFIH5rqJqNDWZuA71huob2k82+kqZAIprTEsi7/+lrSvNCa6XGVawQ8c759T2bUVkYKP+AfuBCqpN2klhKovCiS/BgsIq9QoJ9jg2hTih8ZOZBR7JRKHA1saIf3uqUuVyDdWkppJhTEW/shJzdSdXS3FMmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH8PR11MB6853.namprd11.prod.outlook.com (2603:10b6:510:22e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 02:17:09 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 02:17:09 +0000
Message-ID: <1805d421-2e6f-4dd3-835a-e187a3152eca@windriver.com>
Date: Tue, 14 Apr 2026 10:17:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][PATCH] libvirt-dbus: disable -Werror=inline
 to fix build error
To: tanguy.raufflet@savoirfairelinux.com,
        meta-virtualization@lists.yoctoproject.org
Cc: paul.leguendekerneizon@savoirfairelinux.com
References: <20260413115239.79131-1-tanguy.raufflet@savoirfairelinux.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20260413115239.79131-1-tanguy.raufflet@savoirfairelinux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::11) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH8PR11MB6853:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dcfd315-376a-4b45-ded5-08de99cbee51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|4022899009|366016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	V6APOjerOcjK7p8EtyLd48om2QG6Mpc1S9rT+2sbaB1mayWf33TBWUcTvNwJLqAlMfeZY0Ol8Bx3841Jb0Uj76sYl0gtM84ORheUPjFgBvhAwLHjxGGRAfGLYAJvi6stjFzcvKrTBre14nvlci+G+kv42u79L9myeNkALArroVhnTkSzS9n79WCUCCAxSAknrOXrqmUo0a0BwF4UIqcFl9DXKp5AvxI+CkgJrFPKMGLy9L2bukmcN+bGBpNCqwwr9MBKhlCjNmFP2tx3pemvjRf0/b7yX7NjlDUyNbElJe8/4fMQBYcsLIshLFXfsk0IWFTNwWVFHN5ETdcRwMNlrWzpPddCpNMjwXibwyY0Y+m7FKfn0sag4qZ1ypx3TrqBsvaOK99Jg+NeyvWM6HwVG/qltYuryWrBsBu9gTJgSpRJ21kC++qFlD3c1imzkWZOo7BqLezlCY8LlOBHeJxsVYTlIMSNGMzy5dt1w8xe5cWh3IvS5hxXX9ca8e6OoDv8cumUzxCHTUKrukzcFs0+E/7Ov7R92z0MCWg0wHg76B5EnRvE19hs5c2//45lCuqPLBM6WJH781aWSF8RmSoQQP09keabGnfDqe3+oBXe6UhfV8/bwHe/YkLZgaipfi1P8mT39UccUm9EY6JZjxucqqZeSxbdUU8GmpIJudDRtvd+WcrprlLqPqWHYBmlT7PS
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZG5MQVhqbkl3WFZaM0ZzUVZYb0xRL3BWOGxzcnNLY1hmaEZ3b0UrRDJhMmhH?=
 =?utf-8?B?ZHZZeExqNjE1aGZCKzZUYTcxYkc1R0UzRWg2S04zZjE5VHJPR3d3dFpUWmlh?=
 =?utf-8?B?b1l2czJRZkRMRkRLN1JWZlJPeHRZdjNJNldkTk0wcWYwZjZXbHlaYThvNVlG?=
 =?utf-8?B?Y2lna05RK0xoUWw1dWU1RXFmcmV0NlpUQTlMazA1Qmc3S1gvTWVsekpOeEsy?=
 =?utf-8?B?MjY5RW9ucldqZVk0NEhvdTRiY0haYzBKMk5YbXhDaE1hUWJ6SGJUWnNXL2Za?=
 =?utf-8?B?SnEvZUZQWmFWOGJmSFU4ei9GS21lQ01BR1pYVTg4RzVpMVEwb1JvcER0VTlF?=
 =?utf-8?B?Y1I1YjkxYlVoMitHTjlUT0QwbzBRWTRHNFBoZjZDcDUxbHBxUHNNaWJXTDJ6?=
 =?utf-8?B?WEI5TWtlOFpuUVJIUGxOTEY0OVFzeGs3KzJHMmRrSWFVc1F4K2UrZHgwdEZ2?=
 =?utf-8?B?em9kVnY2bUw0MU0wVi8wc000WDFkck9CYnRLbitkbzZ5aDNxZU0rUFltWkM0?=
 =?utf-8?B?MytRSE1YR2ZHKzZPS0ZLUzZKYXZwNzF6RXhNd05oWWNmRWlMSDJ3bjEzQTNS?=
 =?utf-8?B?ZERYWGhlb1VCTU12RjFoeWhUaGs2WlRkSGlFRGEwVWpYZmJzcEd3SzYxZDNx?=
 =?utf-8?B?U2N3UUhlVGI1Lzh4eGZ3NWlpRmpaZWxKNUN5ZmZWZ0MybXJPdFR0Tng5RFpD?=
 =?utf-8?B?ZXlrRnBrc3NVZkVlUVB6Sm16VVh0clZEV0N6T0oxMVBnYkhtR2lRMTgrMHFT?=
 =?utf-8?B?K29INHJUSlpjNjlyMkdPN1FmdWZZMU9ldk9KZlZLb09lM2F3S0xtUkM0eXZY?=
 =?utf-8?B?YmswUFgxaWlvb2M1QW42WGNka01iZDdGR3p6SEFMS1Y4WGhyZzFhaXBpMlJE?=
 =?utf-8?B?V28yRldRajFreHJ2NGh2eEVDZXBXdXVRWmdMTFAxc25TYXk0Yng2cHhkYnZv?=
 =?utf-8?B?L1JjNjIwbEVXa0ZGT2M3MmJLTlVvWllDWm1Lbnk2WWxObTBhNmlRMTFSNG5q?=
 =?utf-8?B?Vm03Tm1BeEZuRmFQOEVjeHFZeFhMakUvQkJ4dGhFTDdNN2d0RFlqWDFBZHFx?=
 =?utf-8?B?VjJLVlk3TUp2OEhjYlFhV2pyTENtTWw5U0RKcitaT0xWQ2dPTFAyVVZQbno4?=
 =?utf-8?B?VnAxUW9ZRFQzWWtqdTkvZjZoS3U5WERGeU44RjB6dWk3RXFIdTFtT2huOXFo?=
 =?utf-8?B?bGRCUW45MkF3YnhzYVFzWUVEZmh2V016VzRXVDE0elVwY1ZPbUpzcmIrQWNZ?=
 =?utf-8?B?Yko4NEI0cy9kQ1Q5WlIvMFV3emtXOEJDeUwyVUhOd3pMeitPOXZSelNjT09T?=
 =?utf-8?B?YmwxNTcrSzhUaFhJd2IweS9mRGNlQnZXWm5TRzZQaGdnOElQa2toSHVQdE1v?=
 =?utf-8?B?ejJqNyt0dFQwRVZDZENEZ1RsTEF4bmhhVTBMWW1ObUp3dTB6aDNQRDNwL2JZ?=
 =?utf-8?B?ek02RnJmbk51UUtiaUc5ekFHRXpnR3J2R1RaUlJYZGI5OTNqTlZkTW1yN2hG?=
 =?utf-8?B?dWs1Y3A0Z3hpOWZqWEsxdExDWnBJalZrZkgzekRlQ2ROV092aFQ4RmJqTnpB?=
 =?utf-8?B?SS9vbmN0dTh0ZmlDRzJaOGFPWmg2S3dsTURNaXpZM0c1L0N2Q0JEM0l2MWxN?=
 =?utf-8?B?WDAyUFJ0TG9QZk4xUnJGRFhwcnRBdUFOMFY2bVFMSWRnKzU5dUxEaXVwMzZM?=
 =?utf-8?B?bFFvLzZ3Y1VzR0EvQmRjQmcyVmdWSUdESmxJL3ZRWUFaT203V2xDaUdZQVA3?=
 =?utf-8?B?UXdPN3NtLzdGWUR2dnZjYW40V2ltU0JEU2xZUmZDWHNBb1dGN2F4S0EvZXJp?=
 =?utf-8?B?YWRaeURPUThQaW1wS3Y1YWNPOVBVOUtHY3lqYUp0MGJGckQyUG03ckFwQXVt?=
 =?utf-8?B?N21GcDl4RHVlcndOVGs5UGFVQkFGUHBJSE9COXFJYzM2dXVLajFuYjdCd3VY?=
 =?utf-8?B?clJUUnhtQ2pBc1hvUVB5UUw4SGIrVFc5VkNKeVFNQUpqZU9rYzFGQ0o1a3ZY?=
 =?utf-8?B?cXlZSXhScEpCanUwVFE3N1U3MnFJWTd0ZGhEZG5ZdG9LUFl0T3pFR2pNNTZs?=
 =?utf-8?B?U0lDRUFadUg3MENxdVN5Qkk4UmRGVHRMd1Q0MjJPMjlHd3ZSMVJmdVEyV2tO?=
 =?utf-8?B?SGZFWHpsYlJJOHpPUUkzQmhuOGVta3FoNVVLTjFGR3NMS0V4ZmJjUEl1bWVL?=
 =?utf-8?B?Zms3Mnc5djRjM1Y4SE0weWc1UXQwK3lxZGF4THN0TWg1ZXJ6YWloSmEvT2Za?=
 =?utf-8?B?WEN3azdOVjE0QlRNTzRyUTZYSVFmcnVYM1k4RFNYbVNzbXBPZmhwMkFXOElh?=
 =?utf-8?B?V1loVndrSjVSMVZMNEg3Qzk0ZUFuWE5xKzh0U3pDZ3JPM2I1ekdQZz09?=
X-Exchange-RoutingPolicyChecked: 
	Fv2R5ozh8qrMSpBeXgLke3tdYAEbIPunO5fXYx0eQKXsDw+nVZPY+aWLCfMylhxGWABn53Gj9i9DkX3ceSAxZX2J8RuHJpS9ETpeEYDmtGh45TLz9/+97Om+RgNE5qCjy2Lqz2kIgt8vNlg1jRxXgCayoh+UzqgTgaLSkWO4krvYJ3kURaCMpLFH3KY6cMiL3aLKKmaoyGsdcvmPs9TsvMX/fhxYxnq+m0LYZqiW3gzgXVlKkqcHDu9fre7h3h7CImzzag/dd8WsxXQwLir7vK6JxRRgNH85SUB4wr8h/kDxohryRBhdNzcwl/OArsXn3JZFj5KbSYsak6/ZM2Wk+Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dcfd315-376a-4b45-ded5-08de99cbee51
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 02:17:09.3655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0DdvVR6nInEke0Sd+sgnBuernJkFjwgOQUU7z7l3BWH6O+BqX99E1XUJqimWgF3P79v2gD3/BvWYG5muG4rPEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6853
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDAxOCBTYWx0ZWRfX9aSpf0/bsoV8
 5YMoXNeVLg+GOQa345nCQ3CufUWuSDM3Hq8qFSXTF0AoCWpAS9MZ9ZbjuG7kG3uhlXIjl5gOBkp
 qgZKulf1qnzuwr2Gt4TA1yzVoeOQ/Bkzaug/qc+0m96KJUqXUuV4TmaDZ1Vm8IxYBG6gPHxLJk7
 T7ipOO59QBUI8o4qevUusci5Aa/BF0hd2FPIucZjy+v/8je/CjdOK2SjjdkHGFtL3Adyu4RPt/r
 nBffSWfwiC9iSqXNKUYofKclJPz0LTve0o+Xpsi7yrC1g3OJjnf5EDXoi2Rh7SSwCQ6S7gX1Wiq
 Dfgm0GMPSSfPE1IOOFyfICNG9J4uEceFhelbuvL1wTVA3isZkEAcQW/r4QLlb+Tcr076BxDgQW2
 Th/RoFLN6+BWhJ7M3kubXt61EHtaNLMOvDYIWdIhgQ/PhQjCR0DACbbMl/mItDuffG6nT+lxYM4
 ROtZGyzUXJsUMRXKtsA==
X-Proofpoint-ORIG-GUID: 2fRPfTJgoA8KtgbVQf-kwDLEgpww8zqX
X-Authority-Analysis: v=2.4 cv=GupyPE1C c=1 sm=1 tr=0 ts=69dda3a9 cx=c_pps
 a=ButkoIHTjR5vDxq5MUTXqA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=iGHA9ds3AAAA:8 a=aRxQL1JOAAAA:8 a=t7CeM3EgAAAA:8 a=aX5613nTqTHLsjdElmQA:9
 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=lBRdisTmIr2YKkuu8atg:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 2fRPfTJgoA8KtgbVQf-kwDLEgpww8zqX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140018
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Apr 2026 02:17:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9698

Can you check with upstream first? After all, they'll be facing the same 
issue with us.

The reason is that if we use this solution like this directly, chances 
are that nobody will ever revisit this issue any more...

Regards,
Qi

On 4/13/26 19:52, Tanguy Raufflet via lists.yoctoproject.org wrote:
> The meson.build from libvirt-dbus enables the flag -Winline. Combined
> with -Werror from Yocto, this causes a build failure because GCC refuses
> to inline g_autoptr_cleanup_generic_gfree() from the glib header
> glib-autocleanups.h, as it considers the call unlikely and estimates
> code size would grow.
>
> Because the function g_autoptr_cleanup_generic_gfree is defined as
> static inline with good reason, this patch disables -Werror=inline for
> libvirt-dbus to allow the build to succeed.
>
> Signed-off-by: Tanguy Raufflet <tanguy.raufflet@savoirfairelinux.com>
> ---
>   recipes-extended/libvirt/libvirt-dbus_1.4.1.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/recipes-extended/libvirt/libvirt-dbus_1.4.1.bb b/recipes-extended/libvirt/libvirt-dbus_1.4.1.bb
> index 767470e2..e4859b0b 100644
> --- a/recipes-extended/libvirt/libvirt-dbus_1.4.1.bb
> +++ b/recipes-extended/libvirt/libvirt-dbus_1.4.1.bb
> @@ -16,6 +16,8 @@ SRCREV = "0c355bb8921d7cbccf93f41a8615fcd973e64f70"
>   
>   inherit meson pkgconfig
>   
> +CFLAGS:append = " -Wno-error=inline"
> +
>   FILES:${PN} += "\
>       ${datadir}/dbus-1/* \
>       ${datadir}/polkit-1/* \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9695): https://lists.yoctoproject.org/g/meta-virtualization/message/9695
> Mute This Topic: https://lists.yoctoproject.org/mt/118803008/3618072
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [Qi.Chen@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


