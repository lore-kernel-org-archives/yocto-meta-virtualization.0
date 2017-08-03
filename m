Return-Path: <mobahbay@outlook.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 95A46E00C44; Fri,  4 Aug 2017 02:03:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (mobahbay[at]outlook.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust *      [40.92.1.54 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 25327 seconds by postgrey-1.32 at yocto-www;
	Fri, 04 Aug 2017 02:03:09 PDT
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-oln040092001054.outbound.protection.outlook.com [40.92.1.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E175E00C3A
	for <meta-virtualization@yoctoproject.org>;
	Fri,  4 Aug 2017 02:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=Q9XQKp6jADBm8NXML9y0EFpDiAxK5mj1Ax8/LSUcKhU=;
	b=YP+h077KqxZ+TgcXiAlH2i0xSPLS66wM5ffNelKNGISr5iwW38VCzz9svcHucoUYAQvsScwTuZvUqoyOjO+TaqruERHxBU6r/hhMORrkcSo2r4U8ApYTSdg2VtavvC9ltdQmow51YXGWOLzxt1e2CVyKP1wVDWHzmxgNNLmGQN3V4MJe5veFIouvyr2qySuI7yWtEn1Ed3iJQFg3YdA3EsUsXea5BEG1zMimFBWmGRR1MPF+qSwTKSxJNwr8fh4J9spqUWMjdwEBjgSG9oWTJDvYWKuiFxw26wxUfzrtLLkjEtM3OY5+sirylT4Am9+ReedWCWAGFgIBNzeBDW4GIw==
Received: from BY2NAM01FT036.eop-nam01.prod.protection.outlook.com
	(10.152.68.53) by BY2NAM01HT107.eop-nam01.prod.protection.outlook.com
	(10.152.68.70) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.1282.16;
	Thu, 3 Aug 2017 15:30:41 +0000
Received: from DM5PR12MB1548.namprd12.prod.outlook.com (10.152.68.58) by
	BY2NAM01FT036.mail.protection.outlook.com (10.152.69.10) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1304.16 via Frontend Transport; Thu, 3 Aug 2017 15:30:39 +0000
Received: from DM5PR12MB1548.namprd12.prod.outlook.com ([10.172.37.23]) by
	DM5PR12MB1548.namprd12.prod.outlook.com ([10.172.37.23]) with mapi id
	15.01.1304.025; Thu, 3 Aug 2017 15:30:39 +0000
From: Mo Bah <mobahbay@outlook.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: Queries on building XenGt Yocto Image 
Thread-Index: AQHTDBS5OaqbUExQkkC29IEW8TZmT6JywQb5
Date: Thu, 3 Aug 2017 15:30:39 +0000
Message-ID: <DM5PR12MB15482D8C36D5115959E0ED60CFB10@DM5PR12MB1548.namprd12.prod.outlook.com>
References: <DM5PR12MB15485B2D79AC16EF7B6A3B97CFB10@DM5PR12MB1548.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB15485B2D79AC16EF7B6A3B97CFB10@DM5PR12MB1548.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: yoctoproject.org; dkim=none (message not signed)
	header.d=none;yoctoproject.org; dmarc=none action=none
	header.from=outlook.com;
x-incomingtopheadermarker: OriginalChecksum:BE5132B5939AF20FA88A952876F69B5AAEDFDAB83F9622F914B934FF2DC37E32;
	UpperCasedChecksum:408573A91EE36BF1EE78876C20534AF831EF17B0708E4249C2E8C419E3944BCD;
	SizeAsReceived:7163; Count:44
x-tmn: [zfeqJXNYoUdVHUOWURPRp6f5axvQUlxj]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BY2NAM01HT107;
	7:NuS7xMbEgXygCJflF/hZIKVKxA0zcgxwBXWEI26iXw5hvonGv8ssGTlAHXwDD7BPDfwMCPOZegCjI53ur93JhuePV2H04DaWUHIXBCEuhZMBTvgtiKj6ebm2DUkLs6Dlu4vGhle56uiNtBlBw423Fy0sy+8JlvRmP04NcK6JQV4p1Yvqag87c2bdNwuiOXUjagz835rB7Ue855sScpeLNedjh/1/iX+fkZfC7CX7CdSCqxTasp0EHXYPZg+EDVr3CfuL5NW8MGipaa1ox6Y6p1UZpj0HSWpCFHMcZ4eQNDxXdv3qbp6/wHhBE5P9JbyCLLgSST5BptfkxOACSSZfPLv/Nnc82UwmPIzf8I/am+NkPxzyJIO0wERnPnaz2NjURnTVXGSdUXR15CTrlmLC/PVlztVaizgjvNA9ghBzeBRu6lqcxFSbvKoSoJY3v0QY4rxceXB82z1JrlkZiUPbnR3Ej4N96VPaZX+C6Ctbj8spoBnBFd6OvYBL6G7vZmKrefaF3jR8RguYcwpUMew2WB9SVVz3OyEiPfcPEjNAOEDGsNAFUYhx/oTFvOeRmk0XHhuqbNejDdYwY4QtkxyDUnFs4YnuoeV0gtT4RLNM4ZiqidGbbMrGbpPD5m0a3G1mgRVzZW6eI1yWuppK2ToY75QhuDJGugW1UyDoL/Icfe7ORObz2gS0XvovRCfXbc6zN0f/+DHZf3tJS5C67+XPPq1iU7URDvPXZP/vefKx6E736wr9erbdaJi0EtL0xr/m0oOXPjXW26G4RBZZFfebyw==
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 7da3cb87-0965-4ed5-2b08-08d4da84988c
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(201702061074)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031324274)(2017031323274)(2017031322377)(1603101448)(1601125374)(1701031045)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BY2NAM01HT107; 
x-ms-traffictypediagnostic: BY2NAM01HT107:
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(444000031);
	SRVR:BY2NAM01HT107; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BY2NAM01HT107; 
x-forefront-prvs: 03883BD916
x-forefront-antispam-report: SFV:NSPM; SFS:(7070007)(98901004); DIR:OUT;
	SFP:1901; SCL:1; SRVR:BY2NAM01HT107;
	H:DM5PR12MB1548.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2017 15:30:39.4537 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2NAM01HT107
Subject: Re: Queries on building XenGt Yocto Image
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
X-List-Received-Date: Fri, 04 Aug 2017 09:03:11 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM5PR12MB15482D8C36D5115959E0ED60CFB10DM5PR12MB1548namp_"

--_000_DM5PR12MB15482D8C36D5115959E0ED60CFB10DM5PR12MB1548namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello All,

I had one more query and emailing the same.


After building a full Yocto image(with XenGt) for our embedded Intel board =
by integrating the meta-layers in #2 with #1 as in my previous email, shoul=
d I attempt installing this new Yocto image in our embedded Intel board, tr=
y doing the configurations, other installations/grub changes etc.(as releva=
nt in Yocto) relating to XenGt and post that attempt to boot through the do=
m0 kernel as mentioned in the link below for Debian?


https://wiki.xenproject.org/wiki/Xen_Project_Beginners_Guide#Installing_Deb=
ian

Xen Project Beginners Guide - Xen<https://wiki.xenproject.org/wiki/Xen_Proj=
ect_Beginners_Guide#Installing_Debian>
wiki.xenproject.org
Welcome! This guide was written to introduce beginners to basic Xen Project=
 concepts and allow you to get started with Xen Project with no prior knowl=
edge.

Please advise as I am doing this for the first time.


Thanks

M



________________________________
From: Mo Bah
Sent: Thursday, August 3, 2017 2:07 AM
To: meta-virtualization@yoctoproject.org
Subject: Queries on building XenGt Yocto Image


Hello All,

I am trying to build XenGt for an Intel embedded board.


1) We have been provided with the BSP package for this embedded Intel board=
 and I know the build procedure to build fully operational Yocto Image for =
this board which includes integrating the Intel board BSP package with the =
Yocto git repository components including the required meta-layers and buil=
ding all of these together to create an image for the board.


2) For building XenGt, the 'meta-virtualization' layer has to be included i=
n the Yocto image as per the Yocto documentation and this layer has depende=
ncies on openembedded-core<https://layers.openembedded.org/layerindex/branc=
h/master/layer/openembedded-core/>, meta-oe<https://layers.openembedded.org=
/layerindex/branch/master/layer/meta-oe/>, meta-networking<https://layers.o=
penembedded.org/layerindex/branch/master/layer/meta-networking/>, meta-file=
systems<https://layers.openembedded.org/layerindex/branch/master/layer/meta=
-filesystems/>.  The meta-networking layer has dependencies on meta-python =
layer as well.


The OpenEmbedded-Core is the layer containing the core metadata for current=
 versions of OpenEmbedded. It is distro-less and contains only emulated mac=
hine support.


To build XenGt, the approach would be to build a XenGt hypervisor image for=
 this Intel board by integrating the meta-layers in #2 with #1? or is there=
 any other way to build the XenGt hypervisor image?


The 'meta-virtualization' link

http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/about/  menti=
ons about dependencies of 'meta-virtualization' on openembedded-core, meta-=
oe, meta-networking, meta-filesystems, meta-python and meta-go layers as we=
ll. However, without the BSP support, I am not sure how the dom0 kernel wou=
ld communicate with the physical hardware? Any pointers if I am missing any=
thing?


Thanks

M










I came across these links.

http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/

http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/about/







--_000_DM5PR12MB15482D8C36D5115959E0ED60CFB10DM5PR12MB1548namp_
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
<p>Hello All,</p>
<p>I had one more query and emailing the same.&nbsp;</p>
<p><br>
</p>
<p>After&nbsp;<span style=3D"color: rgb(51, 51, 51); font-family: Calibri, =
Helvetica, sans-serif; font-size: 12pt;">building a full Yocto</span><span =
style=3D"color: rgb(51, 51, 51); font-family: Calibri, Helvetica, sans-seri=
f; font-size: 12pt;">&nbsp;image(with XenGt) for
 our embedded Intel board by integrating the meta-layers in #2 with&nbsp;#1=
 as in my previous email, should I attempt installing this new Yocto image =
in our embedded Intel board, try doing the configurations,&nbsp;other insta=
llations/grub changes etc.(as relevant in
 Yocto) relating to XenGt and post that attempt to boot through the dom0 ke=
rnel as mentioned in the link below for Debian?&nbsp;</span></p>
<p><br>
</p>
<p><a href=3D"https://wiki.xenproject.org/wiki/Xen_Project_Beginners_Guide#=
Installing_Debian" class=3D"OWAAutoLink" id=3D"LPlnk954674" previewremoved=
=3D"true">https://wiki.xenproject.org/wiki/Xen_Project_Beginners_Guide#Inst=
alling_Debian</a>&nbsp;</p>
<div id=3D"LPBorder_GT_15017738713000.6344559004819936" style=3D"margin-bot=
tom: 20px; overflow: auto; width: 100%; text-indent: 0px;">
<table id=3D"LPContainer_15017738712960.9054497564345172" role=3D"presentat=
ion" cellspacing=3D"0" style=3D"width: 90%; background-color: rgb(255, 255,=
 255); position: relative; overflow: auto; padding-top: 20px; padding-botto=
m: 20px; margin-top: 20px; border-top: 1px dotted rgb(200, 200, 200); borde=
r-bottom: 1px dotted rgb(200, 200, 200);">
<tbody>
<tr valign=3D"top" style=3D"border-spacing: 0px;">
<td id=3D"TextCell_15017738712970.1500023263168706" colspan=3D"2" style=3D"=
vertical-align: top; position: relative; padding: 0px; display: table-cell;=
">
<div id=3D"LPRemovePreviewContainer_15017738712970.650335240824707"></div>
<div id=3D"LPTitle_15017738712970.23773321129947056" style=3D"top: 0px; col=
or: rgb(0, 120, 215); font-weight: normal; font-size: 21px; font-family: wf=
_segoe-ui_light, &quot;Segoe UI Light&quot;, &quot;Segoe WP Light&quot;, &q=
uot;Segoe UI&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, sans-serif; line-h=
eight: 21px;">
<a id=3D"LPUrlAnchor_15017738712980.18453977455720616" href=3D"https://wiki=
.xenproject.org/wiki/Xen_Project_Beginners_Guide#Installing_Debian" target=
=3D"_blank" style=3D"text-decoration: none;">Xen Project Beginners Guide - =
Xen</a></div>
<div id=3D"LPMetadata_15017738712980.5559130408822874" style=3D"margin: 10p=
x 0px 16px; color: rgb(102, 102, 102); font-weight: normal; font-family: wf=
_segoe-ui_normal, &quot;Segoe UI&quot;, &quot;Segoe WP&quot;, Tahoma, Arial=
, sans-serif; font-size: 14px; line-height: 14px;">
wiki.xenproject.org</div>
<div id=3D"LPDescription_15017738712990.01765470050796103" style=3D"display=
: block; color: rgb(102, 102, 102); font-weight: normal; font-family: wf_se=
goe-ui_normal, &quot;Segoe UI&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, s=
ans-serif; font-size: 14px; line-height: 20px; max-height: 100px; overflow:=
 hidden;">
Welcome! This guide was written to introduce beginners to basic Xen Project=
 concepts and allow you to get started with Xen Project with no prior knowl=
edge.</div>
</td>
</tr>
</tbody>
</table>
</div>
Please advise as I am doing this for the first time.
<p></p>
<p><br>
</p>
<p>Thanks</p>
<p>M<br>
<br>
</p>
<br>
<br>
<div style=3D"color: rgb(0, 0, 0);">
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Mo Bah<br>
<b>Sent:</b> Thursday, August 3, 2017 2:07 AM<br>
<b>To:</b> meta-virtualization@yoctoproject.org<br>
<b>Subject:</b> Queries on building XenGt Yocto Image </font>
<div>&nbsp;</div>
</div>
<div>
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; color=
:#000000; font-family:Calibri,Helvetica,sans-serif">
<p><span style=3D"color:rgb(0,0,0); font-family:Calibri,Helvetica,sans-seri=
f; font-size:11pt">Hello All,</span></p>
<p><span style=3D"color:rgb(0,0,0); font-family:Calibri,Helvetica,sans-seri=
f; font-size:11pt"><span style=3D"font-size:12pt">I am trying to build
</span><b><span style=3D"font-size:12pt">XenGt for an Intel embedded&nbsp;b=
oard</span></b><span style=3D"font-size:12pt">.</span></span></p>
<p><br>
</p>
<p><span style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt"=
>1)&nbsp;We have been provided with the&nbsp;</span><span style=3D"font-fam=
ily:Calibri,Helvetica,sans-serif; font-size:11pt"><span style=3D"font-size:=
12pt">BSP package for this embedded&nbsp;Intel board
</span><span style=3D"font-size:12pt">and I know the build procedure to bui=
ld fully operational&nbsp;Yocto Image for this board which includes integra=
ting the Intel board BSP package with the Yocto git repository components i=
ncluding the required meta-layers and building
 all of these together to create an image for the board.</span></span><br>
</p>
<p><br>
</p>
<p><span style=3D"font-size:11pt; color:rgb(0,0,0); font-family:Calibri,Hel=
vetica,sans-serif"><span style=3D"font-size:12pt; color:rgb(0,0,0)">2)<b>&n=
bsp;</b><b>For building XenG</b></span><span style=3D"font-weight:bold; fon=
t-size:12pt; color:rgb(0,0,0)">t</span><span style=3D"font-size:12pt; color=
:rgb(0,0,0)">,
 the </span><b><span style=3D"font-size:12pt; color:rgb(0,0,0)">'</span></b=
></span><span style=3D"font-size:11pt; color:rgb(0,0,0); font-family:Calibr=
i,Helvetica,sans-serif"><b><span style=3D"font-size:12pt; color:rgb(0,0,0)"=
>meta-virtualization</span></b><span style=3D"font-size:12pt; color:rgb(0,0=
,0)">'
 layer has to be included in the Yocto image as per the Yocto documentation=
 and this&nbsp;</span></span><span style=3D"color:rgb(0,0,0); font-family:C=
alibri,Helvetica,sans-serif; font-size:12pt">layer has&nbsp;dependencies on=
&nbsp;</span><b><a href=3D"https://layers.openembedded.org/layerindex/branc=
h/master/layer/openembedded-core/" style=3D"font-family:&quot;Helvetica Neu=
e&quot;,Helvetica,Arial,sans-serif; font-size:1.2em; color:rgb(0,136,204)">=
<span style=3D"color:rgb(0,0,0); font-family:Calibri,Helvetica,sans-serif; =
font-size:12pt">openembedded-core</span></a><span style=3D"color:rgb(0,0,0)=
; font-family:Calibri,Helvetica,sans-serif; font-size:12pt">,&nbsp;</span><=
span style=3D"font-size:12pt"></span><a href=3D"https://layers.openembedded=
.org/layerindex/branch/master/layer/meta-oe/" title=3D"https://layers.opene=
mbedded.org/layerindex/branch/master/layer/meta-oe/=0A=
Ctrl&#43;Click or tap to follow the link" style=3D"font-family:&quot;Helvet=
ica Neue&quot;,Helvetica,Arial,sans-serif; font-size:1.2em; color:rgb(0,136=
,204)"><span style=3D"color:rgb(0,0,0); font-family:Calibri,Helvetica,sans-=
serif; font-size:12pt">meta-oe</span></a><span style=3D"color:rgb(0,0,0); f=
ont-family:Calibri,Helvetica,sans-serif; font-size:12pt">,&nbsp;</span><a h=
ref=3D"https://layers.openembedded.org/layerindex/branch/master/layer/meta-=
networking/" style=3D"font-family:&quot;Helvetica Neue&quot;,Helvetica,Aria=
l,sans-serif; font-size:1.2em; color:rgb(0,136,204)"><span style=3D"color:r=
gb(0,0,0); font-family:Calibri,Helvetica,sans-serif; font-size:12pt">meta-n=
etworking</span></a><span style=3D"color:rgb(0,0,0); font-family:Calibri,He=
lvetica,sans-serif; font-size:12pt">,<span style=3D"font-size:11pt">&nbsp;<=
/span></span></b><span style=3D"font-family:Calibri,Helvetica,sans-serif; f=
ont-size:12pt; color:rgb(0,0,0)"><a href=3D"https://layers.openembedded.org=
/layerindex/branch/master/layer/meta-filesystems/" style=3D"font-weight:bol=
d; font-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif; font-=
size:1.2em; color:rgb(0,136,204)"><span style=3D"font-size:11pt; color:rgb(=
0,0,0)">meta-filesystems</span></a><span style=3D"font-size:11pt; color:rgb=
(0,0,0)"><b>.
 &nbsp;</b></span></span><span style=3D"font-family:Calibri,Helvetica,sans-=
serif; font-size:12pt">The&nbsp;</span><span style=3D"font-family:Calibri,H=
elvetica,sans-serif; font-size:12pt"><b>meta-networking</b> layer</span><sp=
an style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt">&nbsp=
;has
 dependencies on <b>meta-python</b> layer as well.&nbsp;</span><span style=
=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0=
,0)"><span style=3D"font-size:11pt; color:rgb(0,0,0)"></span></span></p>
<div style=3D"font-weight:bold"><span style=3D"font-size:12pt"><span style=
=3D"font-family:Calibri,Helvetica,sans-serif; font-size:16.8px"><br>
</span></span></div>
<b></b>
<p></p>
<p><span style=3D"font-size:12pt"><span style=3D"color:rgb(51,51,51); font-=
family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif; font-size:16.=
8px"><span style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">The&nbsp;</span><span style=3D"font-family:Calibri,Hel=
vetica,sans-serif; font-size:12pt; color:rgb(0,0,0)"><b>OpenEmbedded-Core</=
b>
 is the&nbsp;layer containing the core metadata for current versions of Ope=
nEmbedded. It is distro-less and contains only emulated machine support.</s=
pan>&nbsp;</span><br>
</span></p>
<p><span style=3D"font-size:12pt"><span style=3D"color:rgb(51,51,51); font-=
family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif; font-size:16.=
8px"><br>
</span></span></p>
<p><span style=3D"font-size:12pt"><span style=3D"color:rgb(51,51,51); font-=
family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif; font-size:16.=
8px"><span style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12p=
t">To build XenGt, the approach would be
<b>to build a XenGt&nbsp;</b></span><span style=3D"font-family:Calibri,Helv=
etica,sans-serif; font-size:12pt"><b>hypervisor image for this Intel board =
by integrating the meta-layers in #2 with&nbsp;#1</b>? or is there any othe=
r way to build the XenGt hypervisor&nbsp;image?&nbsp;</span></span></span><=
/p>
<p><span style=3D"font-size:12pt"><span style=3D"color:rgb(51,51,51); font-=
family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif; font-size:16.=
8px"><span style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12p=
t"><br>
</span></span></span></p>
<p><span style=3D"font-size:12pt"><span style=3D"color:rgb(51,51,51); font-=
family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif; font-size:16.=
8px"><span style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12p=
t">The
<b>'meta-virtualization</b>' link</span></span></span></p>
<p><a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization=
/about/" class=3D"OWAAutoLink" id=3D"LPlnk442261" style=3D"font-size:12pt; =
font-family:Calibri,Helvetica,sans-serif" previewremoved=3D"true">http://gi=
t.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/about/</a><span style=
=3D"font-size:12pt; font-family:Calibri,Helvetica,sans-serif; color:rgb(51,=
51,51)">&nbsp;
 mentions about dependencies of <b>'meta-virtualization'</b>&nbsp;on&nbsp;<=
/span><span style=3D"color:rgb(51,51,51); font-family:Calibri,Helvetica,san=
s-serif; font-size:12pt">o<b>penembedded-core, meta-oe, meta-networking, me=
ta-filesystems, meta-python and meta-go</b>
 layers as well.&nbsp;</span><span style=3D"color:rgb(51,51,51); font-famil=
y:Calibri,Helvetica,sans-serif; font-size:12pt">However, without the BSP su=
pport, I am not sure how the dom0 kernel would communicate with the physica=
l hardware? Any pointers if I am missing
 anything?&nbsp;</span></p>
<p><span style=3D"color:rgb(51,51,51); font-family:Calibri,Helvetica,sans-s=
erif; font-size:12pt"><br>
</span></p>
<p><span style=3D"color:rgb(51,51,51); font-family:Calibri,Helvetica,sans-s=
erif; font-size:12pt">Thanks</span></p>
<p><span style=3D"color:rgb(51,51,51); font-family:Calibri,Helvetica,sans-s=
erif; font-size:12pt">M</span></p>
<p><br>
</p>
<p><span style=3D"font-size:12pt"><span style=3D"color:rgb(51,51,51); font-=
family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif; font-size:16.=
8px"><span style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12p=
t"><br>
</span></span></span></p>
<p><span style=3D"font-size:12pt"><span style=3D"color:rgb(51,51,51); font-=
family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif; font-size:16.=
8px"><br>
</span></span></p>
<p><span style=3D"font-size:12pt"><span style=3D"color:rgb(51,51,51); font-=
family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif; font-size:16.=
8px"><br>
</span></span></p>
<p><span style=3D"font-size:12pt"><span style=3D"color:rgb(51,51,51); font-=
family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif; font-size:16.=
8px"><br>
</span></span></p>
<p><br>
</p>
<p><span style=3D"font-size:12pt"><br>
</span></p>
<p><span style=3D"font-size:12pt"><br>
</span></p>
<p><span style=3D"font-size:12pt"><br>
</span></p>
<p>I came across these links.</p>
<p><a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization=
/" class=3D"OWAAutoLink" id=3D"LPlnk99971" style=3D"font-size:12pt" preview=
removed=3D"true">http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualizat=
ion/</a><span style=3D"font-size:12pt">&nbsp;</span><br>
</p>
<p></p>
<p style=3D"font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple =
Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI =
Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols; font-size:16px">
<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/ab=
out" class=3D"OWAAutoLink" id=3D"LPlnk639215" previewremoved=3D"true">http:=
//git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/about</a>/</p>
<div><br>
</div>
&nbsp;
<p></p>
<p><br>
<br>
</p>
<p><br>
</p>
<div id=3D"Signature">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt; color:#000000; ba=
ckground-color:#FFFFFF; font-family:Calibri,Arial,Helvetica,sans-serif">
<br>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_DM5PR12MB15482D8C36D5115959E0ED60CFB10DM5PR12MB1548namp_--
