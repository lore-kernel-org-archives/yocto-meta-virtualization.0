Return-Path: <k.kurematsu@nskint.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49026C71130
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 00:37:20 +0000 (UTC)
Received: from TYVP286CU001.outbound.protection.outlook.com (TYVP286CU001.outbound.protection.outlook.com [52.101.125.116])
 by mx.groups.io with SMTP id smtpd.web11.7797.1751935031405066009
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 07 Jul 2025 17:37:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nskint.onmicrosoft.com header.s=selector1-nskint-onmicrosoft-com header.b=SiFiK+dq;
 spf=pass (domain: nskint.co.jp, ip: 52.101.125.116, mailfrom: k.kurematsu@nskint.co.jp)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lJKX4k1ybnxFMw23r+2S3mstMyi/IHi9eneBXw4lB0VugmblXkREd1BC2vlP8gKFKAaaMAy9RtTk4wSMHWFhKg0agShek+nufJnONbh8yrgIKv01KlPUSdBrGtiW/QnnhT/UaDtetn1Of3AFkr7Bdu4OXFebvkKc40s+OOJG5eEZDSSQbP74iVw1B+MCWB4MbWFjDaN3Gi4KCe3NLhxx/RhcpWwMD0FkXDGfmegP7N+yqDG2wXW5DaSP154rXWCYJzZrRFV656oAMF/ZoI4x2RSqMqIR7L+k/gZc4/E8GVra3MZSlpXWGhfFAon5YHPUhza7hv4nJ88WLmyHhpYdWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gieUgiKqWAg+YphU0EGrX886WcJmuAa1BpD5CYmRmxA=;
 b=KO83tk+DBU9tLPKfVAu00OF0PxXzrAZhn089M9DAfzMOOD7mX9IRfyOXUCfn48tHlaTUsVCR7JRyiRxCjRpJ4IXUsJnF7w8J3V6yG7tZo8IyTP7UrVq1JY2JPvD0qQ3eiSQXaRxveJSJkoH/ouoNQMPjFLDHAjmbRlREg7k21Rz8QaRJxOaOLNsIuBmdCHn2qKRQhnm5SKvPPlnaJZ29o3uhxXjJtPww4Mbk397W785hIo+2NXnMxgNXflDCoSJhSEOopI6U49kWhG8ZIxISeC2awcmfVgNXtnvHH148b7XEHg4rSZ7oKsZ5hM6G04KrypHc4KFd/S+xaNj1kMlfGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nskint.co.jp; dmarc=pass action=none header.from=nskint.co.jp;
 dkim=pass header.d=nskint.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nskint.onmicrosoft.com; s=selector1-nskint-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gieUgiKqWAg+YphU0EGrX886WcJmuAa1BpD5CYmRmxA=;
 b=SiFiK+dqw4KfJ4vMGQZbBFAJxPlRWU7i/wpn+grYBYEzwCHhtV7TL+swLgDQ/wqgy1gKMfaMm0I3mbDbNAshTGC+QagKMoBVnjx5DMNNTnf8z3/2GPoufG3WceLtdbunaT6Er/Fn1myRzXTfN/PZAOW9DzTi2MTU1p6RVk57+/g=
Received: from TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:2ef::11)
 by TYWP286MB3547.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:392::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.20; Tue, 8 Jul
 2025 00:37:02 +0000
Received: from TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM
 ([fe80::497b:8736:584c:bfb1]) by TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM
 ([fe80::497b:8736:584c:bfb1%6]) with mapi id 15.20.8922.017; Tue, 8 Jul 2025
 00:37:02 +0000
From: Ken Kurematsu <k.kurematsu@nskint.co.jp>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, Masahiro Mizutani
	<m.mizutani@nskint.co.jp>, Yoshitaka Ikeda <ikeda@nskint.co.jp>, Ken
 Kurematsu <k.kurematsu@nskint.co.jp>
Subject: RE: [master-next][PATCH] containerd: fix remote branch
Thread-Topic: [master-next][PATCH] containerd: fix remote branch
Thread-Index: AdvsmqJ9HPtoSseBTz2j9pEMWcf1+QCu0wCAABKMtFA=
Date: Tue, 8 Jul 2025 00:37:02 +0000
Message-ID: 
 <TYRP286MB5995BA22F99F1CF0DB4013DCDB4EA@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM>
References: 
 <TYRP286MB599506783F107D6DA11D2F1FDB42A@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM>
 <CADkTA4OA2L+=XaC1=-78oDO=t50SR=KHbH_sHF9GXGAdqF_suw@mail.gmail.com>
In-Reply-To: 
 <CADkTA4OA2L+=XaC1=-78oDO=t50SR=KHbH_sHF9GXGAdqF_suw@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nskint.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRP286MB5995:EE_|TYWP286MB3547:EE_
x-ms-office365-filtering-correlation-id: f4c5206e-ada4-4fab-dbe8-08ddbdb78e79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?VnJRRVBvK2U3YVpuUTlaSW5HbUNxMjFOMkI3YTZrMDEwVHN4WlU5VkJZWlZ6?=
 =?utf-8?B?NGdocFk5a3dwNUl1bXF0SngvbTFkU1EzcVhhVTJKRUhtRkI4R2F4NFFySjEz?=
 =?utf-8?B?b0h4amNHRytTRkF3UC93SnpqZmZkVmhEZ1lCMG5KWk0wQmM4R2owQzcyelZ3?=
 =?utf-8?B?WVJTYlRUaVRKb2J5VUx3Y1ZmSEx4ZjdnMGZhYWdMc1pPOEN3b3I3N1U0R2Jr?=
 =?utf-8?B?NmlmWGY4RHZnTDU0aVE3a0ZZMnNqUWI1Q0hVZTBINzZKL2k2TC9naGpodkNX?=
 =?utf-8?B?L3ZkWjZxeVRQL2dhaXJPZUoxRW9ZWHBHdS9iSkdONE9wcC96QzdSbldiMjFj?=
 =?utf-8?B?V0xDNktlUjM2eFBLSUx1cGJ0SnhjellzUFZHTk9wL0tISFB6RmRvZlY2Zm5w?=
 =?utf-8?B?b3hBTDZ4SlFiUmNjVDYveUcxTTFnMnNadTVJUHMxUTNJZWdjaXFoejExMlFE?=
 =?utf-8?B?blFvdlFObGRFUUFJN3lLY3BDb2RRbDQzVTNDaTNPWVJrOTRVSjJ5VDZ0UW8x?=
 =?utf-8?B?QXg5WjA5QUgrRnhEN25Jd1FrcTZCcEc0Zkk0VWVmdnZWd2J3Z3ZpTUxnN3RO?=
 =?utf-8?B?a291emFZaFA2MDQzZnZCNDhLOW9Ea0Z0clNIV2sveXhEc25sY212Y3lZcDVV?=
 =?utf-8?B?Wk5HYkNXT2xyUDkrWTQ2MDhZVUljcHo1OVU3cXdEdHUwb2NteSsrMy9Rbnh5?=
 =?utf-8?B?bnozaVFrZ1RPY0JMMVRpVDZEejQrazJsTWtzWU00MUNDdFJSSzg0WUhKbFZU?=
 =?utf-8?B?bWFCb1c4Q2pVcStBUFNrOGVEd2lGTGNDTU1pNzVCdXpzc1QwbnRBRnRxMDcz?=
 =?utf-8?B?dUVJTmpQYklwUHZPQ2ZtUExoM1psNDlzREp1bzlXOVdVemU0YkpBZGprYTNu?=
 =?utf-8?B?eHBPYWx5V2k4OStBVm8vNGtNV0RBZUxoQXZIS2lFVEJrZktObzdqMXgvdnR5?=
 =?utf-8?B?MFl4SWZoajZRNktCekNLaVFRaEM1U2VpUUNsdGhCL2s2a0NmZ2t1bjY3YWl1?=
 =?utf-8?B?SlZ3eHlhNmkvT1VWWGN5b3h5V1ZwbHgrUTlTQkpsZE9LbnNxYzFhNnFyaGxO?=
 =?utf-8?B?UXk1N2lTZ3R0dDN0b1VqcjZGZUFkN2YvMG9mcC9LaC9Xb0N4UUNoZGo4ZTVC?=
 =?utf-8?B?M0IvaDZrNXl5VHRsdEozVDA3RXB4YWZlWk9vRjJtL2VUWU50REZqSjB6enFV?=
 =?utf-8?B?OXYwejJQYldIaUdVTnNCcHZQVE1DUUY2WkFIejZZOXNTYWNBMVFiZjE3ZFQ0?=
 =?utf-8?B?eFhUOFJaM3llOVhmTFlMK2ZHVlFQU0dVOHhyNW5mc0NEUG0rQ2gwdzNFbytj?=
 =?utf-8?B?amZUbTlyTjMzNWlJaDl0dFljd2g0dkQrRXRPWlhJKzBwOEpYSzZkSVh4dEZM?=
 =?utf-8?B?cncyRnE4a2NWQmVib3hvUDF6UkN6VWZvWGpQZW5RTkxsS2V1L1V0MzFiUTlN?=
 =?utf-8?B?ekZ5RmFJSDhzTnRaaGV1Mjl5YjVtK1drOTNqQlFCREZXeVpWenlYWVJYNEhu?=
 =?utf-8?B?eWVkemoraDFvWGR3Tk56Smx1KytqdjZPN3RWbWJnZkNuYVZUQ2Y2TFB6TnFP?=
 =?utf-8?B?TDd4bEJXYkJGdkYyUUorR0dSTGZwMVZzZmt0ZnM5TVA4bEwwNi9idHJveTU5?=
 =?utf-8?B?MHpJT1N0ZEJzZ0E1YytMOFVNbXQxbzd5ck9OWUZmZkVZMlNCemZHTy83QXR5?=
 =?utf-8?B?Qk9BT2x0eTNOYTJ5NkRGMWFrdVNVb0R5ZUg0MHFOQWJuWElZbkplR3dDUjB5?=
 =?utf-8?B?U2NKYS95QmNPVXEzQ1k4Y3FUaHRPcllaMWZ6TW16SkROc0JmZWtRbi9FbEw0?=
 =?utf-8?B?TkJjUitVVGpqb3lESTVpQXNuYjF0Tmlqa0FLMjVVa3hSdSszWWhWY0dxYUJr?=
 =?utf-8?B?SExCcVJGTXhSWE5ub2pTUS9CWjJJMEE1dXdXVXNoVTdDV2VBbEJoOEFscmhn?=
 =?utf-8?B?SjNScm9OeTdYaDNLTDBRejg4S20xekxoMm9tc045blk3dGxmVlc0Z1h5RTFX?=
 =?utf-8?B?N0I0dm9DemRRPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WmxmZnJvcSt3MC9XTWlOVXhjTThUemtxRGgvZ2gyL3YvSjBqZERQem16RzJv?=
 =?utf-8?B?ZitRT2t5YkFPTlM1Y3RaZTI3SjN3dFlzNzRLL0JMWWI1bTZLdlkrV2VqTkFL?=
 =?utf-8?B?U1RCSDRGTTAwN1lVUXQ4NndZak9BUnVhaldKWTFhYWQ3NTVjWUc4czc1dUZW?=
 =?utf-8?B?MDQ3Si8xdUVkOFN5MWFsTVd5Q3RaS0lObHJHd2JyaWNzWVNMN0J5L25pbVUy?=
 =?utf-8?B?SWtYSFJUWC9KZ3ZNdThhK2tnNVRrV1pDTmlNR0dNQ1NsditIaUdDWHpMcnIy?=
 =?utf-8?B?QmNvMDJjd3pheFo4Wld5dVFOMmFSeEEwVHBDaWRVUnc3dE1xcDUzdVdiTzVo?=
 =?utf-8?B?ZDNGMFB5MEJqd2N1OWdrckduSnp4RG4wNlBlb0tFWEdFSzArM2g2UnlNY2c1?=
 =?utf-8?B?dlRCQ0tVZzlrTFlYNFZ0NVNIMXR3Q1g1TnNycDgwNXFBbFZsM0lrVkorOUM4?=
 =?utf-8?B?UkRpWGFneDd6SHJKU1ErYmFKa3pqSlNrMW83L0RyTVA1bnFwb2hOT1BsdnFP?=
 =?utf-8?B?andua1pGTkhNVlBjcnJvbVUxNGlSNFlNMDAzWkJRWlZSY1B4TGxSSmwyMGI4?=
 =?utf-8?B?Zy9OT0c5TlYwTEZoaDNwR2J4anBNd2FOMVh6RTdrdzRENlUwYUhsQVZGMHh5?=
 =?utf-8?B?U2dOTXQzN2lIWEJvY0QvTmNva2lYVW1KK1V3RVo2QlphM0N6cHh1MmxyUitz?=
 =?utf-8?B?cHpEbk9FNFBWVmF6d2JsNE1xZmZGRGJ2S043eHlxS2Q3VXdGcmhHRENSWkFL?=
 =?utf-8?B?cW5OcUR1bjRpTWJwYUNlSjdIY0ZNU29OL3lFei83b1JZdHZSS05lNGpnVUlL?=
 =?utf-8?B?eG1xeXlBajZqdTdWV2IvQzZSYk9yaTIvZm43QUlDSWkyblgvMTBneHJBQWNR?=
 =?utf-8?B?akNjRE9OMmdaVjI4YktNN2c5WFYvK04rTGdHMUkwTGJUS3NsM0NLUVBhQnRR?=
 =?utf-8?B?OE1PNC9tbFVpdlp0bXcxOWg5OXRXQStUVjd2YjZCZVdIUTB2dGZWUUtzYldX?=
 =?utf-8?B?UDVOME0rdnpWV3ZiaDcxVFZDNWRua2FtaXZ1RFVtWHNqSjlMajFCTnRkWUZB?=
 =?utf-8?B?N2RYanVDVnpSaDgzTE5zN0hhK0dwSEQxa2ZCb2w0QUJLbVhFak94NmRaUzZv?=
 =?utf-8?B?N3djT1B3SEUxY1J1aGZ6K203YWRLdEVzV1phTjlhbHlmbzJtN0JvYzFPRVNq?=
 =?utf-8?B?NFQwdStBQTFINHdQVEN3aFFRNzg2WnRPM21SM1B1bS9QR3Q3Z3dLUFNNcXFH?=
 =?utf-8?B?TWdlVEl5SkR3Y0diNy9BdUU1ZHhNbVFOTE1ZSGZiQ2o2aFcwWmQyN245RFRI?=
 =?utf-8?B?OEhDNE5GcVlLZnErSmVQa0FQdGpJQllSS2Y1cDFETEhXcHB6L2pCOHhOVVNz?=
 =?utf-8?B?MEVrd3UwREdXUC9VTzM2bXpxaWNjcUlaWlAzbTlJcU1XT3grNTU3dTQ0azMx?=
 =?utf-8?B?VHdIMGt5NUErQzhPUTh4YzBVeUM1VVArVUtGa3dKbmRTd21aQXhyUmRTeFM1?=
 =?utf-8?B?bTlrcmJzSkEyOXRDb0hNVkRHaWlYZFZaK3NyWTBLcjBoRmI2cVJ2VURqQUVv?=
 =?utf-8?B?TkZZTndGd1ltOHgwWitiNDlidDU5K2tOMnVhUnNPeFJBYlVLVFFpbUEyazJz?=
 =?utf-8?B?ekhCSUlQejBPaTczVU8reEc0RVpYSnl4eWU1WG00SmF2dHlFL3l6djJzaE5B?=
 =?utf-8?B?SWJGalRMOUtncWZZYzZVRDZCd2JXM2l6V0Z5TXBmY0F6aXkrR2dCWjdlZHVD?=
 =?utf-8?B?K25yRGtpbmkvN3pXTGMwNmNmakRBeXJFVVBwZEN4bHNWRkpZeHlpR2h4SGZL?=
 =?utf-8?B?aWhYTTF5cmp5WlhqZXdqeWM1T1lHVlV1UW5tMldtMTQ0dmxDMGRWS2trNFpB?=
 =?utf-8?B?UHBoSkRrSEZaY0JNUHdmTCsrNDAzNzNXcjNTTllKWk1QMkpEZ29wR3Jjam52?=
 =?utf-8?B?Tm54UXg0N1VFR2hjRi9LVjE4TUcvbTR3eG1WSjB1ZzF4Y09yRmJyRHQ4dzVk?=
 =?utf-8?B?UTAzczdjQlN2NHBwWlFoWDFzS3IxUEhvUFJNWCttb0l4UEhFV1ppQVp2bzEx?=
 =?utf-8?B?QndzeEt1Tm9iVGlBcWtZUXVmMmFZckhUQktZbFlJelNvL1ZKZTZFU0JuQ1Zh?=
 =?utf-8?Q?6ffTkXtWD7E0tKsGe4/vlyMfp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nskint.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c5206e-ada4-4fab-dbe8-08ddbdb78e79
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2025 00:37:02.3423
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 727455a2-9822-4451-819f-f03e059d1a55
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4O3sIQkYyLWYHLXsJGcgetc+5skgZokMBuEZkb+SU+VHga7/a4NrdwtoLUwQBBxdbjfbbQbMheJqM3cLm5xdVKHdu97WyPPdQwO79gGP7g4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB3547
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Jul 2025 00:37:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9298

QnJ1Y2UNCg0KSSB1c2VkIHRoZSBsYXRlc3QgbWFzdGVyLW5leHQgYW5kIHZlcmlmaWVkIHRoYXQg
dGhlIGJ1aWxkIHBhc3NlcyB3aXRoIG15IGNvbmZpZ3VyYXRpb24uDQpUaGFua3MuDQoNCkJlc3Qg
UmVnYXJkcy4NCktlbiBLdXJlbWF0c3UNCg==

