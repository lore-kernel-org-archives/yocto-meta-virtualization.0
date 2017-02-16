Return-Path: <peter.spierenburg@nautel.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EDDEDE00510; Thu, 16 Feb 2017 13:35:13 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [104.47.32.100 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 7151 seconds by postgrey-1.32 at yocto-www;
	Thu, 16 Feb 2017 13:35:10 PST
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0100.outbound.protection.outlook.com [104.47.32.100])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 97E13E004A0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 Feb 2017 13:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nautel.onmicrosoft.com; s=selector1-nautel-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=f8p9LDrVZEI4YO471xUyGvi5jT63DfPbaxZw6lmnwKE=;
	b=nJMrvU+d83I4K8WbltmlprQLtHeMFdlLv/J1PufZBeVYcPJbZ4ht/dTOiyasXYSIda/YKa3MzBN5wSS1+WYbbqxnObNsHDJjyDqQEBVubSWzadJ/NyT941ng9IP3z2m5b3o21SSi3Kvk0CSvbl1LKDR8+QjHfWu7s7uwQ5j8etU=
Received: from BN6PR05MB2851.namprd05.prod.outlook.com (10.168.255.136) by
	BN6PR05MB2851.namprd05.prod.outlook.com (10.168.255.136) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.919.10; Thu, 16 Feb 2017 18:03:25 +0000
Received: from BN6PR05MB2851.namprd05.prod.outlook.com ([10.168.255.136]) by
	BN6PR05MB2851.namprd05.prod.outlook.com ([10.168.255.136]) with mapi id
	15.01.0919.013; Thu, 16 Feb 2017 18:03:25 +0000
From: Peter Spierenburg <peter.spierenburg@nautel.com>
To: "Sheheryar, Muhammad" <Muhammad_Sheheryar@mentor.com>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: Building docker.
Thread-Index: AQHSiCUHSCM4slISW0evUZYaUN3+paFr7Tm9
Date: Thu, 16 Feb 2017 18:03:24 +0000
Message-ID: <BN6PR05MB285130317F49AAF01D6636199E5A0@BN6PR05MB2851.namprd05.prod.outlook.com>
References: <1487229649771.51087@mentor.com>
In-Reply-To: <1487229649771.51087@mentor.com>
Accept-Language: en-CA, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=peter.spierenburg@nautel.com; 
x-originating-ip: [25.171.172.4]
x-ms-office365-filtering-correlation-id: 0f9703e8-fa87-4031-4315-08d456961a33
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:BN6PR05MB2851;
x-microsoft-exchange-diagnostics: 1; BN6PR05MB2851;
	7:kIY/N4YvVJw/AkvpU+T9q3yYH6DoDM33DgiEa5G6FvO1qeWmXlv5k/kDV9Ay8y1Dmw2Jm1Y9+PKEH+kfvE0Ux7D68uY/FdpDdqQgcZgOjhkouHjYjVG6bQ1yGPeu5/ri4/L/sgF2FdABYGb2OZurnGd2c67LRgTqbuwlWsxL4cAdWDTLEA3sBRDeoR2SbyKdmEt0bCpGI5vFU3H35/zqPsloGFeXL2Cc1D8lQARxHkQy/eWoUImtsANJy9YnYeGnxjppn+oDR9KAaueGd7CcXoxS9bP6ANgWkxjEpaeP4UXraJUywmlETXYfGffj9+5p0BSQ9exbEwNWfh39OUjMMg==
x-microsoft-antispam-prvs: <BN6PR05MB2851156216B21BE9C3D0E9EB9E5A0@BN6PR05MB2851.namprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6041248)(20161123558025)(20161123564025)(20161123562025)(20161123555025)(20161123560025)(6072148);
	SRVR:BN6PR05MB2851; BCL:0; PCL:0; RULEID:; SRVR:BN6PR05MB2851; 
x-forefront-prvs: 0220D4B98D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(39450400003)(377454003)(189002)(199003)(19627405001)(2906002)(2900100001)(6506006)(7696004)(9686003)(6436002)(25786008)(3480700004)(54896002)(74316002)(66066001)(55016002)(99286003)(106116001)(3280700002)(3846002)(229853002)(5660300001)(389900003)(6116002)(102836003)(3660700001)(86362001)(7116003)(122556002)(77096006)(68736007)(106356001)(76176999)(50986999)(54356999)(2501003)(105586002)(38730400002)(33656002)(6246003)(8936002)(7736002)(81156014)(8676002)(53936002)(97736004)(101416001)(92566002)(81166006)(2950100002)(189998001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR05MB2851;
	H:BN6PR05MB2851.namprd05.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: nautel.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nautel.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2017 18:03:24.9832 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 656f830c-eb88-49fe-90f1-433363ec7ccf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR05MB2851
Subject: Re: Building docker.
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
X-List-Received-Date: Thu, 16 Feb 2017 21:35:14 -0000
Content-Language: en-CA
Content-Type: multipart/alternative;
	boundary="_000_BN6PR05MB285130317F49AAF01D6636199E5A0BN6PR05MB2851namp_"

--_000_BN6PR05MB285130317F49AAF01D6636199E5A0BN6PR05MB2851namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Can you be more specific about your issue Muhammad? Perhaps include the tex=
t of the error message you are receiving?


Peter.


________________________________
From: meta-virtualization-bounces@yoctoproject.org <meta-virtualization-bou=
nces@yoctoproject.org> on behalf of Sheheryar, Muhammad <Muhammad_Sheheryar=
@mentor.com>
Sent: February 16, 2017 3:20:50 AM
To: meta-virtualization@yoctoproject.org
Subject: [meta-virtualization] Building docker.


Hi,


I am trying to build docker in yocto project (fido). For this I have added =
the 'fido' branch of meta-virtualization layer and its dependencies. Howeve=
r, the build is failing because the do_compile function for go cross-compli=
er is failing. Can you help me with this issue?


Regards,


Muhammad Sheheryar Qureshi

--_000_BN6PR05MB285130317F49AAF01D6636199E5A0BN6PR05MB2851namp_
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
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Arial,Helvetica,sans-serif;" dir=3D"ltr">
<p>Can you be more specific about your issue Muhammad? Perhaps include the =
text of the error message you are receiving?</p>
<p><br>
</p>
<p>Peter.</p>
<p><br>
</p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> meta-virtualization-b=
ounces@yoctoproject.org &lt;meta-virtualization-bounces@yoctoproject.org&gt=
; on behalf of Sheheryar, Muhammad &lt;Muhammad_Sheheryar@mentor.com&gt;<br=
>
<b>Sent:</b> February 16, 2017 3:20:50 AM<br>
<b>To:</b> meta-virtualization@yoctoproject.org<br>
<b>Subject:</b> [meta-virtualization] Building docker.</font>
<div>&nbsp;</div>
</div>
<div>
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
</div>
</body>
</html>

--_000_BN6PR05MB285130317F49AAF01D6636199E5A0BN6PR05MB2851namp_--
