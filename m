Return-Path: <vasileios.anagnostopoulos@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC3A4C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 07:15:28 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.81])
 by mx.groups.io with SMTP id smtpd.web12.16941.1658906125181249686
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 Jul 2022 00:15:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=YdUxBf0G;
 spf=pass (domain: siemens.com, ip: 40.107.8.81,
 mailfrom: vasileios.anagnostopoulos@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3yTpfcQtw1xGEP7/hwt5R3uKeU594jzNVTl2jrJTF2RCjtqB/CCg/7WBGaK1XbCcMKWNPxafcNRYsdi8oH62oDA6GL3xscW7UbpIZenXWg74VIqbCVLtsvrkYoy+yTn7Sb+vDBtRpFsJ53VYdzpAg78Ja/IR6Nq967863+Htgqar8D5Tc9ffY+0JMkhFRIzllV4o9g1vSPUOPct17LvvMZZVaN1RiQF7Y0xmglhJIyJ3LtWrcEJ/gCwb3D48wFwG6yLid1P89Uo1LYeiI6lUMORt+3yYJW8ctvex35x4BR8QUFlgVTGZqOWNIf5b4T6EM+pLKluPKE/l0EGC7Zv6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWXwo9MY+GkrZ/kgFyhwqh4AX0dd34EwhycJzhmeOVo=;
 b=YSXBbLpvvW0WYdYNzkDA3AjXl5FRdpHS3eaNX4Z7B8WHduh1B3XrpoFGeM1vXL8Dog2LrL+9wZlyczLvkqXbMmNzKpmAEYK6802lLAFc3sx1/5OuYaSrsjB63w6So16HXphNSWQMrhUsdTJHp4sHLBPkfNUx+6FB1mOo6bCgS93mzbhFRe3VLi6mgfst2Ut2SYcJ8PQMckcR51VbDdrLSiRca3NiwQvggxOlVJhgL6PZfIqt2UizzkykMOF7KDE10G1OhbqvbMe87MmD/mrDYGG+KPM+M3Wtr/ke38MZU191PnIYsDv/MOdh5ItCP20IRGS0NBKJMBEiGJDIlIhslA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWXwo9MY+GkrZ/kgFyhwqh4AX0dd34EwhycJzhmeOVo=;
 b=YdUxBf0GZ5E+qS2NET7GK0UxRjl04waBT6/dCOp5g366uAjxCFbknn9UXt+mynxDs3F1m2+oYcIy33WIF/1AOdO+FUkmZ7lpZyef1L+ivX/4mBHBTyowZKhrcXIEbFSzoCyhWKJTSRfvyywhzeTOqGe2iEvtiNBSaCo56AuRIVlGX1Gl1lDCAVo5JehuslftXOEbS9sxkqRvTnHZ6h40srHxocDCL1oqgz/zqv/TIlQM0/6+NfVYF8DCZJeQA6g9y9ytZFVLR63uqcjv6D6lbid+bwOkKurOd0wY9G2D5Ih9ZCFrAnN/LE/YkOnitGFFa7JMNibNY7mg+LGDNKqfFQ==
Received: from DB6PR1001MB1285.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b6::18)
 by AM6PR10MB3430.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:e8::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Wed, 27 Jul
 2022 07:15:21 +0000
Received: from DB6PR1001MB1285.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e0fb:623c:658e:6a6]) by DB6PR1001MB1285.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e0fb:623c:658e:6a6%5]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 07:15:21 +0000
From: "Anagnostopoulos, Vasileios" <vasileios.anagnostopoulos@siemens.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Workflow for updating the golang projects
Thread-Topic: Workflow for updating the golang projects
Thread-Index: AdihiEE/6gbQbZh1Sm+hlwhLTRYh9w==
Date: Wed, 27 Jul 2022 07:15:21 +0000
Message-ID: 
 <DB6PR1001MB12853F1BAF372C822B3E8487FA979@DB6PR1001MB1285.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2022-07-27T07:15:19Z;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=2477e406-16d3-47cf-92d6-bba81f392c78;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0
document_confidentiality: Restricted
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 277c0b63-ed30-474a-f99e-08da6f9fc486
x-ms-traffictypediagnostic: AM6PR10MB3430:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9ihLX3WBGEAKKRHiTZ8dIu7GvX+N97MFyNhQP6RjG2acBLod/Ek+8fXWl0RtOppuNlF9N5wZYTezbJSr2OiyZeWWSIohMGRYpMQqie9gEN8jk/llGkI5fesOCYedw8Efcr1NDCJTr/6ebVuVXhvNzB20yKXgIv9fF6mO8CphX4Jd4Tb0beV2jAopoCctYSwX8zGUBVaV5LhapIvzHpaZUO6fYRGDLyFBMZWvABoqVWnaSRL5EKN7+kw/2g5aPksbYHT7If42lwA3AbrTlrJ6WqjinADlUGakWekL2xkcEt3NwaZmttQaVJkLkw1p+768AeL2VPY+L0zDe8wMBXKUBleIFr0ybwDqSRqBTdrR1SCGHzqMpTZVp4MHgCoFgI2ev8vu12ubkw3R5JlEgntZNHvoDkdkeUObr62b2SxmFHkQ/SDmHVhyemRwRUGZY2PI19tsVoIJqVqN14U7nJLU1tQelsm2mp6gl14nolncze8WDCNCTzMC2Cv12nw9omHw9tWdVBoDbFn7lnm9rWaX/l57o7lZqHXw7OAYucIZGZ60ZUQDBwQouZI/U2ElaquUYM0ii1gQVDEvxnzi1rCX4nwUh3oWfrzjIaHuc7m0hM2D5bBPi2Mfi05qTjRGnrVA3DG49d0dYAWtevmXlQJEtRkhbSuKF6NbFTsl8gEuIWrzc8poPYTXE0sTDPsNYrtu/bCHPlDYx7BTjcjgFKCJlvsvhPIStv1rw+3TidPVY6dpvEGh7C5DQlTsnYu6PcZ2tG0YG6V2UnsdjYsDH00GSkn6tlZkqlm1fA+/d5F19Et8RgDiwAqQ/8BaTDNEle5Ru987XCetyXRv7Y51VtsNtA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR1001MB1285.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(346002)(376002)(366004)(396003)(6506007)(166002)(26005)(186003)(55236004)(316002)(2906002)(7696005)(33656002)(66946007)(4744005)(41300700001)(82960400001)(38100700002)(86362001)(55016003)(38070700005)(83380400001)(64756008)(6916009)(52536014)(9686003)(8936002)(66446008)(66476007)(478600001)(66556008)(71200400001)(122000001)(8676002)(76116006)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?XbWZahjd1yHELU0t4QAY/j5b7sEgHbjZQ8fRMDo69VdM38Tk+8hbn+3nY6dG?=
 =?us-ascii?Q?Ge+savDUWibcAFyTYgS/h7kifdzv4lyqdtPCiqaV22fhfctxOPmTkaBFhoMS?=
 =?us-ascii?Q?eZXIAeI7zz01x7uTLjsJVc+XEossv81VpHl3YTmtEwq/MBmRDzIN6qUxofSj?=
 =?us-ascii?Q?L4BEjl/EvsypvoTswSqQYr2b8ZfKehwhLipIi4CaV4ei+7Yvbk82jnxjPn1y?=
 =?us-ascii?Q?8ckb/TRBWEngyvu/YHvux4Nd7+k9GqubugBAbnreE8S0MTACubIM2yINXEOv?=
 =?us-ascii?Q?pSikITSt13m07jGrVgXoBaMCjoG/YSW0bYZrs/CrAGAzVQoDWKzlmKFENk5p?=
 =?us-ascii?Q?nlXCGm16iC4jt4L6VaZebMki3YSbQpO4Dd4bKQK0JjlWaXtgKkD/kDr2HM4z?=
 =?us-ascii?Q?YZNgsIal5NQm4mnQf9XMwBDLzOk+MxhYsS5BC9jEYIXsPW6Qgw6GTgawKbJN?=
 =?us-ascii?Q?oRCHQy5TwkZ2rnjxvheD9VN3HQ6Yxi0PixdQm6KgPX9fexSGKMUME3SBHVe2?=
 =?us-ascii?Q?8HiEbAJphj3S1tsuILCYrxdftNC7S/yl/91mgCAz86RJX0X9/4waa0bxhJyg?=
 =?us-ascii?Q?l2ISB9VsL0DyiKP4Zx1phQg9fD2U5e6bTcwSer3+SmbujqSyi0/63FliPwpx?=
 =?us-ascii?Q?FdeGm1GvPl3R3PdXrbercFzzcDS7MbZVdJbav2Pu7W0s4YgBAxGCrXwF8wnO?=
 =?us-ascii?Q?5zf6TYvYQMlHTXra1eb5a3ql6dRlNjXYkdQ5/pRyRGQiAPta8pLiRj2cfqU6?=
 =?us-ascii?Q?g5tBPEBkpHWUdI52hnsKmoyGbYR0xAZGdyMJ3xa7XsIiXnIZz2rIuPQJX+wy?=
 =?us-ascii?Q?St0cB9/FEGApp7mlX4rv6wDoo/N4cEFqR5zlKmrN/LNhpHmgb0sOmyivGwpo?=
 =?us-ascii?Q?oVvevVZdc4bwM21ROV20G9qkmuRuYli4Cp9rDnX0fKy7UH1JVDpEoxe0u0re?=
 =?us-ascii?Q?AmvfNl9NMgSWkhg8LO9aoAiosYxKptpMm0XpzTBdRrfZ/wzjUXLzxawMhPu7?=
 =?us-ascii?Q?vDEmhQBtrosr7kRndVzn53vsS4R5Ih0KkRLMd4IxPSOjt5VWsW3VdBxhsJ+0?=
 =?us-ascii?Q?mjp57hIwGnBHciclsqcfaStedClE+LG2AIHUiP4ue+e+60bbFX+31GB7/hMm?=
 =?us-ascii?Q?CTPlFxI7deDFzRMvwNg2ZCSHcJEUpKHoA81oVzL/WbBSlebTwxYz1+/cbHUb?=
 =?us-ascii?Q?He+Yc1JVgp84NOjyG6prGQV+k7NE/xLzQhx0KqzsDaPQuwIAhRgSU3YC6HY3?=
 =?us-ascii?Q?R4ZAQZdRFtzGtugliOAR4hlKFsc51ERasayBKCenvtsppz10gw+e3+x3tf9h?=
 =?us-ascii?Q?u5mN1TGl4KyhFeQwTdZwHf1g5/D+1V9ERiGfaDRl/Rhy/rcMwiZcftMvJiO9?=
 =?us-ascii?Q?uq/Jehh90M6Lv4Lz6ST46IllclqJNBoPWDR8Gr32p6SWxDcp3qFtBBYfQYVU?=
 =?us-ascii?Q?z1YknhqV0z1otUCI7zZpz0cv+XXiQgsgCQFxLDKfHxRKxB7HUsi6vhbDTwGn?=
 =?us-ascii?Q?Jv2WdYBjS+OOFsiqO9yY0FwPUso1Ks2EsFR3K8DMmFusgjuLAAlYSZcst2jM?=
 =?us-ascii?Q?XvnJNC+jNQgSjMUjkCs9dWWJwXg4dBMm0CxUJW7IFrDZ0xhGndw0ELY1m24N?=
 =?us-ascii?Q?FZwrOXSEV0DT3zQjsr6eub4=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DB6PR1001MB12853F1BAF372C822B3E8487FA979DB6PR1001MB1285_"
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DB6PR1001MB1285.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 277c0b63-ed30-474a-f99e-08da6f9fc486
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 07:15:21.3697
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 CtqgA/8oIx3uOMHwUY3usRjbo1ItsE37z+JwWFGZSVkhcFMMKICF4xkKufLGzb/81dyp7sIfTMNb3uMxc0bZf83QOwDUchottJznxI6ZMpA0Z6RjhK37Jde9BSLtxlCk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB3430
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 27 Jul 2022 07:15:28 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7474

--_000_DB6PR1001MB12853F1BAF372C822B3E8487FA979DB6PR1001MB1285_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Everyone,

I was wondering what is the general workflow for updating the golang projec=
ts (e.g. k3s, nerdctl, etc)?
In the mailing list, there was [a reference for a tool](https://lists.yocto=
project.org/g/meta-virtualization/message/7183?p=3D%2C%2C%2C20%2C0%2C0%2C0%=
3A%3ACreated%2C%2Ck3s%2C20%2C2%2C0%2C82714461), but I could not located it.=
 Is it still WIP or is it located somewhere that I did not notice ?

Thank you in advance and kind regards,

Vasileios


--_000_DB6PR1001MB12853F1BAF372C822B3E8487FA979DB6PR1001MB1285_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"DE-CH" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Hello Everyone,<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">I was wondering what is the gen=
eral workflow for updating the golang projects (e.g. k3s, nerdctl, etc)?
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">In the mailing list</span><span=
 lang=3D"en-150">,</span><span lang=3D"EN-GB"> there was [a reference for a=
 tool](</span><a href=3D"https://lists.yoctoproject.org/g/meta-virtualizati=
on/message/7183?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2Ck3s%2C20%2C2%=
2C0%2C82714461"><span lang=3D"EN-GB">https://lists.yoctoproject.org/g/meta-=
virtualization/message/7183?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2Ck=
3s%2C20%2C2%2C0%2C82714461</span></a><span lang=3D"EN-GB">),
 but I could not located it. Is it still WIP or is it located somewhere tha=
t I did not notice ?
</span><span lang=3D"EN-GB">&nbsp;</span><span lang=3D"en-150"><o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Thank you in advance and kind r=
egards,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal">Vasileios<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DB6PR1001MB12853F1BAF372C822B3E8487FA979DB6PR1001MB1285_--

