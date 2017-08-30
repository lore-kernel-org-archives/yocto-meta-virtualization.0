Return-Path: <mtudan@mobilisis.hr>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0EE6BE0091D; Wed, 30 Aug 2017 08:51:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [104.47.2.47 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0047.outbound.protection.outlook.com [104.47.2.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E1D4E00349
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 Aug 2017 08:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mobilisis.onmicrosoft.com; s=selector1-mobilisis-hr;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=tu1+YhTrFNRHdpEWqIC8dE9XslTgG1OjJclXHl7Ka5k=;
	b=CF9n5swCpKBGuL3piUF/4Kfy3Cxv4bKQ4Kj9F79ofdEglVBlJL1/F50NbIOmfHIqpabDugZZNwXaRfRPe88YfKywkk9C8vZ8QbMjavCFiuXPfamIr4AAmLl70uqaqXt3o0wwr+QVzVTRkl65hrCUmjV947/fFeXiPAEITgJTHiY=
Received: from HE1PR0302MB2811.eurprd03.prod.outlook.com (10.171.96.11) by
	HE1PR0302MB2763.eurprd03.prod.outlook.com (10.171.95.144) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1385.9; Wed, 30 Aug 2017 09:17:47 +0000
Received: from HE1PR0302MB2811.eurprd03.prod.outlook.com
	([fe80::8050:8d23:f5d4:69bc]) by
	HE1PR0302MB2811.eurprd03.prod.outlook.com
	([fe80::8050:8d23:f5d4:69bc%17]) with mapi id 15.01.1385.014;
	Wed, 30 Aug 2017 09:17:47 +0000
From: =?iso-8859-2?Q?Mobilisis_=7C_Matija_Tu=F0an?= <mtudan@mobilisis.hr>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: Yocto Morty doesn't recognize Docker
Thread-Index: AdMhcNBJdQvqHl+ATmi4Ak647O0dxQ==
Date: Wed, 30 Aug 2017 09:17:46 +0000
Message-ID: <HE1PR0302MB2811338D7E45345A4A40CD9AAC9C0@HE1PR0302MB2811.eurprd03.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=mtudan@mobilisis.hr; 
x-originating-ip: [92.242.240.117]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; HE1PR0302MB2763;
	6:XxmKTIDPVy0mJK1GBUir31M++Mj1jpNK61GLS/eV/W6yFxQUKfU7df3jDhnBbsovtbJFFM3bvnUpW2RjvWLWRXdFnO6IgnFdU/lSWMgW3AmvQ4Ozo1Go8a+YHOLN21Zk0eEAYxrG/29voWHuIDAeOupDV9voT5NS9NokHuCrXoh65qvJ5eRue+f4khS55epdRKNzBJYuEn6Xa7N1MD8qbsHjLzflna0I103a5hhMs73FEZ9/wZaYI6xeX4E0RT0xF8BCrnJw3ewREeZYzb3+QDtAVbzyk02FvdzGgRoqbmbQJOmBqIyIQ2ruY/lT7EhZiupr6ahf5IPsSpIll+hkGA==;
	5:zkZBErvlMQXQNjCmEFxrJkYSMxUuepFR6I8LnIBX1tbx8KS19iQ4eTaEmmfXPb1vA3XApab+2+p+R5nu69tYL9h0VCkWxt4LwXcZLnjS4NMsODV+/d6Wv8Txmyb6vAavDgZGalA/7cl1l8L90LpifQ==;
	24:8wjlnh/x+nsXEQqGa4mV0M1OzTeaZgreXdcWQJM3qINLhR8jIHxlYWxJx4vbwohoWkveot3FNe7HNjMQj3655nUUOABsqQDzD5s8J+ESbys=;
	7:KyWhhuCzcG2MiDewOKfjVun6ip1zYS4C8iyYZKN8dcHdSkshK7ggp8BHRMvEHWMRqmdkNe/V853HQPeCcd/mNDkuQxoR1WEUnIbcBppyHcLnVFT+U+azERwMlayxMv2tc6og7YNK5wGKk1n7qX4x9s2wkxZhhM8mkWIVDVZ/bTx3hPlm0RH7dJJLboiSmn44I0Y101FSq5BWn/FBvsYYbvnDM/7MqGKZzLEdUSKCb1o=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: ddb034cc-7da8-45a4-761d-08d4ef87fabd
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(2017082002075)(300000503095)(300135400095)(2017052603199)(49563074)(201703131423075)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:HE1PR0302MB2763; 
x-ms-traffictypediagnostic: HE1PR0302MB2763:
x-exchange-antispam-report-test: UriScan:(21748063052155);
x-microsoft-antispam-prvs: <HE1PR0302MB2763DE21AE2436F0D5838437AC9C0@HE1PR0302MB2763.eurprd03.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(102415395)(6040450)(601004)(2401047)(5005006)(8121501046)(93006095)(93001095)(3002001)(100000703101)(100105400095)(10201501046)(6041248)(20161123558100)(20161123555025)(2016111802025)(20161123562025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(6072148)(6043046)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:HE1PR0302MB2763; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:HE1PR0302MB2763; 
x-forefront-prvs: 041517DFAB
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(199003)(189002)(54356999)(102836003)(5660300001)(99936001)(6116002)(3846002)(50986999)(2900100001)(478600001)(25786009)(14454004)(101416001)(236005)(9686003)(7736002)(54896002)(6306002)(99286003)(55016002)(7696004)(54556002)(2501003)(53936002)(6436002)(733005)(74316002)(5640700003)(2351001)(8676002)(66066001)(861006)(606006)(81166006)(86362001)(106356001)(5250100002)(105586002)(5890100001)(110136004)(81156014)(8936002)(97736004)(189998001)(74482002)(3660700001)(33656002)(68736007)(2906002)(3280700002)(6506006)(6916009);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0302MB2763;
	H:HE1PR0302MB2811.eurprd03.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: mobilisis.hr does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: mobilisis.hr
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2017 09:17:47.1332 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 49e45dc9-380e-40c7-b8b8-3ce108a4cf69
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0302MB2763
Subject: Yocto Morty doesn't recognize Docker
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
X-List-Received-Date: Wed, 30 Aug 2017 15:51:15 -0000
X-Groupsio-MsgNum: 2776
Content-Language: en-US
Content-Type: multipart/related;
	boundary="_005_HE1PR0302MB2811338D7E45345A4A40CD9AAC9C0HE1PR0302MB2811_";
	type="multipart/alternative"

--_005_HE1PR0302MB2811338D7E45345A4A40CD9AAC9C0HE1PR0302MB2811_
Content-Type: multipart/alternative;
	boundary="_000_HE1PR0302MB2811338D7E45345A4A40CD9AAC9C0HE1PR0302MB2811_"

--_000_HE1PR0302MB2811338D7E45345A4A40CD9AAC9C0HE1PR0302MB2811_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Hello,



I have troubles with integrating Docker into Yocto Morty release. I downloa=
ded meta-virtualization layer (morty branch), appended it to Yocto layers, =
appended docker package to local.conf and built the Yocto image.



As expected, Docker can be found in /usr/bin/:
root@imx7-var-som:~# ls -la /usr/bin/docker*
-rwxr-xr-x 1 root root 11658508 Aug 28 23:18 /usr/bin/docker
lrwxrwxrwx 1 root root       10 Aug 29 08:10 /usr/bin/docker-containerd -> =
containerd
lrwxrwxrwx 1 root root       14 Aug 29 08:10 /usr/bin/docker-containerd-ctr=
 -> containerd-ctr
lrwxrwxrwx 1 root root       15 Aug 29 08:10 /usr/bin/docker-containerd-shi=
m -> containerd-shim
-rwxr-xr-x 1 root root  2380960 Aug 28 23:18 /usr/bin/docker-proxy
lrwxrwxrwx 1 root root        4 Aug 29 08:10 /usr/bin/docker-runc -> runc
-rwxr-xr-x 1 root root 34721124 Aug 28 23:18 /usr/bin/dockerd
root@imx7-var-som:~#
But, when I try to run docker, I get the following error:
root@imx7-var-som:~# docker info
-sh: /usr/bin/docker: No such file or directory

This steps worked on other system running Yocto Krogoth release. Is there a=
ny reason why this wouldn't work on Morty release?


Regards,
Matija



        [cid:image002.png@01D32181.998E8B70]

Matija Tu=F0an
Hardware developer



Mobilisis d.o.o.
Vara=BEdinska ulica br. 8, II. odvojak
42000 Vara=BEdin - Jalkovec, Croatia



m.



+385 99 311 5473

t.

+385 42 311 777

f.

+385 42 493 955

w.

www.mobilisis.hr<http://www.mobilisis.hr/>



This mail is from Mobilisis d.o.o. and may contain confidential business in=
formation. It is intended solely for the use of the individual to whom it i=
s addressed. If you are not the intended recipient, please contact the send=
er and delete this message and any attachment from your system. Unauthorize=
d publication, use, dissemination, forwarding, printing or copying of this =
email and it's associated attachments is strictly prohibited.

Please consider the environment before printing this email. Thank you!





--_000_HE1PR0302MB2811338D7E45345A4A40CD9AAC9C0HE1PR0302MB2811_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Verdana;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"Century Gothic";
	panose-1:2 11 5 2 2 2 2 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
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
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1027" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"HR" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p><span style=3D"font-size:12.0pt;color:black">Hello,<o:p></o:p></span></p=
>
<p><span style=3D"font-size:12.0pt;color:black"><o:p>&nbsp;</o:p></span></p=
>
<p><span style=3D"font-size:12.0pt;color:black">I have troubles with integr=
ating Docker into Yocto Morty release. I downloaded
</span><span style=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;;=
color:black">meta-virtualization</span><span style=3D"font-size:12.0pt;colo=
r:black"> layer (morty branch), appended it to Yocto layers, appended
</span><span style=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;;=
color:black">docker</span><span style=3D"font-size:12.0pt;color:black"> pac=
kage to&nbsp;</span><span style=3D"font-size:10.0pt;font-family:&quot;Couri=
er New&quot;;color:black">local.conf</span><span style=3D"font-size:12.0pt;=
color:black">&nbsp;and
 built the Yocto image.<o:p></o:p></span></p>
<p><span style=3D"font-size:12.0pt;color:black"><o:p>&nbsp;</o:p></span></p=
>
<p><span style=3D"font-size:12.0pt;color:black">As expected, Docker can be =
found in
</span><span style=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;;=
color:black">/usr/bin/</span><span style=3D"font-size:12.0pt;color:black">:=
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Courier New&quot;;color:black">root@imx7-var-s=
om:~# ls -la /usr/bin/docker*</span><span style=3D"font-size:12.0pt;color:b=
lack"><br>
</span><span style=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;;=
color:black">-rwxr-xr-x 1 root root 11658508 Aug 28 23:18 /usr/bin/docker</=
span><span style=3D"font-size:12.0pt;color:black"><br>
</span><span style=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;;=
color:black">lrwxrwxrwx 1 root root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10 =
Aug 29 08:10 /usr/bin/docker-containerd -&gt; containerd</span><span style=
=3D"font-size:12.0pt;color:black"><br>
</span><span style=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;;=
color:black">lrwxrwxrwx 1 root root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 14 =
Aug 29 08:10 /usr/bin/docker-containerd-ctr -&gt; containerd-ctr</span><spa=
n style=3D"font-size:12.0pt;color:black"><br>
</span><span style=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;;=
color:black">lrwxrwxrwx 1 root root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 15 =
Aug 29 08:10 /usr/bin/docker-containerd-shim -&gt; containerd-shim</span><s=
pan style=3D"font-size:12.0pt;color:black"><br>
</span><span style=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;;=
color:black">-rwxr-xr-x 1 root root&nbsp; 2380960 Aug 28 23:18 /usr/bin/doc=
ker-proxy</span><span style=3D"font-size:12.0pt;color:black"><br>
</span><span style=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;;=
color:black">lrwxrwxrwx 1 root root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; 4 Aug 29 08:10 /usr/bin/docker-runc -&gt; runc</span><span style=3D"font=
-size:12.0pt;color:black"><br>
</span><span style=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;;=
color:black">-rwxr-xr-x 1 root root 34721124 Aug 28 23:18 /usr/bin/dockerd<=
/span><span style=3D"font-size:12.0pt;color:black"><br>
</span><span style=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;;=
color:black">root@imx7-var-som:~#</span><span style=3D"font-size:12.0pt;col=
or:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">But, wh=
en I try to run
</span><span style=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;;=
color:black">docker</span><span style=3D"font-size:12.0pt;color:black">, I =
get the following error:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black">root@imx7-var-som:~# docker info</span><span s=
tyle=3D"font-size:12.0pt;color:black"><br>
</span><span style=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;;=
color:black">-sh: /usr/bin/docker: No such file or directory</span><span st=
yle=3D"font-size:12.0pt;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">This st=
eps&nbsp;worked on other system running&nbsp;Yocto Krogoth release. Is ther=
e any reason why this wouldn't work on Morty release?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p><span style=3D"font-size:12.0pt;color:black">Regards,<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Matija<=
/span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"435" style=3D"width:326.05pt;border-collapse:collapse">
<tbody>
<tr style=3D"height:113.15pt">
<td width=3D"225" valign=3D"top" style=3D"width:168.45pt;padding:0cm 5.4pt =
0cm 5.4pt;height:113.15pt">
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-size:=
10.0pt;line-height:105%;mso-fareast-language:HR"><o:p>&nbsp;</o:p></span></=
p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><!--[if gte vml 1]><o:wra=
pblock><v:shapetype id=3D"_x0000_t75" coordsize=3D"21600,21600" o:spt=3D"75=
" o:preferrelative=3D"t" path=3D"m@4@5l@4@11@9@11@9@5xe" filled=3D"f" strok=
ed=3D"f">
<v:stroke joinstyle=3D"miter" />
<v:formulas>
<v:f eqn=3D"if lineDrawn pixelLineWidth 0" />
<v:f eqn=3D"sum @0 1 0" />
<v:f eqn=3D"sum 0 0 @1" />
<v:f eqn=3D"prod @2 1 2" />
<v:f eqn=3D"prod @3 21600 pixelWidth" />
<v:f eqn=3D"prod @3 21600 pixelHeight" />
<v:f eqn=3D"sum @0 0 1" />
<v:f eqn=3D"prod @6 1 2" />
<v:f eqn=3D"prod @7 21600 pixelWidth" />
<v:f eqn=3D"sum @8 21600 0" />
<v:f eqn=3D"prod @7 21600 pixelHeight" />
<v:f eqn=3D"sum @10 21600 0" />
</v:formulas>
<v:path o:extrusionok=3D"f" gradientshapeok=3D"t" o:connecttype=3D"rect" />
<o:lock v:ext=3D"edit" aspectratio=3D"t" />
</v:shapetype><v:shape id=3D"Picture_x0020_1" o:spid=3D"_x0000_s1026" type=
=3D"#_x0000_t75" style=3D'position:absolute;margin-left:6pt;margin-top:0;wi=
dth:139.5pt;height:48.15pt;z-index:251659264;visibility:visible;mso-wrap-st=
yle:square;mso-width-percent:0;mso-height-percent:0;mso-wrap-distance-left:=
9pt;mso-wrap-distance-top:0;mso-wrap-distance-right:9pt;mso-wrap-distance-b=
ottom:0;mso-position-horizontal:absolute;mso-position-horizontal-relative:t=
ext;mso-position-vertical:top;mso-position-vertical-relative:text;mso-width=
-percent:0;mso-height-percent:0;mso-width-relative:page;mso-height-relative=
:page'>
<v:imagedata src=3D"cid:image001.png@01D32181.998E8B70" o:title=3D"" cropto=
p=3D"16967f" cropbottom=3D"16708f" />
<w:wrap type=3D"topAndBottom"/>
</v:shape><![endif]--><![if !vml]><span style=3D"mso-ignore:vglayout">
<table cellpadding=3D"0" cellspacing=3D"0" align=3D"left">
<tbody>
<tr>
<td width=3D"8" height=3D"0"></td>
</tr>
<tr>
<td></td>
<td><img width=3D"186" height=3D"64" style=3D"width:1.9375in;height:.6666in=
" src=3D"cid:image002.png@01D32181.998E8B70" v:shapes=3D"Picture_x0020_1"><=
/td>
</tr>
</tbody>
</table>
</span><![endif]><!--[if gte vml 1]></o:wrapblock><![endif]--><br style=3D"=
mso-ignore:vglayout" clear=3D"ALL">
<span style=3D"font-size:10.0pt;line-height:105%;mso-fareast-language:HR"><=
o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center;line-hei=
ght:105%"><b><span style=3D"font-size:10.0pt;line-height:105%;font-family:&=
quot;Century Gothic&quot;,sans-serif;color:#00395D;mso-fareast-language:HR"=
>Matija Tu=F0an</span></b><span style=3D"font-size:10.0pt;line-height:105%;=
font-family:&quot;Century Gothic&quot;,sans-serif;color:#00395D;mso-fareast=
-language:HR"><br>
</span><span style=3D"font-size:8.0pt;line-height:105%;font-family:&quot;Ce=
ntury Gothic&quot;,sans-serif;color:#00395D;mso-fareast-language:HR">Hardwa=
re developer</span><span style=3D"font-size:7.5pt;line-height:105%;font-fam=
ily:&quot;Verdana&quot;,sans-serif;color:#00395D;mso-fareast-language:HR"><=
o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center;line-hei=
ght:105%"><span style=3D"font-size:10.0pt;line-height:105%;mso-fareast-lang=
uage:HR"><o:p>&nbsp;</o:p></span></p>
</td>
<td width=3D"210" valign=3D"top" style=3D"width:157.6pt;padding:0cm 5.4pt 0=
cm 5.4pt;height:113.15pt">
<p class=3D"MsoNormal" style=3D"line-height:105%"><b><span style=3D"mso-far=
east-language:HR"><o:p>&nbsp;</o:p></span></b></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><b><span style=3D"font-si=
ze:8.0pt;line-height:105%;font-family:&quot;Century Gothic&quot;,sans-serif=
;color:#00395D;mso-fareast-language:HR">Mobilisis d.o.o.</span></b><span st=
yle=3D"font-size:8.0pt;line-height:105%;font-family:&quot;Century Gothic&qu=
ot;,sans-serif;color:#00395D;mso-fareast-language:HR"><br>
Vara=BEdinska ulica br. 8, II. odvojak<br>
42000 Vara=BEdin - Jalkovec, Croatia<o:p></o:p></span></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0">
<tbody>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm"></td>
</tr>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-size:=
8.0pt;line-height:105%;font-family:&quot;Century Gothic&quot;,sans-serif;ms=
o-fareast-language:HR"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"mso-fareas=
t-language:HR"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-size:=
8.0pt;line-height:105%;font-family:&quot;Century Gothic&quot;,sans-serif;co=
lor:#00395D;mso-fareast-language:HR">m.<o:p></o:p></span></p>
</td>
<td style=3D"padding:0cm 0cm 0cm 2.25pt">
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-size:=
8.0pt;line-height:105%;font-family:&quot;Century Gothic&quot;,sans-serif;ms=
o-fareast-language:HR"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"mso-fareas=
t-language:HR"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-size:=
8.0pt;line-height:105%;font-family:&quot;Century Gothic&quot;,sans-serif;co=
lor:#00395D;mso-fareast-language:HR">&#43;385 99 311 5473<o:p></o:p></span>=
</p>
</td>
</tr>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-size:=
8.0pt;line-height:105%;font-family:&quot;Century Gothic&quot;,sans-serif;co=
lor:#00395D;mso-fareast-language:HR">t.<o:p></o:p></span></p>
</td>
<td style=3D"padding:0cm 0cm 0cm 2.25pt">
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-size:=
8.0pt;line-height:105%;font-family:&quot;Century Gothic&quot;,sans-serif;co=
lor:#00395D;mso-fareast-language:HR">&#43;385 42 311 777<o:p></o:p></span><=
/p>
</td>
</tr>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-size:=
8.0pt;line-height:105%;font-family:&quot;Century Gothic&quot;,sans-serif;co=
lor:#00395D;mso-fareast-language:HR">f.<o:p></o:p></span></p>
</td>
<td style=3D"padding:0cm 0cm 0cm 2.25pt">
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-size:=
8.0pt;line-height:105%;font-family:&quot;Century Gothic&quot;,sans-serif;co=
lor:#00395D;mso-fareast-language:HR">&#43;385 42 493 955<o:p></o:p></span><=
/p>
</td>
</tr>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-size:=
8.0pt;line-height:105%;font-family:&quot;Century Gothic&quot;,sans-serif;co=
lor:#00395D;mso-fareast-language:HR">w.<o:p></o:p></span></p>
</td>
<td style=3D"padding:0cm 0cm 0cm 2.25pt">
<p class=3D"MsoNormal" style=3D"line-height:105%"><b><span style=3D"font-si=
ze:8.0pt;line-height:105%;font-family:&quot;Century Gothic&quot;,sans-serif=
;color:#00395D;mso-fareast-language:HR"><a href=3D"http://www.mobilisis.hr/=
"><span style=3D"color:blue;font-weight:normal">www.mobilisis.hr</span></a>=
<o:p></o:p></span></b></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-size:=
9.0pt;line-height:105%;mso-fareast-language:HR"><o:p></o:p></span></p>
</td>
</tr>
<tr style=3D"height:63.05pt">
<td width=3D"435" colspan=3D"2" valign=3D"top" style=3D"width:326.05pt;padd=
ing:0cm 5.4pt 0cm 5.4pt;height:63.05pt">
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-size:=
7.0pt;line-height:105%;font-family:&quot;Century Gothic&quot;,sans-serif;co=
lor:#00395D;mso-fareast-language:HR"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-size:=
6.0pt;line-height:105%;font-family:&quot;Century Gothic&quot;,sans-serif;co=
lor:#00395D;mso-fareast-language:HR">This mail is from Mobilisis d.o.o. and=
 may contain confidential business information.
 It is intended solely for the use of the individual to whom it is addresse=
d. If you are not the intended recipient, please contact the sender and del=
ete this message and any attachment from your system. Unauthorized publicat=
ion, use, dissemination, forwarding,
 printing or copying of this email and it's associated attachments is stric=
tly prohibited.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-size:=
6.0pt;line-height:105%;font-family:&quot;Century Gothic&quot;,sans-serif;co=
lor:#00395D;mso-fareast-language:HR"><br>
</span><span style=3D"font-size:6.0pt;line-height:105%;font-family:&quot;Ce=
ntury Gothic&quot;,sans-serif;color:#37BC61;mso-fareast-language:HR">Please=
 consider the environment before printing this email. Thank you!</span><spa=
n style=3D"font-size:6.0pt;line-height:105%;mso-fareast-language:HR"><o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"mso-fareas=
t-language:HR"><o:p>&nbsp;</o:p></span></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:HR"><o:p>&nbsp;<=
/o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_HE1PR0302MB2811338D7E45345A4A40CD9AAC9C0HE1PR0302MB2811_--

--_005_HE1PR0302MB2811338D7E45345A4A40CD9AAC9C0HE1PR0302MB2811_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=12427;
	creation-date="Wed, 30 Aug 2017 09:17:45 GMT";
	modification-date="Wed, 30 Aug 2017 09:17:45 GMT"
Content-ID: <image001.png@01D32181.998E8B70>
Content-Transfer-Encoding: base64

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
gg==

--_005_HE1PR0302MB2811338D7E45345A4A40CD9AAC9C0HE1PR0302MB2811_
Content-Type: image/png; name="image002.png"
Content-Description: image002.png
Content-Disposition: inline; filename="image002.png"; size=9381;
	creation-date="Wed, 30 Aug 2017 09:17:45 GMT";
	modification-date="Wed, 30 Aug 2017 09:17:45 GMT"
Content-ID: <image002.png@01D32181.998E8B70>
Content-Transfer-Encoding: base64

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

--_005_HE1PR0302MB2811338D7E45345A4A40CD9AAC9C0HE1PR0302MB2811_--
