Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E55E784AC
	for <webhook@archiver.kernel.org>; Thu, 25 Dec 2025 02:21:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.131991.1766629284208479623
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 18:21:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hwoaxdeM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44544b9a69=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BP1FHT33463767;
	Wed, 24 Dec 2025 18:21:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=6qCf3yqQ1xXGKOEbJmE3kBBrmeSxXnxnjXIJHjF1Q7g=; b=
	hwoaxdeMQ7oZF20FyC9W8bQDDcBKJr17sgdT/Y36zW7CI3fvlK2h9lqX2YgXHInV
	H271EpMNEjj9KSbjBaEz3cFny2IZTtcAnFKMe8rBRry1591jyAhi+rDex4srlKLe
	t9kW3X1q1spEFRKnPLlMD6bDluc32iDl0FerrMgWIaMFMiCfIwOiEqxMXFzQRpBZ
	EfPcxSVqS9r7sP2305ORbwoPIXiEJT6/MLKqN6OmIbiXlvGLeswM29cidp8Ftl6k
	qGKXkiLtlPT0+ZtnCHueqmCR9IRgiRHmwwGebktRAqVkNGOMXds4aiDRfoZGcO0F
	AUu8do1pWltoCqDZ9x8Iqw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011014.outbound.protection.outlook.com [40.107.208.14])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5v6hcdhw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Dec 2025 18:21:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJjKPM53s8GQjxXNYhRNfHsZcfUXuFuSStuUNtF1ylV9mD8yKGBRn9NZPpVbga6yDP5OCs4jsYm4kgNT3qXuMNGQ0iMpW8jU/clbKTGLbKj/Ww5OWptJPPBPZAKfzafSd7EWTen4r2+rAQcaCKqScNcc8A4lp9XstiUyhxxIgzwIppIz5mWlds+F8rSAWO9d4uyZ/u2B5ANLU8KkL07WNRmiKJcghXWpXK8deH/eeZLHIJNDxX/gmnepw60WdL8Uo9olYWAL6gFw9Ue4edNpDpmX9UXs0bfvx0dPe8Sz8t86Qmq68I01TgHOVUy8LrFLJp3/K7+Cyz0rSYOMoj2APA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qCf3yqQ1xXGKOEbJmE3kBBrmeSxXnxnjXIJHjF1Q7g=;
 b=gvsLRXqseF1mcnqYgpYbbTkfFPf9pvPENBSRPvLJGxNVZxyNmMCYx9+2vFF+OHmZcYVaaaPgbefEgbT/0ER10pixHDTbbieEOT1z9TY3luwY8T5ovXGdHvxolVUsv+nP9xHFyxA7UVc3m0772fRExhKo25/H257mZRwYXaZBvBusF3gMgr+lAFs1YQLEHzySY3r1Pr/76fYnnuK1p/zWuSbioPs2AbNUjIeffwGN/kVxl0mn11ZtjKD220Ymoe6/tC9/9GyrxO5N2Z01Fk85Eyj0kC7DkNBiUZ1lLAaEA1ftACIZxGjFuXfys+/EBLbaVpP37c/KDdL/PzlUXHaupA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MN2PR11MB4710.namprd11.prod.outlook.com (2603:10b6:208:262::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Thu, 25 Dec
 2025 02:21:20 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9456.008; Thu, 25 Dec 2025
 02:21:19 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization][PATCH] docker: RDEPENDS on virtual-runc
Thread-Topic: [meta-virtualization][PATCH] docker: RDEPENDS on virtual-runc
Thread-Index: AQHcdJjcj575oGAFOEuqYZk5WEUKELUwwn4AgADcKTA=
Date: Thu, 25 Dec 2025 02:21:19 +0000
Message-ID: 
 <CO6PR11MB560251C0260BAA43DCCD5CEBEDB3A@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20251224054744.3109658-1-Qi.Chen@windriver.com>
 <CADkTA4NK2AtaY0qfCKBP2T34N4+bTmyzKCtVf7tQjbkaCJEfdQ@mail.gmail.com>
In-Reply-To: 
 <CADkTA4NK2AtaY0qfCKBP2T34N4+bTmyzKCtVf7tQjbkaCJEfdQ@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=9f467515-074e-43cb-968d-d3c8f3343d2f;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-12-25T02:12:30Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|MN2PR11MB4710:EE_
x-ms-office365-filtering-correlation-id: fe59aaa0-5c63-4c84-40dd-08de435c4a7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|4022899009|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?U0lvRmp6NUR1MUQzVWZqWWtRTEtqU0RVYXZHVVljbVBGamtkSyt6bUlUSWVW?=
 =?utf-8?B?L044eEVOMDluRnlKQlhia3hMWURKTno1VHkyNGF3azVJa0ttSit5UUxrR3FV?=
 =?utf-8?B?a0dSVWtmMzVrVERmRkNYN0kvcmNSWXpuZnFZbHhzVDNQTlVBS1ZMblhMdW1Y?=
 =?utf-8?B?N3BGcjZHK1YxdjlRK0hQQnh1N01ZNnJwMGtkL3dQNDZ0SzlGODFFa3pENjNk?=
 =?utf-8?B?bXcrU2YxV1BLcEcyeWZYK0VpNzRycDl2LzB5R3RUSzRtRVB0MlhRTDBSUHJW?=
 =?utf-8?B?YXkvSnFBVStXQmlBR0NUMm1Fem1kSEtVSUV4OFlZR0VuUzVUSTdVeFVEZGg1?=
 =?utf-8?B?MkRvR3Z0VlE0Z2hOekNtT1hXTTZ1M1Z3eGxYYTFtYXliUUtmYkFobnNyRHp2?=
 =?utf-8?B?WFhMd0JrNW9LUDlQMHZhK1RUa2NhdnQzaENwRGxyT0k1VXZyaG5IZnloREZK?=
 =?utf-8?B?TnJ6VVFPNFRyblk3SWszMDRNV2tYb09PcDdDemJsSGpadXpkN0Q5N2xjVHNQ?=
 =?utf-8?B?TVROeUFrTURGVWIxaHNRMVJqcitmYjJjVS83Z2xGVjV4a01hUm1mV2d4c2xU?=
 =?utf-8?B?WUxocFZGN21CczZ4VVF6VG1NaFlPTU1ZbVB6dWg0Yy9UMysxdnlOSVJuOGNa?=
 =?utf-8?B?OXp3QVdqaFVtd0dDeXZvY2NkQzh0VjErVVVRUFAzTTlNTEEwTTIyc3NtRmNn?=
 =?utf-8?B?NmtnU0pXdGVMOFFMQ0sxYTBJNXVWWnE3eGpGQVM4RE5sZkFTelZ6dTY2VHBk?=
 =?utf-8?B?dUFnaTJxb3J6RmJ2TEtVVHEyVk1TQ0wyZ2swOXVyL0JjRDkzUDJ1d3didERE?=
 =?utf-8?B?a3VIOVNQYjlEVk12Ujh0Q0VHWlhqOElIbXh4cC9mUnBpd3NqbWVyTndZY21X?=
 =?utf-8?B?NTdaWDc4ekVhcU04NXZSV3RFR0crZ0RwRXRCSkxYOUpvdjBCWlhkRlhyUFgy?=
 =?utf-8?B?bEg0b1RNVUdBVEwxNnlZZ2t1TitDSjBZL09wSituTm14S2ZmSnlBNURON3lC?=
 =?utf-8?B?aGlUekt0ZEJNTk4vNnJCRFJGUUxhZzNZZmUvcXVOS1gyclJMVmpOeDhtWEdq?=
 =?utf-8?B?QW1vNHBOTHYrckd2SmRpRVdvc29yakNyQWhxei9rQzN3b0UvMEtOeDRsbSti?=
 =?utf-8?B?ME40em5UaS9QdiszaVNWRkFHNGh2emhpU2ZiU3hoR2dhT3NNWDI0Sld4L0gw?=
 =?utf-8?B?di83b05WSHNIMmNBRnRoTHc0UzNkYmNNU2RYK3B2U0M0dVdGdVBPNzZIVmh1?=
 =?utf-8?B?VGNWbUM0a1B5Y3lod05XZmpOMUVaYlpLcUdKOXJaUnozRzRGVElBdnBhREVM?=
 =?utf-8?B?UG9uaGh2cTNkWkF3UWxDZDgvOXFjY0EwWlY2dzdXby9wZENtU3R3aXY0THNu?=
 =?utf-8?B?TW90VUx1RS94dDZoWXdLTGVmdndBbjIrL2ZJbGd3YTViQVltQS9CUGg1UWtE?=
 =?utf-8?B?cjlEQzErb1JOU3R2ZlhXRCtQVVE2dFZlTEJEd1JROTkybzRIeFd2eHh3UFMw?=
 =?utf-8?B?UnZMa3hvSkc2eXltcHA3TFE2bE85TmszWjFyVzNlYmJ3aDVUUHhRdmxYY09X?=
 =?utf-8?B?ZXcxUTYvRUhHbjN2bmtDQXIvbnVxQWs0T0RJOFBnUDM2QUo4ZGhzUHZpdDBi?=
 =?utf-8?B?RDNWUEdSU0FhZkQ4UzZvaHY4TUVxUm9vWHlBWjhoOWFlUUEwNCtMN1JJZXV4?=
 =?utf-8?B?Q3VzSmJlcXBoWEVONTY1MGZpNjRpSVFWT0pXQTgzbDQyclBzUEd2czBsZ2ND?=
 =?utf-8?B?UWpBMjN1RjZHbnNqRk9RTXkyckJWbDVvcU9mNkVMeDM4QStKUUluWi9GVUc2?=
 =?utf-8?B?Um10alRuSzlRdnZxQ3Z6OXh0MHh0Y3UyQkZhQWtRTFgwM0MrOTdhNXd5UE9V?=
 =?utf-8?B?WHpzdWxOVFlWYlNrYnc5OVdsaTFobWsyUTZoMVo3dzUyYU1uWDk0RUUvYlA1?=
 =?utf-8?B?dlBmRjlnOUJTNGdTS0U4eDJ6SlkvcjhXYmIzbitPdVhmQzFCVENhdlBMMG1J?=
 =?utf-8?B?UFZocFNZQW82MmZvcXAwbmhwZU41L1E1ZkMwS1NsTEhCOEFSeVFUekdZQVlN?=
 =?utf-8?Q?2uVvMx?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Y09MK1BhNlRtdjdlV2c2SFNGbmpLcWFUYjA4bnAxTFErSTNXcmpYblRpRWxR?=
 =?utf-8?B?cGJneENQL2ZIWUlWRmhyelFwdUNTck5JSkgxNUNLaGNNamVaVVE5enVsc3hn?=
 =?utf-8?B?YzJMMlFwWDE0bVNRbENnbmdBZkNXd1ZCT2E1dVFJK2R2VGpiekJFY002bHFH?=
 =?utf-8?B?cjZsMnFkWWJBSXhmNUNPUFdxd3ZxMGZNT1FVd3BiYzZNRUhMcGFyQkpmbFJX?=
 =?utf-8?B?TWN2SmxiUTlXTlpYY1ozY21UNGU1TlNvRldlNzcrSVlNYUsySG9tQkhsbDU1?=
 =?utf-8?B?MStDTUErb2FlejNxTWUxb0dPc2EzZlJuaGUwRVBPeDFFaGtCWndkSXJzZ3I1?=
 =?utf-8?B?bjAvSjRPODY1azhseXY0VC9FWEVpMXpXcFBzaHBCUHNpTTF3TGM0YTIvVGZq?=
 =?utf-8?B?akxHZ1psSlFPNTBrRjVWV1VoUHBUWTM4ZVI4YXlLK3FBUW9MV1FJbVhrZ3Nv?=
 =?utf-8?B?UVBMeGc0UlkvTEowWXVmeWRDbG4vOUFSUjFKVXhRME4zb1JtaGpwdkptc1FS?=
 =?utf-8?B?WkM3cmZCOUY2YTRudjZ0SHpEWndIODRzVzI2Tmh4SldGcGpPMnJWT20xenQw?=
 =?utf-8?B?NXcvMGo5VnlTd2NFTllFOC94L2t2VGNaaTZ5NDYxTmdkOGtUc1BGSDliRGh1?=
 =?utf-8?B?MkhxMktFdjl0RUV3SFY5elVwbnlsNHRrZllHWUxka3pRZkhJR09WbldpVTFn?=
 =?utf-8?B?ZU9zZHQ3dk5NeVA0alcrWkFwUXo0QTFXYm96SzRHQzBLbkdIQmRGbnRiRFZL?=
 =?utf-8?B?NTB1UGFVaTFZWlViVEZaTDRNMmI1SnpNWnhWOXFnVzRNYUlTcDBoU1paSGpa?=
 =?utf-8?B?V21FTVdzd0RoNFNRcUYvL0xSbFh6ZG9OQU5kV2thdGNMYlJ1Z0wvUWJ0b3Qy?=
 =?utf-8?B?TEdBdHdVYVBSUUh0dmZNRWhqdjQwSm1XaHErTDlyUUg2YjRMd0RMeHRPNUxW?=
 =?utf-8?B?YXBQRVF3bkhqa3dXWStrQ2VLVnoyRjNWNG9rOHp2a043Tm5JQzJKZzlwUGIz?=
 =?utf-8?B?UVZtTUFrMGszd1Y3MUJaUW5FN0ptT2RKQllCc3RNN1VaZ2wvaDN3b3pHRzdI?=
 =?utf-8?B?Z1JPSWhhWEUxdHJCZEw3MkNKUFdjd1ZaTFBnbVF2dE9LNWw2M2JHSzBlZ2Mr?=
 =?utf-8?B?RkY0enRENXlPcEpDdXAxODdGUFhQTmFMRndxaWdZUjdndkpDM2NrRkJlQUo5?=
 =?utf-8?B?U2lTQmJHcU5iVy9XbytBcnhrZXhwZ2VLMG01aG1icjdUOElscWllQmxWV25h?=
 =?utf-8?B?WEhSNytMS1d0ZTJjR3Q2OGhETGR2SmZKTThETjVLK0I2U3JDT2Y1YUpLSkIy?=
 =?utf-8?B?M3ZtZlB4ZXBjcmZpT1d0MHpVKytWYUlQVk5NVkxMY2ZCcUVyem04R2dpVHVN?=
 =?utf-8?B?NGpkS1VyK0J1SDJvb2dMWUpmS2NaaC8yRHFpb0RZOG8vYlRWdElwenpvUTND?=
 =?utf-8?B?aWlMeGFBVmNrMVhWRTVOTmJhL2tCdHVIZk1BVGtZOFRmdXJKcTNZV29tMm5D?=
 =?utf-8?B?Zis5aHpvTGplU0c2MzloeXlXZXFheUdjYU9YNVBBUzNyTFV3S2FyVCtCeVA5?=
 =?utf-8?B?UU9aZ005bHBHamorZWxReW52QjJTT2hhVzhhVWxUcnJjdnpuZVpmODdqMEU1?=
 =?utf-8?B?bjFxZ1g5aGZFcDRNYyt0RCs2VlZJZ2FNaXcrMC9MNm9PNVZQVVIvbHVqYi9X?=
 =?utf-8?B?RUNOUDJMOWsrSlpyUlNmVi82cTg3YmdwMWJNOGJpY3R5V2VDbnRwRHI0emE0?=
 =?utf-8?B?WnZmNTlNa0JxTHJLU0pJR1NuOGhsUEJyaFVwRkZkckZNKzhHSkxtaGJUcUY5?=
 =?utf-8?B?eUJhdWp6Y1pzUjRRK0NwaTczWnk4aEg5Yi9zZ2J0a1pKcTR2SXVJd0F4bWhI?=
 =?utf-8?B?UC9hRGk3TCt1MU9BMjU3KzNvMDBXV2xxUS9iNmpGRHdaUHIwbmNCT2dma1B5?=
 =?utf-8?B?cHEyMGpxMjJ3QUYycWdUOVJVWGZYRTBZaGlQcVdGa2M0V1lnZkZaOUhnK3I0?=
 =?utf-8?B?VlAzTnBDZ0dqTW5CZjRJVVQxV2FmK2RsUDJHcDB2SXNGblBHOEs2K3hFS1lC?=
 =?utf-8?B?VVNGTTEweHdMZTVPQVZvMjhQQ0E3Mnl3Z2FnUkhSL0lDbXVabE5Vc2pLQUxo?=
 =?utf-8?B?ekpWU3BUZzd1NlBsQnFScVFvenlaK3lkWHRrM0U1SUcraFYxd3U3UGltVE9r?=
 =?utf-8?B?dURtRERSSWdMMWlSdXphQ1BIejBZVjJIcW9BbytPWFQxaitYeUxqVzZqOWhr?=
 =?utf-8?B?RkpsTG9ZRUEvSVZOR3d6RDJYZ1ZXZVFuaFd5RTQ1SC8zSWF5bmFoaVliUlhZ?=
 =?utf-8?Q?7KupGpYKr/TQOVyLiF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe59aaa0-5c63-4c84-40dd-08de435c4a7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2025 02:21:19.7792
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6dR1fLrhwMvDbk+Ee8tKRwxLw6G/M0wo3HtDSXy+xDjdeAB7a9YCaR2eC5uyKst6YPrlFSIt+KYInYKPT6ZsMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4710
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI1MDAyMCBTYWx0ZWRfX9Giq0c0cuBqR
 ZSiu8qZOM30kc8pZpqjyz7HIK7lpWcUqHONN/0cjtL0A7xguzU8oYMMcBA5jUXSMOsqbx5wj8l2
 Rkm6nn9DP/yje1nP+tYiumMt55NYwz9hYvOGGbHltCeXWNHTXcHlJuU9WdBHmoJjHjmvN2HE+m5
 G37S+G5oFvcCYtzuP8qsuZ4TUCFWkMEmJ3EGauAYDkGZDgvCfuJbJ9gOZbOKde+XzHhRx2c3hNV
 vzekLpkJ7J+rcYPgfkkRXSSi5mZwLTMkidmArCbq+rXgGnKfInIwTe+/M9dGkk8Ay60+o13gBzV
 wuUjt+tjM3tSiZBcJOKYCz5IEx9kdidVVLO/Ax/O1mppmNnvoOgPp7M0LvdVcE2mwFKl98ETONy
 xYyMeKD1Cmi70S1xJvfY2Y4yTOIETff/KjviuejBvV7swIw1gbisUPCV59/fbSL0ZNmd3ZY5zbF
 4mUhiJPpfDto3TAQOVw==
X-Proofpoint-GUID: rPgYW0cJgX8S35O2QZmTBdPB9cEcHt81
X-Proofpoint-ORIG-GUID: rPgYW0cJgX8S35O2QZmTBdPB9cEcHt81
X-Authority-Analysis: v=2.4 cv=KYffcAYD c=1 sm=1 tr=0 ts=694c9fa2 cx=c_pps
 a=RGFq7D/WLd/IouGP2/vkQQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=pGLkceISAAAA:8
 a=t7CeM3EgAAAA:8 a=lkr8wAdtI718lqucvP8A:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512250020
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 25 Dec 2025 02:21:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9500

UnVudGltZSBlcnJvci4NCg0KVGhlIHNjZW5hcmlvIGlzIHRoYXQgSSB3YW50IGRvY2tlciBhbmQg
cG9kbWFuIHRvIGJlIGluc3RhbGxlZCB0b2dldGhlci4NCkEgZmV3IHNldHRpbmdzIG5lZWQgdG8g
YmUgdGhlcmUgdG8gaGF2ZSB0aGlzIGRvbmU6DQpDUlVOX0FTX1JVTkMgPSAiZmFsc2UiDQpQT0RN
QU5fRkVBVFVSRVM6cmVtb3ZlID0gImRvY2tlciINCkNPTlRBSU5FUl9QUk9GSUxFID0gInBvZG1h
biINCihUaGVyZSdzIGEgcGF0Y2ggdG8gZml4IGNydW4gJiBydW5jIGluc3RhbGxlZCB0b2dldGhl
ciB0aGF0IEkgc2VudCBhIGZldyBkYXlzIGFnby4pDQoNCk9uIHRhcmdldCwgZG9ja2VyLnNlcnZj
aWUgZmFpbHMgYmVjYXVzZSBydW5jIGNhbm5vdCBiZSBmb3VuZC4NCg0KRG9ja2VyIGNhbiB3b3Jr
IHdpdGggY3J1biBiZWNhdXNlIGNydW4gaXMgc29tZXdoYXQgY29tcGF0aWJsZSB3aXRoIHJ1bmMu
IEl0J3Mgbm90IGxpa2UgcG9kbWFuIHdoaWNoIGRvZXMgYXV0b21hdGljIHNlYXJjaCAoY3J1biBm
aXJzdCwgdGhlbiBydW5jKS4NCkFuZCBmb3IgZG9ja2VyIHRvIHVzZSBjcnVuLCB1c2VyIG5lZWRz
IHRvIGVkaXQgL2V0Yy9kb2NrZXIvZGFlbW9uLmpzb24gZmlsZS4gVGhpcyBpcyB0aGUgbm9ybWFs
IHdheSB0byBkbyBpdC4NCg0KSW4gc3VtbWFyeSwgd2UgbmVlZCB0byBzdXBwb3J0IHBvZG1hbiAm
IGRvY2tlciBpbnN0YWxsZWQgb24gdGhlIHNhbWUgdGFyZ2V0Lg0KQW5kIGZvciB0aGlzIHRvIHdv
cmssIHRoaXMgcGF0Y2gsIHRvZ2V0aGVyIHdpdGggdGhlIGNydW4gZml4IHBhdGNoLCBpcyBuZWVk
ZWQuDQoNClJlZ2FyZHMsDQpRaQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTog
QnJ1Y2UgQXNoZmllbGQgPGJydWNlLmFzaGZpZWxkQGdtYWlsLmNvbT4gDQpTZW50OiBXZWRuZXNk
YXksIERlY2VtYmVyIDI0LCAyMDI1IDk6MDUgUE0NClRvOiBDaGVuLCBRaSA8UWkuQ2hlbkB3aW5k
cml2ZXIuY29tPg0KQ2M6IG1ldGEtdmlydHVhbGl6YXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9y
Zw0KU3ViamVjdDogUmU6IFttZXRhLXZpcnR1YWxpemF0aW9uXVtQQVRDSF0gZG9ja2VyOiBSREVQ
RU5EUyBvbiB2aXJ0dWFsLXJ1bmMNCg0KT24gV2VkLCBEZWMgMjQsIDIwMjUgYXQgMTo0OOKAr0FN
IENoZW4gUWkgdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgPFFpLkNoZW49d2luZHJpdmVyLmNv
bUBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiB3cm90ZToNCj4NCj4gRnJvbTogQ2hlbiBRaSA8UWku
Q2hlbkB3aW5kcml2ZXIuY29tPg0KPg0KPiBkb2NrZXIgdHJpZXMgdG8gZmluZCAncnVuYycgYmlu
YXJ5LCBhbmQgaWYgJ3J1bmMnIGlzIG5vdCBhdmFpbGFibGUsIA0KPiB0aGluZ3MgZmFpbC4NCj4N
Cj4gVGhlIFZJUlRVQUwtUlVOVElNRV9jb250YWluZXJfcnVudGltZSBjb3VsZCBiZSBjcnVuIG9y
IHZpcnR1YWwtcnVuYy4NCj4gVGhpcyBpcyBub3QgY29ycmVjdCBmb3IgZG9ja2VyLiBXaGF0IGRv
Y2tlciB3YW50cyBpcyB2aXJ0dWFsLXJ1bmMuDQo+DQoNCkhtbi4gbm8sIHdoYXQgSSBoYWQgd2Fz
IGludGVudGlvbmFsIChpZiBtYXliZSBpbmNvbXBsZXRlKS4gVGhhdCBpcyB0aGVyZSBzbyB5b3Ug
Y2FuIGNvbmZpZ3VyZSB0aGUgc3RhY2sgdG8gdXNlIGRvY2tlciBhbmQgY3J1bi4NCg0KQXJlIHlv
dSBzZWVpbmcgYSBidWlsZC4gb3IgcnVudGltZSBlcnJvciAgPw0KDQpCcnVjZQ0KDQo+IFNpZ25l
ZC1vZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4NCj4gLS0tDQo+ICByZWNp
cGVzLWNvbnRhaW5lcnMvZG9ja2VyL2RvY2tlci5pbmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdpdCBhL3JlY2lw
ZXMtY29udGFpbmVycy9kb2NrZXIvZG9ja2VyLmluYyANCj4gYi9yZWNpcGVzLWNvbnRhaW5lcnMv
ZG9ja2VyL2RvY2tlci5pbmMNCj4gaW5kZXggOTk1MzVhNzcuLjM5NzgyYjg4IDEwMDY0NA0KPiAt
LS0gYS9yZWNpcGVzLWNvbnRhaW5lcnMvZG9ja2VyL2RvY2tlci5pbmMNCj4gKysrIGIvcmVjaXBl
cy1jb250YWluZXJzL2RvY2tlci9kb2NrZXIuaW5jDQo+IEBAIC0xMyw3ICsxMyw3IEBAIFJERVBF
TkRTOiR7UE59ID0gInV0aWwtbGludXggdXRpbC1saW51eC11bnNoYXJlIGlwdGFibGVzIFwNCj4g
ICAgICAgICAgICAgICAgICAgICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVBVFVSRVMn
LCAnc3lzdGVtZCcsICcnLCAnY2dyb3VwLWxpdGUnLCBkKX0gXA0KPiAgICAgICAgICAgICAgICAg
ICAgYnJpZGdlLXV0aWxzIFwNCj4gICAgICAgICAgICAgICAgICAgIg0KPiAtUkRFUEVORFM6JHtQ
Tn0gKz0gInZpcnR1YWwtY29udGFpbmVyZCAke1ZJUlRVQUwtUlVOVElNRV9jb250YWluZXJfcnVu
dGltZX0iDQo+ICtSREVQRU5EUzoke1BOfSArPSAidmlydHVhbC1jb250YWluZXJkIHZpcnR1YWwt
cnVuYyINCj4NCj4gIFJSRUNPTU1FTkRTOiR7UE59ID0gImtlcm5lbC1tb2R1bGUtZG0tdGhpbi1w
b29sIFwNCj4gICAgICAgICAgICAgICAgICAgICAgIGtlcm5lbC1tb2R1bGUtbmYtY29ubnRyYWNr
IFwNCj4gLS0NCj4gMi40OS4wDQo+DQo+DQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExp
bmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3
L1JlcGx5IE9ubGluZSAoIzk0OTgpOiANCj4gaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3Jn
L2cvbWV0YS12aXJ0dWFsaXphdGlvbi9tZXNzYWdlLzk0OTgNCj4gTXV0ZSBUaGlzIFRvcGljOiBo
dHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvbXQvMTE2OTI1OTY4LzEwNTA4MTANCj4gR3Jv
dXAgT3duZXI6IG1ldGEtdmlydHVhbGl6YXRpb24rb3duZXJAbGlzdHMueW9jdG9wcm9qZWN0Lm9y
Zw0KPiBVbnN1YnNjcmliZTogDQo+IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL21l
dGEtdmlydHVhbGl6YXRpb24vdW5zdWIgDQo+IFticnVjZS5hc2hmaWVsZEBnbWFpbC5jb21dDQo+
IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+DQoNCg0KLS0NCi0gVGhvdSBzaGFsdCBub3QgZm9s
bG93IHRoZSBOVUxMIHBvaW50ZXIsIGZvciBjaGFvcyBhbmQgbWFkbmVzcyBhd2FpdCB0aGVlIGF0
IGl0cyBlbmQNCi0gIlVzZSB0aGUgZm9yY2UgSGFycnkiIC0gR2FuZGFsZiwgU3RhciBUcmVrIElJ
DQo=

