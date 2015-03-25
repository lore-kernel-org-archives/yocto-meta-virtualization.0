Return-Path: <eddy.lai.tw@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1DA09E0091D; Tue, 24 Mar 2015 18:15:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (eddy.lai.tw[at]gmail.com)
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
	*      [209.85.218.44 listed in list.dnswl.org]
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2C37CE008D4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Mar 2015 18:15:02 -0700 (PDT)
Received: by oiag65 with SMTP id g65so9329869oia.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Mar 2015 18:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=obyUL+zOrDpK6O0H/y9trSuyoyuj0CH0773Q/GSb3uU=;
	b=VvH8G78805DIYU/Srz9kSaEsKGG7ReQ6hI7JFWuXZWtu9/8k03IWa+E6JPls2Q2pgQ
	M+ozYXJokm2sYb6tfdGxjEQ81OSz2jgSTRjnwfoB6v0ZT2sRv60EXExBDO2SExr7iES8
	ACMd4ZmNukkCtUZR7f1/32s6TmLb/HD7t6DyoKsjx87raYnqBUyPs7aGAvqx8lCimSzV
	tBoSKU6m0PI9GL5nOGjz8ISixlxW2XchwaBACYcMt96VOXqgULGhtq/F06n9UTyLcPyt
	CpyA9Xc0NeZfu+6fuelwTy08X94YMBAtZuQ4t0Lg09ZH4wb7wFABmjDHlG8e+jjr3bmQ
	psdw==
MIME-Version: 1.0
X-Received: by 10.60.50.69 with SMTP id a5mr5365184oeo.23.1427246102297; Tue,
	24 Mar 2015 18:15:02 -0700 (PDT)
Received: by 10.76.4.173 with HTTP; Tue, 24 Mar 2015 18:15:02 -0700 (PDT)
Date: Wed, 25 Mar 2015 09:15:02 +0800
Message-ID: <CACrgodeNuWsECmFftXE3t3V8hvZGMu6spLXyw+KdPc5GPcUt6A@mail.gmail.com>
From: Lai Eddy <eddy.lai.tw@gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: bblayers configuration
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
X-List-Received-Date: Wed, 25 Mar 2015 01:15:06 -0000
Content-Type: multipart/alternative; boundary=001a11c21b4cef4114051212a0ea

--001a11c21b4cef4114051212a0ea
Content-Type: text/plain; charset=UTF-8

according to README in meta-virtualization
I download all the related repo. and add following to my conf/bblayers.conf

  /media/data/poky/meta-virtualization \
  /media/data/poky/oe-core/meta \
  /media/data/poky/meta-oe/meta-oe \
  /media/data/poky/meta-oe/meta-python \
  /media/data/poky/meta-oe/meta-networking \
  /media/data/poky/meta-oe/meta-filesystems \

then change BBFILE_PRIORITY_openembedded-layer = "4" insdide the layer.conf
of meta-oe/meta-oe, have I done everything right?

I go following error after issue "bitbake kvm-image-minimal"

File:
'__anon_35__media_data_poky_oe_core_meta_recipes_support_libproxy_libproxy_0_4_11_bb',
lineno: 2, function:
__anon_35__media_data_poky_oe_core_meta_recipes_support_libproxy_libproxy_0_4_11_bb
     0001:def
__anon_35__media_data_poky_oe_core_meta_recipes_support_libproxy_libproxy_0_4_11_bb(d):
 *** 0002:    if incompatible_license_contains("GPLv3", "x", "", d) == "x"
or bb.utils.contains("DISTRO_FEATURES", "x11", "x", "", d) == "":
     0003:        d.setVar("EXTRA_OECMAKE",
d.getVar("EXTRA_OECMAKE").replace("-DWITH_GNOME=yes", "-DWITH_GNOME=no"))
     0004:        d.setVar("DEPENDS", " ".join(i for i in
d.getVar("DEPENDS").split() if i != "gconf"))
     0005:
Exception: NameError: global name 'incompatible_license_contains' is not
defined

--001a11c21b4cef4114051212a0ea
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>according to README in meta-virtualization<br></=
div>I download all the related repo. and add following to my conf/bblayers.=
conf<br><br>=C2=A0 /media/data/poky/meta-virtualization \<br>=C2=A0 /media/=
data/poky/oe-core/meta \<br>=C2=A0 /media/data/poky/meta-oe/meta-oe \<br>=
=C2=A0 /media/data/poky/meta-oe/meta-python \<br>=C2=A0 /media/data/poky/me=
ta-oe/meta-networking \<br>=C2=A0 /media/data/poky/meta-oe/meta-filesystems=
 \<br><br></div><div>then change BBFILE_PRIORITY_openembedded-layer =3D &qu=
ot;4&quot; insdide the layer.conf of meta-oe/meta-oe, have I done everythin=
g right? <br><br></div><div>I go following error after issue &quot;bitbake =
kvm-image-minimal&quot;<br><br>File: &#39;__anon_35__media_data_poky_oe_cor=
e_meta_recipes_support_libproxy_libproxy_0_4_11_bb&#39;, lineno: 2, functio=
n: __anon_35__media_data_poky_oe_core_meta_recipes_support_libproxy_libprox=
y_0_4_11_bb<br>=C2=A0=C2=A0=C2=A0=C2=A0 0001:def __anon_35__media_data_poky=
_oe_core_meta_recipes_support_libproxy_libproxy_0_4_11_bb(d):<br>=C2=A0*** =
0002:=C2=A0=C2=A0=C2=A0 if incompatible_license_contains(&quot;GPLv3&quot;,=
 &quot;x&quot;, &quot;&quot;, d) =3D=3D &quot;x&quot; or bb.utils.contains(=
&quot;DISTRO_FEATURES&quot;, &quot;x11&quot;, &quot;x&quot;, &quot;&quot;, =
d) =3D=3D &quot;&quot;:<br>=C2=A0=C2=A0=C2=A0=C2=A0 0003:=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar(&quot;EXTRA_OECMAKE&quot;, d.getVar(&quot=
;EXTRA_OECMAKE&quot;).replace(&quot;-DWITH_GNOME=3Dyes&quot;, &quot;-DWITH_=
GNOME=3Dno&quot;))<br>=C2=A0=C2=A0=C2=A0=C2=A0 0004:=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 d.setVar(&quot;DEPENDS&quot;, &quot; &quot;.join(i fo=
r i in d.getVar(&quot;DEPENDS&quot;).split() if i !=3D &quot;gconf&quot;))<=
br>=C2=A0=C2=A0=C2=A0=C2=A0 0005:<br>Exception: NameError: global name &#39=
;incompatible_license_contains&#39; is not defined<br><br></div><div><br></=
div></div>

--001a11c21b4cef4114051212a0ea--
