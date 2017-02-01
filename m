Return-Path: <nitishjha16@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D9927E00546; Wed,  1 Feb 2017 12:05:01 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (nitishjha16[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.223.181 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.223.181 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5B69FE004D8
	for <meta-virtualization@yoctoproject.org>;
	Wed,  1 Feb 2017 12:05:00 -0800 (PST)
Received: by mail-io0-f181.google.com with SMTP id l66so165680440ioi.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 01 Feb 2017 12:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=MTiSBxCRd0L2kny6bx6xCJkgO4wci2Ugd0rdMQKhuiU=;
	b=ZnKyj3y3YyziwgVErD3dHtHnMqcdumv5TzZwTbo9g3wcYpvhsQOkbX51KPNBCMHrkb
	9MKzSDeu0Qqy18gnFJHLiTYQ3Kci/fZQdWIUoHwNZvU1OPsElplsNd9RUDeNadgl/0qy
	nuRbehzYD/lUkHCs+wXYsmWHDeFhmJy3RZUFWfbBE7NArMr46ZKA4wB+7DeTAXFXWnLU
	0cQzcD5QnvpvSTYenY97Q3ynAxbVtOqxB0DVHkLLvJPAa1e76gra1l3olHe3mHzrD0d4
	FqZQsbEkDIylkWJxak0v2vPV/01uYkkYhdlg0HhrniHrlYkkztQn6N4yZg029xExddxr
	ToQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=MTiSBxCRd0L2kny6bx6xCJkgO4wci2Ugd0rdMQKhuiU=;
	b=FojKpNaKi4zZZ1lMlhqDlQpdBoUoJR+4CbvkIfwUYjZjfua/cijnpkfqYdpPQTvpDZ
	/l/CCf7ZGdWjc0iiKdA3gAWybuGfhR53SLmHGAf0UMtUKGNA8ERtWTpcRjYcXkJ1TM7q
	yeJmXwfezDuAFq74ea/qpVWGUEsAtEcBt3JCjJYy0L7Diks465FhgNQCCfIV4iZLrH/e
	aRVCRgu0tkfWcJo7nbZnG4Yaili6ptCZGdbZVnbXBKlILkcqRQtPyio3z8LsMYjzSBgA
	/qW8pxLr95j6+Rn1bfPGs2pibnP6jQaCIzpcExp4+aQvUfMgI6a4TvIAepgxElBhuMr5
	NeVg==
X-Gm-Message-State: AIkVDXKYw+be3ghOcIKbhMC3DCx8MZcSS3w5aawDY1IOQNw1M2yiotf8/mV61L3IXq2EN2Ds5/whX8+w2EdFsA==
X-Received: by 10.107.11.159 with SMTP id 31mr3506483iol.20.1485979499958;
	Wed, 01 Feb 2017 12:04:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.142.205 with HTTP; Wed, 1 Feb 2017 12:04:59 -0800 (PST)
From: nitish jha <nitishjha16@gmail.com>
Date: Wed, 1 Feb 2017 21:04:59 +0100
Message-ID: <CABh+foZ2jSj7gMpmG_yzpU1y=Rcry_258Y2ok0e72N3Jj=a5aA@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: Building Yocto Image with meta-virtualization layer
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
X-List-Received-Date: Wed, 01 Feb 2017 20:05:01 -0000
Content-Type: multipart/alternative; boundary=001a113edcd43d1e7c05477d9062

--001a113edcd43d1e7c05477d9062
Content-Type: text/plain; charset=UTF-8

Hello All,

I want to build yocto image with meta-virtualization layer

my  bblayer.conf looks like below

BBPATH = "${TOPDIR}"
BBFILES ?= ""
BBLAYERS ?= " \
/home/testuser/Downloads/git/Yocto/poky/meta \

/home/testuser/Downloads/git/Yocto/poky/meta-poky \

/home/testuser/Downloads/git/Yocto/poky/meta-yocto-bsp \

/home/testuser/Downloads/git/Yocto/meta-openembedded/meta-oe \

/home/testuser/Downloads/git/Yocto/meta-openembedded/meta-networking \

/home/testuser/Downloads/git/Yocto/meta-openembedded/meta-perl \

/home/testuser/Downloads/git/Yocto/meta-openembedded/meta-python \

/home/testuser/Downloads/git/Yocto/openembedded-core/meta \

/home/testuser/Downloads/git/Yocto/meta-virtualization \




I am getting some error "Failing to expand vapigen_sysroot_preprocess in
vala_0.34.0.bb file.

This recipe file is inside openembedded-core/meta/recipe-devtools/vala

is is reallz necessary to include openembedded-core/meta ??

if yes then how should I solve this Issue.

Thanks in advance.


*Nitish Jha*

--001a113edcd43d1e7c05477d9062
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello All,<div><br></div><div>I want to build yocto image =
with meta-virtualization layer</div><div><br></div><div>my =C2=A0bblayer.co=
nf looks like below</div><div><br></div><div>BBPATH =3D &quot;${TOPDIR}&quo=
t;<br>BBFILES ?=3D &quot;&quot;<br>BBLAYERS ?=3D &quot; \<br><span style=3D=
"font-family:consolas,menlo,monaco,&quot;lucida console&quot;,&quot;liberat=
ion mono&quot;,&quot;dejavu sans mono&quot;,&quot;bitstream vera sans mono&=
quot;,&quot;courier new&quot;,monospace,sans-serif;white-space:inherit;back=
ground-color:rgb(239,240,241);color:rgb(36,39,41);font-size:13px">/home/tes=
tuser/Downloads/git/Yocto/poky</span>/meta \</div><div><br><span style=3D"c=
olor:rgb(36,39,41);font-family:consolas,menlo,monaco,&quot;lucida console&q=
uot;,&quot;liberation mono&quot;,&quot;dejavu sans mono&quot;,&quot;bitstre=
am vera sans mono&quot;,&quot;courier new&quot;,monospace,sans-serif;font-s=
ize:13px;background-color:rgb(239,240,241)">/home/testuser/Downloads/git/Yo=
cto/poky</span>/meta-poky \</div><div><br></div><div><span style=3D"font-fa=
mily:consolas,menlo,monaco,&quot;lucida console&quot;,&quot;liberation mono=
&quot;,&quot;dejavu sans mono&quot;,&quot;bitstream vera sans mono&quot;,&q=
uot;courier new&quot;,monospace,sans-serif;white-space:inherit;background-c=
olor:rgb(239,240,241);color:rgb(36,39,41);font-size:13px">/home/</span><spa=
n style=3D"color:rgb(36,39,41);font-family:consolas,menlo,monaco,&quot;luci=
da console&quot;,&quot;liberation mono&quot;,&quot;dejavu sans mono&quot;,&=
quot;bitstream vera sans mono&quot;,&quot;courier new&quot;,monospace,sans-=
serif;font-size:13px;background-color:rgb(239,240,241)">testuser</span><spa=
n style=3D"font-family:consolas,menlo,monaco,&quot;lucida console&quot;,&qu=
ot;liberation mono&quot;,&quot;dejavu sans mono&quot;,&quot;bitstream vera =
sans mono&quot;,&quot;courier new&quot;,monospace,sans-serif;white-space:in=
herit;background-color:rgb(239,240,241);color:rgb(36,39,41);font-size:13px"=
>/Downloads/git/Yocto/poky/meta-yocto-bsp \</span></div><div><br></div><div=
><span style=3D"color:rgb(36,39,41);font-family:consolas,menlo,monaco,&quot=
;lucida console&quot;,&quot;liberation mono&quot;,&quot;dejavu sans mono&qu=
ot;,&quot;bitstream vera sans mono&quot;,&quot;courier new&quot;,monospace,=
sans-serif;font-size:13px;background-color:rgb(239,240,241)">/home/testuser=
/Downloads/git/Yocto</span>/meta-openembedded/meta-oe \</div><div><br><span=
 style=3D"color:rgb(36,39,41);font-family:consolas,menlo,monaco,&quot;lucid=
a console&quot;,&quot;liberation mono&quot;,&quot;dejavu sans mono&quot;,&q=
uot;bitstream vera sans mono&quot;,&quot;courier new&quot;,monospace,sans-s=
erif;font-size:13px;background-color:rgb(239,240,241)">/home/testuser/Downl=
oads/git/Yocto</span>/meta-openembedded/meta-networking \</div><div><br><sp=
an style=3D"color:rgb(36,39,41);font-family:consolas,menlo,monaco,&quot;luc=
ida console&quot;,&quot;liberation mono&quot;,&quot;dejavu sans mono&quot;,=
&quot;bitstream vera sans mono&quot;,&quot;courier new&quot;,monospace,sans=
-serif;font-size:13px;background-color:rgb(239,240,241)">/home/testuser/Dow=
nloads/git/Yocto</span>/meta-openembedded/meta-perl \</div><div><br><span s=
tyle=3D"color:rgb(36,39,41);font-family:consolas,menlo,monaco,&quot;lucida =
console&quot;,&quot;liberation mono&quot;,&quot;dejavu sans mono&quot;,&quo=
t;bitstream vera sans mono&quot;,&quot;courier new&quot;,monospace,sans-ser=
if;font-size:13px;background-color:rgb(239,240,241)">/home/testuser/Downloa=
ds/git/Yocto</span>/meta-openembedded/meta-python \</div><div><br></div><di=
v><span style=3D"font-size:13px;color:rgb(36,39,41);font-family:consolas,me=
nlo,monaco,&quot;lucida console&quot;,&quot;liberation mono&quot;,&quot;dej=
avu sans mono&quot;,&quot;bitstream vera sans mono&quot;,&quot;courier new&=
quot;,monospace,sans-serif;background-color:rgb(239,240,241)">/home/testuse=
r/Downloads/git/Yocto</span>/openembedded-core/meta \</div><div><br><span s=
tyle=3D"color:rgb(36,39,41);font-family:consolas,menlo,monaco,&quot;lucida =
console&quot;,&quot;liberation mono&quot;,&quot;dejavu sans mono&quot;,&quo=
t;bitstream vera sans mono&quot;,&quot;courier new&quot;,monospace,sans-ser=
if;font-size:13px;background-color:rgb(239,240,241)">/home/testuser/Downloa=
ds/git/Yocto</span>/meta-virtualization \</div><div><br></div><div><br></di=
v><div><br></div><div><br></div><div>I am getting some error &quot;Failing =
to expand=C2=A0vapigen_sysroot_preprocess in <a href=3D"http://vala_0.34.0.=
bb">vala_0.34.0.bb</a> file.<br><br>This recipe file is inside openembedded=
-core/meta/recipe-devtools/vala<br><br>is is reallz necessary to include op=
enembedded-core/meta ??<br><br>if yes then how should I solve this Issue.</=
div><div><font color=3D"#333333" face=3D"consolas, liberation mono, menlo, =
courier, monospace"><span style=3D"font-size:12px;white-space:pre"><br></sp=
an></font></div><div><font color=3D"#333333" face=3D"consolas, liberation m=
ono, menlo, courier, monospace"><span style=3D"font-size:12px;white-space:p=
re">Thanks in advance.</span></font></div><div><span style=3D"color:rgb(51,=
51,51);font-family:consolas,&quot;liberation mono&quot;,menlo,courier,monos=
pace;font-size:12px;white-space:pre"><br></span></div><div><span style=3D"c=
olor:rgb(51,51,51);font-family:consolas,&quot;liberation mono&quot;,menlo,c=
ourier,monospace;font-size:12px;white-space:pre"><br></span></div><div><div=
 class=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-family:arial;font-s=
ize:small"><div><b>Nitish Jha</b></div><div><b><br></b></div><div><br><br><=
/div></div></div></div></div></div></div></div>
</div></div>

--001a113edcd43d1e7c05477d9062--
