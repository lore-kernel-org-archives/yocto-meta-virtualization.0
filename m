Return-Path: <Emil.Mihaylov@spirent.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BAB3DE00AD8; Wed,  1 Jun 2016 18:08:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_40,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [157.56.110.134 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.0 BAYES_40 BODY: Bayes spam probability is 20 to 40%
	*      [score: 0.2555]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 1962 seconds by postgrey-1.32 at yocto-www;
	Wed, 01 Jun 2016 18:08:35 PDT
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0134.outbound.protection.outlook.com [157.56.110.134])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0AA36E0071E
	for <meta-virtualization@yoctoproject.org>;
	Wed,  1 Jun 2016 18:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=spirent1.onmicrosoft.com; s=selector1-spirent-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=nRDUC6jybvwpHotuKIsTtMDKfT5aGnuZAvYxGZue5xs=;
	b=VJg2NstvEJWAqy6V31vFnBx4CAA2ZBvdFC3xIPc8nSGzaWDz/vuCgmhwxkpM4BHDEJbcNEjkuKx6MN/YJFflI3XV+uWOw+wiWX/1HPiCCftdJV20RK9Bfa9qIUUfyJsdy4DGcCcFm6jadLbFBOyWwZKtbW7NrXzHMdxSTJqys7Q=
Received: from CY1PR1001MB1177.namprd10.prod.outlook.com (10.165.2.143) by
	CY1PR1001MB1177.namprd10.prod.outlook.com (10.165.2.143) with Microsoft
	SMTP Server (TLS) id 15.1.506.9; Thu, 2 Jun 2016 00:35:51 +0000
Received: from CY1PR1001MB1177.namprd10.prod.outlook.com ([10.165.2.143]) by
	CY1PR1001MB1177.namprd10.prod.outlook.com ([10.165.2.143]) with mapi id
	15.01.0506.013; Thu, 2 Jun 2016 00:35:51 +0000
From: "Mihaylov, Emil" <Emil.Mihaylov@spirent.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: Re: [meta-virtualization] interest to integrate virt-manager?
Thread-Index: AdG8ZnB1rm5MCr3xTveaVhGgFwXhcQ==
Message-ID: <CY1PR1001MB1177059D6AA467CB45C659F4F0580@CY1PR1001MB1177.namprd10.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: yoctoproject.org; dkim=none (message not signed)
	header.d=none;yoctoproject.org; dmarc=none action=none
	header.from=spirent.com;
x-originating-ip: [74.62.253.130]
x-ms-office365-filtering-correlation-id: ffc90737-6e5d-4dfa-88a9-08d38a7dd944
x-microsoft-exchange-diagnostics: 1; CY1PR1001MB1177;
	5:Z4EdDI5pWeFDM67z1pKa/WscEZSfGa1Q3TZEMhy0v/AgOVDD4XemL2ACWHUzeHdDW7VhK+OmO+uoBM3huV3iMZw4GwAg/B+N3FinaBAUVqlYp1aCDeHiGKR9HHC+LEOP0PE2G5EPiF+lJ0WAQCuWxw==;
	24:t5OUqT9OFyb1YbXGJ2wK9x9R3EE3cUUOmumQUhggc7HejCQJIrma+8WMho9DA8al1v0GC8BiN30mzxGfPjtgQMgcTqckD43iEX8OUdIHSxo=;
	7:yAPDQSrFeqaOJOzW6JA6cofSeKiyhOqYWiiG6oDs6M+JBZnmyvYDI0QEc4GsIt77wPJodlbV9wSWKxyDqbOLo6GRaLskjNkpJhSUxIGz07rtue2wnltZNogtqGZeTiqpXPfMN9RMYA79RZo3+/yaC34Awa/0+jQa1sEfOu7om9M7DKlu/sqGeatIihX8VwxC
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR1001MB1177;
x-disclaimer: Yes
x-microsoft-antispam-prvs: <CY1PR1001MB1177647A4B14B2849D0FCEAAF0580@CY1PR1001MB1177.namprd10.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(21748063052155);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:CY1PR1001MB1177; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR1001MB1177; 
x-forefront-prvs: 0961DF5286
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(85714005)(3660700001)(19300405004)(5004730100002)(86362001)(3280700002)(66066001)(5630700001)(99286002)(9686002)(50986999)(5002640100001)(790700001)(450100001)(19625215002)(122556002)(102836003)(6116002)(3846002)(15975445007)(19580395003)(2906002)(586003)(9326002)(54356999)(5008740100001)(77096005)(5640700001)(8676002)(8936002)(92566002)(107886002)(81166006)(189998001)(16236675004)(76576001)(10400500002)(87936001)(110136002)(2501003)(74316001)(5003600100002)(11100500001)(2900100001)(33656002)(2351001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR1001MB1177;
	H:CY1PR1001MB1177.namprd10.prod.outlook.com; FPR:; SPF:None;
	MLV:ovrnspm; PTR:InfoNoRecords; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: spirent.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2016 00:35:50.8032 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eb68cad0-6bd5-483f-a802-0f72f974373f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR1001MB1177
X-Mailman-Approved-At: Fri, 23 Dec 2016 16:01:39 -0800
Subject: Re: interest to integrate virt-manager?
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
Date: Thu, 02 Jun 2016 01:08:38 -0000
X-Original-Date: Thu, 2 Jun 2016 00:35:50 +0000
X-List-Received-Date: Thu, 02 Jun 2016 01:08:38 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CY1PR1001MB1177059D6AA467CB45C659F4F0580CY1PR1001MB1177_"

--_000_CY1PR1001MB1177059D6AA467CB45C659F4F0580CY1PR1001MB1177_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi
anybody added virt-viewer/virt-manager  receipt to  meta-virtualization
Thanks Emil





Spirent Communications e-mail confidentiality.
------------------------------------------------------------------------
This e-mail contains confidential and / or privileged information belonging=
 to Spirent Communications plc, its affiliates and / or subsidiaries. If yo=
u are not the intended recipient, you are hereby notified that any disclosu=
re, copying, distribution and / or the taking of any action based upon reli=
ance on the contents of this transmission is strictly forbidden. If you hav=
e received this message in error please notify the sender by return e-mail =
and delete it from your system.

Spirent Communications plc
Northwood Park, Gatwick Road, Crawley, West Sussex, RH10 9XN, United Kingdo=
m.
Tel No. +44 (0) 1293 767676
Fax No. +44 (0) 1293 767677

Registered in England Number 470893
Registered at Northwood Park, Gatwick Road, Crawley, West Sussex, RH10 9XN,=
 United Kingdom.

Or if within the US,

Spirent Communications,
27349 Agoura Road, Calabasas, CA, 91301, USA.
Tel No. 1-818-676- 2300

--_000_CY1PR1001MB1177059D6AA467CB45C659F4F0580CY1PR1001MB1177_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi <o:p></o:p></p>
<p class=3D"MsoNormal">anybody added virt-viewer/virt-manager &nbsp;receipt=
 to &nbsp;meta-virtualization<o:p></o:p></p>
<p class=3D"MsoNormal">Thanks Emil<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
</div>
<br>
<br>
<br>
<br>
<div><font size=3D"1">Spirent Communications e-mail confidentiality.<br>
------------------------------------------------------------------------<br=
>
This e-mail contains confidential and / or privileged information belonging=
 to Spirent Communications plc, its affiliates and / or subsidiaries. If yo=
u are not the intended recipient, you are hereby notified that any disclosu=
re, copying, distribution and /
 or the taking of any action based upon reliance on the contents of this tr=
ansmission is strictly forbidden. If you have received this message in erro=
r please notify the sender by return e-mail and delete it from your system.=
<br>
<br>
Spirent Communications plc<br>
Northwood Park, Gatwick Road, Crawley, West Sussex, RH10 9XN, United Kingdo=
m.<br>
Tel No. &#43;44 (0) 1293 767676<br>
Fax No. &#43;44 (0) 1293 767677<br>
<br>
Registered in England Number 470893<br>
Registered at Northwood Park, Gatwick Road, Crawley, West Sussex, RH10 9XN,=
 United Kingdom.<br>
<br>
Or if within the US, <br>
<br>
Spirent Communications,<br>
27349 Agoura Road, Calabasas, CA, 91301, USA.<br>
Tel No. 1-818-676- 2300 <br>
</font></div>
</body>
</html>

--_000_CY1PR1001MB1177059D6AA467CB45C659F4F0580CY1PR1001MB1177_--
