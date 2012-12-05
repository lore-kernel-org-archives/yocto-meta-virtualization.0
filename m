Return-Path: <mihai.prica@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 02522E0045D
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Dec 2012 04:02:33 -0800 (PST)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Dec 2012 04:02:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,221,1355126400"; 
	d="scan'208,217";a="257595959"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by fmsmga001.fm.intel.com with ESMTP; 05 Dec 2012 04:02:32 -0800
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.13]) by
	IRSMSX103.ger.corp.intel.com ([169.254.3.74]) with mapi id
	14.01.0355.002; Wed, 5 Dec 2012 12:02:31 +0000
From: "Prica, Mihai" <mihai.prica@intel.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: meta-virtualization structure
Thread-Index: Ac3S3fWc3L9Myuh7TQeop6Tag5S33g==
Date: Wed, 5 Dec 2012 12:02:31 +0000
Message-ID: <97BD068FB200C44AA73C2B641F162ECF8F2AB5@IRSMSX101.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: meta-virtualization structure
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
X-List-Received-Date: Wed, 05 Dec 2012 12:02:34 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_97BD068FB200C44AA73C2B641F162ECF8F2AB5IRSMSX101gercorpi_"

--_000_97BD068FB200C44AA73C2B641F162ECF8F2AB5IRSMSX101gercorpi_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I wanted to include my work with meta-kvm into the new layer(meta-virtualiz=
ation) and I was thinking about the best method of doing this.  The problem=
 is there are different kernel configs depending on the hypervisor and diff=
erent values for the PACKAGECONFIG in libvirt.

One solution would be to move all the common pieces into a meta layer and g=
roup the hypervisor configurations into a specific directory (meta-kvm, met=
a-xen), all of them in meta-virtualization. Is there another way ?
Thanks,
Mihai

--_000_97BD068FB200C44AA73C2B641F162ECF8F2AB5IRSMSX101gercorpi_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
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
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I wanted to include my work with meta-kvm into the n=
ew layer(meta-virtualization) and I was thinking about the best method of d=
oing this. &nbsp;The problem is there are different kernel configs dependin=
g on the hypervisor and different values
 for the PACKAGECONFIG in libvirt. <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">One solution would be to move all the common pieces =
into a meta layer and group the hypervisor configurations into a specific d=
irectory (meta-kvm, meta-xen), all of them in meta-virtualization. Is there=
 another way ?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Mihai<o:p></o:p></p>
</div>
</body>
</html>

--_000_97BD068FB200C44AA73C2B641F162ECF8F2AB5IRSMSX101gercorpi_--
