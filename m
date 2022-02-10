Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A96C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 08:05:15 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.81])
 by mx.groups.io with SMTP id smtpd.web11.7531.1644480312622142069
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Feb 2022 00:05:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=ijyXQHzC;
 spf=pass (domain: arm.com, ip: 40.107.20.81, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmHP6jteCt08n0EcWk0XBTUBAbsU2H/YPt+nQv8ZgPw=;
 b=ijyXQHzC7ZxoJsUVe/XVt0T7d1XDAqvbIyHBrLWntOv0h5LUw2ln7zHZrFwkpB/6dVsFt3sMH2CW1QKu+ua7/Xc+8hlNMUzmlKiyaRlgPN1ICgTkRL6+Ugvhoy0VQePFeu+J8hDiYgo1/+AGJghWXnMvUxdg/107RaKVOI758TY=
Received: from AM6PR04CA0018.eurprd04.prod.outlook.com (2603:10a6:20b:92::31)
 by GV1PR08MB7314.eurprd08.prod.outlook.com (2603:10a6:150:1d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 10 Feb
 2022 08:05:05 +0000
Received: from VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::8c) by AM6PR04CA0018.outlook.office365.com
 (2603:10a6:20b:92::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19 via Frontend
 Transport; Thu, 10 Feb 2022 08:05:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT040.mail.protection.outlook.com (10.152.18.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 08:05:04 +0000
Received: ("Tessian outbound 826a6d8e58c3:v113");
 Thu, 10 Feb 2022 08:05:04 +0000
X-CR-MTA-TID: 64aa7808
Received: from d678a0565789.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AAA3B6DF-4B7F-43B6-973C-614DC2B836E6.1;
	Thu, 10 Feb 2022 08:04:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 d678a0565789.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 10 Feb 2022 08:04:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NaytVfiXQPclQqumb0ROOp0wNV3ZtdGIw5ANb/gK7C0cm4IOR0b+7hTGbqu2fgaF7PhRUWQT24AJB0B3Flta+p0pFWx3LSE/J9Ho5uuE+7o/tCEly/yJwHAID4kVHCpbLePPNNdmkfbNHWsHLxuOFJfOSsqXd9j88SoEnEzKzaql4Y9Ttql/maZ87xt392I7SYxjsu5p0tLsxEtZnkYAKDLt/XjZV5iqCFPSVqIqB5bLmal3QxkZN0/9e6iLFjtUuNFJBgO14l1gNPTNcqBVcZlj9tF4o3B99KW+TThAGjYRbld4TNDBSd2SmhF+DX2pQ0PVRZXUqrFyBbQqO68hgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmHP6jteCt08n0EcWk0XBTUBAbsU2H/YPt+nQv8ZgPw=;
 b=ZTmfQBk4Lm9D+usSoISB6K83/Q7eEmauGQ3/p1FTy34vcmmAl25+Ge55G+Mfvb+QnpCSjdqN6p0NqgBwzf5QGMf8Ie/Ned7lUjXX7gzEsW32EZdCEQ9nnbtE6AkZJN0I2l3GLVBmnk0RStTSwy82/BmWKBDM2BYvW5E7NGEN9ed/BMVVpyWK/5rWYew8LOypEZAbVi29yy3RRiTiZlgmH0zXSFO6/G8GzTSCJcNaVrbwoOqbVZp/zXkcAZMS0J0LlCFlclOvOF6mKqjdIL+9aZXD0jn/Q9FlL+qAVoeyvPbIw+EFyjwmflZA4fBUCT7E9D/IxcmMn2COd+LSemrZyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmHP6jteCt08n0EcWk0XBTUBAbsU2H/YPt+nQv8ZgPw=;
 b=ijyXQHzC7ZxoJsUVe/XVt0T7d1XDAqvbIyHBrLWntOv0h5LUw2ln7zHZrFwkpB/6dVsFt3sMH2CW1QKu+ua7/Xc+8hlNMUzmlKiyaRlgPN1ICgTkRL6+Ugvhoy0VQePFeu+J8hDiYgo1/+AGJghWXnMvUxdg/107RaKVOI758TY=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB6438.eurprd08.prod.outlook.com (2603:10a6:20b:33e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 08:04:56 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::4166:e460:59da:189]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::4166:e460:59da:189%3]) with mapi id 15.20.4951.019; Thu, 10 Feb 2022
 08:04:56 +0000
From: Diego Sueiro <Diego.Sueiro@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Subject: RE: [meta-virtualization][PATCH honister] k3s: uprev from
 v1.21.5+k3s1 to v1.21.9+k3s1
Thread-Topic: [meta-virtualization][PATCH honister] k3s: uprev from
 v1.21.5+k3s1 to v1.21.9+k3s1
Thread-Index: AQHYHcoglYntzPAsHUa4YYpoLFCqWKyLcz8AgAD5n9A=
Date: Thu, 10 Feb 2022 08:04:55 +0000
Message-ID: 
 <AM6PR08MB3461274BA8D92A309BEBEA6D922F9@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: 
 <418a985b65f8fe5aa5d2728586d0bea68bc7181c.1644420463.git.diego.sueiro@arm.com>
 <CADkTA4NTHfQDJNmrb0AbNGLHa0OZ3Ske4J43BDtscQ=R+bvKrA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4NTHfQDJNmrb0AbNGLHa0OZ3Ske4J43BDtscQ=R+bvKrA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 068D91B3A851234AA5ADBA3E12667435.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7e30d39a-85ea-4099-e900-08d9ec6c0bdb
x-ms-traffictypediagnostic: 
	AS8PR08MB6438:EE_|VE1EUR03FT040:EE_|GV1PR08MB7314:EE_
X-Microsoft-Antispam-PRVS: 
	<GV1PR08MB73144E8E40D93F2BC0F641ED922F9@GV1PR08MB7314.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3513;OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 srQfPA4I3LxiFckhRQ52HZy0wXQ3evGAlhCzGI1zmMR8HS/sjebbR3/0IuFcBEphIV6JBSa1eCvO2PMlDXihx+h0zeAzP0R6pdPShQeVceLW6/jIR3zlwPaYZu1iiBxaGnebcRgqExFAFAzZy6zi23KNqjhBmgqQvQLJAOC60UfnrM7t4ff8HlcHACq67K2jPVBNxzc/MtXLBka1IOIwwIcUKqF2uTmufEjfacaxFpqpKxjNQXTCH7jd/sWCahKv/OuqleYG7SKHp11QDsS2CYqbYa1U2mzTFFPG2E44JL6pgZjCLXZ6jKGgYMPPvqIYrbCgpX1PDZw6dVQgLljgUT74h6KTIE4WbZcyL9CCQPl7TwcLIk54rrifI5afoFbVoe2uyGg1UoZi/weY/Gf685+/pKHlP8YAyFLN3bXmZOkDxSqlH3CCwNJZV6TDULWLMrjIAd9M4JDkyZTHUdUGdnkpvae57sbYld8mmvrYl8gvTYVtQDiTxyVME3tORxEmz9Cue8agus0ZhRvOEprU+xrl0Xkc1R1cposIQhqyPhGg5nQw12S0udIhh+vRc7aJvO5ySxuwog31joXb2fdvJj/nFNcQ/wdylDFsj1H772/9rahUb2UxuucXW6QgcJSf9IsupkMr4mfeISn8ZkR36bjTEWa2ziVOyG+LTCBNRN9V+qnc9lp6XjlUh/9QKz196MsjANdHWggX+KyxLxSLo2UfuAg+TQPNJ4bYhkXWSve4XvQdWDZmGXPGVNNIAkmRflk28cPzFZnm+SxUNveYIFJqtpbd4ZvpIXzfT7fTwJA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(9686003)(508600001)(86362001)(55016003)(2906002)(6916009)(54906003)(966005)(316002)(66476007)(4326008)(66556008)(8676002)(66946007)(8936002)(33656002)(52536014)(6506007)(5660300002)(7696005)(64756008)(38070700005)(83380400001)(66446008)(76116006)(71200400001)(38100700002)(122000001)(26005)(186003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6438
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d11136b5-68cd-4469-484b-08d9ec6c069b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qXWJ0v34MVVgHQchTtNsHzPsZybUdQEBgOxCgdysvKovCpY/Xm0HG4EYuSgxQhde9z21SHaEothzvTbt8KT1jHUleZCk9/BhSVrIMdoaE9Y7aQkHMrGhGQExANjH8iZdsI+SQzARG2r1E8swj6HjsKD84U2PcxzqH9nQ5vB9kI9PKfVJ9cSn9WzEx9XwdwCQBG3bOiTER5RIMUoe/w0iZz6OglW/2aq6wXLJRADpTnQRywDxAsIm2WniT2NBWFmHjUdmkUHqAyi81dYTM4UosoeDhLuFupW1BjtLDSL818lW51vsjiU1yY8R3bqvCgZebLtOzTVx7a09aFDm/lbS6izujK4e8zBMmK1QRuBhXPBuRjEx+yJCWvw4dDUsbsYQptdemA3R4+ajHwDKLi5Ui8q5z2aOm6cvd9rFu5HevXihCVy2dAN/4KYvHrdfnX9Jx5zTXNHQDwKrBrkrbSDqNDzIUA5NKxmvudHKOwtp6muDcPjJ2YKl1pbmRkIxNV8I7azG+rCXKw/ht1v7Fof8b+59HKIYCdN+Pa4497WuQF91AoyNfgx7wrDniZ7dxDzv27uct13WkSeoLB19GS/MrGPmLCwPAtUtIY8P+k88ddlwwgyHn4dBA92RYtdnQD6SN2p156rB7u1Pb0HN/4lC+FRoBulgdC/jDoJF5kxDHKN+/KeX/f8PXcsv9UzWAHeNqbIFeXiWIjvTl7j5+3cmiX4IzIREFEmTz3IMLN2tQ5GbYwZ6F1ccuAIXJHMqG7I5
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(70206006)(86362001)(316002)(55016003)(508600001)(82310400004)(47076005)(966005)(81166007)(356005)(40460700003)(36860700001)(6862004)(83380400001)(9686003)(52536014)(186003)(4326008)(7696005)(54906003)(33656002)(2906002)(26005)(5660300002)(8676002)(6506007)(336012)(8936002)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 08:05:04.8126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7e30d39a-85ea-4099-e900-08d9ec6c0bdb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7314
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Feb 2022 08:05:15 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7058

SGkgQnJ1Y2UsDQoNCj4+IC0tLQ0KPj4gIHJlY2lwZXMtY29udGFpbmVycy9rM3MvazNzX2dpdC5i
YiB8IDEwICsrKysrLS0tLS0NCj4+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9yZWNpcGVzLWNvbnRhaW5lcnMvazNz
L2szc19naXQuYmINCj4+IGIvcmVjaXBlcy1jb250YWluZXJzL2szcy9rM3NfZ2l0LmJiDQo+PiBp
bmRleCBiY2ZhOTU5Li43N2FkNmQ0IDEwMDY0NA0KPj4gLS0tIGEvcmVjaXBlcy1jb250YWluZXJz
L2szcy9rM3NfZ2l0LmJiDQo+PiArKysgYi9yZWNpcGVzLWNvbnRhaW5lcnMvazNzL2szc19naXQu
YmINCj4+IEBAIC0xMywxMCArMTMsOSBAQCBTUkNfVVJJID0NCj4iZ2l0Oi8vZ2l0aHViLmNvbS9y
YW5jaGVyL2szcy5naXQ7YnJhbmNoPXJlbGVhc2UtMS4yMTtuYW1lPWszcztwcm90b2NvDQo+PiAg
ICAgICAgICAgICBmaWxlOi8vMDAwMS1GaW5kaW5nLWhvc3QtbG9jYWwtaW4tdXNyLQ0KPmxpYmV4
ZWMucGF0Y2g7cGF0Y2hkaXI9c3JjL2ltcG9ydCBcDQo+PiAgICAgICAgICAgICBmaWxlOi8vazNz
LWtpbGxhbGwuc2ggXA0KPj4gICAgICAgICAgICAiDQo+PiAtU1JDX1VSSVtrM3MubWQ1c3VtXSA9
ICIzNjNkM2EwOGRjMGI3MmJhNmU2NTc3OTY0ZjZlOTRhNSINCj4+IC1TUkNSRVZfazNzID0gImFh
NWEwYThjNzgzYThhNDQ3NWI3MjdhMDRkNjU5NGMwZmVhMDkyNTMiDQo+PiArU1JDUkVWX2szcyA9
ICIxMDE5MTdiMGM0OTNkZDFlZmZhYzEwNzRmZWIxZDU0NjJiOWExODliIg0KPj4NCj4+IC1QViA9
ICJ2MS4yMS41K2szczEiDQo+PiArUFYgPSAidjEuMjEuOStrM3MxIg0KPj4NCj4+ICBDTklfTkVU
V09SS0lOR19GSUxFUyA/PSAiJHtXT1JLRElSfS9jbmktY29udGFpbmVyZC1uZXQuY29uZiINCj4+
DQo+PiBAQCAtMzAsNyArMjksNyBAQCBQQUNLQUdFQ09ORklHW3VweF0gPSAiLCx1cHgtbmF0aXZl
Ig0KPj4gIEdPX0lNUE9SVCA9ICJpbXBvcnQiDQo+PiAgR09fQlVJTERfTERGTEFHUyA9ICItWA0K
PmdpdGh1Yi5jb20vcmFuY2hlci9rM3MvcGtnL3ZlcnNpb24uVmVyc2lvbj0ke1BWfSBcDQo+PiAg
ICAgICAgICAgICAgICAgICAgICAtWA0KPmdpdGh1Yi5jb20vcmFuY2hlci9rM3MvcGtnL3ZlcnNp
b24uR2l0Q29tbWl0PSR7QGQuZ2V0VmFyKCdTUkNSRVZfazNzJywNCj5kLCAxKVs6OF19IFwNCj4+
IC0gICAgICAgICAgICAgICAgICAgIC13IC1zIFwNCj4+ICsgICAgICAgICAgICAgICAgICAgIC13
IC1zIC12IFwNCj4+ICAgICAgICAgICAgICAgICAgICAgIg0KPj4gIEJJTl9QUkVGSVggPz0gIiR7
ZXhlY19wcmVmaXh9L2xvY2FsIg0KPj4NCj4+IEBAIC00MCwxMSArMzksMTIgQEAgUkVRVUlSRURf
RElTVFJPX0ZFQVRVUkVTID89ICJzZWNjb21wIg0KPj4gIGRvX2NvbXBpbGUoKSB7DQo+PiAgICAg
ICAgICBleHBvcnQNCj5HT1BBVEg9IiR7U30vc3JjL2ltcG9ydC8uZ29wYXRoOiR7U30vc3JjL2lt
cG9ydC92ZW5kb3I6JHtTVEFHSU5HX0RJUl9UDQo+QVJHRVR9LyR7cHJlZml4fS9sb2NhbC9nbyIN
Cj4+ICAgICAgICAgIGV4cG9ydCBDR09fRU5BQkxFRD0iMSINCj4+IC0gICAgICAgIGV4cG9ydCBH
T0ZMQUdTPSItbW9kPXZlbmRvciINCj4+ICsgICAgICAgIGV4cG9ydCBHT0ZMQUdTPSItbW9kPXZl
bmRvciAtbW9kY2FjaGVydyINCj4+DQo+PiAgICAgICAgICBUQUdTPSJzdGF0aWNfYnVpbGQgY3Ry
ZCBub19idHJmcyBuZXRjZ28gb3N1c2VyZ28gcHJvdmlkZXJsZXNzIg0KPj4NCj4+ICAgICAgICAg
IGNkICR7U30vc3JjL2ltcG9ydA0KPj4gKyAgICAgICAgJHtHT30gbW9kIHZlbmRvciAtdiAmJiAk
e0dPfSBtb2QgdGlkeSAtdg0KPg0KPlVuZm9ydHVuYXRlbHkgLi4gbm8sIHdlIGNhbid0IHRha2Ug
dGhpcyBjaGFuZ2UuDQo+DQo+SSdtIHdvcmtpbmcgb24gYSBmdWxsIHVwZGF0ZSB0byBrM3MgaW4g
bWFzdGVyLCBhbmQgaXQgaXMgcnVubmluZyBpbnRvIHNpbWlsYXINCj5jaGFsbGVuZ2VzIGR1ZSB0
byB0aGUgcmVtb3ZhbCBvZiB2ZW5kb3IgdXBzdHJlYW0uDQo+DQpDYW4geW91IHBsZWFzZSBlbGFi
b3JhdGUgYSBiaXQgYmV0dGVyIHdoYXQgdGhlIHByb2JsZW0gaXMgYW5kIHdoeSB0aGlzIHNvbHV0
aW9uDQppcyBub3QgYXBwcm9wcmlhdGUgZm9yIHRoZSBob25pc3RlciBicmFuY2g/DQpJIGhhdmUg
bm8ga25vd2xlZGdlIGluIEdvIGJvdGggaW4gYXNwZWN0cyBvZiB0aGUgcHJvZ3JhbW1pbmcgbGFu
Z3VhZ2UgYXMgd2VsbA0KYXMgYnVpbGRpbmcuDQoNCi0tDQpEaWVnbyBTdWVpcm8gIA0KDQo+VGhl
IHNvbHV0aW9uIGlzbid0IHNpbXBsZSwgc2luY2UgaXQgaXMgc29tZXRoaW5nIHRoYXQgaGFzIHRv
IGJlIGdlbmVyaWMsIGFzIGl0DQo+YXBwbGllcyB0byBtYW55IGRpZmZlcmVudCByZWNpcGVzIGlu
IG1ldGEtdmlydHVhbGl6YXRpb24uDQo+DQo+QnJ1Y2UNCj4NCj4+ICAgICAgICAgICR7R099IGJ1
aWxkIC10YWdzICIkVEFHUyIgLWxkZmxhZ3MgIiR7R09fQlVJTERfTERGTEFHU30gLXcNCj4+IC1z
IiAtbyAuL2Rpc3QvYXJ0aWZhY3RzL2szcyAuL2NtZC9zZXJ2ZXIvbWFpbi5nbw0KPj4NCj4+ICAg
ICAgICAgICMgVXNlIFVQWCBpZiBpdCBpcyBlbmFibGVkIChhbmQgdGh1cyBleGlzdHMpIHRvIGNv
bXByZXNzDQo+PiBiaW5hcnkNCj4+IC0tDQo+PiAyLjM1LjENCj4+DQo+Pg0KPj4gLT0tPS09LT0t
PS09LT0tPS09LT0tPS0NCj4+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0
byB0aGlzIGdyb3VwLg0KPj4gVmlldy9SZXBseSBPbmxpbmUgKCM3MDU0KToNCj4+IGh0dHBzOi8v
bGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL21ldGEtdmlydHVhbGl6YXRpb24vbWVzc2FnZS83MDU0
DQo+PiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9tdC84
OTAyMzczNC8xMDUwODEwDQo+PiBHcm91cCBPd25lcjogbWV0YS12aXJ0dWFsaXphdGlvbitvd25l
ckBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+PiBVbnN1YnNjcmliZToNCj4+IGh0dHBzOi8vbGlz
dHMueW9jdG9wcm9qZWN0Lm9yZy9nL21ldGEtdmlydHVhbGl6YXRpb24vdW5zdWINCj4+IFticnVj
ZS5hc2hmaWVsZEBnbWFpbC5jb21dDQo+PiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPj4NCj4N
Cj4NCj4tLQ0KPi0gVGhvdSBzaGFsdCBub3QgZm9sbG93IHRoZSBOVUxMIHBvaW50ZXIsIGZvciBj
aGFvcyBhbmQgbWFkbmVzcyBhd2FpdCB0aGVlIGF0DQo+aXRzIGVuZA0KPi0gIlVzZSB0aGUgZm9y
Y2UgSGFycnkiIC0gR2FuZGFsZiwgU3RhciBUcmVrIElJDQo=

