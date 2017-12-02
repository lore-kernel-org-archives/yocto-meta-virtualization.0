Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 111D8E00D19; Fri,  1 Dec 2017 18:51:39 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_10_20, 
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.1 HTML_OBFUSCATE_10_20 BODY: Message is 10% to 20% HTML obfuscation
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F1AFBE00CEF
	for <meta-virtualization@yoctoproject.org>;
	Fri,  1 Dec 2017 18:51:37 -0800 (PST)
Received: by mail-qk0-f195.google.com with SMTP id 63so15599798qke.0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 01 Dec 2017 18:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cRhsEthGKlF62iqhZjxcfOTISEFPZYEFgyGBCcoUu40=;
	b=ERQUp/SFUSSHVi2nDCJOWBCj3BRldWKpOEl1ZYkofbIgkI/na/efwylcRXameXgEmd
	4DtQ9nPNqcZ6hgOHNrLf6WrKKY5Dua9uEh4m01gz4Hyx3IX3n18SBJdLGUwxX6oIRKW+
	viFrCaYiku3E7QgNEaSMx/x+tlkZ5ClKW98uzkyEsrYNKvFAsdfq7BGdk0xiIBZb6jl0
	x3d94DwurxoiLWoY+2MhS9t9upWu+ghv0mE4NKSmhXLr3HWOiPV/dQA51UewvtySRdlg
	Tb+BRc3pTa5V/hTYc3yR0iaVT1FkiXX365kGBl7ZT5jK5FI60FZnuGeW2BgBFDyCf69Y
	mnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cRhsEthGKlF62iqhZjxcfOTISEFPZYEFgyGBCcoUu40=;
	b=aakss4BhTPdoLhJYhrPYfVjoZiM4bS7WPwPzA5uilkYILNUOGHSSOuIRa/n+9apCub
	XgxfBY7IMAMs56oWZ329a81Y9es6SDuOivBK+Mpd7BFqTSd/9m9iV30NFX/Oe7Bi3wqq
	5+jbBZEciK+g6IftasLL47FRMvcoOiOI3UPTSvPrZjAmOb6QS4OtWw8rcL/YIJJfP+lH
	P1E/IooSbrDFljzsPx9FDlQV+dJGhtgv+wCMmmBBDqhfB1pb9Wk3VNeNRX/8uIFnsEgG
	Iy5Ibg4P6NCc3ZRMhZU2i+ysZrIZhaSKpVrdrEP7xOjKfp+qBxxCKuevU5Du/aRnSMuv
	8oLQ==
X-Gm-Message-State: AKGB3mJlOxb/UaXJY+EqLdwLgk02trZDkRpKRMWgD3UJWWD7JxhcAx2r
	Lo99XXeQGHHkM2sQVBF+AmDbD9L4JO5pKsH1064kZg==
X-Google-Smtp-Source: AGs4zMZduw1Q71GK7h6zhOcO7X2MQcgeg7qcO40LbyhNoB7VgrUotgpmRHpeUsO2qhC7JoKglOi/iOapGsxfI0y8YJo=
X-Received: by 10.55.159.215 with SMTP id i206mr9995486qke.265.1512183096993; 
	Fri, 01 Dec 2017 18:51:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Fri, 1 Dec 2017 18:51:36 -0800 (PST)
In-Reply-To: <20171128111443.16257-1-fabio.berton@ossystems.com.br>
References: <20171128111443.16257-1-fabio.berton@ossystems.com.br>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 1 Dec 2017 21:51:36 -0500
Message-ID: <CADkTA4PcRK16oAtcRe+V3cj_q9GAygnaTceLiSwbrxU01c=EEA@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [pyro][PATCH] python-*: use https for pypi URLs
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
X-List-Received-Date: Sat, 02 Dec 2017 02:51:39 -0000
Content-Type: multipart/alternative; boundary="001a114fd31a54ec68055f52903d"

--001a114fd31a54ec68055f52903d
Content-Type: text/plain; charset="UTF-8"

krogoth, morty and pyro now have these patches applied.

Cheers,

Bruce

On Tue, Nov 28, 2017 at 6:14 AM, Fabio Berton <fabio.berton@ossystems.com.br
> wrote:

> Several of the recipes here were using http URLs for source hosted on
> pypi - pypi apparently no longer supports http so switch to https
> instead.
>
> Apply this commit [1] to pyro branch.
>
> [1] https://www.mail-archive.com/meta-virtualization@
> yoctoproject.org/msg02821.html
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  recipes-devtools/python/python-gevent_1.0.1.bb    | 2 +-
>  recipes-devtools/python/python-m2crypto_0.22.3.bb | 2 +-
>  recipes-devtools/python/python-pyyaml_3.11.bb     | 2 +-
>  recipes-devtools/python/python-requests_2.8.1.bb  | 2 +-
>  recipes-devtools/python/python-sphinx_1.4.1.bb    | 2 +-
>  recipes-devtools/python/python-webob_1.6.0.bb     | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/recipes-devtools/python/python-gevent_1.0.1.bb
> b/recipes-devtools/python/python-gevent_1.0.1.bb
> index 47f1267..8ac1295 100644
> --- a/recipes-devtools/python/python-gevent_1.0.1.bb
> +++ b/recipes-devtools/python/python-gevent_1.0.1.bb
> @@ -13,7 +13,7 @@ RDEPENDS_${PN} += "python-greenlet python-mime
> python-pprint python-re"
>
>  SRCNAME = "gevent"
>
> -SRC_URI = "http://pypi.python.org/packages/source/g/gevent/${
> SRCNAME}-${PV}.tar.gz"
> +SRC_URI = "https://pypi.python.org/packages/source/g/gevent/${
> SRCNAME}-${PV}.tar.gz"
>  SRC_URI[md5sum] = "7b952591d1a0174d6eb6ac47bd975ab6"
>  SRC_URI[sha256sum] = "4627e215d058f71d95e6b26d9e7be4
> c263788a4756bd2858a93775f6c072df43"
>
> diff --git a/recipes-devtools/python/python-m2crypto_0.22.3.bb
> b/recipes-devtools/python/python-m2crypto_0.22.3.bb
> index 95d6eec..9814d3d 100644
> --- a/recipes-devtools/python/python-m2crypto_0.22.3.bb
> +++ b/recipes-devtools/python/python-m2crypto_0.22.3.bb
> @@ -14,7 +14,7 @@ LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://PKG-INFO;md5=0ccca7097c1d29fa42e75e9c15c6ff2e"
>
>  SRCNAME = "M2Crypto"
> -SRC_URI = "http://pypi.python.org/packages/source/M/M2Crypto/${
> SRCNAME}-${PV}.tar.gz \
> +SRC_URI = "https://pypi.python.org/packages/source/M/M2Crypto/${
> SRCNAME}-${PV}.tar.gz \
>             file://m2crypto-Fix-build-with-SWIG-3.0.5.patch \
>  "
>
> diff --git a/recipes-devtools/python/python-pyyaml_3.11.bb
> b/recipes-devtools/python/python-pyyaml_3.11.bb
> index cb1db8c..9a6f2f6 100644
> --- a/recipes-devtools/python/python-pyyaml_3.11.bb
> +++ b/recipes-devtools/python/python-pyyaml_3.11.bb
> @@ -18,7 +18,7 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=6015f088759b10e0bc2bf64898d4ae17"
>
>  SRCNAME = "PyYAML"
> -SRC_URI = "http://pyyaml.org/download/pyyaml/${SRCNAME}-${PV}.tar.gz"
> +SRC_URI = "https://pyyaml.org/download/pyyaml/${SRCNAME}-${PV}.tar.gz"
>
>  SRC_URI[md5sum] = "f50e08ef0fe55178479d3a618efe21db"
>  SRC_URI[sha256sum] = "c36c938a872e5ff494938b33b14aaa
> 156cb439ec67548fcab3535bb78b0846e8"
> diff --git a/recipes-devtools/python/python-requests_2.8.1.bb
> b/recipes-devtools/python/python-requests_2.8.1.bb
> index 187f97a..d266780 100644
> --- a/recipes-devtools/python/python-requests_2.8.1.bb
> +++ b/recipes-devtools/python/python-requests_2.8.1.bb
> @@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=
> 58c7e163c9f8ee037246da101c6afd1e"
>
>  SRCNAME = "requests"
>
> -SRC_URI = "http://pypi.python.org/packages/source/r/requests/${
> SRCNAME}-${PV}.tar.gz"
> +SRC_URI = "https://pypi.python.org/packages/source/r/requests/${
> SRCNAME}-${PV}.tar.gz"
>
>  SRC_URI[md5sum] = "a27ea3d72d7822906ddce5e252d6add9"
>  SRC_URI[sha256sum] = "84fe8d5bf4dcdcc49002446c47a146
> d17ac10facf00d9086659064ac43b6c25b"
> diff --git a/recipes-devtools/python/python-sphinx_1.4.1.bb
> b/recipes-devtools/python/python-sphinx_1.4.1.bb
> index 835b369..b4ae86b 100644
> --- a/recipes-devtools/python/python-sphinx_1.4.1.bb
> +++ b/recipes-devtools/python/python-sphinx_1.4.1.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=
> 72f034adc6f7b05b09bc00d1a05bb065"
>  PR = "r0"
>  SRCNAME = "Sphinx"
>
> -SRC_URI = "http://pypi.python.org/packages/source/S/${SRCNAME}/$
> {SRCNAME}-${PV}.tar.gz"
> +SRC_URI = "https://pypi.python.org/packages/source/S/${SRCNAME}/$
> {SRCNAME}-${PV}.tar.gz"
>
>  SRC_URI[md5sum] = "4c4988e0306a04cef8dccc384281e585"
>  SRC_URI[sha256sum] = "c6871a784d24aba9270b6b28541537
> a57e2fcf4d7c799410eba18236bc76d6bc"
> diff --git a/recipes-devtools/python/python-webob_1.6.0.bb
> b/recipes-devtools/python/python-webob_1.6.0.bb
> index 71c74ff..93f2acf 100644
> --- a/recipes-devtools/python/python-webob_1.6.0.bb
> +++ b/recipes-devtools/python/python-webob_1.6.0.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://docs/license.txt;md5=
> 8ed3584bcc78c16da363747ccabc5af5
>  PR = "r0"
>  SRCNAME = "WebOb"
>
> -SRC_URI = "http://pypi.python.org/packages/source/W/${SRCNAME}/$
> {SRCNAME}-${PV}.tar.gz"
> +SRC_URI = "https://pypi.python.org/packages/source/W/${SRCNAME}/$
> {SRCNAME}-${PV}.tar.gz"
>
>  SRC_URI[md5sum] = "089d7fc6745f175737800237c7287802"
>  SRC_URI[sha256sum] = "63d262d8f61b516321f786879c9277
> fa2209f7f57eb47b537eeecfea383d55b7"
> --
> 2.14.2
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114fd31a54ec68055f52903d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">krogoth, morty and pyro now have these patches applied.<di=
v><br></div><div>Cheers,</div><div><br></div><div>Bruce</div></div><div cla=
ss=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Nov 28, 2017 at 6=
:14 AM, Fabio Berton <span dir=3D"ltr">&lt;<a href=3D"mailto:fabio.berton@o=
ssystems.com.br" target=3D"_blank">fabio.berton@ossystems.com.br</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">Several of the recipes here w=
ere using http URLs for source hosted on<br>
pypi - pypi apparently no longer supports http so switch to https<br>
instead.<br>
<br>
Apply this commit [1] to pyro branch.<br>
<br>
[1] <a href=3D"https://www.mail-archive.com/meta-virtualization@yoctoprojec=
t.org/msg02821.html" rel=3D"noreferrer" target=3D"_blank">https://www.mail-=
archive.com/<wbr>meta-virtualization@<wbr>yoctoproject.org/msg02821.html</a=
><br>
<br>
Signed-off-by: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossystems.co=
m.br">fabio.berton@ossystems.com.br</a><wbr>&gt;<br>
---<br>
=C2=A0recipes-devtools/python/<a href=3D"http://python-gevent_1.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">python<wbr>-gevent_1.0.1.bb</a>=C2=A0 =C2=
=A0 | 2 +-<br>
=C2=A0recipes-devtools/python/<a href=3D"http://python-m2crypto_0.22.3.bb" =
rel=3D"noreferrer" target=3D"_blank">python<wbr>-m2crypto_0.22.3.bb</a> | 2=
 +-<br>
=C2=A0recipes-devtools/python/<a href=3D"http://python-pyyaml_3.11.bb" rel=
=3D"noreferrer" target=3D"_blank">python<wbr>-pyyaml_3.11.bb</a>=C2=A0 =C2=
=A0 =C2=A0| 2 +-<br>
=C2=A0recipes-devtools/python/<a href=3D"http://python-requests_2.8.1.bb" r=
el=3D"noreferrer" target=3D"_blank">python<wbr>-requests_2.8.1.bb</a>=C2=A0=
 | 2 +-<br>
=C2=A0recipes-devtools/python/<a href=3D"http://python-sphinx_1.4.1.bb" rel=
=3D"noreferrer" target=3D"_blank">python<wbr>-sphinx_1.4.1.bb</a>=C2=A0 =C2=
=A0 | 2 +-<br>
=C2=A0recipes-devtools/python/<a href=3D"http://python-webob_1.6.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python<wbr>-webob_1.6.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0| 2 +-<br>
=C2=A06 files changed, 6 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python-gevent_1.0.1.=
bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-gevent_1.0.1.bb</a> b/=
recipes-devtools/python/<a href=3D"http://python-gevent_1.0.1.bb" rel=3D"no=
referrer" target=3D"_blank">pyth<wbr>on-gevent_1.0.1.bb</a><br>
index 47f1267..8ac1295 100644<br>
--- a/recipes-devtools/python/<a href=3D"http://python-gevent_1.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">pyth<wbr>on-gevent_1.0.1.bb</a><br>
+++ b/recipes-devtools/python/<a href=3D"http://python-gevent_1.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">pyth<wbr>on-gevent_1.0.1.bb</a><br>
@@ -13,7 +13,7 @@ RDEPENDS_${PN} +=3D &quot;python-greenlet python-mime pyt=
hon-pprint python-re&quot;<br>
<br>
=C2=A0SRCNAME =3D &quot;gevent&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"http://pypi.python.org/packages/source/g/geve=
nt/${SRCNAME}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://pyp=
i.python.org/<wbr>packages/source/g/gevent/${<wbr>SRCNAME}-${PV}.tar.gz</a>=
&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://pypi.python.org/packages/source/g/gev=
ent/${SRCNAME}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://p=
ypi.python.org/<wbr>packages/source/g/gevent/${<wbr>SRCNAME}-${PV}.tar.gz</=
a>&quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>7b952591d1a0174d6eb6ac47bd975a<wbr>b6&=
quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;<wbr>4627e215d058f71d95e6b26d9e7be4<wbr>=
c263788a4756bd2858a93775f6c072<wbr>df43&quot;<br>
<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python-m2crypto_0.22=
.3.bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-m2crypto_0.22.3.bb<=
/a> b/recipes-devtools/python/<a href=3D"http://python-m2crypto_0.22.3.bb" =
rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-m2crypto_0.22.3.bb</a><br>
index 95d6eec..9814d3d 100644<br>
--- a/recipes-devtools/python/<a href=3D"http://python-m2crypto_0.22.3.bb" =
rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-m2crypto_0.22.3.bb</a><br>
+++ b/recipes-devtools/python/<a href=3D"http://python-m2crypto_0.22.3.bb" =
rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-m2crypto_0.22.3.bb</a><br>
@@ -14,7 +14,7 @@ LICENSE =3D &quot;BSD&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;md5=3D<wbr>0ccca7097c1d29f=
a42e75e9c15c6ff<wbr>2e&quot;<br>
<br>
=C2=A0SRCNAME =3D &quot;M2Crypto&quot;<br>
-SRC_URI =3D &quot;<a href=3D"http://pypi.python.org/packages/source/M/M2Cr=
ypto/${SRCNAME}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://p=
ypi.python.org/<wbr>packages/source/M/M2Crypto/${<wbr>SRCNAME}-${PV}.tar.gz=
</a> \<br>
+SRC_URI =3D &quot;<a href=3D"https://pypi.python.org/packages/source/M/M2C=
rypto/${SRCNAME}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https:/=
/pypi.python.org/<wbr>packages/source/M/M2Crypto/${<wbr>SRCNAME}-${PV}.tar.=
gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://m2crypto-Fix-build-<wbr>wi=
th-SWIG-3.0.5.patch \<br>
=C2=A0&quot;<br>
<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python-pyyaml_3.11.b=
b" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-pyyaml_3.11.bb</a> b/re=
cipes-devtools/python/<a href=3D"http://python-pyyaml_3.11.bb" rel=3D"noref=
errer" target=3D"_blank">pyth<wbr>on-pyyaml_3.11.bb</a><br>
index cb1db8c..9a6f2f6 100644<br>
--- a/recipes-devtools/python/<a href=3D"http://python-pyyaml_3.11.bb" rel=
=3D"noreferrer" target=3D"_blank">pyth<wbr>on-pyyaml_3.11.bb</a><br>
+++ b/recipes-devtools/python/<a href=3D"http://python-pyyaml_3.11.bb" rel=
=3D"noreferrer" target=3D"_blank">pyth<wbr>on-pyyaml_3.11.bb</a><br>
@@ -18,7 +18,7 @@ LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>6015f088759b10e0=
bc2bf64898d4ae<wbr>17&quot;<br>
<br>
=C2=A0SRCNAME =3D &quot;PyYAML&quot;<br>
-SRC_URI =3D &quot;<a href=3D"http://pyyaml.org/download/pyyaml/${SRCNAME}-=
${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://pyyaml.org/downlo=
ad/<wbr>pyyaml/${SRCNAME}-${PV}.tar.gz</a><wbr>&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://pyyaml.org/download/pyyaml/${SRCNAME}=
-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://pyyaml.org/down=
load/<wbr>pyyaml/${SRCNAME}-${PV}.tar.gz</a><wbr>&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>f50e08ef0fe55178479d3a618efe21<wbr>db&=
quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;<wbr>c36c938a872e5ff494938b33b14aaa<wbr>=
156cb439ec67548fcab3535bb78b08<wbr>46e8&quot;<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python-requests_2.8.=
1.bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-requests_2.8.1.bb</a=
> b/recipes-devtools/python/<a href=3D"http://python-requests_2.8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">pyth<wbr>on-requests_2.8.1.bb</a><br>
index 187f97a..d266780 100644<br>
--- a/recipes-devtools/python/<a href=3D"http://python-requests_2.8.1.bb" r=
el=3D"noreferrer" target=3D"_blank">pyth<wbr>on-requests_2.8.1.bb</a><br>
+++ b/recipes-devtools/python/<a href=3D"http://python-requests_2.8.1.bb" r=
el=3D"noreferrer" target=3D"_blank">pyth<wbr>on-requests_2.8.1.bb</a><br>
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>58c7=
e163c9f8ee037246da101c6afd<wbr>1e&quot;<br>
<br>
=C2=A0SRCNAME =3D &quot;requests&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"http://pypi.python.org/packages/source/r/requ=
ests/${SRCNAME}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://p=
ypi.python.org/<wbr>packages/source/r/requests/${<wbr>SRCNAME}-${PV}.tar.gz=
</a>&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://pypi.python.org/packages/source/r/req=
uests/${SRCNAME}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https:/=
/pypi.python.org/<wbr>packages/source/r/requests/${<wbr>SRCNAME}-${PV}.tar.=
gz</a>&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>a27ea3d72d7822906ddce5e252d6ad<wbr>d9&=
quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;<wbr>84fe8d5bf4dcdcc49002446c47a146<wbr>=
d17ac10facf00d9086659064ac43b6<wbr>c25b&quot;<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python-sphinx_1.4.1.=
bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-sphinx_1.4.1.bb</a> b/=
recipes-devtools/python/<a href=3D"http://python-sphinx_1.4.1.bb" rel=3D"no=
referrer" target=3D"_blank">pyth<wbr>on-sphinx_1.4.1.bb</a><br>
index 835b369..b4ae86b 100644<br>
--- a/recipes-devtools/python/<a href=3D"http://python-sphinx_1.4.1.bb" rel=
=3D"noreferrer" target=3D"_blank">pyth<wbr>on-sphinx_1.4.1.bb</a><br>
+++ b/recipes-devtools/python/<a href=3D"http://python-sphinx_1.4.1.bb" rel=
=3D"noreferrer" target=3D"_blank">pyth<wbr>on-sphinx_1.4.1.bb</a><br>
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>72f034=
adc6f7b05b09bc00d1a05bb0<wbr>65&quot;<br>
=C2=A0PR =3D &quot;r0&quot;<br>
=C2=A0SRCNAME =3D &quot;Sphinx&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"http://pypi.python.org/packages/source/S/${SR=
CNAME}/${SRCNAME}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http:/=
/pypi.python.org/<wbr>packages/source/S/${SRCNAME}/$<wbr>{SRCNAME}-${PV}.ta=
r.gz</a>&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://pypi.python.org/packages/source/S/${S=
RCNAME}/${SRCNAME}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https=
://pypi.python.org/<wbr>packages/source/S/${SRCNAME}/$<wbr>{SRCNAME}-${PV}.=
tar.gz</a>&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>4c4988e0306a04cef8dccc384281e5<wbr>85&=
quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;<wbr>c6871a784d24aba9270b6b28541537<wbr>=
a57e2fcf4d7c799410eba18236bc76<wbr>d6bc&quot;<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python-webob_1.6.0.b=
b" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-webob_1.6.0.bb</a> b/re=
cipes-devtools/python/<a href=3D"http://python-webob_1.6.0.bb" rel=3D"noref=
errer" target=3D"_blank">pyth<wbr>on-webob_1.6.0.bb</a><br>
index 71c74ff..93f2acf 100644<br>
--- a/recipes-devtools/python/<a href=3D"http://python-webob_1.6.0.bb" rel=
=3D"noreferrer" target=3D"_blank">pyth<wbr>on-webob_1.6.0.bb</a><br>
+++ b/recipes-devtools/python/<a href=3D"http://python-webob_1.6.0.bb" rel=
=3D"noreferrer" target=3D"_blank">pyth<wbr>on-webob_1.6.0.bb</a><br>
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://docs/license.txt;md5=3D<w=
br>8ed3584bcc78c16da363747ccabc5a<wbr>f5<br>
=C2=A0PR =3D &quot;r0&quot;<br>
=C2=A0SRCNAME =3D &quot;WebOb&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"http://pypi.python.org/packages/source/W/${SR=
CNAME}/${SRCNAME}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http:/=
/pypi.python.org/<wbr>packages/source/W/${SRCNAME}/$<wbr>{SRCNAME}-${PV}.ta=
r.gz</a>&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://pypi.python.org/packages/source/W/${S=
RCNAME}/${SRCNAME}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https=
://pypi.python.org/<wbr>packages/source/W/${SRCNAME}/$<wbr>{SRCNAME}-${PV}.=
tar.gz</a>&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>089d7fc6745f175737800237c72878<wbr>02&=
quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;<wbr>63d262d8f61b516321f786879c9277<wbr>=
fa2209f7f57eb47b537eeecfea383d<wbr>55b7&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.14.2<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--001a114fd31a54ec68055f52903d--
