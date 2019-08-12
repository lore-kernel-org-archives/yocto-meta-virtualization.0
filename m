Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7088DE009EA; Mon, 12 Aug 2019 08:04:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.208.194 listed in list.dnswl.org]
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
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7D485E00920
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 08:04:23 -0700 (PDT)
Received: by mail-lj1-f194.google.com with SMTP id z28so44388147ljn.4
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 08:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xbERSi732+jThZGI4INJA4EGyCzSS6VntWgJwvtcczM=;
	b=tJ90rRX500reKKYOcMv1yIrE/TfnPWa1DocgMogN3yNC7QNm7f/vlMw7K+oi+GJQ0F
	bOdJdoK8ItQEgPpktu8i8T8yb4qag5KJWWblf+74AuX9h8Q31lBDS3flGcn4yoBkYYbQ
	5sRcmQsHObRUm0HjzC5oqH+1OS/R8GP/ckQTluGD5bQ/7HBAKI8/vFxjo6nN7DhtU2dY
	daw63ziMB0BLOflGmdtzPztKAgAB4IQnqItTX/OC9ozjsMyxK9afZOcrixTNqouermNb
	/0ytcuVy9u4eZKYAYCiBlBO2cNC8aWK4IcTjPCcTpaKoLuS2WAV6U2XVifIp0Ejz0g/T
	p+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xbERSi732+jThZGI4INJA4EGyCzSS6VntWgJwvtcczM=;
	b=rY5DJEjaCkLY5gxXp1XrZ4hdY+FO+qD8ZvzxqqpLmoTeagOZXbggqAjKloAjQeHBqH
	3+nb0wUm6SC77dac1/ZS77CIA/1dRc0Tr41t10Uzh8BFoXTjbRo7QGjTYXoB87SrTRXs
	lsaha0JuPyKAGT0Xab/v9+E+LzMDxTOMjusuSSKij7UQQjdo/h/0YikN/vgNyRr91fY9
	XipwvWI/iRkC5cmcYomTAHuqkWNC7tJ2vB8GHcEpyGHqv4D1Z14RcdX6tHYF3aNcG1bR
	tUGYz3pWQ6h5FMWj/YaGG31oSI5SmT3mRl9PLW69q8jyUm8+hD4UcKDtyG+8ONL+IZm6
	uENw==
X-Gm-Message-State: APjAAAX8rs7XuzjulkH6J549sE7+IVCjlySLU2EWY9522ZrfNzh4obim
	LMlJYXmXvTCyOYojuN9zcP2DcgGtMtFxeYN1ybQ=
X-Google-Smtp-Source: APXvYqwoicBJU6h4C8DVb8GkrflW1DQ914ndgfZAFTeI9g4rRQNRad6FRdC8p5dNfZu9fu3HcNR2sP4/xOxNVN8Ju+4=
X-Received: by 2002:a2e:9115:: with SMTP id m21mr10873522ljg.232.1565622262421;
	Mon, 12 Aug 2019 08:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190809055333.25459-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190809055333.25459-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 12 Aug 2019 11:04:10 -0400
Message-ID: <CADkTA4ODCsvGQh_+aG60NThyif5xz9reZuAuKxM_uoXLq3Qf+g@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] lxc: upgrade 3.1.0 -> 3.2.1
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
X-List-Received-Date: Mon, 12 Aug 2019 15:04:24 -0000
Content-Type: multipart/alternative; boundary="000000000000cdddaa058fecd679"

--000000000000cdddaa058fecd679
Content-Type: text/plain; charset="UTF-8"

staged for testing. It is in master-next

Bruce

On Fri, Aug 9, 2019 at 1:54 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
wrote:

> From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
>
> Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> ---
>  recipes-containers/lxc/{lxc_3.1.0.bb => lxc_3.2.1.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename recipes-containers/lxc/{lxc_3.1.0.bb => lxc_3.2.1.bb} (97%)
>
> diff --git a/recipes-containers/lxc/lxc_3.1.0.bb b/recipes-containers/lxc/
> lxc_3.2.1.bb
> similarity index 97%
> rename from recipes-containers/lxc/lxc_3.1.0.bb
> rename to recipes-containers/lxc/lxc_3.2.1.bb
> index 977583f..585ab8f 100644
> --- a/recipes-containers/lxc/lxc_3.1.0.bb
> +++ b/recipes-containers/lxc/lxc_3.2.1.bb
> @@ -47,8 +47,8 @@ SRC_URI = "
> http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>         file://lxc-net \
>         "
>
> -SRC_URI[md5sum] = "e83e302a801494276f3772e687a3b8b0"
> -SRC_URI[sha256sum] =
> "4d8772c25baeaea2c37a954902b88c05d1454c91c887cb6a0997258cfac3fdc5"
> +SRC_URI[md5sum] = "4886c8d1c8e221fe526eefcb47857b85"
> +SRC_URI[sha256sum] =
> "5f903986a4b17d607eea28c0aa56bf1e76e8707747b1aa07d31680338b1cc3d4"
>
>  S = "${WORKDIR}/${BPN}-${PV}"
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

--000000000000cdddaa058fecd679
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">sta=
ged for testing. It is in master-next</div><div class=3D"gmail_default" sty=
le=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font=
-size:small">Bruce</div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Aug 9, 2019 at 1:54 AM Zang Ruochen &lt;<a =
href=3D"mailto:zangrc.fnst@cn.fujitsu.com">zangrc.fnst@cn.fujitsu.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: =
Yuan Chao &lt;<a href=3D"mailto:yuanc.fnst@cn.fujitsu.com" target=3D"_blank=
">yuanc.fnst@cn.fujitsu.com</a>&gt;<br>
<br>
Signed-off-by: Yuan Chao &lt;<a href=3D"mailto:yuanc.fnst@cn.fujitsu.com" t=
arget=3D"_blank">yuanc.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/lxc/{<a href=3D"http://lxc_3.1.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">lxc_3.1.0.bb</a> =3D&gt; <a href=3D"http://lxc_3.2.=
1.bb" rel=3D"noreferrer" target=3D"_blank">lxc_3.2.1.bb</a>} | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename recipes-containers/lxc/{<a href=3D"http://lxc_3.1.0.bb" rel=3D=
"noreferrer" target=3D"_blank">lxc_3.1.0.bb</a> =3D&gt; <a href=3D"http://l=
xc_3.2.1.bb" rel=3D"noreferrer" target=3D"_blank">lxc_3.2.1.bb</a>} (97%)<b=
r>
<br>
diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_3.1.0.bb" rel=3D"=
noreferrer" target=3D"_blank">lxc_3.1.0.bb</a> b/recipes-containers/lxc/<a =
href=3D"http://lxc_3.2.1.bb" rel=3D"noreferrer" target=3D"_blank">lxc_3.2.1=
.bb</a><br>
similarity index 97%<br>
rename from recipes-containers/lxc/<a href=3D"http://lxc_3.1.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">lxc_3.1.0.bb</a><br>
rename to recipes-containers/lxc/<a href=3D"http://lxc_3.2.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">lxc_3.2.1.bb</a><br>
index 977583f..585ab8f 100644<br>
--- a/recipes-containers/lxc/<a href=3D"http://lxc_3.1.0.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_3.1.0.bb</a><br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_3.2.1.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_3.2.1.bb</a><br>
@@ -47,8 +47,8 @@ SRC_URI =3D &quot;<a href=3D"http://linuxcontainers.org/d=
ownloads/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">=
http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc-net \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;e83e302a801494276f3772e687a3b8b0&quot;<br>
-SRC_URI[sha256sum] =3D &quot;4d8772c25baeaea2c37a954902b88c05d1454c91c887c=
b6a0997258cfac3fdc5&quot;<br>
+SRC_URI[md5sum] =3D &quot;4886c8d1c8e221fe526eefcb47857b85&quot;<br>
+SRC_URI[sha256sum] =3D &quot;5f903986a4b17d607eea28c0aa56bf1e76e8707747b1a=
a07d31680338b1cc3d4&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/${BPN}-${PV}&quot;<br>
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

--000000000000cdddaa058fecd679--
