Return-Path: <Arun.Biyani@us.bosch.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BDC85E00CC6; Mon, 21 Mar 2016 04:28:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_05,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE,RCVD_IN_DNSWL_HI autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [139.15.243.226 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.5 BAYES_05 BODY: Bayes spam probability is 1 to 5%
	*      [score: 0.0365]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 551 seconds by postgrey-1.32 at yocto-www;
	Mon, 21 Mar 2016 04:28:11 PDT
Received: from imta21.fe.bosch.de (imta21.fe.bosch.de [139.15.243.226])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 63094E00CC3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Mar 2016 04:28:11 -0700 (PDT)
Received: from smtp6-v.fe.bosch.de (imta24.fe.bosch.de [139.15.243.27])
	by imta21.fe.bosch.de (Postfix) with ESMTP id 35BA6C0945
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Mar 2016 12:18:59 +0100 (CET)
Received: from vsmta12.fe.internet.bosch.com (unknown [10.4.98.52])
	by imta24.fe.bosch.de (Postfix) with ESMTP id 6D24AD8022A
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Mar 2016 12:18:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=us.bosch.com;
	s=2015-01-21; t=1458559135;
	bh=qk8moyDlpJnRTvSAZ4Qx9kffyxB3ZuBEWWIWlCE5a54=; l=10;
	h=From:From:Reply-To:Sender;
	b=XWze73RF6It4taVC1RBbb3nUpKBihRxyX7T9AjTPrfaP4zHmonTNqUjol8Pd5X27d
	Q14haXbV2JRtySUnvuY4Rjir8vIq+1DUzo0w310LiLkljovKKCNC32tGWfmSWUenc6
	rSZ6TkgO9lckpWes9oJ1fS+Rz/OtNo6MogXKj98s=
Received: from FE-MBX1006.de.bosch.com (vsgw23.fe.internet.bosch.com
	[10.4.98.23])
	by vsmta12.fe.internet.bosch.com (Postfix) with ESMTP id 644B51B80215
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Mar 2016 12:18:55 +0100 (CET)
Received: from FE-MBX1005.de.bosch.com (10.3.230.25) by
	FE-MBX1006.de.bosch.com (10.3.230.19) with Microsoft SMTP Server (TLS)
	id 15.0.1104.5; Mon, 21 Mar 2016 12:18:54 +0100
Received: from FE-MBX1005.de.bosch.com ([fe80::79fe:41f9:e629:ee17]) by
	FE-MBX1005.de.bosch.com ([fe80::79fe:41f9:e629:ee17%24]) with mapi id
	15.00.1104.000; Mon, 21 Mar 2016 12:18:55 +0100
From: "Biyani Arun (CM/ESC-NA)" <Arun.Biyani@us.bosch.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: Nothing PROVIDES 'libxl'
Thread-Index: AdGDYx4/mYYmRrZ5TH+Rk8woD4dDcA==
Date: Mon, 21 Mar 2016 11:18:54 +0000
Message-ID: <749328d420b14773bc1a7a54138271a8@FE-MBX1005.de.bosch.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.225.160.17]
MIME-Version: 1.0
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22206.006
X-TMASE-MatchedRID: hJfIhax4WNMJojDNAxR7kloS15Sc+1wzROshHNu2/QZLjXXGQy6nlGfL
	KEW7qlsHBjEZAJaWI4nhhLoXIby/KKOUVKBdY9a4Z6unGlnCDgvBbWsz5X0e0mabkefLUipm/B+
	ZbDJ0sUm5fGDZw7uVYK7sfda0feEEmxh0gY/o+Vkvj6wHfIGxyRyVg41UOfy6zbJkyMC0pHvdKU
	SBW7I322+5ieh24ZYRgDLqnrRlXraNZCyaPpOjctAtbEEX0MxBbGVEmIfjf3sBxUog4OLmZyKPP
	WlZs9B/DMQ1khXNzmEfbVVZ/rC19sjtgloSlOFBO7a3Ps4XJ7UEY2Le88GyaSpVyEi3D5mrpHIz
	MYT+wUY=
Subject: Nothing PROVIDES 'libxl'
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
X-List-Received-Date: Mon, 21 Mar 2016 11:28:13 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_749328d420b14773bc1a7a54138271a8FEMBX1005deboschcom_"

--_000_749328d420b14773bc1a7a54138271a8FEMBX1005deboschcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am trying to include Xen in my Yocto build. I have included the meta-virt=
ualization layer. However, I am
getting this error:

ERROR: Nothing PROVIDES 'libxl' ....
Close matches:
  libxslt
  libxml2
  libxv
NOTE: Runtime target 'libvirt' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libvirt', 'libxl']

What am I missing? Is libxl in meta-virtualization or somewhere else?



--_000_749328d420b14773bc1a7a54138271a8FEMBX1005deboschcom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from rtf -->
<style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left:=
 #800000 2px solid; } --></style>
</head>
<body>
<font face=3D"Arial" size=3D"2"><span style=3D"font-size:10pt;">
<div>I am trying to include Xen in my Yocto build. I have included the meta=
-virtualization layer. However, I am</div>
<div>getting this error:</div>
<div>&nbsp;</div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">ERRO=
R: Nothing PROVIDES 'libxl' &#8230;.</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Clos=
e matches:</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p; libxslt</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p; libxml2</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p; libxv</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">NOTE=
: Runtime target 'libvirt' is unbuildable, removing...</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Miss=
ing or unbuildable dependency chain was: ['libvirt', 'libxl']</span></font>=
</div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">What=
 am I missing? Is libxl in meta-virtualization or somewhere else?</span></f=
ont></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
</span></font>
</body>
</html>

--_000_749328d420b14773bc1a7a54138271a8FEMBX1005deboschcom_--
