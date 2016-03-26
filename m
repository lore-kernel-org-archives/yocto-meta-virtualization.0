Return-Path: <Arun.Biyani@us.bosch.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8CD5CE00C31; Sat, 26 Mar 2016 12:27:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE,RCVD_IN_DNSWL_HI autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [139.15.237.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from smtp6-v.fe.bosch.de (smtp6-v.fe.bosch.de [139.15.237.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 27EE4E008A7
	for <meta-virtualization@yoctoproject.org>;
	Sat, 26 Mar 2016 12:27:07 -0700 (PDT)
Received: from vsmta12.fe.internet.bosch.com (unknown [10.4.98.52])
	by imta24.fe.bosch.de (Postfix) with ESMTP id B8F9ED80002
	for <meta-virtualization@yoctoproject.org>;
	Sat, 26 Mar 2016 20:27:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=us.bosch.com;
	s=2015-01-21; t=1459020426;
	bh=d4DODK0wP9xGYP8g1ZKjHklMio+EWKXPsdawx6cyEtg=; l=10;
	h=From:From:Reply-To:Sender;
	b=M89a8VolG+8WMVtHPSVeRfD2IpVULMNg7q00FwUPcXycDNdCJOsmhJUhUU9EjCy3R
	hMXVZNpxKmRvSMhSde43zJEUz6X0KFGkVrNdAy0VLAf/aLOJYSZMpd0cYbRyf17vtn
	2TB+qPNiVmDTW5TRLPDy5IN3p3LZ3Xjj7dnopi/A=
Received: from FE-MBX1006.de.bosch.com (vsgw24.fe.internet.bosch.com
	[10.4.98.24])
	by vsmta12.fe.internet.bosch.com (Postfix) with ESMTP id A2F9F1B8022A
	for <meta-virtualization@yoctoproject.org>;
	Sat, 26 Mar 2016 20:27:06 +0100 (CET)
Received: from FE-MBX1005.de.bosch.com (10.3.230.25) by
	FE-MBX1006.de.bosch.com (10.3.230.19) with Microsoft SMTP Server (TLS)
	id 15.0.1104.5; Sat, 26 Mar 2016 20:27:06 +0100
Received: from FE-MBX1005.de.bosch.com ([fe80::79fe:41f9:e629:ee17]) by
	FE-MBX1005.de.bosch.com ([fe80::79fe:41f9:e629:ee17%24]) with mapi id
	15.00.1104.000; Sat, 26 Mar 2016 20:27:06 +0100
From: "Biyani Arun (CM/ESC-NA)" <Arun.Biyani@us.bosch.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: Xen-image-minimal cannot find sleep
Thread-Index: AdGHlTxzfpvEUC8DQ2alsjjG05foGA==
Date: Sat, 26 Mar 2016 19:27:05 +0000
Message-ID: <c2c00949ff1040ffbb87b8c2d796c4a8@FE-MBX1005.de.bosch.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.225.160.143]
MIME-Version: 1.0
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22220.006
X-TMASE-MatchedRID: vLBEZJP9Igpdgvs8aKHtvk+4wmL9kCTxSNmpTpsmB/dojAWuSDNe9pVD
	ZsT0rYWC3wzCfChetFmvJcrLMYkA7zblc6Gei4nlG66tuBin4dB2L/JYguM0eyAWAsBm7Nh1vHV
	CZeuOBin3TfNrpcz9Amdy+LK6zSgL7StuD3e6xDEMH4SsGvRsA8ogYxpm9PTbdHF8YQXcY7O+vh
	fM2tGzNvdoK1MEIGGXeTjw/FyRX6QfE8yM4pjsD/7E6GNqs6ceavP8b9lJtWq1VfZrX9mxWIk/r
	cG7tBJf9BDYCfca+4rMz2+vl3oLXwZfzRfM9PCO6Ski+XbqftWNBLxxArMpsuOVwnu8RaeimpTO
	g7JwvAjLmgJBjDqhsw==
Subject: Xen-image-minimal cannot find sleep
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
X-List-Received-Date: Sat, 26 Mar 2016 19:27:12 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_c2c00949ff1040ffbb87b8c2d796c4a8FEMBX1005deboschcom_"

--_000_c2c00949ff1040ffbb87b8c2d796c4a8FEMBX1005deboschcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

My Xen image goes into an infinite loop with the message

/init: line 151: sleep: not found

Has anyone else experienced this?  Any ideas on what the cause to be? How t=
o fix this?

Best regards

Arun Biyani
CM/ESW-NA

Tel. +1(248)876-5520



--_000_c2c00949ff1040ffbb87b8c2d796c4a8FEMBX1005deboschcom_
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
<div>My Xen image goes into an infinite loop with the message</div>
<div>&nbsp;</div>
<div>/init: line 151: sleep: not found</div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div>Has anyone else experienced this?&nbsp; Any ideas on what the cause to=
 be? How to fix this?</div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div>Best regards</div>
<div>&nbsp;</div>
<div><b>Arun Biyani </b></div>
<div><b>CM/ESW-NA</b></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div>Tel. &#43;1(248)876-5520 </div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
</span></font>
</body>
</html>

--_000_c2c00949ff1040ffbb87b8c2d796c4a8FEMBX1005deboschcom_--
