Return-Path: <Petr.Gotthard@Honeywell.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2833CE00956; Fri, 10 Apr 2015 05:53:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [157.56.111.148 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
X-Greylist: delayed 1111 seconds by postgrey-1.32 at yocto-www;
	Fri, 10 Apr 2015 05:53:04 PDT
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0148.outbound.protection.outlook.com [157.56.111.148])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5C805E0049A
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Apr 2015 05:53:04 -0700 (PDT)
Received: from BLUPR07CA058.namprd07.prod.outlook.com (25.160.24.13) by
	SN1PR07MB1470.namprd07.prod.outlook.com (25.161.223.144) with Microsoft
	SMTP Server (TLS) id 15.1.136.25; Fri, 10 Apr 2015 12:19:47 +0000
Received: from BL2FFO11FD033.protection.gbl (2a01:111:f400:7c09::142) by
	BLUPR07CA058.outlook.office365.com (2a01:111:e400:8ae::13) with
	Microsoft SMTP Server (TLS) id 15.1.136.25 via Frontend Transport;
	Fri, 10 Apr 2015 12:19:47 +0000
Authentication-Results: spf=neutral (sender IP is 199.61.26.153)
	smtp.mailfrom=Honeywell.com; yoctoproject.org;
	dkim=none (message not signed) header.d=none;
Received-SPF: Neutral (protection.outlook.com: 199.61.26.153 is neither
	permitted nor denied by domain of Honeywell.com)
Received: from DE08W1025.honeywell.com (199.61.26.153) by
	BL2FFO11FD033.mail.protection.outlook.com (10.173.161.129) with
	Microsoft SMTP Server (TLS) id 15.1.142.12 via Frontend Transport;
	Fri, 10 Apr 2015 12:19:47 +0000
Received: from de08ex5005.global.ds.honeywell.com (10.216.34.43) by
	DE08W1025.honeywell.com (10.221.248.36) with Microsoft SMTP Server id
	14.3.224.2; Fri, 10 Apr 2015 08:19:20 -0400
Received: from DE08W1303.global.ds.honeywell.com ([169.254.10.149]) by
	de08ex5005.global.ds.honeywell.com ([10.216.14.78]) with mapi id
	14.03.0224.002; Fri, 10 Apr 2015 08:19:21 -0400
From: "Gotthard, Petr" <Petr.Gotthard@Honeywell.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: interest to integrate virt-manager?
Thread-Index: AdBzgTeokLzcb9BhTomfkSnn/kh0qg==
Date: Fri, 10 Apr 2015 12:19:20 +0000
Message-ID: <F9E85480F62349458DF67CE8BA000D8D4076D50F@DE08W1303.global.ds.honeywell.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.138.138.187]
MIME-Version: 1.0
X-CFilter-Loop: Forwarded
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.61.26.153; CTRY:US; IPV:NLI; EFV:NLI;
	BMV:1; SFV:NSPM;
	SFS:(10019020)(51164003)(189002)(199003)(2351001)(229853001)(19617315012)(107886001)(110136001)(105586002)(19625215002)(33656002)(16796002)(106466001)(84326002)(512954002)(55846006)(16236675004)(46102003)(6806004)(62966003)(54356999)(50986999)(19580395003)(102836002)(66066001)(87936001)(2656002)(19300405004)(77096005)(15975445007)(450100001)(77156002)(86362001)(2900100001)(2501003)(92566002)(2930100002)(2920100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN1PR07MB1470;
	H:DE08W1025.honeywell.com; FPR:; SPF:Neutral; MLV:sfv; MX:1; A:1;
	LANG:en; 
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1PR07MB1470;
X-Microsoft-Antispam-PRVS: <SN1PR07MB1470BE51FEA53D8E595B9EB0F8FA0@SN1PR07MB1470.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006); SRVR:SN1PR07MB1470; BCL:0;
	PCL:0; RULEID:; SRVR:SN1PR07MB1470; 
X-Forefront-PRVS: 054231DC40
X-OriginatorOrg: Honeywell.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2015 12:19:47.0572 (UTC)
X-MS-Exchange-CrossTenant-Id: 96ece526-9c7d-48b0-8daf-8b93c90a5d18
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=96ece526-9c7d-48b0-8daf-8b93c90a5d18;
	Ip=[199.61.26.153]; Helo=[DE08W1025.honeywell.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR07MB1470
Subject: interest to integrate virt-manager?
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
X-List-Received-Date: Fri, 10 Apr 2015 12:53:11 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_F9E85480F62349458DF67CE8BA000D8D4076D50FDE08W1303global_"

--_000_F9E85480F62349458DF67CE8BA000D8D4076D50FDE08W1303global_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I managed to build virt-manager (plus virt-viewer and the virt-* scipts) fo=
r Yocto, so I wonder if you would be interested to integrate the virt-manag=
er (and related bitbake recipes) into the meta-virtualization? Or is there =
another recommended graphical manager for KVM?
https://virt-manager.org/

New virt-manager releases unfortunately require python-pygobject 3.0, which=
 is (seems to be) not supported in Yocto (yet). I wanted to avoid the GObje=
ct Introspection (dependency on meta-gir), so I have scripts for virt-manag=
er 0.9.5 only, which is the latest GTK2 release. (It's better than nothing.=
)

Shall I just post the .bb files (or a long list of patches), or would you p=
refer another approach? The virt-manager depends on gtk-vnc and few python-=
* packages that I also had to create. Should the new python-* packages requ=
ired by virt-manager go also into meta-virtualization (as no one else is ap=
parently using them), or shall these go into some other layer?

Please advise.


Cheers,
Petr


--_000_F9E85480F62349458DF67CE8BA000D8D4076D50FDE08W1303global_
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
	{margin:0cm;
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
	font-size:10.0pt;
	font-family:"Calibri","sans-serif";}
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
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I managed to build virt-manager (plus virt-viewer an=
d the virt-* scipts) for Yocto, so I wonder if you would be interested to i=
ntegrate the virt-manager (and related bitbake recipes) into the meta-virtu=
alization? Or is there another recommended
 graphical manager for KVM?<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://virt-manager.org/">https://virt-m=
anager.org/</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">New virt-manager releases unfortunately require pyth=
on-pygobject 3.0, which is (seems to be) not supported in Yocto (yet). I wa=
nted to avoid the GObject Introspection (dependency on meta-gir), so I have=
 scripts for virt-manager 0.9.5 only,
 which is the latest GTK2 release. (It&#8217;s better than nothing.)<o:p></=
o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Shall I just post the .bb files (or a long list of p=
atches), or would you prefer another approach? The virt-manager depends on =
gtk-vnc and few python-* packages that I also had to create. Should the new=
 python-* packages required by virt-manager
 go also into meta-virtualization (as no one else is apparently using them)=
, or shall these go into some other layer?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Please advise.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Cheers,<o:p></o:p></p>
<p class=3D"MsoNormal">Petr<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_F9E85480F62349458DF67CE8BA000D8D4076D50FDE08W1303global_--
