Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F21CFD4337B
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 02:59:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4552.1731034772934413232
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 07 Nov 2024 18:59:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1042324eef=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A81pVPP027533
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 7 Nov 2024 18:59:32 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42s6gf05tt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 07 Nov 2024 18:59:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=epyQ2YQxOH9l9keDbSiJ/VigFFCTHEOyTFcjQmQ5glw6Gz2qapLaW/8E8WRUlFgQJe/5hMi7Lp+Z9MK3iuCMu+adBuL2gc15dJ4cADphXhhRclSjOlm0VC/j/z1ugVibHEv3H9R4TMMVwFVWLdtdpzoZ7BfI64hgcTQGgBJQ01FfO60YV0OkVMe+4eSbeghXd6mXboqB3KVLiTabICRWsvc0IRHvC66T4i2nXmUj4aDNQn3MQGlbLYpYRubJwBJC11aQjY8CTMyNEFrizxZhacXfE7QM2oybQEiHQcitWcND4Q0U8uo1fQSBD+LI8rlUNBvInCQrLWMCFTU01c5zlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEJhQs+/mqJLrcGcexwo26gjNc1fbA1He7w0BHr6LL0=;
 b=f7CXal2IQtQqP6WyMYanlIZx1qd7RSRPLEOGWpgM6ZHL/JCRfGLZco98Amz009N0LfYlUjtjND7i6MQyQmDwuvU/lUkmq9teYFxsgPeu4C/adXSa1udLU/Upaqk9pROKkqW/1pK10b35byAdrZ1JD+qkSlrXdCJ0/YWPyxBUWuiTQs6+jOborP0fqVaYOkSnFl4dzFlKSeZy2ef97GW003A6fs0C0GGNJzIf5+3lo/pMtsQ1drmx6EPPfSI7Rq50C3FclHWmjEy7unPpjO1LH0xPvIHPV0vZImn0CqqaeTNbHhbXMzTeRbrH7+mmGkyQykALrvxSIDoQe2hXd+dlBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB7381.namprd11.prod.outlook.com (2603:10b6:8:134::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 02:59:28 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 02:59:28 +0000
Message-ID: <a7624c48-9683-41eb-a5eb-146f45ce5061@windriver.com>
Date: Fri, 8 Nov 2024 10:59:23 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][scarthgap][PATCH] libvirt: set
 USERADD_DEPENDS to avoid package_write_rpm failure
To: meta-virtualization@lists.yoctoproject.org
References: <1805DEC3FAC3F34F.28149@lists.yoctoproject.org>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <1805DEC3FAC3F34F.28149@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP301CA0026.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::10) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB7381:EE_
X-MS-Office365-Filtering-Correlation-Id: c1e6768e-58ef-4364-860b-08dcffa15bfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZWpYM2ljN0FSUEhyOWdudmc2azBMR0owb0dOcndDVTIyVE1HRnZQM3pVY3hw?=
 =?utf-8?B?dXg5UzBXN2dVOUYzVDN4Q2ZJQm1TcVM1cFFLNDNMMklHZ2tVVDlEMlM0ZGtr?=
 =?utf-8?B?MzkrSHlYQlVYaGY3WVFCRjk3L1pwdm1WdkNKZkVDUEtwazhMVE9FMUdUOEoz?=
 =?utf-8?B?WkRWQWJPc0U2alQ2azFoQ0hMdk50dXdwRFBQWUhhbFRCS1o3UWRua2czalRv?=
 =?utf-8?B?NHhUWG5XUUUwbHN0VE9pajQ3bjQ2Q1pqbzc0TzdYZnQyUnN0Z0xZZzhiTnNm?=
 =?utf-8?B?a1ZURTdjeUprekd6cW11VnAveUorbSs3WFp4S1RScDg3MGpWOHVVcmlrbFZN?=
 =?utf-8?B?RG96SDJnbmY3d1M4VlhKK0NCd0wrQUdPS1RGa3hsLy90YTFDbThvdWdCUlRl?=
 =?utf-8?B?WFl2UnRqSG5SOWZ3ak9xUzJnK2E0dmtvaWcwYjNqZlNLbGQ4a1U1ZGhsUWoz?=
 =?utf-8?B?MkZiWmZoOE0zVDRDR0hTTXU4RmNMRXhocGlBaGNBNk9XdnlObUhheDZrNkxL?=
 =?utf-8?B?SklQS1dPVjJUTFhmQmJIUVRxVjFrZFFKeHcxZWQxQnF4d2hTU0xFY0NTaWxX?=
 =?utf-8?B?UmtaSDhjSk80cEc2QkU5NmRTV2RqOGtUbVZRRDFEU0p1cG05UG4vd0pMVUVs?=
 =?utf-8?B?ZHlISWZhRVRNYWg3ejNZOHZpT0ZseUZ6L2VvQmJmMURUL3JYaEtXTml3RWRU?=
 =?utf-8?B?aUJMSDhBd1JlZEducUlIblI2c2JBaGJ3R1VtS1g0c0YzNjR1eTZXWTdaN3JO?=
 =?utf-8?B?Q1lhNkxIditWMTUrdDZzdzdyZkJyOHo4N0ZWc3FDbHBUZlhMRjZhQzlZL3BS?=
 =?utf-8?B?QjRSOS9iR3htZ2lQM2hjWmIxTUJvTFBMQ3dENzRKSkVGUmF3TE9qQWxtR2Q0?=
 =?utf-8?B?ZjZXQXh3aFdnRjNQem9jYjFaZGdCd3B1UUNMT3c4ZVpsWGx1OElIdUJ2TjdX?=
 =?utf-8?B?bUVBSEpJMk9POEZEMDJ1K1JGNnFxbytNWWd6YzV4Y3ErY0c5V2J0SDZweEVz?=
 =?utf-8?B?VUYvQzZ4VmlDSlFMdFBJY3dZUkwvKytTeXNsZFNOcWRoYVJTZkVRY3BnR3Fx?=
 =?utf-8?B?UWpldURhWk95R3cyWndvd1JSUzVSMUpMMUl1Z3MrbTdoQkxSR3BjRWNxakwy?=
 =?utf-8?B?bHR4NE5UUGxLUy9sUThvZG1VV1djOVQ3R09IeFlkRUNiQzA4aWhGNW9Lbi9U?=
 =?utf-8?B?eXArTGc0T1F2d0o4L0w4aGgvL3VJaHRJaWlrZWUvb2hkK0lrbWhhZ3JTZE56?=
 =?utf-8?B?TWhIL3FoQjdhMG8ycGF3VnQ5azdhbnU5dnovVHpyazV3YW1zTGdjZGJGVWZP?=
 =?utf-8?B?TmJQazk2TGxpbzhVTk1EdWl4N2x6MXZTT2s2Y051ckRQbEJNTC9GN0IzZm1D?=
 =?utf-8?B?Z3BrY0JpckdIQm8xdnpoQnBLSklBdHlEUTc4ZmxIU3JpMGg1WHAxL2hLWlNz?=
 =?utf-8?B?Mk0xRHl5dThnN3d5NmRXR2lCY1dleCtsOUVLcG5sTlZhRCs3aURqTmhKaWgy?=
 =?utf-8?B?eDQ4MEFBMjJiWFNlRVFXa05ldHE5aXl0dXk5R0tDakhXcVB2eStWajRsYkFr?=
 =?utf-8?B?UVNwb0tHQUpKRG82Q21haEdpQzNtaE9nSE5IUEVJdGxhNmI0ZzBNbXRwallm?=
 =?utf-8?B?ZzJBRmVSZThKZ25SY1c0OHV1ZUR3M1gwNTVTZm1VNHE2VWJjeHdRWjNZc01h?=
 =?utf-8?Q?hu3WZb2M+2ZaGJXHolok?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?emI2Rzh5ZDcxcHJkY3dXTElpc0ZTN3dja1ZrY25GODB2c0t2YUdzMEVNRlJ0?=
 =?utf-8?B?VXNzOHo5UVVHMlZtWThOcm9qZzJLNWFVVzlMdXp1MFRmN1ZWUDcwb3U3WHJ0?=
 =?utf-8?B?ZW5zOVN3RWYyMGg2Z1FzY3FWVXBVaFFPOHlvbmVEV1I3OHZoM24vZHhUbjFQ?=
 =?utf-8?B?R1J4OFFYTXUyeDkrQUVXdERyVHFJY1FFemhvOWpiWkY3RU5XVzhmWVJqR0sw?=
 =?utf-8?B?QlpGNFV3ZFVPR1I0UEg2c1NzSHZEZjNzRGhSUVJ3SThPdmJMeEE1RTN6bEFq?=
 =?utf-8?B?QWpiVDVyaWYybGkrb1l3TTNzdXQ4aXJ4aVZmYWZlay9SRmFXbkRQaU9MK09Z?=
 =?utf-8?B?MEdoUjhocW5FMStENFMvd1dDNWc5U2VmbzM3ZC93VU4xeGFlUHNRY3Y3bXRp?=
 =?utf-8?B?MTg3VnFFZ3JNbjBpWHhkWXFxOHNsYXB5SjlEcDIxdTVuNE5RUUNRcTZuUlBw?=
 =?utf-8?B?VHRVb0t0WUJCTEVTd20rWG1DdEZvVCtCOWhqNU9GUnpBRXFVa2xGdFVNZEI5?=
 =?utf-8?B?N1BTWmlQN243WldCcmphTUI1a1RXbjU1SlVOaUZmZDdMblhZM3hRUUJuMjFj?=
 =?utf-8?B?eXRobGhaS0tLeXZvNlJSdkNja29qOVJpTURxZmNiOFd5VGVQd05FUzZzN2Y3?=
 =?utf-8?B?ZWRGQi9RMmt0Y1BMQTYvTmVka3paRkxWRU1qSEw4NnZtSEk2aVpIeGN0aTJK?=
 =?utf-8?B?RFdUM1krWVpQYlhiTFQ1d3FPeEdVb24zbC9oUFBSUitIMWZBTitTRVU2QjNz?=
 =?utf-8?B?b0FrWEJGMnNWYnNndCtUY1YrMzlBV1BvSWVnVTBSVmJwbFJITllRMnZkMWdB?=
 =?utf-8?B?SEVITGFPMk9tWFJGTUhMcXdnQXpRd0xMMkFzUGFQTStXNk1pR1E1MjkxN3la?=
 =?utf-8?B?MjJCM2Q4dG1kbGVsa3pvVENieDUxS1FtRHh4UGNZN1RkazBLc2hEMmcxbGpv?=
 =?utf-8?B?ZFdJNitoS0Z4eUowTE15c0lUck00cTRRM2hQU3hCaWJYNDFheEdsMVQrQTJu?=
 =?utf-8?B?L05wOWRDYkE0eHBVSnA4WUJWNndxYTBBMEw4M2o4b05MUm93T3hLbXZraDVt?=
 =?utf-8?B?TkY4OW9VTDFUajFnRUN4RTZ4dVlOOEd5czQzNTFJYlprRUhOKy84U1pSY1lW?=
 =?utf-8?B?MEFBU1ZXVmJWWmVZSmN3ZUtQMEkvR1BCL205Q2U5Z0VjbDlhbFJDY1BkSXlY?=
 =?utf-8?B?VmdzL2Z6ZGRmQllLTzNnSXU4U0RWcTRSUitUcGtGamZRNE1rV255ZU1DcDFw?=
 =?utf-8?B?MitIbENMVmJCL1hRb2RBdUhtVkU2YzFIbHA0N0FWVHNYWEFyRVJUWFgzZkRT?=
 =?utf-8?B?aVhLV2xUTldBb3pRTFdxMkl5SjVXYjJHcm5JNktXWUhvOVNWdVpZOFdJR3po?=
 =?utf-8?B?S2xEbkFJd2RlMkhxalI0cWNqYmQ0UjE1QitKTlhoY2NsR1VvOWNMUHoxT201?=
 =?utf-8?B?MVFKZWVDM3I1aEVQOC84MUFSTE1KUkN2RVVTUkxHQm1XdithLzQzY05QZ2l4?=
 =?utf-8?B?dTdScG04SzNSMUx6U29vWWVmUGFiaWtkWXpockhtQ0pRTWx5dUszRkVaajJu?=
 =?utf-8?B?U0lKazA2bGx0SDhnTnpnYklZeGIxdTBHMERXU2U3Q1JPN2gzRnA5bVIxZldI?=
 =?utf-8?B?NldDbTYzakJpSHowenlsZW0rT0hDR0RMZ2VrNUQwZERRYTFJUGdlVGhwaFpq?=
 =?utf-8?B?ZWdUVE9IbUFrdHdESkswMjg4VWVlRzZueUJPMzFhOTc1a3lyU2JCaldGZ2lm?=
 =?utf-8?B?RkNqVjJzcEwyZExienFrOUp3enh6UDRhSURIMzFuOHRPSjIzSGo3SzBSWXU1?=
 =?utf-8?B?c0t0VWkxRis0Y09SMmdLeENuMkFldmNPV2Y5dGV1RFV2eDZzNEVGT0pDeGg0?=
 =?utf-8?B?OUNCRGR0NWt6akMydytYZlY0WXdLQldUUU5vcDJ0NWZYOUdxSk9KbUt3RjRu?=
 =?utf-8?B?QVNpQ1cvUWhzdi96RlNWeWQzL3Fuenh0Q2RTWFpjOTJ2ZlY5dldEZFlMeng3?=
 =?utf-8?B?N1YxcTB5SHd6bWFubDJJNDRJLzBjY0lCM2pmVjgrODF2S0pENXM2MlF5bjhK?=
 =?utf-8?B?aHhJL01MZHVXbGJFL0hqYzV3bXJodDJDeGVsalZCYXJ0WFZhRUVjQmZ2anpw?=
 =?utf-8?Q?f4ix67aC6MS5tO09yCuVVi7H+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e6768e-58ef-4364-860b-08dcffa15bfa
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 02:59:28.0033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i1ZT4y7rdlJKFTvzER6Gktw4Fvvve+f+0jJ878b+HIqeSfQEM5KVm0gPDtb2UDuPec+N384AK7YcJt32SVx8KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7381
X-Proofpoint-ORIG-GUID: 2ywQUTWcJn2SRFFLZ-DWh6t_LLOh3Ap2
X-Proofpoint-GUID: 2ywQUTWcJn2SRFFLZ-DWh6t_LLOh3Ap2
X-Authority-Analysis: v=2.4 cv=CL54XgrD c=1 sm=1 tr=0 ts=672d7e94 cx=c_pps a=kqCqMoaEgQjRYYKBKtAp1Q==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10
 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=TGeoHNJyne3xBLm2JuUA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-08_02,2024-11-07_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 mlxlogscore=786 spamscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411080024
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Nov 2024 02:59:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8961

I didn't sent this patch for master branch because master branch has 
changed the polkit part and there's no chown there.
So this patch is only suitable for scarthgap.

Regards,
Qi

On 11/8/24 10:55, Chen Qi via lists.yoctoproject.org wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> When do_package uses state cache and is not re-run but do_package_write_rpm
> is re-run, then we get the following error:
>
>    Exception: KeyError: 'getpwuid(): uid not found: 996'
>
> This is because libvirt does chown to polkitd in do_install and polkitd
> is from polkit.
>
> Here's an easy way to reproduce this issue:
>
>    bitbake libvirt -c cleansstate && bitbake libvirt -c package && \
>    bitbake libvirt -c clean && bitbake libvirt -c package_write_rpm
>
> So make use of USERADD_DEPENDS to ensure polkitd exists to fix this issue.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   recipes-extended/libvirt/libvirt_10.0.0.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/recipes-extended/libvirt/libvirt_10.0.0.bb b/recipes-extended/libvirt/libvirt_10.0.0.bb
> index a33b6980..22193ff3 100644
> --- a/recipes-extended/libvirt/libvirt_10.0.0.bb
> +++ b/recipes-extended/libvirt/libvirt_10.0.0.bb
> @@ -11,6 +11,8 @@ DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux
>   	   ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'shadow-native', '', d)} \
>   	   ${@bb.utils.contains('PACKAGECONFIG', 'gnutls', 'gnutls-native', '', d)}"
>   
> +USERADD_DEPENDS = "${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'polkit', '', d)}"
> +
>   # libvirt-guests.sh needs gettext.sh
>   #
>   RDEPENDS:${PN} = "gettext-runtime"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8960): https://lists.yoctoproject.org/g/meta-virtualization/message/8960
> Mute This Topic: https://lists.yoctoproject.org/mt/109457527/3618072
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [Qi.Chen@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


