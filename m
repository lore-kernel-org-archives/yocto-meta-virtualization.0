Received: from simtcimsva03.etn.com (simtcimsva03.etn.com [192.104.67.6])
 by mx.groups.io with SMTP id smtpd.web11.311.1599316596050803125
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 05 Sep 2020 07:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@eaton.onmicrosoft.com header.s=selector1-eaton-onmicrosoft-com header.b=YUY41Hvf;
 spf=pass (domain: eaton.com, ip: 192.104.67.6, mailfrom: jagdishpachara@eaton.com)
Received: from simtcimsva03.etn.com (simtcimsva03.etn.com [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 71959A4144
	for <meta-virtualization@lists.yoctoproject.org>; Sat,  5 Sep 2020 10:36:34 -0400 (EDT)
Received: from simtcimsva03.etn.com (simtcimsva03.etn.com [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5AFC5A4122
	for <meta-virtualization@lists.yoctoproject.org>; Sat,  5 Sep 2020 10:36:34 -0400 (EDT)
Received: from SIMTCSGWY01.napa.ad.etn.com (simtcsgwy01.napa.ad.etn.com [151.110.126.183])
	by simtcimsva03.etn.com (Postfix) with ESMTPS
	for <meta-virtualization@lists.yoctoproject.org>; Sat,  5 Sep 2020 10:36:34 -0400 (EDT)
Received: from USLTCSHYB01.napa.ad.etn.com (151.110.40.71) by
 SIMTCSGWY01.napa.ad.etn.com (151.110.126.183) with Microsoft SMTP Server
 (TLS) id 14.3.468.0; Sat, 5 Sep 2020 10:36:27 -0400
Received: from USLTCSEXHET02.NAPA.AD.ETN.COM (151.110.240.152) by
 USLTCSHYB01.napa.ad.etn.com (151.110.40.71) with Microsoft SMTP Server (TLS)
 id 14.3.468.0; Sat, 5 Sep 2020 10:36:26 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by hybridmail.eaton.com (151.110.240.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1591.10; Sat, 5 Sep 2020 10:36:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/61Az7yzHpqhVLLr299zHrffp/4xHCOcB/g2M/6BfAjKnN/8paz5k5p0/v3JOfqBl0f4hVk2DZIcTctuNYrdCy/07yYFcJdO2TGMutIhdlrUxUy3+JtvIE+N/ev+tqi9Ljvfgyjh1fST7+nfwtSuYWibpVkLvV+8X8zcoOWjg+MWUq+eKUvmoI96Kuu3E+3qy88v0cfk8zcecAajOviFufQldm+OCvK8FnJRNUu7aOkoBnnbslIvlrkdZivIwwhAsblTnKHarf66WfxM+kKxEoiI6Ra4abcXOON1P0nt9yLVyNrewOh9DVeF2SPop88n7BeaksPrWuB4XAEdJiXYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXbQXUq9PkS+0eENoFC/RyZGiS2Xe1T2IkHuKaHPiDw=;
 b=Hh1RTxDpesMLkVbau9Hy5/l3g3CrUH5mtdHMWIeL0XbRfTxbAkUYbWAru6RBz2EQMj4FXtoA1rHgC1uqryo1zxA+x3ZHdGvhhT5SIzsDxD3OWgR8kITtqsKY57h/e6oK+DDYJdmwMeslgoARQ8EWB8I1POUYV2DcjGobrorZo1am1I+n6Iou+SrbCu1rNzZZOvJ67jfEccKenIPY+GOr+IMWXZ7mTfxtl+TvFddR5g02CO4X6lxWdUABTZ1lDzHezAD9swQ6JX/4Q0jnYIDaIyIMv5FF1gjDk388ouwNfKlqPDusggzd9GZx+Sfo3xZL/XTgeZBRNrD6CMTSFCWswA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eaton.com; dmarc=pass action=none header.from=eaton.com;
 dkim=pass header.d=eaton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Eaton.onmicrosoft.com;
 s=selector1-Eaton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXbQXUq9PkS+0eENoFC/RyZGiS2Xe1T2IkHuKaHPiDw=;
 b=YUY41HvfUwYeqw/k9PjZPRLKSLBeCbApoTzsS5huxxBJFmHyr9bzppQY/wNs+1kXwMsFLIe0r8/SkRSfM4qtx4KxoWB5fdFhrcpi0DFxXjBg4OWVY8bWxtKVQ141N73e2DKPIH9isuCHAG9XqRhXEZkL43pmHn4w40/kC2tQw2U=
Received: from BY5PR17MB3174.namprd17.prod.outlook.com (2603:10b6:a03:189::15)
 by BY5PR17MB3256.namprd17.prod.outlook.com (2603:10b6:a03:191::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Sat, 5 Sep
 2020 14:36:25 +0000
Received: from BY5PR17MB3174.namprd17.prod.outlook.com
 ([fe80::b4ae:4728:7afc:da3c]) by BY5PR17MB3174.namprd17.prod.outlook.com
 ([fe80::b4ae:4728:7afc:da3c%6]) with mapi id 15.20.3348.018; Sat, 5 Sep 2020
 14:36:25 +0000
From: jagdishpachara@eaton.com
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: cgroup-lite recipe support
Thread-Topic: cgroup-lite recipe support
Thread-Index: AdaDke2NsLEWvRaJT2yiOAWqAXwyjg==
Date: Sat, 5 Sep 2020 14:36:24 +0000
Message-ID: <BY5PR17MB3174BB8ABFDD947C25A6B565D62A0@BY5PR17MB3174.namprd17.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=eaton.com;
x-originating-ip: [165.225.94.103]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bdf7fa77-dfe5-4ada-35bc-08d851a91121
x-ms-traffictypediagnostic: BY5PR17MB3256:
x-microsoft-antispam-prvs: <BY5PR17MB325680AD7DEDE956C46A13C2D62A0@BY5PR17MB3256.namprd17.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: huFe01rIAJ96BpqKkENbiJVSYFccMOImUsZhjOFsVx5KWptpdrGnle3OMGpzg/M3Z2lHC977uQ0Gk3cbFTwAkSCzUHtcGRF4Yh9p0grSwIKWM/9waX5hPAwUlxbYX8WHwjEmG4706u886iYL/NGrQrRCPTIwglf7cEyNCU+k3RaKakVgBVs4AfirC6ZY7PVgXH/2cJ9jInhXXfb54fzj3Fr9XLpjqjt+ct6zjB1RVG2oZWR1Mgn8nFN5vlvAOFhd4fWbr7+XtqFuWP7N9UYR60KZlNNh49QCdwDHve4/P/GDnLjBeaV0QIJCAlcOwB08Jhw/AMlVlPrhjzn496Y0dh4B2T2SDgYF2FyqYTYhFOZzDFPpsueEMwGMtXXp2QdfBNVzTbR8cU4pDCMwxPrMLw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR17MB3174.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(6019001)(136003)(376002)(396003)(39860400002)(366004)(346002)(76116006)(33656002)(4744005)(5660300002)(52536014)(966005)(66946007)(66446008)(64756008)(66556008)(66476007)(3480700007)(83080400001)(86362001)(2906002)(9686003)(55236004)(8676002)(55016002)(6506007)(8936002)(6916009)(186003)(26005)(7696005)(71200400001)(166002)(316002)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: kmuf79+gqinX/HRwQ9LXmZMk6kZ4/UE9ujw3bApjNGBQQf0S+pW7TYYtBo66qvEV85cvMiWF0zBqBclgBDLYV5XC6pqf+pnq95nQr0oKBAm8r3O6/rWNKf+6Qp9EzIw1OfCNnJYIe3vsH2wEsPwE+4dLQn87B0hxLYP0cQniqOdDyUOzA3rhBuO7LNKyv4R5XkRI6Hr+x7HKVxeExSPMHyn59eehW1P++ItKIUivTpCeb/w+iIwpGPpiz4pIXLem/kakoFhQcjtE6rG+O4r5MElWVujC70QfEj79w+j4ygU4gHNamJhHzK4ukO7I4g4UJbjh/+Ohxjr+sIJey6xN1JyOo7HcVHpdkx8094VaWb87EIJYrCvhRfFQuOSHMdZg0Scdl/kHKI3IpfrGSLg1xUb7tJR5fUDZaMrHNqfMSQFCRLbvbZYRlNuL+WtC3wl+qaaUBGBiSfjN4RNDuwlRzGcSntkZ5WP34+O1Biy033tDBorYjXWYr09O0TlZCspnZ/l/NC6TKy3gf1f7H3AEfI10vmAgg9E+meoKSo4LLlH1J64ClvqOt0v/5m5W2opsJId79odLBYacJ/TWavkv8cvw4PxNjbpMhyUk2ZlOWUIgxLMs1Qs5Ssc/gWZNWXC75CORIVMQkiX6IGgn1lpEsA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR17MB3174.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf7fa77-dfe5-4ada-35bc-08d851a91121
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2020 14:36:24.9858
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d6525c95-b906-431a-b926-e9b51ba43cc4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qLd3ve7/WysqTAzuAhtdW/77LK7BA8wF/A6/bRyaS9768dcDuDPz1813FZjlHrU2OuWExI+UVz7JbvXMwnpNl+FDf8wTETTuY2YCQRsPur4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR17MB3256
X-TM-SNTS-SMTP: 
 7B81F0FCD96E0F926ABFDE0BCDBE2EBCCD03E762DD7BD2774C6D2F43F86FD0482002:8
X-OriginatorOrg: eaton.com
X-EXCLAIMER-MD-CONFIG: 96b59d02-bc1a-4a40-8c96-611cac62bce9
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSVA-9.1.0.1988-8.6.0.1013-25648.000
X-TM-AS-Result: No--4.635-10.0-31-10
X-imss-scan-details: No--4.635-10.0-31-10
X-TMASE-Version: IMSVA-9.1.0.1988-8.6.1013-25648.000
X-TMASE-Result: 10--4.635000-10.000000
X-TMASE-MatchedRID: 0I45qUWsUvwOwAmmWH5kBKJVTu7sjgg1soMk6WWwOdHInKrwfonFCx+W
	1BDZciKfFep4vGPIIO4pre2MP2TNJ7T0jVEXWzBw7+657vFymMOVLW9jtvd8GTbpMgyAfh26ECq
	mKiRotDFPsvnPiZI9l/EprmCDEkC5hwBDGIsTLwodDctFr7spHN9WrDP4LKdpGA7uwIZNHQ1cX8
	9dDrF4+Qg2jxCbLO7ceDdlXnzeQYI/UE/u12UwsXpruoeiWYa5cQ43DruBJVzJqq1xSxY7FmnxX
	sU7Vd3knv9S2yDEaz9edyc9xKCRqLQJ4oUF56voIf0TE1VduNv54F/2i/DwjQNPGPNKJEnBEYKg
	ogWnjPMkV+WXvBbB8AH/6CIQ6zHMn0UoIZ374hfmuecNOZVsqo9NiiLZJsSIZNei9pdVsJvD5wZ
	XDG8SR84ffyU1s6hMuDzuYP9x54ffX2sZfyOJod0KiTeJteVBTX6ADbpYH9GYj59oOLB2Glrkuy
	zf3MfIaRrXSQOkl2VdSRG7hRDRTVgrBUuZ6rIfGcaewfIVBRyCNqXrmSmmCV0EjYv6UREp/jprH
	vh/piZBd+pJ0bWKTXH7BpAeHzsOcbYPz5hStK4=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-12:0,22:0,33:0,34:0-0
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BY5PR17MB3174BB8ABFDD947C25A6B565D62A0BY5PR17MB3174namp_"

--_000_BY5PR17MB3174BB8ABFDD947C25A6B565D62A0BY5PR17MB3174namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm trying to run k3s https://k3s.io/ on a custom linux that we built with =
Yocto.

In the image, I include the cgroup-lite package but when I run the k3s, I g=
et the following erro

/var/volatile/tmp # ./k3s agent --server https://192.168.1.9:6443 --token K=
10655
1b864ddc9e388cbfba3cded437ac65182ebdf0ee75719436603e29a7c3be4::server:2e175=
fa39a
8b70bc878fa2772a78d82b
INFO[0000] Preparing data dir /var/lib/rancher/k3s/data/19bb6a9b46ad0013de0=
84cf1e0feb7927ff9e4e06624685ff87f003c208fded1
INFO[2020-09-05T02:27:52.975048835-04:00] Starting k3s agent v1.18.8+k3s1 (=
6b595318)
FATA[2020-09-05T02:27:53.031033091-04:00] open /proc/self/cgroup: no such f=
ile or directory


Do you know why /proc/self/cgroup does not exist even if cgroup-lite recipe=
 is included in IMAGE_INSTALL_append in my layer.conf file?

Best regards,
Jack



________________________________
Eaton Industries Manufacturing GmbH ~ Registered place of business: Route d=
e la Longeraie 7, 1110, Morges, Switzerland

________________________________



--_000_BY5PR17MB3174BB8ABFDD947C25A6B565D62A0BY5PR17MB3174namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<HTML xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<HEAD><!-- Template generated by Exclaimer Mail Disclaimers on 10:36:27 Sat=
urday, 5 September 2020 -->
<STYLE type=3Dtext/css>P.a52854fd-b129-4b26-919a-09727bd8272a {
	MARGIN: 0cm 0cm 0pt
}
LI.a52854fd-b129-4b26-919a-09727bd8272a {
	MARGIN: 0cm 0cm 0pt
}
DIV.a52854fd-b129-4b26-919a-09727bd8272a {
	MARGIN: 0cm 0cm 0pt
}
TABLE.a52854fd-b129-4b26-919a-09727bd8272aTable {
	MARGIN: 0cm 0cm 0pt
}
DIV.Section1 {
	page: Section1
}
</STYLE>

<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8" />
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)" />
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
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
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
	{size:8.5in 11.0in;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</HEAD>

<BODY lang=3D"FR-CH" link=3D"#0563C1" vlink=3D"#954F72">
<P class=3Da52854fd-b129-4b26-919a-09727bd8272a>
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I&#8217;m trying to run k3s <a =
href=3D"https://k3s.io/">
https://k3s.io/</a> on a custom linux that we built with Yocto.<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">In the image, I include the cgr=
oup-lite package but when I run the k3s, I get the following erro<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">/var/volatile/tmp # ./k3s agent=
 --server https://192.168.1.9:6443 --token K10655<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">1b864ddc9e388cbfba3cded437ac651=
82ebdf0ee75719436603e29a7c3be4::server:2e175fa39a<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">8b70bc878fa2772a78d82b<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">INFO[0000] Preparing data dir /=
var/lib/rancher/k3s/data/19bb6a9b46ad0013de084cf1e0feb7927ff9e4e06624685ff8=
7f003c208fded1
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">INFO[2020-09-05T02:27:52.975048=
835-04:00] Starting k3s agent v1.18.8+k3s1 (6b595318)&nbsp;&nbsp;
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">FATA[2020-09-05T02:27:53.031033=
091-04:00] open /proc/self/cgroup: no such file or directory<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Do you know why /proc/self/cgro=
up does not exist even if cgroup-lite recipe is included in IMAGE_INSTALL_a=
ppend in my layer.conf file?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best regards,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Jack<o:p></o:p></span></p>
</div>
</P>
<P class=3Da52854fd-b129-4b26-919a-09727bd8272a>&nbsp;</P>
<P class=3Da52854fd-b129-4b26-919a-09727bd8272a>
<HR id=3DHR1 />
Eaton Industries Manufacturing GmbH ~ Registered place of business: Route d=
e la Longeraie 7, 1110, Morges, Switzerland <br>
<P class=3Da52854fd-b129-4b26-919a-09727bd8272a>
<HR id=3DHR1 />

<P></P>
<P class=3Da52854fd-b129-4b26-919a-09727bd8272a>&nbsp;</P>
<P class=3Da52854fd-b129-4b26-919a-09727bd8272a></P></P></P></BODY>
</HTML>


--_000_BY5PR17MB3174BB8ABFDD947C25A6B565D62A0BY5PR17MB3174namp_--
