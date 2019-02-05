Return-Path: <TNordqvist@luxoft.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 323E7E00BAB; Tue,  5 Feb 2019 07:22:35 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from mx02.luxoft.com (mx02.luxoft.com [109.166.244.72])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 13521E0048C
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 Feb 2019 07:22:31 -0800 (PST)
X-AuditID: ac1e1348-4edff70000000417-db-5c59aa354fbb
Received: from ORO-EDGE-02.luxoft.com (oro-edge-02.luxoft.com [172.30.19.22])
	(using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by mx02.luxoft.com (Symantec Messaging Gateway) with SMTP id
	8C.F9.01047.53AA95C5; Tue,  5 Feb 2019 17:22:29 +0200 (EET)
Received: from oro-exch-05.luxoft.com (172.25.192.35) by
	oro-edge-02.luxoft.com (172.30.19.22) with Microsoft SMTP Server (TLS)
	id 14.3.408.0; Tue, 5 Feb 2019 17:22:25 +0200
Received: from oro-exch-05.luxoft.com (172.25.192.35) by
	oro-exch-05.luxoft.com (172.25.192.35) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P521) id
	15.1.1466.3; Tue, 5 Feb 2019 17:22:29 +0200
Received: from oro-exch-05.luxoft.com ([fe80::601d:1cd3:3a61:5b71]) by
	oro-exch-05.luxoft.com ([fe80::601d:1cd3:3a61:5b71%14]) with mapi id
	15.01.1466.003; Tue, 5 Feb 2019 17:22:29 +0200
From: "Nordqvist, Therese" <TNordqvist@luxoft.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: LXC 3.1 in thud?
Thread-Index: AQHUvWaW8cmZPE1eSkSv6/cPvw54dQ==
Date: Tue, 5 Feb 2019 15:22:29 +0000
Message-ID: <2a468100b7c94734bcb79d6ddb55c141@luxoft.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.30.19.68]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprALMWRmVeSWpSXmKPExsWyRk5YTNd0VWSMwao7Vha3DxxhdmD0aD/R
	xxbAGMVlk5Kak1mWWqRvl8CVceaff0G3esXxFZ2MDYzfFLsYOTkkBEwkri/+ytrFyMUhJLCJ
	SeLA9gnsEM5GRol3XyayQDifGSXOXXrDDOHsY5Ro6dvHDtLPJmAksWL5AjBbRCBY4v2yOywg
	trCApMTiv09ZIOJyEo/aj0PV6EncvPKeFcRmEVCRmPvlCxuIzStgKTF3yV6wOKOAmMT3U2uY
	QGxmAXGJW0/mM0HcKiCxZM95ZghbVOLl43+sELaCROfTRnaI+kSJ/bMWsELMFJQ4OfMJ2A1C
	AkoSbVMeMU9gFJmFZOwsJC2zkLQsYGRexSiaX5SvW5ybrmtgopdTWpGfVqKXnJ+7iRES5h47
	GD8eTjnEyMTBKdXAWP52m0Gqt/qB9O3hx1ji+p7Ke3BJMqlPEODt0csMOcp4SsT/xuEfRmFs
	b9d/auV9rf8umGH28Z/GKWu7V7MsTb9W+ur0+4XTJ3vIM51tnlrfHWxTGdZsEpzwf/ELF9YF
	RSonndcs+2QhJ3nTzLVnkrLHxvgzYjuNnxW/FZxb8ZHvapIrz+Y/SizFGYmGWsxFxYkAA1id
	/yMCAAA=
Subject: LXC 3.1 in thud?
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
X-List-Received-Date: Tue, 05 Feb 2019 15:22:35 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_2a468100b7c94734bcb79d6ddb55c141luxoftcom_"

--_000_2a468100b7c94734bcb79d6ddb55c141luxoftcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,


I'm working in a project which uses meta-virtualization (http://pelux.io), =
do you know if there are any plans to include the LXC bump to 3.1.0 in the =
thud branch?

https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=
=3D2387a8876e4aaa52143a623ae5000cf064e55a64


If you are interesting in our github repo: https://github.com/Pelagicore/pe=
lux-manifests


Best regards,
Therese Nordqvist
Software Engineer

Luxoft Sweden AB
=D6stra Hamngatan 16
411 09 Gothenburg
Sweden

M: +46 732 332464
E: TNordqvist@luxoft.com

luxoft.com

Registered Office Gothenburg, Sweden
Registration No. 556780-4199

________________________________

This e-mail and any attachment(s) are intended only for the recipient(s) na=
med above and others who have been specifically authorized to receive them.=
 They may contain confidential information. If you are not the intended rec=
ipient, please do not read this email or its attachment(s). Furthermore, yo=
u are hereby notified that any dissemination, distribution or copying of th=
is e-mail and any attachment(s) is strictly prohibited. If you have receive=
d this e-mail in error, please immediately notify the sender by replying to=
 this e-mail and then delete this e-mail and any attachment(s) or copies th=
ereof from your system. Thank you.

--_000_2a468100b7c94734bcb79d6ddb55c141luxoftcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p></p>
<p>Hello,</p>
<p><br>
</p>
<p>I'm working in a project which uses meta-virtualization (<a href=3D"http=
://pelux.io" target=3D"_blank" rel=3D"noopener noreferrer" class=3D"x_OWAAu=
toLink" id=3D"LPlnk275466" previewremoved=3D"true">http://pelux.io</a>), do=
 you know if there are any plans to include
 the LXC bump to 3.1.0 in the thud branch?</p>
<p><a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualizatio=
n/commit/?id=3D2387a8876e4aaa52143a623ae5000cf064e55a64" target=3D"_blank" =
rel=3D"noopener noreferrer" class=3D"x_OWAAutoLink" id=3D"LPlnk886932" prev=
iewremoved=3D"true">https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtual=
ization/commit/?id=3D2387a8876e4aaa52143a623ae5000cf064e55a64</a></p>
<p><br>
</p>
<span class=3D"x_OWAAutoLink">If you are interesting in our github repo:</s=
pan><a href=3D"https://github.com/Pelagicore/pelux-manifests" target=3D"_bl=
ank" rel=3D"noopener noreferrer" class=3D"x_OWAAutoLink" id=3D"LPlnk97143" =
previewremoved=3D"true"> https://github.com/Pelagicore/pelux-manifests</a><=
br>
<p></p>
<p><br>
</p>
<div id=3D"Signature">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size: 12pt; colo=
r: rgb(0, 0, 0); font-family: Calibri, Helvetica, sans-serif, &quot;EmojiFo=
nt&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoCo=
lorEmoji, &quot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymb=
ols;">
<div style=3D"font-family:Tahoma; font-size:13px">
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:10pt"=
>
<div class=3D"PlainText">Best regards, &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; <br>
Therese Nordqvist<br>
Software Engineer<br>
<br>
Luxoft Sweden AB<br>
=D6stra Hamngatan 16<br>
411 09 Gothenburg<br>
Sweden<br>
<br>
M: &#43;46 732 332464 <br>
E: TNordqvist@luxoft.com<br>
</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText"><span style=3D"font-size:10pt">luxoft.com</span><b=
r>
</div>
<div class=3D"PlainText">&nbsp;<br>
Registered Office Gothenburg, Sweden<br>
Registration No. 556780-4199</div>
</span></font></div>
</div>
</div>
</div>
</div>
<br>
<hr>
<font face=3D"Arial" color=3D"Gray" size=3D"1"><br>
This e-mail and any attachment(s) are intended only for the recipient(s) na=
med above and others who have been specifically authorized to receive them.=
 They may contain confidential information. If you are not the intended rec=
ipient, please do not read this
 email or its attachment(s). Furthermore, you are hereby notified that any =
dissemination, distribution or copying of this e-mail and any attachment(s)=
 is strictly prohibited. If you have received this e-mail in error, please =
immediately notify the sender by
 replying to this e-mail and then delete this e-mail and any attachment(s) =
or copies thereof from your system. Thank you.<br>
</font>
</body>
</html>

--_000_2a468100b7c94734bcb79d6ddb55c141luxoftcom_--
