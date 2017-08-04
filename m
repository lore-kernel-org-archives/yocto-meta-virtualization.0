Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BB83FE00C49; Thu,  3 Aug 2017 20:51:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.47 listed in list.dnswl.org]
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.47 listed in dnsbl.sorbs.net]
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9FAC8E00C43
	for <meta-virtualization@yoctoproject.org>;
	Thu,  3 Aug 2017 20:51:20 -0700 (PDT)
Received: by mail-lf0-f47.google.com with SMTP id t128so2054550lff.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 03 Aug 2017 20:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nDfED0jRs64RNNiKN7keiFIUgf3mPM7BGOrED36fXWA=;
	b=UNqC1AFnue/3316+hfMFKe5nR69Yj6VkPP/9xSIJ0IHgZDEYRk5AVfXGscZypFQpUb
	25gGJXIQtc6lNd3sQKB0MTlvfZG5YOHL84mG5epXegGP0PL9sWYFiBVI8kblbUC0S2gd
	/sl+Rhc1vXTJ3+3GFuXUY7wbc8E9xQZ3uB36msEkhBewvE0iXwoWW+XUVYu5ZP8IfzRF
	bBhhuzsS8c0q3jbeMQECX3uHgQPAHobThv40gylWrCyKevoaRTZH81ONKueemevQuLKe
	aDujvJn75Qr90UzmgD75q+YV+jIHuQQCsf+JzPS1imJtdxQrgTfKQJv4Z4nlAIg0pDkP
	ypYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nDfED0jRs64RNNiKN7keiFIUgf3mPM7BGOrED36fXWA=;
	b=f2KYhzJC+0zkzXVeOqV74Cva0MO01CKin92uqk2Dzd9bulCswSSLuzk4W3xPOfpARs
	OE1dxrCDsnsxvXXQwRhA+4Dz4+/J6Q0UkfwUxwbSVzAd7C+nhBG1stN0I13xW051InTH
	+QFKz6P24n63pLXdrI4F1nFxhapaijTlm8H6mNUzyQy2q2eCynsddgwi3wYaOFteWjCj
	Zy09wnKwb8Uvi0wt6N81LjkNbPyPwXYKNYuvmj8T5Tw3wx7v0dQs2liISROKsOcblgye
	eO7PW6JcAjq6Ehtm+eeY60aGrPxT0PRKSPSbohZTSchusB6qvPyV7QGPx0DYbpE1c3m5
	GnLg==
X-Gm-Message-State: AHYfb5hI6BFgI9lZ7+qS/NOBzlO8QR3HYQBz94GvOnmfsKyEWPBmyMtF
	XRGsqOOBySnu2PxF0SvBHvj+iVHtBQ==
X-Received: by 10.25.235.85 with SMTP id j82mr230345lfh.141.1501818679543;
	Thu, 03 Aug 2017 20:51:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.14.18 with HTTP; Thu, 3 Aug 2017 20:51:19 -0700 (PDT)
In-Reply-To: <1501497965-53638-1-git-send-email-adrian.dudau@enea.com>
References: <1501497965-53638-1-git-send-email-adrian.dudau@enea.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 3 Aug 2017 23:51:19 -0400
Message-ID: <CADkTA4O_mZ74NZ38i_otv-akJn+pdCHiLPyNBzujKO4ZkH_ieg@mail.gmail.com>
To: Adrian Dudau <adrian.dudau@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-six: Drop recipe
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
X-List-Received-Date: Fri, 04 Aug 2017 03:51:21 -0000
Content-Type: multipart/alternative; boundary="001a113c39ace94ac10555e56802"

--001a113c39ace94ac10555e56802
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Mon, Jul 31, 2017 at 6:46 AM, Adrian Dudau <adrian.dudau@enea.com> wrote:

> Same recipe is maintained in oe-core, no need to keep a duplicate here.
>
> Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
> ---
>  recipes-devtools/python/python-six_1.10.0.bb | 19 -------------------
>  1 file changed, 19 deletions(-)
>  delete mode 100644 recipes-devtools/python/python-six_1.10.0.bb
>
> diff --git a/recipes-devtools/python/python-six_1.10.0.bb
> b/recipes-devtools/python/python-six_1.10.0.bb
> deleted file mode 100644
> index c279f9f..0000000
> --- a/recipes-devtools/python/python-six_1.10.0.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -DESCRIPTION = "Python 2 and 3 compatibility utilities"
> -HOMEPAGE = "http://pypi.python.org/pypi/six/"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=6f00d4a50713fa859858dd9abaa35b21"
> -
> -SRCNAME = "six"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/s/${SRCNAME}/$
> {SRCNAME}-${PV}.tar.gz \
> -"
> -
> -SRC_URI[md5sum] = "34eed507548117b2ab523ab14b2f8b55"
> -SRC_URI[sha256sum] = "105f8d68616f8248e24bf0e9372ef0
> 4d3cc10104f1980f54d57b2ce73a5ad56a"
> -
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> -
> -BBCLASSEXTEND = "native"
> \ No newline at end of file
> --
> 2.7.4
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

--001a113c39ace94ac10555e56802
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Mon, Jul 31, 2017 at 6:46 AM=
, Adrian Dudau <span dir=3D"ltr">&lt;<a href=3D"mailto:adrian.dudau@enea.co=
m" target=3D"_blank">adrian.dudau@enea.com</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">Same recipe is maintained in oe-core, no need to ke=
ep a duplicate here.<br>
<br>
Signed-off-by: Adrian Dudau &lt;<a href=3D"mailto:adrian.dudau@enea.com">ad=
rian.dudau@enea.com</a>&gt;<br>
---<br>
=C2=A0recipes-devtools/python/<a href=3D"http://python-six_1.10.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python<wbr>-six_1.10.0.bb</a> | 19 ------=
-------------<br>
=C2=A01 file changed, 19 deletions(-)<br>
=C2=A0delete mode 100644 recipes-devtools/python/<a href=3D"http://python-s=
ix_1.10.0.bb" rel=3D"noreferrer" target=3D"_blank">python<wbr>-six_1.10.0.b=
b</a><br>
<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python-six_1.10.0.bb=
" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-six_1.10.0.bb</a> b/reci=
pes-devtools/python/<a href=3D"http://python-six_1.10.0.bb" rel=3D"noreferr=
er" target=3D"_blank">pyth<wbr>on-six_1.10.0.bb</a><br>
deleted file mode 100644<br>
index c279f9f..0000000<br>
--- a/recipes-devtools/python/<a href=3D"http://python-six_1.10.0.bb" rel=
=3D"noreferrer" target=3D"_blank">pyth<wbr>on-six_1.10.0.bb</a><br>
+++ /dev/null<br>
@@ -1,19 +0,0 @@<br>
-DESCRIPTION =3D &quot;Python 2 and 3 compatibility utilities&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://pypi.python.org/pypi/six/" rel=3D"nor=
eferrer" target=3D"_blank">http://pypi.python.org/pypi/<wbr>six/</a>&quot;<=
br>
-SECTION =3D &quot;devel/python&quot;<br>
-LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>6f00d4a50713fa859858d=
d9abaa35b<wbr>21&quot;<br>
-<br>
-SRCNAME =3D &quot;six&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"https://pypi.python.org/packages/source/s/${S=
RCNAME}/${SRCNAME}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https=
://pypi.python.org/<wbr>packages/source/s/${SRCNAME}/$<wbr>{SRCNAME}-${PV}.=
tar.gz</a> \<br>
-&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;<wbr>34eed507548117b2ab523ab14b2f8b<wbr>55&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>105f8d68616f8248e24bf0e9372ef0<wbr>4d3cc=
10104f1980f54d57b2ce73a5a<wbr>d56a&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
-<br>
-inherit setuptools<br>
-<br>
-BBCLASSEXTEND =3D &quot;native&quot;<br>
\ No newline at end of file<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
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

--001a113c39ace94ac10555e56802--
