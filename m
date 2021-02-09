Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.81])
 by mx.groups.io with SMTP id smtpd.web08.12778.1612887773398675181
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Feb 2021 08:22:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=HKPOUgL1;
 spf=pass (domain: arm.com, ip: 40.107.15.81, mailfrom: nathan.dunne@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNxvqaPoRsQ3OVrMRUJUcLtbxHk8CsnLoAO4oxFg3TI=;
 b=HKPOUgL1WOcjkDjHwOQcg+GduF31wvDD+a+t/f27wdeNMANlnqaDAbzGyhuTyKDl27m59ds2cRf2Yf4JsK8Uh7k9eAb2vYi7Sc/FtqWwS+qfd2eHtQfZefWQ3ZRt22B2NIkNFagcJH1XsDW3TTMQSz52vBq/1/o5HN1VetdgRqs=
Received: from AM8P191CA0018.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::23)
 by AM0PR08MB4402.eurprd08.prod.outlook.com (2603:10a6:208:147::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Tue, 9 Feb
 2021 16:22:47 +0000
Received: from AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:21a:cafe::2) by AM8P191CA0018.outlook.office365.com
 (2603:10a6:20b:21a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Tue, 9 Feb 2021 16:22:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT033.mail.protection.outlook.com (10.152.16.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 9 Feb 2021 16:22:46 +0000
Received: ("Tessian outbound 2b57fdd78668:v71"); Tue, 09 Feb 2021 16:22:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 49c58645927b6c73
X-CR-MTA-TID: 64aa7808
Received: from 6318f9d797dd.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A6A86B31-0EBA-4BFC-9E51-70A59F793DCC.1;
	Tue, 09 Feb 2021 16:22:35 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6318f9d797dd.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 09 Feb 2021 16:22:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dmi/qujC3SffudHwSCAt82LFwX+J/TC7+VO3fOVV/WSCQeRkvO1ABwpLH91zlvia43MmIeMFnVSzqxHzCeZTQHQ8PMTDrQsP8qYpTvepcXPOhKrPDNIERmLa+SmwPLkgd1iEMKGfOe1hwnS6OJx3/6SGcE+oJx/HtokfKhFs7w4dlZ3SUfju5fCGds9cxxYCCRTiTv08awRIPEHs1rPfhBRVEjKHQoKRBrqnMLqbU89wmYiDNw02YpnQ7WIN5CkXTY0baP6zJj1IDcRw4e8zq4wFG3FFvV2XxifQq3icMm5r72hODhsPrmGHcxohGevAne8Axp/29iCA/QJZDWbi0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNxvqaPoRsQ3OVrMRUJUcLtbxHk8CsnLoAO4oxFg3TI=;
 b=EQ3sSLR6Z4lTk7Py2JUjZDmfVlgk8qCrTF8ecpTaMYwONAwLfAL6Hr7adaPDyVX7Ssv0qd0U0J1HER+MivoTraDpTB18ceN4hpJhulkr2eR11X4msbUlz0c8ohLIhyaPupkY6otW9REWKgvJ2Ol26oMJxyAwARsgfcCeVV7r8pV8KqaO33rkGvHQJot5QFM5Vc+p9MPqY8/+ybjo7WteBv9gPGjO9SVp1xqRwbr/ImoSs1OV4F86w3KBVKpw9Ow8YjimLoXITubVUcjqccXzdWV9tJvkHqGV3UYBo+eofjJfEjHsd5EXzmZX/LG/UFlilfSQYg3O2WLyZpUCDUWvoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNxvqaPoRsQ3OVrMRUJUcLtbxHk8CsnLoAO4oxFg3TI=;
 b=HKPOUgL1WOcjkDjHwOQcg+GduF31wvDD+a+t/f27wdeNMANlnqaDAbzGyhuTyKDl27m59ds2cRf2Yf4JsK8Uh7k9eAb2vYi7Sc/FtqWwS+qfd2eHtQfZefWQ3ZRt22B2NIkNFagcJH1XsDW3TTMQSz52vBq/1/o5HN1VetdgRqs=
Received: from PR3PR08MB5785.eurprd08.prod.outlook.com (2603:10a6:102:89::6)
 by PA4PR08MB6031.eurprd08.prod.outlook.com (2603:10a6:102:f1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Tue, 9 Feb
 2021 16:22:33 +0000
Received: from PR3PR08MB5785.eurprd08.prod.outlook.com
 ([fe80::bcc6:8156:81ed:f465]) by PR3PR08MB5785.eurprd08.prod.outlook.com
 ([fe80::bcc6:8156:81ed:f465%7]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 16:22:33 +0000
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
CC: Diego Sueiro <Diego.Sueiro@arm.com>, nd <nd@arm.com>
Subject: Importing Docker Images
Thread-Topic: Importing Docker Images
Thread-Index: AQHW/v+04HGNim3J5kWhiqyPLtwjRg==
Date: Tue, 9 Feb 2021 16:22:33 +0000
Message-ID: 
 <PR3PR08MB5785F492BD5994B7E472DFD18D8E9@PR3PR08MB5785.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 92208cdb-0308-4f51-f2b9-08d8cd16efd4
x-ms-traffictypediagnostic: PA4PR08MB6031:|AM0PR08MB4402:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB4402B16C50427FB941312A098D8E9@AM0PR08MB4402.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 rNTUw9D8M/YFThlqW7OHfICYB0AF7EHUuZTjCYgjPMp7NjJQpLYMOwlnm2QNfcruaKUBt/Esjtl/K9T84Xp6B57Xvo0UXYKW5xjrQkRpLgw+n1IbkxaZ34pSuSElv5Ev4c9Z6yg+kj6STgAuO4RFTYI/r7zGn7A0SpW6fJEfcQvn9KBjomF4R6dGe9UAhMMeDZK7x+srj6sI/6jIBKnbD2Qw32MzKaO08T/SQljrRoFGG6IQP3llIfL/q90OImGNfrmsdh+FtJJ4Lzo6rfItAMZJSjFexTu43JVypo0T8rv3EzozOSptvuAj6vzeV8pUcLCqlNOEjKiCuUzvOf01Ioiz9gdVutfmXQvfXNVMMGJRQptsfIHmMNpUgC0vTqv+VorN6qKWwFL1msil4HIj7xHWx5aOjqeiwiU8xlT91Rkm11Mk+NdgvHpp39m5+z4rulJ8+eXp0NrsA1g6aaghtmbRKi31bhI5L43l/zol4KP7gdnzrDrDsH7Iq6mIP9hNZkC09NXTajZxUb2rQZRL4iDTPDa5LFQIsM5iZ3vglK6+7cQxhOqK1NseRZY9jnT2OmtFFoj+n9oUIi1WF/KOQnHFDQ0nqqFtuOL2LWdX6fw=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5785.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(4744005)(3480700007)(19627405001)(7696005)(186003)(6916009)(4326008)(478600001)(55016002)(52536014)(26005)(966005)(2906002)(6506007)(9686003)(316002)(91956017)(5660300002)(64756008)(66446008)(54906003)(66556008)(66476007)(66946007)(8676002)(8936002)(71200400001)(86362001)(7116003)(76116006)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?bV1UTStnz+hcXyYkDu/Nizm5PdZYCk6G7gTJbFQ42U3lpPo77Zhdx9Bu8L?=
 =?iso-8859-1?Q?o7w6XuxIbSscd/P4hcU8M0sSRTPm3+FezfzpIRD49EBs1IDF55n9OBiOOi?=
 =?iso-8859-1?Q?2E1VpO1pxfpTrCBCSMtNzjZMVoE/HGeeQkPXu5hcGiIhwm+uK0yrMfChT5?=
 =?iso-8859-1?Q?OdywIk6E3P66It5lJQDKxRQ9hCkEtNjSj1AnNBNS8Bq7FCaG8nGn9QP2ZZ?=
 =?iso-8859-1?Q?ytQWUBTbGjtfzpie7Hj9Ls/zEOcEgXmOpbzZalj1/Ut+JtoHsFnbhWaksg?=
 =?iso-8859-1?Q?yw/WXGawQdepr9VtN1sSiNm1DPZvfi6LJUjSh1bXBFoV7mT0JfdS0BnQ98?=
 =?iso-8859-1?Q?2cD1JFKRrpX5wOhxpxZ7ImWWYanMa56F6s54zW60ShFRriNCilZK9BfI9O?=
 =?iso-8859-1?Q?q+IpA2uQFusfF8BKefPARP/v4fvcjEpdIissxRhXt+QSTBePGi4shsd05Z?=
 =?iso-8859-1?Q?eA+UkoscLaXJbhfft6ijr+Gxxjddnn7hm6+j6R9a2F8es4qDW/oknas6H6?=
 =?iso-8859-1?Q?qjDLVEx0jROWB0s21Yej6qOpGWoeK2WuXn6p/ITpfgoHLr3WfQvqcDEoC7?=
 =?iso-8859-1?Q?N5a1xYm7KwygWI/N1egLt2+gn9lp5QOTn3wrcE/G8fpS63wKm/CPJ9gdTK?=
 =?iso-8859-1?Q?MNoACdnyHdxp8S2zFy3MPBu8AS+iTjiDPHJmPdMYCZCltTjGyhXQ7j0tFl?=
 =?iso-8859-1?Q?3p3ULeNO7L2v5gN4OdotsNCvTN+Rwo8WkKIdJKWCntTM+I9bEwrfyQGgau?=
 =?iso-8859-1?Q?hlfmlSkm9g5kHatFtzAhMEYmmiTekj//4BkDLf+k0/etdy0IeXmZ9GELWo?=
 =?iso-8859-1?Q?38/h3VGDNqNxAmXhV8fsPhifneBc6GfApHhwkINbcVvMVeTT41ozP2Eu+I?=
 =?iso-8859-1?Q?WH2be7esQ9a6DUDPExuzAan3ucrSY47sko737gvfEYXpQZX7ioCEz+zKVy?=
 =?iso-8859-1?Q?MyVw+HGm4LEjbaAjT+Lpwgp/Q+B+aZKnQo/gUILZI/AquvbXd+Le1gFoMG?=
 =?iso-8859-1?Q?dnNwpI1QWtxYQk/DDmYoC7aMcUQfgSDLqLHgjWCTKj6HtE2MzvLx0rshM3?=
 =?iso-8859-1?Q?WJlhkIj7W05eFWdJDiFfkw4Q3iZj30eOGmAygzl15L7BTlH2YqP1WrpyYM?=
 =?iso-8859-1?Q?TP+vcfy2EOA4EJ0ZejgxOFoc30s5EOfsdIVKVa1NQRyjLedij52y1zPp+r?=
 =?iso-8859-1?Q?W2yrmxP3rffbyFy9Lorz6ElrJGByeZOUQuxGQXozUtr7GWw2uwhAazcqL9?=
 =?iso-8859-1?Q?tztme80Yekx4b7lAe9qeKTR67EMSzG/d4wDOP6dxXlKttP8BsOJue3cwc0?=
 =?iso-8859-1?Q?FVnAZOYblRbza6LURlVD77AAwwgGrFvyqqCVTN4dZiV3u/KChxt9Ia5Fwe?=
 =?iso-8859-1?Q?VZTpzlywNm?=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6031
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Nathan.Dunne@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2795cefc-297a-490d-1492-08d8cd16e7a0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cUstBBzo59BkrzafN3DhHuxPsnaRd2rbL8sgg9z6AgkglDb/+HGTS1isOpgtdMj9GU69LxEEMANFSOY80R689eqlKUhEd9WwxtAwDuvMeOSGiqV7lYpqnbW3NlZzUL3uXAFG1dptOwBniIFXKS/mnmCpI0wa9+IZHpkEXCHr/2d05XCUnZf0K06pz2P7spcjmqIuejTke2TM/C0TdeSniqenO4/GWEyYQXE6uwCNhUVLOhPx9nndW1C2H93kKuelYWZ13ydW23Zb0BuU7TRY2dplWpWpeVmGAuBSuaSmdO8Szj2Ar8dz+iC/bjW6EaJoZW9L2ZDbhmFStC5AqfR3lLjzNcmciThfb5/X/eO7BEtOUtC0QiNZydiphsuMsgjplblG0J1gmgAxm8Ryj4hlESILyHc+IIAT05dvooAVH3rRKLW0I1mQnIWFvF6Rf5VkJ8/N1G0jRgfI5e97T6TsdSipF1vhdWPrOYFwhAo9IwmfEgRQg/PnYyZXzrQ0OdnqX5fQsxQgcF7r7SAv5eVWY/ddDmMj3pqmKuzT1NuJ2OKlZWF18cFXjOStWxRTSNo8YF1z9Ii/rxsrRAY1hELV+8paaTXOGOsLToh7+XCRaru33mOhQ+24a2uZVmC3lmlSk9stFeUTs6FlO99DJwGmyInZMe+jMeNur4HfmAYcDyjNMr95Go+O6mjloNEAHajttWUCp/hAtgbGGuAE+FbSubbPp7e5k2lYy81xIa8CaG0=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(346002)(396003)(46966006)(36840700001)(82310400003)(4326008)(82740400003)(36860700001)(47076005)(33656002)(8676002)(3480700007)(2906002)(7116003)(6916009)(966005)(86362001)(9686003)(478600001)(54906003)(316002)(186003)(26005)(70586007)(70206006)(55016002)(336012)(6506007)(7696005)(356005)(81166007)(5660300002)(19627405001)(8936002)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 16:22:46.8970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92208cdb-0308-4f51-f2b9-08d8cd16efd4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4402
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_PR3PR08MB5785F492BD5994B7E472DFD18D8E9PR3PR08MB5785eurp_"

--_000_PR3PR08MB5785F492BD5994B7E472DFD18D8E9PR3PR08MB5785eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I am looking for some community feedback on whether it would make sense to =
add support in meta-virtualization for including custom docker container im=
age tarballs. These container image tarballs would have been generated manu=
ally by using a "docker export" command.

Currently in meta-arm-autonomy we have:
https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/meta-arm-autonomy/=
recipes-containers/import-docker-image
Which allows a single image file to be included, then imported at boot time=
. I am currently extending this to allow a list of image files rather than =
only one, and to use docker-compose for easier control of multiple containe=
rs. This could live in meta-virtualization rather than meta-arm-autonomy if=
 the community believes this a good idea.

Let me know what you think,
Nathan

--_000_PR3PR08MB5785F492BD5994B7E472DFD18D8E9PR3PR08MB5785eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div>Hi,</div>
<div><br>
</div>
<div>I am looking for some community feedback on whether it would make sens=
e to add support in meta-virtualization for including custom docker contain=
er image tarballs. These container image tarballs would have been generated=
 manually by using a &quot;docker export&quot;
 command.<br>
</div>
<div><br>
</div>
<div>Currently in meta-arm-autonomy we have:<br>
</div>
<div>https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/meta-arm-auto=
nomy/recipes-containers/import-docker-image<br>
</div>
<div>Which allows a single image file to be included, then imported at boot=
 time. I am currently extending this to allow a list of image files rather =
than only one, and to use docker-compose for easier control of multiple con=
tainers. This could live in meta-virtualization
 rather than meta-arm-autonomy if the community believes this a good idea.<=
br>
</div>
<div><br>
</div>
<div>Let me know what you think,<br>
</div>
<span>Nathan</span><br>
</div>
</body>
</html>

--_000_PR3PR08MB5785F492BD5994B7E472DFD18D8E9PR3PR08MB5785eurp_--
