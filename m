Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 74C77E00524; Wed,  1 Feb 2017 13:12:42 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, 
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.179 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.179 listed in list.dnswl.org]
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 83A4BE004D8
	for <meta-virtualization@yoctoproject.org>;
	Wed,  1 Feb 2017 13:12:41 -0800 (PST)
Received: by mail-qt0-f179.google.com with SMTP id x49so284904644qtc.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 01 Feb 2017 13:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gkXeD63XKKrR3tKrTEh7fP2j6b5LLfBFvbkjG6wm2Gw=;
	b=ZN81codA5M8Fkq24nW59Z1QHSNes77FnsCBIFCcOJs36D8yZ9J2xuyyJ8PAsL9BIqU
	KPsnRuhvDtn+csiIZcr0UM+L+LWwTyPkA3fb3wJ9tXnPxFrsbii0N7XbiFJ3SoNTAmD6
	WsuRIiwjofAJKJ049hPee8Bb8oGqipfUK/43OkTiiYmr+Yg0wAppU5Znb6yu0DJBkM6+
	XKyVkueFUY9Jps05AfnZocwKtyeY8PZWQiOuiYdUR1QuJE9Vi5xt2+RJ9c9O3UyWNin1
	iY7NcxEOi+ZWV6+pgY3jyiYXgFrHKKq61BuXAmAC/ikqQkHLjVlRdDBXO9PQStrYpkt7
	udwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gkXeD63XKKrR3tKrTEh7fP2j6b5LLfBFvbkjG6wm2Gw=;
	b=DwzcYvt9wRRPA4njwn9L6Mll1aneU4NtrsSp7NIHzWuSSva3PsOUG228bXn65Vlxut
	wO2Ofr08SEU0eyNAkUz2GxTZZHP7G0y8PpEx6Gx4qusfYczBPsQP4l/iUUMzxA32jhFR
	U0Mb8SfLxc1wNnaXjB9eCQV7BGo2eaZKjXehL5z1PYZWNjw1MVJr3czf6onI16scma7H
	LfSsC42vVdVyuHCiECDvS09pPubzAomO6DTbqXMhjKzPeLucyp31E2eerGVmaqU+qVJh
	zWqjsswPZEVeAs7spa+v/muPJPO/Ds4MTG/haTNkwbrgSEfF8Nd6hZY8Z1kE8iKXpX5M
	T5xg==
X-Gm-Message-State: AIkVDXLdLDhACV6ENkg8tra7WoUhZRPH9D7GeK9hIoJv72iWt2VhH5Sng+Htf8aqIZWWfPaYFXFT/aYwMI9bCA==
X-Received: by 10.237.42.196 with SMTP id t62mr5129055qtd.185.1485983560291;
	Wed, 01 Feb 2017 13:12:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Wed, 1 Feb 2017 13:12:39 -0800 (PST)
In-Reply-To: <CABh+foZ2jSj7gMpmG_yzpU1y=Rcry_258Y2ok0e72N3Jj=a5aA@mail.gmail.com>
References: <CABh+foZ2jSj7gMpmG_yzpU1y=Rcry_258Y2ok0e72N3Jj=a5aA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 1 Feb 2017 16:12:39 -0500
Message-ID: <CADkTA4PbwgvPDX_jgtP0Ao5jdG1Kce_JfE3NZgtjgE=UZVxWNA@mail.gmail.com>
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
X-List-Received-Date: Wed, 01 Feb 2017 21:12:42 -0000
Content-Type: multipart/alternative; boundary=94eb2c122e1e410a7b05477e8223

--94eb2c122e1e410a7b05477e8223
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 1, 2017 at 3:04 PM, nitish jha <nitishjha16@gmail.com> wrote:

> Hello All,
>
> I want to build yocto image with meta-virtualization layer
>
> my  bblayer.conf looks like below
>
> BBPATH = "${TOPDIR}"
> BBFILES ?= ""
> BBLAYERS ?= " \
> /home/testuser/Downloads/git/Yocto/poky/meta \
>
> /home/testuser/Downloads/git/Yocto/poky/meta-poky \
>
> /home/testuser/Downloads/git/Yocto/poky/meta-yocto-bsp \
>
> /home/testuser/Downloads/git/Yocto/meta-openembedded/meta-oe \
>
> /home/testuser/Downloads/git/Yocto/meta-openembedded/meta-networking \
>
> /home/testuser/Downloads/git/Yocto/meta-openembedded/meta-perl \
>
> /home/testuser/Downloads/git/Yocto/meta-openembedded/meta-python \
>
> /home/testuser/Downloads/git/Yocto/openembedded-core/meta \
>
> /home/testuser/Downloads/git/Yocto/meta-virtualization \
>
>
>
>
> I am getting some error "Failing to expand vapigen_sysroot_preprocess in
> vala_0.34.0.bb file.
>
> This recipe file is inside openembedded-core/meta/recipe-devtools/vala
>
> is is reallz necessary to include openembedded-core/meta ??
>

poky/meta is oe-core/meta, so you don't need both.

Bruce


>
> if yes then how should I solve this Issue.
>
> Thanks in advance.
>
>
> *Nitish Jha*
>
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c122e1e410a7b05477e8223
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Feb 1, 2017 at 3:04 PM, nitish jha <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:nitishjha16@gmail.com" target=3D"_blank">nitishjha16@gmail.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">He=
llo All,<div><br></div><div>I want to build yocto image with meta-virtualiz=
ation layer</div><div><br></div><div>my =C2=A0bblayer.conf looks like below=
</div><div><br></div><div>BBPATH =3D &quot;${TOPDIR}&quot;<br>BBFILES ?=3D =
&quot;&quot;<br>BBLAYERS ?=3D &quot; \<br><span style=3D"font-family:consol=
as,menlo,monaco,&quot;lucida console&quot;,&quot;liberation mono&quot;,&quo=
t;dejavu sans mono&quot;,&quot;bitstream vera sans mono&quot;,&quot;courier=
 new&quot;,monospace,sans-serif;white-space:inherit;background-color:rgb(23=
9,240,241);color:rgb(36,39,41);font-size:13px">/home/testuser/Downloads/git=
/<wbr>Yocto/poky</span>/meta \</div><div><br><span style=3D"color:rgb(36,39=
,41);font-family:consolas,menlo,monaco,&quot;lucida console&quot;,&quot;lib=
eration mono&quot;,&quot;dejavu sans mono&quot;,&quot;bitstream vera sans m=
ono&quot;,&quot;courier new&quot;,monospace,sans-serif;font-size:13px;backg=
round-color:rgb(239,240,241)">/home/testuser/Downloads/git/<wbr>Yocto/poky<=
/span>/meta-poky \</div><div><br></div><div><span style=3D"font-family:cons=
olas,menlo,monaco,&quot;lucida console&quot;,&quot;liberation mono&quot;,&q=
uot;dejavu sans mono&quot;,&quot;bitstream vera sans mono&quot;,&quot;couri=
er new&quot;,monospace,sans-serif;white-space:inherit;background-color:rgb(=
239,240,241);color:rgb(36,39,41);font-size:13px">/home/</span><span style=
=3D"color:rgb(36,39,41);font-family:consolas,menlo,monaco,&quot;lucida cons=
ole&quot;,&quot;liberation mono&quot;,&quot;dejavu sans mono&quot;,&quot;bi=
tstream vera sans mono&quot;,&quot;courier new&quot;,monospace,sans-serif;f=
ont-size:13px;background-color:rgb(239,240,241)">testuser</span><span style=
=3D"font-family:consolas,menlo,monaco,&quot;lucida console&quot;,&quot;libe=
ration mono&quot;,&quot;dejavu sans mono&quot;,&quot;bitstream vera sans mo=
no&quot;,&quot;courier new&quot;,monospace,sans-serif;white-space:inherit;b=
ackground-color:rgb(239,240,241);color:rgb(36,39,41);font-size:13px">/Downl=
oads/git/<wbr>Yocto/poky/meta-yocto-bsp \</span></div><div><br></div><div><=
span style=3D"color:rgb(36,39,41);font-family:consolas,menlo,monaco,&quot;l=
ucida console&quot;,&quot;liberation mono&quot;,&quot;dejavu sans mono&quot=
;,&quot;bitstream vera sans mono&quot;,&quot;courier new&quot;,monospace,sa=
ns-serif;font-size:13px;background-color:rgb(239,240,241)">/home/testuser/D=
ownloads/git/<wbr>Yocto</span>/meta-openembedded/meta-<wbr>oe \</div><div><=
br><span style=3D"color:rgb(36,39,41);font-family:consolas,menlo,monaco,&qu=
ot;lucida console&quot;,&quot;liberation mono&quot;,&quot;dejavu sans mono&=
quot;,&quot;bitstream vera sans mono&quot;,&quot;courier new&quot;,monospac=
e,sans-serif;font-size:13px;background-color:rgb(239,240,241)">/home/testus=
er/Downloads/git/<wbr>Yocto</span>/meta-openembedded/meta-<wbr>networking \=
</div><div><br><span style=3D"color:rgb(36,39,41);font-family:consolas,menl=
o,monaco,&quot;lucida console&quot;,&quot;liberation mono&quot;,&quot;dejav=
u sans mono&quot;,&quot;bitstream vera sans mono&quot;,&quot;courier new&qu=
ot;,monospace,sans-serif;font-size:13px;background-color:rgb(239,240,241)">=
/home/testuser/Downloads/git/<wbr>Yocto</span>/meta-openembedded/meta-<wbr>=
perl \</div><div><br><span style=3D"color:rgb(36,39,41);font-family:consola=
s,menlo,monaco,&quot;lucida console&quot;,&quot;liberation mono&quot;,&quot=
;dejavu sans mono&quot;,&quot;bitstream vera sans mono&quot;,&quot;courier =
new&quot;,monospace,sans-serif;font-size:13px;background-color:rgb(239,240,=
241)">/home/testuser/Downloads/git/<wbr>Yocto</span>/meta-openembedded/meta=
-<wbr>python \</div><div><br></div><div><span style=3D"font-size:13px;color=
:rgb(36,39,41);font-family:consolas,menlo,monaco,&quot;lucida console&quot;=
,&quot;liberation mono&quot;,&quot;dejavu sans mono&quot;,&quot;bitstream v=
era sans mono&quot;,&quot;courier new&quot;,monospace,sans-serif;background=
-color:rgb(239,240,241)">/home/testuser/Downloads/git/<wbr>Yocto</span>/ope=
nembedded-core/meta \</div><div><br><span style=3D"color:rgb(36,39,41);font=
-family:consolas,menlo,monaco,&quot;lucida console&quot;,&quot;liberation m=
ono&quot;,&quot;dejavu sans mono&quot;,&quot;bitstream vera sans mono&quot;=
,&quot;courier new&quot;,monospace,sans-serif;font-size:13px;background-col=
or:rgb(239,240,241)">/home/testuser/Downloads/git/<wbr>Yocto</span>/meta-vi=
rtualization \</div><div><br></div><div><br></div><div><br></div><div><br><=
/div><div>I am getting some error &quot;Failing to expand=C2=A0vapigen_sysr=
oot_<wbr>preprocess in <a href=3D"http://vala_0.34.0.bb" target=3D"_blank">=
vala_0.34.0.bb</a> file.<br><br>This recipe file is inside openembedded-cor=
e/meta/recipe-<wbr>devtools/vala<br><br>is is reallz necessary to include o=
penembedded-core/meta ??<br></div></div></blockquote><div><br></div><div>po=
ky/meta is oe-core/meta, so you don&#39;t need both.</div><div><br></div><d=
iv>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"l=
tr"><div><br>if yes then how should I solve this Issue.</div><div><font col=
or=3D"#333333" face=3D"consolas, liberation mono, menlo, courier, monospace=
"><span style=3D"font-size:12px;white-space:pre-wrap"><br></span></font></d=
iv><div><font color=3D"#333333" face=3D"consolas, liberation mono, menlo, c=
ourier, monospace"><span style=3D"font-size:12px;white-space:pre-wrap">Than=
ks in advance.</span></font></div><span class=3D"HOEnZb"><font color=3D"#88=
8888"><div><span style=3D"color:rgb(51,51,51);font-family:consolas,&quot;li=
beration mono&quot;,menlo,courier,monospace;font-size:12px;white-space:pre-=
wrap"><br></span></div><div><span style=3D"color:rgb(51,51,51);font-family:=
consolas,&quot;liberation mono&quot;,menlo,courier,monospace;font-size:12px=
;white-space:pre-wrap"><br></span></div><div><div class=3D"m_-7792077910193=
27120gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><d=
iv dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-family:arial;font-size:s=
mall"><div><b>Nitish Jha</b></div><div><b><br></b></div><div><br><br></div>=
</div></div></div></div></div></div></div>
</div></font></span></div>
<br>--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
<br></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div cla=
ss=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt =
not follow the NULL pointer, for chaos and madness await thee at its end&qu=
ot;</div>
</div></div>

--94eb2c122e1e410a7b05477e8223--
