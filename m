Return-Path: <Eric.Zaluzec@emerson.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 25D61E00CE4; Thu,  1 Sep 2016 06:28:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	HTTPS_HTTP_MISMATCH,RCVD_IN_DNSWL_LOW,RCVD_IN_SORBS_SPAM autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [68.232.143.92 listed in list.dnswl.org]
	*  1.0 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [68.232.143.92 listed in dnsbl.sorbs.net]
	*  2.0 HTTPS_HTTP_MISMATCH BODY: HTTPS_HTTP_MISMATCH
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
X-Greylist: delayed 62 seconds by postgrey-1.32 at yocto-www;
	Thu, 01 Sep 2016 06:28:16 PDT
Received: from esa6.emerson-outbound.iphmx.com
	(esa6.emerson-outbound.iphmx.com [68.232.143.92])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5C3D6E00D25
	for <meta-virtualization@yoctoproject.org>;
	Thu,  1 Sep 2016 06:28:16 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.30,267,1470700800"; d="scan'208,217";a="40417511"
Received: from usstlz-pinfez07.extemr.org ([144.191.128.191])
	by esa6.emerson-outbound.iphmx.com with ESMTP/TLS/AES128-SHA;
	01 Sep 2016 13:26:56 +0000
Received: from USSTLZ-PMSG003.emrsn.org (10.16.72.185) by mail.emerson.com
	(10.16.8.80) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 1 Sep 2016 13:27:08 +0000
Received: from USSTLZ-PMSG009.emrsn.org ([169.254.1.184]) by
	USSTLZ-PMSG003.emrsn.org ([169.254.7.227]) with mapi id 14.03.0224.002;
	Thu, 1 Sep 2016 13:26:29 +0000
From: <Eric.Zaluzec@Emerson.com>
To: <meta-virtualization@yoctoproject.org>
Thread-Topic: Question : meta-virtualization - go-net_hg, go-sqlite_hg
Thread-Index: AdIEVFZTc0B3ioABQmmzVN1+lbrxUg==
Message-ID: <12AA5F6040E511488357736B31FF0DAB5B5D4BC9@USSTLZ-PMSG009.emrsn.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.19.249.14]
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 23 Dec 2016 16:01:39 -0800
Cc: Eric.Zaluzec@gmail.com
Subject: Question : meta-virtualization - go-net_hg, go-sqlite_hg
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
Date: Thu, 01 Sep 2016 13:28:37 -0000
X-Original-Date: Thu, 1 Sep 2016 13:26:29 +0000
X-List-Received-Date: Thu, 01 Sep 2016 13:28:37 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_12AA5F6040E511488357736B31FF0DAB5B5D4BC9USSTLZPMSG009em_"

--_000_12AA5F6040E511488357736B31FF0DAB5B5D4BC9USSTLZPMSG009em_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,
I am working with a Yocto project based from the fido branch. Some requirem=
ents came in to build and install docker with our yocto project's images. T=
his brought me to meta-virtualization!
I pulled the yocto fido branch of meta-virtualization and built it with my =
project. I ran into two do_fetch failure to fetch error messages.

1)      The recipes-devtools/go/go-sqlite_hg.bb<http://go-sqlite_hg.bb> fai=
led to fetch. I modified the SRC_URI to 'SRC_URI =3D https://storage.google=
apis.com/google-code-archive-source/v2/code.google.com/gosqlite/source-arch=
ive.zip' and the package was able to fetch, install and package!

2)      The recipes-devtools/go/go-net_hg.bb<http://go-net_hg.bb> failed to=
 fetch. I learned from https://code.google.com/archive/redirect/a/code.goog=
le.com/p/go?movedTo=3Dhttps:%2F%2Fgithub.com%2Fgolang%2Fgo, that go-net has=
 moved from google.code to github.com/golang/go<http://github.com/golang/go=
>.
https://github.com/golang/go.
I attempted to modified the SRC_URI, but I am unable to find the same revis=
ion since it has switched repositories.
SRCREV =3D "84a4013f96e01fdd14b65d260a78b543e3702ee1"

Are you able to share with me a .zip or tarball file which includes this SR=
CREV of go-net? Or are you able to locate the code.google revision ID to a =
commit in github and share this information?
Any input, comments, or feedback would be greatly appreciated. I look forwa=
rd to implement meta-virtualization into my Yocto project.
Cheers,
-Eric Zaluzec
Eric.Zaluzec@Emerson.com<mailto:Eric.Zaluzec@Emerson.com>


--_000_12AA5F6040E511488357736B31FF0DAB5B5D4BC9USSTLZPMSG009em_
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
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
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
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">I am working with a Yocto project based from the fido branch. Some=
 requirements came in to build and install docker with our yocto project&#8=
217;s images. This brought me to meta-virtualization!<br>
I pulled the yocto fido branch of meta-virtualization and built it with my =
project. I ran into two do_fetch failure to fetch error messages.
<o:p></o:p></p>
<p style=3D"margin-bottom:12.0pt"><span style=3D"font-size:11.0pt;font-fami=
ly:&quot;Calibri&quot;,&quot;sans-serif&quot;">1)&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; The recipes-devtools/go/<a href=3D"http://go-sqlite_hg.bb" target=3D"_=
blank">go-sqlite_hg.bb</a> failed to fetch. I modified the SRC_URI to &#821=
6;SRC_URI =3D
<a href=3D"https://storage.googleapis.com/google-code-archive-source/v2/cod=
e.google.com/gosqlite/source-archive.zip" target=3D"_blank">
https://storage.googleapis.com/google-code-archive-source/v2/code.google.co=
m/gosqlite/source-archive.zip</a>&#8217; and the package was able to fetch,=
 install and package!<o:p></o:p></span></p>
<p><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sa=
ns-serif&quot;">2)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The recipes-devtools/go/<a=
 href=3D"http://go-net_hg.bb" target=3D"_blank">go-net_hg.bb</a> failed to =
fetch. I learned from
<a href=3D"https://code.google.com/archive/redirect/a/code.google.com/p/go?=
movedTo=3Dhttps:%2F%2Fgithub.com%2Fgolang%2Fgo" target=3D"_blank">
https://code.google.com/archive/redirect/a/code.google.com/p/go?movedTo=3Dh=
ttps:%2F%2Fgithub.com%2Fgolang%2Fgo</a>, that go-net has moved from google.=
code to
<a href=3D"http://github.com/golang/go" target=3D"_blank">github.com/golang=
/go</a>.<br>
<a href=3D"https://github.com/golang/go" target=3D"_blank">https://github.c=
om/golang/go</a>.
<br>
I attempted to modified the SRC_URI, but I am unable to find the same revis=
ion since it has switched repositories.
<br>
SRCREV =3D &#8220;84a4013f96e01fdd14b65d260a78b543e3702ee1&#8221;<br>
<br>
Are you able to share with me a .zip or tarball file which includes this SR=
CREV of go-net? Or are you able to locate the code.google revision ID to a =
commit in github and share this information?
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">Any input, comments, or feedback would be greatly appreciated. I l=
ook forward to implement meta-virtualization into my Yocto project.<o:p></o=
:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">Cheers,<br>
-Eric Zaluzec<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><a href=3D"mailto:Eric.Zaluzec@Emerson.com" target=3D"_blank">Eric=
.Zaluzec@Emerson.com</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_12AA5F6040E511488357736B31FF0DAB5B5D4BC9USSTLZPMSG009em_--
