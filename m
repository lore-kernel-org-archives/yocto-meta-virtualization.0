Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B057DCD5BD2
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 02:08:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11476.1779847703046669256
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 May 2026 19:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=bRONN6++;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9607813f8c=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R1SCmC1874660;
	Wed, 27 May 2026 02:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=jawPt1a6EAEH/pTdAW5ydt
	s9EcPlnY5d55C5EaMP/to=; b=bRONN6++A8wvLRirERfuMTg4QcYWFXEeU9pQAU
	g90hMfiXrMPCsUj/hojl6gJp0e1LfpE2EqY7W8ULRFE66BqyYfWRoW4M/1/W0ayn
	KZN13ihOwnv2DWx27H3p9UrOPRL4naTG3k3jwP6l2FElWmlPdLL6j46tx1flPPPL
	WnknoN2aHm0oULSVZqAlJxwtPa+d3td5pbVjl3TikRFKgOWj1pUhbKzbFuECY6hx
	9JwO6+jN3Dg2Q6hsV5WZmPUGi+LuTJ4AQM2FgftgWyl/mAH9IDcxD7GCizJuQV6w
	zKVKXY4rKMplN8GtneGgeJfwkYczU1HWW8oB0KQKBZrIXP/Q==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011003.outbound.protection.outlook.com [40.93.194.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb376d0y8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 27 May 2026 02:08:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GTGA17jszK5NQrhYUsJoN0jY3QFAFu3exK0ls8IsX1HGkdc61eL/lMGwdIt9Dm3xtEOpWx2/ZrWv2YYdMRfo8SbJd1M4FNtplWdVRru2qx6U50QdRT3U3Stn2EpjKWqEhs21RuoQBLUvQYYjo7xL+ktUJfspvB3bP5u9+KF8wmReRRA5PVvpMuHLPs9Wp/35bEb9Mk7TWlg2jrm1t7a+Ry67Ku7eV546+yqzUdk2Nj+Wuw2FV3HPEoY9KxvJUckbB+kz/I6ZSk01ikfZVXXula8vXfAsuSLiUYlN7oAaMBdrfbl3RbAeXajHRDecJ62aQx3XcnPGFuiDzhezzce4qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jawPt1a6EAEH/pTdAW5ydts9EcPlnY5d55C5EaMP/to=;
 b=xMT8UywRxuXmgsByG8iESYaPh3YlGHTPNH2HpUxYDOky4m+/E4iqFQK6WoksZ9mArBHwGILZrjvn8cqD5WMa+CBQBwVPn81YFR35d2xhfPtsJ/jbvBYcc1NuYR0EWIEj+p479Z59lZU0eFF7a5fmnp3Y8suFFivWL+NfmO5C7UWSDT/risd8oTqVDgksroi6Z3lXUOdzkqumlMzEVif6hZ4ky0bvJq/E9G2hq6V3eSCZeQ+OtMypDIsv+QHagj6c5qUSlGJPUvNkUegyqDLPnBbk9UWSK1uH5TARHw2FJvh0I3+QrvgqSubv07zEtqRcX5C9ahJW/Jsv+ufSqQ45kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32) by DM4PR11MB6067.namprd11.prod.outlook.com
 (2603:10b6:8:63::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 02:08:18 +0000
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a]) by DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a%6]) with mapi id 15.21.0048.019; Wed, 27 May 2026
 02:08:18 +0000
Content-Type: multipart/alternative;
 boundary="------------TtYI3J3JsGirS5oQ98tujKXX"
Message-ID: <ce7a9642-232d-4b80-af71-8eebc2e02809@windriver.com>
Date: Wed, 27 May 2026 10:08:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][wrynose][PATCH] crun: upgrade to 1.27.1
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20260525130321.3963861-1-zhixiong.chi@windriver.com>
 <CADkTA4O0vb_-QPTjCDN=FNsSm9ApyKQ+ZqJvj27PmhvsLwWZKA@mail.gmail.com>
From: "Chi, Zhixiong" <zhixiong.chi@windriver.com>
In-Reply-To: <CADkTA4O0vb_-QPTjCDN=FNsSm9ApyKQ+ZqJvj27PmhvsLwWZKA@mail.gmail.com>
X-ClientProxiedBy: SGBP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::36)
 To DS4PPF75D68BA1B.namprd11.prod.outlook.com (2603:10b6:f:fc02::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF75D68BA1B:EE_|DM4PR11MB6067:EE_
X-MS-Office365-Filtering-Correlation-Id: b3c75d32-56c6-445a-61d0-08debb94d175
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|376014|1800799024|13003099007|8096899003|6133799003|4133799003|3023799007|22082099003|56012099006|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	VzE9ybgjYCtrm29XSsZbySAZRNkekWCAhuJY5NNxWCkipBiKMZ4P8leIHuHj7NyFdXBDgnh+Gqxv8BMV4DBcmCMU/NK0wWWFXYenafRvxUva0IpDsa1R2ql05JAkU9Z1uBPLJx3r8SFWwvIAjmQ4hV1+ylrGRSE1ehX4FkkFOT7JOg79uQ79EBnzr8cy3JO/hp8qF1ybBwhcvmv6NVPwiP0Gr7ml9OjGN0mp0UXr4LYO5hy4zhz3IeZ47c9DNw8FdghrUemlsFfOdOhIEfMfooUtb4GARNmaySlq2JogPRY5VAdXuSaY2vKPyhY3aXh0l3afbSukRcgXXQd4tEdUCQbZx2zsCSn1UItmOTirEYyAjUNoa7k9Zo/TdbYWyYD0vaMyo9NEDNKi+gAamr6j9vSNJ0DLirVbjrv3diN12BuLdoabir/d6dutHH3U9yo+nJOSj4wnb8g7y32RGQOMGIjkTfwNrnwF1XK3OVvinbngzThvOpL87i/UxgwPxKbpUrEI63EAjup3hWJWx39YiwzAZoRHdPLa0G5577fyW6/CyAufM7VRzT5eVzIEz4Cj1wGNDGmV9/8EiijoSGBy98MJVASvRTSe1IbfgeSMhBBgn6A2muRnRWyO4FH3VBj3o/aiJIPXClDyjPmVhNiDQA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF75D68BA1B.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024)(13003099007)(8096899003)(6133799003)(4133799003)(3023799007)(22082099003)(56012099006)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YXRNbytCak9PbmxBUHlaMENPaElQTGhaL1pVMFpYbmZldUFDSFg2MS9sOHpz?=
 =?utf-8?B?TEY4RUd3MHREM0xxVkxjdld6dDdZZVl3MU90VFJTazQvRzVyOGlMcEpKWDNO?=
 =?utf-8?B?ODJvVWhEN0NuL3VLcGxHVDh6TERFdmRHalBWUW8vZFRFaThhZEx6QjRPZFdw?=
 =?utf-8?B?TTlRZG9LR0lDWXVDZStHalc1NEFBZkpad0JqTkFTd3doSkd0Tzd4c0h6WURy?=
 =?utf-8?B?STdXbUVjL0JxQWlLZjVpbExrcmY4N2ZOcklsL0I1R3paeGNkMjgzUW85TmFB?=
 =?utf-8?B?RkljVW5tVk9vQmRibFUweWtkN1dhZWtETnlDZXIxRUh1VnRCdkY0RkNjRHVC?=
 =?utf-8?B?bHVuMXQwTFhqclptRVhJcFRPbmUzVW1xNUJ6NHJkNDlLVjQ1TzJ6a0lqQk0v?=
 =?utf-8?B?Q0VJU1VkbnRvSC9FZnQrUng4VFdvVUd4MWluc1I5NjVZVDM2bmg3Mmt1OXpQ?=
 =?utf-8?B?VytpeWhxYThXMjJWVk1NeXdYR1loU2srY0kwUkJMaEIzeXViZnV3Yk85Qlp4?=
 =?utf-8?B?ZTMvNjhqSHVsbThhR3JLbFZicm8wa0dGZnZQWDk5bUN2cGxKUFg2S2FFbjdu?=
 =?utf-8?B?VytiTGlLNUdhTm9FN1FyT3VrazRBdjNBWVh4Y1lEUEowbzFxNDlIM1AyQU5B?=
 =?utf-8?B?UUJWbVNHWFJMTXl2K3F6aGdIbGdhN0lXWkNyWVVvMmNYYzZrZExZQXJxemMr?=
 =?utf-8?B?UTFULzN3N0ZGMjBVbEdMT1d3VmFZM1ZkYU5QOXcrTVNXL2RZU3pCd0l6bjFp?=
 =?utf-8?B?RDM1bGRSL05lVk0zN0ZNUC9oSGJVajNxNUJWblhBamt5TUJZNmozRjNITGor?=
 =?utf-8?B?K2R5dUQ0SXlEK0RBemFzQmJidWRySnkwRXFxcEJwNG13c0Z2L2dHVEptVGFS?=
 =?utf-8?B?UFc5aENpV3NWaW85OXpaYU1ubDdaaDE3dWVIdDRCYnY1S1dWKzc4Wktpcldm?=
 =?utf-8?B?QVZoTnF3YVI1TEk1Nm9scERTY28wWTYyU3l2NmJ4eVo0VllTV2x0SW5PRlk4?=
 =?utf-8?B?ZWgzREU5TUR0T0lHVThMbG5VQ2VZOThubVYrR2YzeFRZZmFhVDZxQWI1UDEz?=
 =?utf-8?B?alAvck8xMFJFMGM2YWRQS3djZlZFbGtqSUgzN3ZyYzNOVEpJbStLVGZTRUxO?=
 =?utf-8?B?Q21WaDBTLytjSEdGQmU2cEdWYUhWZGdrc1YwWXhpREZEUDRuNUdpcDNpUXVB?=
 =?utf-8?B?RlJxVUtaVmkxVUlYSEpoK29yZ0wrU0R0NDJITHlkTmFHZE5JYmh4UEZxZThW?=
 =?utf-8?B?Z2hQSmZKVndTVUdYUFZKOGJMVDZ6TkdXaTdSTTRkc0t4ay9PUnY3UkpCd3dt?=
 =?utf-8?B?VWpXNk9aUDQ4Ukdzbjh3Y0l2aEZLbmRoa0lpbGlWVjIzc2ZTQ0w0YTVYL3h6?=
 =?utf-8?B?dGZlYllnQmtIdDNYdmZaZVNBa0dpcUtjWkM0MFBFVlpENFFjd2NJN3JFbUZV?=
 =?utf-8?B?T1FMb2g3ZUFLb1drcUNiSGpCTGpIdUdKM1dRV3hKZ0lpcjEreXEwQUVzc01s?=
 =?utf-8?B?SVF3OVJobk5Jb3hPUmhrL3dqZlY1NW1pOWNsdU5kMUhpTmpiMFlEalVOWElw?=
 =?utf-8?B?VmhVbGZacVZsc0Rzb1VoZnRlUzZramx5YjlHZGg2K0ZsOVJUT3JRUThqTWZM?=
 =?utf-8?B?MnBvQ240QzB4WElWSEFGK0VMeTFLc3hQaUJSTVFGbU44MVFvNTM0SWJuOFpi?=
 =?utf-8?B?dVJyQldGZHVieUJGZGw5RS95Zi82TVQzMkFPdjZwN1RSYkhLSXlxUFJRWktq?=
 =?utf-8?B?N0pmKy82VHY0QlkyMEQ3U0hOTkxKdVBBS2VQeXFWOU44VWozaENkS0lYeC9a?=
 =?utf-8?B?MEhpMi9SWE91aTA2bWMwREZNWlI3NUJVS3JzRlJ3YTZjbHhKQmVZWitTRmU3?=
 =?utf-8?B?WW5rSzBPaVJ5RmNZQmM3RUlxY2VXdW16eTBhYlY2T2psc0JYQkh2eUE2QVNv?=
 =?utf-8?B?Z2dVT1RmZHl2UitCSGJCQWJLbTJ2T0xaVUdlZXVGQUs1NzMvM3Bub2pLdGIr?=
 =?utf-8?B?NHVWYmloRjhBWnM0V1Z0YWlER1JlV3k2Ty9xaFlrOUJLNEd5alR6cmNRU3Bu?=
 =?utf-8?B?SkxtMTRiRngzeDZxNkJBbzlaeUU3K05sbGZaL2pHelhiMEJlWlJnYVpIZjda?=
 =?utf-8?B?c3pNRkdGZDF0TXJYRDB5ZkxBZTVoZkFYdTQwb21iK2JsenRybkJYaUg4Nlpn?=
 =?utf-8?B?QS9iWXlVUkF1bi84di91cTRIa1p1VE9uZzNlVFJab1dKL0t3a294ME9VYzNR?=
 =?utf-8?B?TFhYRmVaZk9TakcvMVQ5UE9XSmpuYWRaZ2VzSkM4cm5Pcy9oU29uOGdrSk1s?=
 =?utf-8?B?TjUrd0I4QnFaWXR4OERkbXVQOUd4ZWFONHRhbWMyc1JlSXkwb1A1SEJTejhq?=
 =?utf-8?Q?5wELzmcOA3OnJKxM=3D?=
X-Exchange-RoutingPolicyChecked: 
	c/DxycMmvj/hm+7jR7VvPgX3EMRxG4HAhexWYEhmyWFdKv4plHomQCR+UtqKgu0E95PLgkq9DQ8QUH1pAl3pPvYn0YCYPKTtcBlcQyydck6S0NUnegmPi0eUUQQX6OPtDnEz2Z8cYG+xTbWd1ZJzkU0+ia44LUgr7P3EoUyXBVCeueL1FMdaqW3Clk/1EO3Qf/AwLEhMiVej//txWVBCj7LfiQzyb8LIHg0L8VNBFU37ZqjJJrsDRWGVcOfJ4XuVpFJIKoTi/dOB2+N4lfpnWiwDgGwzKrYkisxgQPiM2803oZeQkRDvsU0xfjY8gNVDscjGUJnlO09fWo4mJtGfsg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c75d32-56c6-445a-61d0-08debb94d175
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF75D68BA1B.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 02:08:17.9850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bIU5fGkEFUjRcUoMJrfhHfKvCzHeXdlUmFxzYhr9VQ5BCqPyery5Ofee/xcFLnWtLP1NW7nf3YZYx0uVHE5IjiPFQtq/aldsV4D8CHYkeZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6067
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDAxOCBTYWx0ZWRfXzu7lZRcszzLk
 gmuxykdc/YySDUPvyFV2wRurrM2wknj9RPy9ePqa1UN59z2/VwbuhYXn53xBPYioj5WmmxDusAb
 H1Cam7zq+1v9fLsYyyULMlrJnXLzLzApjGPBpN0czB8vPnULsecQz46HG4ncIjhLr+7Br2ISewI
 e/Fi0rCy63JTGVmFNG5aJIVG+r89j6B0WYJLRAEF2HXyNN2mahOqv+MRBta0fXBQKhjAD6nYapy
 ABWqHn7igib2hBQfw+d+v/BN0/TY2v4C9ZHKxLh3wGEcfy9FBSXzcoxW8WSYTlbfe0KskpLVb1N
 QsLQXDxvDqTfVRFABbNch3mIjB3UyUb4saXpzMKb5emNUvtoGdw1O2hJytfjS33BsJmWi0/26/a
 ysLiDdoY+SnyRcmYh6btvuFFiaJgmqNGvtjZsqfkG5qcAOy3eYf/5o1sUZP4An3FZjSuHY3VzvH
 hRYsbaBs+V81y2idgWw==
X-Authority-Analysis: v=2.4 cv=M5B97Sws c=1 sm=1 tr=0 ts=6a165215 cx=c_pps
 a=z66bnWj0fqQOmAclyDzAfg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=iGHA9ds3AAAA:8
 a=-bnj7TwCAAAA:8 a=v8t2wXcEAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=zXRRNrs--_ybEsDx8YMA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=d_Gf398FSA3eW0OvLo8A:9 a=FdtvzWAkjDYG7-se:21
 a=_W_S_7VecoQA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=5KLUUGAqzKPmKduZRdGW:22
 a=FPGZNUj1pMAJoPtHm4_E:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 174AceLBJ1HclGM0n_PliWRMz8jNx5tY
X-Proofpoint-ORIG-GUID: 174AceLBJ1HclGM0n_PliWRMz8jNx5tY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270018
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 27 May 2026 02:08:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9815

--------------TtYI3J3JsGirS5oQ98tujKXX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64R1SCmC1874660


On 5/25/26 21:08, Bruce Ashfield wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
>
> On Mon, May 25, 2026 at 9:03=E2=80=AFAM Zhixiong Chi via=20
> lists.yoctoproject.org=20
> <https://urldefense.com/v3/__http://lists.yoctoproject.org__;!!AjveYdw8=
EvQ!cnA8qqQTA9nQEfoueNL-1Ttq4BRcQatPSL_wWjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZ=
p9xtYSCkhX7RHkrOX0GynnmDg$>=20
> <zhixiong.chi=3Dwindriver.com@lists.yoctoproject.org> wrote:
>
>     Bumping crun to version v1.27.1, which comprises the following
>     commits:
>
>     =C2=A0 =C2=A0 3ec076b3 NEWS: tag 1.27.1
>     =C2=A0 =C2=A0 60b2e8f8 tests, podman: pin to 5.8
>     =C2=A0 =C2=A0 3010d29d tests: fix failure in user namespace
>     =C2=A0 =C2=A0 d6ffa244 krun: remove unused variable
>     =C2=A0 =C2=A0 1c5c2f7d linux: pass correct propagation to get_bind_=
mount
>     =C2=A0 =C2=A0 d97461f0 tests: add regression test for idmapped moun=
t leak
>     =C2=A0 =C2=A0 59cfa8b8 Revert "linux: skip redundant MS_PRIVATE pro=
pagation
>     mounts"
>     =C2=A0 =C2=A0 f1b70c0b tests: add subcgroup cleanup test
>     =C2=A0 =C2=A0 6177dd86 cgroup: fix recursive cgroup cleanup consumi=
ng
>     caller's fd
>     =C2=A0 =C2=A0 6c58b0c6 fix -Wdiscarded-qualifiers warnings
>     =C2=A0 =C2=A0 acb904c6 krun: Build passt argv based on nitro varian=
t
>     =C2=A0 =C2=A0 8199cbb2 krun: implement support for passt networking
>     =C2=A0 =C2=A0 7c2500df krun: ignore RAM configurations below 128MB
>     =C2=A0 =C2=A0 23f7d9f0 krun: consolidate configuration in configure=
_vm
>     =C2=A0 =C2=A0 04c19ac6 krun: process the vm configuration earlier
>     =C2=A0 =C2=A0 81c21e0d handlers: add new hook to close fds
>     =C2=A0 =C2=A0 d8813f3d .codespellrc: ignore passt
>     =C2=A0 =C2=A0 94d7f641 utils: fix apparmor profile not applied in u=
ser
>     namespaces
>     =C2=A0 =C2=A0 805e6a44 libcrun: skip cgroup filesystem type check w=
hen
>     cgroups are disabled
>     =C2=A0 =C2=A0 4c530d43 libcrun: fall back to bind mount for /dev/co=
nsole on
>     read-only file systems
>     =C2=A0 =C2=A0 a718a92c NEWS: tag 1.27
>     =C2=A0 =C2=A0 6220914d nix: generate git-version.h in buildPhase
>     =C2=A0 =C2=A0 9553f8b8 exec: strengthen -u value validation
>     =C2=A0 =C2=A0 1bd7f424 exec: fix CVE-2026-30892
>     =C2=A0 =C2=A0 5699da29 nix: fix zlib cross-compilation for s390x
>     =C2=A0 =C2=A0 237f8100 nix: remove global overlay to eliminate rebu=
ild cascade
>     =C2=A0 =C2=A0 b37594dc release: use path: flake ref to avoid libgit=
2
>     safe.directory
>     <https://urldefense.com/v3/__http://safe.directory__;!!AjveYdw8EvQ!=
cnA8qqQTA9nQEfoueNL-1Ttq4BRcQatPSL_wWjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xt=
YSCkhX7RHkrOX255E1T9Q$>
>     =C2=A0 =C2=A0 aaa6056c release: seed /nix from container image when=
 empty
>     =C2=A0 =C2=A0 c4e3fd22 linux: set MS_PRIVATE on detached mounts fro=
m
>     get_bind_mount()
>     =C2=A0 =C2=A0 360621a3 Revert "container: skip sigaction reset in
>     unblock_signals for the run path"
>     =C2=A0 =C2=A0 5d1b0284 nix: migrate to flakes
>     =C2=A0 =C2=A0 246a3367 nix: generate git-version.h in buildPhase
>     =C2=A0 =C2=A0 3e9986bc nix: bump nixos/nix image from 2.24.9 to 2.3=
4.2
>     =C2=A0 =C2=A0 094c97f3 nix: update
>     =C2=A0 =C2=A0 195f664f seccomp_notify: tighten crun_make_error inpu=
t
>     =C2=A0 =C2=A0 1d76be72 seccomp: tighten crun_make_error input
>     =C2=A0 =C2=A0 62d3e852 container: tighten crun_make_error input
>     =C2=A0 =C2=A0 254a8a75 linux: use open_tree+mount_setattr for devic=
e mounts
>     =C2=A0 =C2=A0 2d6f4c0e linux: use open_tree+move_mount for masked p=
aths
>     =C2=A0 =C2=A0 45e62ce5 linux: use open_tree+mount_setattr for reado=
nly paths
>     =C2=A0 =C2=A0 f53aa376 linux: use mount_setattr for readonly remoun=
ts in
>     finalize_mounts
>     =C2=A0 =C2=A0 2dae2238 linux: skip redundant MS_PRIVATE propagation=
 mounts
>     =C2=A0 =C2=A0 38e17199 container: skip sigaction reset in unblock_s=
ignals
>     for the run path
>     =C2=A0 =C2=A0 4b66d8f0 cgroup: skip enable_controllers when joined =
via
>     CLONE_INTO_CGROUP
>     =C2=A0 =C2=A0 a59b186b linux: validate run.oci.mount_context_type a=
nnotation
>     value
>     =C2=A0 =C2=A0 16bd4e48 utils: do not use errno after success
>
>     Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
>     ---
>     =C2=A0recipes-containers/crun/crun_git.bb
>     <https://urldefense.com/v3/__http://crun_git.bb__;!!AjveYdw8EvQ!cnA=
8qqQTA9nQEfoueNL-1Ttq4BRcQatPSL_wWjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSC=
khX7RHkrOX1s4OHFmA$>
>     | 4 ++--
>     =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>
>     diff --git a/recipes-containers/crun/crun_git.bb
>     <https://urldefense.com/v3/__http://crun_git.bb__;!!AjveYdw8EvQ!cnA=
8qqQTA9nQEfoueNL-1Ttq4BRcQatPSL_wWjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSC=
khX7RHkrOX1s4OHFmA$>
>     b/recipes-containers/crun/crun_git.bb
>     <https://urldefense.com/v3/__http://crun_git.bb__;!!AjveYdw8EvQ!cnA=
8qqQTA9nQEfoueNL-1Ttq4BRcQatPSL_wWjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSC=
khX7RHkrOX1s4OHFmA$>
>     index d2f7b63b..f4e489d5 100644
>     --- a/recipes-containers/crun/crun_git.bb
>     <https://urldefense.com/v3/__http://crun_git.bb__;!!AjveYdw8EvQ!cnA=
8qqQTA9nQEfoueNL-1Ttq4BRcQatPSL_wWjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSC=
khX7RHkrOX1s4OHFmA$>
>     +++ b/recipes-containers/crun/crun_git.bb
>     <https://urldefense.com/v3/__http://crun_git.bb__;!!AjveYdw8EvQ!cnA=
8qqQTA9nQEfoueNL-1Ttq4BRcQatPSL_wWjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSC=
khX7RHkrOX1s4OHFmA$>
>     @@ -3,7 +3,7 @@ LICENSE =3D "GPL-2.0-only"
>     =C2=A0LIC_FILES_CHKSUM =3D
>     "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
>     =C2=A0PRIORITY =3D "optional"
>
>     -SRCREV_crun =3D "393509db566bedea037d1599c5a58b896f5d3b01"
>     +SRCREV_crun =3D "3ec076b3b6714ec2f1a10533cf18d5605a6de637"
>     =C2=A0SRCREV_libocispec =3D "8b07b619df73a113f7721f1c7ce24f2572b04c=
ea"
>     =C2=A0SRCREV_ispec =3D "a4c6ade7bb82b316d45391f572727a63e268b252"
>     =C2=A0SRCREV_rspec =3D "6f7b71c2d216403715f7364ac88dec88d9da989c"
>     @@ -19,7 +19,7 @@ SRC_URI =3D
>     "git://github.com/containers/crun.git;branch=3Dmain;name=3Dcrun;pro=
tocol=3Dh
>     <https://urldefense.com/v3/__http://github.com/containers/crun.git;=
branch=3Dmain;name=3Dcrun;protocol=3Dh__;!!AjveYdw8EvQ!cnA8qqQTA9nQEfoueN=
L-1Ttq4BRcQatPSL_wWjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSCkhX7RHkrOX1a1kP=
dAw$>
>     file://0002-libocispec-fix-array-items-parsing.patch;patchdir=3Dlib=
ocispec
>     \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>
>     -PV =3D "1.26.0+git"
>     +PV =3D "1.27.1+git"
>
>
> I know I had mentioned that updates could be sent to released=20
> branches, but these
> simply won't be applied to that branch
>
> bugfix only updates, or individual patches only.
>
> master will continue to receive updates on a roughly monthly cadence.
>
> Bruce

Hi Bruce,

As you know, the current SRCREV is inlcuded in tag 1.27, it's between=20
1.26 and 1.27 changed by the last patch upgrading patch.

$ git clone https://github.com/containers/crun.git
$ cd crun
$ git tag --contain 393509db566bedea037d1599c5a58b896f5d3b01
1.27
1.27.1

and I know you have declared it in the patch comment as the version=20
"1.26-160-g393509db".

So in this patch, it's not a upgrading from 1.26 to 1.27 in the strict=20
sense, perhaps we can regard it from 1.27 to 1.27.1 and most of these=20
commits were bugfix.

Could you please think about it again?

Thanks.

>
>
>     =C2=A0inherit autotools-brokensep pkgconfig features_check
>
>     --=20
>     2.53.0
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#9809):
>     https://lists.yoctoproject.org/g/meta-virtualization/message/9809
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-=
virtualization/message/9809__;!!AjveYdw8EvQ!cnA8qqQTA9nQEfoueNL-1Ttq4BRcQ=
atPSL_wWjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSCkhX7RHkrOX0a4U_SOg$>
>     Mute This Topic:
>     https://lists.yoctoproject.org/mt/119480093/1050810
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/1194=
80093/1050810__;!!AjveYdw8EvQ!cnA8qqQTA9nQEfoueNL-1Ttq4BRcQatPSL_wWjwgKTT=
RYIEFbA2cTnu76WbjWOFd_BshZp9xtYSCkhX7RHkrOX2Gur5Ahg$>
>     Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>     <mailto:meta-virtualization%2Bowner@lists.yoctoproject.org>
>     Unsubscribe:
>     https://lists.yoctoproject.org/g/meta-virtualization/unsub
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-=
virtualization/unsub__;!!AjveYdw8EvQ!cnA8qqQTA9nQEfoueNL-1Ttq4BRcQatPSL_w=
WjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSCkhX7RHkrOX2IP739BA$>
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
--------------TtYI3J3JsGirS5oQ98tujKXX
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64R1SCmC1874660

<!DOCTYPE html><html data-lt-installed=3D"true"><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body style=3D"padding-bottom: 1px;">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 5/25/26 21:08, Bruce Ashfield wrote=
:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4O0vb_-QPTjCDN=3DFNsSm9Ap=
yKQ+ZqJvj27PmhvsLwWZKA@mail.gmail.com">
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
          <div dir=3D"ltr">
            <div class=3D"gmail_default" style=3D"font-size:small"><br>
            </div>
          </div>
          <br>
          <div class=3D"gmail_quote gmail_quote_container">
            <div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 25, 2026 at
              9:03=E2=80=AFAM Zhixiong Chi via
              <a href=3D"https://urldefense.com/v3/__http://lists.yoctopr=
oject.org__;!!AjveYdw8EvQ!cnA8qqQTA9nQEfoueNL-1Ttq4BRcQatPSL_wWjwgKTTRYIE=
FbA2cTnu76WbjWOFd_BshZp9xtYSCkhX7RHkrOX0GynnmDg$" moz-do-not-send=3D"true=
">
                lists.yoctoproject.org</a> &lt;zhixiong.chi=3D<a href=3D"=
mailto:windriver.com@lists.yoctoproject.org" moz-do-not-send=3D"true" cla=
ss=3D"moz-txt-link-freetext">windriver.com@lists.yoctoproject.org</a>&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              Bumping crun to version v1.27.1, which comprises the
              following commits:<br>
              <br>
              &nbsp; &nbsp; 3ec076b3 NEWS: tag 1.27.1<br>
              &nbsp; &nbsp; 60b2e8f8 tests, podman: pin to 5.8<br>
              &nbsp; &nbsp; 3010d29d tests: fix failure in user namespace=
<br>
              &nbsp; &nbsp; d6ffa244 krun: remove unused variable<br>
              &nbsp; &nbsp; 1c5c2f7d linux: pass correct propagation to
              get_bind_mount<br>
              &nbsp; &nbsp; d97461f0 tests: add regression test for idmap=
ped mount
              leak<br>
              &nbsp; &nbsp; 59cfa8b8 Revert &quot;linux: skip redundant M=
S_PRIVATE
              propagation mounts&quot;<br>
              &nbsp; &nbsp; f1b70c0b tests: add subcgroup cleanup test<br=
>
              &nbsp; &nbsp; 6177dd86 cgroup: fix recursive cgroup cleanup
              consuming caller's fd<br>
              &nbsp; &nbsp; 6c58b0c6 fix -Wdiscarded-qualifiers warnings<=
br>
              &nbsp; &nbsp; acb904c6 krun: Build passt argv based on nitr=
o variant<br>
              &nbsp; &nbsp; 8199cbb2 krun: implement support for passt ne=
tworking<br>
              &nbsp; &nbsp; 7c2500df krun: ignore RAM configurations belo=
w 128MB<br>
              &nbsp; &nbsp; 23f7d9f0 krun: consolidate configuration in
              configure_vm<br>
              &nbsp; &nbsp; 04c19ac6 krun: process the vm configuration e=
arlier<br>
              &nbsp; &nbsp; 81c21e0d handlers: add new hook to close fds<=
br>
              &nbsp; &nbsp; d8813f3d .codespellrc: ignore passt<br>
              &nbsp; &nbsp; 94d7f641 utils: fix apparmor profile not appl=
ied in
              user namespaces<br>
              &nbsp; &nbsp; 805e6a44 libcrun: skip cgroup filesystem type=
 check
              when cgroups are disabled<br>
              &nbsp; &nbsp; 4c530d43 libcrun: fall back to bind mount for
              /dev/console on read-only file systems<br>
              &nbsp; &nbsp; a718a92c NEWS: tag 1.27<br>
              &nbsp; &nbsp; 6220914d nix: generate git-version.h in build=
Phase<br>
              &nbsp; &nbsp; 9553f8b8 exec: strengthen -u value validation=
<br>
              &nbsp; &nbsp; 1bd7f424 exec: fix CVE-2026-30892<br>
              &nbsp; &nbsp; 5699da29 nix: fix zlib cross-compilation for =
s390x<br>
              &nbsp; &nbsp; 237f8100 nix: remove global overlay to elimin=
ate
              rebuild cascade<br>
              &nbsp; &nbsp; b37594dc release: use path: flake ref to avoi=
d libgit2
              <a href=3D"https://urldefense.com/v3/__http://safe.director=
y__;!!AjveYdw8EvQ!cnA8qqQTA9nQEfoueNL-1Ttq4BRcQatPSL_wWjwgKTTRYIEFbA2cTnu=
76WbjWOFd_BshZp9xtYSCkhX7RHkrOX255E1T9Q$" moz-do-not-send=3D"true">
                safe.directory</a><br>
              &nbsp; &nbsp; aaa6056c release: seed /nix from container im=
age when
              empty<br>
              &nbsp; &nbsp; c4e3fd22 linux: set MS_PRIVATE on detached mo=
unts from
              get_bind_mount()<br>
              &nbsp; &nbsp; 360621a3 Revert &quot;container: skip sigacti=
on reset in
              unblock_signals for the run path&quot;<br>
              &nbsp; &nbsp; 5d1b0284 nix: migrate to flakes<br>
              &nbsp; &nbsp; 246a3367 nix: generate git-version.h in build=
Phase<br>
              &nbsp; &nbsp; 3e9986bc nix: bump nixos/nix image from 2.24.=
9 to
              2.34.2<br>
              &nbsp; &nbsp; 094c97f3 nix: update<br>
              &nbsp; &nbsp; 195f664f seccomp_notify: tighten crun_make_er=
ror input<br>
              &nbsp; &nbsp; 1d76be72 seccomp: tighten crun_make_error inp=
ut<br>
              &nbsp; &nbsp; 62d3e852 container: tighten crun_make_error i=
nput<br>
              &nbsp; &nbsp; 254a8a75 linux: use open_tree+mount_setattr f=
or device
              mounts<br>
              &nbsp; &nbsp; 2d6f4c0e linux: use open_tree+move_mount for =
masked
              paths<br>
              &nbsp; &nbsp; 45e62ce5 linux: use open_tree+mount_setattr f=
or
              readonly paths<br>
              &nbsp; &nbsp; f53aa376 linux: use mount_setattr for readonl=
y
              remounts in finalize_mounts<br>
              &nbsp; &nbsp; 2dae2238 linux: skip redundant MS_PRIVATE pro=
pagation
              mounts<br>
              &nbsp; &nbsp; 38e17199 container: skip sigaction reset in
              unblock_signals for the run path<br>
              &nbsp; &nbsp; 4b66d8f0 cgroup: skip enable_controllers when=
 joined
              via CLONE_INTO_CGROUP<br>
              &nbsp; &nbsp; a59b186b linux: validate run.oci.mount_contex=
t_type
              annotation value<br>
              &nbsp; &nbsp; 16bd4e48 utils: do not use errno after succes=
s<br>
              <br>
              Signed-off-by: Zhixiong Chi &lt;<a href=3D"mailto:zhixiong.=
chi@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"mo=
z-txt-link-freetext">zhixiong.chi@windriver.com</a>&gt;<br>
              ---<br>
              &nbsp;recipes-containers/crun/<a href=3D"https://urldefense=
.com/v3/__http://crun_git.bb__;!!AjveYdw8EvQ!cnA8qqQTA9nQEfoueNL-1Ttq4BRc=
QatPSL_wWjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSCkhX7RHkrOX1s4OHFmA$" rel=3D=
"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">crun_git.bb</a>
              | 4 ++--<br>
              &nbsp;1 file changed, 2 insertions(+), 2 deletions(-)<br>
              <br>
              diff --git a/recipes-containers/crun/<a href=3D"https://url=
defense.com/v3/__http://crun_git.bb__;!!AjveYdw8EvQ!cnA8qqQTA9nQEfoueNL-1=
Ttq4BRcQatPSL_wWjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSCkhX7RHkrOX1s4OHFmA=
$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">crun_git=
.bb</a>
              b/recipes-containers/crun/<a href=3D"https://urldefense.com=
/v3/__http://crun_git.bb__;!!AjveYdw8EvQ!cnA8qqQTA9nQEfoueNL-1Ttq4BRcQatP=
SL_wWjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSCkhX7RHkrOX1s4OHFmA$" rel=3D"n=
oreferrer" target=3D"_blank" moz-do-not-send=3D"true">crun_git.bb</a><br>
              index d2f7b63b..f4e489d5 100644<br>
              --- a/recipes-containers/crun/<a href=3D"https://urldefense=
.com/v3/__http://crun_git.bb__;!!AjveYdw8EvQ!cnA8qqQTA9nQEfoueNL-1Ttq4BRc=
QatPSL_wWjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSCkhX7RHkrOX1s4OHFmA$" rel=3D=
"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">crun_git.bb</a><b=
r>
              +++ b/recipes-containers/crun/<a href=3D"https://urldefense=
.com/v3/__http://crun_git.bb__;!!AjveYdw8EvQ!cnA8qqQTA9nQEfoueNL-1Ttq4BRc=
QatPSL_wWjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSCkhX7RHkrOX1s4OHFmA$" rel=3D=
"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">crun_git.bb</a><b=
r>
              @@ -3,7 +3,7 @@ LICENSE =3D &quot;GPL-2.0-only&quot;<br>
              &nbsp;LIC_FILES_CHKSUM =3D
              <a class=3D"moz-txt-link-rfc2396E" href=3D"file://COPYING;m=
d5=3Db234ee4d69f5fce4486a80fdaf4a4263">&quot;file://COPYING;md5=3Db234ee4=
d69f5fce4486a80fdaf4a4263&quot;</a><br>
              &nbsp;PRIORITY =3D &quot;optional&quot;<br>
              <br>
              -SRCREV_crun =3D &quot;393509db566bedea037d1599c5a58b896f5d=
3b01&quot;<br>
              +SRCREV_crun =3D &quot;3ec076b3b6714ec2f1a10533cf18d5605a6d=
e637&quot;<br>
              &nbsp;SRCREV_libocispec =3D
              &quot;8b07b619df73a113f7721f1c7ce24f2572b04cea&quot;<br>
              &nbsp;SRCREV_ispec =3D &quot;a4c6ade7bb82b316d45391f572727a=
63e268b252&quot;<br>
              &nbsp;SRCREV_rspec =3D &quot;6f7b71c2d216403715f7364ac88dec=
88d9da989c&quot;<br>
              @@ -19,7 +19,7 @@ SRC_URI =3D &quot;git://<a href=3D"https:=
//urldefense.com/v3/__http://github.com/containers/crun.git;branch=3Dmain=
;name=3Dcrun;protocol=3Dh__;!!AjveYdw8EvQ!cnA8qqQTA9nQEfoueNL-1Ttq4BRcQat=
PSL_wWjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSCkhX7RHkrOX1a1kPdAw$" rel=3D"=
noreferrer" target=3D"_blank" moz-do-not-send=3D"true">github.com/contain=
ers/crun.git;branch=3Dmain;name=3Dcrun;protocol=3Dh</a><br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              <a class=3D"moz-txt-link-freetext" href=3D"file://0002-libo=
cispec-fix-array-items-parsing.patch;patchdir=3Dlibocispec">file://0002-l=
ibocispec-fix-array-items-parsing.patch;patchdir=3Dlibocispec</a>
              \<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;<br>
              <br>
              -PV =3D &quot;1.26.0+git&quot;<br>
              +PV =3D &quot;1.27.1+git&quot;<br>
            </blockquote>
            <div><br>
            </div>
            <div>
              <div class=3D"gmail_default" style=3D"font-size:small">I kn=
ow
                I had mentioned that updates could be sent to released
                branches, but these</div>
              <div class=3D"gmail_default" style=3D"font-size:small">simp=
ly
                won't be applied to that branch</div>
              <div class=3D"gmail_default" style=3D"font-size:small"><br>
              </div>
              <div class=3D"gmail_default" style=3D"font-size:small">bugf=
ix
                only updates, or individual patches only.</div>
              <div class=3D"gmail_default" style=3D"font-size:small"><br>
              </div>
              <div class=3D"gmail_default" style=3D"font-size:small">mast=
er
                will continue to receive updates on a roughly monthly
                cadence.</div>
              <div class=3D"gmail_default" style=3D"font-size:small"><br>
              </div>
              <div class=3D"gmail_default" style=3D"font-size:small">Bruc=
e</div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Hi Bruce,</p>
    <p>As you know, the current SRCREV is inlcuded in tag 1.27, it's
      between 1.26 and 1.27 changed by the last patch upgrading patch. <b=
r>
    </p>
    <p>$ git clone <a class=3D"moz-txt-link-freetext" href=3D"https://git=
hub.com/containers/crun.git">https://github.com/containers/crun.git</a><b=
r>
      $ cd crun<br>
      $ git tag --contain 393509db566bedea037d1599c5a58b896f5d3b01<br>
      1.27<br>
      1.27.1<br>
    </p>
    <p>and I know you have declared it in the patch comment as the
      version &quot;1.26-160-g393509db&quot;.</p>
    <p>So in this patch, it's not a upgrading from 1.26 to 1.27 in the
      strict sense, perhaps we can regard it from 1.27 to 1.27.1 and
      most of these commits were bugfix.</p>
    <p>Could you please think about it again?</p>
    <p>Thanks.<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4O0vb_-QPTjCDN=3DFNsSm9Ap=
yKQ+ZqJvj27PmhvsLwWZKA@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote gmail_quote_container">
            <div>
              <br>
            </div>
            <div>&nbsp;</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <br>
              &nbsp;inherit autotools-brokensep pkgconfig features_check<=
br>
              <br>
              -- <br>
              2.53.0<br>
              <br>
              <br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#9809): <a href=3D"https://urldefense.co=
m/v3/__https://lists.yoctoproject.org/g/meta-virtualization/message/9809_=
_;!!AjveYdw8EvQ!cnA8qqQTA9nQEfoueNL-1Ttq4BRcQatPSL_wWjwgKTTRYIEFbA2cTnu76=
WbjWOFd_BshZp9xtYSCkhX7RHkrOX0a4U_SOg$" rel=3D"noreferrer" target=3D"_bla=
nk" moz-do-not-send=3D"true">
https://lists.yoctoproject.org/g/meta-virtualization/message/9809</a><br>
              Mute This Topic: <a href=3D"https://urldefense.com/v3/__htt=
ps://lists.yoctoproject.org/mt/119480093/1050810__;!!AjveYdw8EvQ!cnA8qqQT=
A9nQEfoueNL-1Ttq4BRcQatPSL_wWjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSCkhX7R=
HkrOX2Gur5Ahg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"t=
rue">
                https://lists.yoctoproject.org/mt/119480093/1050810</a><b=
r>
              Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@=
lists.yoctoproject.org" target=3D"_blank" moz-do-not-send=3D"true">
                meta-virtualization+owner@lists.yoctoproject.org</a><br>
              Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.yoctoproject.org/g/meta-virtualization/unsub__;!!AjveYdw8EvQ!cnA8q=
qQTA9nQEfoueNL-1Ttq4BRcQatPSL_wWjwgKTTRYIEFbA2cTnu76WbjWOFd_BshZp9xtYSCkh=
X7RHkrOX2IP739BA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">
https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a href=3D=
"mailto:bruce.ashfield@gmail.com" target=3D"_blank" moz-do-not-send=3D"tr=
ue" class=3D"moz-txt-link-freetext">bruce.ashfield@gmail.com</a>]<br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              <br>
            </blockquote>
          </div>
          <div><br clear=3D"all">
          </div>
          <div><br>
          </div>
          <span class=3D"gmail_signature_prefix">-- </span><br>
          <div dir=3D"ltr" class=3D"gmail_signature">- Thou shalt not fol=
low
            the NULL pointer, for chaos and madness await thee at its
            end<br>
            - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
            <br>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
  <lt-container></lt-container>
</html>

--------------TtYI3J3JsGirS5oQ98tujKXX--

