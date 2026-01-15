Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B682D3CCA6
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 03:18:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27939.1768447102207064368
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 14 Jan 2026 19:18:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=RMHTS9db;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54756eb491=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ENKTVW2220551;
	Thu, 15 Jan 2026 03:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=SvCcxEwvVvDPWaXVE5D/nr
	1IvbD9YDhozPuqkLAPSyo=; b=RMHTS9dbXrNbSv295tIx9HWHMT7kLliPE/WYRI
	6b43X5GbxJDSsgjj8GnDI0N9EiqkKzeQpn17YRWkm704phDgjWIlzTQhHoaZwO2d
	h6oCrSnNX4Pay+2OhXDSDMnLmpzwHtZ6BLpZQTO/GfXgSg36xbVins7ZnZlCIAOo
	OxQF1pLZ8SObCg1YMyLWgUkBGmRxoc2UhOOe1iVsVU4stPs+tSD3z6sz6fb7z91l
	3+J2WfRZi51r6fIZlqXU4xZnUtoFmdkVGGJquHMT1uCuTllalZcuLEOKieebzGWV
	Av5H5dwfsJC16utYCrTk6mIW6hHfHhIDv0GKSxlemWPOFEPA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010013.outbound.protection.outlook.com [52.101.56.13])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkbytneqy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 03:18:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OKAzQLf1w2Kgn1zUVKsr/sJZIPCLGjAxHqXZ7k6Um/rrjLEBqYACxnI6RdHhA4LWAPFAcRA72OFIMShR7Y6LSr82OfGJX/DxcmN4BSoFCxPZJvouYc63r80+HIt4Xh9RDFUkEdlrnIIniFwYVKM3ZE7A9gwIh15XTRN9409rQRYb7cHXdH0Z4GlZoPZQY0xhxExFwIfWPRTJU8beQqGpO26RfxULISfQ0VCsoeiGjvfbwOs/Gwhk9h/VE7FuXd14EuMcWzbWwxpGo2Dn1tkPbtYdfc25++MIyfjz8fMdJ74n62LPQQkAP/CuvgiY8KQT6rCZ9vBWaSj9Tih0xeQqqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvCcxEwvVvDPWaXVE5D/nr1IvbD9YDhozPuqkLAPSyo=;
 b=Jz3OttJ9UweBP5HrQUApaun9Z4CdXzXfL4geq06yZEiDv85+6LxJN7FBr0XD/G6sT7j2SM7k0EwtnWKFjN/Es30I+gYMpFeajWSur+Byg2iCEQEx2Gc9v1sLXXFgU1mPU1Euy/7basupnm1BieMJFrEuQA6G/Ne1JcOcY9wh6YwJaylR0jwuWh4Ta0etUla6lDz/kxjy3WBf4VDBInnCzEEqIyk2YPOaWeHA83bbQrwWxzrr0y4gGjHIbJn0kbrwgK2EpfoyUM8xj0sN4pklObyi63q3Pz8rbdtupwonVrde0xjmFFI/8W3KRD8ra5itTprzXJiAh0zDr6p/sadpWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CH0PR11MB8234.namprd11.prod.outlook.com (2603:10b6:610:190::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 03:18:18 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.9520.003; Thu, 15 Jan 2026
 03:18:17 +0000
Content-Type: multipart/alternative;
 boundary="------------dGcstRPrI8IMmaZojBKkPoqt"
Message-ID: <7911c7cd-9088-4479-a8cb-06024af1eeb8@windriver.com>
Date: Thu, 15 Jan 2026 11:18:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][PATCH 00/15] set go buildid to empty for
 improving reproducibility
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20260108062628.3636344-1-changqing.li@windriver.com>
 <CADkTA4MB=AckiSmwRHJFjg_X2oYCCfRTEFydoWs2TNqDJK=7rw@mail.gmail.com>
 <f8d5d7c8-4f93-461f-a6d2-4840cae07921@windriver.com>
 <CADkTA4PxtkH0qHe=UyMwUskv39tc4ztYa_h=o_t58y8=QMJHmQ@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CADkTA4PxtkH0qHe=UyMwUskv39tc4ztYa_h=o_t58y8=QMJHmQ@mail.gmail.com>
X-ClientProxiedBy: SG2PR01CA0182.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::20) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CH0PR11MB8234:EE_
X-MS-Office365-Filtering-Correlation-Id: 919743b1-df98-4f9c-32a7-08de53e4ba41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|4022899009|1800799024|8096899003|13003099007|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VW1oU1ViSmc2MzdOUkVObnVxM0pyUkhFeHBRWm0vZFBIR2RPbEJ4VmU4S1lr?=
 =?utf-8?B?VWpIRnJ2blJzK05XQU9FdXM5T05DSHJ5QUF5YlVRcUthR0NrUmJaeXlDc0lI?=
 =?utf-8?B?T1VLUzV3VkE5VDVKTlZPQkFCczZxUEE2bm02cEkwcUI2S2hKNlk0Y2Z1TnVL?=
 =?utf-8?B?QlNsOUg3MFlleis4R0FraHdqeDNzZWlQc2Z2RXVOdFBwN2VzSitWdFQ3dXBq?=
 =?utf-8?B?c3YyL2F3T3VzUTY3b3FOWklneGpTdHhlR1ArSTV4bnVVZDdmd3pNUnFQbW1N?=
 =?utf-8?B?SzBkL1RNa0Fja240V1VhZDhXZnRYd0VzVGx5NWwxbmd6VDl0enpwZVJPS2NO?=
 =?utf-8?B?UjJDbWRyTDVzQ0U4ZnlkVm5EOEVVZllNR1NVWktsdlpvYWVOY0ZHSGMzREhx?=
 =?utf-8?B?N3dibnIyZmpwVDV3V1c4UWROVVBzK1dNaVVVVlV0cnBmcWplb0NrTlU4NXd0?=
 =?utf-8?B?eDNGRG45andqaGFUUC9lN1AxR2JJVjV2RGN6R3NDOWtMQjFLY0ZWT3FsbWVE?=
 =?utf-8?B?ek1BZVNrWWwwMXpqSi9SN1I1NzNReVRjeTRGdG0xRGJmd0Ewcm5NcldmQlhL?=
 =?utf-8?B?SUcvTEptWjkrb0w4MXhRMzJtT3BPSElhZzFUMnpsSHprRGtOUytBbzljY0xZ?=
 =?utf-8?B?cVRvQUJ3MVh4TlF0QVF2UjhyODRYbVBycjh1anAwaW1lRUwrKytlTUFrRGVa?=
 =?utf-8?B?S3c4T0ZJNzhPTlpZdjBuanlaNlVNcVhmWFVUOU9KOVBRdHpkOFlmdXgxMHAv?=
 =?utf-8?B?VGY4RmNQelZhKzZEWEExWUxiMW9wYUJqNllxa3JoTXdWdEk5c3pTQkwvVnh3?=
 =?utf-8?B?QW8vZXRKd2lsc1J6NFlBcUhzdlAyajg4WDU4RHdJRC9rbWtveEtUZ1hua2JK?=
 =?utf-8?B?TEd3bkZhbmllUndncTk5YUFpajNuQkhzYWMzQlowcXpmWFE0ZlcwelBhZDlu?=
 =?utf-8?B?R2RWMXowMWhOK1RVQlgyQjhBMEkzZGJvc3NMMzBuZHV0dXBMTWVxdWJBOTV4?=
 =?utf-8?B?WDhhcEs4RUQ3QXJHRzd5M2pQQlNqNEk2MlFQS2NjQ2FvekF2V3liYTB5azNu?=
 =?utf-8?B?a3dIV2Q4VENXOFVWaHVvY2NtT2tudDdpSWhjV2FiRVAwVlFwZ0NsRTFNZW8x?=
 =?utf-8?B?VHV5Rm41NTNrQmR1dllJRmJpVzJwMS9XNitndnUrTjc2eXhteEhHU1lONkg0?=
 =?utf-8?B?QkQ1cndESFU5TmZTaGFJcEVEYjJIRHUrV3pLckZZa2dhOVQ3Q0NiV25QWDlR?=
 =?utf-8?B?ZVlEam9leU5ibVJ6RTMxb0NqdVNJNGQwYk8xcmJ2RllRa2ZHUldDNmR1QUFx?=
 =?utf-8?B?c0tkemhGb0t0TkdDZHJlVit2UGxCVnhIYXJ2M1VkTHZVSzVna1FRbnc3Mnk5?=
 =?utf-8?B?WDMzNEhEa2ZVVWVyMmxtSXZjU3lYdCtJeXgvcWhOSHlTS1FqNUdVd2lKcHpC?=
 =?utf-8?B?dzhsdG01RlpDcGgyaG5PVWJuVnQ3MGxYUlBFV2JIMy9zODdoNkhWYVh3aStG?=
 =?utf-8?B?bitKb1JBWjkrZkZyZkhzQVBpYTJxM2dJR1lrb1pGSjBaSStYQlFXalN1QzRR?=
 =?utf-8?B?elVHNk5kQ3hISVFuejBPby8raVUvMjNTZzJwbW9KZkdIcHYyVFFvLzZ5VG1a?=
 =?utf-8?B?N1FvNDFxaWNBdjFoUkNMcmhCbDlpbGtVOThCK0FLenQ4dG96OUJiYXdxbXpu?=
 =?utf-8?B?TGNOWFZMMmcwdzE3bXZKblF3YTNwMXZ0eDFKd3dkbG0rNU9yOTdNQWdiYmtQ?=
 =?utf-8?B?VzY0Wk1QSkhmMWN1WDZPaUVtS0I5RzJscTRiMHd0L3BJWWQ4NFJVbHR3Tm5o?=
 =?utf-8?B?MkQvQnl2UlgyV1UzT0xDV0NMbXNrZFFpdVpQNW1KM2pFeU9qaFllVi9kTldw?=
 =?utf-8?B?MTBKZytrRXdscnQwUVg0NHJ5emdNVk9NSERzSnRES21vTmU1VTk0Ly9TY1ho?=
 =?utf-8?B?TVM2VjA4RFg0NTZqNGZKZ2N3VGZGTzlBTk1lREhieGVaN0NMbFdtRUUvQlhI?=
 =?utf-8?B?UzBqT0ZWRFNTTTU1QnlPSjlSNndyLzRuaERRN2ZUQ29kSFErNWJjaEJwWlha?=
 =?utf-8?Q?cdk02f?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024)(8096899003)(13003099007)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SGZFMnYwWFR1ZUc1akNxOG1wWjBhY0sweVFhTlZ2SUpzV2tVWE9iRjcrT2Vl?=
 =?utf-8?B?RVJtU1UzQkpRMXdqN1ZVczBLYisvMHRTcWVNcUowQko1WUVKK3JYa0NwaG9O?=
 =?utf-8?B?Y2VKZGtoZFBLN0prOENDaWdvOVpGbXBlRzZna01iUFpDdDhYS2xJT2xDczNk?=
 =?utf-8?B?RTEvajVaQnNQV1FUNmpBdGZ1ekViTFNDUjlVRWxaRFlmemwvS3NmM3AwaFF5?=
 =?utf-8?B?Z1Q0ZHlQQ0p0Q2E2N0xLaXFLVlBjVnE3T3NFYkpBR3JLeVV6ZkJuT1IrWHlj?=
 =?utf-8?B?VzNuNmRCSVViRHRZRnArQ3ZiWFFJUVFjbTNxdDNJb3hQTW82N1lNSkpheGNV?=
 =?utf-8?B?RkQ0YXZmTUZidnNBalFOb21oampHbWc5QUpWN0dhYk91blN1dTUzcmlKMXRB?=
 =?utf-8?B?S3IzalNpTFFvQm1LekxCNjlPSkRuZHB3QUsrTmk0eE8yZittUW1yeG9rcG81?=
 =?utf-8?B?UWM3UlQ0MzZZUHBUKzJmQzRMUWkzOENUd3FFUFAyUEFJWkVWT0lBMkFpaEpW?=
 =?utf-8?B?L0lWdVZ6Mm9BNzRUSmxKRVZyM3hRWjVlbEdDOWJSVkN1UTlNYzVTaHQxb3kv?=
 =?utf-8?B?eWR3SFBxVU9XTzhkWlFnVzhQdjc0dGdJN1VKVzdmUVdDRitVdmVoTDU5MUU0?=
 =?utf-8?B?WlJtenA3bkY1N2hqYjhNU0pkQjRjOHNLUDNsK2o3K1VZYmRBNW1PcjNFRWpy?=
 =?utf-8?B?S1hsVllvcDdOc052cmdFVjh0Y1hEZTFUOTFlSUw5eHpkT25QVHlBTFNBK0xG?=
 =?utf-8?B?WnNBckt6RkluZWZUeVhNZ09GZm1zQVVyL0FVcFlZeS9EQWJtSkZCa3d4SWEx?=
 =?utf-8?B?cmJVUk5Qbit6WE5kQ3A0cE5rNDdzYjloKzV2a21GYUdrVmFxek15aXBRUnRD?=
 =?utf-8?B?c3BPeTRGSWZIbkREQy92SDdMcUJKVUJKbi9rK1JsMW42QVRtbnNEdWp1dHBV?=
 =?utf-8?B?Ry82RTJubGZHMmVtNFREVm1KT05qSmZ0SnhTd3B5cGJ5a0RqQ3hFZDhaUmVS?=
 =?utf-8?B?Q1ppU0hxbkVYenUxOU4vc2ZQUTRaQU9RakhFZ2h0WEwxcHphdlhGRVNHK0pu?=
 =?utf-8?B?eko5TlUvcXdLWFExK1pSOXoyYnpYckdBM0VjNnBPVXAyR1pjU1NiS1dGbWpO?=
 =?utf-8?B?OHN2M0tjbGxqaUFLSW8ydmR0OVRLZmloeFpablBqTGZtR1FTVVJsNTJoZjN6?=
 =?utf-8?B?S2xwSnZBZ1Q1R1RYV2FhU2JjRmFkRTlBT1MvQ1dLYm1HS3FKeldVd3UwSGNz?=
 =?utf-8?B?SmRlUXZzeXJkbVBIR244OEw2V2R3cG9kUWdhZUo5RFZsOWlSMGZ3cmxBVlFI?=
 =?utf-8?B?ZTd1RWlCdlZsTzJRMHlqZ0gwTE45T2dZN1ljNTZuc0FiTDMxY0tDL0tYUlNa?=
 =?utf-8?B?V3RVOVl6TjF5MDVvWWdhRExMckdRbmNpL2dEdFRVeFJlNGZjRk1sSWhraGFB?=
 =?utf-8?B?VEpjM3RGOVBNQW5WbWtlTDgwVS9CbzBCYWczT2VwYUtYdnBUN1ZRYWs1Tm1Y?=
 =?utf-8?B?MXNKWHRvT1FMRWh6ZTd4WkhWRnRHemtERzVubjAwZG9WK2svTmZROHlEZTgx?=
 =?utf-8?B?c1ZVK1ZVMFhPY3lQOFQ1ang3eTlZVCtnUmM1UG14Q0YzMlY0NUl4SHBFQzNm?=
 =?utf-8?B?K3A3c2pXaUJZOGRybHQwK09ib241ZVZXbHByQ1FjdmJma0NyNjBwUmJlQVBq?=
 =?utf-8?B?Q2sxc1NQU0tqOG5BYXcvMWw4N29TekVxcm1OSFJrNUhTS1MrbmVCR1pvaG4r?=
 =?utf-8?B?eGdEZ1VoKy94RHhwZVRoQlpQdlhLS3pzRElNQ2t1M1RpVU1NZ01MdnRjbzFm?=
 =?utf-8?B?TzFQQU5FaExVV1V3NUVOZGJVdU1vWGVQelQ2ZmxtbllyMjJIN1NJdHNlSU0y?=
 =?utf-8?B?UUxpSmpzUXhZck8yODNzZUpSTU0xeFZwdWdRSndlM3hMQzQ4OVJuUTVYWTVq?=
 =?utf-8?B?TDAxcDYxVjlRWlFtY3NVNEtBcm5GWXBsNW04VTNkVlc3NStsS2hidGNuL2JD?=
 =?utf-8?B?alowRXNHNXl2UCtka2VIekxsaUhld01zUGVwdmRDdmlyai9RRnUxK2FNUzBy?=
 =?utf-8?B?QU1OMjFER3FmZEZ5YWR1NkFYTlg0YTdwQkluak9Db0IwU2F2ai9WYmxCaHVS?=
 =?utf-8?B?Wm4rQmcyeFd4QjlhRlFycGFwMEI5STN1d1FTMjVVTHpzWldWSjU1dGwvMGJy?=
 =?utf-8?B?TDFjSnBoU3E2bXhPckowdzJKVnZHM3V5NFI5T0Q1cHl3TUpySDVyaGlSMWpa?=
 =?utf-8?B?dEJmckhYN0F6NmlrcjV5d01tMklVQ3FHMUFpcVFuMktGUnZQL1JZaFdKYWN0?=
 =?utf-8?B?WlhVakdsd2k4cFNNS3AzYlUzTndEeHozRVpDeWtjNStQcXJBalVyM2VqTHF0?=
 =?utf-8?Q?dtq99KKN7Gh3Xg1s=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 919743b1-df98-4f9c-32a7-08de53e4ba41
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 03:18:17.8490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kuUyqkoVdhmTXhOa4QvZlXzzgNIdhJsPo6HpTkhM0HKl1A8wJ4oQlcHK208SdF/pXxivlT+MZZOLjbniYpqy+GuYYrf3Llha73wMkMak11Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8234
X-Proofpoint-GUID: vlY3RwLW7fy5kPtY6K6hwmwRUBe3NORQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDAxOSBTYWx0ZWRfX+/C9SfzquzpL
 pN9WQfylfCUy0k+ETgn/TzDM1O25cg6iyjC4rlF+txL7b7p79GJOjUDY+SVECZtfwuwkhrROtZz
 wx2uwu0Yp+x5ZTmGzwkdXwEghTQxG7LE668DePnDjYbl9blC63SEuw+D/q9B98ab06x7H0JaNDj
 z2uHUIDn7qK20X0kqx0asJLwfIz+Nn2wa4lFqu1zJPSqLgovc1TW/U1JzKmZCG2J/OsNBCQiyc/
 orOVvzclU20SPaV/izY2k+z0zcO63LZ9Cy9pd7/MDVl+ARC64qd75GffWocJ16ELJ2/dmPkDFIV
 OnRBEsXBSJ3eRCiEYRrRfRSKzcqaD2jFssJQ05s7E7pqCOEdaSoDwPUT8ZQXfLzNXZdnuebC5T9
 SEs1wTZJyPiY8L248Ss8iZXzQKQ1inxbTRZZBvf6c4UFLwr8BIZtQV+znr3otZXR5DZp79GB6Or
 7jog3m/sphrlVGfPdmw==
X-Authority-Analysis: v=2.4 cv=b66/I9Gx c=1 sm=1 tr=0 ts=69685c7c cx=c_pps
 a=dfvQMip10+6xT43tUf6YKQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iGHA9ds3AAAA:8 a=ySjF6f4xAAAA:8 a=RFjtGLVJAAAA:8 a=zfDz3bfgAAAA:8
 a=0oRN3E7-AAAA:8 a=Vm47VwaKAAAA:8 a=XkuJC2LXAAAA:8 a=HONIr0DtAAAA:8
 a=VvCv5PxMAAAA:8 a=vCHQbyzJAAAA:8 a=xH1NtE5oAAAA:8 a=Qp89o8roAAAA:8
 a=4yYbIk-QAAAA:8 a=zezS8uIVAAAA:8 a=FGyEWsL0AAAA:8 a=ZW26Cz4yAAAA:8
 a=yXrhUOqHAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=nJC4_6N9_ai4fFARuHMA:9
 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=BsBArUHWsypJXRPIZHcA:9 a=igpEk6DdnsFMfL1Y:21 a=_W_S_7VecoQA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=SVe2G6S_LxxHVpu7-jkk:22 a=stvaAeZBb5V-fPvp-vy9:22
 a=N25aw_RMdTD0XpBlQSev:22 a=A9sDTnWZ4UTPbge9BLXR:22 a=yKFyvykjIVJwvJuxpF0o:22
 a=xlXauZMLQ9LHMUg6t57S:22 a=Qh5NoN3BRiC1xVk-ykmT:22 a=nHMe9YOggYUlATdCyaZ5:22
 a=mA5qry1rbyGvl90tSnBg:22 a=NKNeG3A5ERXAAbeP1Vwc:22 a=2PextC8wxLu3zIcEEJGI:22
 a=cTuAbiFRQQ3bCsKXpUDn:22 a=bJDlsGUbebFl2L_cY-Us:22 a=T40czrJlKppFb-2YZAJc:22
 a=F6BVzrJpdfjGM_8oyBWw:22 a=m8zSV4HTxMnuI1eHxS4u:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: vlY3RwLW7fy5kPtY6K6hwmwRUBe3NORQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_01,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150019
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 15 Jan 2026 03:18:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9551

--------------dGcstRPrI8IMmaZojBKkPoqt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60ENKTVW2220551


On 1/14/26 22:13, Bruce Ashfield wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
>
> On Wed, Jan 14, 2026 at 12:05=E2=80=AFAM Changqing Li=20
> <changqing.li@windriver.com> wrote:
>
>
>     On 1/8/26 21:21, Bruce Ashfield wrote:
>>     **
>>     *CAUTION: This email comes from a non Wind River email account!*
>>     Do not click links or open attachments unless you recognize the
>>     sender and know the content is safe.
>>
>>
>>     On Thu, Jan 8, 2026 at 1:26=E2=80=AFAM Changqing Li via
>>     lists.yoctoproject.org
>>     <https://urldefense.com/v3/__http://lists.yoctoproject.org__;!!Ajv=
eYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJ=
W6bjrQaAFZmCsF_sHzefcUMGHw_79Q$>
>>     <changqing.li
>>     <https://urldefense.com/v3/__http://changqing.li__;!!AjveYdw8EvQ!c=
bNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZ=
mCsF_sHzefcUMuaHYLRg$>=3Dwindriver.com@lists.yoctoproject.org>
>>     wrote:
>>
>>         From: Changqing Li <changqing.li@windriver.com>
>>
>>         These series of patches are mostly set buildid to empty for
>>         improving
>>         reproducibility, I also send a patch to oe-core with subject:
>>         [PATCH V3] go.bbclass: set buildid to empty string to improve
>>         reproducibility
>>
>>         which add -buildid=3D in default GO_LDFLAGS, but since package=
s
>>         compiled
>>         with go may not use GO_LDFLAGS in go.bbclass, they can have
>>         their own
>>         Makefiles, define their own variables for passing ldflags, so
>>         change
>>         them one by one.
>>
>>
>>     Rather than setting it to empty, I'd rather set it to a value
>>     that might
>>     be useful to us.
>>
>>     Perhaps the git hash we are building ? or the checksum of another
>>     set of files ?
>
>     Hi, Bruce
>
>     The idea is good, for the recipes changed one by one in this series=
 patch, maybe we can easily give them a value one by one.
>
>     but for go.bbclass,  I have two ideas:
>
>     GO_BUILDID ?=3D ' -buildid=3D"${@d.getVar('SRCREV') if d.getVar('SR=
CREV') !=3D 'INVALID' else ( d.getVar('SRCREV_%s'%${PN}) if d.getVar('SRC=
REV_%s'%${PN}) !=3D '' else ( d.getVarFlag('SRC_URI', 'sha256sum') if d.g=
etvarflag('sha256sum') !=3D '' if () else '') )}'
>
>     This is complicated, andtheoretically speaking, not sure it always =
have a value. And do we really need this value,  how to use it?
>
>     GO_BUILDID ?=3D ' -buildid=3Dd.getVar('PV')
>
>     This can ensure it always have a value, but I think this is not ver=
y useful.  usually, we can get version by "binray --version".
>
>
> It isn't about getting the version, it is about traceability in more=20
> of a CI/CD type environment
> (and even in our layers where I don't bump by version, but use git=20
> hashes more often)
>
> I view it similarly to the "latest" tag in containers. It is mainly=20
> useful in development and CI type
> environments, but at release real tags are used when doing a container.
>
> So capturing something about the build that is traceable and=20
> reproducible is my goal.=C2=A0 The
> SRCREV of the recipe we are building is the obvious choice, even=20
> though it is sometimes
> captured in other places as well.
>
> I don't mind your GO_BUILDID concept, even if it doesn't go to the=20
> main bbclass, we could
> test it in meta-virt.

Thanks for explanation. Richard also don't like to set it to empty.=C2=A0=
 I=20
will try to check if

if this can be resolved by patching go.=C2=A0 If it is not easy to patch,=
=C2=A0=20
then try to make

this GO_BUILDID concept better.

//Changqing

>
> Bruce
>
>     Consider above, how about set it to empty if we don't have special =
usage of this buildid?
>
>
>
>     //Sandy
>
>>
>>     Bruce
>>
>>
>>         podman also disable buildvcs
>>
>>         Changqing Li (15):
>>         =C2=A0 docker-compose: set go buildid to empty for improving
>>         reproducibility
>>         =C2=A0 docker: set go buildid to empty for improving reproduci=
bility
>>         =C2=A0 kubernetes: set go buildid to empty for improving
>>         reproducibility
>>         =C2=A0 nerdctl: set go buildid to empty for improving reproduc=
ibility
>>         =C2=A0 runc: set go buildid to empty for improving reproducibi=
lity
>>         =C2=A0 skopeo: set go buildid to empty for improving reproduci=
bility
>>         =C2=A0 umoci: set go buildid to empty for improving reproducib=
ility
>>         =C2=A0 cni: update GO_EXTRA_LDFLAGS
>>         =C2=A0 oci-image-tools: set go buildid to empty for improving
>>         reproducibility
>>         =C2=A0 docker-distribution: set go buildid to empty for improv=
ing
>>         =C2=A0 =C2=A0 reproducibility
>>         =C2=A0 containerd: set go buildid to empty for improving
>>         reproducibility
>>         =C2=A0 cri-o: set go buildid to empty for improving reproducib=
ility
>>         =C2=A0 cri-tools: set go buildid to empty for improving
>>         reproducibility
>>         =C2=A0 oci-runtime-tools: set go buildid to empty for improvin=
g
>>         =C2=A0 =C2=A0 reproducibility
>>         =C2=A0 podman: improve reproducibility
>>
>>         =C2=A0.../containerd/containerd_git.bb
>>         <https://urldefense.com/v3/__http://containerd_git.bb__;!!Ajve=
Ydw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW=
6bjrQaAFZmCsF_sHzefcUNo9zLiWA$>
>>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +
>>         =C2=A0recipes-containers/cri-o/cri-o_git.bb
>>         <https://urldefense.com/v3/__http://cri-o_git.bb__;!!AjveYdw8E=
vQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQ=
aAFZmCsF_sHzefcUMs78D5Ig$>
>>         =C2=A0 =C2=A0|=C2=A0 1 +
>>         =C2=A0recipes-containers/cri-tools/cri-tools_git.bb
>>         <https://urldefense.com/v3/__http://cri-tools_git.bb__;!!AjveY=
dw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6=
bjrQaAFZmCsF_sHzefcUMpCb2ntg$>
>>         |=C2=A0 2 +-
>>         =C2=A0.../docker-compose/docker-compose_git.bb
>>         <https://urldefense.com/v3/__http://docker-compose_git.bb__;!!=
AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLL=
TrJW6bjrQaAFZmCsF_sHzefcUN5gCwGXw$>
>>         =C2=A0 =C2=A0 |=C2=A0 4 +-
>>         =C2=A0.../docker-distribution_git.bb
>>         <https://urldefense.com/v3/__http://docker-distribution_git.bb=
__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJ=
RhJLLTrJW6bjrQaAFZmCsF_sHzefcUPPOSTQ1A$>
>>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +
>>         =C2=A0...01-Makefile-remove-duplicate-ldflags.patch | 39
>>         +++++++++++++++++++
>>         =C2=A0recipes-containers/docker/docker.inc
>>         <https://urldefense.com/v3/__http://docker.inc__;!!AjveYdw8EvQ=
!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaA=
FZmCsF_sHzefcUNwIT0NzQ$>
>>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +
>>         =C2=A0.../kubernetes/kubernetes_git.bb
>>         <https://urldefense.com/v3/__http://kubernetes_git.bb__;!!Ajve=
Ydw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW=
6bjrQaAFZmCsF_sHzefcUOnhKFbpA$>
>>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-
>>         =C2=A0recipes-containers/nerdctl/nerdctl_git.bb
>>         <https://urldefense.com/v3/__http://nerdctl_git.bb__;!!AjveYdw=
8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bj=
rQaAFZmCsF_sHzefcUNO5-GgCA$>
>>         =C2=A0|=C2=A0 1 +
>>         =C2=A0.../0001-Makefile-add-EXTRA_LDFLAGS.patch =C2=A0| 39
>>         +++++++++++++++++++
>>         =C2=A0.../oci-image-tools/oci-image-tools_git.bb
>>         <https://urldefense.com/v3/__http://oci-image-tools_git.bb__;!=
!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJL=
LTrJW6bjrQaAFZmCsF_sHzefcUPoEWN6-w$>
>>         =C2=A0 |=C2=A0 5 ++-
>>         =C2=A0.../0001-Makefile-add-EXTRA_LDFLAGS.patch =C2=A0| 33 +++=
+++++++++++++
>>         =C2=A0.../oci-runtime-tools_git.bb
>>         <https://urldefense.com/v3/__http://oci-runtime-tools_git.bb__=
;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRh=
JLLTrJW6bjrQaAFZmCsF_sHzefcUOHvuIx5g$>
>>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 2 +
>>         =C2=A0recipes-containers/podman/podman_git.bb
>>         <https://urldefense.com/v3/__http://podman_git.bb__;!!AjveYdw8=
EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjr=
QaAFZmCsF_sHzefcUN_RLh2RA$>
>>         =C2=A0 =C2=A0|=C2=A0 4 +-
>>         =C2=A0recipes-containers/runc/runc.inc
>>         <https://urldefense.com/v3/__http://runc.inc__;!!AjveYdw8EvQ!c=
bNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZ=
mCsF_sHzefcUN6fsNm5A$>
>>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +
>>         =C2=A0recipes-containers/skopeo/skopeo_git.bb
>>         <https://urldefense.com/v3/__http://skopeo_git.bb__;!!AjveYdw8=
EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjr=
QaAFZmCsF_sHzefcUPMeA_sbQ$>
>>         =C2=A0 =C2=A0|=C2=A0 2 +-
>>         =C2=A0recipes-containers/umoci/umoci_git.bb
>>         <https://urldefense.com/v3/__http://umoci_git.bb__;!!AjveYdw8E=
vQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQ=
aAFZmCsF_sHzefcUO9-Ps7rA$>
>>         =C2=A0 =C2=A0|=C2=A0 4 +-
>>         =C2=A0recipes-networking/cni/cni_git.bb
>>         <https://urldefense.com/v3/__http://cni_git.bb__;!!AjveYdw8EvQ=
!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaA=
FZmCsF_sHzefcUN-aL8Klg$>
>>         =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-
>>         =C2=A018 files changed, 138 insertions(+), 10 deletions(-)
>>         =C2=A0create mode 100644
>>         recipes-containers/docker-distribution/files/0001-Makefile-rem=
ove-duplicate-ldflags.patch
>>         =C2=A0create mode 100644
>>         recipes-containers/oci-image-tools/files/0001-Makefile-add-EXT=
RA_LDFLAGS.patch
>>         =C2=A0create mode 100644
>>         recipes-containers/oci-runtime-tools/files/0001-Makefile-add-E=
XTRA_LDFLAGS.patch
>>
>>         --=20
>>         2.34.1
>>
>>
>>         -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>         Links: You receive all messages sent to this group.
>>         View/Reply Online (#9531):
>>         https://lists.yoctoproject.org/g/meta-virtualization/message/9=
531
>>         <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/=
meta-virtualization/message/9531__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie1=
5dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUOR0VWQvA$>
>>         Mute This Topic:
>>         https://lists.yoctoproject.org/mt/117148688/1050810
>>         <https://urldefense.com/v3/__https://lists.yoctoproject.org/mt=
/117148688/1050810__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLR=
TvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUORBdhH5w$>
>>         Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>>         <mailto:meta-virtualization%2Bowner@lists.yoctoproject.org>
>>         Unsubscribe:
>>         https://lists.yoctoproject.org/g/meta-virtualization/unsub
>>         <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/=
meta-virtualization/unsub__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY=
3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUNro6bbiw$>
>>         [bruce.ashfield@gmail.com]
>>         -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>>
>>     --=20
>>     - Thou shalt not follow the NULL pointer, for chaos and madness
>>     await thee at its end
>>     - "Use the force Harry" - Gandalf, Star Trek II
>>
>
>
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await=20
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
--------------dGcstRPrI8IMmaZojBKkPoqt
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60ENKTVW2220551

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#ffffff">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 1/14/26 22:13, Bruce Ashfield wrote=
:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4PxtkH0qHe=3DUyMwUskv39tc=
4ztYa_h=3Do_t58y8=3DQMJHmQ@mail.gmail.com">
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
            <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 14, 2026 at
              12:05=E2=80=AFAM Changqing Li &lt;<a href=3D"mailto:changqi=
ng.li@windriver.com" moz-do-not-send=3D"true" class=3D"moz-txt-link-freet=
ext">changqing.li@windriver.com</a>&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <div bgcolor=3D"#ffffff">
                <p><br>
                </p>
                <div>On 1/8/26 21:21, Bruce Ashfield wrote:<br>
                </div>
                <blockquote type=3D"cite"><strong></strong>
                  <div style=3D"border:1pt solid rgb(156,101,0);padding:2=
pt;background:rgb(252,252,3)">
                    <strong><span style=3D"font-size:11pt;color:rgb(0,0,0=
)">CAUTION:
                        This email comes from a non Wind River email
                        account!</span></strong><br>
                    <span style=3D"font-size:10pt;color:rgb(0,0,0)">Do no=
t
                      click links or open attachments unless you
                      recognize the sender and know the content is safe.<=
/span><br>
                  </div>
                  <div>
                    <div dir=3D"ltr">
                      <div dir=3D"ltr">
                        <div style=3D"font-size:small"><br>
                        </div>
                      </div>
                      <br>
                      <div class=3D"gmail_quote">
                        <div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan=
 8,
                          2026 at 1:26=E2=80=AFAM Changqing Li via
                          <a href=3D"https://urldefense.com/v3/__http://l=
ists.yoctoproject.org__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqp=
vLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUMGHw_79Q$" target=3D"_=
blank" moz-do-not-send=3D"true">
                            lists.yoctoproject.org</a> &lt;<a href=3D"htt=
ps://urldefense.com/v3/__http://changqing.li__;!!AjveYdw8EvQ!cbNtO-fTMjWd=
2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefc=
UMuaHYLRg$" target=3D"_blank" moz-do-not-send=3D"true">changqing.li</a>=3D=
<a href=3D"mailto:windriver.com@lists.yoctoproject.org" target=3D"_blank"=
 moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">windriver.com@l=
ists.yoctoproject.org</a>&gt;
                          wrote:<br>
                        </div>
                        <blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
                          From: Changqing Li &lt;<a href=3D"mailto:changq=
ing.li@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D=
"moz-txt-link-freetext">changqing.li@windriver.com</a>&gt;<br>
                          <br>
                          These series of patches are mostly set buildid
                          to empty for improving<br>
                          reproducibility, I also send a patch to
                          oe-core with subject: <br>
                          [PATCH V3] go.bbclass: set buildid to empty
                          string to improve reproducibility<br>
                          <br>
                          which add -buildid=3D in default GO_LDFLAGS, bu=
t
                          since packages compiled<br>
                          with go may not use GO_LDFLAGS in go.bbclass,
                          they can have their own<br>
                          Makefiles, define their own variables for
                          passing ldflags, so change<br>
                          them one by one.<br>
                        </blockquote>
                        <div><br>
                        </div>
                        <div>
                          <div style=3D"font-size:small">Rather than
                            setting it to empty, I'd rather set it to a
                            value that might</div>
                          <div style=3D"font-size:small">be useful to us.=
</div>
                          <div style=3D"font-size:small"><br>
                          </div>
                          <div style=3D"font-size:small">Perhaps the git
                            hash we are building ? or the checksum of
                            another</div>
                          <div style=3D"font-size:small">set of files ?</=
div>
                        </div>
                      </div>
                    </div>
                  </div>
                </blockquote>
                <pre>Hi, Bruce

The idea is good, for the recipes changed one by one in this series patch=
, maybe we can easily give them a value one by one.=20

but for go.bbclass,  I have two ideas:=20

GO_BUILDID ?=3D ' -buildid=3D&quot;${@d.getVar('SRCREV') if d.getVar('SRC=
REV') !=3D 'INVALID' else ( d.getVar('SRCREV_%s'%${PN}) if d.getVar('SRCR=
EV_%s'%${PN}) !=3D '' else ( d.getVarFlag('SRC_URI', 'sha256sum') if d.ge=
tvarflag('sha256sum') !=3D '' if () else '') )}'

This is complicated, and <span lang=3D"en"><span><span>theoretically spea=
king,  </span></span></span>not sure it always have a value. And do we re=
ally need this value,  how to use it?

GO_BUILDID ?=3D ' -buildid=3Dd.getVar('PV')

This can ensure it always have a value, but I think this is not very usef=
ul.  usually, we can get version by &quot;binray --version&quot;.=20

</pre>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>
              <div class=3D"gmail_default" style=3D"font-size:small">It
                isn't about getting the version, it is about
                traceability in more of a CI/CD type environment</div>
              <div class=3D"gmail_default" style=3D"font-size:small">(and
                even in our layers where I don't bump by version, but
                use git hashes more often)</div>
              <div class=3D"gmail_default" style=3D"font-size:small"><br>
              </div>
              <div class=3D"gmail_default" style=3D"font-size:small">I vi=
ew
                it similarly to the &quot;latest&quot; tag in containers.=
 It is
                mainly useful in development and CI type</div>
              <div class=3D"gmail_default" style=3D"font-size:small">envi=
ronments,
                but at release real tags are used when doing a
                container.<br>
                <br>
                So capturing something about the build that is traceable
                and reproducible is my goal.&nbsp; The</div>
              <div class=3D"gmail_default" style=3D"font-size:small">SRCR=
EV
                of the recipe we are building is the obvious choice,
                even though it is sometimes</div>
              <div class=3D"gmail_default" style=3D"font-size:small">capt=
ured
                in other places as well.</div>
              <div class=3D"gmail_default" style=3D"font-size:small"><br>
              </div>
              <div class=3D"gmail_default" style=3D"font-size:small">I do=
n't
                mind your GO_BUILDID concept, even if it doesn't go to
                the main bbclass, we could</div>
              <div class=3D"gmail_default" style=3D"font-size:small">test=
 it
                in meta-virt.</div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Thanks for explanation. Richard also don't like to set it to
      empty.&nbsp; I will try to check if <br>
    </p>
    <p>if this can be resolved by patching go.&nbsp; If it is not easy to
      patch,&nbsp; then try to make <br>
    </p>
    <p>this GO_BUILDID concept better.</p>
    <p>//Changqing<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4PxtkH0qHe=3DUyMwUskv39tc=
4ztYa_h=3Do_t58y8=3DQMJHmQ@mail.gmail.com">
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
              <div bgcolor=3D"#ffffff">
                <pre>Consider above, how about set it to empty if we don'=
t have special usage of this buildid?=20



//Sandy

</pre>
                <blockquote type=3D"cite">
                  <div>
                    <div dir=3D"ltr">
                      <div class=3D"gmail_quote">
                        <div>
                          <div style=3D"font-size:small"><br>
                          </div>
                          <div style=3D"font-size:small">Bruce</div>
                          <br>
                        </div>
                        <div>&nbsp;</div>
                        <blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
                          <br>
                          podman also disable buildvcs<br>
                          <br>
                          Changqing Li (15):<br>
                          &nbsp; docker-compose: set go buildid to empty =
for
                          improving reproducibility<br>
                          &nbsp; docker: set go buildid to empty for
                          improving reproducibility<br>
                          &nbsp; kubernetes: set go buildid to empty for
                          improving reproducibility<br>
                          &nbsp; nerdctl: set go buildid to empty for
                          improving reproducibility<br>
                          &nbsp; runc: set go buildid to empty for improv=
ing
                          reproducibility<br>
                          &nbsp; skopeo: set go buildid to empty for
                          improving reproducibility<br>
                          &nbsp; umoci: set go buildid to empty for impro=
ving
                          reproducibility<br>
                          &nbsp; cni: update GO_EXTRA_LDFLAGS<br>
                          &nbsp; oci-image-tools: set go buildid to empty=
 for
                          improving reproducibility<br>
                          &nbsp; docker-distribution: set go buildid to e=
mpty
                          for improving<br>
                          &nbsp; &nbsp; reproducibility<br>
                          &nbsp; containerd: set go buildid to empty for
                          improving reproducibility<br>
                          &nbsp; cri-o: set go buildid to empty for impro=
ving
                          reproducibility<br>
                          &nbsp; cri-tools: set go buildid to empty for
                          improving reproducibility<br>
                          &nbsp; oci-runtime-tools: set go buildid to emp=
ty
                          for improving<br>
                          &nbsp; &nbsp; reproducibility<br>
                          &nbsp; podman: improve reproducibility<br>
                          <br>
                          &nbsp;.../containerd/<a href=3D"https://urldefe=
nse.com/v3/__http://containerd_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZ=
IAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUNo9zLi=
WA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">contai=
nerd_git.bb</a>&nbsp;
                          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbs=
p; 1 +<br>
                          &nbsp;recipes-containers/cri-o/<a href=3D"https=
://urldefense.com/v3/__http://cri-o_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2O=
zmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUM=
s78D5Ig$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">c=
ri-o_git.bb</a>&nbsp; &nbsp; &nbsp;
                          &nbsp; &nbsp;|&nbsp; 1 +<br>
                          &nbsp;recipes-containers/cri-tools/<a href=3D"h=
ttps://urldefense.com/v3/__http://cri-tools_git.bb__;!!AjveYdw8EvQ!cbNtO-=
fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_=
sHzefcUMpCb2ntg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">cri-tools_git.bb</a>
                          |&nbsp; 2 +-<br>
                          &nbsp;.../docker-compose/<a href=3D"https://url=
defense.com/v3/__http://docker-compose_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjW=
d2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzef=
cUN5gCwGXw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
">docker-compose_git.bb</a>&nbsp;
                          &nbsp; &nbsp; |&nbsp; 4 +-<br>
                          &nbsp;.../<a href=3D"https://urldefense.com/v3/=
__http://docker-distribution_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIA=
ie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUPPOSTQ1A=
$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">docker-d=
istribution_git.bb</a>&nbsp;
                          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; |&nbsp; 2 +<br>
                          &nbsp;...01-Makefile-remove-duplicate-ldflags.p=
atch
                          | 39 +++++++++++++++++++<br>
                          &nbsp;recipes-containers/docker/<a href=3D"http=
s://urldefense.com/v3/__http://docker.inc__;!!AjveYdw8EvQ!cbNtO-fTMjWd2Oz=
mvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUNw=
IT0NzQ$" target=3D"_blank" moz-do-not-send=3D"true">docker.inc</a>&nbsp;
                          &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 2 +<br>
                          &nbsp;.../kubernetes/<a href=3D"https://urldefe=
nse.com/v3/__http://kubernetes_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZ=
IAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUOnhKFb=
pA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">kubern=
etes_git.bb</a>&nbsp;
                          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbs=
p; 2 +-<br>
                          &nbsp;recipes-containers/nerdctl/<a href=3D"htt=
ps://urldefense.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMj=
Wd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHze=
fcUNO5-GgCA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e">nerdctl_git.bb</a>&nbsp; &nbsp;
                          &nbsp;|&nbsp; 1 +<br>
                          &nbsp;.../0001-Makefile-add-EXTRA_LDFLAGS.patch=
&nbsp; &nbsp;
                          &nbsp;| 39 +++++++++++++++++++<br>
                          &nbsp;.../oci-image-tools/<a href=3D"https://ur=
ldefense.com/v3/__http://oci-image-tools_git.bb__;!!AjveYdw8EvQ!cbNtO-fTM=
jWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHz=
efcUPoEWN6-w$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tr=
ue">oci-image-tools_git.bb</a>&nbsp;
                          &nbsp; |&nbsp; 5 ++-<br>
                          &nbsp;.../0001-Makefile-add-EXTRA_LDFLAGS.patch=
&nbsp; &nbsp;
                          &nbsp;| 33 ++++++++++++++++<br>
                          &nbsp;.../<a href=3D"https://urldefense.com/v3/=
__http://oci-runtime-tools_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie=
15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUOHvuIx5g$"=
 rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">oci-runtim=
e-tools_git.bb</a>&nbsp;
                          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; |&nbsp; 2 +<br>
                          &nbsp;recipes-containers/podman/<a href=3D"http=
s://urldefense.com/v3/__http://podman_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd=
2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefc=
UN_RLh2RA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>podman_git.bb</a>&nbsp; &nbsp;
                          &nbsp; &nbsp;|&nbsp; 4 +-<br>
                          &nbsp;recipes-containers/runc/<a href=3D"https:=
//urldefense.com/v3/__http://runc.inc__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZ=
IAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUN6fsNm=
5A$" target=3D"_blank" moz-do-not-send=3D"true">runc.inc</a>&nbsp;
                          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbs=
p; 1 +<br>
                          &nbsp;recipes-containers/skopeo/<a href=3D"http=
s://urldefense.com/v3/__http://skopeo_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd=
2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefc=
UPMeA_sbQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>skopeo_git.bb</a>&nbsp; &nbsp;
                          &nbsp; &nbsp;|&nbsp; 2 +-<br>
                          &nbsp;recipes-containers/umoci/<a href=3D"https=
://urldefense.com/v3/__http://umoci_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2O=
zmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUO=
9-Ps7rA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">u=
moci_git.bb</a>&nbsp; &nbsp; &nbsp;
                          &nbsp; &nbsp;|&nbsp; 4 +-<br>
                          &nbsp;recipes-networking/cni/<a href=3D"https:/=
/urldefense.com/v3/__http://cni_git.bb__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvT=
ZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUN-aL8=
Klg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">cni_g=
it.bb</a>&nbsp; &nbsp; &nbsp; &nbsp;
                          &nbsp; &nbsp; &nbsp;|&nbsp; 4 +-<br>
                          &nbsp;18 files changed, 138 insertions(+), 10
                          deletions(-)<br>
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
                          -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<b=
r>
                          Links: You receive all messages sent to this
                          group.<br>
                          View/Reply Online (#9531): <a href=3D"https://u=
rldefense.com/v3/__https://lists.yoctoproject.org/g/meta-virtualization/m=
essage/9531__;!!AjveYdw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr=
7UevOCeAyVJRhJLLTrJW6bjrQaAFZmCsF_sHzefcUOR0VWQvA$" rel=3D"noreferrer" ta=
rget=3D"_blank" moz-do-not-send=3D"true">
https://lists.yoctoproject.org/g/meta-virtualization/message/9531</a><br>
                          Mute This Topic: <a href=3D"https://urldefense.=
com/v3/__https://lists.yoctoproject.org/mt/117148688/1050810__;!!AjveYdw8=
EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6bjr=
QaAFZmCsF_sHzefcUORBdhH5w$" rel=3D"noreferrer" target=3D"_blank" moz-do-n=
ot-send=3D"true">
https://lists.yoctoproject.org/mt/117148688/1050810</a><br>
                          Group Owner: <a href=3D"mailto:meta-virtualizat=
ion%2Bowner@lists.yoctoproject.org" target=3D"_blank" moz-do-not-send=3D"=
true">
meta-virtualization+owner@lists.yoctoproject.org</a><br>
                          Unsubscribe: <a href=3D"https://urldefense.com/=
v3/__https://lists.yoctoproject.org/g/meta-virtualization/unsub__;!!AjveY=
dw8EvQ!cbNtO-fTMjWd2OzmvTZIAie15dDo_FY3nqpvLRTvvQfXr7UevOCeAyVJRhJLLTrJW6=
bjrQaAFZmCsF_sHzefcUNro6bbiw$" rel=3D"noreferrer" target=3D"_blank" moz-d=
o-not-send=3D"true">
https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a href=3D=
"mailto:bruce.ashfield@gmail.com" target=3D"_blank" moz-do-not-send=3D"tr=
ue" class=3D"moz-txt-link-freetext">bruce.ashfield@gmail.com</a>]<br>
                          -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<b=
r>
                          <br>
                        </blockquote>
                      </div>
                      <div><br clear=3D"all">
                      </div>
                      <div><br>
                      </div>
                      <span class=3D"gmail_signature_prefix">-- </span><b=
r>
                      <div dir=3D"ltr" class=3D"gmail_signature">- Thou
                        shalt not follow the NULL pointer, for chaos and
                        madness await thee at its end<br>
                        - &quot;Use the force Harry&quot; - Gandalf, Star=
 Trek II<br>
                        <br>
                      </div>
                    </div>
                  </div>
                </blockquote>
              </div>
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

--------------dGcstRPrI8IMmaZojBKkPoqt--

