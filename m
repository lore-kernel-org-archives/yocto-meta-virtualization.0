Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10018C67861
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 03:10:16 +0000 (UTC)
Received: from esa3.fujitsucc.c3s2.iphmx.com (esa3.fujitsucc.c3s2.iphmx.com [68.232.151.212])
 by mx.groups.io with SMTP id smtpd.web10.127272.1712632212058746105
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 08 Apr 2024 20:10:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=WbV95/Fd;
 spf=pass (domain: fujitsu.com, ip: 68.232.151.212, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1712632212; x=1744168212;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=CD4wtjr5ajbSCc2IFm7oKsBbTFnNdn8vxJ6zFeucLNk=;
  b=WbV95/FdoCHJX09+/+8hIqmH0seclV/sh0p9LSSzwIR0z45maM8PVAdg
   m/BieHq8M8aAdQe/665+S3ebOxW2AZo597fr5lDy4PFCpSb0lNwdqPfJE
   gtlDbiD90yeuX2JAh931lDJE3JvasY9sc42ovlYoW/Rc+lb9yLZ72dMCa
   cyy+QWkmQ3cec184GUjJmYZ02X3Wel3v/p4wvNfhJVyuMhpk2VIiGgXvB
   9zUNyMYedHf6SBhjm7McWoId79rYsC7YbqYytxux0YZts2Cg8ygoiYmCD
   2qlkecgqOdVaCfeztJJG2hxaWTKaOhoI/r7NRyrBmi+FAxYGiJs91CjTb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="27468440"
X-IronPort-AV: E=Sophos;i="6.07,188,1708354800"; 
   d="scan'208";a="27468440"
Received: from mail-japaneastazlp17010000.outbound.protection.outlook.com (HELO TYVP286CU001.outbound.protection.outlook.com) ([40.93.73.0])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 12:10:09 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ICCQblOaeHzqnSc8901JHEvPnBaIeQGtALwccuvbETf+CzZ3cHfbZzBWaTbMys1+QkPKkNtjzEYB+zB56HSxxRJbwzK6x+0Tds68XoH0XMSYqUJAN0RpEJ+0/cU5t6HebpfgdmPdc03mvKdQTLjUSODpMqvtAmaXlASIub3B2RXBQ6qvKB0jeIlHZYvepwQ+ZGpH6XA3Qib0TxkSxmJefLoyeTS+T5/rUY8RGvMgpLh/4LQnRt24gEodq2piTP10MaCkobuIIzP3xB8/bz/XhoAJQ1jM3LuE5He/Nu4WGpQ8QulD9CRZiA3CGrmfUq8xqJWBcJjm0ijFDCNP3xfmRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CD4wtjr5ajbSCc2IFm7oKsBbTFnNdn8vxJ6zFeucLNk=;
 b=kCoSdn1Sd0yrzcLoMnJG0WDrGc4SA2fih7bhIuabaOBxomsbyGXDwDtIrw8xGWXJp3tBCqtmm2A3JQgg9cpPnLafLrXzMBRpXahiFF3UXCXlBifMTHzjW66iaIJoXmTFA3BBOvi/v3BvONepfdQG0/4jBHBX7UrDDxD6nPGvnS/NBox2x+cwvgQnya2lNnFCiV2QUW6khzkjIIb6rMM6h5OxSA8oxRNR2hog5658Sw9LW4gtS3zkChFhivbYjCntyarSFiAM6KVTEWsOLo70XfSUwu7ZgvhJi/CH48GiF76R9CuZfEx1g0pnKP9RszZFdQMufonJ6k0kV4BwPWFIBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by TYAPR01MB5579.jpnprd01.prod.outlook.com
 (2603:1096:404:8053::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 9 Apr
 2024 03:10:06 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::71c1:ac8c:e78d:1d03]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::71c1:ac8c:e78d:1d03%6]) with mapi id 15.20.7409.042; Tue, 9 Apr 2024
 03:10:06 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: RE: [meta-virtualization] [meta-cloud-services] [PATCH] layer.conf:
 use scarthgap to LAYERSERIES_COMPAT
Thread-Topic: [meta-virtualization] [meta-cloud-services] [PATCH] layer.conf:
 use scarthgap to LAYERSERIES_COMPAT
Thread-Index: AQHahV1ymtDKcx5zS0WQ1c9/U9DF8bFfS/kg
Date: Tue, 9 Apr 2024 03:10:06 +0000
Message-ID: 
 <TYWPR01MB118611F3072C3E3F8AE6429A8DC072@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <1712103925-28778-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1712103925-28778-1-git-send-email-wangmy@fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ActionId=11665750-46e6-49ba-92aa-b94cfb8e74b5;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ContentBits=0;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Enabled=true;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Method=Privileged;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Name=FUJITSU-PUBLIC?;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SetDate=2024-04-09T03:09:48Z;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|TYAPR01MB5579:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 w6tNI4tismw5rtz3yM8PiWZ98uIcYGUmMGpFzBWAxHq0QZtoNe+xEGNmq9UPbF+7SJcvsEd1ZvKhZXheB0XaD5rCKprWjN5sS6WT+bwpbMD1fef1E91zxvaACJx/V2ZXTMBq5FLpkumy0NLAJyRdNY1wbW2pkYxVhS827KobdMfUUJ0ihQQNhpqVSoP0sE328WGHaDRBC2rwRa7DS1d+ZGdQdQtWs3u22QAzNkDoX2++74y/17bLrccFnRqhGsCH9cTN9k0d31CoRy78Iy2hLIBaXo+pr4wzZEtyS7b3AEhFYOSA2DgF7QpeE58D/j46zzfTdobEw4v31j4Yitjq6U3NoZ6QEuFUVLM/heRKXekdzHuJqfxXl9wThPWgnYdYbmhy3dBiXgb0MOB0kWq3IoY5Ob9dm+ip10Wei4REy/8jbyxtpmCvz/te5v8JkV0wY8PsUSg+hIekIqZxR89UST4UyGkF4FkfSmhGGgw29PO9KvOfPnJaiF4sFG6noQL0C6sYhjfZT+8hWd/rvJvM2Iy49Pf0FNDUP6xE1LNxeIHsYJNX8nVdeyBtsK8SMFnZrMx56seAn0tYi8Jzi0T2vroTrbmLMx5fInhX4FVzMOmrWVYc3rB6/5MOJx+OuxWjJZnAObY8AgalPNmJj7sKBlGGuJM2oI7FGRyLkRKZ1pt2C2Coi6CoETvFHuQ3IJYGoKTBQozzsZ3qCxUb5IZDuQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(1580799018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?VkJCNjZ0OVVnRFJrM2RRZGl6cmh1aHVldXBaSm4ya1VPQ2Z0akluTG9ad3R0?=
 =?gb2312?B?TktyaW1UY0RUV0dGK2lGRVJpS2F1eEFNQWZQbCtNc2ZTRUpzL2lEdlRCRFlQ?=
 =?gb2312?B?a2dRb240dWViZy93Mnp6UW1ocFhKSUhwV2thbytTNTJEQ0V2Y3I2UHhmMTVk?=
 =?gb2312?B?L3k1bDkvV05rSGxNNVFjNnJBNm9xNmNldUQzY1dvWWdqRStheW1sQ1pVQzhi?=
 =?gb2312?B?UmxiQkNRTlZxdFY1OWtlalFlbnovYXI0VHBIT3BZQkRMbmc2TUswMWhMeDZy?=
 =?gb2312?B?VWg0bmFqY01YNlljZkF3eml3bmpCdGN6cDlpUXRxdWFWV0IwZ2RjRVd1bnBI?=
 =?gb2312?B?dWtPTjNwMWZQNXVnMkJUNzN3MTg5aTBmK2licVljS0VTdy9QNGlEb2dITndv?=
 =?gb2312?B?OTd3aytRZlBYK2lrbXh5TXd2M1RPQlpwVUdaaTZZVW1rNVRYOWxydHJFRUxX?=
 =?gb2312?B?Yi9Od0h1cllNeGdVMk1FNlZxZ2lIWTZ4aGJwMlRTVmdIU1l2V2JhTUdiU0h3?=
 =?gb2312?B?eUhXemR4SWR4SjQ0SStORVdLdEFmNXN2ZndBdTVPTStJdnFPdkRyZko5d1Bn?=
 =?gb2312?B?ZnFRMVR6RHBnT1JSb09nWGl0WEVwR3Q5ekpFZU5LU3drUW9FTVBoanI3anlx?=
 =?gb2312?B?YUkzQjZBR0hKSXBVY0ZETURBNzNxQWE4NHRuZkpJNzZpOWZmalU0cVFldU5z?=
 =?gb2312?B?YWx1dlc1aHFDUXU1MkptTGRHOGtmdWNCS2htY3FveEFkZ0psSktQVXlaT1FI?=
 =?gb2312?B?WDhPbWFEY2xVQTNzbXUvY3hsY1NjeTNabFV6NlJFdmZPZEo0WU0wMHNod3Fr?=
 =?gb2312?B?eldqbEFtMVRiSlBLTmdQaXZDNmpNSmlJOFJudk9hbzNPNXdYVnQ4NmhzZjVo?=
 =?gb2312?B?Z1dUNE9qNE13cVdlOXl6eEpjMEN5em1YRm9aMkFwNmgxRFZUeUFGbjF5R1VV?=
 =?gb2312?B?VGtqZW9OQmpXUXIrUElxU05VaTZlakdSeVJTd25qQ291a3Uwc1dUOE0vK3JK?=
 =?gb2312?B?WHJZZWpGUTJsUlgzQmNzVGRBZit6SnY2R3RUa1B4VGwxZ3JQZDJjc1dZeGJh?=
 =?gb2312?B?RUxsUjJyVmNYWHh4RHI5d1lsUFgyNVFNMWIyZ2VsQXM3M0daQWllOXhmMm1o?=
 =?gb2312?B?OHRWYXJoS0l3WmJwa3JIamlLaHA3b1RPSFp6a3g1S0ZIM0N6MEgxMTNwMS9p?=
 =?gb2312?B?MFErWnBnTVhpLzVhZ3VyRVZGa0dtdGk4aTJjZUtuVS9oN1REMGZkSktJVE0r?=
 =?gb2312?B?Z29kSXpDYW1PVWdubE5XMFVWQmZPRE45Z3pkVkJyVDZKWDYzWFV3dWlFTUI1?=
 =?gb2312?B?b0xHZmx4c3lkRitSLzk0MnZrQ0JIMldMSEltbDlYNHIrY3BtMS9yMnh6QW1U?=
 =?gb2312?B?bGRweUxLY1BldHQrWVdiR0pUQnlKWE52U2hjZzRPWjVFMmRvWXRhL1g5Q09E?=
 =?gb2312?B?M3FlZW9aU1I5OGRDRnNHZ0dLb254eE1mMnUxS2pRUFFNVXBlNUZFZkgzRkZl?=
 =?gb2312?B?YzI1V2pWTG9iRDE4eWN6ZUFRbWJPQ1ZzYnFVdjNjd2hyVGY1SlkvSGNIb3FE?=
 =?gb2312?B?aXNCMGM5dktnZ1Jkem01VWpQUWJnS1A3RTJZdzJBMjhqWUNFRkVYQUFGVGZW?=
 =?gb2312?B?c0N3WC82dUJEVlVOYmx4NG1qMkJmWXNHa0pzSG9KODNrbmtpRmNOYVBzQ0Mr?=
 =?gb2312?B?QTNKcE5OVGR6R0hSRDdLT2daeGdkZ25qTmMweExYZEIrS0w2MzFQTlNoT000?=
 =?gb2312?B?NzMvMUZtQjRtc1VVOXgvV0xTa1hWL2dEc2xuMnhZd2FjN21mMUgrUWRyT1ZC?=
 =?gb2312?B?bXdQbUkzNEhlUFd6OU5ZZk0yUi95elFiQm9yaUFRa2lpSG9mS2M5bW9TQldz?=
 =?gb2312?B?MkwrRC9WRzNlOEo2WVlNNzBISFFBTGJjQ0ZBTnBZZVpQblk2T0FGdit5eVlV?=
 =?gb2312?B?WjhTVlBBMi93d3FJblRBdzlUY21MVEtpRmovbm15Y0hxNjNtZFRGRGJPOUdL?=
 =?gb2312?B?dWFOcEl2TFlZL2h5MUJuT1VrV1kxUGtmZ25uaGpnbFo2RVRlS203S3hTKzk1?=
 =?gb2312?B?SXlScGR0NUplL0piTEY0YWxCaTh0cmVmVkN1cmhjZUg0UHQ5czcwR2NSdElJ?=
 =?gb2312?Q?uIXHYG+Gui5N7QzfGJUCCcHI4?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	l/baLKTB1P11IVUXZj21+G9G19jUZIvt+5zX3skXeOiQIafbCS5I0FMSUDguv5RO2KbV9S41h3u5ZOO3oSBJ8thhPwg08GOCEvQgh0uFzw5ZzjZkeoRiX5PDLAzS16/7uUSXkDMf3OCo+iCOo/ig3hVBetMZbKlrBRNMl3QoQWKblj9/Rqedkbx4aJAqE0DCbyu6y59ScMUO2RrjutgVc1uDm+ALE1Qjb1nywEEXXv3oivQdVbMdbOvKKzO288ZGbFQPyxQEkjh2eIecIE9qURWgl0L0dmR4daJzUZYFbF/DiJWQYqTT3t3oo8Y/lWutBfK8Os3KWSqbXBnUt6fyJEF1VXufp9JpWVpDi62lguviSxxgHVbQ3qtM4CA07N/9NhEaq3cLs532sDEmQA26hogYKtYO3gxYN+V3HjSH+TTkoDakdboRlVkdVRalbB5qunO1p8eVIcWfrILaQ6DUliqWosEacwu4wSmRZogxpfSXnmcGLqb2QzYles7znm2GKA4P0Ht1nLvvvxAE8ixx/9FNIoMjXgZTITLfWnA0OksJIG7zbkxYvA4+8A/3FzL00XZ6CVeAkoD+qiSMHmklpj3G87cloBskZ50J6a/PRfm3bJX96iBsl51VGW/M5x+Z
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf32269-5a8d-40e1-7703-08dc58428ee1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2024 03:10:06.7615
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fpm9WBr2ftJx5tzi1z+PNdxuqOWF9cXSOwI2QqgCOifcDA0hIu/8rL+LMN3IJmfE4qcoBXcURsa0SxtPPpZ0XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5579
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Apr 2024 03:10:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8663

cGluZw0KDQpUaGFua3MuDQoNCiAgLS0NCkJlc3QgUmVnYXJkcw0KLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpXYW5nIE1pbmd5dQ0KRlVKSVRTVSBO
QU5KSU5HIFNPRlRXQVJFIFRFQ0hOT0xPR1kgQ08uLCBMVEQuIChGTlNUKQ0KTm8uNiBXZW56aHUg
Um9hZCwgTmFuamluZywgMjEwMDEyLCBDaGluYQ0KVEVMo7orODYrMjUtODY2MzA1NjYtLTg1NjgN
CkNPSU5TOiA3OTk4ODU0OA0KRkFYOiArODYrMjUtODMzMTc2ODUNCk1BSUw6IHdhbmdteUBmdWpp
dHN1LmNvbQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IHdhbmdteUBm
dWppdHN1LmNvbSA8d2FuZ215QGZ1aml0c3UuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEFwcmls
IDMsIDIwMjQgODoyNSBBTQ0KPiBUbzogbWV0YS12aXJ0dWFsaXphdGlvbkBsaXN0cy55b2N0b3By
b2plY3Qub3JnDQo+IENjOiBXYW5nLCBNaW5neXUvzfUgw/nopCA8d2FuZ215QGZ1aml0c3UuY29t
Pg0KPiBTdWJqZWN0OiBbbWV0YS12aXJ0dWFsaXphdGlvbl0gW21ldGEtY2xvdWQtc2VydmljZXNd
IFtQQVRDSF0gbGF5ZXIuY29uZjogdXNlDQo+IHNjYXJ0aGdhcCB0byBMQVlFUlNFUklFU19DT01Q
QVQNCj4gDQo+IEZyb206IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+IA0KPiBj
b25mOiBtYXJrIGxheWVyIGNvbXBhdGlibGUgd2l0aCBzY2FydGhnYXANCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+IC0tLQ0KPiAgbWV0YS1v
cGVuc3RhY2svY29uZi9sYXllci5jb25mIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1vcGVuc3Rh
Y2svY29uZi9sYXllci5jb25mIGIvbWV0YS1vcGVuc3RhY2svY29uZi9sYXllci5jb25mDQo+IGlu
ZGV4IDI0NzY4ODA5Li5iMDM1YWRmNyAxMDA2NDQNCj4gLS0tIGEvbWV0YS1vcGVuc3RhY2svY29u
Zi9sYXllci5jb25mDQo+ICsrKyBiL21ldGEtb3BlbnN0YWNrL2NvbmYvbGF5ZXIuY29uZg0KPiBA
QCAtNyw3ICs3LDcgQEAgQkJGSUxFUyArPSAiJHtMQVlFUkRJUn0vcmVjaXBlcyovKi8qLmJiDQo+
ICR7TEFZRVJESVJ9L3JlY2lwZXMqLyovKi5iYmFwcGVuZCINCj4gIEJCRklMRV9DT0xMRUNUSU9O
UyArPSAib3BlbnN0YWNrLWxheWVyIg0KPiAgQkJGSUxFX1BBVFRFUk5fb3BlbnN0YWNrLWxheWVy
IDo9ICJeJHtMQVlFUkRJUn0vIg0KPiAgQkJGSUxFX1BSSU9SSVRZX29wZW5zdGFjay1sYXllciA9
ICI1Ig0KPiAtTEFZRVJTRVJJRVNfQ09NUEFUX29wZW5zdGFjay1sYXllciA9ICJuYW5iaWVsZCIN
Cj4gK0xBWUVSU0VSSUVTX0NPTVBBVF9vcGVuc3RhY2stbGF5ZXIgPSAic2NhcnRoZ2FwIg0KPiAg
QkJfREFOR0xJTkdBUFBFTkRTX1dBUk5PTkxZID89ICJ0cnVlIg0KPiANCj4gIExBWUVSREVQRU5E
U19vcGVuc3RhY2stbGF5ZXIgPSAiIFwNCj4gLS0NCj4gMi4zNC4xDQoNCg==

