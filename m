Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E48D31A0F
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 05:05:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3931.1768367110396573881
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 21:05:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=WrTHiv/E;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5474771f1a=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E4SYGC301496;
	Wed, 14 Jan 2026 05:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=Z1SI368CjJ+c5L7aN7bLec
	QsvtJlC5JAHubmw1WDLMk=; b=WrTHiv/ES1UIpYgh69dPeip3tWMErkM0aaZ9cK
	t3gNQu2gsJl7nysUDtXTh3xS/g2RqvG1HyPQknzoS1YxepDSlhk2/stpQZnKtQN8
	4+4xyI0sE/XEy0GqMRYHHkPEPRIzWnbmGaH/S4QxGT9/emTMSyKoQFLfKDFW8y66
	J9NUcTtytMGeHuvdS+fsinXhQlvMbw3ON5czAsZKplsCCOvnnh6LLOXuKLlGjXNj
	oAckvTuIfke8R373kV1bICbQ/Bhs0s5TJ6l6ljEgc/O9CVQB1/dt8KaHcZov+eT8
	eawBLWkcDANNjPYZpQBvV5PXlbIEeqdqt1WQSOzeJo5Q5y3g==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010035.outbound.protection.outlook.com [52.101.56.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkbytm3d8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 05:05:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rv6VLZIAoA2Gd0x8y5Zi7TBtawo0l0QVDTyIriu5jM++oiA5Y5Hah/4IYEZR3n8vtgR2AnTq6egn8GOrL5mCK96w/SdsH9lGGlOVcql1hNFp2U802P46TU2bTt/AMANGlONszwg9FiAxUeVJhuq7FiGEuyMUw6yHXqT5QEKbb9AfLBPzQ6QOnNoQElh2mueg9daLP6YdMoECcK8ZAsJEKXcgGjjI8kzgBEMih3xacIZkSGRB6EUJoPl/JjjMLvKmxW4gaC31FVAuE+SLvqAL+5Td80jfy53i6Q7QQ6LBC42rR9Vt4zJXjs/63R1+KW4id+jI6vKQs9IuxxcPTrU4GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1SI368CjJ+c5L7aN7bLecQsvtJlC5JAHubmw1WDLMk=;
 b=Jb3EHSKrDEsqJTIISQ9ZphbULsZMJbkaj9I6kNCO1/GsTUvOBYBp2fnAQ5hXHYXC3j6BLIBlF0HNdK/FvqKumaP5RIyEnOo0fbyaplbRABYhs55PcgmQuPtI3yvtunKUs+dYTnuP7Pk0Fj9C0jpKNXZhynAkJ+D6HkuxKoYLqvpLzJ0XQ2ip+saOI1IvKIZodi7a6qTYKL94LJ50RlVKkhuaAKZfgPNmG+RIT0rP2Zujyju9OevwXqw3FwCdCubrX08OD2nntFZWdn9OsGtZmz184RAV5AHsu16anIjP7V3DeRo50a6QmmLdqSt65gqPiu3rsGJnE0TM+asIrWKkbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 05:05:05 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.9520.003; Wed, 14 Jan 2026
 05:05:05 +0000
Content-Type: multipart/alternative;
 boundary="------------EMpNtQ0V4FhmPWrJPEq0sfBL"
Message-ID: <f8d5d7c8-4f93-461f-a6d2-4840cae07921@windriver.com>
Date: Wed, 14 Jan 2026 13:04:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][PATCH 00/15] set go buildid to empty for
 improving reproducibility
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20260108062628.3636344-1-changqing.li@windriver.com>
 <CADkTA4MB=AckiSmwRHJFjg_X2oYCCfRTEFydoWs2TNqDJK=7rw@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CADkTA4MB=AckiSmwRHJFjg_X2oYCCfRTEFydoWs2TNqDJK=7rw@mail.gmail.com>
X-ClientProxiedBy: SG2PR01CA0174.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::30) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CY5PR11MB6392:EE_
X-MS-Office365-Filtering-Correlation-Id: c103e3da-18cf-4b2f-89c1-08de532a7af9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|366016|376014|7142099003|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WmRpVFJhVUF1K2RqN2NtU1V6a2tXMWNYZXlkN0gyL3RoMnIzS0RnZW94VGRY?=
 =?utf-8?B?THdaL1kyemZHSFd4QjlDK21OSnFtQzNjbjF5MTFoVjdSanlwbzcvS0R4cGYr?=
 =?utf-8?B?SlVqakRPQWdBYzVqK0pwaFM1cWM2OHdNMkxHU2tvTnR2NmFSRWIwYXdUKzEx?=
 =?utf-8?B?NlZENm14Rk9hVmM3SXZ5OGZvSHNqOUNpazd4N0JLczRYcENzTFc2R0w1UXE0?=
 =?utf-8?B?SjJoVUVzWDhHbTh2N0tpY1J3LzR4Uk1tOS93VU1EUHZOSTJUREltTUN0VmRu?=
 =?utf-8?B?SHloeEdXdE9oQkp3Z25NVnhQdnhiSHJaVFYxNGEzc3dUVVIyUmZVcW5GOUtq?=
 =?utf-8?B?T09OeFRCcEpyNXBZd0xHRi8zdTJwTlh2SFZhRFg4MlY3cmcwZHUvdXVLeXk3?=
 =?utf-8?B?V2szU2xZN2V3QndnaENTYStSMFhjNmpEWlRtdW9GVmVMOXQ5Tis4R2xsNlAr?=
 =?utf-8?B?Um9wZFJXbmt3L1R2ZTMvdlNEbzZTY3dRd2RaQmYwOEhtclBXOXV0K1JUTVhT?=
 =?utf-8?B?WDh2RVRyTXdWeHByZ1diUG9MYTJQN2JxNHpRLzN0MHdkTldlWlY1clRSanZY?=
 =?utf-8?B?K2k5R29UdkJvQXpFMXdYN2FqTGFmaXlRZWpBcXM0NG5rb2RIOENGdEo1ZHNQ?=
 =?utf-8?B?Z0tsRU9OT0JBSnEvdG9uYWtuK2VHbnZmWjZKZXlhRkRVSDdsbWpxRlMvbDVL?=
 =?utf-8?B?ZE45S3VBREExdEtIWWM2VUMyY2ZCdnFkQjBCTUxaaEZyUUlDRlhrbmtTYzJW?=
 =?utf-8?B?MlR4VnZQTkRmWEg0cmtDZ1d5M2lOOVdWZkRLZXFKZGtkcW1PMTBVVUFreW5t?=
 =?utf-8?B?N0JuQkVST1BPeVJrbWhORWlabVRMb3VRVmxrdmVwSkJ1dHVqRWdNZWdsUDFa?=
 =?utf-8?B?QW0wQ3cyWkZESjF6Y2hoT0MwbWZUelJmbnlaZ3I3aE50MHc2cjRzWDRTMlRF?=
 =?utf-8?B?V0IyQzNQVTdaZ1RPMFNqQys0V0Rpb1JiVDR6RmpnNGp6akNnOGQvSWZQZUFp?=
 =?utf-8?B?L2xlbVQ0K1JLNUdPMEcyMWttODE1akFpL256anpCUDFOZS9iS0lmU1RUSnZr?=
 =?utf-8?B?clNTQzJvTU15d05RbTJaTms4bkJmcWZxbEpaSnkvSmJlQ25GL0NFWWJoUUxn?=
 =?utf-8?B?SUdFZEpDRXlXU2dMUStLU0tib1gydGtiNEUveE5tbzJzYktxblluRVJ2SWE3?=
 =?utf-8?B?bVJwTHpqNEVFSlVQVXRGQU1CQXMxd0FBdEI4S1RKZ1cwY2hiQWN1OXBaWGFD?=
 =?utf-8?B?eExKem94bVRreXd0YS9SY0krN0oySG5DQ3lkc3pFSVBmREJDNnBWbDhFTXRH?=
 =?utf-8?B?K0dwaEQxRmo1T2JpVVRYTUkvcXdTSTFGTXc1YzhqSm03Y2hUbmd2bXkyd0Jy?=
 =?utf-8?B?ZGdTZEwrem1QRXZWajZzSkY5WmhwcWk5dit4RmtHb0RPTjltRVdkZzF5czVJ?=
 =?utf-8?B?V0F5TDU5OXlMZlFlUlIrbUN5dkNtWWFHaU5IRkFXODVXWElxMFJwQzN4L2l4?=
 =?utf-8?B?ekg5Q0FpR09Cbkx5cno1ZFQyWkRJVzRHWlhSeEdCTCtqbEVIdGFSQU96MHZy?=
 =?utf-8?B?eTlHcWU2NDZ0eEhMSnl3QWwxdU4xc01XM3JZdWhLOVBDaXVRWEgwRWp2TEho?=
 =?utf-8?B?dkZWUkxteURvbkFINFlHNEk3em9PcVJFaUpxMHpRM0djckZxaWpTWTE3QzJB?=
 =?utf-8?B?em5nKytMeVl2bmVFM2QwUTE4LzUxN0wyK3RQVHB1czhXdVhBOTBOdnE1eU5T?=
 =?utf-8?B?TEZUTzhFR0crd3M2eW1JSE1EdTlPK2ltSk1rM1pLSFVzZ3hFUklocE5VdVpR?=
 =?utf-8?B?TUdnL2dzSXFZS2lXTHM4WUNCSmhkU3JHbnJTaHk4eG05RzQ1OWVMRnlqZXBh?=
 =?utf-8?B?bmZPc2ZreHV5ZDBRYWJwV1FKTXJUMFhoWU9LeFY1Mmg3bGc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014)(7142099003)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UThTK1BybkJvUXhQc1BOWEQrWHlFczZvSlQvRDhxY3M1L1FKa1dhL2twTTlF?=
 =?utf-8?B?TkovUmZrZ002M0cvbXhuLytCaHEzZnFwSXphbDR4czUrd1lMTFNFbkdFTCsz?=
 =?utf-8?B?cmkySUg4WitUQlJRYm5tODY3b3FEWWs4OUZ5R0ZhM1ZPczU3eEhtd2lsUGNY?=
 =?utf-8?B?RENpU2RtWVB3bVJhWUVQTXFIcmM3TFE3eHdLcEFiV3lRSTdkZUlyUjJiVnNB?=
 =?utf-8?B?dzdPc0xaeGIrZ09tRnRTT0pWRUFyR3lYWFNZbmpXMysxRGlscWlkT2t3U0tt?=
 =?utf-8?B?QlVENVZZTyswMGFpRU51VHNnaHFTVFJBdERjMTdFaHYycDlucFJudDJTMGlu?=
 =?utf-8?B?ejZwQmNsQy9qOFRrOTFwTFMwc0VDLzhqb1hsZkFCMWczT3NNTENMTkFUMGsz?=
 =?utf-8?B?SDVIM2dQWkcrWFYvVkh5NzhVWWZsWGtZdldaMTMzZDZTQVduS29aMVNyYzVs?=
 =?utf-8?B?NmNYQ0I4eXQzcVhnMXhDQjJwYmd0NmpSQ1BrZnZCQmVpMEdMMC9zRnBINStL?=
 =?utf-8?B?MlVwLzY2L0RzTmFaMmZ1R3RLM2ZreWlTN2NiMjhOOUw5YzlZb0RyaXZvZk93?=
 =?utf-8?B?c3Q5cUdPK1IwRWhVS05NMXVsNy9pbTVRaDdOR1VuUVgrRDlQOWNCUDVoR1Vj?=
 =?utf-8?B?S1Z3cnlrV1dFNlFJMTMxRWlVZ0swTVZhdnVMU1VoS1ZXQ2RLQUZZVXBDbmR5?=
 =?utf-8?B?OUJyQWZWZTdzRjBKVUF5ZHZLdEQxZGNZcGRad09ISDBHY0hJS0hWbjhsRmFL?=
 =?utf-8?B?cWVobVZQd3ZaSHZ4cituUVBlNzh4c21aVGxJQWRoZDhudmRhK2dpZHd3eHhG?=
 =?utf-8?B?cXhIR3F6WVhRemdITkdKOE1PMFZEa1hFcFZqSGxuWW9hTGNlUUZKZ01OWVUx?=
 =?utf-8?B?R2pJSzhCcmJrMlJ5b1lWUmZhQXQvNEJCa0wyKzVOa1JjZXBqS05wbUVxVldE?=
 =?utf-8?B?L3IxTytacGNDN0tTUWxkbEJRaWJkcjFJZ0QzdHV5dnZScEZSZzY2NndMOUNn?=
 =?utf-8?B?NGZabWY0QmZhcEtGY2R5YnpzMEEzdUZpSmNjM0htQlo0TWJrT3dhcWJrdmFC?=
 =?utf-8?B?bTZ6MTgyZzk1N3lLMFQzY0FsdStiMHBDME91ZjVJWlBzOVR4V1I2ZWJ0L1R1?=
 =?utf-8?B?QXRUWkQyTTdNUEVSU00zQlBOSm5VYXRSZEpZQk1nU0o1T2FhM2hxMS9QZEZG?=
 =?utf-8?B?NlhPMmlQVjZRYXF0NXQzbGpKMytxNE82ZDFxazVmbmNzYzQxYSt2amJCOHZC?=
 =?utf-8?B?Q3BpckhNSnZyRjZsRVkyMzdtWEhSMitpaWc3UmZIV2cwMzJUUHM1UHh6d3hV?=
 =?utf-8?B?TElUd2NoSGJLRkUvcnQ5cFV0dXhVdmlTZ3JYU0QwdDZFRnJZSmxkUjJyMlpZ?=
 =?utf-8?B?cWRPbEdrdWIwanZyTlMyYVA2UTNGUE5tY04yclZRbjY5dER5eWdqTHFjWVFP?=
 =?utf-8?B?MnJ1S0tmd2drSERuWS9EeHVlc01mU1hPczJ4NEZ0eW4yditheERxRHBzM3NS?=
 =?utf-8?B?YkVONFZhYVl3emFIa0NsT1BhdlorNG96WmJ1NXVsTlRhUG1BdGlaMFoweGpn?=
 =?utf-8?B?NTBjRHVTSFJOYjlVZTFhOFFsVU5TTmxZcEhiN0RMa0hJRkxCK2VBaFl1WG5U?=
 =?utf-8?B?Vk5Da3N6eWNLYytiUVR0SXJSejNkdFAzOFNYWmhya3NNaktQRW1xOXpiUjF3?=
 =?utf-8?B?ckd5Q3YxV2c0OHJkUmVubXdQL3V3RjBibFhRYWJOWk1EaTkxNm43djdXQTNE?=
 =?utf-8?B?YjFhS1FZRVRleUFSNGVBNkU2eGJMcEVqeEFCQjZ0T2JobGFURlFxOTB6OXlK?=
 =?utf-8?B?YnpvWitSMkFKTFVVWmdJSXQvZFB5MnNrMU4zRElzRnNZSys0RlFSeXJLLzFO?=
 =?utf-8?B?b1NobWpTRnRCcXk5VEt6dlJ2NjFtUnU0Q0Fhc2lyRU9TOE5oRmZvREIyVFla?=
 =?utf-8?B?dldNVnh6dHpGcGV6UURuUkd0aThmbjJMb2Z1RlhPbGNkVmdwUW5rQ0l1QnNQ?=
 =?utf-8?B?MUorQTE0L0Q3YmxweEhERDNzVHk0azhWRG4wQ1AxNlp0bTJ0RXlJWjZTTG9T?=
 =?utf-8?B?MEdJM09DcFFFUy9iTGxqY0lERFJvekpKYjBaMFhIeXh0dk9tbVltKzkzdVdS?=
 =?utf-8?B?MGY1YlFNUjhOV3dDbXpRSUpYVW5OdW5Yc2xRenpnRUdSQnNlZ1RiVThYaTBq?=
 =?utf-8?B?TEVmZkUvZjN1d2ZKL1llOVNiQWJmTDd6Y2ExWDJOMW1zWmh1UHprMjdTRnhS?=
 =?utf-8?B?UzJ3Z2FSeUozNDEzTnI0UkljZUZkK1lCSUVxVmJWZWxUbGV2SzZuRy9TaU9I?=
 =?utf-8?B?bTZ0Ykk0cGRrK1N1NFZCRWhEWEFaNE8zY2U0U1IxZWpMckFISnUvQm5oaURT?=
 =?utf-8?Q?sAZUUQFIF+2LpWsI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c103e3da-18cf-4b2f-89c1-08de532a7af9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 05:05:05.3035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53dGpvHXaXwA3uACLglY8ggMqOzDhadPEAqV5NG4SK3mS0qX2kFw7RAXUBJPBvu/b71ViLyndxMr0B/bx5SonlZaERKk8Xu0ZhVgfEhHBn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6392
X-Proofpoint-GUID: e8wgh-7AaFm7L_2nRi4RAuyTy3QvpQn2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDAzNiBTYWx0ZWRfX0RO5QHyjm0R/
 LKnY0335U30syJ3X1KtI61WkWlztRaPiEgmPh1WeiZ+t299bHnJyW7ZnvUW2EUhVGKpPpgGHpc9
 xPvwbgwlv9FcmDVS2p4PlxFYkqHVIpzDoalEiYOiiw4NuuN7SK0R8xOT5ahJSbHkK17Aw/CG5fs
 zza3kpEQsITxn2B/Hp2HkBLXqyg+LE58DWIV/FjIQ4CJ7JQdLyUQDH55QFzvMhZp9MC4qm5ktS7
 0zGH0YQFf3eKC2DFWKfspLTZYhVZrFDtTW8TBXuRfYZprVcxBqJ8f5i1+UG0i2azsw7cIukgALH
 5KLwW4fsnqbEH38l48v0VzwFPEwP58HUA4qnnxdOw0HTZJQI1oli4jvOBkty/sd4GlYOXhdMYhc
 LBHNUdgsXVKka8/yO0Kkzu/j7OpDv4TFrcR3QtY9Po46Ny0pfj11tC/+Jm0b+25/lTMdl0OvjOo
 Ce+2JYbtMwCXm8+9SUw==
X-Authority-Analysis: v=2.4 cv=b66/I9Gx c=1 sm=1 tr=0 ts=69672404 cx=c_pps
 a=lBUCPINxFTLumcbCLOYEQA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iGHA9ds3AAAA:8 a=ySjF6f4xAAAA:8 a=RFjtGLVJAAAA:8 a=zfDz3bfgAAAA:8
 a=0oRN3E7-AAAA:8 a=Vm47VwaKAAAA:8 a=XkuJC2LXAAAA:8 a=HONIr0DtAAAA:8
 a=VvCv5PxMAAAA:8 a=vCHQbyzJAAAA:8 a=xH1NtE5oAAAA:8 a=Qp89o8roAAAA:8
 a=4yYbIk-QAAAA:8 a=zezS8uIVAAAA:8 a=FGyEWsL0AAAA:8 a=ZW26Cz4yAAAA:8
 a=yXrhUOqHAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=zXRRNrs--_ybEsDx8YMA:9
 a=lqcHg5cX4UMA:10 a=PRpDppDLrCsA:10 a=O9Trw71uoXUA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=cCEoK8jFP94AMyPREWsA:9 a=uyVg0ARcbpIK3ogo:21
 a=_W_S_7VecoQA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=SVe2G6S_LxxHVpu7-jkk:22
 a=stvaAeZBb5V-fPvp-vy9:22 a=N25aw_RMdTD0XpBlQSev:22 a=A9sDTnWZ4UTPbge9BLXR:22
 a=yKFyvykjIVJwvJuxpF0o:22 a=xlXauZMLQ9LHMUg6t57S:22 a=Qh5NoN3BRiC1xVk-ykmT:22
 a=nHMe9YOggYUlATdCyaZ5:22 a=mA5qry1rbyGvl90tSnBg:22 a=NKNeG3A5ERXAAbeP1Vwc:22
 a=2PextC8wxLu3zIcEEJGI:22 a=cTuAbiFRQQ3bCsKXpUDn:22 a=bJDlsGUbebFl2L_cY-Us:22
 a=T40czrJlKppFb-2YZAJc:22 a=F6BVzrJpdfjGM_8oyBWw:22 a=m8zSV4HTxMnuI1eHxS4u:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: e8wgh-7AaFm7L_2nRi4RAuyTy3QvpQn2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140036
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 14 Jan 2026 05:05:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9549

--------------EMpNtQ0V4FhmPWrJPEq0sfBL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60E4SYGC301496


On 1/8/26 21:21, Bruce Ashfield wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
>
> On Thu, Jan 8, 2026 at 1:26=E2=80=AFAM Changqing Li via lists.yoctoproj=
ect.org=20
> <https://urldefense.com/v3/__http://lists.yoctoproject.org__;!!AjveYdw8=
EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjr=
QaAFZmCsF_sHzefcUMGHw_79Q$>=20
> <changqing.li=20
> <https://urldefense.com/v3/__http://changqing.li__;!!AjveYdw8EvQ!cbNtO-=
fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_=
sHzefcUMuaHYLRg$>=3Dwindriver.com@lists.yoctoproject.org>=20
> wrote:
>
>     From: Changqing Li <changqing.li@windriver.com>
>
>     These series of patches are mostly set buildid to empty for improvi=
ng
>     reproducibility, I also send a patch to oe-core with subject:
>     [PATCH V3] go.bbclass: set buildid to empty string to improve
>     reproducibility
>
>     which add -buildid=3D in default GO_LDFLAGS, but since packages com=
piled
>     with go may not use GO_LDFLAGS in go.bbclass, they can have their o=
wn
>     Makefiles, define their own variables for passing ldflags, so chang=
e
>     them one by one.
>
>
> Rather than setting it to empty, I'd rather set it to a value that migh=
t
> be useful to us.
>
> Perhaps the git hash we are building ? or the checksum of another
> set of files ?

Hi, Bruce

The idea is good, for the recipes changed one by one in this series patch=
, maybe we can easily give them a value one by one.

but for go.bbclass,  I have two ideas:

GO_BUILDID ?=3D ' -buildid=3D"${@d.getVar('SRCREV') if d.getVar('SRCREV')=
 !=3D 'INVALID' else ( d.getVar('SRCREV_%s'%${PN}) if d.getVar('SRCREV_%s=
'%${PN}) !=3D '' else ( d.getVarFlag('SRC_URI', 'sha256sum') if d.getvarf=
lag('sha256sum') !=3D '' if () else '') )}'

This is complicated, andtheoretically speaking, not sure it always have a=
 value. And do we really need this value,  how to use it?

GO_BUILDID ?=3D ' -buildid=3Dd.getVar('PV')

This can ensure it always have a value, but I think this is not very usef=
ul.  usually, we can get version by "binray --version".


Consider above, how about set it to empty if we don't have special usage =
of this buildid?



//Sandy

>
> Bruce
>
>
>     podman also disable buildvcs
>
>     Changqing Li (15):
>     =C2=A0 docker-compose: set go buildid to empty for improving
>     reproducibility
>     =C2=A0 docker: set go buildid to empty for improving reproducibilit=
y
>     =C2=A0 kubernetes: set go buildid to empty for improving reproducib=
ility
>     =C2=A0 nerdctl: set go buildid to empty for improving reproducibili=
ty
>     =C2=A0 runc: set go buildid to empty for improving reproducibility
>     =C2=A0 skopeo: set go buildid to empty for improving reproducibilit=
y
>     =C2=A0 umoci: set go buildid to empty for improving reproducibility
>     =C2=A0 cni: update GO_EXTRA_LDFLAGS
>     =C2=A0 oci-image-tools: set go buildid to empty for improving
>     reproducibility
>     =C2=A0 docker-distribution: set go buildid to empty for improving
>     =C2=A0 =C2=A0 reproducibility
>     =C2=A0 containerd: set go buildid to empty for improving reproducib=
ility
>     =C2=A0 cri-o: set go buildid to empty for improving reproducibility
>     =C2=A0 cri-tools: set go buildid to empty for improving reproducibi=
lity
>     =C2=A0 oci-runtime-tools: set go buildid to empty for improving
>     =C2=A0 =C2=A0 reproducibility
>     =C2=A0 podman: improve reproducibility
>
>     =C2=A0.../containerd/containerd_git.bb
>     <https://urldefense.com/v3/__http://containerd_git.bb__;!!AjveYdw8E=
vQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQ=
aAFZmCsF_sHzefcUNo9zLiWA$>
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +
>     =C2=A0recipes-containers/cri-o/cri-o_git.bb
>     <https://urldefense.com/v3/__http://cri-o_git.bb__;!!AjveYdw8EvQ!cb=
NtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZm=
CsF_sHzefcUMs78D5Ig$>
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +
>     =C2=A0recipes-containers/cri-tools/cri-tools_git.bb
>     <https://urldefense.com/v3/__http://cri-tools_git.bb__;!!AjveYdw8Ev=
Q!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQa=
AFZmCsF_sHzefcUMpCb2ntg$>
>     |=C2=A0 2 +-
>     =C2=A0.../docker-compose/docker-compose_git.bb
>     <https://urldefense.com/v3/__http://docker-compose_git.bb__;!!AjveY=
dw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6=
bjrQaAFZmCsF_sHzefcUN5gCwGXw$>
>     =C2=A0 =C2=A0 |=C2=A0 4 +-
>     =C2=A0.../docker-distribution_git.bb
>     <https://urldefense.com/v3/__http://docker-distribution_git.bb__;!!=
AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLL=
TrJW6bjrQaAFZmCsF_sHzefcUPPOSTQ1A$>
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +
>     =C2=A0...01-Makefile-remove-duplicate-ldflags.patch | 39
>     +++++++++++++++++++
>     =C2=A0recipes-containers/docker/docker.inc
>     <https://urldefense.com/v3/__http://docker.inc__;!!AjveYdw8EvQ!cbNt=
O-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCs=
F_sHzefcUNwIT0NzQ$>=C2=A0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +
>     =C2=A0.../kubernetes/kubernetes_git.bb
>     <https://urldefense.com/v3/__http://kubernetes_git.bb__;!!AjveYdw8E=
vQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQ=
aAFZmCsF_sHzefcUOnhKFbpA$>
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-
>     =C2=A0recipes-containers/nerdctl/nerdctl_git.bb
>     <https://urldefense.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8EvQ!=
cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAF=
ZmCsF_sHzefcUNO5-GgCA$>
>     =C2=A0 =C2=A0|=C2=A0 1 +
>     =C2=A0.../0001-Makefile-add-EXTRA_LDFLAGS.patch=C2=A0 =C2=A0 =C2=A0=
| 39
>     +++++++++++++++++++
>     =C2=A0.../oci-image-tools/oci-image-tools_git.bb
>     <https://urldefense.com/v3/__http://oci-image-tools_git.bb__;!!Ajve=
Ydw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW=
6bjrQaAFZmCsF_sHzefcUPoEWN6-w$>
>     =C2=A0 |=C2=A0 5 ++-
>     =C2=A0.../0001-Makefile-add-EXTRA_LDFLAGS.patch=C2=A0 =C2=A0 =C2=A0=
| 33 ++++++++++++++++
>     =C2=A0.../oci-runtime-tools_git.bb
>     <https://urldefense.com/v3/__http://oci-runtime-tools_git.bb__;!!Aj=
veYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTr=
JW6bjrQaAFZmCsF_sHzefcUOHvuIx5g$>
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +
>     =C2=A0recipes-containers/podman/podman_git.bb
>     <https://urldefense.com/v3/__http://podman_git.bb__;!!AjveYdw8EvQ!c=
bNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZ=
mCsF_sHzefcUN_RLh2RA$>
>     =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-
>     =C2=A0recipes-containers/runc/runc.inc
>     <https://urldefense.com/v3/__http://runc.inc__;!!AjveYdw8EvQ!cbNtO-=
fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_=
sHzefcUN6fsNm5A$>=C2=A0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +
>     =C2=A0recipes-containers/skopeo/skopeo_git.bb
>     <https://urldefense.com/v3/__http://skopeo_git.bb__;!!AjveYdw8EvQ!c=
bNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZ=
mCsF_sHzefcUPMeA_sbQ$>
>     =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-
>     =C2=A0recipes-containers/umoci/umoci_git.bb
>     <https://urldefense.com/v3/__http://umoci_git.bb__;!!AjveYdw8EvQ!cb=
NtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZm=
CsF_sHzefcUO9-Ps7rA$>
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-
>     =C2=A0recipes-networking/cni/cni_git.bb
>     <https://urldefense.com/v3/__http://cni_git.bb__;!!AjveYdw8EvQ!cbNt=
O-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCs=
F_sHzefcUN-aL8Klg$>
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-
>     =C2=A018 files changed, 138 insertions(+), 10 deletions(-)
>     =C2=A0create mode 100644
>     recipes-containers/docker-distribution/files/0001-Makefile-remove-d=
uplicate-ldflags.patch
>     =C2=A0create mode 100644
>     recipes-containers/oci-image-tools/files/0001-Makefile-add-EXTRA_LD=
FLAGS.patch
>     =C2=A0create mode 100644
>     recipes-containers/oci-runtime-tools/files/0001-Makefile-add-EXTRA_=
LDFLAGS.patch
>
>     --=20
>     2.34.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#9531):
>     https://lists.yoctoproject.org/g/meta-virtualization/message/9531
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-=
virtualization/message/9531__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_=
FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUOR0VWQvA$>
>     Mute This Topic:
>     https://lists.yoctoproject.org/mt/117148688/1050810
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/1171=
48688/1050810__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQf=
Xr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUORBdhH5w$>
>     Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>     <mailto:meta-virtualization%2Bowner@lists.yoctoproject.org>
>     Unsubscribe:
>     https://lists.yoctoproject.org/g/meta-virtualization/unsub
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-=
virtualization/unsub__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpv=
LRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUNro6bbiw$>
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
--------------EMpNtQ0V4FhmPWrJPEq0sfBL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60E4SYGC301496

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#ffffff">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 1/8/26 21:21, Bruce Ashfield wrote:=
<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4MB=3DAckiSmwRHJFjg_X2oYC=
CfRTEFydoWs2TNqDJK=3D7rw@mail.gmail.com">
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
            <div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 8, 2026 at
              1:26=E2=80=AFAM Changqing Li via
              <a href=3D"https://urldefense.com/v3/__http://lists.yoctopr=
oject.org__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7U=
evOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUMGHw_79Q$" moz-do-not-send=3D"true=
">
                lists.yoctoproject.org</a> &lt;<a href=3D"https://urldefe=
nse.com/v3/__http://changqing.li__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie1=
5dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUMuaHYLRg$" =
moz-do-not-send=3D"true">changqing.li</a>=3D<a href=3D"mailto:windriver.c=
om@lists.yoctoproject.org" moz-do-not-send=3D"true" class=3D"moz-txt-link=
-freetext">windriver.com@lists.yoctoproject.org</a>&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windr=
iver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-lin=
k-freetext">changqing.li@windriver.com</a>&gt;<br>
              <br>
              These series of patches are mostly set buildid to empty
              for improving<br>
              reproducibility, I also send a patch to oe-core with
              subject: <br>
              [PATCH V3] go.bbclass: set buildid to empty string to
              improve reproducibility<br>
              <br>
              which add -buildid=3D in default GO_LDFLAGS, but since
              packages compiled<br>
              with go may not use GO_LDFLAGS in go.bbclass, they can
              have their own<br>
              Makefiles, define their own variables for passing ldflags,
              so change<br>
              them one by one.<br>
            </blockquote>
            <div><br>
            </div>
            <div>
              <div class=3D"gmail_default" style=3D"font-size:small">Rath=
er
                than setting it to empty, I'd rather set it to a value
                that might</div>
              <div class=3D"gmail_default" style=3D"font-size:small">be
                useful to us.</div>
              <div class=3D"gmail_default" style=3D"font-size:small"><br>
              </div>
              <div class=3D"gmail_default" style=3D"font-size:small">Perh=
aps
                the git hash we are building ? or the checksum of
                another</div>
              <div class=3D"gmail_default" style=3D"font-size:small">set =
of
                files ?</div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <pre wrap=3D"" class=3D"moz-quote-pre">Hi, Bruce

The idea is good, for the recipes changed one by one in this series patch=
, maybe we can easily give them a value one by one.=20

but for go.bbclass,  I have two ideas:=20

GO_BUILDID ?=3D ' -buildid=3D&quot;${@d.getVar('SRCREV') if d.getVar('SRC=
REV') !=3D 'INVALID' else ( d.getVar('SRCREV_%s'%${PN}) if d.getVar('SRCR=
EV_%s'%${PN}) !=3D '' else ( d.getVarFlag('SRC_URI', 'sha256sum') if d.ge=
tvarflag('sha256sum') !=3D '' if () else '') )}'

This is complicated, and <span class=3D"HwtZe" lang=3D"en"><span class=3D=
"jCAhz ChMk0b"><span class=3D"ryNqvb">theoretically speaking,  </span></s=
pan></span>not sure it always have a value. And do we really need this va=
lue,  how to use it?

GO_BUILDID ?=3D ' -buildid=3Dd.getVar('PV')

This can ensure it always have a value, but I think this is not very usef=
ul.  usually, we can get version by &quot;binray --version&quot;.=20


Consider above, how about set it to empty if we don't have special usage =
of this buildid?=20



//Sandy

</pre>
    <p></p>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4MB=3DAckiSmwRHJFjg_X2oYC=
CfRTEFydoWs2TNqDJK=3D7rw@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote gmail_quote_container">
            <div>
              <div class=3D"gmail_default" style=3D"font-size:small"><br>
              </div>
              <div class=3D"gmail_default" style=3D"font-size:small">Bruc=
e</div>
              <br>
            </div>
            <div>&nbsp;</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <br>
              podman also disable buildvcs<br>
              <br>
              Changqing Li (15):<br>
              &nbsp; docker-compose: set go buildid to empty for improvin=
g
              reproducibility<br>
              &nbsp; docker: set go buildid to empty for improving
              reproducibility<br>
              &nbsp; kubernetes: set go buildid to empty for improving
              reproducibility<br>
              &nbsp; nerdctl: set go buildid to empty for improving
              reproducibility<br>
              &nbsp; runc: set go buildid to empty for improving
              reproducibility<br>
              &nbsp; skopeo: set go buildid to empty for improving
              reproducibility<br>
              &nbsp; umoci: set go buildid to empty for improving
              reproducibility<br>
              &nbsp; cni: update GO_EXTRA_LDFLAGS<br>
              &nbsp; oci-image-tools: set go buildid to empty for improvi=
ng
              reproducibility<br>
              &nbsp; docker-distribution: set go buildid to empty for
              improving<br>
              &nbsp; &nbsp; reproducibility<br>
              &nbsp; containerd: set go buildid to empty for improving
              reproducibility<br>
              &nbsp; cri-o: set go buildid to empty for improving
              reproducibility<br>
              &nbsp; cri-tools: set go buildid to empty for improving
              reproducibility<br>
              &nbsp; oci-runtime-tools: set go buildid to empty for impro=
ving<br>
              &nbsp; &nbsp; reproducibility<br>
              &nbsp; podman: improve reproducibility<br>
              <br>
              &nbsp;.../containerd/<a href=3D"https://urldefense.com/v3/_=
_http://containerd_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY=
3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUNo9zLiWA$" rel=3D"=
noreferrer" target=3D"_blank" moz-do-not-send=3D"true">containerd_git.bb<=
/a>&nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 1 +<br>
              &nbsp;recipes-containers/cri-o/<a href=3D"https://urldefens=
e.com/v3/__http://cri-o_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15d=
Do_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUMs78D5Ig$" re=
l=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">cri-o_git.bb<=
/a>&nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 1 +<br>
              &nbsp;recipes-containers/cri-tools/<a href=3D"https://urlde=
fense.com/v3/__http://cri-tools_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvT=
ZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUMpCb2=
ntg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">cri-t=
ools_git.bb</a>
              |&nbsp; 2 +-<br>
              &nbsp;.../docker-compose/<a href=3D"https://urldefense.com/=
v3/__http://docker-compose_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie=
15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUN5gCwGXw$"=
 rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">docker-com=
pose_git.bb</a>&nbsp;
              &nbsp; &nbsp; |&nbsp; 4 +-<br>
              &nbsp;.../<a href=3D"https://urldefense.com/v3/__http://doc=
ker-distribution_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3n=
qpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUPPOSTQ1A$" rel=3D"no=
referrer" target=3D"_blank" moz-do-not-send=3D"true">docker-distribution_=
git.bb</a>&nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 2 =
+<br>
              &nbsp;...01-Makefile-remove-duplicate-ldflags.patch | 39
              +++++++++++++++++++<br>
              &nbsp;recipes-containers/docker/<a href=3D"https://urldefen=
se.com/v3/__http://docker.inc__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dD=
o_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUNwIT0NzQ$" moz=
-do-not-send=3D"true">docker.inc</a>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&=
nbsp; 2 +<br>
              &nbsp;.../kubernetes/<a href=3D"https://urldefense.com/v3/_=
_http://kubernetes_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY=
3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUOnhKFbpA$" rel=3D"=
noreferrer" target=3D"_blank" moz-do-not-send=3D"true">kubernetes_git.bb<=
/a>&nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 2 +-<br>
              &nbsp;recipes-containers/nerdctl/<a href=3D"https://urldefe=
nse.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAi=
e15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUNO5-GgCA$=
" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">nerdctl_g=
it.bb</a>&nbsp;
              &nbsp; &nbsp;|&nbsp; 1 +<br>
              &nbsp;.../0001-Makefile-add-EXTRA_LDFLAGS.patch&nbsp; &nbsp=
; &nbsp;| 39
              +++++++++++++++++++<br>
              &nbsp;.../oci-image-tools/<a href=3D"https://urldefense.com=
/v3/__http://oci-image-tools_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIA=
ie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUPoEWN6-w=
$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">oci-imag=
e-tools_git.bb</a>&nbsp;
              &nbsp; |&nbsp; 5 ++-<br>
              &nbsp;.../0001-Makefile-add-EXTRA_LDFLAGS.patch&nbsp; &nbsp=
; &nbsp;| 33
              ++++++++++++++++<br>
              &nbsp;.../<a href=3D"https://urldefense.com/v3/__http://oci=
-runtime-tools_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqp=
vLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUOHvuIx5g$" rel=3D"nore=
ferrer" target=3D"_blank" moz-do-not-send=3D"true">oci-runtime-tools_git.=
bb</a>&nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&n=
bsp; 2 +<br>
              &nbsp;recipes-containers/podman/<a href=3D"https://urldefen=
se.com/v3/__http://podman_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie1=
5dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUN_RLh2RA$" =
rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">podman_git.=
bb</a>&nbsp;
              &nbsp; &nbsp; &nbsp;|&nbsp; 4 +-<br>
              &nbsp;recipes-containers/runc/<a href=3D"https://urldefense=
.com/v3/__http://runc.inc__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY=
3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUN6fsNm5A$" moz-do-=
not-send=3D"true">runc.inc</a>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; |&nbsp; 1 +<br>
              &nbsp;recipes-containers/skopeo/<a href=3D"https://urldefen=
se.com/v3/__http://skopeo_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie1=
5dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUPMeA_sbQ$" =
rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">skopeo_git.=
bb</a>&nbsp;
              &nbsp; &nbsp; &nbsp;|&nbsp; 2 +-<br>
              &nbsp;recipes-containers/umoci/<a href=3D"https://urldefens=
e.com/v3/__http://umoci_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15d=
Do_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUO9-Ps7rA$" re=
l=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">umoci_git.bb<=
/a>&nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 4 +-<br>
              &nbsp;recipes-networking/cni/<a href=3D"https://urldefense.=
com/v3/__http://cni_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_F=
Y3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUN-aL8Klg$" rel=3D=
"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">cni_git.bb</a>&nb=
sp;
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 4 +-<br>
              &nbsp;18 files changed, 138 insertions(+), 10 deletions(-)<=
br>
              &nbsp;create mode 100644
recipes-containers/docker-distribution/files/0001-Makefile-remove-duplica=
te-ldflags.patch<br>
              &nbsp;create mode 100644
recipes-containers/oci-image-tools/files/0001-Makefile-add-EXTRA_LDFLAGS.=
patch<br>
              &nbsp;create mode 100644
recipes-containers/oci-runtime-tools/files/0001-Makefile-add-EXTRA_LDFLAG=
S.patch<br>
              <br>
              -- <br>
              2.34.1<br>
              <br>
              <br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#9531): <a href=3D"https://urldefense.co=
m/v3/__https://lists.yoctoproject.org/g/meta-virtualization/message/9531_=
_;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJR=
hJLLTrJW6bjrQaAFZmCsF_sHzefcUOR0VWQvA$" rel=3D"noreferrer" target=3D"_bla=
nk" moz-do-not-send=3D"true">
https://lists.yoctoproject.org/g/meta-virtualization/message/9531</a><br>
              Mute This Topic: <a href=3D"https://urldefense.com/v3/__htt=
ps://lists.yoctoproject.org/mt/117148688/1050810__;!!AjveYdw8EvQ!cbNtO-fT=
MjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sH=
zefcUORBdhH5w$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"t=
rue">
                https://lists.yoctoproject.org/mt/117148688/1050810</a><b=
r>
              Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@=
lists.yoctoproject.org" target=3D"_blank" moz-do-not-send=3D"true">
                meta-virtualization+owner@lists.yoctoproject.org</a><br>
              Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.yoctoproject.org/g/meta-virtualization/unsub__;!!AjveYdw8EvQ!cbNtO=
-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF=
_sHzefcUNro6bbiw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
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
</html>

--------------EMpNtQ0V4FhmPWrJPEq0sfBL--

