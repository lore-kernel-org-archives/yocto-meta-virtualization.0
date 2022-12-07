Return-Path: <nathan.fisher@gd-ms.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E6CC352A1
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 16:47:02 +0000 (UTC)
Received: from vadc01-egs02.gd-ms.com (vadc01-egs02.gd-ms.com [137.100.132.44])
 by mx.groups.io with SMTP id smtpd.web10.20711.1670431612698271276
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Dec 2022 08:46:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gd-ms.com header.s=esa header.b=iMiWwHzr;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.valigov.email}: invalid domain name (domain: gd-ms.com, ip: 137.100.132.44, mailfrom: nathan.fisher@gd-ms.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=gd-ms.com; i=@gd-ms.com; q=dns/txt; s=esa;
  t=1670431612; x=1701967612;
  h=from:to:subject:date:message-id:mime-version;
  bh=sli1TXbxSJd6dfUeMiYZ1W5Us4RTjEs+ytFzm8JhL9Y=;
  b=iMiWwHzrqGocm+HOOZ4qmn9R/D615xjEc2Ga4PCWJiXwZp3gS/MEIVWG
   9vatYq1qxNoOpAZs+TqL/L194OoT8QmQ6voxmeDr8GtfsFfU3eqU8pF1T
   nESQalTJ277NVnm4oHkcj09VtuMND9mvfh06reNYHLQA8NozWT06SOAcX
   dGeZt5WgUoMS21FaX/o48SAPFgR5n26nbboFeq+yYXL/IZta1R1BZoYUc
   rw2ndOLkxOafmHrhwyzbgeGzlioEA4gH8Y+xm+yZWRBpk9hbNYJ/+iaGk
   E8XL4nt7IdemTW3CkTDF2pFD0ePNhZy8mL2g4jkL8RozTURdKMqycwS0S
   g==;
X-IronPort-AV: E=Sophos;i="5.96,225,1665460800"; 
   d="scan'208,217";a="39546782"
Received: from unknown (HELO eadc-e-fmsprd01.eadc-e.gd-ais.com) ([10.96.30.97])
  by vadc01-egs02.gd-ms.com with ESMTP; 07 Dec 2022 11:46:51 -0500
Received: from VADC-MMB01.GD-MS.US (vadc-mmb01.gd-ms.us [10.132.100.61])
	by eadc-e-fmsprd01.eadc-e.gd-ais.com (Postfix) with ESMTP id C36D6FB04FD
	for <meta-virtualization@lists.yoctoproject.org>; Wed,  7 Dec 2022 16:46:51 +0000 (UTC)
Received: from vadc-mmbbak01.GD-MS.US (10.132.100.161) by VADC-MMB01.GD-MS.US
 (10.132.100.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 7 Dec
 2022 11:46:51 -0500
Received: from VADC-MCA01.GD-MS.US (10.132.100.42) by vadc-mmbbak01.GD-MS.US
 (10.132.100.161) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 7 Dec
 2022 11:46:50 -0500
Received: from USG02-BN3-obe.outbound.protection.office365.us (137.100.132.86)
 by VADC-MCA01.GD-MS.US (10.132.100.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.42 via Frontend Transport; Wed, 7 Dec 2022 11:46:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=piZwbzc1r8nK4dtXewvD6xPoz6YZ7p2sLC1mSmlcdYDrYNXbOftMDrHp0fPLaalxoCAEkPp9PYdz3tyjNgfA2LQfUR6tiyvLqaANUk0FxCIJ04RJZEZsU7n92gtXje9nqRefU3lfbSqnY4HzgbNIOhxsKmqQb4C5cSIqj9VU+wpevXayz0JpeGjUFsmP35l7GCIhObZKdCvQw5KDQ8pnyYkw8Ut4gHYkS6zx4sNUXI3QRX1K5gNOKoXINb7LzBO6FgZFS0RCPZa4MgaF5CHQE5RotwADr+udeHBhNfDPAEEzQzOGCBkvFpuBW3wq9iKykrUA3NQhovhN0zFUxvDbWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CsOGXnNU8VdPNjbMO9tdzd+jKOy/dcPZoA1Qkzc0mh8=;
 b=hsE5i+0NY/vxcXZR3qINxdP7cfw0n8a7kfqtXCDbxSK5N4bmxxiwD//WJBEOHXjQZ2/8uaT7nPIsDCscded0XOdEFpBPz8TBStc3bsEIFdILopSv+V8CEwBOcIA2ATp46wt47JAaJbm4kQSp4Ue+W0gMZebVKzYNKNjrs3+ql0ZpTQaxhxZP9KHXIYQTMIMJ6DkCJF2HIn2OrnLF4rVeNN75ikS4xXfiDC2S/C8pjGAv8Hmr0DOOklnsLZGaSv/wuUqIqfUCi1TKoAZEGMIOdilzA7LA2PhcvKY5Aot/8PDYIIuVfQn305Ri0f/5isLzHvlAjfR5+ww5ccjTiK7NYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gd-ms.com; dmarc=pass action=none header.from=gd-ms.com;
 dkim=pass header.d=gd-ms.com; arc=none
Received: from BN2P110MB1623.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:17d::12)
 by BN2P110MB1176.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:17a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 7 Dec
 2022 16:46:50 +0000
Received: from BN2P110MB1623.NAMP110.PROD.OUTLOOK.COM
 ([fe80::1c72:629f:2c8a:a494]) by BN2P110MB1623.NAMP110.PROD.OUTLOOK.COM
 ([fe80::1c72:629f:2c8a:a494%7]) with mapi id 15.20.5857.029; Wed, 7 Dec 2022
 16:46:50 +0000
From: "Nathan.Fisher@gd-ms.com" <Nathan.Fisher@gd-ms.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: kvmtool patch error
Thread-Topic: kvmtool patch error
Thread-Index: AdkKW3IqpF66NzK0QzqqJqmerNb9Pw==
Date: Wed, 7 Dec 2022 16:46:50 +0000
Message-ID: <BN2P110MB1623E90E409FF6ED3CDE17F9B41A9@BN2P110MB1623.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gd-ms.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN2P110MB1623:EE_|BN2P110MB1176:EE_
x-ms-office365-filtering-correlation-id: 9b4b78fd-8318-4396-3e3c-08dad872a340
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +76LuLXnnFQT75F8V2zolyPIaM7WTSvJWTNY+ed33Cu1VIOkAtuwi8ToEgJBFZvRLbKYz/3nUfd2UqCaacmu3gMPkC5yfcO3wf3uS6LydD5EHzMKaLz7OWzeUNlmRLymHcoUFebU1n5394EmYdtYZw5mGjadl4FzzqkOXy+pygJLOMs3RDZNl+KvtVKRV46rUZFWGa1Sfxa8PrDomr7Y6Odiaqj/wpGiyQYtF/h0EXrsd/AyvYVkGSxLL0/sVKJSEWQDKVEIT6V4RffUnWEu3P1ogC/JVntJM3fgnp0Y6jo9HxMiZI0dN8stnlJfvSRpdU9u54GEBmAHhCdwRjYojclfDLJL1kNlUdSHvlkwy575K0XEwGyHGS2L35pz2CEncZKpny1TWqTY9cKHZB5ESvPmqQF78UcGWO1YzCxYKxcgRjJXJcx98gUCx0Vqr5egNnBFTEICxt58nbFsExzQErT/Vt8rgWZ11H7HeymoD8VO6DLbAHFBpcz8X8nzjsdPgWHWGWGZU4y9ASS8lOZrOsAMiC1hEybhNRq0T0V/r+Q267PQJLoYuFJOe87KWNna5mLC6EZ9aXrXmIGdy32j3Sz9lfwV6y0QZbBLIfBvGnNWlAVhfkf+qSHc+q7FBTtM4CmdFSdrZaGzz3NuAopu1A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN2P110MB1623.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(366004)(451199015)(83380400001)(2906002)(71200400001)(3480700007)(6916009)(186003)(33656002)(66446008)(86362001)(66556008)(55016003)(38100700002)(82960400001)(122000001)(76116006)(66946007)(38070700005)(7116003)(26005)(52536014)(5660300002)(498600001)(8936002)(9686003)(64756008)(66476007)(8676002)(6506007)(7696005)(133083001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: gvI8Lkk0hlE8nysbEB4ORO31xmN11pFkmCUKATguZQSsrFXIceeXrcgtNt2SSPp5HQVkIs7klWERGEJ0i/zK9IabaV4M6iLqnCNaJoLmXsclhggIVpaTsnjNnQbDRC/P61MuXtgo060PInexDUkg7FDX7miPPgHPszt+2IM2uXbLgQwuenv9gZyBGa10XJcL4FLYPmgol/LPpYAN4KMkOy2755JTA3eYMBZLWo/QX2JrX7fmYifyb9oVhblrkDExCyW/zfWk4oVNkDuZ1icLAuNRzaQiPbJeiZte4C+J3BXpX+yN2dCovmPVDEAqFj/I2fSf/VpXtMNpUkaA3Nvun2I5+2A1UmDcGP/BsB6AHvGRKvNon/IH1R+FA7Cy7a8K/DsSClLixpOs7zaMGgR/oa97PhjvBtZiK5Mc4IF5MWY=
Content-Type: multipart/alternative;
	boundary="_000_BN2P110MB1623E90E409FF6ED3CDE17F9B41A9BN2P110MB1623NAMP_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN2P110MB1623.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4b78fd-8318-4396-3e3c-08dad872a340
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2022 16:46:50.2645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7c5a26cf-ddf0-400c-9703-4070b4e3a54d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN2P110MB1176
X-OriginatorOrg: gd-ms.com
X-TM-SNTS-SMTP: 
	099DA00860B049B9772EA3D4164B1D294FD92A58F98F330F5285DFFEBD963C692000:8
X-Content-Scanned: Fidelis Mail
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Dec 2022 16:47:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7738

--_000_BN2P110MB1623E90E409FF6ED3CDE17F9B41A9BN2P110MB1623NAMP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

To the maintainers:

I've been trying to use meta-virtualization to include kvm in a build I'm w=
orking on. In my local.conf file I have added the lines:

  1.  DISTRO_FEATURES:append =3D " virtualization"
  2.  IMAGE_INSTALL:append =3D " dtc libaio zlib kvmtool" (upon initially g=
etting the error below, I explicitly included the stated dependencies liste=
d in the kvmtool recipe in hopes that would change things. It did not).


However, whenever I run bitbake core-image-base, I get a build error. The f=
ollowing is the output:


ERROR: kvmtool-5.10.0+gitAUTOINC+336751fb10-r0 do_patch: Applying patch 'ex=
ternal-crosscompiler.patch' on target directory '[path to work directory]/c=
ore2-64-amd-linux/kvmtool/5.10.0+gitAUTOINC+336751fb10-r0/git'
CmdError('quilt --quiltrc [path to work directory]/core2-64-amd-linux/kvmto=
ol/5.10.0+gitAUTOINC+336751fb10-r0/recipe-sysroot-native/etc/quiltrc push',=
 0, 'stdout: Applying patch external-crosscompiler.patch
patching file Makefile
Hunk #2 FAILED at 337.
1 out of 2 hunks FAILED -- rejects in file Makefile
Patch external-crosscompiler.patch does not apply (enforce with -f)

stderr: ')
ERROR: Logfile of failure stored in: /home/yocto/bmc3_os/build/tmp/work/cor=
e2-64-amd-linux/kvmtool/5.10.0+gitAUTOINC+336751fb10-r0/temp/log.do_patch.1=
5225
ERROR: Task ([path to meta-virtualization]/recipes-extended/kvmtool/kvmtool=
.bb:do_patch) failed with exit code '1'


I took the liberty of looking at the patch file and the makefile. The 2nd h=
unk in the patch appears to be trying to replace a line that no longer exis=
ts. I have tried not only your latest master branch, but also the Kirkstone=
, Langdale, and Dunfell releases in case any of them had a working state fo=
r the recipe (I also tried other releases but started running into syntax e=
rrors due to those versions of the recipe using the old bitbake syntax inst=
ead of the current grammar).

I was wondering if this was a known issue with a fix available, or if there=
 were plans to update the patch files.

Thank you for your time,
Nathan Fisher
Nathan.Fisher@gd-ms.com<mailto:Nathan.Fisher@gd-ms.com>


--_000_BN2P110MB1623E90E409FF6ED3CDE17F9B41A9BN2P110MB1623NAMP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
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
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
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
/* List Definitions */
@list l0
	{mso-list-id:1195079963;
	mso-list-type:hybrid;
	mso-list-template-ids:-349637758 67698703 67698713 67698715 67698703 67698=
713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">To the maintainers:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;ve been trying to use meta-virtualization to=
 include kvm in a build I&#8217;m working on. In my local.conf file I have =
added the lines:<o:p></o:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1">DISTRO_FEATURES:append =3D &quot; virtualization&quot;<o:p></o:p></li=
><li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1=
 lfo1">IMAGE_INSTALL:append =3D &quot; dtc libaio zlib kvmtool&quot; (upon =
initially getting the error below, I explicitly included the stated depende=
ncies listed in the kvmtool recipe in hopes that
 would change things. It did not).<o:p></o:p></li></ol>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">However, whenever I run bitbake core-image-base, I g=
et a build error. The following is the output:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">ERROR: kvmtool-5.10.0+gitAUTOINC+336751fb10-r0 do_pa=
tch: Applying patch 'external-crosscompiler.patch' on target directory '[pa=
th to work directory]/core2-64-amd-linux/kvmtool/5.10.0+gitAUTOINC+336751fb=
10-r0/git'<o:p></o:p></p>
<p class=3D"MsoNormal">CmdError('quilt --quiltrc [path to work directory]/c=
ore2-64-amd-linux/kvmtool/5.10.0+gitAUTOINC+336751fb10-r0/recipe-sysroot-na=
tive/etc/quiltrc push', 0, 'stdout: Applying patch external-crosscompiler.p=
atch<o:p></o:p></p>
<p class=3D"MsoNormal">patching file Makefile<o:p></o:p></p>
<p class=3D"MsoNormal">Hunk #2 FAILED at 337.<o:p></o:p></p>
<p class=3D"MsoNormal">1 out of 2 hunks FAILED -- rejects in file Makefile<=
o:p></o:p></p>
<p class=3D"MsoNormal">Patch external-crosscompiler.patch does not apply (e=
nforce with -f)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">stderr: ')<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR: Logfile of failure stored in: /home/yocto/bmc=
3_os/build/tmp/work/core2-64-amd-linux/kvmtool/5.10.0+gitAUTOINC+336751fb10=
-r0/temp/log.do_patch.15225<o:p></o:p></p>
<p class=3D"MsoNormal">ERROR: Task ([path to meta-virtualization]/recipes-e=
xtended/kvmtool/kvmtool.bb:do_patch) failed with exit code '1'<o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I took the liberty of looking at the patch file and =
the makefile. The 2<sup>nd</sup> hunk in the patch appears to be trying to =
replace a line that no longer exists. I have tried not only your latest mas=
ter branch, but also the Kirkstone,
 Langdale, and Dunfell releases in case any of them had a working state for=
 the recipe (I also tried other releases but started running into syntax er=
rors due to those versions of the recipe using the old bitbake syntax inste=
ad of the current grammar).<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I was wondering if this was a known issue with a fix=
 available, or if there were plans to update the patch files.<o:p></o:p></p=
>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you for your time,<o:p></o:p></p>
<p class=3D"MsoNormal">Nathan Fisher<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif"><a href=3D"mailto:Nathan.Fisher@gd-ms.com">Nathan.Fis=
her@gd-ms.com</a></span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BN2P110MB1623E90E409FF6ED3CDE17F9B41A9BN2P110MB1623NAMP_--

