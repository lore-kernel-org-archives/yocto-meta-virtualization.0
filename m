Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F7E5FD88DE
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 02:27:54 +0000 (UTC)
Received: from TYVP286CU001.outbound.protection.outlook.com (TYVP286CU001.outbound.protection.outlook.com [52.101.125.26])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12082.1773196072600944053
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Mar 2026 19:27:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=h+52MQ0r;
 spf=pass (domain: fujitsu.com, ip: 52.101.125.26, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqETU50Wb58D9x/N4V3NB2ONaMz8AFMCm8A2foxvQcx3SNTxX6+XaK133fqYFI1BtviuJwZzcORJvZWXrWipCCo4aO+NJl3VQbxVpIzbko7OubgEK8GpMjvwzUD/OLcxOP2qAJOvXJyEBTttvvftt5002LuuQzj38ho2V6rCCAo9lz3F+6mpIr0jBpNAvS3V3eSsPMB05XtA3RlhSBgUJcEX6xBxXksOqRcaUnowPQEdGxrvWsOUXpMCTRw2YgnhAF3oKhbUdVRKGuEv+9Z+EzD7cxcaRvGACUe39iv0mzE42ZwZgSTuXQV9TP1QLkCXw5YIJSn/9HqI5xDHDjqL6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hT2ecPp1PirZj8i2Tkkwm0TwE3UdixDq+YFzfCBGHQw=;
 b=tk8uUt3N2OnL87HQuK/yALAQgqQKmrBGOarnjaq9bsTR4kJR6kp8iBoQxNmxOlofDwikxPeUwKSwibWKgPJVYPsZg1cCpXThh1IwaVFZGtkhlHM7RY3KTEcJzLqQUXMlNKhi2/H4IpptzOrIly9O/rqoZbcKp/rZ/HnXm79ElwCI6ImEZW+O5D1oWWcNQKZXAxOCHSSfbkJstcmla1+U77NcpFcWs+x5+epes77mBQhq4TLYNE66JhPNG1hVAOY4+P7yDjpjhJ6deKJb5ZmjsoiRavxFYwxpn0R43VnM+KoRm53I1Zh/p1m2lrynOjcweWzaFEypVESB2uqVJY77IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hT2ecPp1PirZj8i2Tkkwm0TwE3UdixDq+YFzfCBGHQw=;
 b=h+52MQ0rWPL2DEWV8stNXI6PtpozOQEe64cJ8B7+2j53awuo5U7xbA0UUzw0NMRhjeX41qk0goqTP053v5osAw0/h/w8tv0pAAjxVZfhxuvnvW4RsjCXvXWiF69ROsx41x0iZxr5A++hAmc4hZZRM+OFaB6ank3ZEvJ7gK59bZ81OxBt19OxrSxfL+j2OaVSj3SA/F/ggvVNFwFJkTz5eE7Pnx6/8dE1WtYmUJhi19xPvx7FFTPa69EPeHMNWNMC5+4+QKEQpDTHGpEbBvcGXAJ3e85Fyl1OH2w+wlG5TL75sXb5bAYSukO4BtDX5f1XoarWQEEsemFNRNwU1SejTw==
Received: from OS7PR01MB14444.jpnprd01.prod.outlook.com (2603:1096:604:386::5)
 by OS9PR01MB16471.jpnprd01.prod.outlook.com (2603:1096:604:406::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 02:27:47 +0000
Received: from OS7PR01MB14444.jpnprd01.prod.outlook.com
 ([fe80::749f:a1f1:c336:5d97]) by OS7PR01MB14444.jpnprd01.prod.outlook.com
 ([fe80::749f:a1f1:c336:5d97%6]) with mapi id 15.20.9678.024; Wed, 11 Mar 2026
 02:27:47 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization][PATCH] podman: Use packageconfig to control
 fuse-overlayfs depend
Thread-Topic: [meta-virtualization][PATCH] podman: Use packageconfig to
 control fuse-overlayfs depend
Thread-Index: AQHcsN7t//4xGDUXiE+7+iXDFFMuELWokuXn
Date: Wed, 11 Mar 2026 02:27:47 +0000
Message-ID: 
 <OS7PR01MB14444B72C738C844083F7E8D79B47A@OS7PR01MB14444.jpnprd01.prod.outlook.com>
References: <20260310072754.663-1-liuyd.fnst@fujitsu.com>
 <abCd4oJCXiiacC_P@gmail.com>
In-Reply-To: <abCd4oJCXiiacC_P@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-03-11T02:27:46.830Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB14444:EE_|OS9PR01MB16471:EE_
x-ms-office365-filtering-correlation-id: 1477559d-d824-4110-fbf3-08de7f15c901
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|4022899009|1800799024|376014|38070700021|13003099007|18002099003|56012099003|22082099003|7053199007|1580799027|8096899003;
x-microsoft-antispam-message-info: 
 jOyQNjCzSTImq1Px76OUH1XjDFkGSF8qYfC2om6jlfLNy6xrcaK+khSyR358MzJ4g6arFgIneNCXU+XMtlXElG1DxJdwmMOHJsSWJoAEkVkzFeAiR1qe3JyoinFzD834o2FlFTeP+BDODR3znI+EXa/KF5F4eIUE9VMOXB4yGzghLdBH15g3VX7sUqQDA0hH5uHC3ljrWLbdsY8AG6BS/kgkhxWgXuFaCq0Pzk3FmiGW7gP9/+ZWK+58D/gRJFIpk0x6ayARUsUuuTLOTAbPVZUVDPBocRD2JzNfyD7Sxopzq0XMxSTQpX9R7yCva61/wFe2/PVOGLpinYcEhwm5bOaEYgikbLVg/DZ3HsmdRyeLW4bD4jUKzFklCxAhs5b22QkCbXJHhA3ReWM0mJmjmRyTr4qKtLohdZ/8YE/UXTqK5RvFoK0BXPCyMH7+RL2/aqTiXUBAn6gsTLn9Wy+JELJv2vEX70KRnYELHwpRNp0sA/vzsBiOnziWmBcjAg6jHgklzHJ66JIr/VMKMGKHBZIyvAbbefuGHWJF2cH+ADoeBxlt7elgrU++i4SZeR9Hkx4U0xpMsabvbxxYsmT9z0twv5niJktKO1t8mxzS8fQ2Tg4VpLNk4JkQTddE0sQnPSR7r/FcRxhPd6Wmx0Hor2IbrEQYzbyR2dpDe9UpAmSRfWA2Eak1jeDFjTh/NrFnxlp9iY6wFTkUvXBVGq1fvnou/p6Gc5lAQLa3yKNjUFqi2+UJsyZATh0U+a+gIt1fcGNr595TWYPcX01MRVisAg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB14444.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(1800799024)(376014)(38070700021)(13003099007)(18002099003)(56012099003)(22082099003)(7053199007)(1580799027)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?bzIzWTQ0VElneUg3V3dsNDFFZDE3OEYxOGdRbWpNOFlpTm9MRWdpNU82bFk2?=
 =?gb2312?B?dHVmL1JtMkdZU2t5TWZUM0RNVml1T0pEb2pMQXVDZmhwUEdQMXljSG9sMGs4?=
 =?gb2312?B?d1RGQWROQWc0V210YVJ5SEFUT2JEOG12U3hHY0JObnVYMGFibmpuTGxTVEc0?=
 =?gb2312?B?KzUzUVZEZG1tTjVBcXg1QTRJMHBBblc4dFRDSER6dTFqaW5OMjl2RDBoSHpZ?=
 =?gb2312?B?Q1JPcU9jTnB0QkpBUjVqYW9sNnB0b0xKekhwZ2pYNnhmM1VTRlFVYUpadUhC?=
 =?gb2312?B?Qlp3OHpXL3AzQ3hLcDhkNTdhMXFFOVltQTNZZVVhR040a28raFgyK3RWSTRz?=
 =?gb2312?B?MHhrZkFxd1A5ZWtoamZZSkdiYXRNd2UxUVlzZDZMQ3hRaE50UnZBck5GWlFr?=
 =?gb2312?B?eDh5dkhMMUxUSjRCSUNENU8yWDlncXNzVzBramxwOTdSOVJCRWl2RitwcWNE?=
 =?gb2312?B?Z0tTdEdpZzA1OWM0ak1KNFErQ2g2b2hmZlBXMS8vSHV5MHhVcWtpbGplODQz?=
 =?gb2312?B?OS83cjBNRXExdEFuSllhVUtxdk5BblJVZ1NKV2xDZXg5c20yZElNaDZKOXVT?=
 =?gb2312?B?RU12cTliS21RekpvNy84V0dVRFhIQTkydG5qL05pWGhrczhxRHo3VUUxNVpu?=
 =?gb2312?B?Q1Ivc0szVEE1anVnQmpnMk5YVWtsZWZXOWZwRHpVTmdPK0pVa1A1bm1uUlZK?=
 =?gb2312?B?Y2JWV0VlclFEUndZMkhxWTZCbm45RklyQ2E4bkNtMGtOUkVPeFEyZGFHWDRM?=
 =?gb2312?B?RFhkdlJyYVR3Mm9teHR5OG5zQ3MvT0tmODlHTFkzSzhDUEJOSWZ6d0Jqc1B1?=
 =?gb2312?B?ejRENHJYV3pvcnZBSW8wakdWYjBKZGlqTVk4KzlBNUxydTRjTWFPSHRXaUd3?=
 =?gb2312?B?Z2UrTk5yZEdWMTV2R3ozaGtWcFdUNlU2RmFsUmwrU2lPeGRuaUFQdytaZ3Z3?=
 =?gb2312?B?RlZ1UmdXUE1iZjhJNXdjVERIbXp6a0Z5dHF2SDlRSEZFUHdmYTgvUFR6c1Rm?=
 =?gb2312?B?aHkvbkFLV1VGRTNabnhzWmpPOGdlbklLU1h1eXdNbTh5QmNTdGc4ZmdkelJZ?=
 =?gb2312?B?ZE1IUlA2WjZhcXBLNDNSMjRnKzVNZEtaSitXaVRkS2xOV0lCK0VCRDZPT3ln?=
 =?gb2312?B?NmY2SEdnY3BxbGtUcHRhaXVVZUhBalpEVm9CZS9vcVZnRUVWc01wZ1R4ZHpD?=
 =?gb2312?B?d3liMmR3S0xrNXNXTG1GY3YzVWtXMGJJMlVuV3BxeVVlVHFGQjdIRkY2TWov?=
 =?gb2312?B?NExVMjRjb2dYcS9kRmNJK0FVU1czQ3RaYXpQMkIrb2hQN3pqd2pOT1hWWnlk?=
 =?gb2312?B?SEpibmMvSmhEU1lTSFJqbE9IM3VUN294Y0pvVS9RRkR1bnN5TmwwVUVsOEJK?=
 =?gb2312?B?WGh1dWN6bzZnQWRsR2VaYXNGZHBUd1RvdHNDT0x3OWNtTVFyaCtzcUc5THVF?=
 =?gb2312?B?MkN2RkpNMXhYTGFaQzV6bXdqT0lBNVBpZXlRbG56NFJacldTZ1FWQWFHaGMx?=
 =?gb2312?B?Z1JsYi82SnVLZEx2bFFucHhRcUxIdEtTbEFVdGVTdXJFSStSbXQ5ZE1jS1lC?=
 =?gb2312?B?R1NnVE1tV054Z2hTbnFKOS9UK2xWRUJvRnFBeEVEb1NHdmtYZjU0NEdpNGpq?=
 =?gb2312?B?SEZhS09ZQWVDeWxmUHhkU2JGRS9VeFBKNWl5OEllV1JENSswcm5ZdlRscHhq?=
 =?gb2312?B?WlNqQStkUUtWOWxUUzlPRUJKZ1V2dEpFdFg4REorajJkdFczTVN2UFA1cith?=
 =?gb2312?B?UzVDN0FYWjdRVjNiTzczMVRoaUJXMDNYYzZnTmMrNitiN0dETGFYK2RDb3NQ?=
 =?gb2312?B?dkl2UVE5Z0JBVHFmVVVUSHZVbGRZUjk3YkNoWlBLWG1FWUh2UG9HNDFES0xm?=
 =?gb2312?B?Zk1OTW1JYnhLVTM0blVhaDNxUHc2QUZ3R0pDMEhGWEZzRjhuOHRLeTlVUVlk?=
 =?gb2312?B?SW1pNWJ5L1FzS20zeTFQem5tUnZndUJhZ0wxVFpmU1JkbkxTL0JVQ0VibmFP?=
 =?gb2312?B?Q0kydktZQ04rblptckJHZ0Vvc29iRW5XaUduTGEvbzdseTdja0xzaGtpL2Jh?=
 =?gb2312?B?WnVaOGN6ZlQ4VUhDUnNEWmI0K2dXNUhVUzY5d0svVW1tNkdVTC9tYzh1MFBC?=
 =?gb2312?B?SEVrZ2Z0b1VMbFIyQTFqakxaeVRnTnNrQ2ZYT2FXUVo1cTZleElKLzhQMVgx?=
 =?gb2312?B?bWdWSUkxbDliZ05veHJKSW1Nd1dRSms1bTc3ZTE5RVdjRGxpVExsV2U1RXNs?=
 =?gb2312?B?bThGbHNxTHNlUlA4anV0cVFaOXp1OURhUy9BL2hIK0VwN2dRSHpmT0NSMHpz?=
 =?gb2312?B?ZHRJSnA4dGp2VjhuRll6Mks5eWd5RFU3cHJIMmtCMGVVNnBrTkJidz09?=
Content-Type: multipart/alternative;
	boundary="_000_OS7PR01MB14444B72C738C844083F7E8D79B47AOS7PR01MB14444jp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	KLhe9KwCmCfOOMv/ePU906yFCf6ZtMkrvdNZAndOP4jDz8hzS90N65iFCwzr/P8ZPAeG+kPjJNAG1ZpS7jyVGdQliTAMqqk2TCTwi6djqzt1lZuQBMzN9bniL+q21gPiBPI/QCITAbCoYPppVIcJoW5ZtPTCRI5YVXkjYqe/hkXFincbFTfFaK6chfAcvWwWBXb0FgrKAv3bw28Kxmaqyz9LRGmi6/r7JAJ/f4fgykxprtv7q5UzZeOwRzSOYIzAJ9aKdQm1xHSnZkEpSr+Lsrl6lpGJB6/Ed+5f1eonQXlgFc4RP8GLxMCR2Vbkegov6pGIBk0HJC6XagYtq95/sw==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB14444.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1477559d-d824-4110-fbf3-08de7f15c901
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 02:27:47.6238
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HdKkRbu3DxU2QZZClGUjeHmOVTmTkiGy2ysgKI4cxO7nsVclZq+SR5kIfLDVB9B6IsG+xrGcAKWD6TP/h1H9eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16471
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Mar 2026 02:27:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9640

--_000_OS7PR01MB14444B72C738C844083F7E8D79B47AOS7PR01MB14444jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgQnJ1Y2UNCg0KICAgICBEbyB5b3UgbWVhbiBhIG5ldyBwYXRjaCBsaWtlIHRoaXM6DQogICAg
ICAgICAgICAgLS0tIGEvcmVjaXBlcy1jb250YWluZXJzL3BvZG1hbi9wb2RtYW5fZ2l0LmJiDQor
KysgYi9yZWNpcGVzLWNvbnRhaW5lcnMvcG9kbWFuL3BvZG1hbl9naXQuYmINCkBAIC02OCw3ICs2
OCw3IEBAIEVYVFJBX09FTUFLRSA9ICIgXA0KIFBPRE1BTl9GRUFUVVJFUyA/PSAiZG9ja2VyIg0K
DQogUEFDS0FHRUNPTkZJRyA/PSAiIg0KLVBBQ0tBR0VDT05GSUdbcm9vdGxlc3NdID0gIiwsLGZ1
c2Utb3ZlcmxheWZzIHNsaXJwNG5ldG5zLCwiDQorUEFDS0FHRUNPTkZJR1tyb290bGVzc10gPSAi
LCwsc2xpcnA0bmV0bnMsLCINCg0KIGRvX2NvbXBpbGUoKSB7DQogICAgICAgIGNkICR7U30vc3Jj
DQpAQCAtMTQyLDkgKzE0MiwxNiBAQCBWSVJUVUFMLVJVTlRJTUVfYmFzZS11dGlscy1uc2VudGVy
ID89ICJ1dGlsLWxpbnV4LW5zZW50ZXIiDQoNCiBDT01QQVRJQkxFX0hPU1QgPSAiXig/IW1pcHMp
LioiDQoNCitkZWYgZ2V0X2Z1c2Vfb3ZlcmxheWZzX2RlcChkKToNCisgICAgaWYgYmIudXRpbHMu
Y29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLCAncm9vdGxlc3MnLCBUcnVlLCBGYWxzZSwgZCkgYW5k
IFwNCisgICAgICAgYmIudXRpbHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLCAnZnVzZScsIFRy
dWUsIEZhbHNlLCBkKToNCisgICAgICAgIHJldHVybiAiZnVzZS1vdmVybGF5ZnMiDQorICAgIHJl
dHVybiAiIg0KKw0KIFJERVBFTkRTOiR7UE59ICs9ICJcDQogICAgICAgIGNhdGF0b25pdCBjb25t
b24gJHtWSVJUVUFMLVJVTlRJTUVfY29udGFpbmVyX3J1bnRpbWV9IGdwZ21lIGlwdGFibGVzIGxp
YmRldm1hcHBlciBcDQogICAgICAgICR7VklSVFVBTC1SVU5USU1FX2NvbnRhaW5lcl9kbnN9ICR7
VklSVFVBTC1SVU5USU1FX2NvbnRhaW5lcl9uZXR3b3JraW5nfSAke1ZJUlRVQUwtUlVOVElNRV9i
YXNlLXV0aWxzLW5zZW50ZXJ9IFwNCisgICAgICAgJHtAZ2V0X2Z1c2Vfb3ZlcmxheWZzX2RlcChk
KX0gXA0KICINCiBSUkVDT01NRU5EUzoke1BOfSArPSAic2xpcnA0bmV0bnMNCg0KT3IgZG8geW91
IGhhdmUgYSBtb3JlIGVsZWdhbnQgY29kZT8NCg0KTGl1DQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXw0Kt6K8/sjLOiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAZ21haWwu
Y29tPg0Kt6LLzcqxvOQ6IDIwMjbE6jPUwjExyNUgMDY6NDANCsrVvP7IyzogTGl1LCBZaWRpbmcv
wfUg0tK2oSA8bGl1eWQuZm5zdEBmdWppdHN1LmNvbT4NCrOty806IG1ldGEtdmlydHVhbGl6YXRp
b25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8bWV0YS12aXJ0dWFsaXphdGlvbkBsaXN0cy55b2N0
b3Byb2plY3Qub3JnPg0K1vfM4jogUmU6IFttZXRhLXZpcnR1YWxpemF0aW9uXVtQQVRDSF0gcG9k
bWFuOiBVc2UgcGFja2FnZWNvbmZpZyB0byBjb250cm9sIGZ1c2Utb3ZlcmxheWZzIGRlcGVuZA0K
DQpJbiBtZXNzYWdlOiBbbWV0YS12aXJ0dWFsaXphdGlvbl1bUEFUQ0hdIHBvZG1hbjogVXNlIHBh
Y2thZ2Vjb25maWcgdG8gY29udHJvbCBmdXNlLW92ZXJsYXlmcyBkZXBlbmQNCm9uIDEwLzAzLzIw
MjYgWWlkaW5nIExpdSAoRnVqaXRzdSkgdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgd3JvdGU6
DQoNCj4gVGhlIFJERVBFTkQgZnVzZS1vdmVybGF5ZnMgaXMgYW4gT3B0aW9uYWwgcGFja2FnZSBz
byB1c2UgcGFja2FnZWNvbmZpZyB0byBjb250cm9sIGl0Lg0KPg0KPiBSZWZlciB0byBodHRwczov
L3BvZG1hbi5pby9kb2NzL2luc3RhbGxhdGlvbg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBMaXUgWWlk
aW5nIDxsaXV5ZC5mbnN0QGZ1aml0c3UuY29tPg0KPiAtLS0NCj4gIHJlY2lwZXMtY29udGFpbmVy
cy9wb2RtYW4vcG9kbWFuX2dpdC5iYiB8IDMgKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9yZWNpcGVzLWNvbnRh
aW5lcnMvcG9kbWFuL3BvZG1hbl9naXQuYmIgYi9yZWNpcGVzLWNvbnRhaW5lcnMvcG9kbWFuL3Bv
ZG1hbl9naXQuYmINCj4gaW5kZXggNTNiOWI2YTAuLjQ0OTVkMmQ5IDEwMDY0NA0KPiAtLS0gYS9y
ZWNpcGVzLWNvbnRhaW5lcnMvcG9kbWFuL3BvZG1hbl9naXQuYmINCj4gKysrIGIvcmVjaXBlcy1j
b250YWluZXJzL3BvZG1hbi9wb2RtYW5fZ2l0LmJiDQo+IEBAIC02OCw3ICs2OCw4IEBAIEVYVFJB
X09FTUFLRSA9ICIgXA0KPiAgUE9ETUFOX0ZFQVRVUkVTID89ICJkb2NrZXIiDQo+DQo+ICBQQUNL
QUdFQ09ORklHID89ICIiDQo+IC1QQUNLQUdFQ09ORklHW3Jvb3RsZXNzXSA9ICIsLCxmdXNlLW92
ZXJsYXlmcyBzbGlycDRuZXRucywsIg0KPiArUEFDS0FHRUNPTkZJR1tyb290bGVzc10gPSAiLCws
c2xpcnA0bmV0bnMsLCINCj4gK1BBQ0tBR0VDT05GSUdbZnVzZV0gPSAiLCwsZnVzZS1vdmVybGF5
ZnMsLCINCg0KV2hldGhlciByaWdodCBvciB3cm9uZywgZnVzZS1vdmVybGF5ZnMgd2FzIGJlaW5n
IHB1bGxlZCBpbg0KYnkgcm9vdGxlc3MuDQoNClNvIGl0IHNob3VsZCBzdGF5IHB1bGxlZCBpbiBi
eSByb290bGVzcyAodW5sZXNzIHlvdSBjYW4gc2hvdw0KbWUgdGhhdCB0aGVyZSdzIG5vIHJlcXVp
cmVtZW50IGF0IGFsbCBmcm9tIHJvb3RsZXNzIC4uIGFuZA0KdGhhdCBpbmZvcm1hdGlvbiBuZWVk
cyB0byBiZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UpLg0KDQpJdCBjYW4gYWxzbyBqdXN0IHN0YXkg
aW4gYm90aCwgc2luY2UgbGFzdCBJIGNoZWNrZWQsIGhhdmluZw0KdGhlIGRlcGRlbmRlbmN5IGlu
IHR3aWNlIGRvZXNuJ3QgY2F1c2UgYW55IGlzc3Vlcy4NCg0KQnJ1Y2UNCg0KPg0KPiAgZG9fY29t
cGlsZSgpIHsNCj4gICAgICAgIGNkICR7U30vc3JjDQo+IC0tDQo+IDIuNDMuMA0KPg0KDQo+DQo+
IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2Fn
ZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzk2MzEpOiBodHRw
czovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9tZXRhLXZpcnR1YWxpemF0aW9uL21lc3NhZ2Uv
OTYzMQ0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9t
dC8xMTgyMzcxNDEvMTA1MDgxMA0KPiBHcm91cCBPd25lcjogbWV0YS12aXJ0dWFsaXphdGlvbitv
d25lckBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3Rz
LnlvY3RvcHJvamVjdC5vcmcvZy9tZXRhLXZpcnR1YWxpemF0aW9uL3Vuc3ViIFticnVjZS5hc2hm
aWVsZEBnbWFpbC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+DQoNCg==

--_000_OS7PR01MB14444B72C738C844083F7E8D79B47AOS7PR01MB14444jp_
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
Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0);" class=3D"elementToPro=
of">
<span style=3D"font-size: 12pt;">Hi </span><span style=3D"font-size: 11pt;"=
>Bruce</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp;Do you mean a new patch like this:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;--- a/recipes-containers/po=
dman/podman_git.bb</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
+++ b/recipes-containers/podman/podman_git.bb</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
@@ -68,7 +68,7 @@ EXTRA_OEMAKE =3D &quot; \</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp;PODMAN_FEATURES ?=3D &quot;docker&quot;</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp;PACKAGECONFIG ?=3D &quot;&quot;</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
-PACKAGECONFIG[rootless] =3D &quot;,,,fuse-overlayfs slirp4netns,,&quot;</d=
iv>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
+PACKAGECONFIG[rootless] =3D &quot;,,,slirp4netns,,&quot;</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp;do_compile() {</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; cd ${S}/src</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
@@ -142,9 +142,16 @@ VIRTUAL-RUNTIME_base-utils-nsenter ?=3D &quot;util-lin=
ux-nsenter&quot;</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp;COMPATIBLE_HOST =3D &quot;^(?!mips).*&quot;</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
+def get_fuse_overlayfs_dep(d):</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp;if bb.utils.contains('PACKAGECONFIG', 'rootless', True, Fals=
e, d) and \</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; bb.utils.contains('PACKAGECONFIG', 'fuse', True, Fal=
se, d):</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; &nbsp;return &quot;fuse-overlayfs&quot;</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp;return &quot;&quot;</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
+</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp;RDEPENDS:${PN} +=3D &quot;\</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; catatonit conmon ${VIRTUAL-RUNTIME_container_ru=
ntime} gpgme iptables libdevmapper \</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; &nbsp; ${VIRTUAL-RUNTIME_container_dns} ${VIRTUAL-RUNT=
IME_container_networking} ${VIRTUAL-RUNTIME_base-utils-nsenter} \</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
+ &nbsp; &nbsp; &nbsp; ${@get_fuse_overlayfs_dep(d)} \</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp;&quot;</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);">
&nbsp;RRECOMMENDS:${PN} +=3D &quot;slirp4netns&nbsp;</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);">
<br>
</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
Or do you have a more elegant code?</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);">
<br>
</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
Liu</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> Bruce A=
shfield &lt;bruce.ashfield@gmail.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2026=C4=EA3=D4=C211=C8=D5 06:40<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Liu, Yiding/=C1=F5 =D2=D2=B6=A1 &lt;liuyd.fnst@f=
ujitsu.com&gt;<br>
<b>=B3=AD=CB=CD:</b> meta-virtualization@lists.yoctoproject.org &lt;meta-vi=
rtualization@lists.yoctoproject.org&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: [meta-virtualization][PATCH] podman: Use packageco=
nfig to control fuse-overlayfs depend</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">In message: [meta-virtualization][PATCH] podman: U=
se packageconfig to control fuse-overlayfs depend<br>
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
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#9631): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/9631">
https://lists.yoctoproject.org/g/meta-virtualization/message/9631</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/11823714=
1/1050810">
https://lists.yoctoproject.org/mt/118237141/1050810</a><br>
&gt; Group Owner: meta-virtualization+owner@lists.yoctoproject.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub">
https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [bruce.ashfi=
eld@gmail.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_OS7PR01MB14444B72C738C844083F7E8D79B47AOS7PR01MB14444jp_--

