Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E03EF06FC
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 01:23:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38288.1770600210716173472
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 08 Feb 2026 17:23:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=lBWdETh9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=650090017b=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6191KFU72743986;
	Mon, 9 Feb 2026 01:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=1gOhTy5M30s/vPicJeRbyP
	qLKPhm29cVlc1VBVQw7Oc=; b=lBWdETh9sUmzDJvzLNxwdUzv5iPEDuQ0IcnSdH
	lKIgpp7OHwQXltb867ibglI4dAsMlO7ZdsSqt2OosCw9cLU97k1b+o5TDe8mjfzB
	d28yp3AaQM3ZwH4SVXR3Q+bBtfyhU6O9vvx3yd9jtZ5Y/OGxxflp/vMGjpQUh3GD
	tGLSVIN48R3Q4Xj4EAnwXBN5bT0cUjNVa6S/kw4wQN3jwEeUWgIDiKQFlkTtB4mZ
	E9ddXp1m0OjDKWaTRC9jXwCtp1d8u5GqoTrSX5X/iHzxZ5eJtWGQp43AflcYPLay
	kpYRB98uk689Pf4E7zUpmMMwLFWNFupdSugMqZvq+7i/yCjQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010022.outbound.protection.outlook.com [52.101.85.22])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5tkwhdyq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Feb 2026 01:23:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yBav+XbDBxIZJqS42oOWX5PTQyRI0PpnVsEykdF40yswHxC3xxooXy0XDR0H0+j5aI6f309r74mm/SBz0kHdcOfRp4OtJ9uzyV6vtSxsnG4/ZVhSuo4bjNpjZZGHRWAhbKckQpUAsh1ogpwfMMZwfpoPgBOh6qMWpqXbGwRIS+DNjV4SfDZIgQXhtzm9mkkUYoqtD/Uroud6AKFy57edBJyVB6//0kZhxkP4m8flAoyma85+NEAOGchA4w05wE6M4CKOvFEHZmP0Cn2fmMtAwSNH/4EMBspbHroFmQDrECob0WWP2QyZNsGd1sHiYLzr71Mi/yGElpQt+faIpS2V0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1gOhTy5M30s/vPicJeRbyPqLKPhm29cVlc1VBVQw7Oc=;
 b=LG1RT4zrFgjWA2O4CQzrZ08md95rtTHoIs5BPz+YltPRDY59TngnozZnMZW0lRUSZOuZXRaCjiiQm4aAduWEmanUtClxyzy8+7O3WsTC+Id4ZAMCLPsW0fY7CQq4XRomz53yRsjdOUCZHbNfNgSgGbheGB0SSBGOWNMPeDawkjHkeHvn15GXv0M6ukCIraAAJoXAJiUUQXc+ANJv0gOXbj9A/zyesf3140hNR0p3pXEukLmLJ6EQdEi3+gt/XQUs9EIZlqreSbn3vPruNrXozo70N2A+57SLXzuZ3jO70pphQKUpF5bfn3yU0jwvzVN2P7OS1LH+yUzb4WgOROVOPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by IA4PR11MB8943.namprd11.prod.outlook.com (2603:10b6:208:569::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Mon, 9 Feb
 2026 01:23:24 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 01:23:24 +0000
Content-Type: multipart/alternative;
 boundary="------------U6SP0ERvIYayrsHBQt7LKUL6"
Message-ID: <575554b9-6a01-437f-9a46-7138563378c6@windriver.com>
Date: Mon, 9 Feb 2026 09:23:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][PATCH 1/2] improve reproducibility
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20260206091701.3904742-1-changqing.li@windriver.com>
 <1891A9344E389A40.377171@lists.yoctoproject.org>
 <CADkTA4NP703RvC2AAZ2-X0R0ofG=-1n1nCdk9mU9k1oWd7i2=w@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CADkTA4NP703RvC2AAZ2-X0R0ofG=-1n1nCdk9mU9k1oWd7i2=w@mail.gmail.com>
X-ClientProxiedBy: SG2PR01CA0180.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::36) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|IA4PR11MB8943:EE_
X-MS-Office365-Filtering-Correlation-Id: e7fd6f1a-758b-469d-fa93-08de6779d167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?b0hITXFKSjYyKzNFSG4weGJEUVpLRmx5N3RYNWdFL09vbWx2bG91MnlWY1VF?=
 =?utf-8?B?cEhCOGpIMFI2MlNWTHFkZk9sSmlGKzVRTzlzSnE3Y1dhWkRtZHQxQ0ZkZmR5?=
 =?utf-8?B?VXdSYnArYVFuanJzYVlJRitDNDB5bVVBclVQamNiTnV3dmtWK2JJd2tYUWtU?=
 =?utf-8?B?SGR3Wmp6S3YxUUZIK1ZxKy9WSlpudmZTdU9UcUNxUGpHUEpia0wyQUNEMjVh?=
 =?utf-8?B?Z2pJajBuYzg3RXpFZnBtMUJxYXZRTkhXOFRSR2FUbHcwaVdlQi9KTldGQU1C?=
 =?utf-8?B?NnlaZERNeGNyUmNZNnBPRlFpTGdBREJNck53czhmcEV2TTcwRng5aDErcTEx?=
 =?utf-8?B?eHlyeHNkdDhFSzg2Zmc3WlhXY0pRR0VDSVFLcTBOOU53UWJjaXJReTYxUmRE?=
 =?utf-8?B?VGV2NU16U0VrK0JkS0VLNWVZQ040ZzlMY2NKYjZOOFJrMTN2Qk1wRGxFdW93?=
 =?utf-8?B?K1orT3NURjV4RCsxSVpJdmhuS1REQ0lzUUd1cy8zNk1wSllCMUJjREp3NDVF?=
 =?utf-8?B?bWFlbFBqUVIzNkNUTno4NFowd0wzenZ4YkNMbloxUzR2dHRraUIzMVR3Zi9h?=
 =?utf-8?B?UUt1VEJMTEVXanN5OHZUS3c4eGh0aENNUzN0Uzh0R1hkaFRqd0pxcGNibUUz?=
 =?utf-8?B?UlJJMHpGZVlUL21GbzRIRHBqQzZEOXFBVlVPSmF6ak1lYVoyckNSSStiYVNM?=
 =?utf-8?B?VmlqUVUyVUFrazlPYzJ1OXhrelVSVE5nZjVqM0hnU1RJVGdsYzV3OEdZYnk4?=
 =?utf-8?B?SUZ0S3dyQitMN3ZKSzZ3M1pkb0VCdktNcm5HemtHZm1aU3d5SnMzUkhqTEZC?=
 =?utf-8?B?NnZHVDdtZXN6enpuVk9aR1BMa05SMG9qZyszcHYwM3NwSzRvMVBPcklyZ2tl?=
 =?utf-8?B?bmxkM1d6b3VRREJwWXRrcitQVGxjdjNQalJpSW1ReGw3UU5POERHaDEwVC8y?=
 =?utf-8?B?NDJKN3E2c3RQL1h6dUNtZ2l1N3E5Rnh1bDhnSlpYT3BPa2RreFp3c3VUTG51?=
 =?utf-8?B?MkJoU0hNVkJ1S2pURTNEM1FsZm14Tks5NlNDMDBIVjZHTFlrWWZkK0FtUm5s?=
 =?utf-8?B?bDBIQ2JXL0hIRWdMejZkRUxEUGFTbm9ZYk9lbFVxMU55ZEVpRzJGaUVqK05l?=
 =?utf-8?B?WktjejBVMmVreXVEbFREN01ZRzhtSE9NY3ZVV0F3QVphZ0tjdFNSa25UN1BN?=
 =?utf-8?B?VVZURkxUc3JhQ0Z6UjN3cWpmdmNDeWZZc2JVM2I4enBVNWc4eUxsc0lxaVNw?=
 =?utf-8?B?UEhkUlQ3UTdJWklXOGRrN2dvZXlkVlU3USsyRlZLM2xFdEl1M2ZPM0lYUFNI?=
 =?utf-8?B?K3lMNDliQXRtTU1zeXdNUVlQc1ZFWDlWbUxxM2JiN0RlTDZBZUphR01HWnJY?=
 =?utf-8?B?dkR4dkdnK2QxRCtnR0VUeGViMnQ3dDJIZ2w4K0ljdEF6MlYrKzMrVGlwWGVs?=
 =?utf-8?B?WVdGZ2NNRWdXMmppN2I1ZURwcGlXbW5qSWhEZ09wV0ZNYmJlTHBiVndMamty?=
 =?utf-8?B?bXFqZkY1V0hBZXlFN004YnRnRHc2dWs4RnJzVktLRnpzWlV4WER0QUVpTUp3?=
 =?utf-8?B?TW1IR0J6ZW1LUzVHYWtrMlExekZ5RStHdGFiRG5rVEtYNFNZNm14MC9uaDB4?=
 =?utf-8?B?M3FZRGo5aWIxeDdiVFVIWkhyMm9tQUR1V0pMaFZTWjNFWVdiVG1MU3FPVU5m?=
 =?utf-8?B?WGpDY21GSFF4cnJseS9TMUhFTUpheUZVSnlZYm84N2owdHpCUVlZbmF2dDU0?=
 =?utf-8?B?WDRoL2lQdWs2OFg3dEd0azhkT2JNNklVUVlETnBYaSsvMkNEVmI4b2tWbFpw?=
 =?utf-8?B?ajZXWFZDdHZJMndOejJPT1dsc2xTUVpNVytsdi93UEtDeU9YSUJjZVRWS2hJ?=
 =?utf-8?B?SHU3Q0dYelRobVViTHVtNS9vOENkOG0zaDIvQ2xhZTlnNlZONVJvY0NyNHVn?=
 =?utf-8?B?ZkdZaE9EcmpsMVFZdTN0QlhIbGhXSkRWR1E1RHVSOGJNNEZ3TWthV2JITTAr?=
 =?utf-8?Q?0o4kf5YxjCGiSAVE6YcJjkR+hLlUio=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b1QzTEFoUTladWJGend5NVRvbFZuek52ZXdNd2k1WVhsdFc1eU9YNC9jalZL?=
 =?utf-8?B?L3hRZTcvVktBWTR5NTI2cGtzZjJQZ1ZsaVdzOEJ2L1FMblVJWmh2SXRaL1Bu?=
 =?utf-8?B?c1ByU2kzZnVDV2ZTdlgxcWtOcE9uMDUrZ3ZjOVhsNjRjL3VwSTdZdWJtdDdB?=
 =?utf-8?B?MTRTeUJyNmZKaFdCaFEreWwxVC9YSUJqSG9RbVEvbFo0bGtPTVBIYkM0Znl5?=
 =?utf-8?B?QjhHVXI5YnUyVzJEV0UrKzFSODVOKzBpaUdPak0vbkdZWHpEUVh6YjZsWURH?=
 =?utf-8?B?VG8zaXRLVjNwTGlPVnJwSklSTmxoQzkvWUNiTXVWeVpWOVYwS05HcVRrVWFC?=
 =?utf-8?B?anRGQjdRa3VzelVvQ09xc0RIRW1vZWxNSEFRNGN2eUhzRStuMm80SjBMUk8r?=
 =?utf-8?B?VE9YbWhQNWRLbUU5ZU5XVjJEMzZUSGNVaEhtZk5xcElrczdjTWhGYloxcGVp?=
 =?utf-8?B?alBSandDRkZ5M2JLZGNhMVlpTGxxTkU5T0lqNzdpMGhwaExINFk0NXpwWUc2?=
 =?utf-8?B?Nnc5U29DR2JyLytwb3VWVmxXQTQzVUY0YlhXaE1UdGltU0lFYlNJRGhWSXNB?=
 =?utf-8?B?UmxmZjdReW5hcTk5Ymc5bTlhTW1Wb2tWbnMrTFY2d2t3VDJ2bmJ6YUhoZzNn?=
 =?utf-8?B?VHRWbS9OUjBISFdnZjRXL3R0MmRpMW54M281Y1VYU2o0dmdteU1uUlVuc1Rr?=
 =?utf-8?B?OWJjaEJEQllLb0tGQnB3Mkl5djlEeHIzbU1QMEdqRWVQK1FoYXc0ZmVPSWhX?=
 =?utf-8?B?RkNDZHBvVWJ1OVRHTmxJU1NaeExtSjQ5Mk13Q1NBYys3YzFNWmtkUkRCdmxV?=
 =?utf-8?B?SUVUOFdaVTYyUHlQZWVhRFR3L0treThRbzRlSlE1Q0U5cEkxbXdaV1FCSnJF?=
 =?utf-8?B?bHI2ZVVlNVFVS3FIRnNlZlcyVEZXOXRDeEhxWjhOd1F5aVpDd29vNkRrcU82?=
 =?utf-8?B?WnRhdUxVZHZOYzc0alRPSVY3ZUtYaXJTVEF6aUpDZy80eGRFZysxUmd0L21l?=
 =?utf-8?B?ME02eGhaUVNJU3A1amF6OVdOSHpwcjJkMVduelJ6UlRQK2FSODd5cWx3M1pw?=
 =?utf-8?B?eTlXOU1SeUw5WWQ4VmZqZnlZYmcxSGFHUDBrS2FFaDVTOWlldXNZV2FNWHBI?=
 =?utf-8?B?cnZXN3VGZ0JVU1RoaWZiTVhzOGdhcXZCMmlKWjZteXRDMndXbjBCaXZjMmNx?=
 =?utf-8?B?WGtYREE0bk9XM0NYcFZXU29nRGs3VFBkRytwenJvam15SzFzVjR1UEpaUDVK?=
 =?utf-8?B?RXJ6MWxyNE43ZThRWk1mckV6R2dya0FlV1JFemZ5K05tdlRocXMwaE5XY05h?=
 =?utf-8?B?eXRqYjN1R2RncTlGQ21vaFk1VjdoRk1sWHdXeGVsdTlxMDF6cG1uVGZyL1Q5?=
 =?utf-8?B?SDJ4RGJ4VTVkeGFnSFZEamF6ckhmS2dvd01PeUtsRkdqNU5PeGpCUEYraUtP?=
 =?utf-8?B?ZkJpd0M5SXZGRVY4K3RvSEZpWE4yMkIvcS91V2N6Rk10MUpWODgvNGRvMS94?=
 =?utf-8?B?dFQya2ovMUoyNytnQlp3dTRtMjQ2RTVKYWo4U1JqS3J4RlF6WlJmYWR2WlF3?=
 =?utf-8?B?K3JrQnRVNTVrYStzOXEvU0ZJS3JjUnZrMG5TbmdVcHhOSTJuQVh3bldDVVBo?=
 =?utf-8?B?dCtkWWd4UWszeE92a1BuZGIrM1lPcUw4WmRXemNmNHdPeEl3SnFSTDhqOWxl?=
 =?utf-8?B?d2wxVWp2c1FCVXFjc2c1WkFDNTBlTldlZWhkZVBENkR5QkVESEtabGc5UlRu?=
 =?utf-8?B?ZjM3enB2MVFIbFp1TWNmUEJPdXQvMC9nSTRkdjlvOEdFeWdGOFI5UlhGT1dJ?=
 =?utf-8?B?QVllczhTNzUxT29oTUZmem9KWWNSSHo5U2hiVk1tQloyck1CS2E4MHFyOXF0?=
 =?utf-8?B?eFMvWE0zcGJ0c2h5eHp0OVRBYTdZM0lwZ2x0anN0bW5IK3duaDNnTFIvb0Ux?=
 =?utf-8?B?cEpOd0N4UnliMnpZcklmc3FuTjhFVklONVd5UW9qV3hhemFUOVdXUVFzUzUr?=
 =?utf-8?B?YjJ6YlFXUkduTGdudjNUa3ZZNzRMc3dVUEo2QmVxOUN5QmE1SHVjblUzbzc2?=
 =?utf-8?B?WFlNM1NVY1VtNHBoL0ZIVUFCUDZGR09hVE43VUFGb3lkMXk3UDRucUpQT3Vj?=
 =?utf-8?B?RkhqdGZjMWU1NGFEdThSekxlTXE5ektZOGxiRjEzVmszTzlDMWp3ajJhVDc3?=
 =?utf-8?B?VDhkVmt2TkkvOW13OFpiMFNCWEV4UU9BMkJNbEg5K04wMEQrTlVFN1lyK2F4?=
 =?utf-8?B?YVRwTGJBMkUrNkZjVmdKWmpRZnNIbGV6dzZEOXRWQjJMbkxPWHRWNk1lUFlX?=
 =?utf-8?B?Ull4dWNCQzllN3pDa3c4bCtnOW50UzFwTmk2d2l5cjFRbTJMWDJkWjN3VGFp?=
 =?utf-8?Q?22DdIgJNVVVGr09Y=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7fd6f1a-758b-469d-fa93-08de6779d167
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 01:23:24.5554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wOaDIos+tcXL0mWqvZqMShsTfvldHYUYHfX2g6zrUi1uYn/c8ukThkQ7R8L+nBwTG2cHHyGK4rGZ2uVY0U4wsKZB8X3vdQvmkC1ysHCDLts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8943
X-Authority-Analysis: v=2.4 cv=bvBBxUai c=1 sm=1 tr=0 ts=69893710 cx=c_pps
 a=0Qqeoa/8LQ4SOC89qm8Uhg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=iGHA9ds3AAAA:8
 a=ySjF6f4xAAAA:8 a=Q4-j1AaZAAAA:8 a=RFjtGLVJAAAA:8 a=0oRN3E7-AAAA:8
 a=Vm47VwaKAAAA:8 a=XkuJC2LXAAAA:8 a=HONIr0DtAAAA:8 a=VvCv5PxMAAAA:8
 a=vCHQbyzJAAAA:8 a=xH1NtE5oAAAA:8 a=Qp89o8roAAAA:8 a=4yYbIk-QAAAA:8
 a=zezS8uIVAAAA:8 a=FGyEWsL0AAAA:8 a=ZW26Cz4yAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=j2qun7bdD37GxZMhVsoA:9 a=lqcHg5cX4UMA:10
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=97jveuqmOn2d8fX_s08A:9
 a=m8L-6ywtAHiwcfYV:21 a=_W_S_7VecoQA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=SVe2G6S_LxxHVpu7-jkk:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=stvaAeZBb5V-fPvp-vy9:22
 a=A9sDTnWZ4UTPbge9BLXR:22 a=yKFyvykjIVJwvJuxpF0o:22 a=xlXauZMLQ9LHMUg6t57S:22
 a=Qh5NoN3BRiC1xVk-ykmT:22 a=nHMe9YOggYUlATdCyaZ5:22 a=mA5qry1rbyGvl90tSnBg:22
 a=NKNeG3A5ERXAAbeP1Vwc:22 a=2PextC8wxLu3zIcEEJGI:22 a=cTuAbiFRQQ3bCsKXpUDn:22
 a=bJDlsGUbebFl2L_cY-Us:22 a=T40czrJlKppFb-2YZAJc:22 a=F6BVzrJpdfjGM_8oyBWw:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 75Y1PkcdHsZBVTuOop9MIp75MKdWB1wE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDAxMCBTYWx0ZWRfX29K8DQA8aQ8C
 yfTiLZy++n0AekK2e/ds19crbnTpptaqODT/KKNGgXdJK7+98neDfM5698zf1iu1lq/tHeusWpa
 sVqoJKODvM2bIRYYCBK2jc4hdQr8a20s3hBDvZIhpp/WCq3BjlUIdSnnVzjUAKDBg+6RekSmiSn
 TPJ2+Zej3i3hSkB/hjVBzLvYVLIopvWgkRQRW6eaEJubtnyr/TuyB+7d8SixsBS9qiGakBq8j75
 WtnuiZCzI3uiAHH4VbrbOMFwUj+b6J3ZWowYZ7+uRy5ZOOkvPrV6uUILR5SJVhkQGIvDZRosVbz
 wc4mL5x3PgzMF/lS6wAAmgEpZCJWEnJS7uppAP5ikGTbu2EpMhaDrchykIYsCi7XE76CZQ36njn
 r5U8wwTjqem2lpshnIB6gNNy/DJenHhVguqi+sVwYpe5DVoqBNoec/VILitnSJzWWSV7UoNhfsE
 xKkHFMYO6/U7KepsrJw==
X-Proofpoint-ORIG-GUID: 75Y1PkcdHsZBVTuOop9MIp75MKdWB1wE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090010
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Feb 2026 01:23:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9565

--------------U6SP0ERvIYayrsHBQt7LKUL6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6191KFU72743986


On 2/6/26 20:51, Bruce Ashfield wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
>
>
> On Fri, Feb 6, 2026 at 7:49=E2=80=AFAM Bruce Ashfield via=20
> lists.yoctoproject.org=20
> <https://urldefense.com/v3/__http://lists.yoctoproject.org__;!!AjveYdw8=
EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv6=
7szL79VQNGLHh_zXlG9L8r4Sw$>=20
> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
>
>
>     On Fri, Feb 6, 2026 at 4:17=E2=80=AFAM Changqing Li via
>     lists.yoctoproject.org
>     <https://urldefense.com/v3/__http://lists.yoctoproject.org__;!!Ajve=
Ydw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgISt=
Zbv67szL79VQNGLHh_zXlG9L8r4Sw$>
>     <changqing.li
>     <https://urldefense.com/v3/__http://changqing.li__;!!AjveYdw8EvQ!a7=
XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79=
VQNGLHh_zXlG_MRlU8w$>=3Dwindriver.com@lists.yoctoproject.org>
>     wrote:
>
>         From: Changqing Li <changqing.li@windriver.com>
>
>         * Refer [1], cgo will embeded cgo_ldflags in the intermediary
>         output,
>         =C2=A0 which make content ID will be incfluenced by cgo_ldflags.
>         =C2=A0 '--sysroot=3Dxxx' includes build path, which will make t=
he
>         binary not
>         =C2=A0 reproducible, these recipes can build successfully witho=
ut
>         --sysroot, so
>         =C2=A0 remove it
>
>         * CGO_ENABLED/CGO_CFLAGS/CGO_LDFLAGS already exported in
>         go.bbclass with
>         =C2=A0 the same value, remove the not needed settings
>
>
>     refer to all my previous email on the subject.
>
>     I will continue to set these in the classes themselves.
>
>
> BUT, I will take the removal of the sysroot if we no longer need it.
>
> But the duplicated values from the go classes are entirely intentional.
>
> Bruce

OK,=C2=A0 I will send a V2, only remove --sysroot and keep the duplicated=
 value.

Regards

Changqing

>
>     Bruce
>
>
>         [1]
>         https://git.openembedded.org/openembedded-core/commit/?id=3D179=
7741aad02b8bf429fac4b81e30cdda64b5448
>         <https://urldefense.com/v3/__https://git.openembedded.org/opene=
mbedded-core/commit/?id=3D1797741aad02b8bf429fac4b81e30cdda64b5448__;!!Aj=
veYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgI=
StZbv67szL79VQNGLHh_zXlEh-dmwdA$>
>
>         Signed-off-by: Changqing Li <changqing.li@windriver.com>
>         ---
>         =C2=A0recipes-containers/containerd/containerd_git.bb
>         <https://urldefense.com/v3/__http://containerd_git.bb__;!!AjveY=
dw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZ=
bv67szL79VQNGLHh_zXlG-dNxmyQ$>
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 ---
>         =C2=A0recipes-containers/cri-tools/cri-tools_git.bb
>         <https://urldefense.com/v3/__http://cri-tools_git.bb__;!!AjveYd=
w8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZb=
v67szL79VQNGLHh_zXlFrx_lp2w$>
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 -----
>         =C2=A0recipes-containers/docker-compose/docker-compose_git.bb
>         <https://urldefense.com/v3/__http://docker-compose_git.bb__;!!A=
jveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrg=
IStZbv67szL79VQNGLHh_zXlFdoh_aVg$>
>         =C2=A0| 6 +-----
>         =C2=A0.../docker-distribution/docker-distribution_git.bb
>         <https://urldefense.com/v3/__http://docker-distribution_git.bb_=
_;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13V=
gNNrgIStZbv67szL79VQNGLHh_zXlGVstuGEg$>
>         =C2=A0 =C2=A0 =C2=A0 | 3 ---
>         =C2=A0recipes-containers/docker/docker.inc
>         <https://urldefense.com/v3/__http://docker.inc__;!!AjveYdw8EvQ!=
a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL=
79VQNGLHh_zXlFR3q-pKg$>
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ----
>         =C2=A0recipes-containers/kubernetes/kubernetes_git.bb
>         <https://urldefense.com/v3/__http://kubernetes_git.bb__;!!AjveY=
dw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZ=
bv67szL79VQNGLHh_zXlEfOKW7VQ$>
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0| 8 +++++---
>         =C2=A0recipes-containers/nerdctl/nerdctl_git.bb
>         <https://urldefense.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8=
EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv6=
7szL79VQNGLHh_zXlHOzkG3bw$>
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 ------
>         =C2=A0recipes-containers/oci-image-tools/oci-image-tools_git.bb
>         <https://urldefense.com/v3/__http://oci-image-tools_git.bb__;!!=
AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNr=
gIStZbv67szL79VQNGLHh_zXlHFYvMiTg$>
>         | 3 ---
>         =C2=A0.../oci-runtime-tools/oci-runtime-tools_git.bb
>         <https://urldefense.com/v3/__http://oci-runtime-tools_git.bb__;=
!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgN=
NrgIStZbv67szL79VQNGLHh_zXlHo17vUNg$>
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3 ---
>         =C2=A0recipes-containers/podman/podman_git.bb
>         <https://urldefense.com/v3/__http://podman_git.bb__;!!AjveYdw8E=
vQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67=
szL79VQNGLHh_zXlEvWx5jpg$>
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 8 --------
>         =C2=A0recipes-containers/runc/runc.inc
>         <https://urldefense.com/v3/__http://runc.inc__;!!AjveYdw8EvQ!a7=
XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79=
VQNGLHh_zXlGFMwrHwQ$>
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3 ---
>         =C2=A0recipes-containers/skopeo/skopeo_git.bb
>         <https://urldefense.com/v3/__http://skopeo_git.bb__;!!AjveYdw8E=
vQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67=
szL79VQNGLHh_zXlF9RFAGNA$>
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 ---
>         =C2=A0recipes-containers/umoci/umoci_git.bb
>         <https://urldefense.com/v3/__http://umoci_git.bb__;!!AjveYdw8Ev=
Q!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67s=
zL79VQNGLHh_zXlETIKfTGg$>
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 ---
>         =C2=A013 files changed, 6 insertions(+), 52 deletions(-)
>
>         diff --git a/recipes-containers/containerd/containerd_git.bb
>         <https://urldefense.com/v3/__http://containerd_git.bb__;!!AjveY=
dw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZ=
bv67szL79VQNGLHh_zXlG-dNxmyQ$>
>         b/recipes-containers/containerd/containerd_git.bb
>         <https://urldefense.com/v3/__http://containerd_git.bb__;!!AjveY=
dw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZ=
bv67szL79VQNGLHh_zXlG-dNxmyQ$>
>         index 081cf354..3d66e06e 100644
>         --- a/recipes-containers/containerd/containerd_git.bb
>         <https://urldefense.com/v3/__http://containerd_git.bb__;!!AjveY=
dw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZ=
bv67szL79VQNGLHh_zXlG-dNxmyQ$>
>         +++ b/recipes-containers/containerd/containerd_git.bb
>         <https://urldefense.com/v3/__http://containerd_git.bb__;!!AjveY=
dw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZ=
bv67szL79VQNGLHh_zXlG-dNxmyQ$>
>         @@ -47,9 +47,6 @@ do_compile() {
>
>         =C2=A0 =C2=A0 =C2=A0# Pass the needed cflags/ldflags so that cg=
o
>         =C2=A0 =C2=A0 =C2=A0# can find the needed headers files and lib=
raries
>         -=C2=A0 =C2=A0 export CGO_ENABLED=3D"1"
>         -=C2=A0 =C2=A0 export CGO_CFLAGS=3D"${CFLAGS} --sysroot=3D${STA=
GING_DIR_TARGET}"
>         -=C2=A0 =C2=A0 export CGO_LDFLAGS=3D"${LDFLAGS}
>         --sysroot=3D${STAGING_DIR_TARGET}"
>         =C2=A0 =C2=A0 =C2=A0export BUILDTAGS=3D"no_btrfs static_build n=
etgo"
>         =C2=A0 =C2=A0 =C2=A0export CFLAGS=3D"${CFLAGS}"
>         =C2=A0 =C2=A0 =C2=A0export LDFLAGS=3D"${LDFLAGS}"
>         diff --git a/recipes-containers/cri-tools/cri-tools_git.bb
>         <https://urldefense.com/v3/__http://cri-tools_git.bb__;!!AjveYd=
w8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZb=
v67szL79VQNGLHh_zXlFrx_lp2w$>
>         b/recipes-containers/cri-tools/cri-tools_git.bb
>         <https://urldefense.com/v3/__http://cri-tools_git.bb__;!!AjveYd=
w8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZb=
v67szL79VQNGLHh_zXlFrx_lp2w$>
>         index dad675e8..98c43b6b 100644
>         --- a/recipes-containers/cri-tools/cri-tools_git.bb
>         <https://urldefense.com/v3/__http://cri-tools_git.bb__;!!AjveYd=
w8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZb=
v67szL79VQNGLHh_zXlFrx_lp2w$>
>         +++ b/recipes-containers/cri-tools/cri-tools_git.bb
>         <https://urldefense.com/v3/__http://cri-tools_git.bb__;!!AjveYd=
w8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZb=
v67szL79VQNGLHh_zXlFrx_lp2w$>
>         @@ -46,12 +46,7 @@ do_compile() {
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export
>         GOPATH=3D"${S}/src/import/.gopath:${S}/src/import/vendor:${STAG=
ING_DIR_TARGET}/${prefix}/local/go"
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${S}/src/import
>
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0# Build the target binaries
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOARCH=3D"${TARGET_GOARCH}"
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass the needed cflags/ldflags so=
 that cgo can find
>         the needed headers files and libraries
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D"1"
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D"${CFLAGS}
>         --sysroot=3D${STAGING_DIR_TARGET}"
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D"${LDFLAGS}
>         --sysroot=3D${STAGING_DIR_TARGET}"
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export CFLAGS=3D""
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export LDFLAGS=3D""
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export CC=3D"${CC}"
>         diff --git
>         a/recipes-containers/docker-compose/docker-compose_git.bb
>         <https://urldefense.com/v3/__http://docker-compose_git.bb__;!!A=
jveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrg=
IStZbv67szL79VQNGLHh_zXlFdoh_aVg$>
>         b/recipes-containers/docker-compose/docker-compose_git.bb
>         <https://urldefense.com/v3/__http://docker-compose_git.bb__;!!A=
jveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrg=
IStZbv67szL79VQNGLHh_zXlFdoh_aVg$>
>         index ccb36a16..de9427ae 100644
>         --- a/recipes-containers/docker-compose/docker-compose_git.bb
>         <https://urldefense.com/v3/__http://docker-compose_git.bb__;!!A=
jveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrg=
IStZbv67szL79VQNGLHh_zXlFdoh_aVg$>
>         +++ b/recipes-containers/docker-compose/docker-compose_git.bb
>         <https://urldefense.com/v3/__http://docker-compose_git.bb__;!!A=
jveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrg=
IStZbv67szL79VQNGLHh_zXlFdoh_aVg$>
>         @@ -53,13 +53,9 @@ do_compile() {
>
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 # GOMODCACHE, GOPROXY, GOSUMDB, GOT=
OOLCHAIN are set by
>         go-mod-vcs.bbclass
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export
>         GOPATH=3D"${S}/src/import/.gopath:${STAGING_DIR_TARGET}/${prefi=
x}/local/go"
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D"1"
>
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass the needed cflags/ldflags so=
 that cgo
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 # can find the needed headers files=
 and libraries
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOARCH=3D${TARGET_GOARCH}
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D"${CFLAGS}
>         --sysroot=3D${STAGING_DIR_TARGET}"
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D"${LDFLAGS}
>         --sysroot=3D${STAGING_DIR_TARGET}"
>
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 GO_LDFLAGS=3D"-s -w -X internal.Ver=
sion=3D${PV} -X
>         ${COMPOSE_PKG}/internal.Version=3D${PV}"
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 GO_BUILDTAGS=3D""
>         @@ -85,4 +81,4 @@ INSANE_SKIP:${PN} +=3D "ldflags already-strip=
ped"
>
>         =C2=A0# the AWS dependency is 8GB, try and control the
>         =C2=A0# size of the clones
>         -BB_GIT_SHALLOW =3D "1"
>         \ No newline at end of file
>         +BB_GIT_SHALLOW =3D "1"
>         diff --git
>         a/recipes-containers/docker-distribution/docker-distribution_gi=
t.bb
>         <https://urldefense.com/v3/__http://docker-distribution_git.bb_=
_;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13V=
gNNrgIStZbv67szL79VQNGLHh_zXlGVstuGEg$>
>         b/recipes-containers/docker-distribution/docker-distribution_gi=
t.bb
>         <https://urldefense.com/v3/__http://docker-distribution_git.bb_=
_;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13V=
gNNrgIStZbv67szL79VQNGLHh_zXlGVstuGEg$>
>         index 5e37fe74..63001331 100644
>         ---
>         a/recipes-containers/docker-distribution/docker-distribution_gi=
t.bb
>         <https://urldefense.com/v3/__http://docker-distribution_git.bb_=
_;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13V=
gNNrgIStZbv67szL79VQNGLHh_zXlGVstuGEg$>
>         +++
>         b/recipes-containers/docker-distribution/docker-distribution_gi=
t.bb
>         <https://urldefense.com/v3/__http://docker-distribution_git.bb_=
_;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13V=
gNNrgIStZbv67szL79VQNGLHh_zXlGVstuGEg$>
>         @@ -28,12 +28,9 @@ do_compile() {
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOROOT=3D"${STAGING_LIBDIR}/=
go"
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass the needed cflags/ldflags so=
 that cgo
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 # can find the needed headers files=
 and libraries
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D"1"
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export CFLAGS=3D""
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export LDFLAGS=3D""
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D"${TARGET_CFLAG=
S}"
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export GO_GCFLAGS=3D""
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D"${TARGET_LDFL=
AGS}"
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export GO111MODULE=3Doff
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export GO_BUILD_FLAGS=3D"-trimpath"
>
>         diff --git a/recipes-containers/docker/docker.inc
>         <https://urldefense.com/v3/__http://docker.inc__;!!AjveYdw8EvQ!=
a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL=
79VQNGLHh_zXlFR3q-pKg$>
>         b/recipes-containers/docker/docker.inc
>         <https://urldefense.com/v3/__http://docker.inc__;!!AjveYdw8EvQ!=
a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL=
79VQNGLHh_zXlFR3q-pKg$>
>         index 99535a77..b0f52d77 100644
>         --- a/recipes-containers/docker/docker.inc
>         <https://urldefense.com/v3/__http://docker.inc__;!!AjveYdw8EvQ!=
a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL=
79VQNGLHh_zXlFR3q-pKg$>
>         +++ b/recipes-containers/docker/docker.inc
>         <https://urldefense.com/v3/__http://docker.inc__;!!AjveYdw8EvQ!=
a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL=
79VQNGLHh_zXlFR3q-pKg$>
>         @@ -80,10 +80,6 @@ do_compile() {
>
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass the needed cflags/ldflags so=
 that cgo
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 # can find the needed headers files=
 and libraries
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOARCH=3D${TARGET_GOARCH}
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D"1"
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D"${CFLAGS}
>         --sysroot=3D${STAGING_DIR_TARGET}"
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D"${LDFLAGS}
>         --sysroot=3D${STAGING_DIR_TARGET}"
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export DOCKER_BUILDTAGS=3D'${BUILD_=
TAGS}
>         ${PACKAGECONFIG_CONFARGS}'
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export GO111MODULE=3Doff
>
>         diff --git a/recipes-containers/kubernetes/kubernetes_git.bb
>         <https://urldefense.com/v3/__http://kubernetes_git.bb__;!!AjveY=
dw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZ=
bv67szL79VQNGLHh_zXlEfOKW7VQ$>
>         b/recipes-containers/kubernetes/kubernetes_git.bb
>         <https://urldefense.com/v3/__http://kubernetes_git.bb__;!!AjveY=
dw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZ=
bv67szL79VQNGLHh_zXlEfOKW7VQ$>
>         index f7b6940a..89c53930 100644
>         --- a/recipes-containers/kubernetes/kubernetes_git.bb
>         <https://urldefense.com/v3/__http://kubernetes_git.bb__;!!AjveY=
dw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZ=
bv67szL79VQNGLHh_zXlEfOKW7VQ$>
>         +++ b/recipes-containers/kubernetes/kubernetes_git.bb
>         <https://urldefense.com/v3/__http://kubernetes_git.bb__;!!AjveY=
dw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZ=
bv67szL79VQNGLHh_zXlEfOKW7VQ$>
>         @@ -54,6 +54,9 @@ inherit cni_networking
>
>         =C2=A0COMPATIBLE_HOST =3D '(x86_64.*|arm.*|aarch64.*)-linux'
>
>         +CGO_LDFLAGS ?=3D "${LDFLAGS}"
>         +CGO_LDFLAGS:remove =3D "${DEBUG_PREFIX_MAP}"
>         +
>         =C2=A0do_compile() {
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export
>         GOPATH=3D"${S}/src/import/.gopath:${S}/src/import/vendor:${STAG=
ING_DIR_TARGET}/${prefix}/local/go:${UNPACKDIR}/git/"
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${S}
>         @@ -70,7 +73,6 @@ do_compile() {
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export CGO_LDFLAGS=3D"$(echo ${BUIL=
D_LDFLAGS} | sed
>         's/-Wl,-O1//g' | sed 's/-Wl,--dynamic-linker.*?\( \|$\)//g')"
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export CC=3D"${BUILD_CC}"
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export LD=3D"${BUILD_LD}"
>         -
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 # set the toolchain to local to avo=
id an attempted
>         fetch of
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 # valiation by the build
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 # https://github.com/actions/setup-=
go/issues/420
>         <https://urldefense.com/v3/__https://github.com/actions/setup-g=
o/issues/420__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwk=
n4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlF7ekBHFw$>
>         @@ -85,8 +87,8 @@ do_compile() {
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOARCH=3D"${TARGET_GOARCH}"
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass the needed cflags/ldflags so=
 that cgo can find
>         the needed headers files and libraries
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export CGO_ENABLED=3D"1"
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D"${CFLAGS}
>         --sysroot=3D${STAGING_DIR_TARGET}"
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D"${LDFLAGS}
>         --sysroot=3D${STAGING_DIR_TARGET}"
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D"${CFLAGS}"
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D"${CGO_LDFLAGS=
}"
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export CFLAGS=3D""
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export LDFLAGS=3D""
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export CC=3D"${CC}"
>         diff --git a/recipes-containers/nerdctl/nerdctl_git.bb
>         <https://urldefense.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8=
EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv6=
7szL79VQNGLHh_zXlHOzkG3bw$>
>         b/recipes-containers/nerdctl/nerdctl_git.bb
>         <https://urldefense.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8=
EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv6=
7szL79VQNGLHh_zXlHOzkG3bw$>
>         index 8f63b48c..eb873e23 100644
>         --- a/recipes-containers/nerdctl/nerdctl_git.bb
>         <https://urldefense.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8=
EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv6=
7szL79VQNGLHh_zXlHOzkG3bw$>
>         +++ b/recipes-containers/nerdctl/nerdctl_git.bb
>         <https://urldefense.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8=
EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv6=
7szL79VQNGLHh_zXlHOzkG3bw$>
>         @@ -71,12 +71,6 @@ do_compile() {
>
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}/src/import
>
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass the needed cflags/ldflags s=
o that cgo
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # can find the needed headers file=
s and libraries
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOARCH=3D${TARGET_GOARCH}
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CGO_CFLAGS=3D"${CFLAGS}
>         --sysroot=3D${STAGING_DIR_TARGET}"
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CGO_LDFLAGS=3D"${LDFLAGS}
>         --sysroot=3D${STAGING_DIR_TARGET}"
>         -
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# -trimpath removes build pat=
hs from the binary
>         (required for reproducible builds)
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake GO=3D${GO} BUILDTA=
GS=3D"${BUILDTAGS}"
>         GO_BUILD_FLAGS=3D"-trimpath" binaries
>         =C2=A0}
>         diff --git
>         a/recipes-containers/oci-image-tools/oci-image-tools_git.bb
>         <https://urldefense.com/v3/__http://oci-image-tools_git.bb__;!!=
AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNr=
gIStZbv67szL79VQNGLHh_zXlHFYvMiTg$>
>         b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
>         <https://urldefense.com/v3/__http://oci-image-tools_git.bb__;!!=
AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNr=
gIStZbv67szL79VQNGLHh_zXlHFYvMiTg$>
>         index 36026214..6c355377 100644
>         ---
>         a/recipes-containers/oci-image-tools/oci-image-tools_git.bb
>         <https://urldefense.com/v3/__http://oci-image-tools_git.bb__;!!=
AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNr=
gIStZbv67szL79VQNGLHh_zXlHFYvMiTg$>
>         +++
>         b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
>         <https://urldefense.com/v3/__http://oci-image-tools_git.bb__;!!=
AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNr=
gIStZbv67szL79VQNGLHh_zXlHFYvMiTg$>
>         @@ -29,11 +29,8 @@ do_compile() {
>
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass the needed cflags/ldflags so=
 that cgo
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 # can find the needed headers files=
 and libraries
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D"1"
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export CFLAGS=3D""
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export LDFLAGS=3D""
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D"${TARGET_CFLAG=
S}"
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D"${TARGET_LDFL=
AGS}"
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export GO111MODULE=3Doff
>
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOBUILDFLAGS=3D"-trimpath"
>         diff --git
>         a/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
>         <https://urldefense.com/v3/__http://oci-runtime-tools_git.bb__;=
!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgN=
NrgIStZbv67szL79VQNGLHh_zXlHo17vUNg$>
>         b/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
>         <https://urldefense.com/v3/__http://oci-runtime-tools_git.bb__;=
!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgN=
NrgIStZbv67szL79VQNGLHh_zXlHo17vUNg$>
>         index 81f51f9c..0ba69756 100644
>         ---
>         a/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
>         <https://urldefense.com/v3/__http://oci-runtime-tools_git.bb__;=
!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgN=
NrgIStZbv67szL79VQNGLHh_zXlHo17vUNg$>
>         +++
>         b/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
>         <https://urldefense.com/v3/__http://oci-runtime-tools_git.bb__;=
!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgN=
NrgIStZbv67szL79VQNGLHh_zXlHo17vUNg$>
>         @@ -25,11 +25,8 @@ do_compile() {
>
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass the needed cflags/ldflags so=
 that cgo
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 # can find the needed headers files=
 and libraries
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D"1"
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export CFLAGS=3D""
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export LDFLAGS=3D""
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D"${TARGET_CFLAG=
S}"
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D"${TARGET_LDFL=
AGS}"
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export GO111MODULE=3Doff
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOFLAGS=3D"-mod=3Dvendor"
>
>         diff --git a/recipes-containers/podman/podman_git.bb
>         <https://urldefense.com/v3/__http://podman_git.bb__;!!AjveYdw8E=
vQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67=
szL79VQNGLHh_zXlEvWx5jpg$>
>         b/recipes-containers/podman/podman_git.bb
>         <https://urldefense.com/v3/__http://podman_git.bb__;!!AjveYdw8E=
vQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67=
szL79VQNGLHh_zXlEvWx5jpg$>
>         index f09e01f8..5e5f1f9b 100644
>         --- a/recipes-containers/podman/podman_git.bb
>         <https://urldefense.com/v3/__http://podman_git.bb__;!!AjveYdw8E=
vQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67=
szL79VQNGLHh_zXlEvWx5jpg$>
>         +++ b/recipes-containers/podman/podman_git.bb
>         <https://urldefense.com/v3/__http://podman_git.bb__;!!AjveYdw8E=
vQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67=
szL79VQNGLHh_zXlEvWx5jpg$>
>         @@ -78,19 +78,11 @@ do_compile() {
>
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf "../../../import/vendor/gith=
ub.com/varlink/
>         <https://urldefense.com/v3/__http://github.com/varlink/__;!!Ajv=
eYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIS=
tZbv67szL79VQNGLHh_zXlEGGsslOg$>"
>         ".gopath/src/github.com/varlink
>         <https://urldefense.com/v3/__http://github.com/varlink__;!!Ajve=
Ydw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgISt=
Zbv67szL79VQNGLHh_zXlHyXW604g$>"
>
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOARCH=3D"${BUILD_GOARCH}"
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOPATH=3D"${S}/src/.gopath"
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export
>         GOROOT=3D"${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/g=
o"
>
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${S}/src/.gopath/src/"${PODMAN_P=
KG}"
>
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0# Pass the needed cflags/ldflags so=
 that cgo
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0# can find the needed headers files=
 and libraries
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOARCH=3D${TARGET_GOARCH}
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D"1"
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D"${CFLAGS}
>         --sysroot=3D${STAGING_DIR_TARGET}"
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D"${LDFLAGS}
>         --sysroot=3D${STAGING_DIR_TARGET}"
>         -
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 # podman now builds go-md2man and r=
equires the
>         host/build details
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export NATIVE_GOOS=3D${BUILD_GOOS}
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export NATIVE_GOARCH=3D${BUILD_GOAR=
CH}
>         diff --git a/recipes-containers/runc/runc.inc
>         <https://urldefense.com/v3/__http://runc.inc__;!!AjveYdw8EvQ!a7=
XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79=
VQNGLHh_zXlGFMwrHwQ$>
>         b/recipes-containers/runc/runc.inc
>         <https://urldefense.com/v3/__http://runc.inc__;!!AjveYdw8EvQ!a7=
XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79=
VQNGLHh_zXlGFMwrHwQ$>
>         index b834ab14..ebff354f 100644
>         --- a/recipes-containers/runc/runc.inc
>         <https://urldefense.com/v3/__http://runc.inc__;!!AjveYdw8EvQ!a7=
XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79=
VQNGLHh_zXlGFMwrHwQ$>
>         +++ b/recipes-containers/runc/runc.inc
>         <https://urldefense.com/v3/__http://runc.inc__;!!AjveYdw8EvQ!a7=
XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79=
VQNGLHh_zXlGFMwrHwQ$>
>         @@ -57,9 +57,6 @@ do_compile() {
>
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass the needed cflags/ldflags so=
 that cgo
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 # can find the needed headers files=
 and libraries
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D"1"
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D"${CFLAGS}
>         --sysroot=3D${STAGING_DIR_TARGET}"
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D"${LDFLAGS}
>         --sysroot=3D${STAGING_DIR_TARGET}"
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export GO=3D${GO}
>
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export CFLAGS=3D""
>         diff --git a/recipes-containers/skopeo/skopeo_git.bb
>         <https://urldefense.com/v3/__http://skopeo_git.bb__;!!AjveYdw8E=
vQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67=
szL79VQNGLHh_zXlF9RFAGNA$>
>         b/recipes-containers/skopeo/skopeo_git.bb
>         <https://urldefense.com/v3/__http://skopeo_git.bb__;!!AjveYdw8E=
vQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67=
szL79VQNGLHh_zXlF9RFAGNA$>
>         index 936d2c3d..1542f2a6 100644
>         --- a/recipes-containers/skopeo/skopeo_git.bb
>         <https://urldefense.com/v3/__http://skopeo_git.bb__;!!AjveYdw8E=
vQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67=
szL79VQNGLHh_zXlF9RFAGNA$>
>         +++ b/recipes-containers/skopeo/skopeo_git.bb
>         <https://urldefense.com/v3/__http://skopeo_git.bb__;!!AjveYdw8E=
vQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67=
szL79VQNGLHh_zXlF9RFAGNA$>
>         @@ -53,11 +53,8 @@ do_compile() {
>
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass the needed cflags/ldflags so=
 that cgo
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 # can find the needed headers files=
 and libraries
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D"1"
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export CFLAGS=3D""
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export LDFLAGS=3D""
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D"${TARGET_CFLAG=
S}"
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D"${TARGET_LDFL=
AGS}"
>
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export GO111MODULE=3Doff
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 export EXTRA_LDFLAGS=3D"-s -w"
>         diff --git a/recipes-containers/umoci/umoci_git.bb
>         <https://urldefense.com/v3/__http://umoci_git.bb__;!!AjveYdw8Ev=
Q!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67s=
zL79VQNGLHh_zXlETIKfTGg$>
>         b/recipes-containers/umoci/umoci_git.bb
>         <https://urldefense.com/v3/__http://umoci_git.bb__;!!AjveYdw8Ev=
Q!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67s=
zL79VQNGLHh_zXlETIKfTGg$>
>         index f148b7fa..32868594 100644
>         --- a/recipes-containers/umoci/umoci_git.bb
>         <https://urldefense.com/v3/__http://umoci_git.bb__;!!AjveYdw8Ev=
Q!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67s=
zL79VQNGLHh_zXlETIKfTGg$>
>         +++ b/recipes-containers/umoci/umoci_git.bb
>         <https://urldefense.com/v3/__http://umoci_git.bb__;!!AjveYdw8Ev=
Q!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67s=
zL79VQNGLHh_zXlETIKfTGg$>
>         @@ -62,11 +62,8 @@ do_compile() {
>
>         =C2=A0 =C2=A0 =C2=A0# Pass the needed cflags/ldflags so that cg=
o
>         =C2=A0 =C2=A0 =C2=A0# can find the needed headers files and lib=
raries
>         -=C2=A0 =C2=A0 export CGO_ENABLED=3D"1"
>         =C2=A0 =C2=A0 =C2=A0export CFLAGS=3D""
>         =C2=A0 =C2=A0 =C2=A0export LDFLAGS=3D""
>         -=C2=A0 =C2=A0 export CGO_CFLAGS=3D"${TARGET_CFLAGS}"
>         -=C2=A0 =C2=A0 export CGO_LDFLAGS=3D"${TARGET_LDFLAGS}"
>
>         =C2=A0 =C2=A0 =C2=A0export GO111MODULE=3Doff
>
>         --=20
>         2.34.1
>
>
>
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
>     View/Reply Online (#9563):
>     https://lists.yoctoproject.org/g/meta-virtualization/message/9563
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-=
virtualization/message/9563__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8=
S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlFV4YXp0Q$>
>     Mute This Topic:
>     https://lists.yoctoproject.org/mt/117668816/1050810
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/1176=
68816/1050810__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKw=
kn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlH2w4MnXg$>
>     Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>     <mailto:meta-virtualization%2Bowner@lists.yoctoproject.org>
>     Unsubscribe:
>     https://lists.yoctoproject.org/g/meta-virtualization/unsub
>     <https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-=
virtualization/unsub__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrf=
gGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlEXPiyRHg$>
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
--------------U6SP0ERvIYayrsHBQt7LKUL6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6191KFU72743986

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#ffffff">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 2/6/26 20:51, Bruce Ashfield wrote:=
<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4NP703RvC2AAZ2-X0R0ofG=3D=
-1n1nCdk9mU9k1oWd7i2=3Dw@mail.gmail.com">
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
          <div dir=3D"ltr">
            <div dir=3D"ltr">
              <div style=3D"font-size:small"><br>
              </div>
            </div>
            <br>
            <div class=3D"gmail_quote">
              <div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 6, 2026 a=
t
                7:49=E2=80=AFAM Bruce Ashfield via
                <a href=3D"https://urldefense.com/v3/__http://lists.yocto=
project.org__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn=
4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlG9L8r4Sw$" target=3D"_blank" moz=
-do-not-send=3D"true">
                  lists.yoctoproject.org</a> &lt;bruce.ashfield=3D<a href=
=3D"mailto:gmail.com@lists.yoctoproject.org" target=3D"_blank" moz-do-not=
-send=3D"true" class=3D"moz-txt-link-freetext">gmail.com@lists.yoctoproje=
ct.org</a>&gt;
                wrote:<br>
              </div>
              <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                <div dir=3D"ltr">
                  <div dir=3D"ltr">
                    <div style=3D"font-size:small"><br>
                    </div>
                  </div>
                  <br>
                  <div class=3D"gmail_quote">
                    <div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 6,
                      2026 at 4:17=E2=80=AFAM Changqing Li via
                      <a href=3D"https://urldefense.com/v3/__http://lists=
.yoctoproject.org__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGu=
WvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlG9L8r4Sw$" target=3D"_blan=
k" moz-do-not-send=3D"true">
                        lists.yoctoproject.org</a> &lt;<a href=3D"https:/=
/urldefense.com/v3/__http://changqing.li__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX=
7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlG_M=
RlU8w$" target=3D"_blank" moz-do-not-send=3D"true">changqing.li</a>=3D<a =
href=3D"mailto:windriver.com@lists.yoctoproject.org" target=3D"_blank" mo=
z-do-not-send=3D"true" class=3D"moz-txt-link-freetext">windriver.com@list=
s.yoctoproject.org</a>&gt;
                      wrote:<br>
                    </div>
                    <blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                      From: Changqing Li &lt;<a href=3D"mailto:changqing.=
li@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">changqing.li@windriver.com</a>&gt;<br>
                      <br>
                      * Refer [1], cgo will embeded cgo_ldflags in the
                      intermediary output,<br>
                      &nbsp; which make content ID will be incfluenced by
                      cgo_ldflags.<br>
                      &nbsp; '--sysroot=3Dxxx' includes build path, which=
 will
                      make the binary not<br>
                      &nbsp; reproducible, these recipes can build
                      successfully without --sysroot, so<br>
                      &nbsp; remove it<br>
                      <br>
                      * CGO_ENABLED/CGO_CFLAGS/CGO_LDFLAGS already
                      exported in go.bbclass with<br>
                      &nbsp; the same value, remove the not needed settin=
gs<br>
                    </blockquote>
                    <div><br>
                    </div>
                    <div>
                      <div style=3D"font-size:small">refer to all my
                        previous email on the subject.</div>
                      <div style=3D"font-size:small"><br>
                      </div>
                      <div style=3D"font-size:small">I will continue to
                        set these in the classes themselves.</div>
                    </div>
                  </div>
                </div>
              </blockquote>
              <div><br>
              </div>
              <div>
                <div class=3D"gmail_default" style=3D"font-size:small">BU=
T,
                  I will take the removal of the sysroot if we no longer
                  need it.</div>
                <div class=3D"gmail_default" style=3D"font-size:small"><b=
r>
                </div>
                <div class=3D"gmail_default" style=3D"font-size:small">Bu=
t
                  the duplicated values from the go classes are entirely
                  intentional.</div>
                <div class=3D"gmail_default" style=3D"font-size:small"><b=
r>
                </div>
                <div class=3D"gmail_default" style=3D"font-size:small">Br=
uce</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>OK,&nbsp; I will send a V2, only remove --sysroot and keep the
      duplicated value.</p>
    <p>Regards</p>
    <p>Changqing</p>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4NP703RvC2AAZ2-X0R0ofG=3D=
-1n1nCdk9mU9k1oWd7i2=3Dw@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div dir=3D"ltr">
            <div class=3D"gmail_quote">
              <div>&nbsp;</div>
              <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                <div dir=3D"ltr">
                  <div class=3D"gmail_quote">
                    <div>
                      <div style=3D"font-size:small"><br>
                      </div>
                      <div style=3D"font-size:small">Bruce</div>
                      <br>
                    </div>
                    <div>&nbsp;</div>
                    <blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                      <br>
                      [1] <a href=3D"https://urldefense.com/v3/__https://=
git.openembedded.org/openembedded-core/commit/?id=3D1797741aad02b8bf429fa=
c4b81e30cdda64b5448__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfg=
GuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlEh-dmwdA$" rel=3D"norefe=
rrer" target=3D"_blank" moz-do-not-send=3D"true">
https://git.openembedded.org/openembedded-core/commit/?id=3D1797741aad02b=
8bf429fac4b81e30cdda64b5448</a><br>
                      <br>
                      Signed-off-by: Changqing Li &lt;<a href=3D"mailto:c=
hangqing.li@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" cla=
ss=3D"moz-txt-link-freetext">changqing.li@windriver.com</a>&gt;<br>
                      ---<br>
                      &nbsp;recipes-containers/containerd/<a href=3D"http=
s://urldefense.com/v3/__http://containerd_git.bb__;!!AjveYdw8EvQ!a7XmcWhd=
COyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLH=
h_zXlG-dNxmyQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"t=
rue">containerd_git.bb</a>&nbsp; &nbsp;
                      &nbsp; &nbsp; &nbsp; &nbsp;| 3 ---<br>
                      &nbsp;recipes-containers/cri-tools/<a href=3D"https=
://urldefense.com/v3/__http://cri-tools_git.bb__;!!AjveYdw8EvQ!a7XmcWhdCO=
yYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_=
zXlFrx_lp2w$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e">cri-tools_git.bb</a>&nbsp; &nbsp; &nbsp;
                      &nbsp; &nbsp; &nbsp; &nbsp;| 5 -----<br>
                      &nbsp;recipes-containers/docker-compose/<a href=3D"=
https://urldefense.com/v3/__http://docker-compose_git.bb__;!!AjveYdw8EvQ!=
a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL=
79VQNGLHh_zXlFdoh_aVg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-s=
end=3D"true">docker-compose_git.bb</a>&nbsp;
                      &nbsp;| 6 +-----<br>
                      &nbsp;.../docker-distribution/<a href=3D"https://ur=
ldefense.com/v3/__http://docker-distribution_git.bb__;!!AjveYdw8EvQ!a7Xmc=
WhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQN=
GLHh_zXlGVstuGEg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">docker-distribution_git.bb</a>&nbsp;
                      &nbsp; &nbsp; &nbsp; | 3 ---<br>
                      &nbsp;recipes-containers/docker/<a href=3D"https://=
urldefense.com/v3/__http://docker.inc__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BX=
sZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlFR3q-p=
Kg$" moz-do-not-send=3D"true">docker.inc</a>&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;
                      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 4 ----<br>
                      &nbsp;recipes-containers/kubernetes/<a href=3D"http=
s://urldefense.com/v3/__http://kubernetes_git.bb__;!!AjveYdw8EvQ!a7XmcWhd=
COyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLH=
h_zXlEfOKW7VQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"t=
rue">kubernetes_git.bb</a>&nbsp; &nbsp;
                      &nbsp; &nbsp; &nbsp; &nbsp;| 8 +++++---<br>
                      &nbsp;recipes-containers/nerdctl/<a href=3D"https:/=
/urldefense.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8EvQ!a7XmcWhdCOyYHF=
fX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlH=
OzkG3bw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">n=
erdctl_git.bb</a>&nbsp; &nbsp; &nbsp; &nbsp;
                      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 6 ------<br>
                      &nbsp;recipes-containers/oci-image-tools/<a href=3D=
"https://urldefense.com/v3/__http://oci-image-tools_git.bb__;!!AjveYdw8Ev=
Q!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67s=
zL79VQNGLHh_zXlHFYvMiTg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not=
-send=3D"true">oci-image-tools_git.bb</a>
                      | 3 ---<br>
                      &nbsp;.../oci-runtime-tools/<a href=3D"https://urld=
efense.com/v3/__http://oci-runtime-tools_git.bb__;!!AjveYdw8EvQ!a7XmcWhdC=
OyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh=
_zXlHo17vUNg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tr=
ue">oci-runtime-tools_git.bb</a>&nbsp;
                      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 3 ---<br>
                      &nbsp;recipes-containers/podman/<a href=3D"https://=
urldefense.com/v3/__http://podman_git.bb__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX=
7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlEvW=
x5jpg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">pod=
man_git.bb</a>&nbsp; &nbsp; &nbsp; &nbsp;
                      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 8 ------=
--<br>
                      &nbsp;recipes-containers/runc/<a href=3D"https://ur=
ldefense.com/v3/__http://runc.inc__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3=
Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlGFMwrHwQ$"=
 moz-do-not-send=3D"true">runc.inc</a>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;
                      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 3 ---<b=
r>
                      &nbsp;recipes-containers/skopeo/<a href=3D"https://=
urldefense.com/v3/__http://skopeo_git.bb__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX=
7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlF9R=
FAGNA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">sko=
peo_git.bb</a>&nbsp; &nbsp; &nbsp; &nbsp;
                      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 3 ---<br=
>
                      &nbsp;recipes-containers/umoci/<a href=3D"https://u=
rldefense.com/v3/__http://umoci_git.bb__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7B=
XsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlETIKf=
TGg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">umoci=
_git.bb</a>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 3 ---<br=
>
                      &nbsp;13 files changed, 6 insertions(+), 52
                      deletions(-)<br>
                      <br>
                      diff --git a/recipes-containers/containerd/<a href=3D=
"https://urldefense.com/v3/__http://containerd_git.bb__;!!AjveYdw8EvQ!a7X=
mcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79V=
QNGLHh_zXlG-dNxmyQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=
=3D"true">containerd_git.bb</a>
                      b/recipes-containers/containerd/<a href=3D"https://=
urldefense.com/v3/__http://containerd_git.bb__;!!AjveYdw8EvQ!a7XmcWhdCOyY=
HFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zX=
lG-dNxmyQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>containerd_git.bb</a><br>
                      index 081cf354..3d66e06e 100644<br>
                      --- a/recipes-containers/containerd/<a href=3D"http=
s://urldefense.com/v3/__http://containerd_git.bb__;!!AjveYdw8EvQ!a7XmcWhd=
COyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLH=
h_zXlG-dNxmyQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"t=
rue">containerd_git.bb</a><br>
                      +++ b/recipes-containers/containerd/<a href=3D"http=
s://urldefense.com/v3/__http://containerd_git.bb__;!!AjveYdw8EvQ!a7XmcWhd=
COyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLH=
h_zXlG-dNxmyQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"t=
rue">containerd_git.bb</a><br>
                      @@ -47,9 +47,6 @@ do_compile() {<br>
                      <br>
                      &nbsp; &nbsp; &nbsp;# Pass the needed cflags/ldflag=
s so that cgo<br>
                      &nbsp; &nbsp; &nbsp;# can find the needed headers f=
iles and
                      libraries<br>
                      -&nbsp; &nbsp; export CGO_ENABLED=3D&quot;1&quot;<b=
r>
                      -&nbsp; &nbsp; export CGO_CFLAGS=3D&quot;${CFLAGS}
                      --sysroot=3D${STAGING_DIR_TARGET}&quot;<br>
                      -&nbsp; &nbsp; export CGO_LDFLAGS=3D&quot;${LDFLAGS=
}
                      --sysroot=3D${STAGING_DIR_TARGET}&quot;<br>
                      &nbsp; &nbsp; &nbsp;export BUILDTAGS=3D&quot;no_btr=
fs static_build
                      netgo&quot;<br>
                      &nbsp; &nbsp; &nbsp;export CFLAGS=3D&quot;${CFLAGS}=
&quot;<br>
                      &nbsp; &nbsp; &nbsp;export LDFLAGS=3D&quot;${LDFLAG=
S}&quot;<br>
                      diff --git a/recipes-containers/cri-tools/<a href=3D=
"https://urldefense.com/v3/__http://cri-tools_git.bb__;!!AjveYdw8EvQ!a7Xm=
cWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQ=
NGLHh_zXlFrx_lp2w$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">cri-tools_git.bb</a>
                      b/recipes-containers/cri-tools/<a href=3D"https://u=
rldefense.com/v3/__http://cri-tools_git.bb__;!!AjveYdw8EvQ!a7XmcWhdCOyYHF=
fX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlF=
rx_lp2w$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">c=
ri-tools_git.bb</a><br>
                      index dad675e8..98c43b6b 100644<br>
                      --- a/recipes-containers/cri-tools/<a href=3D"https=
://urldefense.com/v3/__http://cri-tools_git.bb__;!!AjveYdw8EvQ!a7XmcWhdCO=
yYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_=
zXlFrx_lp2w$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e">cri-tools_git.bb</a><br>
                      +++ b/recipes-containers/cri-tools/<a href=3D"https=
://urldefense.com/v3/__http://cri-tools_git.bb__;!!AjveYdw8EvQ!a7XmcWhdCO=
yYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_=
zXlFrx_lp2w$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e">cri-tools_git.bb</a><br>
                      @@ -46,12 +46,7 @@ do_compile() {<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export
GOPATH=3D&quot;${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_D=
IR_TARGET}/${prefix}/local/go&quot;<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; cd ${S}/src/import<br>
                      <br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;# Build the target bina=
ries<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export GOARCH=3D&quot;$=
{TARGET_GOARCH}&quot;<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; # Pass the needed cflag=
s/ldflags so that
                      cgo can find the needed headers files and
                      libraries<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export CGO_ENABLED=3D&q=
uot;1&quot;<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export CGO_CFLAGS=3D&qu=
ot;${CFLAGS}
                      --sysroot=3D${STAGING_DIR_TARGET}&quot;<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export CGO_LDFLAGS=3D&q=
uot;${LDFLAGS}
                      --sysroot=3D${STAGING_DIR_TARGET}&quot;<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export CFLAGS=3D&quot;&=
quot;<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export LDFLAGS=3D&quot;=
&quot;<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export CC=3D&quot;${CC}=
&quot;<br>
                      diff --git a/recipes-containers/docker-compose/<a h=
ref=3D"https://urldefense.com/v3/__http://docker-compose_git.bb__;!!AjveY=
dw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZ=
bv67szL79VQNGLHh_zXlFdoh_aVg$" rel=3D"noreferrer" target=3D"_blank" moz-d=
o-not-send=3D"true">docker-compose_git.bb</a>
                      b/recipes-containers/docker-compose/<a href=3D"http=
s://urldefense.com/v3/__http://docker-compose_git.bb__;!!AjveYdw8EvQ!a7Xm=
cWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQ=
NGLHh_zXlFdoh_aVg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">docker-compose_git.bb</a><br>
                      index ccb36a16..de9427ae 100644<br>
                      --- a/recipes-containers/docker-compose/<a href=3D"=
https://urldefense.com/v3/__http://docker-compose_git.bb__;!!AjveYdw8EvQ!=
a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL=
79VQNGLHh_zXlFdoh_aVg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-s=
end=3D"true">docker-compose_git.bb</a><br>
                      +++ b/recipes-containers/docker-compose/<a href=3D"=
https://urldefense.com/v3/__http://docker-compose_git.bb__;!!AjveYdw8EvQ!=
a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL=
79VQNGLHh_zXlFdoh_aVg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-s=
end=3D"true">docker-compose_git.bb</a><br>
                      @@ -53,13 +53,9 @@ do_compile() {<br>
                      <br>
                      &nbsp; &nbsp; &nbsp; &nbsp; # GOMODCACHE, GOPROXY, =
GOSUMDB,
                      GOTOOLCHAIN are set by go-mod-vcs.bbclass<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export
GOPATH=3D&quot;${S}/src/import/.gopath:${STAGING_DIR_TARGET}/${prefix}/lo=
cal/go&quot;<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export CGO_ENABLED=3D&q=
uot;1&quot;<br>
                      <br>
                      &nbsp; &nbsp; &nbsp; &nbsp; # Pass the needed cflag=
s/ldflags so that
                      cgo<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; # can find the needed h=
eaders files and
                      libraries<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export GOARCH=3D${TARGE=
T_GOARCH}<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export CGO_CFLAGS=3D&qu=
ot;${CFLAGS}
                      --sysroot=3D${STAGING_DIR_TARGET}&quot;<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export CGO_LDFLAGS=3D&q=
uot;${LDFLAGS}
                      --sysroot=3D${STAGING_DIR_TARGET}&quot;<br>
                      <br>
                      &nbsp; &nbsp; &nbsp; &nbsp; GO_LDFLAGS=3D&quot;-s -=
w -X
                      internal.Version=3D${PV} -X
                      ${COMPOSE_PKG}/internal.Version=3D${PV}&quot;<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; GO_BUILDTAGS=3D&quot;&q=
uot;<br>
                      @@ -85,4 +81,4 @@ INSANE_SKIP:${PN} +=3D &quot;ldfl=
ags
                      already-stripped&quot;<br>
                      <br>
                      &nbsp;# the AWS dependency is 8GB, try and control =
the<br>
                      &nbsp;# size of the clones<br>
                      -BB_GIT_SHALLOW =3D &quot;1&quot;<br>
                      \ No newline at end of file<br>
                      +BB_GIT_SHALLOW =3D &quot;1&quot;<br>
                      diff --git
                      a/recipes-containers/docker-distribution/<a href=3D=
"https://urldefense.com/v3/__http://docker-distribution_git.bb__;!!AjveYd=
w8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZb=
v67szL79VQNGLHh_zXlGVstuGEg$" rel=3D"noreferrer" target=3D"_blank" moz-do=
-not-send=3D"true">docker-distribution_git.bb</a>
                      b/recipes-containers/docker-distribution/<a href=3D=
"https://urldefense.com/v3/__http://docker-distribution_git.bb__;!!AjveYd=
w8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZb=
v67szL79VQNGLHh_zXlGVstuGEg$" rel=3D"noreferrer" target=3D"_blank" moz-do=
-not-send=3D"true">docker-distribution_git.bb</a><br>
                      index 5e37fe74..63001331 100644<br>
                      --- a/recipes-containers/docker-distribution/<a hre=
f=3D"https://urldefense.com/v3/__http://docker-distribution_git.bb__;!!Aj=
veYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgI=
StZbv67szL79VQNGLHh_zXlGVstuGEg$" rel=3D"noreferrer" target=3D"_blank" mo=
z-do-not-send=3D"true">docker-distribution_git.bb</a><br>
                      +++ b/recipes-containers/docker-distribution/<a hre=
f=3D"https://urldefense.com/v3/__http://docker-distribution_git.bb__;!!Aj=
veYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgI=
StZbv67szL79VQNGLHh_zXlGVstuGEg$" rel=3D"noreferrer" target=3D"_blank" mo=
z-do-not-send=3D"true">docker-distribution_git.bb</a><br>
                      @@ -28,12 +28,9 @@ do_compile() {<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export GOROOT=3D&quot;$=
{STAGING_LIBDIR}/go&quot;<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; # Pass the needed cflag=
s/ldflags so that
                      cgo<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; # can find the needed h=
eaders files and
                      libraries<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export CGO_ENABLED=3D&q=
uot;1&quot;<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export CFLAGS=3D&quot;&=
quot;<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export LDFLAGS=3D&quot;=
&quot;<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export CGO_CFLAGS=3D&qu=
ot;${TARGET_CFLAGS}&quot;<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export GO_GCFLAGS=3D&qu=
ot;&quot;<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export CGO_LDFLAGS=3D&q=
uot;${TARGET_LDFLAGS}&quot;<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export GO111MODULE=3Dof=
f<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export GO_BUILD_FLAGS=3D=
&quot;-trimpath&quot;<br>
                      <br>
                      diff --git a/recipes-containers/docker/<a href=3D"h=
ttps://urldefense.com/v3/__http://docker.inc__;!!AjveYdw8EvQ!a7XmcWhdCOyY=
HFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zX=
lFR3q-pKg$" moz-do-not-send=3D"true">docker.inc</a>
                      b/recipes-containers/docker/<a href=3D"https://urld=
efense.com/v3/__http://docker.inc__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3=
Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlFR3q-pKg$"=
 moz-do-not-send=3D"true">docker.inc</a><br>
                      index 99535a77..b0f52d77 100644<br>
                      --- a/recipes-containers/docker/<a href=3D"https://=
urldefense.com/v3/__http://docker.inc__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BX=
sZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlFR3q-p=
Kg$" moz-do-not-send=3D"true">docker.inc</a><br>
                      +++ b/recipes-containers/docker/<a href=3D"https://=
urldefense.com/v3/__http://docker.inc__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BX=
sZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlFR3q-p=
Kg$" moz-do-not-send=3D"true">docker.inc</a><br>
                      @@ -80,10 +80,6 @@ do_compile() {<br>
                      <br>
                      &nbsp; &nbsp; &nbsp; &nbsp; # Pass the needed cflag=
s/ldflags so that
                      cgo<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; # can find the needed h=
eaders files and
                      libraries<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export GOARCH=3D${TARGE=
T_GOARCH}<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export CGO_ENABLED=3D&q=
uot;1&quot;<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export CGO_CFLAGS=3D&qu=
ot;${CFLAGS}
                      --sysroot=3D${STAGING_DIR_TARGET}&quot;<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export CGO_LDFLAGS=3D&q=
uot;${LDFLAGS}
                      --sysroot=3D${STAGING_DIR_TARGET}&quot;<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export DOCKER_BUILDTAGS=
=3D'${BUILD_TAGS}
                      ${PACKAGECONFIG_CONFARGS}'<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export GO111MODULE=3Dof=
f<br>
                      <br>
                      diff --git a/recipes-containers/kubernetes/<a href=3D=
"https://urldefense.com/v3/__http://kubernetes_git.bb__;!!AjveYdw8EvQ!a7X=
mcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79V=
QNGLHh_zXlEfOKW7VQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=
=3D"true">kubernetes_git.bb</a>
                      b/recipes-containers/kubernetes/<a href=3D"https://=
urldefense.com/v3/__http://kubernetes_git.bb__;!!AjveYdw8EvQ!a7XmcWhdCOyY=
HFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zX=
lEfOKW7VQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>kubernetes_git.bb</a><br>
                      index f7b6940a..89c53930 100644<br>
                      --- a/recipes-containers/kubernetes/<a href=3D"http=
s://urldefense.com/v3/__http://kubernetes_git.bb__;!!AjveYdw8EvQ!a7XmcWhd=
COyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLH=
h_zXlEfOKW7VQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"t=
rue">kubernetes_git.bb</a><br>
                      +++ b/recipes-containers/kubernetes/<a href=3D"http=
s://urldefense.com/v3/__http://kubernetes_git.bb__;!!AjveYdw8EvQ!a7XmcWhd=
COyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLH=
h_zXlEfOKW7VQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"t=
rue">kubernetes_git.bb</a><br>
                      @@ -54,6 +54,9 @@ inherit cni_networking<br>
                      <br>
                      &nbsp;COMPATIBLE_HOST =3D
                      '(x86_64.*|arm.*|aarch64.*)-linux'<br>
                      <br>
                      +CGO_LDFLAGS ?=3D &quot;${LDFLAGS}&quot;<br>
                      +CGO_LDFLAGS:remove =3D &quot;${DEBUG_PREFIX_MAP}&q=
uot;<br>
                      +<br>
                      &nbsp;do_compile() {<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export
GOPATH=3D&quot;${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_D=
IR_TARGET}/${prefix}/local/go:${UNPACKDIR}/git/&quot;<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; cd ${S}<br>
                      @@ -70,7 +73,6 @@ do_compile() {<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export CGO_LDFLAGS=3D&q=
uot;$(echo
                      ${BUILD_LDFLAGS} | sed 's/-Wl,-O1//g' | sed
                      's/-Wl,--dynamic-linker.*?\( \|$\)//g')&quot;<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export CC=3D&quot;${BUI=
LD_CC}&quot;<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export LD=3D&quot;${BUI=
LD_LD}&quot;<br>
                      -<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; # set the toolchain to =
local to avoid an
                      attempted fetch of<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; # valiation by the buil=
d<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; # <a href=3D"https://ur=
ldefense.com/v3/__https://github.com/actions/setup-go/issues/420__;!!Ajve=
Ydw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgISt=
Zbv67szL79VQNGLHh_zXlF7ekBHFw$" rel=3D"noreferrer" target=3D"_blank" moz-=
do-not-send=3D"true">
                        https://github.com/actions/setup-go/issues/420</a=
><br>
                      @@ -85,8 +87,8 @@ do_compile() {<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export GOARCH=3D&quot;$=
{TARGET_GOARCH}&quot;<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; # Pass the needed cflag=
s/ldflags so that
                      cgo can find the needed headers files and
                      libraries<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export CGO_ENABLED=3D&q=
uot;1&quot;<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export CGO_CFLAGS=3D&qu=
ot;${CFLAGS}
                      --sysroot=3D${STAGING_DIR_TARGET}&quot;<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export CGO_LDFLAGS=3D&q=
uot;${LDFLAGS}
                      --sysroot=3D${STAGING_DIR_TARGET}&quot;<br>
                      +&nbsp; &nbsp; &nbsp; &nbsp;export CGO_CFLAGS=3D&qu=
ot;${CFLAGS}&quot;<br>
                      +&nbsp; &nbsp; &nbsp; &nbsp;export CGO_LDFLAGS=3D&q=
uot;${CGO_LDFLAGS}&quot;<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export CFLAGS=3D&quot;&=
quot;<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export LDFLAGS=3D&quot;=
&quot;<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export CC=3D&quot;${CC}=
&quot;<br>
                      diff --git a/recipes-containers/nerdctl/<a href=3D"=
https://urldefense.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8EvQ!a7XmcWh=
dCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGL=
Hh_zXlHOzkG3bw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"=
true">nerdctl_git.bb</a>
                      b/recipes-containers/nerdctl/<a href=3D"https://url=
defense.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7B=
XsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlHOzkG=
3bw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">nerdc=
tl_git.bb</a><br>
                      index 8f63b48c..eb873e23 100644<br>
                      --- a/recipes-containers/nerdctl/<a href=3D"https:/=
/urldefense.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8EvQ!a7XmcWhdCOyYHF=
fX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlH=
OzkG3bw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">n=
erdctl_git.bb</a><br>
                      +++ b/recipes-containers/nerdctl/<a href=3D"https:/=
/urldefense.com/v3/__http://nerdctl_git.bb__;!!AjveYdw8EvQ!a7XmcWhdCOyYHF=
fX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlH=
OzkG3bw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">n=
erdctl_git.bb</a><br>
                      @@ -71,12 +71,6 @@ do_compile() {<br>
                      <br>
                      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cd ${S}/src/impor=
t<br>
                      <br>
                      -&nbsp; &nbsp; &nbsp; &nbsp; # Pass the needed cfla=
gs/ldflags so that
                      cgo<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp; # can find the needed =
headers files and
                      libraries<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp; export GOARCH=3D${TARG=
ET_GOARCH}<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp; export CGO_CFLAGS=3D&q=
uot;${CFLAGS}
                      --sysroot=3D${STAGING_DIR_TARGET}&quot;<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp; export CGO_LDFLAGS=3D&=
quot;${LDFLAGS}
                      --sysroot=3D${STAGING_DIR_TARGET}&quot;<br>
                      -<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;# -trimpath remov=
es build paths from the
                      binary (required for reproducible builds)<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe_runmake GO=3D$=
{GO}
                      BUILDTAGS=3D&quot;${BUILDTAGS}&quot;
                      GO_BUILD_FLAGS=3D&quot;-trimpath&quot; binaries<br>
                      &nbsp;}<br>
                      diff --git a/recipes-containers/oci-image-tools/<a =
href=3D"https://urldefense.com/v3/__http://oci-image-tools_git.bb__;!!Ajv=
eYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIS=
tZbv67szL79VQNGLHh_zXlHFYvMiTg$" rel=3D"noreferrer" target=3D"_blank" moz=
-do-not-send=3D"true">oci-image-tools_git.bb</a>
                      b/recipes-containers/oci-image-tools/<a href=3D"htt=
ps://urldefense.com/v3/__http://oci-image-tools_git.bb__;!!AjveYdw8EvQ!a7=
XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79=
VQNGLHh_zXlHFYvMiTg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-sen=
d=3D"true">oci-image-tools_git.bb</a><br>
                      index 36026214..6c355377 100644<br>
                      --- a/recipes-containers/oci-image-tools/<a href=3D=
"https://urldefense.com/v3/__http://oci-image-tools_git.bb__;!!AjveYdw8Ev=
Q!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67s=
zL79VQNGLHh_zXlHFYvMiTg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not=
-send=3D"true">oci-image-tools_git.bb</a><br>
                      +++ b/recipes-containers/oci-image-tools/<a href=3D=
"https://urldefense.com/v3/__http://oci-image-tools_git.bb__;!!AjveYdw8Ev=
Q!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67s=
zL79VQNGLHh_zXlHFYvMiTg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not=
-send=3D"true">oci-image-tools_git.bb</a><br>
                      @@ -29,11 +29,8 @@ do_compile() {<br>
                      <br>
                      &nbsp; &nbsp; &nbsp; &nbsp; # Pass the needed cflag=
s/ldflags so that
                      cgo<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; # can find the needed h=
eaders files and
                      libraries<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export CGO_ENABLED=3D&q=
uot;1&quot;<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export CFLAGS=3D&quot;&=
quot;<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export LDFLAGS=3D&quot;=
&quot;<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export CGO_CFLAGS=3D&qu=
ot;${TARGET_CFLAGS}&quot;<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export CGO_LDFLAGS=3D&q=
uot;${TARGET_LDFLAGS}&quot;<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export GO111MODULE=3Dof=
f<br>
                      <br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export GOBUILDFLAGS=3D&=
quot;-trimpath&quot;<br>
                      diff --git a/recipes-containers/oci-runtime-tools/<=
a href=3D"https://urldefense.com/v3/__http://oci-runtime-tools_git.bb__;!=
!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNN=
rgIStZbv67szL79VQNGLHh_zXlHo17vUNg$" rel=3D"noreferrer" target=3D"_blank"=
 moz-do-not-send=3D"true">oci-runtime-tools_git.bb</a>
                      b/recipes-containers/oci-runtime-tools/<a href=3D"h=
ttps://urldefense.com/v3/__http://oci-runtime-tools_git.bb__;!!AjveYdw8Ev=
Q!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67s=
zL79VQNGLHh_zXlHo17vUNg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not=
-send=3D"true">oci-runtime-tools_git.bb</a><br>
                      index 81f51f9c..0ba69756 100644<br>
                      --- a/recipes-containers/oci-runtime-tools/<a href=3D=
"https://urldefense.com/v3/__http://oci-runtime-tools_git.bb__;!!AjveYdw8=
EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv6=
7szL79VQNGLHh_zXlHo17vUNg$" rel=3D"noreferrer" target=3D"_blank" moz-do-n=
ot-send=3D"true">oci-runtime-tools_git.bb</a><br>
                      +++ b/recipes-containers/oci-runtime-tools/<a href=3D=
"https://urldefense.com/v3/__http://oci-runtime-tools_git.bb__;!!AjveYdw8=
EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv6=
7szL79VQNGLHh_zXlHo17vUNg$" rel=3D"noreferrer" target=3D"_blank" moz-do-n=
ot-send=3D"true">oci-runtime-tools_git.bb</a><br>
                      @@ -25,11 +25,8 @@ do_compile() {<br>
                      <br>
                      &nbsp; &nbsp; &nbsp; &nbsp; # Pass the needed cflag=
s/ldflags so that
                      cgo<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; # can find the needed h=
eaders files and
                      libraries<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export CGO_ENABLED=3D&q=
uot;1&quot;<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export CFLAGS=3D&quot;&=
quot;<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export LDFLAGS=3D&quot;=
&quot;<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export CGO_CFLAGS=3D&qu=
ot;${TARGET_CFLAGS}&quot;<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export CGO_LDFLAGS=3D&q=
uot;${TARGET_LDFLAGS}&quot;<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export GO111MODULE=3Dof=
f<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export GOFLAGS=3D&quot;=
-mod=3Dvendor&quot;<br>
                      <br>
                      diff --git a/recipes-containers/podman/<a href=3D"h=
ttps://urldefense.com/v3/__http://podman_git.bb__;!!AjveYdw8EvQ!a7XmcWhdC=
OyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh=
_zXlEvWx5jpg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tr=
ue">podman_git.bb</a>
                      b/recipes-containers/podman/<a href=3D"https://urld=
efense.com/v3/__http://podman_git.bb__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXs=
Za3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlEvWx5jp=
g$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">podman_=
git.bb</a><br>
                      index f09e01f8..5e5f1f9b 100644<br>
                      --- a/recipes-containers/podman/<a href=3D"https://=
urldefense.com/v3/__http://podman_git.bb__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX=
7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlEvW=
x5jpg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">pod=
man_git.bb</a><br>
                      +++ b/recipes-containers/podman/<a href=3D"https://=
urldefense.com/v3/__http://podman_git.bb__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX=
7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlEvW=
x5jpg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">pod=
man_git.bb</a><br>
                      @@ -78,19 +78,11 @@ do_compile() {<br>
                      <br>
                      &nbsp; &nbsp; &nbsp; &nbsp; ln -sf &quot;../../../i=
mport/vendor/<a href=3D"https://urldefense.com/v3/__http://github.com/var=
link/__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0X=
iTm13VgNNrgIStZbv67szL79VQNGLHh_zXlEGGsslOg$" rel=3D"noreferrer" target=3D=
"_blank" moz-do-not-send=3D"true">github.com/varlink/</a>&quot;
                      &quot;.gopath/src/<a href=3D"https://urldefense.com=
/v3/__http://github.com/varlink__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6=
MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlHyXW604g$" r=
el=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">github.com/v=
arlink</a>&quot;<br>
                      <br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export GOARCH=3D&quot;$=
{BUILD_GOARCH}&quot;<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export GOPATH=3D&quot;$=
{S}/src/.gopath&quot;<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export
                      GOROOT=3D&quot;${STAGING_DIR_NATIVE}/${nonarch_libd=
ir}/${HOST_SYS}/go&quot;<br>
                      <br>
                      &nbsp; &nbsp; &nbsp; &nbsp; cd ${S}/src/.gopath/src=
/&quot;${PODMAN_PKG}&quot;<br>
                      <br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;# Pass the needed cflag=
s/ldflags so that
                      cgo<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;# can find the needed h=
eaders files and
                      libraries<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export GOARCH=3D${TARGE=
T_GOARCH}<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export CGO_ENABLED=3D&q=
uot;1&quot;<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export CGO_CFLAGS=3D&qu=
ot;${CFLAGS}
                      --sysroot=3D${STAGING_DIR_TARGET}&quot;<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export CGO_LDFLAGS=3D&q=
uot;${LDFLAGS}
                      --sysroot=3D${STAGING_DIR_TARGET}&quot;<br>
                      -<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; # podman now builds go-=
md2man and requires
                      the host/build details<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export NATIVE_GOOS=3D${=
BUILD_GOOS}<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export NATIVE_GOARCH=3D=
${BUILD_GOARCH}<br>
                      diff --git a/recipes-containers/runc/<a href=3D"htt=
ps://urldefense.com/v3/__http://runc.inc__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX=
7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlGFM=
wrHwQ$" moz-do-not-send=3D"true">runc.inc</a>
                      b/recipes-containers/runc/<a href=3D"https://urldef=
ense.com/v3/__http://runc.inc__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6Mw=
U8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlGFMwrHwQ$" moz=
-do-not-send=3D"true">runc.inc</a><br>
                      index b834ab14..ebff354f 100644<br>
                      --- a/recipes-containers/runc/<a href=3D"https://ur=
ldefense.com/v3/__http://runc.inc__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3=
Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlGFMwrHwQ$"=
 moz-do-not-send=3D"true">runc.inc</a><br>
                      +++ b/recipes-containers/runc/<a href=3D"https://ur=
ldefense.com/v3/__http://runc.inc__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3=
Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlGFMwrHwQ$"=
 moz-do-not-send=3D"true">runc.inc</a><br>
                      @@ -57,9 +57,6 @@ do_compile() {<br>
                      <br>
                      &nbsp; &nbsp; &nbsp; &nbsp; # Pass the needed cflag=
s/ldflags so that
                      cgo<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; # can find the needed h=
eaders files and
                      libraries<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export CGO_ENABLED=3D&q=
uot;1&quot;<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export CGO_CFLAGS=3D&qu=
ot;${CFLAGS}
                      --sysroot=3D${STAGING_DIR_TARGET}&quot;<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export CGO_LDFLAGS=3D&q=
uot;${LDFLAGS}
                      --sysroot=3D${STAGING_DIR_TARGET}&quot;<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export GO=3D${GO}<br>
                      <br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export CFLAGS=3D&quot;&=
quot;<br>
                      diff --git a/recipes-containers/skopeo/<a href=3D"h=
ttps://urldefense.com/v3/__http://skopeo_git.bb__;!!AjveYdw8EvQ!a7XmcWhdC=
OyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh=
_zXlF9RFAGNA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tr=
ue">skopeo_git.bb</a>
                      b/recipes-containers/skopeo/<a href=3D"https://urld=
efense.com/v3/__http://skopeo_git.bb__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXs=
Za3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlF9RFAGN=
A$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">skopeo_=
git.bb</a><br>
                      index 936d2c3d..1542f2a6 100644<br>
                      --- a/recipes-containers/skopeo/<a href=3D"https://=
urldefense.com/v3/__http://skopeo_git.bb__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX=
7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlF9R=
FAGNA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">sko=
peo_git.bb</a><br>
                      +++ b/recipes-containers/skopeo/<a href=3D"https://=
urldefense.com/v3/__http://skopeo_git.bb__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX=
7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlF9R=
FAGNA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">sko=
peo_git.bb</a><br>
                      @@ -53,11 +53,8 @@ do_compile() {<br>
                      <br>
                      &nbsp; &nbsp; &nbsp; &nbsp; # Pass the needed cflag=
s/ldflags so that
                      cgo<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; # can find the needed h=
eaders files and
                      libraries<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export CGO_ENABLED=3D&q=
uot;1&quot;<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export CFLAGS=3D&quot;&=
quot;<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export LDFLAGS=3D&quot;=
&quot;<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export CGO_CFLAGS=3D&qu=
ot;${TARGET_CFLAGS}&quot;<br>
                      -&nbsp; &nbsp; &nbsp; &nbsp;export CGO_LDFLAGS=3D&q=
uot;${TARGET_LDFLAGS}&quot;<br>
                      <br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export GO111MODULE=3Dof=
f<br>
                      &nbsp; &nbsp; &nbsp; &nbsp; export EXTRA_LDFLAGS=3D=
&quot;-s -w&quot;<br>
                      diff --git a/recipes-containers/umoci/<a href=3D"ht=
tps://urldefense.com/v3/__http://umoci_git.bb__;!!AjveYdw8EvQ!a7XmcWhdCOy=
YHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_z=
XlETIKfTGg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
">umoci_git.bb</a>
                      b/recipes-containers/umoci/<a href=3D"https://urlde=
fense.com/v3/__http://umoci_git.bb__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa=
3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlETIKfTGg$=
" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">umoci_git=
.bb</a><br>
                      index f148b7fa..32868594 100644<br>
                      --- a/recipes-containers/umoci/<a href=3D"https://u=
rldefense.com/v3/__http://umoci_git.bb__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7B=
XsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlETIKf=
TGg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">umoci=
_git.bb</a><br>
                      +++ b/recipes-containers/umoci/<a href=3D"https://u=
rldefense.com/v3/__http://umoci_git.bb__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7B=
XsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNGLHh_zXlETIKf=
TGg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">umoci=
_git.bb</a><br>
                      @@ -62,11 +62,8 @@ do_compile() {<br>
                      <br>
                      &nbsp; &nbsp; &nbsp;# Pass the needed cflags/ldflag=
s so that cgo<br>
                      &nbsp; &nbsp; &nbsp;# can find the needed headers f=
iles and
                      libraries<br>
                      -&nbsp; &nbsp; export CGO_ENABLED=3D&quot;1&quot;<b=
r>
                      &nbsp; &nbsp; &nbsp;export CFLAGS=3D&quot;&quot;<br=
>
                      &nbsp; &nbsp; &nbsp;export LDFLAGS=3D&quot;&quot;<b=
r>
                      -&nbsp; &nbsp; export CGO_CFLAGS=3D&quot;${TARGET_C=
FLAGS}&quot;<br>
                      -&nbsp; &nbsp; export CGO_LDFLAGS=3D&quot;${TARGET_=
LDFLAGS}&quot;<br>
                      <br>
                      &nbsp; &nbsp; &nbsp;export GO111MODULE=3Doff<br>
                      <br>
                      -- <br>
                      2.34.1<br>
                      <br>
                      <br>
                      <br>
                      <br>
                    </blockquote>
                  </div>
                  <div><br clear=3D"all">
                  </div>
                  <div><br>
                  </div>
                  <span class=3D"gmail_signature_prefix">-- </span><br>
                  <div dir=3D"ltr" class=3D"gmail_signature">- Thou shalt
                    not follow the NULL pointer, for chaos and madness
                    await thee at its end<br>
                    - &quot;Use the force Harry&quot; - Gandalf, Star Tre=
k II<br>
                    <br>
                  </div>
                </div>
                <br>
                -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
                Links: You receive all messages sent to this group.<br>
                View/Reply Online (#9563): <a href=3D"https://urldefense.=
com/v3/__https://lists.yoctoproject.org/g/meta-virtualization/message/956=
3__;!!AjveYdw8EvQ!a7XmcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm1=
3VgNNrgIStZbv67szL79VQNGLHh_zXlFV4YXp0Q$" rel=3D"noreferrer" target=3D"_b=
lank" moz-do-not-send=3D"true">
https://lists.yoctoproject.org/g/meta-virtualization/message/9563</a><br>
                Mute This Topic: <a href=3D"https://urldefense.com/v3/__h=
ttps://lists.yoctoproject.org/mt/117668816/1050810__;!!AjveYdw8EvQ!a7XmcW=
hdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79VQNG=
LHh_zXlH2w4MnXg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">
                  https://lists.yoctoproject.org/mt/117668816/1050810</a>=
<br>
                Group Owner: <a href=3D"mailto:meta-virtualization%2Bowne=
r@lists.yoctoproject.org" target=3D"_blank" moz-do-not-send=3D"true">
                  meta-virtualization+owner@lists.yoctoproject.org</a><br=
>
                Unsubscribe: <a href=3D"https://urldefense.com/v3/__https=
://lists.yoctoproject.org/g/meta-virtualization/unsub__;!!AjveYdw8EvQ!a7X=
mcWhdCOyYHFfX7BXsZa3Q6MwU8S4BYPrfgGuWvKwkn4sk-0XiTm13VgNNrgIStZbv67szL79V=
QNGLHh_zXlEXPiyRHg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=
=3D"true">
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
            <div dir=3D"ltr" class=3D"gmail_signature">- Thou shalt not
              follow the NULL pointer, for chaos and madness await thee
              at its end<br>
              - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<b=
r>
              <br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------U6SP0ERvIYayrsHBQt7LKUL6--

