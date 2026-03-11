Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6CFFD88E7
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 03:21:04 +0000 (UTC)
Received: from TY3P286CU002.outbound.protection.outlook.com (TY3P286CU002.outbound.protection.outlook.com [52.101.229.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12596.1773199262396104303
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Mar 2026 20:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=cKoFNHB3;
 spf=pass (domain: fujitsu.com, ip: 52.101.229.59, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sDG9Zdzjc7m8SV8w851b6bXUi3Gb+/9pC1VPRKz1wkuB0HAvr6HpHS++ExGId4R3w1cgWlgD1CkZLNq9w+PnwQN5+jK92GJr36qhGj1138MQZd/Q8PKGPrCcidMtUwWBsNgGeDo3OhnoZFVo+yS0WZMPber1BIKe6cFYMlKu5Kvt6kRECsQxJRZVX1FFS5Ib1cssQWYqDIXbmQCS/lqFA/c/4+vrSpGQxYY6NG7AIo2V1/f8p//vj7du0X0I+wfxIFF1LjqYkDdv7us/yhad14ulgXE0XneDF1octPCjIp5ZeGcsw/TSAzXllUUZIeDTX7g4iAqBDdJv8a2B3euRFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BamtyMmCauELr2Ea3Eb6DMZEbjDZT/1NOxifc246CgY=;
 b=RJ3U6gGQbIQboOdFHBmad6kRoRGncL/atGNwIBDnWD9ae6m7ulomROu8WWjVt67K1f/qLeCkkIxjBgP/m5vGcseoA0tQUgyo9n+LKvq+XggWwJJ21zIEcqa5+4HQZsR2snRzZ9h4ZlZIVb4daIoT/eFrNLBff4evd/wbTKDLmq7iIFM8yLaYt2rx78B+6JgTSQ42bhLQOIq5acsoqHuf1PhamQWxtxkPFCc/3NtZkgNKGZGjBWHIqtCI5/dfMwhw8FRYlrEIlvx+tCv3DxvdnaFhmpNlJ9exbMyCuZz2Ya+v73HICpNGssYIRe6BPj3Xbc6CuRLsHqaLnn4Buuo+Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BamtyMmCauELr2Ea3Eb6DMZEbjDZT/1NOxifc246CgY=;
 b=cKoFNHB3M2yz5w3BV3V07kJ5NgZ4YDdv/n3XqMl3c54DaIdTST+SUQ3jAIbtYk0j1bOqYwQSXOgCpnOBNeuU2/WeeO3Hx2AqAMp0tOxROAuOQjOvpYRpxB8oX8CE7aWG0+/LpAvZQaSXC8MYOswCCrG24VyytT+cjprDonlK/5S5MA6TQBZVSdsQLV42O0DeMLV/cbO1Xm0zU87ceS/7e17H5+6mbzdkEvtQDiDp4DbF0PNrwAJnIP71KPBH8saopZXNwhoY4pSuMZfMerK3cXCNoEuSL6wuPmh4cBhP+1SovlNU1JUteDcyJFZq4f9+ba1ITCPsR1boyr2U4r5ssg==
Received: from OS7PR01MB14444.jpnprd01.prod.outlook.com (2603:1096:604:386::5)
 by TYRPR01MB12759.jpnprd01.prod.outlook.com (2603:1096:405:1b8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 03:20:53 +0000
Received: from OS7PR01MB14444.jpnprd01.prod.outlook.com
 ([fe80::749f:a1f1:c336:5d97]) by OS7PR01MB14444.jpnprd01.prod.outlook.com
 ([fe80::749f:a1f1:c336:5d97%6]) with mapi id 15.20.9678.024; Wed, 11 Mar 2026
 03:20:58 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization][PATCH] podman: Use packageconfig to control
 fuse-overlayfs depend
Thread-Topic: [meta-virtualization][PATCH] podman: Use packageconfig to
 control fuse-overlayfs depend
Thread-Index: AQHcsN7t//4xGDUXiE+7+iXDFFMuELWokuXngAAU6UQ=
Date: Wed, 11 Mar 2026 03:20:57 +0000
Message-ID: 
 <OS7PR01MB14444AFB4E071A7B18E39989A9B47A@OS7PR01MB14444.jpnprd01.prod.outlook.com>
References: <20260310072754.663-1-liuyd.fnst@fujitsu.com>
 <abCd4oJCXiiacC_P@gmail.com>
 <189BA86F08D2A85A.2412760@lists.yoctoproject.org>
In-Reply-To: <189BA86F08D2A85A.2412760@lists.yoctoproject.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-03-11T03:20:56.966Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB14444:EE_|TYRPR01MB12759:EE_
x-ms-office365-filtering-correlation-id: 96bec31e-fef7-4c8a-8889-08de7f1d36a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|13003099007|56012099003|22082099003|18002099003|7053199007|1580799027|8096899003;
x-microsoft-antispam-message-info: 
 PDmRApQZVaQ0tkwrzi9P2M8XfKFtcilDmbqlFoZBhW6ms2HIQ63C2vyHXT+cbDvkIaKfL6iSsVvyVip3svJQWMtg8IRIUd8tjfNKKNHDsWvj5RV4pMnHR3uKo4SI+Ep7UQqq6fGU4znqVAkjAWQUUTPq11TWKbuws0OzxWh3kva4FhQP7H3KYP4Juxx6b0z7x8tCkP+wgspdBZTH9ksRMkL/1oms903pcRwxhbxza9xqOLkLtAjpgHvuwM1+tzf9vPWZtKjk99cduGfohO11ySCUYS9Nj4ohWEN38kkZNtb1UURn8nQJFBSKJIM8ab/W2zcf9Om5kIkeLPltYmBtsJzGjbTKDrFsOn396yNDrA6zh+Hy+R9MYY0Tf2UOT0blIUfOvm/aD2pIyfmcMmZZ7weOeMv6/Wb1D+75RBxn6GTL1xPWxRND7A4lBtqG0bClJUfSEgyPLB8qklBrbS/xV6kIME9TtiaJFsWkfq4EWP/HxVsnJ/lksd7JEZuaHTyEcYv2jGZVz4/ngCMVKTBxHCJfvF+nerXPL+cMbvCn9NuTQxEFPZ5xb4jjkgMmmkR8zUiYSiZ21jXCZ3r2SxlNqBZA/9A2PGfP1bM1fnf/FYIqDS/hF5j3jhwTx+bsiAQuVTzsQOLWzDJWOTHm2QgDyk+zlSXuD6iqqINhF1btGDoF4oE7lVIkXgKaCLm/WLqCqxu1HDuzJi/NriMCKN0W8Sc3jP4CPcIrbHXagDMoUlSbqxwpy9RVfBTzvKnDaUCULkPOgXJCHBTrePLue/DWfg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB14444.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(13003099007)(56012099003)(22082099003)(18002099003)(7053199007)(1580799027)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?ZFRVdHNaU0JyZUg2Y1FUTWRTdU1PMG96bEMyZnNycXUvZ1Y0a09nektVbjNL?=
 =?gb2312?B?aXpsem9vT0xCYzZnUUhaaU1Xdi95Rmhhdnpucno2V0NFSExxTVNjaWpIR3Rq?=
 =?gb2312?B?dGtnMzJHb0FqOHYvN0wveUxsbklrVGFXMmtVMTJEUVFhZGtHUmYzS1ZIUkNt?=
 =?gb2312?B?WGFrS1R3dHdIZkxWRXovSDV5WWJPUnlHSCtaZHBKWVExdmhOYXYwYjlHM2ZM?=
 =?gb2312?B?VTRRWUtmWWlNRGFGbHF2Smo0dzBCNjF6cFBlWjBRL0JEV1NaRktoRWtldXFI?=
 =?gb2312?B?UVFvVGNWNUxDUHo3eDNGMGZPYTNmMWRZYXFCaEhiN1ZMMDVQSzMxUk03QjYw?=
 =?gb2312?B?L2JtcTJxNE1KN3dPazBObll6aUN0Rm5Iektyc3paMGxkNkF4RDRFdXVSNWNQ?=
 =?gb2312?B?Tk5qZWt0OHZBTGROY2VhYUJ6bHBHdG9KMExHV3RTRTFHcml2bjA2SDBUUUdB?=
 =?gb2312?B?OGExL01jczdrb05yMUtqNkFkRzdQMHRYMHBYcnI1WU0xSVQrRFRjdHZoYk5O?=
 =?gb2312?B?a0ZUYzlPcFk2b1RTWE90RndmdnBUVk9ocldoM2luTnBwbWdRTTN0Q3JDRm9t?=
 =?gb2312?B?R2dheTZ1OXJ6ekc1MkxaY2lQNXFrcytObG1ubXVXZEovbXVsUU9qUjBCUnp2?=
 =?gb2312?B?NU5hYURDUEVuMHRuRzR4V0RXSG03WmlUeDFyRUJxazZYTmhXRFlrc0lyclV1?=
 =?gb2312?B?UUNuNGtnUUJiTWV6SllPOTI4RUkzTnh5WWE2bmFPNTFaVTJneU9ZQUVnV2w2?=
 =?gb2312?B?dXEwWTllVks5WTJEMGZFWm53cm43SUs0V3VGNm5aVGdWVDZvSUIwL2tZV1py?=
 =?gb2312?B?WnQ2ODl2RGVCQ0ZCajBiMWgzTyt2NkVqVU1BUm0vSXg3cU5lT1Q5dVlMMmR6?=
 =?gb2312?B?Q3BrUDk1VHBpbDc1dThYN3RDWlpxbmhHS0x6OHVrV3dMME9tZjI2TWNsQW9N?=
 =?gb2312?B?S0Urd3NUVVhYelBUSXJMNEVxMzgybkorVGNBV3MzdzFhY2FWTnB5MjVtd24x?=
 =?gb2312?B?OCsyWmRwNlpxYWpaOGk4TFlNa0dUaS84RHM5S3Fkc2d1cmx5dThnTEgrWVVB?=
 =?gb2312?B?eGVsVTVtVm0xQVh1N0RPbEMxSVdBRjAxeGM2QVJGLzA0dTRBUUg2THd0eUJW?=
 =?gb2312?B?dVRMNXBMcGN6RGV1WWRYYU9TZ3BIbnM5QWQ1cTNuU3dXalQ4NFZlbmlNNlh4?=
 =?gb2312?B?WjNRV2RZSkVIV2hFQnlZdnVpdGJBOWdaMDFZR0IyRTZQbEVIL1A4YjlQUDJa?=
 =?gb2312?B?Q1VHbEVjSkVraE5Qdk9mTXBiYnM2RHBMd2duTkZpRHUyRm80eW1wOWdOVTRO?=
 =?gb2312?B?M05EZnovVVp0NFJhcmVRakpkY0VXUWp1a3N3elo5R3FmMGdVNHpZYkdaVEpi?=
 =?gb2312?B?R1djMGNMeExKNGhLRHJmWitpOHk4ZWdtRi9xK2tTUTd0azg2OUR4cnlQQ0w4?=
 =?gb2312?B?RElTR252aE91Wkw1Y1ZJd3RzNHpoNlRWZEUxbVd5ODV5c1IrN0JVcjBHeGNh?=
 =?gb2312?B?b1lPYWdZZ0cvamFXTHc4YUd1bkdkcndWeEJmU2Z3bkhXeGdXTllweUcyZEVE?=
 =?gb2312?B?VCt3STM2RXpoT2dGWEEwRWowYnNjZlM0MUZidEl1TTZwaForSVkxN3QvcmJs?=
 =?gb2312?B?UzRYeEo4NGpjWXl6b3lENmd5WUo0V0NmRm5ZK2pLNUpHUzNDNEM5ZHF6UGc4?=
 =?gb2312?B?NWNQQzFkOEtURUJzcXN0ZkllTGtDOFJkZVZ6ZTFpR2phUVJ3em1mckJsTWxu?=
 =?gb2312?B?NTdpTUpVYlF4WnRsMStCU3p1U0ZjejhJMEY0a0xoL01nZnpSclQ0Nndtamhz?=
 =?gb2312?B?YklqU1FjNlloRG83VnExbXQ1N2xkeTl3eGFrUjhuejdjMVZ2bmRyL3JwcGZU?=
 =?gb2312?B?a2p0ZmdQV3J3Z29SRnh1ck5zRVgwZVZ1VG93Ky9sQ3VldlJ5RzlvOW1sVEFp?=
 =?gb2312?B?aXJ1alIrVlR6SDY2Z2pVYzl0UEtNRmZPSTM5RDRrUEp5cmU3aWdKcVljSTVM?=
 =?gb2312?B?eUxoMnpsTi9kNFg0c0lkU3pteUJtNkt3T1pCWlBrTzV5cy9PQnVvZUdEcmtI?=
 =?gb2312?B?VW10RmRMTDZhZzB2aU5UZlNpeTI0NEJXVlVtQ2trMzRKZGJkcGxhQXhCa3BD?=
 =?gb2312?B?c3RBRVZWOVlGckJxa1hIdlZRaDkvUGIrVHRRL1J5dmtFbHY4am9hVlQ4eWV4?=
 =?gb2312?B?dkZKSnRDczRtRlZhbkpKZ0dERlhuN29QM09LSS92ckMzSFV0ampUa3ZRV1RH?=
 =?gb2312?B?KzViRDdVcHg0TU1sRmNBbnBLczlxNkQwenYwNHBHN3NHZXRvcUhveVhtc1Y3?=
 =?gb2312?B?UzM5WlFPdTllaG02NHFlK0dJUllscTVxM0kxR3dzZklGMWhmbnd1QT09?=
Content-Type: multipart/alternative;
	boundary="_000_OS7PR01MB14444AFB4E071A7B18E39989A9B47AOS7PR01MB14444jp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	AKrfNPvLBKtLFV+ZDM0S7NP84B1khKFWVaqwMuXMqLvmFXLY3SG6llfBE+W1ObOsbqFS+IkZlCcwbnsTCXoyLensb6/8LI346/jbYD2zCU4LX0Uiu8sYK0XvaOI4vEiNM7g0lFccA3DNiso2Zea83RWXIJ5f/TvsyXQ77i9fw2TrLfTKNXxJEe1mE24ebceWBJesch3DKBbY4YRhJxfFUQkvIcjb5g/0QSIcptEUW8duso7Oei98brCBYca6MJudq454VjBdsGMlHi7q35lPWo4gxABiDN9wCi7ZojnmzBd+oE1s/ftgIu0M/HbKC9BRdjq+/hjkknJV6wyoen4Fhw==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB14444.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96bec31e-fef7-4c8a-8889-08de7f1d36a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 03:20:57.9876
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S4uX5XHc01MPAxDIOvzQscFN6d0fOYchoYPsagBLm26HgNys4i62Ge7zq2ecEeZSLr5GqjYrkZen/ko9RAp+Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12759
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Mar 2026 03:21:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9643

--_000_OS7PR01MB14444AFB4E071A7B18E39989A9B47AOS7PR01MB14444jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgQnJ1Y2UNCiAgICAgSSBmb3VuZCByb290bGVzcyBvdmVybGF5IGZvciBwb2RtYW46DQogICAg
IGh0dHBzOi8vd3d3LnJlZGhhdC5jb20vZW4vYmxvZy9wb2RtYW4tcm9vdGxlc3Mtb3ZlcmxheQ0K
DQogICAgIEl0IHNlZW1zIHRoYXQgcG9kbWFuIGNhbiB1c2UgbmF0aXZlIG92ZXJsYXkgZmlsZSBz
eXN0ZW0gd2l0aCB0aGUgTGludXgga2VybmVsIHZlcnNpb25zIDUuMTMuDQogICAgIFNvIGZ1c2Ut
b3ZlcmxheWZzIGlzIG5vdCBtYW5kYXRvcnkgUkRFRFBFTiBpbiByb290bGVzcyBhZnRlciBrZXJu
ZWwgNS4xMy4NCg0KICAgICBXaGF0IGRvIHlvdSB0aGluayBhYm91dCBpdC4NCg0KTGl1DQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXw0Kt6K8/sjLOiBtZXRhLXZpcnR1YWxpemF0aW9u
QGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgPG1ldGEtdmlydHVhbGl6YXRpb25AbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZz4gtPqx7SBZaWRpbmcgTGl1IChGdWppdHN1KSB2aWEgbGlzdHMueW9jdG9wcm9q
ZWN0Lm9yZyA8bGl1eWQuZm5zdD1mdWppdHN1LmNvbUBsaXN0cy55b2N0b3Byb2plY3Qub3JnPg0K
t6LLzcqxvOQ6IDIwMjbE6jPUwjExyNUgMTA6MjcNCsrVvP7IyzogQnJ1Y2UgQXNoZmllbGQgPGJy
dWNlLmFzaGZpZWxkQGdtYWlsLmNvbT4NCrOty806IG1ldGEtdmlydHVhbGl6YXRpb25AbGlzdHMu
eW9jdG9wcm9qZWN0Lm9yZyA8bWV0YS12aXJ0dWFsaXphdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qu
b3JnPg0K1vfM4jogUmU6IFttZXRhLXZpcnR1YWxpemF0aW9uXVtQQVRDSF0gcG9kbWFuOiBVc2Ug
cGFja2FnZWNvbmZpZyB0byBjb250cm9sIGZ1c2Utb3ZlcmxheWZzIGRlcGVuZA0KDQpIaSBCcnVj
ZQ0KDQogICAgIERvIHlvdSBtZWFuIGEgbmV3IHBhdGNoIGxpa2UgdGhpczoNCiAgICAgICAgICAg
ICAtLS0gYS9yZWNpcGVzLWNvbnRhaW5lcnMvcG9kbWFuL3BvZG1hbl9naXQuYmINCisrKyBiL3Jl
Y2lwZXMtY29udGFpbmVycy9wb2RtYW4vcG9kbWFuX2dpdC5iYg0KQEAgLTY4LDcgKzY4LDcgQEAg
RVhUUkFfT0VNQUtFID0gIiBcDQogUE9ETUFOX0ZFQVRVUkVTID89ICJkb2NrZXIiDQoNCiBQQUNL
QUdFQ09ORklHID89ICIiDQotUEFDS0FHRUNPTkZJR1tyb290bGVzc10gPSAiLCwsZnVzZS1vdmVy
bGF5ZnMgc2xpcnA0bmV0bnMsLCINCitQQUNLQUdFQ09ORklHW3Jvb3RsZXNzXSA9ICIsLCxzbGly
cDRuZXRucywsIg0KDQogZG9fY29tcGlsZSgpIHsNCiAgICAgICAgY2QgJHtTfS9zcmMNCkBAIC0x
NDIsOSArMTQyLDE2IEBAIFZJUlRVQUwtUlVOVElNRV9iYXNlLXV0aWxzLW5zZW50ZXIgPz0gInV0
aWwtbGludXgtbnNlbnRlciINCg0KIENPTVBBVElCTEVfSE9TVCA9ICJeKD8hbWlwcykuKiINCg0K
K2RlZiBnZXRfZnVzZV9vdmVybGF5ZnNfZGVwKGQpOg0KKyAgICBpZiBiYi51dGlscy5jb250YWlu
cygnUEFDS0FHRUNPTkZJRycsICdyb290bGVzcycsIFRydWUsIEZhbHNlLCBkKSBhbmQgXA0KKyAg
ICAgICBiYi51dGlscy5jb250YWlucygnUEFDS0FHRUNPTkZJRycsICdmdXNlJywgVHJ1ZSwgRmFs
c2UsIGQpOg0KKyAgICAgICAgcmV0dXJuICJmdXNlLW92ZXJsYXlmcyINCisgICAgcmV0dXJuICIi
DQorDQogUkRFUEVORFM6JHtQTn0gKz0gIlwNCiAgICAgICAgY2F0YXRvbml0IGNvbm1vbiAke1ZJ
UlRVQUwtUlVOVElNRV9jb250YWluZXJfcnVudGltZX0gZ3BnbWUgaXB0YWJsZXMgbGliZGV2bWFw
cGVyIFwNCiAgICAgICAgJHtWSVJUVUFMLVJVTlRJTUVfY29udGFpbmVyX2Ruc30gJHtWSVJUVUFM
LVJVTlRJTUVfY29udGFpbmVyX25ldHdvcmtpbmd9ICR7VklSVFVBTC1SVU5USU1FX2Jhc2UtdXRp
bHMtbnNlbnRlcn0gXA0KKyAgICAgICAke0BnZXRfZnVzZV9vdmVybGF5ZnNfZGVwKGQpfSBcDQog
Ig0KIFJSRUNPTU1FTkRTOiR7UE59ICs9ICJzbGlycDRuZXRucw0KDQpPciBkbyB5b3UgaGF2ZSBh
IG1vcmUgZWxlZ2FudCBjb2RlPw0KDQpMaXUNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fDQq3orz+yMs6IEJydWNlIEFzaGZpZWxkIDxicnVjZS5hc2hmaWVsZEBnbWFpbC5jb20+DQq3
osvNyrG85DogMjAyNsTqM9TCMTHI1SAwNjo0MA0KytW8/sjLOiBMaXUsIFlpZGluZy/B9SDS0rah
IDxsaXV5ZC5mbnN0QGZ1aml0c3UuY29tPg0Ks63LzTogbWV0YS12aXJ0dWFsaXphdGlvbkBsaXN0
cy55b2N0b3Byb2plY3Qub3JnIDxtZXRhLXZpcnR1YWxpemF0aW9uQGxpc3RzLnlvY3RvcHJvamVj
dC5vcmc+DQrW98ziOiBSZTogW21ldGEtdmlydHVhbGl6YXRpb25dW1BBVENIXSBwb2RtYW46IFVz
ZSBwYWNrYWdlY29uZmlnIHRvIGNvbnRyb2wgZnVzZS1vdmVybGF5ZnMgZGVwZW5kDQoNCkluIG1l
c3NhZ2U6IFttZXRhLXZpcnR1YWxpemF0aW9uXVtQQVRDSF0gcG9kbWFuOiBVc2UgcGFja2FnZWNv
bmZpZyB0byBjb250cm9sIGZ1c2Utb3ZlcmxheWZzIGRlcGVuZA0Kb24gMTAvMDMvMjAyNiBZaWRp
bmcgTGl1IChGdWppdHN1KSB2aWEgbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyB3cm90ZToNCg0KPiBU
aGUgUkRFUEVORCBmdXNlLW92ZXJsYXlmcyBpcyBhbiBPcHRpb25hbCBwYWNrYWdlIHNvIHVzZSBw
YWNrYWdlY29uZmlnIHRvIGNvbnRyb2wgaXQuDQo+DQo+IFJlZmVyIHRvIGh0dHBzOi8vcG9kbWFu
LmlvL2RvY3MvaW5zdGFsbGF0aW9uDQo+DQo+IFNpZ25lZC1vZmYtYnk6IExpdSBZaWRpbmcgPGxp
dXlkLmZuc3RAZnVqaXRzdS5jb20+DQo+IC0tLQ0KPiAgcmVjaXBlcy1jb250YWluZXJzL3BvZG1h
bi9wb2RtYW5fZ2l0LmJiIHwgMyArKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdpdCBhL3JlY2lwZXMtY29udGFpbmVycy9w
b2RtYW4vcG9kbWFuX2dpdC5iYiBiL3JlY2lwZXMtY29udGFpbmVycy9wb2RtYW4vcG9kbWFuX2dp
dC5iYg0KPiBpbmRleCA1M2I5YjZhMC4uNDQ5NWQyZDkgMTAwNjQ0DQo+IC0tLSBhL3JlY2lwZXMt
Y29udGFpbmVycy9wb2RtYW4vcG9kbWFuX2dpdC5iYg0KPiArKysgYi9yZWNpcGVzLWNvbnRhaW5l
cnMvcG9kbWFuL3BvZG1hbl9naXQuYmINCj4gQEAgLTY4LDcgKzY4LDggQEAgRVhUUkFfT0VNQUtF
ID0gIiBcDQo+ICBQT0RNQU5fRkVBVFVSRVMgPz0gImRvY2tlciINCj4NCj4gIFBBQ0tBR0VDT05G
SUcgPz0gIiINCj4gLVBBQ0tBR0VDT05GSUdbcm9vdGxlc3NdID0gIiwsLGZ1c2Utb3ZlcmxheWZz
IHNsaXJwNG5ldG5zLCwiDQo+ICtQQUNLQUdFQ09ORklHW3Jvb3RsZXNzXSA9ICIsLCxzbGlycDRu
ZXRucywsIg0KPiArUEFDS0FHRUNPTkZJR1tmdXNlXSA9ICIsLCxmdXNlLW92ZXJsYXlmcywsIg0K
DQpXaGV0aGVyIHJpZ2h0IG9yIHdyb25nLCBmdXNlLW92ZXJsYXlmcyB3YXMgYmVpbmcgcHVsbGVk
IGluDQpieSByb290bGVzcy4NCg0KU28gaXQgc2hvdWxkIHN0YXkgcHVsbGVkIGluIGJ5IHJvb3Rs
ZXNzICh1bmxlc3MgeW91IGNhbiBzaG93DQptZSB0aGF0IHRoZXJlJ3Mgbm8gcmVxdWlyZW1lbnQg
YXQgYWxsIGZyb20gcm9vdGxlc3MgLi4gYW5kDQp0aGF0IGluZm9ybWF0aW9uIG5lZWRzIHRvIGJl
IGluIHRoZSBjb21taXQgbWVzc2FnZSkuDQoNCkl0IGNhbiBhbHNvIGp1c3Qgc3RheSBpbiBib3Ro
LCBzaW5jZSBsYXN0IEkgY2hlY2tlZCwgaGF2aW5nDQp0aGUgZGVwZGVuZGVuY3kgaW4gdHdpY2Ug
ZG9lc24ndCBjYXVzZSBhbnkgaXNzdWVzLg0KDQpCcnVjZQ0KDQo+DQo+ICBkb19jb21waWxlKCkg
ew0KPiAgICAgICAgY2QgJHtTfS9zcmMNCj4gLS0NCj4gMi40My4wDQo+DQoNCj4NCj4NCj4NCg0K

--_000_OS7PR01MB14444AFB4E071A7B18E39989A9B47AOS7PR01MB14444jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi Bruce</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0);" class=3D"elementToPro=
of">
<span style=3D"font-size: 12pt;">&nbsp; &nbsp; &nbsp;I found </span><span s=
tyle=3D"font-size: 11pt;">rootless overlay for podman:</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp;<a class=3D"OWAAutoLink" id=3D"OWAba05b060-7e93-44d4-7d=
2e-edce3c0c4244" href=3D"https://www.redhat.com/en/blog/podman-rootless-ove=
rlay">https://www.redhat.com/en/blog/podman-rootless-overlay</a></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp;It seems that podman can use native overlay file system=
 with the Linux kernel versions 5.13.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0);" class=3D"elementToPro=
of">
<span style=3D"font-size: 12pt;">&nbsp; &nbsp; &nbsp;So </span><span style=
=3D"font-size: 11pt;">fuse-overlayfs is not mandatory RDEDPEN in rootless a=
fter kernel
</span><span style=3D"font-size: 12pt;">5.13.</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp;What do you think about it.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Liu</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> meta-vi=
rtualization@lists.yoctoproject.org &lt;meta-virtualization@lists.yoctoproj=
ect.org&gt; =B4=FA=B1=ED Yiding Liu (Fujitsu) via lists.yoctoproject.org
 &lt;liuyd.fnst=3Dfujitsu.com@lists.yoctoproject.org&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2026=C4=EA3=D4=C211=C8=D5 10:27<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Bruce Ashfield &lt;bruce.ashfield@gmail.com&gt;<=
br>
<b>=B3=AD=CB=CD:</b> meta-virtualization@lists.yoctoproject.org &lt;meta-vi=
rtualization@lists.yoctoproject.org&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: [meta-virtualization][PATCH] podman: Use packageco=
nfig to control fuse-overlayfs depend</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; color:rgb(0,0,0)">
<span style=3D"font-size:12pt">Hi </span><span style=3D"font-size:11pt">Bru=
ce</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
&nbsp; &nbsp;</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
&nbsp; &nbsp; &nbsp;Do you mean a new patch like this:</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;--- a/recipes-containers/po=
dman/podman_git.bb</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
+++ b/recipes-containers/podman/podman_git.bb</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
@@ -68,7 +68,7 @@ EXTRA_OEMAKE =3D &quot; \</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
&nbsp;PODMAN_FEATURES ?=3D &quot;docker&quot;</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
&nbsp;PACKAGECONFIG ?=3D &quot;&quot;</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
-PACKAGECONFIG[rootless] =3D &quot;,,,fuse-overlayfs slirp4netns,,&quot;</d=
iv>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
+PACKAGECONFIG[rootless] =3D &quot;,,,slirp4netns,,&quot;</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
&nbsp;do_compile() {</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
&nbsp; &nbsp; &nbsp; &nbsp; cd ${S}/src</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
@@ -142,9 +142,16 @@ VIRTUAL-RUNTIME_base-utils-nsenter ?=3D &quot;util-lin=
ux-nsenter&quot;</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
&nbsp;COMPATIBLE_HOST =3D &quot;^(?!mips).*&quot;</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
+def get_fuse_overlayfs_dep(d):</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
+ &nbsp; &nbsp;if bb.utils.contains('PACKAGECONFIG', 'rootless', True, Fals=
e, d) and \</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
+ &nbsp; &nbsp; &nbsp; bb.utils.contains('PACKAGECONFIG', 'fuse', True, Fal=
se, d):</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
+ &nbsp; &nbsp; &nbsp; &nbsp;return &quot;fuse-overlayfs&quot;</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
+ &nbsp; &nbsp;return &quot;&quot;</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
+</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
&nbsp;RDEPENDS:${PN} +=3D &quot;\</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
&nbsp; &nbsp; &nbsp; &nbsp; catatonit conmon ${VIRTUAL-RUNTIME_container_ru=
ntime} gpgme iptables libdevmapper \</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
&nbsp; &nbsp; &nbsp; &nbsp; ${VIRTUAL-RUNTIME_container_dns} ${VIRTUAL-RUNT=
IME_container_networking} ${VIRTUAL-RUNTIME_base-utils-nsenter} \</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
+ &nbsp; &nbsp; &nbsp; ${@get_fuse_overlayfs_dep(d)} \</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
&nbsp;&quot;</div>
<div style=3D"margin-left:40px; font-family:Aptos,Aptos_EmbeddedFont,Aptos_=
MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0=
)">
&nbsp;RRECOMMENDS:${PN} +=3D &quot;slirp4netns&nbsp;</div>
<div style=3D"margin-left:40px; font-family:Aptos,Aptos_EmbeddedFont,Aptos_=
MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0=
)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
Or do you have a more elegant code?</div>
<div style=3D"margin-left:40px; font-family:Aptos,Aptos_EmbeddedFont,Aptos_=
MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0=
)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
Liu</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>=B7=A2=BC=FE=C8=CB:</b> Bruce=
 Ashfield &lt;bruce.ashfield@gmail.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2026=C4=EA3=D4=C211=C8=D5 06:40<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Liu, Yiding/=C1=F5 =D2=D2=B6=A1 &lt;liuyd.fnst@f=
ujitsu.com&gt;<br>
<b>=B3=AD=CB=CD:</b> meta-virtualization@lists.yoctoproject.org &lt;meta-vi=
rtualization@lists.yoctoproject.org&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: [meta-virtualization][PATCH] podman: Use packageco=
nfig to control fuse-overlayfs depend</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">In message: [meta-virtualization][PATCH] podman:=
 Use packageconfig to control fuse-overlayfs depend<br>
on 10/03/2026 Yiding Liu (Fujitsu) via lists.yoctoproject.org wrote:<br>
<br>
&gt; The RDEPEND fuse-overlayfs is an Optional package so use packageconfig=
 to control it.<br>
&gt; <br>
&gt; Refer to <a href=3D"https://podman.io/docs/installation">https://podma=
n.io/docs/installation</a><br>
&gt; <br>
&gt; Signed-off-by: Liu Yiding &lt;liuyd.fnst@fujitsu.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; recipes-containers/podman/podman_git.bb | 3 ++-<br>
&gt;&nbsp; 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/recipes-containers/podman/podman_git.bb b/recipes-contain=
ers/podman/podman_git.bb<br>
&gt; index 53b9b6a0..4495d2d9 100644<br>
&gt; --- a/recipes-containers/podman/podman_git.bb<br>
&gt; +++ b/recipes-containers/podman/podman_git.bb<br>
&gt; @@ -68,7 +68,8 @@ EXTRA_OEMAKE =3D &quot; \<br>
&gt;&nbsp; PODMAN_FEATURES ?=3D &quot;docker&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; PACKAGECONFIG ?=3D &quot;&quot;<br>
&gt; -PACKAGECONFIG[rootless] =3D &quot;,,,fuse-overlayfs slirp4netns,,&quo=
t;<br>
&gt; +PACKAGECONFIG[rootless] =3D &quot;,,,slirp4netns,,&quot;<br>
&gt; +PACKAGECONFIG[fuse] =3D &quot;,,,fuse-overlayfs,,&quot;<br>
<br>
Whether right or wrong, fuse-overlayfs was being pulled in<br>
by rootless.<br>
<br>
So it should stay pulled in by rootless (unless you can show<br>
me that there's no requirement at all from rootless .. and<br>
that information needs to be in the commit message).<br>
<br>
It can also just stay in both, since last I checked, having<br>
the depdendency in twice doesn't cause any issues.<br>
<br>
Bruce<br>
<br>
&gt;&nbsp; <br>
&gt;&nbsp; do_compile() {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cd ${S}/src<br>
&gt; -- <br>
&gt; 2.43.0<br>
&gt; <br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_OS7PR01MB14444AFB4E071A7B18E39989A9B47AOS7PR01MB14444jp_--

