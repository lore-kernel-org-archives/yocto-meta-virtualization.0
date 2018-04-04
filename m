Return-Path: <tpradeep@cisco.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0CC94E00932; Tue,  3 Apr 2018 21:58:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM
	white-list
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [173.37.86.78 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED739E008BF
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Apr 2018 21:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=48378; q=dns/txt;
	s=iport; t=1522817882; x=1524027482;
	h=from:to:subject:date:message-id:references:in-reply-to:
	mime-version; bh=k29YcFI2eYmJPjv+7wAiTOy6xgrum/iO+o5hWc6qIuU=;
	b=PuYvjk9pAN3EYACMc8OYnq+Av8ov7Y1SSkCq7YGwiHhjGuPV6k7qKWOL
	TST5opX8549gmTd5EiWnMEKR82s0oEmS3lIZBWqZso9xAewXov2ca6wS/
	l+vHv0/Nym9GY2Fm+Z77FmBmB4YFVc4CZBtbfCChhFt9rqh+0PTfiZQYJ 0=;
X-Files: docker.log, Docker 1.png, Docker 2.png : 2151, 13224, 7220
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0D/AQB6WsRa/5RdJa1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQcBAQEBAYJNdWFvKAqYXIF0dRqNcYRkgXoIAQIYAQqEYAKEQiE2FgECAQE?=
	=?us-ascii?q?BAQEBAmscDIUiAQEBAQMBAQMoOgcXBAIBCBEBAwEBBgEBIAcCFRABChQDBggCB?=
	=?us-ascii?q?AESCAaEGmUPrw2IR4IWCgWGRYEdghOBDIJQNIMRAQSBcIUdIAKHG4RXN2aKLAg?=
	=?us-ascii?q?CgzKBUAFNhQODUoE4g1mHLokVhkECERMBgSQBIwMugVJwFTqCQ4IgFxGDNIUUh?=
	=?us-ascii?q?T5vjFmBFwEB?=
X-IronPort-AV: E=Sophos;i="5.48,404,1517875200"; 
	d="log'?png'150?scan'150,208,217,150";a="374614414"
Received: from rcdn-core-12.cisco.com ([173.37.93.148])
	by rcdn-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 04:58:00 +0000
Received: from XCH-ALN-014.cisco.com (xch-aln-014.cisco.com [173.36.7.24])
	by rcdn-core-12.cisco.com (8.14.5/8.14.5) with ESMTP id w344w0i2005591
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 4 Apr 2018 04:58:00 GMT
Received: from xch-rcd-011.cisco.com (173.37.102.21) by XCH-ALN-014.cisco.com
	(173.36.7.24) with Microsoft SMTP Server (TLS) id 15.0.1320.4;
	Tue, 3 Apr 2018 23:58:00 -0500
Received: from xch-rcd-011.cisco.com ([173.37.102.21]) by
	xch-rcd-011.cisco.com ([173.37.102.21]) with mapi id 15.00.1320.000;
	Tue, 3 Apr 2018 23:58:00 -0500
From: "Shakthi Pradeep (tpradeep)" <tpradeep@cisco.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: [meta-virtualization] RFT/FYI: docker/containerd/runc uprevs
	pushed	to master
Thread-Index: AQHTy8MHMwxhCr8lwEegu8pR3ZwXPaPwCksw
Date: Wed, 4 Apr 2018 04:57:59 +0000
Message-ID: <7209206599d5475fae12e84333947025@xch-rcd-011.cisco.com>
References: <CADkTA4OCesBQoAPuUOtBB=kzZ38hwH0HNVY=d68ciBe8Fsrp4A@mail.gmail.com>
In-Reply-To: <CADkTA4OCesBQoAPuUOtBB=kzZ38hwH0HNVY=d68ciBe8Fsrp4A@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.142.108.187]
MIME-Version: 1.0
Subject: Re: RFT/FYI: docker/containerd/runc uprevs pushed	to master
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
X-List-Received-Date: Wed, 04 Apr 2018 04:58:04 -0000
X-Groupsio-MsgNum: 3290
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_006_7209206599d5475fae12e84333947025xchrcd011ciscocom_"

--_006_7209206599d5475fae12e84333947025xchrcd011ciscocom_
Content-Type: multipart/alternative;
	boundary="_000_7209206599d5475fae12e84333947025xchrcd011ciscocom_"

--_000_7209206599d5475fae12e84333947025xchrcd011ciscocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Bruce,



Timing is Perfect !!!



I am currently trying to get Docker CE to work with Yocto. I could include =
the Docker executable in ISO but when I run it I get some errors.


When I boot the image looks like Docker service start is failing due to mis=
sing kernel modules. Please refer attached screenshot and below error log.

* docker.service - Docker Application Container Engine
   Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor pres=
et: enabled)
   Active: failed (Result: exit-code) since Tue 2018-04-03 13:17:51 UTC; 17=
min ago
     Docs: https://docs.docker.com
  Process: 317 ExecStart=3D/usr/bin/dockerd -H fd:// (code=3Dexited, status=
=3D1/FAILURE)
Main PID: 317 (code=3Dexited, status=3D1/FAILURE)

Apr 03 13:17:51 intel-x86-64 dockerd[317]: time=3D"2018-04-03T13:17:51.0351=
78755Z" level=3Dwarning msg=3D"Running modprobe xt_conntrack failed with me=
ssage: `modprobe: WARNING: Module xt_conntrack not found in directory /lib/=
modules/4.8.24-WR9.0.0.10_standard`, error: exit status 1"
Apr 03 13:17:51 intel-x86-64 dockerd[317]: time=3D"2018-04-03T13:17:51.0407=
27372Z" level=3Dinfo msg=3D"Firewalld running: false"
Apr 03 13:17:51 intel-x86-64 dockerd[317]: time=3D"2018-04-03T13:17:51.1705=
75344Z" level=3Dwarning msg=3D"Could not load necessary modules for IPSEC r=
ules: Running modprobe xfrm_user failed with message: `modprobe: WARNING: M=
odule xfrm_user not found in directory /lib/modules/4.8.24-WR9.0.0.10_stand=
ard`, error: exit status 1"
Apr 03 13:17:51 intel-x86-64 dockerd[317]: time=3D"2018-04-03T13:17:51.1723=
97913Z" level=3Dinfo msg=3D"Default bridge (docker0) is assigned with an IP=
 address 172.17.0.0/16. Daemon option --bip can be used to set a preferred =
IP address"
Apr 03 13:17:51 intel-x86-64 dockerd[317]: Error starting daemon: Error ini=
tializing network controller: Error creating default "bridge" network: Fail=
ed to Setup IP tables: Unable to enable ACCEPT INCOMING rule:  (iptables fa=
iled: iptables --wait -I FORWARD -o docker0 -m conntrack --ctstate RELATED,=
ESTABLISHED -j ACCEPT: iptables: No chain/target/match by that name.
Apr 03 13:17:51 intel-x86-64 dockerd[317]:  (exit status 1))
Apr 03 13:17:51 intel-x86-64 systemd[1]: docker.service: Main process exite=
d, code=3Dexited, status=3D1/FAILURE
Apr 03 13:17:51 intel-x86-64 systemd[1]: Failed to start Docker Application=
 Container Engine.
Apr 03 13:17:51 intel-x86-64 systemd[1]: docker.service: Unit entered faile=
d state.
Apr 03 13:17:51 intel-x86-64 systemd[1]: docker.service: Failed with result=
 'exit-code'.



Regards,

Shakthi



-----Original Message-----
From: meta-virtualization-bounces@yoctoproject.org [mailto:meta-virtualizat=
ion-bounces@yoctoproject.org] On Behalf Of Bruce Ashfield
Sent: Wednesday, April 04, 2018 8:44 AM
To: meta-virtualization@yoctoproject.org
Subject: [meta-virtualization] RFT/FYI: docker/containerd/runc uprevs pushe=
d to master



Hi all,



After spending a few days de-tangling the moby/docker/runc/containerd and o=
e-core go infrastructure changes, I was able to run docker/runc/containerd =
through a system/stress test and everything seems to be working.



There were a few regressions that I worked through, as well as build/packag=
ing changes, but I'm no longer seeing any issues and all the patches/functi=
onality have been carried forward.



One thing of note is that the docker and open containers containerd split/f=
ork is no longer an issue, so I've modified the default to be the openconta=
iners variant. Similarly, the docker and opencontainers runc are very simil=
ar. I've kept both variants of both recipes for now, since I'd like to trac=
k things for a bit longer before declaring the split unnecessary.



Also for those that care, I created a reference docker-ce recipe that track=
s the docker-ce repo versus the components themselves.  Right now it is ref=
erence only, since it needs a bit more work, but I wanted to get it out the=
re, in case someone really cares about docker-ce (I don't really, but someo=
ne might!).



Summary: I just pushed the following changes to master:



  d7d310ae4113 meta-virt: prefer containerd-opencontainers

  935e3d969ef1 containerd: uprev to v1.0.2

  f5fbfa8ac4db docker-ce: introduce reference recipe/build

  a5074cecf18f docker: uprev to 18.03.0

  e3d960f4fcd9 runc: uprev to 1.0.0-rc5



If anyone sees regressions, build or architecture issues .. report them to =
me (and the list) and we'll get them fixed up.



Cheers,



Bruce



--

"Thou shalt not follow the NULL pointer, for chaos and madness await thee a=
t its end"

--

_______________________________________________

meta-virtualization mailing list

meta-virtualization@yoctoproject.org<mailto:meta-virtualization@yoctoprojec=
t.org>

https://lists.yoctoproject.org/listinfo/meta-virtualization

--_000_7209206599d5475fae12e84333947025xchrcd011ciscocom_
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
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
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
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
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
<p class=3D"MsoPlainText">Hello Bruce,<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Timing is Perfect !!!<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">I am currently trying to get Docker CE to work wi=
th Yocto. I could include the Docker executable in ISO but when I run it I =
get some errors.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">When I boot the image =
looks like Docker service start is failing due to missing kernel modules. P=
lease refer attached screenshot and below error log.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#C55A11">* docker.service - Doc=
ker Application Container Engine<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#C55A11">&nbsp;&nbsp; Loaded: l=
oaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#C55A11">&nbsp;&nbsp; Active: f=
ailed (Result: exit-code) since Tue 2018-04-03 13:17:51 UTC; 17min ago<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#C55A11">&nbsp;&nbsp;&nbsp;&nbs=
p; Docs: <a href=3D"https://docs.docker.com">
https://docs.docker.com</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#C55A11">&nbsp; Process: 317 Ex=
ecStart=3D/usr/bin/dockerd -H fd:// (code=3Dexited, status=3D1/FAILURE)<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#C55A11">Main PID: 317 (code=3D=
exited, status=3D1/FAILURE)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#C55A11"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#C55A11;background:yellow;mso-h=
ighlight:yellow">Apr 03 13:17:51 intel-x86-64 dockerd[317]: time=3D&quot;20=
18-04-03T13:17:51.035178755Z&quot; level=3Dwarning msg=3D&quot;Running modp=
robe xt_conntrack failed with message: `modprobe: WARNING:
 Module xt_conntrack not found in directory /lib/modules/4.8.24-WR9.0.0.10_=
standard`, error: exit status 1&quot;</span><span style=3D"color:#C55A11"><=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#C55A11">Apr 03 13:17:51 intel-=
x86-64 dockerd[317]: time=3D&quot;2018-04-03T13:17:51.040727372Z&quot; leve=
l=3Dinfo msg=3D&quot;Firewalld running: false&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#C55A11;background:yellow;mso-h=
ighlight:yellow">Apr 03 13:17:51 intel-x86-64 dockerd[317]: time=3D&quot;20=
18-04-03T13:17:51.170575344Z&quot; level=3Dwarning msg=3D&quot;Could not lo=
ad necessary modules for IPSEC rules: Running modprobe xfrm_user
 failed with message: `modprobe: WARNING: Module xfrm_user not found in dir=
ectory /lib/modules/4.8.24-WR9.0.0.10_standard`, error: exit status 1&quot;=
</span><span style=3D"color:#C55A11"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#C55A11">Apr 03 13:17:51 intel-=
x86-64 dockerd[317]: time=3D&quot;2018-04-03T13:17:51.172397913Z&quot; leve=
l=3Dinfo msg=3D&quot;Default bridge (docker0) is assigned with an IP addres=
s 172.17.0.0/16. Daemon option --bip can be used to set a
 preferred IP address&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#C55A11">Apr 03 13:17:51 intel-=
x86-64 dockerd[317]: Error starting daemon: Error initializing network cont=
roller: Error creating default &quot;bridge&quot; network: Failed to Setup =
IP tables: Unable to enable ACCEPT INCOMING rule:&nbsp;
 (iptables failed: iptables --wait -I FORWARD -o docker0 -m conntrack --cts=
tate RELATED,ESTABLISHED -j ACCEPT: iptables: No chain/target/match by that=
 name.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#C55A11">Apr 03 13:17:51 intel-=
x86-64 dockerd[317]:&nbsp; (exit status 1))<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#C55A11">Apr 03 13:17:51 intel-=
x86-64 systemd[1]: docker.service: Main process exited, code=3Dexited, stat=
us=3D1/FAILURE<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#C55A11">Apr 03 13:17:51 intel-=
x86-64 systemd[1]: Failed to start Docker Application Container Engine.<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#C55A11">Apr 03 13:17:51 intel-=
x86-64 systemd[1]: docker.service: Unit entered failed state.<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"color:#C55A11">Apr 03 13:17:51 intel-=
x86-64 systemd[1]: docker.service: Failed with result 'exit-code'.<o:p></o:=
p></span></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Regards,<o:p></o:p></p>
<p class=3D"MsoPlainText">Shakthi<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">-----Original Message-----<br>
From: meta-virtualization-bounces@yoctoproject.org [mailto:meta-virtualizat=
ion-bounces@yoctoproject.org] On Behalf Of Bruce Ashfield<br>
Sent: Wednesday, April 04, 2018 8:44 AM<br>
To: meta-virtualization@yoctoproject.org<br>
Subject: [meta-virtualization] RFT/FYI: docker/containerd/runc uprevs pushe=
d to master</p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Hi all,<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">After spending a few days de-tangling the moby/do=
cker/runc/containerd and oe-core go infrastructure changes, I was able to r=
un docker/runc/containerd through a system/stress test and everything seems=
 to be working.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">There were a few regressions that I worked throug=
h, as well as build/packaging changes, but I'm no longer seeing any issues =
and all the patches/functionality have been carried forward.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">One thing of note is that the docker and open con=
tainers containerd split/fork is no longer an issue, so I've modified the d=
efault to be the opencontainers variant. Similarly, the docker and opencont=
ainers runc are very similar. I've
 kept both variants of both recipes for now, since I'd like to track things=
 for a bit longer before declaring the split unnecessary.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Also for those that care, I created a reference d=
ocker-ce recipe that tracks the docker-ce repo versus the components themse=
lves.&nbsp; Right now it is reference only, since it needs a bit more work,=
 but I wanted to get it out there, in case
 someone really cares about docker-ce (I don't really, but someone might!).=
<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Summary: I just pushed the following changes to m=
aster:<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&nbsp; d7d310ae4113 meta-virt: prefer containerd-=
opencontainers<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp; 935e3d969ef1 containerd: uprev to v1.0.2<o=
:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp; f5fbfa8ac4db docker-ce: introduce referenc=
e recipe/build<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp; a5074cecf18f docker: uprev to 18.03.0<o:p>=
</o:p></p>
<p class=3D"MsoPlainText">&nbsp; e3d960f4fcd9 runc: uprev to 1.0.0-rc5<o:p>=
</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">If anyone sees regressions, build or architecture=
 issues .. report them to me (and the list) and we'll get them fixed up.<o:=
p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Cheers,<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Bruce<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">--<o:p></o:p></p>
<p class=3D"MsoPlainText">&quot;Thou shalt not follow the NULL pointer, for=
 chaos and madness await thee at its end&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">--<o:p></o:p></p>
<p class=3D"MsoPlainText">_______________________________________________<o=
:p></o:p></p>
<p class=3D"MsoPlainText">meta-virtualization mailing list<o:p></o:p></p>
<p class=3D"MsoPlainText"><a href=3D"mailto:meta-virtualization@yoctoprojec=
t.org"><span style=3D"color:windowtext;text-decoration:none">meta-virtualiz=
ation@yoctoproject.org</span></a><o:p></o:p></p>
<p class=3D"MsoPlainText"><a href=3D"https://lists.yoctoproject.org/listinf=
o/meta-virtualization"><span style=3D"color:windowtext;text-decoration:none=
">https://lists.yoctoproject.org/listinfo/meta-virtualization</span></a><o:=
p></o:p></p>
</div>
</body>
</html>

--_000_7209206599d5475fae12e84333947025xchrcd011ciscocom_--

--_006_7209206599d5475fae12e84333947025xchrcd011ciscocom_
Content-Type: application/octet-stream; name="docker.log"
Content-Description: docker.log
Content-Disposition: attachment; filename="docker.log"; size=2151;
	creation-date="Wed, 04 Apr 2018 04:57:41 GMT";
	modification-date="Wed, 04 Apr 2018 04:57:41 GMT"
Content-Transfer-Encoding: base64

KiBkb2NrZXIuc2VydmljZSAtIERvY2tlciBBcHBsaWNhdGlvbiBDb250YWluZXIgRW5naW5lCiAg
IExvYWRlZDogbG9hZGVkICgvbGliL3N5c3RlbWQvc3lzdGVtL2RvY2tlci5zZXJ2aWNlOyBlbmFi
bGVkOyB2ZW5kb3IgcHJlc2V0OiBlbmFibGVkKQogICBBY3RpdmU6IGZhaWxlZCAoUmVzdWx0OiBl
eGl0LWNvZGUpIHNpbmNlIFR1ZSAyMDE4LTA0LTAzIDEzOjE3OjUxIFVUQzsgMTdtaW4gYWdvCiAg
ICAgRG9jczogaHR0cHM6Ly9kb2NzLmRvY2tlci5jb20KICBQcm9jZXNzOiAzMTcgRXhlY1N0YXJ0
PS91c3IvYmluL2RvY2tlcmQgLUggZmQ6Ly8gKGNvZGU9ZXhpdGVkLCBzdGF0dXM9MS9GQUlMVVJF
KQogTWFpbiBQSUQ6IDMxNyAoY29kZT1leGl0ZWQsIHN0YXR1cz0xL0ZBSUxVUkUpCgpBcHIgMDMg
MTM6MTc6NTEgaW50ZWwteDg2LTY0IGRvY2tlcmRbMzE3XTogdGltZT0iMjAxOC0wNC0wM1QxMzox
Nzo1MS4wMzUxNzg3NTVaIiBsZXZlbD13YXJuaW5nIG1zZz0iUnVubmluZyBtb2Rwcm9iZSB4dF9j
b25udHJhY2sgZmFpbGVkIHdpdGggbWVzc2FnZTogYG1vZHByb2JlOiBXQVJOSU5HOiBNb2R1bGUg
eHRfY29ubnRyYWNrIG5vdCBmb3VuZCBpbiBkaXJlY3RvcnkgL2xpYi9tb2R1bGVzLzQuOC4yNC1X
UjkuMC4wLjEwX3N0YW5kYXJkYCwgZXJyb3I6IGV4aXQgc3RhdHVzIDEiCkFwciAwMyAxMzoxNzo1
MSBpbnRlbC14ODYtNjQgZG9ja2VyZFszMTddOiB0aW1lPSIyMDE4LTA0LTAzVDEzOjE3OjUxLjA0
MDcyNzM3MloiIGxldmVsPWluZm8gbXNnPSJGaXJld2FsbGQgcnVubmluZzogZmFsc2UiCkFwciAw
MyAxMzoxNzo1MSBpbnRlbC14ODYtNjQgZG9ja2VyZFszMTddOiB0aW1lPSIyMDE4LTA0LTAzVDEz
OjE3OjUxLjE3MDU3NTM0NFoiIGxldmVsPXdhcm5pbmcgbXNnPSJDb3VsZCBub3QgbG9hZCBuZWNl
c3NhcnkgbW9kdWxlcyBmb3IgSVBTRUMgcnVsZXM6IFJ1bm5pbmcgbW9kcHJvYmUgeGZybV91c2Vy
IGZhaWxlZCB3aXRoIG1lc3NhZ2U6IGBtb2Rwcm9iZTogV0FSTklORzogTW9kdWxlIHhmcm1fdXNl
ciBub3QgZm91bmQgaW4gZGlyZWN0b3J5IC9saWIvbW9kdWxlcy80LjguMjQtV1I5LjAuMC4xMF9z
dGFuZGFyZGAsIGVycm9yOiBleGl0IHN0YXR1cyAxIgpBcHIgMDMgMTM6MTc6NTEgaW50ZWwteDg2
LTY0IGRvY2tlcmRbMzE3XTogdGltZT0iMjAxOC0wNC0wM1QxMzoxNzo1MS4xNzIzOTc5MTNaIiBs
ZXZlbD1pbmZvIG1zZz0iRGVmYXVsdCBicmlkZ2UgKGRvY2tlcjApIGlzIGFzc2lnbmVkIHdpdGgg
YW4gSVAgYWRkcmVzcyAxNzIuMTcuMC4wLzE2LiBEYWVtb24gb3B0aW9uIC0tYmlwIGNhbiBiZSB1
c2VkIHRvIHNldCBhIHByZWZlcnJlZCBJUCBhZGRyZXNzIgpBcHIgMDMgMTM6MTc6NTEgaW50ZWwt
eDg2LTY0IGRvY2tlcmRbMzE3XTogRXJyb3Igc3RhcnRpbmcgZGFlbW9uOiBFcnJvciBpbml0aWFs
aXppbmcgbmV0d29yayBjb250cm9sbGVyOiBFcnJvciBjcmVhdGluZyBkZWZhdWx0ICJicmlkZ2Ui
IG5ldHdvcms6IEZhaWxlZCB0byBTZXR1cCBJUCB0YWJsZXM6IFVuYWJsZSB0byBlbmFibGUgQUND
RVBUIElOQ09NSU5HIHJ1bGU6ICAoaXB0YWJsZXMgZmFpbGVkOiBpcHRhYmxlcyAtLXdhaXQgLUkg
Rk9SV0FSRCAtbyBkb2NrZXIwIC1tIGNvbm50cmFjayAtLWN0c3RhdGUgUkVMQVRFRCxFU1RBQkxJ
U0hFRCAtaiBBQ0NFUFQ6IGlwdGFibGVzOiBObyBjaGFpbi90YXJnZXQvbWF0Y2ggYnkgdGhhdCBu
YW1lLgpBcHIgMDMgMTM6MTc6NTEgaW50ZWwteDg2LTY0IGRvY2tlcmRbMzE3XTogIChleGl0IHN0
YXR1cyAxKSkKQXByIDAzIDEzOjE3OjUxIGludGVsLXg4Ni02NCBzeXN0ZW1kWzFdOiBkb2NrZXIu
c2VydmljZTogTWFpbiBwcm9jZXNzIGV4aXRlZCwgY29kZT1leGl0ZWQsIHN0YXR1cz0xL0ZBSUxV
UkUKQXByIDAzIDEzOjE3OjUxIGludGVsLXg4Ni02NCBzeXN0ZW1kWzFdOiBGYWlsZWQgdG8gc3Rh
cnQgRG9ja2VyIEFwcGxpY2F0aW9uIENvbnRhaW5lciBFbmdpbmUuCkFwciAwMyAxMzoxNzo1MSBp
bnRlbC14ODYtNjQgc3lzdGVtZFsxXTogZG9ja2VyLnNlcnZpY2U6IFVuaXQgZW50ZXJlZCBmYWls
ZWQgc3RhdGUuCkFwciAwMyAxMzoxNzo1MSBpbnRlbC14ODYtNjQgc3lzdGVtZFsxXTogZG9ja2Vy
LnNlcnZpY2U6IEZhaWxlZCB3aXRoIHJlc3VsdCAnZXhpdC1jb2RlJy4K

--_006_7209206599d5475fae12e84333947025xchrcd011ciscocom_
Content-Type: image/png; name="Docker 1.png"
Content-Description: Docker 1.png
Content-Disposition: attachment; filename="Docker 1.png"; size=13224;
	creation-date="Wed, 04 Apr 2018 04:57:41 GMT";
	modification-date="Wed, 04 Apr 2018 04:57:41 GMT"
Content-Transfer-Encoding: base64

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

--_006_7209206599d5475fae12e84333947025xchrcd011ciscocom_
Content-Type: image/png; name="Docker 2.png"
Content-Description: Docker 2.png
Content-Disposition: attachment; filename="Docker 2.png"; size=7220;
	creation-date="Wed, 04 Apr 2018 04:57:41 GMT";
	modification-date="Wed, 04 Apr 2018 04:57:41 GMT"
Content-Transfer-Encoding: base64

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

--_006_7209206599d5475fae12e84333947025xchrcd011ciscocom_--
