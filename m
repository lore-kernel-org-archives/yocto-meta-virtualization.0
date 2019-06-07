Return-Path: <ticotimo@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 485F7E00C37; Fri,  7 Jun 2019 00:06:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (ticotimo[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.166.65 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 65040E00B33
	for <meta-virtualization@yoctoproject.org>;
	Fri,  7 Jun 2019 00:06:23 -0700 (PDT)
Received: by mail-io1-f65.google.com with SMTP id u19so619634ior.9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 07 Jun 2019 00:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FioqoImMdgc04ck0Wz6GSli5kX8cRaM71dgXt1DPg0E=;
	b=aesGAZI3GgRb1pNxlDqteInKKy5Z4X2HG28ZvA0JhYM/gaXZV15DsxlhMDsUFQDPZ/
	nCMkZqRQ9OumMpbXgjBhb2JDOtQ1b4qxGW4Mg7xLYpWp82ufHx5JGcRy33WO3st3cTLR
	7dMyznf7zKiEM8VPZqoOQUfDPxXeARS6A15ZNlew2wHTi35t1T2QZa6zgLgeHFvOQHgt
	jpVw6KNiS2JsYaXISaLvJ2csF5BdVYRNW+4psnCqLkkitirBDknaFW+nogLf+bTUVYLQ
	FJzShXaClLMtKTM/DaPBZCHn2H6AUS7h/+RAyCqgVEfpz/gTg/6FsKvo2luIiUv4xClY
	uopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FioqoImMdgc04ck0Wz6GSli5kX8cRaM71dgXt1DPg0E=;
	b=QSesL5wAk6yv52+IOHrEGViTcU+xtZybOE08/8XJ22lkfM6i1cJENxKrS7ICdyEs5p
	qurPrhtYo8/z8Co4BH2FWfR3CFCcGr6NNn3fKuRjENHru2Tl35KhK08F7+5psPCq07rZ
	PZcrAv8+dqXmVq8kiirwduTW0WfkAJ5qvsMh7KvrNyIUU0bfA1P4O09useXkg+Z/fX/+
	l8NCD1XYMxvs7DnmdgTd6Y8iNSfLsAa+Bprji6BLybjee7+LUnjVT+Z2LWMOkU0HUMvU
	9C9vJLY24BlElGxhOjKbAaEc33Off6/SkJNB1uRBHkhuJi77RoUzwGoS4iEoNmAcb+GF
	H5Ag==
X-Gm-Message-State: APjAAAViPFkIe7Whkhrhcw4e1iJEqa/MGxSRk4Mu3+N4Y1T8/MtDnty/
	PRUEggQ2DFL0JyNWLCJbhOpwgsZmDRxlQwVx4NAXCQ==
X-Google-Smtp-Source: APXvYqw8yn4F/OfR/aCg14I9QbomRLszo2AjoJR4WvKjUAsjXixtWsTDug1x64XFLK92LL//1j70cHDF4Arw20dZRgI=
X-Received: by 2002:a05:6602:2181:: with SMTP id
	b1mr34448488iob.198.1559891182736; 
	Fri, 07 Jun 2019 00:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190606013543.19090-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190606013543.19090-1-zangrc.fnst@cn.fujitsu.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 7 Jun 2019 00:06:11 -0700
Message-ID: <CANx9H-B0k__mTPdqbniPw1=_Tq6AFaNRNLDDjCXqPsh4njgzaw@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-kombu: upgrade 4.5.0 -> 4.6.0
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
X-List-Received-Date: Fri, 07 Jun 2019 07:06:25 -0000
Content-Type: multipart/alternative; boundary="000000000000d5d90a058ab67724"

--000000000000d5d90a058ab67724
Content-Type: text/plain; charset="UTF-8"

Please consider providing a python3 version as well.

On Wed, Jun 5, 2019 at 6:34 PM Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
wrote:

> -Upgrade from python-kombu_4.5.0.bb to python-kombu_4.6.0.bb.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-kombu_4.5.0.bb => python-kombu_4.6.0.bb}   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-kombu_4.5.0.bb =>
> python-kombu_4.6.0.bb} (70%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-kombu_4.5.0.bb
> b/meta-openstack/recipes-devtools/python/python-kombu_4.6.0.bb
> similarity index 70%
> rename from meta-openstack/recipes-devtools/python/python-kombu_4.5.0.bb
> rename to meta-openstack/recipes-devtools/python/python-kombu_4.6.0.bb
> index 6db89cc..8cd6825 100644
> --- a/meta-openstack/recipes-devtools/python/python-kombu_4.5.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-kombu_4.6.0.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=daea7c168428449fbee05e644df929f4"
>
> -SRC_URI[md5sum] = "6a9f0d07ec3f8b784e9358d04a4709c3"
> -SRC_URI[sha256sum] =
> "389ba09e03b15b55b1a7371a441c894fd8121d174f5583bbbca032b9ea8c9edd"
> +SRC_URI[md5sum] = "3543525c1bfaa74260cbf9a6e47dad2f"
> +SRC_URI[sha256sum] =
> "27345bb569eb6bb583bca27dfc0ef181ca6c59c40c6e203cecaa0aeca84360be"
>
>  inherit setuptools pypi
>
> --
> 2.20.1
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

--000000000000d5d90a058ab67724
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Please consider providing a python3 version as well.=
</div></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Wed, Jun 5, 2019 at 6:34 PM Zang Ruochen &lt;<a href=3D"mailt=
o:zangrc.fnst@cn.fujitsu.com">zangrc.fnst@cn.fujitsu.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">-Upgrade from <a href=3D"http://python=
-kombu_4.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python-kombu_4.5.0.bb=
</a> to <a href=3D"http://python-kombu_4.6.0.bb" rel=3D"noreferrer" target=
=3D"_blank">python-kombu_4.6.0.bb</a>.<br>
<br>
Signed-off-by: Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fujitsu.co=
m" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../python/{<a href=3D"http://python-kombu_4.5.0.bb" rel=3D"noreferre=
r" target=3D"_blank">python-kombu_4.5.0.bb</a> =3D&gt; <a href=3D"http://py=
thon-kombu_4.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python-kombu_4.6.=
0.bb</a>}=C2=A0 =C2=A0| 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-kombu_4.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python-kombu_4.5.0.=
bb</a> =3D&gt; <a href=3D"http://python-kombu_4.6.0.bb" rel=3D"noreferrer" =
target=3D"_blank">python-kombu_4.6.0.bb</a>} (70%)<br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-kombu_4.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python-kombu_4.5.0.b=
b</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-kom=
bu_4.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python-kombu_4.6.0.bb</a>=
<br>
similarity index 70%<br>
rename from meta-openstack/recipes-devtools/python/<a href=3D"http://python=
-kombu_4.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python-kombu_4.5.0.bb=
</a><br>
rename to meta-openstack/recipes-devtools/python/<a href=3D"http://python-k=
ombu_4.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python-kombu_4.6.0.bb</=
a><br>
index 6db89cc..8cd6825 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-kombu=
_4.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python-kombu_4.5.0.bb</a><b=
r>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-kombu=
_4.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python-kombu_4.6.0.bb</a><b=
r>
@@ -4,8 +4,8 @@ SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;BSD&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Ddaea7c168428449fbee05=
e644df929f4&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;6a9f0d07ec3f8b784e9358d04a4709c3&quot;<br>
-SRC_URI[sha256sum] =3D &quot;389ba09e03b15b55b1a7371a441c894fd8121d174f558=
3bbbca032b9ea8c9edd&quot;<br>
+SRC_URI[md5sum] =3D &quot;3543525c1bfaa74260cbf9a6e47dad2f&quot;<br>
+SRC_URI[sha256sum] =3D &quot;27345bb569eb6bb583bca27dfc0ef181ca6c59c40c6e2=
03cecaa0aeca84360be&quot;<br>
<br>
=C2=A0inherit setuptools pypi<br>
<br>
-- <br>
2.20.1<br>
<br>
<br>
<br>
-- <br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</blockquote></div></div>

--000000000000d5d90a058ab67724--
