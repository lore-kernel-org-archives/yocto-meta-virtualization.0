Return-Path: <nitishjha16@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C7539E00A51; Thu,  9 Feb 2017 04:25:38 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (nitishjha16[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.223.193 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.223.193 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 244BCE00A1C
	for <meta-virtualization@yoctoproject.org>;
	Thu,  9 Feb 2017 04:25:37 -0800 (PST)
Received: by mail-io0-f193.google.com with SMTP id q20so1867918ioi.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 09 Feb 2017 04:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eGKumzlJ/VjwlSZnV38zGXVu0X5FLVSebtjio2Fqer0=;
	b=DothEj4m2j4jmWKVNzMqqkeIKvSAzkcO5LOhF1BRJ3XwGzIcsdawS/BeNh3UeH3oj0
	3xTnRSNvxpKcufZrR/pk0fDmxLCGnm0MvSRDqtEsZsABjdoOX15zkRToVqzHNPHIM3os
	t00SYI06LIflE3MX7SavH7IJDmf5572Uz1s89BowQQmXKygn9ch+TPjQc4Xy2AbkgVQZ
	iIWp0Guf16zE3TMI4+NT9I38AlbdVmE+31yRgE/6Vp1/Uo2KBXj9uaS+eTy/s0G0eAkH
	uNgjW5PPWkFlPAFgpiiF7CwIOxIlIS3bDBV8MmF07J6ZZeEGsRVRKmAThVLfp+13GDGJ
	gIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eGKumzlJ/VjwlSZnV38zGXVu0X5FLVSebtjio2Fqer0=;
	b=My/UsbvvZXhre9ae1kBHVmFdCQadYKKRruYEbHgscX1Nizo2iZ3zkbX5xVDNJfwVj7
	jtnzrDVOIlWRKNVL/PTuXcfRCGk9PA55/rzvUqF/8BrvXe1Ck8WNaHvfVAYOYrH8H0mj
	RYANlgEcQPTSiJhBzLN3s/2hCEedu4ITvGLDQpVJU2aeR6mhnOQJ4XgKmizR/W2tDgTN
	YYU0C7jga2pdbZ3zMattOW67Vw//mrPMKLSvbVKj2UMCrLh26ut3R65QQlIgThJXUomA
	l46hr+FpG01KG17PDU3JBWBccn9ccyKKUAJ8NqOAWH0ktlq2KFOk+obkTcSgJuSPNMs3
	9pVg==
X-Gm-Message-State: AMke39lLDO5OlT8OzA0HdoL82g227HbHaxQMB4lwRc+AJlcedP7iYI9HPpIB2iy5ATUP5sSzMWZrGYeOtjEKQg==
X-Received: by 10.107.131.39 with SMTP id f39mr2836601iod.40.1486643137362;
	Thu, 09 Feb 2017 04:25:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.142.205 with HTTP; Thu, 9 Feb 2017 04:25:36 -0800 (PST)
In-Reply-To: <CADkTA4PbwgvPDX_jgtP0Ao5jdG1Kce_JfE3NZgtjgE=UZVxWNA@mail.gmail.com>
References: <CABh+foZ2jSj7gMpmG_yzpU1y=Rcry_258Y2ok0e72N3Jj=a5aA@mail.gmail.com>
	<CADkTA4PbwgvPDX_jgtP0Ao5jdG1Kce_JfE3NZgtjgE=UZVxWNA@mail.gmail.com>
From: nitish jha <nitishjha16@gmail.com>
Date: Thu, 9 Feb 2017 13:25:36 +0100
Message-ID: <CABh+foa75nTM+uDvM8peYpR+hXUP3bmRtP50vpwTqfhpWZRpsg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Building Yocto Image with meta-virtualization layer
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
X-List-Received-Date: Thu, 09 Feb 2017 12:25:38 -0000
Content-Type: multipart/alternative; boundary=001a113f318c1c4aa305481814c2

--001a113f318c1c4aa305481814c2
Content-Type: text/plain; charset=UTF-8

Hello Bruce,

Thanks for answering my previous query.

I have one more Issue :

I have build kvm-image-minimal but it only has CLI interface virsh to mange
VMs.

Can you tell me how to integrate virt-manger in my package.

From where should I get recipes for virt-manager and what are the
dependencies.

I am using Pocky - Morty.

Any suggestions are welcome.

Thanks in advance

Nitish

On Wed, Feb 1, 2017 at 10:12 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Wed, Feb 1, 2017 at 3:04 PM, nitish jha <nitishjha16@gmail.com> wrote:
>
>> Hello All,
>>
>> I want to build yocto image with meta-virtualization layer
>>
>> my  bblayer.conf looks like below
>>
>> BBPATH = "${TOPDIR}"
>> BBFILES ?= ""
>> BBLAYERS ?= " \
>> /home/testuser/Downloads/git/Yocto/poky/meta \
>>
>> /home/testuser/Downloads/git/Yocto/poky/meta-poky \
>>
>> /home/testuser/Downloads/git/Yocto/poky/meta-yocto-bsp \
>>
>> /home/testuser/Downloads/git/Yocto/meta-openembedded/meta-oe \
>>
>> /home/testuser/Downloads/git/Yocto/meta-openembedded/meta-networking \
>>
>> /home/testuser/Downloads/git/Yocto/meta-openembedded/meta-perl \
>>
>> /home/testuser/Downloads/git/Yocto/meta-openembedded/meta-python \
>>
>> /home/testuser/Downloads/git/Yocto/openembedded-core/meta \
>>
>> /home/testuser/Downloads/git/Yocto/meta-virtualization \
>>
>>
>>
>>
>> I am getting some error "Failing to expand vapigen_sysroot_preprocess in
>> vala_0.34.0.bb file.
>>
>> This recipe file is inside openembedded-core/meta/recipe-devtools/vala
>>
>> is is reallz necessary to include openembedded-core/meta ??
>>
>
> poky/meta is oe-core/meta, so you don't need both.
>
> Bruce
>
>
>>
>> if yes then how should I solve this Issue.
>>
>> Thanks in advance.
>>
>>
>> *Nitish Jha*
>>
>>
>>
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>

--001a113f318c1c4aa305481814c2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Bruce,<div><br></div><div>Thanks for answering my pr=
evious query.</div><div><br></div><div>I have one more Issue :</div><div><b=
r></div><div>I have build kvm-image-minimal but it only has CLI interface v=
irsh to mange VMs.</div><div><br></div><div>Can you tell me how to integrat=
e virt-manger in my package.</div><div><br></div><div>From where should I g=
et recipes for virt-manager and what are the dependencies.</div><div><br></=
div><div>I am using Pocky - Morty.</div><div><br></div><div>Any suggestions=
 are welcome.</div><div><br></div><div>Thanks in advance</div><div><br></di=
v><div>Nitish</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote=
">On Wed, Feb 1, 2017 at 10:12 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<a =
href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@g=
mail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><spa=
n class=3D"">On Wed, Feb 1, 2017 at 3:04 PM, nitish jha <span dir=3D"ltr">&=
lt;<a href=3D"mailto:nitishjha16@gmail.com" target=3D"_blank">nitishjha16@g=
mail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr">Hello All,<div><br></div><div>I want to build yocto image with met=
a-virtualization layer</div><div><br></div><div>my =C2=A0bblayer.conf looks=
 like below</div><div><br></div><div>BBPATH =3D &quot;${TOPDIR}&quot;<br>BB=
FILES ?=3D &quot;&quot;<br>BBLAYERS ?=3D &quot; \<br><span style=3D"font-fa=
mily:consolas,menlo,monaco,&quot;lucida console&quot;,&quot;liberation mono=
&quot;,&quot;dejavu sans mono&quot;,&quot;bitstream vera sans mono&quot;,&q=
uot;courier new&quot;,monospace,sans-serif;white-space:inherit;background-c=
olor:rgb(239,240,241);color:rgb(36,39,41);font-size:13px">/home/testuser/Do=
wnloads/git/Y<wbr>octo/poky</span>/meta \</div><div><br><span style=3D"colo=
r:rgb(36,39,41);font-family:consolas,menlo,monaco,&quot;lucida console&quot=
;,&quot;liberation mono&quot;,&quot;dejavu sans mono&quot;,&quot;bitstream =
vera sans mono&quot;,&quot;courier new&quot;,monospace,sans-serif;font-size=
:13px;background-color:rgb(239,240,241)">/home/testuser/Downloads/git/Y<wbr=
>octo/poky</span>/meta-poky \</div><div><br></div><div><span style=3D"font-=
family:consolas,menlo,monaco,&quot;lucida console&quot;,&quot;liberation mo=
no&quot;,&quot;dejavu sans mono&quot;,&quot;bitstream vera sans mono&quot;,=
&quot;courier new&quot;,monospace,sans-serif;white-space:inherit;background=
-color:rgb(239,240,241);color:rgb(36,39,41);font-size:13px">/home/</span><s=
pan style=3D"color:rgb(36,39,41);font-family:consolas,menlo,monaco,&quot;lu=
cida console&quot;,&quot;liberation mono&quot;,&quot;dejavu sans mono&quot;=
,&quot;bitstream vera sans mono&quot;,&quot;courier new&quot;,monospace,san=
s-serif;font-size:13px;background-color:rgb(239,240,241)">testuser</span><s=
pan style=3D"font-family:consolas,menlo,monaco,&quot;lucida console&quot;,&=
quot;liberation mono&quot;,&quot;dejavu sans mono&quot;,&quot;bitstream ver=
a sans mono&quot;,&quot;courier new&quot;,monospace,sans-serif;white-space:=
inherit;background-color:rgb(239,240,241);color:rgb(36,39,41);font-size:13p=
x">/Downloads/git/Y<wbr>octo/poky/meta-yocto-bsp \</span></div><div><br></d=
iv><div><span style=3D"color:rgb(36,39,41);font-family:consolas,menlo,monac=
o,&quot;lucida console&quot;,&quot;liberation mono&quot;,&quot;dejavu sans =
mono&quot;,&quot;bitstream vera sans mono&quot;,&quot;courier new&quot;,mon=
ospace,sans-serif;font-size:13px;background-color:rgb(239,240,241)">/home/t=
estuser/Downloads/git/Y<wbr>octo</span>/meta-openembedded/meta-oe \</div><d=
iv><br><span style=3D"color:rgb(36,39,41);font-family:consolas,menlo,monaco=
,&quot;lucida console&quot;,&quot;liberation mono&quot;,&quot;dejavu sans m=
ono&quot;,&quot;bitstream vera sans mono&quot;,&quot;courier new&quot;,mono=
space,sans-serif;font-size:13px;background-color:rgb(239,240,241)">/home/te=
stuser/Downloads/git/Y<wbr>octo</span>/meta-openembedded/meta-ne<wbr>tworki=
ng \</div><div><br><span style=3D"color:rgb(36,39,41);font-family:consolas,=
menlo,monaco,&quot;lucida console&quot;,&quot;liberation mono&quot;,&quot;d=
ejavu sans mono&quot;,&quot;bitstream vera sans mono&quot;,&quot;courier ne=
w&quot;,monospace,sans-serif;font-size:13px;background-color:rgb(239,240,24=
1)">/home/testuser/Downloads/git/Y<wbr>octo</span>/meta-openembedded/meta-p=
e<wbr>rl \</div><div><br><span style=3D"color:rgb(36,39,41);font-family:con=
solas,menlo,monaco,&quot;lucida console&quot;,&quot;liberation mono&quot;,&=
quot;dejavu sans mono&quot;,&quot;bitstream vera sans mono&quot;,&quot;cour=
ier new&quot;,monospace,sans-serif;font-size:13px;background-color:rgb(239,=
240,241)">/home/testuser/Downloads/git/Y<wbr>octo</span>/meta-openembedded/=
meta-py<wbr>thon \</div><div><br></div><div><span style=3D"font-size:13px;c=
olor:rgb(36,39,41);font-family:consolas,menlo,monaco,&quot;lucida console&q=
uot;,&quot;liberation mono&quot;,&quot;dejavu sans mono&quot;,&quot;bitstre=
am vera sans mono&quot;,&quot;courier new&quot;,monospace,sans-serif;backgr=
ound-color:rgb(239,240,241)">/home/testuser/Downloads/git/Y<wbr>octo</span>=
/openembedded-core/meta \</div><div><br><span style=3D"color:rgb(36,39,41);=
font-family:consolas,menlo,monaco,&quot;lucida console&quot;,&quot;liberati=
on mono&quot;,&quot;dejavu sans mono&quot;,&quot;bitstream vera sans mono&q=
uot;,&quot;courier new&quot;,monospace,sans-serif;font-size:13px;background=
-color:rgb(239,240,241)">/home/testuser/Downloads/git/Y<wbr>octo</span>/met=
a-virtualization \</div><div><br></div><div><br></div><div><br></div><div><=
br></div><div>I am getting some error &quot;Failing to expand=C2=A0vapigen_=
sysroot_preproc<wbr>ess in <a href=3D"http://vala_0.34.0.bb" target=3D"_bla=
nk">vala_0.34.0.bb</a> file.<br><br>This recipe file is inside openembedded=
-core/meta/recipe-<wbr>devtools/vala<br><br>is is reallz necessary to inclu=
de openembedded-core/meta ??<br></div></div></blockquote><div><br></div></s=
pan><div>poky/meta is oe-core/meta, so you don&#39;t need both.</div><div><=
br></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><s=
pan class=3D""><div dir=3D"ltr"><div><br>if yes then how should I solve thi=
s Issue.</div><div><font color=3D"#333333" face=3D"consolas, liberation mon=
o, menlo, courier, monospace"><span style=3D"font-size:12px;white-space:pre=
-wrap"><br></span></font></div><div><font color=3D"#333333" face=3D"consola=
s, liberation mono, menlo, courier, monospace"><span style=3D"font-size:12p=
x;white-space:pre-wrap">Thanks in advance.</span></font></div><span class=
=3D"m_-6789518442908638987HOEnZb"><font color=3D"#888888"><div><span style=
=3D"color:rgb(51,51,51);font-family:consolas,&quot;liberation mono&quot;,me=
nlo,courier,monospace;font-size:12px;white-space:pre-wrap"><br></span></div=
><div><span style=3D"color:rgb(51,51,51);font-family:consolas,&quot;liberat=
ion mono&quot;,menlo,courier,monospace;font-size:12px;white-space:pre-wrap"=
><br></span></div><div><div class=3D"m_-6789518442908638987m_-7792077910193=
27120gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><d=
iv dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-family:arial;font-size:s=
mall"><div><b>Nitish Jha</b></div><div><b><br></b></div><div><br><br></div>=
</div></div></div></div></div></div></div>
</div></font></span></div>
<br></span><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproje<wbr>ct.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org<wbr>/listi=
nfo/meta-virtualization</a><br>
<br></font></span></blockquote></div><span class=3D"HOEnZb"><font color=3D"=
#888888"><br><br clear=3D"all"><div><br></div>-- <br><div class=3D"m_-67895=
18442908638987gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</font></span></div></div>
</blockquote></div><div><br></div>
</div></div>

--001a113f318c1c4aa305481814c2--
