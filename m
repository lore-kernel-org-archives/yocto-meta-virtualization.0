Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 25F40E00D8B; Tue,  6 Aug 2019 20:12:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.208.176 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
	[209.85.208.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6F658E00798
	for <meta-virtualization@yoctoproject.org>;
	Tue,  6 Aug 2019 20:12:29 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id m8so50423981lji.7
	for <meta-virtualization@yoctoproject.org>;
	Tue, 06 Aug 2019 20:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=g08ZPLSc4Rq8YTpTqYRn6UxVp4glALGuD4H5UEKSHlk=;
	b=fU0FfpdR+rP+bvTHEWJOigWhiAPYM1XMt/kN9oAnjDDiVIWQSAJUuFa322vd9Ab8S/
	CR5rxgN3ntqMd7UpGda2DCMC0Ls/2F+21bU0pbIYirSO22Do1Sgm+J1tYLspLfdshVj5
	3lhuTM/FVWgwN13YpypbYnaccgV7a6XqqaX2wP1DgJ2bafYuUygI9RGpTY4nL3jpW299
	sk97HGJOJdfq6z634Jt0X2Iizv7hBKvL0k6eYlj6pxZ1FG0bW6AT8poVJcneOHqDoXmC
	GBT31CPtj9kQSgKr3E0Chyn3bcYl4YLRkdev50oApA7XgdrgGX3x2wxvqePKw/IMFsP1
	OHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=g08ZPLSc4Rq8YTpTqYRn6UxVp4glALGuD4H5UEKSHlk=;
	b=bBoTBn1Caqd2ipw5YqnL93momTO227xrph/I1IsSePfItdrJQB/J3E4GfopE72w7Oo
	Y3IA/ZNB63BQ8WhwDKu3ZnvwE2iWw+8pe/4LmdL7mb37qNPWMvZ4gmz41btAkDKYLqWt
	WRsQXarZx8PXhqaT4PgyjvApjqrCCqx5MwKndbwvkdMZTC/qyQhxRQ4vdJhpt6vmrErX
	JMlmio5Xo6NWoqPdTPVI17XjbAcQMJmn2PYnljhOu8+jL6DKDukvXVO4f7WV8d31a4kF
	gSnC5BcVsqvcAhTcasoQuIMIIv90OW57zAcfCxWUFvupjLJ7niIsLHfWcf6jJdpT6WA9
	Hh7A==
X-Gm-Message-State: APjAAAWbQIg3kjeD0DaFYUDdTBdFusA8jGUbBbDBHc6RseHC+ss+JvBn
	KNuLnwqGwL6UErYConCJ8xsHjJ3ktzes+DezZ/Lphg==
X-Google-Smtp-Source: APXvYqyUHnR7DeIh965u3d55FqR0NafV9LZHHEAyO0ij6PeW+WXfFxAIO4X+8BGBFp+n/cgM/rfjz6L7bLVrCsI8yks=
X-Received: by 2002:a2e:98f:: with SMTP id 137mr3288599ljj.232.1565147548161; 
	Tue, 06 Aug 2019 20:12:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190806015700.8434-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190806015700.8434-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 7 Aug 2019 00:12:17 -0300
Message-ID: <CADkTA4Px0fT=4+m2vwEao67FseOyxM9BgHg8OhDGTJdaim7pdQ@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-cliff: upgrade 2.14.1 -> 2.15.0
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
X-List-Received-Date: Wed, 07 Aug 2019 03:12:30 -0000
Content-Type: multipart/alternative; boundary="000000000000a11d3d058f7e4f42"

--000000000000a11d3d058f7e4f42
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Aug 5, 2019 at 10:57 PM Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
wrote:

> From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
>
> Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-cliff_2.14.1.bb => python-cliff_2.15.0.bb}         |
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-cliff_2.14.1.bb =>
> python-cliff_2.15.0.bb} (82%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-cliff_2.14.1.bb
> b/meta-openstack/recipes-devtools/python/python-cliff_2.15.0.bb
> similarity index 82%
> rename from meta-openstack/recipes-devtools/python/python-cliff_2.14.1.bb
> rename to meta-openstack/recipes-devtools/python/python-cliff_2.15.0.bb
> index 70ac4e6..cfcd424 100644
> --- a/meta-openstack/recipes-devtools/python/python-cliff_2.14.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-cliff_2.15.0.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
> -SRC_URI[md5sum] = "4c5d43d98970c79b091e25676cce2b10"
> -SRC_URI[sha256sum] =
> "b47387a344898ccb28ca7f386f017ade9eb66dc1713e5c642a0bc09ec606cc67"
> +SRC_URI[md5sum] = "f51df6220d4a57c2b84d4b5a9e59e711"
> +SRC_URI[sha256sum] =
> "fe044273539250a99a5b9915843902e40e4e9b32ac5698c1fae89e31200d649f"
>
>  inherit setuptools pypi
>
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000a11d3d058f7e4f42
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Au=
g 5, 2019 at 10:57 PM Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fuj=
itsu.com">zangrc.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">From: Yuan Chao &lt;<a href=3D"mailto:y=
uanc.fnst@cn.fujitsu.com" target=3D"_blank">yuanc.fnst@cn.fujitsu.com</a>&g=
t;<br>
<br>
Signed-off-by: Yuan Chao &lt;<a href=3D"mailto:yuanc.fnst@cn.fujitsu.com" t=
arget=3D"_blank">yuanc.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../python/{<a href=3D"http://python-cliff_2.14.1.bb" rel=3D"noreferr=
er" target=3D"_blank">python-cliff_2.14.1.bb</a> =3D&gt; <a href=3D"http://=
python-cliff_2.15.0.bb" rel=3D"noreferrer" target=3D"_blank">python-cliff_2=
.15.0.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-cliff_2.14.1.bb" rel=3D"noreferrer" target=3D"_blank">python-cliff_2.14.=
1.bb</a> =3D&gt; <a href=3D"http://python-cliff_2.15.0.bb" rel=3D"noreferre=
r" target=3D"_blank">python-cliff_2.15.0.bb</a>} (82%)<br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-cliff_2.14.1.bb" rel=3D"noreferrer" target=3D"_blank">python-cliff_2.14.1=
.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-c=
liff_2.15.0.bb" rel=3D"noreferrer" target=3D"_blank">python-cliff_2.15.0.bb=
</a><br>
similarity index 82%<br>
rename from meta-openstack/recipes-devtools/python/<a href=3D"http://python=
-cliff_2.14.1.bb" rel=3D"noreferrer" target=3D"_blank">python-cliff_2.14.1.=
bb</a><br>
rename to meta-openstack/recipes-devtools/python/<a href=3D"http://python-c=
liff_2.15.0.bb" rel=3D"noreferrer" target=3D"_blank">python-cliff_2.15.0.bb=
</a><br>
index 70ac4e6..cfcd424 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-cliff=
_2.14.1.bb" rel=3D"noreferrer" target=3D"_blank">python-cliff_2.14.1.bb</a>=
<br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-cliff=
_2.15.0.bb" rel=3D"noreferrer" target=3D"_blank">python-cliff_2.15.0.bb</a>=
<br>
@@ -4,8 +4,8 @@ SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D3b83ef96387f14655fc85=
4ddc3c6bd57&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;4c5d43d98970c79b091e25676cce2b10&quot;<br>
-SRC_URI[sha256sum] =3D &quot;b47387a344898ccb28ca7f386f017ade9eb66dc1713e5=
c642a0bc09ec606cc67&quot;<br>
+SRC_URI[md5sum] =3D &quot;f51df6220d4a57c2b84d4b5a9e59e711&quot;<br>
+SRC_URI[sha256sum] =3D &quot;fe044273539250a99a5b9915843902e40e4e9b32ac569=
8c1fae89e31200d649f&quot;<br>
<br>
=C2=A0inherit setuptools pypi<br>
<br>
-- <br>
2.7.4<br>
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
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div>

--000000000000a11d3d058f7e4f42--
