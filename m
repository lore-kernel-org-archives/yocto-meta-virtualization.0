Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD32CAC59A
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 10:18:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12896.1758277098288066946
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 19 Sep 2025 03:18:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eyd66DS/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1357ce531b=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58J5P29A1134002
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 19 Sep 2025 10:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=gLFGb8ZKYkMJmaYU8+LS4S
	6YLTw5/eu79lpijSByiKA=; b=eyd66DS/Duky/NEUbuovdSnvKbNRdfIHfXOnua
	33tV7baLzzpCNaV5CuoB8JgNcCEHNWVipi0y7DIxGPkb2H/G1ro7/xZKTcy7BuVG
	gYCA9hmCVgIs2MHsc21Mi3paZN4OTyEbVeUudxy4G59Urx25T/aM4LaEfVJJp/ny
	M7Y68hlU5mkX6uH0iz2wol/Rp6NWr7UZGDXeJIt+VuttD0iE0lI/M3LHMiL81pwU
	RcK5f6eAtm3DVdf02yLqpWYRHE5xvIOftylwCM3tJUp4Lv+hsCQJC3pnusfsS697
	6r3Wi8J7COG77AskHXwnu07j808X9/Y6WTEuGpJ16ep2Dk0w==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012036.outbound.protection.outlook.com [40.107.209.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 498vmrgcwy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 19 Sep 2025 10:18:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lpJj9CyMDM1bqW1oUdlCnHsmYSVtotFSGRFyitbGI5PCAWgFGV5WdTiK/R62P5xaEHZPIHhBg8RhyFzinj5vnYJ/DnjEf1gZ3Rf6LoAsQjr5iSR0S/jRVKckWYoKlnPh4CGlugFFX/YIrf6nJzIGiifZDrDadh3oa7xjQ6+bfDwl6rGj3MOIxLcSeg5K1VZ3cC7EcLCrNejcsn7M8chWRNIQtYfZpMSU4EFUY8op2kISxbWiFLdcL/4zx34LXgjMbPkuc+MkR4NhWb1Ufpy8T2wWOWRPS2C9Q76rbXErNQhSHY/hfJuzG5uX8Xwn9mPH472wUQd4QIiqPTgXD1u68g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLFGb8ZKYkMJmaYU8+LS4S6YLTw5/eu79lpijSByiKA=;
 b=Yvq6HcGRHky+ksTu23d8DW3ODQMwpVnQPkBzrgfgpPdsnokvCWa6XkZUtbIWN+p/XI/RJWiNzxB3a/v3ALUShbx3LZ+bl9n7DAKA2bpjO4WOJR3tdsa0QW4iyCTTp/ITFAu8pmbXByH/iqJ+CbByv2UMuZ9wpnTmdLrZ3en04O/jTzrBSDoqmCw7BHzqomnGThrJjv1aQbM7oL/+CevuVgRNzmWm3VdNC+yIv9jIqILLiF4Ek50VD7DrK5R3Jh0CgKAg+oLkhXrPCfF+kVii3wRaZa315u4KdFl2fqKp5F4fjoiyY9mnparBaU0oWVPiB+YRrnxkmoiaPxO2lB/PSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY8PR11MB7169.namprd11.prod.outlook.com (2603:10b6:930:90::14)
 by PH8PR11MB6949.namprd11.prod.outlook.com (2603:10b6:510:227::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Fri, 19 Sep
 2025 10:18:14 +0000
Received: from CY8PR11MB7169.namprd11.prod.outlook.com
 ([fe80::3f03:81e3:3649:d171]) by CY8PR11MB7169.namprd11.prod.outlook.com
 ([fe80::3f03:81e3:3649:d171%5]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 10:18:14 +0000
Content-Type: multipart/alternative;
 boundary="------------0kVK7dH6a2GJeRK0Whpw9WTf"
Message-ID: <9c1bf98b-53b2-477e-938a-3a978fb8ad1f@windriver.com>
Date: Fri, 19 Sep 2025 15:43:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][scarthgap][PATCH 1/2] podman: fix
 CVE-2024-9407
Content-Language: en-GB
To: meta-virtualization@lists.yoctoproject.org
References: <20250916052515.891345-1-yogita.urade@windriver.com>
 <aMzCwxyq0uVpLCz0@gmail.com> <1866A68CBBDAFA42.22280@lists.yoctoproject.org>
From: "Urade, Yogita" <yogita.urade@windriver.com>
In-Reply-To: <1866A68CBBDAFA42.22280@lists.yoctoproject.org>
X-ClientProxiedBy: PN4P287CA0108.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:276::11) To CY8PR11MB7169.namprd11.prod.outlook.com
 (2603:10b6:930:90::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7169:EE_|PH8PR11MB6949:EE_
X-MS-Office365-Filtering-Correlation-Id: ed3e7563-706c-4127-4a04-08ddf765d7a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|366016|376014|52116014|13003099007|8096899003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WnAvcnhhRDFmbS9odGlVODlxZXh6ZVFWWXM0UFdKWjFNS0dJcHZYSmF6d01E?=
 =?utf-8?B?TDFlejFrMkRYUUtzRWRIYU5UblJJVkVadlFiUENXLzFCOWVHOENmdk1OQXdj?=
 =?utf-8?B?SG0xOFNTdW5BN1V2YWxiQm5mb1ZJZGVIYk1zZi8ybHNWa01JbW5MRk5maDlS?=
 =?utf-8?B?MTg2R2x3VEZpeHREN1pMaldWdlhBZk9YaUJIdllMTmNFeXBRN2paRFh0OTRh?=
 =?utf-8?B?Y2NDRHpXaXA0SGRQYWN0c01aRTRXOHpvMHkraCtzMi82c3VMQkRwelhxMHd1?=
 =?utf-8?B?a1p3L0J0VkVXTnRXVEt3K0s3RTJZMkVVOWpKbTBvYmdUMHFxcWUwMUxwQ2dC?=
 =?utf-8?B?aGhRZXZyclQvcG05TkozY1JQcGFMSmQyTlNRVmF2NjhGMTV3TzcyQUo0SVBY?=
 =?utf-8?B?V0l5dFpPWnhZczNiVkkydVFTdVRXTDJ2VytaMG1CaGI4VkJzOHRsVVJ5bVRU?=
 =?utf-8?B?R281VWxGZEtLOEh1UTN1SVJsRDVBc0l0TkpiN2FvaTd2VmI1R3VibWl5OUNZ?=
 =?utf-8?B?VmJUcEpnVVZ4U3B3dzBoVjhZZ3Y2WnBsM3JGNCtKNGljOW5ueGVzd2dmWmpS?=
 =?utf-8?B?b054cDVpUThiaDJMdG1PeUtJbjFOWlIzSWplb0V2aFFSWW9zVnd3WkpsZVZQ?=
 =?utf-8?B?VXVKSHhjS2xUeUErdHpGazVNd01meVBZVlR3Z3YrTm1Iak5objZRdktpNytS?=
 =?utf-8?B?RHBlblI1dldHcmtEeENNYXluTDFrYXlhSXhDazZQY2NNRU13SE03QUZ4WW8v?=
 =?utf-8?B?Qjk4b3BMb1dHZ0Y0Zzh1eitvWnZOUmxHNkhWK284dWV4SDl1MmFTNFpxYWpu?=
 =?utf-8?B?b1lRZi9UNjlTSkx3L0dTd1FDNFdpS0tlS3lZSzJDMHpUaEo0RExWOG43c2ll?=
 =?utf-8?B?QVFrNzlTVE9JY0Y1Q0YxdTUvdEpGZEgxbFErbjVRUkkvTE1RaVBQQ1JuREJZ?=
 =?utf-8?B?VSthQWpaOVZEQnFZRjVGUmVsOUVXRVBLanp6eVJ6M3BiWVJCd3lxMEcxTThN?=
 =?utf-8?B?cHVvc0RUTUhuRU5POUZsTjRUaERLMWtBTjlIMUkrTjB3bnF6MWFsSU9FT2dP?=
 =?utf-8?B?RVZtZmNTbldhTmVIdkw1c2NYZzVlR2FqTG13bzBnUjhpZXFaU1A5S2RYdEFC?=
 =?utf-8?B?V0RNeU0xQkdPOENNNlJVckYybmxselVnK1B6R1NZWGRpWFJVaFRIZzRNeVlr?=
 =?utf-8?B?Zjg2cWFtOU5WY2s0UDdiODc4ejRHNGN3d1NncS81cjFRSFBSdFMzRTN5UmN0?=
 =?utf-8?B?eEFiOE1iSStUZDNjaDNBSWhReWZnOXVOcEtaVkdBQmZIdDcwT1FNa2NyU1BC?=
 =?utf-8?B?VmVlcGxTODkySEJTOGdWektlTlVBZGFHSitzQXVTRk44M0o0dVlsUEx1dG1B?=
 =?utf-8?B?a2VXTmRIUkw2SUlrZVJ5VktoaWZtTDRjMnNPcTRyMUN4ZDF5Vko2bXlndXFW?=
 =?utf-8?B?c0R4Y0pWZmRFejIyZGVSWnBVaVdRZXhsRnBJTVM0YkJNRkFMbnBQeWVZUldh?=
 =?utf-8?B?S283Rk1KdDhCamxvYTVrNThSWlhMTERxVDg1U2hVVldqWEdJMmtpd3RRWE9Q?=
 =?utf-8?B?ejlEcStWK0lDOTVuRktGaFpmVUE1MUgraXI2bS9xTVZ0T2ExY2pWbHhVbmds?=
 =?utf-8?B?K2ZMbWM5cUtsM0lXS05IVTF2eWJBZ25TRlI1WGRBOVkzTVR6YWVWOXRJOEc1?=
 =?utf-8?B?UldTa21LUkpQZHliV1crZ3ZzVUltdTNyWjd3TzUrNjVCWFg3ZGpOZXNXV2J1?=
 =?utf-8?B?WHpyVFVlSkpKNXU2YjNKbUpQRGNwa21BZlEzMkM0UU13RGYyTVk0THZ2d1dJ?=
 =?utf-8?B?ZG9MUFFoOE5ReDBDTjUyeFBpYUpvRVZVQ1NsRWc1c3phM1VJM0lLUzVuL1Yz?=
 =?utf-8?B?Zk92QXZQaHJwd0hjWi8zMTZiWkJmVmJVbE9oNncwTm1yS2JPeEExcWZuR3dG?=
 =?utf-8?Q?QUw7r6Hsyi6o0ZTUeI89vTssLTzRgKlQ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7169.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014)(52116014)(13003099007)(8096899003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NmtLY0FTOTVrWFRWandlSXl2R1M3ZThCVGMwKzZpL3U5VmhGYXJMV0d4TkFm?=
 =?utf-8?B?YXc1UWY4QWZyY0VuSklBbXVpd3p4bmNHcE1XSm8zNk0xUXpwUlhOY2ZiTHFj?=
 =?utf-8?B?RnFWZ29wVjRucDhjVkUzZjkrOEJjRDN5YWxvbXRlSGJjaFcvYWlkcXMrSzVo?=
 =?utf-8?B?Nm1IT1d6QjV1RmlRaVJjQmExOUpNN0R5Q3BLOWtmSFJwVW12U01qOGViN1Ns?=
 =?utf-8?B?MXh4UnJxNnlvalVxRnZzYndsa09DU2RsNG95M08yc0tGU25maHFSZ21SOHZ0?=
 =?utf-8?B?QXhPOThDN3hhS0N1R1A1OXZaRjRUWmd4SVRTcURESWNBZWpqK1Uzcy9neGc5?=
 =?utf-8?B?Y3Q0Mjl0UFlrMDA2SUNhUnJ3dGh0UXFXVnRSZVFRYkhpbzNhM2Y2eXNFNjFk?=
 =?utf-8?B?c21NVHRsR29SKzF1M3hEcE1EMDVrUVFZcEtYUzVnOGVSSzlOZldiVjQxSWhZ?=
 =?utf-8?B?dE1PckJFbFdUSkZ6OW85VFg1bVA0ZmpDTVNVdUtTcS8yZ1BCdEZ2VXhCa2Rj?=
 =?utf-8?B?SC9LeVJrSkcvTytFY1J3anFuM2lCRzhySk1PZVQ2VkhhSVJ5WUpURjlZNkVa?=
 =?utf-8?B?ZkVxbDZaUWY5N0F2endoQ2s5ZmxTa0VWdnJ0UDB6N1hYVS9JdmVpcFZJYUVa?=
 =?utf-8?B?Mk56dVowVmU2TlIrWVVWbldENVZKekVzYTdxUDRuUnF5UXVsZGhVbnNSNEJr?=
 =?utf-8?B?cExxaTVGQzc4cC8vZzhrQzZEbllnVVdEazFWVmw1R0UyOThBOXBVUUdSSGRs?=
 =?utf-8?B?RldvSFZVQkVIM1Z3QXhxQTJCbmpBdHhmbnMyY1VEbmp4WlFMRzFTVUdpSktW?=
 =?utf-8?B?cFFKNnpqRXVlV2Z2NWNWbkJWb2VuQ2Rzek5CUklyZmFBNTk1N29oOS9IN1lG?=
 =?utf-8?B?Y254QTJ1bE9sTUJ0V05ad2xJaG0vTkNPckhHaXA2V1NvbkFNS3pIZlBqVzR1?=
 =?utf-8?B?MWk0QVllbi90dk1INFQ4RXlZOUlBY3dENlV2cGZpQjBRSUZ3MFg2a0tmdG0x?=
 =?utf-8?B?YXZVZHNYa3VZbXhOWHU4L2tyckZRUkdYTkxST3ZBY1NDUlpWVndqa0NIVmdp?=
 =?utf-8?B?eFQ5NzB3SGFpc09tUmVlVE1Na2dUdG1nU1p0cjRtTjVJZWdId2tZK1ZTdTVW?=
 =?utf-8?B?VVFZQWNObkF5bnNLSFRoTlFZT2lWeXZ0TS9aUXpxZ3VOUnA3SnBxTU1EOWtK?=
 =?utf-8?B?cktyRFpzZ2F3bEFlU2ZoOWUrU3pwd2MwMnFqUnVCQjdiaHZqbzlUTnF4eld4?=
 =?utf-8?B?NmMxdzdwVmY4WjVzRWtOeWoxSkFVTjlseFVTaVNaM3pHNno1RFRoSVJ4elBC?=
 =?utf-8?B?ZmF3RWNpMW83a2wwcWh3RGFKdnh5TllNbEpIT1ltYXBqUXRuRlVSLzlGNHBT?=
 =?utf-8?B?Ny9KSG51OXFpMlZkb04wM2lydm1mN25tZU14d1gwY2dLVGZyVWFQbFhJUVc3?=
 =?utf-8?B?a1JEb0ZKZjRTeXVWbjdjTnQ2alZVdW0xa3pOT0ZxWEdjOXVmMHJxVW9lS0l4?=
 =?utf-8?B?NFRyN3FYK2k0UDREdlp3cGE2dVQ2bXRnV1prZk1ubks5OGIzMXcxQzMwWFp1?=
 =?utf-8?B?clM3aWV3VGEyNEJNcXE0b2djR2dQQzB3alFxb09oUGo3emxHZ1hpVDBnTEd6?=
 =?utf-8?B?N1owZTZwcnNoM1VHYWZ5VDVwZlcrbWtvTVI3cGgvS3VJdFVGaHRWZWUrUlpp?=
 =?utf-8?B?MGc3YlZPYko5YjNraWM1YzJOeSt3NnVTRnYzcjRKVGw5eSthTmo2anVyREtm?=
 =?utf-8?B?d1V1d1ZXQ1NPSFFEbDdsSmtaR09QaHQrZWVrdkFyb3l5RUcyb0FjZ2k4VUdG?=
 =?utf-8?B?TngyaW5CTURINWZ6RXBYb1hJaHdFcllTU0pUVDJ5MVRSYkZmRXVlNmdNRkw4?=
 =?utf-8?B?SXFNWTNJZFdsTUY3WTdoSVk4K3JlcVFvN0g0VWM0RVV3dElubFNMRXhrVXZj?=
 =?utf-8?B?bjhMcDIxaHhUWTltSWN6Q0MybW4xR2VRdExWb3pSa2RSZzVrZkxEREQwUkJY?=
 =?utf-8?B?WGp3c3F0SW1hM0Z5R1VXQ0tYRFdjYko1UVAxV0F4dGhmcUhIWEhweUkrbE5Y?=
 =?utf-8?B?SlFSRHU3bDBHcm1wRStvbWtGa0haMGduYzQwNXpqM3RVZEtRdHNtKzBlbExi?=
 =?utf-8?B?ZTVmVktUZTRuNzRCUGtBU2FUcnZNNGd4SXR0TUV4eHUyYVJWb2pIdzExNExH?=
 =?utf-8?B?RXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed3e7563-706c-4127-4a04-08ddf765d7a0
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7169.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 10:18:14.0185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qHh14Uz8/7/A0DXy6sxlKvhKwUcuAemFZN7qN+Mtv29YmrcRzCs45wTBTPwFN8xFDCW2Z1lr/nDREPvActHGipr7XrXXcxxY9Q6IaRCSdJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6949
X-Authority-Analysis: v=2.4 cv=ZP7XmW7b c=1 sm=1 tr=0 ts=68cd2de8 cx=c_pps
 a=1PQ19NIIScYLh/jfzFkFww==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=PYnjg3YJAAAA:8
 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=EJhI8zoJhYlHZhFclbYA:9
 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=hjFIUX7QysRftYhKoZEA:9
 a=hh309z2zWfjuHwlT:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDA5NCBTYWx0ZWRfXxKSaopumq2yR
 klTkoqVExYWAz9goqFU4icIO6YXExI/0XGWN1H/vFL/WD2X1QhNul0G3N5gDkjdKWxXbHPcm2hF
 geH3Wgu5NnDvCBk+1eMNWOTZQzgla4oeSBOnBfVOIk4Q0JOmgEcnO/7vlkeOQZzUHTiFXu+mlpg
 qb/I4+HtGmIq1G0a4o82Y8UdEyVie3IbZjme7QgNn2pc4W+bfHNQMqGhsJnu19wgXObYx0tXLso
 dl3f8jwfODFKrZ5hKfsEd/B9HdHcWmu7jrxjR41n7ByrFPImbsFJeFDYTV4JpwPMvMfTvY/9S6P
 KepHjYD2J+D5PKkYFqW2l8GG5uv0jv667zbACNrPtWOXrJMfFFoEZSBOQ+EqCQ=
X-Proofpoint-GUID: wPMXuZlRbsLXC8G9V0HvpmI5V04HHIcW
X-Proofpoint-ORIG-GUID: wPMXuZlRbsLXC8G9V0HvpmI5V04HHIcW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 19 Sep 2025 10:18:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9408

--------------0kVK7dH6a2GJeRK0Whpw9WTf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

For buildah, current recipe version is 1.34.3.

Earliest fixed version is 1.37.3
So should I upgrade from 1.34.4 to 1.37.3 (Changelog: 
https://github.com/containers/buildah/compare/v1.34.3...v1.37.4)

../Yogita

On 19-09-2025 15:21, Urade, Yogita via lists.yoctoproject.org wrote:
>
> Current podman recipe version is 5.0.1.
>
> The latest stable version of 5.0.x is 5.0.3 which did not contain the 
> fix for this issue.
>
> Earliest fixed version is 5.2.4.
> So should I do upgrade from 5.0.1 to 5.2.4 (Changelog: 
> https://github.com/containers/podman/compare/v5.0.1...v5.2.4)
>
> ../Yogita
>
> On 19-09-2025 08:11, Bruce Ashfield wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>
>> The same question needs to be answered for all of these CVE
>> patches (send a v2).
>>
>> What release was the fix/commit introduced, and show that
>> you've checked to see if there's a release branch equivalent
>> for the version we are patching.
>>
>> Version bumps (within the -stable branch policy of 3rd digit
>> or no major updates) are much preferred to patches.
>>
>> Bruce
>>
>> In message: [meta-virtualization][scarthgap][PATCH 1/2] podman: fix CVE-2024-9407
>> on 16/09/2025 Urade, Yogita via lists.yoctoproject.org wrote:
>>
>>> From: Yogita Urade<yogita.urade@windriver.com>
>>>
>>> A vulnerability exists in the bind-propagation option of the
>>> Dockerfile RUN --mount instruction. The system does not properly
>>> validate the input passed to this option, allowing users to pass
>>> arbitrary parameters to the mount instruction. This issue can be
>>> exploited to mount sensitive directories from the host into a
>>> container during the build process and, in some cases, modify the
>>> contents of those mounted files. Even if SELinux is used, this
>>> vulnerability can bypass its protection by allowing the source
>>> directory to be relabeled to give the container access to host files.
>>>
>>> Reference:
>>> https://nvd.nist.gov/vuln/detail/CVE-2024-9407
>>>
>>> Upstream patch:
>>> https://github.com/containers/podman/commit/2b2c7a89586d0e495b6bc5cc5687bab79162118e
>>>
>>> Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
>>> ---
>>>   .../podman/podman/CVE-2024-9407.patch         | 58 +++++++++++++++++++
>>>   recipes-containers/podman/podman_git.bb       |  1 +
>>>   2 files changed, 59 insertions(+)
>>>   create mode 100644 recipes-containers/podman/podman/CVE-2024-9407.patch
>>>
>>> diff --git a/recipes-containers/podman/podman/CVE-2024-9407.patch b/recipes-containers/podman/podman/CVE-2024-9407.patch
>>> new file mode 100644
>>> index 00000000..397cd362
>>> --- /dev/null
>>> +++ b/recipes-containers/podman/podman/CVE-2024-9407.patch
>>> @@ -0,0 +1,58 @@
>>> +From 2b2c7a89586d0e495b6bc5cc5687bab79162118e Mon Sep 17 00:00:00 2001
>>> +From: Matt Heon<mheon@redhat.com>
>>> +Date: Tue, 1 Oct 2024 12:38:45 -0400
>>> +Subject: [PATCH] Validate the bind-propagation option to `--mount`
>>> +
>>> +Similar to github.com/containers/buildah/pull/5761 but not
>>> +security critical as Podman does not have an expectation that
>>> +mounts are scoped (the ability to write a --mount option is
>>> +already the ability to mount arbitrary content into the container
>>> +so sneaking arbitrary options into the mount doesn't have
>>> +security implications). Still, bad practice to let users inject
>>> +anything into the mount command line so let's not do that.
>>> +
>>> +Signed-off-by: Matt Heon<mheon@redhat.com>
>>> +
>>> +CVE: CVE-2024-9407
>>> +Upstream-Status: Backport [https://github.com/containers/podman/commit/2b2c7a89586d0e495b6bc5cc5687bab79162118e]
>>> +
>>> +Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
>>> +---
>>> + pkg/specgenutil/volumes.go  | 6 ++++++
>>> + test/e2e/run_volume_test.go | 4 ++++
>>> + 2 files changed, 10 insertions(+)
>>> +
>>> +diff --git a/pkg/specgenutil/volumes.go b/pkg/specgenutil/volumes.go
>>> +index c481867163..5618b2d342 100644
>>> +--- a/pkg/specgenutil/volumes.go
>>> ++++ b/pkg/specgenutil/volumes.go
>>> +@@ -272,6 +272,12 @@ func parseMountOptions(mountType string, args []string) (*spec.Mount, error) {
>>> +                     if !hasValue {
>>> +                             return nil, fmt.Errorf("%v: %w", name, errOptionArg)
>>> +                     }
>>> ++                        switch value {
>>> ++                    case "shared", "rshared", "private", "rprivate", "slave", "rslave", "unbindable", "runbindable":
>>> ++                            // Do nothing, sane value
>>> ++                    default:
>>> ++                            return nil, fmt.Errorf("invalid value %q", arg)
>>> ++                    }
>>> +                     mnt.Options = append(mnt.Options, value)
>>> +             case "consistency":
>>> +                     // Often used on MACs and mistakenly on Linux platforms.
>>> +diff --git a/test/e2e/run_volume_test.go b/test/e2e/run_volume_test.go
>>> +index 4e777d62ef..5b256c9255 100644
>>> +--- a/test/e2e/run_volume_test.go
>>> ++++ b/test/e2e/run_volume_test.go
>>> +@@ -112,6 +112,10 @@ var _ = Describe("Podman run with volumes", func() {
>>> +             session.WaitWithDefaultTimeout()
>>> +             Expect(session).To(ExitWithError())
>>> +
>>> ++            session = podmanTest.Podman([]string{"run", "--rm", "--mount", "type=bind,src=/tmp,target=/tmp,bind-propagation=fake", ALPINE, "true"})
>>> ++            session.WaitWithDefaultTimeout()
>>> ++            Expect(session).To(ExitWithError())
>>> ++
>>> +             session = podmanTest.Podman([]string{"run", "--rm", "--mount", "type=tmpfs,target=/etc/ssl,notmpcopyup", ALPINE, "ls", "/etc/ssl"})
>>> +             session.WaitWithDefaultTimeout()
>>> +             Expect(session).Should(ExitCleanly())
>>> +--
>>> +2.40.0
>>> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
>>> index ef9798f0..4086298f 100644
>>> --- a/recipes-containers/podman/podman_git.bb
>>> +++ b/recipes-containers/podman/podman_git.bb
>>> @@ -24,6 +24,7 @@ SRC_URI = " \
>>>       file://0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch;patchdir=src/import/vendor/github.com/containers/storage \
>>>       file://CVE-2025-6032.patch;patchdir=src/import \
>>>       file://CVE-2024-9341.patch;patchdir=src/import \
>>> +file://CVE-2024-9407.patch;patchdir=src/import \
>>>   "
>>>
>>>   LICENSE = "Apache-2.0"
>>> --
>>> 2.40.0
>>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9407):https://lists.yoctoproject.org/g/meta-virtualization/message/9407
> Mute This Topic:https://lists.yoctoproject.org/mt/115268579/7312273
> Group Owner:meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe:https://lists.yoctoproject.org/g/meta-virtualization/unsub [Yogita.Urade@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------0kVK7dH6a2GJeRK0Whpw9WTf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html data-lt-installed="true"><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body style="padding-bottom: 1px;">
    <p>For buildah, current recipe version is 1.34.3.</p>
    <p>Earliest fixed version is 1.37.3<br>
      So should I upgrade from 1.34.4 to 1.37.3 (Changelog:
      <a class="moz-txt-link-freetext" href="https://github.com/containers/buildah/compare/v1.34.3...v1.37.4">https://github.com/containers/buildah/compare/v1.34.3...v1.37.4</a>)</p>
    <p>../Yogita</p>
    <div class="moz-cite-prefix">On 19-09-2025 15:21, Urade, Yogita via
      lists.yoctoproject.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1866A68CBBDAFA42.22280@lists.yoctoproject.org">
      
      <p>Current podman recipe version is 5.0.1.</p>
      <p>The latest stable version of 5.0.x is 5.0.3 which did not
        contain the fix for this issue.<br>
      </p>
      <p>Earliest fixed version is 5.2.4.<br>
        So should I do upgrade from 5.0.1 to 5.2.4 (Changelog: <a class="moz-txt-link-freetext" href="https://github.com/containers/podman/compare/v5.0.1...v5.2.4" moz-do-not-send="true">https://github.com/containers/podman/compare/v5.0.1...v5.2.4</a>)</p>
      <p>../Yogita</p>
      <div class="moz-cite-prefix">On 19-09-2025 08:11, Bruce Ashfield
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:aMzCwxyq0uVpLCz0@gmail.com">
        <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

The same question needs to be answered for all of these CVE
patches (send a v2).

What release was the fix/commit introduced, and show that
you've checked to see if there's a release branch equivalent
for the version we are patching.

Version bumps (within the -stable branch policy of 3rd digit
or no major updates) are much preferred to patches.

Bruce

In message: [meta-virtualization][scarthgap][PATCH 1/2] podman: fix CVE-2024-9407
on 16/09/2025 Urade, Yogita via lists.yoctoproject.org wrote:

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">From: Yogita Urade <a class="moz-txt-link-rfc2396E" href="mailto:yogita.urade@windriver.com" moz-do-not-send="true">&lt;yogita.urade@windriver.com&gt;</a>

A vulnerability exists in the bind-propagation option of the
Dockerfile RUN --mount instruction. The system does not properly
validate the input passed to this option, allowing users to pass
arbitrary parameters to the mount instruction. This issue can be
exploited to mount sensitive directories from the host into a
container during the build process and, in some cases, modify the
contents of those mounted files. Even if SELinux is used, this
vulnerability can bypass its protection by allowing the source
directory to be relabeled to give the container access to host files.

Reference:
<a class="moz-txt-link-freetext" href="https://nvd.nist.gov/vuln/detail/CVE-2024-9407" moz-do-not-send="true">https://nvd.nist.gov/vuln/detail/CVE-2024-9407</a>

Upstream patch:
<a class="moz-txt-link-freetext" href="https://github.com/containers/podman/commit/2b2c7a89586d0e495b6bc5cc5687bab79162118e" moz-do-not-send="true">https://github.com/containers/podman/commit/2b2c7a89586d0e495b6bc5cc5687bab79162118e</a>

Signed-off-by: Yogita Urade <a class="moz-txt-link-rfc2396E" href="mailto:yogita.urade@windriver.com" moz-do-not-send="true">&lt;yogita.urade@windriver.com&gt;</a>
---
 .../podman/podman/CVE-2024-9407.patch         | 58 +++++++++++++++++++
 recipes-containers/podman/podman_git.bb       |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 recipes-containers/podman/podman/CVE-2024-9407.patch

diff --git a/recipes-containers/podman/podman/CVE-2024-9407.patch b/recipes-containers/podman/podman/CVE-2024-9407.patch
new file mode 100644
index 00000000..397cd362
--- /dev/null
+++ b/recipes-containers/podman/podman/CVE-2024-9407.patch
@@ -0,0 +1,58 @@
+From 2b2c7a89586d0e495b6bc5cc5687bab79162118e Mon Sep 17 00:00:00 2001
+From: Matt Heon <a class="moz-txt-link-rfc2396E" href="mailto:mheon@redhat.com" moz-do-not-send="true">&lt;mheon@redhat.com&gt;</a>
+Date: Tue, 1 Oct 2024 12:38:45 -0400
+Subject: [PATCH] Validate the bind-propagation option to `--mount`
+
+Similar to github.com/containers/buildah/pull/5761 but not
+security critical as Podman does not have an expectation that
+mounts are scoped (the ability to write a --mount option is
+already the ability to mount arbitrary content into the container
+so sneaking arbitrary options into the mount doesn't have
+security implications). Still, bad practice to let users inject
+anything into the mount command line so let's not do that.
+
+Signed-off-by: Matt Heon <a class="moz-txt-link-rfc2396E" href="mailto:mheon@redhat.com" moz-do-not-send="true">&lt;mheon@redhat.com&gt;</a>
+
+CVE: CVE-2024-9407
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/containers/podman/commit/2b2c7a89586d0e495b6bc5cc5687bab79162118e" moz-do-not-send="true">https://github.com/containers/podman/commit/2b2c7a89586d0e495b6bc5cc5687bab79162118e</a>]
+
+Signed-off-by: Yogita Urade <a class="moz-txt-link-rfc2396E" href="mailto:yogita.urade@windriver.com" moz-do-not-send="true">&lt;yogita.urade@windriver.com&gt;</a>
+---
+ pkg/specgenutil/volumes.go  | 6 ++++++
+ test/e2e/run_volume_test.go | 4 ++++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/pkg/specgenutil/volumes.go b/pkg/specgenutil/volumes.go
+index c481867163..5618b2d342 100644
+--- a/pkg/specgenutil/volumes.go
++++ b/pkg/specgenutil/volumes.go
+@@ -272,6 +272,12 @@ func parseMountOptions(mountType string, args []string) (*spec.Mount, error) {
+                     if !hasValue {
+                             return nil, fmt.Errorf(&quot;%v: %w&quot;, name, errOptionArg)
+                     }
++                        switch value {
++                    case &quot;shared&quot;, &quot;rshared&quot;, &quot;private&quot;, &quot;rprivate&quot;, &quot;slave&quot;, &quot;rslave&quot;, &quot;unbindable&quot;, &quot;runbindable&quot;:
++                            // Do nothing, sane value
++                    default:
++                            return nil, fmt.Errorf(&quot;invalid value %q&quot;, arg)
++                    }
+                     mnt.Options = append(mnt.Options, value)
+             case &quot;consistency&quot;:
+                     // Often used on MACs and mistakenly on Linux platforms.
+diff --git a/test/e2e/run_volume_test.go b/test/e2e/run_volume_test.go
+index 4e777d62ef..5b256c9255 100644
+--- a/test/e2e/run_volume_test.go
++++ b/test/e2e/run_volume_test.go
+@@ -112,6 +112,10 @@ var _ = Describe(&quot;Podman run with volumes&quot;, func() {
+             session.WaitWithDefaultTimeout()
+             Expect(session).To(ExitWithError())
+
++            session = podmanTest.Podman([]string{&quot;run&quot;, &quot;--rm&quot;, &quot;--mount&quot;, &quot;type=bind,src=/tmp,target=/tmp,bind-propagation=fake&quot;, ALPINE, &quot;true&quot;})
++            session.WaitWithDefaultTimeout()
++            Expect(session).To(ExitWithError())
++
+             session = podmanTest.Podman([]string{&quot;run&quot;, &quot;--rm&quot;, &quot;--mount&quot;, &quot;type=tmpfs,target=/etc/ssl,notmpcopyup&quot;, ALPINE, &quot;ls&quot;, &quot;/etc/ssl&quot;})
+             session.WaitWithDefaultTimeout()
+             Expect(session).Should(ExitCleanly())
+--
+2.40.0
diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index ef9798f0..4086298f 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -24,6 +24,7 @@ SRC_URI = &quot; \
     <a class="moz-txt-link-freetext" href="file://0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch;patchdir=src/import/vendor/github.com/containers/storage" moz-do-not-send="true">file://0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch;patchdir=src/import/vendor/github.com/containers/storage</a> \
     <a class="moz-txt-link-freetext" href="file://CVE-2025-6032.patch;patchdir=src/import" moz-do-not-send="true">file://CVE-2025-6032.patch;patchdir=src/import</a> \
     <a class="moz-txt-link-freetext" href="file://CVE-2024-9341.patch;patchdir=src/import" moz-do-not-send="true">file://CVE-2024-9341.patch;patchdir=src/import</a> \
+    <a class="moz-txt-link-freetext" href="file://CVE-2024-9407.patch;patchdir=src/import" moz-do-not-send="true">file://CVE-2024-9407.patch;patchdir=src/import</a> \
 &quot;

 LICENSE = &quot;Apache-2.0&quot;
--
2.40.0

</pre>
        </blockquote>
        <blockquote type="cite"> </blockquote>
      </blockquote>
      <lt-container></lt-container>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#9407): <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/message/9407">https://lists.yoctoproject.org/g/meta-virtualization/message/9407</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/mt/115268579/7312273">https://lists.yoctoproject.org/mt/115268579/7312273</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:meta-virtualization+owner@lists.yoctoproject.org">meta-virtualization+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/unsub">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:Yogita.Urade@windriver.com">Yogita.Urade@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------0kVK7dH6a2GJeRK0Whpw9WTf--

