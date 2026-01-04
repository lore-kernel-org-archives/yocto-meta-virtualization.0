Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0011CC2A069
	for <webhook@archiver.kernel.org>; Sun,  4 Jan 2026 04:44:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38093.1767501888038097921
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 03 Jan 2026 20:44:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=aSNF+Dhe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5464041c7a=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6044f1ZG2434532;
	Sat, 3 Jan 2026 20:44:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=Wj5Px93feC/ATdIMxf2hww
	33j1pcU5BwDTl3HZWRl1M=; b=aSNF+Dhe5H2hYVnPoKUcKMzLkF/0k6dPNB8ysU
	wV9mkAqfuG/+MkQkYxE2mSjrWPea/ye4veZBK9f7ULF6dHewbMDK8uWqcnGu1UxB
	YREZvDQomblXUBjPEMrX6QsAKuvawvzYQUjXkuFVrNPYbiMiVQL2v/2EaZobXyde
	ja/fH36u8pq2LqVSYJrB0RApq0txpdqArMC0GXu77ZjVRXtC7SZuv2KfJN8FeSVJ
	/yDRhP6C5tymdHSb3FsaqxCmYutjS9RJGW3ABsG7325ZR/sUImKh2KGythh+XxHL
	3vCK/30/O9zYAw7GL6aXHClfrdWid418IZMtQOJpLAa2eiWg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012011.outbound.protection.outlook.com [52.101.48.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bey920fvh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 03 Jan 2026 20:44:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+5qR8jrXXz9FQBp00z0P31JX1ew7xPMs6JyUQ7W2kxM3ezmMqnaKgjx6JhOabsFFKkayKWwpArpBci3uVZ1Q3X/DphHUHkuasllFPRxLzuB6lIgGQw6uKN5VWWhf+FcHgJYKEJoX+sy1invUy/hl3PDLw8POxqbohewCZ0Saxsm6GDmAS99o5+FEVncy/cK1wszHOW7x6LAL8eslJIARY6ZzmzW+BO3ADaXVCoM99RYwJ91gN6bCUlOA3itxs7elJQMFLlwqXAzsxX6P10eX8zvw/uWrb1GRiTCbTLuuOviKQtLAEn3v1g6V7QJfQmBxHrk7ltYgeksc43asFzfMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wj5Px93feC/ATdIMxf2hww33j1pcU5BwDTl3HZWRl1M=;
 b=Fex4A21sXyFrf24459hDm3NMrkoaeXJVD+nx/ZU4o3gcjyN1knA/7IeQjR1MA4K3HpXNenyhgE/wsua49QqCZB4RgHb87x5ch2lhj5gwKqHOge41Szut5dgAJSTTQCKyRWs+g7xIeYVdDoS+gi6l4ovSIIRKrNuerHFXIpNfkpGx7IdT+BWon71zTLsa9qUrOG30WhCOxXIdTd46LFdDztupvaNighZ98uOMrhmqGbtTjd/er66LPsxiktZyD2dbmUJbMzTuM413iMBwspDzg+JDlx6LWVTC0QMRtgujy9N9ZOByPX0sveCO8UGFKNFqhMszlMu1EDxD6F+8xFh3hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA2PR11MB4810.namprd11.prod.outlook.com (2603:10b6:806:116::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sun, 4 Jan
 2026 04:44:43 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9478.004; Sun, 4 Jan 2026
 04:44:43 +0000
Content-Type: multipart/alternative;
 boundary="------------p2bPCdlRudH7RABHD5mNPgxn"
Message-ID: <b107ec79-2ef6-4e60-8af8-bcc97d30b12c@windriver.com>
Date: Sun, 4 Jan 2026 12:44:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization] Issues with the new go-mod-vcs
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>,
        "MacLeod, Randy" <Randy.MacLeod@windriver.com>
References: <CO6PR11MB5602B543BFFC3DF6C86DD99BEDBCA@CO6PR11MB5602.namprd11.prod.outlook.com>
 <1885E2DCAB6244C8.1706869@lists.yoctoproject.org>
 <CADkTA4OS8wGT5VG=uBpybZamkSWk4Mxv9ReUaGt2t3q8J80D5A@mail.gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CADkTA4OS8wGT5VG=uBpybZamkSWk4Mxv9ReUaGt2t3q8J80D5A@mail.gmail.com>
X-ClientProxiedBy: SG2PR01CA0196.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::23) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA2PR11MB4810:EE_
X-MS-Office365-Filtering-Correlation-Id: 10fa8071-d929-47f1-9434-08de4b4bfa83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|4022899009|376014|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U3lKQURVVThHeGQ5c2hWeVVldUdROEVVS1pTSWxrN2N1UnJtMzEzMzkvN1JK?=
 =?utf-8?B?dCtvS3JCY3FCWWY3U2VORGRKMUJla3JtVmI5Syt4Sm8wYXU4WmdVKytmcFB4?=
 =?utf-8?B?MDR2QzBEdkhMWnZUMytNTU0ybkhsSkJxcVNDSUJYenRseFQ3TGNHSW04THZU?=
 =?utf-8?B?NlpzV2lWNCtVTndXMXZydUxoQzFQbjJ4cko0UHA0NDYyYVZwMTV3RkhIOVFL?=
 =?utf-8?B?WXQyOGJEWUdkL1dXZWR6emhCZG5HekVDbW9UK0p4TFBUSFRxbnhRdDNEaXJQ?=
 =?utf-8?B?NVRCcXZWdENTSndGMGMrejlOSEt5eG9CbithNjRqUVJ3TEs2VDZOZHR6SWhH?=
 =?utf-8?B?V0EwRXptVTVtT25IY0JRaHFoUldhM2xSSVV0Z3RTWm8ySC9seWJxZ3VLQjJ3?=
 =?utf-8?B?TExBS2t3LytLa0JpRllNR29xam44UmpHSWVMbDc0bVdJbXdnWkFLaHByckdz?=
 =?utf-8?B?SjhFQVJUSlpWVURDZVBTMXBiQ0hKN1lxeG00MGVuaEdNbVh0cmpsMEYxVDhF?=
 =?utf-8?B?VkhKSUFKLzdiRzdZQjRsRnJuS1JUclZ6UGNYU0hVOW5JbEhlQlVNN3BrSllP?=
 =?utf-8?B?cWNTL1V5VzVRMVJJYlpXV1FhdlYvUGNhRXdrZWJ3Qks5a1l5RVlnbGVvM1NC?=
 =?utf-8?B?eUdLa1kweURuUTluYVpuM2FZeHQyWUZJc25hdllRV2JpdTZ3RVk2cVZSYlA4?=
 =?utf-8?B?VEhSYVd3YUhpWDBBd1RzTVRia2g0SU9yY1RhRWRaemN4cUN4Q3RDa3A4S1BQ?=
 =?utf-8?B?TFlLYXZISjlTM3VHQm01c0c3emtVOWxERTFCYWRQOXZ1TzBUOVFLM1V2TDhs?=
 =?utf-8?B?Y2FqSXFvVE9tdzdZK2YxRE1xT1VudXVyV1V6NHFma3ROcmtkYmV2WFM3cE9Z?=
 =?utf-8?B?TUVGcWs5UDhrNzFxcnNjSEkvcDlqazJYODNkYzZYeGR0SHYwck1ibE1DTEdz?=
 =?utf-8?B?ZmVITS9tcExvNERCaUhvdnB4NGxSSks1SFdRSVI3YStMSmxYZm1wbmljOVNI?=
 =?utf-8?B?eFQ4ZTV2ZXhmck5tMHBjUW53VTRrcmw5aHZFZnJId3plcHJ2bUVrMWp3M0cz?=
 =?utf-8?B?MURBRkJsY0xITzBiWXFpWGRZaWdOK25ZUHhrK2NLbnZNQ3ByRmtJbDNFQjAz?=
 =?utf-8?B?UXo0ZXozRGlMZDNlL0lNeFlLQlVMQ2EvaitLazdicHI4bFBGcFBObWpoUkM3?=
 =?utf-8?B?YUp2Z3d3S3M4MVVHUU1hOTJFY0plN2ROZi9pdG9pYytLQm8xSzZSeDVRZjdY?=
 =?utf-8?B?WHcrNjJlL2tKeWhXWllSTnFWSURlYnpvWDNlLzRPZEJHS3FHNGhSWWN5dnRC?=
 =?utf-8?B?cjkvN0xiYjFDUklQcGpoeHJmc0V0UytMQzJ2RzdkUjg1OHlCQjhEKzNPdHdY?=
 =?utf-8?B?cDExejRqWWpZL0JQaDU2L0xERnM3UGljVjRGSXI0VXkyKzNlUXYreVlWRHFz?=
 =?utf-8?B?MGtXdEc1RFdzejJJdVB5YkQrblNVa2F5eWEreGZNdTNFbytZdXF5MjA5VTRM?=
 =?utf-8?B?K3RjblY5V3ZZOG5ndGdEaWY4Q2dZUWtBMDZBR0NwZy9ZelRrWjB2ZXF2VlF2?=
 =?utf-8?B?cEpJVkt0TXJ5YzlvcE9QRzRmcTI4d0NBcnNwV1ZyWnl6WTR5cGIyZW9vVTNt?=
 =?utf-8?B?TTJxOElBWXU5emdNZlh0MWk2Z0lBVytBOTNuY1FYTjhJR2t2ck9pMDdxMmtS?=
 =?utf-8?B?dW91bi8rRkhya3oxSUpScXI4RjF2V3JzOWR0WnpqRGY2ajd3eVZqaCt1WmFz?=
 =?utf-8?B?d2V3bjI0a3lMZjRsUGh6M0Q3Y2MzZ2JFdzN2MkhRQWRYaXRVKzNHZTE1V1B5?=
 =?utf-8?B?dG1tSTBGVDdZL0VpUEpEMzg3ck01STNKM09CclI2UlArMzVhT08yUGxqNEtn?=
 =?utf-8?B?Q3lhVGJSbGtESXhjUW5pbEsyUFFETlJaSGxYL1VybkFsdkE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YUtxekkyUk94cXpFQlNBRkF4eGFjd0pEenVML0NLYW90Zk5KMEFiVy8vUmI0?=
 =?utf-8?B?NmNwckV2dmt3WjEwSnZta3p3cnR1c2JaN3FlS2J3Y04zNnN3Yy9Vd1NEM1g0?=
 =?utf-8?B?aUUrK1N4eUhEeUdHNURqaklZSkFheXZqZzBmYmNOVlFSSzcyUU54ZlRrUFV3?=
 =?utf-8?B?MFlNSUFDbDJKeW5JWkppUXk4bkhYSG1KOXRaMkJQZWpmd282S1lDVElYbFNv?=
 =?utf-8?B?MVBvWUg1WG8xRDFORHliSTFSaUduTGlwSStudXBoQjNkN1dUOGtMUnJRbkhz?=
 =?utf-8?B?YWxLMTZFY21sUEgyTEFNMDRsTVd2cnNwRThaM0tHQUpBVjkwTVNBcVhEOHVh?=
 =?utf-8?B?NUlvUVNTekdnRjZKWUIwQVdINkk1MjJMNjArcHc1Uy9ESzBmeGJkZGdWeUc0?=
 =?utf-8?B?Ujh4WmREVjkwaFk0enJxeDNMLzh1eTNqSXBKaEo5REFoVFQwUnVoNTF5cnBO?=
 =?utf-8?B?Z2RaU012WFozMElrQlVWN2hBNGdMUVg4amlpRHpPakpQV2JGOWprQUlVYmo2?=
 =?utf-8?B?dVhOd2lsb0MzbzcyRDBuRkMwN0sweXBDM0NvdW55aVdmSjJLYis5VkFUYjZj?=
 =?utf-8?B?M1J2UU45MDZ5Vno3bFdmRlR0RmFuZkJUcHlGWDBLNlZRSk1TU2xPaERPSVo5?=
 =?utf-8?B?SGdOY2tISUp1U2V0ZkJicjJDRnhBemRFZW5xTG1HSkJoc1IySk9WeVlOQVI1?=
 =?utf-8?B?bFFUUmJTTjVEQWxwZElyQkFFNjIxZFpaUzRIdWE2WUxyYzBCcDUxa3NkYW1i?=
 =?utf-8?B?anlkVVRiNjBaYTNiQ0FuQkQ5THdTNXM1bzU2RkRZT3pPdU5WTVM4VVIzM0FW?=
 =?utf-8?B?a3FtRWs1RkdMbm1WNy9DejdydkZuUFdGRndNOEZid2hZRkIyb051a3RaaEp1?=
 =?utf-8?B?RWNSakE3QXFJOEY3ekpzNFBuSjcveTNpSWhrRWNKS2FySFF3cmFwNm5ISVZx?=
 =?utf-8?B?NTJ5TWR4UXlrOE01aVU2dHA5dnd4VG1Hd1J6VjFCUWFheHJpNFJMc2l5RTU5?=
 =?utf-8?B?cG9pSGM0c0pHdWVRTUV3eEFjQ0kzempYbVFBbjFmTk1zMEVLbjR2eFc0bUxV?=
 =?utf-8?B?Ylc5bE82ZGVrNjg3ejV5MXVISFptK1ZLTXJFSWlnZ3g5K3VITzJYdU5RMHh2?=
 =?utf-8?B?RjJ0Qmw0MWhWbFh2dGJUZnJlMlNFaTJOY25hRUVNSzI3U2NTMGdFRDJ3TDFQ?=
 =?utf-8?B?OUQ5UFRpeEoxTGNKdktmZS9YbURhWDVVa0FrSmNFZ1Bqa1BYdFl6Qlp1V3Yz?=
 =?utf-8?B?N25Ubi9kVll0RUtwM1V2aDhNdmJQSUEvZGE5eUkwMm5IYXdZbndlTGtBQlBO?=
 =?utf-8?B?SHYvVEFrUTZGRHcxQk54SDI1K1R2S3UxdFcvWm1NQ2FhdEM5MXd1UGs1Ylp0?=
 =?utf-8?B?STdPSm1lUnMwNGs3M2xqVDU3YzQzM29vM0JjU241Q3JhclFGdUNUWFRXVnlo?=
 =?utf-8?B?ejVTZE5XWEd2VjdJN2d4clBWK0VrdVFpbWl1RTJyZTZpVTdNQzRuRE51RWxp?=
 =?utf-8?B?Z0dDdERNTld2VlNHaE9NWnUzcHFOUWtGUmdOejBBU2Y2TFJRdDMyMUlCRjZS?=
 =?utf-8?B?K2llWjFiZDd4aVhXeGdmWURYaVlXK1R6bFBPbDdQb1hEY3Jsem5iaTV6OHh6?=
 =?utf-8?B?YUdMWFUvUWRxaFhoNG5GdXc0VDhCaElMeWlVSk8ydkJCdzJQR1dJckpnTHRi?=
 =?utf-8?B?U1FULzhtbE5KMS9RQk5DUFFrMHU5d042WjhXZldSaytwRWYzeEFSdkZxRGdR?=
 =?utf-8?B?U3hsRHNJaTkyOHJYZEp1WTRkbVdhUU13WTUvc3pUbWxlMlNHUEhycVVzYytj?=
 =?utf-8?B?SFdVMFQrKzJPMkREVHNQS1FnZVA2a0JHa3MyWHpWRHZQUVJ3MUFsTjI1Q0FZ?=
 =?utf-8?B?S0FHbXVmeGNBcnlDTU5ZMTd3STlXNEFOcXdpOHYvQnNmbERkNHlEcGFVbURF?=
 =?utf-8?B?anUvQVczcU43NFBqdGVZbitKUy9FU0lyL3AzMGU3ejFqWmhZcExZSDNtdUdS?=
 =?utf-8?B?aDdNYStCaDB0QW0rdkxNQkd0YkRhKzFBTTRrcFZNWFI3ZlA4SzI3T3hqejJz?=
 =?utf-8?B?RUJkaW5ISy82bEY2aHR0WnY4aGIxNkl2RGhGaXVOSUFMYUdhOHZrNnlOMFoy?=
 =?utf-8?B?L0RocXNPNmp4cmZOQ2dwejkrMXQzbWJITzhLcmxxbjlyV0pJVDY4UENJVmgw?=
 =?utf-8?B?VEdaV1BQWDk0ZEg0R3ExS0xTeTNmM2F2TEZFeGhZZmMwV01LMEdOcEZOeHVa?=
 =?utf-8?B?L1VGWU40dlRFNVRWRlppRGd3TTgxRU5HNHZNbEV0Q3NVRDBPZVlYMFFha3FC?=
 =?utf-8?B?VmxtWkhmSFVwWldvb3g3bnJ1S0dXRzRybUtQSmxwczF0TUtUMXpLdz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10fa8071-d929-47f1-9434-08de4b4bfa83
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2026 04:44:43.3761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VHcMOjdmEa9VRkTiMtgI24cIDhH62sTH0gZzeck1GbdWKPOfKS+1I3sD0h5alDix8s1RUfauIBSL8Cg6QUckJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4810
X-Proofpoint-ORIG-GUID: opiy4POR2w9C5s4QUpqOmK38qWxd7FN0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA0MDA0MCBTYWx0ZWRfXyIegvFHu+w+R
 69onuO8SihhPCd/iZOY3Cs5r/WpA/d65CnV+Bzi7v/yI+X0pSN2MhV7SsZnR/CLxZRk4NoX1YbD
 o7Y1bfoIaTmYJe8ycrqptSm2cMiCdF/CTPBGNIKp5+ODBOtP+bhdeFI6NkPLJ8DKEQA0+1PlYwC
 gNtYcWTxj+VKra9hBKjln95FlvGkvV3OrbJg+nS3CLpb3taiyzRxEBqIhzzrtnl0PnClQHeP1Dc
 JujksTOk9OZV+m3feh708x6mrBTbgtVzOpl9eAyGc+/gxk7EVlW36RZ4uXUF3KcyhKetNGN0oxE
 7VsyQefwRkc3AkeOiF1/eF1jp0Wfkg4Yix8a62twMLNgIOU0m+SpQx7Fx0uzQm50wcu4LBJmpSZ
 vlb27zVrj8BCxtEo+YBMfj+y3uFhEPZYmUHL6iu5GFF89fDUZ86OAWFN2XEUGjkDv15B2MLiO0O
 uHvoBI2GPAgdhEbEclA==
X-Authority-Analysis: v=2.4 cv=HtZ72kTS c=1 sm=1 tr=0 ts=6959f03e cx=c_pps
 a=AgKHDJP192gAOy1PpHj/Qg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iGHA9ds3AAAA:8 a=HW7Q9lB6AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=Yp6gPis_LoK4aLZVoUIA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3522WIfgXUqAnnlK-7oA:9 a=Zt5rkO2qE3ywrSWC:21
 a=_W_S_7VecoQA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=_kXIcwA_hRzWaEKSub6B:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: opiy4POR2w9C5s4QUpqOmK38qWxd7FN0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-04_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601040040
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 04 Jan 2026 04:44:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9513

--------------p2bPCdlRudH7RABHD5mNPgxn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6044f1ZG2434532

Hi Bruce,

Thanks a lot for your prompt response and efforts.

The BB_GIT_SHALLOW_EXTRA_REFS is the only one that actually breaks build.
Switching to the tag parameter looks like a good approach.
In case you want to check if things work for that new approach:
1. Add in local.conf:
BB_GENERATE_SHALLOW_TARBALLS =3D "1"
BB_GIT_SHALLOW =3D "1"
2. bitbake cni -c fetch

Regards,
Qi

On 12/30/25 20:33, Bruce Ashfield wrote:
>
>
> On Tue, Dec 30, 2025 at 12:11=E2=80=AFAM Bruce Ashfield via=20
> lists.yoctoproject.org=20
> <https://urldefense.com/v3/__http://lists.yoctoproject.org__;!!AjveYdw8=
EvQ!b6v8XClxTwaU64yN-fkFEA4g-eB75KMSsC7-of29zkaaHfbTuhe6LKWRHTuicZrgIygs5=
doy8EGaOoHpSyFnCrb-Bg$>=20
> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
>
>
>     On Mon, Dec 29, 2025 at 11:23=E2=80=AFPM Chen, Qi <Qi.Chen@windrive=
r.com>
>     wrote:
>
>         Hi Bruce,
>
>         The new go-mod-vcs recently introduced in meta-virt =C2=A0has s=
ome
>         some problems.
>
>         The first and most significant one is the misuse of
>         BB_GIT_SHALLOW_EXTRA_REFS. It causes fetching failure when
>         shallow tarball generation is enabled.
>
>
>     I wouldn't call it a misuse, it is actually=C2=A0required=C2=A0to m=
ake the
>     support work
>     and attempt to save some download space. There are thousands of
>     dependencies
>     for some of the recipes and MANY of them have tags that aren't on
>     branches, or
>     aren't at the tip of branches, so those refs are there to force a
>     deep enough fetch
>     or to ensure that bitbake does the same "deshallowing"=C2=A0 as was
>     done during
>     generation.
>
>     I could probably switch it out for tag=3D in the different entries.
>     I've made that
>     tweak and will run some tests.
>
>         Use the following steps to reproduce the error:
>
>          1. Add in local.conf:
>
>         BB_GENERATE_SHALLOW_TARBALLS =3D "1"
>
>         BB_GIT_SHALLOW =3D "1"
>
>          2. bitbake cni -c fetch
>
>         Error message: fatal: couldn't find remote ref v0.0.4
>
>         Root cause: the repos specified in SRC_URI does not contain
>         the required extra refs specified by BB_GIT_SHALLOW_EXTRA_REFS.
>
>     I run with that all the time, I've never seen it, those
>     BB_GIT_SHALLOW_EXTRA_REFS are
>     not magic, they come directly from the repositories during
>     discovery and are required to deshallow
>     a repository.
>
>     My tests with the tag parameter may solve the issue. So stay
>     tuned, I have that and several other
>     changes pending. But none of them will be until the end of next
>     week once I am back in the office.
>
>         The second one is the duplicate entries in SRC_URI. Example:
>         errdefs in docker-compose.
>
>
>     It builds fine here, what issues are you seeing with it ? Are you
>     using VCS
>     mode ? or hybrid ?
>
>
> There are multiple places that the vcs generator looks for (and=20
> removes duplicates).
> I added another and am testing it. So once I fix the shallow clone=20
> logic, I can push
> this as well.
>
> I was able to build both modes locally, so it is a cosmetic fix, but=20
> worth=C2=A0doing.
>
> Cheers,
>
> Bruce
>
>
>     You can be assured that anything I pushed has been built many
>     times, and has
>     been runtime tested. So the first information you need to provide
>     is more details
>     about what you are building, so I can track down the differences.
>
>         The third one is the =E2=80=98shallow=3D1=E2=80=99 parameter in=
 SRC_URI. The
>         problem is that git fetcher does not support such parameter.
>
>         In fetch2/git.py
>         <https://urldefense.com/v3/__http://git.py__;!!AjveYdw8EvQ!b6v8=
XClxTwaU64yN-fkFEA4g-eB75KMSsC7-of29zkaaHfbTuhe6LKWRHTuicZrgIygs5doy8EGaO=
oHpSyFfHig6fg$>:
>         ud.shallow =3D d.getVar("BB_GIT_SHALLOW") =3D=3D "1"
>
>         So I guess these could be removed? And switching to use
>         BB_GIT_SHALLOW:pn-xxx =3D =E2=80=9C1=E2=80=9D?
>
>
>     No. I plan to add more support for that later, it just isn't ready
>     yet. They will stay.
>
>         P.S.
>
>         I sent a related patch to bitbake:
>         https://lists.openembedded.org/g/bitbake-devel/message/18656
>         <https://urldefense.com/v3/__https://lists.openembedded.org/g/b=
itbake-devel/message/18656__;!!AjveYdw8EvQ!b6v8XClxTwaU64yN-fkFEA4g-eB75K=
MSsC7-of29zkaaHfbTuhe6LKWRHTuicZrgIygs5doy8EGaOoHpSyG2hk9-1g$>
>
>         The problem in bitbake is revealed by the current SRC_URI
>         settings in meta-virt.
>
>         If you get similar error, you can apply the above patch.
>
>
>     If I was going to see that error, I would have already ...
>
>     Bruce
>
>         Regards,
>
>         Qi
>
>
>
>     --=20
>     - Thou shalt not follow the NULL pointer, for chaos and madness
>     await thee at its end
>     - "Use the force Harry" - Gandalf, Star Trek II
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#9511):
>     https://lists.yoctoproject.org/g/meta-virtualization/message/9511
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-=
virtualization/message/9511__;!!AjveYdw8EvQ!b6v8XClxTwaU64yN-fkFEA4g-eB75=
KMSsC7-of29zkaaHfbTuhe6LKWRHTuicZrgIygs5doy8EGaOoHpSyGZb-tqVw$>
>     Mute This Topic:
>     https://lists.yoctoproject.org/mt/116993898/1050810
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/1169=
93898/1050810__;!!AjveYdw8EvQ!b6v8XClxTwaU64yN-fkFEA4g-eB75KMSsC7-of29zka=
aHfbTuhe6LKWRHTuicZrgIygs5doy8EGaOoHpSyGikUSK7g$>
>     Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>     <mailto:meta-virtualization%2Bowner@lists.yoctoproject.org>
>     Unsubscribe:
>     https://lists.yoctoproject.org/g/meta-virtualization/unsub
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-=
virtualization/unsub__;!!AjveYdw8EvQ!b6v8XClxTwaU64yN-fkFEA4g-eB75KMSsC7-=
of29zkaaHfbTuhe6LKWRHTuicZrgIygs5doy8EGaOoHpSyGROA2R9Q$>
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

--------------p2bPCdlRudH7RABHD5mNPgxn
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6044f1ZG2434532

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Hi Bruce,</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">Thanks a lot for your prompt response
      and efforts.</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">The BB_GIT_SHALLOW_EXTRA_REFS is the
      only one that actually breaks build.</div>
    <div class=3D"moz-cite-prefix">Switching to the tag parameter looks
      like a good approach.<br>
    </div>
    <div class=3D"moz-cite-prefix">In case you want to check if things
      work for that new approach:</div>
    <div class=3D"moz-cite-prefix"><span style=3D"font-size:11.0pt">1. Ad=
d
        in local.conf:</span></div>
    <div class=3D"moz-cite-prefix"><span style=3D"font-size:11.0pt">BB_GE=
NERATE_SHALLOW_TARBALLS
        =3D &quot;1&quot;</span></div>
    <div class=3D"moz-cite-prefix"><span style=3D"font-size:11.0pt">BB_GI=
T_SHALLOW
        =3D &quot;1&quot;</span> <br>
    </div>
    <div class=3D"moz-cite-prefix"><span style=3D"font-size:11.0pt">2.
        bitbake cni -c fetch</span></div>
    <div class=3D"moz-cite-prefix"><span style=3D"font-size:11.0pt"><br>
      </span></div>
    <div class=3D"moz-cite-prefix"><span style=3D"font-size:11.0pt">Regar=
ds,</span></div>
    <div class=3D"moz-cite-prefix"><span style=3D"font-size:11.0pt">Qi<br=
>
      </span></div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 12/30/25 20:33, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4OS8wGT5VG=3DuBpybZamkSWk=
4Mxv9ReUaGt2t3q8J80D5A@mail.gmail.com">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr">
          <div class=3D"gmail_default" style=3D"font-size:small"><br>
          </div>
        </div>
        <br>
        <div class=3D"gmail_quote gmail_quote_container">
          <div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 30, 2025 at
            12:11=E2=80=AFAM Bruce Ashfield via <a href=3D"https://urldef=
ense.com/v3/__http://lists.yoctoproject.org__;!!AjveYdw8EvQ!b6v8XClxTwaU6=
4yN-fkFEA4g-eB75KMSsC7-of29zkaaHfbTuhe6LKWRHTuicZrgIygs5doy8EGaOoHpSyFnCr=
b-Bg$" moz-do-not-send=3D"true">lists.yoctoproject.org</a>
            &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoctop=
roject.org" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">gmai=
l.com@lists.yoctoproject.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div dir=3D"ltr">
              <div dir=3D"ltr">
                <div style=3D"font-size:small"><br>
                </div>
              </div>
              <br>
              <div class=3D"gmail_quote">
                <div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 29, 202=
5
                  at 11:23=E2=80=AFPM Chen, Qi &lt;<a href=3D"mailto:Qi.C=
hen@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"mo=
z-txt-link-freetext">Qi.Chen@windriver.com</a>&gt;
                  wrote:<br>
                </div>
                <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                  <div>
                    <div lang=3D"EN-US">
                      <div>
                        <p class=3D"MsoNormal"><span style=3D"font-size:1=
1pt">Hi Bruce,</span></p>
                        <p class=3D"MsoNormal"><span style=3D"font-size:1=
1pt">&nbsp;</span></p>
                        <p class=3D"MsoNormal"><span style=3D"font-size:1=
1pt">The new go-mod-vcs
                            recently introduced in meta-virt &nbsp;has so=
me
                            some problems.</span></p>
                        <p class=3D"MsoNormal"><span style=3D"font-size:1=
1pt">&nbsp;</span></p>
                        <p class=3D"MsoNormal"><span style=3D"font-size:1=
1pt">The first and most
                            significant one is the misuse of
                            BB_GIT_SHALLOW_EXTRA_REFS. It causes
                            fetching failure when shallow tarball
                            generation is enabled.</span></p>
                      </div>
                    </div>
                  </div>
                </blockquote>
                <div><br>
                </div>
                <div>
                  <div style=3D"font-size:small">I wouldn't call it a
                    misuse, it is actually&nbsp;required&nbsp;to make the=
 support
                    work</div>
                  <div style=3D"font-size:small">and attempt to save some
                    download space. There are thousands of dependencies</=
div>
                  <div style=3D"font-size:small">for some of the recipes
                    and MANY of them have tags that aren't on branches,
                    or</div>
                  <div style=3D"font-size:small">aren't at the tip of
                    branches, so those refs are there to force a deep
                    enough fetch</div>
                  <div style=3D"font-size:small">or to ensure that bitbak=
e
                    does the same &quot;deshallowing&quot;&nbsp; as was d=
one during</div>
                  <div style=3D"font-size:small">generation.</div>
                  <div style=3D"font-size:small"><br>
                  </div>
                  <div style=3D"font-size:small">I could probably switch
                    it out for tag=3D in the different entries. I've made
                    that</div>
                  <div style=3D"font-size:small">tweak and will run some
                    tests.</div>
                  <br>
                </div>
                <div>&nbsp;</div>
                <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                  <div>
                    <div lang=3D"EN-US">
                      <div>
                        <p class=3D"MsoNormal"><span style=3D"font-size:1=
1pt"></span></p>
                        <p class=3D"MsoNormal"><span style=3D"font-size:1=
1pt">Use the following
                            steps to reproduce the error:</span></p>
                        <ol style=3D"margin-top:0in" start=3D"1" type=3D"=
1">
                          <li style=3D"margin-left:0in"><span style=3D"fo=
nt-size:11pt">Add in local.conf:</span></li>
                        </ol>
                        <p><span style=3D"font-size:11pt">BB_GENERATE_SHA=
LLOW_TARBALLS
                            =3D &quot;1&quot;</span></p>
                        <p><span style=3D"font-size:11pt">BB_GIT_SHALLOW =
=3D
                            &quot;1&quot;</span></p>
                        <ol style=3D"margin-top:0in" start=3D"2" type=3D"=
1">
                          <li style=3D"margin-left:0in"><span style=3D"fo=
nt-size:11pt">bitbake cni -c
                              fetch</span></li>
                        </ol>
                        <p class=3D"MsoNormal"><span style=3D"font-size:1=
1pt">&nbsp;</span></p>
                        <p class=3D"MsoNormal"><span style=3D"font-size:1=
1pt">Error message: fatal:
                            couldn't find remote ref v0.0.4</span></p>
                        <p class=3D"MsoNormal"><span style=3D"font-size:1=
1pt">Root cause: the repos
                            specified in SRC_URI does not contain the
                            required extra refs specified by&nbsp;</span>=
<span style=3D"font-size:14.6667px">BB_GIT_SHALLOW_EXTRA_REFS</span><span=
 style=3D"font-size:11pt">.</span></p>
                      </div>
                    </div>
                  </div>
                </blockquote>
                <div>
                  <div style=3D"font-size:small">I run with that all the
                    time, I've never seen it, those&nbsp;<span style=3D"f=
ont-size:14.6667px">BB_GIT_SHALLOW_EXTRA_REFS
                      are</span></div>
                  <div style=3D"font-size:small">not magic, they come
                    directly from the repositories during discovery and
                    are required to deshallow</div>
                  <div style=3D"font-size:small">a repository.</div>
                </div>
                <div style=3D"font-size:small"><br>
                </div>
                <div style=3D"font-size:small">My tests with the tag
                  parameter may solve the issue. So stay tuned, I have
                  that and several other</div>
                <div style=3D"font-size:small">changes pending. But none
                  of them will be until the end of next week once I am
                  back in the office.</div>
                <div>&nbsp;</div>
                <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                  <div>
                    <div lang=3D"EN-US">
                      <div>
                        <p class=3D"MsoNormal"><span style=3D"font-size:1=
1pt"></span></p>
                        <p class=3D"MsoNormal"><span style=3D"font-size:1=
1pt">&nbsp;</span></p>
                        <p class=3D"MsoNormal"><span style=3D"font-size:1=
1pt">The second one is the
                            duplicate entries in SRC_URI. Example:
                            errdefs in docker-compose.</span></p>
                        <p class=3D"MsoNormal"><span style=3D"font-size:1=
1pt">&nbsp;</span></p>
                      </div>
                    </div>
                  </div>
                </blockquote>
                <div><br>
                </div>
                <div>
                  <div style=3D"font-size:small">It builds fine here, wha=
t
                    issues are you seeing with it ? Are you using VCS</di=
v>
                </div>
                <div style=3D"font-size:small">mode ? or hybrid ?</div>
              </div>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class=3D"gmail_default" style=3D"font-size:small">There =
are
              multiple places that the vcs generator looks for (and
              removes duplicates).</div>
            <div class=3D"gmail_default" style=3D"font-size:small">I adde=
d
              another and am testing it. So once I fix the shallow clone
              logic, I can push</div>
            <div class=3D"gmail_default" style=3D"font-size:small">this a=
s
              well.</div>
            <div class=3D"gmail_default" style=3D"font-size:small"><br>
            </div>
            <div class=3D"gmail_default" style=3D"font-size:small">I was
              able to build both modes locally, so it is a cosmetic fix,
              but worth&nbsp;doing.</div>
            <div class=3D"gmail_default" style=3D"font-size:small"><br>
            </div>
            <div class=3D"gmail_default" style=3D"font-size:small">Cheers=
,</div>
            <div class=3D"gmail_default" style=3D"font-size:small"><br>
            </div>
            <div class=3D"gmail_default" style=3D"font-size:small">Bruce<=
/div>
            <br>
          </div>
          <div>&nbsp;</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div dir=3D"ltr">
              <div class=3D"gmail_quote">
                <div style=3D"font-size:small"><br>
                </div>
                <div style=3D"font-size:small">You can be assured that
                  anything I pushed has been built many times, and has</d=
iv>
                <div style=3D"font-size:small">been runtime tested. So th=
e
                  first information you need to provide is more details</=
div>
                <div style=3D"font-size:small">about what you are
                  building, so I can track down the differences.</div>
                <div>&nbsp;</div>
                <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                  <div>
                    <div lang=3D"EN-US">
                      <div>
                        <p class=3D"MsoNormal"><span style=3D"font-size:1=
1pt"></span></p>
                        <p class=3D"MsoNormal"><span style=3D"font-size:1=
1pt">The third one is the
                            =E2=80=98shallow=3D1=E2=80=99 parameter in SR=
C_URI. The
                            problem is that git fetcher does not support
                            such parameter.</span></p>
                        <p class=3D"MsoNormal"><span style=3D"font-size:1=
1pt">In fetch2/<a href=3D"https://urldefense.com/v3/__http://git.py__;!!A=
jveYdw8EvQ!b6v8XClxTwaU64yN-fkFEA4g-eB75KMSsC7-of29zkaaHfbTuhe6LKWRHTuicZ=
rgIygs5doy8EGaOoHpSyFfHig6fg$" moz-do-not-send=3D"true">git.py</a>:
                            ud.shallow =3D d.getVar(&quot;BB_GIT_SHALLOW&=
quot;) =3D=3D
                            &quot;1&quot;</span></p>
                        <p class=3D"MsoNormal"><span style=3D"font-size:1=
1pt">So I guess these
                            could be removed? And switching to use
                            BB_GIT_SHALLOW:pn-xxx =3D =E2=80=9C1=E2=80=9D=
?</span></p>
                      </div>
                    </div>
                  </div>
                </blockquote>
                <div><br>
                </div>
                <div>
                  <div style=3D"font-size:small">No. I plan to add more
                    support for that later, it just isn't ready yet.
                    They will stay.<br>
                    <br>
                  </div>
                </div>
                <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                  <div>
                    <div lang=3D"EN-US">
                      <div>
                        <p class=3D"MsoNormal"><span style=3D"font-size:1=
1pt"></span></p>
                        <p class=3D"MsoNormal"><span style=3D"font-size:1=
1pt">&nbsp;</span></p>
                        <p class=3D"MsoNormal"><span style=3D"font-size:1=
1pt">P.S.</span></p>
                        <p class=3D"MsoNormal"><span style=3D"font-size:1=
1pt">I sent a related
                            patch to bitbake:
                            <a href=3D"https://urldefense.com/v3/__https:=
//lists.openembedded.org/g/bitbake-devel/message/18656__;!!AjveYdw8EvQ!b6=
v8XClxTwaU64yN-fkFEA4g-eB75KMSsC7-of29zkaaHfbTuhe6LKWRHTuicZrgIygs5doy8EG=
aOoHpSyG2hk9-1g$" target=3D"_blank" moz-do-not-send=3D"true">https://list=
s.openembedded.org/g/bitbake-devel/message/18656</a></span></p>
                        <p class=3D"MsoNormal"><span style=3D"font-size:1=
1pt">The problem in
                            bitbake is revealed by the current SRC_URI
                            settings in meta-virt.</span></p>
                        <p class=3D"MsoNormal"><span style=3D"font-size:1=
1pt">If you get similar
                            error, you can apply the above patch.</span><=
/p>
                      </div>
                    </div>
                  </div>
                </blockquote>
                <div><br>
                </div>
                <div>
                  <div style=3D"font-size:small">If I was going to see
                    that error, I would have already ...</div>
                  <div style=3D"font-size:small"><br>
                  </div>
                  <div style=3D"font-size:small">Bruce</div>
                  <br>
                </div>
                <div>&nbsp;</div>
                <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                  <div>
                    <div lang=3D"EN-US">
                      <div>
                        <p class=3D"MsoNormal"><span style=3D"font-size:1=
1pt"></span></p>
                        <p class=3D"MsoNormal"><span style=3D"font-size:1=
1pt">&nbsp;</span></p>
                        <p class=3D"MsoNormal"><span style=3D"font-size:1=
1pt">Regards,</span></p>
                        <p class=3D"MsoNormal"><span style=3D"font-size:1=
1pt">Qi</span></p>
                      </div>
                    </div>
                  </div>
                </blockquote>
              </div>
              <div><br clear=3D"all">
              </div>
              <div><br>
              </div>
              <span class=3D"gmail_signature_prefix">-- </span><br>
              <div dir=3D"ltr" class=3D"gmail_signature">- Thou shalt not
                follow the NULL pointer, for chaos and madness await
                thee at its end<br>
                - &quot;Use the force Harry&quot; - Gandalf, Star Trek II=
<br>
                <br>
              </div>
            </div>
            <br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#9511): <a href=3D"https://urldefense.com/=
v3/__https://lists.yoctoproject.org/g/meta-virtualization/message/9511__;=
!!AjveYdw8EvQ!b6v8XClxTwaU64yN-fkFEA4g-eB75KMSsC7-of29zkaaHfbTuhe6LKWRHTu=
icZrgIygs5doy8EGaOoHpSyGZb-tqVw$" rel=3D"noreferrer" target=3D"_blank" mo=
z-do-not-send=3D"true">https://lists.yoctoproject.org/g/meta-virtualizati=
on/message/9511</a><br>
            Mute This Topic: <a href=3D"https://urldefense.com/v3/__https=
://lists.yoctoproject.org/mt/116993898/1050810__;!!AjveYdw8EvQ!b6v8XClxTw=
aU64yN-fkFEA4g-eB75KMSsC7-of29zkaaHfbTuhe6LKWRHTuicZrgIygs5doy8EGaOoHpSyG=
ikUSK7g$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">h=
ttps://lists.yoctoproject.org/mt/116993898/1050810</a><br>
            Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@li=
sts.yoctoproject.org" target=3D"_blank" moz-do-not-send=3D"true">meta-vir=
tualization+owner@lists.yoctoproject.org</a><br>
            Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://l=
ists.yoctoproject.org/g/meta-virtualization/unsub__;!!AjveYdw8EvQ!b6v8XCl=
xTwaU64yN-fkFEA4g-eB75KMSsC7-of29zkaaHfbTuhe6LKWRHTuicZrgIygs5doy8EGaOoHp=
SyGROA2R9Q$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a>
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
    <p><br>
    </p>
  </body>
</html>

--------------p2bPCdlRudH7RABHD5mNPgxn--

