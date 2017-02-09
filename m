Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2CC83E00A51; Thu,  9 Feb 2017 06:26:53 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.193 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.193 listed in list.dnswl.org]
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F0535E00A3B
	for <meta-virtualization@yoctoproject.org>;
	Thu,  9 Feb 2017 06:26:48 -0800 (PST)
Received: by mail-qk0-f193.google.com with SMTP id e1so790428qkh.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 09 Feb 2017 06:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7kvRPrifwExwNs10J6IcCnruaJwTfjAKDw6AIy758NM=;
	b=HTMXdmeCPLzyd37pSa+35nzBXZ5bd2cqomsuv0uXIhREKWAFDWA+rLWZFC12j0KJrR
	NvqDWapR9uofK52guwVgPoclmC5dpFYf7NvLN2f9a4FAvqv4Gu9vDe8oM7vRanC5tb+4
	/YVsq3FLbP6EzNEnSBT+d6DDKKiFPl72oKIUUGqu1pzyPFhBfSWjPTPU8Ig6DzHqFAGX
	cKnIdxyVYjEA8484PbHvdGBSUt8ybEEkdgjpPF6VL6KLE2Temo8FDFrXs2uhtR5c+YfQ
	FnD9ilVPrir/u5GRdHhlFVDDdHdtAOqQBtqAjVwHsx7qt3rgySp5fJqsvLZH2ENk9T6r
	jaGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7kvRPrifwExwNs10J6IcCnruaJwTfjAKDw6AIy758NM=;
	b=X1ua/DkDz+XsY3rYeLGXjKooYPjvF+cFX0hkZHKN0o3Yt13do1tzhNeXsuR8QuW6dG
	gICgGIfRqR/deKe2ST+wtFP1dyIkr8/M9HADhQWvL1FK4fr/7Le6H0Kzn9V6bB0NyJU0
	ZhyL0GVWo4AkzM8+geTDA/j+qO5tzkJ5LQeB/bqVthfFFnlsZzrlihfB7WQNCMclP5kR
	RqGrNUHNm1035DhgEnHsgwqXHXFmRNBlB+MKvTfK0Q/XqNRADpc9ZfKA1r/RrWqwpB1E
	OFAsvSgi83vE3JpoK3cc3ypCxS5kd+8yFeRHdBLBp2emUvTF9GRTrbEhdCPykliKZHYn
	IUVA==
X-Gm-Message-State: AMke39m9gFN1KzW87FmOw2OGXwKGoTfQ0as3FVSi+Stzd72pO3kQ6S0Ev3KtcBfbN5Pmf2iPv+nM07yTDT+EOA==
X-Received: by 10.55.121.194 with SMTP id u185mr3034291qkc.56.1486650407953;
	Thu, 09 Feb 2017 06:26:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Thu, 9 Feb 2017 06:26:47 -0800 (PST)
In-Reply-To: <CABh+foa75nTM+uDvM8peYpR+hXUP3bmRtP50vpwTqfhpWZRpsg@mail.gmail.com>
References: <CABh+foZ2jSj7gMpmG_yzpU1y=Rcry_258Y2ok0e72N3Jj=a5aA@mail.gmail.com>
	<CADkTA4PbwgvPDX_jgtP0Ao5jdG1Kce_JfE3NZgtjgE=UZVxWNA@mail.gmail.com>
	<CABh+foa75nTM+uDvM8peYpR+hXUP3bmRtP50vpwTqfhpWZRpsg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 9 Feb 2017 09:26:47 -0500
Message-ID: <CADkTA4O2Xmve2WBXw_+uDfzt4wPNHnHyuvA4mxq_JXH+cRmohQ@mail.gmail.com>
To: nitish jha <nitishjha16@gmail.com>
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
X-List-Received-Date: Thu, 09 Feb 2017 14:26:53 -0000
Content-Type: multipart/alternative; boundary=94eb2c05a19678cab5054819c594

--94eb2c05a19678cab5054819c594
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 9, 2017 at 7:25 AM, nitish jha <nitishjha16@gmail.com> wrote:

> Hello Bruce,
>
> Thanks for answering my previous query.
>
> I have one more Issue :
>
> I have build kvm-image-minimal but it only has CLI interface virsh to
> mange VMs.
>
> Can you tell me how to integrate virt-manger in my package.
>
> From where should I get recipes for virt-manager and what are the
> dependencies.
>


We don't currently have any recipes for virt-manager. It was asked about and
proposed as an RFC (search for [meta-virtualization] interest to integrate
virt-manager)
in 2015, but no completed recipes were sent for merging.

Work like that would have to be completed, but unfortunately, it is not a
trivial task.

Bruce


> I am using Pocky - Morty.
>
> Any suggestions are welcome.
>
> Thanks in advance
>
> Nitish
>
> On Wed, Feb 1, 2017 at 10:12 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>
>>
>>
>> On Wed, Feb 1, 2017 at 3:04 PM, nitish jha <nitishjha16@gmail.com> wrote:
>>
>>> Hello All,
>>>
>>> I want to build yocto image with meta-virtualization layer
>>>
>>> my  bblayer.conf looks like below
>>>
>>> BBPATH = "${TOPDIR}"
>>> BBFILES ?= ""
>>> BBLAYERS ?= " \
>>> /home/testuser/Downloads/git/Yocto/poky/meta \
>>>
>>> /home/testuser/Downloads/git/Yocto/poky/meta-poky \
>>>
>>> /home/testuser/Downloads/git/Yocto/poky/meta-yocto-bsp \
>>>
>>> /home/testuser/Downloads/git/Yocto/meta-openembedded/meta-oe \
>>>
>>> /home/testuser/Downloads/git/Yocto/meta-openembedded/meta-networking \
>>>
>>> /home/testuser/Downloads/git/Yocto/meta-openembedded/meta-perl \
>>>
>>> /home/testuser/Downloads/git/Yocto/meta-openembedded/meta-python \
>>>
>>> /home/testuser/Downloads/git/Yocto/openembedded-core/meta \
>>>
>>> /home/testuser/Downloads/git/Yocto/meta-virtualization \
>>>
>>>
>>>
>>>
>>> I am getting some error "Failing to expand vapigen_sysroot_preprocess
>>> in vala_0.34.0.bb file.
>>>
>>> This recipe file is inside openembedded-core/meta/recipe-devtools/vala
>>>
>>> is is reallz necessary to include openembedded-core/meta ??
>>>
>>
>> poky/meta is oe-core/meta, so you don't need both.
>>
>> Bruce
>>
>>
>>>
>>> if yes then how should I solve this Issue.
>>>
>>> Thanks in advance.
>>>
>>>
>>> *Nitish Jha*
>>>
>>>
>>>
>>>
>>> --
>>> _______________________________________________
>>> meta-virtualization mailing list
>>> meta-virtualization@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>>
>>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
>> at its end"
>>
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c05a19678cab5054819c594
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Feb 9, 2017 at 7:25 AM, nitish jha <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:nitishjha16@gmail.com" target=3D"_blank">nitishjha16@gmail.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr">Hello Bruce,<div><br></div><div>Thanks for answering my pr=
evious query.</div><div><br></div><div>I have one more Issue :</div><div><b=
r></div><div>I have build kvm-image-minimal but it only has CLI interface v=
irsh to mange VMs.</div><div><br></div><div>Can you tell me how to integrat=
e virt-manger in my package.</div><div><br></div><div>From where should I g=
et recipes for virt-manager and what are the dependencies.</div></div></blo=
ckquote><div><br><br></div><div>We don&#39;t currently have any recipes for=
 virt-manager. It was asked about and<br></div><div>proposed as an RFC (sea=
rch for [meta-virtualization] interest to integrate virt-manager)<br></div>=
<div>in 2015, but no completed recipes were sent for merging.<br><br></div>=
<div>Work like that would have to be completed, but unfortunately, it is no=
t a trivial task.<br><br></div><div>Bruce<br></div><div><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><br></div><d=
iv>I am using Pocky - Morty.</div><div><br></div><div>Any suggestions are w=
elcome.</div><div><br></div><div>Thanks in advance</div><span class=3D"gmai=
l-m_8320877868702255071HOEnZb"><font color=3D"#888888"><div><br></div><div>=
Nitish</div></font></span><div><div class=3D"gmail-m_8320877868702255071h5"=
><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Feb 1, 2=
017 at 10:12 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bru=
ce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><spa=
n>On Wed, Feb 1, 2017 at 3:04 PM, nitish jha <span dir=3D"ltr">&lt;<a href=
=3D"mailto:nitishjha16@gmail.com" target=3D"_blank">nitishjha16@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"ltr">Hello All,<div><br></div><div>I want to build yocto image w=
ith meta-virtualization layer</div><div><br></div><div>my =C2=A0bblayer.con=
f looks like below</div><div><br></div><div>BBPATH =3D &quot;${TOPDIR}&quot=
;<br>BBFILES ?=3D &quot;&quot;<br>BBLAYERS ?=3D &quot; \<br><span style=3D"=
font-family:consolas,menlo,monaco,&quot;lucida console&quot;,&quot;liberati=
on mono&quot;,&quot;dejavu sans mono&quot;,&quot;bitstream vera sans mono&q=
uot;,&quot;courier new&quot;,monospace,sans-serif;white-space:inherit;backg=
round-color:rgb(239,240,241);color:rgb(36,39,41);font-size:13px">/home/test=
user/Downloads/git/Y<wbr>octo/poky</span>/meta \</div><div><br><span style=
=3D"color:rgb(36,39,41);font-family:consolas,menlo,monaco,&quot;lucida cons=
ole&quot;,&quot;liberation mono&quot;,&quot;dejavu sans mono&quot;,&quot;bi=
tstream vera sans mono&quot;,&quot;courier new&quot;,monospace,sans-serif;f=
ont-size:13px;background-color:rgb(239,240,241)">/home/testuser/Downloads/g=
it/Y<wbr>octo/poky</span>/meta-poky \</div><div><br></div><div><span style=
=3D"font-family:consolas,menlo,monaco,&quot;lucida console&quot;,&quot;libe=
ration mono&quot;,&quot;dejavu sans mono&quot;,&quot;bitstream vera sans mo=
no&quot;,&quot;courier new&quot;,monospace,sans-serif;white-space:inherit;b=
ackground-color:rgb(239,240,241);color:rgb(36,39,41);font-size:13px">/home/=
</span><span style=3D"color:rgb(36,39,41);font-family:consolas,menlo,monaco=
,&quot;lucida console&quot;,&quot;liberation mono&quot;,&quot;dejavu sans m=
ono&quot;,&quot;bitstream vera sans mono&quot;,&quot;courier new&quot;,mono=
space,sans-serif;font-size:13px;background-color:rgb(239,240,241)">testuser=
</span><span style=3D"font-family:consolas,menlo,monaco,&quot;lucida consol=
e&quot;,&quot;liberation mono&quot;,&quot;dejavu sans mono&quot;,&quot;bits=
tream vera sans mono&quot;,&quot;courier new&quot;,monospace,sans-serif;whi=
te-space:inherit;background-color:rgb(239,240,241);color:rgb(36,39,41);font=
-size:13px">/Downloads/git/Y<wbr>octo/poky/meta-yocto-bsp \</span></div><di=
v><br></div><div><span style=3D"color:rgb(36,39,41);font-family:consolas,me=
nlo,monaco,&quot;lucida console&quot;,&quot;liberation mono&quot;,&quot;dej=
avu sans mono&quot;,&quot;bitstream vera sans mono&quot;,&quot;courier new&=
quot;,monospace,sans-serif;font-size:13px;background-color:rgb(239,240,241)=
">/home/testuser/Downloads/git/Y<wbr>octo</span>/meta-openembedded/meta-oe =
\</div><div><br><span style=3D"color:rgb(36,39,41);font-family:consolas,men=
lo,monaco,&quot;lucida console&quot;,&quot;liberation mono&quot;,&quot;deja=
vu sans mono&quot;,&quot;bitstream vera sans mono&quot;,&quot;courier new&q=
uot;,monospace,sans-serif;font-size:13px;background-color:rgb(239,240,241)"=
>/home/testuser/Downloads/git/Y<wbr>octo</span>/meta-openembedded/meta-ne<w=
br>tworking \</div><div><br><span style=3D"color:rgb(36,39,41);font-family:=
consolas,menlo,monaco,&quot;lucida console&quot;,&quot;liberation mono&quot=
;,&quot;dejavu sans mono&quot;,&quot;bitstream vera sans mono&quot;,&quot;c=
ourier new&quot;,monospace,sans-serif;font-size:13px;background-color:rgb(2=
39,240,241)">/home/testuser/Downloads/git/Y<wbr>octo</span>/meta-openembedd=
ed/meta-pe<wbr>rl \</div><div><br><span style=3D"color:rgb(36,39,41);font-f=
amily:consolas,menlo,monaco,&quot;lucida console&quot;,&quot;liberation mon=
o&quot;,&quot;dejavu sans mono&quot;,&quot;bitstream vera sans mono&quot;,&=
quot;courier new&quot;,monospace,sans-serif;font-size:13px;background-color=
:rgb(239,240,241)">/home/testuser/Downloads/git/Y<wbr>octo</span>/meta-open=
embedded/meta-py<wbr>thon \</div><div><br></div><div><span style=3D"font-si=
ze:13px;color:rgb(36,39,41);font-family:consolas,menlo,monaco,&quot;lucida =
console&quot;,&quot;liberation mono&quot;,&quot;dejavu sans mono&quot;,&quo=
t;bitstream vera sans mono&quot;,&quot;courier new&quot;,monospace,sans-ser=
if;background-color:rgb(239,240,241)">/home/testuser/Downloads/git/Y<wbr>oc=
to</span>/openembedded-core/meta \</div><div><br><span style=3D"color:rgb(3=
6,39,41);font-family:consolas,menlo,monaco,&quot;lucida console&quot;,&quot=
;liberation mono&quot;,&quot;dejavu sans mono&quot;,&quot;bitstream vera sa=
ns mono&quot;,&quot;courier new&quot;,monospace,sans-serif;font-size:13px;b=
ackground-color:rgb(239,240,241)">/home/testuser/Downloads/git/Y<wbr>octo</=
span>/meta-virtualization \</div><div><br></div><div><br></div><div><br></d=
iv><div><br></div><div>I am getting some error &quot;Failing to expand=C2=
=A0vapigen_sysroot_preproc<wbr>ess in <a href=3D"http://vala_0.34.0.bb" tar=
get=3D"_blank">vala_0.34.0.bb</a> file.<br><br>This recipe file is inside o=
penembedded-core/meta/recipe-<wbr>devtools/vala<br><br>is is reallz necessa=
ry to include openembedded-core/meta ??<br></div></div></blockquote><div><b=
r></div></span><div>poky/meta is oe-core/meta, so you don&#39;t need both.<=
/div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><span><div dir=3D"ltr"><div><br>if yes then how=
 should I solve this Issue.</div><div><font color=3D"#333333" face=3D"conso=
las, liberation mono, menlo, courier, monospace"><span style=3D"font-size:1=
2px;white-space:pre-wrap"><br></span></font></div><div><font color=3D"#3333=
33" face=3D"consolas, liberation mono, menlo, courier, monospace"><span sty=
le=3D"font-size:12px;white-space:pre-wrap">Thanks in advance.</span></font>=
</div><span class=3D"gmail-m_8320877868702255071m_3044680940692679230m_-678=
9518442908638987HOEnZb"><font color=3D"#888888"><div><span style=3D"color:r=
gb(51,51,51);font-family:consolas,&quot;liberation mono&quot;,menlo,courier=
,monospace;font-size:12px;white-space:pre-wrap"><br></span></div><div><span=
 style=3D"color:rgb(51,51,51);font-family:consolas,&quot;liberation mono&qu=
ot;,menlo,courier,monospace;font-size:12px;white-space:pre-wrap"><br></span=
></div><div><div class=3D"gmail-m_8320877868702255071m_3044680940692679230m=
_-6789518442908638987m_-779207791019327120gmail_signature"><div dir=3D"ltr"=
><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div s=
tyle=3D"font-family:arial;font-size:small"><div><b>Nitish Jha</b></div><div=
><b><br></b></div><div><br><br></div></div></div></div></div></div></div></=
div>
</div></font></span></div>
<br></span><span class=3D"gmail-m_8320877868702255071m_3044680940692679230H=
OEnZb"><font color=3D"#888888">--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproje<wbr>ct.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org<wbr>/listi=
nfo/meta-virtualization</a><br>
<br></font></span></blockquote></div><span class=3D"gmail-m_832087786870225=
5071m_3044680940692679230HOEnZb"><font color=3D"#888888"><br><br clear=3D"a=
ll"><div><br></div>-- <br><div class=3D"gmail-m_8320877868702255071m_304468=
0940692679230m_-6789518442908638987gmail_signature">&quot;Thou shalt not fo=
llow the NULL pointer, for chaos and madness await thee at its end&quot;</d=
iv>
</font></span></div></div>
</blockquote></div><div><br></div>
</div></div></div></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail-m_8=
320877868702255071gmail_signature">&quot;Thou shalt not follow the NULL poi=
nter, for chaos and madness await thee at its end&quot;</div>
</div></div>

--94eb2c05a19678cab5054819c594--
