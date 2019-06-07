Return-Path: <ticotimo@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D74E8E00CD2; Fri,  7 Jun 2019 00:04:49 -0700 (PDT)
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
	*      [209.85.166.66 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A12B8E00C6A
	for <meta-virtualization@yoctoproject.org>;
	Fri,  7 Jun 2019 00:04:47 -0700 (PDT)
Received: by mail-io1-f66.google.com with SMTP id w25so621209ioc.8
	for <meta-virtualization@yoctoproject.org>;
	Fri, 07 Jun 2019 00:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Fl8/452a+gqE79klmRi0MVWbM3D/8FMRoGcxSnxj5NA=;
	b=l10yh8iupAvP9L/24i2a9BjZr3R1L7Zm7ImZiMba9NGiPPyUr3Eyod2Svpq40LzVYW
	O5ei524liHlV3ULYnIBEEXCEh1wVF06+I6xKFP0en3fBNAje5G5YENflY9ovdN0i1cC2
	TIqmtYLnWTzcmF+7x8ZQC6gjXKcJ7d3dBzUkxC4VniU5evbBy/Uk1X9+D1bRG9T/QkFp
	uASjnkJI3MBgpr8pWcwmMSOjrc3sz3H+dTgkmovi+C0lo5/MfVtUnjKvhsd1uMvsLr6o
	N4kzFC7QVojIBafBHJrvlDXVND64g0kmmHwFqqki1P7IimlL1v+Pb0RVPDQrdrpKB/Wl
	lM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Fl8/452a+gqE79klmRi0MVWbM3D/8FMRoGcxSnxj5NA=;
	b=c+3bnSTosESClIaiHaZOcgKa5fhdHqkV+WLd7KpspNGfQ31M9Ze3p7j52m75A0WjsZ
	C/xlCJSjj+6MvBJ7mK+53fP0bfx3QQ7bQwMG7qynHllYf/5OnvqIBIQnxSIJLL3eEoOF
	gmo0815nIPaoth5W7QHTiZnDkDs0T/+OUkd8wi9PGjV8ZbxP+v+DLzG0JhJNYs9VIOb4
	FF/iZ/mvh1FMVwN+/HXrubp56jf3sNVpSEaSirrpLSbl0z6SaC66yS6+WdMY5ONtLLYq
	oACLC3OuNjiO0IbKpqxKeZQKUKFS7x5tzbbnVior7uU2Rj1aFuNKMWncGxHa29UQ7A9i
	mKtQ==
X-Gm-Message-State: APjAAAX7635ROMIULBATm6W0RZY/Lw3FBY2zhVDz4/F9UC3xTeEIoAZp
	zciepFR8g9KMKT7FkA6X56EH/L4GddDi59t5vRE=
X-Google-Smtp-Source: APXvYqwKo/gkFXYRGTKZEvUSreeREQbCPwIG7TKy5Iigdu/TlDLLJnhJyrt3WzoZCLHm1vA0sXVdBHYrFE/CTu8LH/A=
X-Received: by 2002:a05:6602:2181:: with SMTP id
	b1mr34443461iob.198.1559891087059; 
	Fri, 07 Jun 2019 00:04:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190606023127.16101-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190606023127.16101-1-zangrc.fnst@cn.fujitsu.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 7 Jun 2019 00:04:36 -0700
Message-ID: <CANx9H-Cw67HGxnK1nJpSfMrRMtD8OveOaq5moTYxmwdvgpNyPw@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-osprofiler: upgrade 1.5.0 -> 2.8.0
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
X-List-Received-Date: Fri, 07 Jun 2019 07:04:49 -0000
Content-Type: multipart/alternative; boundary="00000000000021ef11058ab6724e"

--00000000000021ef11058ab6724e
Content-Type: text/plain; charset="UTF-8"

Please consider providing a python3 version as well.

On Wed, Jun 5, 2019 at 7:30 PM Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
wrote:

> -Upgrade from python-osprofiler_1.5.0.bb to python-osprofiler_2.8.0.bb.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  ...{python-osprofiler_1.5.0.bb => python-osprofiler_2.8.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-osprofiler_1.5.0.bb
> => python-osprofiler_2.8.0.bb} (83%)
>
> diff --git a/meta-openstack/recipes-devtools/python/
> python-osprofiler_1.5.0.bb b/meta-openstack/recipes-devtools/python/
> python-osprofiler_2.8.0.bb
> similarity index 83%
> rename from meta-openstack/recipes-devtools/python/
> python-osprofiler_1.5.0.bb
> rename to meta-openstack/recipes-devtools/python/
> python-osprofiler_2.8.0.bb
> index efb38a0..c33c52b 100644
> --- a/meta-openstack/recipes-devtools/python/python-osprofiler_1.5.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-osprofiler_2.8.0.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=19cbd64715b51267a47bf3750cc6a8a5"
>
> -SRC_URI[md5sum] = "6762b5420fd95646a26c4eaca1af9e64"
> -SRC_URI[sha256sum] =
> "aee63cfd888e6049ea82535ce458ce4844b4ac893dcb18060eda24192505627e"
> +SRC_URI[md5sum] = "c48561c6c6d2112d5b06d5c4af581790"
> +SRC_URI[sha256sum] =
> "56f8717c1c30193706ea6f9959f5f289edee910f90ebd763db38cfbd9c1c90d4"
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

--00000000000021ef11058ab6724e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Please consider providing a python3 version as well.=
</div></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Wed, Jun 5, 2019 at 7:30 PM Zang Ruochen &lt;<a href=3D"mailt=
o:zangrc.fnst@cn.fujitsu.com">zangrc.fnst@cn.fujitsu.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">-Upgrade from <a href=3D"http://python=
-osprofiler_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osprofile=
r_1.5.0.bb</a> to <a href=3D"http://python-osprofiler_2.8.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">python-osprofiler_2.8.0.bb</a>.<br>
<br>
Signed-off-by: Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fujitsu.co=
m" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...{<a href=3D"http://python-osprofiler_1.5.0.bb" rel=3D"noreferrer" =
target=3D"_blank">python-osprofiler_1.5.0.bb</a> =3D&gt; <a href=3D"http://=
python-osprofiler_2.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osp=
rofiler_2.8.0.bb</a>} | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-osprofiler_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osprofi=
ler_1.5.0.bb</a> =3D&gt; <a href=3D"http://python-osprofiler_2.8.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python-osprofiler_2.8.0.bb</a>} (83%)<br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-osprofiler_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osprofil=
er_1.5.0.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://=
python-osprofiler_2.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osp=
rofiler_2.8.0.bb</a><br>
similarity index 83%<br>
rename from meta-openstack/recipes-devtools/python/<a href=3D"http://python=
-osprofiler_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osprofile=
r_1.5.0.bb</a><br>
rename to meta-openstack/recipes-devtools/python/<a href=3D"http://python-o=
sprofiler_2.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osprofiler_=
2.8.0.bb</a><br>
index efb38a0..c33c52b 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-ospro=
filer_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osprofiler_1.5.=
0.bb</a><br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-ospro=
filer_2.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python-osprofiler_2.8.=
0.bb</a><br>
@@ -4,8 +4,8 @@ SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D19cbd64715b51267a47bf=
3750cc6a8a5&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;6762b5420fd95646a26c4eaca1af9e64&quot;<br>
-SRC_URI[sha256sum] =3D &quot;aee63cfd888e6049ea82535ce458ce4844b4ac893dcb1=
8060eda24192505627e&quot;<br>
+SRC_URI[md5sum] =3D &quot;c48561c6c6d2112d5b06d5c4af581790&quot;<br>
+SRC_URI[sha256sum] =3D &quot;56f8717c1c30193706ea6f9959f5f289edee910f90ebd=
763db38cfbd9c1c90d4&quot;<br>
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

--00000000000021ef11058ab6724e--
