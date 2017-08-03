Return-Path: <mobahbay@outlook.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7DC7CE00C44; Fri,  4 Aug 2017 01:43:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (mobahbay[at]outlook.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust *      [40.92.7.33 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 72084 seconds by postgrey-1.32 at yocto-www;
	Fri, 04 Aug 2017 01:43:38 PDT
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-oln040092007033.outbound.protection.outlook.com [40.92.7.33])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EE4AEE00C3A
	for <meta-virtualization@yoctoproject.org>;
	Fri,  4 Aug 2017 01:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=ASxiDfRG39Xro+l7+hhkh/U2AB2kQXunuRv3+n42xvs=;
	b=ExuH7sh7oKVzHv5C/vL1auAiXiQZk3oT6920MseA/RN4c3QoTxhbD+XkJCq97xwvNo6+j83j6DeetmchgHn+YEspsqRo/dPhemquRnSJe0ngFF9eIyHG5xr9FatRfeUyXanhrM2wloofuq9nLQn+wPvd3sq5fCeh11muoLW9dBVUfb6tQZsxvwiGk+eUHGDcCBxw4XobkV2kMA3+Mep+ts+QPUmFLJc3hp6nr+JD7PUltgAgpY27jPuAD5UGdLgQu8iQ0DzU4hdPGtURLAT31h1pvvPRSnB90ic/1nhr/QlecsKRvy2wjlu/rOYXlCaNebYs+jubWG7AE1lEQVig2w==
Received: from BY2NAM03FT053.eop-NAM03.prod.protection.outlook.com
	(10.152.84.54) by BY2NAM03HT156.eop-NAM03.prod.protection.outlook.com
	(10.152.85.234) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.1304.16;
	Thu, 3 Aug 2017 23:09:31 +0000
Received: from DM5PR12MB1548.namprd12.prod.outlook.com (10.152.84.59) by
	BY2NAM03FT053.mail.protection.outlook.com (10.152.84.186) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1304.16 via Frontend Transport; Thu, 3 Aug 2017 23:09:31 +0000
Received: from DM5PR12MB1548.namprd12.prod.outlook.com ([10.172.37.23]) by
	DM5PR12MB1548.namprd12.prod.outlook.com ([10.172.37.23]) with mapi id
	15.01.1304.025; Thu, 3 Aug 2017 23:09:31 +0000
From: Mo Bah <mobahbay@outlook.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: Queries on building XenGt Yocto image and its installation
Thread-Index: AQHTDK0vNtEaF3WsQUujvmgyvMoe/Q==
Date: Thu, 3 Aug 2017 23:09:31 +0000
Message-ID: <DM5PR12MB15488E58C89D2AFB12BD1710CFB10@DM5PR12MB1548.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:79CFAC41103015BE59ACD6045D34405B66C3246A57CFE25E8E70920600811151;
	UpperCasedChecksum:AF7270AA99712365569D966B6A772DE7CC1E89D8A60CA2D87285D724595573D0;
	SizeAsReceived:7012; Count:42
x-tmn: [V1HAOWpmBcShL6vfRbp3zwhGpHerfeRN]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BY2NAM03HT156;
	7:qcRdqqJcPt+ep2I4BSbkwg0wg6tBtZ9pEbokFosz/qtvIMtIkrbbGXbEe07L86f4MTb1gfRoAkkmgW68KZZGzzpj9qCXNUXJ/QPvsGKWE2Fi1ckXNvGi6isatJ9cwNFMPTrD/CS8bMrHPRsP4fWRKqSs42s/OfhlJEiqaQ2KxGiG4Cy27Gw3mJefuOwjQPxa2diySAVgHaHvmkMIFC5iLzIy2z3U31B6jblqBs3vvV4z01NlWA4sQMlSFBNCF8meMaER6fY5pm+HG+i6r1m0h6Bt98zO6sUieo8DVuO0QyFTqlK9RWJXk+F8DLPQXBr1pmfr6jQGRlm7brUcRn77ws908B/5psoUoOCfnE4KevgZ3pWsqCCsGQtL+kdXJw6cpJwvlpIbKOCAWhwQ07SrFGMJIBK4meXHjJqwD8YDyrbVUKES45sbJbAF8LtFYdblAcN2t67SpJRD10gaLP3tENClCo/LOpgIf2meJ0ZbW3zuNCMA+btmaKOiMdZV6aExrmfmFjgURHbWnUmTebs5FnOEiz5vHCarlX4S2gCb5ZrgBSjznJqKdsuEhsA5tKPYL3ea/lzuca9+2J3F2b7/od4GuYr/7u9V5yh4fRTEgK9qMAhO0p5f3j9QAgIE+Jz362QtnNUBJQPtBd8uFOTTlXt+QIC0Qyd6ketvekhDOYIQx08mTyaFJSRYsaKJERohyfI9y39vOmuc+S149pEbEKucdwHrEQ2BXuKGyhegY+CwL1+6eunbIZ4NiN58oP3nZtqsBWn2MTPFDmwApFrZSw==
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-forefront-antispam-report: EFV:NLI; SFV:NSPM; SFS:(7070007)(98901004);
	DIR:OUT; SFP:1901; SCL:1; SRVR:BY2NAM03HT156;
	H:DM5PR12MB1548.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; 
x-ms-office365-filtering-correlation-id: 5684ccdd-bfc6-4f79-b128-08d4dac4b2d3
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(300000502095)(300135100095)(22001)(300000503095)(300135400095)(201702061074)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031324274)(2017031323274)(2017031322377)(1603101448)(1601125374)(1701031045)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BY2NAM03HT156; 
x-ms-traffictypediagnostic: BY2NAM03HT156:
authentication-results: outbound.protection.outlook.com; spf=skipped
	(originating message); dkim=none (message not signed) header.d=none;
	dmarc=none action=none header.from=outlook.com;
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(444000031);
	SRVR:BY2NAM03HT156; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BY2NAM03HT156; 
x-forefront-prvs: 03883BD916
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2017 23:09:31.3339 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2NAM03HT156
Subject: Queries on building XenGt Yocto image and its installation
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
X-List-Received-Date: Fri, 04 Aug 2017 08:43:40 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM5PR12MB15488E58C89D2AFB12BD1710CFB10DM5PR12MB1548namp_"

--_000_DM5PR12MB15488E58C89D2AFB12BD1710CFB10DM5PR12MB1548namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello All,

I am trying to build XenGt for an Intel embedded board.

1) We have been provided with the BSP package for this embedded Intel board=
 and I know the build procedure to build fully operational Yocto Image for =
this board which includes integrating the Intel board BSP package with the =
Yocto git repository components including the required meta-layers and buil=
ding all of these together to create an image for the board.

2) For building XenGt, the 'meta-virtualization' layer has to be included i=
n the Yocto image as per the Yocto documentation

http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/about/ and th=
is layer has dependencies on openembedded-core, meta-oe, meta-networking, m=
eta-filesystems, meta-python and meta-go layers.

The OpenEmbedded-Core is the layer containing the core metadata for current=
 versions of OpenEmbedded. It is distro-less and contains only emulated mac=
hine support.


To build XenGt, the approach would be to build a XenGt hypervisor image for=
 this Intel board by integrating the meta-layers in #2 with #1?


After building a full Yocto image(with XenGt) for our embedded Intel board =
by integrating the meta-layers in #2 with #1, should I attempt installing t=
his new Yocto image in our embedded Intel board, try doing the configuratio=
ns, other installations/grub changes etc.(as relevant in Yocto) relating to=
 XenGt when booted with this new image and post that attempt to boot throug=
h the dom0 kernel as mentioned in the link below for Debian?

https://wiki.xenproject.org/wiki/Xen_Project_Beginners_Guide#Installing_Deb=
ian


Please advise as I am doing this for the first time.


Thanks,

M

<http://aka.ms/weboutlook>

--_000_DM5PR12MB15488E58C89D2AFB12BD1710CFB10DM5PR12MB1548namp_
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
<div id=3D"divtagdefaultwrapper" style=3D"font-size: 12pt; color: rgb(0, 0,=
 0); font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot;Apple Co=
lor Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI=
 Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;" dir=3D"ltr">
<p><span style=3D"font-family: Calibri, Helvetica, sans-serif, serif, Emoji=
Font; font-size: 11pt;">Hello All,</span><br>
</p>
<div id=3D"Signature">
<div id=3D"divtagdefaultwrapper" style=3D"font-size: 12pt; color: rgb(0, 0,=
 0); background-color: rgb(255, 255, 255); font-family: Calibri, Arial, Hel=
vetica, sans-serif, EmojiFont, &quot;Apple Color Emoji&quot;, &quot;Segoe U=
I Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;Android E=
moji&quot;, EmojiSymbols, EmojiFont, &quot;Apple Color Emoji&quot;, &quot;S=
egoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;And=
roid Emoji&quot;, EmojiSymbols;">
<div style=3D"font-size: 16px; font-family: Calibri, Helvetica, sans-serif,=
 serif, EmojiFont; margin-top: 0px; margin-bottom: 0px;">
<font size=3D"3" color=3D"black"><span style=3D"font-size: 12pt;">I am tryi=
ng to build&nbsp;</span></font><font size=3D"3" color=3D"black"><span style=
=3D"font-size: 12pt;"><b>XenGt for an Intel embedded&nbsp;board</b></span><=
/font><font size=3D"3" color=3D"black"><span style=3D"font-size: 12pt;">.</=
span></font></div>
<div style=3D"font-size: 16px; font-family: Calibri, Helvetica, sans-serif,=
 serif, EmojiFont; margin-top: 0px; margin-bottom: 0px;">
<br>
</div>
<div style=3D"font-size: 16px; font-family: Calibri, Helvetica, sans-serif,=
 serif, EmojiFont; margin-top: 0px; margin-bottom: 0px;">
<font size=3D"3"><span style=3D"font-size: 12pt;">1)&nbsp;We have been prov=
ided with the&nbsp;</span></font><font size=3D"3"><span style=3D"font-size:=
 12pt;">BSP package for this embedded&nbsp;Intel board&nbsp;</span></font><=
font size=3D"3"><span style=3D"font-size: 12pt;">and I know the
 build procedure to build fully operational&nbsp;Yocto Image for this board=
 which includes integrating the Intel board BSP package with the Yocto git =
repository components including the required meta-layers and building all o=
f these together to create an image for
 the board.</span></font><br>
</div>
<div style=3D"font-size: 16px; font-family: Calibri, Helvetica, sans-serif,=
 serif, EmojiFont; margin-top: 0px; margin-bottom: 0px;">
<br>
</div>
<div style=3D"font-size: 16px; font-family: Calibri, Helvetica, sans-serif,=
 serif, EmojiFont; margin-top: 0px; margin-bottom: 0px;">
<font size=3D"3" color=3D"black"><span style=3D"font-size: 12pt;">2)</span>=
</font><font size=3D"3" color=3D"black"><span style=3D"font-size: 12pt;"><b=
>&nbsp;</b></span></font><font size=3D"3" color=3D"black"><span style=3D"fo=
nt-size: 12pt;"><b>For building XenG</b></span></font><font size=3D"3" colo=
r=3D"black"><span style=3D"font-size: 12pt;"><b>t</b></span></font><font si=
ze=3D"3" color=3D"black"><span style=3D"font-size: 12pt;">,
 the&nbsp;</span></font><font size=3D"3" color=3D"black"><span style=3D"fon=
t-size: 12pt;"><b>'</b></span></font><font size=3D"3" color=3D"black"><span=
 style=3D"font-size: 12pt;"><b>meta-virtualization</b></span></font><font s=
ize=3D"3" color=3D"black"><span style=3D"font-size: 12pt;">'
 layer has to be included in the Yocto image as per the Yocto documentation=
&nbsp;</span></font></div>
<div style=3D"font-size: 16px; font-family: Calibri, Helvetica, sans-serif,=
 serif, EmojiFont; margin-top: 0px; margin-bottom: 0px;">
<font size=3D"3"><span style=3D"font-size: 12pt;">
<p style=3D"color: rgb(51, 51, 51);"><a href=3D"http://git.yoctoproject.org=
/cgit/cgit.cgi/meta-virtualization/about/" target=3D"_blank" rel=3D"noopene=
r noreferrer" class=3D"x_OWAAutoLink" id=3D"LPlnk442261" previewremoved=3D"=
true" style=3D"font-size: 12pt; font-family: Calibri, Helvetica, sans-serif=
;">http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/about/</a>=
<span style=3D"font-size: 12pt;">&nbsp;and
 this layer has&nbsp;dependencies&nbsp;on&nbsp;</span><span style=3D"font-s=
ize: 12pt;">o<b>penembedded-core, meta-oe, meta-networking, meta-filesystem=
s, meta-python and meta-go&nbsp;</b>layers.</span><br>
</p>
</span></font></div>
<div style=3D"font-size: 16px; font-family: Calibri, Helvetica, sans-serif,=
 serif, EmojiFont;">
<span style=3D"font-size: 12pt;"><br>
</span></div>
<div style=3D"font-size: 16px; font-family: Calibri, Helvetica, sans-serif,=
 serif, EmojiFont;">
<span style=3D"font-size: 12pt;">The&nbsp;</span><span style=3D"font-size: =
12pt;"><b>OpenEmbedded-Core</b></span><span style=3D"font-size: 12pt;">&nbs=
p;is the&nbsp;layer containing the core metadata for current versions of Op=
enEmbedded. It is distro-less and contains only emulated
 machine support.</span><font size=3D"2" color=3D"#333333" style=3D"font-fa=
mily: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif, serif, Emoj=
iFont;"><span style=3D"font-size: 16.79px;">&nbsp;</span></font><br>
</div>
<div style=3D"font-size: 16px; font-family: Calibri, Helvetica, sans-serif,=
 serif, EmojiFont; margin-top: 0px; margin-bottom: 0px;">
<p><br>
</p>
</div>
<div style=3D"font-size: 16px; font-family: Calibri, Helvetica, sans-serif,=
 serif, EmojiFont; margin-top: 0px; margin-bottom: 0px;">
<font size=3D"3" color=3D"#333333"><span style=3D"font-size: 12pt;">To buil=
d XenGt, the approach would be&nbsp;</span></font><font size=3D"3" color=3D=
"#333333"><span style=3D"font-size: 12pt;"><b>to build a XenGt&nbsp;</b></s=
pan></font><font size=3D"3" color=3D"#333333"><span style=3D"font-size: 12p=
t;"><b>hypervisor
 image for this Intel board by integrating the meta-layers in #2 with&nbsp;=
#1</b></span></font><font size=3D"3" color=3D"#333333"><span style=3D"font-=
size: 12pt;">?&nbsp;</span></font></div>
<div style=3D"font-size: 16px; font-family: Calibri, Helvetica, sans-serif,=
 serif, EmojiFont; margin-top: 0px; margin-bottom: 0px;">
<font size=3D"3" color=3D"#333333"><span style=3D"font-size: 12pt;"><br>
</span></font></div>
<div style=3D"font-size: 16px; font-family: Calibri, Helvetica, sans-serif,=
 serif, EmojiFont; margin-top: 0px; margin-bottom: 0px;">
<font size=3D"3" color=3D"#333333"><span style=3D"font-size: 12pt;">
<p><b>After&nbsp;<font color=3D"#333333"><span style=3D"font-size: 12pt;">b=
uilding a full Yocto</span></font></b><font color=3D"#333333"><span style=
=3D"font-size: 12pt;"><b>&nbsp;image(with XenGt)</b> for our embedded Intel=
 board by integrating the meta-layers in #2 with&nbsp;#1,
 should I attempt installing this new Yocto image in our embedded Intel boa=
rd, try doing the configurations,&nbsp;other installations/grub changes etc=
.(as relevant in Yocto) relating to XenGt when booted with this new image&n=
bsp;and post that attempt to boot through
 the dom0 kernel as mentioned in the link below for Debian?&nbsp;</span></f=
ont><br>
</p>
<p><span style=3D"font-size: 12pt;"></span></p>
<div style=3D"margin-top: 0px; margin-bottom: 0px;"><a href=3D"https://wiki=
.xenproject.org/wiki/Xen_Project_Beginners_Guide#Installing_Debian" target=
=3D"_blank" rel=3D"noopener noreferrer" id=3D"LPlnk954674" previewremoved=
=3D"true"><span id=3D"LPlnk954674">https://wiki.xenproject.org/wiki/Xen_Pro=
ject_Beginners_Guide#Installing_Debian</span></a>&nbsp;<br>
</div>
<br>
</span>
<p></p>
<p><span style=3D"font-size: 12pt;">Please advise as I am doing this for th=
e first time.</span></p>
<p><span style=3D"font-size: 12pt;"><br>
</span></p>
<p><span style=3D"font-size: 12pt;">Thanks,</span></p>
<p><span style=3D"font-size: 12pt;">M&nbsp;</span></p>
</font></div>
<a href=3D"http://aka.ms/weboutlook" id=3D"LPNoLP"></a></div>
</div>
</div>
</body>
</html>

--_000_DM5PR12MB15488E58C89D2AFB12BD1710CFB10DM5PR12MB1548namp_--
