Return-Path: <tpradeep@cisco.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AA799E00944; Fri, 30 Mar 2018 01:00:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [173.37.86.72 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM
	white-list
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 61 seconds by postgrey-1.32 at yocto-www;
	Fri, 30 Mar 2018 01:00:02 PDT
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 77BE9E00529
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Mar 2018 01:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=13101; q=dns/txt;
	s=iport; t=1522396802; x=1523606402;
	h=from:to:subject:date:message-id:mime-version;
	bh=vUuUFQgvoHUOocBzz6aV064Q7x4mPls37SFJfTRcPMM=;
	b=myg+X5n0YUanvWQfPxaVbXux8qcTdrxZZn/bxYRYbvwjGrYFWzbT0+rF
	ROy5z2+6FuHWpU6g4wBiKAIEsRSq8v0fDGbIb6CG691Uryyw4C8Tp1rpt
	mS5iwr1SurkEqz+HmAmXUxZT4Sn3ap+0emUDqOZ1AUYMoZP71l4ZK+JER w=;
X-Files: image001.png, image002.gif : 2649, 134
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AqAQBa7b1a/4cNJK1dGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAYJNdWFvKAqLUo0CgRcBgWuNbYRkFIFmCAECJYFVgwoChCE?=
	=?us-ascii?q?hNBgBAgEBAQEBAQJrHQuFMCAIATYjBAEPFgEBAR8JBRAEAgkMFBIBBBIBCAa?=
	=?us-ascii?q?CVYIqD60CgmtRiEuCHw8Fhl97ghMlDoMPgxw4CwEBAQEYgQUKARIBJQYLH4R?=
	=?us-ascii?q?+IAKHCwE2hGqEFoNuAYIZawgChQEBTYZHgg2BNzqDHYYfgQ6PUwIREwGBJAE?=
	=?us-ascii?q?cOGFxcBWCfQkKkDpvAYxuDRiBCIEXAQE?=
X-IronPort-AV: E=Sophos;i="5.48,380,1517875200"; 
	d="gif'147?png'147,150?scan'147,150,208,217,147,150";a="375570908"
Received: from alln-core-2.cisco.com ([173.36.13.135])
	by rcdn-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Mar 2018 07:59:00 +0000
Received: from XCH-ALN-015.cisco.com (xch-aln-015.cisco.com [173.36.7.25])
	by alln-core-2.cisco.com (8.14.5/8.14.5) with ESMTP id w2U7x07d026982
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Mar 2018 07:59:00 GMT
Received: from xch-rcd-011.cisco.com (173.37.102.21) by XCH-ALN-015.cisco.com
	(173.36.7.25) with Microsoft SMTP Server (TLS) id 15.0.1320.4;
	Fri, 30 Mar 2018 02:58:59 -0500
Received: from xch-rcd-011.cisco.com ([173.37.102.21]) by
	xch-rcd-011.cisco.com ([173.37.102.21]) with mapi id 15.00.1320.000;
	Fri, 30 Mar 2018 02:58:53 -0500
From: "Shakthi Pradeep (tpradeep)" <tpradeep@cisco.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: Include Docker in core-image-full-cmdline
Thread-Index: AdPH/LMUbIP5SERSQOq62BfHmWMf3g==
Date: Fri, 30 Mar 2018 07:58:53 +0000
Message-ID: <f2b90721d130471e931ec671e5557f15@xch-rcd-011.cisco.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.65.57.146]
MIME-Version: 1.0
Subject: Include Docker in core-image-full-cmdline
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
X-List-Received-Date: Fri, 30 Mar 2018 08:00:03 -0000
X-Groupsio-MsgNum: 3271
Content-Language: en-US
Content-Type: multipart/related;
	boundary="_005_f2b90721d130471e931ec671e5557f15xchrcd011ciscocom_";
	type="multipart/alternative"

--_005_f2b90721d130471e931ec671e5557f15xchrcd011ciscocom_
Content-Type: multipart/alternative;
	boundary="_000_f2b90721d130471e931ec671e5557f15xchrcd011ciscocom_"

--_000_f2b90721d130471e931ec671e5557f15xchrcd011ciscocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Team,

I am trying to include Docker in my final image (core-image-full-cmdline).

Included virtualization in build/config/local.conf

DISTRO_FEATURES_append =3D " systemd virtualization"

With above change too I don't see Docker in my final image.

Request you to point me to some document which explains how I can do it.


Regards,
Shakthi


[http://www.cisco.com/c/dam/assets/email-signature-tool/logo_08.png?ct=3D14=
37626746093]

Shakthi Pradeep
ENGINEER.SOFTWARE ENGINEERING

tpradeep@cisco.com<mailto:tpradeep@cisco.com>
Phone: +91 80 4426 8312
Mobile: +91 99 00 265 156


Cisco.com<http://www.cisco.com/>



[http://www.cisco.com/assets/swa/img/thinkbeforeyouprint.gif] Think before =
you print.

This email may contain confidential and privileged material for the sole us=
e of the intended recipient. Any review, use, distribution or disclosure by=
 others is strictly prohibited. If you are not the intended recipient (or a=
uthorized to receive for the recipient), please contact the sender by reply=
 email and delete all copies of this message.
Please click here<http://www.cisco.com/web/about/doing_business/legal/cri/i=
ndex.html> for Company Registration Information.




--_000_f2b90721d130471e931ec671e5557f15xchrcd011ciscocom_
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
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
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
	font-family:"Calibri",sans-serif;}
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
	font-family:"Calibri",sans-serif;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello Team,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am trying to include Docker in my final image (cor=
e-image-full-cmdline).
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Included virtualization in build/config/local.conf<o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">DISTRO_FEATURES_append =3D &quot; systemd virtualiza=
tion&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">With above change too I don&#8217;t see Docker in my=
 final image.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Request you to point me to some document which expla=
ins how I can do it.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Shakthi<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"0" style=3D"width:407.25pt">
<tbody>
<tr>
<td colspan=3D"3" style=3D"padding:0in 0in 0in 0in">
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,serif"><img width=3D"110" height=3D"73" id=3D"Picture_x=
0020_1" src=3D"cid:image001.png@01D3C82B.08CE19B0" alt=3D"http://www.cisco.=
com/c/dam/assets/email-signature-tool/logo_08.png?ct=3D1437626746093"><o:p>=
</o:p></span></p>
</td>
</tr>
<tr>
<td nowrap=3D"" valign=3D"top" style=3D"padding:0in 0in 0in .25in">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><b><span style=3D"font-size:8.5pt;font-family:&quot;Arial&quot;,sa=
ns-serif;color:#666666">Shakthi Pradeep</span></b><span style=3D"font-size:=
8.5pt;font-family:&quot;Arial&quot;,sans-serif;color:#666666"><br>
ENGINEER.SOFTWARE ENGINEERING<br>
<br>
<a href=3D"mailto:tpradeep@cisco.com"><span style=3D"color:#666666;text-dec=
oration:none">tpradeep@cisco.com</span></a><br>
Phone:&nbsp;<b>&#43;91 80 4426 8312</b><br>
Mobile:&nbsp;<b>&#43;91 99 00 265 156</b><o:p></o:p></span></p>
</td>
<td width=3D"50%" valign=3D"top" style=3D"width:50.0%;padding:11.25pt 0in 7=
.5pt 15.0pt">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:8.5pt;font-family:&quot;Arial&quot;,sans-=
serif;color:#666666"><br>
<a href=3D"http://www.cisco.com/"><span style=3D"color:#666666;text-decorat=
ion:none">Cisco.com</span></a><o:p></o:p></span></p>
</td>
<td style=3D"padding:0in 0in 0in 0in"></td>
</tr>
<tr>
<td colspan=3D"3" style=3D"padding:0in 0in 0in 0in"></td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,serif;display:none"><o:p>&nbsp;</o:p></span></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"0" style=3D"width:300.0pt">
<tbody>
<tr>
<td style=3D"padding:3.75pt 15.0pt 0in .25in">
<p class=3D"MsoNormal"><span style=3D"font-size:7.5pt;font-family:&quot;Ari=
al&quot;,sans-serif;color:#009900"><img border=3D"0" width=3D"18" height=3D=
"19" id=3D"Picture_x0020_2" src=3D"cid:image002.gif@01D3C82B.08CE19B0" alt=
=3D"http://www.cisco.com/assets/swa/img/thinkbeforeyouprint.gif">&nbsp;Thin=
k
 before you print.<o:p></o:p></span></p>
</td>
</tr>
<tr>
<td style=3D"padding:5.25pt 15.0pt 4.5pt .25in">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:7.5pt;font-family:&quot;Arial&quot;,sans-=
serif;color:#999999">This email may contain confidential and privileged mat=
erial for the sole use of the intended recipient.
 Any review, use, distribution or disclosure by others is strictly prohibit=
ed. If you are not the intended recipient (or authorized to receive for the=
 recipient), please contact the sender by reply email and delete all copies=
 of this message.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:7.5pt;font-family:&quot;Arial&quot;,sans-=
serif;color:#999999">Please&nbsp;<a href=3D"http://www.cisco.com/web/about/=
doing_business/legal/cri/index.html" title=3D"Legal Information"><span styl=
e=3D"color:#0E58A0">click
 here</span></a>&nbsp;for Company Registration Information.<o:p></o:p></spa=
n></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_f2b90721d130471e931ec671e5557f15xchrcd011ciscocom_--

--_005_f2b90721d130471e931ec671e5557f15xchrcd011ciscocom_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=2649;
	creation-date="Fri, 30 Mar 2018 07:58:52 GMT";
	modification-date="Fri, 30 Mar 2018 07:58:52 GMT"
Content-ID: <image001.png@01D3C82B.08CE19B0>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAG4AAABJCAYAAADc8hN1AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJ
bWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdp
bj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6
eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0
NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJo
dHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlw
dGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAv
IiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RS
ZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpD
cmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNl
SUQ9InhtcC5paWQ6Mjk2MTRENjVCQTU1MTFFMzkxRDA4ODFFNUNDMzM3QzAiIHhtcE1NOkRvY3Vt
ZW50SUQ9InhtcC5kaWQ6Mjk2MTRENjZCQTU1MTFFMzkxRDA4ODFFNUNDMzM3QzAiPiA8eG1wTU06
RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDoyOTYxNEQ2M0JBNTUxMUUzOTFE
MDg4MUU1Q0MzMzdDMCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDoyOTYxNEQ2NEJBNTUxMUUz
OTFEMDg4MUU1Q0MzMzdDMCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1w
bWV0YT4gPD94cGFja2V0IGVuZD0iciI/PuJWD/MAAAbNSURBVHja7F1pbBVVFL7lvVbAFqxiXNis
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
Inf4R4ABACChbSCPwolvAAAAAElFTkSuQmCC

--_005_f2b90721d130471e931ec671e5557f15xchrcd011ciscocom_
Content-Type: image/gif; name="image002.gif"
Content-Description: image002.gif
Content-Disposition: inline; filename="image002.gif"; size=134;
	creation-date="Fri, 30 Mar 2018 07:58:52 GMT";
	modification-date="Fri, 30 Mar 2018 07:58:52 GMT"
Content-ID: <image002.gif@01D3C82B.08CE19B0>
Content-Transfer-Encoding: base64

R0lGODlhEgATAIEAAAAAAP///wCZAP///yH/C05FVFNDQVBFMi4wAwEBAAAh+QQBAAADACwAAAAA
EgATAAAIRAADCBxIsKDBgwEECEB4UKFChgYfQiTocOHEhBUtTqx4ESNHiBkddpQ4MKTJkAJPqgSp
MmPEliRLwny5smBLhCZZKgwIADs=

--_005_f2b90721d130471e931ec671e5557f15xchrcd011ciscocom_--
