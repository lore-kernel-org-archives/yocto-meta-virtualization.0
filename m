Return-Path: <B51469@freescale.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7B669E00881; Mon,  3 Nov 2014 00:23:06 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [157.56.110.147 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
X-Greylist: delayed 9226 seconds by postgrey-1.32 at yocto-www;
	Mon, 03 Nov 2014 00:23:03 PST
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0147.outbound.protection.outlook.com [157.56.110.147])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D580FE0085F
	for <meta-virtualization@yoctoproject.org>;
	Mon,  3 Nov 2014 00:23:03 -0800 (PST)
Received: from BL2PR03MB497.namprd03.prod.outlook.com (10.141.93.142) by
	BL2PR03MB500.namprd03.prod.outlook.com (10.141.93.152) with Microsoft
	SMTP Server (TLS) id 15.1.11.14; Mon, 3 Nov 2014 05:49:15 +0000
Received: from BL2PR03MB497.namprd03.prod.outlook.com ([10.141.93.142]) by
	BL2PR03MB497.namprd03.prod.outlook.com ([10.141.93.142]) with mapi id
	15.01.0011.000; Mon, 3 Nov 2014 05:49:16 +0000
From: Benlei Xu <B51469@freescale.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: openstack dashboard can not use console, need your help
Thread-Index: Ac/3KeSfHcPCSgrHTdKqGlopYNE4yw==
Date: Mon, 3 Nov 2014 05:49:15 +0000
Message-ID: <3d2c4f00be3b4a57814735b9ecd909ec@BL2PR03MB497.namprd03.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [123.151.195.50]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;SRVR:BL2PR03MB500;
x-exchange-antispam-report-test: UriScan:;
x-forefront-prvs: 0384275935
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(53754006)(189002)(122556002)(101416001)(19625215002)(31966008)(18717965001)(87936001)(2656002)(50986999)(54356999)(64706001)(86362001)(92566001)(20776003)(77156002)(62966003)(450100001)(19300405004)(66066001)(40100003)(46102003)(15202345003)(76576001)(19609705001)(108616004)(110136001)(33646002)(19580395003)(4396001)(15975445006)(99396003)(120916001)(21056001)(105586002)(229853001)(106356001)(97736003)(2351001)(107886001)(16236675004)(107046002)(95666004)(99286002)(24736002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BL2PR03MB500;
	H:BL2PR03MB497.namprd03.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: openstack dashboard can not use console, need your help
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
X-List-Received-Date: Mon, 03 Nov 2014 08:23:06 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_3d2c4f00be3b4a57814735b9ecd909ecBL2PR03MB497namprd03pro_"

--_000_3d2c4f00be3b4a57814735b9ecd909ecBL2PR03MB497namprd03pro_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,

                I have a issue need to ensure, I am launching instance on p=
owerpc arch board, but there is a issue  that "Error: internal error: proce=
ss exited while connecting to monitor: VNC support is disabled". If "vnc_en=
abled" is set False in nova.conf, the instance can created successfully.  I=
 guess that there is no vnc server in yocto packages.

                So,  I want to know, where yocto support vnc server or not =
and how can I get vnc server package on powerpc arch.

Thanks.

Best Regards,
Benlei


--_000_3d2c4f00be3b4a57814735b9ecd909ecBL2PR03MB497namprd03pro_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:\5B8B\4F53;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@\5B8B\4F53";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
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
<p class=3D"MsoNormal">Hello all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I have a issue need to ensure, I am =
launching instance on powerpc arch board, but there is a issue&nbsp; that &=
#8220;Error: internal error: process exited while connecting to monitor: VN=
C support is disabled&#8221;. If &#8220;vnc_enabled&#8221; is set
 False in nova.conf, the instance can created successfully. &nbsp;I guess t=
hat there is no vnc server in yocto packages.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; So,&nbsp; I want to know, where yoct=
o support vnc server or not and how can I get vnc server package on powerpc=
 arch.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in">Thanks.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Benlei<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_3d2c4f00be3b4a57814735b9ecd909ecBL2PR03MB497namprd03pro_--
