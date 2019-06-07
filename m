Return-Path: <ticotimo@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1B996E00BAF; Thu,  6 Jun 2019 23:57:31 -0700 (PDT)
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
	*      [209.85.166.178 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-it1-f178.google.com (mail-it1-f178.google.com
	[209.85.166.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 941DDE008F2
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Jun 2019 23:57:30 -0700 (PDT)
Received: by mail-it1-f178.google.com with SMTP id m3so1200210itl.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Jun 2019 23:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Rce0LHT2hg+rEshIyCG3RBScD6BUgmfPkplD7Wa3KAk=;
	b=mXMKbOB15fXtqJviOXTAVcIOrBSJdgzghh0uDRuDQzsNNyfwthubqv3IFyzseOMUv1
	wVOTJXP0oCv7AxeEqdvX1bN6yfsVhLjddPGtH+mj02MzHpY+Bv3StHHLPowwgRjs+V/z
	7pSc2dU1aL/N2hrKtowicjr/+hoTl5kmtFjmrcpQ0UEQoZCDb6yWhCk14qRS1RFhey+E
	IsYozMOawdozPKXGR3b28usivknIL/oniyb7F6Jdz2ZsALPvtsuT8xTalYO2GdkzX/17
	UPByKtI1PlPk7NqNeDtJp5IGAa/2juAhd5wA7fUKOhKbVti0BWBhERhVTnbyixDGtge2
	f6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Rce0LHT2hg+rEshIyCG3RBScD6BUgmfPkplD7Wa3KAk=;
	b=oXVAHrFVE0sCn6PS7mw3chp0NK+zoynEb8vLtt53HkemPXEtmaihPf5d5z9OOvN9La
	IYXrPKZc3N5YfmqhvXOk3m59i6nJAWHMWSl/MYNqLvFaj6Lo3M4nctbvZyK9Zv7AoGxm
	uOmP3UH5P8OFZxgtZFNABFs+aLOgFsWeIpWKhRfGQr9xVajzMjHtknTg+vJklBxMcaVm
	XWUTA2Xv+r/SRrjVtccfG/WseNaLR2GsylvOwn+knIdibk+9ZwrnMJPk0b5KUrUd2tKi
	qFmhP+pCEgRjFWomvlSo0f8tC7d65d5RBvYfBHmDE9vj/Vxm9NYDYJCnjFkLU9TmZrDF
	Z+Aw==
X-Gm-Message-State: APjAAAXJxsW44uyaYgCLOT5AhN05v/uoZT7YFRar92eo+dCLNaGaDXPf
	DtCG1XZiBvDIarVu7EuWvBg10DHqI8lGAaOy/m0=
X-Google-Smtp-Source: APXvYqz3UiSTc0NP2vn6k227qwLesQE5X5aNK99Hp+Ctdsh7lF+4uZDJv898WaN+Hp9lgUNc97qWGLoogpFLm2McHZU=
X-Received: by 2002:a02:1146:: with SMTP id 67mr34612372jaf.10.1559890649902; 
	Thu, 06 Jun 2019 23:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190606030132.4145-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190606030132.4145-1-zangrc.fnst@cn.fujitsu.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 6 Jun 2019 23:57:18 -0700
Message-ID: <CANx9H-Adiq=TUuj5XFgUj0VpBL6jJjKXRfKfJq+H_pC8-jJ7OA@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-wsme: upgrade 0.9.2 -> 0.9.3
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
X-List-Received-Date: Fri, 07 Jun 2019 06:57:31 -0000
Content-Type: multipart/alternative; boundary="0000000000001376e0058ab658c8"

--0000000000001376e0058ab658c8
Content-Type: text/plain; charset="UTF-8"

Please consider providing a python3 version as well.

On Wed, Jun 5, 2019 at 8:00 PM Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
wrote:

> -Upgrade from python-wsme_0.9.2.bb to python-wsme_0.9.3.bb.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-wsme_0.9.2.bb => python-wsme_0.9.3.bb}     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-wsme_0.9.2.bb =>
> python-wsme_0.9.3.bb} (78%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-wsme_0.9.2.bb
> b/meta-openstack/recipes-devtools/python/python-wsme_0.9.3.bb
> similarity index 78%
> rename from meta-openstack/recipes-devtools/python/python-wsme_0.9.2.bb
> rename to meta-openstack/recipes-devtools/python/python-wsme_0.9.3.bb
> index 15f46d4..4e83299 100644
> --- a/meta-openstack/recipes-devtools/python/python-wsme_0.9.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-wsme_0.9.3.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=5a9126e7f56a0cf3247050de7f10d0f4"
>
>  PYPI_PACKAGE = "WSME"
>
> -SRC_URI[md5sum] = "f7ab1fecd5fa64f579d6ef3aabf38f60"
> -SRC_URI[sha256sum] =
> "e790ac755a7e36eaa796d3966d3878677896dbc7d1c2685cb85c06b744c21976"
> +SRC_URI[md5sum] = "e6cb3864bae872acaa0cd0c2efacc94f"
> +SRC_URI[sha256sum] =
> "e24fcff24392a0b176e560ffc6591b1f658342bbc992f84e0e8a3c53fd92580a"
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

--0000000000001376e0058ab658c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Please consider providing a python3 version as well.=
</div></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Wed, Jun 5, 2019 at 8:00 PM Zang Ruochen &lt;<a href=3D"mailt=
o:zangrc.fnst@cn.fujitsu.com">zangrc.fnst@cn.fujitsu.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">-Upgrade from <a href=3D"http://python=
-wsme_0.9.2.bb" rel=3D"noreferrer" target=3D"_blank">python-wsme_0.9.2.bb</=
a> to <a href=3D"http://python-wsme_0.9.3.bb" rel=3D"noreferrer" target=3D"=
_blank">python-wsme_0.9.3.bb</a>.<br>
<br>
Signed-off-by: Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fujitsu.co=
m" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../python/{<a href=3D"http://python-wsme_0.9.2.bb" rel=3D"noreferrer=
" target=3D"_blank">python-wsme_0.9.2.bb</a> =3D&gt; <a href=3D"http://pyth=
on-wsme_0.9.3.bb" rel=3D"noreferrer" target=3D"_blank">python-wsme_0.9.3.bb=
</a>}=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-openstack/recipes-devtools/python/{<a href=3D"http://pyth=
on-wsme_0.9.2.bb" rel=3D"noreferrer" target=3D"_blank">python-wsme_0.9.2.bb=
</a> =3D&gt; <a href=3D"http://python-wsme_0.9.3.bb" rel=3D"noreferrer" tar=
get=3D"_blank">python-wsme_0.9.3.bb</a>} (78%)<br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-wsme_0.9.2.bb" rel=3D"noreferrer" target=3D"_blank">python-wsme_0.9.2.bb<=
/a> b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-wsme_=
0.9.3.bb" rel=3D"noreferrer" target=3D"_blank">python-wsme_0.9.3.bb</a><br>
similarity index 78%<br>
rename from meta-openstack/recipes-devtools/python/<a href=3D"http://python=
-wsme_0.9.2.bb" rel=3D"noreferrer" target=3D"_blank">python-wsme_0.9.2.bb</=
a><br>
rename to meta-openstack/recipes-devtools/python/<a href=3D"http://python-w=
sme_0.9.3.bb" rel=3D"noreferrer" target=3D"_blank">python-wsme_0.9.3.bb</a>=
<br>
index 15f46d4..4e83299 100644<br>
--- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-wsme_=
0.9.2.bb" rel=3D"noreferrer" target=3D"_blank">python-wsme_0.9.2.bb</a><br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-wsme_=
0.9.3.bb" rel=3D"noreferrer" target=3D"_blank">python-wsme_0.9.3.bb</a><br>
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D5a9126e7f56=
a0cf3247050de7f10d0f4&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;WSME&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;f7ab1fecd5fa64f579d6ef3aabf38f60&quot;<br>
-SRC_URI[sha256sum] =3D &quot;e790ac755a7e36eaa796d3966d3878677896dbc7d1c26=
85cb85c06b744c21976&quot;<br>
+SRC_URI[md5sum] =3D &quot;e6cb3864bae872acaa0cd0c2efacc94f&quot;<br>
+SRC_URI[sha256sum] =3D &quot;e24fcff24392a0b176e560ffc6591b1f658342bbc992f=
84e0e8a3c53fd92580a&quot;<br>
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

--0000000000001376e0058ab658c8--
