Return-Path: <rong.fu.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A536ECD5BDE
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 06:01:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13872.1779861653768232448
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 May 2026 23:00:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Z8skRNI8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9607859bb9=rong.fu.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R2gmU62002277
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 27 May 2026 06:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=XpZu8jpdBG+bGxdf4RHx71O8OHzF5ZcUxDQHNZEZCS0=; b=Z8skRNI8Kcgu
	c0W9sUdU3TDlsm8OXliG3YCeElcNH3QpWdVWizwJdrIFR+iQW2fTUGOYBrYaXFbd
	CyhS/uR6Ut7uLKF2xNxgRIuIBs17sHgmZjSMrxGW9KH+4MN9naHkdeRriFrAohVW
	vfHQz1dSGpyjgCLvaqOwag6psOFh+HJuDPbx9cTHmeWwREhCZIkY4X2+AaFF/Dvy
	kGrg2DILJTMpGripYvo/Y1IL0Oqu/7F8jFObh2oUx26roy2WrlImdMezjDdH77O1
	4kZjUU2cj/sHnXRPt5sL+QVLO+vQdPwYEanakMPwmWGDzEvcMBUCanPDFHgWqQ/5
	7WAqLJNTjQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012008.outbound.protection.outlook.com [40.107.200.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb376d9sy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 27 May 2026 06:00:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mvdlgdCkK3aD3YprofdqHRVEGch+2BUq2BPR5JwMTHmXRcVzE3cWRHZaqLH5MY4aBjMjTjwO5YW0ujr9eVytU4olrkfwvKSzar2tRGHUjN0e2bOEpQ5sDDVFHrwlUPbA/mhzcnAHjWTLSee4Nhsyu2cZ70vi2WgAzLp/OxKUi0IbaroQVmqWzsq7kEsuyHv7Uwge2o5B3uPhAKdWJe5QY1AwQRMZChKVi43HYlaOoeG3ZsNSs1zGIvEEy3pj7Tz2jl2l94zZJAqjVcAWe4cp+rTbsmzrhZ7qmH1eCXd9Wbb0oMRLVi0fdS6joz/wV49kFlKxpfaD0o9+dwXxZT7QFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XpZu8jpdBG+bGxdf4RHx71O8OHzF5ZcUxDQHNZEZCS0=;
 b=w0+ruh8mG0HNhzgbQK/fVJQIOP2o2Of4+ix0e1JuRxOWIu0vLZLGVM1+pHvU3+HEsVoJwg8jsQOTZoPIYDFPgwn55ta5dXOB7dufISNI9AwY65XVrDNzAWFwrgqvHbYpI6j1U51oA+EjunalaRUNUq4dGWgdO0yyfyRLnmu5tPz/r/qLd+g18XxKx4wztmLtVoDFy4vl1ZxGVGNiAGdrFVF/1mk+7zl2AZUyhHaY3FURRl9XgQeFHfGkPhKGH9nu4G1Uqrk+yD81EstACD5kC827/BUMaOa2awOYTGdNljUrA4+vww3Hq27+5CjFXcTplHRYjZcBGS/sX3UaiFpEMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV2PR11MB6069.namprd11.prod.outlook.com (2603:10b6:408:17a::9)
 by IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 06:00:48 +0000
Received: from LV2PR11MB6069.namprd11.prod.outlook.com
 ([fe80::d94b:502e:dc16:ad36]) by LV2PR11MB6069.namprd11.prod.outlook.com
 ([fe80::d94b:502e:dc16:ad36%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 06:00:48 +0000
From: "Fu, Rong (CN)" <Rong.Fu.CN@windriver.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization][PATCH] containerd: update to v2.2.3
Thread-Topic: [meta-virtualization][PATCH] containerd: update to v2.2.3
Thread-Index: AQHc7Zxyu0iwQjf+s0aWeJgJjn3LobYhYHlA
Date: Wed, 27 May 2026 06:00:48 +0000
Message-ID: 
 <LV2PR11MB60699886F5B7B0F9ADD4EAE5D1082@LV2PR11MB6069.namprd11.prod.outlook.com>
References: <18B35609DDB796B7.4036453@lists.yoctoproject.org>
In-Reply-To: <18B35609DDB796B7.4036453@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=37f120fb-b349-46fa-ad1f-92066af6b3ab;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-05-27T05:58:32Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR11MB6069:EE_|IA0PR11MB8379:EE_
x-ms-office365-filtering-correlation-id: 7d8602cb-0839-4a6c-db1b-08debbb54cb6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|13003099007|38070700021|56012099006|18002099003|22082099003|3023799007|11063799006;
x-microsoft-antispam-message-info: 
 MIDdOT0YRnRPEs9yuaTTfV7aQi315cMt506c5IoXvavDtv91YFn/B/blAaTdxtkFezqSJQrA9pkiSovUf853IT4wJEp76inaAglbqNEFEiCabDfSSUJKmOTUiK4C2NeDmUADUNrAsqRoTZWKDrUE82WmrQqI2AznfONfMDU6GIbRRZLhBoB4iX21Tp0q88p6iuhZMKT/wKGLiDZqk2vgHjex0wD9UzUab0eR5+MRz15hq9WeNDHA/14ughMk1s45m1uLsjTQ/2QOm0DD12uoxWRe9joU5JhIR+onhCUGOsy/AyldJ02ALq5OF6CNRO0OXnXmXsezQk5NZnuC6utYMye5zFKfX4+LZG6c4zbSTDxLMOMq+yrhr6KTYaOFnbdic0rcD9iv+7utA0ZMApSK1bDA6cWZkxtoke3exRhXlf/7pURvAPev0y2x9UYmdTPjaVM8WJStZrPZxIMgigwPL8d8MWkYfLy9NE0kLAxmO/n1SkSRQ7tsfRoaNs1VTKLaH3/xAlKW5HEm3J/+NPzLG3+tPhWixhWq6tSDHlXVg5gckGmI9i1z+jo7busukWKcOmP8/i4PdNvL3o4Hq0Sz+hLnQqpBCN3NTRB0vb47xeMd7yv6SVthdUsMkQ1VOFAsJ7ukOsZZyObEVDM0ftAu8HK2+jL8txPkL+1NYgGBwhWwhrA0x9Otcl/hHqYvHaP8AF+58pKy1adObnWv55/ymPlw/0xR1ScHpSM2Wn878AabTSk2vlWkwfr+QxbVt0Lj
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR11MB6069.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(38070700021)(56012099006)(18002099003)(22082099003)(3023799007)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?Q1hWTlVKU3UxTnVzdWNhWkhMVXBpNCt6YUN6bGhzbmZ1MWJTVStHdmR4ZWhQ?=
 =?gb2312?B?MFhBQ2ZmUWFDclFaSXEzd2paNGVLZEZINE16U0VDK1ZFL3FvR0FpenFTUVNo?=
 =?gb2312?B?NFovd0VoeDJHUjcvd0NyU0hZanlNWHorODZrZi9nb1hTWFhQT0RjVXRtVnho?=
 =?gb2312?B?OEU4aGZZTVV5TnVIaWdjMWdUZ2krRjlWUWZyMlg5dzB3Q1FuSEtCV2I1ay9Y?=
 =?gb2312?B?L2VrY1hudS94ZkN6NnV2TEVMTHVrcWgxUmRTT3ZuSUtJVzFuZmprVFA3QTli?=
 =?gb2312?B?MXJjbGo5YWMzRU9qU090OWJkQVNlbjdxNWpHM2NqWE5yN3p4eHQzMFVGN3BP?=
 =?gb2312?B?NHdKYVA3UG9NTFA4OGF0Z0JVY09xZ1g5N3hweXBUY3lFWWlsSTZ0NXVzeHh2?=
 =?gb2312?B?cHpXL0V6cThUZW5tQTNSZzI0dzJxOXUxZ3R5bldLQWZWeEJXY3VZOWhDWURk?=
 =?gb2312?B?QkczTkt5R2dNSFp3KzNGRWdVUmFoOGlURlRsMWdTdmJneHc4QmpGdkEzMURI?=
 =?gb2312?B?UUpmTWtRQUlNTUJUc0dGQkpyd2NZdnVldDVvUGZ6Ry92NzNMZitFMGszYUll?=
 =?gb2312?B?VDBjOW4raFpUR3lXVDJVOXpJbWM1ZStDdVVMcmtOVXRSeXZjZWtidkpCRzc3?=
 =?gb2312?B?WXFUR245Z0w4UXlZcThsd244RVhTTGoyckxiTWN4Q3oraHVKdmhmenNlMFB6?=
 =?gb2312?B?T2dFTmVFRHFEanVTTkx4VHZ2MjVCSjNQd0pQTmJVWXVCdUg1ck8wQ21TY2Nw?=
 =?gb2312?B?YllHZVl6NmtRUFVmNjJqS2RaeThjZ2c3Y3EyckZ3cDkyaGRzVDVremM5UHBy?=
 =?gb2312?B?Qy9HcDFqZThXaFAzWFZqZUZGZzZsbGVmUHJldU80TE9QQzMvUUM3Sm80WHZO?=
 =?gb2312?B?VkZKSzd4eUFLdklTUzBGaVpoa0NxRDRLUnV0VEFPMFBLUEo1M2xFMjVXRDdT?=
 =?gb2312?B?cjY3MTR5VUVxcjhnT0dvNCtNazcrWFBmRk9YeUFzYkNwNklzVFdaYVFjYkJR?=
 =?gb2312?B?SnJqN1czem5TMEtEUTJwMDhUT3Rzck5vWnRZTXZGVVdDOUN3dTlvcVBoclQx?=
 =?gb2312?B?QVlJQ2h1S1VUMjFnLzZFb2NNYk9nelNJNTFweXcxU2k0SUF5RUErcnR2REtH?=
 =?gb2312?B?RlRiZFd6TkQ5MkM2NThnMEFmdVM5Yng5dTNwRWp2R3NMUVlFM3VhSUVVZHlJ?=
 =?gb2312?B?dmZTQ2JucmFpWFBMWFd5eXRNOUlWZTZITXJKSS8xM1FLVEJrdlV0NWRFMHpz?=
 =?gb2312?B?TXBsMzhQbnVwYko1SU9FSytiLzVEWVdBbjRpMXY0UkYxS0hZbnNCT204eHJK?=
 =?gb2312?B?RGJSQkVIMDRSYjd6U2tWOGUxSWZic2FUUEpyZDJvOVpXTnVXcWtIdWwzWUZi?=
 =?gb2312?B?ZjlnNkpNME43N2VReHAwWDNYb1N4VjVDNS9zbzBydTNCcGZVdmJDYk5DclFX?=
 =?gb2312?B?QzhTVlJ4ZFUvdWJoT1d6N2o3VXNhM0E2OHl6RWpNYUN6NlFWeVE2SDVjNEtq?=
 =?gb2312?B?OXJ4WmN5RXNBNjI0b2h1ekVxR2FKcGpNN0FIc1lBRjJobjA2WkkyOVVFMTdI?=
 =?gb2312?B?MmNIb2NEaGVEZzU3RTNrRlg0M2MvS05IelczdUxqMjZLVW16RXJBOWtlMEo2?=
 =?gb2312?B?eWV4eXpNZmtlQ0NncFM0WnFBWENYOW82YkErOGc1NW1qV1I3OWxucUNPSzA0?=
 =?gb2312?B?eDVOVzJoakJ0L3hPTy9WdEQrVWYvdy9OVFhveHNvTFdXSmQ4dTNEVVF5K0Z2?=
 =?gb2312?B?bk1EOXg0ckdzTDhnK21BanFERFhDMFlnL0ZvWllEZFNGMCtiYVJKS0VRMTFI?=
 =?gb2312?B?QTY4QXlsenk0Ty9FczkxYld6cTBwOVVwb253RHFjdTV4Y043Z3VaUEU0a1JF?=
 =?gb2312?B?aXdHQmtyY0JESWZaemFRZ3NyRWNzTDEvVUp6L2tkK0VGaWlsdC84dUxYOXg0?=
 =?gb2312?B?VkVwRFI4N0Zma0t3ZUlGenFoYzRRQ21KanhmSEZ2d2hET1RyUmptbVl3NFZz?=
 =?gb2312?B?QlRydmpuZFNZRzUzSjF2VUY1bTdkSit1VkpZdnQyUUNUczhLS2Q0QXFNTGcw?=
 =?gb2312?B?bkhzem15ZE5USXFyRENIbnN1Zm94US95NldpcTRPczFYYnFiem8zTVVYRDRH?=
 =?gb2312?B?V2JIVzZwWXNSWkNwcVJNR1Y1dEZ5ZnRhTDJWSUNYRUJCMC9haDZsdzArOXBa?=
 =?gb2312?B?aS9KSWxYWEtQSEVFMnhaTXRMeTUxckFkMitzSkVnRGhpd2M3NXVVTnovMVJm?=
 =?gb2312?B?YUQ2TlRHNHNyNVUyUTlmMGpaM2M5QzRONWRGRkxiVVNiWXJNRHZSRU9Mb3pR?=
 =?gb2312?B?NW4rT0dENDMzdFd1YVZRVUM1ak5ZUGlybTk1UXcrY2ZEMUdZS2RtQT09?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	QYA7Oc2c4rLuyz3slww1COrirGXIoBW/hU4q8e+Lo7Fj0/YtWw6hP/aepMHmi4HKeuSny4ae+hXB9onCgxswQUGQ0GkM4mesFtiTBOu3xoWPWjABosjMfChjaadfixPFOhgTMZ1i/J32y5+RlPUXu/j4rlO+bUOszhBf+Ttcvsc3+aY/fn4ogTYxRvK+aCDUE+KIVNKbS6jzsy58exhf9eDbRz1WIbOF7M3X8N2FJa0ftlgbYF0N2GSFS8gWFXaixj8lyk4HO55Aq/zabrXmRJt0b595M7Kn/gGPH/BDWlzppLXQ3QDyA5j4ln5WL5DHWmFxpIpw1G7eZgtn/0X8hw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6069.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8602cb-0839-4a6c-db1b-08debbb54cb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2026 06:00:48.3588
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lxzV4k3ZWxEtwUV92BUoqKeppSEStzXxuKrzXyemBqe/CdqUKgt8tslZyvg6LtJbAo+2wJmKveqRm9bP8QHJ+BgweTroinwS+knfwowANsU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8379
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA1NiBTYWx0ZWRfXzHvI7pPf8ja0
 gdn/+bJeMm0RzA7129A3SWUVGuxBn8tHfayLjq4Bh4JR4PqAC41ZvabC5SFa6MRklUu14G2w6WK
 T82s1nNwhcR41bb0SWTODK3T2Pnlkpthb9vtRuBwnltXgUfzLWlZQ0xsD5yUx9qWw+06lE2hee8
 4ncRJ+4oLvAltJZ5Jyfu3nOgT5b86GbfOheVZNQtk4chotKm+eVjjf9gJ110DKVLlEwF+hvJMyB
 1useTkQEE1l3maGLcKtnvMdikyjbNTJlVFjowBzpISY+3Z6WvBeeikBm9uQRCyYKT1rOUVbcJ+D
 P83JkBghT7UudsU2hdG4803qGGYEUBP1J9+852BMEJTYbM6M/9fwmnEN+PPL/n4oUXtuy5tohnr
 DdZ+MWG/t1g9/wAM8a8J7DUSPC81FTZlSRDg4XTbF2gWTXKvO3JTXBp75BZbtYmFLJQqKWMZDZL
 xTsj5jGzfyF7SXWT2/A==
X-Authority-Analysis: v=2.4 cv=M5B97Sws c=1 sm=1 tr=0 ts=6a168894 cx=c_pps
 a=FIc/ztLQykAcit3pFYQDUA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=_l4uJm6h9gAA:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=qtKB1SZKmkC5mqyP2_AA:9 a=mFyHDrcPJccA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ZOtxV8ysF7ZRVroshtV3X2dmTHNJN9UA
X-Proofpoint-ORIG-GUID: ZOtxV8ysF7ZRVroshtV3X2dmTHNJN9UA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270056
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 27 May 2026 06:01:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9817

SGkgQnJ1Y2UsDQogICAgICBQbGVhc2UgaWdub3JlIHRoaXMgcGF0Y2gsIEkgbWFrZSBhIG1pc3Rh
a2UgdG8gc2VuZCB0aGlzIHRvIG1hc3RlciBicmFuY2guDQogICAgICBJIHdpbGwgcmVzZW5kIGl0
IHRhcmdldGluZyB0aGUgd3J5bm9zZSBicmFuY2ggc2hvcnRseS4NCg0KLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCkZyb206IG1ldGEtdmlydHVhbGl6YXRpb25AbGlzdHMueW9jdG9wcm9qZWN0
Lm9yZyA8bWV0YS12aXJ0dWFsaXphdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiBPbiBCZWhh
bGYgT2YgUm9uZyBGdSB2aWEgbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KU2VudDogMjAyNsTqNdTC
MjfI1SAxMzo0OA0KVG86IG1ldGEtdmlydHVhbGl6YXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9y
Zw0KU3ViamVjdDogW21ldGEtdmlydHVhbGl6YXRpb25dW1BBVENIXSBjb250YWluZXJkOiB1cGRh
dGUgdG8gdjIuMi4zDQoNCkZyb206IFJvbmcgRnUgPHJvbmcuZnUuY25Ad2luZHJpdmVyLmNvbT4N
Cg0KQnVtcGluZyBjb250YWluZXJkIHRvIHZlcnNpb24gdjIuMi4zLCB3aGljaCBjb21wcmlzZXMg
dGhlIGZvbGxvd2luZyBjb21taXRzOg0KDQogICAgOGEwZjRlZDVkIFByZXBhcmUgcmVsZWFzZSBu
b3RlcyBmb3IgdjIuMi4zDQogICAgMzFiZDM0YTA2IHVwZGF0ZSBnaXRodWIuY29tL21vYnkvc3Bk
eXN0cmVhbSB2MC41LjENCiAgICA0MDlmNzViZTggZGlmZi93YWxraW5nOiBlbmFibGUgbW91bnQg
bWFuYWdlcg0KICAgIDEzMzZmNmM0NSB2ZW5kb3I6IGdpdGh1Yi5jb20va2xhdXNwb3N0L2NvbXBy
ZXNzIHYxLjE4LjUNCiAgICAzZjMzMTQ2YzEgdXBkYXRlIHJ1bmhjcyB0byB2MC4xNC4xDQogICAg
OGJkMWI3NGU1IHZlbmRvcjogZ2l0aHViLmNvbS9NaWNyb3NvZnQvaGNzc2hpbSB2MC4xNC4xDQog
ICAgYzZiMGJlOGUxIHZlbmRvcjogZ2l0aHViLmNvbS9NaWNyb3NvZnQvaGNzc2hpbSB2MC4xNC4w
DQogICAgMmVjZGU4Y2ZlIHVwZGF0ZSB0byBHbyAxLjI1LjksIDEuMjYuMg0KICAgIGJlNTU0ZjQ3
OCBTa2lwIFRlc3RFeHBvcnRBbmRJbXBvcnRNdWx0aUxheWVyIG9uIHMzOTB4DQogICAgNjYwZGUx
OTViIFR3ZWFrIG1vdW50IGluZm8gZm9yIG92ZXJsYXlmcyBpbiBjYXNlIG9mIHBhcmFsbGVsIHVu
cGFjaw0KICAgIGJjOTI3NGE0YiBBZGQgaW50ZWdyYXRpb24gdGVzdCBmb3IgaXNzdWUgMTMwMzAN
CiAgICBjMzg3ODkwYjUgQWRkIGludGVncmF0aW9uIHRlc3QgZm9yIHByaXZpbGVnZWQgY29udGFp
bmVyIGNncm91cCBtb3VudHMNCiAgICAwNDdhMzM1YTYgRm9yd2FyZCBSVU5DX0ZMQVZPUiBlbnYg
dmFyIGRvd24gdG8gaW50ZWdyYXRpb24gdGVzdHMNCiAgICA5YjJkNzJlZTAgUHJlc2VydmUgaG9z
dCBjZ3JvdXAgbW91bnQgb3B0aW9ucyBmb3IgcHJpdmlsZWdlZCBjb250YWluZXJzDQogICAgNWI2
NmNkNmEwIE1vdmUgY2dyb3VwIG5hbWVzcGFjZSBwbGFjZW1lbnQgaGlnaGVyIGluIHNwZWMgYnVp
bGRlcg0KICAgIDU4NDIwNWMyZiBbcmVsZWFzZS8yLjJdIHVwZGF0ZSBydW5jIGJpbmFyeSB0byB2
MS4zLjUNCiAgICA3N2M2ODg2ZGYgSWdub3JlIE5PQ0hBTkdFIGVycm9yDQoNClNpZ25lZC1vZmYt
Ynk6IFJvbmcgRnUgPHJvbmcuZnUuY25Ad2luZHJpdmVyLmNvbT4NCi0tLQ0KIHJlY2lwZXMtY29u
dGFpbmVycy9jb250YWluZXJkL2NvbnRhaW5lcmRfZ2l0LmJiIHwgNCArKy0tDQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL3Jl
Y2lwZXMtY29udGFpbmVycy9jb250YWluZXJkL2NvbnRhaW5lcmRfZ2l0LmJiIGIvcmVjaXBlcy1j
b250YWluZXJzL2NvbnRhaW5lcmQvY29udGFpbmVyZF9naXQuYmINCmluZGV4IDUxZDdjMmUyLi5i
NWZhNWI5NCAxMDA2NDQNCi0tLSBhL3JlY2lwZXMtY29udGFpbmVycy9jb250YWluZXJkL2NvbnRh
aW5lcmRfZ2l0LmJiDQorKysgYi9yZWNpcGVzLWNvbnRhaW5lcnMvY29udGFpbmVyZC9jb250YWlu
ZXJkX2dpdC5iYg0KQEAgLTUsNyArNSw3IEBAIERFU0NSSVBUSU9OID0gImNvbnRhaW5lcmQgaXMg
YSBkYWVtb24gdG8gY29udHJvbCBydW5DLCBidWlsdCBmb3IgcGVyZm9ybWFuY2UgYW5kDQogICAg
ICAgICAgICAgICAgc3VwcG9ydCBhcyB3ZWxsIGFzIGNoZWNrcG9pbnQgYW5kIHJlc3RvcmUgZm9y
IGNsb25pbmcgYW5kIGxpdmUgbWlncmF0aW9uIG9mIGNvbnRhaW5lcnMuIg0KIA0KIA0KLVNSQ1JF
ViA9ICI1OTU3ZDMzMzRiY2FlZGRjMmJkOGU2NjVmNTNjZWUzMThjMjk4YTJjIg0KK1NSQ1JFViA9
ICI3N2M4NDI0MWM3Y2JkZDliNGVjYTI1OTE3OTNlM2Q0ZjQzMTdjNTkwIg0KIFNSQ19VUkkgPSAi
Z2l0Oi8vZ2l0aHViLmNvbS9jb250YWluZXJkL2NvbnRhaW5lcmQ7YnJhbmNoPXJlbGVhc2UvMi4y
O3Byb3RvY29sPWh0dHBzO2Rlc3RzdWZmaXg9Z2l0L3NyYy9naXRodWIuY29tL2NvbnRhaW5lcmQv
Y29udGFpbmVyZC92MiBcDQogICAgICAgICAgICBmaWxlOi8vMDAwMS1NYWtlZmlsZS1hbGxvdy1H
T19CVUlMRF9GTEFHUy10by1iZS1leHRlcm5hbGx5LXNwZWNpLnBhdGNoIFwNCiAgICAgICAgICAg
IGZpbGU6Ly8wMDAxLWJ1aWxkLWRvbi10LXVzZS1nY2ZsYWdzLXRvLWRlZmluZS10cmltcGF0aC5w
YXRjaCBcIEBAIC0xNiw3ICsxNiw3IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9jb250
YWluZXJkL2NvbnRhaW5lcmQ7YnJhbmNoPXJlbGVhc2UvMi4yO3Byb3RvY29sPWh0DQogTElDRU5T
RSA9ICJBcGFjaGUtMi4wIg0KIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1
PTEyNjlmNDBjMGQwOTljMjFhODcxMTYzOTg0NTkwZDg5Ig0KIA0KLUNPTlRBSU5FUkRfVkVSU0lP
TiA9ICIyLjIuMiINCitDT05UQUlORVJEX1ZFUlNJT04gPSAiMi4yLjMiDQogDQogIyBFWFRSQV9P
RU1BS0UgKz0gIkdPREVCVUc9MSINCiANCi0tDQoyLjQzLjANCg0K

