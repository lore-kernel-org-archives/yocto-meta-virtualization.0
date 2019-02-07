Return-Path: <TNordqvist@luxoft.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D2C18E00C46; Thu,  7 Feb 2019 02:42:07 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from mx01.luxoft.com (mx01.luxoft.com [109.166.244.56])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D47EDE00C43
	for <meta-virtualization@yoctoproject.org>;
	Thu,  7 Feb 2019 02:42:04 -0800 (PST)
X-AuditID: ac1e1338-cd3ff70000009dab-b2-5c5c0b7a290b
Received: from ORO-EDGE-01.luxoft.com (oro-edge-01.luxoft.com [172.30.19.21])
	(using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by mx01.luxoft.com (Symantec Messaging Gateway) with SMTP id
	F4.20.40363.A7B0C5C5; Thu,  7 Feb 2019 12:42:02 +0200 (EET)
Received: from oro-exch-01.luxoft.com (172.25.192.30) by
	oro-edge-01.luxoft.com (172.30.19.21) with Microsoft SMTP Server (TLS)
	id 14.3.408.0; Thu, 7 Feb 2019 12:42:00 +0200
Received: from oro-exch-05.luxoft.com (172.25.192.35) by
	oro-exch-01.luxoft.com (172.25.192.30) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P521) id
	15.1.1466.3; Thu, 7 Feb 2019 12:42:02 +0200
Received: from oro-exch-05.luxoft.com ([fe80::601d:1cd3:3a61:5b71]) by
	oro-exch-05.luxoft.com ([fe80::601d:1cd3:3a61:5b71%14]) with mapi id
	15.01.1466.003; Thu, 7 Feb 2019 12:42:02 +0200
From: "Nordqvist, Therese" <TNordqvist@luxoft.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: [meta-virtualization] LXC 3.1 in thud?
Thread-Index: AQHUvWaW8cmZPE1eSkSv6/cPvw54daXTIfyAgAD/Zpk=
Date: Thu, 7 Feb 2019 10:42:01 +0000
Message-ID: <09262a4a1f4f4e0dae6f47b099f4946c@luxoft.com>
References: <2a468100b7c94734bcb79d6ddb55c141@luxoft.com>,
	<CADkTA4MDqmmeko0DmpZ1D3qeJUWMue2BJGY4Txyf3zCofmXV8g@mail.gmail.com>
In-Reply-To: <CADkTA4MDqmmeko0DmpZ1D3qeJUWMue2BJGY4Txyf3zCofmXV8g@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.30.19.68]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJLMWRmVeSWpSXmKPExsWyRk5YVLeKOybG4OITFYvbB44wOzB6tJ/o
	YwtgjOKySUnNySxLLdK3S+DK6Hy4grlge3XFlXc9rA2MSzK6GDk5JARMJJ50fmXuYuTiEBLY
	xCSx7d0uKGcjo8SN42tZIZzPjBK7/0xkhHD2MUrMudPFCtLPJmAksWL5AnYQW0QgWOL9sjss
	ILawgLHEwkXLGSHiJhJf722FqrGSuLnsPFgNi4CKxJPbe9hAbF4BS4mpZ26CxYUE6iSOnLkI
	Np9TIFBi7eetzCA2o4CYxPdTa5hAbGYBcYlbT+YzQfwgILFkz3lmCFtU4uXjf6wQtoJE59NG
	doj6RInm7lXsELsEJU7OfAK1S0mibcoj5gmMYrOQjJ2FpGUWkpYFjMyrGEXzi/J1i3PTdQ2M
	9XJKK/LTSvSS83M3MUIiw2IH4+mDKYcYmTg4pRoYN+5P8GCoOXp6oYNSzanqeQrrD/t35t49
	8nl+YJjB1JMf4zS4kp9s/+CoNK/e0mGLQrDPrdr8+2wxntdq2v98b1t41jl6kkLLdr7pj5P7
	/xpkTo80Z+RPr2kuPvvv1rW20688eRT4JYW8HnHemnN/RkHUl3Nyz6YU5O67dfeX7GLm4tuP
	ZRPzlFiKMxINtZiLihMBCnlgrjwCAAA=
Subject: Re: LXC 3.1 in thud?
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
X-List-Received-Date: Thu, 07 Feb 2019 10:42:08 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_09262a4a1f4f4e0dae6f47b099f4946cluxoftcom_"

--_000_09262a4a1f4f4e0dae6f47b099f4946cluxoftcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,


I have looked through the release notes for both the 3.0.3 and the 3.1.0 re=
leases.

We have tested both the thud and master branches for meta-virtualization an=
d it turns out we do not need the LXC 3.1.0 features or the 3.0.3 bugfixes =
for our project (at this time).

It is more of a case of "nice to have the same version of LXC on both thud =
and master" for us.


I am including a list of changes for the LXC releases in case someone else =
sees something they need.


Highlights for 3.0.3 (bugfixes):

 * Improved our default build flags to make use of compiler hardening
 * Added support for netlink strict property checking on newer kernels
 * Added support for new netlink interface/address netns API
 * Added handling of the kernel keyring on startup


Summary of features added in 3.1.0:

 * enable various remount options with AppArmor

 * support NETLINK_DUMP_STRICT_CHK

 * allocate new keyring on startup

 * full cgroup2 support

 * implement efficient way to retrieve network devices and addresses from c=
ontainers

 * introduce lxc_has_api_extension() into the API

 * add lxc.cgroup.relative configuration key

 * allocate new network namespace identifier on startup

 * add lxc.rootfs.managed configuration key

 * removal of all VLAs

 * AppArmor profile generation

 * add mount injection api

 * add lxc.monitor.signal.pdeath configuration key

 * build a shared and static liblxc library

 * adapt to mknod() changes in Linux Kernel 4.18

 * use execveat() to execute application containers

 * enable per-thread container name prefix when logging

 * refactor cgroup handling

 * raise ambient capabilities when running hooks

 * allow to mount /sys rw in unprivileged containers

 * add strlcpy() and strlcat() and deprecate strncpy() and strncat()

 * compiler based hardening

 * thread-safety improvements

 * support application containers without uid 0 in the container

 * support devpts mounts on kernels without gid mount option



Best regards,
Therese Nordqvist
Software Engineer

Luxoft Sweden AB
=D6stra Hamngatan 16
411 09 Gothenburg
Sweden

M: +46 732 332464
E: TNordqvist@luxoft.com

luxoft.com

Registered Office Gothenburg, Sweden
Registration No. 556780-4199


________________________________
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Sent: Wednesday, February 6, 2019 10:01 PM
To: Nordqvist, Therese
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] LXC 3.1 in thud?

On Tue, Feb 5, 2019 at 10:22 AM Nordqvist, Therese
<TNordqvist@luxoft.com> wrote:
>
> Hello,
>
>
> I'm working in a project which uses meta-virtualization (http://pelux.io)=
, do you know if there are any plans to include the LXC bump to 3.1.0 in th=
e thud branch?

There currently aren't any plans to do a version bump in Thud. We tend
to leave the versions as-is in the maintained branches.
It looks like thud is missing the 3.0.3 and 3.1.x bumps that we have
in master, so there are at least two patches missing.

That being said, the missing version bumps are relatively minor and
are bug fixes/small changes to the project.

What feature are you looking for in particular ? Can you summarize the
changes between the versions and send
it to the list ? That way everyone can see the requested change to the
released branch and object if they think
there will be impacts.

Cheers,

Bruce

>
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=
=3D2387a8876e4aaa52143a623ae5000cf064e55a64
>
>
> If you are interesting in our github repo: https://github.com/Pelagicore/=
pelux-manifests
>
>
> Best regards,
> Therese Nordqvist
> Software Engineer
>
> Luxoft Sweden AB
> =D6stra Hamngatan 16
> 411 09 Gothenburg
> Sweden
>
> M: +46 732 332464
> E: TNordqvist@luxoft.com
>
> luxoft.com
>
> Registered Office Gothenburg, Sweden
> Registration No. 556780-4199
>
> ________________________________
>
> This e-mail and any attachment(s) are intended only for the recipient(s) =
named above and others who have been specifically authorized to receive the=
m. They may contain confidential information. If you are not the intended r=
ecipient, please do not read this email or its attachment(s). Furthermore, =
you are hereby notified that any dissemination, distribution or copying of =
this e-mail and any attachment(s) is strictly prohibited. If you have recei=
ved this e-mail in error, please immediately notify the sender by replying =
to this e-mail and then delete this e-mail and any attachment(s) or copies =
thereof from your system. Thank you.
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

________________________________

This e-mail and any attachment(s) are intended only for the recipient(s) na=
med above and others who have been specifically authorized to receive them.=
 They may contain confidential information. If you are not the intended rec=
ipient, please do not read this email or its attachment(s). Furthermore, yo=
u are hereby notified that any dissemination, distribution or copying of th=
is e-mail and any attachment(s) is strictly prohibited. If you have receive=
d this e-mail in error, please immediately notify the sender by replying to=
 this e-mail and then delete this e-mail and any attachment(s) or copies th=
ereof from your system. Thank you.

--_000_09262a4a1f4f4e0dae6f47b099f4946cluxoftcom_
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
 0); font-family: Calibri, Helvetica, sans-serif, &quot;EmojiFont&quot;, &q=
uot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &q=
uot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;" dir=3D=
"ltr">
<p>Hello,</p>
<p><br>
</p>
<p>I have looked through the release notes for both the 3.0.3 and the 3.1.0=
 releases.</p>
<p>We have tested both the thud and master branches for meta-virtualization=
 and it turns out we do not need the LXC 3.1.0 features or the 3.0.3 bugfix=
es for our project (at this time).
<br>
</p>
<p>It is more of a case of &quot;nice to have the same version of LXC on bo=
th thud and master&quot; for us.</p>
<p><br>
</p>
<p>I am including a list of changes for the LXC releases in case someone el=
se sees something they need.<br>
</p>
<p><br>
</p>
<p>Highlights for 3.0.3 (bugfixes):</p>
<p></p>
<div>&nbsp;* Improved our default build flags to make use of compiler harde=
ning<br>
&nbsp;* Added support for netlink strict property checking on newer kernels=
<br>
&nbsp;* Added support for new netlink interface/address netns API<br>
&nbsp;* Added handling of the kernel keyring on startup<br>
</div>
<br>
<p></p>
<p>Summary of features added in 3.1.0:</p>
<p></p>
<div>
<p>&nbsp;* enable various remount options with AppArmor</p>
<p>&nbsp;* support&nbsp;<code class=3D"western">NETLINK_DUMP_STRICT_CHK</co=
de></p>
<p>&nbsp;* allocate new keyring on startup</p>
<p>&nbsp;* full&nbsp;<code class=3D"western">cgroup2</code>&nbsp;support</p=
>
<p>&nbsp;* implement efficient way to retrieve network devices and addresse=
s from containers</p>
<p>&nbsp;* introduce&nbsp;<code class=3D"western">lxc_has_api_extension()</=
code>&nbsp;into the API</p>
<p>&nbsp;* add&nbsp;<code class=3D"western">lxc.cgroup.relative</code>&nbsp=
;configuration key</p>
<p>&nbsp;* allocate new network namespace identifier on startup</p>
<p>&nbsp;* add&nbsp;<code class=3D"western">lxc.rootfs.managed</code>&nbsp;=
configuration key</p>
<p>&nbsp;* removal of all&nbsp;<code class=3D"western">VLA</code>s</p>
<p>&nbsp;* AppArmor profile generation</p>
<p>&nbsp;* add mount injection api</p>
<p>&nbsp;* add&nbsp;<code class=3D"western">lxc.monitor.signal.pdeath</code=
>&nbsp;configuration key</p>
<p>&nbsp;* build a shared and static&nbsp;<code class=3D"western">liblxc</c=
ode>&nbsp;library</p>
<p>&nbsp;* adapt to&nbsp;<code class=3D"western">mknod()</code>&nbsp;change=
s in Linux Kernel 4.18</p>
<p>&nbsp;* use&nbsp;<code class=3D"western">execveat()</code>&nbsp;to execu=
te application containers</p>
<p>&nbsp;* enable per-thread container name prefix when logging</p>
<p>&nbsp;* refactor cgroup handling</p>
<p>&nbsp;* raise ambient capabilities when running hooks</p>
<p>&nbsp;* allow to mount&nbsp;<code class=3D"western">/sys</code>&nbsp;<co=
de class=3D"western">rw</code>&nbsp;in unprivileged containers</p>
<p>&nbsp;* add&nbsp;<code class=3D"western">strlcpy()</code>&nbsp;and&nbsp;=
<code class=3D"western">strlcat()</code>&nbsp;and deprecate&nbsp;<code clas=
s=3D"western">strncpy()</code>&nbsp;and&nbsp;<code class=3D"western">strnca=
t()</code></p>
<p>&nbsp;* compiler based hardening</p>
<p>&nbsp;* thread-safety improvements</p>
<p>&nbsp;* support application containers without&nbsp;<code class=3D"weste=
rn">uid 0</code>&nbsp;in the container</p>
<p>&nbsp;* support&nbsp;<code class=3D"western">devpts</code>&nbsp;mounts o=
n kernels without&nbsp;<code class=3D"western">gid</code>&nbsp;mount option=
</p>
<p><br>
<br>
</p>
</div>
<p></p>
<div id=3D"Signature">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size: 12pt; colo=
r: rgb(0, 0, 0); font-family: Calibri, Helvetica, sans-serif, &quot;EmojiFo=
nt&quot;, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoCo=
lorEmoji, &quot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymb=
ols;">
<div style=3D"font-family:Tahoma; font-size:13px">
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:10pt"=
>
<div class=3D"PlainText">Best regards,<br>
Therese Nordqvist<br>
Software Engineer<br>
<br>
Luxoft Sweden AB<br>
=D6stra Hamngatan 16<br>
411 09 Gothenburg<br>
Sweden<br>
<br>
M: &#43;46 732 332464 <br>
E: TNordqvist@luxoft.com<br>
</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText"><span style=3D"font-size:10pt">luxoft.com</span><b=
r>
</div>
<div class=3D"PlainText">&nbsp;<br>
Registered Office Gothenburg, Sweden<br>
Registration No. 556780-4199</div>
</span></font></div>
</div>
</div>
</div>
<br>
<br>
<div style=3D"color: rgb(0, 0, 0);">
<div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Bruce Ashfield &lt;=
bruce.ashfield@gmail.com&gt;<br>
<b>Sent:</b> Wednesday, February 6, 2019 10:01 PM<br>
<b>To:</b> Nordqvist, Therese<br>
<b>Cc:</b> meta-virtualization@yoctoproject.org<br>
<b>Subject:</b> Re: [meta-virtualization] LXC 3.1 in thud?</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">On Tue, Feb 5, 2019 at 10:22 AM Nordqvist, Therese=
<br>
&lt;TNordqvist@luxoft.com&gt; wrote:<br>
&gt;<br>
&gt; Hello,<br>
&gt;<br>
&gt;<br>
&gt; I'm working in a project which uses meta-virtualization (<a href=3D"ht=
tp://pelux.io" id=3D"LPlnk790445" previewremoved=3D"true">http://pelux.io</=
a>), do you know if there are any plans to include the LXC bump to 3.1.0 in=
 the thud branch?<br>
<br>
There currently aren't any plans to do a version bump in Thud. We tend<br>
to leave the versions as-is in the maintained branches.<br>
It looks like thud is missing the 3.0.3 and 3.1.x bumps that we have<br>
in master, so there are at least two patches missing.<br>
<br>
That being said, the missing version bumps are relatively minor and<br>
are bug fixes/small changes to the project.<br>
<br>
What feature are you looking for in particular ? Can you summarize the<br>
changes between the versions and send<br>
it to the list ? That way everyone can see the requested change to the<br>
released branch and object if they think<br>
there will be impacts.<br>
<br>
Cheers,<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt; <a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualizat=
ion/commit/?id=3D2387a8876e4aaa52143a623ae5000cf064e55a64" id=3D"LPlnk24742=
9" previewremoved=3D"true">
https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=
=3D2387a8876e4aaa52143a623ae5000cf064e55a64</a><br>
&gt;<br>
&gt;<br>
&gt; If you are interesting in our github repo: <a href=3D"https://github.c=
om/Pelagicore/pelux-manifests" id=3D"LPlnk975024" previewremoved=3D"true">
https://github.com/Pelagicore/pelux-manifests</a><br>
&gt;<br>
&gt;<br>
&gt; Best regards,<br>
&gt; Therese Nordqvist<br>
&gt; Software Engineer<br>
&gt;<br>
&gt; Luxoft Sweden AB<br>
&gt; =D6stra Hamngatan 16<br>
&gt; 411 09 Gothenburg<br>
&gt; Sweden<br>
&gt;<br>
&gt; M: &#43;46 732 332464<br>
&gt; E: TNordqvist@luxoft.com<br>
&gt;<br>
&gt; luxoft.com<br>
&gt;<br>
&gt; Registered Office Gothenburg, Sweden<br>
&gt; Registration No. 556780-4199<br>
&gt;<br>
&gt; ________________________________<br>
&gt;<br>
&gt; This e-mail and any attachment(s) are intended only for the recipient(=
s) named above and others who have been specifically authorized to receive =
them. They may contain confidential information. If you are not the intende=
d recipient, please do not read this
 email or its attachment(s). Furthermore, you are hereby notified that any =
dissemination, distribution or copying of this e-mail and any attachment(s)=
 is strictly prohibited. If you have received this e-mail in error, please =
immediately notify the sender by
 replying to this e-mail and then delete this e-mail and any attachment(s) =
or copies thereof from your system. Thank you.<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; meta-virtualization mailing list<br>
&gt; meta-virtualization@yoctoproject.org<br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" id=3D"LPlnk924850" previewremoved=3D"true">
https://lists.yoctoproject.org/listinfo/meta-virtualization</a><br>
<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</div>
</span></font></div>
</div>
<br>
<hr>
<font face=3D"Arial" color=3D"Gray" size=3D"1"><br>
This e-mail and any attachment(s) are intended only for the recipient(s) na=
med above and others who have been specifically authorized to receive them.=
 They may contain confidential information. If you are not the intended rec=
ipient, please do not read this
 email or its attachment(s). Furthermore, you are hereby notified that any =
dissemination, distribution or copying of this e-mail and any attachment(s)=
 is strictly prohibited. If you have received this e-mail in error, please =
immediately notify the sender by
 replying to this e-mail and then delete this e-mail and any attachment(s) =
or copies thereof from your system. Thank you.<br>
</font>
</body>
</html>

--_000_09262a4a1f4f4e0dae6f47b099f4946cluxoftcom_--
