Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A972CCD5BC8
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 09:34:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12548.1779701681465567062
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 May 2026 02:34:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=iji92rDr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9605e3e175=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P6P4UM1717810
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 May 2026 02:34:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=iGFA3ywsqrFo3NDb4QB0mr
	EPlQOv3bZSttlI932SfGk=; b=iji92rDr/076uMNe3rLFb2VYNpdrJXdk9us7wA
	SvaAOutq52swcZm58OmtQMbuwgaRe2wAawYo541L8X63eNdOnXtO+mASDJPfsXfH
	6GQxCQUmDhnct8GvN9EHj/DUDwqKk1SnNGNJfW2kJAMVvSz4q7uez/EY7fYFe35B
	rdZPKNvqPOIWy0La35Kql2SvCueWdRsNc6RwGokoAENw3x7NagKkZTV4p5sFxrjC
	ZQot0a7bhiDb3Hz/qxOZ4IeF97wV5b+U3PMshn63k+GjpGBWgCrfyas6BAnCaYBu
	mYPRgvJYukFAUucU+4r7o02hvZHFWiCmMx0wemby6TtT6oKQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012064.outbound.protection.outlook.com [40.93.195.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ebbrej4m1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 May 2026 02:34:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YvQiR+AQRDoualNmfrgu5WKeN4iDVYmKGMdq0Aotj3Hs/5ixG5Kjl+OunOQEtCfig7W5c4CcraOmEODXcL7nbfwwOmdSuwfADQuCfepbEIuGNeBWA/tjVrOcpHhDamX/+iFnnHnfSHvYlavmA9IOPtlBn65pA1MSPPxQf2LndSE1eYmTKrWpsW+UJc79GEb/G3OyOgg28qXTxrlqRWsBOzHpkGLE+GW9lzE0iOe8Xrk2HDuN/2QjCqoj6zoISyykW1gB/RS/Y4GePeUsYRct5UF4ejcOSETJ8ZmWfZSikWKdNV0iR6BjZ12tdzgCc8ysvPG7kt9xcO/MPoB/SzBCng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGFA3ywsqrFo3NDb4QB0mrEPlQOv3bZSttlI932SfGk=;
 b=KlSU4+ED8AYkaWd4nuJ5DAtQ9oon+hIBs22sYuZVLMwKlYTMtPd47G5dbPqtTgEQrBjIkaNdFgRVg1Nvo9ofNMtpfo2ATwKslt0XTJoFP1oNgnAGlen1gYMI65P5p2/fssj9oGK51S0cAPVVcK/+TyNRTPICN3wlv4qhg9sGmwuaQW0unaLc38Su4a0G80jdpXURYTGCve9H/wL/avuwK8+eYc2emsKM0R6iqrWKtna36bLbt5cfrWbJ8okg+ZLMrSl5LUTELALzTqO3jwrv052xcBYVuNw5E5D1DIMrpodIuEySIJ4tmqvJFoYqUsq3/N0TBfR2dIOIHuxvJKp6gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32) by PH7PR11MB6676.namprd11.prod.outlook.com
 (2603:10b6:510:1ae::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 09:34:37 +0000
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a]) by DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a%6]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 09:34:37 +0000
Content-Type: multipart/alternative;
 boundary="------------GtyuZhsDqy0ledBeQ7vWt0h2"
Message-ID: <cb39c079-2e4f-497e-9c78-101d06104937@windriver.com>
Date: Mon, 25 May 2026 17:34:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][PATCH 1/4] crun: upgrade to 1.27.1
Content-Language: en-US
To: meta-virtualization@lists.yoctoproject.org
References: <18B2C4CEFC6290D9.3236635@lists.yoctoproject.org>
From: "Chi, Zhixiong" <zhixiong.chi@windriver.com>
In-Reply-To: <18B2C4CEFC6290D9.3236635@lists.yoctoproject.org>
X-ClientProxiedBy: SE2P216CA0110.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c4::10) To DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF75D68BA1B:EE_|PH7PR11MB6676:EE_
X-MS-Office365-Filtering-Correlation-Id: 01bc8a49-952d-4c66-7a23-08deba40d65f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|3023799007|11063799006|6133799003|56012099003|18002099003|22082099003|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	B4SmJsAY47BJEGVqYqd2b9hHfEcXNaNte7F4ao5LT3et5WZnZIvrM7g/jGBDX0bJ/+3qCn+Q8dgX/GG4C+IADsJ8NvFok4ZIJhF81UTTC5vpYmcrou7jZKQfHolpLBmOWLxa3cbrQOi9KY8riR/vtiNbiHZ9q+Cd4w55OPaUkOh8OZSiGW67mA/4oAXEEV899SkgswWfr93E43iZqVsA20Ssx5rvl+NTTXDz22Qmv9AP8tp6VY1hhzOslB0WPNmkjD0ZSvBxcwPrfVancBzqLYN60ixorRLtYd/IqMi9KwD9FTegsL7WSTb+NMSbNVwFUiSYqDERx9C1z3UbaYOL7NxUqh47HpuSvHdWwcA5FnNkX8Jx9V3IYXtQjJW7Bytj6AJd00LDmos9+JWVcZmlwyz9kD9nl4/5kWp3GUnaxb9MO5+IKTRCsDiPmg9acWYCAyS4sJVIkOaSfQ8E4g/YIYzfdU90veKmUPu0RsaWz2+JIaopSqk9f/7UpDORQuXL8vR2mYoK4D03ZJgToa9iB3l9I42CeYuY7Js5mFl5ye9NtwqFLZ6QyzkKirDA68GBpGuKREov9JzxQNAnu1et5PC4dTmlbIvZQwV0U0KyCCLj7J7tPc2EMkEc0+FhkIYhCuKk+/Nq7lBdPffmyY0MJw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF75D68BA1B.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(3023799007)(11063799006)(6133799003)(56012099003)(18002099003)(22082099003)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z21xNEp2a2wrdUpvS2Jwb3lsUmtSZS9lc3BnaXlFeE5oSWVkelBsbVhtOExR?=
 =?utf-8?B?ZGpiYW9qRHIrYmZVSzlLOWFqOFZEZEZjL21WNFJHdGdCTzVoSVJ2Rnh2TTNE?=
 =?utf-8?B?M2dHeVl6d3BkQzFVNUJRNnRSTy9CZE5FYUFCTU9VcUU2SFA3NzAyUzBEWEcy?=
 =?utf-8?B?M1RWb1NaK1hzMXFVSEFJUU5BMmlQOG9qTzZsOGQvRk5zN1BsZyt6TzlDM3Vx?=
 =?utf-8?B?V1NKZUNxUzVmYnE3TVNNZkw5cTQzS0tXMEk5Y2ovT011TDlSdmZtSFhMQmpn?=
 =?utf-8?B?eE1KUjlseVFoc09pSG1EQjJRbXdGM0RHd1N4aWFFNmhmRVVldHI1R3pQcllm?=
 =?utf-8?B?YWQ0bzNnQkdORFdBanVTZ25tLzRhSTZwSW5DbVJYQVYyZWY2L1BvcUJNbW9M?=
 =?utf-8?B?MTlRVkVaMTJqZjI5VjZtcTZ4ZHNZNXZoNmlzVmxvdjUrZDR3TW8xa0ZhYTA3?=
 =?utf-8?B?UjNZWDBjN3NTL3JLdllkVlFLOTVlWEhPUFBsV1YrN0QwRHdNODM1WCthMVlD?=
 =?utf-8?B?T3UvSy82bWFMWUtWelFOV2V6bjFHRnZVL2RkVk9UaXdGa2pVa0hQejB4anBh?=
 =?utf-8?B?WkRTbXVCajVYc0MyM2NFQU5ybW5RODBZTk1Fd25GcXlxeUlSaTFQekZEUU9Q?=
 =?utf-8?B?TGpuN1c4ZGlsR0NOZjFuazMzbS9vNWhTUnpXU05aeDNTTGJ0aTJydXZjQzZw?=
 =?utf-8?B?WndnaXIzdTNpazhCVFJZUnJFZ1lma3NEeUZoU3UyUWlncjNSNW85aFNKSmVp?=
 =?utf-8?B?a1RzcXBMYzdLRzEyUmY4MFBKRW9ON1FTa2tNRGo3UjNLeXNGQktOUlZTZlFE?=
 =?utf-8?B?T0RBb1VnQWZ3dzZtM1c5UWFTbVdqa3JpWTdvZnhKa2YzVFJub3Z2dTlFd21u?=
 =?utf-8?B?MVlsaDVYS0FrU3Z3dW1kNkpVTi9qT1RUOFR3YWMvRVhzNVNaeFl0QmNld3Nh?=
 =?utf-8?B?ZXNLUnNDZjVUNkxnbDJSR1ZtcjZuQmp6Zkc4WFdBRStEVU9WbnNHM09qN0pG?=
 =?utf-8?B?cU9BYzhKYUJpTWVrMVNPc2h0akZsNVJjQ2F5R2pDenJTaTU4QTdQQy9IKzYr?=
 =?utf-8?B?NnlFVndRT3ZwandzWGQyeTdXdlZYa2diS0pDRTVwN1pNcWJNKzNZeFZUdEJq?=
 =?utf-8?B?b3NJSFkzdDZvSVpWZm42d2xKMnA0YW52dWJtWkdRdC9LNTV1RXVyUkE4dkhs?=
 =?utf-8?B?TW5ncE1FejB2QlZ4VDVEcHMyK1A2eXdqMDZ4WFY5djJmbm4wTlQxdHNsSVNI?=
 =?utf-8?B?amlyamZtRnNjR2VYNEdNS3AwUUU2TlF0REdvNmt3WFEwaVN6aWhUdmF0MXhS?=
 =?utf-8?B?WHZyT0RVT2lpSEg1dk9kMXRqTHM4Tys0b25kbU1JdkhJSElHMEJBd1BZaVIv?=
 =?utf-8?B?UFdMM3NwVTBzSVNwM3h0Smt1S0RHa2QwWlNFT05jeUNwOVpQMVJoWm95MjRl?=
 =?utf-8?B?bmhmMHFvenorbWtoYXpLWTlEZy9sQjgwUm0zRmhDRnNBaU9HZzE3V0NzcUx5?=
 =?utf-8?B?YW1rckJ2U2w5N3JpdGN1RHZRMlJEU0FudStveDQyVWhuZkJ1RFBHZUMyb3Jk?=
 =?utf-8?B?di9aZ0JxajhLTEtIZjVGM0FEOUJjcXZPREs4aW5Bb0RWYjgwOS82N1h5R2dJ?=
 =?utf-8?B?ejVCaFVUYy9UYUtYbWdTdDdqYUNDN05xdlNGU3JOVkN0ZUhlU1RNWmFCanlT?=
 =?utf-8?B?cnBQUlNPay90NHU1YkdFQmRyN1FOVjUwRGU1UGJMN2RNMUd6VFpEWmxXSjZZ?=
 =?utf-8?B?eC85aE56WHR2TEFiWkFYSHJKNVJpZGFLbGtqS2tMQlV2b1JWMzNwL1pWNTBH?=
 =?utf-8?B?R21UeFVvVE9wVVVYOG04citab3h5ZEJMcUFsZm9lVkRBRUZzQTYvSllmTXpU?=
 =?utf-8?B?d0dUREU5V29LMmZCeS9pc3VLT1hlNE12VnBuZ2V0cnlsVDJnVmhoeEpsZHJJ?=
 =?utf-8?B?bHZxTkdyUlR0M0ZXMHB2cnJvdWpIUjI4VmNHRzBmMTE1YWxGQWY2Ny9qZnlT?=
 =?utf-8?B?blZwa1lYTTlZRmZNUWlNK3g3LzlscTh1VjhwNE01N1IvbVRiOFo2NWJ0d1lT?=
 =?utf-8?B?TDNOekJ0TnRaY296S0xGYTZjaklVTWpVNXNSOWZMcGQ3SzNZUEp0WFNnbXlE?=
 =?utf-8?B?MEJTQ1E3YTVlenBQR3RnZENpSUVDOVhrNUdmSHdyQVNrVnhKTmRyY21xQ3Ar?=
 =?utf-8?B?aGpoMUhzQjdIelZvMEsrdTkwUlN5M0Z2MklVVnBGaG1sSC93TnF4V3lVTHRW?=
 =?utf-8?B?VVRHSkZ3bjlMKzdKOGlKb0l3YWt0aW5yUmI4MDBIT0tHcGNiSTg4WVZWSUU4?=
 =?utf-8?B?YTVNWlB6TDdsamlldVlpem9pdmhITnJWTTQrVmpnMDJLdk5rVTZwUGNLbzdO?=
 =?utf-8?Q?X9qJhVHhcAmqnqDg=3D?=
X-Exchange-RoutingPolicyChecked: 
	Xp+h1M5HvkjPpX5qjUC1mQNu2yUm8p7X3V30OeQAz7FsslXoAAuTz98ID18/UnBGJBSEre6cLwOZeJkU2Y3YEOoZraQ7RRKE2qRzEldKDVtAHtfe8rJWYTH7cpjYXyT2CIpF8RJGNSrqRxBFfzVtORfvrrkwu4B0FhLqg/EuH2+g+mYAuVrJvYdRss6+2uoLtwO+wbcu/UwR19DEiTq299Z7u3xgUKQA+jYNU8W+S6XNGgRsFSoEDR/sG/m2oNjKKNUS+LW19kXEUG54R/h7q2wdS94NYt9rrBjJXSiJwKH6i2y8VFlZsQa07Hm+ZOWR82fC1L4VWSvexS5Jri6k6g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01bc8a49-952d-4c66-7a23-08deba40d65f
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF75D68BA1B.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 09:34:37.1560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WeZ1FLf9XGHYWtCaG4OTKaASyWsTtA5jH6FeMqmXvMHxdWgm8tPF/GXRMVuBFCDbVjIIeMV2Kiphnv1+LjJmyI9qN0cmuVY+8Nq6wM941yI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6676
X-Proofpoint-GUID: 4YqkNIK6xg61kdX3cfgIq3x1P4Obgkw6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA5OCBTYWx0ZWRfXyMC8ahdzBjUm
 4RzzeflYyxHkxEn5QYRU9XhR2zvLpOETUdcXFQIjCRNAua7WCN2Wj2rg+0uQkcrHnEV/QW8dG8B
 vKrIqXas60ovmJHvXf5H5csnbZqedHbeluA6pu+cHYft2DdSn/6KoHmP6a/Swpv85/E1W1ShNkY
 TiW+UtohP8XvKrZ1qNoZpOeSQa+dZ0xYQ7hyPVc8pHHT4GFpNJ6+t1V9o7GaDe5WwDufL8BEilC
 Ho9rYsRbSuHUtrRludOyHg6flnb8al6v6G/j+2WDKmwDZOsausji67n49YN6NqZ1TjyXdVn1kME
 pJgOAFBPX2LvKiFg9yHdDZ0msCcZ1UpvgD4CeFYspkWrHbiYSB23twyjXqrqFksX9VHdYv/tEUY
 JsikYVDZqO04wcpZFX2R2lfTBRKNSHgkT5Iou7LuBKnKsvT4qfTO3wIExdtBCZ4H3frwUxXpXyS
 G4roKHCyc3SrTumpyaA==
X-Authority-Analysis: v=2.4 cv=IMUyzAvG c=1 sm=1 tr=0 ts=6a1417b0 cx=c_pps
 a=bXbGeLyqALV9C4BWsqKi7Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=iGHA9ds3AAAA:8
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=KKoXKvp_6dRTJP1tzVYA:9 a=QEXdDO2ut3YA:10
 a=cZzSYzjnrrY0a2LKeQ4A:9 a=lRe4fhy6ftgaRmuV:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 4YqkNIK6xg61kdX3cfgIq3x1P4Obgkw6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250098
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 25 May 2026 09:34:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9807

--------------GtyuZhsDqy0ledBeQ7vWt0h2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bruce,

Please ignore this patch series, I make a mistake to send this to master 
branch:
[meta-virtualization][PATCH 1/4] crun: upgrade to 1.27.1
[meta-virtualization][PATCH 2/4] cri-o: upgrade to 1.36.0
[meta-virtualization][PATCH 3/4] cri-tools: upgrade to 1.36.0
[meta-virtualization][PATCH 4/4] kubernetes: upgrade to 1.35.5

Thanks.

On 5/25/26 17:26, Zhixiong Chi via lists.yoctoproject.org wrote:
> Bumping crun to version v1.27.1, which comprises the following commits:
>
>      3ec076b3 NEWS: tag 1.27.1
>      60b2e8f8 tests, podman: pin to 5.8
>      3010d29d tests: fix failure in user namespace
>      d6ffa244 krun: remove unused variable
>      1c5c2f7d linux: pass correct propagation to get_bind_mount
>      d97461f0 tests: add regression test for idmapped mount leak
>      59cfa8b8 Revert "linux: skip redundant MS_PRIVATE propagation mounts"
>      f1b70c0b tests: add subcgroup cleanup test
>      6177dd86 cgroup: fix recursive cgroup cleanup consuming caller's fd
>      6c58b0c6 fix -Wdiscarded-qualifiers warnings
>      acb904c6 krun: Build passt argv based on nitro variant
>      8199cbb2 krun: implement support for passt networking
>      7c2500df krun: ignore RAM configurations below 128MB
>      23f7d9f0 krun: consolidate configuration in configure_vm
>      04c19ac6 krun: process the vm configuration earlier
>      81c21e0d handlers: add new hook to close fds
>      d8813f3d .codespellrc: ignore passt
>      94d7f641 utils: fix apparmor profile not applied in user namespaces
>      805e6a44 libcrun: skip cgroup filesystem type check when cgroups are disabled
>      4c530d43 libcrun: fall back to bind mount for /dev/console on read-only file systems
>      a718a92c NEWS: tag 1.27
>      6220914d nix: generate git-version.h in buildPhase
>      9553f8b8 exec: strengthen -u value validation
>      1bd7f424 exec: fix CVE-2026-30892
>      5699da29 nix: fix zlib cross-compilation for s390x
>      237f8100 nix: remove global overlay to eliminate rebuild cascade
>      b37594dc release: use path: flake ref to avoid libgit2 safe.directory
>      aaa6056c release: seed /nix from container image when empty
>      c4e3fd22 linux: set MS_PRIVATE on detached mounts from get_bind_mount()
>      360621a3 Revert "container: skip sigaction reset in unblock_signals for the run path"
>      5d1b0284 nix: migrate to flakes
>      246a3367 nix: generate git-version.h in buildPhase
>      3e9986bc nix: bump nixos/nix image from 2.24.9 to 2.34.2
>      094c97f3 nix: update
>      195f664f seccomp_notify: tighten crun_make_error input
>      1d76be72 seccomp: tighten crun_make_error input
>      62d3e852 container: tighten crun_make_error input
>      254a8a75 linux: use open_tree+mount_setattr for device mounts
>      2d6f4c0e linux: use open_tree+move_mount for masked paths
>      45e62ce5 linux: use open_tree+mount_setattr for readonly paths
>      f53aa376 linux: use mount_setattr for readonly remounts in finalize_mounts
>      2dae2238 linux: skip redundant MS_PRIVATE propagation mounts
>      38e17199 container: skip sigaction reset in unblock_signals for the run path
>      4b66d8f0 cgroup: skip enable_controllers when joined via CLONE_INTO_CGROUP
>      a59b186b linux: validate run.oci.mount_context_type annotation value
>      16bd4e48 utils: do not use errno after success
>
> Signed-off-by: Zhixiong Chi<zhixiong.chi@windriver.com>
> ---
>   recipes-containers/crun/crun_git.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/crun/crun_git.bb b/recipes-containers/crun/crun_git.bb
> index d2f7b63b..f4e489d5 100644
> --- a/recipes-containers/crun/crun_git.bb
> +++ b/recipes-containers/crun/crun_git.bb
> @@ -3,7 +3,7 @@ LICENSE = "GPL-2.0-only"
>   LIC_FILES_CHKSUM ="file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>   PRIORITY = "optional"
>   
> -SRCREV_crun = "393509db566bedea037d1599c5a58b896f5d3b01"
> +SRCREV_crun = "3ec076b3b6714ec2f1a10533cf18d5605a6de637"
>   SRCREV_libocispec = "8b07b619df73a113f7721f1c7ce24f2572b04cea"
>   SRCREV_ispec = "a4c6ade7bb82b316d45391f572727a63e268b252"
>   SRCREV_rspec = "6f7b71c2d216403715f7364ac88dec88d9da989c"
> @@ -19,7 +19,7 @@ SRC_URI = "git://github.com/containers/crun.git;branch=main;name=crun;protocol=h
>              file://0002-libocispec-fix-array-items-parsing.patch;patchdir=libocispec \
>             "
>   
> -PV = "1.26.0+git"
> +PV = "1.27.1+git"
>   
>   inherit autotools-brokensep pkgconfig features_check
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9803):https://lists.yoctoproject.org/g/meta-virtualization/message/9803
> Mute This Topic:https://lists.yoctoproject.org/mt/119478154/3618679
> Group Owner:meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe:https://lists.yoctoproject.org/g/meta-virtualization/unsub [zhixiong.chi@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------GtyuZhsDqy0ledBeQ7vWt0h2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html data-lt-installed="true"><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body style="padding-bottom: 1px;">
    <p>Hi Bruce,<br>
      <br>
      Please ignore this patch series, I make a mistake to send this to
      master branch:<br>
      [meta-virtualization][PATCH 1/4] crun: upgrade to 1.27.1<br>
      [meta-virtualization][PATCH 2/4] cri-o: upgrade to 1.36.0<br>
      [meta-virtualization][PATCH 3/4] cri-tools: upgrade to 1.36.0<br>
      [meta-virtualization][PATCH 4/4] kubernetes: upgrade to 1.35.5</p>
    <p>Thanks.<br>
    </p>
    <div class="moz-cite-prefix">On 5/25/26 17:26, Zhixiong Chi via
      lists.yoctoproject.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:18B2C4CEFC6290D9.3236635@lists.yoctoproject.org">
      <pre wrap="" class="moz-quote-pre">Bumping crun to version v1.27.1, which comprises the following commits:

    3ec076b3 NEWS: tag 1.27.1
    60b2e8f8 tests, podman: pin to 5.8
    3010d29d tests: fix failure in user namespace
    d6ffa244 krun: remove unused variable
    1c5c2f7d linux: pass correct propagation to get_bind_mount
    d97461f0 tests: add regression test for idmapped mount leak
    59cfa8b8 Revert &quot;linux: skip redundant MS_PRIVATE propagation mounts&quot;
    f1b70c0b tests: add subcgroup cleanup test
    6177dd86 cgroup: fix recursive cgroup cleanup consuming caller's fd
    6c58b0c6 fix -Wdiscarded-qualifiers warnings
    acb904c6 krun: Build passt argv based on nitro variant
    8199cbb2 krun: implement support for passt networking
    7c2500df krun: ignore RAM configurations below 128MB
    23f7d9f0 krun: consolidate configuration in configure_vm
    04c19ac6 krun: process the vm configuration earlier
    81c21e0d handlers: add new hook to close fds
    d8813f3d .codespellrc: ignore passt
    94d7f641 utils: fix apparmor profile not applied in user namespaces
    805e6a44 libcrun: skip cgroup filesystem type check when cgroups are disabled
    4c530d43 libcrun: fall back to bind mount for /dev/console on read-only file systems
    a718a92c NEWS: tag 1.27
    6220914d nix: generate git-version.h in buildPhase
    9553f8b8 exec: strengthen -u value validation
    1bd7f424 exec: fix CVE-2026-30892
    5699da29 nix: fix zlib cross-compilation for s390x
    237f8100 nix: remove global overlay to eliminate rebuild cascade
    b37594dc release: use path: flake ref to avoid libgit2 safe.directory
    aaa6056c release: seed /nix from container image when empty
    c4e3fd22 linux: set MS_PRIVATE on detached mounts from get_bind_mount()
    360621a3 Revert &quot;container: skip sigaction reset in unblock_signals for the run path&quot;
    5d1b0284 nix: migrate to flakes
    246a3367 nix: generate git-version.h in buildPhase
    3e9986bc nix: bump nixos/nix image from 2.24.9 to 2.34.2
    094c97f3 nix: update
    195f664f seccomp_notify: tighten crun_make_error input
    1d76be72 seccomp: tighten crun_make_error input
    62d3e852 container: tighten crun_make_error input
    254a8a75 linux: use open_tree+mount_setattr for device mounts
    2d6f4c0e linux: use open_tree+move_mount for masked paths
    45e62ce5 linux: use open_tree+mount_setattr for readonly paths
    f53aa376 linux: use mount_setattr for readonly remounts in finalize_mounts
    2dae2238 linux: skip redundant MS_PRIVATE propagation mounts
    38e17199 container: skip sigaction reset in unblock_signals for the run path
    4b66d8f0 cgroup: skip enable_controllers when joined via CLONE_INTO_CGROUP
    a59b186b linux: validate run.oci.mount_context_type annotation value
    16bd4e48 utils: do not use errno after success

Signed-off-by: Zhixiong Chi <a class="moz-txt-link-rfc2396E" href="mailto:zhixiong.chi@windriver.com">&lt;zhixiong.chi@windriver.com&gt;</a>
---
 recipes-containers/crun/crun_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/crun/crun_git.bb b/recipes-containers/crun/crun_git.bb
index d2f7b63b..f4e489d5 100644
--- a/recipes-containers/crun/crun_git.bb
+++ b/recipes-containers/crun/crun_git.bb
@@ -3,7 +3,7 @@ LICENSE = &quot;GPL-2.0-only&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263">&quot;file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263&quot;</a>
 PRIORITY = &quot;optional&quot;
 
-SRCREV_crun = &quot;393509db566bedea037d1599c5a58b896f5d3b01&quot;
+SRCREV_crun = &quot;3ec076b3b6714ec2f1a10533cf18d5605a6de637&quot;
 SRCREV_libocispec = &quot;8b07b619df73a113f7721f1c7ce24f2572b04cea&quot;
 SRCREV_ispec = &quot;a4c6ade7bb82b316d45391f572727a63e268b252&quot;
 SRCREV_rspec = &quot;6f7b71c2d216403715f7364ac88dec88d9da989c&quot;
@@ -19,7 +19,7 @@ SRC_URI = &quot;git://github.com/containers/crun.git;branch=main;name=crun;protocol=h
            <a class="moz-txt-link-freetext" href="file://0002-libocispec-fix-array-items-parsing.patch;patchdir=libocispec">file://0002-libocispec-fix-array-items-parsing.patch;patchdir=libocispec</a> \
           &quot;
 
-PV = &quot;1.26.0+git&quot;
+PV = &quot;1.27.1+git&quot;
 
 inherit autotools-brokensep pkgconfig features_check
 
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#9803): <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/message/9803">https://lists.yoctoproject.org/g/meta-virtualization/message/9803</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/mt/119478154/3618679">https://lists.yoctoproject.org/mt/119478154/3618679</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:meta-virtualization+owner@lists.yoctoproject.org">meta-virtualization+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/unsub">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:zhixiong.chi@windriver.com">zhixiong.chi@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
  <lt-container></lt-container>
</html>

--------------GtyuZhsDqy0ledBeQ7vWt0h2--

