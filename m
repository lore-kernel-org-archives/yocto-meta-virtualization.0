Return-Path: <ticotimo@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2FFC0E00C37; Fri,  7 Jun 2019 00:03:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.166.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (ticotimo[at]gmail.com)
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5D25FE00B33
	for <meta-virtualization@yoctoproject.org>;
	Fri,  7 Jun 2019 00:03:57 -0700 (PDT)
Received: by mail-it1-f196.google.com with SMTP id m187so1204127ite.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 07 Jun 2019 00:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aMduhD97IFSUH/LeFIk/WKQdyBP4c1gGKtLb8/04Pfc=;
	b=B4BmPka3nlSTTwxg33u07EIK4sujVBzlgl7s95u9ML0WcMDF6aYdhmJnoIYlBmlfdZ
	H0mtqC3ccu73ZXcI6tjwHeBa632OpIjyYQ7CxvFJrW82RVeHBgxmhRv4dL1WC5yVZzWn
	MuOPGgYpsaxR+5NDa180Q9OF+WJQ+5dFJirHnH3CcbxISXth7QswXhM0ihv/RxgHl18a
	XXqStAaVLnx4FGLSTOoXu/ckSk5/+Ib8G/bCX8BoDmCyOejpfL/vnjosG1BZAYyKr9js
	fCu6Kf5a+JaxVFVXc5pCgB2b7n+y1DpKjgOuYuTam2iWDi2kcmySbSZAT5H/owXI5M1W
	IKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aMduhD97IFSUH/LeFIk/WKQdyBP4c1gGKtLb8/04Pfc=;
	b=lSe+uyKTFVE/ZGnJa5cx7JLqiEjGT8BzCS4b3zgxAMtWyuF4cL7jdtK+rcxVHm82/Y
	mOQobg6cQcjHxjxQR3q3YtgybFGwejdSHEiPEka7eEYlyysKfUPjau05/Ce5TlrfrHJu
	GO1V5HQv1rMZnTsjwSMcT0ePDBN4DHybEuJkBO5O1DnxiskIQVf1lxkjHw12Y6FTNkOF
	vVbffyC3YI3pdnleigWoUBLmGTiamxXnDEQOR2GSCbAg4UEyPfZjK3vnEUWxl0qGgwy4
	ehgqkLSdcpdfN5R2E37BUyMaOl2zOaxJ5o2hsLHkFb8lDCxnznXz0e8WNilDOEtshzaP
	USpw==
X-Gm-Message-State: APjAAAUmSL/sHItulfyo0zRME3DdavqHrXMRoTs83mvi267B1+z1pxvt
	ZmLY5tyy5V6q2XEOw7rRXcANtbvYNGewb2+ZgYM=
X-Google-Smtp-Source: APXvYqyWuicdWjSYrdwbNfOASE9IYWC1piJEt/TD6JTDV+oIPtAYhpYKPflLOMACFQAj+cZd9E/pCe+Bs4Q/VliOZwg=
X-Received: by 2002:a24:1796:: with SMTP id 144mr2990706ith.18.1559891036795; 
	Fri, 07 Jun 2019 00:03:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190606023822.17597-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190606023822.17597-1-zangrc.fnst@cn.fujitsu.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 7 Jun 2019 00:03:46 -0700
Message-ID: <CANx9H-A_2uUeT5fJ9Da6OsiCTjEA=+oc2zO_yCFgsjZm22QT7A@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-rfc3986: upgrade 0.4.1 -> 1.3.2
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
X-List-Received-Date: Fri, 07 Jun 2019 07:03:58 -0000
Content-Type: multipart/alternative; boundary="00000000000022f6f8058ab66f37"

--00000000000022f6f8058ab66f37
Content-Type: text/plain; charset="UTF-8"

Please consider providing a python3 version as well.

On Wed, Jun 5, 2019 at 7:37 PM Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
wrote:

> -Upgrade from python-rfc3986_0.4.1.bb to python-rfc3986_1.3.2.bb.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../{python-rfc3986_0.4.1.bb => python-rfc3986_1.3.2.bb}      | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-rfc3986_0.4.1.bb
> => python-rfc3986_1.3.2.bb} (72%)
>
> diff --git a/meta-openstack/recipes-devtools/python/
> python-rfc3986_0.4.1.bb b/meta-openstack/recipes-devtools/python/
> python-rfc3986_1.3.2.bb
> similarity index 72%
> rename from meta-openstack/recipes-devtools/python/python-rfc3986_0.4.1.bb
> rename to meta-openstack/recipes-devtools/python/python-rfc3986_1.3.2.bb
> index 0eaf181..e32f903 100644
> --- a/meta-openstack/recipes-devtools/python/python-rfc3986_0.4.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-rfc3986_1.3.2.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=03731a0e7dbcb30cecdcec77cc93ec29"
>
> -SRC_URI[md5sum] = "b2b48cd36dabb82d5eaa54bbfb20d382"
> -SRC_URI[sha256sum] =
> "5ac85eb132fae7bbd811fa48d11984ae3104be30d44d397a351d004c633a68d2"
> +SRC_URI[md5sum] = "5b6d009806a94d418c82d48219a256de"
> +SRC_URI[sha256sum] =
> "0344d0bd428126ce554e7ca2b61787b6a28d2bbd19fc70ed2dd85efe31176405"
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

--00000000000022f6f8058ab66f37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Please consider providing a python3 version as well.=
</div></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Wed, Jun 5, 2019 at 7:37 PM Zang Ruochen &lt;<a href=3D"mailt=
o:zangrc.fnst@cn.fujitsu.com">zangrc.fnst@cn.fujitsu.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">-Upgrade from <a href=3D"http://python=
-rfc3986_0.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python-rfc3986_0.4.=
1.bb</a> to <a href=3D"http://python-rfc3986_1.3.2.bb" rel=3D"noreferrer" t=
arget=3D"_blank">python-rfc3986_1.3.2.bb</a>.<br>
<br>
Signed-off-by: Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fujitsu.co=
m" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://python-rfc3986_0.4.1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">python-rfc3986_0.4.1.bb</a> =3D&gt; <a href=3D"http://pytho=
n-rfc3986_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python-rfc3986_1.3=
.2.bb</a>}=C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-rfc3986_0.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python-rfc3986_0.=
4.1.bb</a> =3D&gt; <a href=3D"http://python-rfc3986_1.3.2.bb" rel=3D"norefe=
rrer" target=3D"_blank">python-rfc3986_1.3.2.bb</a>} (72%)<br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-rfc3986_0.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python-rfc3986_0.4=
.1.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://python=
-rfc3986_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python-rfc3986_1.3.=
2.bb</a><br>
similarity index 72%<br>
rename from meta-openstack/recipes-devtools/python/<a href=3D"http://python=
-rfc3986_0.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python-rfc3986_0.4.=
1.bb</a><br>
rename to meta-openstack/recipes-devtools/python/<a href=3D"http://python-r=
fc3986_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python-rfc3986_1.3.2.=
bb</a><br>
index 0eaf181..e32f903 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-rfc39=
86_0.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python-rfc3986_0.4.1.bb</=
a><br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-rfc39=
86_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python-rfc3986_1.3.2.bb</=
a><br>
@@ -4,8 +4,8 @@ SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;Apache-2&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D03731a0e7dbcb30cecdce=
c77cc93ec29&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;b2b48cd36dabb82d5eaa54bbfb20d382&quot;<br>
-SRC_URI[sha256sum] =3D &quot;5ac85eb132fae7bbd811fa48d11984ae3104be30d44d3=
97a351d004c633a68d2&quot;<br>
+SRC_URI[md5sum] =3D &quot;5b6d009806a94d418c82d48219a256de&quot;<br>
+SRC_URI[sha256sum] =3D &quot;0344d0bd428126ce554e7ca2b61787b6a28d2bbd19fc7=
0ed2dd85efe31176405&quot;<br>
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

--00000000000022f6f8058ab66f37--
