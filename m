Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.3038.1605073223092284319
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Nov 2020 21:40:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@wdc.com header.s=dkim.wdc.com header.b=kwhOGKFp;
 spf=fail (domain: wdc.com, ip: 198.145.29.25, mailfrom: prvs=5772e8c53=alistair.francis@wdc.com)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail.yoctoproject.org (Postfix) with ESMTPS id EDE3238C04B3
	for <meta-virtualization@yoctoproject.org>; Wed, 11 Nov 2020 05:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1605074164; x=1636610164;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=HW0A5rermAHTDjvMYBxNjra7SGYkE4iOECcm5wOFd5k=;
  b=kwhOGKFppd08/punOp7bo94RfvJcNcGODG2FHk3QGy1LPaOEJysfAuVm
   MToNnnFg6SiCqchY2z46A63fe8U5+G08YvL5tOeCQSgvsnZxkDt2jb9YW
   F1rZXd6chqmZxBQ3jJtM8cKDKeJDkNfdD5GFS7Z2hk+unLHdrDajZLA0u
   UEi/kVu8BEXuz4DF1CHXYyu9ngUgvD+jlqn3i8lmIick9wYGqYI9HBKDT
   p3NYTNQvn26Ka6KCJhxD4Fqdk2hhGZPlUxQnKRQBRdRwDob9nPQE3Plfq
   48hhoyPyEjF3NZurs7XhhhA/+MuCvQ40YODfOJdu7801rqFc4ejVbVTPu
   A==;
IronPort-SDR: JCx3yLfWbA9+N6ZgsnATee9LVAb40Sf2xdvLVJTQlojR9ALCw0Q1BSGj9Rz2gZA8xxNJ8FzIJb
 /VQ/k3EbRGRnTwDFS2nHSiyEAgRpFI+HRASpnJtJjzAMpj+LWXl3zAfImOiCQiUB49kUlI/eyN
 T4diJGJ8kHx2mde43Eq1O/h/mr9FWOFF6DeJiZBYLlNSkaHwWGLts8fQnhBA+1Y+HIwsuDDZUZ
 i1jazYsZCZ7qiLeFMb6woT/FlDfhi3HFhjYHMkvjJov9h4o0g7kPJcLu0eE6WnkslPnLTrooRh
 BXo=
X-IronPort-AV: E=Sophos;i="5.77,468,1596470400"; 
   d="scan'208";a="255917614"
Received: from mail-co1nam11lp2168.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.168])
  by ob1.hgst.iphmx.com with ESMTP; 11 Nov 2020 13:56:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/dlhHF7yJnGKPex/AszU4RjAsJSA6GfuZn6osm66odiMOoEnPFxNIwCJRWjUTK20U7tCf8nu2GxXTjmJ2vDhJJvpxMDZt3339e0gDhxqWCq4p3p3d1mLts82YX6Tm2E9rp6h5rscIpq/P+CIEc+bp5rCaMmyU8hVWo3WHGj0tqbjKF3sHs3c+vfosym0v/+EHCq9S4XDGnjYkFV99hlYFpb6YTRGleMI/wAEMUTp80mgfLMW4R2u5V0YcP+sRqrYJUH8hqKznuxz9crqC4kbd+2UfchqC7NvqzwZdKPTlAX3k29LbMU0vGpfSznqFcuP3CdnjLekv6ncFTEjOSI0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HW0A5rermAHTDjvMYBxNjra7SGYkE4iOECcm5wOFd5k=;
 b=Vek+vv1glXZiaAxkaQu7vZonEip0LaOfC237J0MRmZq0ycbgDtkbtg4KUA8yCmXOO0uVWVrPQN4WQitIHFmKj+vKi1FWHyzpENcvIhUOQb4pJM9PrcwUTVmFxn9AVeKZJFQUd79RhcWyyS2hc2XWfZo+jRwAUj8+cN36fFpCMuiT3HnxSkZeMC5y2t4tcd4Cd/hOMZ2bx+OrUg7GxJeeR+GLAY/68Rn/aLzVY3PPEmAds39uNR66u/emfSxAhjFSEhWh/K15LSrMKViphWORBdbFTlAIQUaqhPmxZ8v+SmX/UbKXtgc8tV2IXcRKhEMb46LTXdNPWj3k+38pfVtZQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HW0A5rermAHTDjvMYBxNjra7SGYkE4iOECcm5wOFd5k=;
 b=iFrH78SmV9uzA9X6SwBIUyOt/NtW+nhxMrtOyBTGOpcPRHQzKcU5H+8dkWxhNL9WQ+i9DWOMkN2tcFsXe05GkWRTTTROV5eRE6W+4Kc86bBn/1oUr+V5KD9ZUWCVStOlGXIC6R7dITm5YPtcVzUqXrkEbNUacIPGvVPS35E92pE=
Received: from BY5PR04MB6882.namprd04.prod.outlook.com (2603:10b6:a03:21b::19)
 by BY5PR04MB7028.namprd04.prod.outlook.com (2603:10b6:a03:229::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Wed, 11 Nov
 2020 05:40:18 +0000
Received: from BY5PR04MB6882.namprd04.prod.outlook.com
 ([fe80::1cfc:5636:1a0b:400c]) by BY5PR04MB6882.namprd04.prod.outlook.com
 ([fe80::1cfc:5636:1a0b:400c%7]) with mapi id 15.20.3541.025; Wed, 11 Nov 2020
 05:40:18 +0000
From: "Alistair Francis" <alistair.francis@wdc.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, "dingo@optimcloud.com"
	<dingo@optimcloud.com>
Subject: Re: [meta-virtualization] xvisor was skipped: incompatible with host x86_64-linux (not in COMPATIBLE_HOST)
Thread-Topic: [meta-virtualization] xvisor was skipped: incompatible with host
 x86_64-linux (not in COMPATIBLE_HOST)
Thread-Index: AQHWt9+R+RqaL0Y0GkSWdhr20xEn8anCZ0iA
Date: Wed, 11 Nov 2020 05:40:18 +0000
Message-ID: <977c8e617b37927257cd8ba7ad4d6dd4b8e7ebf1.camel@wdc.com>
References: <802479e8-37ab-5cfd-4b47-b81dae132197@optimcloud.com>
In-Reply-To: <802479e8-37ab-5cfd-4b47-b81dae132197@optimcloud.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.1 
authentication-results: yoctoproject.org; dkim=none (message not signed)
 header.d=none;yoctoproject.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2601:646:8e00:d1:7646:3cdc:9711:cfd5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1427dbfc-e304-4f3e-c635-08d8860445f7
x-ms-traffictypediagnostic: BY5PR04MB7028:
x-microsoft-antispam-prvs: 
 <BY5PR04MB702826E894D80BDDCA1AB4C990E80@BY5PR04MB7028.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Qe5c9oZkV5TwmNPmEk0+LairRrlErRa6+VJW8cjHDaOv4L4AY+BixHAyYN8YkTZ+Yddh+12c/yD9EjqdyBB/0J6sIybLuLMMBi8BTbs5QTlMutz62Oq3eyBbAO4jzLBf/Tqzo1Y4/euA1EXVhTcZQji84iaQ0vat4BTXiWzoXpZZUXSoriqy3FAryW5FmvCgS6U3vdKm+C4F6SK+9Z81tpzloywUYk9Yxszr1AjrWfTHNl+w8gWfimnvjbXE2LR/SDysYrPkPGLzfGqWA2tb+CnK2mKT25vySr2GQnwvg9oG6UIDlQrBWMyrnromzV7vP9GGWzWdTh3ipzAQH39/HOE7AMRLGi4izepEQQALF65gxFDW7MqFF4qRqiN7i/YQM60j2dB15OY0JGK79dglbg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR04MB6882.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(966005)(66446008)(8936002)(64756008)(6506007)(83380400001)(36756003)(66946007)(2906002)(8676002)(66556008)(5660300002)(6486002)(6512007)(478600001)(86362001)(110136005)(4001150100001)(186003)(2616005)(66476007)(76116006)(4744005)(71200400001)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 WbX2uXTxTAykioAOvijLvO6sniR6xuyWkd4FGdLCwrrPFCJo/V+WiRKoBLsJAY4tc4qBUqO5B3HNk3S+ChrwvcSL6t+uXrB4I/Z/q+lFOgT8qxAGLzHLL5kBrhMP89wevIPuo+nFTzYRBtQR9R0tV1POyfKvLLydDzp9CXBIEQ7S5Xe4A+/rgf5EaudTqImeUkL9xov42/DfeO+YP5I5qV+VAmEKQ3WlciJ7rnoQ9jUIytgzlPgjypOmm1qma5HtjXiR5qelrobG1++KaDN3AvnnMUqz8SKu4pEml16oaeqs2b8i6r7pH8TrmyYYuRzMpe9Ofhi81ocrHw3/rZxPbsZjjQlYTd0MnSgwnzwI3foP88qYS4IQWLW8F+oRH4Fixy+CI328v2TbT5gxFtKiAVtHW9IujEp2WixQIPVX6JIpNSdS8onWoAuKEOEpmbOwKm6MdU1IDuU4iv06QbnU5qxmiyhkgrf4VZ0EKVSaigsLGZSqeZO1V2/HkSfyerpzNxtCgGUaUgkssYqAFqR+j2F9133S5UOel8916hNuzDhQ85gvCUQJfdlxEsXKf8Qgu0zMCz/fdPxAEZKVMjBt8LalPz5coJZiWVP60L8cUK4zXepDDgjmItj7LvCjU9j37hyKq1DK+ZiZdXpA5vaTWGolgIWmhzFt0nfyc8Xdd//8GZrzlXHjI5P0MimtN4L1BFqZ2/q9h6j0kX+ahJRjmA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6882.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1427dbfc-e304-4f3e-c635-08d8860445f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 05:40:18.3507
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UyiCI3omhAgNtGc4p45nb6laLh2cwO3960lmVbbNpO9zj6uYm73vYURyhYltuTKBvaNDkchZrps2DOtUj0aNliCbTqKlIEoXyoNK37qAGGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB7028
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <C4888AEF3DD9CD4488E009178462F485@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDIwLTExLTExIGF0IDExOjAxICswNzAwLCBEaW5nbyB3cm90ZToNCj4gYW55IHJl
YXNvbiBYdmlzb3IgaXMgbm90IGNvbXBhdGlibGUgd2l0aCB4ODZfNjQgPw0KPiANCj4geHZpc29y
IHdhcyBza2lwcGVkOiBpbmNvbXBhdGlibGUgd2l0aCBob3N0IHg4Nl82NC1vdmVyYy1saW51eCAo
bm90IGluDQo+IENPTVBBVElCTEVfSE9TVCkNCg0KVGhhdCBpcyBqdXN0IGJlY2F1c2Ugbm8gb25l
IGhhcyBwdXQgYW55IHRpbWUgb3IgZWZmb3J0IGludG8gbWFraW5nIGl0DQp3b3JrIGFuZCB0ZXN0
aW5nIGl0IG9uIHg4NiB3aGVuIGJ1aWx0IHdpdGggbWV0YS12aXJ0LiBYdmlzb3IgaXRzZWxmDQpz
dXBwb3J0cyB4ODYsIGl0IHNob3VsZCBiZSBwcmV0dHkgZWFzeSB0byBnZXQgaXQgdG8gYnVpbGQu
DQoNCkFsaXN0YWlyDQoNCj4gDQo+IA0KPiANCj4gDQoNCg==
