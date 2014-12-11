Return-Path: <B51469@freescale.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2BED2E00874; Wed, 10 Dec 2014 18:46:24 -0800 (PST)
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
X-Greylist: delayed 961 seconds by postgrey-1.32 at yocto-www;
	Wed, 10 Dec 2014 18:46:19 PST
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0147.outbound.protection.outlook.com [157.56.110.147])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A1CEAE0080C
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Dec 2014 18:46:19 -0800 (PST)
Received: from BL2PR03MB497.namprd03.prod.outlook.com (10.141.93.142) by
	BL2PR03MB498.namprd03.prod.outlook.com (10.141.93.146) with Microsoft
	SMTP Server (TLS) id 15.1.31.17; Thu, 11 Dec 2014 02:30:16 +0000
Received: from BL2PR03MB497.namprd03.prod.outlook.com ([10.141.93.142]) by
	BL2PR03MB497.namprd03.prod.outlook.com ([10.141.93.142]) with mapi id
	15.01.0031.000; Thu, 11 Dec 2014 02:30:16 +0000
From: Benlei Xu <B51469@freescale.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: need your help about integrate opendayliht into
	meta-cloud-services 
Thread-Index: AdAU6mRG/rt5Pag4TO26IphHvmcFzA==
Date: Thu, 11 Dec 2014 02:30:16 +0000
Message-ID: <BL2PR03MB49705933F924B34CFE8797A84630@BL2PR03MB497.namprd03.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [123.151.195.52]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;SRVR:BL2PR03MB498;
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:;SRVR:BL2PR03MB498;
x-forefront-prvs: 0422860ED4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(54606007)(106356001)(66066001)(107046002)(40100003)(19609705001)(107886001)(50986999)(99286002)(2351001)(19300405004)(99396003)(76576001)(110136001)(54356999)(97736003)(122556002)(68736005)(16236675004)(54206007)(33656002)(101416001)(19625215002)(15975445007)(102836002)(77096005)(19580395003)(31966008)(74316001)(77156002)(18717965001)(92566001)(20776003)(62966003)(230783001)(229853001)(120916001)(64706001)(105586002)(4396001)(86362001)(46102003)(21056001)(450100001)(87936001)(2656002)(151803002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BL2PR03MB498;
	H:BL2PR03MB497.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: need your help about integrate opendayliht into meta-cloud-services
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
X-List-Received-Date: Thu, 11 Dec 2014 02:46:24 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BL2PR03MB49705933F924B34CFE8797A84630BL2PR03MB497namprd_"

--_000_BL2PR03MB49705933F924B34CFE8797A84630BL2PR03MB497namprd_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hell all,

I want to add OpenDaylight to meta-cloud-services layer, but the Daylight h=
ave more than 220mb and if we use that software we have to connect to inter=
net,
otherwise, we can't use the software correctly. So I want to know whether n=
eed to add a recipe to meta-cloud-services? We just need to load Daylight t=
o our
system from internet if we want to use it.

Best Regards,
Benlei

--_000_BL2PR03MB49705933F924B34CFE8797A84630BL2PR03MB497namprd_
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
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:SimSun;
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
<p class=3D"MsoNormal">Hell all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I want to add OpenDaylight to meta-cloud-services la=
yer, but the Daylight have more than 220mb and if we use that software we h=
ave to connect to internet,<o:p></o:p></p>
<p class=3D"MsoNormal">otherwise, we can&#8217;t use the software correctly=
. So I want to know whether need to add a recipe to meta-cloud-services? We=
 just need to load Daylight to our
<o:p></o:p></p>
<p class=3D"MsoNormal">system from internet if we want to use it.<o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Benlei<o:p></o:p></p>
</div>
</body>
</html>

--_000_BL2PR03MB49705933F924B34CFE8797A84630BL2PR03MB497namprd_--
