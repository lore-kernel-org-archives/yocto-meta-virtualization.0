Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.24338.1604990623738360294
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 22:43:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=tauzvc98;
 spf=fail (domain: arm.com, ip: 198.145.29.25, mailfrom: lance.yang@arm.com)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00088.outbound.protection.outlook.com [40.107.0.88])
	by mail.yoctoproject.org (Postfix) with ESMTPS id AA01C38C06E0
	for <meta-virtualization@yoctoproject.org>; Mon,  9 Nov 2020 22:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3trLUTfCxE/qqQIA7RTsT/ytO+1oMIaeQsR3H4lgya8=;
 b=tauzvc98VzjkeDge74Rfur45+tPeZzdHw5xKQ2iZ8Gjzq+b7jWaVGOb3J4C0wTR1VQLik1zyHDaZESZHIeOUcSDV6MGl1cKJLva+qszchqGInJP+t/chvIvCTV2RULqVl/dDbqUB953fUbe7I/8CecntOAyc6XJIJgTgsNchiuE=
Received: from MR2P264CA0187.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::26) by
 AM6PR08MB3109.eurprd08.prod.outlook.com (2603:10a6:209:4c::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.22; Tue, 10 Nov 2020 06:43:39 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:501:0:cafe::16) by MR2P264CA0187.outlook.office365.com
 (2603:10a6:501::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Tue, 10 Nov 2020 06:43:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; yoctoproject.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;yoctoproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Tue, 10 Nov 2020 06:43:38 +0000
Received: ("Tessian outbound 814be617737e:v71"); Tue, 10 Nov 2020 06:43:38 +0000
X-CR-MTA-TID: 64aa7808
Received: from 9b44bc077783.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0183EF01-99C7-4380-BE7B-5B140083124C.1;
	Tue, 10 Nov 2020 06:43:33 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9b44bc077783.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 10 Nov 2020 06:43:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TDHnmBBir0UPnkQ7eqUYnhk3tZP2/HpIiNNDA1hnQi48m1Amgb3Hbta53++eZASGporrJrteiMki1XRrgdrIFGhpwT9q6Is4Mk+p6h62o6r+vr++Jd8mooHh3XTu7HZYfGQTZGPY+pwx2sj/ACXwCgE4se5tUTuqu+QyCQ85gh9r8tTtrr3CgHL4c7VvMbnYWKpERzPZhr2fKlNuBj8IHrAE8woRhyfLyVsWlgLl5NORkLOm/V/WQBnqhgkd4mvENWfVfvVrYJyk6vHWUc1gcEvfPEwbNzLdW/KKMB47MfpXYBX/jAJY9MP5qE0+EKKq1/ChrU4mNmj3eLl5J7FXCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3trLUTfCxE/qqQIA7RTsT/ytO+1oMIaeQsR3H4lgya8=;
 b=fcoLjkh2qqdA3UMJ6BZ3a+OGty3AeYJ4L9yAC+5zoffr0kF+dSFKO4NpcxaHeHM1I46SsWu+2dy7zMCycRhyN9zhCp78zQqqVf6lNQijIQr4dPf6WNgbhDGPbD5Ye8lh+zYiv4n5tFEb8uTDtZ0nRka3uKRF6shV6j7BFvJjWm1RozYT/8qi2e3oFKz6WCJcp3CLnbNYRm7/ol+CTco9MkEG5nqxWeoiYdbPtDoBslytgKHQ9jFWhz9coo4n8OqJQ2Dfhxq7mwTiUnuK5ykWYEC/C/s8ntC3CQ3TRPeap5fvi07PLLVd1hEdpEF/KKYZmaMDN5NLLkX42vIVTxTItg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3trLUTfCxE/qqQIA7RTsT/ytO+1oMIaeQsR3H4lgya8=;
 b=tauzvc98VzjkeDge74Rfur45+tPeZzdHw5xKQ2iZ8Gjzq+b7jWaVGOb3J4C0wTR1VQLik1zyHDaZESZHIeOUcSDV6MGl1cKJLva+qszchqGInJP+t/chvIvCTV2RULqVl/dDbqUB953fUbe7I/8CecntOAyc6XJIJgTgsNchiuE=
Received: from DBBPR08MB4725.eurprd08.prod.outlook.com (2603:10a6:10:f5::10)
 by DBAPR08MB5573.eurprd08.prod.outlook.com (2603:10a6:10:1a2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.24; Tue, 10 Nov
 2020 06:43:31 +0000
Received: from DBBPR08MB4725.eurprd08.prod.outlook.com
 ([fe80::d1a0:9ad4:b50f:9a84]) by DBBPR08MB4725.eurprd08.prod.outlook.com
 ([fe80::d1a0:9ad4:b50f:9a84%6]) with mapi id 15.20.3541.024; Tue, 10 Nov 2020
 06:43:30 +0000
From: "Lance Yang" <Lance.Yang@arm.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>, Joakim Roubert
	<joakim.roubert@axis.com>
CC: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, Michael Zhao <Michael.Zhao@arm.com>,
	Kaly Xin <Kaly.Xin@arm.com>
Subject: Re: [meta-virtualization][PATCH v5] Adding k3s recipe
Thread-Topic: [meta-virtualization][PATCH v5] Adding k3s recipe
Thread-Index: AQHWq69fcPQ8C1m0vkKsSMY3RAelSKnA/LdQ
Date: Tue, 10 Nov 2020 06:43:30 +0000
Message-ID: 
 <DBBPR08MB4725E54DC414E2CBE8E84D0D91E90@DBBPR08MB4725.eurprd08.prod.outlook.com>
References: 
 <CADkTA4NUDHVRiSRHoUU=Ci8of0_J5C+pM7MVwOSopQ9F_yBTBw@mail.gmail.com>
 <20201020111434.17993-1-joakimr@axis.com> <20201021031033.GA20764@gmail.com>
 <e18fb481-4206-2b32-3f31-1e0aace470dc@axis.com>
 <CADkTA4M3HT9HuENi9m2x4v9SXa=28a75BYqhbRhFGDoPSeoTVg@mail.gmail.com>
In-Reply-To: 
 <CADkTA4M3HT9HuENi9m2x4v9SXa=28a75BYqhbRhFGDoPSeoTVg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 44E893313E693F47BC4B8DE8366D31F1.0
x-checkrecipientchecked: true
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [103.73.66.85]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2b0e6344-95a2-49c2-62b2-08d88543f4a7
x-ms-traffictypediagnostic: DBAPR08MB5573:|AM6PR08MB3109:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB31097FF79C77AFC152ECEDC491E90@AM6PR08MB3109.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 t9AUq6r9OuD+y2RFuhxLkYxA08hkNV7PrUdi58eYMmyGs7UhTYn4LRr7YKxXSA9E2B65mVN61NKu2WABfvQ1I6XA7Of1C/FxIYFZDliraO6W8T3eObyiRjwvMIlN+AAdrN4jmj7bsRLG6u/UzPHEBq3ZgUrKOf/1/g3NOqJFJ+iwZXLb9r+8+u25iPKHsFaC7OqdlMzGGWXbCegOjKzg3M6HB6AK/4aSbUMflvXncgNfVc1SCTkd4DCrYvBQXsgnYw8vACe9Nvgnv9U7d/wRS/62ByIYThS78ojxpKmL6R7OeEN9CDPYoNmj7+K2M3X+3ZlEWLKhWTeYFojbj9INPzuhH8UBrzxoZbbYhPRlhKUtZaIvh647Od7FDDKmvoMfcGmAnnZzfNv4QoqNhHM4P4zzIOQ3DNgPBZmujpLh4qhIhsS+8vZk/mhhHdX7cm65g+u5zbTq6iQsNDCh85rh6A==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4725.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(8676002)(15974865002)(7696005)(52536014)(4001150100001)(76116006)(53546011)(71200400001)(6506007)(316002)(4326008)(86362001)(5660300002)(2906002)(83380400001)(66946007)(66446008)(66476007)(64756008)(66556008)(8936002)(66574015)(966005)(478600001)(110136005)(26005)(33656002)(9686003)(54906003)(55016002)(186003)(42413003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 wyV6RyQL4nHn8gMhYFvVhT9SNMjiXaTAtTLjXj5qGv/Sm6C9Bu119kIDMC3UyG/DcEej6SZs14eaVes24ce+Dw/Gj3yiMzzTHuTRciTCz0td1ywdyyQD8LM05neZqaSlJZOKM1GT3G1VoHU6rQmQ3Zi0BKlONzdFRodnmOrwyezY3cUJyapf8jPfCn3sokDlMwFsmkrTRB7IUTzdJ53F1vbrhWnTCMrPJwHTgEmy67jQmLfPdY5AlmOebyO/R7hYsYJd2L2ph237WLP2KwCt4gemh1zFShKNy8unQrdhqGNptKgIAhKwxWnyrbqfXta2WFSnWPVvJMUkjWs8m1Sa0IxQVoUZpJ1764VjC9y31TVorBySpTpCHInt++p0HInmG7zjkahJzs4pr69CKxvu2VReYVDBjizqNHAmDKGz9W05VhzmEcJDXLrgj5mibY9Pvn2ZB0PI9nYcOWj7IsjjOjSLhf6GKYQipHE/d27FlEGad87NoOf3anbZ0iJO1tDtVQwoblCwPKnFe+aqn27A2xMRGoHMdM1C/3vSrwiAYK7iw+wjQ3nSEVyKkjBJuS8QVflw+JDpn9d2XRZLkzCR13P8ml8t9fzmoZI+4iy4rf9U4NvpusTvgpRONct1CLPir0ZZ5gX0fOOxLRzPhzEknw==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5573
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ed26438a-c4ce-4a91-109b-08d88543f005
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	85H0ZkMZ/mEdVudgFy68dDzXdkcA6hX2cyLt8k64q5+oavFvk5Cn3evcAq1NZ+Ytp9uzczYNJzJlSNuCk+JRPVaFTe3R+u0G4fk040Ojud+cmsf9ujd2yx5kYqFcex0ybimf1/BvFPO6Ykv64wwbrP+GfcxkBFpcolzo21CsD4llEecJ5cuoOD1tJ0h9KgmFvvXRtvxbSOzTlW4l2cSh9w3tvSfQXjXdqlmQkMndgzjmxiNGatt/Dw1nelzdKtVE5zFo9gJo7fN8c22Hjt78V/T9+LAYGxzu814Lvwb7vWQsKjttVaRl+5R5Vg0zT/RzoQB7xuzsf5Jt4xWFNvP2gj4u7A0MuaDkt7ay0BeamaWFtHDobl68FAw5Bka7QLBh3byL/BDAQ1TNDa5xOgEh+kQfuvbpY2XkkkYT+bRkXS4Gf6QRrCKNI6YeAJIjdLdgAh0WAR4PeM+oi7Ihav5ID9KWfQS6iyrgYkJkRlNtTGL5tLcJdPGg7g5F5FeXsNzQ
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(46966005)(186003)(478600001)(26005)(9686003)(966005)(336012)(8936002)(33656002)(81166007)(86362001)(7696005)(8676002)(6506007)(82740400003)(53546011)(4001150100001)(356005)(47076004)(54906003)(110136005)(36906005)(15974865002)(52536014)(82310400003)(316002)(70586007)(66574015)(4326008)(70206006)(2906002)(5660300002)(83380400001)(55016002)(42413003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 06:43:38.5149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b0e6344-95a2-49c2-62b2-08d88543f4a7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3109
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQnJ1Y2UgYW5kIEpvYWtpbSwNCg0KVGhhbmtzIGZvciBzaGFyaW5nIHRoaXMgYnJhbmNoOiBr
M3Mtd2lwLiBJIGhhdmUgdGVzdGVkIGFnYWluc3QgbXkgeW9jdG8gYnVpbGQuDQoNCk15IEltYWdl
OiBMaW51eCBxZW11YXJtNjQgYnkgeW9jdG8uDQoNClRoZSBtYXN0ZXIgbm9kZSBjYW4gYmUgcmVh
ZHkgYWZ0ZXIgSSBzdGFydGVkIHRoZSBrM3Mgc2VydmVyLiBIb3dldmVyLCB0aGUgcG9kcyBpbiBr
dWJlLXN5c3RlbSAod2hpY2ggYXJlIGVzc2VudGlhbCBjb21wb25lbnRzIGZvciBrM3MpIGNhbm5v
dCB0dXJuIHRvIHJlYWR5IHN0YXRlIG9uIHFlbXVhcm02NC4NCg0KQWZ0ZXIgdGhlIG1hc3RlciBu
b2RlIGl0c2VsZiB0dXJuZWQgdG8gcmVhZHkgc3RhdGUsIEkgY2hlY2sgdGhlIHBvZHMgd2l0aCBr
dWJlY3RsOg0KDQprdWJlY3RsIGdldCBub2Rlcw0KTkFNRSAgICAgICAgU1RBVFVTICAgUk9MRVMg
ICAgQUdFICAgVkVSU0lPTg0KcWVtdWFybTY0ICAgUmVhZHkgICAgbWFzdGVyICAgMTFtICAgdjEu
MTguOS1rM3MxDQpyb290QHFlbXVhcm02NDp+IyBscw0Kcm9vdEBxZW11YXJtNjQ6fiMga3ViZWN0
bCBnZXQgcG9kcyAtbiBrdWJlLXN5c3RlbQ0KTkFNRSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBSRUFEWSAgIFNUQVRVUyAgICAgICAgICAgICAgUkVTVEFSVFMgICBBR0UNCmxv
Y2FsLXBhdGgtcHJvdmlzaW9uZXItNmQ1OWY0N2M3LXh4dmJsICAgMC8xICAgICBDb250YWluZXJD
cmVhdGluZyAgIDAgICAgICAgICAgMTJtDQpjb3JlZG5zLTc5NDRjNjZkOGQtdGxybTkgICAgICAg
ICAgICAgICAgIDAvMSAgICAgQ29udGFpbmVyQ3JlYXRpbmcgICAwICAgICAgICAgIDEybQ0KbWV0
cmljcy1zZXJ2ZXItNzU2NmQ1OTZjOC1zdmtmZiAgICAgICAgICAwLzEgICAgIENvbnRhaW5lckNy
ZWF0aW5nICAgMCAgICAgICAgICAxMm0NCmhlbG0taW5zdGFsbC10cmFlZmlrLXM4cDVnICAgICAg
ICAgICAgICAgMC8xICAgICBDb250YWluZXJDcmVhdGluZyAgIDAgICAgICAgICAgMTJtDQoNClRo
ZW4gSSBkZXNjcmliZSB0aGUgcG9kcyB3aXRoOg0KDQpFdmVudHM6DQogIFR5cGUgICAgIFJlYXNv
biAgICAgICBBZ2UgICAgICAgICAgICAgICAgICBGcm9tICAgICAgICAgICAgICAgTWVzc2FnZQ0K
ICAtLS0tICAgICAtLS0tLS0gICAgICAgLS0tLSAgICAgICAgICAgICAgICAgLS0tLSAgICAgICAg
ICAgICAgIC0tLS0tLS0NCiAgTm9ybWFsICAgU2NoZWR1bGVkICAgIDE2bSAgICAgICAgICAgICAg
ICAgIGRlZmF1bHQtc2NoZWR1bGVyICBTdWNjZXNzZnVsbHkgYXNzaWduZWQga3ViZS1zeXN0ZW0v
Y29yZWRucy03OTQ0YzY2ZDhkLXRscm05IHRvIHFlbXVhcm02NA0KICBXYXJuaW5nICBGYWlsZWRN
b3VudCAgNW0yM3MgKHgzIG92ZXIgMTRtKSAga3ViZWxldCAgICAgICAgICAgIFVuYWJsZSB0byBh
dHRhY2ggb3IgbW91bnQgdm9sdW1lczogdW5tb3VudGVkIHZvbHVtZXM9W2NvcmVkbnMtdG9rZW4t
YjdubGhdLCB1bmF0dGFjaGVkIHZvbHVtZXM9W2NvcmVkbnMtdG9rZW4tYjdubGggY29uZmlnLXZv
bHVtZV06IHRpbWVkIG91dCB3YWl0aW5nIGZvciB0aGUgY29uZGl0aW9uDQogIFdhcm5pbmcgIEZh
aWxlZE1vdW50ICA1MHMgKHg0IG92ZXIgMTJtKSAgICBrdWJlbGV0ICAgICAgICAgICAgVW5hYmxl
IHRvIGF0dGFjaCBvciBtb3VudCB2b2x1bWVzOiB1bm1vdW50ZWQgdm9sdW1lcz1bY29yZWRucy10
b2tlbi1iN25saF0sIHVuYXR0YWNoZWQgdm9sdW1lcz1bY29uZmlnLXZvbHVtZSBjb3JlZG5zLXRv
a2VuLWI3bmxoXTogdGltZWQgb3V0IHdhaXRpbmcgZm9yIHRoZSBjb25kaXRpb24NCiAgV2Fybmlu
ZyAgRmFpbGVkTW91bnQgIDExcyAoeDE2IG92ZXIgMTZtKSAgIGt1YmVsZXQgICAgICAgICAgICBN
b3VudFZvbHVtZS5TZXRVcCBmYWlsZWQgZm9yIHZvbHVtZSAiY29yZWRucy10b2tlbi1iN25saCIg
OiBtb3VudCBmYWlsZWQ6IGV4ZWM6ICJtb3VudCI6IGV4ZWN1dGFibGUgZmlsZSBub3QgZm91bmQg
aW4gJFBBVEgNCg0KSSBmb3VuZCB0aGUgIm1vdW50IiBiaW5hcnkgaXMgbm90IGZvdW5kIGluICRQ
QVRILiBIb3dldmVyLCBJIGNvbmZpcm1lZCB0aGUgJFBBVEggYW5kIG1vdW50IGJpbmFyeSBvbiBt
eSBxZW11YXJtNjQgaW1hZ2U6DQoNCnJvb3RAcWVtdWFybTY0On4jIGVjaG8gJFBBVEgNCi91c3Iv
bG9jYWwvYmluOi91c3IvYmluOi9iaW46L3Vzci9sb2NhbC9zYmluOi91c3Ivc2Jpbjovc2Jpbg0K
cm9vdEBxZW11YXJtNjQ6fiMgd2hpY2ggbW91bnQNCi9iaW4vbW91bnQNCg0KV2hlbiBJIHR5cGUg
bW91bnQgY29tbWFuZCwgaXQgd29ya2VkIGZpbmU6DQoNCi9kZXYvcm9vdCBvbiAvIHR5cGUgZXh0
NCAocncscmVsYXRpbWUpDQpkZXZ0bXBmcyBvbiAvZGV2IHR5cGUgZGV2dG1wZnMgKHJ3LHJlbGF0
aW1lLHNpemU9MjAxNjIxMmssbnJfaW5vZGVzPTUwNDA1Myxtb2RlPTc1NSkNCnByb2Mgb24gL3By
b2MgdHlwZSBwcm9jIChydyxyZWxhdGltZSkNCnN5c2ZzIG9uIC9zeXMgdHlwZSBzeXNmcyAocncs
cmVsYXRpbWUpDQpkZWJ1Z2ZzIG9uIC9zeXMva2VybmVsL2RlYnVnIHR5cGUgZGVidWdmcyAocncs
cmVsYXRpbWUpDQp0bXBmcyBvbiAvcnVuIHR5cGUgdG1wZnMgKHJ3LG5vc3VpZCxub2Rldixtb2Rl
PTc1NSkNCi4uLg0KLi4uIChza2lwcGVkIHRoZSB2ZXJib3NlIG91dHB1dCkNCg0KSSB3b3VsZCBs
aWtlIHRvIGtub3cgd2hldGhlciB5b3UgaGF2ZSBtZXQgdGhpcyAibW91bnQiIGlzc3VlIGV2ZXI/
DQoNCkJlc3QgUmVnYXJkcywNCkxhbmNlDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gRnJvbTogbWV0YS12aXJ0dWFsaXphdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxtZXRh
LXZpcnR1YWxpemF0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+DQo+IE9uIEJlaGFsZiBPZiBC
cnVjZSBBc2hmaWVsZCB2aWEgbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBTZW50OiBNb25kYXks
IE9jdG9iZXIgMjYsIDIwMjAgMTE6NDYgUE0NCj4gVG86IEpvYWtpbSBSb3ViZXJ0IDxqb2FraW0u
cm91YmVydEBheGlzLmNvbT4NCj4gQ2M6IG1ldGEtdmlydHVhbGl6YXRpb25AeW9jdG9wcm9qZWN0
Lm9yZw0KPiBTdWJqZWN0OiBSZTogW21ldGEtdmlydHVhbGl6YXRpb25dW1BBVENIIHY1XSBBZGRp
bmcgazNzIHJlY2lwZQ0KPg0KPiBPbiBXZWQsIE9jdCAyMSwgMjAyMCBhdCAyOjAwIEFNIEpvYWtp
bSBSb3ViZXJ0IDxqb2FraW0ucm91YmVydEBheGlzLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBPbiAy
MDIwLTEwLTIxIDA1OjEwLCBCcnVjZSBBc2hmaWVsZCB3cm90ZToNCj4gPiA+IEhhISEhIQ0KPiA+
ID4NCj4gPiA+IFRoaXMgYXBwbGllcy4NCj4gPg0KPiA+IFdvbmRlcmZ1bCwgdGhhbmsgeW91ISBJ
IGd1ZXNzIHRoaXMgaXMgd2hhdCBpcyBjYWxsZWQgImZpdmUgdGltZXMgbHVja3kiLi4uDQo+ID4N
Cj4gPiA+IEknbSBub3cgdGVzdGluZyBhbmQgY29tcGxldGluZyBzb21lIG9mIG15IG5ldHdvcmtp
bmcgZmFjdG9yaW5nLCBhcw0KPiA+ID4gd2VsbCBhcyBpbXBvcnRpbmcgLyBmb3JraW5nIHNvbWUg
cmVjaXBlcyB0byBhdm9pZCBleHRyYSBsYXllcg0KPiA+ID4gZGVwZW5kcy4NCj4gPg0KPiA+IEV4
Y2VsbGVudCENCj4NCj4gSSd2ZSBwdXNoZWQgc29tZSBvZiBteSBXSVAgdG86DQo+IGh0dHBzOi8v
Z2l0LnlvY3RvcHJvamVjdC5vcmcvY2dpdC9jZ2l0LmNnaS9tZXRhLXZpcnR1YWxpemF0aW9uL2xv
Zy8/aD1rM3Mtd2lwDQo+DQo+IFRoYXQgaW5jbHVkZXMgdGhlIHNwbGl0IG9mIHRoZSBuZXR3b3Jr
aW5nLCB0aGUgaW1wb3J0IG9mIHNvbWUgb2YgdGhlIGRlcGVuZGVuY2llcyBhbmQgc29tZQ0KPiBz
bWFsbCB0d2Vha3MgSSdtIHdvcmtpbmcgb24uDQo+DQo+IEkgZGlkIGhhdmUgYSBjb3VwbGUgb2Yg
cXVlc3Rpb25zIG9uIHRoZSBrM3MgcGFja2FnaW5nIGl0c2VsZiwgSSB3YXMgZ2V0dGluZyB0aGUg
Zm9sbG93aW5nDQo+IGVycm9yOg0KPg0KPiBFUlJPUjogazNzLXYxLjE4LjkrazNzMS1kaXJ0eS1y
MCBkb19wYWNrYWdlOiBRQSBJc3N1ZTogazNzOg0KPiBGaWxlcy9kaXJlY3RvcmllcyB3ZXJlIGlu
c3RhbGxlZCBidXQgbm90IHNoaXBwZWQgaW4gYW55IHBhY2thZ2U6DQo+ICAgL3Vzci9sb2NhbC9i
aW4vazNzLWNsZWFuDQo+ICAgL3Vzci9sb2NhbC9iaW4vY3JpY3RsDQo+ICAgL3Vzci9sb2NhbC9i
aW4va3ViZWN0bA0KPiAgIC91c3IvbG9jYWwvYmluL2szcw0KPg0KPiBTbyBJIGFkZGVkIHRoZW0g
dG8gdGhlIEZJTEVTIG9mIHRoZSBrM3MgcGFja2FnZSBpdHNlbGYgKHNvIGJvdGggazNzLXNlcnZl
ciBhbmQgazNzLWFnZW50IHdpbGwgZ2V0DQo+IHRoZW0pLCBpcyB0aGF0IHRoZSBzcGxpdCB5b3Ug
d2VyZSBsb29raW5nIGZvciA/DQo+DQo+IEJydWNlDQo+DQo+ID4NCj4gPiBCUiwNCj4gPg0KPiA+
IC9Kb2FraW0NCj4gPiAtLQ0KPiA+IEpvYWtpbSBSb3ViZXJ0DQo+ID4gU2VuaW9yIEVuZ2luZWVy
DQo+ID4NCj4gPiBBeGlzIENvbW11bmljYXRpb25zIEFCDQo+ID4gRW1kYWxhdsOkZ2VuIDE0LCBT
RS0yMjMgNjkgTHVuZCwgU3dlZGVuDQo+ID4gVGVsOiArNDYgNDYgMjcyIDE4IDAwLCBUZWwgKGRp
cmVjdCk6ICs0NiA0NiAyNzIgMjcgNDgNCj4gPiBGYXg6ICs0NiA0NiAxMyA2MSAzMCwgd3d3LmF4
aXMuY29tDQo+ID4NCj4gLS0NCj4gLSBUaG91IHNoYWx0IG5vdCBmb2xsb3cgdGhlIE5VTEwgcG9p
bnRlciwgZm9yIGNoYW9zIGFuZCBtYWRuZXNzIGF3YWl0IHRoZWUgYXQgaXRzIGVuZA0KPiAtICJV
c2UgdGhlIGZvcmNlIEhhcnJ5IiAtIEdhbmRhbGYsIFN0YXIgVHJlayBJSQ0KSU1QT1JUQU5UIE5P
VElDRTogVGhlIGNvbnRlbnRzIG9mIHRoaXMgZW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBhcmUg
Y29uZmlkZW50aWFsIGFuZCBtYXkgYWxzbyBiZSBwcml2aWxlZ2VkLiBJZiB5b3UgYXJlIG5vdCB0
aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRl
bHkgYW5kIGRvIG5vdCBkaXNjbG9zZSB0aGUgY29udGVudHMgdG8gYW55IG90aGVyIHBlcnNvbiwg
dXNlIGl0IGZvciBhbnkgcHVycG9zZSwgb3Igc3RvcmUgb3IgY29weSB0aGUgaW5mb3JtYXRpb24g
aW4gYW55IG1lZGl1bS4gVGhhbmsgeW91Lg0K
