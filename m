Received: from esa4.fujitsucc.c3s2.iphmx.com (esa4.fujitsucc.c3s2.iphmx.com [68.232.151.214])
 by mx.groups.io with SMTP id smtpd.web10.3731.1631213722750158988
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 09 Sep 2021 11:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=KY3PlGrM;
 spf=pass (domain: fujitsu.com, ip: 68.232.151.214, mailfrom: al.smith@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1631213723; x=1662749723;
  h=from:to:subject:date:message-id:mime-version;
  bh=bfZMgZsYWtiY6iOY7laiVo9XAwE226b63QM+7VlXV30=;
  b=KY3PlGrMkHb7T+FgOsk4/M+DNsEIP23l2D/C7TbMI+V2t+dswBQqcZhs
   Va55ueaN3m+vuAcfX/0XoLO5Unk8DuO5p62GdJ1tcPDLRHVdO70qKnvyQ
   IenUPFbHlH8Hbb8pyz1q+XieWF0sww4qH0OK0oxseVFYMmvPhMeapvhlP
   9pQta0PAC73uAFtaEy7JehfnOLwF1kvEZouiAXpuk0YHPIC7f6Q0HhDib
   ftr8gEu1296tQI9qplu6Kro1zhyFYfxrGM7W/HbwRwXDTBclNbhritoOZ
   PNPMCI2NDEobfgU2fYGO387wufZKVVuqm8SEsNDNpkbcnBBbkndp6G0t0
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="46824915"
X-IronPort-AV: E=Sophos;i="5.85,281,1624287600"; 
   d="scan'208,217";a="46824915"
Received: from mail-mw2nam10lp2109.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.109])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2021 03:55:19 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BeknXqqW0rHU050ASfM4DVLGy9TGgHtuDUhSSJYiOsVTjU5CFeMwrJONLGYdudwagPnqagHrAYKpUrDEcJJ71eLzARHJb5B5Lp9cZDq3MmodyhM+tn3YCpyIib0hF5Ay7K4XGCcYHmuFtVY0KS8lWJRsSyotRFmcEEqGNRRBj1PHfcUwhEtCd8X7PrEMzm/t6m6MesfhFIdgks9s/Ourf+oI0CBKMwf0+OkpTB9DO589y8LblsH7iAxrbO2NyDTBpaX3UXZB5hlZf0DYFrjtikWtgjZy2Th+0auRVSE3Z3lnr8TxQXSSev4PKVKcTGYOg4Ur1/g7i8ExZn/EOYF8/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pi20kKarVAXiM9oZhWSak78Cu56PbwfVeApp+Chmgb8=;
 b=k50ntBgjMBZGrme6WTQRyVj2wsYbvw3Ugqzr6zuyVq2OnsbB9rrCsC5utpkcr7SOmNl0s3K/Sh7BbnKn6yNw8Y6dEESRRBaan3DFdBWFGDsmK/TiXx1mJYehZklwwMcaM8yPy4JiCHriTyAIWiynxrLBHfSx5RzBxp8suGZUrfFnJf+nYvZ74rH98d5TcsOSBbYT3pSMRJVz/DoFbpz27htYSn58+VaLQYlOvS9u1CnDNmDmvvxBMRgAaWcaS6JDeHzveefvHoRzzF/Dml58G+lkN8ULnPz7v8pt9F25l/iChvzyhqPOP6b8tKXNJOB1yQNG+ZQhP0Rpo/J2nowp1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pi20kKarVAXiM9oZhWSak78Cu56PbwfVeApp+Chmgb8=;
 b=Ec1jehisn/c8VJTVF39whNTh3BuL6iyHKOD9iltgNyNpkWanC5K7b7MO895RMGuXlem+jc6GsG93HrT5oq/Fe9roYW6Omig43wt449RG097OSTtGPp7uwmHSJd2wvijOdZoXK9QSGtvIeFUL4gRBemHclKS4LAl/60VaH9cyds8=
Received: from SN6PR07MB4830.namprd07.prod.outlook.com (2603:10b6:805:37::20)
 by SN1PR07MB3950.namprd07.prod.outlook.com (2603:10b6:802:26::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Thu, 9 Sep
 2021 18:55:16 +0000
Received: from SN6PR07MB4830.namprd07.prod.outlook.com
 ([fe80::2c26:90ec:47d5:8672]) by SN6PR07MB4830.namprd07.prod.outlook.com
 ([fe80::2c26:90ec:47d5:8672%6]) with mapi id 15.20.4500.016; Thu, 9 Sep 2021
 18:55:16 +0000
From: al.smith@fujitsu.com
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: container build not pulling in libraries
Thread-Topic: container build not pulling in libraries
Thread-Index: AdelrAyK+jJgSr6nQdCbhaUCY3ktIg==
Date: Thu, 9 Sep 2021 18:55:16 +0000
Message-ID: 
 <SN6PR07MB4830947D79F9F5FB8A86BDED9FD59@SN6PR07MB4830.namprd07.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f38f500b-42e2-4ff9-26fe-08d973c35cfa
x-ms-traffictypediagnostic: SN1PR07MB3950:
x-microsoft-antispam-prvs: 
 <SN1PR07MB3950CC13DD8151DC6DDEE99A9FD59@SN1PR07MB3950.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 JAcuFH5wKK4SnFvzndah45PoAmWZO/wBMQIRYVNdN1LN9pGFNTN/MMbl6UrofZvKVsyx15SmGh63Hn+DFEtBPePcPkua4VFwpvUjqP7TdY7rQz2lOyLRy2GwlZSkdQC/kDf7DCab6kAUDZS7ErkA+evY4BXqThrydnp1fXIhIoHUXRacQtOwQ/AFb1u2UZQwV9P4+Ej+RwsBMVh7L3EBzCyWb0iDOHXK3KP0+8s80CM3kstn3lMg4VZ/SCRxfD5wLM3jDi+uXN+IDto5UdRLRRek/MvaQxfjWBMLGpKFuIOBRAEbPpAQg0W39DL1A6lAzlNM7VPTGT9yTdzS2g3MfpowswZ57DxY9gP0oBLhTNPc/9SSqFsHEqxmRrwXkwI8eE1YbmBeKyJxAqDeXDiwSjoH3+jyawDIBIzC8wQ6UZqFLh80XhNsMN+nJeS4C+a7TJhx0cWc44Os2dSJyt9LnLLdVk6Ul7LoKIVtglGKDTt9Hoau7qvYPEtHnIrLmX2c7WqsmUe1y08u4rWv1j9WUy/erSWlZnHxg5+2wMKt/SojZVh4bNVA8hlCR0So52PFxfugs7Z4PcBjmxOlEjbAHdyXrCdb3VtKx1DZpTt0SnVqXzVilZ+UFcIqzGZYhKWl53LfgdAUAtwDaI8acL15gxxMfncM4V5pCdpXroujbDAF/0iD93O7gamHnFSS9Bbtds2e0I79c94Fou2XaPQnIw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR07MB4830.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39850400004)(396003)(346002)(366004)(6506007)(38070700005)(86362001)(316002)(55016002)(122000001)(5660300002)(66946007)(9686003)(478600001)(52536014)(7696005)(71200400001)(66446008)(8936002)(76116006)(8676002)(186003)(38100700002)(83380400001)(6916009)(33656002)(66556008)(66476007)(26005)(2906002)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?RZlTXSTIZVqefuEYO93bOYAWbN15T6LdXIxL6gx7htJKnZMEQ54OIylMCdhn?=
 =?us-ascii?Q?Vn65zh5ehw3GUakgknW8sQ+5ZEzwJPYTW9KQgURa94CeAeEHxosy0bpdji7G?=
 =?us-ascii?Q?CAG/rq3Dz/IXCekXTPaG1b9h5rAQV6e377tnpZ4gBcdJuf2LekmLOZ/Z+Gql?=
 =?us-ascii?Q?ms1zdCssXaqGWBHHAo9Z7DxglaSYkom3vrXkfZiOzdpA0TsAEBabgg2j/5hi?=
 =?us-ascii?Q?pvdAydIoDplry3gfTozY7NNRm8E22IzD7srGIVHFKSkjoO+NgRjDlPhztaht?=
 =?us-ascii?Q?ey/Z/GizlJP/ID+FD1/e3d6GMlsLL4q7k4+FMzUBauhF06cFV+Qisl1NXxXL?=
 =?us-ascii?Q?TftglyiFCsaxWDlqrvPzJfy5GobenFmbtjau0Rsvb8GMgfvmsSM6x+ScBYTL?=
 =?us-ascii?Q?vDrqPB/khhOWmS7STko/HSq8tFINmOZ/+JuIPkx/YegV+w06950aroqQn97K?=
 =?us-ascii?Q?QothXVVsL05m+uM4qfdYNp0HMPyrzxz/4F50H32AwjHliqnO2PED9S7vI2ht?=
 =?us-ascii?Q?ZtYxRFlYbLVkJddAOeJfvVTST9q7KFYO83ZtfhylD13wNGnyckI8ggG7+LTW?=
 =?us-ascii?Q?nIGxl9SL94sG7AerUbmF33jQq+GF5sI7G3PDLFlUK0glJpYGJ10BtuLMwEiu?=
 =?us-ascii?Q?lNMCtivVQ04EjlOnzzo2qD99tb2TqgmofSnHQ3q892VFFDVWHZK6KdpK1z1q?=
 =?us-ascii?Q?Kno6F8FTmZKKfl9aZnarXnaR4c5zTXOA27m/3zLJmwmzGQ++leQng0kmEcax?=
 =?us-ascii?Q?rLSmcTR9nxjZLP7zPwkFQPtz3yaGjwJWoWNtZwfkSRSXSRJ9Ei9ZystsCNF1?=
 =?us-ascii?Q?quIvgBtVAdtTuLiyS5wDJ6ITvK34SEB6b2LcjbHJxusyQ14fq/neKZLS1G42?=
 =?us-ascii?Q?NcXT+1lLK0DEpuF2HyfMwLvmqxsGpIoxIAZ1J4FNNbpuetscL1d/vhHP2nPZ?=
 =?us-ascii?Q?eskCK06ingz6SFdX9Mvw4qSvK66WDcIMiJ+KnfMg1mrcTP5nPsSBEarZ9Nd+?=
 =?us-ascii?Q?4bupkEWa71cFRcHUBDbCqXW7iv7I6NuymmR01Vj4y3HO7FAV9yPClWs/Ek5F?=
 =?us-ascii?Q?Dge/iEIAlzVkZ/YyT3MT9WyT1ZpnDI0VIlj66xR5tfPAUeR18QHDIGJPDCNS?=
 =?us-ascii?Q?FYfxXu0hkUBttfxFBEEDaZtsHZKm+SiyvhsPssKn/PwWTjEhjziVvPs1OXEo?=
 =?us-ascii?Q?jOXWWfE7yKVqN4FtWiwMYku+Z/HuUSejZfBs5H+zdWkNdaK2xLa64gvYY6BQ?=
 =?us-ascii?Q?l9V3QlkUCFHXseZBrVHdtdx5xwUjDI/WjIy4FWImewQYB7DrnvExdm/PTdZl?=
 =?us-ascii?Q?WndPTYD88Z5kBaiByXqIn+sw?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR07MB4830.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f38f500b-42e2-4ff9-26fe-08d973c35cfa
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 18:55:16.4391
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ITkKpL9pIr0fkJNmePcDFEhMTVzgIMQjpv2su+G8pjHYBMAcpGvUf7mzQf7DFGEvkf7WJ+tVmQzkjo2DX4wAiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR07MB3950
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SN6PR07MB4830947D79F9F5FB8A86BDED9FD59SN6PR07MB4830namp_"

--_000_SN6PR07MB4830947D79F9F5FB8A86BDED9FD59SN6PR07MB4830namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


I have a question regarding containers and was curious if you could provide=
 some assistance.

I have built container image using  my own recipe. The recipe pulls in othe=
r recipes such as  mono recipe.  Mono recipe is a custom recipe .bb file.  =
 I have changed the code which mono recipe .bb file references in SRC, but =
the container build doesn't pick up the changes.  If I build the host image=
 which also uses the recipe, it picks up the changes.
So, it seems the fact that I am using container build, the mono recipe buil=
d for some reason doesn't put the libraries and etc  in the container usr/l=
ib directory.
Is there anything special to get container  build to work proper by pulling=
 in libraries and object?


I have tried
 "bitbake -c  cleanall mono"
bitbake -f mono

   The build actually works, but it continues to pull the stale libraries (=
mar 9 2018)  and not the new libraries which were just built.
[asmith@rtxdoclp001 build]$ ls -l /home/asmith/preValContainer/poky/build/t=
mp/work/containerx86_64-enea-linux/fss-preval-container/1.0-r0/rootfs/usr/l=
ib/libmonotonic_clock.so.0
lrwxrwxrwx 1 asmith domain users 27 Mar  9  2018 /home/asmith/preValContain=
er/poky/build/tmp/work/containerx86_64-enea-linux/fss-preval-con


local.conf   snipnets..

DISTRO_FEATURES_append =3D " virtualization"
IMAGE_FSTYPES =3D "container"
PREFERRED_PROVIDER_virtual/kernel =3D "linux-dummy"
IMAGE_LINGUAS_append =3D " en-us"
#SSTATE_MIRRORS ?=3D "file://.* file:///proj/bitbake/poky-cache/sstate-cach=
e/PATH<file://.*%20file:/proj/bitbake/poky-cache/sstate-cache/PATH>"
MACHINE ?=3D "containerx86-64"

Thanks,
Al


--_000_SN6PR07MB4830947D79F9F5FB8A86BDED9FD59SN6PR07MB4830namp_
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
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:ZH-CN"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:ZH-CN">I have a =
question regarding containers and was curious if you could provide some ass=
istance.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:ZH-CN"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:ZH-CN">I have bu=
ilt container image using &nbsp;my own recipe. The recipe pulls in other re=
cipes such as&nbsp; mono recipe.&nbsp; Mono recipe is a custom recipe .bb f=
ile.&nbsp;&nbsp; I have changed the code which mono recipe .bb
 file references in SRC, but the container build doesn&#8217;t pick up the =
changes.&nbsp; If I build the host image which also uses the recipe, it pic=
ks up the changes.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:ZH-CN">So, it se=
ems the fact that I am using container build, the mono recipe build for som=
e reason doesn&#8217;t put the libraries and etc&nbsp; in the container usr=
/lib directory.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:ZH-CN">Is there =
anything special to get container &nbsp;build to work proper by pulling in =
libraries and object?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:ZH-CN"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:ZH-CN"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:ZH-CN">I have tr=
ied&nbsp;&nbsp; <o:p>
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;mso-fareast-language=
:ZH-CN">&nbsp;</span><span lang=3D"ZH-CN" style=3D"font-size:10.5pt;font-fa=
mily:DengXian;mso-fareast-language:ZH-CN">&#8220;</span><span style=3D"font=
-size:10.5pt;font-family:DengXian;mso-fareast-language:ZH-CN">bitbake
 -c </span><span style=3D"font-size:10.5pt;mso-fareast-language:ZH-CN">&nbs=
p;</span><span style=3D"font-size:10.5pt;font-family:DengXian;mso-fareast-l=
anguage:ZH-CN">cleanall mono</span><span style=3D"font-size:10.5pt;mso-fare=
ast-language:ZH-CN">&#8221;</span><span style=3D"font-size:10.5pt;font-fami=
ly:DengXian;mso-fareast-language:ZH-CN"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:DengXian=
;mso-fareast-language:ZH-CN">bitbake
</span><span style=3D"font-size:10.5pt;mso-fareast-language:ZH-CN">&#8211;<=
/span><span style=3D"font-size:10.5pt;font-family:DengXian;mso-fareast-lang=
uage:ZH-CN">f mono<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:DengXian=
;mso-fareast-language:ZH-CN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp; The build=
 actually works, but it continues to pull the stale libraries (mar 9 2018) =
&nbsp;and not the new libraries which were just built.<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:DengXian=
;mso-fareast-language:ZH-CN">[asmith@rtxdoclp001 build]$ ls -l /home/asmith=
/preValContainer/poky/build/tmp/work/containerx86_64-enea-linux/fss-preval-=
container/1.0-r0/rootfs/usr/lib/libmonotonic_clock.so.0
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:DengXian=
;mso-fareast-language:ZH-CN">lrwxrwxrwx 1 asmith domain users 27 Mar</span>=
<span style=3D"font-size:10.5pt;mso-fareast-language:ZH-CN">&nbsp;</span><s=
pan style=3D"font-size:10.5pt;font-family:DengXian;mso-fareast-language:ZH-=
CN">
 9</span><span style=3D"font-size:10.5pt;mso-fareast-language:ZH-CN">&nbsp;=
</span><span style=3D"font-size:10.5pt;font-family:DengXian;mso-fareast-lan=
guage:ZH-CN"> 2018 /home/asmith/preValContainer/poky/build/tmp/work/contain=
erx86_64-enea-linux/fss-preval-con<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:ZH-CN"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:ZH-CN"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:ZH-CN">local.con=
f&nbsp;&nbsp; snipnets..<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:ZH-CN"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:ZH-CN">DISTRO_FE=
ATURES_append =3D &quot; virtualization&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:ZH-CN">IMAGE_FST=
YPES =3D &quot;container&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:ZH-CN">PREFERRED=
_PROVIDER_virtual/kernel =3D &quot;linux-dummy&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:ZH-CN">IMAGE_LIN=
GUAS_append =3D &quot; en-us&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:ZH-CN">#SSTATE_M=
IRRORS ?=3D &quot;<a href=3D"file://.*%20file:/proj/bitbake/poky-cache/ssta=
te-cache/PATH"><span style=3D"color:#0563C1">file://.* file:///proj/bitbake=
/poky-cache/sstate-cache/PATH</span></a>&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:ZH-CN">MACHINE ?=
=3D &quot;containerx86-64&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:ZH-CN"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:ZH-CN">Thanks,<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:ZH-CN">Al<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SN6PR07MB4830947D79F9F5FB8A86BDED9FD59SN6PR07MB4830namp_--
