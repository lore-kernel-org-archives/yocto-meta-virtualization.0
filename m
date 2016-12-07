Return-Path: <manikandan.e@hcl.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C621BE00D12; Wed,  7 Dec 2016 03:39:22 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	MIME_HTML_ONLY,RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [192.8.186.130 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.7 MIME_HTML_ONLY BODY: Message only has text/html MIME parts
Received: from GWS07.hcl.com (gws07.hcl.com [192.8.186.130])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 66375E00C9B
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 Dec 2016 03:39:18 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.33,310,1477938600"; d="scan'208,217";a="62786749"
Received: from unknown (HELO CHN-CORP-HT01.CORP.HCL.IN) ([10.249.2.33])
	by GWS07.hcl.com with ESMTP/TLS/AES128-SHA; 07 Dec 2016 17:04:31 +0530
Received: from CHN-HCLT-CSHT05.HCLT.CORP.HCL.IN (10.150.12.30) by
	CHN-CORP-HT01.CORP.HCL.IN (10.249.2.33) with Microsoft SMTP Server
	(TLS) id 14.3.294.0; Wed, 7 Dec 2016 17:04:31 +0530
Received: from CHN-HCLT-MBS04.HCLT.CORP.HCL.IN ([10.150.12.19]) by
	CHN-HCLT-CSHT05.HCLT.CORP.HCL.IN ([::1]) with mapi id 14.03.0294.000;
	Wed, 7 Dec 2016 17:04:31 +0530
From: Manikandan E <manikandan.e@hcl.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: docker build issues meta-virtualization (Krogoth)
Thread-Index: AdJQebdQWc045dtIScG8IMgDiaNuUgABBH3g
Date: Wed, 7 Dec 2016 11:34:31 +0000
Message-ID: <40BA76AD6F30624D8838040F50FAE7093A9ACECB@chn-hclt-mbs04.HCLT.CORP.HCL.IN>
References: <40BA76AD6F30624D8838040F50FAE7093A9ACE96@chn-hclt-mbs04.HCLT.CORP.HCL.IN>
In-Reply-To: <40BA76AD6F30624D8838040F50FAE7093A9ACE96@chn-hclt-mbs04.HCLT.CORP.HCL.IN>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.151.34.14]
MIME-Version: 1.0
Subject: FW: docker build issues meta-virtualization (Krogoth)
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
X-List-Received-Date: Wed, 07 Dec 2016 11:39:22 -0000
Content-Language: en-US
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style id=3D"owaParaStyle" type=3D"text/css">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
P {margin-top:0;margin-bottom:0;}</style>
</head>
<body ocsi=3D"0" fpstyle=3D"1">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">Hi All,<br>
<br>
&nbsp; We are trying to compile docker with core-image minimal image on Kro=
goth version and facing the below issues when compiling go-native package.
<br>
<br>
Log:<br>
-------------------<br>
| DEBUG: Executing shell function do_compile<br>
| # Building C bootstrap tool.<br>
| cmd/dist<br>
|<span style=3D"background-color:rgb(255,255,0)"> go tool dist: unknown $GO=
OS ${BUILD_GOOS}</span><br>
| WARNING: exit code 1 from a shell command.<br>
| ERROR: Function failed: do_compile (log file is located at /media/csp/HMI=
/zcu_morty/build/tmp/work/x86_64-linux/go-native/1.4.3-r0/temp/log.do_compi=
le.16340)<br>
<br>
<br>
<br>
Kindly provide your suggestion.<br>
<br>
<br>
Regards<br>
Manikandan
<div style=3D"font-family: Times New Roman; color: #000000; font-size: 16px=
"><br>
</div>
</div>
<span style=3D"FONT-FAMILY: 'Arial','sans-serif'; COLOR: gray; FONT-SIZE: 7=
.5pt; mso-fareast-font-family: 'Times New Roman'">
<P style=3D"MARGIN: 0in 0in 0pt" class=3DMsoNormal><br><br><font style=3D"F=
ONT-FAMILY: 'Arial','sans-serif'; COLOR: gray; FONT-SIZE: 9px">::DISCLAIMER=
::<br>---------------------------------------------------------------------=
---------------------------------------------------------------------------=
----</font></P>
<P style=3D"MARGIN: 0in 0in 0pt" class=3DMsoNormal><font style=3D"FONT-FAMI=
LY: 'Arial','sans-serif'; COLOR: gray; FONT-SIZE: 11px">The contents of thi=
s e-mail and any attachment(s) are confidential and intended for the named =
recipient(s) only.<br>E-mail transmission is not guaranteed to be secure or=
 error-free as information could be intercepted, corrupted, <br>lost, destr=
oyed, arrive late or incomplete, or may contain viruses in transmission. Th=
e e mail and its contents <br>(with or without referred errors) shall there=
fore not attach any liability on the originator or HCL or its affiliates. <=
br>Views or opinions, if any, presented in this email are solely those of t=
he author and may not necessarily reflect the <br>views or opinions of HCL =
or its affiliates. Any form of reproduction, dissemination, copying, disclo=
sure, modification, <br>distribution and / or publication of this message w=
ithout the prior written consent of authorized representative of <br>HCL is=
 strictly prohibited. If you have received this email in error please delet=
e it and notify the sender immediately. <br>Before opening any email and/or=
 attachments, please check them for viruses and other defects.</font></P>
<P style=3D"MARGIN: 0in 0in 0pt" class=3DMsoNormal><font style=3D"FONT-FAMI=
LY: 'Arial','sans-serif'; COLOR: gray; FONT-SIZE: 11px">-------------------=
---------------------------------------------------------------------------=
------------------------------------------------------</font></span></P></b=
ody>
</html>


