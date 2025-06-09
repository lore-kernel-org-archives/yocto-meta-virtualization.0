Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AAF7C61CE7
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 01:10:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.48998.1749431400424666044
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 08 Jun 2025 18:10:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8255d90aa6=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559107un005477
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 8 Jun 2025 18:10:00 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2079.outbound.protection.outlook.com [40.107.100.79])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474mxm0yt0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 08 Jun 2025 18:09:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDQiXModsvXgw9ulMQ08C3pgt1iEv+AZnU1g2feVFRWPLYsauQOmOSnPe5ZY+Ouu2B+6+jGkbmjr+yX52aWv/Q9IbuZstX6Yhd2uYrYedDgd5YyC/8x9XstuSP8Bob3/72sXt9n7cCuoazWqdgr7nx9QVvZHRE/CqIAUYhzlzKud2cW9iHEUMilAnJOScy9QcvaNubJImi9rnZSM9BRT2eR3YdxgZ9nVm24yAz/7YNFnPHnweLxAzk5X9Q8lf8OWlFqIgEVO9mp2UkuDZf8KAZw81qL8pApgoSIo7le8bDrAQPRjwAehW/W6cxbXjicBvMqQ7W5kpEMtXqYoTty9Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZx9BpGJ9TF+0VU4ax4LJqq65Rx8cC7i0ylcfFnV9VI=;
 b=USZdI9fy55odyjjYNmMS+tsutC06MApVj4C9waJ01GnmNqAdHWrC9hruuaVf+0oZDE0qHPAEotR+YPD1OwEcl06KJ4KNJTMXC78/bG++n1qZLf/KGz5P1V0iwVipMp7S9Ds8vsDvVZe6e+3HHA7uPd/Eh2p4CocsfCD8KVbuwwuRhLd8pqOFfvnH7u4wH0q4QUVV4gFMfMyji+XNC//RgQjR5EFNDOgONM58yPMh9XFwvea50pxEC0RuP9YoZQ6uoZCm+xUIoZQgGzLg+q8PXFsCyvUGr+6SbohG/cMpZOn3HEOQsFMstSPxu3dx7rx9UW9o1LR6ipYqaoLz3PsVkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SJ0PR11MB5771.namprd11.prod.outlook.com (2603:10b6:a03:424::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Mon, 9 Jun
 2025 01:09:55 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.8813.021; Mon, 9 Jun 2025
 01:09:55 +0000
Content-Type: multipart/alternative;
 boundary="------------IXpdpGsHHfUYeeLzu8ItWIDl"
Message-ID: <99f14f26-553a-4a0d-b715-aba7e4367df4@windriver.com>
Date: Mon, 9 Jun 2025 09:09:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][walnascar][master][PATCH] containerd: make
 cni_networking conditional
To: meta-virtualization@lists.yoctoproject.org
References: <18439AD6FDF85A0A.10936@lists.yoctoproject.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <18439AD6FDF85A0A.10936@lists.yoctoproject.org>
X-ClientProxiedBy: KU2P306CA0024.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3b::7) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SJ0PR11MB5771:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b3164be-5bdf-4d16-2039-08dda6f25871
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z3ByanAzdG5QblJmRjZDN3VIR0lFbjhvTEx6UTcrTWdBNTE0ZUdYRUhIa2V6?=
 =?utf-8?B?NHJTQnFWZTJPK2hPb0lRclNnQ0t6NHR4SGJrM2gwU1orWTArNHZQOGpmOVFr?=
 =?utf-8?B?RHkycmtxc3RaWktaVGhuMmVqNDZ1enMxRDJ3VlhNOUhlTDZRL09LRFhzakVp?=
 =?utf-8?B?cWoyN21jdmhCOG1rVmVLUHpTN3hpVXM4VVFxckNCK0tnNVpFWGVSYTR4QlIw?=
 =?utf-8?B?ampJYlJRdGxzaXFpZjdLc3g0NEVPOG15RzlGRUV1dFFyWnBKb1Zkb3pteDB2?=
 =?utf-8?B?VS9yNmdKcFUwa2JEKzZQb1YzdEtrZ1krSXVERVFvZHJOMGNOeDBvZmV0a2xz?=
 =?utf-8?B?TWRyU1RRblA3dGt5Y0lyOWtHS2VYaVdjZXh2Njl4elZDbWUwYzlBc2pwdGZs?=
 =?utf-8?B?WkVLei9OTkFFZGpUSG56UW5FbDM5ZktESnM1dnd5WEIxVXQyS1h0Vm5sdTdh?=
 =?utf-8?B?YStReDNwcjZ0UEIzNDQyTUtGR09kR1dHZ1IvUWkrbW81U0RmeVZmNitENGk2?=
 =?utf-8?B?QnVibElDMkd3STdKbEV1SDBZUHYzMzhkczJUZHYxbUE1QjhVMmErWmpTVVNG?=
 =?utf-8?B?VGdXSjFpMFpFUDBzYXo3WGRPdU5KYzI2UFhRa042V2NQRGZVQjNJSmsyT0Ft?=
 =?utf-8?B?K1FXSzdaK0xUTDBqWFpVNGtnUGhtek5SbjFZQjRIbzlwSklMdVI3dTFNKy9n?=
 =?utf-8?B?c3hKQWRHcmxncDhwa2VQMiswNzlnUU5peDgyTmVhazY4aHNNWFRvSjJLZStl?=
 =?utf-8?B?bTd2MkhUMXdCTnJjSUJpdHl3UCtwSzcwWTh0eFBSWndDVGxzSFVFVUtOTjFj?=
 =?utf-8?B?OWMzSkhBQ1E3LzlpWmwvcXhKVWt5WWFUWWEvZzVsVkp4ZEZzWjExZGFaTzFI?=
 =?utf-8?B?aWJobGdtR3FqdFFRYmw0S3JjMHpZVkV4NEoydVNZMllZOFhYZ0c1YUNlTzZr?=
 =?utf-8?B?dEZsS0c5V2xSUmhWaWNYc1hOMFFUSjBWWXVneExZOTFwbCticVRFQVoxa2Rs?=
 =?utf-8?B?NXo4R1UxaDlkanZRbkh5L0s0SDNNUFVTQytycGdiTTgyZVJNM2dOK2VrNDNl?=
 =?utf-8?B?TkZiRkdPNjYzZGwvV1crdlpUTnZJSmdhOE9PNFFNWVJyU3VPOGI4TVFIOEhN?=
 =?utf-8?B?TEIrOHp3NHVJa3hvVjJObENTUm1PL2RXTDFKczI4eGl2UDlnRDhmeVA5VHRh?=
 =?utf-8?B?YnFSNnpNUXRNZW5jV1MybEQvVy9NUUtDRm1XL0FneDhRMERMdG5Xa3dwWjIv?=
 =?utf-8?B?NEJhNmpjSWF2QUZKeGhrc0VSd2RCZCtWYWwvR2lIVzVDV2J5Z1RKdGUzSG1s?=
 =?utf-8?B?aVkrTWtkdmZYbFF3QTFWdm1hSHN3aTVNalNxdG1yaXNVdXhaYVVQb0Z4cGdH?=
 =?utf-8?B?ODBJTzExaTFlMlh2SHhEZmJJRThDeEpyYiswUFJ0RmhZL2tvQkx6d0N4ZUFl?=
 =?utf-8?B?QUFuT3E1VWcxS0tCNUJlWkZpSGlBM2p3dFpQU3pORTRHbDhHU3N3ejJaUTV0?=
 =?utf-8?B?Z1NSZXZUN2UzSUtyN1pWWGNlUWE0TmRxTWdtVmF3cFl6b1pZVDNoUFYrOVJR?=
 =?utf-8?B?S3dqdDVHK3R6ckYybDB6ZXE1VmJSQmdzMDFNNHRNWU1WUVVEOWJkU0Jxa1o0?=
 =?utf-8?B?b0hBY0h5R3l1SGY3WmZVRG1aamdyZnRwRjhFOTIrM2c4ZEJ1UDRCZm94aEtn?=
 =?utf-8?B?NzNsOHA0THZVRzVHTm10UkViYkJ6THd2amRtekFuak51S2hmMDFsS0VRM2Fo?=
 =?utf-8?B?TzEwczd0Q1Y5cmUwOHZ4UmxDZjNFUUQrSHlYSWdhOUtWdDd6b0kyZWRsaXZw?=
 =?utf-8?Q?mCqDm8Lh9JjPACMe2hml8eiAeouBY7lNItLfc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NUJLY0M4UkRmV1VFOXNTd0V3MFR4OXN3TGYxWjRvYlEyb09Ga3NEZHg0RWRM?=
 =?utf-8?B?Z2dLUWdQVjVaZy9Mdlc1clFKQ0VrUVVUcm1GT3RaSWovblBacFM4R2czZ05U?=
 =?utf-8?B?dkJaaUhaemJxcVo1bnZPZk9rZTE4V1l3eUgxeFczQ0IvOTAwelJXbmgrMjlV?=
 =?utf-8?B?SDBqM25peHlyeE44RHhRZkEzZFpoRVNuSnluNzdBQ1hmOEJSNGxwbytGTU1k?=
 =?utf-8?B?aTdhUGpPZzFXWXc4Wk0xQmQ3ZjR3VGRhTWNQalQra1VlMmdubUFmaG1XczND?=
 =?utf-8?B?NC8yd3pJUXYreFV5d2FBdzhqQ0tSUmxFMFpoTWoxeDVERk8xN1JmaFdWZDJs?=
 =?utf-8?B?THgvSVE3VEYvOFBNalFyeTdpL2lROW5qNG4xVDBEYys0aGV6R2VoaVJrMXVq?=
 =?utf-8?B?SHBHak1ubURXTHBMZWNQbGQ2WGFUa2ZUd1JzaklyUStJblZFdnJFVjdLRFZG?=
 =?utf-8?B?T3lkMldkbjQzYlQ1dWg1MGJubDNWWEVzdllvSnd4clJzd3piTjNQR3pCdW40?=
 =?utf-8?B?VVY1V2duUFVVdW1rMXdtZE9adDRKVG9jaUFNendZVHliVGJmckQzellZNmIv?=
 =?utf-8?B?T1Qvb0hUN1FVSUVLTjVkMmw0QVNsL3B6dnJVY3o0TnBWb2xZalEvaWtxMTV0?=
 =?utf-8?B?b2ZBMlN6V2hoNXJqbXRBbFRoL3NQbzBjcEYwL0tRaGV3RXhQNUFjVTFMK2dF?=
 =?utf-8?B?YzhMMnNoSmtmQVNPYzhBa3VES2VSTE9PN2hXcVVqUEgwaGtiazlhc1R5enpJ?=
 =?utf-8?B?WUtVTjYwNjhPTnR4OUpPa3dtU3NGNDhzcGVOYk5Sa3hoTnpKYXhGZnptcDk0?=
 =?utf-8?B?MkFRSU13VytrSXF6elgvL1UxU3ZYeFdIdWdDTlY4STU1SjcxeENEcm5jZ1gz?=
 =?utf-8?B?MmFNY2VkS1hFRy9BemdPMVphd0hhL1hpMFZuYkRwZjRrTVlxdm5NQlBXeHdB?=
 =?utf-8?B?dlluUzU1SWs2NVpnUHBVNDFxbzN2ZnhteUtpeDZRbUVQRFE5ajRJdzhnY1ll?=
 =?utf-8?B?SFBzanQ0UWpZSEtEYlR2b0VNNlR6ZDhwWWV6QllTN0c1MGgwOUNxVmdUMER4?=
 =?utf-8?B?ZklNV1JodTBEdWtMWEhkQ25rUlo4azRlNXE4akFjWkFQeENpaEJPUk9yZEF3?=
 =?utf-8?B?VHRXVzNMYm9uYk41UVYwTVVMcm84cmwvL1o4MzFEdUdlTExmaFVWTUdOUWhx?=
 =?utf-8?B?SGFUakgzemtPWmtWTjZBZE0wTWEyUEVuWXZLWGpGU2lmQ0luYmhRbWF3emtn?=
 =?utf-8?B?bWdrVThnbmY1VVNYc0gwWjU2SDNvd2tpOGZNM3hOblBCR1F3eVNJeXBnbDlL?=
 =?utf-8?B?ckRvREIrVWdaemJzNjdyaXY0SDZ3bjZsczZTQnJPNlJBNXlsSWlLMXQvWHAv?=
 =?utf-8?B?MWJYSDQ0L0YzWVhOWEU0d2gvamFncWdtTmVvOXZXZ1I3elp4aDhlcHFFeTBy?=
 =?utf-8?B?bTg1QWo5cnVYR1V3NE11NWd1MjY2T1l3TkJTNnRxdkdiUXpZYnNveWV4eUYw?=
 =?utf-8?B?ZW81ckpXckUrbWQzTTBLMDArdy9WbEdEdDVWTmdySWUzRHJFaDAzeUlhRjZH?=
 =?utf-8?B?ZW53bU5kMVFkeCs2NHZ5ODZ1ZU9iL2tzOEhhZkk2YVpKMWhkR2hObjNrU000?=
 =?utf-8?B?NjVtYlU1Y1hkU1ZQSUVBeSs1b1Y1SGhHLzdqd2xxZUFuUXFmeDg0UjFOaDFt?=
 =?utf-8?B?TTh2RWgzYnZxOUF5YkVTRnpHVUcwVE5BbDFvOWQ2U09uNkFWV3UrS2VZVHA1?=
 =?utf-8?B?ZitjYkl6c05sNXMxVXFwYlJacXhJQ01HaGRYZklIUnhGNFh2RlJzZytoL2ow?=
 =?utf-8?B?TGZnTzlSN1F2cUxZYloyb3dLSi93Unc2N3Z5WEVGRGxVMllLckUzdUMzWEF1?=
 =?utf-8?B?bVUvYWhGdVB1dmFoNXlSRFppQTJUSFplMkhzRFl3aTBDbG5LTDJBUUhOZWVU?=
 =?utf-8?B?UFpSaVBGK01RZEgyVmZvT0FOeWQvY0JQQldMVVlwcUVObXc5ZDhrVzM1UEZG?=
 =?utf-8?B?MHdwUkFhVWRvVVYwNGdkODJNWlIrVWo0N3JsTlRwK043MHR6N3EyaHh4ZC81?=
 =?utf-8?B?bmhPRFpqcGNwYlJxRDczQ080bXlCdStFaHdLd0I4T3JjREkzU3grVGk0aDht?=
 =?utf-8?B?VEVWVmtXNWtPWEU5TFBzMGx1azQyQmV1VU00clNFZnpzZUd6NFV1eUFhY2ZJ?=
 =?utf-8?B?T1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b3164be-5bdf-4d16-2039-08dda6f25871
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 01:09:55.6219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wfFmQonlXT5YN0cKHCdN6cOZNG+qrgzf/sTbQQAl1uIuMe8DN5h2RMgnRN5aO8HtWtMyLmETfMJP1qPdU46sabksmxr3ps/sXX4cJd5oHyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5771
X-Proofpoint-GUID: VKm8IvOCWtXiVM_Y4lQ4DEN7DDdQwCpT
X-Authority-Analysis: v=2.4 cv=L74dQ/T8 c=1 sm=1 tr=0 ts=68463467 cx=c_pps a=degLZM9eBZQX9z3fM2se1A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=A429QDXCIJuWRxIw1PgA:9 a=QEXdDO2ut3YA:10 a=SKhR8cFBZdt403FWzkkA:9 a=FeIpHrx5XTqOe6Fd:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDAwNyBTYWx0ZWRfX7/l7bAl27S3m Wdz0wRD92K9xkQc4lmHBv8bZniHoLnUCV4cHWUf0ImWaryiLIgbWdjP/hWSnd1FQI5QT1mzRNBQ 0ZpiEfi47SV7/G3mNZ6roTvNaj8KF682ZnXqZSinqjQlwkdrFZaIl3EI1YA+ck8+hE7/urCm5TF
 4e1yd5qqz0y6wZSz0qPFqnFeP6ZgvyJc8MYPMrmps53VaiYqxpUHrZddqttpLOqXME+syWwWxB4 /f9G+84aqu91z0D3+XzPzeJhDzBBL0hF+zHH978zXTuE3UMSCciO/mfHOYsgj+VGBIQzKEmjraU 3ds0IOybNdoO6FXbUKoUeHj2u4Xw0e3vyZAGi7WZALJ0bJljQzsAuFZLDm4DlUu3HIQ9oq96ydx
 rbgGEZPiaMIb4huFUqdzGBSY7SVDUOMaSau2WqsQecBLPnux4pvJwjTWtdjlJ3/zr9Q3ORWV
X-Proofpoint-ORIG-GUID: VKm8IvOCWtXiVM_Y4lQ4DEN7DDdQwCpT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506090007
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Jun 2025 01:10:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9274

--------------IXpdpGsHHfUYeeLzu8ItWIDl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Kindly ping

//Changqing

On 5/28/25 13:48, Changqing Li via lists.yoctoproject.org wrote:
> From: Changqing Li<changqing.li@windriver.com>
>
> make cni_networking conditional, when k3s, k8s is enabled, the
> networking configuration will be provided by the orchestration package,
> containerd-cni is not needed. This is for fix the following error:
> PACKAGE_CLASSES = "package_deb"
> do_rootfs failed with error:
> dpkg: error processing archive /path/to/oe-rootfs-repo/corei7-64/./kubernetes-cni_v1.32.0+git0+5fe148234f_release-r0.deb (--unpack):
> trying to overwrite '/etc/cni/net.d/cni-containerd-net.conflist', which is also in package containerd-cni v2.0.5-r0
>
> Refer [1], "--no-force-overwrite" is set for dpkg, so above error
> occurred.
>
> [1]https://git.openembedded.org/openembedded-core/commit/?id=cb95ba079960411775c57ab864d266e15a6292d1
>
> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ---
>   recipes-containers/containerd/containerd_git.bb      | 2 +-
>   recipes-core/packagegroups/packagegroup-container.bb | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-containers/containerd/containerd_git.bb
> index c683fbeb..def7591a 100644
> --- a/recipes-containers/containerd/containerd_git.bb
> +++ b/recipes-containers/containerd/containerd_git.bb
> @@ -102,4 +102,4 @@ RDEPENDS:${PN} += " ${VIRTUAL-RUNTIME_container_runtime}"
>   ## This may need to be made conditional on K3S or similar being
>   ## configured in the distro, since we may have collisions.
>   CNI_NETWORKING_FILES ?= "${UNPACKDIR}/cni-containerd-net.conflist"
> -inherit cni_networking
> +inherit_defer ${@bb.utils.contains_any('DISTRO_FEATURES', 'k3s k8s', '', 'cni_networking', d)}
> diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recipes-core/packagegroups/packagegroup-container.bb
> index f5e20344..8cbcf28e 100644
> --- a/recipes-core/packagegroups/packagegroup-container.bb
> +++ b/recipes-core/packagegroups/packagegroup-container.bb
> @@ -69,7 +69,7 @@ RDEPENDS:packagegroup-oci = " \
>   RDEPENDS:packagegroup-containerd = " \
>       virtual-containerd \
>       packagegroup-cni \
> -    containerd-cni \
> +    ${@bb.utils.contains_any('DISTRO_FEATURES','k3s k8s','','containerd-cni',d)} \
>       nerdctl \
>       tini \
>   "
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9261):https://lists.yoctoproject.org/g/meta-virtualization/message/9261
> Mute This Topic:https://lists.yoctoproject.org/mt/113339575/3616873
> Group Owner:meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe:https://lists.yoctoproject.org/g/meta-virtualization/unsub  [changqing.li@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------IXpdpGsHHfUYeeLzu8ItWIDl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p>Kindly ping</p>
    <p>//Changqing<br>
    </p>
    <div class="moz-cite-prefix">On 5/28/25 13:48, Changqing Li via
      lists.yoctoproject.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:18439AD6FDF85A0A.10936@lists.yoctoproject.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

make cni_networking conditional, when k3s, k8s is enabled, the
networking configuration will be provided by the orchestration package,
containerd-cni is not needed. This is for fix the following error:
PACKAGE_CLASSES = &quot;package_deb&quot;
do_rootfs failed with error:
dpkg: error processing archive /path/to/oe-rootfs-repo/corei7-64/./kubernetes-cni_v1.32.0+git0+5fe148234f_release-r0.deb (--unpack):
trying to overwrite '/etc/cni/net.d/cni-containerd-net.conflist', which is also in package containerd-cni v2.0.5-r0

Refer [1], &quot;--no-force-overwrite&quot; is set for dpkg, so above error
occurred.

[1] <a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/commit/?id=cb95ba079960411775c57ab864d266e15a6292d1">https://git.openembedded.org/openembedded-core/commit/?id=cb95ba079960411775c57ab864d266e15a6292d1</a>

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 recipes-containers/containerd/containerd_git.bb      | 2 +-
 recipes-core/packagegroups/packagegroup-container.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-containers/containerd/containerd_git.bb
index c683fbeb..def7591a 100644
--- a/recipes-containers/containerd/containerd_git.bb
+++ b/recipes-containers/containerd/containerd_git.bb
@@ -102,4 +102,4 @@ RDEPENDS:${PN} += &quot; ${VIRTUAL-RUNTIME_container_runtime}&quot;
 ## This may need to be made conditional on K3S or similar being
 ## configured in the distro, since we may have collisions.
 CNI_NETWORKING_FILES ?= &quot;${UNPACKDIR}/cni-containerd-net.conflist&quot;
-inherit cni_networking
+inherit_defer ${@bb.utils.contains_any('DISTRO_FEATURES', 'k3s k8s', '', 'cni_networking', d)}
diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recipes-core/packagegroups/packagegroup-container.bb
index f5e20344..8cbcf28e 100644
--- a/recipes-core/packagegroups/packagegroup-container.bb
+++ b/recipes-core/packagegroups/packagegroup-container.bb
@@ -69,7 +69,7 @@ RDEPENDS:packagegroup-oci = &quot; \
 RDEPENDS:packagegroup-containerd = &quot; \
     virtual-containerd \
     packagegroup-cni \
-    containerd-cni \
+    ${@bb.utils.contains_any('DISTRO_FEATURES','k3s k8s','','containerd-cni',d)} \
     nerdctl \
     tini \
 &quot;
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#9261): <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/message/9261">https://lists.yoctoproject.org/g/meta-virtualization/message/9261</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/mt/113339575/3616873">https://lists.yoctoproject.org/mt/113339575/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:meta-virtualization+owner@lists.yoctoproject.org">meta-virtualization+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/unsub">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------IXpdpGsHHfUYeeLzu8ItWIDl--

