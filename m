Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.76])
 by mx.groups.io with SMTP id smtpd.web12.6608.1581090150121585568
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 07 Feb 2020 07:42:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3niWZAk9;
 spf=pass (domain: arm.com, ip: 40.107.20.76, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+GiWkw1qd9XleD0nW394CKwiadLfrrWwArRDBLYJ43E=;
 b=3niWZAk9aXr2Ox8fD7NoBwB6jxYHo1yPMFvX/lwGgyMp2HsTjoJbe8ufAD/Ty5NcIa/Uh7HFmnaEBiwzXDCf05GhCrNn9LF0s1PNkZE2C+6NxZ+/kcSQdO9y8ZStxRrkn25SvLYddFQo6vXh5rv+hSELN+XL1lCUZ/iuXHkmpKU=
Received: from VI1PR08CA0086.eurprd08.prod.outlook.com (2603:10a6:800:d3::12)
 by DB7PR08MB3788.eurprd08.prod.outlook.com (2603:10a6:10:31::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21; Fri, 7 Feb
 2020 15:42:27 +0000
Received: from DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::204) by VI1PR08CA0086.outlook.office365.com
 (2603:10a6:800:d3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21 via Frontend
 Transport; Fri, 7 Feb 2020 15:42:26 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT058.mail.protection.outlook.com (10.152.20.255) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.18 via Frontend Transport; Fri, 7 Feb 2020 15:42:26 +0000
Received: ("Tessian outbound 62d9cfe08e54:v42"); Fri, 07 Feb 2020 15:42:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ab87b51dc41afb65
X-CR-MTA-TID: 64aa7808
Received: from 5acfc223c344.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9FC0B410-F871-4E31-B610-E5D4176845AC.1;
	Fri, 07 Feb 2020 15:42:20 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5acfc223c344.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Feb 2020 15:42:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aCtlDMEzqB39OI5TUHBtaqcaga6J3mAAD2pxOF9cadTD+P6txCUeQ6Yv8chZqLupacIQAEpV6el6XAUZfaSwLzLwbvRPBBIeKyJSsQgeJ9l9E0jxF/ovSy6NZZ33Gy28o14hYvvTJALX5BQBZ68v20TG5aNFEXU6pKKiDP/8m2WChvIOgZAVLgVFCtCcgRG4mtondN5+iG0uWbLksJvo80vDkNjXYoKBgPZtxfS4UrPIzHceDHlURcX6sroIXlC2wB5J4/SRw7ExRIlV6Q2GH7/BUl+yhuaPOou3iE0QiOW9OL+tJHziaqcf6G/C9WstQkS/6aCFmrBUmJBZcSqozA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+GiWkw1qd9XleD0nW394CKwiadLfrrWwArRDBLYJ43E=;
 b=HnRZ8qfKa1KraKWV8WGiF3ex+RPNi1SVk3I4iVj0kXXMEXInmtuCWr4mI0eTmzMUGNAqPlfJfmpEqZOzpTpFiUZgKzUNZw803MrN5Zn6fha+qm8zs+XA0sBirH75auye+6e5YxmaQ5Zrq/Hv6qsv1RXauwCebXEzqPh2ZQfyiTprPTK+aVpHwrVMnCS5R6gw10iLni08zw+IWp7zr1cNnSQOvRB9yUMH3Xyd27wlq2NRuf1iCS1jrX4JYVV+gOcPvOXCqhuDB2W/Hdj7FRL5Hlkko3Bemaq59IzAhiO9N6hFM6O38QkSht27N1aCLPC6vKqXRQQJBotzY6OFm01voA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+GiWkw1qd9XleD0nW394CKwiadLfrrWwArRDBLYJ43E=;
 b=3niWZAk9aXr2Ox8fD7NoBwB6jxYHo1yPMFvX/lwGgyMp2HsTjoJbe8ufAD/Ty5NcIa/Uh7HFmnaEBiwzXDCf05GhCrNn9LF0s1PNkZE2C+6NxZ+/kcSQdO9y8ZStxRrkn25SvLYddFQo6vXh5rv+hSELN+XL1lCUZ/iuXHkmpKU=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3771.eurprd08.prod.outlook.com (20.178.84.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.25; Fri, 7 Feb 2020 15:42:18 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::9193:2edc:5e96:ffb2]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::9193:2edc:5e96:ffb2%7]) with mapi id 15.20.2686.035; Fri, 7 Feb 2020
 15:42:18 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Layer.conf require of meta-virt-default-versions.inc
Thread-Topic: Layer.conf require of meta-virt-default-versions.inc
Thread-Index: AQHV3c0tWbM1jyFh1Eq6q115UpYi3A==
Date: Fri, 7 Feb 2020 15:42:17 +0000
Message-ID: <71AE4689-E4D8-4F9B-BE4B-22C75AD42084@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
x-originating-ip: [217.140.106.49]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 68b8baa3-c4a2-4511-0ca2-08d7abe454fe
X-MS-TrafficTypeDiagnostic: DB7PR08MB3771:|DB7PR08MB3788:
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB37888AFF0AC06BA0844D0A409D1C0@DB7PR08MB3788.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 0306EE2ED4
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(189003)(199004)(4326008)(6916009)(8936002)(186003)(33656002)(6486002)(6506007)(26005)(2616005)(6512007)(316002)(91956017)(76116006)(86362001)(66476007)(66556008)(64756008)(66446008)(66946007)(71200400001)(5660300002)(36756003)(478600001)(8676002)(81156014)(81166006)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR08MB3771;H:DB7PR08MB3689.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 OLD7H3+SRVyPcVp394E5sp3mp0PFVj1fYi3cHitvtlqQe95mH/d9puffrBrHO8BvKfaVmw2eft4yvyKd81S85WKcn0/2h7PXBff2JgTw9gi1NFIqR8xfOeKWSa13mmG8vkZ8OTJbAzkZBCjNhjesd5/dQuBrCV4fhV4I/M9t5ta2Qe0xYaHIvu2W/NBV2glrlNhpgDsh/3eRLtk//NalMeth5RtZ5V0PMM9bJGhsQ63irAXv1IJqW6ok3X0R0AKP2xANeDmp1RtwVXwnV0DKEfERlLjgA/7+PnVzMBE+cM75NFvqfVB/M4lNlGasZRw+4JxzacEyd49ylUQVfcBTtpzQURPkH3281IwfbLhiSM4Vv4Z9joryZslusAR0s+b4YnwJLQY8PNhIMwKlqmJgAGjl9rfQYFaH3/csNl3ig63E/zZesWkQ6UDpKMrwA3Nk
x-ms-exchange-antispam-messagedata: 
 i2ty3cxOmvUUzq++1mWdxtxSgRYzy+VpvMa9oQblsyRnAahey0Z4GHQyvEZRAEQv8JJbw6SxV6oP0ixlI4PtyMA1CaMxx+rRpaxM0mD3XtQJyMVXta9vUMutipWwgrCy5GQzIuKJ+PXIf1+GqlW9BQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3771
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(136003)(39860400002)(346002)(376002)(396003)(199004)(189003)(26826003)(2616005)(336012)(478600001)(6506007)(2906002)(86362001)(26005)(5660300002)(6486002)(186003)(33656002)(356004)(81166006)(4326008)(6916009)(6512007)(81156014)(8676002)(8936002)(36756003)(70586007)(70206006)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR08MB3788;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;MX:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	edb907fa-b724-4b07-00ce-08d7abe4501b
X-Forefront-PRVS: 0306EE2ED4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wWsmzkwJkvW0MYb7NlFHnFQqEZTtu8FRU89XhB4fi0nBleN8k71bIb6ugqh+xxW1fhn2KomJo2j6JqsDJQ3WIq3zU5fbG/th4yd/wZbq/Ul5v6spZBgW6NyfqJimEQbHKZD6Gt6Qw5VLbfn/5/0byYWQbZKQskir9LN27SCEqQdheF1MxZQM/Zc0jhffw4s7A5OSnlChXa35MH18jFw5bmbZu5m5nQgunLEJl9p/ILimtqH818A0cNVlLOzRYy208uc+kU463Hk6PSETFSscEDiy/HqDt78VK1/0TWB4eMzEf9uG4lPCgjWcNxAzetKSJREcyF/sxYafR3X4nkrluG9K8oiAzWQXqTkk+s6IfVlLxJ1DRAlB7MgqRKvtYszNXSgnvPybRl+l7Rjbidx/NG3tAjOA/baZb735880Uu25LMM+2mxK3v4JDxIApSYBk
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2020 15:42:26.2542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68b8baa3-c4a2-4511-0ca2-08d7abe454fe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3788
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <E957A5FC75B15B4C9227E93D72854D2D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

SGkgRXZlcnlvbmUsDQoNClRyeWluZyB0byBkZXNpZ24gbXkgb3duIGxheWVyIEkgdXNlZCB0aGUg
ZXhhbXBsZSBvZiBtZXRhLXZpcnR1YWxpemF0aW9uIGxheWVyIGNvbmZpZ3VyYXRpb24gdG8gdHJ5
IHRvIGluY2x1ZGUgYSBmaWxlIGRlcGVuZGluZyBvbiBhIERJU1RST19GRUFUVVJFUyB2YWx1ZS4N
Cg0KQWZ0ZXIgc2V2ZXJhbCB0ZXN0cywgSSBkaXNjb3ZlcmVkIHRoYXQgYWxsIHRoZSB2YWx1ZXMg
dGhhdCBJIGRpZCBkZWZpbmVkIGluIHRoZSBpbmNsdWRlZCBmaWxlIGhhdmUgbm8gZWZmZWN0LCBp
biBmYWN0IEkgZ2V0IHRoZSBmZWVsaW5nIHRoYXQgRElTVFJPX0ZFQVRVUkVTIGRvZXMgbm90IGNv
bnRhaW4gdGhlIGVudHJpZXMgSSBhZGQgaW4gbG9jYWwuY29uZiB3aGVuIGxheWVyLmNvbmYgaXMg
cGFyc2VkLg0KDQpNZXRhLXZpcnR1YWxpemF0aW9uIGlzIHVzaW5nIHRoaXMgc3lzdGVtIHRvIHNl
dCBQUkVGRVJSRURfVkVSU0lPTiBmb3Igc29tZSBwYWNrYWdlcyBidXQgaXQgc2VlbXMgdGhhdDoN
Ci0gdXNpbmcgcmVxdWlyZSB3aXRob3V0IGEgZnVsbCBwYXRoIGRvZXMgbm90IHdvcmsgKG1heWJl
IHRoZSByZXF1aXJlIHNob3VsZCBiZSBjaGFuZ2VkIHRvIGNvbmYvZGlzdHJvL2luY2x1ZGUvbWV0
YS12aXJ0LWRlZmF1bHQtdmVyc2lvbnMuaW5jKQ0KLSBldmVuIHdpdGggdGhlIHJpZ2h0IHBhdGgg
dXNpbmcgYmIudXRpbHMuY29udGFpbnMgZG9lcyBub3Qgd29yayBpZiBESVNUUk9fRkVBVFVSRVMg
aXMgc2V0IGluIGxvY2FsLmNvbmYNCg0KQ291bGQgYW55b25lIGNvbmZpcm0gb3IgZXhwbGFpbiBt
ZSB3aGVyZSBJIGFtIHdyb25nIGhlcmUgPw0KDQpIZXJlIGFyZSB0aGUgdGVzdHMgSSBkaWQgdG8g
ZW5kIHVwIHdpdGggdGhvc2UgY29uY2x1c2lvbnM6DQotICJyZXF1aXJlIG1ldGEtdmlydC1kZWZh
dWx0LXZlcnNpb25zLmluY+KAnSBkaXJlY3RseSBpbiBsYXllci5jb25mIGlzIGVuZGluZyB3aXRo
IGEgYml0YmFrZSBlcnJvcg0KICBTbyB0aGUgZmlsZSBpcyBub3QgZm91bmQgaGVyZS4NCi0g4oCc
cmVxdWlyZSBjb25mL2Rpc3Ryby9pbmNsdWRlL21ldGEtdmlydC1kZWZhdWx0LXZlcnNpb25zLmlu
Y+KAnSBidWlsZCBjb3JyZWN0bHkNCiAgU28gdGhlIGZpbGUgaXMgcHJvcGVybHkgaW5jbHVkZWQg
aGVyZS4NCi0gYWRkaW5nIOKAnFRFU1Q9IiDigJwgaW4gIG1ldGEtdmlydC1kZWZhdWx0LXZlcnNp
b25zLmluYyBhbmQg4oCccmVxdWlyZSBjb25mL2Rpc3Ryby9pbmNsdWRlL21ldGEtdmlydC1kZWZh
dWx0LXZlcnNpb25zLmluY+KAnSBpbiBsYXllci5jb25mIGVuZCB1cCBpbiBhbiBlcnJvcg0KICBT
byB0aGUgZmlsZSBpcyBwcm9wZXJseSBpbmNsdWRlZCBoZXJlLg0KLSBhZGRpbmcg4oCcVEVTVD0i
IOKAnCBpbiAgbWV0YS12aXJ0LWRlZmF1bHQtdmVyc2lvbnMuaW5jIGFuZCDigJxyZXF1aXJlICR7
QGJiLnV0aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVBVFVSRVMnLCAndmlydHVhbGl6YXRpb24nLCAn
bWV0YS12aXJ0LWRlZmF1bHQtdmVyc2lvbnMuaW5jJywgJycsIGQpfeKAnSBpbiBsYXllci5jb25m
IGJ1aWxkIGNvcnJlY3RseQ0KICBTbyB0aGUgZmlsZSBpcyBub3QgaW5jbHVkZWQgaGVyZQ0KDQpJ
cyB0aGVyZSBhIHJpZ2h0IHdheSB0byBhY2hpZXZlIHdoYXQgaXMgd2FudCBpbiBsYXllci5jb25m
ID8NCg0KVGhhbmtzDQpCZXJ0cmFuZA==
