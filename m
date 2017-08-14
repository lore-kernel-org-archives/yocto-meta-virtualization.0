Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 71E3EE00C09; Mon, 14 Aug 2017 09:08:28 -0700 (PDT)
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
	*      [209.85.220.195 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.195 listed in dnsbl.sorbs.net]
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A1C3BE008D2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 14 Aug 2017 09:08:27 -0700 (PDT)
Received: by mail-qk0-f195.google.com with SMTP id d136so9729209qkg.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 14 Aug 2017 09:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6+zlgKTGctv4Tfnate0ez2y4WUseUfhyvVaMkNwqH7w=;
	b=jcEMzpwzYAFaU81UUPYyNtJ3Ap7kkpXmgkF7nFJNqqlv54/sthrdNTwyjYCjIalJhh
	QY7xieZc4eR6le+BsEKh3gxQYPeCmT31cDqXb36NHktf3bpXc3OSc81qlQFx8RmwjNjX
	RzNlWj6uifgProPkBd8TtEV6pEsp4hPQ6SELbZ9+CNNZBnVb9eZ6T6ThbJ1tEnM4dWkA
	6+26afbscJu/JM8QplrhRxANHXLWMieRSjxFFZF+YLQiJsPhFeZqx/bhr0oYhkT8oNi0
	PJckDyO2dy2LF4DydVBNcVN6ZLPln3p5kYTKfUIsPU45/TbR9w6usVdF6uHqSGbGf6iN
	cQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6+zlgKTGctv4Tfnate0ez2y4WUseUfhyvVaMkNwqH7w=;
	b=uO/U4SrNyiFen/NlzJ7g2+/Tjtflfwd8FhVRPLdF5vMjy7U8yA1MRsvNPHWXUo/WVl
	IRqFCFC1nOsw+4sjocAYHlpn+3i0i8wQhyjT/CglsUwDpPCQrGrARdmqRDAtg4NQOCPq
	KBg2nexWtINCGAi+CaDetJtjmOY4XH3tVRGqKTE+jDL9I+BiL/dsmPvo/PAsXn1w/xRl
	MA/0UW6LCrQND2oYU/W+I/cGkAcjD2jIHjz8AB9gBCHT3ZX+QZ78gey3jtPARhpfDGtv
	o3dPgkKCZkzXntFRMVHuTeFCIgp+EPWUM5JEpej/ziFHw0SAx3LbPfJTq0C5jHP+6JDu
	Q/Ww==
X-Gm-Message-State: AHYfb5ioCvieoFaaR/O8UUbOxf+lJoZxUbZcyU+ml7Cu4SolcEJgnmxn
	fW4X4dQol9kHAZgOy/o6BjtA3VA/Bg==
X-Received: by 10.55.156.9 with SMTP id f9mr32832779qke.141.1502726906685;
	Mon, 14 Aug 2017 09:08:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.194.139 with HTTP; Mon, 14 Aug 2017 09:08:26 -0700 (PDT)
In-Reply-To: <1502710208-26297-1-git-send-email-adrian.dudau@enea.com>
References: <1502710208-26297-1-git-send-email-adrian.dudau@enea.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 14 Aug 2017 12:08:26 -0400
Message-ID: <CADkTA4OA3j6dOwm+KNYwxEy6TgwBz3DYH-M4vo=2ATH18hHeow@mail.gmail.com>
To: Adrian Dudau <adrian.dudau@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/2] python-simplejson: Drop recipe
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
X-List-Received-Date: Mon, 14 Aug 2017 16:08:28 -0000
Content-Type: multipart/alternative; boundary="94eb2c07593877ae9a0556b8df3d"

--94eb2c07593877ae9a0556b8df3d
Content-Type: text/plain; charset="UTF-8"

We often keep the layer local recipes around .. but yes, in these two cases
it wasn't required.

I've merged the two patches.

Bruce

On Mon, Aug 14, 2017 at 7:30 AM, Adrian Dudau <adrian.dudau@enea.com> wrote:

> Newer version of the recipe (v3.11.1) is already maintained in
> meta-python and I couldn't find any hard dependencies on the current
> version.
>
> Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
> ---
>  recipes-devtools/python/python-simplejson_3.7.3.bb | 31
> ----------------------
>  1 file changed, 31 deletions(-)
>  delete mode 100644 recipes-devtools/python/python-simplejson_3.7.3.bb
>
> diff --git a/recipes-devtools/python/python-simplejson_3.7.3.bb
> b/recipes-devtools/python/python-simplejson_3.7.3.bb
> deleted file mode 100644
> index 39dfce6..0000000
> --- a/recipes-devtools/python/python-simplejson_3.7.3.bb
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -HOMEPAGE = "http://cheeseshop.python.org/pypi/simplejson"
> -SUMMARY = "Simple, fast, extensible JSON encoder/decoder for Python"
> -DESCRIPTION = "\
> -  JSON <http://json.org> encoder and decoder for Python 2.5+ \
> -  and Python 3.3+.  It is pure Python code with no dependencies, \
> -  but includes an optional C extension for a serious speed boost \
> -  "
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c5
> 2e"
> -PR = "r0"
> -
> -SRCNAME = "simplejson"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/s/simplejson/$
> {SRCNAME}-${PV}.tar.gz"
> -SRC_URI[md5sum] = "117346e5ee4ed4434ffe485f8e58f5ed"
> -SRC_URI[sha256sum] = "63d7f7b14a20f29f74325a69e6db45
> 925eaf6e3a003eab46c0234fd050a8c93f"
> -
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> -
> -RDEPENDS_${PN} = "\
> -    python-core \
> -    python-re \
> -    python-io \
> -    python-netserver \
> -    python-numbers \
> -"
> -
> -
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

--94eb2c07593877ae9a0556b8df3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">We often keep the layer local recipes around .. but yes, i=
n these two cases it wasn&#39;t required.<div><br></div><div>I&#39;ve merge=
d the two patches.</div><div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Mon, Aug 14, 2017 at 7:30 AM=
, Adrian Dudau <span dir=3D"ltr">&lt;<a href=3D"mailto:adrian.dudau@enea.co=
m" target=3D"_blank">adrian.dudau@enea.com</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">Newer version of the recipe (v3.11.1) is already ma=
intained in<br>
meta-python and I couldn&#39;t find any hard dependencies on the current<br=
>
version.<br>
<br>
Signed-off-by: Adrian Dudau &lt;<a href=3D"mailto:adrian.dudau@enea.com">ad=
rian.dudau@enea.com</a>&gt;<br>
---<br>
=C2=A0recipes-devtools/python/<a href=3D"http://python-simplejson_3.7.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">python<wbr>-simplejson_3.7.3.bb</a> |=
 31 ----------------------<br>
=C2=A01 file changed, 31 deletions(-)<br>
=C2=A0delete mode 100644 recipes-devtools/python/<a href=3D"http://python-s=
implejson_3.7.3.bb" rel=3D"noreferrer" target=3D"_blank">python<wbr>-simple=
json_3.7.3.bb</a><br>
<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python-simplejson_3.=
7.3.bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-simplejson_3.7.3.b=
b</a> b/recipes-devtools/python/<a href=3D"http://python-simplejson_3.7.3.b=
b" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-simplejson_3.7.3.bb</a>=
<br>
deleted file mode 100644<br>
index 39dfce6..0000000<br>
--- a/recipes-devtools/python/<a href=3D"http://python-simplejson_3.7.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-simplejson_3.7.3.bb</a><b=
r>
+++ /dev/null<br>
@@ -1,31 +0,0 @@<br>
-HOMEPAGE =3D &quot;<a href=3D"http://cheeseshop.python.org/pypi/simplejson=
" rel=3D"noreferrer" target=3D"_blank">http://cheeseshop.python.org/<wbr>py=
pi/simplejson</a>&quot;<br>
-SUMMARY =3D &quot;Simple, fast, extensible JSON encoder/decoder for Python=
&quot;<br>
-DESCRIPTION =3D &quot;\<br>
-=C2=A0 JSON &lt;<a href=3D"http://json.org" rel=3D"noreferrer" target=3D"_=
blank">http://json.org</a>&gt; encoder and decoder for Python 2.5+ \<br>
-=C2=A0 and Python 3.3+.=C2=A0 It is pure Python code with no dependencies,=
 \<br>
-=C2=A0 but includes an optional C extension for a serious speed boost \<br=
>
-=C2=A0 &quot;<br>
-SECTION =3D &quot;devel/python&quot;<br>
-LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D<wbr>c6338d7abd321c0b5=
0a2a547e441c5<wbr>2e&quot;<br>
-PR =3D &quot;r0&quot;<br>
-<br>
-SRCNAME =3D &quot;simplejson&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"https://pypi.python.org/packages/source/s/sim=
plejson/${SRCNAME}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https=
://pypi.python.org/<wbr>packages/source/s/simplejson/$<wbr>{SRCNAME}-${PV}.=
tar.gz</a>&quot;<br>
-SRC_URI[md5sum] =3D &quot;<wbr>117346e5ee4ed4434ffe485f8e58f5<wbr>ed&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>63d7f7b14a20f29f74325a69e6db45<wbr>925ea=
f6e3a003eab46c0234fd050a8<wbr>c93f&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
-<br>
-inherit setuptools<br>
-<br>
-RDEPENDS_${PN} =3D &quot;\<br>
-=C2=A0 =C2=A0 python-core \<br>
-=C2=A0 =C2=A0 python-re \<br>
-=C2=A0 =C2=A0 python-io \<br>
-=C2=A0 =C2=A0 python-netserver \<br>
-=C2=A0 =C2=A0 python-numbers \<br>
-&quot;<br>
-<br>
-<br>
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

--94eb2c07593877ae9a0556b8df3d--
