Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3048E9462B
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 02:58:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11939.1770692293977176518
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Feb 2026 18:58:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=E68Vb518;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=65019f41a7=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A2TdP31152362;
	Tue, 10 Feb 2026 02:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=miBwPtR7iLmbj+hqR3TueaUqRndgnV/KbFFHJou9pvw=; b=
	E68Vb518TmibTa0SyA2b6c7aDgY+khZuv0AzAxvFY5OF4aXmsz9wJwIypX5OnDVS
	UkHpHOBdaYi585SS3x+LvNy4W0lJcd3/rgk9oHpH9ZQU4BAhAg8ecuu7c/YEaAW8
	MCi9v3OBGsvHoPXhBsIvpmG/g3xKVxn9M+afznG3ADsL84975HgwtRS7S8jaPt8h
	hqNeky22WRkQ/s3G+DnKYeGx0dwxqKHG+AA/x8AWq/Zr+wbWBaOQ3MMqRtmIPQSV
	QFHjAssO0ImlslnYssdAjdr0BGFb/dhh/Vk2k6L0jlCzxlpm8maTwEwQGf6XAxSz
	pGv39DflwvOJwtP40vmJHA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013031.outbound.protection.outlook.com [40.93.196.31])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5tkwjth7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Feb 2026 02:58:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f/5jM2W8pgdH/wcJ4VMRdSq5bnFYT03NUEeN8OQOBgtQiBGhvPEod0Xe1bdG5nphbG7S+DHKIrfW+TTSpcuCWOt/KEQh73B3V8IAKvkrlUeu81Cx7U7AwqSD5b1FKuoADmWg8+J/AsvtRejS/2sThOmnhdE/6nvS38V1Ht8kSXxKyuuxLWe07PngjIp1NRp/PIxqEj8N4QuTKZd1cFL2pdnk1M1zO+aKb/LNsn82iVHp7J7B+jLcFodkpljF5wdYivUtomXj0p36G23txeyChrefzHEeGdR8FMkZ2vHQHq0pbmGdI9WdV8e3RJ4dyGuxq6hNWGu7aP41IgK2Y5lUwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=miBwPtR7iLmbj+hqR3TueaUqRndgnV/KbFFHJou9pvw=;
 b=dPgd333iVjp6W5wPe8P+lo9qW7AtV+674x3OL7hTrU9wNioQNy2dhAaKWB2oI5bwee0Gk/uoNMgbfJx+cydppgG6YXb+6258+7RwbLFyCHfHL0UhzVr3Igxn9PP1vWo3yKK2Alh8CSlZu+oFTSMtpWBsr544DZ/UhlB7ugmegUdT5+lxE/gih95Y7KAkaQgTuIs/AnmwsWeh859qbueUExg5x6Tq9b9E6JXybWyxznnx2pc+MQbhHIFFf1C4UJzqnvZk0xqcvw8S9/SXQi08al43N319sSJu34UR8CkBsuyQ6vA0lJuBusF2b32YWsxVU1WsfBsof91nRE6Y2GaqDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM3PPF208195D8D.namprd11.prod.outlook.com (2603:10b6:f:fc00::f13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 02:58:10 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:58:10 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization][PATCH] nerdctl: use -modcacherw to avoid
 do_rm_work failure
Thread-Topic: [meta-virtualization][PATCH] nerdctl: use -modcacherw to avoid
 do_rm_work failure
Thread-Index: AQHclMBx4bq9U9jyyECfiqN+k9hAu7VzVuSAgAd+4gCAAHLXgA==
Date: Tue, 10 Feb 2026 02:58:10 +0000
Message-ID: 
 <CO6PR11MB5602577965612FC6F34FF0DCED62A@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20260203035140.902906-1-Qi.Chen@windriver.com>
 <CADkTA4PmJ16DoD8sdN1XrU3ATJY_Q-MEwCZX9bpk61QY5+qoYw@mail.gmail.com>
 <aYo-YEn4nriQZ2cg@gmail.com>
In-Reply-To: <aYo-YEn4nriQZ2cg@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=a94e0f38-fb58-4393-8506-41203fbbf8e8;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-02-10T02:57:57Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|DM3PPF208195D8D:EE_
x-ms-office365-filtering-correlation-id: c336816c-95a6-496d-e55e-08de68503959
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|4022899009|376014|10070799003|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?TDZKMVgzNzhKaE9RTU94a0RSZldXL2dDdExWa2xhcWs0MFQxTC9KYnFmU1pk?=
 =?utf-8?B?NHJYUCtYSTB2OHIrczZsaEp4TDhIaFdqOXBhclBRNFkrMmpJbUExV2RIcDRx?=
 =?utf-8?B?YjR3WHJHV2xrdXVCSUI0V3o2d015VG1ldjk1NUlyYTRhR0xzemFFN0pjRkR5?=
 =?utf-8?B?YWpoSHNWUFF0U00xVkFKR0R6ZVljVEZnQkhUS2FSTEZZak12RzMvZXA1ZXVy?=
 =?utf-8?B?MXphNGFJNVB6eDcrWEJrbTJORGp0ZTlJdUE4MU5lNnRBcUw4NmZYK1JObEVl?=
 =?utf-8?B?WDFsOGpVSDNGaFFSQlRFNVV2REZuanBkeWN2c003V0tjZ0lyNThsVTFLOVlh?=
 =?utf-8?B?WjVZbEhtMXFKS2ZtM29LYXBtdGIvZHNPN21nQnkzMVVRMkE3Q3hRR1YvVlMy?=
 =?utf-8?B?M3RjUGVuWGh6bnMxV3F3M0FvSTNTbWVxUFNvRXUvaE9qY3dLK3RRWVB3ejRH?=
 =?utf-8?B?ZzJIdDlEUzJ0NXpSNDNJQTZOSklGdnR2MEJhbEh5N21CSTFEOFdZQ3Y5VG9B?=
 =?utf-8?B?b3ErRURidXV5ZVJDQXVBUHk0U0lvR1RpbWQ2MTY4UTRyN0MyeXRWdk1lU0x6?=
 =?utf-8?B?M3lUdUxHVC9kYmxWTWhWY2RSeWt6RlluS01JZDNCU0s5ZXUwQmhRUG9LcHpJ?=
 =?utf-8?B?NUtxNnpqWWcvS3hjMG53QTYzSXVrSHRVSWVqa2VFbnhla3JmSHg5ekZ5UDdN?=
 =?utf-8?B?U2JEOWk0Vk9VU09rMHM0UDZlQUxaeFJSTjcxQURFLzJTeFMwYTRoSUQzVmxv?=
 =?utf-8?B?UGtsSXdqaFdjZ1JwbUhzbUxqdEE3VisrczE0Z0YyOGttS0VjSHdrTkxFYUNq?=
 =?utf-8?B?NEZzMlJIaXh1Sjk3WHYrQnNXVmxLdHdrYmw1SSt1U21ocE5pR2dkS20yaE5j?=
 =?utf-8?B?eGJES3JIRk9MY2ROSlZOcWJhZmlpQW16c2I1blNoNlA2REpweGp3Qkhqekha?=
 =?utf-8?B?RkNMM1BIcE5vc3FKRkg5NWIvcnRWV2N5dkx6TExEaWJSQWtZOEdUcmRPaXFu?=
 =?utf-8?B?NTd4SDJWTGxmWmxFVlVJMTRMSmhGR3dsQThRc3ZiUmkxVVVjTEt1TkFZRkZ3?=
 =?utf-8?B?a212VlduTHprSGFwMFNFUUNrMHhTc2lISmRjOHRNengya3VKeGhZZ09Bbldz?=
 =?utf-8?B?NXhLTHNjRjVxTTlYZVFOajJZU0p4bTk5bm5xc0V1NHRUbkoxM05TMFdPTmx3?=
 =?utf-8?B?RjhCUVllbUtnZEloS2JPbnRTTlVFTVZJUEt5VUI4WVNUbTBxMmtnWnlGUEZQ?=
 =?utf-8?B?SXdnMXM0Ukl5OWxDeG82V0dFeXNtbCs3RkZqSzNKNk9rSGVyMTVvaFpqN0Y2?=
 =?utf-8?B?dXRXb0d6MVVucTRRTm9sRHFOTTVabEhHU2R6ck82QmlQZm55a21MZnU5SUR3?=
 =?utf-8?B?S1pZS1YvMFRLbmw3TjhlOVVjcFZLdXM3ZDVnc1JVTHRrNlc5Z2NlejBBeGJE?=
 =?utf-8?B?dmVRL3BCRjR5VnhxOUZndktYcUFBZ1dXNEliQVFzT2tqbTE0bmVTbFdCNUtw?=
 =?utf-8?B?aCtxM1RxYmMva2JPdC9SUVNheXpERTdBdnU5V01ld3pMVFRaaDlWMFd3WHNi?=
 =?utf-8?B?WkdvWCtncG5OTVZXVHhmdHN1aUh6TlZPYnNlTzZzd2w3azRFeHNKbldIM05X?=
 =?utf-8?B?S0QzWXd2azJaU2VFdFBtVFJmWU9zc2lEU2JCOWhQSk1aZHlYZkN5NUdkMmtM?=
 =?utf-8?B?czg3NzBsODl4NE05cVc1azRFbHpBNk1RQktUYnl4NHBlWkV2TERHVnlkdE9V?=
 =?utf-8?B?dUJPbjNiRkQ0NWpBUUFJcHVNK2VieDVUVHhhSHNBdXY0Z0lqT1BKYzJ2TEZT?=
 =?utf-8?B?UDVGQ25hWS9WV1B6cEhHalRaOExpam1FS3d1NHNJOGNLM0orYkt1eENCc0Q2?=
 =?utf-8?B?YUNQSzJQT1BadjNaSDkyRkd5ZUJRTkRjSExVVTJXeUVMbkdOR0pCK2RiTDQ3?=
 =?utf-8?B?YkpPUUlIc0hUcXZ2K2FGRHUrSHRLVlRLc2d2d0M2ZmdrNlNobDNhV2dENDBS?=
 =?utf-8?B?d1BPdGtvOUxVSjRtT1JjVHp1RWRiR3BxOFhzMzN4V0lXTnQ5OEtNRXdUS3RH?=
 =?utf-8?B?c09MYzQ5WU12b25wOHcxdkZ6MjMvaFhiU1B0cUNQeksvWmg2ZUhXaFFlb2di?=
 =?utf-8?Q?1f/YasWRQWU6qsakgZNd1/G47?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(10070799003)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NVFyYVA2NzcxOXZjOFNDcVVlbDlVYi9idmZGTmF4VlNmRXFvTGlCQ2lWc09H?=
 =?utf-8?B?ajJSZFk1N3pxVmcyOVN4cVJlWmVuRW1yeHFiWkpzdUc4ZmpHZXZDQ0dhbWhX?=
 =?utf-8?B?dklCd0ZveWNSYzFIUm82SWkwN0ZNc28yMENzdjRYclk5ZzFHZy92L0Z0RURt?=
 =?utf-8?B?R2xncUgzd0txR2ErK1hrMERsaHBBMWVlM0FlcWYzUllEY2FIaUgwdHNENkxI?=
 =?utf-8?B?dHBwUnlyTmduczZ2c29yWGJuZE9vbFJuZEY2SHd3WjBHWXBCWm5MN1h6RHdL?=
 =?utf-8?B?dWRZWTJNTnJXRndDNHZFaFZVV2FodlVCUUNhbHVyaUJIWUNKUHptaUJTb1p3?=
 =?utf-8?B?aG1Tb2FrcmVUTnFuZSs1dE1MOVQ1a2p6VjN1UExiaDZsY0U5ZEdPS3ArTzhC?=
 =?utf-8?B?THlycVNwTlQrdkE4NEs3eVp5MjJncHFXenM4M2VoR0Y3ekx4RlQyQW9ObW01?=
 =?utf-8?B?TUViSXkrSnZHTEh6YkxmOWhJYUJWYVgwWmprTkQ1REh5OGZRdWJuc1JNOTlT?=
 =?utf-8?B?K1ZqTGNuUGhpY3d0bHRoZnUvWXVjZHVtdDBmUHpZYXFLeWFzbjhRT21PYTB1?=
 =?utf-8?B?ZTBzSEhLb0I5cUJXcnBjUGFubDN6UXNXS0l6T3JGL2l4cW5JRWR1dVRHenkw?=
 =?utf-8?B?SThvQmpNZGgzTXNTdkhtejFxUElrVlcyTTNZK2xGVE52LytKb1U2VWk3MWFT?=
 =?utf-8?B?aWpaUE5zVmhjTXVNY1hGNk81cXk5ZVRLVzhONzFuemlnM0hvTjUxZG9EOExm?=
 =?utf-8?B?cXRrUFNVNnlIVGZOak1GcS9NQk5lNjlOQVJVVEwvOVpzVFpLdXpNQU14N0pw?=
 =?utf-8?B?NkEybWVzMzhMbTBNQ0RFc2VJYVpHejNYaG5UOEdGdTY4enIzYXVzYzcrTWR2?=
 =?utf-8?B?Qm1WRDNDTmpKTmJFKzJ0SlRZWGxYb09CZm1tWjV5Z2hXRW5oTDk4OUJqUEV3?=
 =?utf-8?B?dUZxTWVtRThQb0FRcWRWRENDNnEvWjVGMTIzSUY5RndvYkJtKzdlUldyRTIw?=
 =?utf-8?B?bjVGbUsvQmhVZk0xc3J6U3h5VmNLdExJYnRBZWsvaWI3ZnNodDByY0NTblBV?=
 =?utf-8?B?QWhtTCtDd2xUSEUxc1ErVSsreDhEK2tvTlkyMmJyNTVwVENCMWplcmVrMUtm?=
 =?utf-8?B?b2wxc1UyV1Z2M0VpaDJQc2dOczR2QW1HWU9QT1RyS2hCTW53cVlSb0xBcWx3?=
 =?utf-8?B?K3pmQUVmejNWL2FDdTAyRXBEOVhYRU1HSGVaSlM3REdwWFNwWmw1aVJ4clI3?=
 =?utf-8?B?UnBHMUJoSUlvcXA1VHl4dmpwY1pVVkNISXVJVFV2YUxsd21RMmIyWDMvL2Fs?=
 =?utf-8?B?eG5uZ214bjBGM0ZObjd1Z0pLUS9nWlY4QngrNjVMb0xMaG9LL0RLdXhhc2xs?=
 =?utf-8?B?T3pwclVLeU9OZ2QzTGJXdHd3RGFVT0JoNDdQQzFJNVMrb0ExTUVLbktwZ2xt?=
 =?utf-8?B?VzhuSG5vMUFaKzFZSGhCTGVvUzdjcm9QY05pT0hycG43T0greHROREtuYUJo?=
 =?utf-8?B?SkgzVlNQejR6RURlTnF0MFpGMkVqcTBocjhtR3Nhdlc0YkdMRGVSdDIxdkRx?=
 =?utf-8?B?UldMV1R1QnMwcklLSTlzS2NqOWtaVkZDNml4Mk9lcCtnM3BnT2o2L241V2lj?=
 =?utf-8?B?MU5nMTg2RnFwMmE3dEZBVmYxUGFXNTVyTm1LYU5za1dDeEpvdXBKa1hZdUQw?=
 =?utf-8?B?QTUvOEp3aDYyR21OM3p6aG40alh2TFRsVXNoNXdMUUZaN0tsNElxUGpNZ2xH?=
 =?utf-8?B?MnpkaFVyZEl6blFNUXp0YUN5a1ZJZzVmODBmMXRKSEtzcUErQmUwdmh0N25X?=
 =?utf-8?B?S08yZ3lkWjAzVU1BZWgxTEdyNXJlSjRCSUt3ZE00cy9yVTl4OXF3ZDBWcUFh?=
 =?utf-8?B?Tkc1K0VoZXNsdTRPRURDSTlnc0N0Q1Vpa2VTUUpXY2s5ODIxNko1ajB1Mnd0?=
 =?utf-8?B?K05aUUd6QTVORXJUMG9oRVhZcTdSVUlzUnJDS3hxbUlUN0daYm5yTmJKSGdR?=
 =?utf-8?B?OFNaVkpJVkNDZDJZVi93R0U2NUhOMEE4OEwvR0ZrRnZqVXFycm4wbXJPZmYx?=
 =?utf-8?B?eTZXaWF2S2ZCb1VaaVo2M3V1OGN3RHp6TDdEdFd3S21OdkFoQjZHbFVOa3hh?=
 =?utf-8?B?Y3JObTFSclExTFg4aXVPMkdPclRPREZSMHNOaUMydU9ObXhsSFRDaGZjS3Zr?=
 =?utf-8?B?QVI0ZXdWNDRJTnRBUCtlQ0QvbTQ2TlFFWk5kNFYyMnJ4azRVWFl1dThSZ2Ny?=
 =?utf-8?B?TzBkZTYrZWJ5STF3Z2x0MzBrZkRmYWRGWFlmclVZYTF2UDZja1g1TmtBS1ZV?=
 =?utf-8?B?UHpWTkJoVUNSWUc1alV5a2pmMEN2alJrbDF3bkp2OWx3OWplYXFyNjc3bExV?=
 =?utf-8?Q?3CLuBQiWZVy/ODSfXNaZKuw5e97tOHURNoEnpE4Y1ikXz?=
x-ms-exchange-antispam-messagedata-1: s/zIymQg7GLOkg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c336816c-95a6-496d-e55e-08de68503959
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 02:58:10.2000
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kd67U8wxvekdDbum9giVW/XrWprSE7+SPfG2C4YDzTKu87DtZE/bF5eVsBL/JH4puFkRcvC8qgNG4x1vjx59Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF208195D8D
X-Authority-Analysis: v=2.4 cv=bvBBxUai c=1 sm=1 tr=0 ts=698a9ec4 cx=c_pps
 a=GI5TgwD/LrSAXmlNZGMSjA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=iGHA9ds3AAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8
 a=iEeBFFTOHhVwGy9xK9oA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Gs2RaynN-GWF3XgEa0UH7dnODeUJENy1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDAyMyBTYWx0ZWRfX2FzhIO/ECg2h
 4pPpQ+dwKyobivRl8bJ5cmHQJ+Vm4otxn2zUZATAQk2NoS8jk6rQQEuI9FuTmY9hSqupV4QRjFA
 oz9nxMfWLiK4se6nFuI/yGC8Zj7zg/mKFSblaueoBNM7UN7WierqbSOy2zN2+eX9aX1hYAtsjUU
 6V0NwFxq8WL1w/wI13a4cU6xEKuYB06ievC5aaxlLtU/S+MMLkQHHVKO7Shhd3hB1Zk7bSoyjTL
 X88g9LW/Cc6YkypGSyfFul7Q0Lx6y/dvmZAtqfYPnBbAcxvAOSzbY+yo1UIHfKsu5IlYgVRro6d
 LzwSptyACAZbsX9PO/aG7Mt7ypXE181M8/nFLMfY0/yO/2Clvk9QIpeScr4aHWQpOd0oA+ojK/d
 7MX2sA4bhidUi8g1uYpwd2BxPYKMZjyY6KmQTn5teauRJae6f0w/UzpJPdC3lXiIrM6DQNaqj1W
 KcuPHhgG9lRnPPM9fvQ==
X-Proofpoint-ORIG-GUID: Gs2RaynN-GWF3XgEa0UH7dnODeUJENy1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100023
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Feb 2026 02:58:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9574

R290IGl0LiBUaGFua3MgQnJ1Y2UuDQoNClJlZ2FyZHMsDQpRaQ0KDQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogQnJ1Y2UgQXNoZmllbGQgPGJydWNlLmFzaGZpZWxkQGdtYWlsLmNv
bT4gDQpTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAxMCwgMjAyNiA0OjA3IEFNDQpUbzogQ2hlbiwg
UWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4NCkNjOiBtZXRhLXZpcnR1YWxpemF0aW9uQGxpc3Rz
LnlvY3RvcHJvamVjdC5vcmcNClN1YmplY3Q6IFJlOiBbbWV0YS12aXJ0dWFsaXphdGlvbl1bUEFU
Q0hdIG5lcmRjdGw6IHVzZSAtbW9kY2FjaGVydyB0byBhdm9pZCBkb19ybV93b3JrIGZhaWx1cmUN
Cg0KSW4gbWVzc2FnZTogUmU6IFttZXRhLXZpcnR1YWxpemF0aW9uXVtQQVRDSF0gbmVyZGN0bDog
dXNlIC1tb2RjYWNoZXJ3IHRvIGF2b2lkIGRvX3JtX3dvcmsgZmFpbHVyZSBvbiAwNC8wMi8yMDI2
IEJydWNlIEFzaGZpZWxkIHdyb3RlOg0KDQo+IE9uIE1vbiwgRmViIDIsIDIwMjYgYXQgMTA6NTLi
gK9QTSBDaGVuIFFpIHZpYSBsaXN0cy55b2N0b3Byb2plY3Qub3JnIA0KPiA8UWkuQ2hlbj0gd2lu
ZHJpdmVyLmNvbUBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiB3cm90ZToNCj4gDQo+ID4gRnJvbTog
Q2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPg0KPiA+DQo+ID4gV2hlbiBybV93b3JrIGlz
IGVuYWJsZWQsIGJ1aWxkaW5nIG5lcmRjdGwgZmFpbHMgYmVjYXVzZSBkb19ybV93b3JrIA0KPiA+
IGZhaWxzIHRvIHJlbW92ZSB0aGUgY29udGVudHMgdW5kZXIgcGtnL21vZC8gYXMgdGhleSBhcmUg
cmVhZG9ubHkuDQo+ID4gVXNlICctbW9kY2FjaGVydycgdG8gZml4IHRoaXMgaXNzdWUuDQo+ID4N
Cj4gDQo+IEknbSBnb2luZyBhIGRpZmZlcmVudCB3YXkgdG8gZml4IHRoaXMuDQo+IA0KPiBJJ3Zl
IGF2b2lkZWQgdXNpbmcgbW9kY2FjaGVydyBzbyBmYXIsIGFuZCB3b3VsZCBsaWtlIHRvIGNvbnRp
bnVlIGFzIA0KPiBoYXZpbmcgaXQgb24gY2FuIG1hc2sgc29tZSBpc3N1ZXMuDQo+IA0KPiBJIGhh
dmUgcGVybWlzc2lvbnMgZml4dXBzLCB0aGV5IHNob3VsZCBiZSBmaXJpbmcgZm9yIHRoaXMsIGFu
ZCBJJ20gDQo+IHNvcnRpbmcgdGhhdCBvdXQgbm93IGFzIEkgd29yayB0aHJvdWdoIHNvbWUgcGFj
a2FnZSB1cGRhdGVzLg0KDQpJIG1vdmVkIHdoZXJlIHRoZSBwZXJtaXNzaW9ucyBmaXh1cHMgZmly
ZSwgc28gdGhleSBzaG91bGQgbm93IHJ1biBhZnRlciBkb19jb21waWxlICh3aGljaCBtYXkgY2hh
bmdlIHRoZSBwZXJtaXNzaW9ucykuDQoNClRoaXMgbWVhbnMgd2UgZG9uJ3QgbmVlZCBwZXItcmVj
aXBlIGZpeGVzLCBhbmQgaXQgY292ZXJzIGFsbCB0eXBlcyBvZiBidWlsZHMgKGRpcmVjdGx5IGlu
dm9rZWQsIG1ha2VmaWxlcywgb25lcyB0aGF0IGRvbid0IGluaGVyaXQgb3VyIHZhcmlhYmxlcyBl
dGMpLg0KDQpCcnVjZQ0KDQoNCj4gDQo+IEJydWNlDQo+IA0KPiANCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4NCj4gPiAtLS0NCj4gPiAgcmVj
aXBlcy1jb250YWluZXJzL25lcmRjdGwvbmVyZGN0bF9naXQuYmIgfCAyICstDQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAt
LWdpdCBhL3JlY2lwZXMtY29udGFpbmVycy9uZXJkY3RsL25lcmRjdGxfZ2l0LmJiDQo+ID4gYi9y
ZWNpcGVzLWNvbnRhaW5lcnMvbmVyZGN0bC9uZXJkY3RsX2dpdC5iYg0KPiA+IGluZGV4IDhmNjNi
NDhjLi4xYzM3YmNmOCAxMDA2NDQNCj4gPiAtLS0gYS9yZWNpcGVzLWNvbnRhaW5lcnMvbmVyZGN0
bC9uZXJkY3RsX2dpdC5iYg0KPiA+ICsrKyBiL3JlY2lwZXMtY29udGFpbmVycy9uZXJkY3RsL25l
cmRjdGxfZ2l0LmJiDQo+ID4gQEAgLTc4LDcgKzc4LDcgQEAgZG9fY29tcGlsZSgpIHsNCj4gPiAg
ICAgICAgICBleHBvcnQgQ0dPX0xERkxBR1M9IiR7TERGTEFHU30gLS1zeXNyb290PSR7U1RBR0lO
R19ESVJfVEFSR0VUfSINCj4gPg0KPiA+ICAgICAgICAgICMgLXRyaW1wYXRoIHJlbW92ZXMgYnVp
bGQgcGF0aHMgZnJvbSB0aGUgYmluYXJ5IChyZXF1aXJlZCANCj4gPiBmb3IgcmVwcm9kdWNpYmxl
IGJ1aWxkcykNCj4gPiAtICAgICAgICBvZV9ydW5tYWtlIEdPPSR7R099IEJVSUxEVEFHUz0iJHtC
VUlMRFRBR1N9Ig0KPiA+IEdPX0JVSUxEX0ZMQUdTPSItdHJpbXBhdGgiIGJpbmFyaWVzDQo+ID4g
KyAgICAgICAgb2VfcnVubWFrZSBHTz0ke0dPfSBCVUlMRFRBR1M9IiR7QlVJTERUQUdTfSINCj4g
PiBHT19CVUlMRF9GTEFHUz0iLXRyaW1wYXRoIC1tb2RjYWNoZXJ3IiBiaW5hcmllcyAgfQ0KPiA+
DQo+ID4gIGRvX2luc3RhbGwoKSB7DQo+ID4gLS0NCj4gPiAyLjM0LjENCj4gPg0KPiA+DQo+ID4g
LT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3Nh
Z2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gPiBWaWV3L1JlcGx5IE9ubGluZSAoIzk1NTQpOg0K
PiA+IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL21ldGEtdmlydHVhbGl6YXRpb24v
bWVzc2FnZS85NTU0DQo+ID4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLnlvY3RvcHJv
amVjdC5vcmcvbXQvMTE3NjExMDkzLzEwNTA4MTANCj4gPiBHcm91cCBPd25lcjogbWV0YS12aXJ0
dWFsaXphdGlvbitvd25lckBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+ID4gVW5zdWJzY3JpYmU6
IA0KPiA+IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL21ldGEtdmlydHVhbGl6YXRp
b24vdW5zdWIgWyANCj4gPiBicnVjZS5hc2hmaWVsZEBnbWFpbC5jb21dDQo+ID4gLT0tPS09LT0t
PS09LT0tPS09LT0tPS0NCj4gPg0KPiA+DQo+IA0KPiAtLQ0KPiAtIFRob3Ugc2hhbHQgbm90IGZv
bGxvdyB0aGUgTlVMTCBwb2ludGVyLCBmb3IgY2hhb3MgYW5kIG1hZG5lc3MgYXdhaXQgDQo+IHRo
ZWUgYXQgaXRzIGVuZA0KPiAtICJVc2UgdGhlIGZvcmNlIEhhcnJ5IiAtIEdhbmRhbGYsIFN0YXIg
VHJlayBJSQ0K

