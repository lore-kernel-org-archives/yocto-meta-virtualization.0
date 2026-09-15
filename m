Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89781C982C4
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 23:20:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3201.1789514428101468439
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 15 Sep 2026 16:20:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=lExb7HTX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=37185ab288=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FMWUvr344592;
	Tue, 15 Sep 2026 16:20:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=H2fL22vaj/S9XUQi2smFqz
	N6c9G1DpMRi+Vc5mlznKc=; b=lExb7HTXHgZ3wrLHiCQgyGPpaqUIWCMhKxOcTG
	Yfi0RXEFn5y4ePqprR4SbyVbfuDbqat3Wvp3X1zcXcwgpu/BuUDLFk1SQcFqf59B
	vDST5L7P5QvK3OsZRegUA2xgh06+YiwkXuG6qBBXkeYtrZiHfLEm8n6QhojhkVKt
	rHPSg35O05oa6vuQYJtAM+O9ANHgl+CHsH/og6ldHRIi8VPNe4afCoCLOll9hiGS
	Utaclg9a9oUGghik7kwNdC6Fjq4A724zG2LgUe+24QL9k+2LeVREQHLJyRz/KGC0
	IlR4O7dT3VIc1cHmrpqfUgjrwIfI0a2973Xvkh/HVH05MREA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021112.outbound.protection.outlook.com [40.107.208.112])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gn68g68h8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 16:20:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wqzoi0V0A0UmS9h1bp4ULOPuPB3JnWXS0fzjn13T2IfPL+Wdpd8bsOZhA3YTlbjZ7mpbSvWA+QqPTVz+kJSGGb5RE3DAfsJ5hfLFxkWpppGN7j8ERoY7F7gY/Rz0CKIitfN9df6HDPOZPQAaGM0K9Gb1MGtTIrrSDF88Kv8RF4h9QjCXQO+mexPRDtDH5kxXwVxM7NTr7D3pSpvjBp5rLngCRugGs6AciAw2aw/HWTC94n98lTBMCjiw5zd0Y0RH6SCJruoEx/jW42oljuxKW+v4lB9LoTLxxKKiARu+G2q/ki8C6fGsWGozORu2JcqzHF8mAkL6exVmyXk13PRmaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2fL22vaj/S9XUQi2smFqzN6c9G1DpMRi+Vc5mlznKc=;
 b=qbDots9aeSkd8PZUz17MgMceNrsNS1cicbG7FmRYjx6Dxc8IywDARx/K+zVlK/6sD3mAvmfSc6RI+ChfD1V6+XnGhaqV8Ud4cYWnBsi6C5TO0shmvJx8t6eNMN56s221Uz48Uh+Q+15m5HVbWYOeRIJCJ8649QOT4ssj0LapN4f4ZV/zljZQvc5ZYbjkkOISFp3GgpFc5b+yVEA/mC3aTpKiihB0lqgC9qXkrnwPM9CJnvH4MLzZSIFb3eFTDE+piNOvBDQobnf3tyx4wwfTD5ozEmZusnCfalGQpNYBratE/exjHpZZv7UpiHKDpVgHE6WBQia3sg95ceFV6jtgrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DM4PR11MB7303.namprd11.prod.outlook.com (2603:10b6:8:108::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 23:20:21 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%7]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 23:20:21 +0000
Content-Type: multipart/alternative;
 boundary="------------P0ukDWGoXg910uQ56Iz9Zarg"
Message-ID: <31e552ab-8638-477a-aa91-6b73895a3fd3@windriver.com>
Date: Tue, 15 Sep 2026 19:20:20 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libvirt: update to v12.2.0 --> Upgrade for wrynose ?
To: "Raj, Thejas" <Thejas.Raj@windriver.com>,
        Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20260909101128.3233779-1-Thejas.Raj@windriver.com>
 <SA3PR11MB74871FE55026882E94D7DF1D8DBA2@SA3PR11MB7487.namprd11.prod.outlook.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
In-Reply-To: <SA3PR11MB74871FE55026882E94D7DF1D8DBA2@SA3PR11MB7487.namprd11.prod.outlook.com>
X-ClientProxiedBy: CH0PR03CA0199.namprd03.prod.outlook.com
 (2603:10b6:610:e4::24) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DM4PR11MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: 3879ec8d-aece-4a65-a8d7-08df137fe976
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|11063799006|4143699003|16056099006|10067099003|22082099003|18002099003|12006099003|8096899003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	/uMk4Tt0TOiY26kkuO3mQEnsge71e6+OU+glnMGBa/8CEQSYfoxHNQ4adQarI0bqKYNw85sB1gxbE35zl5tGYLGW9dApNIGQnmeVnsMD+zCxYvuuWrz37Xa/SuQh5EZ/OuG+JEMv6Dva8hhrX9m2owHmB8ZMNU3uocbB55PIIeoLGV+ZftdhY15ZKotI9TP1FlERzP3ESk5yGKP1m5uJpteIm4Mm4EcK2aUmM3QtbZKFrXxU6f1ze5sVvXTmgyqtNUhepXJSC0/RRi+HQG0JJ3cEXgPv82893uHQOpAnH/gPcE13ydBYLBctbJycIm8RJ7rKmm17PPRj1wJTSjSMYv4wujuG38Ar29H/tevnQcWgIGUUddIUdp69D9KTxhaj3ysamo9zodi/IEwac7F7NbVYniep/7Y4flygFbHqTAgU8tHa1ni+uf2Kcez0K1Xm2EAsQ/Etpn8+JD1j+VwI+AUpTEfMi0CBjPQBVcj6qOGu0xeqnq7BHJ1kHF3G+sGHRcI4OC3ZjiHQNUm8BnwYn5iQqzKQLG3WZxbH4m/9DNHEiWfPaY6DYLNWnVbkjcxXjIe1lAuQqJodxclHqTJGfB/dI4v9ZSqdecEGdyRrBk/jfdrOQvA2HsnL4U1blkWf
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(16056099006)(10067099003)(22082099003)(18002099003)(12006099003)(8096899003)(3023799007)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L3pIM0JMWUtKU1hKb0tmdC81V3czQUt5UFpnSmNtSnB1YVkySFBaYjVDZ1lC?=
 =?utf-8?B?dEt0WTZ6NHVsZzVoMFR4V0JjSnlHWXRtWU8za1NpeThJK0JGdldObnpaZkpk?=
 =?utf-8?B?cVNIbjBKUHIzYURORGdLNEQ1MU5nWWlMWWNCV1l5ajQyelpuM0Z3VVppTjV1?=
 =?utf-8?B?M3RGTTBRc3krdGxUU1J4ekhvdWdqM3ZyZldFSEZnNnJsSHNab2xhV0dxeTBP?=
 =?utf-8?B?cDJBZTg3eC95c2NzWGFPKzlsK3ZtZU9oSFV2cFlwMkUxUDEycDVBcnhyTXd2?=
 =?utf-8?B?c0JZdFlJNkxjUzZqTzg0a0dnM2RRMGxKNUhMZGhocnQ3ckxGVHZ1S1ZCUjB1?=
 =?utf-8?B?YS90VjNrQ1pSczJHaG44ZDhEY29yYjl1RU5ZVzZwOXBrNnBmRG5BU3FNTGpn?=
 =?utf-8?B?aXZ6c0gvdS9sQlFuL2I4TmtTNjMxYTBYTGM2bmY0aE5ISkpxNXhPajJ1MHNJ?=
 =?utf-8?B?VWdURjdpSTNoS0VLYTlKR0x3ZEZqZ2VGcjF4akUvUXRKVjR4R1ArT25zWFdZ?=
 =?utf-8?B?ZkUzL25pL0tMUkNNU0RXMzUyMHpIbE8wdlBuVi9KY2pUaVhHaWFPRUVIWGNC?=
 =?utf-8?B?U29LREM5Q2xTOW1OL05qcG9keEdyYmgyaU9YS0pxNEZUWTFEUXpHVDE1akRU?=
 =?utf-8?B?ZFJVZXpUVnF3OXZPVGw4TktRT0haRG1DODAyUmIrMjVFOUViVUlsTWdSaWJ5?=
 =?utf-8?B?eG4vS1BITXlBTVkxYTlJenZtbEVHU2FUQkpIdzJmOHhPeVZtOFE3ZUNzNzZl?=
 =?utf-8?B?K0d6Y2REWEFwTGo3dFRWSWtnSWlMVmJoRFdvVTlkcnBJN3RNR2NsSVpyb0V0?=
 =?utf-8?B?b1d3SllhTzk3c2k3WjZQcm9qQXFtMHE5SjJROHpYY1VDS2JZWWw3bGg1ZExx?=
 =?utf-8?B?K3lZTDFmZXp4SkJSSzFsSE1yVng0RDhZTUptN3d3eFV6ZVVGdlUwWld2VzVi?=
 =?utf-8?B?aHVjNGQ0MXF6WmxEakwyenMzWkJFSnZHMTFOdk9lS0hhWUxvTHhzYUQySUU5?=
 =?utf-8?B?ZEg5Mk5DS2Y0azk0c1Z1ZHRTNWUxUy9mdGErcytPdmdTZ2Y1SGw0RnNDY1U4?=
 =?utf-8?B?bW1EM21LMnBBSHhVNmRHRVRtVVZadXIzVWNVSUJMSmc1YUUxRFd3T2NOdU5E?=
 =?utf-8?B?YjB2S3JZRytWRmZjby9qS0Z0ZFA1QldBUndEeXBLMWE0cENXdVJyNTZobHQ0?=
 =?utf-8?B?S2hWUFUwaEx2SFd2eFZKRjI3ZG4xSlJna2RCNDE4a3o2eUgzcmIxNTB3LzEx?=
 =?utf-8?B?bFFNZnZFcDJwZUh0YTFVc3ZDVmZZZm5ObjhjR2hwWkJ6OXRVVmVIRTFjM05u?=
 =?utf-8?B?V0pHOGNrOGVsRXZoRW9CRTZNVm5SRHF0SmdqRjZJMTQ1NUludEZZb054RzRB?=
 =?utf-8?B?VGpJSDYzM3dpVGNqdTloZHhkVlNEM1Q0YUhwT0JFU1F1Qm9MN0RsUlpNaWR2?=
 =?utf-8?B?TnVyK1Y4Q1pHK3BBaUhqaHE4dUhqL1ZGL2QrKzg4WXpzMHk4YXRVVkMrSGMy?=
 =?utf-8?B?VTdCa3hKeDBSc0FFZUxvU2RDM3NPeU5SdXFkbUVnYmE0NFFhKytTZ3g2YWNC?=
 =?utf-8?B?Y1ZXemM2V1dtMmtKaDg2UlRVeTMrWHhMNTV5d29ya2dCa2Z6NlB6T1gxUjU1?=
 =?utf-8?B?elNXdjllSW54OGZZM1VkbjJYUGxSMHNyc0FsSTBleDFFQU43dko2TUNRYjEz?=
 =?utf-8?B?SHgrZThXT3U4Mlp2d1gvUllWd0h5SXJmbktuVnFQblpyRnZCVHl3YldxSHFZ?=
 =?utf-8?B?WHMxWWF0L2IxazQrcXNKVVhnRkFHQ1IyMG5RdzR4MEJVK1ZqYTFFd0FVNjVH?=
 =?utf-8?B?Y0lLdzJWM3JHa2hiRmtlWHlaVXptOHZaaHQzUVluMUlHbGhmZmtFdElHbGx0?=
 =?utf-8?B?M1VlWEFuQW9BaGRMeWFWT0R2cnByVkswcTBHRWNDejY3a2RNb2dlanozdVdn?=
 =?utf-8?B?SCs0S0p1YVM1ZzZ2ekJwWjkvRFZTRTVDNkovRXlZODRXTzh5bDRPOHdjMjlC?=
 =?utf-8?B?SnVJbVJxNUxCa0JqbEpqL25USFlRcWNsWTBoYytUbjVVRVdlYldOS1JYckEz?=
 =?utf-8?B?YTZlUXdqOCtETktDbjhQdG04bW9iUzhZL0NTZzJQUVkzblFnTy9rdlUvcmdx?=
 =?utf-8?B?U2pCeHNFNGhuTGo1RTU5VVAxRDhkTTFhOGhjN1NFeEUvT3Y2d21rMnhLd3NF?=
 =?utf-8?B?bFJtbTUvWUlLUXhaWWJFWFVuUnBSMm1OZE1lS0RwY2t6aWxibmpiTWdVS3cr?=
 =?utf-8?B?djUzQmdmeEFEUDBYR296czZ1RzRPOHlWMVFlcWpjaFk2Y09RMFVwSUQ5ZzY0?=
 =?utf-8?B?cktZcTVubzNudWZ2MXF5NTh2WmlrUmZkWUN1N0F0Njdjd2UrODlXSEhtY0E3?=
 =?utf-8?Q?w+bkTMYq8HOeiDug=3D?=
X-Exchange-RoutingPolicyChecked: 
	UVxEr1kmjCBe5Mi/9tpdPdWzH0KRi+DNuELW6UZSZhHELukUwR3/hkevC4625dWNp/OTeQ5iBK08YDfRbVlAzrjekpdZSCMzSbIGCw0JhJWr6BSQCIW0+Zr32NggD2ZfCbe9kzOWq3ND+MpK80jpL5/idxGmw5ATAA1hRXdZ75bPTPJRp+YEKXJ1fnBLt8wdqGnAsaHyIwyh3VTBevIEU12LcoIv/Hr/m5iqR3XzmutTeyTQ7DGchNRnWQuaBZd2Lz8YPxmkzh74J9LAfFOJjIOFErVE4FDQ3O/GYLZzwVt5xrfzg/GwUYdVMcIZocP9VUFb9YjlU+jqJkh29+o+bw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3879ec8d-aece-4a65-a8d7-08df137fe976
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 23:20:21.1335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C24wf/ctEa0Nse4IeykTQk16Dqil3CmR9o6uLwnbP12SmCllUakac82R+zN/v58gPNLEe7wRBLZkBaKBWptatpVamRFYb/n3C+8yZIC5pxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7303
X-Proofpoint-ORIG-GUID: G4jbfm9xYe3Jj-BWotwMvFxvBxeTeS8t
X-Authority-Analysis: v=2.4 cv=cswOAF4i c=1 sm=1 tr=0 ts=6aa9d2ba cx=c_pps
 a=wTfA4ZSRtyUhnooKhWOBPw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=SqMvC5kiAAAA:8
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=OFerfCx04dWtJnhBoNsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=UqCG9HQmAAAA:8 a=66u_mPXvSeI9Dc9qNXkA:9
 a=E0QXi5C-o13NmZdP:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=_o8VnCo6Hb5Oqlm6Mk7M:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: G4jbfm9xYe3Jj-BWotwMvFxvBxeTeS8t
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDM0MSBTYWx0ZWRfX3rma0LGPqOrD
 kKWE0ozE2bJUVIzXYaCuFineImWyEmbazZiAmLJHUYycOOToYIlvBFKFo0SIbsxqNk5xpxSqNKF
 a95pZEHCpCI2rsCgKAkNJfMULYruNNkwxcNny+9ioUFvcGmaAjPN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDM0MSBTYWx0ZWRfXwu1YXSRcdIOb
 mGKu9J3FY0WF/e51NEIs54C+ZJ5++Bo2LzOZQamS4Ky9c4obnd5beUZy609dzWC6qAVjymrBfFD
 8AG7DGmTtF2dAhnpigWps2TT6wDit8E3VPZAqTAGCbKOGQ8sIF8MZFLik9HnO6zeFeA+I575sPa
 hwoY2EZ0CFe6SRhsdOWN/yh7tVUnwd5yoP6rOE8ZFF9p2CMCemaOux6PX0kGatpbHy0byo6fjXH
 v4+qjWWDldiLlUwA753VZZTdMuTmPTpRkAfEfViJ6CLAyCLgpfgmekek/+NsVU22ZtPp4qGW5PS
 7tyhnnA67L6JmOnGkisqSnXmYAbVSMvJLi7O0SblnDpOldc2tPRYUSar0gYrrGTUdAIsVbkR40S
 MdFmHPpgqkxH1Nx0MPLoa9WDPNFFGpKoqRbuyJgDTe+ustzbN8rvSRcLmWx6RWtMrBCunpojt9q
 6zSVF/a74rYnGfQIpUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 clxscore=1011 spamscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150341
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 15 Sep 2026 23:20:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10078

--------------P0ukDWGoXg910uQ56Iz9Zarg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 68FMWUvr344592

Thejas,


The update is simple enough BUT
... looking at our internal JIRA issue,=C2=A0 this is for wrynose=C2=A0 /=
 LTS26.


I see no indication that 12.2.x is any better supported that 12.1.x:
https://libvirt.org/downloads.html#release-numbering
https://libvirt.org/downloads.html#maintenance-releases

I see that the JIRA ticket claims:
 =C2=A0 =C2=A0libvirt: 12.1.0 (dev) -> 12.2.0 (stable): YES
but I'll need either proof of that or to have=C2=A0 Bruce (CCed) to agree=
 to=20
the update on wrynose.

I suspect that that whoever wrote that internal work item thought that=20
even numbered releases
were more stable than odd ones and that idea does not apply to libvirt=20
AFAIKT.


../Randy


On 2026-09-15 12:31, Raj, Thejas wrote:

<snip -internal info>

../Randy


>
>
>
> -----------------------------------------------------------------------=
-
> *From:* Thejas Raj <Thejas.Raj@windriver.com>
> *Sent:* Wednesday, September 9, 2026 3:41 PM
> *To:* MacLeod, Randy <Randy.MacLeod@windriver.com>
> *Cc:* Raj, Thejas <Thejas.Raj@windriver.com>
> *Subject:* [PATCH] libvirt: update to v12.2.0
> From: Haitao Liu <haitao.liu@windriver.com>
>
> Pin SRCREV to the v12.2.0 release tag and refresh the libvirt-python
> archive checksum accordingly.
>
> Signed-off-by: Haitao Liu <haitao.liu@windriver.com>
> Signed-off-by: Thejas Raj <Thejas.Raj@windriver.com>
> ---
> =C2=A0recipes-extended/libvirt/libvirt-python.inc | 2 +-
> =C2=A0recipes-extended/libvirt/libvirt_git.bb=C2=A0=C2=A0=C2=A0=C2=A0 |=
 4 ++--
> =C2=A02 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt-python.inc=20
> b/recipes-extended/libvirt/libvirt-python.inc
> index 6738193a..c37a9ebe 100644
> --- a/recipes-extended/libvirt/libvirt-python.inc
> +++ b/recipes-extended/libvirt/libvirt-python.inc
> @@ -20,7 +20,7 @@ INSANE_SKIP:${PN}-dbg +=3D "buildpaths"
>
> =C2=A0SRC_URI +=3D=20
> "http://libvirt.org/sources/python/${LIBVIRT_PYTHON_ARCHIVE_NAME}.tar.g=
z;name=3Dlibvirt_python;subdir=3D${BP}=20
> <http://libvirt.org/sources/python/${LIBVIRT_PYTHON_ARCHIVE_NAME}.tar.g=
z;name=3Dlibvirt_python;subdir=3D${BP}>"
> =C2=A0LIBVIRT_PYTHON_ARCHIVE_NAME =3D "${BPN}_python-${LIBVIRT_VERSION}=
"
> -SRC_URI[libvirt_python.sha256sum] =3D=20
> "2cc02c0b91a9abd140185feab46b33281091d4deffbc1bbfdb68ce682359f2b0"
> +SRC_URI[libvirt_python.sha256sum] =3D=20
> "742147988bba7d400f6892beeeb7e0a27758f10ff65421b569b7b4b6a2572e44"
>
> =C2=A0export LIBVIRT_API_PATH =3D "${S}/docs/libvirt-api.xml"
> =C2=A0export LIBVIRT_CFLAGS =3D "-I${S}/include"
> diff --git a/recipes-extended/libvirt/libvirt_git.bb=20
> b/recipes-extended/libvirt/libvirt_git.bb
> index 34a1ff21..cb5d3482 100644
> --- a/recipes-extended/libvirt/libvirt_git.bb
> +++ b/recipes-extended/libvirt/libvirt_git.bb
> @@ -26,9 +26,9 @@ RDEPENDS:libvirt-libvirtd:append:aarch64 =3D " dmidec=
ode"
> =C2=A0#connman blocks the 53 port and libvirtd can't start its DNS serv=
ice
> =C2=A0RCONFLICTS:${PN}_libvirtd =3D "connman"
>
> -SRCREV_libvirt =3D "9fa6beff05728a32dd11f7ccb7e3c97fca510029"
> +SRCREV_libvirt =3D "93a00a3db8c8b5e3ee4a97ff2539193e5e7accff"
>
> -LIBVIRT_VERSION =3D "12.1.0"
> +LIBVIRT_VERSION =3D "12.2.0"
> =C2=A0PV =3D "v${LIBVIRT_VERSION}+git"
>
> =C2=A0SRC_URI =3D=20
> "gitsm://github.com/libvirt/libvirt.git;name=3Dlibvirt;protocol=3Dhttps=
;branch=3Dmaster=20
> \
> --=20
> 2.54.0



--=20
# Randy MacLeod
# Wind River Linux

--------------P0ukDWGoXg910uQ56Iz9Zarg
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <head>

    
  </head>
  <body>
    <div class="moz-cite-prefix">Thejas,&nbsp;<br>
      <br>
      <br>
    </div>
    <div class="moz-cite-prefix">The update is simple enough BUT<br>
      ... looking at our internal JIRA issue,&nbsp; this is for wrynose&nbsp; /
      LTS26.<br>
      <br>
      <br>
      I see no indication that 12.2.x is any better supported that
      12.1.x:<br>
      &nbsp; &nbsp;<a class="moz-txt-link-freetext" href="https://libvirt.org/downloads.html#release-numbering">https://libvirt.org/downloads.html#release-numbering</a><br>
      &nbsp; &nbsp;<a class="moz-txt-link-freetext" href="https://libvirt.org/downloads.html#maintenance-releases">https://libvirt.org/downloads.html#maintenance-releases</a><br>
      <br>
      I see that the JIRA ticket claims:<br>
      &nbsp; &nbsp;libvirt: 12.1.0 (dev) -&gt; 12.2.0 (stable): YES<br>
      but I'll need either proof of that or to have&nbsp; Bruce (CCed) to
      agree to the update on wrynose.<br>
      <br>
      I suspect that that whoever wrote that internal work item thought
      that even numbered releases&nbsp;<br>
      were more stable than odd ones and that idea does not apply to
      libvirt AFAIKT.</div>
    <div class="moz-cite-prefix"><br>
      <br>
      ../Randy<br>
      <br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2026-09-15 12:31, Raj, Thejas wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:SA3PR11MB74871FE55026882E94D7DF1D8DBA2@SA3PR11MB7487.namprd11.prod.outlook.com">
      
      <div style="font-family: inherit; font-size: inherit; color: rgb(0, 0, 0); background-color: transparent;">
      </div>
    </blockquote>
    <p>&lt;snip -internal info&gt;</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:SA3PR11MB74871FE55026882E94D7DF1D8DBA2@SA3PR11MB7487.namprd11.prod.outlook.com"><br>
      <br>
      <br>
      <hr style="display:inline-block;width:98%" tabindex="-1">
      <div id="divRplyFwdMsg" dir="ltr"><font face="Calibri, sans-serif" style="font-size:11pt" color="#000000"><b>From:</b> Thejas Raj
          <a class="moz-txt-link-rfc2396E" href="mailto:Thejas.Raj@windriver.com">&lt;Thejas.Raj@windriver.com&gt;</a><br>
          <b>Sent:</b> Wednesday, September 9, 2026 3:41 PM<br>
          <b>To:</b> MacLeod, Randy <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a><br>
          <b>Cc:</b> Raj, Thejas <a class="moz-txt-link-rfc2396E" href="mailto:Thejas.Raj@windriver.com">&lt;Thejas.Raj@windriver.com&gt;</a><br>
          <b>Subject:</b> [PATCH] libvirt: update to v12.2.0</font>
        <div>&nbsp;</div>
      </div>
      <div class="BodyFragment"><font size="2"><span style="font-size:11pt;">
            <div class="PlainText">From: Haitao Liu
              <a class="moz-txt-link-rfc2396E" href="mailto:haitao.liu@windriver.com">&lt;haitao.liu@windriver.com&gt;</a><br>
              <br>
              Pin SRCREV to the v12.2.0 release tag and refresh the
              libvirt-python<br>
              archive checksum accordingly.<br>
              <br>
              Signed-off-by: Haitao Liu <a class="moz-txt-link-rfc2396E" href="mailto:haitao.liu@windriver.com">&lt;haitao.liu@windriver.com&gt;</a><br>
              Signed-off-by: Thejas Raj <a class="moz-txt-link-rfc2396E" href="mailto:Thejas.Raj@windriver.com">&lt;Thejas.Raj@windriver.com&gt;</a><br>
              ---<br>
              &nbsp;recipes-extended/libvirt/libvirt-python.inc | 2 +-<br>
              &nbsp;recipes-extended/libvirt/libvirt_git.bb&nbsp;&nbsp;&nbsp;&nbsp; | 4 ++--<br>
              &nbsp;2 files changed, 3 insertions(+), 3 deletions(-)<br>
              <br>
              diff --git a/recipes-extended/libvirt/libvirt-python.inc
              b/recipes-extended/libvirt/libvirt-python.inc<br>
              index 6738193a..c37a9ebe 100644<br>
              --- a/recipes-extended/libvirt/libvirt-python.inc<br>
              +++ b/recipes-extended/libvirt/libvirt-python.inc<br>
              @@ -20,7 +20,7 @@ INSANE_SKIP:${PN}-dbg += &quot;buildpaths&quot;<br>
              &nbsp;<br>
              &nbsp;SRC_URI += &quot;<a href="http://libvirt.org/sources/python/${LIBVIRT_PYTHON_ARCHIVE_NAME}.tar.gz;name=libvirt_python;subdir=${BP}" moz-do-not-send="true">http://libvirt.org/sources/python/${LIBVIRT_PYTHON_ARCHIVE_NAME}.tar.gz;name=libvirt_python;subdir=${BP}</a>&quot;<br>
              &nbsp;LIBVIRT_PYTHON_ARCHIVE_NAME =
              &quot;${BPN}_python-${LIBVIRT_VERSION}&quot;<br>
              -SRC_URI[libvirt_python.sha256sum] =
              &quot;2cc02c0b91a9abd140185feab46b33281091d4deffbc1bbfdb68ce682359f2b0&quot;<br>
              +SRC_URI[libvirt_python.sha256sum] =
              &quot;742147988bba7d400f6892beeeb7e0a27758f10ff65421b569b7b4b6a2572e44&quot;<br>
              &nbsp;<br>
              &nbsp;export LIBVIRT_API_PATH = &quot;${S}/docs/libvirt-api.xml&quot;<br>
              &nbsp;export LIBVIRT_CFLAGS = &quot;-I${S}/include&quot;<br>
              diff --git a/recipes-extended/libvirt/libvirt_git.bb
              b/recipes-extended/libvirt/libvirt_git.bb<br>
              index 34a1ff21..cb5d3482 100644<br>
              --- a/recipes-extended/libvirt/libvirt_git.bb<br>
              +++ b/recipes-extended/libvirt/libvirt_git.bb<br>
              @@ -26,9 +26,9 @@ RDEPENDS:libvirt-libvirtd:append:aarch64
              = &quot; dmidecode&quot;<br>
              &nbsp;#connman blocks the 53 port and libvirtd can't start its
              DNS service<br>
              &nbsp;RCONFLICTS:${PN}_libvirtd = &quot;connman&quot;<br>
              &nbsp;<br>
              -SRCREV_libvirt =
              &quot;9fa6beff05728a32dd11f7ccb7e3c97fca510029&quot;<br>
              +SRCREV_libvirt =
              &quot;93a00a3db8c8b5e3ee4a97ff2539193e5e7accff&quot;<br>
              &nbsp;<br>
              -LIBVIRT_VERSION = &quot;12.1.0&quot;<br>
              +LIBVIRT_VERSION = &quot;12.2.0&quot;<br>
              &nbsp;PV = &quot;v${LIBVIRT_VERSION}+git&quot;<br>
              &nbsp;<br>
              &nbsp;SRC_URI =
&quot;gitsm://github.com/libvirt/libvirt.git;name=libvirt;protocol=https;branch=master
              \<br>
              -- <br>
              2.54.0<br>
            </div>
          </span></font></div>
    </blockquote>
    <p><br>
    </p>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------P0ukDWGoXg910uQ56Iz9Zarg--

