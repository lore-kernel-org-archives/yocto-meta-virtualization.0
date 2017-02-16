Return-Path: <Muhammad_Sheheryar@mentor.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6C383E00A0C; Wed, 15 Feb 2017 23:20:55 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [192.94.38.131 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2DAEAE009CF
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Feb 2017 23:20:53 -0800 (PST)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-MBX-04.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1ceGN3-0004Lr-38 from Muhammad_Sheheryar@mentor.com 
	for meta-virtualization@yoctoproject.org;
	Wed, 15 Feb 2017 23:20:53 -0800
Received: from SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) by
	SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) with Microsoft SMTP
	Server (TLS) id 15.0.1210.3; Thu, 16 Feb 2017 07:20:50 +0000
Received: from SVR-IES-MBX-04.mgc.mentorg.com ([fe80::9dd6:2f1c:ad6:d35f]) by
	SVR-IES-MBX-04.mgc.mentorg.com ([fe80::9dd6:2f1c:ad6:d35f%22]) with
	mapi id 15.00.1210.000; Thu, 16 Feb 2017 07:20:50 +0000
From: "Sheheryar, Muhammad" <Muhammad_Sheheryar@mentor.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: Building docker.
Thread-Index: AQHSiCUHSCM4slISW0evUZYaUN3+pQ==
Date: Thu, 16 Feb 2017 07:20:50 +0000
Message-ID: <1487229649771.51087@mentor.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.87]
MIME-Version: 1.0
Subject: Building docker.
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
X-List-Received-Date: Thu, 16 Feb 2017 07:20:55 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_148722964977151087mentorcom_"

--_000_148722964977151087mentorcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,


I am trying to build docker in yocto project (fido). For this I have added =
the 'fido' branch of meta-virtualization layer and its dependencies. Howeve=
r, the build is failing because the do_compile function for go cross-compli=
er is failing. Can you help me with this issue?


Regards,


Muhammad Sheheryar Qureshi

--_000_148722964977151087mentorcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!--P{margin-top:0;margin-b=
ottom:0;} --></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p>Hi,</p>
<p><br>
</p>
<p>I am trying to build docker in yocto project (fido). For this I have add=
ed the 'fido' branch of meta-virtualization layer and its dependencies. How=
ever, the build is failing because the do_compile function for go cross-com=
plier is failing. Can you help me
 with this issue?</p>
<p><br>
</p>
<p>Regards,</p>
<p><br>
</p>
<p>Muhammad Sheheryar Qureshi <br>
</p>
</body>
</html>

--_000_148722964977151087mentorcom_--
