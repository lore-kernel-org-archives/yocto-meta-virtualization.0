Return-Path: <raymond.tan@intel.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8B1DDE00B9C; Fri, 23 Mar 2018 22:23:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [134.134.136.31 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BAF05E0084A;
	Fri, 23 Mar 2018 22:23:11 -0700 (PDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Mar 2018 22:23:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,353,1517904000"; d="scan'208,217";a="36406857"
Received: from kmsmsx155.gar.corp.intel.com ([172.21.73.106])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Mar 2018 22:23:09 -0700
Received: from pgsmsx110.gar.corp.intel.com (10.221.44.111) by
	KMSMSX155.gar.corp.intel.com (172.21.73.106) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Sat, 24 Mar 2018 13:23:08 +0800
Received: from pgsmsx104.gar.corp.intel.com ([169.254.3.116]) by
	PGSMSX110.gar.corp.intel.com ([169.254.13.74]) with mapi id
	14.03.0319.002; Sat, 24 Mar 2018 13:23:08 +0800
From: "Tan, Raymond" <raymond.tan@intel.com>
To: akuster808 <akuster808@gmail.com>, "poky@yoctoproject.org"
	<poky@yoctoproject.org>, "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: [poky] lttng-modules build error on linux-yocto-4.4 with KVM
	on [rocko] branch
Thread-Index: AdPCntvfMBG24SQwTBeGDDTA6NZVyP//pAgA//6BuxA=
Date: Sat, 24 Mar 2018 05:23:06 +0000
Message-ID: <F0CA9E243F4F424B836EAC30E41BF4CF781DC855@PGSMSX104.gar.corp.intel.com>
References: <F0CA9E243F4F424B836EAC30E41BF4CF781DBB3F@PGSMSX104.gar.corp.intel.com>
	<c327b015-5231-6ac1-4013-313967c97b87@gmail.com>
In-Reply-To: <c327b015-5231-6ac1-4013-313967c97b87@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYmZjNGRjZTctYjQ1Yy00OWE1LWJkZTctZTUzMDJhY2Q0NDFjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjIuNS4xOCIsIlRydXN0ZWRMYWJlbEhhc2giOiJ5XC9SQzRkMkFQaUFFVUZHM3VDT0lCN2ZrdXo0SW9cL25Jc3E2MXJlRUlFc2dZOG50b1F5K1g4UmVBUDZcL3JRK0VnIn0=
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Cc: "ray.danks@se-eng.com" <ray.danks@se-eng.com>
Subject: Re: [poky] lttng-modules build error on linux-yocto-4.4 with KVM on [rocko] branch
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
X-List-Received-Date: Sat, 24 Mar 2018 05:23:15 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_F0CA9E243F4F424B836EAC30E41BF4CF781DC855PGSMSX104garcor_"

--_000_F0CA9E243F4F424B836EAC30E41BF4CF781DC855PGSMSX104garcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Armin,

From: akuster808 [mailto:akuster808@gmail.com]
Sent: Friday, March 23, 2018 10:34 PM
To: Tan, Raymond <raymond.tan@intel.com>; poky@yoctoproject.org; meta-virtu=
alization@yoctoproject.org
Cc: ray.danks@se-eng.com
Subject: Re: [poky] lttng-modules build error on linux-yocto-4.4 with KVM o=
n [rocko] branch


Ray,

On 03/23/2018 05:10 AM, Tan, Raymond wrote:
Dear Maintainers,

I'm building the image core-image-sato-sdk on ROCKO branch with the poky, m=
eta-virtualization and meta-intel.

When I enabled virtualization and kvm,

DISTRO_FEATURES_append =3D " virtualization"
DISTRO_FEATURES_append =3D " kvm"

PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
PREFERRED_VERSION_linux-yocto ?=3D "4.4%"

I get the error as follow :

....
                 from /home/rahul/raymond/workingdir/pyro/build/tmp/work/in=
tel_corei7_64-poky-linux/lttng-modules/2.9.5-r0/lttng-modules-2.9.5/probes/=
lttng-probe-kvm.c:42:
/home/rahul/raymond/workingdir/pyro/build/tmp/work/intel_corei7_64-poky-lin=
ux/lttng-modules/2.9.5-r0/lttng-modules-2.9.5/probes/../probes/lttng-tracep=
oint-event-impl.h:142:6: error: conflicting types for 'trace_kvm_mmio'
void trace_##_name(_proto);
      ^
/home/rahul/raymond/workingdir/pyro/build/tmp/work/intel_corei7_64-poky-lin=
ux/lttng-modules/2.9.5-r0/lttng-modules-2.9.5/probes/../probes/lttng-tracep=
oint-event-impl.h:54:2: note: in expansion of macro 'LTTNG_TRACEPOINT_EVENT=
_INSTANCE_MAP'
  LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(map, name, map, PARAMS(proto), PARAMS=
(args))
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.....

Checking online, same issue was reported with the lttng-modules 2.9.5 on ke=
rnel 4.9 as well, albeit in different project https://jira.automotivelinux.=
org/browse/SPEC-1302

With the proposed solution in the AGL thread, updating lttng-modules to 2.1=
0.5 does fix this issue, since 2.10.5 is upstreamed into master-branch, wil=
l this version be patched to ROCKO as well?

Can you try
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dstable/rock=
o-next

to verify the backport fixes your problem

Thanks, the latest build swapping poky with this repo & branch compiled suc=
cessfully.
Sorry for the delay, a pretty old build machine I'm using.

- armin


/Ray




--_000_F0CA9E243F4F424B836EAC30E41BF4CF781DC855PGSMSX104garcor_
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
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
<body bgcolor=3D"white" lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Armin,<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><a name=3D"_____replyseparator"></a><b><span style=
=3D"color:windowtext">From:</span></b><span style=3D"color:windowtext"> aku=
ster808 [mailto:akuster808@gmail.com]
<br>
<b>Sent:</b> Friday, March 23, 2018 10:34 PM<br>
<b>To:</b> Tan, Raymond &lt;raymond.tan@intel.com&gt;; poky@yoctoproject.or=
g; meta-virtualization@yoctoproject.org<br>
<b>Cc:</b> ray.danks@se-eng.com<br>
<b>Subject:</b> Re: [poky] lttng-modules build error on linux-yocto-4.4 wit=
h KVM on [rocko] branch<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p>Ray,<span style=3D"font-size:12.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">On 03/23/2018 05:10 AM, Tan, Raymond wrote:<o:p></o:=
p></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p class=3D"MsoNormal">Dear Maintainers,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">I&#8217;m building the image core-image-sato-sdk on =
ROCKO branch with the poky, meta-virtualization and meta-intel.
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">When I enabled virtualization and kvm, <o:p></o:p></=
p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">DISTRO_FEATURES_append =3D &quot; virtualization&quo=
t;<o:p></o:p></p>
<p class=3D"MsoNormal">DISTRO_FEATURES_append =3D &quot; kvm&quot;<o:p></o:=
p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">PREFERRED_PROVIDER_virtual/kernel ?=3D &quot;linux-y=
octo&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">PREFERRED_VERSION_linux-yocto ?=3D &quot;4.4%&quot;<=
o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">I get the error as follow : <o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">&#8230;.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from /home/rahul/raymond/worki=
ngdir/pyro/build/tmp/work/intel_corei7_64-poky-linux/lttng-modules/2.9.5-r0=
/lttng-modules-2.9.5/probes/lttng-probe-kvm.c:42:<o:p></o:p></p>
<p class=3D"MsoNormal">/home/rahul/raymond/workingdir/pyro/build/tmp/work/i=
ntel_corei7_64-poky-linux/lttng-modules/2.9.5-r0/lttng-modules-2.9.5/probes=
/../probes/lttng-tracepoint-event-impl.h:142:6: error: conflicting types fo=
r 'trace_kvm_mmio'<o:p></o:p></p>
<p class=3D"MsoNormal">void trace_##_name(_proto);<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^<o:p></o:p></p>
<p class=3D"MsoNormal">/home/rahul/raymond/workingdir/pyro/build/tmp/work/i=
ntel_corei7_64-poky-linux/lttng-modules/2.9.5-r0/lttng-modules-2.9.5/probes=
/../probes/lttng-tracepoint-event-impl.h:54:2: note: in expansion of macro =
'LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP'<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(map, name=
, map, PARAMS(proto), PARAMS(args))<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<o:p></o:p=
></p>
<p class=3D"MsoNormal">&#8230;..<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">Checking online, same issue was reported with the lt=
tng-modules 2.9.5 on kernel 4.9 as well, albeit in different project
<a href=3D"https://jira.automotivelinux.org/browse/SPEC-1302">https://jira.=
automotivelinux.org/browse/SPEC-1302</a>
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">With the proposed solution in the AGL thread, updati=
ng lttng-modules to 2.10.5 does fix this issue, since 2.10.5 is upstreamed =
into master-branch, will this version be patched to ROCKO as well?
<o:p></o:p></p>
</blockquote>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,serif"><br>
Can you try <br>
<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3D=
stable/rocko-next">http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/l=
og/?h=3Dstable/rocko-next</a><br>
<br>
to verify the backport fixes your problem</span><span style=3D"font-size:12=
.0pt;font-family:&quot;Times New Roman&quot;,serif;color:#1F497D"><o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Thanks, the latest bui=
ld swapping poky with this repo &amp; branch compiled successfully.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Sorry for the delay, a=
 pretty old build machine I&#8217;m using.</span><span style=3D"font-size:1=
2.0pt;font-family:&quot;Times New Roman&quot;,serif"><br>
<br>
- armin<br>
<br>
</span><span style=3D"color:#1F497D"><o:p></o:p></span></p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">/Ray<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,serif"><br>
<br>
<o:p></o:p></span></p>
</blockquote>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
</div>
</div>
</body>
</html>

--_000_F0CA9E243F4F424B836EAC30E41BF4CF781DC855PGSMSX104garcor_--
